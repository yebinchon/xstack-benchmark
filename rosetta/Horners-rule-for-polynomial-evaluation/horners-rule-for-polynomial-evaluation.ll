; ModuleID = 'horners-rule-for-polynomial-evaluation.c'
source_filename = "horners-rule-for-polynomial-evaluation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.coeffs = private unnamed_addr constant [4 x double] [double -1.900000e+01, double 7.000000e+00, double -4.000000e+00, double 6.000000e+00], align 16
@.str = private unnamed_addr constant [7 x i8] c"%5.1f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @horner(double* %coeffs, i32 %s, double %x) #0 !dbg !7 {
entry:
  %coeffs.addr = alloca double*, align 8
  %s.addr = alloca i32, align 4
  %x.addr = alloca double, align 8
  %i = alloca i32, align 4
  %res = alloca double, align 8
  store double* %coeffs, double** %coeffs.addr, align 8
  call void @llvm.dbg.declare(metadata double** %coeffs.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %s, i32* %s.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %s.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata double* %res, metadata !21, metadata !DIExpression()), !dbg !22
  store double 0.000000e+00, double* %res, align 8, !dbg !22
  %0 = load i32, i32* %s.addr, align 4, !dbg !23
  %sub = sub nsw i32 %0, 1, !dbg !25
  store i32 %sub, i32* %i, align 4, !dbg !26
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp sge i32 %1, 0, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %2 = load double, double* %res, align 8, !dbg !32
  %3 = load double, double* %x.addr, align 8, !dbg !34
  %mul = fmul double %2, %3, !dbg !35
  %4 = load double*, double** %coeffs.addr, align 8, !dbg !36
  %5 = load i32, i32* %i, align 4, !dbg !37
  %idxprom = sext i32 %5 to i64, !dbg !36
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom, !dbg !36
  %6 = load double, double* %arrayidx, align 8, !dbg !36
  %add = fadd double %mul, %6, !dbg !38
  store double %add, double* %res, align 8, !dbg !39
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !41
  %dec = add nsw i32 %7, -1, !dbg !41
  store i32 %dec, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  %8 = load double, double* %res, align 8, !dbg !45
  ret double %8, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %coeffs = alloca [4 x double], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x double]* %coeffs, metadata !50, metadata !DIExpression()), !dbg !54
  %0 = bitcast [4 x double]* %coeffs to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x double]* @__const.main.coeffs to i8*), i64 32, i1 false), !dbg !54
  %arraydecay = getelementptr inbounds [4 x double], [4 x double]* %coeffs, i64 0, i64 0, !dbg !55
  %call = call double @horner(double* %arraydecay, i32 4, double 3.000000e+00), !dbg !56
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %call), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "horners-rule-for-polynomial-evaluation.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Horners-rule-for-polynomial-evaluation")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "horner", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !12, !10}
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "coeffs", arg: 1, scope: !7, file: !1, line: 3, type: !11)
!14 = !DILocation(line: 3, column: 23, scope: !7)
!15 = !DILocalVariable(name: "s", arg: 2, scope: !7, file: !1, line: 3, type: !12)
!16 = !DILocation(line: 3, column: 35, scope: !7)
!17 = !DILocalVariable(name: "x", arg: 3, scope: !7, file: !1, line: 3, type: !10)
!18 = !DILocation(line: 3, column: 45, scope: !7)
!19 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 5, type: !12)
!20 = !DILocation(line: 5, column: 7, scope: !7)
!21 = !DILocalVariable(name: "res", scope: !7, file: !1, line: 6, type: !10)
!22 = !DILocation(line: 6, column: 10, scope: !7)
!23 = !DILocation(line: 8, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 3)
!25 = !DILocation(line: 8, column: 10, scope: !24)
!26 = !DILocation(line: 8, column: 8, scope: !24)
!27 = !DILocation(line: 8, column: 7, scope: !24)
!28 = !DILocation(line: 8, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !1, line: 8, column: 3)
!30 = !DILocation(line: 8, column: 16, scope: !29)
!31 = !DILocation(line: 8, column: 3, scope: !24)
!32 = !DILocation(line: 10, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !1, line: 9, column: 3)
!34 = !DILocation(line: 10, column: 17, scope: !33)
!35 = !DILocation(line: 10, column: 15, scope: !33)
!36 = !DILocation(line: 10, column: 21, scope: !33)
!37 = !DILocation(line: 10, column: 28, scope: !33)
!38 = !DILocation(line: 10, column: 19, scope: !33)
!39 = !DILocation(line: 10, column: 9, scope: !33)
!40 = !DILocation(line: 11, column: 3, scope: !33)
!41 = !DILocation(line: 8, column: 23, scope: !29)
!42 = !DILocation(line: 8, column: 3, scope: !29)
!43 = distinct !{!43, !31, !44}
!44 = !DILocation(line: 11, column: 3, scope: !24)
!45 = !DILocation(line: 12, column: 10, scope: !7)
!46 = !DILocation(line: 12, column: 3, scope: !7)
!47 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !48, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!12}
!50 = !DILocalVariable(name: "coeffs", scope: !47, file: !1, line: 18, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 256, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 4)
!54 = !DILocation(line: 18, column: 10, scope: !47)
!55 = !DILocation(line: 20, column: 28, scope: !47)
!56 = !DILocation(line: 20, column: 21, scope: !47)
!57 = !DILocation(line: 20, column: 3, scope: !47)
!58 = !DILocation(line: 21, column: 3, scope: !47)
