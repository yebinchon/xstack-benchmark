; ModuleID = 'horizontal-sundial-calculations.c'
source_filename = "horizontal-sundial-calculations.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Enter latitude\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Enter longitude\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Enter legal meridian\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"sine of latitude: %.3f\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"diff longitude: %.3f\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [60 x i8] c"Hour, sun hour angle, dial hour line angle from 6am to 6pm\0A\00", align 1
@.str.9 = private unnamed_addr constant [40 x i8] c"HR= %3d;  \09  HRA=%7.3f;  \09  HLA= %7.3f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %lat = alloca double, align 8
  %slat = alloca double, align 8
  %lng = alloca double, align 8
  %ref = alloca double, align 8
  %h = alloca i32, align 4
  %hla = alloca double, align 8
  %hra = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata double* %lat, metadata !11, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.declare(metadata double* %slat, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata double* %lng, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata double* %ref, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %h, metadata !20, metadata !DIExpression()), !dbg !21
  br label %do.body, !dbg !22

do.body:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)), !dbg !23
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double* %lat), !dbg !23
  br label %do.end, !dbg !23

do.end:                                           ; preds = %do.body
  br label %do.body2, !dbg !25

do.body2:                                         ; preds = %do.end
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !26
  %call4 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double* %lng), !dbg !26
  br label %do.end5, !dbg !26

do.end5:                                          ; preds = %do.body2
  br label %do.body6, !dbg !28

do.body6:                                         ; preds = %do.end5
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !29
  %call8 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double* %ref), !dbg !29
  br label %do.end9, !dbg !29

do.end9:                                          ; preds = %do.body6
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !31
  %0 = load double, double* %lat, align 8, !dbg !32
  %mul = fmul double %0, 0x400921FB54442D18, !dbg !32
  %div = fdiv double %mul, 1.800000e+02, !dbg !32
  %call11 = call double @sin(double %div) #4, !dbg !33
  store double %call11, double* %slat, align 8, !dbg !34
  %1 = load double, double* %slat, align 8, !dbg !35
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0), double %1), !dbg !36
  %2 = load double, double* %lng, align 8, !dbg !37
  %3 = load double, double* %ref, align 8, !dbg !38
  %sub = fsub double %2, %3, !dbg !39
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), double %sub), !dbg !40
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.8, i64 0, i64 0)), !dbg !41
  store i32 -6, i32* %h, align 4, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %do.end9
  %4 = load i32, i32* %h, align 4, !dbg !45
  %cmp = icmp sle i32 %4, 6, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata double* %hla, metadata !49, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata double* %hra, metadata !52, metadata !DIExpression()), !dbg !53
  %5 = load i32, i32* %h, align 4, !dbg !54
  %conv = sitofp i32 %5 to double, !dbg !54
  %mul15 = fmul double 1.500000e+01, %conv, !dbg !55
  store double %mul15, double* %hra, align 8, !dbg !56
  %6 = load double, double* %hra, align 8, !dbg !57
  %7 = load double, double* %lng, align 8, !dbg !58
  %sub16 = fsub double %6, %7, !dbg !59
  %8 = load double, double* %ref, align 8, !dbg !60
  %add = fadd double %sub16, %8, !dbg !61
  store double %add, double* %hra, align 8, !dbg !62
  %9 = load double, double* %slat, align 8, !dbg !63
  %10 = load double, double* %hra, align 8, !dbg !63
  %mul17 = fmul double %10, 0x400921FB54442D18, !dbg !63
  %div18 = fdiv double %mul17, 1.800000e+02, !dbg !63
  %call19 = call double @tan(double %div18) #4, !dbg !63
  %mul20 = fmul double %9, %call19, !dbg !63
  %call21 = call double @atan(double %mul20) #4, !dbg !63
  %mul22 = fmul double %call21, 1.800000e+02, !dbg !63
  %div23 = fdiv double %mul22, 0x400921FB54442D18, !dbg !63
  store double %div23, double* %hla, align 8, !dbg !64
  %11 = load i32, i32* %h, align 4, !dbg !65
  %12 = load double, double* %hra, align 8, !dbg !66
  %13 = load double, double* %hla, align 8, !dbg !67
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9, i64 0, i64 0), i32 %11, double %12, double %13), !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %h, align 4, !dbg !70
  %inc = add nsw i32 %14, 1, !dbg !70
  store i32 %inc, i32* %h, align 4, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local double @sin(double) #3

; Function Attrs: nounwind
declare dso_local double @atan(double) #3

; Function Attrs: nounwind
declare dso_local double @tan(double) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "horizontal-sundial-calculations.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Horizontal-sundial-calculations")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !8, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "lat", scope: !7, file: !1, line: 18, type: !12)
!12 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!13 = !DILocation(line: 18, column: 10, scope: !7)
!14 = !DILocalVariable(name: "slat", scope: !7, file: !1, line: 18, type: !12)
!15 = !DILocation(line: 18, column: 15, scope: !7)
!16 = !DILocalVariable(name: "lng", scope: !7, file: !1, line: 18, type: !12)
!17 = !DILocation(line: 18, column: 21, scope: !7)
!18 = !DILocalVariable(name: "ref", scope: !7, file: !1, line: 18, type: !12)
!19 = !DILocation(line: 18, column: 26, scope: !7)
!20 = !DILocalVariable(name: "h", scope: !7, file: !1, line: 19, type: !10)
!21 = !DILocation(line: 19, column: 7, scope: !7)
!22 = !DILocation(line: 21, column: 3, scope: !7)
!23 = !DILocation(line: 21, column: 3, scope: !24)
!24 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 3)
!25 = !DILocation(line: 22, column: 3, scope: !7)
!26 = !DILocation(line: 22, column: 3, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 22, column: 3)
!28 = !DILocation(line: 23, column: 3, scope: !7)
!29 = !DILocation(line: 23, column: 3, scope: !30)
!30 = distinct !DILexicalBlock(scope: !7, file: !1, line: 23, column: 3)
!31 = !DILocation(line: 24, column: 3, scope: !7)
!32 = !DILocation(line: 26, column: 14, scope: !7)
!33 = !DILocation(line: 26, column: 10, scope: !7)
!34 = !DILocation(line: 26, column: 8, scope: !7)
!35 = !DILocation(line: 27, column: 38, scope: !7)
!36 = !DILocation(line: 27, column: 3, scope: !7)
!37 = !DILocation(line: 28, column: 38, scope: !7)
!38 = !DILocation(line: 28, column: 44, scope: !7)
!39 = !DILocation(line: 28, column: 42, scope: !7)
!40 = !DILocation(line: 28, column: 3, scope: !7)
!41 = !DILocation(line: 30, column: 3, scope: !7)
!42 = !DILocation(line: 32, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !7, file: !1, line: 32, column: 3)
!44 = !DILocation(line: 32, column: 7, scope: !43)
!45 = !DILocation(line: 32, column: 15, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 32, column: 3)
!47 = !DILocation(line: 32, column: 17, scope: !46)
!48 = !DILocation(line: 32, column: 3, scope: !43)
!49 = !DILocalVariable(name: "hla", scope: !50, file: !1, line: 34, type: !12)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 33, column: 3)
!51 = !DILocation(line: 34, column: 12, scope: !50)
!52 = !DILocalVariable(name: "hra", scope: !50, file: !1, line: 34, type: !12)
!53 = !DILocation(line: 34, column: 17, scope: !50)
!54 = !DILocation(line: 35, column: 16, scope: !50)
!55 = !DILocation(line: 35, column: 15, scope: !50)
!56 = !DILocation(line: 35, column: 9, scope: !50)
!57 = !DILocation(line: 36, column: 11, scope: !50)
!58 = !DILocation(line: 36, column: 17, scope: !50)
!59 = !DILocation(line: 36, column: 15, scope: !50)
!60 = !DILocation(line: 36, column: 23, scope: !50)
!61 = !DILocation(line: 36, column: 21, scope: !50)
!62 = !DILocation(line: 36, column: 9, scope: !50)
!63 = !DILocation(line: 37, column: 11, scope: !50)
!64 = !DILocation(line: 37, column: 9, scope: !50)
!65 = !DILocation(line: 39, column: 5, scope: !50)
!66 = !DILocation(line: 39, column: 8, scope: !50)
!67 = !DILocation(line: 39, column: 13, scope: !50)
!68 = !DILocation(line: 38, column: 5, scope: !50)
!69 = !DILocation(line: 40, column: 3, scope: !50)
!70 = !DILocation(line: 32, column: 24, scope: !46)
!71 = !DILocation(line: 32, column: 3, scope: !46)
!72 = distinct !{!72, !48, !73}
!73 = !DILocation(line: 40, column: 3, scope: !43)
!74 = !DILocation(line: 42, column: 3, scope: !7)
