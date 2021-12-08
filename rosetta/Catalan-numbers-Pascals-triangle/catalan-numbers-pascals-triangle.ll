; ModuleID = 'catalan-numbers-pascals-triangle.bc'
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
  %retval = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %num = alloca i64, align 8
  %den = alloca i64, align 8
  %catalan = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %k, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %n, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i64* %num, metadata !19, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64* %den, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %catalan, metadata !24, metadata !DIExpression()), !dbg !25
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !26
  store i32 2, i32* %n, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %n, align 4, !dbg !30
  %cmp = icmp sle i32 %0, 15, !dbg !32
  br i1 %cmp, label %for.body, label %for.end10, !dbg !33

for.body:                                         ; preds = %for.cond
  store i64 1, i64* %den, align 8, !dbg !34
  store i64 1, i64* %num, align 8, !dbg !36
  store i32 2, i32* %k, align 4, !dbg !37
  br label %for.cond1, !dbg !39

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %k, align 4, !dbg !40
  %2 = load i32, i32* %n, align 4, !dbg !42
  %cmp2 = icmp sle i32 %1, %2, !dbg !43
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !44

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %n, align 4, !dbg !45
  %4 = load i32, i32* %k, align 4, !dbg !47
  %add = add nsw i32 %3, %4, !dbg !48
  %conv = sext i32 %add to i64, !dbg !49
  %5 = load i64, i64* %num, align 8, !dbg !50
  %mul = mul i64 %5, %conv, !dbg !50
  store i64 %mul, i64* %num, align 8, !dbg !50
  %6 = load i32, i32* %k, align 4, !dbg !51
  %conv4 = sext i32 %6 to i64, !dbg !51
  %7 = load i64, i64* %den, align 8, !dbg !52
  %mul5 = mul i64 %7, %conv4, !dbg !52
  store i64 %mul5, i64* %den, align 8, !dbg !52
  %8 = load i64, i64* %num, align 8, !dbg !53
  %9 = load i64, i64* %den, align 8, !dbg !54
  %div = udiv i64 %8, %9, !dbg !55
  %conv6 = trunc i64 %div to i32, !dbg !53
  store i32 %conv6, i32* %catalan, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body3
  %10 = load i32, i32* %k, align 4, !dbg !58
  %inc = add nsw i32 %10, 1, !dbg !58
  store i32 %inc, i32* %k, align 4, !dbg !58
  br label %for.cond1, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond1
  %11 = load i32, i32* %catalan, align 4, !dbg !62
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %11), !dbg !63
  br label %for.inc8, !dbg !64

for.inc8:                                         ; preds = %for.end
  %12 = load i32, i32* %n, align 4, !dbg !65
  %inc9 = add nsw i32 %12, 1, !dbg !65
  store i32 %inc9, i32* %n, align 4, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end10:                                        ; preds = %for.cond
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

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
!15 = !DILocalVariable(name: "k", scope: !12, file: !3, line: 16, type: !7)
!16 = !DILocation(line: 16, column: 18, scope: !12)
!17 = !DILocalVariable(name: "n", scope: !12, file: !3, line: 16, type: !7)
!18 = !DILocation(line: 16, column: 21, scope: !12)
!19 = !DILocalVariable(name: "num", scope: !12, file: !3, line: 19, type: !20)
!20 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!21 = !DILocation(line: 19, column: 28, scope: !12)
!22 = !DILocalVariable(name: "den", scope: !12, file: !3, line: 19, type: !20)
!23 = !DILocation(line: 19, column: 33, scope: !12)
!24 = !DILocalVariable(name: "catalan", scope: !12, file: !3, line: 22, type: !7)
!25 = !DILocation(line: 22, column: 9, scope: !12)
!26 = !DILocation(line: 25, column: 5, scope: !12)
!27 = !DILocation(line: 28, column: 11, scope: !28)
!28 = distinct !DILexicalBlock(scope: !12, file: !3, line: 28, column: 5)
!29 = !DILocation(line: 28, column: 10, scope: !28)
!30 = !DILocation(line: 28, column: 15, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !3, line: 28, column: 5)
!32 = !DILocation(line: 28, column: 16, scope: !31)
!33 = !DILocation(line: 28, column: 5, scope: !28)
!34 = !DILocation(line: 30, column: 19, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !3, line: 28, column: 26)
!36 = !DILocation(line: 30, column: 13, scope: !35)
!37 = !DILocation(line: 32, column: 15, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !3, line: 32, column: 9)
!39 = !DILocation(line: 32, column: 14, scope: !38)
!40 = !DILocation(line: 32, column: 19, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !3, line: 32, column: 9)
!42 = !DILocation(line: 32, column: 22, scope: !41)
!43 = !DILocation(line: 32, column: 20, scope: !41)
!44 = !DILocation(line: 32, column: 9, scope: !38)
!45 = !DILocation(line: 33, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !41, file: !3, line: 32, column: 30)
!47 = !DILocation(line: 33, column: 23, scope: !46)
!48 = !DILocation(line: 33, column: 22, scope: !46)
!49 = !DILocation(line: 33, column: 20, scope: !46)
!50 = !DILocation(line: 33, column: 17, scope: !46)
!51 = !DILocation(line: 34, column: 20, scope: !46)
!52 = !DILocation(line: 34, column: 17, scope: !46)
!53 = !DILocation(line: 35, column: 23, scope: !46)
!54 = !DILocation(line: 35, column: 28, scope: !46)
!55 = !DILocation(line: 35, column: 27, scope: !46)
!56 = !DILocation(line: 35, column: 21, scope: !46)
!57 = !DILocation(line: 36, column: 9, scope: !46)
!58 = !DILocation(line: 32, column: 25, scope: !41)
!59 = !DILocation(line: 32, column: 9, scope: !41)
!60 = distinct !{!60, !44, !61}
!61 = !DILocation(line: 36, column: 9, scope: !38)
!62 = !DILocation(line: 39, column: 23, scope: !35)
!63 = !DILocation(line: 39, column: 9, scope: !35)
!64 = !DILocation(line: 40, column: 5, scope: !35)
!65 = !DILocation(line: 28, column: 21, scope: !31)
!66 = !DILocation(line: 28, column: 5, scope: !31)
!67 = distinct !{!67, !33, !68}
!68 = !DILocation(line: 40, column: 5, scope: !28)
!69 = !DILocation(line: 43, column: 5, scope: !12)
!70 = !DILocation(line: 44, column: 5, scope: !12)
