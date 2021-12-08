; ModuleID = 'catamorphism.ll'
source_filename = "catamorphism.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.nums = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @reduce(i32 (i32, i32)* %fn, i32 %size, i32* %elms) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %fn, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %size, metadata !18, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32* %elms, metadata !19, metadata !DIExpression()), !dbg !17
  %0 = load i32, i32* %elms, align 4, !dbg !20
  call void @llvm.dbg.value(metadata i32 %0, metadata !21, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 1, metadata !22, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !25
  %val.0 = phi i32 [ %0, %entry ], [ %call, %for.inc ], !dbg !17
  call void @llvm.dbg.value(metadata i32 %val.0, metadata !21, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !22, metadata !DIExpression()), !dbg !17
  %cmp = icmp slt i32 %i.0, %size, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %elms, i64 %idxprom, !dbg !29
  %1 = load i32, i32* %arrayidx, align 4, !dbg !29
  %call = call i32 %fn(i32 %val.0, i32 %1), !dbg !30
  call void @llvm.dbg.value(metadata i32 %call, metadata !21, metadata !DIExpression()), !dbg !17
  br label %for.inc, !dbg !31

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !32
  call void @llvm.dbg.value(metadata i32 %inc, metadata !22, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !33, !llvm.loop !34

for.end:                                          ; preds = %for.cond
  ret i32 %val.0, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @add(i32 %a, i32 %b) #0 !dbg !37 {
entry:
  call void @llvm.dbg.value(metadata i32 %a, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 %b, metadata !40, metadata !DIExpression()), !dbg !39
  %add = add nsw i32 %a, %b, !dbg !41
  ret i32 %add, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @sub(i32 %a, i32 %b) #0 !dbg !43 {
entry:
  call void @llvm.dbg.value(metadata i32 %a, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i32 %b, metadata !46, metadata !DIExpression()), !dbg !45
  %sub = sub nsw i32 %a, %b, !dbg !47
  ret i32 %sub, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @mul(i32 %a, i32 %b) #0 !dbg !49 {
entry:
  call void @llvm.dbg.value(metadata i32 %a, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 %b, metadata !52, metadata !DIExpression()), !dbg !51
  %mul = mul nsw i32 %a, %b, !dbg !53
  ret i32 %mul, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !55 {
entry:
  %nums = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata [5 x i32]* %nums, metadata !58, metadata !DIExpression()), !dbg !62
  %0 = bitcast [5 x i32]* %nums to i8*, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([5 x i32]* @__const.main.nums to i8*), i64 20, i1 false), !dbg !62
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %nums, i64 0, i64 0, !dbg !63
  %call = call i32 @reduce(i32 (i32, i32)* @add, i32 5, i32* %arraydecay), !dbg !64
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !65
  %arraydecay2 = getelementptr inbounds [5 x i32], [5 x i32]* %nums, i64 0, i64 0, !dbg !66
  %call3 = call i32 @reduce(i32 (i32, i32)* @sub, i32 5, i32* %arraydecay2), !dbg !67
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call3), !dbg !68
  %arraydecay5 = getelementptr inbounds [5 x i32], [5 x i32]* %nums, i64 0, i64 0, !dbg !69
  %call6 = call i32 @reduce(i32 (i32, i32)* @mul, i32 5, i32* %arraydecay5), !dbg !70
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call6), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

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
!1 = !DIFile(filename: "catamorphism.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Catamorphism")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!17 = !DILocation(line: 0, scope: !7)
!18 = !DILocalVariable(name: "size", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!19 = !DILocalVariable(name: "elms", arg: 3, scope: !7, file: !1, line: 5, type: !15)
!20 = !DILocation(line: 7, column: 18, scope: !7)
!21 = !DILocalVariable(name: "val", scope: !7, file: !1, line: 7, type: !10)
!22 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 7, type: !10)
!23 = !DILocation(line: 8, column: 10, scope: !24)
!24 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 5)
!25 = !DILocation(line: 0, scope: !24)
!26 = !DILocation(line: 8, column: 19, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !1, line: 8, column: 5)
!28 = !DILocation(line: 8, column: 5, scope: !24)
!29 = !DILocation(line: 9, column: 23, scope: !27)
!30 = !DILocation(line: 9, column: 15, scope: !27)
!31 = !DILocation(line: 9, column: 9, scope: !27)
!32 = !DILocation(line: 8, column: 27, scope: !27)
!33 = !DILocation(line: 8, column: 5, scope: !27)
!34 = distinct !{!34, !28, !35}
!35 = !DILocation(line: 9, column: 30, scope: !24)
!36 = !DILocation(line: 10, column: 5, scope: !7)
!37 = distinct !DISubprogram(name: "add", scope: !1, file: !1, line: 13, type: !13, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "a", arg: 1, scope: !37, file: !1, line: 13, type: !10)
!39 = !DILocation(line: 0, scope: !37)
!40 = !DILocalVariable(name: "b", arg: 2, scope: !37, file: !1, line: 13, type: !10)
!41 = !DILocation(line: 13, column: 34, scope: !37)
!42 = !DILocation(line: 13, column: 25, scope: !37)
!43 = distinct !DISubprogram(name: "sub", scope: !1, file: !1, line: 14, type: !13, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "a", arg: 1, scope: !43, file: !1, line: 14, type: !10)
!45 = !DILocation(line: 0, scope: !43)
!46 = !DILocalVariable(name: "b", arg: 2, scope: !43, file: !1, line: 14, type: !10)
!47 = !DILocation(line: 14, column: 34, scope: !43)
!48 = !DILocation(line: 14, column: 25, scope: !43)
!49 = distinct !DISubprogram(name: "mul", scope: !1, file: !1, line: 15, type: !13, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocalVariable(name: "a", arg: 1, scope: !49, file: !1, line: 15, type: !10)
!51 = !DILocation(line: 0, scope: !49)
!52 = !DILocalVariable(name: "b", arg: 2, scope: !49, file: !1, line: 15, type: !10)
!53 = !DILocation(line: 15, column: 34, scope: !49)
!54 = !DILocation(line: 15, column: 25, scope: !49)
!55 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 17, type: !56, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!10}
!58 = !DILocalVariable(name: "nums", scope: !55, file: !1, line: 19, type: !59)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 160, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 5)
!62 = !DILocation(line: 19, column: 9, scope: !55)
!63 = !DILocation(line: 20, column: 35, scope: !55)
!64 = !DILocation(line: 20, column: 20, scope: !55)
!65 = !DILocation(line: 20, column: 5, scope: !55)
!66 = !DILocation(line: 21, column: 35, scope: !55)
!67 = !DILocation(line: 21, column: 20, scope: !55)
!68 = !DILocation(line: 21, column: 5, scope: !55)
!69 = !DILocation(line: 22, column: 35, scope: !55)
!70 = !DILocation(line: 22, column: 20, scope: !55)
!71 = !DILocation(line: 22, column: 5, scope: !55)
!72 = !DILocation(line: 23, column: 5, scope: !55)
