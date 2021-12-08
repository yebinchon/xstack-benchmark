; ModuleID = 'array-concatenation.ll'
source_filename = "array-concatenation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = dso_local constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16, !dbg !0
@b = dso_local constant [5 x i32] [i32 6, i32 7, i32 8, i32 9, i32 0], align 16, !dbg !11
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @array_concat(i8* %a, i64 %an, i8* %b, i64 %bn, i64 %s) #0 !dbg !21 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i64 %an, metadata !30, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i8* %b, metadata !31, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i64 %bn, metadata !32, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i64 %s, metadata !33, metadata !DIExpression()), !dbg !29
  %add = add i64 %an, %bn, !dbg !34
  %mul = mul i64 %s, %add, !dbg !35
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !36
  call void @llvm.dbg.value(metadata i8* %call, metadata !37, metadata !DIExpression()), !dbg !29
  %mul1 = mul i64 %an, %s, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call, i8* align 1 %a, i64 %mul1, i1 false), !dbg !41
  %mul2 = mul i64 %an, %s, !dbg !42
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 %mul2, !dbg !43
  %mul3 = mul i64 %bn, %s, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 %b, i64 %mul3, i1 false), !dbg !45
  ret i8* %call, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !47 {
entry:
  %call = call i8* @array_concat(i8* bitcast ([5 x i32]* @a to i8*), i64 5, i8* bitcast ([5 x i32]* @b to i8*), i64 5, i64 4), !dbg !50
  %0 = bitcast i8* %call to i32*, !dbg !50
  call void @llvm.dbg.value(metadata i32* %0, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 0, metadata !53, metadata !DIExpression()), !dbg !52
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !57
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !53, metadata !DIExpression()), !dbg !52
  %cmp = icmp ult i32 %i.0, 10, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %idxprom = zext i32 %i.0 to i64, !dbg !61
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom, !dbg !61
  %1 = load i32, i32* %arrayidx, align 4, !dbg !61
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !62
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !63
  call void @llvm.dbg.value(metadata i32 %inc, metadata !53, metadata !DIExpression()), !dbg !52
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %2 = bitcast i32* %0 to i8*, !dbg !67
  call void @free(i8* %2) #5, !dbg !68
  ret i32 0, !dbg !69
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 18, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "array-concatenation.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Array-concatenation")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 19, type: !13, isLocal: false, isDefinition: true)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 160, elements: !15)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!15 = !{!16}
!16 = !DISubrange(count: 5)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!21 = distinct !DISubprogram(name: "array_concat", scope: !3, file: !3, line: 8, type: !22, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{!24, !8, !25, !8, !25, !25}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !27)
!26 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocalVariable(name: "a", arg: 1, scope: !21, file: !3, line: 8, type: !8)
!29 = !DILocation(line: 0, scope: !21)
!30 = !DILocalVariable(name: "an", arg: 2, scope: !21, file: !3, line: 8, type: !25)
!31 = !DILocalVariable(name: "b", arg: 3, scope: !21, file: !3, line: 9, type: !8)
!32 = !DILocalVariable(name: "bn", arg: 4, scope: !21, file: !3, line: 9, type: !25)
!33 = !DILocalVariable(name: "s", arg: 5, scope: !21, file: !3, line: 9, type: !25)
!34 = !DILocation(line: 11, column: 28, scope: !21)
!35 = !DILocation(line: 11, column: 22, scope: !21)
!36 = !DILocation(line: 11, column: 13, scope: !21)
!37 = !DILocalVariable(name: "p", scope: !21, file: !3, line: 11, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!40 = !DILocation(line: 12, column: 18, scope: !21)
!41 = !DILocation(line: 12, column: 3, scope: !21)
!42 = !DILocation(line: 13, column: 16, scope: !21)
!43 = !DILocation(line: 13, column: 12, scope: !21)
!44 = !DILocation(line: 13, column: 25, scope: !21)
!45 = !DILocation(line: 13, column: 3, scope: !21)
!46 = !DILocation(line: 14, column: 3, scope: !21)
!47 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 21, type: !48, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!7}
!50 = !DILocation(line: 25, column: 12, scope: !47)
!51 = !DILocalVariable(name: "c", scope: !47, file: !3, line: 25, type: !6)
!52 = !DILocation(line: 0, scope: !47)
!53 = !DILocalVariable(name: "i", scope: !47, file: !3, line: 23, type: !54)
!54 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 27, column: 7, scope: !56)
!56 = distinct !DILexicalBlock(scope: !47, file: !3, line: 27, column: 3)
!57 = !DILocation(line: 0, scope: !56)
!58 = !DILocation(line: 27, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !3, line: 27, column: 3)
!60 = !DILocation(line: 27, column: 3, scope: !56)
!61 = !DILocation(line: 28, column: 20, scope: !59)
!62 = !DILocation(line: 28, column: 5, scope: !59)
!63 = !DILocation(line: 27, column: 23, scope: !59)
!64 = !DILocation(line: 27, column: 3, scope: !59)
!65 = distinct !{!65, !60, !66}
!66 = !DILocation(line: 28, column: 24, scope: !56)
!67 = !DILocation(line: 30, column: 8, scope: !47)
!68 = !DILocation(line: 30, column: 3, scope: !47)
!69 = !DILocation(line: 31, column: 3, scope: !47)
