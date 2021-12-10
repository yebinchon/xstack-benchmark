; ModuleID = 'generate-lower-case-ascii-alphabet.ll'
source_filename = "generate-lower-case-ascii-alphabet.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %lower = alloca [26 x i8], align 16
  call void @llvm.dbg.declare(metadata [26 x i8]* %lower, metadata !11, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.value(metadata i64 0, metadata !17, metadata !DIExpression()), !dbg !22
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %inc, %for.inc ], !dbg !22
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !17, metadata !DIExpression()), !dbg !22
  %cmp = icmp ult i64 %i.0, 26, !dbg !24
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %add = add i64 %i.0, 97, !dbg !27
  %conv = trunc i64 %add to i8, !dbg !29
  %arrayidx = getelementptr inbounds [26 x i8], [26 x i8]* %lower, i64 0, i64 %i.0, !dbg !30
  store i8 %conv, i8* %arrayidx, align 1, !dbg !31
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1, !dbg !33
  call void @llvm.dbg.value(metadata i64 %inc, metadata !17, metadata !DIExpression()), !dbg !22
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "generate-lower-case-ascii-alphabet.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Generate-lower-case-ASCII-alphabet")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "lower", scope: !7, file: !1, line: 6, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 208, elements: !14)
!13 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!14 = !{!15}
!15 = !DISubrange(count: 26)
!16 = !DILocation(line: 6, column: 19, scope: !7)
!17 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 8, type: !19)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 5)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !20, line: 46, baseType: !21)
!20 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs-old/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!21 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 0, scope: !18)
!23 = !DILocation(line: 8, column: 10, scope: !18)
!24 = !DILocation(line: 8, column: 26, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !1, line: 8, column: 5)
!26 = !DILocation(line: 8, column: 5, scope: !18)
!27 = !DILocation(line: 9, column: 22, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 8, column: 36)
!29 = !DILocation(line: 9, column: 20, scope: !28)
!30 = !DILocation(line: 9, column: 9, scope: !28)
!31 = !DILocation(line: 9, column: 18, scope: !28)
!32 = !DILocation(line: 10, column: 5, scope: !28)
!33 = !DILocation(line: 8, column: 32, scope: !25)
!34 = !DILocation(line: 8, column: 5, scope: !25)
!35 = distinct !{!35, !26, !36}
!36 = !DILocation(line: 10, column: 5, scope: !18)
!37 = !DILocation(line: 12, column: 5, scope: !7)
