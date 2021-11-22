; ModuleID = 'averages-mean-angle.c'
source_filename = "averages-mean-angle.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.angleSet1 = private unnamed_addr constant [2 x double] [double 3.500000e+02, double 1.000000e+01], align 16
@__const.main.angleSet2 = private unnamed_addr constant [4 x double] [double 9.000000e+01, double 1.800000e+02, double 2.700000e+02, double 3.600000e+02], align 16
@__const.main.angleSet3 = private unnamed_addr constant [3 x double] [double 1.000000e+01, double 2.000000e+01, double 3.000000e+01], align 16
@.str = private unnamed_addr constant [38 x i8] c"\0AMean Angle for 1st set : %lf degrees\00", align 1
@.str.1 = private unnamed_addr constant [38 x i8] c"\0AMean Angle for 2nd set : %lf degrees\00", align 1
@.str.2 = private unnamed_addr constant [39 x i8] c"\0AMean Angle for 3rd set : %lf degrees\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @meanAngle(double* %angles, i32 %size) #0 !dbg !7 {
entry:
  %angles.addr = alloca double*, align 8
  %size.addr = alloca i32, align 4
  %y_part = alloca double, align 8
  %x_part = alloca double, align 8
  %i = alloca i32, align 4
  store double* %angles, double** %angles.addr, align 8
  call void @llvm.dbg.declare(metadata double** %angles.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata double* %y_part, metadata !17, metadata !DIExpression()), !dbg !18
  store double 0.000000e+00, double* %y_part, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata double* %x_part, metadata !19, metadata !DIExpression()), !dbg !20
  store double 0.000000e+00, double* %x_part, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !26
  %1 = load i32, i32* %size.addr, align 4, !dbg !28
  %cmp = icmp slt i32 %0, %1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %2 = load double*, double** %angles.addr, align 8, !dbg !31
  %3 = load i32, i32* %i, align 4, !dbg !33
  %idxprom = sext i32 %3 to i64, !dbg !31
  %arrayidx = getelementptr inbounds double, double* %2, i64 %idxprom, !dbg !31
  %4 = load double, double* %arrayidx, align 8, !dbg !31
  %mul = fmul double %4, 0x400921FB54442D18, !dbg !34
  %div = fdiv double %mul, 1.800000e+02, !dbg !35
  %call = call double @cos(double %div) #5, !dbg !36
  %5 = load double, double* %x_part, align 8, !dbg !37
  %add = fadd double %5, %call, !dbg !37
  store double %add, double* %x_part, align 8, !dbg !37
  %6 = load double*, double** %angles.addr, align 8, !dbg !38
  %7 = load i32, i32* %i, align 4, !dbg !39
  %idxprom1 = sext i32 %7 to i64, !dbg !38
  %arrayidx2 = getelementptr inbounds double, double* %6, i64 %idxprom1, !dbg !38
  %8 = load double, double* %arrayidx2, align 8, !dbg !38
  %mul3 = fmul double %8, 0x400921FB54442D18, !dbg !40
  %div4 = fdiv double %mul3, 1.800000e+02, !dbg !41
  %call5 = call double @sin(double %div4) #5, !dbg !42
  %9 = load double, double* %y_part, align 8, !dbg !43
  %add6 = fadd double %9, %call5, !dbg !43
  store double %add6, double* %y_part, align 8, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %10, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %11 = load double, double* %y_part, align 8, !dbg !49
  %12 = load i32, i32* %size.addr, align 4, !dbg !50
  %conv = sitofp i32 %12 to double, !dbg !50
  %div7 = fdiv double %11, %conv, !dbg !51
  %13 = load double, double* %x_part, align 8, !dbg !52
  %14 = load i32, i32* %size.addr, align 4, !dbg !53
  %conv8 = sitofp i32 %14 to double, !dbg !53
  %div9 = fdiv double %13, %conv8, !dbg !54
  %call10 = call double @atan2(double %div7, double %div9) #5, !dbg !55
  %mul11 = fmul double %call10, 1.800000e+02, !dbg !56
  %div12 = fdiv double %mul11, 0x400921FB54442D18, !dbg !57
  ret double %div12, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @cos(double) #2

; Function Attrs: nounwind
declare dso_local double @sin(double) #2

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %angleSet1 = alloca [2 x double], align 16
  %angleSet2 = alloca [4 x double], align 16
  %angleSet3 = alloca [3 x double], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x double]* %angleSet1, metadata !62, metadata !DIExpression()), !dbg !66
  %0 = bitcast [2 x double]* %angleSet1 to i8*, !dbg !66
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([2 x double]* @__const.main.angleSet1 to i8*), i64 16, i1 false), !dbg !66
  call void @llvm.dbg.declare(metadata [4 x double]* %angleSet2, metadata !67, metadata !DIExpression()), !dbg !71
  %1 = bitcast [4 x double]* %angleSet2 to i8*, !dbg !71
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([4 x double]* @__const.main.angleSet2 to i8*), i64 32, i1 false), !dbg !71
  call void @llvm.dbg.declare(metadata [3 x double]* %angleSet3, metadata !72, metadata !DIExpression()), !dbg !76
  %2 = bitcast [3 x double]* %angleSet3 to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([3 x double]* @__const.main.angleSet3 to i8*), i64 24, i1 false), !dbg !76
  %arraydecay = getelementptr inbounds [2 x double], [2 x double]* %angleSet1, i64 0, i64 0, !dbg !77
  %call = call double @meanAngle(double* %arraydecay, i32 2), !dbg !78
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), double %call), !dbg !79
  %arraydecay2 = getelementptr inbounds [4 x double], [4 x double]* %angleSet2, i64 0, i64 0, !dbg !80
  %call3 = call double @meanAngle(double* %arraydecay2, i32 4), !dbg !81
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.1, i64 0, i64 0), double %call3), !dbg !82
  %arraydecay5 = getelementptr inbounds [3 x double], [3 x double]* %angleSet3, i64 0, i64 0, !dbg !83
  %call6 = call double @meanAngle(double* %arraydecay5, i32 3), !dbg !84
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i64 0, i64 0), double %call6), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "averages-mean-angle.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Averages-Mean-angle")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "meanAngle", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !12}
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "angles", arg: 1, scope: !7, file: !1, line: 5, type: !11)
!14 = !DILocation(line: 5, column: 20, scope: !7)
!15 = !DILocalVariable(name: "size", arg: 2, scope: !7, file: !1, line: 5, type: !12)
!16 = !DILocation(line: 5, column: 32, scope: !7)
!17 = !DILocalVariable(name: "y_part", scope: !7, file: !1, line: 7, type: !10)
!18 = !DILocation(line: 7, column: 10, scope: !7)
!19 = !DILocalVariable(name: "x_part", scope: !7, file: !1, line: 7, type: !10)
!20 = !DILocation(line: 7, column: 22, scope: !7)
!21 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 8, type: !12)
!22 = !DILocation(line: 8, column: 7, scope: !7)
!23 = !DILocation(line: 10, column: 10, scope: !24)
!24 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 3)
!25 = !DILocation(line: 10, column: 8, scope: !24)
!26 = !DILocation(line: 10, column: 15, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !1, line: 10, column: 3)
!28 = !DILocation(line: 10, column: 19, scope: !27)
!29 = !DILocation(line: 10, column: 17, scope: !27)
!30 = !DILocation(line: 10, column: 3, scope: !24)
!31 = !DILocation(line: 12, column: 22, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !1, line: 11, column: 5)
!33 = !DILocation(line: 12, column: 29, scope: !32)
!34 = !DILocation(line: 12, column: 32, scope: !32)
!35 = !DILocation(line: 12, column: 39, scope: !32)
!36 = !DILocation(line: 12, column: 17, scope: !32)
!37 = !DILocation(line: 12, column: 14, scope: !32)
!38 = !DILocation(line: 13, column: 22, scope: !32)
!39 = !DILocation(line: 13, column: 29, scope: !32)
!40 = !DILocation(line: 13, column: 32, scope: !32)
!41 = !DILocation(line: 13, column: 39, scope: !32)
!42 = !DILocation(line: 13, column: 17, scope: !32)
!43 = !DILocation(line: 13, column: 14, scope: !32)
!44 = !DILocation(line: 14, column: 5, scope: !32)
!45 = !DILocation(line: 10, column: 26, scope: !27)
!46 = !DILocation(line: 10, column: 3, scope: !27)
!47 = distinct !{!47, !30, !48}
!48 = !DILocation(line: 14, column: 5, scope: !24)
!49 = !DILocation(line: 16, column: 17, scope: !7)
!50 = !DILocation(line: 16, column: 26, scope: !7)
!51 = !DILocation(line: 16, column: 24, scope: !7)
!52 = !DILocation(line: 16, column: 32, scope: !7)
!53 = !DILocation(line: 16, column: 41, scope: !7)
!54 = !DILocation(line: 16, column: 39, scope: !7)
!55 = !DILocation(line: 16, column: 10, scope: !7)
!56 = !DILocation(line: 16, column: 47, scope: !7)
!57 = !DILocation(line: 16, column: 53, scope: !7)
!58 = !DILocation(line: 16, column: 3, scope: !7)
!59 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 20, type: !60, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!12}
!62 = !DILocalVariable(name: "angleSet1", scope: !59, file: !1, line: 22, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 128, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 2)
!66 = !DILocation(line: 22, column: 10, scope: !59)
!67 = !DILocalVariable(name: "angleSet2", scope: !59, file: !1, line: 23, type: !68)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 256, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 4)
!71 = !DILocation(line: 23, column: 10, scope: !59)
!72 = !DILocalVariable(name: "angleSet3", scope: !59, file: !1, line: 24, type: !73)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 192, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 3)
!76 = !DILocation(line: 24, column: 10, scope: !59)
!77 = !DILocation(line: 26, column: 64, scope: !59)
!78 = !DILocation(line: 26, column: 53, scope: !59)
!79 = !DILocation(line: 26, column: 3, scope: !59)
!80 = !DILocation(line: 27, column: 64, scope: !59)
!81 = !DILocation(line: 27, column: 53, scope: !59)
!82 = !DILocation(line: 27, column: 3, scope: !59)
!83 = !DILocation(line: 28, column: 66, scope: !59)
!84 = !DILocation(line: 28, column: 55, scope: !59)
!85 = !DILocation(line: 28, column: 3, scope: !59)
!86 = !DILocation(line: 29, column: 3, scope: !59)
