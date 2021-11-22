; ModuleID = 'almost-prime.c'
source_filename = "almost-prime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"k = %d:\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" %d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @kprime(i32 %n, i32 %k) #0 !dbg !7 {
entry:
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %p = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %k, i32* %k.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %k.addr, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %p, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %f, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %f, align 4, !dbg !18
  store i32 2, i32* %p, align 4, !dbg !19
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %f, align 4, !dbg !22
  %1 = load i32, i32* %k.addr, align 4, !dbg !24
  %cmp = icmp slt i32 %0, %1, !dbg !25
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !26

land.rhs:                                         ; preds = %for.cond
  %2 = load i32, i32* %p, align 4, !dbg !27
  %3 = load i32, i32* %p, align 4, !dbg !28
  %mul = mul nsw i32 %2, %3, !dbg !29
  %4 = load i32, i32* %n.addr, align 4, !dbg !30
  %cmp1 = icmp sle i32 %mul, %4, !dbg !31
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %cmp1, %land.rhs ], !dbg !32
  br i1 %5, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %land.end
  br label %while.cond, !dbg !34

while.cond:                                       ; preds = %while.body, %for.body
  %6 = load i32, i32* %n.addr, align 4, !dbg !35
  %7 = load i32, i32* %p, align 4, !dbg !36
  %rem = srem i32 %6, %7, !dbg !37
  %cmp2 = icmp eq i32 0, %rem, !dbg !38
  br i1 %cmp2, label %while.body, label %while.end, !dbg !34

while.body:                                       ; preds = %while.cond
  %8 = load i32, i32* %p, align 4, !dbg !39
  %9 = load i32, i32* %n.addr, align 4, !dbg !40
  %div = sdiv i32 %9, %8, !dbg !40
  store i32 %div, i32* %n.addr, align 4, !dbg !40
  %10 = load i32, i32* %f, align 4, !dbg !41
  %inc = add nsw i32 %10, 1, !dbg !41
  store i32 %inc, i32* %f, align 4, !dbg !41
  br label %while.cond, !dbg !34, !llvm.loop !42

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !34

for.inc:                                          ; preds = %while.end
  %11 = load i32, i32* %p, align 4, !dbg !43
  %inc3 = add nsw i32 %11, 1, !dbg !43
  store i32 %inc3, i32* %p, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %land.end
  %12 = load i32, i32* %f, align 4, !dbg !47
  %13 = load i32, i32* %n.addr, align 4, !dbg !48
  %cmp4 = icmp sgt i32 %13, 1, !dbg !49
  %conv = zext i1 %cmp4 to i32, !dbg !49
  %add = add nsw i32 %12, %conv, !dbg !50
  %14 = load i32, i32* %k.addr, align 4, !dbg !51
  %cmp5 = icmp eq i32 %add, %14, !dbg !52
  %conv6 = zext i1 %cmp5 to i32, !dbg !52
  ret i32 %conv6, !dbg !53
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32* %c, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32* %k, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 1, i32* %k, align 4, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %k, align 4, !dbg !66
  %cmp = icmp sle i32 %0, 5, !dbg !68
  br i1 %cmp, label %for.body, label %for.end10, !dbg !69

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %k, align 4, !dbg !70
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !72
  store i32 2, i32* %i, align 4, !dbg !73
  store i32 0, i32* %c, align 4, !dbg !75
  br label %for.cond1, !dbg !76

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %c, align 4, !dbg !77
  %cmp2 = icmp slt i32 %2, 10, !dbg !79
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !80

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %i, align 4, !dbg !81
  %4 = load i32, i32* %k, align 4, !dbg !83
  %call4 = call i32 @kprime(i32 %3, i32 %4), !dbg !84
  %tobool = icmp ne i32 %call4, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.end, !dbg !85, !cf.info !86

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %i, align 4, !dbg !87
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %5), !dbg !89
  %6 = load i32, i32* %c, align 4, !dbg !90
  %inc = add nsw i32 %6, 1, !dbg !90
  store i32 %inc, i32* %c, align 4, !dbg !90
  br label %if.end, !dbg !91

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4, !dbg !93
  %inc6 = add nsw i32 %7, 1, !dbg !93
  store i32 %inc6, i32* %i, align 4, !dbg !93
  br label %for.cond1, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond1
  %call7 = call i32 @putchar(i32 10), !dbg !97
  br label %for.inc8, !dbg !98

for.inc8:                                         ; preds = %for.end
  %8 = load i32, i32* %k, align 4, !dbg !99
  %inc9 = add nsw i32 %8, 1, !dbg !99
  store i32 %inc9, i32* %k, align 4, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end10:                                        ; preds = %for.cond
  ret i32 0, !dbg !103
}

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @putchar(i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "almost-prime.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Almost-prime")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "kprime", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 16, scope: !7)
!13 = !DILocalVariable(name: "k", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!14 = !DILocation(line: 3, column: 23, scope: !7)
!15 = !DILocalVariable(name: "p", scope: !7, file: !1, line: 5, type: !10)
!16 = !DILocation(line: 5, column: 6, scope: !7)
!17 = !DILocalVariable(name: "f", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 5, column: 9, scope: !7)
!19 = !DILocation(line: 6, column: 9, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 2)
!21 = !DILocation(line: 6, column: 7, scope: !20)
!22 = !DILocation(line: 6, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !1, line: 6, column: 2)
!24 = !DILocation(line: 6, column: 18, scope: !23)
!25 = !DILocation(line: 6, column: 16, scope: !23)
!26 = !DILocation(line: 6, column: 20, scope: !23)
!27 = !DILocation(line: 6, column: 23, scope: !23)
!28 = !DILocation(line: 6, column: 25, scope: !23)
!29 = !DILocation(line: 6, column: 24, scope: !23)
!30 = !DILocation(line: 6, column: 30, scope: !23)
!31 = !DILocation(line: 6, column: 27, scope: !23)
!32 = !DILocation(line: 0, scope: !23)
!33 = !DILocation(line: 6, column: 2, scope: !20)
!34 = !DILocation(line: 7, column: 3, scope: !23)
!35 = !DILocation(line: 7, column: 15, scope: !23)
!36 = !DILocation(line: 7, column: 19, scope: !23)
!37 = !DILocation(line: 7, column: 17, scope: !23)
!38 = !DILocation(line: 7, column: 12, scope: !23)
!39 = !DILocation(line: 8, column: 9, scope: !23)
!40 = !DILocation(line: 8, column: 6, scope: !23)
!41 = !DILocation(line: 8, column: 13, scope: !23)
!42 = distinct !{!42, !34, !41}
!43 = !DILocation(line: 6, column: 34, scope: !23)
!44 = !DILocation(line: 6, column: 2, scope: !23)
!45 = distinct !{!45, !33, !46}
!46 = !DILocation(line: 8, column: 13, scope: !20)
!47 = !DILocation(line: 10, column: 9, scope: !7)
!48 = !DILocation(line: 10, column: 14, scope: !7)
!49 = !DILocation(line: 10, column: 16, scope: !7)
!50 = !DILocation(line: 10, column: 11, scope: !7)
!51 = !DILocation(line: 10, column: 24, scope: !7)
!52 = !DILocation(line: 10, column: 21, scope: !7)
!53 = !DILocation(line: 10, column: 2, scope: !7)
!54 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 13, type: !55, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!10}
!57 = !DILocalVariable(name: "i", scope: !54, file: !1, line: 15, type: !10)
!58 = !DILocation(line: 15, column: 6, scope: !54)
!59 = !DILocalVariable(name: "c", scope: !54, file: !1, line: 15, type: !10)
!60 = !DILocation(line: 15, column: 9, scope: !54)
!61 = !DILocalVariable(name: "k", scope: !54, file: !1, line: 15, type: !10)
!62 = !DILocation(line: 15, column: 12, scope: !54)
!63 = !DILocation(line: 17, column: 9, scope: !64)
!64 = distinct !DILexicalBlock(scope: !54, file: !1, line: 17, column: 2)
!65 = !DILocation(line: 17, column: 7, scope: !64)
!66 = !DILocation(line: 17, column: 14, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !1, line: 17, column: 2)
!68 = !DILocation(line: 17, column: 16, scope: !67)
!69 = !DILocation(line: 17, column: 2, scope: !64)
!70 = !DILocation(line: 18, column: 21, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !1, line: 17, column: 27)
!72 = !DILocation(line: 18, column: 3, scope: !71)
!73 = !DILocation(line: 20, column: 10, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !1, line: 20, column: 3)
!75 = !DILocation(line: 20, column: 17, scope: !74)
!76 = !DILocation(line: 20, column: 8, scope: !74)
!77 = !DILocation(line: 20, column: 22, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 20, column: 3)
!79 = !DILocation(line: 20, column: 24, scope: !78)
!80 = !DILocation(line: 20, column: 3, scope: !74)
!81 = !DILocation(line: 21, column: 15, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !1, line: 21, column: 8)
!83 = !DILocation(line: 21, column: 18, scope: !82)
!84 = !DILocation(line: 21, column: 8, scope: !82)
!85 = !DILocation(line: 21, column: 8, scope: !78)
!86 = !{!"if"}
!87 = !DILocation(line: 22, column: 19, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !1, line: 21, column: 22)
!89 = !DILocation(line: 22, column: 5, scope: !88)
!90 = !DILocation(line: 23, column: 6, scope: !88)
!91 = !DILocation(line: 24, column: 4, scope: !88)
!92 = !DILocation(line: 21, column: 19, scope: !82)
!93 = !DILocation(line: 20, column: 31, scope: !78)
!94 = !DILocation(line: 20, column: 3, scope: !78)
!95 = distinct !{!95, !80, !96}
!96 = !DILocation(line: 24, column: 4, scope: !74)
!97 = !DILocation(line: 26, column: 3, scope: !71)
!98 = !DILocation(line: 27, column: 2, scope: !71)
!99 = !DILocation(line: 17, column: 23, scope: !67)
!100 = !DILocation(line: 17, column: 2, scope: !67)
!101 = distinct !{!101, !69, !102}
!102 = !DILocation(line: 27, column: 2, scope: !64)
!103 = !DILocation(line: 29, column: 2, scope: !54)
