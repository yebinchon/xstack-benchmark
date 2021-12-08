; ModuleID = 'array-concatenation.bc'
source_filename = "array-concatenation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = dso_local constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16, !dbg !0
@b = dso_local constant [5 x i32] [i32 6, i32 7, i32 8, i32 9, i32 0], align 16, !dbg !11
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @array_concat(i8* %a, i64 %an, i8* %b, i64 %bn, i64 %s) #0 !dbg !21 {
entry:
  %a.addr = alloca i8*, align 8
  %an.addr = alloca i64, align 8
  %b.addr = alloca i8*, align 8
  %bn.addr = alloca i64, align 8
  %s.addr = alloca i64, align 8
  %p = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store i64 %an, i64* %an.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %an.addr, metadata !30, metadata !DIExpression()), !dbg !31
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store i64 %bn, i64* %bn.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bn.addr, metadata !34, metadata !DIExpression()), !dbg !35
  store i64 %s, i64* %s.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %s.addr, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i8** %p, metadata !38, metadata !DIExpression()), !dbg !41
  %0 = load i64, i64* %s.addr, align 8, !dbg !42
  %1 = load i64, i64* %an.addr, align 8, !dbg !43
  %2 = load i64, i64* %bn.addr, align 8, !dbg !44
  %add = add i64 %1, %2, !dbg !45
  %mul = mul i64 %0, %add, !dbg !46
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !47
  store i8* %call, i8** %p, align 8, !dbg !41
  %3 = load i8*, i8** %p, align 8, !dbg !48
  %4 = load i8*, i8** %a.addr, align 8, !dbg !49
  %5 = load i64, i64* %an.addr, align 8, !dbg !50
  %6 = load i64, i64* %s.addr, align 8, !dbg !51
  %mul1 = mul i64 %5, %6, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %4, i64 %mul1, i1 false), !dbg !53
  %7 = load i8*, i8** %p, align 8, !dbg !54
  %8 = load i64, i64* %an.addr, align 8, !dbg !55
  %9 = load i64, i64* %s.addr, align 8, !dbg !56
  %mul2 = mul i64 %8, %9, !dbg !57
  %add.ptr = getelementptr inbounds i8, i8* %7, i64 %mul2, !dbg !58
  %10 = load i8*, i8** %b.addr, align 8, !dbg !59
  %11 = load i64, i64* %bn.addr, align 8, !dbg !60
  %12 = load i64, i64* %s.addr, align 8, !dbg !61
  %mul3 = mul i64 %11, %12, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 %10, i64 %mul3, i1 false), !dbg !63
  %13 = load i8*, i8** %p, align 8, !dbg !64
  ret i8* %13, !dbg !65
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !69, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32** %c, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i8* @array_concat(i8* bitcast ([5 x i32]* @a to i8*), i64 5, i8* bitcast ([5 x i32]* @b to i8*), i64 5, i64 4), !dbg !74
  %0 = bitcast i8* %call to i32*, !dbg !74
  store i32* %0, i32** %c, align 8, !dbg !73
  store i32 0, i32* %i, align 4, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !78
  %cmp = icmp ult i32 %1, 10, !dbg !80
  br i1 %cmp, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %c, align 8, !dbg !82
  %3 = load i32, i32* %i, align 4, !dbg !83
  %idxprom = zext i32 %3 to i64, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !82
  %4 = load i32, i32* %arrayidx, align 4, !dbg !82
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %4), !dbg !84
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !85
  %inc = add i32 %5, 1, !dbg !85
  store i32 %inc, i32* %i, align 4, !dbg !85
  br label %for.cond, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %c, align 8, !dbg !89
  %7 = bitcast i32* %6 to i8*, !dbg !89
  call void @free(i8* %7) #5, !dbg !90
  ret i32 0, !dbg !91
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

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
!29 = !DILocation(line: 8, column: 32, scope: !21)
!30 = !DILocalVariable(name: "an", arg: 2, scope: !21, file: !3, line: 8, type: !25)
!31 = !DILocation(line: 8, column: 42, scope: !21)
!32 = !DILocalVariable(name: "b", arg: 3, scope: !21, file: !3, line: 9, type: !8)
!33 = !DILocation(line: 9, column: 32, scope: !21)
!34 = !DILocalVariable(name: "bn", arg: 4, scope: !21, file: !3, line: 9, type: !25)
!35 = !DILocation(line: 9, column: 42, scope: !21)
!36 = !DILocalVariable(name: "s", arg: 5, scope: !21, file: !3, line: 9, type: !25)
!37 = !DILocation(line: 9, column: 53, scope: !21)
!38 = !DILocalVariable(name: "p", scope: !21, file: !3, line: 11, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocation(line: 11, column: 9, scope: !21)
!42 = !DILocation(line: 11, column: 20, scope: !21)
!43 = !DILocation(line: 11, column: 25, scope: !21)
!44 = !DILocation(line: 11, column: 30, scope: !21)
!45 = !DILocation(line: 11, column: 28, scope: !21)
!46 = !DILocation(line: 11, column: 22, scope: !21)
!47 = !DILocation(line: 11, column: 13, scope: !21)
!48 = !DILocation(line: 12, column: 10, scope: !21)
!49 = !DILocation(line: 12, column: 13, scope: !21)
!50 = !DILocation(line: 12, column: 16, scope: !21)
!51 = !DILocation(line: 12, column: 19, scope: !21)
!52 = !DILocation(line: 12, column: 18, scope: !21)
!53 = !DILocation(line: 12, column: 3, scope: !21)
!54 = !DILocation(line: 13, column: 10, scope: !21)
!55 = !DILocation(line: 13, column: 14, scope: !21)
!56 = !DILocation(line: 13, column: 17, scope: !21)
!57 = !DILocation(line: 13, column: 16, scope: !21)
!58 = !DILocation(line: 13, column: 12, scope: !21)
!59 = !DILocation(line: 13, column: 20, scope: !21)
!60 = !DILocation(line: 13, column: 23, scope: !21)
!61 = !DILocation(line: 13, column: 26, scope: !21)
!62 = !DILocation(line: 13, column: 25, scope: !21)
!63 = !DILocation(line: 13, column: 3, scope: !21)
!64 = !DILocation(line: 14, column: 10, scope: !21)
!65 = !DILocation(line: 14, column: 3, scope: !21)
!66 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 21, type: !67, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DISubroutineType(types: !68)
!68 = !{!7}
!69 = !DILocalVariable(name: "i", scope: !66, file: !3, line: 23, type: !70)
!70 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!71 = !DILocation(line: 23, column: 16, scope: !66)
!72 = !DILocalVariable(name: "c", scope: !66, file: !3, line: 25, type: !6)
!73 = !DILocation(line: 25, column: 8, scope: !66)
!74 = !DILocation(line: 25, column: 12, scope: !66)
!75 = !DILocation(line: 27, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !66, file: !3, line: 27, column: 3)
!77 = !DILocation(line: 27, column: 7, scope: !76)
!78 = !DILocation(line: 27, column: 14, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !3, line: 27, column: 3)
!80 = !DILocation(line: 27, column: 16, scope: !79)
!81 = !DILocation(line: 27, column: 3, scope: !76)
!82 = !DILocation(line: 28, column: 20, scope: !79)
!83 = !DILocation(line: 28, column: 22, scope: !79)
!84 = !DILocation(line: 28, column: 5, scope: !79)
!85 = !DILocation(line: 27, column: 23, scope: !79)
!86 = !DILocation(line: 27, column: 3, scope: !79)
!87 = distinct !{!87, !81, !88}
!88 = !DILocation(line: 28, column: 24, scope: !76)
!89 = !DILocation(line: 30, column: 8, scope: !66)
!90 = !DILocation(line: 30, column: 3, scope: !66)
!91 = !DILocation(line: 31, column: 3, scope: !66)
