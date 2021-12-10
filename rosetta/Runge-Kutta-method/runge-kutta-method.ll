; ModuleID = 'runge-kutta-method.bc'
source_filename = "runge-kutta-method.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"x\09y\09rel. err.\0A------------\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"%g\09%g\09%g\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @rk4(double (double, double)* %f, double %dx, double %x, double %y) #0 !dbg !10 {
entry:
  %f.addr = alloca double (double, double)*, align 8
  %dx.addr = alloca double, align 8
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %k1 = alloca double, align 8
  %k2 = alloca double, align 8
  %k3 = alloca double, align 8
  %k4 = alloca double, align 8
  store double (double, double)* %f, double (double, double)** %f.addr, align 8
  call void @llvm.dbg.declare(metadata double (double, double)** %f.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store double %dx, double* %dx.addr, align 8
  call void @llvm.dbg.declare(metadata double* %dx.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata double* %k1, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load double, double* %dx.addr, align 8, !dbg !26
  %1 = load double (double, double)*, double (double, double)** %f.addr, align 8, !dbg !27
  %2 = load double, double* %x.addr, align 8, !dbg !28
  %3 = load double, double* %y.addr, align 8, !dbg !29
  %call = call double %1(double %2, double %3), !dbg !27
  %mul = fmul double %0, %call, !dbg !30
  store double %mul, double* %k1, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata double* %k2, metadata !31, metadata !DIExpression()), !dbg !32
  %4 = load double, double* %dx.addr, align 8, !dbg !33
  %5 = load double (double, double)*, double (double, double)** %f.addr, align 8, !dbg !34
  %6 = load double, double* %x.addr, align 8, !dbg !35
  %7 = load double, double* %dx.addr, align 8, !dbg !36
  %div = fdiv double %7, 2.000000e+00, !dbg !37
  %add = fadd double %6, %div, !dbg !38
  %8 = load double, double* %y.addr, align 8, !dbg !39
  %9 = load double, double* %k1, align 8, !dbg !40
  %div1 = fdiv double %9, 2.000000e+00, !dbg !41
  %add2 = fadd double %8, %div1, !dbg !42
  %call3 = call double %5(double %add, double %add2), !dbg !34
  %mul4 = fmul double %4, %call3, !dbg !43
  store double %mul4, double* %k2, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata double* %k3, metadata !44, metadata !DIExpression()), !dbg !45
  %10 = load double, double* %dx.addr, align 8, !dbg !46
  %11 = load double (double, double)*, double (double, double)** %f.addr, align 8, !dbg !47
  %12 = load double, double* %x.addr, align 8, !dbg !48
  %13 = load double, double* %dx.addr, align 8, !dbg !49
  %div5 = fdiv double %13, 2.000000e+00, !dbg !50
  %add6 = fadd double %12, %div5, !dbg !51
  %14 = load double, double* %y.addr, align 8, !dbg !52
  %15 = load double, double* %k2, align 8, !dbg !53
  %div7 = fdiv double %15, 2.000000e+00, !dbg !54
  %add8 = fadd double %14, %div7, !dbg !55
  %call9 = call double %11(double %add6, double %add8), !dbg !47
  %mul10 = fmul double %10, %call9, !dbg !56
  store double %mul10, double* %k3, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata double* %k4, metadata !57, metadata !DIExpression()), !dbg !58
  %16 = load double, double* %dx.addr, align 8, !dbg !59
  %17 = load double (double, double)*, double (double, double)** %f.addr, align 8, !dbg !60
  %18 = load double, double* %x.addr, align 8, !dbg !61
  %19 = load double, double* %dx.addr, align 8, !dbg !62
  %add11 = fadd double %18, %19, !dbg !63
  %20 = load double, double* %y.addr, align 8, !dbg !64
  %21 = load double, double* %k3, align 8, !dbg !65
  %add12 = fadd double %20, %21, !dbg !66
  %call13 = call double %17(double %add11, double %add12), !dbg !60
  %mul14 = fmul double %16, %call13, !dbg !67
  store double %mul14, double* %k4, align 8, !dbg !58
  %22 = load double, double* %y.addr, align 8, !dbg !68
  %23 = load double, double* %k1, align 8, !dbg !69
  %24 = load double, double* %k2, align 8, !dbg !70
  %mul15 = fmul double 2.000000e+00, %24, !dbg !71
  %add16 = fadd double %23, %mul15, !dbg !72
  %25 = load double, double* %k3, align 8, !dbg !73
  %mul17 = fmul double 2.000000e+00, %25, !dbg !74
  %add18 = fadd double %add16, %mul17, !dbg !75
  %26 = load double, double* %k4, align 8, !dbg !76
  %add19 = fadd double %add18, %26, !dbg !77
  %div20 = fdiv double %add19, 6.000000e+00, !dbg !78
  %add21 = fadd double %22, %div20, !dbg !79
  ret double %add21, !dbg !80
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @rate(double %x, double %y) #0 !dbg !81 {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = load double, double* %x.addr, align 8, !dbg !86
  %1 = load double, double* %y.addr, align 8, !dbg !87
  %call = call double @sqrt(double %1) #4, !dbg !88
  %mul = fmul double %0, %call, !dbg !89
  ret double %mul, !dbg !90
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %y = alloca double*, align 8
  %x = alloca double, align 8
  %y2 = alloca double, align 8
  %x0 = alloca double, align 8
  %x1 = alloca double, align 8
  %dx = alloca double, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata double** %y, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata double* %x, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata double* %y2, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata double* %x0, metadata !101, metadata !DIExpression()), !dbg !102
  store double 0.000000e+00, double* %x0, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata double* %x1, metadata !103, metadata !DIExpression()), !dbg !104
  store double 1.000000e+01, double* %x1, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata double* %dx, metadata !105, metadata !DIExpression()), !dbg !106
  store double 1.000000e-01, double* %dx, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32* %i, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %n, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = load double, double* %x1, align 8, !dbg !111
  %1 = load double, double* %x0, align 8, !dbg !112
  %sub = fsub double %0, %1, !dbg !113
  %2 = load double, double* %dx, align 8, !dbg !114
  %div = fdiv double %sub, %2, !dbg !115
  %add = fadd double 1.000000e+00, %div, !dbg !116
  %conv = fptosi double %add to i32, !dbg !117
  store i32 %conv, i32* %n, align 4, !dbg !110
  %3 = load i32, i32* %n, align 4, !dbg !118
  %conv1 = sext i32 %3 to i64, !dbg !118
  %mul = mul i64 8, %conv1, !dbg !119
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !120
  %4 = bitcast i8* %call to double*, !dbg !121
  store double* %4, double** %y, align 8, !dbg !122
  %5 = load double*, double** %y, align 8, !dbg !123
  %arrayidx = getelementptr inbounds double, double* %5, i64 0, !dbg !123
  store double 1.000000e+00, double* %arrayidx, align 8, !dbg !125
  store i32 1, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %i, align 4, !dbg !127
  %7 = load i32, i32* %n, align 4, !dbg !129
  %cmp = icmp slt i32 %6, %7, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %8 = load double, double* %dx, align 8, !dbg !132
  %9 = load double, double* %x0, align 8, !dbg !133
  %10 = load double, double* %dx, align 8, !dbg !134
  %11 = load i32, i32* %i, align 4, !dbg !135
  %sub3 = sub nsw i32 %11, 1, !dbg !136
  %conv4 = sitofp i32 %sub3 to double, !dbg !137
  %mul5 = fmul double %10, %conv4, !dbg !138
  %add6 = fadd double %9, %mul5, !dbg !139
  %12 = load double*, double** %y, align 8, !dbg !140
  %13 = load i32, i32* %i, align 4, !dbg !141
  %sub7 = sub nsw i32 %13, 1, !dbg !142
  %idxprom = sext i32 %sub7 to i64, !dbg !140
  %arrayidx8 = getelementptr inbounds double, double* %12, i64 %idxprom, !dbg !140
  %14 = load double, double* %arrayidx8, align 8, !dbg !140
  %call9 = call double @rk4(double (double, double)* @rate, double %8, double %add6, double %14), !dbg !143
  %15 = load double*, double** %y, align 8, !dbg !144
  %16 = load i32, i32* %i, align 4, !dbg !145
  %idxprom10 = sext i32 %16 to i64, !dbg !144
  %arrayidx11 = getelementptr inbounds double, double* %15, i64 %idxprom10, !dbg !144
  store double %call9, double* %arrayidx11, align 8, !dbg !146
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !147
  %inc = add nsw i32 %17, 1, !dbg !147
  store i32 %inc, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0)), !dbg !151
  store i32 0, i32* %i, align 4, !dbg !152
  br label %for.cond13, !dbg !154

for.cond13:                                       ; preds = %for.inc31, %for.end
  %18 = load i32, i32* %i, align 4, !dbg !155
  %19 = load i32, i32* %n, align 4, !dbg !157
  %cmp14 = icmp slt i32 %18, %19, !dbg !158
  br i1 %cmp14, label %for.body16, label %for.end33, !dbg !159

for.body16:                                       ; preds = %for.cond13
  %20 = load double, double* %x0, align 8, !dbg !160
  %21 = load double, double* %dx, align 8, !dbg !162
  %22 = load i32, i32* %i, align 4, !dbg !163
  %conv17 = sitofp i32 %22 to double, !dbg !163
  %mul18 = fmul double %21, %conv17, !dbg !164
  %add19 = fadd double %20, %mul18, !dbg !165
  store double %add19, double* %x, align 8, !dbg !166
  %23 = load double, double* %x, align 8, !dbg !167
  %24 = load double, double* %x, align 8, !dbg !168
  %mul20 = fmul double %23, %24, !dbg !169
  %div21 = fdiv double %mul20, 4.000000e+00, !dbg !170
  %add22 = fadd double %div21, 1.000000e+00, !dbg !171
  %call23 = call double @pow(double %add22, double 2.000000e+00) #4, !dbg !172
  store double %call23, double* %y2, align 8, !dbg !173
  %25 = load double, double* %x, align 8, !dbg !174
  %26 = load double*, double** %y, align 8, !dbg !175
  %27 = load i32, i32* %i, align 4, !dbg !176
  %idxprom24 = sext i32 %27 to i64, !dbg !175
  %arrayidx25 = getelementptr inbounds double, double* %26, i64 %idxprom24, !dbg !175
  %28 = load double, double* %arrayidx25, align 8, !dbg !175
  %29 = load double*, double** %y, align 8, !dbg !177
  %30 = load i32, i32* %i, align 4, !dbg !178
  %idxprom26 = sext i32 %30 to i64, !dbg !177
  %arrayidx27 = getelementptr inbounds double, double* %29, i64 %idxprom26, !dbg !177
  %31 = load double, double* %arrayidx27, align 8, !dbg !177
  %32 = load double, double* %y2, align 8, !dbg !179
  %div28 = fdiv double %31, %32, !dbg !180
  %sub29 = fsub double %div28, 1.000000e+00, !dbg !181
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), double %25, double %28, double %sub29), !dbg !182
  br label %for.inc31, !dbg !183

for.inc31:                                        ; preds = %for.body16
  %33 = load i32, i32* %i, align 4, !dbg !184
  %add32 = add nsw i32 %33, 10, !dbg !184
  store i32 %add32, i32* %i, align 4, !dbg !184
  br label %for.cond13, !dbg !185, !llvm.loop !186

for.end33:                                        ; preds = %for.cond13
  ret i32 0, !dbg !188
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "runge-kutta-method.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Runge-Kutta-method")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = distinct !DISubprogram(name: "rk4", scope: !1, file: !1, line: 5, type: !11, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!5, !13, !5, !5, !5}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DISubroutineType(types: !15)
!15 = !{!5, !5, !5}
!16 = !DILocalVariable(name: "f", arg: 1, scope: !10, file: !1, line: 5, type: !13)
!17 = !DILocation(line: 5, column: 20, scope: !10)
!18 = !DILocalVariable(name: "dx", arg: 2, scope: !10, file: !1, line: 5, type: !5)
!19 = !DILocation(line: 5, column: 47, scope: !10)
!20 = !DILocalVariable(name: "x", arg: 3, scope: !10, file: !1, line: 5, type: !5)
!21 = !DILocation(line: 5, column: 58, scope: !10)
!22 = !DILocalVariable(name: "y", arg: 4, scope: !10, file: !1, line: 5, type: !5)
!23 = !DILocation(line: 5, column: 68, scope: !10)
!24 = !DILocalVariable(name: "k1", scope: !10, file: !1, line: 7, type: !5)
!25 = !DILocation(line: 7, column: 9, scope: !10)
!26 = !DILocation(line: 7, column: 14, scope: !10)
!27 = !DILocation(line: 7, column: 19, scope: !10)
!28 = !DILocation(line: 7, column: 21, scope: !10)
!29 = !DILocation(line: 7, column: 24, scope: !10)
!30 = !DILocation(line: 7, column: 17, scope: !10)
!31 = !DILocalVariable(name: "k2", scope: !10, file: !1, line: 8, type: !5)
!32 = !DILocation(line: 8, column: 3, scope: !10)
!33 = !DILocation(line: 8, column: 8, scope: !10)
!34 = !DILocation(line: 8, column: 13, scope: !10)
!35 = !DILocation(line: 8, column: 15, scope: !10)
!36 = !DILocation(line: 8, column: 19, scope: !10)
!37 = !DILocation(line: 8, column: 22, scope: !10)
!38 = !DILocation(line: 8, column: 17, scope: !10)
!39 = !DILocation(line: 8, column: 27, scope: !10)
!40 = !DILocation(line: 8, column: 31, scope: !10)
!41 = !DILocation(line: 8, column: 34, scope: !10)
!42 = !DILocation(line: 8, column: 29, scope: !10)
!43 = !DILocation(line: 8, column: 11, scope: !10)
!44 = !DILocalVariable(name: "k3", scope: !10, file: !1, line: 9, type: !5)
!45 = !DILocation(line: 9, column: 3, scope: !10)
!46 = !DILocation(line: 9, column: 8, scope: !10)
!47 = !DILocation(line: 9, column: 13, scope: !10)
!48 = !DILocation(line: 9, column: 15, scope: !10)
!49 = !DILocation(line: 9, column: 19, scope: !10)
!50 = !DILocation(line: 9, column: 22, scope: !10)
!51 = !DILocation(line: 9, column: 17, scope: !10)
!52 = !DILocation(line: 9, column: 27, scope: !10)
!53 = !DILocation(line: 9, column: 31, scope: !10)
!54 = !DILocation(line: 9, column: 34, scope: !10)
!55 = !DILocation(line: 9, column: 29, scope: !10)
!56 = !DILocation(line: 9, column: 11, scope: !10)
!57 = !DILocalVariable(name: "k4", scope: !10, file: !1, line: 10, type: !5)
!58 = !DILocation(line: 10, column: 3, scope: !10)
!59 = !DILocation(line: 10, column: 8, scope: !10)
!60 = !DILocation(line: 10, column: 13, scope: !10)
!61 = !DILocation(line: 10, column: 15, scope: !10)
!62 = !DILocation(line: 10, column: 19, scope: !10)
!63 = !DILocation(line: 10, column: 17, scope: !10)
!64 = !DILocation(line: 10, column: 23, scope: !10)
!65 = !DILocation(line: 10, column: 27, scope: !10)
!66 = !DILocation(line: 10, column: 25, scope: !10)
!67 = !DILocation(line: 10, column: 11, scope: !10)
!68 = !DILocation(line: 11, column: 9, scope: !10)
!69 = !DILocation(line: 11, column: 14, scope: !10)
!70 = !DILocation(line: 11, column: 23, scope: !10)
!71 = !DILocation(line: 11, column: 21, scope: !10)
!72 = !DILocation(line: 11, column: 17, scope: !10)
!73 = !DILocation(line: 11, column: 32, scope: !10)
!74 = !DILocation(line: 11, column: 30, scope: !10)
!75 = !DILocation(line: 11, column: 26, scope: !10)
!76 = !DILocation(line: 11, column: 37, scope: !10)
!77 = !DILocation(line: 11, column: 35, scope: !10)
!78 = !DILocation(line: 11, column: 41, scope: !10)
!79 = !DILocation(line: 11, column: 11, scope: !10)
!80 = !DILocation(line: 11, column: 2, scope: !10)
!81 = distinct !DISubprogram(name: "rate", scope: !1, file: !1, line: 14, type: !14, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "x", arg: 1, scope: !81, file: !1, line: 14, type: !5)
!83 = !DILocation(line: 14, column: 20, scope: !81)
!84 = !DILocalVariable(name: "y", arg: 2, scope: !81, file: !1, line: 14, type: !5)
!85 = !DILocation(line: 14, column: 30, scope: !81)
!86 = !DILocation(line: 16, column: 9, scope: !81)
!87 = !DILocation(line: 16, column: 18, scope: !81)
!88 = !DILocation(line: 16, column: 13, scope: !81)
!89 = !DILocation(line: 16, column: 11, scope: !81)
!90 = !DILocation(line: 16, column: 2, scope: !81)
!91 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 19, type: !92, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!94}
!94 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!95 = !DILocalVariable(name: "y", scope: !91, file: !1, line: 21, type: !4)
!96 = !DILocation(line: 21, column: 10, scope: !91)
!97 = !DILocalVariable(name: "x", scope: !91, file: !1, line: 21, type: !5)
!98 = !DILocation(line: 21, column: 13, scope: !91)
!99 = !DILocalVariable(name: "y2", scope: !91, file: !1, line: 21, type: !5)
!100 = !DILocation(line: 21, column: 16, scope: !91)
!101 = !DILocalVariable(name: "x0", scope: !91, file: !1, line: 22, type: !5)
!102 = !DILocation(line: 22, column: 9, scope: !91)
!103 = !DILocalVariable(name: "x1", scope: !91, file: !1, line: 22, type: !5)
!104 = !DILocation(line: 22, column: 17, scope: !91)
!105 = !DILocalVariable(name: "dx", scope: !91, file: !1, line: 22, type: !5)
!106 = !DILocation(line: 22, column: 26, scope: !91)
!107 = !DILocalVariable(name: "i", scope: !91, file: !1, line: 23, type: !94)
!108 = !DILocation(line: 23, column: 6, scope: !91)
!109 = !DILocalVariable(name: "n", scope: !91, file: !1, line: 23, type: !94)
!110 = !DILocation(line: 23, column: 9, scope: !91)
!111 = !DILocation(line: 23, column: 18, scope: !91)
!112 = !DILocation(line: 23, column: 23, scope: !91)
!113 = !DILocation(line: 23, column: 21, scope: !91)
!114 = !DILocation(line: 23, column: 27, scope: !91)
!115 = !DILocation(line: 23, column: 26, scope: !91)
!116 = !DILocation(line: 23, column: 15, scope: !91)
!117 = !DILocation(line: 23, column: 13, scope: !91)
!118 = !DILocation(line: 24, column: 40, scope: !91)
!119 = !DILocation(line: 24, column: 38, scope: !91)
!120 = !DILocation(line: 24, column: 16, scope: !91)
!121 = !DILocation(line: 24, column: 6, scope: !91)
!122 = !DILocation(line: 24, column: 4, scope: !91)
!123 = !DILocation(line: 26, column: 7, scope: !124)
!124 = distinct !DILexicalBlock(scope: !91, file: !1, line: 26, column: 2)
!125 = !DILocation(line: 26, column: 12, scope: !124)
!126 = !DILocation(line: 26, column: 19, scope: !124)
!127 = !DILocation(line: 26, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !1, line: 26, column: 2)
!129 = !DILocation(line: 26, column: 28, scope: !128)
!130 = !DILocation(line: 26, column: 26, scope: !128)
!131 = !DILocation(line: 26, column: 2, scope: !124)
!132 = !DILocation(line: 27, column: 20, scope: !128)
!133 = !DILocation(line: 27, column: 24, scope: !128)
!134 = !DILocation(line: 27, column: 29, scope: !128)
!135 = !DILocation(line: 27, column: 35, scope: !128)
!136 = !DILocation(line: 27, column: 37, scope: !128)
!137 = !DILocation(line: 27, column: 34, scope: !128)
!138 = !DILocation(line: 27, column: 32, scope: !128)
!139 = !DILocation(line: 27, column: 27, scope: !128)
!140 = !DILocation(line: 27, column: 43, scope: !128)
!141 = !DILocation(line: 27, column: 45, scope: !128)
!142 = !DILocation(line: 27, column: 46, scope: !128)
!143 = !DILocation(line: 27, column: 10, scope: !128)
!144 = !DILocation(line: 27, column: 3, scope: !128)
!145 = !DILocation(line: 27, column: 5, scope: !128)
!146 = !DILocation(line: 27, column: 8, scope: !128)
!147 = !DILocation(line: 26, column: 32, scope: !128)
!148 = !DILocation(line: 26, column: 2, scope: !128)
!149 = distinct !{!149, !131, !150}
!150 = !DILocation(line: 27, column: 49, scope: !124)
!151 = !DILocation(line: 29, column: 2, scope: !91)
!152 = !DILocation(line: 30, column: 9, scope: !153)
!153 = distinct !DILexicalBlock(scope: !91, file: !1, line: 30, column: 2)
!154 = !DILocation(line: 30, column: 7, scope: !153)
!155 = !DILocation(line: 30, column: 14, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !1, line: 30, column: 2)
!157 = !DILocation(line: 30, column: 18, scope: !156)
!158 = !DILocation(line: 30, column: 16, scope: !156)
!159 = !DILocation(line: 30, column: 2, scope: !153)
!160 = !DILocation(line: 31, column: 7, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !1, line: 30, column: 30)
!162 = !DILocation(line: 31, column: 12, scope: !161)
!163 = !DILocation(line: 31, column: 17, scope: !161)
!164 = !DILocation(line: 31, column: 15, scope: !161)
!165 = !DILocation(line: 31, column: 10, scope: !161)
!166 = !DILocation(line: 31, column: 5, scope: !161)
!167 = !DILocation(line: 32, column: 12, scope: !161)
!168 = !DILocation(line: 32, column: 16, scope: !161)
!169 = !DILocation(line: 32, column: 14, scope: !161)
!170 = !DILocation(line: 32, column: 18, scope: !161)
!171 = !DILocation(line: 32, column: 22, scope: !161)
!172 = !DILocation(line: 32, column: 8, scope: !161)
!173 = !DILocation(line: 32, column: 6, scope: !161)
!174 = !DILocation(line: 33, column: 26, scope: !161)
!175 = !DILocation(line: 33, column: 29, scope: !161)
!176 = !DILocation(line: 33, column: 31, scope: !161)
!177 = !DILocation(line: 33, column: 35, scope: !161)
!178 = !DILocation(line: 33, column: 37, scope: !161)
!179 = !DILocation(line: 33, column: 40, scope: !161)
!180 = !DILocation(line: 33, column: 39, scope: !161)
!181 = !DILocation(line: 33, column: 43, scope: !161)
!182 = !DILocation(line: 33, column: 3, scope: !161)
!183 = !DILocation(line: 34, column: 2, scope: !161)
!184 = !DILocation(line: 30, column: 23, scope: !156)
!185 = !DILocation(line: 30, column: 2, scope: !156)
!186 = distinct !{!186, !159, !187}
!187 = !DILocation(line: 34, column: 2, scope: !153)
!188 = !DILocation(line: 36, column: 2, scope: !91)
