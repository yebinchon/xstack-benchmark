; ModuleID = 'averages-pythagorean-means.ll'
source_filename = "averages-pythagorean-means.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Arithmetic mean = %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Geometric mean = %f\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Harmonic mean = %f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8** %argv, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !18, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata double 1.000000e+00, metadata !20, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !21, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 1, metadata !22, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %count.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !15
  %i.0 = phi i32 [ 1, %entry ], [ %inc2, %for.inc ], !dbg !25
  %sum.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ], !dbg !15
  %prod.0 = phi double [ 1.000000e+00, %entry ], [ %mul, %for.inc ], !dbg !15
  %resum.0 = phi double [ 0.000000e+00, %entry ], [ %add1, %for.inc ], !dbg !15
  call void @llvm.dbg.value(metadata double %resum.0, metadata !21, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata double %prod.0, metadata !20, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata double %sum.0, metadata !18, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !22, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %count.0, metadata !17, metadata !DIExpression()), !dbg !15
  %cmp = icmp slt i32 %i.0, %argc, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !29
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 %idxprom, !dbg !29
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !29
  %call = call double @atof(i8* %0) #5, !dbg !31
  call void @llvm.dbg.value(metadata double %call, metadata !32, metadata !DIExpression()), !dbg !15
  %inc = add nsw i32 %count.0, 1, !dbg !33
  call void @llvm.dbg.value(metadata i32 %inc, metadata !17, metadata !DIExpression()), !dbg !15
  %add = fadd double %sum.0, %call, !dbg !34
  call void @llvm.dbg.value(metadata double %add, metadata !18, metadata !DIExpression()), !dbg !15
  %mul = fmul double %prod.0, %call, !dbg !35
  call void @llvm.dbg.value(metadata double %mul, metadata !20, metadata !DIExpression()), !dbg !15
  %div = fdiv double 1.000000e+00, %call, !dbg !36
  %add1 = fadd double %resum.0, %div, !dbg !37
  call void @llvm.dbg.value(metadata double %add1, metadata !21, metadata !DIExpression()), !dbg !15
  br label %for.inc, !dbg !38

for.inc:                                          ; preds = %for.body
  %inc2 = add nsw i32 %i.0, 1, !dbg !39
  call void @llvm.dbg.value(metadata i32 %inc2, metadata !22, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !40, !llvm.loop !41

for.end:                                          ; preds = %for.cond
  %conv = sitofp i32 %count.0 to double, !dbg !43
  %div3 = fdiv double %sum.0, %conv, !dbg !44
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), double %div3), !dbg !45
  %conv5 = sitofp i32 %count.0 to double, !dbg !46
  %div6 = fdiv double 1.000000e+00, %conv5, !dbg !47
  %call7 = call double @pow(double %prod.0, double %div6) #6, !dbg !48
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), double %call7), !dbg !49
  %conv9 = sitofp i32 %count.0 to double, !dbg !50
  %div10 = fdiv double %conv9, %resum.0, !dbg !51
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0), double %div10), !dbg !52
  ret i32 0, !dbg !53
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local double @atof(i8*) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "averages-pythagorean-means.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Averages-Pythagorean-means")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 5, type: !11)
!17 = !DILocalVariable(name: "count", scope: !7, file: !1, line: 7, type: !10)
!18 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 8, type: !19)
!19 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!20 = !DILocalVariable(name: "prod", scope: !7, file: !1, line: 8, type: !19)
!21 = !DILocalVariable(name: "resum", scope: !7, file: !1, line: 8, type: !19)
!22 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 7, type: !10)
!23 = !DILocation(line: 10, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 3)
!25 = !DILocation(line: 0, scope: !24)
!26 = !DILocation(line: 10, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !1, line: 10, column: 3)
!28 = !DILocation(line: 10, column: 3, scope: !24)
!29 = !DILocation(line: 11, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !1, line: 10, column: 26)
!31 = !DILocation(line: 11, column: 9, scope: !30)
!32 = !DILocalVariable(name: "f", scope: !7, file: !1, line: 8, type: !19)
!33 = !DILocation(line: 12, column: 10, scope: !30)
!34 = !DILocation(line: 13, column: 9, scope: !30)
!35 = !DILocation(line: 14, column: 10, scope: !30)
!36 = !DILocation(line: 15, column: 18, scope: !30)
!37 = !DILocation(line: 15, column: 11, scope: !30)
!38 = !DILocation(line: 16, column: 3, scope: !30)
!39 = !DILocation(line: 10, column: 21, scope: !27)
!40 = !DILocation(line: 10, column: 3, scope: !27)
!41 = distinct !{!41, !28, !42}
!42 = !DILocation(line: 16, column: 3, scope: !24)
!43 = !DILocation(line: 18, column: 39, scope: !7)
!44 = !DILocation(line: 18, column: 38, scope: !7)
!45 = !DILocation(line: 18, column: 3, scope: !7)
!46 = !DILocation(line: 19, column: 48, scope: !7)
!47 = !DILocation(line: 19, column: 47, scope: !7)
!48 = !DILocation(line: 19, column: 34, scope: !7)
!49 = !DILocation(line: 19, column: 3, scope: !7)
!50 = !DILocation(line: 20, column: 33, scope: !7)
!51 = !DILocation(line: 20, column: 38, scope: !7)
!52 = !DILocation(line: 20, column: 3, scope: !7)
!53 = !DILocation(line: 22, column: 3, scope: !7)
