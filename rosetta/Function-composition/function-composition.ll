; ModuleID = 'function-composition.c'
source_filename = "function-composition.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.compose_functor = type { {}*, %struct.double_to_double*, %struct.double_to_double* }
%struct.double_to_double = type { double (%struct.double_to_double*, double)* }

@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @compose_call(%struct.compose_functor* %this, double %x) #0 !dbg !18 {
entry:
  %this.addr = alloca %struct.compose_functor*, align 8
  %x.addr = alloca double, align 8
  store %struct.compose_functor* %this, %struct.compose_functor** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.compose_functor** %this.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !34, metadata !DIExpression()), !dbg !35
  %0 = load %struct.compose_functor*, %struct.compose_functor** %this.addr, align 8, !dbg !36
  %f = getelementptr inbounds %struct.compose_functor, %struct.compose_functor* %0, i32 0, i32 1, !dbg !36
  %1 = load %struct.double_to_double*, %struct.double_to_double** %f, align 8, !dbg !36
  %fn = getelementptr inbounds %struct.double_to_double, %struct.double_to_double* %1, i32 0, i32 0, !dbg !36
  %2 = load double (%struct.double_to_double*, double)*, double (%struct.double_to_double*, double)** %fn, align 8, !dbg !36
  %3 = load %struct.compose_functor*, %struct.compose_functor** %this.addr, align 8, !dbg !36
  %f1 = getelementptr inbounds %struct.compose_functor, %struct.compose_functor* %3, i32 0, i32 1, !dbg !36
  %4 = load %struct.double_to_double*, %struct.double_to_double** %f1, align 8, !dbg !36
  %5 = load %struct.compose_functor*, %struct.compose_functor** %this.addr, align 8, !dbg !36
  %g = getelementptr inbounds %struct.compose_functor, %struct.compose_functor* %5, i32 0, i32 2, !dbg !36
  %6 = load %struct.double_to_double*, %struct.double_to_double** %g, align 8, !dbg !36
  %fn2 = getelementptr inbounds %struct.double_to_double, %struct.double_to_double* %6, i32 0, i32 0, !dbg !36
  %7 = load double (%struct.double_to_double*, double)*, double (%struct.double_to_double*, double)** %fn2, align 8, !dbg !36
  %8 = load %struct.compose_functor*, %struct.compose_functor** %this.addr, align 8, !dbg !36
  %g3 = getelementptr inbounds %struct.compose_functor, %struct.compose_functor* %8, i32 0, i32 2, !dbg !36
  %9 = load %struct.double_to_double*, %struct.double_to_double** %g3, align 8, !dbg !36
  %10 = load double, double* %x.addr, align 8, !dbg !36
  %call = call double %7(%struct.double_to_double* %9, double %10), !dbg !36
  %call4 = call double %2(%struct.double_to_double* %4, double %call), !dbg !36
  ret double %call4, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.double_to_double* @compose(%struct.double_to_double* %f, %struct.double_to_double* %g) #0 !dbg !38 {
entry:
  %f.addr = alloca %struct.double_to_double*, align 8
  %g.addr = alloca %struct.double_to_double*, align 8
  %result = alloca %struct.compose_functor*, align 8
  store %struct.double_to_double* %f, %struct.double_to_double** %f.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.double_to_double** %f.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store %struct.double_to_double* %g, %struct.double_to_double** %g.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.double_to_double** %g.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata %struct.compose_functor** %result, metadata !45, metadata !DIExpression()), !dbg !46
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !47
  %0 = bitcast i8* %call to %struct.compose_functor*, !dbg !47
  store %struct.compose_functor* %0, %struct.compose_functor** %result, align 8, !dbg !46
  %1 = load %struct.compose_functor*, %struct.compose_functor** %result, align 8, !dbg !48
  %fn = getelementptr inbounds %struct.compose_functor, %struct.compose_functor* %1, i32 0, i32 0, !dbg !49
  %fn1 = bitcast {}** %fn to double (%struct.compose_functor*, double)**, !dbg !49
  store double (%struct.compose_functor*, double)* @compose_call, double (%struct.compose_functor*, double)** %fn1, align 8, !dbg !50
  %2 = load %struct.double_to_double*, %struct.double_to_double** %f.addr, align 8, !dbg !51
  %3 = load %struct.compose_functor*, %struct.compose_functor** %result, align 8, !dbg !52
  %f2 = getelementptr inbounds %struct.compose_functor, %struct.compose_functor* %3, i32 0, i32 1, !dbg !53
  store %struct.double_to_double* %2, %struct.double_to_double** %f2, align 8, !dbg !54
  %4 = load %struct.double_to_double*, %struct.double_to_double** %g.addr, align 8, !dbg !55
  %5 = load %struct.compose_functor*, %struct.compose_functor** %result, align 8, !dbg !56
  %g3 = getelementptr inbounds %struct.compose_functor, %struct.compose_functor* %5, i32 0, i32 2, !dbg !57
  store %struct.double_to_double* %4, %struct.double_to_double** %g3, align 8, !dbg !58
  %6 = load %struct.compose_functor*, %struct.compose_functor** %result, align 8, !dbg !59
  %7 = bitcast %struct.compose_functor* %6 to %struct.double_to_double*, !dbg !60
  ret %struct.double_to_double* %7, !dbg !61
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @sin_call(%struct.double_to_double* %this, double %x) #0 !dbg !62 {
entry:
  %this.addr = alloca %struct.double_to_double*, align 8
  %x.addr = alloca double, align 8
  store %struct.double_to_double* %this, %struct.double_to_double** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.double_to_double** %this.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load double, double* %x.addr, align 8, !dbg !69
  %call = call double @sin(double %0) #4, !dbg !70
  ret double %call, !dbg !71
}

; Function Attrs: nounwind
declare dso_local double @sin(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @asin_call(%struct.double_to_double* %this, double %x) #0 !dbg !72 {
entry:
  %this.addr = alloca %struct.double_to_double*, align 8
  %x.addr = alloca double, align 8
  store %struct.double_to_double* %this, %struct.double_to_double** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.double_to_double** %this.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load double, double* %x.addr, align 8, !dbg !77
  %call = call double @asin(double %0) #4, !dbg !78
  ret double %call, !dbg !79
}

; Function Attrs: nounwind
declare dso_local double @asin(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %my_sin = alloca %struct.double_to_double*, align 8
  %my_asin = alloca %struct.double_to_double*, align 8
  %sin_asin = alloca %struct.double_to_double*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.double_to_double** %my_sin, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call noalias i8* @malloc(i64 8) #4, !dbg !86
  %0 = bitcast i8* %call to %struct.double_to_double*, !dbg !86
  store %struct.double_to_double* %0, %struct.double_to_double** %my_sin, align 8, !dbg !85
  %1 = load %struct.double_to_double*, %struct.double_to_double** %my_sin, align 8, !dbg !87
  %fn = getelementptr inbounds %struct.double_to_double, %struct.double_to_double* %1, i32 0, i32 0, !dbg !88
  store double (%struct.double_to_double*, double)* @sin_call, double (%struct.double_to_double*, double)** %fn, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata %struct.double_to_double** %my_asin, metadata !90, metadata !DIExpression()), !dbg !91
  %call1 = call noalias i8* @malloc(i64 8) #4, !dbg !92
  %2 = bitcast i8* %call1 to %struct.double_to_double*, !dbg !92
  store %struct.double_to_double* %2, %struct.double_to_double** %my_asin, align 8, !dbg !91
  %3 = load %struct.double_to_double*, %struct.double_to_double** %my_asin, align 8, !dbg !93
  %fn2 = getelementptr inbounds %struct.double_to_double, %struct.double_to_double* %3, i32 0, i32 0, !dbg !94
  store double (%struct.double_to_double*, double)* @asin_call, double (%struct.double_to_double*, double)** %fn2, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata %struct.double_to_double** %sin_asin, metadata !96, metadata !DIExpression()), !dbg !97
  %4 = load %struct.double_to_double*, %struct.double_to_double** %my_sin, align 8, !dbg !98
  %5 = load %struct.double_to_double*, %struct.double_to_double** %my_asin, align 8, !dbg !99
  %call3 = call %struct.double_to_double* @compose(%struct.double_to_double* %4, %struct.double_to_double* %5), !dbg !100
  store %struct.double_to_double* %call3, %struct.double_to_double** %sin_asin, align 8, !dbg !97
  %6 = load %struct.double_to_double*, %struct.double_to_double** %sin_asin, align 8, !dbg !101
  %fn4 = getelementptr inbounds %struct.double_to_double, %struct.double_to_double* %6, i32 0, i32 0, !dbg !101
  %7 = load double (%struct.double_to_double*, double)*, double (%struct.double_to_double*, double)** %fn4, align 8, !dbg !101
  %8 = load %struct.double_to_double*, %struct.double_to_double** %sin_asin, align 8, !dbg !101
  %call5 = call double %7(%struct.double_to_double* %8, double 5.000000e-01), !dbg !101
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %call5), !dbg !102
  %9 = load %struct.double_to_double*, %struct.double_to_double** %sin_asin, align 8, !dbg !103
  %10 = bitcast %struct.double_to_double* %9 to i8*, !dbg !103
  call void @free(i8* %10) #4, !dbg !104
  %11 = load %struct.double_to_double*, %struct.double_to_double** %my_sin, align 8, !dbg !105
  %12 = bitcast %struct.double_to_double* %11 to i8*, !dbg !105
  call void @free(i8* %12) #4, !dbg !106
  %13 = load %struct.double_to_double*, %struct.double_to_double** %my_asin, align 8, !dbg !107
  %14 = bitcast %struct.double_to_double* %13 to i8*, !dbg !107
  call void @free(i8* %14) #4, !dbg !108
  ret i32 0, !dbg !109
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "function-composition.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Function-composition")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_to_double", file: !1, line: 6, baseType: !6)
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "double_to_double", file: !1, line: 4, size: 64, elements: !7)
!7 = !{!8}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "fn", scope: !6, file: !1, line: 5, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !13, !12}
!12 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!18 = distinct !DISubprogram(name: "compose_call", scope: !1, file: !1, line: 18, type: !19, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!12, !21, !12}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "compose_functor", file: !1, line: 16, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "compose_functor", file: !1, line: 12, size: 192, elements: !24)
!24 = !{!25, !30, !31}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "fn", scope: !23, file: !1, line: 13, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DISubroutineType(types: !28)
!28 = !{!12, !29, !12}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "f", scope: !23, file: !1, line: 14, baseType: !4, size: 64, offset: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "g", scope: !23, file: !1, line: 15, baseType: !4, size: 64, offset: 128)
!32 = !DILocalVariable(name: "this", arg: 1, scope: !18, file: !1, line: 18, type: !21)
!33 = !DILocation(line: 18, column: 38, scope: !18)
!34 = !DILocalVariable(name: "x", arg: 2, scope: !18, file: !1, line: 18, type: !12)
!35 = !DILocation(line: 18, column: 51, scope: !18)
!36 = !DILocation(line: 19, column: 10, scope: !18)
!37 = !DILocation(line: 19, column: 3, scope: !18)
!38 = distinct !DISubprogram(name: "compose", scope: !1, file: !1, line: 23, type: !39, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!4, !4, !4}
!41 = !DILocalVariable(name: "f", arg: 1, scope: !38, file: !1, line: 23, type: !4)
!42 = !DILocation(line: 23, column: 45, scope: !38)
!43 = !DILocalVariable(name: "g", arg: 2, scope: !38, file: !1, line: 24, type: !4)
!44 = !DILocation(line: 24, column: 45, scope: !38)
!45 = !DILocalVariable(name: "result", scope: !38, file: !1, line: 25, type: !21)
!46 = !DILocation(line: 25, column: 20, scope: !38)
!47 = !DILocation(line: 25, column: 29, scope: !38)
!48 = !DILocation(line: 26, column: 3, scope: !38)
!49 = !DILocation(line: 26, column: 11, scope: !38)
!50 = !DILocation(line: 26, column: 14, scope: !38)
!51 = !DILocation(line: 27, column: 15, scope: !38)
!52 = !DILocation(line: 27, column: 3, scope: !38)
!53 = !DILocation(line: 27, column: 11, scope: !38)
!54 = !DILocation(line: 27, column: 13, scope: !38)
!55 = !DILocation(line: 28, column: 15, scope: !38)
!56 = !DILocation(line: 28, column: 3, scope: !38)
!57 = !DILocation(line: 28, column: 11, scope: !38)
!58 = !DILocation(line: 28, column: 13, scope: !38)
!59 = !DILocation(line: 29, column: 30, scope: !38)
!60 = !DILocation(line: 29, column: 10, scope: !38)
!61 = !DILocation(line: 29, column: 3, scope: !38)
!62 = distinct !DISubprogram(name: "sin_call", scope: !1, file: !1, line: 38, type: !63, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!12, !4, !12}
!65 = !DILocalVariable(name: "this", arg: 1, scope: !62, file: !1, line: 38, type: !4)
!66 = !DILocation(line: 38, column: 35, scope: !62)
!67 = !DILocalVariable(name: "x", arg: 2, scope: !62, file: !1, line: 38, type: !12)
!68 = !DILocation(line: 38, column: 48, scope: !62)
!69 = !DILocation(line: 39, column: 14, scope: !62)
!70 = !DILocation(line: 39, column: 10, scope: !62)
!71 = !DILocation(line: 39, column: 3, scope: !62)
!72 = distinct !DISubprogram(name: "asin_call", scope: !1, file: !1, line: 41, type: !63, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "this", arg: 1, scope: !72, file: !1, line: 41, type: !4)
!74 = !DILocation(line: 41, column: 36, scope: !72)
!75 = !DILocalVariable(name: "x", arg: 2, scope: !72, file: !1, line: 41, type: !12)
!76 = !DILocation(line: 41, column: 49, scope: !72)
!77 = !DILocation(line: 42, column: 15, scope: !72)
!78 = !DILocation(line: 42, column: 10, scope: !72)
!79 = !DILocation(line: 42, column: 3, scope: !72)
!80 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 49, type: !81, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DILocalVariable(name: "my_sin", scope: !80, file: !1, line: 50, type: !4)
!85 = !DILocation(line: 50, column: 21, scope: !80)
!86 = !DILocation(line: 50, column: 30, scope: !80)
!87 = !DILocation(line: 51, column: 3, scope: !80)
!88 = !DILocation(line: 51, column: 11, scope: !80)
!89 = !DILocation(line: 51, column: 14, scope: !80)
!90 = !DILocalVariable(name: "my_asin", scope: !80, file: !1, line: 52, type: !4)
!91 = !DILocation(line: 52, column: 21, scope: !80)
!92 = !DILocation(line: 52, column: 31, scope: !80)
!93 = !DILocation(line: 53, column: 3, scope: !80)
!94 = !DILocation(line: 53, column: 12, scope: !80)
!95 = !DILocation(line: 53, column: 15, scope: !80)
!96 = !DILocalVariable(name: "sin_asin", scope: !80, file: !1, line: 55, type: !4)
!97 = !DILocation(line: 55, column: 21, scope: !80)
!98 = !DILocation(line: 55, column: 40, scope: !80)
!99 = !DILocation(line: 55, column: 48, scope: !80)
!100 = !DILocation(line: 55, column: 32, scope: !80)
!101 = !DILocation(line: 57, column: 18, scope: !80)
!102 = !DILocation(line: 57, column: 3, scope: !80)
!103 = !DILocation(line: 59, column: 8, scope: !80)
!104 = !DILocation(line: 59, column: 3, scope: !80)
!105 = !DILocation(line: 60, column: 8, scope: !80)
!106 = !DILocation(line: 60, column: 3, scope: !80)
!107 = !DILocation(line: 61, column: 8, scope: !80)
!108 = !DILocation(line: 61, column: 3, scope: !80)
!109 = !DILocation(line: 63, column: 3, scope: !80)
