; ModuleID = 'loops-foreach-2.ll'
source_filename = "loops-foreach-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"abcdefg\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"123456789\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"loop 1 %c\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"loop 2 %c\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8** %argv, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), metadata !17, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), metadata !18, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), metadata !19, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.inc, %entry
  %p1.0 = phi i8* [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), %entry ], [ %incdec.ptr, %for.inc ], !dbg !22
  call void @llvm.dbg.value(metadata i8* %p1.0, metadata !19, metadata !DIExpression()), !dbg !15
  %0 = load i8, i8* %p1.0, align 1, !dbg !23
  %conv = sext i8 %0 to i32, !dbg !23
  %cmp = icmp ne i32 %conv, 0, !dbg !23
  br i1 %cmp, label %for.body, label %for.end, !dbg !20

for.body:                                         ; preds = %for.cond
  %1 = load i8, i8* %p1.0, align 1, !dbg !25
  %conv2 = sext i8 %1 to i32, !dbg !25
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i32 %conv2), !dbg !27
  br label %for.inc, !dbg !28

for.inc:                                          ; preds = %for.body
  %incdec.ptr = getelementptr inbounds i8, i8* %p1.0, i32 1, !dbg !23
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !19, metadata !DIExpression()), !dbg !15
  %2 = load i8, i8* %p1.0, align 1, !dbg !23
  br label %for.cond, !dbg !23, !llvm.loop !29

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), metadata !31, metadata !DIExpression()), !dbg !15
  br label %for.cond3, !dbg !32

for.cond3:                                        ; preds = %for.inc10, %for.end
  %p2.0 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), %for.end ], [ %incdec.ptr11, %for.inc10 ], !dbg !34
  call void @llvm.dbg.value(metadata i8* %p2.0, metadata !31, metadata !DIExpression()), !dbg !15
  %3 = load i8, i8* %p2.0, align 1, !dbg !35
  %conv4 = sext i8 %3 to i32, !dbg !35
  %cmp5 = icmp ne i32 %conv4, 0, !dbg !35
  br i1 %cmp5, label %for.body7, label %for.end12, !dbg !32

for.body7:                                        ; preds = %for.cond3
  %4 = load i8, i8* %p2.0, align 1, !dbg !37
  %conv8 = sext i8 %4 to i32, !dbg !37
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 %conv8), !dbg !39
  br label %for.inc10, !dbg !40

for.inc10:                                        ; preds = %for.body7
  %incdec.ptr11 = getelementptr inbounds i8, i8* %p2.0, i32 1, !dbg !35
  call void @llvm.dbg.value(metadata i8* %incdec.ptr11, metadata !31, metadata !DIExpression()), !dbg !15
  %5 = load i8, i8* %p2.0, align 1, !dbg !35
  br label %for.cond3, !dbg !35, !llvm.loop !41

for.end12:                                        ; preds = %for.cond3
  call void @exit(i32 0) #4, !dbg !43
  unreachable, !dbg !43
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "loops-foreach-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Loops-Foreach")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 6, type: !10)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 6, type: !11)
!17 = !DILocalVariable(name: "s1", scope: !7, file: !1, line: 7, type: !12)
!18 = !DILocalVariable(name: "s2", scope: !7, file: !1, line: 8, type: !12)
!19 = !DILocalVariable(name: "p1", scope: !7, file: !1, line: 9, type: !12)
!20 = !DILocation(line: 9, column: 1, scope: !21)
!21 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 1)
!22 = !DILocation(line: 0, scope: !21)
!23 = !DILocation(line: 9, column: 1, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !1, line: 9, column: 1)
!25 = !DILocation(line: 10, column: 23, scope: !26)
!26 = distinct !DILexicalBlock(scope: !24, file: !1, line: 9, column: 20)
!27 = !DILocation(line: 10, column: 2, scope: !26)
!28 = !DILocation(line: 11, column: 1, scope: !26)
!29 = distinct !{!29, !20, !30}
!30 = !DILocation(line: 11, column: 1, scope: !21)
!31 = !DILocalVariable(name: "p2", scope: !7, file: !1, line: 12, type: !12)
!32 = !DILocation(line: 12, column: 1, scope: !33)
!33 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 1)
!34 = !DILocation(line: 0, scope: !33)
!35 = !DILocation(line: 12, column: 1, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !1, line: 12, column: 1)
!37 = !DILocation(line: 13, column: 23, scope: !38)
!38 = distinct !DILexicalBlock(scope: !36, file: !1, line: 12, column: 19)
!39 = !DILocation(line: 13, column: 2, scope: !38)
!40 = !DILocation(line: 14, column: 1, scope: !38)
!41 = distinct !{!41, !32, !42}
!42 = !DILocation(line: 14, column: 1, scope: !33)
!43 = !DILocation(line: 15, column: 1, scope: !7)
