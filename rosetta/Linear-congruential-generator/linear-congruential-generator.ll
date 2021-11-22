; ModuleID = 'linear-congruential-generator.c'
source_filename = "linear-congruential-generator.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@rseed = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"rand max is %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rand() #0 !dbg !11 {
entry:
  %0 = load i32, i32* @rseed, align 4, !dbg !14
  %mul = mul nsw i32 %0, 1103515245, !dbg !15
  %add = add nsw i32 %mul, 12345, !dbg !16
  %and = and i32 %add, 2147483647, !dbg !17
  store i32 %and, i32* @rseed, align 4, !dbg !18
  ret i32 %and, !dbg !19
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !20 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !22
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i32 2147483647), !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 100, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %call1 = call i32 @rand(), !dbg !31
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %call1), !dbg !32
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !33
  %inc = add nsw i32 %1, 1, !dbg !33
  store i32 %inc, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9}
!llvm.ident = !{!10}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "rseed", scope: !2, file: !3, line: 5, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "linear-congruential-generator.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Linear-congruential-generator")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!11 = distinct !DISubprogram(name: "rand", scope: !3, file: !3, line: 15, type: !12, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!12 = !DISubroutineType(types: !13)
!13 = !{!6}
!14 = !DILocation(line: 17, column: 18, scope: !11)
!15 = !DILocation(line: 17, column: 24, scope: !11)
!16 = !DILocation(line: 17, column: 37, scope: !11)
!17 = !DILocation(line: 17, column: 46, scope: !11)
!18 = !DILocation(line: 17, column: 15, scope: !11)
!19 = !DILocation(line: 17, column: 2, scope: !11)
!20 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 32, type: !12, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DILocalVariable(name: "i", scope: !20, file: !3, line: 34, type: !6)
!22 = !DILocation(line: 34, column: 6, scope: !20)
!23 = !DILocation(line: 35, column: 2, scope: !20)
!24 = !DILocation(line: 37, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !20, file: !3, line: 37, column: 2)
!26 = !DILocation(line: 37, column: 7, scope: !25)
!27 = !DILocation(line: 37, column: 14, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !3, line: 37, column: 2)
!29 = !DILocation(line: 37, column: 16, scope: !28)
!30 = !DILocation(line: 37, column: 2, scope: !25)
!31 = !DILocation(line: 38, column: 18, scope: !28)
!32 = !DILocation(line: 38, column: 3, scope: !28)
!33 = !DILocation(line: 37, column: 24, scope: !28)
!34 = !DILocation(line: 37, column: 2, scope: !28)
!35 = distinct !{!35, !30, !36}
!36 = !DILocation(line: 38, column: 24, scope: !25)
!37 = !DILocation(line: 40, column: 2, scope: !20)
