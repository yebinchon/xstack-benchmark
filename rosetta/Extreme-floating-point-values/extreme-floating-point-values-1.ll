; ModuleID = 'extreme-floating-point-values-1.c'
source_filename = "extreme-floating-point-values-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"positive infinity: %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"negative infinity: %f\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"negative zero: %f\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"not a number: %f\0A\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"+inf + 2.0 = %f\0A\00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"+inf - 10.1 = %f\0A\00", align 1
@.str.6 = private unnamed_addr constant [18 x i8] c"+inf + -inf = %f\0A\00", align 1
@.str.7 = private unnamed_addr constant [17 x i8] c"0.0 * +inf = %f\0A\00", align 1
@.str.8 = private unnamed_addr constant [15 x i8] c"1.0/-0.0 = %f\0A\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"NaN + 1.0 = %f\0A\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"NaN + NaN = %f\0A\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"NaN == NaN = %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.14 = private unnamed_addr constant [18 x i8] c"0.0 == -0.0 = %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %inf = alloca double, align 8
  %minus_inf = alloca double, align 8
  %minus_zero = alloca double, align 8
  %nan = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata double* %inf, metadata !11, metadata !DIExpression()), !dbg !13
  store double 0x7FF0000000000000, double* %inf, align 8, !dbg !13
  call void @llvm.dbg.declare(metadata double* %minus_inf, metadata !14, metadata !DIExpression()), !dbg !15
  store double 0xFFF0000000000000, double* %minus_inf, align 8, !dbg !15
  call void @llvm.dbg.declare(metadata double* %minus_zero, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load double, double* %inf, align 8, !dbg !18
  %div = fdiv double -1.000000e+00, %0, !dbg !19
  store double %div, double* %minus_zero, align 8, !dbg !17
  call void @llvm.dbg.declare(metadata double* %nan, metadata !20, metadata !DIExpression()), !dbg !21
  store double 0x7FF8000000000000, double* %nan, align 8, !dbg !21
  %1 = load double, double* %inf, align 8, !dbg !22
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), double %1), !dbg !23
  %2 = load double, double* %minus_inf, align 8, !dbg !24
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), double %2), !dbg !25
  %3 = load double, double* %minus_zero, align 8, !dbg !26
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0), double %3), !dbg !27
  %4 = load double, double* %nan, align 8, !dbg !28
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0), double %4), !dbg !29
  %5 = load double, double* %inf, align 8, !dbg !30
  %add = fadd double %5, 2.000000e+00, !dbg !31
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0), double %add), !dbg !32
  %6 = load double, double* %inf, align 8, !dbg !33
  %sub = fsub double %6, 1.010000e+01, !dbg !34
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5, i64 0, i64 0), double %sub), !dbg !35
  %7 = load double, double* %inf, align 8, !dbg !36
  %8 = load double, double* %minus_inf, align 8, !dbg !37
  %add6 = fadd double %7, %8, !dbg !38
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.6, i64 0, i64 0), double %add6), !dbg !39
  %9 = load double, double* %inf, align 8, !dbg !40
  %mul = fmul double 0.000000e+00, %9, !dbg !41
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.7, i64 0, i64 0), double %mul), !dbg !42
  %10 = load double, double* %minus_zero, align 8, !dbg !43
  %div9 = fdiv double 1.000000e+00, %10, !dbg !44
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.8, i64 0, i64 0), double %div9), !dbg !45
  %11 = load double, double* %nan, align 8, !dbg !46
  %add11 = fadd double %11, 1.000000e+00, !dbg !47
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i64 0, i64 0), double %add11), !dbg !48
  %12 = load double, double* %nan, align 8, !dbg !49
  %13 = load double, double* %nan, align 8, !dbg !50
  %add13 = fadd double %12, %13, !dbg !51
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i64 0, i64 0), double %add13), !dbg !52
  %14 = load double, double* %nan, align 8, !dbg !53
  %15 = load double, double* %nan, align 8, !dbg !54
  %cmp = fcmp oeq double %14, %15, !dbg !55
  %16 = zext i1 %cmp to i64, !dbg !53
  %cond = select i1 %cmp, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i64 0, i64 0), !dbg !53
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i64 0, i64 0), i8* %cond), !dbg !56
  %17 = load double, double* %minus_zero, align 8, !dbg !57
  %cmp16 = fcmp oeq double 0.000000e+00, %17, !dbg !58
  %18 = zext i1 %cmp16 to i64, !dbg !59
  %cond17 = select i1 %cmp16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i64 0, i64 0), !dbg !59
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.14, i64 0, i64 0), i8* %cond17), !dbg !60
  ret i32 0, !dbg !61
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
!1 = !DIFile(filename: "extreme-floating-point-values-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Extreme-floating-point-values")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "inf", scope: !7, file: !1, line: 5, type: !12)
!12 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!13 = !DILocation(line: 5, column: 12, scope: !7)
!14 = !DILocalVariable(name: "minus_inf", scope: !7, file: !1, line: 6, type: !12)
!15 = !DILocation(line: 6, column: 12, scope: !7)
!16 = !DILocalVariable(name: "minus_zero", scope: !7, file: !1, line: 7, type: !12)
!17 = !DILocation(line: 7, column: 12, scope: !7)
!18 = !DILocation(line: 7, column: 29, scope: !7)
!19 = !DILocation(line: 7, column: 27, scope: !7)
!20 = !DILocalVariable(name: "nan", scope: !7, file: !1, line: 8, type: !12)
!21 = !DILocation(line: 8, column: 12, scope: !7)
!22 = !DILocation(line: 10, column: 38, scope: !7)
!23 = !DILocation(line: 10, column: 5, scope: !7)
!24 = !DILocation(line: 11, column: 38, scope: !7)
!25 = !DILocation(line: 11, column: 5, scope: !7)
!26 = !DILocation(line: 12, column: 34, scope: !7)
!27 = !DILocation(line: 12, column: 5, scope: !7)
!28 = !DILocation(line: 13, column: 33, scope: !7)
!29 = !DILocation(line: 13, column: 5, scope: !7)
!30 = !DILocation(line: 17, column: 32, scope: !7)
!31 = !DILocation(line: 17, column: 36, scope: !7)
!32 = !DILocation(line: 17, column: 5, scope: !7)
!33 = !DILocation(line: 18, column: 33, scope: !7)
!34 = !DILocation(line: 18, column: 37, scope: !7)
!35 = !DILocation(line: 18, column: 5, scope: !7)
!36 = !DILocation(line: 19, column: 33, scope: !7)
!37 = !DILocation(line: 19, column: 39, scope: !7)
!38 = !DILocation(line: 19, column: 37, scope: !7)
!39 = !DILocation(line: 19, column: 5, scope: !7)
!40 = !DILocation(line: 20, column: 38, scope: !7)
!41 = !DILocation(line: 20, column: 36, scope: !7)
!42 = !DILocation(line: 20, column: 5, scope: !7)
!43 = !DILocation(line: 21, column: 34, scope: !7)
!44 = !DILocation(line: 21, column: 33, scope: !7)
!45 = !DILocation(line: 21, column: 5, scope: !7)
!46 = !DILocation(line: 22, column: 31, scope: !7)
!47 = !DILocation(line: 22, column: 35, scope: !7)
!48 = !DILocation(line: 22, column: 5, scope: !7)
!49 = !DILocation(line: 23, column: 31, scope: !7)
!50 = !DILocation(line: 23, column: 37, scope: !7)
!51 = !DILocation(line: 23, column: 35, scope: !7)
!52 = !DILocation(line: 23, column: 5, scope: !7)
!53 = !DILocation(line: 27, column: 32, scope: !7)
!54 = !DILocation(line: 27, column: 39, scope: !7)
!55 = !DILocation(line: 27, column: 36, scope: !7)
!56 = !DILocation(line: 27, column: 5, scope: !7)
!57 = !DILocation(line: 28, column: 40, scope: !7)
!58 = !DILocation(line: 28, column: 37, scope: !7)
!59 = !DILocation(line: 28, column: 33, scope: !7)
!60 = !DILocation(line: 28, column: 5, scope: !7)
!61 = !DILocation(line: 30, column: 5, scope: !7)
