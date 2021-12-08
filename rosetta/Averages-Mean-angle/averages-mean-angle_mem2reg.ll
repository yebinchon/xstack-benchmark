; ModuleID = 'averages-mean-angle.ll'
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
  call void @llvm.dbg.value(metadata double* %angles, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %size, metadata !15, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !16, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !17, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 0, metadata !18, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !19

for.cond:                                         ; preds = %for.inc, %entry
  %y_part.0 = phi double [ 0.000000e+00, %entry ], [ %add6, %for.inc ], !dbg !14
  %x_part.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ], !dbg !14
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !21
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !18, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata double %x_part.0, metadata !17, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata double %y_part.0, metadata !16, metadata !DIExpression()), !dbg !14
  %cmp = icmp slt i32 %i.0, %size, !dbg !22
  br i1 %cmp, label %for.body, label %for.end, !dbg !24

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !25
  %arrayidx = getelementptr inbounds double, double* %angles, i64 %idxprom, !dbg !25
  %0 = load double, double* %arrayidx, align 8, !dbg !25
  %mul = fmul double %0, 0x400921FB54442D18, !dbg !27
  %div = fdiv double %mul, 1.800000e+02, !dbg !28
  %call = call double @cos(double %div) #5, !dbg !29
  %add = fadd double %x_part.0, %call, !dbg !30
  call void @llvm.dbg.value(metadata double %add, metadata !17, metadata !DIExpression()), !dbg !14
  %idxprom1 = sext i32 %i.0 to i64, !dbg !31
  %arrayidx2 = getelementptr inbounds double, double* %angles, i64 %idxprom1, !dbg !31
  %1 = load double, double* %arrayidx2, align 8, !dbg !31
  %mul3 = fmul double %1, 0x400921FB54442D18, !dbg !32
  %div4 = fdiv double %mul3, 1.800000e+02, !dbg !33
  %call5 = call double @sin(double %div4) #5, !dbg !34
  %add6 = fadd double %y_part.0, %call5, !dbg !35
  call void @llvm.dbg.value(metadata double %add6, metadata !16, metadata !DIExpression()), !dbg !14
  br label %for.inc, !dbg !36

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !37
  call void @llvm.dbg.value(metadata i32 %inc, metadata !18, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !38, !llvm.loop !39

for.end:                                          ; preds = %for.cond
  %conv = sitofp i32 %size to double, !dbg !41
  %div7 = fdiv double %y_part.0, %conv, !dbg !42
  %conv8 = sitofp i32 %size to double, !dbg !43
  %div9 = fdiv double %x_part.0, %conv8, !dbg !44
  %call10 = call double @atan2(double %div7, double %div9) #5, !dbg !45
  %mul11 = fmul double %call10, 1.800000e+02, !dbg !46
  %div12 = fdiv double %mul11, 0x400921FB54442D18, !dbg !47
  ret double %div12, !dbg !48
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
define dso_local i32 @main() #0 !dbg !49 {
entry:
  %angleSet1 = alloca [2 x double], align 16
  %angleSet2 = alloca [4 x double], align 16
  %angleSet3 = alloca [3 x double], align 16
  call void @llvm.dbg.declare(metadata [2 x double]* %angleSet1, metadata !52, metadata !DIExpression()), !dbg !56
  %0 = bitcast [2 x double]* %angleSet1 to i8*, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([2 x double]* @__const.main.angleSet1 to i8*), i64 16, i1 false), !dbg !56
  call void @llvm.dbg.declare(metadata [4 x double]* %angleSet2, metadata !57, metadata !DIExpression()), !dbg !61
  %1 = bitcast [4 x double]* %angleSet2 to i8*, !dbg !61
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([4 x double]* @__const.main.angleSet2 to i8*), i64 32, i1 false), !dbg !61
  call void @llvm.dbg.declare(metadata [3 x double]* %angleSet3, metadata !62, metadata !DIExpression()), !dbg !66
  %2 = bitcast [3 x double]* %angleSet3 to i8*, !dbg !66
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([3 x double]* @__const.main.angleSet3 to i8*), i64 24, i1 false), !dbg !66
  %arraydecay = getelementptr inbounds [2 x double], [2 x double]* %angleSet1, i64 0, i64 0, !dbg !67
  %call = call double @meanAngle(double* %arraydecay, i32 2), !dbg !68
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), double %call), !dbg !69
  %arraydecay2 = getelementptr inbounds [4 x double], [4 x double]* %angleSet2, i64 0, i64 0, !dbg !70
  %call3 = call double @meanAngle(double* %arraydecay2, i32 4), !dbg !71
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.1, i64 0, i64 0), double %call3), !dbg !72
  %arraydecay5 = getelementptr inbounds [3 x double], [3 x double]* %angleSet3, i64 0, i64 0, !dbg !73
  %call6 = call double @meanAngle(double* %arraydecay5, i32 3), !dbg !74
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i64 0, i64 0), double %call6), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "averages-mean-angle.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Averages-Mean-angle")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "meanAngle", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !12}
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "angles", arg: 1, scope: !7, file: !1, line: 5, type: !11)
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocalVariable(name: "size", arg: 2, scope: !7, file: !1, line: 5, type: !12)
!16 = !DILocalVariable(name: "y_part", scope: !7, file: !1, line: 7, type: !10)
!17 = !DILocalVariable(name: "x_part", scope: !7, file: !1, line: 7, type: !10)
!18 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 8, type: !12)
!19 = !DILocation(line: 10, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 3)
!21 = !DILocation(line: 0, scope: !20)
!22 = !DILocation(line: 10, column: 17, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !1, line: 10, column: 3)
!24 = !DILocation(line: 10, column: 3, scope: !20)
!25 = !DILocation(line: 12, column: 22, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !1, line: 11, column: 5)
!27 = !DILocation(line: 12, column: 32, scope: !26)
!28 = !DILocation(line: 12, column: 39, scope: !26)
!29 = !DILocation(line: 12, column: 17, scope: !26)
!30 = !DILocation(line: 12, column: 14, scope: !26)
!31 = !DILocation(line: 13, column: 22, scope: !26)
!32 = !DILocation(line: 13, column: 32, scope: !26)
!33 = !DILocation(line: 13, column: 39, scope: !26)
!34 = !DILocation(line: 13, column: 17, scope: !26)
!35 = !DILocation(line: 13, column: 14, scope: !26)
!36 = !DILocation(line: 14, column: 5, scope: !26)
!37 = !DILocation(line: 10, column: 26, scope: !23)
!38 = !DILocation(line: 10, column: 3, scope: !23)
!39 = distinct !{!39, !24, !40}
!40 = !DILocation(line: 14, column: 5, scope: !20)
!41 = !DILocation(line: 16, column: 26, scope: !7)
!42 = !DILocation(line: 16, column: 24, scope: !7)
!43 = !DILocation(line: 16, column: 41, scope: !7)
!44 = !DILocation(line: 16, column: 39, scope: !7)
!45 = !DILocation(line: 16, column: 10, scope: !7)
!46 = !DILocation(line: 16, column: 47, scope: !7)
!47 = !DILocation(line: 16, column: 53, scope: !7)
!48 = !DILocation(line: 16, column: 3, scope: !7)
!49 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 20, type: !50, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!12}
!52 = !DILocalVariable(name: "angleSet1", scope: !49, file: !1, line: 22, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 128, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 2)
!56 = !DILocation(line: 22, column: 10, scope: !49)
!57 = !DILocalVariable(name: "angleSet2", scope: !49, file: !1, line: 23, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 256, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 4)
!61 = !DILocation(line: 23, column: 10, scope: !49)
!62 = !DILocalVariable(name: "angleSet3", scope: !49, file: !1, line: 24, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 192, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 3)
!66 = !DILocation(line: 24, column: 10, scope: !49)
!67 = !DILocation(line: 26, column: 64, scope: !49)
!68 = !DILocation(line: 26, column: 53, scope: !49)
!69 = !DILocation(line: 26, column: 3, scope: !49)
!70 = !DILocation(line: 27, column: 64, scope: !49)
!71 = !DILocation(line: 27, column: 53, scope: !49)
!72 = !DILocation(line: 27, column: 3, scope: !49)
!73 = !DILocation(line: 28, column: 66, scope: !49)
!74 = !DILocation(line: 28, column: 55, scope: !49)
!75 = !DILocation(line: 28, column: 3, scope: !49)
!76 = !DILocation(line: 29, column: 3, scope: !49)
