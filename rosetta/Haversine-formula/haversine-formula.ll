; ModuleID = 'haversine-formula.c'
source_filename = "haversine-formula.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"dist: %.1f km (%.1f mi.)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @dist(double %th1, double %ph1, double %th2, double %ph2) #0 !dbg !7 {
entry:
  %th1.addr = alloca double, align 8
  %ph1.addr = alloca double, align 8
  %th2.addr = alloca double, align 8
  %ph2.addr = alloca double, align 8
  %dx = alloca double, align 8
  %dy = alloca double, align 8
  %dz = alloca double, align 8
  store double %th1, double* %th1.addr, align 8
  call void @llvm.dbg.declare(metadata double* %th1.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store double %ph1, double* %ph1.addr, align 8
  call void @llvm.dbg.declare(metadata double* %ph1.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store double %th2, double* %th2.addr, align 8
  call void @llvm.dbg.declare(metadata double* %th2.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store double %ph2, double* %ph2.addr, align 8
  call void @llvm.dbg.declare(metadata double* %ph2.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata double* %dx, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata double* %dy, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata double* %dz, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load double, double* %ph2.addr, align 8, !dbg !25
  %1 = load double, double* %ph1.addr, align 8, !dbg !26
  %sub = fsub double %1, %0, !dbg !26
  store double %sub, double* %ph1.addr, align 8, !dbg !26
  %2 = load double, double* %ph1.addr, align 8, !dbg !27
  %mul = fmul double %2, 0x3F91DF46A252DD11, !dbg !27
  store double %mul, double* %ph1.addr, align 8, !dbg !27
  %3 = load double, double* %th1.addr, align 8, !dbg !28
  %mul1 = fmul double %3, 0x3F91DF46A252DD11, !dbg !28
  store double %mul1, double* %th1.addr, align 8, !dbg !28
  %4 = load double, double* %th2.addr, align 8, !dbg !29
  %mul2 = fmul double %4, 0x3F91DF46A252DD11, !dbg !29
  store double %mul2, double* %th2.addr, align 8, !dbg !29
  %5 = load double, double* %th1.addr, align 8, !dbg !30
  %call = call double @sin(double %5) #4, !dbg !31
  %6 = load double, double* %th2.addr, align 8, !dbg !32
  %call3 = call double @sin(double %6) #4, !dbg !33
  %sub4 = fsub double %call, %call3, !dbg !34
  store double %sub4, double* %dz, align 8, !dbg !35
  %7 = load double, double* %ph1.addr, align 8, !dbg !36
  %call5 = call double @cos(double %7) #4, !dbg !37
  %8 = load double, double* %th1.addr, align 8, !dbg !38
  %call6 = call double @cos(double %8) #4, !dbg !39
  %mul7 = fmul double %call5, %call6, !dbg !40
  %9 = load double, double* %th2.addr, align 8, !dbg !41
  %call8 = call double @cos(double %9) #4, !dbg !42
  %sub9 = fsub double %mul7, %call8, !dbg !43
  store double %sub9, double* %dx, align 8, !dbg !44
  %10 = load double, double* %ph1.addr, align 8, !dbg !45
  %call10 = call double @sin(double %10) #4, !dbg !46
  %11 = load double, double* %th1.addr, align 8, !dbg !47
  %call11 = call double @cos(double %11) #4, !dbg !48
  %mul12 = fmul double %call10, %call11, !dbg !49
  store double %mul12, double* %dy, align 8, !dbg !50
  %12 = load double, double* %dx, align 8, !dbg !51
  %13 = load double, double* %dx, align 8, !dbg !52
  %mul13 = fmul double %12, %13, !dbg !53
  %14 = load double, double* %dy, align 8, !dbg !54
  %15 = load double, double* %dy, align 8, !dbg !55
  %mul14 = fmul double %14, %15, !dbg !56
  %add = fadd double %mul13, %mul14, !dbg !57
  %16 = load double, double* %dz, align 8, !dbg !58
  %17 = load double, double* %dz, align 8, !dbg !59
  %mul15 = fmul double %16, %17, !dbg !60
  %add16 = fadd double %add, %mul15, !dbg !61
  %call17 = call double @sqrt(double %add16) #4, !dbg !62
  %div = fdiv double %call17, 2.000000e+00, !dbg !63
  %call18 = call double @asin(double %div) #4, !dbg !64
  %mul19 = fmul double %call18, 2.000000e+00, !dbg !65
  %mul20 = fmul double %mul19, 6.371000e+03, !dbg !66
  ret double %mul20, !dbg !67
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sin(double) #2

; Function Attrs: nounwind
declare dso_local double @cos(double) #2

; Function Attrs: nounwind
declare dso_local double @asin(double) #2

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %d = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata double* %d, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call double @dist(double 3.612000e+01, double -8.667000e+01, double 3.394000e+01, double -1.184000e+02), !dbg !74
  store double %call, double* %d, align 8, !dbg !73
  %0 = load double, double* %d, align 8, !dbg !75
  %1 = load double, double* %d, align 8, !dbg !76
  %div = fdiv double %1, 0x3FF9BFDF7E8038A0, !dbg !77
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0), double %0, double %div), !dbg !78
  ret i32 0, !dbg !79
}

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "haversine-formula.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Haversine-formula")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "dist", scope: !1, file: !1, line: 7, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10, !10, !10}
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DILocalVariable(name: "th1", arg: 1, scope: !7, file: !1, line: 7, type: !10)
!12 = !DILocation(line: 7, column: 20, scope: !7)
!13 = !DILocalVariable(name: "ph1", arg: 2, scope: !7, file: !1, line: 7, type: !10)
!14 = !DILocation(line: 7, column: 32, scope: !7)
!15 = !DILocalVariable(name: "th2", arg: 3, scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocation(line: 7, column: 44, scope: !7)
!17 = !DILocalVariable(name: "ph2", arg: 4, scope: !7, file: !1, line: 7, type: !10)
!18 = !DILocation(line: 7, column: 56, scope: !7)
!19 = !DILocalVariable(name: "dx", scope: !7, file: !1, line: 9, type: !10)
!20 = !DILocation(line: 9, column: 9, scope: !7)
!21 = !DILocalVariable(name: "dy", scope: !7, file: !1, line: 9, type: !10)
!22 = !DILocation(line: 9, column: 13, scope: !7)
!23 = !DILocalVariable(name: "dz", scope: !7, file: !1, line: 9, type: !10)
!24 = !DILocation(line: 9, column: 17, scope: !7)
!25 = !DILocation(line: 10, column: 9, scope: !7)
!26 = !DILocation(line: 10, column: 6, scope: !7)
!27 = !DILocation(line: 11, column: 6, scope: !7)
!28 = !DILocation(line: 11, column: 21, scope: !7)
!29 = !DILocation(line: 11, column: 36, scope: !7)
!30 = !DILocation(line: 13, column: 11, scope: !7)
!31 = !DILocation(line: 13, column: 7, scope: !7)
!32 = !DILocation(line: 13, column: 22, scope: !7)
!33 = !DILocation(line: 13, column: 18, scope: !7)
!34 = !DILocation(line: 13, column: 16, scope: !7)
!35 = !DILocation(line: 13, column: 5, scope: !7)
!36 = !DILocation(line: 14, column: 11, scope: !7)
!37 = !DILocation(line: 14, column: 7, scope: !7)
!38 = !DILocation(line: 14, column: 22, scope: !7)
!39 = !DILocation(line: 14, column: 18, scope: !7)
!40 = !DILocation(line: 14, column: 16, scope: !7)
!41 = !DILocation(line: 14, column: 33, scope: !7)
!42 = !DILocation(line: 14, column: 29, scope: !7)
!43 = !DILocation(line: 14, column: 27, scope: !7)
!44 = !DILocation(line: 14, column: 5, scope: !7)
!45 = !DILocation(line: 15, column: 11, scope: !7)
!46 = !DILocation(line: 15, column: 7, scope: !7)
!47 = !DILocation(line: 15, column: 22, scope: !7)
!48 = !DILocation(line: 15, column: 18, scope: !7)
!49 = !DILocation(line: 15, column: 16, scope: !7)
!50 = !DILocation(line: 15, column: 5, scope: !7)
!51 = !DILocation(line: 16, column: 19, scope: !7)
!52 = !DILocation(line: 16, column: 24, scope: !7)
!53 = !DILocation(line: 16, column: 22, scope: !7)
!54 = !DILocation(line: 16, column: 29, scope: !7)
!55 = !DILocation(line: 16, column: 34, scope: !7)
!56 = !DILocation(line: 16, column: 32, scope: !7)
!57 = !DILocation(line: 16, column: 27, scope: !7)
!58 = !DILocation(line: 16, column: 39, scope: !7)
!59 = !DILocation(line: 16, column: 44, scope: !7)
!60 = !DILocation(line: 16, column: 42, scope: !7)
!61 = !DILocation(line: 16, column: 37, scope: !7)
!62 = !DILocation(line: 16, column: 14, scope: !7)
!63 = !DILocation(line: 16, column: 48, scope: !7)
!64 = !DILocation(line: 16, column: 9, scope: !7)
!65 = !DILocation(line: 16, column: 53, scope: !7)
!66 = !DILocation(line: 16, column: 57, scope: !7)
!67 = !DILocation(line: 16, column: 2, scope: !7)
!68 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 19, type: !69, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!71}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocalVariable(name: "d", scope: !68, file: !1, line: 21, type: !10)
!73 = !DILocation(line: 21, column: 9, scope: !68)
!74 = !DILocation(line: 21, column: 13, scope: !68)
!75 = !DILocation(line: 23, column: 39, scope: !68)
!76 = !DILocation(line: 23, column: 42, scope: !68)
!77 = !DILocation(line: 23, column: 44, scope: !68)
!78 = !DILocation(line: 23, column: 2, scope: !68)
!79 = !DILocation(line: 25, column: 2, scope: !68)
