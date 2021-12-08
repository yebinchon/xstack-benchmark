; ModuleID = 'arithmetic-integer.ll'
source_filename = "arithmetic-integer.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"a+b = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"a-b = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"a*b = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"a/b = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"a%%b = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8** %argv, metadata !16, metadata !DIExpression()), !dbg !15
  %cmp = icmp slt i32 %argc, 3, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !19

if.then:                                          ; preds = %entry
  call void @exit(i32 1) #5, !dbg !20
  unreachable, !dbg !20

if.end:                                           ; preds = %entry
  %dec = add nsw i32 %argc, -1, !dbg !21
  call void @llvm.dbg.value(metadata i32 %dec, metadata !14, metadata !DIExpression()), !dbg !15
  %idxprom = sext i32 %dec to i64, !dbg !22
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 %idxprom, !dbg !22
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !22
  %call = call i32 @atoi(i8* %0) #6, !dbg !23
  call void @llvm.dbg.value(metadata i32 %call, metadata !24, metadata !DIExpression()), !dbg !15
  %cmp1 = icmp eq i32 %call, 0, !dbg !25
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !27

if.then2:                                         ; preds = %if.end
  call void @exit(i32 2) #5, !dbg !28
  unreachable, !dbg !28

if.end3:                                          ; preds = %if.end
  %dec4 = add nsw i32 %dec, -1, !dbg !29
  call void @llvm.dbg.value(metadata i32 %dec4, metadata !14, metadata !DIExpression()), !dbg !15
  %idxprom5 = sext i32 %dec4 to i64, !dbg !30
  %arrayidx6 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom5, !dbg !30
  %1 = load i8*, i8** %arrayidx6, align 8, !dbg !30
  %call7 = call i32 @atoi(i8* %1) #6, !dbg !31
  call void @llvm.dbg.value(metadata i32 %call7, metadata !32, metadata !DIExpression()), !dbg !15
  %add = add nsw i32 %call7, %call, !dbg !33
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %add), !dbg !34
  %sub = sub nsw i32 %call7, %call, !dbg !35
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 %sub), !dbg !36
  %mul = mul nsw i32 %call7, %call, !dbg !37
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i32 %mul), !dbg !38
  %div = sdiv i32 %call7, %call, !dbg !39
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %div), !dbg !40
  %rem = srem i32 %call7, %call, !dbg !41
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i32 %rem), !dbg !42
  ret i32 0, !dbg !43
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "arithmetic-integer.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arithmetic-Integer")
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
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 4, type: !11)
!17 = !DILocation(line: 7, column: 12, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 7)
!19 = !DILocation(line: 7, column: 7, scope: !7)
!20 = !DILocation(line: 7, column: 17, scope: !18)
!21 = !DILocation(line: 8, column: 17, scope: !7)
!22 = !DILocation(line: 8, column: 12, scope: !7)
!23 = !DILocation(line: 8, column: 7, scope: !7)
!24 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 6, type: !10)
!25 = !DILocation(line: 9, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 7)
!27 = !DILocation(line: 9, column: 7, scope: !7)
!28 = !DILocation(line: 9, column: 15, scope: !26)
!29 = !DILocation(line: 10, column: 17, scope: !7)
!30 = !DILocation(line: 10, column: 12, scope: !7)
!31 = !DILocation(line: 10, column: 7, scope: !7)
!32 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 6, type: !10)
!33 = !DILocation(line: 11, column: 25, scope: !7)
!34 = !DILocation(line: 11, column: 3, scope: !7)
!35 = !DILocation(line: 12, column: 25, scope: !7)
!36 = !DILocation(line: 12, column: 3, scope: !7)
!37 = !DILocation(line: 13, column: 25, scope: !7)
!38 = !DILocation(line: 13, column: 3, scope: !7)
!39 = !DILocation(line: 14, column: 25, scope: !7)
!40 = !DILocation(line: 14, column: 3, scope: !7)
!41 = !DILocation(line: 15, column: 26, scope: !7)
!42 = !DILocation(line: 15, column: 3, scope: !7)
!43 = !DILocation(line: 16, column: 3, scope: !7)
