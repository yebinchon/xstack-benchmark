; ModuleID = 'formatted-numeric-output.c'
source_filename = "formatted-numeric-output.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c" %9.3f\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c" %-9.3f\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c" %09.3f\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c" %-09.3f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %r = alloca float, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata float* %r, metadata !11, metadata !DIExpression()), !dbg !13
  store float 7.125000e+00, float* %r, align 4, !dbg !13
  %0 = load float, float* %r, align 4, !dbg !14
  %fneg = fneg float %0, !dbg !15
  %conv = fpext float %fneg to double, !dbg !15
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %conv), !dbg !16
  %1 = load float, float* %r, align 4, !dbg !17
  %conv1 = fpext float %1 to double, !dbg !17
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %conv1), !dbg !18
  %2 = load float, float* %r, align 4, !dbg !19
  %conv3 = fpext float %2 to double, !dbg !19
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), double %conv3), !dbg !20
  %3 = load float, float* %r, align 4, !dbg !21
  %fneg5 = fneg float %3, !dbg !22
  %conv6 = fpext float %fneg5 to double, !dbg !22
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), double %conv6), !dbg !23
  %4 = load float, float* %r, align 4, !dbg !24
  %conv8 = fpext float %4 to double, !dbg !24
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), double %conv8), !dbg !25
  %5 = load float, float* %r, align 4, !dbg !26
  %conv10 = fpext float %5 to double, !dbg !26
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), double %conv10), !dbg !27
  ret i32 0, !dbg !28
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "formatted-numeric-output.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Formatted-numeric-output")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 2, type: !8, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 3, type: !12)
!12 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!13 = !DILocation(line: 3, column: 9, scope: !7)
!14 = !DILocation(line: 4, column: 22, scope: !7)
!15 = !DILocation(line: 4, column: 21, scope: !7)
!16 = !DILocation(line: 4, column: 3, scope: !7)
!17 = !DILocation(line: 5, column: 21, scope: !7)
!18 = !DILocation(line: 5, column: 3, scope: !7)
!19 = !DILocation(line: 6, column: 22, scope: !7)
!20 = !DILocation(line: 6, column: 3, scope: !7)
!21 = !DILocation(line: 7, column: 23, scope: !7)
!22 = !DILocation(line: 7, column: 22, scope: !7)
!23 = !DILocation(line: 7, column: 3, scope: !7)
!24 = !DILocation(line: 8, column: 22, scope: !7)
!25 = !DILocation(line: 8, column: 3, scope: !7)
!26 = !DILocation(line: 9, column: 23, scope: !7)
!27 = !DILocation(line: 9, column: 3, scope: !7)
!28 = !DILocation(line: 10, column: 3, scope: !7)
