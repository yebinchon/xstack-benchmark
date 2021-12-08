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
  call void @llvm.dbg.value(metadata double %a, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata double %g, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata double 0x3C9CD2B297D889BC, metadata !14, metadata !DIExpression()), !dbg !12
  %mul = fmul double %a, %g, !dbg !15
  %cmp = fcmp olt double %mul, 0.000000e+00, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !18

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i64 0, i64 0)), !dbg !19
  call void @exit(i32 1) #5, !dbg !21
  unreachable, !dbg !21

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !22

while.cond:                                       ; preds = %while.body, %if.end
  %g.addr.0 = phi double [ %g, %if.end ], [ %call3, %while.body ]
  %a.addr.0 = phi double [ %a, %if.end ], [ %div, %while.body ]
  call void @llvm.dbg.value(metadata double %a.addr.0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata double %g.addr.0, metadata !13, metadata !DIExpression()), !dbg !12
  %sub = fsub double %a.addr.0, %g.addr.0, !dbg !23
  %0 = call double @llvm.fabs.f64(double %sub), !dbg !24
  %cmp1 = fcmp ogt double %0, 0x3C9CD2B297D889BC, !dbg !25
  br i1 %cmp1, label %while.body, label %while.end, !dbg !22

while.body:                                       ; preds = %while.cond
  %add = fadd double %a.addr.0, %g.addr.0, !dbg !26
  %div = fdiv double %add, 2.000000e+00, !dbg !28
  call void @llvm.dbg.value(metadata double %div, metadata !29, metadata !DIExpression()), !dbg !12
  %mul2 = fmul double %a.addr.0, %g.addr.0, !dbg !30
  %call3 = call double @sqrt(double %mul2) #6, !dbg !31
  call void @llvm.dbg.value(metadata double %call3, metadata !32, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata double %div, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata double %call3, metadata !13, metadata !DIExpression()), !dbg !12
  br label %while.cond, !dbg !22, !llvm.loop !33

while.end:                                        ; preds = %while.cond
  ret double %a.addr.0, !dbg !35
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
define dso_local i32 @main() #0 !dbg !36 {
entry:
  %x = alloca double, align 8
  %y = alloca double, align 8
  call void @llvm.dbg.declare(metadata double* %x, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata double* %y, metadata !42, metadata !DIExpression()), !dbg !43
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0)), !dbg !44
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), double* %x, double* %y), !dbg !45
  %0 = load double, double* %x, align 8, !dbg !46
  %1 = load double, double* %y, align 8, !dbg !47
  %call2 = call double @agm(double %0, double %1), !dbg !48
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i64 0, i64 0), double %call2), !dbg !49
  ret i32 0, !dbg !50
}

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "g", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocalVariable(name: "iota", scope: !7, file: !1, line: 7, type: !10)
!15 = !DILocation(line: 10, column: 9, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 8)
!17 = !DILocation(line: 10, column: 12, scope: !16)
!18 = !DILocation(line: 10, column: 8, scope: !7)
!19 = !DILocation(line: 11, column: 7, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !1, line: 10, column: 20)
!21 = !DILocation(line: 12, column: 7, scope: !20)
!22 = !DILocation(line: 15, column: 4, scope: !7)
!23 = !DILocation(line: 15, column: 17, scope: !7)
!24 = !DILocation(line: 15, column: 11, scope: !7)
!25 = !DILocation(line: 15, column: 20, scope: !7)
!26 = !DILocation(line: 16, column: 15, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 15, column: 28)
!28 = !DILocation(line: 16, column: 20, scope: !27)
!29 = !DILocalVariable(name: "a1", scope: !7, file: !1, line: 8, type: !10)
!30 = !DILocation(line: 17, column: 19, scope: !27)
!31 = !DILocation(line: 17, column: 12, scope: !27)
!32 = !DILocalVariable(name: "g1", scope: !7, file: !1, line: 8, type: !10)
!33 = distinct !{!33, !22, !34}
!34 = !DILocation(line: 21, column: 4, scope: !7)
!35 = !DILocation(line: 23, column: 4, scope: !7)
!36 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 26, type: !37, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!39}
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DILocalVariable(name: "x", scope: !36, file: !1, line: 27, type: !10)
!41 = !DILocation(line: 27, column: 11, scope: !36)
!42 = !DILocalVariable(name: "y", scope: !36, file: !1, line: 27, type: !10)
!43 = !DILocation(line: 27, column: 14, scope: !36)
!44 = !DILocation(line: 28, column: 4, scope: !36)
!45 = !DILocation(line: 29, column: 4, scope: !36)
!46 = !DILocation(line: 30, column: 58, scope: !36)
!47 = !DILocation(line: 30, column: 61, scope: !36)
!48 = !DILocation(line: 30, column: 54, scope: !36)
!49 = !DILocation(line: 30, column: 4, scope: !36)
!50 = !DILocation(line: 31, column: 4, scope: !36)
