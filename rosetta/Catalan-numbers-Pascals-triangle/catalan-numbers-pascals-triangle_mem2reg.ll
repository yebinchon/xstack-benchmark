; ModuleID = 'catalan-numbers-pascals-triangle.ll'
source_filename = "catalan-numbers-pascals-triangle.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@N = dso_local constant i32 15, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"1 \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !12 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !15
  call void @llvm.dbg.value(metadata i32 2, metadata !16, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !18

for.cond:                                         ; preds = %for.inc8, %entry
  %n.0 = phi i32 [ 2, %entry ], [ %inc9, %for.inc8 ], !dbg !20
  %catalan.0 = phi i32 [ undef, %entry ], [ %catalan.1, %for.inc8 ]
  call void @llvm.dbg.value(metadata i32 %catalan.0, metadata !21, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !16, metadata !DIExpression()), !dbg !17
  %cmp = icmp sle i32 %n.0, 15, !dbg !22
  br i1 %cmp, label %for.body, label %for.end10, !dbg !24

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i64 1, metadata !25, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 1, metadata !27, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 2, metadata !28, metadata !DIExpression()), !dbg !17
  br label %for.cond1, !dbg !29

for.cond1:                                        ; preds = %for.inc, %for.body
  %den.0 = phi i64 [ 1, %for.body ], [ %mul5, %for.inc ], !dbg !32
  %num.0 = phi i64 [ 1, %for.body ], [ %mul, %for.inc ], !dbg !32
  %k.0 = phi i32 [ 2, %for.body ], [ %inc, %for.inc ], !dbg !33
  %catalan.1 = phi i32 [ %catalan.0, %for.body ], [ %conv6, %for.inc ]
  call void @llvm.dbg.value(metadata i32 %catalan.1, metadata !21, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !28, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 %num.0, metadata !27, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 %den.0, metadata !25, metadata !DIExpression()), !dbg !17
  %cmp2 = icmp sle i32 %k.0, %n.0, !dbg !34
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !36

for.body3:                                        ; preds = %for.cond1
  %add = add nsw i32 %n.0, %k.0, !dbg !37
  %conv = sext i32 %add to i64, !dbg !39
  %mul = mul i64 %num.0, %conv, !dbg !40
  call void @llvm.dbg.value(metadata i64 %mul, metadata !27, metadata !DIExpression()), !dbg !17
  %conv4 = sext i32 %k.0 to i64, !dbg !41
  %mul5 = mul i64 %den.0, %conv4, !dbg !42
  call void @llvm.dbg.value(metadata i64 %mul5, metadata !25, metadata !DIExpression()), !dbg !17
  %div = udiv i64 %mul, %mul5, !dbg !43
  %conv6 = trunc i64 %div to i32, !dbg !44
  call void @llvm.dbg.value(metadata i32 %conv6, metadata !21, metadata !DIExpression()), !dbg !17
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %k.0, 1, !dbg !46
  call void @llvm.dbg.value(metadata i32 %inc, metadata !28, metadata !DIExpression()), !dbg !17
  br label %for.cond1, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond1
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %catalan.1), !dbg !50
  br label %for.inc8, !dbg !51

for.inc8:                                         ; preds = %for.end
  %inc9 = add nsw i32 %n.0, 1, !dbg !52
  call void @llvm.dbg.value(metadata i32 %inc9, metadata !16, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end10:                                        ; preds = %for.cond
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  ret i32 0, !dbg !57
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "N", scope: !2, file: !3, line: 11, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "catalan-numbers-pascals-triangle.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Catalan-numbers-Pascals-triangle")
!4 = !{}
!5 = !{!0}
!6 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!12 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 13, type: !13, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{!7}
!15 = !DILocation(line: 25, column: 5, scope: !12)
!16 = !DILocalVariable(name: "n", scope: !12, file: !3, line: 16, type: !7)
!17 = !DILocation(line: 0, scope: !12)
!18 = !DILocation(line: 28, column: 10, scope: !19)
!19 = distinct !DILexicalBlock(scope: !12, file: !3, line: 28, column: 5)
!20 = !DILocation(line: 0, scope: !19)
!21 = !DILocalVariable(name: "catalan", scope: !12, file: !3, line: 22, type: !7)
!22 = !DILocation(line: 28, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !3, line: 28, column: 5)
!24 = !DILocation(line: 28, column: 5, scope: !19)
!25 = !DILocalVariable(name: "den", scope: !12, file: !3, line: 19, type: !26)
!26 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocalVariable(name: "num", scope: !12, file: !3, line: 19, type: !26)
!28 = !DILocalVariable(name: "k", scope: !12, file: !3, line: 16, type: !7)
!29 = !DILocation(line: 32, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !3, line: 32, column: 9)
!31 = distinct !DILexicalBlock(scope: !23, file: !3, line: 28, column: 26)
!32 = !DILocation(line: 0, scope: !31)
!33 = !DILocation(line: 0, scope: !30)
!34 = !DILocation(line: 32, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !30, file: !3, line: 32, column: 9)
!36 = !DILocation(line: 32, column: 9, scope: !30)
!37 = !DILocation(line: 33, column: 22, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !3, line: 32, column: 30)
!39 = !DILocation(line: 33, column: 20, scope: !38)
!40 = !DILocation(line: 33, column: 17, scope: !38)
!41 = !DILocation(line: 34, column: 20, scope: !38)
!42 = !DILocation(line: 34, column: 17, scope: !38)
!43 = !DILocation(line: 35, column: 27, scope: !38)
!44 = !DILocation(line: 35, column: 23, scope: !38)
!45 = !DILocation(line: 36, column: 9, scope: !38)
!46 = !DILocation(line: 32, column: 25, scope: !35)
!47 = !DILocation(line: 32, column: 9, scope: !35)
!48 = distinct !{!48, !36, !49}
!49 = !DILocation(line: 36, column: 9, scope: !30)
!50 = !DILocation(line: 39, column: 9, scope: !31)
!51 = !DILocation(line: 40, column: 5, scope: !31)
!52 = !DILocation(line: 28, column: 21, scope: !23)
!53 = !DILocation(line: 28, column: 5, scope: !23)
!54 = distinct !{!54, !24, !55}
!55 = !DILocation(line: 40, column: 5, scope: !19)
!56 = !DILocation(line: 43, column: 5, scope: !12)
!57 = !DILocation(line: 44, column: 5, scope: !12)
