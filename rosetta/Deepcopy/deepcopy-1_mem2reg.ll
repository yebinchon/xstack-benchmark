; ModuleID = 'deepcopy-1.ll'
source_filename = "deepcopy-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.layer3 = type { %struct.layer2, %struct.layer1, i32, i32 }
%struct.layer2 = type { %struct.layer1, float, float }
%struct.layer1 = type { i32 }

@.str = private unnamed_addr constant [13 x i8] c"\0Acake.d = %d\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"\0Acake.e = %d\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"\0Acake.l1.a = %d\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"\0Acake.l2.b = %f\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"\0Acake.l2.l1.a = %d\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"Cake 1 is : \00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"\0ACake 2 is : \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @showCake(%struct.layer3* byval(%struct.layer3) align 8 %cake) #0 !dbg !7 {
entry:
  call void @llvm.dbg.declare(metadata %struct.layer3* %cake, metadata !29, metadata !DIExpression()), !dbg !30
  %d = getelementptr inbounds %struct.layer3, %struct.layer3* %cake, i32 0, i32 2, !dbg !31
  %0 = load i32, i32* %d, align 8, !dbg !31
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !32
  %e = getelementptr inbounds %struct.layer3, %struct.layer3* %cake, i32 0, i32 3, !dbg !33
  %1 = load i32, i32* %e, align 4, !dbg !33
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 %1), !dbg !34
  %l1 = getelementptr inbounds %struct.layer3, %struct.layer3* %cake, i32 0, i32 1, !dbg !35
  %a = getelementptr inbounds %struct.layer1, %struct.layer1* %l1, i32 0, i32 0, !dbg !36
  %2 = load i32, i32* %a, align 4, !dbg !36
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0), i32 %2), !dbg !37
  %l2 = getelementptr inbounds %struct.layer3, %struct.layer3* %cake, i32 0, i32 0, !dbg !38
  %b = getelementptr inbounds %struct.layer2, %struct.layer2* %l2, i32 0, i32 1, !dbg !39
  %3 = load float, float* %b, align 4, !dbg !39
  %conv = fpext float %3 to double, !dbg !40
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), double %conv), !dbg !41
  %l24 = getelementptr inbounds %struct.layer3, %struct.layer3* %cake, i32 0, i32 0, !dbg !42
  %l15 = getelementptr inbounds %struct.layer2, %struct.layer2* %l24, i32 0, i32 0, !dbg !43
  %a6 = getelementptr inbounds %struct.layer1, %struct.layer1* %l15, i32 0, i32 0, !dbg !44
  %4 = load i32, i32* %a6, align 8, !dbg !44
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0), i32 %4), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !47 {
entry:
  %cake1 = alloca %struct.layer3, align 8
  %cake2 = alloca %struct.layer3, align 8
  call void @llvm.dbg.declare(metadata %struct.layer3* %cake1, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata %struct.layer3* %cake2, metadata !52, metadata !DIExpression()), !dbg !53
  %d = getelementptr inbounds %struct.layer3, %struct.layer3* %cake1, i32 0, i32 2, !dbg !54
  store i32 1, i32* %d, align 4, !dbg !55
  %e = getelementptr inbounds %struct.layer3, %struct.layer3* %cake1, i32 0, i32 3, !dbg !56
  store i32 2, i32* %e, align 4, !dbg !57
  %l1 = getelementptr inbounds %struct.layer3, %struct.layer3* %cake1, i32 0, i32 1, !dbg !58
  %a = getelementptr inbounds %struct.layer1, %struct.layer1* %l1, i32 0, i32 0, !dbg !59
  store i32 3, i32* %a, align 4, !dbg !60
  %l2 = getelementptr inbounds %struct.layer3, %struct.layer3* %cake1, i32 0, i32 0, !dbg !61
  %b = getelementptr inbounds %struct.layer2, %struct.layer2* %l2, i32 0, i32 1, !dbg !62
  store float 4.000000e+00, float* %b, align 4, !dbg !63
  %l21 = getelementptr inbounds %struct.layer3, %struct.layer3* %cake1, i32 0, i32 0, !dbg !64
  %l12 = getelementptr inbounds %struct.layer2, %struct.layer2* %l21, i32 0, i32 0, !dbg !65
  %a3 = getelementptr inbounds %struct.layer1, %struct.layer1* %l12, i32 0, i32 0, !dbg !66
  store i32 5, i32* %a3, align 4, !dbg !67
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0)), !dbg !68
  call void @showCake(%struct.layer3* byval(%struct.layer3) align 8 %cake1), !dbg !69
  %0 = bitcast %struct.layer3* %cake2 to i8*, !dbg !70
  %1 = bitcast %struct.layer3* %cake1 to i8*, !dbg !70
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 %1, i64 24, i1 false), !dbg !70
  %l24 = getelementptr inbounds %struct.layer3, %struct.layer3* %cake2, i32 0, i32 0, !dbg !71
  %l15 = getelementptr inbounds %struct.layer2, %struct.layer2* %l24, i32 0, i32 0, !dbg !72
  %a6 = getelementptr inbounds %struct.layer1, %struct.layer1* %l15, i32 0, i32 0, !dbg !73
  %2 = load i32, i32* %a6, align 4, !dbg !73
  %conv = sitofp i32 %2 to float, !dbg !74
  %l27 = getelementptr inbounds %struct.layer3, %struct.layer3* %cake2, i32 0, i32 0, !dbg !75
  %b8 = getelementptr inbounds %struct.layer2, %struct.layer2* %l27, i32 0, i32 1, !dbg !76
  %3 = load float, float* %b8, align 4, !dbg !77
  %add = fadd float %3, %conv, !dbg !77
  store float %add, float* %b8, align 4, !dbg !77
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0)), !dbg !78
  call void @showCake(%struct.layer3* byval(%struct.layer3) align 8 %cake2), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "deepcopy-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Deepcopy")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "showCake", scope: !1, file: !1, line: 18, type: !8, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "layer3", file: !1, line: 16, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 12, size: 192, elements: !12)
!12 = !{!13, !26, !27, !28}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "l2", scope: !11, file: !1, line: 13, baseType: !14, size: 96)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "layer2", file: !1, line: 10, baseType: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 7, size: 96, elements: !16)
!16 = !{!17, !23, !25}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "l1", scope: !15, file: !1, line: 8, baseType: !18, size: 32)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "layer1", file: !1, line: 5, baseType: !19)
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 3, size: 32, elements: !20)
!20 = !{!21}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !19, file: !1, line: 4, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !15, file: !1, line: 9, baseType: !24, size: 32, offset: 32)
!24 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !15, file: !1, line: 9, baseType: !24, size: 32, offset: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "l1", scope: !11, file: !1, line: 14, baseType: !18, size: 32, offset: 96)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "d", scope: !11, file: !1, line: 15, baseType: !22, size: 32, offset: 128)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !11, file: !1, line: 15, baseType: !22, size: 32, offset: 160)
!29 = !DILocalVariable(name: "cake", arg: 1, scope: !7, file: !1, line: 18, type: !10)
!30 = !DILocation(line: 18, column: 22, scope: !7)
!31 = !DILocation(line: 19, column: 30, scope: !7)
!32 = !DILocation(line: 19, column: 2, scope: !7)
!33 = !DILocation(line: 20, column: 30, scope: !7)
!34 = !DILocation(line: 20, column: 2, scope: !7)
!35 = !DILocation(line: 21, column: 33, scope: !7)
!36 = !DILocation(line: 21, column: 36, scope: !7)
!37 = !DILocation(line: 21, column: 2, scope: !7)
!38 = !DILocation(line: 22, column: 33, scope: !7)
!39 = !DILocation(line: 22, column: 36, scope: !7)
!40 = !DILocation(line: 22, column: 28, scope: !7)
!41 = !DILocation(line: 22, column: 2, scope: !7)
!42 = !DILocation(line: 23, column: 36, scope: !7)
!43 = !DILocation(line: 23, column: 39, scope: !7)
!44 = !DILocation(line: 23, column: 42, scope: !7)
!45 = !DILocation(line: 23, column: 2, scope: !7)
!46 = !DILocation(line: 24, column: 1, scope: !7)
!47 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 26, type: !48, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!22}
!50 = !DILocalVariable(name: "cake1", scope: !47, file: !1, line: 28, type: !10)
!51 = !DILocation(line: 28, column: 9, scope: !47)
!52 = !DILocalVariable(name: "cake2", scope: !47, file: !1, line: 28, type: !10)
!53 = !DILocation(line: 28, column: 15, scope: !47)
!54 = !DILocation(line: 30, column: 8, scope: !47)
!55 = !DILocation(line: 30, column: 10, scope: !47)
!56 = !DILocation(line: 31, column: 8, scope: !47)
!57 = !DILocation(line: 31, column: 10, scope: !47)
!58 = !DILocation(line: 32, column: 8, scope: !47)
!59 = !DILocation(line: 32, column: 11, scope: !47)
!60 = !DILocation(line: 32, column: 13, scope: !47)
!61 = !DILocation(line: 33, column: 8, scope: !47)
!62 = !DILocation(line: 33, column: 11, scope: !47)
!63 = !DILocation(line: 33, column: 13, scope: !47)
!64 = !DILocation(line: 34, column: 8, scope: !47)
!65 = !DILocation(line: 34, column: 11, scope: !47)
!66 = !DILocation(line: 34, column: 14, scope: !47)
!67 = !DILocation(line: 34, column: 16, scope: !47)
!68 = !DILocation(line: 36, column: 2, scope: !47)
!69 = !DILocation(line: 37, column: 2, scope: !47)
!70 = !DILocation(line: 39, column: 10, scope: !47)
!71 = !DILocation(line: 41, column: 22, scope: !47)
!72 = !DILocation(line: 41, column: 25, scope: !47)
!73 = !DILocation(line: 41, column: 28, scope: !47)
!74 = !DILocation(line: 41, column: 16, scope: !47)
!75 = !DILocation(line: 41, column: 8, scope: !47)
!76 = !DILocation(line: 41, column: 11, scope: !47)
!77 = !DILocation(line: 41, column: 13, scope: !47)
!78 = !DILocation(line: 43, column: 2, scope: !47)
!79 = !DILocation(line: 44, column: 2, scope: !47)
!80 = !DILocation(line: 46, column: 2, scope: !47)
