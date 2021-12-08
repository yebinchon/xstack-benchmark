; ModuleID = 'dot-product.ll'
source_filename = "dot-product.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.a = private unnamed_addr constant [3 x i32] [i32 1, i32 3, i32 -5], align 4
@__const.main.b = private unnamed_addr constant [3 x i32] [i32 4, i32 -2, i32 -1], align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %a = alloca [3 x i32], align 4
  %b = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %a, metadata !11, metadata !DIExpression()), !dbg !15
  %0 = bitcast [3 x i32]* %a to i8*, !dbg !15
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([3 x i32]* @__const.main.a to i8*), i64 12, i1 false), !dbg !15
  call void @llvm.dbg.declare(metadata [3 x i32]* %b, metadata !16, metadata !DIExpression()), !dbg !17
  %1 = bitcast [3 x i32]* %b to i8*, !dbg !17
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 4 bitcast ([3 x i32]* @__const.main.b to i8*), i64 12, i1 false), !dbg !17
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0, !dbg !18
  %arraydecay1 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0, !dbg !19
  %call = call i32 @dot_product(i32* %arraydecay, i32* %arraydecay1, i64 3), !dbg !20
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !21
  ret i32 0, !dbg !22
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dot_product(i32* %a, i32* %b, i64 %n) #0 !dbg !23 {
entry:
  call void @llvm.dbg.value(metadata i32* %a, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32* %b, metadata !32, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i64 %n, metadata !33, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i64 0, metadata !35, metadata !DIExpression()), !dbg !31
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %sum.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ], !dbg !31
  %i.0 = phi i64 [ 0, %entry ], [ %inc, %for.inc ], !dbg !38
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !35, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !34, metadata !DIExpression()), !dbg !31
  %cmp = icmp ult i64 %i.0, %n, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %i.0, !dbg !42
  %0 = load i32, i32* %arrayidx, align 4, !dbg !42
  %arrayidx1 = getelementptr inbounds i32, i32* %b, i64 %i.0, !dbg !44
  %1 = load i32, i32* %arrayidx1, align 4, !dbg !44
  %mul = mul nsw i32 %0, %1, !dbg !45
  %add = add nsw i32 %sum.0, %mul, !dbg !46
  call void @llvm.dbg.value(metadata i32 %add, metadata !34, metadata !DIExpression()), !dbg !31
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1, !dbg !48
  call void @llvm.dbg.value(metadata i64 %inc, metadata !35, metadata !DIExpression()), !dbg !31
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  ret i32 %sum.0, !dbg !52
}

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
!1 = !DIFile(filename: "dot-product.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Dot-product")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 7, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 9, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 96, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 3)
!15 = !DILocation(line: 9, column: 13, scope: !7)
!16 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 10, type: !12)
!17 = !DILocation(line: 10, column: 13, scope: !7)
!18 = !DILocation(line: 12, column: 36, scope: !7)
!19 = !DILocation(line: 12, column: 39, scope: !7)
!20 = !DILocation(line: 12, column: 24, scope: !7)
!21 = !DILocation(line: 12, column: 9, scope: !7)
!22 = !DILocation(line: 14, column: 9, scope: !7)
!23 = distinct !DISubprogram(name: "dot_product", scope: !1, file: !1, line: 18, type: !24, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{!10, !26, !26, !27}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !28, line: 46, baseType: !29)
!28 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocalVariable(name: "a", arg: 1, scope: !23, file: !1, line: 18, type: !26)
!31 = !DILocation(line: 0, scope: !23)
!32 = !DILocalVariable(name: "b", arg: 2, scope: !23, file: !1, line: 18, type: !26)
!33 = !DILocalVariable(name: "n", arg: 3, scope: !23, file: !1, line: 18, type: !27)
!34 = !DILocalVariable(name: "sum", scope: !23, file: !1, line: 20, type: !10)
!35 = !DILocalVariable(name: "i", scope: !23, file: !1, line: 21, type: !27)
!36 = !DILocation(line: 23, column: 14, scope: !37)
!37 = distinct !DILexicalBlock(scope: !23, file: !1, line: 23, column: 9)
!38 = !DILocation(line: 0, scope: !37)
!39 = !DILocation(line: 23, column: 23, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 23, column: 9)
!41 = !DILocation(line: 23, column: 9, scope: !37)
!42 = !DILocation(line: 24, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 23, column: 33)
!44 = !DILocation(line: 24, column: 31, scope: !43)
!45 = !DILocation(line: 24, column: 29, scope: !43)
!46 = !DILocation(line: 24, column: 21, scope: !43)
!47 = !DILocation(line: 25, column: 9, scope: !43)
!48 = !DILocation(line: 23, column: 29, scope: !40)
!49 = !DILocation(line: 23, column: 9, scope: !40)
!50 = distinct !{!50, !41, !51}
!51 = !DILocation(line: 25, column: 9, scope: !37)
!52 = !DILocation(line: 27, column: 9, scope: !23)
