; ModuleID = 'casting-out-nines.ll'
source_filename = "casting-out-nines.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [52 x i8] c"\0ATring %d numbers instead of %d numbers saves %f%%\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 2, metadata !11, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 10, metadata !14, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 0, metadata !15, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 0, metadata !16, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 1, metadata !17, metadata !DIExpression()), !dbg !13
  br label %for.cond, !dbg !18

for.cond:                                         ; preds = %for.inc, %entry
  %c1.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !13
  %c2.0 = phi i32 [ 0, %entry ], [ %c2.1, %for.inc ], !dbg !13
  %k.0 = phi i32 [ 1, %entry ], [ %inc9, %for.inc ], !dbg !20
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !17, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 %c2.0, metadata !16, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 %c1.0, metadata !15, metadata !DIExpression()), !dbg !13
  %conv = sitofp i32 %k.0 to double, !dbg !21
  %conv1 = sitofp i32 10 to double, !dbg !23
  %call = call double @pow(double %conv1, double 2.000000e+00) #4, !dbg !24
  %cmp = fcmp olt double %conv, %call, !dbg !25
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %inc = add nsw i32 %c1.0, 1, !dbg !27
  call void @llvm.dbg.value(metadata i32 %inc, metadata !15, metadata !DIExpression()), !dbg !13
  %sub = sub nsw i32 10, 1, !dbg !29
  %rem = srem i32 %k.0, %sub, !dbg !31
  %mul = mul nsw i32 %k.0, %k.0, !dbg !32
  %sub3 = sub nsw i32 10, 1, !dbg !33
  %rem4 = srem i32 %mul, %sub3, !dbg !34
  %cmp5 = icmp eq i32 %rem, %rem4, !dbg !35
  br i1 %cmp5, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %for.body
  %inc7 = add nsw i32 %c2.0, 1, !dbg !37
  call void @llvm.dbg.value(metadata i32 %inc7, metadata !16, metadata !DIExpression()), !dbg !13
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %k.0), !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %for.body
  %c2.1 = phi i32 [ %inc7, %if.then ], [ %c2.0, %for.body ], !dbg !13
  call void @llvm.dbg.value(metadata i32 %c2.1, metadata !16, metadata !DIExpression()), !dbg !13
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %if.end
  %inc9 = add nsw i32 %k.0, 1, !dbg !42
  call void @llvm.dbg.value(metadata i32 %inc9, metadata !17, metadata !DIExpression()), !dbg !13
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  %conv10 = sitofp i32 %c2.0 to double, !dbg !46
  %mul11 = fmul double 1.000000e+02, %conv10, !dbg !47
  %conv12 = sitofp i32 %c1.0 to double, !dbg !48
  %div = fdiv double %mul11, %conv12, !dbg !49
  %sub13 = fsub double 1.000000e+02, %div, !dbg !50
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.1, i64 0, i64 0), i32 %c2.0, i32 %c1.0, double %sub13), !dbg !51
  ret i32 0, !dbg !52
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "casting-out-nines.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Casting-out-nines")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "N", scope: !7, file: !1, line: 5, type: !12)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocalVariable(name: "base", scope: !7, file: !1, line: 6, type: !10)
!15 = !DILocalVariable(name: "c1", scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocalVariable(name: "c2", scope: !7, file: !1, line: 8, type: !10)
!17 = !DILocalVariable(name: "k", scope: !7, file: !1, line: 9, type: !10)
!18 = !DILocation(line: 11, column: 10, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 5)
!20 = !DILocation(line: 0, scope: !19)
!21 = !DILocation(line: 11, column: 17, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !1, line: 11, column: 5)
!23 = !DILocation(line: 11, column: 25, scope: !22)
!24 = !DILocation(line: 11, column: 21, scope: !22)
!25 = !DILocation(line: 11, column: 19, scope: !22)
!26 = !DILocation(line: 11, column: 5, scope: !19)
!27 = !DILocation(line: 12, column: 11, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !1, line: 11, column: 40)
!29 = !DILocation(line: 13, column: 23, scope: !30)
!30 = distinct !DILexicalBlock(scope: !28, file: !1, line: 13, column: 13)
!31 = !DILocation(line: 13, column: 15, scope: !30)
!32 = !DILocation(line: 13, column: 34, scope: !30)
!33 = !DILocation(line: 13, column: 47, scope: !30)
!34 = !DILocation(line: 13, column: 39, scope: !30)
!35 = !DILocation(line: 13, column: 28, scope: !30)
!36 = !DILocation(line: 13, column: 13, scope: !28)
!37 = !DILocation(line: 14, column: 15, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !1, line: 13, column: 53)
!39 = !DILocation(line: 15, column: 13, scope: !38)
!40 = !DILocation(line: 16, column: 9, scope: !38)
!41 = !DILocation(line: 17, column: 5, scope: !28)
!42 = !DILocation(line: 11, column: 36, scope: !22)
!43 = !DILocation(line: 11, column: 5, scope: !22)
!44 = distinct !{!44, !26, !45}
!45 = !DILocation(line: 17, column: 5, scope: !19)
!46 = !DILocation(line: 19, column: 93, scope: !7)
!47 = !DILocation(line: 19, column: 91, scope: !7)
!48 = !DILocation(line: 19, column: 98, scope: !7)
!49 = !DILocation(line: 19, column: 96, scope: !7)
!50 = !DILocation(line: 19, column: 83, scope: !7)
!51 = !DILocation(line: 19, column: 5, scope: !7)
!52 = !DILocation(line: 20, column: 5, scope: !7)
