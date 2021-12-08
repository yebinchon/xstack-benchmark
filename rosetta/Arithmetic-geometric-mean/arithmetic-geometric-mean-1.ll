; ModuleID = 'arithmetic-geometric-mean-1.ll'
source_filename = "arithmetic-geometric-mean-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [48 x i8] c"arithmetic-geometric mean undefined when x*y<0\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"Enter two numbers: \00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"%lf%lf\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"The arithmetic-geometric mean is %lf\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @agm(double %a, double %g) #0 !dbg !7 {
entry:
  %a.addr = alloca double, align 8
  %g.addr = alloca double, align 8
  %iota = alloca double, align 8
  %a1 = alloca double, align 8
  %g1 = alloca double, align 8
  store double %a, double* %a.addr, align 8
  call void @llvm.dbg.declare(metadata double* %a.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store double %g, double* %g.addr, align 8
  call void @llvm.dbg.declare(metadata double* %g.addr, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata double* %iota, metadata !15, metadata !DIExpression()), !dbg !16
  store double 0x3C9CD2B297D889BC, double* %iota, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata double* %a1, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata double* %g1, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load double, double* %a.addr, align 8, !dbg !21
  %1 = load double, double* %g.addr, align 8, !dbg !23
  %mul = fmul double %0, %1, !dbg !24
  %cmp = fcmp olt double %mul, 0.000000e+00, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i64 0, i64 0)), !dbg !27
  call void @exit(i32 1) #5, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !30

while.cond:                                       ; preds = %while.body, %if.end
  %2 = load double, double* %a.addr, align 8, !dbg !31
  %3 = load double, double* %g.addr, align 8, !dbg !32
  %sub = fsub double %2, %3, !dbg !33
  %4 = call double @llvm.fabs.f64(double %sub), !dbg !34
  %5 = load double, double* %iota, align 8, !dbg !35
  %cmp1 = fcmp ogt double %4, %5, !dbg !36
  br i1 %cmp1, label %while.body, label %while.end, !dbg !30

while.body:                                       ; preds = %while.cond
  %6 = load double, double* %a.addr, align 8, !dbg !37
  %7 = load double, double* %g.addr, align 8, !dbg !39
  %add = fadd double %6, %7, !dbg !40
  %div = fdiv double %add, 2.000000e+00, !dbg !41
  store double %div, double* %a1, align 8, !dbg !42
  %8 = load double, double* %a.addr, align 8, !dbg !43
  %9 = load double, double* %g.addr, align 8, !dbg !44
  %mul2 = fmul double %8, %9, !dbg !45
  %call3 = call double @sqrt(double %mul2) #6, !dbg !46
  store double %call3, double* %g1, align 8, !dbg !47
  %10 = load double, double* %a1, align 8, !dbg !48
  store double %10, double* %a.addr, align 8, !dbg !49
  %11 = load double, double* %g1, align 8, !dbg !50
  store double %11, double* %g.addr, align 8, !dbg !51
  br label %while.cond, !dbg !30, !llvm.loop !52

while.end:                                        ; preds = %while.cond
  %12 = load double, double* %a.addr, align 8, !dbg !54
  ret double %12, !dbg !55
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata double* %x, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata double* %y, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), double* %x, double* %y), !dbg !65
  %0 = load double, double* %x, align 8, !dbg !66
  %1 = load double, double* %y, align 8, !dbg !67
  %call2 = call double @agm(double %0, double %1), !dbg !68
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i64 0, i64 0), double %call2), !dbg !69
  ret i32 0, !dbg !70
}

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "arithmetic-geometric-mean-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arithmetic-geometric-mean")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "agm", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 20, scope: !7)
!13 = !DILocalVariable(name: "g", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 5, column: 30, scope: !7)
!15 = !DILocalVariable(name: "iota", scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocation(line: 7, column: 11, scope: !7)
!17 = !DILocalVariable(name: "a1", scope: !7, file: !1, line: 8, type: !10)
!18 = !DILocation(line: 8, column: 11, scope: !7)
!19 = !DILocalVariable(name: "g1", scope: !7, file: !1, line: 8, type: !10)
!20 = !DILocation(line: 8, column: 15, scope: !7)
!21 = !DILocation(line: 10, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 8)
!23 = !DILocation(line: 10, column: 10, scope: !22)
!24 = !DILocation(line: 10, column: 9, scope: !22)
!25 = !DILocation(line: 10, column: 12, scope: !22)
!26 = !DILocation(line: 10, column: 8, scope: !7)
!27 = !DILocation(line: 11, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !1, line: 10, column: 20)
!29 = !DILocation(line: 12, column: 7, scope: !28)
!30 = !DILocation(line: 15, column: 4, scope: !7)
!31 = !DILocation(line: 15, column: 16, scope: !7)
!32 = !DILocation(line: 15, column: 18, scope: !7)
!33 = !DILocation(line: 15, column: 17, scope: !7)
!34 = !DILocation(line: 15, column: 11, scope: !7)
!35 = !DILocation(line: 15, column: 21, scope: !7)
!36 = !DILocation(line: 15, column: 20, scope: !7)
!37 = !DILocation(line: 16, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !7, file: !1, line: 15, column: 28)
!39 = !DILocation(line: 16, column: 17, scope: !38)
!40 = !DILocation(line: 16, column: 15, scope: !38)
!41 = !DILocation(line: 16, column: 20, scope: !38)
!42 = !DILocation(line: 16, column: 10, scope: !38)
!43 = !DILocation(line: 17, column: 17, scope: !38)
!44 = !DILocation(line: 17, column: 21, scope: !38)
!45 = !DILocation(line: 17, column: 19, scope: !38)
!46 = !DILocation(line: 17, column: 12, scope: !38)
!47 = !DILocation(line: 17, column: 10, scope: !38)
!48 = !DILocation(line: 19, column: 11, scope: !38)
!49 = !DILocation(line: 19, column: 9, scope: !38)
!50 = !DILocation(line: 20, column: 11, scope: !38)
!51 = !DILocation(line: 20, column: 9, scope: !38)
!52 = distinct !{!52, !30, !53}
!53 = !DILocation(line: 21, column: 4, scope: !7)
!54 = !DILocation(line: 23, column: 11, scope: !7)
!55 = !DILocation(line: 23, column: 4, scope: !7)
!56 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 26, type: !57, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DILocalVariable(name: "x", scope: !56, file: !1, line: 27, type: !10)
!61 = !DILocation(line: 27, column: 11, scope: !56)
!62 = !DILocalVariable(name: "y", scope: !56, file: !1, line: 27, type: !10)
!63 = !DILocation(line: 27, column: 14, scope: !56)
!64 = !DILocation(line: 28, column: 4, scope: !56)
!65 = !DILocation(line: 29, column: 4, scope: !56)
!66 = !DILocation(line: 30, column: 58, scope: !56)
!67 = !DILocation(line: 30, column: 61, scope: !56)
!68 = !DILocation(line: 30, column: 54, scope: !56)
!69 = !DILocation(line: 30, column: 4, scope: !56)
!70 = !DILocation(line: 31, column: 4, scope: !56)
