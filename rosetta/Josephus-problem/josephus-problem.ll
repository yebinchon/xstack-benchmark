; ModuleID = 'josephus-problem.bc'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  %1 = load i64, i64* %n.addr, align 8, !dbg !57
  %2 = load i64, i64* %m.addr, align 8, !dbg !58
  %sub = sub i64 %1, %2, !dbg !59
  %sub1 = sub i64 %sub, 1, !dbg !60
  store i64 %sub1, i64* %retval, align 8, !dbg !61
  br label %return, !dbg !61

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %a, metadata !62, metadata !DIExpression()), !dbg !63
  %3 = load i64, i64* %m.addr, align 8, !dbg !64
  store i64 %3, i64* %a, align 8, !dbg !63
  br label %while.cond, !dbg !65

while.cond:                                       ; preds = %if.end12, %if.end
  %4 = load i64, i64* %a, align 8, !dbg !66
  %5 = load i64, i64* %n.addr, align 8, !dbg !67
  %cmp2 = icmp ult i64 %4, %5, !dbg !68
  br i1 %cmp2, label %while.body, label %while.end, !dbg !65

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i64* %q, metadata !69, metadata !DIExpression()), !dbg !71
  %6 = load i64, i64* %a, align 8, !dbg !72
  %7 = load i64, i64* %m.addr, align 8, !dbg !73
  %sub3 = sub i64 %6, %7, !dbg !74
  %8 = load i64, i64* %k.addr, align 8, !dbg !75
  %add = add i64 %sub3, %8, !dbg !76
  %sub4 = sub i64 %add, 2, !dbg !77
  %9 = load i64, i64* %k.addr, align 8, !dbg !78
  %sub5 = sub i64 %9, 1, !dbg !79
  %div = udiv i64 %sub4, %sub5, !dbg !80
  store i64 %div, i64* %q, align 8, !dbg !71
  %10 = load i64, i64* %a, align 8, !dbg !81
  %11 = load i64, i64* %q, align 8, !dbg !83
  %add6 = add i64 %10, %11, !dbg !84
  %12 = load i64, i64* %n.addr, align 8, !dbg !85
  %cmp7 = icmp ugt i64 %add6, %12, !dbg !86
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !87

if.then8:                                         ; preds = %while.body
  %13 = load i64, i64* %n.addr, align 8, !dbg !88
  %14 = load i64, i64* %a, align 8, !dbg !89
  %sub9 = sub i64 %13, %14, !dbg !90
  store i64 %sub9, i64* %q, align 8, !dbg !91
  br label %if.end12, !dbg !92

if.else:                                          ; preds = %while.body
  %15 = load i64, i64* %q, align 8, !dbg !93
  %tobool = icmp ne i64 %15, 0, !dbg !93
  br i1 %tobool, label %if.end11, label %if.then10, !dbg !95

if.then10:                                        ; preds = %if.else
  store i64 1, i64* %q, align 8, !dbg !96
  br label %if.end11, !dbg !97

if.end11:                                         ; preds = %if.then10, %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then8
  %16 = load i64, i64* %m.addr, align 8, !dbg !98
  %17 = load i64, i64* %q, align 8, !dbg !99
  %18 = load i64, i64* %k.addr, align 8, !dbg !100
  %mul = mul i64 %17, %18, !dbg !101
  %add13 = add i64 %16, %mul, !dbg !102
  %19 = load i64, i64* %q, align 8, !dbg !103
  %20 = load i64, i64* %a, align 8, !dbg !104
  %add14 = add i64 %20, %19, !dbg !104
  store i64 %add14, i64* %a, align 8, !dbg !104
  %rem = urem i64 %add13, %add14, !dbg !105
  store i64 %rem, i64* %m.addr, align 8, !dbg !106
  br label %while.cond, !dbg !65, !llvm.loop !107

while.end:                                        ; preds = %while.cond
  %21 = load i64, i64* %m.addr, align 8, !dbg !109
  store i64 %21, i64* %retval, align 8, !dbg !110
  br label %return, !dbg !110

return:                                           ; preds = %while.end, %if.then
  %22 = load i64, i64* %retval, align 8, !dbg !111
  ret i64 %22, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !112 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i64, align 8
  %k = alloca i64, align 8
  %i = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %n, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %k, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !120
  store i64 41, i64* %n, align 8, !dbg !121
  store i64 3, i64* %k, align 8, !dbg !122
  %0 = load i64, i64* %n, align 8, !dbg !123
  %1 = load i64, i64* %k, align 8, !dbg !124
  %2 = load i64, i64* %n, align 8, !dbg !125
  %conv = trunc i64 %2 to i32, !dbg !125
  %3 = load i64, i64* %k, align 8, !dbg !126
  %conv1 = trunc i64 %3 to i32, !dbg !126
  %call = call i32 @jos(i32 %conv, i32 %conv1, i32 0), !dbg !127
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str, i64 0, i64 0), i64 %0, i64 %1, i32 %call), !dbg !128
  store i64 -8570200862721897295, i64* %n, align 8, !dbg !129
  store i64 12031, i64* %k, align 8, !dbg !130
  %4 = load i64, i64* %n, align 8, !dbg !131
  %5 = load i64, i64* %k, align 8, !dbg !132
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.1, i64 0, i64 0), i64 %4, i64 %5), !dbg !133
  store i64 3, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.body, %entry
  %6 = load i64, i64* %i, align 8, !dbg !137
  %dec = add i64 %6, -1, !dbg !137
  store i64 %dec, i64* %i, align 8, !dbg !137
  %tobool = icmp ne i64 %6, 0, !dbg !139
  br i1 %tobool, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %n, align 8, !dbg !140
  %8 = load i64, i64* %k, align 8, !dbg !141
  %9 = load i64, i64* %i, align 8, !dbg !142
  %call4 = call i64 @jos_large(i64 %7, i64 %8, i64 %9), !dbg !143
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i64 %call4), !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %call6 = call i32 @putchar(i32 10), !dbg !148
  ret i32 0, !dbg !149
}

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @putchar(i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "josephus-problem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Josephus-problem")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!57 = !DILocation(line: 15, column: 21, scope: !54)
!58 = !DILocation(line: 15, column: 25, scope: !54)
!59 = !DILocation(line: 15, column: 23, scope: !54)
!60 = !DILocation(line: 15, column: 27, scope: !54)
!61 = !DILocation(line: 15, column: 14, scope: !54)
!62 = !DILocalVariable(name: "a", scope: !42, file: !1, line: 17, type: !45)
!63 = !DILocation(line: 17, column: 7, scope: !42)
!64 = !DILocation(line: 17, column: 11, scope: !42)
!65 = !DILocation(line: 18, column: 2, scope: !42)
!66 = !DILocation(line: 18, column: 9, scope: !42)
!67 = !DILocation(line: 18, column: 13, scope: !42)
!68 = !DILocation(line: 18, column: 11, scope: !42)
!69 = !DILocalVariable(name: "q", scope: !70, file: !1, line: 19, type: !45)
!70 = distinct !DILexicalBlock(scope: !42, file: !1, line: 18, column: 16)
!71 = !DILocation(line: 19, column: 8, scope: !70)
!72 = !DILocation(line: 19, column: 13, scope: !70)
!73 = !DILocation(line: 19, column: 17, scope: !70)
!74 = !DILocation(line: 19, column: 15, scope: !70)
!75 = !DILocation(line: 19, column: 21, scope: !70)
!76 = !DILocation(line: 19, column: 19, scope: !70)
!77 = !DILocation(line: 19, column: 23, scope: !70)
!78 = !DILocation(line: 19, column: 31, scope: !70)
!79 = !DILocation(line: 19, column: 33, scope: !70)
!80 = !DILocation(line: 19, column: 28, scope: !70)
!81 = !DILocation(line: 21, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !70, file: !1, line: 21, column: 7)
!83 = !DILocation(line: 21, column: 11, scope: !82)
!84 = !DILocation(line: 21, column: 9, scope: !82)
!85 = !DILocation(line: 21, column: 15, scope: !82)
!86 = !DILocation(line: 21, column: 13, scope: !82)
!87 = !DILocation(line: 21, column: 7, scope: !70)
!88 = !DILocation(line: 21, column: 22, scope: !82)
!89 = !DILocation(line: 21, column: 26, scope: !82)
!90 = !DILocation(line: 21, column: 24, scope: !82)
!91 = !DILocation(line: 21, column: 20, scope: !82)
!92 = !DILocation(line: 21, column: 18, scope: !82)
!93 = !DILocation(line: 22, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !1, line: 22, column: 12)
!95 = !DILocation(line: 22, column: 12, scope: !82)
!96 = !DILocation(line: 22, column: 18, scope: !94)
!97 = !DILocation(line: 22, column: 16, scope: !94)
!98 = !DILocation(line: 24, column: 8, scope: !70)
!99 = !DILocation(line: 24, column: 12, scope: !70)
!100 = !DILocation(line: 24, column: 16, scope: !70)
!101 = !DILocation(line: 24, column: 14, scope: !70)
!102 = !DILocation(line: 24, column: 10, scope: !70)
!103 = !DILocation(line: 24, column: 27, scope: !70)
!104 = !DILocation(line: 24, column: 24, scope: !70)
!105 = !DILocation(line: 24, column: 19, scope: !70)
!106 = !DILocation(line: 24, column: 5, scope: !70)
!107 = distinct !{!107, !65, !108}
!108 = !DILocation(line: 25, column: 2, scope: !42)
!109 = !DILocation(line: 27, column: 9, scope: !42)
!110 = !DILocation(line: 27, column: 2, scope: !42)
!111 = !DILocation(line: 28, column: 1, scope: !42)
!112 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 30, type: !113, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DISubroutineType(types: !114)
!114 = !{!10}
!115 = !DILocalVariable(name: "n", scope: !112, file: !1, line: 31, type: !45)
!116 = !DILocation(line: 31, column: 7, scope: !112)
!117 = !DILocalVariable(name: "k", scope: !112, file: !1, line: 31, type: !45)
!118 = !DILocation(line: 31, column: 10, scope: !112)
!119 = !DILocalVariable(name: "i", scope: !112, file: !1, line: 31, type: !45)
!120 = !DILocation(line: 31, column: 13, scope: !112)
!121 = !DILocation(line: 33, column: 4, scope: !112)
!122 = !DILocation(line: 34, column: 4, scope: !112)
!123 = !DILocation(line: 35, column: 53, scope: !112)
!124 = !DILocation(line: 35, column: 56, scope: !112)
!125 = !DILocation(line: 35, column: 63, scope: !112)
!126 = !DILocation(line: 35, column: 66, scope: !112)
!127 = !DILocation(line: 35, column: 59, scope: !112)
!128 = !DILocation(line: 35, column: 2, scope: !112)
!129 = !DILocation(line: 37, column: 4, scope: !112)
!130 = !DILocation(line: 38, column: 4, scope: !112)
!131 = !DILocation(line: 39, column: 49, scope: !112)
!132 = !DILocation(line: 39, column: 52, scope: !112)
!133 = !DILocation(line: 39, column: 2, scope: !112)
!134 = !DILocation(line: 41, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !112, file: !1, line: 41, column: 2)
!136 = !DILocation(line: 41, column: 7, scope: !135)
!137 = !DILocation(line: 41, column: 15, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !1, line: 41, column: 2)
!139 = !DILocation(line: 41, column: 2, scope: !135)
!140 = !DILocation(line: 42, column: 29, scope: !138)
!141 = !DILocation(line: 42, column: 32, scope: !138)
!142 = !DILocation(line: 42, column: 35, scope: !138)
!143 = !DILocation(line: 42, column: 19, scope: !138)
!144 = !DILocation(line: 42, column: 3, scope: !138)
!145 = !DILocation(line: 41, column: 2, scope: !138)
!146 = distinct !{!146, !139, !147}
!147 = !DILocation(line: 42, column: 37, scope: !135)
!148 = !DILocation(line: 43, column: 2, scope: !112)
!149 = !DILocation(line: 45, column: 2, scope: !112)
