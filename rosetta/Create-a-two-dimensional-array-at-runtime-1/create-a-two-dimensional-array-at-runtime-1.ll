; ModuleID = 'create-a-two-dimensional-array-at-runtime-1.bc'
source_filename = "create-a-two-dimensional-array-at-runtime-1.c"
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
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %__vla_expr1 = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %user1, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 0, i32* %user1, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %user2, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %user2, align 4, !dbg !21
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i64 0, i64 0)), !dbg !22
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32* %user1, i32* %user2), !dbg !23
  %0 = load i32, i32* %user1, align 4, !dbg !24
  %1 = zext i32 %0 to i64, !dbg !25
  %2 = load i32, i32* %user2, align 4, !dbg !26
  %3 = zext i32 %2 to i64, !dbg !25
  %4 = call i8* @llvm.stacksave(), !dbg !25
  store i8* %4, i8** %saved_stack, align 8, !dbg !25
  %5 = mul nuw i64 %1, %3, !dbg !25
  %vla = alloca i32, i64 %5, align 16, !dbg !25
  store i64 %1, i64* %__vla_expr0, align 8, !dbg !25
  store i64 %3, i64* %__vla_expr1, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !27, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %__vla_expr1, metadata !30, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %vla, metadata !31, metadata !DIExpression()), !dbg !36
  %6 = load i32, i32* %user1, align 4, !dbg !37
  %7 = load i32, i32* %user2, align 4, !dbg !38
  %add = add nsw i32 %6, %7, !dbg !39
  %8 = load i32, i32* %user1, align 4, !dbg !40
  %div = sdiv i32 %8, 2, !dbg !41
  %idxprom = sext i32 %div to i64, !dbg !42
  %9 = mul nsw i64 %idxprom, %3, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %vla, i64 %9, !dbg !42
  %10 = load i32, i32* %user2, align 4, !dbg !43
  %div2 = sdiv i32 %10, 2, !dbg !44
  %idxprom3 = sext i32 %div2 to i64, !dbg !42
  %arrayidx4 = getelementptr inbounds i32, i32* %arrayidx, i64 %idxprom3, !dbg !42
  store i32 %add, i32* %arrayidx4, align 4, !dbg !45
  %11 = load i32, i32* %user1, align 4, !dbg !46
  %div5 = sdiv i32 %11, 2, !dbg !47
  %12 = load i32, i32* %user2, align 4, !dbg !48
  %div6 = sdiv i32 %12, 2, !dbg !49
  %13 = load i32, i32* %user1, align 4, !dbg !50
  %div7 = sdiv i32 %13, 2, !dbg !51
  %idxprom8 = sext i32 %div7 to i64, !dbg !52
  %14 = mul nsw i64 %idxprom8, %3, !dbg !52
  %arrayidx9 = getelementptr inbounds i32, i32* %vla, i64 %14, !dbg !52
  %15 = load i32, i32* %user2, align 4, !dbg !53
  %div10 = sdiv i32 %15, 2, !dbg !54
  %idxprom11 = sext i32 %div10 to i64, !dbg !52
  %arrayidx12 = getelementptr inbounds i32, i32* %arrayidx9, i64 %idxprom11, !dbg !52
  %16 = load i32, i32* %arrayidx12, align 4, !dbg !52
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0), i32 %div5, i32 %div6, i32 %16), !dbg !55
  store i32 0, i32* %retval, align 4, !dbg !56
  %17 = load i8*, i8** %saved_stack, align 8, !dbg !57
  call void @llvm.stackrestore(i8* %17), !dbg !57
  %18 = load i32, i32* %retval, align 4, !dbg !57
  ret i32 %18, !dbg !57
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "create-a-two-dimensional-array-at-runtime-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Create-a-two-dimensional-array-at-runtime-1")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!22 = !DILocation(line: 6, column: 4, scope: !7)
!23 = !DILocation(line: 7, column: 4, scope: !7)
!24 = !DILocation(line: 8, column: 14, scope: !7)
!25 = !DILocation(line: 8, column: 4, scope: !7)
!26 = !DILocation(line: 8, column: 21, scope: !7)
!27 = !DILocalVariable(name: "__vla_expr0", scope: !7, type: !28, flags: DIFlagArtificial)
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 0, scope: !7)
!30 = !DILocalVariable(name: "__vla_expr1", scope: !7, type: !28, flags: DIFlagArtificial)
!31 = !DILocalVariable(name: "array", scope: !7, file: !1, line: 8, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, elements: !33)
!33 = !{!34, !35}
!34 = !DISubrange(count: !27)
!35 = !DISubrange(count: !30)
!36 = !DILocation(line: 8, column: 8, scope: !7)
!37 = !DILocation(line: 9, column: 30, scope: !7)
!38 = !DILocation(line: 9, column: 38, scope: !7)
!39 = !DILocation(line: 9, column: 36, scope: !7)
!40 = !DILocation(line: 9, column: 10, scope: !7)
!41 = !DILocation(line: 9, column: 15, scope: !7)
!42 = !DILocation(line: 9, column: 4, scope: !7)
!43 = !DILocation(line: 9, column: 19, scope: !7)
!44 = !DILocation(line: 9, column: 24, scope: !7)
!45 = !DILocation(line: 9, column: 28, scope: !7)
!46 = !DILocation(line: 10, column: 35, scope: !7)
!47 = !DILocation(line: 10, column: 40, scope: !7)
!48 = !DILocation(line: 10, column: 43, scope: !7)
!49 = !DILocation(line: 10, column: 48, scope: !7)
!50 = !DILocation(line: 10, column: 57, scope: !7)
!51 = !DILocation(line: 10, column: 62, scope: !7)
!52 = !DILocation(line: 10, column: 51, scope: !7)
!53 = !DILocation(line: 10, column: 66, scope: !7)
!54 = !DILocation(line: 10, column: 71, scope: !7)
!55 = !DILocation(line: 10, column: 4, scope: !7)
!56 = !DILocation(line: 12, column: 4, scope: !7)
!57 = !DILocation(line: 13, column: 1, scope: !7)
