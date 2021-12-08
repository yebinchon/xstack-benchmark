; ModuleID = 'averages-root-mean-square.ll'
source_filename = "averages-root-mean-square.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.v = private unnamed_addr constant [10 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00, double 1.000000e+01], align 16
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @rms(double* %v, i32 %n) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata double* %v, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %n, metadata !15, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !16, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !18

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !20
  %sum.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ], !dbg !14
  call void @llvm.dbg.value(metadata double %sum.0, metadata !16, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !17, metadata !DIExpression()), !dbg !14
  %cmp = icmp slt i32 %i.0, %n, !dbg !21
  br i1 %cmp, label %for.body, label %for.end, !dbg !23

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !24
  %arrayidx = getelementptr inbounds double, double* %v, i64 %idxprom, !dbg !24
  %0 = load double, double* %arrayidx, align 8, !dbg !24
  %idxprom1 = sext i32 %i.0 to i64, !dbg !25
  %arrayidx2 = getelementptr inbounds double, double* %v, i64 %idxprom1, !dbg !25
  %1 = load double, double* %arrayidx2, align 8, !dbg !25
  %mul = fmul double %0, %1, !dbg !26
  %add = fadd double %sum.0, %mul, !dbg !27
  call void @llvm.dbg.value(metadata double %add, metadata !16, metadata !DIExpression()), !dbg !14
  br label %for.inc, !dbg !28

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !29
  call void @llvm.dbg.value(metadata i32 %inc, metadata !17, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !30, !llvm.loop !31

for.end:                                          ; preds = %for.cond
  %conv = sitofp i32 %n to double, !dbg !33
  %div = fdiv double %sum.0, %conv, !dbg !34
  %call = call double @sqrt(double %div) #5, !dbg !35
  ret double %call, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !37 {
entry:
  %v = alloca [10 x double], align 16
  call void @llvm.dbg.declare(metadata [10 x double]* %v, metadata !40, metadata !DIExpression()), !dbg !44
  %0 = bitcast [10 x double]* %v to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x double]* @__const.main.v to i8*), i64 80, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [10 x double], [10 x double]* %v, i64 0, i64 0, !dbg !45
  %call = call double @rms(double* %arraydecay, i32 10), !dbg !46
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %call), !dbg !47
  ret i32 0, !dbg !48
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
!1 = !DIFile(filename: "averages-root-mean-square.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Averages-Root-mean-square")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "rms", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !12}
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "v", arg: 1, scope: !7, file: !1, line: 4, type: !11)
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 4, type: !12)
!16 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 7, type: !10)
!17 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 6, type: !12)
!18 = !DILocation(line: 8, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 3)
!20 = !DILocation(line: 0, scope: !19)
!21 = !DILocation(line: 8, column: 16, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !1, line: 8, column: 3)
!23 = !DILocation(line: 8, column: 3, scope: !19)
!24 = !DILocation(line: 9, column: 12, scope: !22)
!25 = !DILocation(line: 9, column: 19, scope: !22)
!26 = !DILocation(line: 9, column: 17, scope: !22)
!27 = !DILocation(line: 9, column: 9, scope: !22)
!28 = !DILocation(line: 9, column: 5, scope: !22)
!29 = !DILocation(line: 8, column: 22, scope: !22)
!30 = !DILocation(line: 8, column: 3, scope: !22)
!31 = distinct !{!31, !23, !32}
!32 = !DILocation(line: 9, column: 22, scope: !19)
!33 = !DILocation(line: 10, column: 21, scope: !7)
!34 = !DILocation(line: 10, column: 19, scope: !7)
!35 = !DILocation(line: 10, column: 10, scope: !7)
!36 = !DILocation(line: 10, column: 3, scope: !7)
!37 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 13, type: !38, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!12}
!40 = !DILocalVariable(name: "v", scope: !37, file: !1, line: 15, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 640, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 10)
!44 = !DILocation(line: 15, column: 10, scope: !37)
!45 = !DILocation(line: 16, column: 22, scope: !37)
!46 = !DILocation(line: 16, column: 18, scope: !37)
!47 = !DILocation(line: 16, column: 3, scope: !37)
!48 = !DILocation(line: 17, column: 3, scope: !37)
