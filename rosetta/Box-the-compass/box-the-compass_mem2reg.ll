; ModuleID = 'box-the-compass.ll'
source_filename = "box-the-compass.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.degrees = private unnamed_addr constant [33 x double] [double 0.000000e+00, double 1.687000e+01, double 1.688000e+01, double 3.375000e+01, double 5.062000e+01, double 5.063000e+01, double 6.750000e+01, double 8.437000e+01, double 0x40551851EB851EB8, double 1.012500e+02, double 1.181200e+02, double 1.181300e+02, double 1.350000e+02, double 1.518700e+02, double 1.518800e+02, double 1.687500e+02, double 1.856200e+02, double 1.856300e+02, double 2.025000e+02, double 2.193700e+02, double 2.193800e+02, double 2.362500e+02, double 2.531200e+02, double 2.531300e+02, double 2.700000e+02, double 2.868700e+02, double 2.868800e+02, double 3.037500e+02, double 3.206200e+02, double 3.206300e+02, double 3.375000e+02, double 3.543700e+02, double 3.543800e+02], align 16
@.str = private unnamed_addr constant [727 x i8] c"North                 North by east         North-northeast       Northeast by north    Northeast             Northeast by east     East-northeast        East by north         East                  East by south         East-southeast        Southeast by east     Southeast             Southeast by south    South-southeast       South by east         South                 South by west         South-southwest       Southwest by south    Southwest             Southwest by west     West-southwest        West by south         West                  West by north         West-northwest        Northwest by west     Northwest             Northwest by north    North-northwest       North by west         North                 \00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"%2d  %.22s  %6.2f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %degrees = alloca [33 x double], align 16
  call void @llvm.dbg.declare(metadata [33 x double]* %degrees, metadata !11, metadata !DIExpression()), !dbg !16
  %0 = bitcast [33 x double]* %degrees to i8*, !dbg !16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([33 x double]* @__const.main.degrees to i8*), i64 264, i1 false), !dbg !16
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([727 x i8], [727 x i8]* @.str, i64 0, i64 0), metadata !17, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 0, metadata !22, metadata !DIExpression()), !dbg !21
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !25
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !22, metadata !DIExpression()), !dbg !21
  %cmp = icmp slt i32 %i.0, 33, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !29
  %arrayidx = getelementptr inbounds [33 x double], [33 x double]* %degrees, i64 0, i64 %idxprom, !dbg !29
  %1 = load double, double* %arrayidx, align 8, !dbg !29
  %mul = fmul double %1, 3.200000e+01, !dbg !31
  %div = fdiv double %mul, 3.600000e+02, !dbg !32
  %add = fadd double 5.000000e-01, %div, !dbg !33
  %conv = fptosi double %add to i32, !dbg !34
  call void @llvm.dbg.value(metadata i32 %conv, metadata !35, metadata !DIExpression()), !dbg !21
  %rem = srem i32 %conv, 32, !dbg !36
  %add1 = add nsw i32 %rem, 1, !dbg !37
  %rem2 = srem i32 %conv, 32, !dbg !38
  %mul3 = mul nsw i32 %rem2, 22, !dbg !39
  %idx.ext = sext i32 %mul3 to i64, !dbg !40
  %add.ptr = getelementptr inbounds i8, i8* getelementptr inbounds ([727 x i8], [727 x i8]* @.str, i64 0, i64 0), i64 %idx.ext, !dbg !40
  %idxprom4 = sext i32 %i.0 to i64, !dbg !41
  %arrayidx5 = getelementptr inbounds [33 x double], [33 x double]* %degrees, i64 0, i64 %idxprom4, !dbg !41
  %2 = load double, double* %arrayidx5, align 8, !dbg !41
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %add1, i8* %add.ptr, double %2), !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !44
  call void @llvm.dbg.value(metadata i32 %inc, metadata !22, metadata !DIExpression()), !dbg !21
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !48
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "box-the-compass.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Box-the-compass")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "degrees", scope: !7, file: !1, line: 6, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2112, elements: !14)
!13 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!14 = !{!15}
!15 = !DISubrange(count: 33)
!16 = !DILocation(line: 6, column: 16, scope: !7)
!17 = !DILocalVariable(name: "names", scope: !7, file: !1, line: 11, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 0, scope: !7)
!22 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 5, type: !10)
!23 = !DILocation(line: 45, column: 14, scope: !24)
!24 = distinct !DILexicalBlock(scope: !7, file: !1, line: 45, column: 9)
!25 = !DILocation(line: 0, scope: !24)
!26 = !DILocation(line: 45, column: 23, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !1, line: 45, column: 9)
!28 = !DILocation(line: 45, column: 9, scope: !24)
!29 = !DILocation(line: 46, column: 26, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !1, line: 45, column: 34)
!31 = !DILocation(line: 46, column: 37, scope: !30)
!32 = !DILocation(line: 46, column: 42, scope: !30)
!33 = !DILocation(line: 46, column: 24, scope: !30)
!34 = !DILocation(line: 46, column: 21, scope: !30)
!35 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 5, type: !10)
!36 = !DILocation(line: 48, column: 50, scope: !30)
!37 = !DILocation(line: 48, column: 56, scope: !30)
!38 = !DILocation(line: 48, column: 72, scope: !30)
!39 = !DILocation(line: 48, column: 78, scope: !30)
!40 = !DILocation(line: 48, column: 67, scope: !30)
!41 = !DILocation(line: 49, column: 25, scope: !30)
!42 = !DILocation(line: 48, column: 17, scope: !30)
!43 = !DILocation(line: 50, column: 9, scope: !30)
!44 = !DILocation(line: 45, column: 30, scope: !27)
!45 = !DILocation(line: 45, column: 9, scope: !27)
!46 = distinct !{!46, !28, !47}
!47 = !DILocation(line: 50, column: 9, scope: !24)
!48 = !DILocation(line: 52, column: 9, scope: !7)
