; ModuleID = 'dot-product.c'
source_filename = "dot-product.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.a = private unnamed_addr constant [3 x i32] [i32 1, i32 3, i32 -5], align 4
@__const.main.b = private unnamed_addr constant [3 x i32] [i32 4, i32 -2, i32 -1], align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [3 x i32], align 4
  %b = alloca [3 x i32], align 4
  store i32 0, i32* %retval, align 4
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
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  %n.addr = alloca i64, align 8
  %sum = alloca i32, align 4
  %i = alloca i64, align 8
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !30, metadata !DIExpression()), !dbg !31
  store i32* %b, i32** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %b.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 0, i32* %sum, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !43
  %1 = load i64, i64* %n.addr, align 8, !dbg !45
  %cmp = icmp ult i64 %0, %1, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %a.addr, align 8, !dbg !48
  %3 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !48
  %4 = load i32, i32* %arrayidx, align 4, !dbg !48
  %5 = load i32*, i32** %b.addr, align 8, !dbg !51
  %6 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !51
  %7 = load i32, i32* %arrayidx1, align 4, !dbg !51
  %mul = mul nsw i32 %4, %7, !dbg !53
  %8 = load i32, i32* %sum, align 4, !dbg !54
  %add = add nsw i32 %8, %mul, !dbg !54
  store i32 %add, i32* %sum, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %9, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %sum, align 4, !dbg !60
  ret i32 %10, !dbg !61
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "dot-product.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Dot-product")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!28 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocalVariable(name: "a", arg: 1, scope: !23, file: !1, line: 18, type: !26)
!31 = !DILocation(line: 18, column: 18, scope: !23)
!32 = !DILocalVariable(name: "b", arg: 2, scope: !23, file: !1, line: 18, type: !26)
!33 = !DILocation(line: 18, column: 26, scope: !23)
!34 = !DILocalVariable(name: "n", arg: 3, scope: !23, file: !1, line: 18, type: !27)
!35 = !DILocation(line: 18, column: 36, scope: !23)
!36 = !DILocalVariable(name: "sum", scope: !23, file: !1, line: 20, type: !10)
!37 = !DILocation(line: 20, column: 13, scope: !23)
!38 = !DILocalVariable(name: "i", scope: !23, file: !1, line: 21, type: !27)
!39 = !DILocation(line: 21, column: 16, scope: !23)
!40 = !DILocation(line: 23, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !23, file: !1, line: 23, column: 9)
!42 = !DILocation(line: 23, column: 14, scope: !41)
!43 = !DILocation(line: 23, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 23, column: 9)
!45 = !DILocation(line: 23, column: 25, scope: !44)
!46 = !DILocation(line: 23, column: 23, scope: !44)
!47 = !DILocation(line: 23, column: 9, scope: !41)
!48 = !DILocation(line: 24, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !1, line: 23, column: 33)
!50 = !DILocation(line: 24, column: 26, scope: !49)
!51 = !DILocation(line: 24, column: 31, scope: !49)
!52 = !DILocation(line: 24, column: 33, scope: !49)
!53 = !DILocation(line: 24, column: 29, scope: !49)
!54 = !DILocation(line: 24, column: 21, scope: !49)
!55 = !DILocation(line: 25, column: 9, scope: !49)
!56 = !DILocation(line: 23, column: 29, scope: !44)
!57 = !DILocation(line: 23, column: 9, scope: !44)
!58 = distinct !{!58, !47, !59}
!59 = !DILocation(line: 25, column: 9, scope: !41)
!60 = !DILocation(line: 27, column: 16, scope: !23)
!61 = !DILocation(line: 27, column: 9, scope: !23)
