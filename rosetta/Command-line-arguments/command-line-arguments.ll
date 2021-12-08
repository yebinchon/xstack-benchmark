; ModuleID = 'command-line-arguments.bc'
source_filename = "command-line-arguments.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"This program is named %s.\0A\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"the argument #%d is %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 0, !dbg !20
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !20
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0), i8* %1), !dbg !21
  store i32 1, i32* %i, align 4, !dbg !22
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !25
  %3 = load i32, i32* %argc.addr, align 4, !dbg !27
  %cmp = icmp slt i32 %2, %3, !dbg !28
  br i1 %cmp, label %for.body, label %for.end, !dbg !29

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !30
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !31
  %6 = load i32, i32* %i, align 4, !dbg !32
  %idxprom = sext i32 %6 to i64, !dbg !31
  %arrayidx1 = getelementptr inbounds i8*, i8** %5, i64 %idxprom, !dbg !31
  %7 = load i8*, i8** %arrayidx1, align 8, !dbg !31
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0), i32 %4, i8* %7), !dbg !33
  br label %for.inc, !dbg !34

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !35
  %inc = add nsw i32 %8, 1, !dbg !35
  store i32 %inc, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !36, !llvm.loop !37

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !39
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "command-line-arguments.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Command-line-arguments")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!15 = !DILocation(line: 4, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 4, type: !11)
!17 = !DILocation(line: 4, column: 26, scope: !7)
!18 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 6, type: !10)
!19 = !DILocation(line: 6, column: 7, scope: !7)
!20 = !DILocation(line: 7, column: 48, scope: !7)
!21 = !DILocation(line: 7, column: 10, scope: !7)
!22 = !DILocation(line: 8, column: 10, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 3)
!24 = !DILocation(line: 8, column: 8, scope: !23)
!25 = !DILocation(line: 8, column: 15, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !1, line: 8, column: 3)
!27 = !DILocation(line: 8, column: 19, scope: !26)
!28 = !DILocation(line: 8, column: 17, scope: !26)
!29 = !DILocation(line: 8, column: 3, scope: !23)
!30 = !DILocation(line: 9, column: 47, scope: !26)
!31 = !DILocation(line: 9, column: 50, scope: !26)
!32 = !DILocation(line: 9, column: 55, scope: !26)
!33 = !DILocation(line: 9, column: 12, scope: !26)
!34 = !DILocation(line: 9, column: 5, scope: !26)
!35 = !DILocation(line: 8, column: 25, scope: !26)
!36 = !DILocation(line: 8, column: 3, scope: !26)
!37 = distinct !{!37, !29, !38}
!38 = !DILocation(line: 9, column: 57, scope: !23)
!39 = !DILocation(line: 10, column: 3, scope: !7)
