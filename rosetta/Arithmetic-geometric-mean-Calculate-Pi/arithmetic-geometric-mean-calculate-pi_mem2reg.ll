; ModuleID = 'arithmetic-geometric-mean-calculate-pi.ll'
source_filename = "arithmetic-geometric-mean-calculate-pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpf_struct = type { i32, i32, i64, i64* }

@.str = private unnamed_addr constant [12 x i8] c"%.100000Ff\0A\00", align 1

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
  %Z = alloca [1 x %struct.__mpf_struct], align 16
  %var = alloca [1 x %struct.__mpf_struct], align 16
  call void @__gmpf_set_default_prec(i64 300000), !dbg !40
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %x0, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %y0, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %resA, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %resB, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %Z, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %var, metadata !55, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !57
  call void @__gmpf_init_set_ui(%struct.__mpf_struct* %arraydecay, i64 1), !dbg !58
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !59
  call void @__gmpf_init_set_d(%struct.__mpf_struct* %arraydecay1, double 5.000000e-01), !dbg !60
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !61
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !62
  call void @__gmpf_sqrt(%struct.__mpf_struct* %arraydecay2, %struct.__mpf_struct* %arraydecay3), !dbg !63
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !64
  call void @__gmpf_init(%struct.__mpf_struct* %arraydecay4), !dbg !65
  %arraydecay5 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !66
  call void @__gmpf_init(%struct.__mpf_struct* %arraydecay5), !dbg !67
  %arraydecay6 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !68
  call void @__gmpf_init_set_d(%struct.__mpf_struct* %arraydecay6, double 2.500000e-01), !dbg !69
  %arraydecay7 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !70
  call void @__gmpf_init(%struct.__mpf_struct* %arraydecay7), !dbg !71
  call void @llvm.dbg.value(metadata i32 1, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 0, metadata !74, metadata !DIExpression()), !dbg !73
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %entry
  %n.0 = phi i32 [ 1, %entry ], [ %add39, %for.inc ], !dbg !73
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !77
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !74, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !72, metadata !DIExpression()), !dbg !73
  %cmp = icmp slt i32 %i.0, 8, !dbg !78
  br i1 %cmp, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %arraydecay8 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !81
  %arraydecay9 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !83
  %arraydecay10 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !84
  %arraydecay11 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !85
  call void @agm(%struct.__mpf_struct* %arraydecay8, %struct.__mpf_struct* %arraydecay9, %struct.__mpf_struct* %arraydecay10, %struct.__mpf_struct* %arraydecay11), !dbg !86
  %arraydecay12 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !87
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !88
  %arraydecay14 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !89
  call void @__gmpf_sub(%struct.__mpf_struct* %arraydecay12, %struct.__mpf_struct* %arraydecay13, %struct.__mpf_struct* %arraydecay14), !dbg !90
  %arraydecay15 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !91
  %arraydecay16 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !92
  %arraydecay17 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !93
  call void @__gmpf_mul(%struct.__mpf_struct* %arraydecay15, %struct.__mpf_struct* %arraydecay16, %struct.__mpf_struct* %arraydecay17), !dbg !94
  %arraydecay18 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !95
  %arraydecay19 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !96
  %conv = sext i32 %n.0 to i64, !dbg !97
  call void @__gmpf_mul_ui(%struct.__mpf_struct* %arraydecay18, %struct.__mpf_struct* %arraydecay19, i64 %conv), !dbg !98
  %arraydecay20 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !99
  %arraydecay21 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !100
  %arraydecay22 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !101
  call void @__gmpf_sub(%struct.__mpf_struct* %arraydecay20, %struct.__mpf_struct* %arraydecay21, %struct.__mpf_struct* %arraydecay22), !dbg !102
  %add = add nsw i32 %n.0, %n.0, !dbg !103
  call void @llvm.dbg.value(metadata i32 %add, metadata !72, metadata !DIExpression()), !dbg !73
  %arraydecay23 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !104
  %arraydecay24 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !105
  %arraydecay25 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !106
  %arraydecay26 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !107
  call void @agm(%struct.__mpf_struct* %arraydecay23, %struct.__mpf_struct* %arraydecay24, %struct.__mpf_struct* %arraydecay25, %struct.__mpf_struct* %arraydecay26), !dbg !108
  %arraydecay27 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !109
  %arraydecay28 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !110
  %arraydecay29 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !111
  call void @__gmpf_sub(%struct.__mpf_struct* %arraydecay27, %struct.__mpf_struct* %arraydecay28, %struct.__mpf_struct* %arraydecay29), !dbg !112
  %arraydecay30 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !113
  %arraydecay31 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !114
  %arraydecay32 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !115
  call void @__gmpf_mul(%struct.__mpf_struct* %arraydecay30, %struct.__mpf_struct* %arraydecay31, %struct.__mpf_struct* %arraydecay32), !dbg !116
  %arraydecay33 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !117
  %arraydecay34 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !118
  %conv35 = sext i32 %add to i64, !dbg !119
  call void @__gmpf_mul_ui(%struct.__mpf_struct* %arraydecay33, %struct.__mpf_struct* %arraydecay34, i64 %conv35), !dbg !120
  %arraydecay36 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !121
  %arraydecay37 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !122
  %arraydecay38 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !123
  call void @__gmpf_sub(%struct.__mpf_struct* %arraydecay36, %struct.__mpf_struct* %arraydecay37, %struct.__mpf_struct* %arraydecay38), !dbg !124
  %add39 = add nsw i32 %add, %add, !dbg !125
  call void @llvm.dbg.value(metadata i32 %add39, metadata !72, metadata !DIExpression()), !dbg !73
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !127
  call void @llvm.dbg.value(metadata i32 %inc, metadata !74, metadata !DIExpression()), !dbg !73
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %arraydecay40 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !131
  %arraydecay41 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !132
  %arraydecay42 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !133
  call void @__gmpf_mul(%struct.__mpf_struct* %arraydecay40, %struct.__mpf_struct* %arraydecay41, %struct.__mpf_struct* %arraydecay42), !dbg !134
  %arraydecay43 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !135
  %arraydecay44 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !136
  %arraydecay45 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !137
  call void @__gmpf_div(%struct.__mpf_struct* %arraydecay43, %struct.__mpf_struct* %arraydecay44, %struct.__mpf_struct* %arraydecay45), !dbg !138
  %arraydecay46 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !139
  %call = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), %struct.__mpf_struct* %arraydecay46), !dbg !140
  ret i32 0, !dbg !141
}

declare dso_local void @__gmpf_set_default_prec(i64) #2

declare dso_local void @__gmpf_init_set_ui(%struct.__mpf_struct*, i64) #2

declare dso_local void @__gmpf_init_set_d(%struct.__mpf_struct*, double) #2

declare dso_local void @__gmpf_init(%struct.__mpf_struct*) #2

declare dso_local void @__gmpf_sub(%struct.__mpf_struct*, %struct.__mpf_struct*, %struct.__mpf_struct*) #2

declare dso_local void @__gmpf_mul_ui(%struct.__mpf_struct*, %struct.__mpf_struct*, i64) #2

declare dso_local void @__gmpf_div(%struct.__mpf_struct*, %struct.__mpf_struct*, %struct.__mpf_struct*) #2

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
!1 = !DIFile(filename: "arithmetic-geometric-mean-calculate-pi.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arithmetic-geometric-mean-Calculate-Pi")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "agm", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!27 = !DILocalVariable(name: "in1", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!28 = !DILocation(line: 0, scope: !7)
!29 = !DILocalVariable(name: "in2", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!30 = !DILocalVariable(name: "out1", arg: 3, scope: !7, file: !1, line: 3, type: !26)
!31 = !DILocalVariable(name: "out2", arg: 4, scope: !7, file: !1, line: 3, type: !26)
!32 = !DILocation(line: 4, column: 2, scope: !7)
!33 = !DILocation(line: 5, column: 2, scope: !7)
!34 = !DILocation(line: 6, column: 2, scope: !7)
!35 = !DILocation(line: 7, column: 2, scope: !7)
!36 = !DILocation(line: 8, column: 1, scope: !7)
!37 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 10, type: !38, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!17}
!40 = !DILocation(line: 11, column: 2, scope: !37)
!41 = !DILocalVariable(name: "x0", scope: !37, file: !1, line: 12, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpf_t", file: !13, line: 202, baseType: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 1)
!46 = !DILocation(line: 12, column: 8, scope: !37)
!47 = !DILocalVariable(name: "y0", scope: !37, file: !1, line: 12, type: !42)
!48 = !DILocation(line: 12, column: 12, scope: !37)
!49 = !DILocalVariable(name: "resA", scope: !37, file: !1, line: 12, type: !42)
!50 = !DILocation(line: 12, column: 16, scope: !37)
!51 = !DILocalVariable(name: "resB", scope: !37, file: !1, line: 12, type: !42)
!52 = !DILocation(line: 12, column: 22, scope: !37)
!53 = !DILocalVariable(name: "Z", scope: !37, file: !1, line: 12, type: !42)
!54 = !DILocation(line: 12, column: 28, scope: !37)
!55 = !DILocalVariable(name: "var", scope: !37, file: !1, line: 12, type: !42)
!56 = !DILocation(line: 12, column: 31, scope: !37)
!57 = !DILocation(line: 14, column: 19, scope: !37)
!58 = !DILocation(line: 14, column: 2, scope: !37)
!59 = !DILocation(line: 15, column: 18, scope: !37)
!60 = !DILocation(line: 15, column: 2, scope: !37)
!61 = !DILocation(line: 16, column: 12, scope: !37)
!62 = !DILocation(line: 16, column: 16, scope: !37)
!63 = !DILocation(line: 16, column: 2, scope: !37)
!64 = !DILocation(line: 17, column: 12, scope: !37)
!65 = !DILocation(line: 17, column: 2, scope: !37)
!66 = !DILocation(line: 18, column: 12, scope: !37)
!67 = !DILocation(line: 18, column: 2, scope: !37)
!68 = !DILocation(line: 19, column: 18, scope: !37)
!69 = !DILocation(line: 19, column: 2, scope: !37)
!70 = !DILocation(line: 20, column: 12, scope: !37)
!71 = !DILocation(line: 20, column: 2, scope: !37)
!72 = !DILocalVariable(name: "n", scope: !37, file: !1, line: 22, type: !17)
!73 = !DILocation(line: 0, scope: !37)
!74 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 23, type: !17)
!75 = !DILocation(line: 24, column: 6, scope: !76)
!76 = distinct !DILexicalBlock(scope: !37, file: !1, line: 24, column: 2)
!77 = !DILocation(line: 0, scope: !76)
!78 = !DILocation(line: 24, column: 12, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !1, line: 24, column: 2)
!80 = !DILocation(line: 24, column: 2, scope: !76)
!81 = !DILocation(line: 25, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !1, line: 24, column: 20)
!83 = !DILocation(line: 25, column: 11, scope: !82)
!84 = !DILocation(line: 25, column: 15, scope: !82)
!85 = !DILocation(line: 25, column: 21, scope: !82)
!86 = !DILocation(line: 25, column: 3, scope: !82)
!87 = !DILocation(line: 26, column: 11, scope: !82)
!88 = !DILocation(line: 26, column: 16, scope: !82)
!89 = !DILocation(line: 26, column: 22, scope: !82)
!90 = !DILocation(line: 26, column: 3, scope: !82)
!91 = !DILocation(line: 27, column: 11, scope: !82)
!92 = !DILocation(line: 27, column: 16, scope: !82)
!93 = !DILocation(line: 27, column: 21, scope: !82)
!94 = !DILocation(line: 27, column: 3, scope: !82)
!95 = !DILocation(line: 28, column: 14, scope: !82)
!96 = !DILocation(line: 28, column: 19, scope: !82)
!97 = !DILocation(line: 28, column: 24, scope: !82)
!98 = !DILocation(line: 28, column: 3, scope: !82)
!99 = !DILocation(line: 29, column: 11, scope: !82)
!100 = !DILocation(line: 29, column: 14, scope: !82)
!101 = !DILocation(line: 29, column: 17, scope: !82)
!102 = !DILocation(line: 29, column: 3, scope: !82)
!103 = !DILocation(line: 30, column: 5, scope: !82)
!104 = !DILocation(line: 31, column: 7, scope: !82)
!105 = !DILocation(line: 31, column: 13, scope: !82)
!106 = !DILocation(line: 31, column: 19, scope: !82)
!107 = !DILocation(line: 31, column: 23, scope: !82)
!108 = !DILocation(line: 31, column: 3, scope: !82)
!109 = !DILocation(line: 32, column: 11, scope: !82)
!110 = !DILocation(line: 32, column: 16, scope: !82)
!111 = !DILocation(line: 32, column: 20, scope: !82)
!112 = !DILocation(line: 32, column: 3, scope: !82)
!113 = !DILocation(line: 33, column: 11, scope: !82)
!114 = !DILocation(line: 33, column: 16, scope: !82)
!115 = !DILocation(line: 33, column: 21, scope: !82)
!116 = !DILocation(line: 33, column: 3, scope: !82)
!117 = !DILocation(line: 34, column: 14, scope: !82)
!118 = !DILocation(line: 34, column: 19, scope: !82)
!119 = !DILocation(line: 34, column: 24, scope: !82)
!120 = !DILocation(line: 34, column: 3, scope: !82)
!121 = !DILocation(line: 35, column: 11, scope: !82)
!122 = !DILocation(line: 35, column: 14, scope: !82)
!123 = !DILocation(line: 35, column: 17, scope: !82)
!124 = !DILocation(line: 35, column: 3, scope: !82)
!125 = !DILocation(line: 36, column: 5, scope: !82)
!126 = !DILocation(line: 37, column: 2, scope: !82)
!127 = !DILocation(line: 24, column: 17, scope: !79)
!128 = !DILocation(line: 24, column: 2, scope: !79)
!129 = distinct !{!129, !80, !130}
!130 = !DILocation(line: 37, column: 2, scope: !76)
!131 = !DILocation(line: 38, column: 10, scope: !37)
!132 = !DILocation(line: 38, column: 14, scope: !37)
!133 = !DILocation(line: 38, column: 18, scope: !37)
!134 = !DILocation(line: 38, column: 2, scope: !37)
!135 = !DILocation(line: 39, column: 10, scope: !37)
!136 = !DILocation(line: 39, column: 14, scope: !37)
!137 = !DILocation(line: 39, column: 18, scope: !37)
!138 = !DILocation(line: 39, column: 2, scope: !37)
!139 = !DILocation(line: 40, column: 30, scope: !37)
!140 = !DILocation(line: 40, column: 2, scope: !37)
!141 = !DILocation(line: 41, column: 2, scope: !37)
