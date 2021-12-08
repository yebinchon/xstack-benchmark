; ModuleID = 'averages-median-1.ll'
source_filename = "averages-median-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.floatList = type { float*, i32 }

@main.floats1 = internal global [6 x float] [float 0x4014666660000000, float 0x4004CCCCC0000000, float 0x4018CCCCC0000000, float 0x40219999A0000000, float 0x4012666660000000, float 0x4010666660000000], align 16, !dbg !0
@main.flist1 = internal global %struct.floatList { float* getelementptr inbounds ([6 x float], [6 x float]* @main.floats1, i32 0, i32 0), i32 6 }, align 8, !dbg !14
@main.floats2 = internal global [5 x float] [float 0x4014666660000000, float 0x4004CCCCC0000000, float 0x40219999A0000000, float 0x4012666660000000, float 0x4010666660000000], align 16, !dbg !21
@main.flist2 = internal global %struct.floatList { float* getelementptr inbounds ([5 x float], [5 x float]* @main.floats2, i32 0, i32 0), i32 5 }, align 8, !dbg !26
@.str = private unnamed_addr constant [24 x i8] c"flist1 median is %7.2f\0A\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"flist2 median is %7.2f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @floatcmp(i8* %a, i8* %b) #0 !dbg !35 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i8* %b, metadata !42, metadata !DIExpression()), !dbg !41
  %0 = bitcast i8* %a to float*, !dbg !43
  %1 = load float, float* %0, align 4, !dbg !45
  %2 = bitcast i8* %b to float*, !dbg !46
  %3 = load float, float* %2, align 4, !dbg !47
  %cmp = fcmp olt float %1, %3, !dbg !48
  br i1 %cmp, label %if.then, label %if.else, !dbg !49

if.then:                                          ; preds = %entry
  br label %return, !dbg !50

if.else:                                          ; preds = %entry
  %4 = bitcast i8* %a to float*, !dbg !51
  %5 = load float, float* %4, align 4, !dbg !52
  %6 = bitcast i8* %b to float*, !dbg !53
  %7 = load float, float* %6, align 4, !dbg !54
  %cmp1 = fcmp ogt float %5, %7, !dbg !55
  %conv = zext i1 %cmp1 to i32, !dbg !55
  br label %return, !dbg !56

return:                                           ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ %conv, %if.else ], !dbg !57
  ret i32 %retval.0, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local float @median(%struct.floatList* %fl) #0 !dbg !59 {
entry:
  call void @llvm.dbg.value(metadata %struct.floatList* %fl, metadata !64, metadata !DIExpression()), !dbg !65
  %list = getelementptr inbounds %struct.floatList, %struct.floatList* %fl, i32 0, i32 0, !dbg !66
  %0 = load float*, float** %list, align 8, !dbg !66
  %1 = bitcast float* %0 to i8*, !dbg !67
  %size = getelementptr inbounds %struct.floatList, %struct.floatList* %fl, i32 0, i32 1, !dbg !68
  %2 = load i32, i32* %size, align 8, !dbg !68
  %conv = sext i32 %2 to i64, !dbg !69
  call void @qsort(i8* %1, i64 %conv, i64 4, i32 (i8*, i8*)* @floatcmp), !dbg !70
  %list1 = getelementptr inbounds %struct.floatList, %struct.floatList* %fl, i32 0, i32 0, !dbg !71
  %3 = load float*, float** %list1, align 8, !dbg !71
  %size2 = getelementptr inbounds %struct.floatList, %struct.floatList* %fl, i32 0, i32 1, !dbg !72
  %4 = load i32, i32* %size2, align 8, !dbg !72
  %div = sdiv i32 %4, 2, !dbg !73
  %idxprom = sext i32 %div to i64, !dbg !74
  %arrayidx = getelementptr inbounds float, float* %3, i64 %idxprom, !dbg !74
  %5 = load float, float* %arrayidx, align 4, !dbg !74
  %list3 = getelementptr inbounds %struct.floatList, %struct.floatList* %fl, i32 0, i32 0, !dbg !75
  %6 = load float*, float** %list3, align 8, !dbg !75
  %size4 = getelementptr inbounds %struct.floatList, %struct.floatList* %fl, i32 0, i32 1, !dbg !76
  %7 = load i32, i32* %size4, align 8, !dbg !76
  %sub = sub nsw i32 %7, 1, !dbg !77
  %div5 = sdiv i32 %sub, 2, !dbg !78
  %idxprom6 = sext i32 %div5 to i64, !dbg !79
  %arrayidx7 = getelementptr inbounds float, float* %6, i64 %idxprom6, !dbg !79
  %8 = load float, float* %arrayidx7, align 4, !dbg !79
  %add = fadd float %5, %8, !dbg !80
  %conv8 = fpext float %add to double, !dbg !81
  %mul = fmul double 5.000000e-01, %conv8, !dbg !82
  %conv9 = fptrunc double %mul to float, !dbg !83
  ret float %conv9, !dbg !84
}

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !2 {
entry:
  %call = call float @median(%struct.floatList* @main.flist1), !dbg !85
  %conv = fpext float %call to double, !dbg !85
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), double %conv), !dbg !86
  %call2 = call float @median(%struct.floatList* @main.flist2), !dbg !87
  %conv3 = fpext float %call2 to double, !dbg !87
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0), double %conv3), !dbg !88
  ret i32 0, !dbg !89
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!31, !32, !33}
!llvm.ident = !{!34}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "floats1", scope: !2, file: !3, line: 22, type: !28, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 20, type: !4, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!3 = !DIFile(filename: "averages-median-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Averages-Median")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !9, globals: !13, splitDebugInlining: false, nameTableKind: None)
!8 = !{}
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!13 = !{!0, !14, !21, !26}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "flist1", scope: !2, file: !3, line: 23, type: !16, isLocal: true, isDefinition: true)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "floatList", file: !3, line: 4, size: 128, elements: !17)
!17 = !{!18, !20}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !16, file: !3, line: 5, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !16, file: !3, line: 6, baseType: !6, size: 32, offset: 64)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "floats2", scope: !2, file: !3, line: 25, type: !23, isLocal: true, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 5)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "flist2", scope: !2, file: !3, line: 26, type: !16, isLocal: true, isDefinition: true)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 6)
!31 = !{i32 7, !"Dwarf Version", i32 4}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{i32 1, !"wchar_size", i32 4}
!34 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!35 = distinct !DISubprogram(name: "floatcmp", scope: !3, file: !3, line: 9, type: !36, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!36 = !DISubroutineType(types: !37)
!37 = !{!6, !38, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!40 = !DILocalVariable(name: "a", arg: 1, scope: !35, file: !3, line: 9, type: !38)
!41 = !DILocation(line: 0, scope: !35)
!42 = !DILocalVariable(name: "b", arg: 2, scope: !35, file: !3, line: 9, type: !38)
!43 = !DILocation(line: 10, column: 10, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !3, line: 10, column: 9)
!45 = !DILocation(line: 10, column: 9, scope: !44)
!46 = !DILocation(line: 10, column: 30, scope: !44)
!47 = !DILocation(line: 10, column: 29, scope: !44)
!48 = !DILocation(line: 10, column: 27, scope: !44)
!49 = !DILocation(line: 10, column: 9, scope: !35)
!50 = !DILocation(line: 10, column: 48, scope: !44)
!51 = !DILocation(line: 11, column: 18, scope: !44)
!52 = !DILocation(line: 11, column: 17, scope: !44)
!53 = !DILocation(line: 11, column: 38, scope: !44)
!54 = !DILocation(line: 11, column: 37, scope: !44)
!55 = !DILocation(line: 11, column: 35, scope: !44)
!56 = !DILocation(line: 11, column: 10, scope: !44)
!57 = !DILocation(line: 0, scope: !44)
!58 = !DILocation(line: 12, column: 1, scope: !35)
!59 = distinct !DISubprogram(name: "median", scope: !3, file: !3, line: 14, type: !60, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!60 = !DISubroutineType(types: !61)
!61 = !{!12, !62}
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "FloatList", file: !3, line: 7, baseType: !63)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!64 = !DILocalVariable(name: "fl", arg: 1, scope: !59, file: !3, line: 14, type: !62)
!65 = !DILocation(line: 0, scope: !59)
!66 = !DILocation(line: 16, column: 16, scope: !59)
!67 = !DILocation(line: 16, column: 12, scope: !59)
!68 = !DILocation(line: 16, column: 26, scope: !59)
!69 = !DILocation(line: 16, column: 22, scope: !59)
!70 = !DILocation(line: 16, column: 5, scope: !59)
!71 = !DILocation(line: 17, column: 24, scope: !59)
!72 = !DILocation(line: 17, column: 33, scope: !59)
!73 = !DILocation(line: 17, column: 37, scope: !59)
!74 = !DILocation(line: 17, column: 20, scope: !59)
!75 = !DILocation(line: 17, column: 47, scope: !59)
!76 = !DILocation(line: 17, column: 57, scope: !59)
!77 = !DILocation(line: 17, column: 61, scope: !59)
!78 = !DILocation(line: 17, column: 64, scope: !59)
!79 = !DILocation(line: 17, column: 43, scope: !59)
!80 = !DILocation(line: 17, column: 41, scope: !59)
!81 = !DILocation(line: 17, column: 18, scope: !59)
!82 = !DILocation(line: 17, column: 16, scope: !59)
!83 = !DILocation(line: 17, column: 12, scope: !59)
!84 = !DILocation(line: 17, column: 5, scope: !59)
!85 = !DILocation(line: 28, column: 40, scope: !2)
!86 = !DILocation(line: 28, column: 5, scope: !2)
!87 = !DILocation(line: 29, column: 40, scope: !2)
!88 = !DILocation(line: 29, column: 5, scope: !2)
!89 = !DILocation(line: 30, column: 5, scope: !2)
