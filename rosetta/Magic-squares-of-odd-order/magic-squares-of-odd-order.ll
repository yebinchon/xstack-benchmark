; ModuleID = 'magic-squares-of-odd-order.c'
source_filename = "magic-squares-of-odd-order.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"% 4d\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"\0A Magic Constant: %d.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f(i32 %n, i32 %x, i32 %y) #0 !dbg !7 {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %x.addr, align 4, !dbg !17
  %1 = load i32, i32* %y.addr, align 4, !dbg !18
  %mul = mul nsw i32 %1, 2, !dbg !19
  %add = add nsw i32 %0, %mul, !dbg !20
  %add1 = add nsw i32 %add, 1, !dbg !21
  %2 = load i32, i32* %n.addr, align 4, !dbg !22
  %rem = srem i32 %add1, %2, !dbg !23
  ret i32 %rem, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !25 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !31, metadata !DIExpression()), !dbg !32
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %j, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %n, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i32, i32* %argc.addr, align 4, !dbg !41
  %cmp = icmp ne i32 %0, 2, !dbg !43
  br i1 %cmp, label %if.then, label %if.end, !dbg !44, !cf.info !45

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !46
  br label %return, !dbg !46

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !47
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !47
  %call = call i32 @atoi(i8* %2) #4, !dbg !48
  store i32 %call, i32* %n, align 4, !dbg !49
  %3 = load i32, i32* %n, align 4, !dbg !50
  %cmp1 = icmp slt i32 %3, 3, !dbg !52
  br i1 %cmp1, label %if.then3, label %lor.lhs.false, !dbg !53, !cf.info !45

lor.lhs.false:                                    ; preds = %if.end
  %4 = load i32, i32* %n, align 4, !dbg !54
  %rem = srem i32 %4, 2, !dbg !55
  %cmp2 = icmp eq i32 %rem, 0, !dbg !56
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !57, !cf.info !45

if.then3:                                         ; preds = %lor.lhs.false, %if.end
  store i32 2, i32* %retval, align 4, !dbg !58
  br label %return, !dbg !58

if.end4:                                          ; preds = %lor.lhs.false
  store i32 0, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc15, %if.end4
  %5 = load i32, i32* %i, align 4, !dbg !62
  %6 = load i32, i32* %n, align 4, !dbg !64
  %cmp5 = icmp slt i32 %5, %6, !dbg !65
  br i1 %cmp5, label %for.body, label %for.end17, !dbg !66

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !67
  br label %for.cond6, !dbg !70

for.cond6:                                        ; preds = %for.inc, %for.body
  %7 = load i32, i32* %j, align 4, !dbg !71
  %8 = load i32, i32* %n, align 4, !dbg !73
  %cmp7 = icmp slt i32 %7, %8, !dbg !74
  br i1 %cmp7, label %for.body8, label %for.end, !dbg !75

for.body8:                                        ; preds = %for.cond6
  %9 = load i32, i32* %n, align 4, !dbg !76
  %10 = load i32, i32* %n, align 4, !dbg !77
  %11 = load i32, i32* %j, align 4, !dbg !78
  %sub = sub nsw i32 %10, %11, !dbg !79
  %sub9 = sub nsw i32 %sub, 1, !dbg !80
  %12 = load i32, i32* %i, align 4, !dbg !81
  %call10 = call i32 @f(i32 %9, i32 %sub9, i32 %12), !dbg !82
  %13 = load i32, i32* %n, align 4, !dbg !83
  %mul = mul nsw i32 %call10, %13, !dbg !84
  %14 = load i32, i32* %n, align 4, !dbg !85
  %15 = load i32, i32* %j, align 4, !dbg !86
  %16 = load i32, i32* %i, align 4, !dbg !87
  %call11 = call i32 @f(i32 %14, i32 %15, i32 %16), !dbg !88
  %add = add nsw i32 %mul, %call11, !dbg !89
  %add12 = add nsw i32 %add, 1, !dbg !90
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %add12), !dbg !91
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body8
  %17 = load i32, i32* %j, align 4, !dbg !92
  %inc = add nsw i32 %17, 1, !dbg !92
  store i32 %inc, i32* %j, align 4, !dbg !92
  br label %for.cond6, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond6
  %call14 = call i32 @putchar(i32 10), !dbg !96
  br label %for.inc15, !dbg !97

for.inc15:                                        ; preds = %for.end
  %18 = load i32, i32* %i, align 4, !dbg !98
  %inc16 = add nsw i32 %18, 1, !dbg !98
  store i32 %inc16, i32* %i, align 4, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end17:                                        ; preds = %for.cond
  %19 = load i32, i32* %n, align 4, !dbg !102
  %20 = load i32, i32* %n, align 4, !dbg !103
  %mul18 = mul nsw i32 %19, %20, !dbg !104
  %add19 = add nsw i32 %mul18, 1, !dbg !105
  %div = sdiv i32 %add19, 2, !dbg !106
  %21 = load i32, i32* %n, align 4, !dbg !107
  %mul20 = mul nsw i32 %div, %21, !dbg !108
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i32 %mul20), !dbg !109
  store i32 0, i32* %retval, align 4, !dbg !110
  br label %return, !dbg !110

return:                                           ; preds = %for.end17, %if.then3, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !111
  ret i32 %22, !dbg !111
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #2

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @putchar(i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "magic-squares-of-odd-order.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Magic-squares-of-odd-order")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 11, scope: !7)
!13 = !DILocalVariable(name: "x", arg: 2, scope: !7, file: !1, line: 4, type: !10)
!14 = !DILocation(line: 4, column: 18, scope: !7)
!15 = !DILocalVariable(name: "y", arg: 3, scope: !7, file: !1, line: 4, type: !10)
!16 = !DILocation(line: 4, column: 25, scope: !7)
!17 = !DILocation(line: 6, column: 10, scope: !7)
!18 = !DILocation(line: 6, column: 14, scope: !7)
!19 = !DILocation(line: 6, column: 15, scope: !7)
!20 = !DILocation(line: 6, column: 12, scope: !7)
!21 = !DILocation(line: 6, column: 18, scope: !7)
!22 = !DILocation(line: 6, column: 23, scope: !7)
!23 = !DILocation(line: 6, column: 22, scope: !7)
!24 = !DILocation(line: 6, column: 2, scope: !7)
!25 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 9, type: !26, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!10, !10, !28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !DILocalVariable(name: "argc", arg: 1, scope: !25, file: !1, line: 9, type: !10)
!32 = !DILocation(line: 9, column: 14, scope: !25)
!33 = !DILocalVariable(name: "argv", arg: 2, scope: !25, file: !1, line: 9, type: !28)
!34 = !DILocation(line: 9, column: 27, scope: !25)
!35 = !DILocalVariable(name: "i", scope: !25, file: !1, line: 11, type: !10)
!36 = !DILocation(line: 11, column: 6, scope: !25)
!37 = !DILocalVariable(name: "j", scope: !25, file: !1, line: 11, type: !10)
!38 = !DILocation(line: 11, column: 9, scope: !25)
!39 = !DILocalVariable(name: "n", scope: !25, file: !1, line: 11, type: !10)
!40 = !DILocation(line: 11, column: 12, scope: !25)
!41 = !DILocation(line: 14, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !25, file: !1, line: 14, column: 5)
!43 = !DILocation(line: 14, column: 9, scope: !42)
!44 = !DILocation(line: 14, column: 5, scope: !25)
!45 = !{!"if"}
!46 = !DILocation(line: 14, column: 14, scope: !42)
!47 = !DILocation(line: 17, column: 11, scope: !25)
!48 = !DILocation(line: 17, column: 6, scope: !25)
!49 = !DILocation(line: 17, column: 4, scope: !25)
!50 = !DILocation(line: 18, column: 6, scope: !51)
!51 = distinct !DILexicalBlock(scope: !25, file: !1, line: 18, column: 6)
!52 = !DILocation(line: 18, column: 8, scope: !51)
!53 = !DILocation(line: 18, column: 12, scope: !51)
!54 = !DILocation(line: 18, column: 16, scope: !51)
!55 = !DILocation(line: 18, column: 17, scope: !51)
!56 = !DILocation(line: 18, column: 21, scope: !51)
!57 = !DILocation(line: 18, column: 6, scope: !25)
!58 = !DILocation(line: 18, column: 27, scope: !51)
!59 = !DILocation(line: 20, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !25, file: !1, line: 20, column: 2)
!61 = !DILocation(line: 20, column: 7, scope: !60)
!62 = !DILocation(line: 20, column: 14, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !1, line: 20, column: 2)
!64 = !DILocation(line: 20, column: 18, scope: !63)
!65 = !DILocation(line: 20, column: 16, scope: !63)
!66 = !DILocation(line: 20, column: 2, scope: !60)
!67 = !DILocation(line: 21, column: 10, scope: !68)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 21, column: 3)
!69 = distinct !DILexicalBlock(scope: !63, file: !1, line: 20, column: 26)
!70 = !DILocation(line: 21, column: 8, scope: !68)
!71 = !DILocation(line: 21, column: 15, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 21, column: 3)
!73 = !DILocation(line: 21, column: 19, scope: !72)
!74 = !DILocation(line: 21, column: 17, scope: !72)
!75 = !DILocation(line: 21, column: 3, scope: !68)
!76 = !DILocation(line: 22, column: 21, scope: !72)
!77 = !DILocation(line: 22, column: 24, scope: !72)
!78 = !DILocation(line: 22, column: 28, scope: !72)
!79 = !DILocation(line: 22, column: 26, scope: !72)
!80 = !DILocation(line: 22, column: 30, scope: !72)
!81 = !DILocation(line: 22, column: 35, scope: !72)
!82 = !DILocation(line: 22, column: 19, scope: !72)
!83 = !DILocation(line: 22, column: 38, scope: !72)
!84 = !DILocation(line: 22, column: 37, scope: !72)
!85 = !DILocation(line: 22, column: 44, scope: !72)
!86 = !DILocation(line: 22, column: 47, scope: !72)
!87 = !DILocation(line: 22, column: 50, scope: !72)
!88 = !DILocation(line: 22, column: 42, scope: !72)
!89 = !DILocation(line: 22, column: 40, scope: !72)
!90 = !DILocation(line: 22, column: 53, scope: !72)
!91 = !DILocation(line: 22, column: 4, scope: !72)
!92 = !DILocation(line: 21, column: 23, scope: !72)
!93 = !DILocation(line: 21, column: 3, scope: !72)
!94 = distinct !{!94, !75, !95}
!95 = !DILocation(line: 22, column: 56, scope: !68)
!96 = !DILocation(line: 23, column: 3, scope: !69)
!97 = !DILocation(line: 24, column: 2, scope: !69)
!98 = !DILocation(line: 20, column: 22, scope: !63)
!99 = !DILocation(line: 20, column: 2, scope: !63)
!100 = distinct !{!100, !66, !101}
!101 = !DILocation(line: 24, column: 2, scope: !60)
!102 = !DILocation(line: 25, column: 38, scope: !25)
!103 = !DILocation(line: 25, column: 40, scope: !25)
!104 = !DILocation(line: 25, column: 39, scope: !25)
!105 = !DILocation(line: 25, column: 41, scope: !25)
!106 = !DILocation(line: 25, column: 44, scope: !25)
!107 = !DILocation(line: 25, column: 47, scope: !25)
!108 = !DILocation(line: 25, column: 46, scope: !25)
!109 = !DILocation(line: 25, column: 2, scope: !25)
!110 = !DILocation(line: 27, column: 2, scope: !25)
!111 = !DILocation(line: 28, column: 1, scope: !25)
