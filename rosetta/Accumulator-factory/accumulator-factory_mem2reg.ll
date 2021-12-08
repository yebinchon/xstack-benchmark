; ModuleID = 'accumulator-factory.ll'
source_filename = "accumulator-factory.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x._n = internal global double 1.000000e+00, align 8, !dbg !0
@y._n = internal global i32 3, align 4, !dbg !10
@z._n = internal global i32 97, align 4, !dbg !16
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%i\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%c\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @x(double %i) #0 !dbg !2 {
entry:
  call void @llvm.dbg.value(metadata double %i, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load double, double* @x._n, align 8, !dbg !25
  %add = fadd double %0, %i, !dbg !25
  store double %add, double* @x._n, align 8, !dbg !25
  ret double %add, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @y(i32 %i) #0 !dbg !12 {
entry:
  call void @llvm.dbg.value(metadata i32 %i, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* @y._n, align 4, !dbg !28
  %add = add nsw i32 %0, %i, !dbg !28
  store i32 %add, i32* @y._n, align 4, !dbg !28
  ret i32 %add, !dbg !28
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @z(i32 %i) #0 !dbg !18 {
entry:
  call void @llvm.dbg.value(metadata i32 %i, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* @z._n, align 4, !dbg !31
  %add = add nsw i32 %0, %i, !dbg !31
  store i32 %add, i32* @z._n, align 4, !dbg !31
  ret i32 %add, !dbg !31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !32 {
entry:
  %call = call double @x(double 5.000000e+00), !dbg !35
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %call), !dbg !36
  %call2 = call double @x(double 2.300000e+00), !dbg !37
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %call2), !dbg !38
  %call4 = call i32 @y(i32 5), !dbg !39
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %call4), !dbg !40
  %call6 = call i32 @y(i32 3), !dbg !41
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %call6), !dbg !42
  %call8 = call i32 @z(i32 5), !dbg !43
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %call8), !dbg !44
  ret i32 0, !dbg !45
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_n", scope: !2, file: !3, line: 7, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "x", scope: !3, file: !3, line: 7, type: !4, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!3 = !DIFile(filename: "accumulator-factory.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Accumulator-factory")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, globals: !9, splitDebugInlining: false, nameTableKind: None)
!8 = !{}
!9 = !{!0, !10, !16}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "_n", scope: !12, file: !3, line: 8, type: !15, isLocal: true, isDefinition: true)
!12 = distinct !DISubprogram(name: "y", scope: !3, file: !3, line: 8, type: !13, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "_n", scope: !18, file: !3, line: 9, type: !15, isLocal: true, isDefinition: true)
!18 = distinct !DISubprogram(name: "z", scope: !3, file: !3, line: 9, type: !13, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!23 = !DILocalVariable(name: "i", arg: 1, scope: !2, file: !3, line: 7, type: !6)
!24 = !DILocation(line: 0, scope: !2)
!25 = !DILocation(line: 7, column: 1, scope: !2)
!26 = !DILocalVariable(name: "i", arg: 1, scope: !12, file: !3, line: 8, type: !15)
!27 = !DILocation(line: 0, scope: !12)
!28 = !DILocation(line: 8, column: 1, scope: !12)
!29 = !DILocalVariable(name: "i", arg: 1, scope: !18, file: !3, line: 9, type: !15)
!30 = !DILocation(line: 0, scope: !18)
!31 = !DILocation(line: 9, column: 1, scope: !18)
!32 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 11, type: !33, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!33 = !DISubroutineType(types: !34)
!34 = !{!15}
!35 = !DILocation(line: 12, column: 21, scope: !32)
!36 = !DILocation(line: 12, column: 5, scope: !32)
!37 = !DILocation(line: 13, column: 21, scope: !32)
!38 = !DILocation(line: 13, column: 5, scope: !32)
!39 = !DILocation(line: 14, column: 21, scope: !32)
!40 = !DILocation(line: 14, column: 5, scope: !32)
!41 = !DILocation(line: 15, column: 21, scope: !32)
!42 = !DILocation(line: 15, column: 5, scope: !32)
!43 = !DILocation(line: 16, column: 21, scope: !32)
!44 = !DILocation(line: 16, column: 5, scope: !32)
!45 = !DILocation(line: 17, column: 5, scope: !32)
