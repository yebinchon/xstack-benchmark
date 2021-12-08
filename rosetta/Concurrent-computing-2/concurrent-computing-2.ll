; ModuleID = 'concurrent-computing-2.bc'
source_filename = "concurrent-computing-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"Enjoy\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Rosetta\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"Code\00", align 1
@__const.main.str = private unnamed_addr constant [3 x i8*] [i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0)], align 16
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %str = alloca [3 x i8*], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x i8*]* %str, metadata !11, metadata !DIExpression()), !dbg !18
  %0 = bitcast [3 x i8*]* %str to i8*, !dbg !18
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([3 x i8*]* @__const.main.str to i8*), i64 24, i1 false), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %i, align 4, !dbg !21
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !23
  %cmp = icmp slt i32 %1, 3, !dbg !25
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !27
  %idxprom = sext i32 %2 to i64, !dbg !28
  %arrayidx = getelementptr inbounds [3 x i8*], [3 x i8*]* %str, i64 0, i64 %idxprom, !dbg !28
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !28
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i8* %3), !dbg !29
  br label %for.inc, !dbg !29

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !30
  %inc = add nsw i32 %4, 1, !dbg !30
  store i32 %inc, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !31, !llvm.loop !32

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !34
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "concurrent-computing-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Concurrent-computing-2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "str", scope: !7, file: !1, line: 6, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 192, elements: !16)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{!17}
!17 = !DISubrange(count: 3)
!18 = !DILocation(line: 6, column: 14, scope: !7)
!19 = !DILocalVariable(name: "i", scope: !20, file: !1, line: 8, type: !10)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 2)
!21 = !DILocation(line: 8, column: 11, scope: !20)
!22 = !DILocation(line: 8, column: 7, scope: !20)
!23 = !DILocation(line: 8, column: 18, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !1, line: 8, column: 2)
!25 = !DILocation(line: 8, column: 20, scope: !24)
!26 = !DILocation(line: 8, column: 2, scope: !20)
!27 = !DILocation(line: 9, column: 22, scope: !24)
!28 = !DILocation(line: 9, column: 18, scope: !24)
!29 = !DILocation(line: 9, column: 3, scope: !24)
!30 = !DILocation(line: 8, column: 26, scope: !24)
!31 = !DILocation(line: 8, column: 2, scope: !24)
!32 = distinct !{!32, !26, !33}
!33 = !DILocation(line: 9, column: 24, scope: !20)
!34 = !DILocation(line: 10, column: 2, scope: !7)
