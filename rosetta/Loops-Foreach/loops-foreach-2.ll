; ModuleID = 'loops-foreach-2.c'
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
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %s1 = alloca i8*, align 8
  %s2 = alloca i8*, align 8
  %p1 = alloca i8*, align 8
  %p2 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %s1, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8** %s1, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata i8** %s2, metadata !20, metadata !DIExpression()), !dbg !21
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i8** %s2, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %p1, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i8*, i8** %s1, align 8, !dbg !24
  store i8* %0, i8** %p1, align 8, !dbg !24
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %p1, align 8, !dbg !26
  %2 = load i8, i8* %1, align 1, !dbg !26
  %conv = sext i8 %2 to i32, !dbg !26
  %cmp = icmp ne i32 %conv, 0, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !24

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %p1, align 8, !dbg !28
  %4 = load i8, i8* %3, align 1, !dbg !30
  %conv2 = sext i8 %4 to i32, !dbg !30
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i32 %conv2), !dbg !31
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %5 = load i8*, i8** %p1, align 8, !dbg !26
  %incdec.ptr = getelementptr inbounds i8, i8* %5, i32 1, !dbg !26
  store i8* %incdec.ptr, i8** %p1, align 8, !dbg !26
  %6 = load i8, i8* %5, align 1, !dbg !26
  br label %for.cond, !dbg !26, !llvm.loop !33

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8** %p2, metadata !35, metadata !DIExpression()), !dbg !36
  %7 = load i8*, i8** %s2, align 8, !dbg !37
  store i8* %7, i8** %p2, align 8, !dbg !37
  br label %for.cond3, !dbg !37

for.cond3:                                        ; preds = %for.inc10, %for.end
  %8 = load i8*, i8** %p2, align 8, !dbg !39
  %9 = load i8, i8* %8, align 1, !dbg !39
  %conv4 = sext i8 %9 to i32, !dbg !39
  %cmp5 = icmp ne i32 %conv4, 0, !dbg !39
  br i1 %cmp5, label %for.body7, label %for.end12, !dbg !37

for.body7:                                        ; preds = %for.cond3
  %10 = load i8*, i8** %p2, align 8, !dbg !41
  %11 = load i8, i8* %10, align 1, !dbg !43
  %conv8 = sext i8 %11 to i32, !dbg !43
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 %conv8), !dbg !44
  br label %for.inc10, !dbg !45

for.inc10:                                        ; preds = %for.body7
  %12 = load i8*, i8** %p2, align 8, !dbg !39
  %incdec.ptr11 = getelementptr inbounds i8, i8* %12, i32 1, !dbg !39
  store i8* %incdec.ptr11, i8** %p2, align 8, !dbg !39
  %13 = load i8, i8* %12, align 1, !dbg !39
  br label %for.cond3, !dbg !39, !llvm.loop !46

for.end12:                                        ; preds = %for.cond3
  call void @exit(i32 0) #4, !dbg !48
  unreachable, !dbg !48
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

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
!15 = !DILocation(line: 6, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 6, type: !11)
!17 = !DILocation(line: 6, column: 25, scope: !7)
!18 = !DILocalVariable(name: "s1", scope: !7, file: !1, line: 7, type: !12)
!19 = !DILocation(line: 7, column: 7, scope: !7)
!20 = !DILocalVariable(name: "s2", scope: !7, file: !1, line: 8, type: !12)
!21 = !DILocation(line: 8, column: 7, scope: !7)
!22 = !DILocalVariable(name: "p1", scope: !7, file: !1, line: 9, type: !12)
!23 = !DILocation(line: 9, column: 1, scope: !7)
!24 = !DILocation(line: 9, column: 1, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 1)
!26 = !DILocation(line: 9, column: 1, scope: !27)
!27 = distinct !DILexicalBlock(scope: !25, file: !1, line: 9, column: 1)
!28 = !DILocation(line: 10, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !27, file: !1, line: 9, column: 20)
!30 = !DILocation(line: 10, column: 23, scope: !29)
!31 = !DILocation(line: 10, column: 2, scope: !29)
!32 = !DILocation(line: 11, column: 1, scope: !29)
!33 = distinct !{!33, !24, !34}
!34 = !DILocation(line: 11, column: 1, scope: !25)
!35 = !DILocalVariable(name: "p2", scope: !7, file: !1, line: 12, type: !12)
!36 = !DILocation(line: 12, column: 1, scope: !7)
!37 = !DILocation(line: 12, column: 1, scope: !38)
!38 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 1)
!39 = !DILocation(line: 12, column: 1, scope: !40)
!40 = distinct !DILexicalBlock(scope: !38, file: !1, line: 12, column: 1)
!41 = !DILocation(line: 13, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !40, file: !1, line: 12, column: 19)
!43 = !DILocation(line: 13, column: 23, scope: !42)
!44 = !DILocation(line: 13, column: 2, scope: !42)
!45 = !DILocation(line: 14, column: 1, scope: !42)
!46 = distinct !{!46, !37, !47}
!47 = !DILocation(line: 14, column: 1, scope: !38)
!48 = !DILocation(line: 15, column: 1, scope: !7)
