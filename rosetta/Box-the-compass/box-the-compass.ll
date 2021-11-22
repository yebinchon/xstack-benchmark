; ModuleID = 'box-the-compass.c'
source_filename = "box-the-compass.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.degrees = private unnamed_addr constant [33 x double] [double 0.000000e+00, double 1.687000e+01, double 1.688000e+01, double 3.375000e+01, double 5.062000e+01, double 5.063000e+01, double 6.750000e+01, double 8.437000e+01, double 0x40551851EB851EB8, double 1.012500e+02, double 1.181200e+02, double 1.181300e+02, double 1.350000e+02, double 1.518700e+02, double 1.518800e+02, double 1.687500e+02, double 1.856200e+02, double 1.856300e+02, double 2.025000e+02, double 2.193700e+02, double 2.193800e+02, double 2.362500e+02, double 2.531200e+02, double 2.531300e+02, double 2.700000e+02, double 2.868700e+02, double 2.868800e+02, double 3.037500e+02, double 3.206200e+02, double 3.206300e+02, double 3.375000e+02, double 3.543700e+02, double 3.543800e+02], align 16
@.str = private unnamed_addr constant [727 x i8] c"North                 North by east         North-northeast       Northeast by north    Northeast             Northeast by east     East-northeast        East by north         East                  East by south         East-southeast        Southeast by east     Southeast             Southeast by south    South-southeast       South by east         South                 South by west         South-southwest       Southwest by south    Southwest             Southwest by west     West-southwest        West by south         West                  West by north         West-northwest        Northwest by west     Northwest             Northwest by north    North-northwest       North by west         North                 \00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"%2d  %.22s  %6.2f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %degrees = alloca [33 x double], align 16
  %names = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %j, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata [33 x double]* %degrees, metadata !15, metadata !DIExpression()), !dbg !20
  %0 = bitcast [33 x double]* %degrees to i8*, !dbg !20
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([33 x double]* @__const.main.degrees to i8*), i64 264, i1 false), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %names, metadata !21, metadata !DIExpression()), !dbg !25
  store i8* getelementptr inbounds ([727 x i8], [727 x i8]* @.str, i64 0, i64 0), i8** %names, align 8, !dbg !25
  store i32 0, i32* %i, align 4, !dbg !26
  br label %for.cond, !dbg !28

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !29
  %cmp = icmp slt i32 %1, 33, !dbg !31
  br i1 %cmp, label %for.body, label %for.end, !dbg !32

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !33
  %idxprom = sext i32 %2 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [33 x double], [33 x double]* %degrees, i64 0, i64 %idxprom, !dbg !35
  %3 = load double, double* %arrayidx, align 8, !dbg !35
  %mul = fmul double %3, 3.200000e+01, !dbg !36
  %div = fdiv double %mul, 3.600000e+02, !dbg !37
  %add = fadd double 5.000000e-01, %div, !dbg !38
  %conv = fptosi double %add to i32, !dbg !39
  store i32 %conv, i32* %j, align 4, !dbg !40
  %4 = load i32, i32* %j, align 4, !dbg !41
  %rem = srem i32 %4, 32, !dbg !42
  %add1 = add nsw i32 %rem, 1, !dbg !43
  %5 = load i8*, i8** %names, align 8, !dbg !44
  %6 = load i32, i32* %j, align 4, !dbg !45
  %rem2 = srem i32 %6, 32, !dbg !46
  %mul3 = mul nsw i32 %rem2, 22, !dbg !47
  %idx.ext = sext i32 %mul3 to i64, !dbg !48
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %idx.ext, !dbg !48
  %7 = load i32, i32* %i, align 4, !dbg !49
  %idxprom4 = sext i32 %7 to i64, !dbg !50
  %arrayidx5 = getelementptr inbounds [33 x double], [33 x double]* %degrees, i64 0, i64 %idxprom4, !dbg !50
  %8 = load double, double* %arrayidx5, align 8, !dbg !50
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %add1, i8* %add.ptr, double %8), !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %9, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !57
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
!1 = !DIFile(filename: "box-the-compass.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Box-the-compass")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 13, scope: !7)
!13 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 5, column: 16, scope: !7)
!15 = !DILocalVariable(name: "degrees", scope: !7, file: !1, line: 6, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 2112, elements: !18)
!17 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!18 = !{!19}
!19 = !DISubrange(count: 33)
!20 = !DILocation(line: 6, column: 16, scope: !7)
!21 = !DILocalVariable(name: "names", scope: !7, file: !1, line: 11, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !24)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DILocation(line: 11, column: 22, scope: !7)
!26 = !DILocation(line: 45, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 45, column: 9)
!28 = !DILocation(line: 45, column: 14, scope: !27)
!29 = !DILocation(line: 45, column: 21, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !1, line: 45, column: 9)
!31 = !DILocation(line: 45, column: 23, scope: !30)
!32 = !DILocation(line: 45, column: 9, scope: !27)
!33 = !DILocation(line: 46, column: 34, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !1, line: 45, column: 34)
!35 = !DILocation(line: 46, column: 26, scope: !34)
!36 = !DILocation(line: 46, column: 37, scope: !34)
!37 = !DILocation(line: 46, column: 42, scope: !34)
!38 = !DILocation(line: 46, column: 24, scope: !34)
!39 = !DILocation(line: 46, column: 21, scope: !34)
!40 = !DILocation(line: 46, column: 19, scope: !34)
!41 = !DILocation(line: 48, column: 48, scope: !34)
!42 = !DILocation(line: 48, column: 50, scope: !34)
!43 = !DILocation(line: 48, column: 56, scope: !34)
!44 = !DILocation(line: 48, column: 61, scope: !34)
!45 = !DILocation(line: 48, column: 70, scope: !34)
!46 = !DILocation(line: 48, column: 72, scope: !34)
!47 = !DILocation(line: 48, column: 78, scope: !34)
!48 = !DILocation(line: 48, column: 67, scope: !34)
!49 = !DILocation(line: 49, column: 33, scope: !34)
!50 = !DILocation(line: 49, column: 25, scope: !34)
!51 = !DILocation(line: 48, column: 17, scope: !34)
!52 = !DILocation(line: 50, column: 9, scope: !34)
!53 = !DILocation(line: 45, column: 30, scope: !30)
!54 = !DILocation(line: 45, column: 9, scope: !30)
!55 = distinct !{!55, !32, !56}
!56 = !DILocation(line: 50, column: 9, scope: !27)
!57 = !DILocation(line: 52, column: 9, scope: !7)
