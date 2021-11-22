; ModuleID = 'averages-pythagorean-means.c'
source_filename = "averages-pythagorean-means.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Arithmetic mean = %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Geometric mean = %f\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Harmonic mean = %f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %f = alloca double, align 8
  %sum = alloca double, align 8
  %prod = alloca double, align 8
  %resum = alloca double, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %count, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %count, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata double* %f, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata double* %sum, metadata !25, metadata !DIExpression()), !dbg !26
  store double 0.000000e+00, double* %sum, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata double* %prod, metadata !27, metadata !DIExpression()), !dbg !28
  store double 1.000000e+00, double* %prod, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata double* %resum, metadata !29, metadata !DIExpression()), !dbg !30
  store double 0.000000e+00, double* %resum, align 8, !dbg !30
  store i32 1, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !34
  %1 = load i32, i32* %argc.addr, align 4, !dbg !36
  %cmp = icmp slt i32 %0, %1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !39
  %3 = load i32, i32* %i, align 4, !dbg !41
  %idxprom = sext i32 %3 to i64, !dbg !39
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 %idxprom, !dbg !39
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !39
  %call = call double @atof(i8* %4) #5, !dbg !42
  store double %call, double* %f, align 8, !dbg !43
  %5 = load i32, i32* %count, align 4, !dbg !44
  %inc = add nsw i32 %5, 1, !dbg !44
  store i32 %inc, i32* %count, align 4, !dbg !44
  %6 = load double, double* %f, align 8, !dbg !45
  %7 = load double, double* %sum, align 8, !dbg !46
  %add = fadd double %7, %6, !dbg !46
  store double %add, double* %sum, align 8, !dbg !46
  %8 = load double, double* %f, align 8, !dbg !47
  %9 = load double, double* %prod, align 8, !dbg !48
  %mul = fmul double %9, %8, !dbg !48
  store double %mul, double* %prod, align 8, !dbg !48
  %10 = load double, double* %f, align 8, !dbg !49
  %div = fdiv double 1.000000e+00, %10, !dbg !50
  %11 = load double, double* %resum, align 8, !dbg !51
  %add1 = fadd double %11, %div, !dbg !51
  store double %add1, double* %resum, align 8, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !53
  %inc2 = add nsw i32 %12, 1, !dbg !53
  store i32 %inc2, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %13 = load double, double* %sum, align 8, !dbg !57
  %14 = load i32, i32* %count, align 4, !dbg !58
  %conv = sitofp i32 %14 to double, !dbg !58
  %div3 = fdiv double %13, %conv, !dbg !59
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), double %div3), !dbg !60
  %15 = load double, double* %prod, align 8, !dbg !61
  %16 = load i32, i32* %count, align 4, !dbg !62
  %conv5 = sitofp i32 %16 to double, !dbg !62
  %div6 = fdiv double 1.000000e+00, %conv5, !dbg !63
  %call7 = call double @pow(double %15, double %div6) #6, !dbg !64
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), double %call7), !dbg !65
  %17 = load i32, i32* %count, align 4, !dbg !66
  %conv9 = sitofp i32 %17 to double, !dbg !66
  %18 = load double, double* %resum, align 8, !dbg !67
  %div10 = fdiv double %conv9, %18, !dbg !68
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0), double %div10), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local double @atof(i8*) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "averages-pythagorean-means.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Averages-Pythagorean-means")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocation(line: 5, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 5, type: !11)
!17 = !DILocation(line: 5, column: 26, scope: !7)
!18 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 7, type: !10)
!19 = !DILocation(line: 7, column: 7, scope: !7)
!20 = !DILocalVariable(name: "count", scope: !7, file: !1, line: 7, type: !10)
!21 = !DILocation(line: 7, column: 10, scope: !7)
!22 = !DILocalVariable(name: "f", scope: !7, file: !1, line: 8, type: !23)
!23 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!24 = !DILocation(line: 8, column: 10, scope: !7)
!25 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 8, type: !23)
!26 = !DILocation(line: 8, column: 13, scope: !7)
!27 = !DILocalVariable(name: "prod", scope: !7, file: !1, line: 8, type: !23)
!28 = !DILocation(line: 8, column: 22, scope: !7)
!29 = !DILocalVariable(name: "resum", scope: !7, file: !1, line: 8, type: !23)
!30 = !DILocation(line: 8, column: 32, scope: !7)
!31 = !DILocation(line: 10, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 3)
!33 = !DILocation(line: 10, column: 8, scope: !32)
!34 = !DILocation(line: 10, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !1, line: 10, column: 3)
!36 = !DILocation(line: 10, column: 15, scope: !35)
!37 = !DILocation(line: 10, column: 14, scope: !35)
!38 = !DILocation(line: 10, column: 3, scope: !32)
!39 = !DILocation(line: 11, column: 14, scope: !40)
!40 = distinct !DILexicalBlock(scope: !35, file: !1, line: 10, column: 26)
!41 = !DILocation(line: 11, column: 19, scope: !40)
!42 = !DILocation(line: 11, column: 9, scope: !40)
!43 = !DILocation(line: 11, column: 7, scope: !40)
!44 = !DILocation(line: 12, column: 10, scope: !40)
!45 = !DILocation(line: 13, column: 12, scope: !40)
!46 = !DILocation(line: 13, column: 9, scope: !40)
!47 = !DILocation(line: 14, column: 13, scope: !40)
!48 = !DILocation(line: 14, column: 10, scope: !40)
!49 = !DILocation(line: 15, column: 19, scope: !40)
!50 = !DILocation(line: 15, column: 18, scope: !40)
!51 = !DILocation(line: 15, column: 11, scope: !40)
!52 = !DILocation(line: 16, column: 3, scope: !40)
!53 = !DILocation(line: 10, column: 21, scope: !35)
!54 = !DILocation(line: 10, column: 3, scope: !35)
!55 = distinct !{!55, !38, !56}
!56 = !DILocation(line: 16, column: 3, scope: !32)
!57 = !DILocation(line: 18, column: 35, scope: !7)
!58 = !DILocation(line: 18, column: 39, scope: !7)
!59 = !DILocation(line: 18, column: 38, scope: !7)
!60 = !DILocation(line: 18, column: 3, scope: !7)
!61 = !DILocation(line: 19, column: 38, scope: !7)
!62 = !DILocation(line: 19, column: 48, scope: !7)
!63 = !DILocation(line: 19, column: 47, scope: !7)
!64 = !DILocation(line: 19, column: 34, scope: !7)
!65 = !DILocation(line: 19, column: 3, scope: !7)
!66 = !DILocation(line: 20, column: 33, scope: !7)
!67 = !DILocation(line: 20, column: 39, scope: !7)
!68 = !DILocation(line: 20, column: 38, scope: !7)
!69 = !DILocation(line: 20, column: 3, scope: !7)
!70 = !DILocation(line: 22, column: 3, scope: !7)
