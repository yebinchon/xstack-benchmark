; ModuleID = 'averages-root-mean-square.bc'
source_filename = "averages-root-mean-square.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.v = private unnamed_addr constant [10 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00, double 1.000000e+01], align 16
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @rms(double* %v, i32 %n) #0 !dbg !7 {
entry:
  %v.addr = alloca double*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sum = alloca double, align 8
  store double* %v, double** %v.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata double* %sum, metadata !19, metadata !DIExpression()), !dbg !20
  store double 0.000000e+00, double* %sum, align 8, !dbg !20
  store i32 0, i32* %i, align 4, !dbg !21
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !24
  %1 = load i32, i32* %n.addr, align 4, !dbg !26
  %cmp = icmp slt i32 %0, %1, !dbg !27
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %2 = load double*, double** %v.addr, align 8, !dbg !29
  %3 = load i32, i32* %i, align 4, !dbg !30
  %idxprom = sext i32 %3 to i64, !dbg !29
  %arrayidx = getelementptr inbounds double, double* %2, i64 %idxprom, !dbg !29
  %4 = load double, double* %arrayidx, align 8, !dbg !29
  %5 = load double*, double** %v.addr, align 8, !dbg !31
  %6 = load i32, i32* %i, align 4, !dbg !32
  %idxprom1 = sext i32 %6 to i64, !dbg !31
  %arrayidx2 = getelementptr inbounds double, double* %5, i64 %idxprom1, !dbg !31
  %7 = load double, double* %arrayidx2, align 8, !dbg !31
  %mul = fmul double %4, %7, !dbg !33
  %8 = load double, double* %sum, align 8, !dbg !34
  %add = fadd double %8, %mul, !dbg !34
  store double %add, double* %sum, align 8, !dbg !34
  br label %for.inc, !dbg !35

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !36
  %inc = add nsw i32 %9, 1, !dbg !36
  store i32 %inc, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !37, !llvm.loop !38

for.end:                                          ; preds = %for.cond
  %10 = load double, double* %sum, align 8, !dbg !40
  %11 = load i32, i32* %n.addr, align 4, !dbg !41
  %conv = sitofp i32 %11 to double, !dbg !41
  %div = fdiv double %10, %conv, !dbg !42
  %call = call double @sqrt(double %div) #5, !dbg !43
  ret double %call, !dbg !44
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %v = alloca [10 x double], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x double]* %v, metadata !48, metadata !DIExpression()), !dbg !52
  %0 = bitcast [10 x double]* %v to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x double]* @__const.main.v to i8*), i64 80, i1 false), !dbg !52
  %arraydecay = getelementptr inbounds [10 x double], [10 x double]* %v, i64 0, i64 0, !dbg !53
  %call = call double @rms(double* %arraydecay, i32 10), !dbg !54
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %call), !dbg !55
  ret i32 0, !dbg !56
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
!14 = !DILocation(line: 4, column: 20, scope: !7)
!15 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 4, type: !12)
!16 = !DILocation(line: 4, column: 27, scope: !7)
!17 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 6, type: !12)
!18 = !DILocation(line: 6, column: 7, scope: !7)
!19 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 7, type: !10)
!20 = !DILocation(line: 7, column: 10, scope: !7)
!21 = !DILocation(line: 8, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 3)
!23 = !DILocation(line: 8, column: 7, scope: !22)
!24 = !DILocation(line: 8, column: 14, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !1, line: 8, column: 3)
!26 = !DILocation(line: 8, column: 18, scope: !25)
!27 = !DILocation(line: 8, column: 16, scope: !25)
!28 = !DILocation(line: 8, column: 3, scope: !22)
!29 = !DILocation(line: 9, column: 12, scope: !25)
!30 = !DILocation(line: 9, column: 14, scope: !25)
!31 = !DILocation(line: 9, column: 19, scope: !25)
!32 = !DILocation(line: 9, column: 21, scope: !25)
!33 = !DILocation(line: 9, column: 17, scope: !25)
!34 = !DILocation(line: 9, column: 9, scope: !25)
!35 = !DILocation(line: 9, column: 5, scope: !25)
!36 = !DILocation(line: 8, column: 22, scope: !25)
!37 = !DILocation(line: 8, column: 3, scope: !25)
!38 = distinct !{!38, !28, !39}
!39 = !DILocation(line: 9, column: 22, scope: !22)
!40 = !DILocation(line: 10, column: 15, scope: !7)
!41 = !DILocation(line: 10, column: 21, scope: !7)
!42 = !DILocation(line: 10, column: 19, scope: !7)
!43 = !DILocation(line: 10, column: 10, scope: !7)
!44 = !DILocation(line: 10, column: 3, scope: !7)
!45 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 13, type: !46, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!12}
!48 = !DILocalVariable(name: "v", scope: !45, file: !1, line: 15, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 640, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 10)
!52 = !DILocation(line: 15, column: 10, scope: !45)
!53 = !DILocation(line: 16, column: 22, scope: !45)
!54 = !DILocation(line: 16, column: 18, scope: !45)
!55 = !DILocation(line: 16, column: 3, scope: !45)
!56 = !DILocation(line: 17, column: 3, scope: !45)
