; ModuleID = 'catamorphism.c'
source_filename = "catamorphism.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.nums = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @reduce(i32 (i32, i32)* %fn, i32 %size, i32* %elms) #0 !dbg !7 {
entry:
  %fn.addr = alloca i32 (i32, i32)*, align 8
  %size.addr = alloca i32, align 4
  %elms.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %val = alloca i32, align 4
  store i32 (i32, i32)* %fn, i32 (i32, i32)** %fn.addr, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %fn.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* %elms, i32** %elms.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %elms.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %val, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i32*, i32** %elms.addr, align 8, !dbg !26
  %1 = load i32, i32* %0, align 4, !dbg !27
  store i32 %1, i32* %val, align 4, !dbg !25
  store i32 1, i32* %i, align 4, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !31
  %3 = load i32, i32* %size.addr, align 4, !dbg !33
  %cmp = icmp slt i32 %2, %3, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %4 = load i32 (i32, i32)*, i32 (i32, i32)** %fn.addr, align 8, !dbg !36
  %5 = load i32, i32* %val, align 4, !dbg !37
  %6 = load i32*, i32** %elms.addr, align 8, !dbg !38
  %7 = load i32, i32* %i, align 4, !dbg !39
  %idxprom = sext i32 %7 to i64, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !38
  %8 = load i32, i32* %arrayidx, align 4, !dbg !38
  %call = call i32 %4(i32 %5, i32 %8), !dbg !36
  store i32 %call, i32* %val, align 4, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %9, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %val, align 4, !dbg !46
  ret i32 %10, !dbg !47
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @add(i32 %a, i32 %b) #0 !dbg !48 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32, i32* %a.addr, align 4, !dbg !53
  %1 = load i32, i32* %b.addr, align 4, !dbg !54
  %add = add nsw i32 %0, %1, !dbg !55
  ret i32 %add, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @sub(i32 %a, i32 %b) #0 !dbg !57 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i32, i32* %a.addr, align 4, !dbg !62
  %1 = load i32, i32* %b.addr, align 4, !dbg !63
  %sub = sub nsw i32 %0, %1, !dbg !64
  ret i32 %sub, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @mul(i32 %a, i32 %b) #0 !dbg !66 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i32, i32* %a.addr, align 4, !dbg !71
  %1 = load i32, i32* %b.addr, align 4, !dbg !72
  %mul = mul nsw i32 %0, %1, !dbg !73
  ret i32 %mul, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %nums = alloca [5 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %nums, metadata !78, metadata !DIExpression()), !dbg !82
  %0 = bitcast [5 x i32]* %nums to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([5 x i32]* @__const.main.nums to i8*), i64 20, i1 false), !dbg !82
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %nums, i64 0, i64 0, !dbg !83
  %call = call i32 @reduce(i32 (i32, i32)* @add, i32 5, i32* %arraydecay), !dbg !84
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !85
  %arraydecay2 = getelementptr inbounds [5 x i32], [5 x i32]* %nums, i64 0, i64 0, !dbg !86
  %call3 = call i32 @reduce(i32 (i32, i32)* @sub, i32 5, i32* %arraydecay2), !dbg !87
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call3), !dbg !88
  %arraydecay5 = getelementptr inbounds [5 x i32], [5 x i32]* %nums, i64 0, i64 0, !dbg !89
  %call6 = call i32 @reduce(i32 (i32, i32)* @mul, i32 5, i32* %arraydecay5), !dbg !90
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call6), !dbg !91
  ret i32 0, !dbg !92
}

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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "catamorphism.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Catamorphism")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "reduce", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !10, !15}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "intFn", file: !1, line: 3, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DISubroutineType(types: !14)
!14 = !{!10, !10, !10}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!16 = !DILocalVariable(name: "fn", arg: 1, scope: !7, file: !1, line: 5, type: !11)
!17 = !DILocation(line: 5, column: 18, scope: !7)
!18 = !DILocalVariable(name: "size", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!19 = !DILocation(line: 5, column: 26, scope: !7)
!20 = !DILocalVariable(name: "elms", arg: 3, scope: !7, file: !1, line: 5, type: !15)
!21 = !DILocation(line: 5, column: 37, scope: !7)
!22 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 7, type: !10)
!23 = !DILocation(line: 7, column: 9, scope: !7)
!24 = !DILocalVariable(name: "val", scope: !7, file: !1, line: 7, type: !10)
!25 = !DILocation(line: 7, column: 12, scope: !7)
!26 = !DILocation(line: 7, column: 19, scope: !7)
!27 = !DILocation(line: 7, column: 18, scope: !7)
!28 = !DILocation(line: 8, column: 12, scope: !29)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 5)
!30 = !DILocation(line: 8, column: 10, scope: !29)
!31 = !DILocation(line: 8, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !1, line: 8, column: 5)
!33 = !DILocation(line: 8, column: 21, scope: !32)
!34 = !DILocation(line: 8, column: 19, scope: !32)
!35 = !DILocation(line: 8, column: 5, scope: !29)
!36 = !DILocation(line: 9, column: 15, scope: !32)
!37 = !DILocation(line: 9, column: 18, scope: !32)
!38 = !DILocation(line: 9, column: 23, scope: !32)
!39 = !DILocation(line: 9, column: 28, scope: !32)
!40 = !DILocation(line: 9, column: 13, scope: !32)
!41 = !DILocation(line: 9, column: 9, scope: !32)
!42 = !DILocation(line: 8, column: 27, scope: !32)
!43 = !DILocation(line: 8, column: 5, scope: !32)
!44 = distinct !{!44, !35, !45}
!45 = !DILocation(line: 9, column: 30, scope: !29)
!46 = !DILocation(line: 10, column: 12, scope: !7)
!47 = !DILocation(line: 10, column: 5, scope: !7)
!48 = distinct !DISubprogram(name: "add", scope: !1, file: !1, line: 13, type: !13, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "a", arg: 1, scope: !48, file: !1, line: 13, type: !10)
!50 = !DILocation(line: 13, column: 13, scope: !48)
!51 = !DILocalVariable(name: "b", arg: 2, scope: !48, file: !1, line: 13, type: !10)
!52 = !DILocation(line: 13, column: 20, scope: !48)
!53 = !DILocation(line: 13, column: 32, scope: !48)
!54 = !DILocation(line: 13, column: 36, scope: !48)
!55 = !DILocation(line: 13, column: 34, scope: !48)
!56 = !DILocation(line: 13, column: 25, scope: !48)
!57 = distinct !DISubprogram(name: "sub", scope: !1, file: !1, line: 14, type: !13, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "a", arg: 1, scope: !57, file: !1, line: 14, type: !10)
!59 = !DILocation(line: 14, column: 13, scope: !57)
!60 = !DILocalVariable(name: "b", arg: 2, scope: !57, file: !1, line: 14, type: !10)
!61 = !DILocation(line: 14, column: 20, scope: !57)
!62 = !DILocation(line: 14, column: 32, scope: !57)
!63 = !DILocation(line: 14, column: 36, scope: !57)
!64 = !DILocation(line: 14, column: 34, scope: !57)
!65 = !DILocation(line: 14, column: 25, scope: !57)
!66 = distinct !DISubprogram(name: "mul", scope: !1, file: !1, line: 15, type: !13, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "a", arg: 1, scope: !66, file: !1, line: 15, type: !10)
!68 = !DILocation(line: 15, column: 13, scope: !66)
!69 = !DILocalVariable(name: "b", arg: 2, scope: !66, file: !1, line: 15, type: !10)
!70 = !DILocation(line: 15, column: 20, scope: !66)
!71 = !DILocation(line: 15, column: 32, scope: !66)
!72 = !DILocation(line: 15, column: 36, scope: !66)
!73 = !DILocation(line: 15, column: 34, scope: !66)
!74 = !DILocation(line: 15, column: 25, scope: !66)
!75 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 17, type: !76, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!10}
!78 = !DILocalVariable(name: "nums", scope: !75, file: !1, line: 19, type: !79)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 160, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 5)
!82 = !DILocation(line: 19, column: 9, scope: !75)
!83 = !DILocation(line: 20, column: 35, scope: !75)
!84 = !DILocation(line: 20, column: 20, scope: !75)
!85 = !DILocation(line: 20, column: 5, scope: !75)
!86 = !DILocation(line: 21, column: 35, scope: !75)
!87 = !DILocation(line: 21, column: 20, scope: !75)
!88 = !DILocation(line: 21, column: 5, scope: !75)
!89 = !DILocation(line: 22, column: 35, scope: !75)
!90 = !DILocation(line: 22, column: 20, scope: !75)
!91 = !DILocation(line: 22, column: 5, scope: !75)
!92 = !DILocation(line: 23, column: 5, scope: !75)
