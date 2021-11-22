; ModuleID = 'old-lady-swallowed-a-fly.c'
source_filename = "old-lady-swallowed-a-fly.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [45 x i8] c"There was an old lady who swallowed a %s\0A%s\0A\00", align 1
@animals = internal global [8 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0)], align 16, !dbg !0
@verses = internal global [8 x i8*] [i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.18, i32 0, i32 0)], align 16, !dbg !6
@.str.1 = private unnamed_addr constant [38 x i8] c"She swallowed the %s to catch the %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"fly\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"spider\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"bird\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"cat\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"dog\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"goat\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"cow\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"horse\00", align 1
@.str.11 = private unnamed_addr constant [61 x i8] c"I don't know why she swallowed that fly.\0APerhaps she'll die\0A\00", align 1
@.str.12 = private unnamed_addr constant [48 x i8] c"That wiggled and jiggled and tickled inside her\00", align 1
@.str.13 = private unnamed_addr constant [30 x i8] c"How absurd, to swallow a bird\00", align 1
@.str.14 = private unnamed_addr constant [34 x i8] c"Imagine that. She swallowed a cat\00", align 1
@.str.15 = private unnamed_addr constant [28 x i8] c"What a hog to swallow a dog\00", align 1
@.str.16 = private unnamed_addr constant [51 x i8] c"She just opened her throat and swallowed that goat\00", align 1
@.str.17 = private unnamed_addr constant [40 x i8] c"I don't know how she swallowed that cow\00", align 1
@.str.18 = private unnamed_addr constant [21 x i8] c"She's dead of course\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !18 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %i, metadata !22, metadata !DIExpression()), !dbg !27
  store i64 0, i64* %i, align 8, !dbg !27
  br label %for.cond, !dbg !28

for.cond:                                         ; preds = %for.inc11, %entry
  %0 = load i64, i64* %i, align 8, !dbg !29
  %cmp = icmp ult i64 %0, 8, !dbg !31
  br i1 %cmp, label %for.body, label %for.end12, !dbg !32

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !33
  %arrayidx = getelementptr inbounds [8 x i8*], [8 x i8*]* @animals, i64 0, i64 %1, !dbg !35
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !35
  %3 = load i64, i64* %i, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds [8 x i8*], [8 x i8*]* @verses, i64 0, i64 %3, !dbg !37
  %4 = load i8*, i8** %arrayidx1, align 8, !dbg !37
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), i8* %2, i8* %4), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %j, metadata !39, metadata !DIExpression()), !dbg !41
  %5 = load i64, i64* %i, align 8, !dbg !42
  store i64 %5, i64* %j, align 8, !dbg !41
  br label %for.cond2, !dbg !43

for.cond2:                                        ; preds = %for.inc, %for.body
  %6 = load i64, i64* %j, align 8, !dbg !44
  %cmp3 = icmp ugt i64 %6, 0, !dbg !46
  br i1 %cmp3, label %land.rhs, label %land.end, !dbg !47

land.rhs:                                         ; preds = %for.cond2
  %7 = load i64, i64* %i, align 8, !dbg !48
  %cmp4 = icmp ult i64 %7, 7, !dbg !49
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond2
  %8 = phi i1 [ false, %for.cond2 ], [ %cmp4, %land.rhs ], !dbg !50
  br i1 %8, label %for.body5, label %for.end, !dbg !51

for.body5:                                        ; preds = %land.end
  %9 = load i64, i64* %j, align 8, !dbg !52
  %arrayidx6 = getelementptr inbounds [8 x i8*], [8 x i8*]* @animals, i64 0, i64 %9, !dbg !54
  %10 = load i8*, i8** %arrayidx6, align 8, !dbg !54
  %11 = load i64, i64* %j, align 8, !dbg !55
  %sub = sub i64 %11, 1, !dbg !56
  %arrayidx7 = getelementptr inbounds [8 x i8*], [8 x i8*]* @animals, i64 0, i64 %sub, !dbg !57
  %12 = load i8*, i8** %arrayidx7, align 8, !dbg !57
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.1, i64 0, i64 0), i8* %10, i8* %12), !dbg !58
  %13 = load i64, i64* %j, align 8, !dbg !59
  %cmp9 = icmp eq i64 %13, 1, !dbg !61
  br i1 %cmp9, label %if.then, label %if.end, !dbg !62, !cf.info !63

if.then:                                          ; preds = %for.body5
  %14 = load i8*, i8** getelementptr inbounds ([8 x i8*], [8 x i8*]* @verses, i64 0, i64 0), align 16, !dbg !64
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8* %14), !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.then, %for.body5
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %if.end
  %15 = load i64, i64* %j, align 8, !dbg !69
  %dec = add i64 %15, -1, !dbg !69
  store i64 %dec, i64* %j, align 8, !dbg !69
  br label %for.cond2, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %land.end
  br label %for.inc11, !dbg !73

for.inc11:                                        ; preds = %for.end
  %16 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %16, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end12:                                        ; preds = %for.cond
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "animals", scope: !2, file: !3, line: 4, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "old-lady-swallowed-a-fly.c", directory: "/scratch/yc0769/rosetta_small/Old-lady-swallowed-a-fly")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "verses", scope: !2, file: !3, line: 14, type: !8, isLocal: true, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 512, elements: !12)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 8)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!18 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 26, type: !19, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{!21}
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocalVariable(name: "i", scope: !23, file: !3, line: 27, type: !24)
!23 = distinct !DILexicalBlock(scope: !18, file: !3, line: 27, column: 3)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !25, line: 46, baseType: !26)
!25 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 27, column: 15, scope: !23)
!28 = !DILocation(line: 27, column: 8, scope: !23)
!29 = !DILocation(line: 27, column: 22, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !3, line: 27, column: 3)
!31 = !DILocation(line: 27, column: 24, scope: !30)
!32 = !DILocation(line: 27, column: 3, scope: !23)
!33 = !DILocation(line: 28, column: 70, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !3, line: 27, column: 45)
!35 = !DILocation(line: 28, column: 62, scope: !34)
!36 = !DILocation(line: 28, column: 81, scope: !34)
!37 = !DILocation(line: 28, column: 74, scope: !34)
!38 = !DILocation(line: 28, column: 5, scope: !34)
!39 = !DILocalVariable(name: "j", scope: !40, file: !3, line: 29, type: !24)
!40 = distinct !DILexicalBlock(scope: !34, file: !3, line: 29, column: 5)
!41 = !DILocation(line: 29, column: 17, scope: !40)
!42 = !DILocation(line: 29, column: 21, scope: !40)
!43 = !DILocation(line: 29, column: 10, scope: !40)
!44 = !DILocation(line: 29, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !3, line: 29, column: 5)
!46 = !DILocation(line: 29, column: 26, scope: !45)
!47 = !DILocation(line: 29, column: 30, scope: !45)
!48 = !DILocation(line: 29, column: 33, scope: !45)
!49 = !DILocation(line: 29, column: 35, scope: !45)
!50 = !DILocation(line: 0, scope: !45)
!51 = !DILocation(line: 29, column: 5, scope: !40)
!52 = !DILocation(line: 30, column: 64, scope: !53)
!53 = distinct !DILexicalBlock(scope: !45, file: !3, line: 29, column: 60)
!54 = !DILocation(line: 30, column: 56, scope: !53)
!55 = !DILocation(line: 30, column: 76, scope: !53)
!56 = !DILocation(line: 30, column: 77, scope: !53)
!57 = !DILocation(line: 30, column: 68, scope: !53)
!58 = !DILocation(line: 30, column: 7, scope: !53)
!59 = !DILocation(line: 31, column: 11, scope: !60)
!60 = distinct !DILexicalBlock(scope: !53, file: !3, line: 31, column: 11)
!61 = !DILocation(line: 31, column: 13, scope: !60)
!62 = !DILocation(line: 31, column: 11, scope: !53)
!63 = !{!"if"}
!64 = !DILocation(line: 32, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !3, line: 31, column: 19)
!66 = !DILocation(line: 32, column: 9, scope: !65)
!67 = !DILocation(line: 33, column: 7, scope: !65)
!68 = !DILocation(line: 34, column: 5, scope: !53)
!69 = !DILocation(line: 29, column: 56, scope: !45)
!70 = !DILocation(line: 29, column: 5, scope: !45)
!71 = distinct !{!71, !51, !72}
!72 = !DILocation(line: 34, column: 5, scope: !40)
!73 = !DILocation(line: 35, column: 3, scope: !34)
!74 = !DILocation(line: 27, column: 41, scope: !30)
!75 = !DILocation(line: 27, column: 3, scope: !30)
!76 = distinct !{!76, !32, !77}
!77 = !DILocation(line: 35, column: 3, scope: !23)
!78 = !DILocation(line: 36, column: 3, scope: !18)
