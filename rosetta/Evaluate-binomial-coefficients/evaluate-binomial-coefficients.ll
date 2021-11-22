; ModuleID = 'evaluate-binomial-coefficients.c'
source_filename = "evaluate-binomial-coefficients.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%lu\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @binomial(i64 %n, i64 %k) #0 !dbg !7 {
entry:
  %retval = alloca i64, align 8
  %n.addr = alloca i64, align 8
  %k.addr = alloca i64, align 8
  %d = alloca i64, align 8
  %g = alloca i64, align 8
  %r = alloca i64, align 8
  %nr = alloca i64, align 8
  %dr = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i64 %k, i64* %k.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %k.addr, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i64* %d, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i64* %g, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i64* %r, metadata !19, metadata !DIExpression()), !dbg !20
  store i64 1, i64* %r, align 8, !dbg !20
  %0 = load i64, i64* %k.addr, align 8, !dbg !21
  %cmp = icmp eq i64 %0, 0, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24, !cf.info !25

if.then:                                          ; preds = %entry
  store i64 1, i64* %retval, align 8, !dbg !26
  br label %return, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %k.addr, align 8, !dbg !27
  %cmp1 = icmp eq i64 %1, 1, !dbg !29
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !30, !cf.info !25

if.then2:                                         ; preds = %if.end
  %2 = load i64, i64* %n.addr, align 8, !dbg !31
  store i64 %2, i64* %retval, align 8, !dbg !32
  br label %return, !dbg !32

if.end3:                                          ; preds = %if.end
  %3 = load i64, i64* %k.addr, align 8, !dbg !33
  %4 = load i64, i64* %n.addr, align 8, !dbg !35
  %cmp4 = icmp uge i64 %3, %4, !dbg !36
  br i1 %cmp4, label %if.then5, label %if.end8, !dbg !37, !cf.info !25

if.then5:                                         ; preds = %if.end3
  %5 = load i64, i64* %k.addr, align 8, !dbg !38
  %6 = load i64, i64* %n.addr, align 8, !dbg !39
  %cmp6 = icmp eq i64 %5, %6, !dbg !40
  %conv = zext i1 %cmp6 to i32, !dbg !40
  %conv7 = sext i32 %conv to i64, !dbg !41
  store i64 %conv7, i64* %retval, align 8, !dbg !42
  br label %return, !dbg !42

if.end8:                                          ; preds = %if.end3
  %7 = load i64, i64* %k.addr, align 8, !dbg !43
  %8 = load i64, i64* %n.addr, align 8, !dbg !45
  %div = udiv i64 %8, 2, !dbg !46
  %cmp9 = icmp ugt i64 %7, %div, !dbg !47
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !48, !cf.info !25

if.then11:                                        ; preds = %if.end8
  %9 = load i64, i64* %n.addr, align 8, !dbg !49
  %10 = load i64, i64* %k.addr, align 8, !dbg !50
  %sub = sub i64 %9, %10, !dbg !51
  store i64 %sub, i64* %k.addr, align 8, !dbg !52
  br label %if.end12, !dbg !53

if.end12:                                         ; preds = %if.then11, %if.end8
  store i64 1, i64* %d, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end12
  %11 = load i64, i64* %d, align 8, !dbg !57
  %12 = load i64, i64* %k.addr, align 8, !dbg !59
  %cmp13 = icmp ule i64 %11, %12, !dbg !60
  br i1 %cmp13, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %r, align 8, !dbg !62
  %14 = load i64, i64* %n.addr, align 8, !dbg !65
  %div15 = udiv i64 -1, %14, !dbg !66
  %cmp16 = icmp uge i64 %13, %div15, !dbg !67
  br i1 %cmp16, label %if.then18, label %if.else, !dbg !68, !cf.info !25

if.then18:                                        ; preds = %for.body
  call void @llvm.dbg.declare(metadata i64* %nr, metadata !69, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i64* %dr, metadata !72, metadata !DIExpression()), !dbg !73
  %15 = load i64, i64* %n.addr, align 8, !dbg !74
  %16 = load i64, i64* %d, align 8, !dbg !75
  %call = call i64 @gcd_ui(i64 %15, i64 %16), !dbg !76
  store i64 %call, i64* %g, align 8, !dbg !77
  %17 = load i64, i64* %n.addr, align 8, !dbg !78
  %18 = load i64, i64* %g, align 8, !dbg !79
  %div19 = udiv i64 %17, %18, !dbg !80
  store i64 %div19, i64* %nr, align 8, !dbg !81
  %19 = load i64, i64* %d, align 8, !dbg !82
  %20 = load i64, i64* %g, align 8, !dbg !83
  %div20 = udiv i64 %19, %20, !dbg !84
  store i64 %div20, i64* %dr, align 8, !dbg !85
  %21 = load i64, i64* %r, align 8, !dbg !86
  %22 = load i64, i64* %dr, align 8, !dbg !87
  %call21 = call i64 @gcd_ui(i64 %21, i64 %22), !dbg !88
  store i64 %call21, i64* %g, align 8, !dbg !89
  %23 = load i64, i64* %r, align 8, !dbg !90
  %24 = load i64, i64* %g, align 8, !dbg !91
  %div22 = udiv i64 %23, %24, !dbg !92
  store i64 %div22, i64* %r, align 8, !dbg !93
  %25 = load i64, i64* %dr, align 8, !dbg !94
  %26 = load i64, i64* %g, align 8, !dbg !95
  %div23 = udiv i64 %25, %26, !dbg !96
  store i64 %div23, i64* %dr, align 8, !dbg !97
  %27 = load i64, i64* %r, align 8, !dbg !98
  %28 = load i64, i64* %nr, align 8, !dbg !100
  %div24 = udiv i64 -1, %28, !dbg !101
  %cmp25 = icmp uge i64 %27, %div24, !dbg !102
  br i1 %cmp25, label %if.then27, label %if.end28, !dbg !103, !cf.info !25

if.then27:                                        ; preds = %if.then18
  store i64 0, i64* %retval, align 8, !dbg !104
  br label %return, !dbg !104

if.end28:                                         ; preds = %if.then18
  %29 = load i64, i64* %nr, align 8, !dbg !105
  %30 = load i64, i64* %r, align 8, !dbg !106
  %mul = mul i64 %30, %29, !dbg !106
  store i64 %mul, i64* %r, align 8, !dbg !106
  %31 = load i64, i64* %dr, align 8, !dbg !107
  %32 = load i64, i64* %r, align 8, !dbg !108
  %div29 = udiv i64 %32, %31, !dbg !108
  store i64 %div29, i64* %r, align 8, !dbg !108
  %33 = load i64, i64* %n.addr, align 8, !dbg !109
  %dec = add i64 %33, -1, !dbg !109
  store i64 %dec, i64* %n.addr, align 8, !dbg !109
  br label %if.end33, !dbg !110

if.else:                                          ; preds = %for.body
  %34 = load i64, i64* %n.addr, align 8, !dbg !111
  %dec30 = add i64 %34, -1, !dbg !111
  store i64 %dec30, i64* %n.addr, align 8, !dbg !111
  %35 = load i64, i64* %r, align 8, !dbg !113
  %mul31 = mul i64 %35, %34, !dbg !113
  store i64 %mul31, i64* %r, align 8, !dbg !113
  %36 = load i64, i64* %d, align 8, !dbg !114
  %37 = load i64, i64* %r, align 8, !dbg !115
  %div32 = udiv i64 %37, %36, !dbg !115
  store i64 %div32, i64* %r, align 8, !dbg !115
  br label %if.end33

if.end33:                                         ; preds = %if.else, %if.end28
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %if.end33
  %38 = load i64, i64* %d, align 8, !dbg !117
  %inc = add i64 %38, 1, !dbg !117
  store i64 %inc, i64* %d, align 8, !dbg !117
  br label %for.cond, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond
  %39 = load i64, i64* %r, align 8, !dbg !121
  store i64 %39, i64* %retval, align 8, !dbg !122
  br label %return, !dbg !122

return:                                           ; preds = %for.end, %if.then27, %if.then5, %if.then2, %if.then
  %40 = load i64, i64* %retval, align 8, !dbg !123
  ret i64 %40, !dbg !123
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i64 @gcd_ui(i64 %x, i64 %y) #0 !dbg !124 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %t = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %x.addr, metadata !125, metadata !DIExpression()), !dbg !126
  store i64 %y, i64* %y.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %y.addr, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %t, metadata !129, metadata !DIExpression()), !dbg !130
  %0 = load i64, i64* %y.addr, align 8, !dbg !131
  %1 = load i64, i64* %x.addr, align 8, !dbg !133
  %cmp = icmp ult i64 %0, %1, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135, !cf.info !25

if.then:                                          ; preds = %entry
  %2 = load i64, i64* %x.addr, align 8, !dbg !136
  store i64 %2, i64* %t, align 8, !dbg !138
  %3 = load i64, i64* %y.addr, align 8, !dbg !139
  store i64 %3, i64* %x.addr, align 8, !dbg !140
  %4 = load i64, i64* %t, align 8, !dbg !141
  store i64 %4, i64* %y.addr, align 8, !dbg !142
  br label %if.end, !dbg !143

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !144

while.cond:                                       ; preds = %while.body, %if.end
  %5 = load i64, i64* %y.addr, align 8, !dbg !145
  %cmp1 = icmp ugt i64 %5, 0, !dbg !146
  br i1 %cmp1, label %while.body, label %while.end, !dbg !144

while.body:                                       ; preds = %while.cond
  %6 = load i64, i64* %y.addr, align 8, !dbg !147
  store i64 %6, i64* %t, align 8, !dbg !149
  %7 = load i64, i64* %x.addr, align 8, !dbg !150
  %8 = load i64, i64* %y.addr, align 8, !dbg !151
  %rem = urem i64 %7, %8, !dbg !152
  store i64 %rem, i64* %y.addr, align 8, !dbg !153
  %9 = load i64, i64* %t, align 8, !dbg !154
  store i64 %9, i64* %x.addr, align 8, !dbg !155
  br label %while.cond, !dbg !144, !llvm.loop !156

while.end:                                        ; preds = %while.cond
  %10 = load i64, i64* %x.addr, align 8, !dbg !158
  ret i64 %10, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !160 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i64 @binomial(i64 5, i64 3), !dbg !164
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %call), !dbg !165
  %call2 = call i64 @binomial(i64 40, i64 19), !dbg !166
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %call2), !dbg !167
  %call4 = call i64 @binomial(i64 67, i64 31), !dbg !168
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %call4), !dbg !169
  ret i32 0, !dbg !170
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "evaluate-binomial-coefficients.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Evaluate-binomial-coefficients")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "binomial", scope: !1, file: !1, line: 15, type: !8, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 15, type: !10)
!12 = !DILocation(line: 15, column: 38, scope: !7)
!13 = !DILocalVariable(name: "k", arg: 2, scope: !7, file: !1, line: 15, type: !10)
!14 = !DILocation(line: 15, column: 55, scope: !7)
!15 = !DILocalVariable(name: "d", scope: !7, file: !1, line: 16, type: !10)
!16 = !DILocation(line: 16, column: 17, scope: !7)
!17 = !DILocalVariable(name: "g", scope: !7, file: !1, line: 16, type: !10)
!18 = !DILocation(line: 16, column: 20, scope: !7)
!19 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 16, type: !10)
!20 = !DILocation(line: 16, column: 23, scope: !7)
!21 = !DILocation(line: 17, column: 7, scope: !22)
!22 = distinct !DILexicalBlock(scope: !7, file: !1, line: 17, column: 7)
!23 = !DILocation(line: 17, column: 9, scope: !22)
!24 = !DILocation(line: 17, column: 7, scope: !7)
!25 = !{!"if"}
!26 = !DILocation(line: 17, column: 15, scope: !22)
!27 = !DILocation(line: 18, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 7)
!29 = !DILocation(line: 18, column: 9, scope: !28)
!30 = !DILocation(line: 18, column: 7, scope: !7)
!31 = !DILocation(line: 18, column: 22, scope: !28)
!32 = !DILocation(line: 18, column: 15, scope: !28)
!33 = !DILocation(line: 19, column: 7, scope: !34)
!34 = distinct !DILexicalBlock(scope: !7, file: !1, line: 19, column: 7)
!35 = !DILocation(line: 19, column: 12, scope: !34)
!36 = !DILocation(line: 19, column: 9, scope: !34)
!37 = !DILocation(line: 19, column: 7, scope: !7)
!38 = !DILocation(line: 19, column: 23, scope: !34)
!39 = !DILocation(line: 19, column: 28, scope: !34)
!40 = !DILocation(line: 19, column: 25, scope: !34)
!41 = !DILocation(line: 19, column: 22, scope: !34)
!42 = !DILocation(line: 19, column: 15, scope: !34)
!43 = !DILocation(line: 20, column: 7, scope: !44)
!44 = distinct !DILexicalBlock(scope: !7, file: !1, line: 20, column: 7)
!45 = !DILocation(line: 20, column: 11, scope: !44)
!46 = !DILocation(line: 20, column: 12, scope: !44)
!47 = !DILocation(line: 20, column: 9, scope: !44)
!48 = !DILocation(line: 20, column: 7, scope: !7)
!49 = !DILocation(line: 20, column: 20, scope: !44)
!50 = !DILocation(line: 20, column: 22, scope: !44)
!51 = !DILocation(line: 20, column: 21, scope: !44)
!52 = !DILocation(line: 20, column: 18, scope: !44)
!53 = !DILocation(line: 20, column: 16, scope: !44)
!54 = !DILocation(line: 21, column: 10, scope: !55)
!55 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 3)
!56 = !DILocation(line: 21, column: 8, scope: !55)
!57 = !DILocation(line: 21, column: 15, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !1, line: 21, column: 3)
!59 = !DILocation(line: 21, column: 20, scope: !58)
!60 = !DILocation(line: 21, column: 17, scope: !58)
!61 = !DILocation(line: 21, column: 3, scope: !55)
!62 = !DILocation(line: 22, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 22, column: 9)
!64 = distinct !DILexicalBlock(scope: !58, file: !1, line: 21, column: 28)
!65 = !DILocation(line: 22, column: 24, scope: !63)
!66 = !DILocation(line: 22, column: 23, scope: !63)
!67 = !DILocation(line: 22, column: 11, scope: !63)
!68 = !DILocation(line: 22, column: 9, scope: !64)
!69 = !DILocalVariable(name: "nr", scope: !70, file: !1, line: 23, type: !10)
!70 = distinct !DILexicalBlock(scope: !63, file: !1, line: 22, column: 27)
!71 = !DILocation(line: 23, column: 21, scope: !70)
!72 = !DILocalVariable(name: "dr", scope: !70, file: !1, line: 23, type: !10)
!73 = !DILocation(line: 23, column: 25, scope: !70)
!74 = !DILocation(line: 24, column: 18, scope: !70)
!75 = !DILocation(line: 24, column: 21, scope: !70)
!76 = !DILocation(line: 24, column: 11, scope: !70)
!77 = !DILocation(line: 24, column: 9, scope: !70)
!78 = !DILocation(line: 24, column: 31, scope: !70)
!79 = !DILocation(line: 24, column: 33, scope: !70)
!80 = !DILocation(line: 24, column: 32, scope: !70)
!81 = !DILocation(line: 24, column: 29, scope: !70)
!82 = !DILocation(line: 24, column: 42, scope: !70)
!83 = !DILocation(line: 24, column: 44, scope: !70)
!84 = !DILocation(line: 24, column: 43, scope: !70)
!85 = !DILocation(line: 24, column: 40, scope: !70)
!86 = !DILocation(line: 25, column: 18, scope: !70)
!87 = !DILocation(line: 25, column: 21, scope: !70)
!88 = !DILocation(line: 25, column: 11, scope: !70)
!89 = !DILocation(line: 25, column: 9, scope: !70)
!90 = !DILocation(line: 25, column: 31, scope: !70)
!91 = !DILocation(line: 25, column: 33, scope: !70)
!92 = !DILocation(line: 25, column: 32, scope: !70)
!93 = !DILocation(line: 25, column: 29, scope: !70)
!94 = !DILocation(line: 25, column: 42, scope: !70)
!95 = !DILocation(line: 25, column: 45, scope: !70)
!96 = !DILocation(line: 25, column: 44, scope: !70)
!97 = !DILocation(line: 25, column: 40, scope: !70)
!98 = !DILocation(line: 26, column: 11, scope: !99)
!99 = distinct !DILexicalBlock(scope: !70, file: !1, line: 26, column: 11)
!100 = !DILocation(line: 26, column: 26, scope: !99)
!101 = !DILocation(line: 26, column: 25, scope: !99)
!102 = !DILocation(line: 26, column: 13, scope: !99)
!103 = !DILocation(line: 26, column: 11, scope: !70)
!104 = !DILocation(line: 26, column: 30, scope: !99)
!105 = !DILocation(line: 27, column: 12, scope: !70)
!106 = !DILocation(line: 27, column: 9, scope: !70)
!107 = !DILocation(line: 28, column: 12, scope: !70)
!108 = !DILocation(line: 28, column: 9, scope: !70)
!109 = !DILocation(line: 29, column: 8, scope: !70)
!110 = !DILocation(line: 30, column: 5, scope: !70)
!111 = !DILocation(line: 31, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !63, file: !1, line: 30, column: 12)
!113 = !DILocation(line: 31, column: 9, scope: !112)
!114 = !DILocation(line: 32, column: 12, scope: !112)
!115 = !DILocation(line: 32, column: 9, scope: !112)
!116 = !DILocation(line: 34, column: 3, scope: !64)
!117 = !DILocation(line: 21, column: 24, scope: !58)
!118 = !DILocation(line: 21, column: 3, scope: !58)
!119 = distinct !{!119, !61, !120}
!120 = !DILocation(line: 34, column: 3, scope: !55)
!121 = !DILocation(line: 35, column: 10, scope: !7)
!122 = !DILocation(line: 35, column: 3, scope: !7)
!123 = !DILocation(line: 36, column: 1, scope: !7)
!124 = distinct !DISubprogram(name: "gcd_ui", scope: !1, file: !1, line: 6, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "x", arg: 1, scope: !124, file: !1, line: 6, type: !10)
!126 = !DILocation(line: 6, column: 43, scope: !124)
!127 = !DILocalVariable(name: "y", arg: 2, scope: !124, file: !1, line: 6, type: !10)
!128 = !DILocation(line: 6, column: 60, scope: !124)
!129 = !DILocalVariable(name: "t", scope: !124, file: !1, line: 7, type: !10)
!130 = !DILocation(line: 7, column: 17, scope: !124)
!131 = !DILocation(line: 8, column: 7, scope: !132)
!132 = distinct !DILexicalBlock(scope: !124, file: !1, line: 8, column: 7)
!133 = !DILocation(line: 8, column: 11, scope: !132)
!134 = !DILocation(line: 8, column: 9, scope: !132)
!135 = !DILocation(line: 8, column: 7, scope: !124)
!136 = !DILocation(line: 8, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !1, line: 8, column: 14)
!138 = !DILocation(line: 8, column: 18, scope: !137)
!139 = !DILocation(line: 8, column: 27, scope: !137)
!140 = !DILocation(line: 8, column: 25, scope: !137)
!141 = !DILocation(line: 8, column: 34, scope: !137)
!142 = !DILocation(line: 8, column: 32, scope: !137)
!143 = !DILocation(line: 8, column: 37, scope: !137)
!144 = !DILocation(line: 9, column: 3, scope: !124)
!145 = !DILocation(line: 9, column: 10, scope: !124)
!146 = !DILocation(line: 9, column: 12, scope: !124)
!147 = !DILocation(line: 10, column: 9, scope: !148)
!148 = distinct !DILexicalBlock(scope: !124, file: !1, line: 9, column: 17)
!149 = !DILocation(line: 10, column: 7, scope: !148)
!150 = !DILocation(line: 10, column: 17, scope: !148)
!151 = !DILocation(line: 10, column: 21, scope: !148)
!152 = !DILocation(line: 10, column: 19, scope: !148)
!153 = !DILocation(line: 10, column: 15, scope: !148)
!154 = !DILocation(line: 10, column: 29, scope: !148)
!155 = !DILocation(line: 10, column: 27, scope: !148)
!156 = distinct !{!156, !144, !157}
!157 = !DILocation(line: 11, column: 3, scope: !124)
!158 = !DILocation(line: 12, column: 10, scope: !124)
!159 = !DILocation(line: 12, column: 3, scope: !124)
!160 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 38, type: !161, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!161 = !DISubroutineType(types: !162)
!162 = !{!163}
!163 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!164 = !DILocation(line: 39, column: 21, scope: !160)
!165 = !DILocation(line: 39, column: 5, scope: !160)
!166 = !DILocation(line: 40, column: 21, scope: !160)
!167 = !DILocation(line: 40, column: 5, scope: !160)
!168 = !DILocation(line: 41, column: 21, scope: !160)
!169 = !DILocation(line: 41, column: 5, scope: !160)
!170 = !DILocation(line: 42, column: 5, scope: !160)
