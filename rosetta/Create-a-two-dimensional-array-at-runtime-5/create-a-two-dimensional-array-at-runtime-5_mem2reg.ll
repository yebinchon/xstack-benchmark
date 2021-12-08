; ModuleID = 'create-a-two-dimensional-array-at-runtime-5.ll'
source_filename = "create-a-two-dimensional-array-at-runtime-5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [48 x i8] c"Enter two integers.  Space delimited, please:  \00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"array[%d][%d] is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %user1 = alloca i32, align 4
  %user2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata i32 %argc, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8** %argv, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %user1, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %user1, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %user2, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %user2, align 4, !dbg !20
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i64 0, i64 0)), !dbg !21
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32* %user1, i32* %user2), !dbg !22
  %0 = load i32, i32* %user1, align 4, !dbg !23
  %1 = load i32, i32* %user2, align 4, !dbg !23
  %mul = mul nsw i32 %0, %1, !dbg !23
  %conv = sext i32 %mul to i64, !dbg !23
  %mul2 = mul i64 %conv, 4, !dbg !23
  %2 = alloca i8, i64 %mul2, align 16, !dbg !23
  %3 = bitcast i8* %2 to i32*, !dbg !23
  call void @llvm.dbg.value(metadata i32* %3, metadata !24, metadata !DIExpression()), !dbg !15
  %4 = load i32, i32* %user1, align 4, !dbg !26
  %conv3 = sext i32 %4 to i64, !dbg !26
  %mul4 = mul i64 %conv3, 8, !dbg !26
  %5 = alloca i8, i64 %mul4, align 16, !dbg !26
  %6 = bitcast i8* %5 to i32**, !dbg !26
  call void @llvm.dbg.value(metadata i32** %6, metadata !27, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !29, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %row.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !32
  call void @llvm.dbg.value(metadata i32 %row.0, metadata !29, metadata !DIExpression()), !dbg !15
  %7 = load i32, i32* %user1, align 4, !dbg !33
  %cmp = icmp slt i32 %row.0, %7, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %user2, align 4, !dbg !37
  %mul6 = mul nsw i32 %row.0, %8, !dbg !38
  %idx.ext = sext i32 %mul6 to i64, !dbg !39
  %add.ptr = getelementptr inbounds i32, i32* %3, i64 %idx.ext, !dbg !39
  %idxprom = sext i32 %row.0 to i64, !dbg !40
  %arrayidx = getelementptr inbounds i32*, i32** %6, i64 %idxprom, !dbg !40
  store i32* %add.ptr, i32** %arrayidx, align 8, !dbg !41
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %row.0, 1, !dbg !42
  call void @llvm.dbg.value(metadata i32 %inc, metadata !29, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %user1, align 4, !dbg !46
  %10 = load i32, i32* %user2, align 4, !dbg !47
  %add = add nsw i32 %9, %10, !dbg !48
  %11 = load i32, i32* %user1, align 4, !dbg !49
  %div = sdiv i32 %11, 2, !dbg !50
  %idxprom7 = sext i32 %div to i64, !dbg !51
  %arrayidx8 = getelementptr inbounds i32*, i32** %6, i64 %idxprom7, !dbg !51
  %12 = load i32*, i32** %arrayidx8, align 8, !dbg !51
  %13 = load i32, i32* %user2, align 4, !dbg !52
  %div9 = sdiv i32 %13, 2, !dbg !53
  %idxprom10 = sext i32 %div9 to i64, !dbg !51
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !51
  store i32 %add, i32* %arrayidx11, align 4, !dbg !54
  %14 = load i32, i32* %user1, align 4, !dbg !55
  %div12 = sdiv i32 %14, 2, !dbg !56
  %15 = load i32, i32* %user2, align 4, !dbg !57
  %div13 = sdiv i32 %15, 2, !dbg !58
  %16 = load i32, i32* %user1, align 4, !dbg !59
  %div14 = sdiv i32 %16, 2, !dbg !60
  %idxprom15 = sext i32 %div14 to i64, !dbg !61
  %arrayidx16 = getelementptr inbounds i32*, i32** %6, i64 %idxprom15, !dbg !61
  %17 = load i32*, i32** %arrayidx16, align 8, !dbg !61
  %18 = load i32, i32* %user2, align 4, !dbg !62
  %div17 = sdiv i32 %18, 2, !dbg !63
  %idxprom18 = sext i32 %div17 to i64, !dbg !61
  %arrayidx19 = getelementptr inbounds i32, i32* %17, i64 %idxprom18, !dbg !61
  %19 = load i32, i32* %arrayidx19, align 4, !dbg !61
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0), i32 %div12, i32 %div13, i32 %19), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "create-a-two-dimensional-array-at-runtime-5.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Create-a-two-dimensional-array-at-runtime-5")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 3, type: !11)
!17 = !DILocalVariable(name: "user1", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 5, column: 8, scope: !7)
!19 = !DILocalVariable(name: "user2", scope: !7, file: !1, line: 5, type: !10)
!20 = !DILocation(line: 5, column: 19, scope: !7)
!21 = !DILocation(line: 8, column: 4, scope: !7)
!22 = !DILocation(line: 9, column: 4, scope: !7)
!23 = !DILocation(line: 11, column: 9, scope: !7)
!24 = !DILocalVariable(name: "a1", scope: !7, file: !1, line: 6, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!26 = !DILocation(line: 12, column: 12, scope: !7)
!27 = !DILocalVariable(name: "array", scope: !7, file: !1, line: 6, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!29 = !DILocalVariable(name: "row", scope: !7, file: !1, line: 6, type: !10)
!30 = !DILocation(line: 13, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 4)
!32 = !DILocation(line: 0, scope: !31)
!33 = !DILocation(line: 13, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !1, line: 13, column: 4)
!35 = !DILocation(line: 13, column: 19, scope: !34)
!36 = !DILocation(line: 13, column: 4, scope: !31)
!37 = !DILocation(line: 13, column: 52, scope: !34)
!38 = !DILocation(line: 13, column: 51, scope: !34)
!39 = !DILocation(line: 13, column: 47, scope: !34)
!40 = !DILocation(line: 13, column: 34, scope: !34)
!41 = !DILocation(line: 13, column: 44, scope: !34)
!42 = !DILocation(line: 13, column: 30, scope: !34)
!43 = !DILocation(line: 13, column: 4, scope: !34)
!44 = distinct !{!44, !36, !45}
!45 = !DILocation(line: 13, column: 52, scope: !31)
!46 = !DILocation(line: 15, column: 30, scope: !7)
!47 = !DILocation(line: 15, column: 38, scope: !7)
!48 = !DILocation(line: 15, column: 36, scope: !7)
!49 = !DILocation(line: 15, column: 10, scope: !7)
!50 = !DILocation(line: 15, column: 15, scope: !7)
!51 = !DILocation(line: 15, column: 4, scope: !7)
!52 = !DILocation(line: 15, column: 19, scope: !7)
!53 = !DILocation(line: 15, column: 24, scope: !7)
!54 = !DILocation(line: 15, column: 28, scope: !7)
!55 = !DILocation(line: 16, column: 35, scope: !7)
!56 = !DILocation(line: 16, column: 40, scope: !7)
!57 = !DILocation(line: 16, column: 43, scope: !7)
!58 = !DILocation(line: 16, column: 48, scope: !7)
!59 = !DILocation(line: 16, column: 57, scope: !7)
!60 = !DILocation(line: 16, column: 62, scope: !7)
!61 = !DILocation(line: 16, column: 51, scope: !7)
!62 = !DILocation(line: 16, column: 66, scope: !7)
!63 = !DILocation(line: 16, column: 71, scope: !7)
!64 = !DILocation(line: 16, column: 4, scope: !7)
!65 = !DILocation(line: 17, column: 4, scope: !7)
