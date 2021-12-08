; ModuleID = 'create-a-two-dimensional-array-at-runtime-5.bc'
source_filename = "create-a-two-dimensional-array-at-runtime-5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [48 x i8] c"Enter two integers.  Space delimited, please:  \00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"array[%d][%d] is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %user1 = alloca i32, align 4
  %user2 = alloca i32, align 4
  %a1 = alloca i32*, align 8
  %array = alloca i32**, align 8
  %row = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %user1, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 0, i32* %user1, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %user2, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %user2, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %a1, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %array, metadata !25, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %row, metadata !28, metadata !DIExpression()), !dbg !29
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i64 0, i64 0)), !dbg !30
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32* %user1, i32* %user2), !dbg !31
  %0 = load i32, i32* %user1, align 4, !dbg !32
  %1 = load i32, i32* %user2, align 4, !dbg !32
  %mul = mul nsw i32 %0, %1, !dbg !32
  %conv = sext i32 %mul to i64, !dbg !32
  %mul2 = mul i64 %conv, 4, !dbg !32
  %2 = alloca i8, i64 %mul2, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !32
  store i32* %3, i32** %a1, align 8, !dbg !33
  %4 = load i32, i32* %user1, align 4, !dbg !34
  %conv3 = sext i32 %4 to i64, !dbg !34
  %mul4 = mul i64 %conv3, 8, !dbg !34
  %5 = alloca i8, i64 %mul4, align 16, !dbg !34
  %6 = bitcast i8* %5 to i32**, !dbg !34
  store i32** %6, i32*** %array, align 8, !dbg !35
  store i32 0, i32* %row, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i32, i32* %row, align 4, !dbg !39
  %8 = load i32, i32* %user1, align 4, !dbg !41
  %cmp = icmp slt i32 %7, %8, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %a1, align 8, !dbg !44
  %10 = load i32, i32* %row, align 4, !dbg !45
  %11 = load i32, i32* %user2, align 4, !dbg !46
  %mul6 = mul nsw i32 %10, %11, !dbg !47
  %idx.ext = sext i32 %mul6 to i64, !dbg !48
  %add.ptr = getelementptr inbounds i32, i32* %9, i64 %idx.ext, !dbg !48
  %12 = load i32**, i32*** %array, align 8, !dbg !49
  %13 = load i32, i32* %row, align 4, !dbg !50
  %idxprom = sext i32 %13 to i64, !dbg !49
  %arrayidx = getelementptr inbounds i32*, i32** %12, i64 %idxprom, !dbg !49
  store i32* %add.ptr, i32** %arrayidx, align 8, !dbg !51
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %row, align 4, !dbg !52
  %inc = add nsw i32 %14, 1, !dbg !52
  store i32 %inc, i32* %row, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %15 = load i32, i32* %user1, align 4, !dbg !56
  %16 = load i32, i32* %user2, align 4, !dbg !57
  %add = add nsw i32 %15, %16, !dbg !58
  %17 = load i32**, i32*** %array, align 8, !dbg !59
  %18 = load i32, i32* %user1, align 4, !dbg !60
  %div = sdiv i32 %18, 2, !dbg !61
  %idxprom7 = sext i32 %div to i64, !dbg !59
  %arrayidx8 = getelementptr inbounds i32*, i32** %17, i64 %idxprom7, !dbg !59
  %19 = load i32*, i32** %arrayidx8, align 8, !dbg !59
  %20 = load i32, i32* %user2, align 4, !dbg !62
  %div9 = sdiv i32 %20, 2, !dbg !63
  %idxprom10 = sext i32 %div9 to i64, !dbg !59
  %arrayidx11 = getelementptr inbounds i32, i32* %19, i64 %idxprom10, !dbg !59
  store i32 %add, i32* %arrayidx11, align 4, !dbg !64
  %21 = load i32, i32* %user1, align 4, !dbg !65
  %div12 = sdiv i32 %21, 2, !dbg !66
  %22 = load i32, i32* %user2, align 4, !dbg !67
  %div13 = sdiv i32 %22, 2, !dbg !68
  %23 = load i32**, i32*** %array, align 8, !dbg !69
  %24 = load i32, i32* %user1, align 4, !dbg !70
  %div14 = sdiv i32 %24, 2, !dbg !71
  %idxprom15 = sext i32 %div14 to i64, !dbg !69
  %arrayidx16 = getelementptr inbounds i32*, i32** %23, i64 %idxprom15, !dbg !69
  %25 = load i32*, i32** %arrayidx16, align 8, !dbg !69
  %26 = load i32, i32* %user2, align 4, !dbg !72
  %div17 = sdiv i32 %26, 2, !dbg !73
  %idxprom18 = sext i32 %div17 to i64, !dbg !69
  %arrayidx19 = getelementptr inbounds i32, i32* %25, i64 %idxprom18, !dbg !69
  %27 = load i32, i32* %arrayidx19, align 4, !dbg !69
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0), i32 %div12, i32 %div13, i32 %27), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

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
!15 = !DILocation(line: 3, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 3, type: !11)
!17 = !DILocation(line: 3, column: 27, scope: !7)
!18 = !DILocalVariable(name: "user1", scope: !7, file: !1, line: 5, type: !10)
!19 = !DILocation(line: 5, column: 8, scope: !7)
!20 = !DILocalVariable(name: "user2", scope: !7, file: !1, line: 5, type: !10)
!21 = !DILocation(line: 5, column: 19, scope: !7)
!22 = !DILocalVariable(name: "a1", scope: !7, file: !1, line: 6, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!24 = !DILocation(line: 6, column: 9, scope: !7)
!25 = !DILocalVariable(name: "array", scope: !7, file: !1, line: 6, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!27 = !DILocation(line: 6, column: 15, scope: !7)
!28 = !DILocalVariable(name: "row", scope: !7, file: !1, line: 6, type: !10)
!29 = !DILocation(line: 6, column: 22, scope: !7)
!30 = !DILocation(line: 8, column: 4, scope: !7)
!31 = !DILocation(line: 9, column: 4, scope: !7)
!32 = !DILocation(line: 11, column: 9, scope: !7)
!33 = !DILocation(line: 11, column: 7, scope: !7)
!34 = !DILocation(line: 12, column: 12, scope: !7)
!35 = !DILocation(line: 12, column: 10, scope: !7)
!36 = !DILocation(line: 13, column: 12, scope: !37)
!37 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 4)
!38 = !DILocation(line: 13, column: 9, scope: !37)
!39 = !DILocation(line: 13, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 13, column: 4)
!41 = !DILocation(line: 13, column: 20, scope: !40)
!42 = !DILocation(line: 13, column: 19, scope: !40)
!43 = !DILocation(line: 13, column: 4, scope: !37)
!44 = !DILocation(line: 13, column: 45, scope: !40)
!45 = !DILocation(line: 13, column: 48, scope: !40)
!46 = !DILocation(line: 13, column: 52, scope: !40)
!47 = !DILocation(line: 13, column: 51, scope: !40)
!48 = !DILocation(line: 13, column: 47, scope: !40)
!49 = !DILocation(line: 13, column: 34, scope: !40)
!50 = !DILocation(line: 13, column: 40, scope: !40)
!51 = !DILocation(line: 13, column: 44, scope: !40)
!52 = !DILocation(line: 13, column: 30, scope: !40)
!53 = !DILocation(line: 13, column: 4, scope: !40)
!54 = distinct !{!54, !43, !55}
!55 = !DILocation(line: 13, column: 52, scope: !37)
!56 = !DILocation(line: 15, column: 30, scope: !7)
!57 = !DILocation(line: 15, column: 38, scope: !7)
!58 = !DILocation(line: 15, column: 36, scope: !7)
!59 = !DILocation(line: 15, column: 4, scope: !7)
!60 = !DILocation(line: 15, column: 10, scope: !7)
!61 = !DILocation(line: 15, column: 15, scope: !7)
!62 = !DILocation(line: 15, column: 19, scope: !7)
!63 = !DILocation(line: 15, column: 24, scope: !7)
!64 = !DILocation(line: 15, column: 28, scope: !7)
!65 = !DILocation(line: 16, column: 35, scope: !7)
!66 = !DILocation(line: 16, column: 40, scope: !7)
!67 = !DILocation(line: 16, column: 43, scope: !7)
!68 = !DILocation(line: 16, column: 48, scope: !7)
!69 = !DILocation(line: 16, column: 51, scope: !7)
!70 = !DILocation(line: 16, column: 57, scope: !7)
!71 = !DILocation(line: 16, column: 62, scope: !7)
!72 = !DILocation(line: 16, column: 66, scope: !7)
!73 = !DILocation(line: 16, column: 71, scope: !7)
!74 = !DILocation(line: 16, column: 4, scope: !7)
!75 = !DILocation(line: 17, column: 4, scope: !7)
