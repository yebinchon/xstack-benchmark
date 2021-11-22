; ModuleID = 'josephus-problem.c'
source_filename = "josephus-problem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [40 x i8] c"n = %llu, k = %llu, final survivor: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"n = %llu, k = %llu, three survivors:\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c" %llu\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @jos(i32 %n, i32 %k, i32 %m) #0 !dbg !7 {
entry:
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %k, i32* %k.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %k.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %a, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %m.addr, align 4, !dbg !19
  %add = add nsw i32 %0, 1, !dbg !21
  store i32 %add, i32* %a, align 4, !dbg !22
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %a, align 4, !dbg !24
  %2 = load i32, i32* %n.addr, align 4, !dbg !26
  %cmp = icmp sle i32 %1, %2, !dbg !27
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %m.addr, align 4, !dbg !29
  %4 = load i32, i32* %k.addr, align 4, !dbg !30
  %add1 = add nsw i32 %3, %4, !dbg !31
  %5 = load i32, i32* %a, align 4, !dbg !32
  %rem = srem i32 %add1, %5, !dbg !33
  store i32 %rem, i32* %m.addr, align 4, !dbg !34
  br label %for.inc, !dbg !35

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %a, align 4, !dbg !36
  %inc = add nsw i32 %6, 1, !dbg !36
  store i32 %inc, i32* %a, align 4, !dbg !36
  br label %for.cond, !dbg !37, !llvm.loop !38

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %m.addr, align 4, !dbg !40
  ret i32 %7, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @jos_large(i64 %n, i64 %k, i64 %m) #0 !dbg !42 {
entry:
  %retval = alloca i64, align 8
  %n.addr = alloca i64, align 8
  %k.addr = alloca i64, align 8
  %m.addr = alloca i64, align 8
  %a = alloca i64, align 8
  %q = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i64 %k, i64* %k.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %k.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i64 %m, i64* %m.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %m.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i64, i64* %k.addr, align 8, !dbg !53
  %cmp = icmp ule i64 %0, 1, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56, !cf.info !57

if.then:                                          ; preds = %entry
  %1 = load i64, i64* %n.addr, align 8, !dbg !58
  %2 = load i64, i64* %m.addr, align 8, !dbg !59
  %sub = sub i64 %1, %2, !dbg !60
  %sub1 = sub i64 %sub, 1, !dbg !61
  store i64 %sub1, i64* %retval, align 8, !dbg !62
  br label %return, !dbg !62

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %a, metadata !63, metadata !DIExpression()), !dbg !64
  %3 = load i64, i64* %m.addr, align 8, !dbg !65
  store i64 %3, i64* %a, align 8, !dbg !64
  br label %while.cond, !dbg !66

while.cond:                                       ; preds = %if.end12, %if.end
  %4 = load i64, i64* %a, align 8, !dbg !67
  %5 = load i64, i64* %n.addr, align 8, !dbg !68
  %cmp2 = icmp ult i64 %4, %5, !dbg !69
  br i1 %cmp2, label %while.body, label %while.end, !dbg !66

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i64* %q, metadata !70, metadata !DIExpression()), !dbg !72
  %6 = load i64, i64* %a, align 8, !dbg !73
  %7 = load i64, i64* %m.addr, align 8, !dbg !74
  %sub3 = sub i64 %6, %7, !dbg !75
  %8 = load i64, i64* %k.addr, align 8, !dbg !76
  %add = add i64 %sub3, %8, !dbg !77
  %sub4 = sub i64 %add, 2, !dbg !78
  %9 = load i64, i64* %k.addr, align 8, !dbg !79
  %sub5 = sub i64 %9, 1, !dbg !80
  %div = udiv i64 %sub4, %sub5, !dbg !81
  store i64 %div, i64* %q, align 8, !dbg !72
  %10 = load i64, i64* %a, align 8, !dbg !82
  %11 = load i64, i64* %q, align 8, !dbg !84
  %add6 = add i64 %10, %11, !dbg !85
  %12 = load i64, i64* %n.addr, align 8, !dbg !86
  %cmp7 = icmp ugt i64 %add6, %12, !dbg !87
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !88, !cf.info !57

if.then8:                                         ; preds = %while.body
  %13 = load i64, i64* %n.addr, align 8, !dbg !89
  %14 = load i64, i64* %a, align 8, !dbg !90
  %sub9 = sub i64 %13, %14, !dbg !91
  store i64 %sub9, i64* %q, align 8, !dbg !92
  br label %if.end12, !dbg !93

if.else:                                          ; preds = %while.body
  %15 = load i64, i64* %q, align 8, !dbg !94
  %tobool = icmp ne i64 %15, 0, !dbg !94
  br i1 %tobool, label %if.end11, label %if.then10, !dbg !96, !cf.info !57

if.then10:                                        ; preds = %if.else
  store i64 1, i64* %q, align 8, !dbg !97
  br label %if.end11, !dbg !98

if.end11:                                         ; preds = %if.then10, %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then8
  %16 = load i64, i64* %m.addr, align 8, !dbg !99
  %17 = load i64, i64* %q, align 8, !dbg !100
  %18 = load i64, i64* %k.addr, align 8, !dbg !101
  %mul = mul i64 %17, %18, !dbg !102
  %add13 = add i64 %16, %mul, !dbg !103
  %19 = load i64, i64* %q, align 8, !dbg !104
  %20 = load i64, i64* %a, align 8, !dbg !105
  %add14 = add i64 %20, %19, !dbg !105
  store i64 %add14, i64* %a, align 8, !dbg !105
  %rem = urem i64 %add13, %add14, !dbg !106
  store i64 %rem, i64* %m.addr, align 8, !dbg !107
  br label %while.cond, !dbg !66, !llvm.loop !108

while.end:                                        ; preds = %while.cond
  %21 = load i64, i64* %m.addr, align 8, !dbg !110
  store i64 %21, i64* %retval, align 8, !dbg !111
  br label %return, !dbg !111

return:                                           ; preds = %while.end, %if.then
  %22 = load i64, i64* %retval, align 8, !dbg !112
  ret i64 %22, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i64, align 8
  %k = alloca i64, align 8
  %i = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %n, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %k, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  store i64 41, i64* %n, align 8, !dbg !122
  store i64 3, i64* %k, align 8, !dbg !123
  %0 = load i64, i64* %n, align 8, !dbg !124
  %1 = load i64, i64* %k, align 8, !dbg !125
  %2 = load i64, i64* %n, align 8, !dbg !126
  %conv = trunc i64 %2 to i32, !dbg !126
  %3 = load i64, i64* %k, align 8, !dbg !127
  %conv1 = trunc i64 %3 to i32, !dbg !127
  %call = call i32 @jos(i32 %conv, i32 %conv1, i32 0), !dbg !128
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str, i64 0, i64 0), i64 %0, i64 %1, i32 %call), !dbg !129
  store i64 -8570200862721897295, i64* %n, align 8, !dbg !130
  store i64 12031, i64* %k, align 8, !dbg !131
  %4 = load i64, i64* %n, align 8, !dbg !132
  %5 = load i64, i64* %k, align 8, !dbg !133
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.1, i64 0, i64 0), i64 %4, i64 %5), !dbg !134
  store i64 3, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.body, %entry
  %6 = load i64, i64* %i, align 8, !dbg !138
  %dec = add i64 %6, -1, !dbg !138
  store i64 %dec, i64* %i, align 8, !dbg !138
  %tobool = icmp ne i64 %6, 0, !dbg !140
  br i1 %tobool, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %n, align 8, !dbg !141
  %8 = load i64, i64* %k, align 8, !dbg !142
  %9 = load i64, i64* %i, align 8, !dbg !143
  %call4 = call i64 @jos_large(i64 %7, i64 %8, i64 %9), !dbg !144
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i64 %call4), !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %call6 = call i32 @putchar(i32 10), !dbg !149
  ret i32 0, !dbg !150
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
!1 = !DIFile(filename: "josephus-problem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Josephus-problem")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "jos", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 13, scope: !7)
!13 = !DILocalVariable(name: "k", arg: 2, scope: !7, file: !1, line: 4, type: !10)
!14 = !DILocation(line: 4, column: 20, scope: !7)
!15 = !DILocalVariable(name: "m", arg: 3, scope: !7, file: !1, line: 4, type: !10)
!16 = !DILocation(line: 4, column: 27, scope: !7)
!17 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 5, column: 6, scope: !7)
!19 = !DILocation(line: 6, column: 11, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 2)
!21 = !DILocation(line: 6, column: 13, scope: !20)
!22 = !DILocation(line: 6, column: 9, scope: !20)
!23 = !DILocation(line: 6, column: 7, scope: !20)
!24 = !DILocation(line: 6, column: 18, scope: !25)
!25 = distinct !DILexicalBlock(scope: !20, file: !1, line: 6, column: 2)
!26 = !DILocation(line: 6, column: 23, scope: !25)
!27 = !DILocation(line: 6, column: 20, scope: !25)
!28 = !DILocation(line: 6, column: 2, scope: !20)
!29 = !DILocation(line: 7, column: 8, scope: !25)
!30 = !DILocation(line: 7, column: 12, scope: !25)
!31 = !DILocation(line: 7, column: 10, scope: !25)
!32 = !DILocation(line: 7, column: 17, scope: !25)
!33 = !DILocation(line: 7, column: 15, scope: !25)
!34 = !DILocation(line: 7, column: 5, scope: !25)
!35 = !DILocation(line: 7, column: 3, scope: !25)
!36 = !DILocation(line: 6, column: 27, scope: !25)
!37 = !DILocation(line: 6, column: 2, scope: !25)
!38 = distinct !{!38, !28, !39}
!39 = !DILocation(line: 7, column: 17, scope: !20)
!40 = !DILocation(line: 8, column: 9, scope: !7)
!41 = !DILocation(line: 8, column: 2, scope: !7)
!42 = distinct !DISubprogram(name: "jos_large", scope: !1, file: !1, line: 14, type: !43, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !45, !45}
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "xint", file: !1, line: 11, baseType: !46)
!46 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocalVariable(name: "n", arg: 1, scope: !42, file: !1, line: 14, type: !45)
!48 = !DILocation(line: 14, column: 21, scope: !42)
!49 = !DILocalVariable(name: "k", arg: 2, scope: !42, file: !1, line: 14, type: !45)
!50 = !DILocation(line: 14, column: 29, scope: !42)
!51 = !DILocalVariable(name: "m", arg: 3, scope: !42, file: !1, line: 14, type: !45)
!52 = !DILocation(line: 14, column: 37, scope: !42)
!53 = !DILocation(line: 15, column: 6, scope: !54)
!54 = distinct !DILexicalBlock(scope: !42, file: !1, line: 15, column: 6)
!55 = !DILocation(line: 15, column: 8, scope: !54)
!56 = !DILocation(line: 15, column: 6, scope: !42)
!57 = !{!"if"}
!58 = !DILocation(line: 15, column: 21, scope: !54)
!59 = !DILocation(line: 15, column: 25, scope: !54)
!60 = !DILocation(line: 15, column: 23, scope: !54)
!61 = !DILocation(line: 15, column: 27, scope: !54)
!62 = !DILocation(line: 15, column: 14, scope: !54)
!63 = !DILocalVariable(name: "a", scope: !42, file: !1, line: 17, type: !45)
!64 = !DILocation(line: 17, column: 7, scope: !42)
!65 = !DILocation(line: 17, column: 11, scope: !42)
!66 = !DILocation(line: 18, column: 2, scope: !42)
!67 = !DILocation(line: 18, column: 9, scope: !42)
!68 = !DILocation(line: 18, column: 13, scope: !42)
!69 = !DILocation(line: 18, column: 11, scope: !42)
!70 = !DILocalVariable(name: "q", scope: !71, file: !1, line: 19, type: !45)
!71 = distinct !DILexicalBlock(scope: !42, file: !1, line: 18, column: 16)
!72 = !DILocation(line: 19, column: 8, scope: !71)
!73 = !DILocation(line: 19, column: 13, scope: !71)
!74 = !DILocation(line: 19, column: 17, scope: !71)
!75 = !DILocation(line: 19, column: 15, scope: !71)
!76 = !DILocation(line: 19, column: 21, scope: !71)
!77 = !DILocation(line: 19, column: 19, scope: !71)
!78 = !DILocation(line: 19, column: 23, scope: !71)
!79 = !DILocation(line: 19, column: 31, scope: !71)
!80 = !DILocation(line: 19, column: 33, scope: !71)
!81 = !DILocation(line: 19, column: 28, scope: !71)
!82 = !DILocation(line: 21, column: 7, scope: !83)
!83 = distinct !DILexicalBlock(scope: !71, file: !1, line: 21, column: 7)
!84 = !DILocation(line: 21, column: 11, scope: !83)
!85 = !DILocation(line: 21, column: 9, scope: !83)
!86 = !DILocation(line: 21, column: 15, scope: !83)
!87 = !DILocation(line: 21, column: 13, scope: !83)
!88 = !DILocation(line: 21, column: 7, scope: !71)
!89 = !DILocation(line: 21, column: 22, scope: !83)
!90 = !DILocation(line: 21, column: 26, scope: !83)
!91 = !DILocation(line: 21, column: 24, scope: !83)
!92 = !DILocation(line: 21, column: 20, scope: !83)
!93 = !DILocation(line: 21, column: 18, scope: !83)
!94 = !DILocation(line: 22, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !1, line: 22, column: 12)
!96 = !DILocation(line: 22, column: 12, scope: !83)
!97 = !DILocation(line: 22, column: 18, scope: !95)
!98 = !DILocation(line: 22, column: 16, scope: !95)
!99 = !DILocation(line: 24, column: 8, scope: !71)
!100 = !DILocation(line: 24, column: 12, scope: !71)
!101 = !DILocation(line: 24, column: 16, scope: !71)
!102 = !DILocation(line: 24, column: 14, scope: !71)
!103 = !DILocation(line: 24, column: 10, scope: !71)
!104 = !DILocation(line: 24, column: 27, scope: !71)
!105 = !DILocation(line: 24, column: 24, scope: !71)
!106 = !DILocation(line: 24, column: 19, scope: !71)
!107 = !DILocation(line: 24, column: 5, scope: !71)
!108 = distinct !{!108, !66, !109}
!109 = !DILocation(line: 25, column: 2, scope: !42)
!110 = !DILocation(line: 27, column: 9, scope: !42)
!111 = !DILocation(line: 27, column: 2, scope: !42)
!112 = !DILocation(line: 28, column: 1, scope: !42)
!113 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 30, type: !114, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DISubroutineType(types: !115)
!115 = !{!10}
!116 = !DILocalVariable(name: "n", scope: !113, file: !1, line: 31, type: !45)
!117 = !DILocation(line: 31, column: 7, scope: !113)
!118 = !DILocalVariable(name: "k", scope: !113, file: !1, line: 31, type: !45)
!119 = !DILocation(line: 31, column: 10, scope: !113)
!120 = !DILocalVariable(name: "i", scope: !113, file: !1, line: 31, type: !45)
!121 = !DILocation(line: 31, column: 13, scope: !113)
!122 = !DILocation(line: 33, column: 4, scope: !113)
!123 = !DILocation(line: 34, column: 4, scope: !113)
!124 = !DILocation(line: 35, column: 53, scope: !113)
!125 = !DILocation(line: 35, column: 56, scope: !113)
!126 = !DILocation(line: 35, column: 63, scope: !113)
!127 = !DILocation(line: 35, column: 66, scope: !113)
!128 = !DILocation(line: 35, column: 59, scope: !113)
!129 = !DILocation(line: 35, column: 2, scope: !113)
!130 = !DILocation(line: 37, column: 4, scope: !113)
!131 = !DILocation(line: 38, column: 4, scope: !113)
!132 = !DILocation(line: 39, column: 49, scope: !113)
!133 = !DILocation(line: 39, column: 52, scope: !113)
!134 = !DILocation(line: 39, column: 2, scope: !113)
!135 = !DILocation(line: 41, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !113, file: !1, line: 41, column: 2)
!137 = !DILocation(line: 41, column: 7, scope: !136)
!138 = !DILocation(line: 41, column: 15, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !1, line: 41, column: 2)
!140 = !DILocation(line: 41, column: 2, scope: !136)
!141 = !DILocation(line: 42, column: 29, scope: !139)
!142 = !DILocation(line: 42, column: 32, scope: !139)
!143 = !DILocation(line: 42, column: 35, scope: !139)
!144 = !DILocation(line: 42, column: 19, scope: !139)
!145 = !DILocation(line: 42, column: 3, scope: !139)
!146 = !DILocation(line: 41, column: 2, scope: !139)
!147 = distinct !{!147, !140, !148}
!148 = !DILocation(line: 42, column: 37, scope: !136)
!149 = !DILocation(line: 43, column: 2, scope: !113)
!150 = !DILocation(line: 45, column: 2, scope: !113)
