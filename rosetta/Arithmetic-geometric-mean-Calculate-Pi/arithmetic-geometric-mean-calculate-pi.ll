; ModuleID = 'arithmetic-geometric-mean-calculate-pi.c'
source_filename = "arithmetic-geometric-mean-calculate-pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpf_struct = type { i32, i32, i64, i64* }

@.str = private unnamed_addr constant [12 x i8] c"%.100000Ff\0A\00", align 1

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
  %Z = alloca [1 x %struct.__mpf_struct], align 16
  %var = alloca [1 x %struct.__mpf_struct], align 16
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @__gmpf_set_default_prec(i64 300000), !dbg !53
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %x0, metadata !54, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %y0, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %resA, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %resB, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %Z, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %var, metadata !68, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !70
  call void @__gmpf_init_set_ui(%struct.__mpf_struct* %arraydecay, i64 1), !dbg !71
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !72
  call void @__gmpf_init_set_d(%struct.__mpf_struct* %arraydecay1, double 5.000000e-01), !dbg !73
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !74
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !75
  call void @__gmpf_sqrt(%struct.__mpf_struct* %arraydecay2, %struct.__mpf_struct* %arraydecay3), !dbg !76
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !77
  call void @__gmpf_init(%struct.__mpf_struct* %arraydecay4), !dbg !78
  %arraydecay5 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !79
  call void @__gmpf_init(%struct.__mpf_struct* %arraydecay5), !dbg !80
  %arraydecay6 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !81
  call void @__gmpf_init_set_d(%struct.__mpf_struct* %arraydecay6, double 2.500000e-01), !dbg !82
  %arraydecay7 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !83
  call void @__gmpf_init(%struct.__mpf_struct* %arraydecay7), !dbg !84
  call void @llvm.dbg.declare(metadata i32* %n, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 1, i32* %n, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %i, metadata !87, metadata !DIExpression()), !dbg !88
  store i32 0, i32* %i, align 4, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !92
  %cmp = icmp slt i32 %0, 8, !dbg !94
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %arraydecay8 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !96
  %arraydecay9 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !98
  %arraydecay10 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !99
  %arraydecay11 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !100
  call void @agm(%struct.__mpf_struct* %arraydecay8, %struct.__mpf_struct* %arraydecay9, %struct.__mpf_struct* %arraydecay10, %struct.__mpf_struct* %arraydecay11), !dbg !101
  %arraydecay12 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !102
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !103
  %arraydecay14 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !104
  call void @__gmpf_sub(%struct.__mpf_struct* %arraydecay12, %struct.__mpf_struct* %arraydecay13, %struct.__mpf_struct* %arraydecay14), !dbg !105
  %arraydecay15 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !106
  %arraydecay16 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !107
  %arraydecay17 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !108
  call void @__gmpf_mul(%struct.__mpf_struct* %arraydecay15, %struct.__mpf_struct* %arraydecay16, %struct.__mpf_struct* %arraydecay17), !dbg !109
  %arraydecay18 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !110
  %arraydecay19 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !111
  %1 = load i32, i32* %n, align 4, !dbg !112
  %conv = sext i32 %1 to i64, !dbg !112
  call void @__gmpf_mul_ui(%struct.__mpf_struct* %arraydecay18, %struct.__mpf_struct* %arraydecay19, i64 %conv), !dbg !113
  %arraydecay20 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !114
  %arraydecay21 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !115
  %arraydecay22 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !116
  call void @__gmpf_sub(%struct.__mpf_struct* %arraydecay20, %struct.__mpf_struct* %arraydecay21, %struct.__mpf_struct* %arraydecay22), !dbg !117
  %2 = load i32, i32* %n, align 4, !dbg !118
  %3 = load i32, i32* %n, align 4, !dbg !119
  %add = add nsw i32 %3, %2, !dbg !119
  store i32 %add, i32* %n, align 4, !dbg !119
  %arraydecay23 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !120
  %arraydecay24 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !121
  %arraydecay25 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !122
  %arraydecay26 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !123
  call void @agm(%struct.__mpf_struct* %arraydecay23, %struct.__mpf_struct* %arraydecay24, %struct.__mpf_struct* %arraydecay25, %struct.__mpf_struct* %arraydecay26), !dbg !124
  %arraydecay27 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !125
  %arraydecay28 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !126
  %arraydecay29 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !127
  call void @__gmpf_sub(%struct.__mpf_struct* %arraydecay27, %struct.__mpf_struct* %arraydecay28, %struct.__mpf_struct* %arraydecay29), !dbg !128
  %arraydecay30 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !129
  %arraydecay31 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !130
  %arraydecay32 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !131
  call void @__gmpf_mul(%struct.__mpf_struct* %arraydecay30, %struct.__mpf_struct* %arraydecay31, %struct.__mpf_struct* %arraydecay32), !dbg !132
  %arraydecay33 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !133
  %arraydecay34 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !134
  %4 = load i32, i32* %n, align 4, !dbg !135
  %conv35 = sext i32 %4 to i64, !dbg !135
  call void @__gmpf_mul_ui(%struct.__mpf_struct* %arraydecay33, %struct.__mpf_struct* %arraydecay34, i64 %conv35), !dbg !136
  %arraydecay36 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !137
  %arraydecay37 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !138
  %arraydecay38 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %var, i64 0, i64 0, !dbg !139
  call void @__gmpf_sub(%struct.__mpf_struct* %arraydecay36, %struct.__mpf_struct* %arraydecay37, %struct.__mpf_struct* %arraydecay38), !dbg !140
  %5 = load i32, i32* %n, align 4, !dbg !141
  %6 = load i32, i32* %n, align 4, !dbg !142
  %add39 = add nsw i32 %6, %5, !dbg !142
  store i32 %add39, i32* %n, align 4, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !144
  %inc = add nsw i32 %7, 1, !dbg !144
  store i32 %inc, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %arraydecay40 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !148
  %arraydecay41 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !149
  %arraydecay42 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !150
  call void @__gmpf_mul(%struct.__mpf_struct* %arraydecay40, %struct.__mpf_struct* %arraydecay41, %struct.__mpf_struct* %arraydecay42), !dbg !151
  %arraydecay43 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !152
  %arraydecay44 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !153
  %arraydecay45 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %Z, i64 0, i64 0, !dbg !154
  call void @__gmpf_div(%struct.__mpf_struct* %arraydecay43, %struct.__mpf_struct* %arraydecay44, %struct.__mpf_struct* %arraydecay45), !dbg !155
  %arraydecay46 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !156
  %call = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), %struct.__mpf_struct* %arraydecay46), !dbg !157
  ret i32 0, !dbg !158
}

declare dso_local void @__gmpf_set_default_prec(i64) #2

declare dso_local void @__gmpf_init_set_ui(%struct.__mpf_struct*, i64) #2

declare dso_local void @__gmpf_init_set_d(%struct.__mpf_struct*, double) #2

declare dso_local void @__gmpf_init(%struct.__mpf_struct*) #2

declare dso_local void @__gmpf_sub(%struct.__mpf_struct*, %struct.__mpf_struct*, %struct.__mpf_struct*) #2

declare dso_local void @__gmpf_mul_ui(%struct.__mpf_struct*, %struct.__mpf_struct*, i64) #2

declare dso_local void @__gmpf_div(%struct.__mpf_struct*, %struct.__mpf_struct*, %struct.__mpf_struct*) #2

declare dso_local i32 @__gmp_printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "arithmetic-geometric-mean-calculate-pi.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arithmetic-geometric-mean-Calculate-Pi")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!28 = !DILocation(line: 3, column: 23, scope: !7)
!29 = !DILocalVariable(name: "in2", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!30 = !DILocation(line: 3, column: 40, scope: !7)
!31 = !DILocalVariable(name: "out1", arg: 3, scope: !7, file: !1, line: 3, type: !26)
!32 = !DILocation(line: 3, column: 51, scope: !7)
!33 = !DILocalVariable(name: "out2", arg: 4, scope: !7, file: !1, line: 3, type: !26)
!34 = !DILocation(line: 3, column: 63, scope: !7)
!35 = !DILocation(line: 4, column: 11, scope: !7)
!36 = !DILocation(line: 4, column: 17, scope: !7)
!37 = !DILocation(line: 4, column: 22, scope: !7)
!38 = !DILocation(line: 4, column: 2, scope: !7)
!39 = !DILocation(line: 5, column: 14, scope: !7)
!40 = !DILocation(line: 5, column: 20, scope: !7)
!41 = !DILocation(line: 5, column: 2, scope: !7)
!42 = !DILocation(line: 6, column: 11, scope: !7)
!43 = !DILocation(line: 6, column: 17, scope: !7)
!44 = !DILocation(line: 6, column: 22, scope: !7)
!45 = !DILocation(line: 6, column: 2, scope: !7)
!46 = !DILocation(line: 7, column: 12, scope: !7)
!47 = !DILocation(line: 7, column: 18, scope: !7)
!48 = !DILocation(line: 7, column: 2, scope: !7)
!49 = !DILocation(line: 8, column: 1, scope: !7)
!50 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 10, type: !51, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!17}
!53 = !DILocation(line: 11, column: 2, scope: !50)
!54 = !DILocalVariable(name: "x0", scope: !50, file: !1, line: 12, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpf_t", file: !13, line: 202, baseType: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 1)
!59 = !DILocation(line: 12, column: 8, scope: !50)
!60 = !DILocalVariable(name: "y0", scope: !50, file: !1, line: 12, type: !55)
!61 = !DILocation(line: 12, column: 12, scope: !50)
!62 = !DILocalVariable(name: "resA", scope: !50, file: !1, line: 12, type: !55)
!63 = !DILocation(line: 12, column: 16, scope: !50)
!64 = !DILocalVariable(name: "resB", scope: !50, file: !1, line: 12, type: !55)
!65 = !DILocation(line: 12, column: 22, scope: !50)
!66 = !DILocalVariable(name: "Z", scope: !50, file: !1, line: 12, type: !55)
!67 = !DILocation(line: 12, column: 28, scope: !50)
!68 = !DILocalVariable(name: "var", scope: !50, file: !1, line: 12, type: !55)
!69 = !DILocation(line: 12, column: 31, scope: !50)
!70 = !DILocation(line: 14, column: 19, scope: !50)
!71 = !DILocation(line: 14, column: 2, scope: !50)
!72 = !DILocation(line: 15, column: 18, scope: !50)
!73 = !DILocation(line: 15, column: 2, scope: !50)
!74 = !DILocation(line: 16, column: 12, scope: !50)
!75 = !DILocation(line: 16, column: 16, scope: !50)
!76 = !DILocation(line: 16, column: 2, scope: !50)
!77 = !DILocation(line: 17, column: 12, scope: !50)
!78 = !DILocation(line: 17, column: 2, scope: !50)
!79 = !DILocation(line: 18, column: 12, scope: !50)
!80 = !DILocation(line: 18, column: 2, scope: !50)
!81 = !DILocation(line: 19, column: 18, scope: !50)
!82 = !DILocation(line: 19, column: 2, scope: !50)
!83 = !DILocation(line: 20, column: 12, scope: !50)
!84 = !DILocation(line: 20, column: 2, scope: !50)
!85 = !DILocalVariable(name: "n", scope: !50, file: !1, line: 22, type: !17)
!86 = !DILocation(line: 22, column: 6, scope: !50)
!87 = !DILocalVariable(name: "i", scope: !50, file: !1, line: 23, type: !17)
!88 = !DILocation(line: 23, column: 13, scope: !50)
!89 = !DILocation(line: 24, column: 7, scope: !90)
!90 = distinct !DILexicalBlock(scope: !50, file: !1, line: 24, column: 2)
!91 = !DILocation(line: 24, column: 6, scope: !90)
!92 = !DILocation(line: 24, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !1, line: 24, column: 2)
!94 = !DILocation(line: 24, column: 12, scope: !93)
!95 = !DILocation(line: 24, column: 2, scope: !90)
!96 = !DILocation(line: 25, column: 7, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !1, line: 24, column: 20)
!98 = !DILocation(line: 25, column: 11, scope: !97)
!99 = !DILocation(line: 25, column: 15, scope: !97)
!100 = !DILocation(line: 25, column: 21, scope: !97)
!101 = !DILocation(line: 25, column: 3, scope: !97)
!102 = !DILocation(line: 26, column: 11, scope: !97)
!103 = !DILocation(line: 26, column: 16, scope: !97)
!104 = !DILocation(line: 26, column: 22, scope: !97)
!105 = !DILocation(line: 26, column: 3, scope: !97)
!106 = !DILocation(line: 27, column: 11, scope: !97)
!107 = !DILocation(line: 27, column: 16, scope: !97)
!108 = !DILocation(line: 27, column: 21, scope: !97)
!109 = !DILocation(line: 27, column: 3, scope: !97)
!110 = !DILocation(line: 28, column: 14, scope: !97)
!111 = !DILocation(line: 28, column: 19, scope: !97)
!112 = !DILocation(line: 28, column: 24, scope: !97)
!113 = !DILocation(line: 28, column: 3, scope: !97)
!114 = !DILocation(line: 29, column: 11, scope: !97)
!115 = !DILocation(line: 29, column: 14, scope: !97)
!116 = !DILocation(line: 29, column: 17, scope: !97)
!117 = !DILocation(line: 29, column: 3, scope: !97)
!118 = !DILocation(line: 30, column: 8, scope: !97)
!119 = !DILocation(line: 30, column: 5, scope: !97)
!120 = !DILocation(line: 31, column: 7, scope: !97)
!121 = !DILocation(line: 31, column: 13, scope: !97)
!122 = !DILocation(line: 31, column: 19, scope: !97)
!123 = !DILocation(line: 31, column: 23, scope: !97)
!124 = !DILocation(line: 31, column: 3, scope: !97)
!125 = !DILocation(line: 32, column: 11, scope: !97)
!126 = !DILocation(line: 32, column: 16, scope: !97)
!127 = !DILocation(line: 32, column: 20, scope: !97)
!128 = !DILocation(line: 32, column: 3, scope: !97)
!129 = !DILocation(line: 33, column: 11, scope: !97)
!130 = !DILocation(line: 33, column: 16, scope: !97)
!131 = !DILocation(line: 33, column: 21, scope: !97)
!132 = !DILocation(line: 33, column: 3, scope: !97)
!133 = !DILocation(line: 34, column: 14, scope: !97)
!134 = !DILocation(line: 34, column: 19, scope: !97)
!135 = !DILocation(line: 34, column: 24, scope: !97)
!136 = !DILocation(line: 34, column: 3, scope: !97)
!137 = !DILocation(line: 35, column: 11, scope: !97)
!138 = !DILocation(line: 35, column: 14, scope: !97)
!139 = !DILocation(line: 35, column: 17, scope: !97)
!140 = !DILocation(line: 35, column: 3, scope: !97)
!141 = !DILocation(line: 36, column: 8, scope: !97)
!142 = !DILocation(line: 36, column: 5, scope: !97)
!143 = !DILocation(line: 37, column: 2, scope: !97)
!144 = !DILocation(line: 24, column: 17, scope: !93)
!145 = !DILocation(line: 24, column: 2, scope: !93)
!146 = distinct !{!146, !95, !147}
!147 = !DILocation(line: 37, column: 2, scope: !90)
!148 = !DILocation(line: 38, column: 10, scope: !50)
!149 = !DILocation(line: 38, column: 14, scope: !50)
!150 = !DILocation(line: 38, column: 18, scope: !50)
!151 = !DILocation(line: 38, column: 2, scope: !50)
!152 = !DILocation(line: 39, column: 10, scope: !50)
!153 = !DILocation(line: 39, column: 14, scope: !50)
!154 = !DILocation(line: 39, column: 18, scope: !50)
!155 = !DILocation(line: 39, column: 2, scope: !50)
!156 = !DILocation(line: 40, column: 30, scope: !50)
!157 = !DILocation(line: 40, column: 2, scope: !50)
!158 = !DILocation(line: 41, column: 2, scope: !50)
