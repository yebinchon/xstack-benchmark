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
  %retval = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !40, metadata !DIExpression()), !dbg !41
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i8*, i8** %a.addr, align 8, !dbg !44
  %1 = bitcast i8* %0 to float*, !dbg !46
  %2 = load float, float* %1, align 4, !dbg !47
  %3 = load i8*, i8** %b.addr, align 8, !dbg !48
  %4 = bitcast i8* %3 to float*, !dbg !49
  %5 = load float, float* %4, align 4, !dbg !50
  %cmp = fcmp olt float %2, %5, !dbg !51
  br i1 %cmp, label %if.then, label %if.else, !dbg !52

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !53
  br label %return, !dbg !53

if.else:                                          ; preds = %entry
  %6 = load i8*, i8** %a.addr, align 8, !dbg !54
  %7 = bitcast i8* %6 to float*, !dbg !55
  %8 = load float, float* %7, align 4, !dbg !56
  %9 = load i8*, i8** %b.addr, align 8, !dbg !57
  %10 = bitcast i8* %9 to float*, !dbg !58
  %11 = load float, float* %10, align 4, !dbg !59
  %cmp1 = fcmp ogt float %8, %11, !dbg !60
  %conv = zext i1 %cmp1 to i32, !dbg !60
  store i32 %conv, i32* %retval, align 4, !dbg !61
  br label %return, !dbg !61

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !62
  ret i32 %12, !dbg !62
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local float @median(%struct.floatList* %fl) #0 !dbg !63 {
entry:
  %fl.addr = alloca %struct.floatList*, align 8
  store %struct.floatList* %fl, %struct.floatList** %fl.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.floatList** %fl.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load %struct.floatList*, %struct.floatList** %fl.addr, align 8, !dbg !70
  %list = getelementptr inbounds %struct.floatList, %struct.floatList* %0, i32 0, i32 0, !dbg !71
  %1 = load float*, float** %list, align 8, !dbg !71
  %2 = bitcast float* %1 to i8*, !dbg !70
  %3 = load %struct.floatList*, %struct.floatList** %fl.addr, align 8, !dbg !72
  %size = getelementptr inbounds %struct.floatList, %struct.floatList* %3, i32 0, i32 1, !dbg !73
  %4 = load i32, i32* %size, align 8, !dbg !73
  %conv = sext i32 %4 to i64, !dbg !72
  call void @qsort(i8* %2, i64 %conv, i64 4, i32 (i8*, i8*)* @floatcmp), !dbg !74
  %5 = load %struct.floatList*, %struct.floatList** %fl.addr, align 8, !dbg !75
  %list1 = getelementptr inbounds %struct.floatList, %struct.floatList* %5, i32 0, i32 0, !dbg !76
  %6 = load float*, float** %list1, align 8, !dbg !76
  %7 = load %struct.floatList*, %struct.floatList** %fl.addr, align 8, !dbg !77
  %size2 = getelementptr inbounds %struct.floatList, %struct.floatList* %7, i32 0, i32 1, !dbg !78
  %8 = load i32, i32* %size2, align 8, !dbg !78
  %div = sdiv i32 %8, 2, !dbg !79
  %idxprom = sext i32 %div to i64, !dbg !75
  %arrayidx = getelementptr inbounds float, float* %6, i64 %idxprom, !dbg !75
  %9 = load float, float* %arrayidx, align 4, !dbg !75
  %10 = load %struct.floatList*, %struct.floatList** %fl.addr, align 8, !dbg !80
  %list3 = getelementptr inbounds %struct.floatList, %struct.floatList* %10, i32 0, i32 0, !dbg !81
  %11 = load float*, float** %list3, align 8, !dbg !81
  %12 = load %struct.floatList*, %struct.floatList** %fl.addr, align 8, !dbg !82
  %size4 = getelementptr inbounds %struct.floatList, %struct.floatList* %12, i32 0, i32 1, !dbg !83
  %13 = load i32, i32* %size4, align 8, !dbg !83
  %sub = sub nsw i32 %13, 1, !dbg !84
  %div5 = sdiv i32 %sub, 2, !dbg !85
  %idxprom6 = sext i32 %div5 to i64, !dbg !80
  %arrayidx7 = getelementptr inbounds float, float* %11, i64 %idxprom6, !dbg !80
  %14 = load float, float* %arrayidx7, align 4, !dbg !80
  %add = fadd float %9, %14, !dbg !86
  %conv8 = fpext float %add to double, !dbg !87
  %mul = fmul double 5.000000e-01, %conv8, !dbg !88
  %conv9 = fptrunc double %mul to float, !dbg !89
  ret float %conv9, !dbg !90
}

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !2 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call float @median(%struct.floatList* @main.flist1), !dbg !91
  %conv = fpext float %call to double, !dbg !91
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), double %conv), !dbg !92
  %call2 = call float @median(%struct.floatList* @main.flist2), !dbg !93
  %conv3 = fpext float %call2 to double, !dbg !93
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0), double %conv3), !dbg !94
  ret i32 0, !dbg !95
}

declare dso_local i32 @printf(i8*, ...) #2

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
!41 = !DILocation(line: 9, column: 27, scope: !35)
!42 = !DILocalVariable(name: "b", arg: 2, scope: !35, file: !3, line: 9, type: !38)
!43 = !DILocation(line: 9, column: 42, scope: !35)
!44 = !DILocation(line: 10, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !35, file: !3, line: 10, column: 9)
!46 = !DILocation(line: 10, column: 10, scope: !45)
!47 = !DILocation(line: 10, column: 9, scope: !45)
!48 = !DILocation(line: 10, column: 45, scope: !45)
!49 = !DILocation(line: 10, column: 30, scope: !45)
!50 = !DILocation(line: 10, column: 29, scope: !45)
!51 = !DILocation(line: 10, column: 27, scope: !45)
!52 = !DILocation(line: 10, column: 9, scope: !35)
!53 = !DILocation(line: 10, column: 48, scope: !45)
!54 = !DILocation(line: 11, column: 33, scope: !45)
!55 = !DILocation(line: 11, column: 18, scope: !45)
!56 = !DILocation(line: 11, column: 17, scope: !45)
!57 = !DILocation(line: 11, column: 53, scope: !45)
!58 = !DILocation(line: 11, column: 38, scope: !45)
!59 = !DILocation(line: 11, column: 37, scope: !45)
!60 = !DILocation(line: 11, column: 35, scope: !45)
!61 = !DILocation(line: 11, column: 10, scope: !45)
!62 = !DILocation(line: 12, column: 1, scope: !35)
!63 = distinct !DISubprogram(name: "median", scope: !3, file: !3, line: 14, type: !64, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!64 = !DISubroutineType(types: !65)
!65 = !{!12, !66}
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "FloatList", file: !3, line: 7, baseType: !67)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!68 = !DILocalVariable(name: "fl", arg: 1, scope: !63, file: !3, line: 14, type: !66)
!69 = !DILocation(line: 14, column: 25, scope: !63)
!70 = !DILocation(line: 16, column: 12, scope: !63)
!71 = !DILocation(line: 16, column: 16, scope: !63)
!72 = !DILocation(line: 16, column: 22, scope: !63)
!73 = !DILocation(line: 16, column: 26, scope: !63)
!74 = !DILocation(line: 16, column: 5, scope: !63)
!75 = !DILocation(line: 17, column: 20, scope: !63)
!76 = !DILocation(line: 17, column: 24, scope: !63)
!77 = !DILocation(line: 17, column: 29, scope: !63)
!78 = !DILocation(line: 17, column: 33, scope: !63)
!79 = !DILocation(line: 17, column: 37, scope: !63)
!80 = !DILocation(line: 17, column: 43, scope: !63)
!81 = !DILocation(line: 17, column: 47, scope: !63)
!82 = !DILocation(line: 17, column: 53, scope: !63)
!83 = !DILocation(line: 17, column: 57, scope: !63)
!84 = !DILocation(line: 17, column: 61, scope: !63)
!85 = !DILocation(line: 17, column: 64, scope: !63)
!86 = !DILocation(line: 17, column: 41, scope: !63)
!87 = !DILocation(line: 17, column: 18, scope: !63)
!88 = !DILocation(line: 17, column: 16, scope: !63)
!89 = !DILocation(line: 17, column: 12, scope: !63)
!90 = !DILocation(line: 17, column: 5, scope: !63)
!91 = !DILocation(line: 28, column: 40, scope: !2)
!92 = !DILocation(line: 28, column: 5, scope: !2)
!93 = !DILocation(line: 29, column: 40, scope: !2)
!94 = !DILocation(line: 29, column: 5, scope: !2)
!95 = !DILocation(line: 30, column: 5, scope: !2)
