; ModuleID = 'knuth-shuffle-2.c'
source_filename = "knuth-shuffle-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"before:\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"after: \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @irand(i32 %n) #0 !dbg !7 {
entry:
  %n.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %rand_max = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %r, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %rand_max, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %n.addr, align 4, !dbg !17
  %rem = srem i32 2147483647, %0, !dbg !18
  %sub = sub nsw i32 2147483647, %rem, !dbg !19
  store i32 %sub, i32* %rand_max, align 4, !dbg !16
  br label %while.cond, !dbg !20

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @rand() #4, !dbg !21
  store i32 %call, i32* %r, align 4, !dbg !22
  %1 = load i32, i32* %rand_max, align 4, !dbg !23
  %cmp = icmp sge i32 %call, %1, !dbg !24
  br i1 %cmp, label %while.body, label %while.end, !dbg !20

while.body:                                       ; preds = %while.cond
  br label %while.cond, !dbg !20, !llvm.loop !25

while.end:                                        ; preds = %while.cond
  %2 = load i32, i32* %r, align 4, !dbg !27
  %3 = load i32, i32* %rand_max, align 4, !dbg !28
  %4 = load i32, i32* %n.addr, align 4, !dbg !29
  %div = sdiv i32 %3, %4, !dbg !30
  %div1 = sdiv i32 %2, %div, !dbg !31
  ret i32 %div1, !dbg !32
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @shuffle_int(i32* %list, i64 %len) #0 !dbg !33 {
entry:
  %list.addr = alloca i32*, align 8
  %len.addr = alloca i64, align 8
  %j = alloca i32, align 4
  %tmp = alloca i32, align 4
  store i32* %list, i32** %list.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %list.addr, metadata !40, metadata !DIExpression()), !dbg !41
  store i64 %len, i64* %len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %len.addr, metadata !42, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %j, metadata !43, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !44, metadata !DIExpression()), !dbg !41
  br label %while.cond, !dbg !41

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i64, i64* %len.addr, align 8, !dbg !41
  %tobool = icmp ne i64 %0, 0, !dbg !41
  br i1 %tobool, label %while.body, label %while.end, !dbg !41

while.body:                                       ; preds = %while.cond
  %1 = load i64, i64* %len.addr, align 8, !dbg !45
  %conv = trunc i64 %1 to i32, !dbg !45
  %call = call i32 @irand(i32 %conv), !dbg !45
  store i32 %call, i32* %j, align 4, !dbg !45
  %2 = load i32, i32* %j, align 4, !dbg !47
  %conv1 = sext i32 %2 to i64, !dbg !47
  %3 = load i64, i64* %len.addr, align 8, !dbg !47
  %sub = sub i64 %3, 1, !dbg !47
  %cmp = icmp ne i64 %conv1, %sub, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !45, !cf.info !49

if.then:                                          ; preds = %while.body
  %4 = load i32*, i32** %list.addr, align 8, !dbg !50
  %5 = load i32, i32* %j, align 4, !dbg !50
  %idxprom = sext i32 %5 to i64, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !50
  %6 = load i32, i32* %arrayidx, align 4, !dbg !50
  store i32 %6, i32* %tmp, align 4, !dbg !50
  %7 = load i32*, i32** %list.addr, align 8, !dbg !50
  %8 = load i64, i64* %len.addr, align 8, !dbg !50
  %sub3 = sub i64 %8, 1, !dbg !50
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %sub3, !dbg !50
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !50
  %10 = load i32*, i32** %list.addr, align 8, !dbg !50
  %11 = load i32, i32* %j, align 4, !dbg !50
  %idxprom5 = sext i32 %11 to i64, !dbg !50
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 %idxprom5, !dbg !50
  store i32 %9, i32* %arrayidx6, align 4, !dbg !50
  %12 = load i32, i32* %tmp, align 4, !dbg !50
  %13 = load i32*, i32** %list.addr, align 8, !dbg !50
  %14 = load i64, i64* %len.addr, align 8, !dbg !50
  %sub7 = sub i64 %14, 1, !dbg !50
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 %sub7, !dbg !50
  store i32 %12, i32* %arrayidx8, align 4, !dbg !50
  br label %if.end, !dbg !50

if.end:                                           ; preds = %if.then, %while.body
  %15 = load i64, i64* %len.addr, align 8, !dbg !45
  %dec = add i64 %15, -1, !dbg !45
  store i64 %dec, i64* %len.addr, align 8, !dbg !45
  br label %while.cond, !dbg !41, !llvm.loop !52

while.end:                                        ; preds = %while.cond
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca [20 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [20 x i32]* %x, metadata !58, metadata !DIExpression()), !dbg !62
  store i32 0, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !66
  %cmp = icmp slt i32 %0, 20, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !70
  %2 = load i32, i32* %i, align 4, !dbg !71
  %idxprom = sext i32 %2 to i64, !dbg !72
  %arrayidx = getelementptr inbounds [20 x i32], [20 x i32]* %x, i64 0, i64 %idxprom, !dbg !72
  store i32 %1, i32* %arrayidx, align 4, !dbg !73
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !74
  %inc = add nsw i32 %3, 1, !dbg !74
  store i32 %inc, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !78
  store i32 0, i32* %i, align 4, !dbg !80
  br label %for.cond1, !dbg !78

for.cond1:                                        ; preds = %for.inc8, %for.end
  %4 = load i32, i32* %i, align 4, !dbg !81
  %cmp2 = icmp slt i32 %4, 20, !dbg !83
  br i1 %cmp2, label %lor.end, label %lor.rhs, !dbg !84

lor.rhs:                                          ; preds = %for.cond1
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  %tobool = icmp ne i32 %call3, 0, !dbg !86
  %lnot = xor i1 %tobool, true, !dbg !86
  br label %lor.end, !dbg !84

lor.end:                                          ; preds = %lor.rhs, %for.cond1
  %5 = phi i1 [ true, %for.cond1 ], [ %lnot, %lor.rhs ]
  br i1 %5, label %for.body4, label %for.end10, !dbg !87

for.body4:                                        ; preds = %lor.end
  %6 = load i32, i32* %i, align 4, !dbg !88
  %idxprom5 = sext i32 %6 to i64, !dbg !89
  %arrayidx6 = getelementptr inbounds [20 x i32], [20 x i32]* %x, i64 0, i64 %idxprom5, !dbg !89
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !89
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %7), !dbg !90
  br label %for.inc8, !dbg !90

for.inc8:                                         ; preds = %for.body4
  %8 = load i32, i32* %i, align 4, !dbg !91
  %inc9 = add nsw i32 %8, 1, !dbg !91
  store i32 %inc9, i32* %i, align 4, !dbg !91
  br label %for.cond1, !dbg !92, !llvm.loop !93

for.end10:                                        ; preds = %lor.end
  %arraydecay = getelementptr inbounds [20 x i32], [20 x i32]* %x, i64 0, i64 0, !dbg !95
  call void @shuffle_int(i32* %arraydecay, i64 20), !dbg !96
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  store i32 0, i32* %i, align 4, !dbg !99
  br label %for.cond12, !dbg !97

for.cond12:                                       ; preds = %for.inc23, %for.end10
  %9 = load i32, i32* %i, align 4, !dbg !100
  %cmp13 = icmp slt i32 %9, 20, !dbg !102
  br i1 %cmp13, label %lor.end18, label %lor.rhs14, !dbg !103

lor.rhs14:                                        ; preds = %for.cond12
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  %tobool16 = icmp ne i32 %call15, 0, !dbg !105
  %lnot17 = xor i1 %tobool16, true, !dbg !105
  br label %lor.end18, !dbg !103

lor.end18:                                        ; preds = %lor.rhs14, %for.cond12
  %10 = phi i1 [ true, %for.cond12 ], [ %lnot17, %lor.rhs14 ]
  br i1 %10, label %for.body19, label %for.end25, !dbg !106

for.body19:                                       ; preds = %lor.end18
  %11 = load i32, i32* %i, align 4, !dbg !107
  %idxprom20 = sext i32 %11 to i64, !dbg !108
  %arrayidx21 = getelementptr inbounds [20 x i32], [20 x i32]* %x, i64 0, i64 %idxprom20, !dbg !108
  %12 = load i32, i32* %arrayidx21, align 4, !dbg !108
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %12), !dbg !109
  br label %for.inc23, !dbg !109

for.inc23:                                        ; preds = %for.body19
  %13 = load i32, i32* %i, align 4, !dbg !110
  %inc24 = add nsw i32 %13, 1, !dbg !110
  store i32 %inc24, i32* %i, align 4, !dbg !110
  br label %for.cond12, !dbg !111, !llvm.loop !112

for.end25:                                        ; preds = %lor.end18
  ret i32 0, !dbg !114
}

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "knuth-shuffle-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Knuth-shuffle")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "irand", scope: !1, file: !1, line: 26, type: !8, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 26, type: !10)
!12 = !DILocation(line: 26, column: 15, scope: !7)
!13 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 28, type: !10)
!14 = !DILocation(line: 28, column: 6, scope: !7)
!15 = !DILocalVariable(name: "rand_max", scope: !7, file: !1, line: 28, type: !10)
!16 = !DILocation(line: 28, column: 9, scope: !7)
!17 = !DILocation(line: 28, column: 43, scope: !7)
!18 = !DILocation(line: 28, column: 41, scope: !7)
!19 = !DILocation(line: 28, column: 29, scope: !7)
!20 = !DILocation(line: 32, column: 2, scope: !7)
!21 = !DILocation(line: 32, column: 14, scope: !7)
!22 = !DILocation(line: 32, column: 12, scope: !7)
!23 = !DILocation(line: 32, column: 25, scope: !7)
!24 = !DILocation(line: 32, column: 22, scope: !7)
!25 = distinct !{!25, !20, !26}
!26 = !DILocation(line: 32, column: 34, scope: !7)
!27 = !DILocation(line: 33, column: 9, scope: !7)
!28 = !DILocation(line: 33, column: 14, scope: !7)
!29 = !DILocation(line: 33, column: 25, scope: !7)
!30 = !DILocation(line: 33, column: 23, scope: !7)
!31 = !DILocation(line: 33, column: 11, scope: !7)
!32 = !DILocation(line: 33, column: 2, scope: !7)
!33 = distinct !DISubprogram(name: "shuffle_int", scope: !1, file: !1, line: 37, type: !34, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !36, !37}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocalVariable(name: "list", arg: 1, scope: !33, file: !1, line: 37, type: !36)
!41 = !DILocation(line: 37, column: 1, scope: !33)
!42 = !DILocalVariable(name: "len", arg: 2, scope: !33, file: !1, line: 37, type: !37)
!43 = !DILocalVariable(name: "j", scope: !33, file: !1, line: 37, type: !10)
!44 = !DILocalVariable(name: "tmp", scope: !33, file: !1, line: 37, type: !10)
!45 = !DILocation(line: 37, column: 1, scope: !46)
!46 = distinct !DILexicalBlock(scope: !33, file: !1, line: 37, column: 1)
!47 = !DILocation(line: 37, column: 1, scope: !48)
!48 = distinct !DILexicalBlock(scope: !46, file: !1, line: 37, column: 1)
!49 = !{!"if"}
!50 = !DILocation(line: 37, column: 1, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !1, line: 37, column: 1)
!52 = distinct !{!52, !41, !41}
!53 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 39, type: !54, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!10}
!56 = !DILocalVariable(name: "i", scope: !53, file: !1, line: 41, type: !10)
!57 = !DILocation(line: 41, column: 6, scope: !53)
!58 = !DILocalVariable(name: "x", scope: !53, file: !1, line: 41, type: !59)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 640, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 20)
!62 = !DILocation(line: 41, column: 9, scope: !53)
!63 = !DILocation(line: 43, column: 9, scope: !64)
!64 = distinct !DILexicalBlock(scope: !53, file: !1, line: 43, column: 2)
!65 = !DILocation(line: 43, column: 7, scope: !64)
!66 = !DILocation(line: 43, column: 14, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !1, line: 43, column: 2)
!68 = !DILocation(line: 43, column: 16, scope: !67)
!69 = !DILocation(line: 43, column: 2, scope: !64)
!70 = !DILocation(line: 43, column: 34, scope: !67)
!71 = !DILocation(line: 43, column: 29, scope: !67)
!72 = !DILocation(line: 43, column: 27, scope: !67)
!73 = !DILocation(line: 43, column: 32, scope: !67)
!74 = !DILocation(line: 43, column: 23, scope: !67)
!75 = !DILocation(line: 43, column: 2, scope: !67)
!76 = distinct !{!76, !69, !77}
!77 = !DILocation(line: 43, column: 34, scope: !64)
!78 = !DILocation(line: 44, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !53, file: !1, line: 44, column: 2)
!80 = !DILocation(line: 44, column: 28, scope: !79)
!81 = !DILocation(line: 44, column: 33, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !1, line: 44, column: 2)
!83 = !DILocation(line: 44, column: 35, scope: !82)
!84 = !DILocation(line: 44, column: 40, scope: !82)
!85 = !DILocation(line: 44, column: 44, scope: !82)
!86 = !DILocation(line: 44, column: 43, scope: !82)
!87 = !DILocation(line: 44, column: 2, scope: !79)
!88 = !DILocation(line: 45, column: 19, scope: !82)
!89 = !DILocation(line: 45, column: 17, scope: !82)
!90 = !DILocation(line: 45, column: 3, scope: !82)
!91 = !DILocation(line: 44, column: 59, scope: !82)
!92 = !DILocation(line: 44, column: 2, scope: !82)
!93 = distinct !{!93, !87, !94}
!94 = !DILocation(line: 45, column: 21, scope: !79)
!95 = !DILocation(line: 47, column: 14, scope: !53)
!96 = !DILocation(line: 47, column: 2, scope: !53)
!97 = !DILocation(line: 49, column: 7, scope: !98)
!98 = distinct !DILexicalBlock(scope: !53, file: !1, line: 49, column: 2)
!99 = !DILocation(line: 49, column: 28, scope: !98)
!100 = !DILocation(line: 49, column: 33, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !1, line: 49, column: 2)
!102 = !DILocation(line: 49, column: 35, scope: !101)
!103 = !DILocation(line: 49, column: 40, scope: !101)
!104 = !DILocation(line: 49, column: 44, scope: !101)
!105 = !DILocation(line: 49, column: 43, scope: !101)
!106 = !DILocation(line: 49, column: 2, scope: !98)
!107 = !DILocation(line: 50, column: 19, scope: !101)
!108 = !DILocation(line: 50, column: 17, scope: !101)
!109 = !DILocation(line: 50, column: 3, scope: !101)
!110 = !DILocation(line: 49, column: 59, scope: !101)
!111 = !DILocation(line: 49, column: 2, scope: !101)
!112 = distinct !{!112, !106, !113}
!113 = !DILocation(line: 50, column: 21, scope: !98)
!114 = !DILocation(line: 51, column: 2, scope: !53)
