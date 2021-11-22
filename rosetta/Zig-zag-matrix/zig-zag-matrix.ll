; ModuleID = 'zig-zag-matrix.c'
source_filename = "zig-zag-matrix.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%3d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %s = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %j, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %m, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %n, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %s, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* %c.addr, align 4, !dbg !29
  %cmp = icmp slt i32 %0, 2, !dbg !31
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !32, !cf.info !33

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8**, i8*** %v.addr, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !34
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !34
  %call = call i32 @atoi(i8* %2) #5, !dbg !35
  store i32 %call, i32* %m, align 4, !dbg !36
  %cmp1 = icmp sle i32 %call, 0, !dbg !37
  br i1 %cmp1, label %if.then, label %if.end, !dbg !38, !cf.info !33

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 5, i32* %m, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %3 = load i32, i32* %m, align 4, !dbg !41
  %conv = sext i32 %3 to i64, !dbg !41
  %mul = mul i64 4, %conv, !dbg !42
  %4 = load i32, i32* %m, align 4, !dbg !43
  %conv2 = sext i32 %4 to i64, !dbg !43
  %mul3 = mul i64 %mul, %conv2, !dbg !44
  %call4 = call noalias i8* @malloc(i64 %mul3) #6, !dbg !45
  %5 = bitcast i8* %call4 to i32*, !dbg !45
  store i32* %5, i32** %s, align 8, !dbg !46
  store i32 0, i32* %n, align 4, !dbg !47
  store i32 0, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc28, %if.end
  %6 = load i32, i32* %i, align 4, !dbg !51
  %7 = load i32, i32* %m, align 4, !dbg !53
  %mul5 = mul nsw i32 %7, 2, !dbg !54
  %cmp6 = icmp slt i32 %6, %mul5, !dbg !55
  br i1 %cmp6, label %for.body, label %for.end30, !dbg !56

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !57
  %9 = load i32, i32* %m, align 4, !dbg !59
  %cmp8 = icmp slt i32 %8, %9, !dbg !60
  br i1 %cmp8, label %cond.true, label %cond.false, !dbg !61

cond.true:                                        ; preds = %for.body
  br label %cond.end, !dbg !61

cond.false:                                       ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !62
  %11 = load i32, i32* %m, align 4, !dbg !63
  %sub = sub nsw i32 %10, %11, !dbg !64
  %add = add nsw i32 %sub, 1, !dbg !65
  br label %cond.end, !dbg !61

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %add, %cond.false ], !dbg !61
  store i32 %cond, i32* %j, align 4, !dbg !66
  br label %for.cond10, !dbg !67

for.cond10:                                       ; preds = %for.inc, %cond.end
  %12 = load i32, i32* %j, align 4, !dbg !68
  %13 = load i32, i32* %i, align 4, !dbg !70
  %cmp11 = icmp sle i32 %12, %13, !dbg !71
  br i1 %cmp11, label %land.rhs, label %land.end, !dbg !72

land.rhs:                                         ; preds = %for.cond10
  %14 = load i32, i32* %j, align 4, !dbg !73
  %15 = load i32, i32* %m, align 4, !dbg !74
  %cmp13 = icmp slt i32 %14, %15, !dbg !75
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond10
  %16 = phi i1 [ false, %for.cond10 ], [ %cmp13, %land.rhs ], !dbg !76
  br i1 %16, label %for.body15, label %for.end, !dbg !77

for.body15:                                       ; preds = %land.end
  %17 = load i32, i32* %n, align 4, !dbg !78
  %inc = add nsw i32 %17, 1, !dbg !78
  store i32 %inc, i32* %n, align 4, !dbg !78
  %18 = load i32*, i32** %s, align 8, !dbg !79
  %19 = load i32, i32* %i, align 4, !dbg !80
  %and = and i32 %19, 1, !dbg !81
  %tobool = icmp ne i32 %and, 0, !dbg !81
  br i1 %tobool, label %cond.true16, label %cond.false20, !dbg !82

cond.true16:                                      ; preds = %for.body15
  %20 = load i32, i32* %j, align 4, !dbg !83
  %21 = load i32, i32* %m, align 4, !dbg !84
  %sub17 = sub nsw i32 %21, 1, !dbg !85
  %mul18 = mul nsw i32 %20, %sub17, !dbg !86
  %22 = load i32, i32* %i, align 4, !dbg !87
  %add19 = add nsw i32 %mul18, %22, !dbg !88
  br label %cond.end24, !dbg !82

cond.false20:                                     ; preds = %for.body15
  %23 = load i32, i32* %i, align 4, !dbg !89
  %24 = load i32, i32* %j, align 4, !dbg !90
  %sub21 = sub nsw i32 %23, %24, !dbg !91
  %25 = load i32, i32* %m, align 4, !dbg !92
  %mul22 = mul nsw i32 %sub21, %25, !dbg !93
  %26 = load i32, i32* %j, align 4, !dbg !94
  %add23 = add nsw i32 %mul22, %26, !dbg !95
  br label %cond.end24, !dbg !82

cond.end24:                                       ; preds = %cond.false20, %cond.true16
  %cond25 = phi i32 [ %add19, %cond.true16 ], [ %add23, %cond.false20 ], !dbg !82
  %idxprom = sext i32 %cond25 to i64, !dbg !79
  %arrayidx26 = getelementptr inbounds i32, i32* %18, i64 %idxprom, !dbg !79
  store i32 %17, i32* %arrayidx26, align 4, !dbg !96
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %cond.end24
  %27 = load i32, i32* %j, align 4, !dbg !97
  %inc27 = add nsw i32 %27, 1, !dbg !97
  store i32 %inc27, i32* %j, align 4, !dbg !97
  br label %for.cond10, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %land.end
  br label %for.inc28, !dbg !100

for.inc28:                                        ; preds = %for.end
  %28 = load i32, i32* %i, align 4, !dbg !101
  %inc29 = add nsw i32 %28, 1, !dbg !101
  store i32 %inc29, i32* %i, align 4, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end30:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !105
  br label %for.cond31, !dbg !107

for.cond31:                                       ; preds = %for.inc39, %for.end30
  %29 = load i32, i32* %i, align 4, !dbg !108
  %30 = load i32, i32* %m, align 4, !dbg !110
  %31 = load i32, i32* %m, align 4, !dbg !111
  %mul32 = mul nsw i32 %30, %31, !dbg !112
  %cmp33 = icmp slt i32 %29, %mul32, !dbg !113
  br i1 %cmp33, label %for.body35, label %for.end44, !dbg !114

for.body35:                                       ; preds = %for.cond31
  %32 = load i32*, i32** %s, align 8, !dbg !115
  %33 = load i32, i32* %i, align 4, !dbg !116
  %idxprom36 = sext i32 %33 to i64, !dbg !115
  %arrayidx37 = getelementptr inbounds i32, i32* %32, i64 %idxprom36, !dbg !115
  %34 = load i32, i32* %arrayidx37, align 4, !dbg !115
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %34), !dbg !117
  br label %for.inc39, !dbg !117

for.inc39:                                        ; preds = %for.body35
  %35 = load i32, i32* %i, align 4, !dbg !118
  %inc40 = add nsw i32 %35, 1, !dbg !118
  store i32 %inc40, i32* %i, align 4, !dbg !118
  %36 = load i32, i32* %m, align 4, !dbg !119
  %rem = srem i32 %inc40, %36, !dbg !120
  %tobool41 = icmp ne i32 %rem, 0, !dbg !121
  %37 = zext i1 %tobool41 to i64, !dbg !121
  %cond42 = select i1 %tobool41, i32 32, i32 10, !dbg !121
  %call43 = call i32 @putchar(i32 %cond42), !dbg !122
  br label %for.cond31, !dbg !123, !llvm.loop !124

for.end44:                                        ; preds = %for.cond31
  ret i32 0, !dbg !126
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @putchar(i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "zig-zag-matrix.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Zig-zag-matrix")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "c", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!15 = !DILocation(line: 4, column: 14, scope: !7)
!16 = !DILocalVariable(name: "v", arg: 2, scope: !7, file: !1, line: 4, type: !11)
!17 = !DILocation(line: 4, column: 24, scope: !7)
!18 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 6, type: !10)
!19 = !DILocation(line: 6, column: 6, scope: !7)
!20 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 6, type: !10)
!21 = !DILocation(line: 6, column: 9, scope: !7)
!22 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 6, type: !10)
!23 = !DILocation(line: 6, column: 12, scope: !7)
!24 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 6, type: !10)
!25 = !DILocation(line: 6, column: 15, scope: !7)
!26 = !DILocalVariable(name: "s", scope: !7, file: !1, line: 6, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!28 = !DILocation(line: 6, column: 19, scope: !7)
!29 = !DILocation(line: 9, column: 6, scope: !30)
!30 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 6)
!31 = !DILocation(line: 9, column: 8, scope: !30)
!32 = !DILocation(line: 9, column: 12, scope: !30)
!33 = !{!"if"}
!34 = !DILocation(line: 9, column: 26, scope: !30)
!35 = !DILocation(line: 9, column: 21, scope: !30)
!36 = !DILocation(line: 9, column: 19, scope: !30)
!37 = !DILocation(line: 9, column: 34, scope: !30)
!38 = !DILocation(line: 9, column: 6, scope: !7)
!39 = !DILocation(line: 9, column: 42, scope: !30)
!40 = !DILocation(line: 9, column: 40, scope: !30)
!41 = !DILocation(line: 12, column: 27, scope: !7)
!42 = !DILocation(line: 12, column: 25, scope: !7)
!43 = !DILocation(line: 12, column: 31, scope: !7)
!44 = !DILocation(line: 12, column: 29, scope: !7)
!45 = !DILocation(line: 12, column: 6, scope: !7)
!46 = !DILocation(line: 12, column: 4, scope: !7)
!47 = !DILocation(line: 14, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 2)
!49 = !DILocation(line: 14, column: 9, scope: !48)
!50 = !DILocation(line: 14, column: 7, scope: !48)
!51 = !DILocation(line: 14, column: 18, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 14, column: 2)
!53 = !DILocation(line: 14, column: 22, scope: !52)
!54 = !DILocation(line: 14, column: 24, scope: !52)
!55 = !DILocation(line: 14, column: 20, scope: !52)
!56 = !DILocation(line: 14, column: 2, scope: !48)
!57 = !DILocation(line: 15, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !1, line: 15, column: 3)
!59 = !DILocation(line: 15, column: 17, scope: !58)
!60 = !DILocation(line: 15, column: 15, scope: !58)
!61 = !DILocation(line: 15, column: 12, scope: !58)
!62 = !DILocation(line: 15, column: 26, scope: !58)
!63 = !DILocation(line: 15, column: 28, scope: !58)
!64 = !DILocation(line: 15, column: 27, scope: !58)
!65 = !DILocation(line: 15, column: 29, scope: !58)
!66 = !DILocation(line: 15, column: 10, scope: !58)
!67 = !DILocation(line: 15, column: 8, scope: !58)
!68 = !DILocation(line: 15, column: 33, scope: !69)
!69 = distinct !DILexicalBlock(scope: !58, file: !1, line: 15, column: 3)
!70 = !DILocation(line: 15, column: 38, scope: !69)
!71 = !DILocation(line: 15, column: 35, scope: !69)
!72 = !DILocation(line: 15, column: 40, scope: !69)
!73 = !DILocation(line: 15, column: 43, scope: !69)
!74 = !DILocation(line: 15, column: 47, scope: !69)
!75 = !DILocation(line: 15, column: 45, scope: !69)
!76 = !DILocation(line: 0, scope: !69)
!77 = !DILocation(line: 15, column: 3, scope: !58)
!78 = !DILocation(line: 16, column: 40, scope: !69)
!79 = !DILocation(line: 16, column: 4, scope: !69)
!80 = !DILocation(line: 16, column: 7, scope: !69)
!81 = !DILocation(line: 16, column: 8, scope: !69)
!82 = !DILocation(line: 16, column: 6, scope: !69)
!83 = !DILocation(line: 16, column: 13, scope: !69)
!84 = !DILocation(line: 16, column: 16, scope: !69)
!85 = !DILocation(line: 16, column: 17, scope: !69)
!86 = !DILocation(line: 16, column: 14, scope: !69)
!87 = !DILocation(line: 16, column: 21, scope: !69)
!88 = !DILocation(line: 16, column: 20, scope: !69)
!89 = !DILocation(line: 16, column: 26, scope: !69)
!90 = !DILocation(line: 16, column: 28, scope: !69)
!91 = !DILocation(line: 16, column: 27, scope: !69)
!92 = !DILocation(line: 16, column: 31, scope: !69)
!93 = !DILocation(line: 16, column: 30, scope: !69)
!94 = !DILocation(line: 16, column: 33, scope: !69)
!95 = !DILocation(line: 16, column: 32, scope: !69)
!96 = !DILocation(line: 16, column: 37, scope: !69)
!97 = !DILocation(line: 15, column: 51, scope: !69)
!98 = !DILocation(line: 15, column: 3, scope: !69)
!99 = distinct !{!99, !77, !100}
!100 = !DILocation(line: 16, column: 40, scope: !58)
!101 = !DILocation(line: 14, column: 30, scope: !52)
!102 = !DILocation(line: 14, column: 2, scope: !52)
!103 = distinct !{!103, !56, !104}
!104 = !DILocation(line: 16, column: 40, scope: !48)
!105 = !DILocation(line: 18, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 2)
!107 = !DILocation(line: 18, column: 7, scope: !106)
!108 = !DILocation(line: 18, column: 14, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !1, line: 18, column: 2)
!110 = !DILocation(line: 18, column: 18, scope: !109)
!111 = !DILocation(line: 18, column: 22, scope: !109)
!112 = !DILocation(line: 18, column: 20, scope: !109)
!113 = !DILocation(line: 18, column: 16, scope: !109)
!114 = !DILocation(line: 18, column: 2, scope: !106)
!115 = !DILocation(line: 19, column: 17, scope: !109)
!116 = !DILocation(line: 19, column: 19, scope: !109)
!117 = !DILocation(line: 19, column: 3, scope: !109)
!118 = !DILocation(line: 18, column: 34, scope: !109)
!119 = !DILocation(line: 18, column: 40, scope: !109)
!120 = !DILocation(line: 18, column: 38, scope: !109)
!121 = !DILocation(line: 18, column: 33, scope: !109)
!122 = !DILocation(line: 18, column: 25, scope: !109)
!123 = !DILocation(line: 18, column: 2, scope: !109)
!124 = distinct !{!124, !114, !125}
!125 = !DILocation(line: 19, column: 21, scope: !106)
!126 = !DILocation(line: 22, column: 2, scope: !7)
