; ModuleID = 'ackermann-function-2.bc'
source_filename = "ackermann-function-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@n_bits = common dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1
@cache = common dso_local global i32* null, align 8, !dbg !9
@m_bits = common dso_local global i32 0, align 4, !dbg !6
@.str.1 = private unnamed_addr constant [16 x i8] c"A(%d, %d) = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ackermann(i32 %m, i32 %n) #0 !dbg !16 {
entry:
  %retval = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %idx = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %idx, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %res, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load i32, i32* %m.addr, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.end, label %if.then, !dbg !29

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !30
  %add = add nsw i32 %1, 1, !dbg !31
  store i32 %add, i32* %retval, align 4, !dbg !32
  br label %return, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !33
  %3 = load i32, i32* @n_bits, align 4, !dbg !35
  %shl = shl i32 1, %3, !dbg !36
  %cmp = icmp sge i32 %2, %shl, !dbg !37
  br i1 %cmp, label %if.then1, label %if.else, !dbg !38

if.then1:                                         ; preds = %if.end
  %4 = load i32, i32* %m.addr, align 4, !dbg !39
  %5 = load i32, i32* %n.addr, align 4, !dbg !41
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %4, i32 %5), !dbg !42
  store i32 0, i32* %idx, align 4, !dbg !43
  br label %if.end9, !dbg !44

if.else:                                          ; preds = %if.end
  %6 = load i32, i32* %m.addr, align 4, !dbg !45
  %7 = load i32, i32* @n_bits, align 4, !dbg !47
  %shl2 = shl i32 %6, %7, !dbg !48
  %8 = load i32, i32* %n.addr, align 4, !dbg !49
  %add3 = add nsw i32 %shl2, %8, !dbg !50
  store i32 %add3, i32* %idx, align 4, !dbg !51
  %9 = load i32*, i32** @cache, align 8, !dbg !52
  %10 = load i32, i32* %idx, align 4, !dbg !54
  %idxprom = sext i32 %10 to i64, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !52
  %11 = load i32, i32* %arrayidx, align 4, !dbg !52
  %tobool4 = icmp ne i32 %11, 0, !dbg !52
  br i1 %tobool4, label %if.then5, label %if.end8, !dbg !55

if.then5:                                         ; preds = %if.else
  %12 = load i32*, i32** @cache, align 8, !dbg !56
  %13 = load i32, i32* %idx, align 4, !dbg !57
  %idxprom6 = sext i32 %13 to i64, !dbg !56
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %idxprom6, !dbg !56
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !56
  store i32 %14, i32* %retval, align 4, !dbg !58
  br label %return, !dbg !58

if.end8:                                          ; preds = %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.then1
  %15 = load i32, i32* %n.addr, align 4, !dbg !59
  %tobool10 = icmp ne i32 %15, 0, !dbg !59
  br i1 %tobool10, label %if.else13, label %if.then11, !dbg !61

if.then11:                                        ; preds = %if.end9
  %16 = load i32, i32* %m.addr, align 4, !dbg !62
  %sub = sub nsw i32 %16, 1, !dbg !63
  %call12 = call i32 @ackermann(i32 %sub, i32 1), !dbg !64
  store i32 %call12, i32* %res, align 4, !dbg !65
  br label %if.end18, !dbg !66

if.else13:                                        ; preds = %if.end9
  %17 = load i32, i32* %m.addr, align 4, !dbg !67
  %sub14 = sub nsw i32 %17, 1, !dbg !68
  %18 = load i32, i32* %m.addr, align 4, !dbg !69
  %19 = load i32, i32* %n.addr, align 4, !dbg !70
  %sub15 = sub nsw i32 %19, 1, !dbg !71
  %call16 = call i32 @ackermann(i32 %18, i32 %sub15), !dbg !72
  %call17 = call i32 @ackermann(i32 %sub14, i32 %call16), !dbg !73
  store i32 %call17, i32* %res, align 4, !dbg !74
  br label %if.end18

if.end18:                                         ; preds = %if.else13, %if.then11
  %20 = load i32, i32* %idx, align 4, !dbg !75
  %tobool19 = icmp ne i32 %20, 0, !dbg !75
  br i1 %tobool19, label %if.then20, label %if.end23, !dbg !77

if.then20:                                        ; preds = %if.end18
  %21 = load i32, i32* %res, align 4, !dbg !78
  %22 = load i32*, i32** @cache, align 8, !dbg !79
  %23 = load i32, i32* %idx, align 4, !dbg !80
  %idxprom21 = sext i32 %23 to i64, !dbg !79
  %arrayidx22 = getelementptr inbounds i32, i32* %22, i64 %idxprom21, !dbg !79
  store i32 %21, i32* %arrayidx22, align 4, !dbg !81
  br label %if.end23, !dbg !79

if.end23:                                         ; preds = %if.then20, %if.end18
  %24 = load i32, i32* %res, align 4, !dbg !82
  store i32 %24, i32* %retval, align 4, !dbg !83
  br label %return, !dbg !83

return:                                           ; preds = %if.end23, %if.then5, %if.then
  %25 = load i32, i32* %retval, align 4, !dbg !84
  ret i32 %25, !dbg !84
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %m, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32* %n, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 3, i32* @m_bits, align 4, !dbg !92
  store i32 20, i32* @n_bits, align 4, !dbg !93
  %0 = load i32, i32* @m_bits, align 4, !dbg !94
  %1 = load i32, i32* @n_bits, align 4, !dbg !95
  %add = add nsw i32 %0, %1, !dbg !96
  %shl = shl i32 1, %add, !dbg !97
  %conv = sext i32 %shl to i64, !dbg !98
  %mul = mul i64 4, %conv, !dbg !99
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !100
  %2 = bitcast i8* %call to i32*, !dbg !100
  store i32* %2, i32** @cache, align 8, !dbg !101
  %3 = load i32*, i32** @cache, align 8, !dbg !102
  %4 = bitcast i32* %3 to i8*, !dbg !103
  %5 = load i32, i32* @m_bits, align 4, !dbg !104
  %6 = load i32, i32* @n_bits, align 4, !dbg !105
  %add1 = add nsw i32 %5, %6, !dbg !106
  %shl2 = shl i32 1, %add1, !dbg !107
  %conv3 = sext i32 %shl2 to i64, !dbg !108
  %mul4 = mul i64 4, %conv3, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 4 %4, i8 0, i64 %mul4, i1 false), !dbg !103
  store i32 0, i32* %m, align 4, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc12, %entry
  %7 = load i32, i32* %m, align 4, !dbg !113
  %cmp = icmp sle i32 %7, 4, !dbg !115
  br i1 %cmp, label %for.body, label %for.end14, !dbg !116

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %n, align 4, !dbg !117
  br label %for.cond6, !dbg !119

for.cond6:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %n, align 4, !dbg !120
  %9 = load i32, i32* %m, align 4, !dbg !122
  %sub = sub nsw i32 6, %9, !dbg !123
  %cmp7 = icmp slt i32 %8, %sub, !dbg !124
  br i1 %cmp7, label %for.body9, label %for.end, !dbg !125

for.body9:                                        ; preds = %for.cond6
  %10 = load i32, i32* %m, align 4, !dbg !126
  %11 = load i32, i32* %n, align 4, !dbg !127
  %12 = load i32, i32* %m, align 4, !dbg !128
  %13 = load i32, i32* %n, align 4, !dbg !129
  %call10 = call i32 @ackermann(i32 %12, i32 %13), !dbg !130
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i32 %10, i32 %11, i32 %call10), !dbg !131
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body9
  %14 = load i32, i32* %n, align 4, !dbg !132
  %inc = add nsw i32 %14, 1, !dbg !132
  store i32 %inc, i32* %n, align 4, !dbg !132
  br label %for.cond6, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond6
  br label %for.inc12, !dbg !135

for.inc12:                                        ; preds = %for.end
  %15 = load i32, i32* %m, align 4, !dbg !136
  %inc13 = add nsw i32 %15, 1, !dbg !136
  store i32 %inc13, i32* %m, align 4, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end14:                                        ; preds = %for.cond
  ret i32 0, !dbg !140
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "n_bits", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "ackermann-function-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Ackermann-function-2")
!4 = !{}
!5 = !{!6, !0, !9}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "m_bits", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "cache", scope: !2, file: !3, line: 6, type: !11, isLocal: false, isDefinition: true)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!16 = distinct !DISubprogram(name: "ackermann", scope: !3, file: !3, line: 8, type: !17, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{!8, !8, !8}
!19 = !DILocalVariable(name: "m", arg: 1, scope: !16, file: !3, line: 8, type: !8)
!20 = !DILocation(line: 8, column: 19, scope: !16)
!21 = !DILocalVariable(name: "n", arg: 2, scope: !16, file: !3, line: 8, type: !8)
!22 = !DILocation(line: 8, column: 26, scope: !16)
!23 = !DILocalVariable(name: "idx", scope: !16, file: !3, line: 10, type: !8)
!24 = !DILocation(line: 10, column: 13, scope: !16)
!25 = !DILocalVariable(name: "res", scope: !16, file: !3, line: 10, type: !8)
!26 = !DILocation(line: 10, column: 18, scope: !16)
!27 = !DILocation(line: 11, column: 14, scope: !28)
!28 = distinct !DILexicalBlock(scope: !16, file: !3, line: 11, column: 13)
!29 = !DILocation(line: 11, column: 13, scope: !16)
!30 = !DILocation(line: 11, column: 24, scope: !28)
!31 = !DILocation(line: 11, column: 26, scope: !28)
!32 = !DILocation(line: 11, column: 17, scope: !28)
!33 = !DILocation(line: 13, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !3, line: 13, column: 13)
!35 = !DILocation(line: 13, column: 21, scope: !34)
!36 = !DILocation(line: 13, column: 19, scope: !34)
!37 = !DILocation(line: 13, column: 15, scope: !34)
!38 = !DILocation(line: 13, column: 13, scope: !16)
!39 = !DILocation(line: 14, column: 36, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !3, line: 13, column: 29)
!41 = !DILocation(line: 14, column: 39, scope: !40)
!42 = !DILocation(line: 14, column: 17, scope: !40)
!43 = !DILocation(line: 15, column: 21, scope: !40)
!44 = !DILocation(line: 16, column: 9, scope: !40)
!45 = !DILocation(line: 17, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !34, file: !3, line: 16, column: 16)
!47 = !DILocation(line: 17, column: 29, scope: !46)
!48 = !DILocation(line: 17, column: 26, scope: !46)
!49 = !DILocation(line: 17, column: 39, scope: !46)
!50 = !DILocation(line: 17, column: 37, scope: !46)
!51 = !DILocation(line: 17, column: 21, scope: !46)
!52 = !DILocation(line: 18, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !46, file: !3, line: 18, column: 21)
!54 = !DILocation(line: 18, column: 27, scope: !53)
!55 = !DILocation(line: 18, column: 21, scope: !46)
!56 = !DILocation(line: 18, column: 40, scope: !53)
!57 = !DILocation(line: 18, column: 46, scope: !53)
!58 = !DILocation(line: 18, column: 33, scope: !53)
!59 = !DILocation(line: 21, column: 14, scope: !60)
!60 = distinct !DILexicalBlock(scope: !16, file: !3, line: 21, column: 13)
!61 = !DILocation(line: 21, column: 13, scope: !16)
!62 = !DILocation(line: 21, column: 33, scope: !60)
!63 = !DILocation(line: 21, column: 35, scope: !60)
!64 = !DILocation(line: 21, column: 23, scope: !60)
!65 = !DILocation(line: 21, column: 21, scope: !60)
!66 = !DILocation(line: 21, column: 17, scope: !60)
!67 = !DILocation(line: 22, column: 33, scope: !60)
!68 = !DILocation(line: 22, column: 35, scope: !60)
!69 = !DILocation(line: 22, column: 50, scope: !60)
!70 = !DILocation(line: 22, column: 53, scope: !60)
!71 = !DILocation(line: 22, column: 55, scope: !60)
!72 = !DILocation(line: 22, column: 40, scope: !60)
!73 = !DILocation(line: 22, column: 23, scope: !60)
!74 = !DILocation(line: 22, column: 21, scope: !60)
!75 = !DILocation(line: 24, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !16, file: !3, line: 24, column: 13)
!77 = !DILocation(line: 24, column: 13, scope: !16)
!78 = !DILocation(line: 24, column: 31, scope: !76)
!79 = !DILocation(line: 24, column: 18, scope: !76)
!80 = !DILocation(line: 24, column: 24, scope: !76)
!81 = !DILocation(line: 24, column: 29, scope: !76)
!82 = !DILocation(line: 25, column: 16, scope: !16)
!83 = !DILocation(line: 25, column: 9, scope: !16)
!84 = !DILocation(line: 26, column: 1, scope: !16)
!85 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 27, type: !86, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!8}
!88 = !DILocalVariable(name: "m", scope: !85, file: !3, line: 29, type: !8)
!89 = !DILocation(line: 29, column: 13, scope: !85)
!90 = !DILocalVariable(name: "n", scope: !85, file: !3, line: 29, type: !8)
!91 = !DILocation(line: 29, column: 16, scope: !85)
!92 = !DILocation(line: 31, column: 16, scope: !85)
!93 = !DILocation(line: 32, column: 16, scope: !85)
!94 = !DILocation(line: 33, column: 45, scope: !85)
!95 = !DILocation(line: 33, column: 54, scope: !85)
!96 = !DILocation(line: 33, column: 52, scope: !85)
!97 = !DILocation(line: 33, column: 41, scope: !85)
!98 = !DILocation(line: 33, column: 38, scope: !85)
!99 = !DILocation(line: 33, column: 36, scope: !85)
!100 = !DILocation(line: 33, column: 17, scope: !85)
!101 = !DILocation(line: 33, column: 15, scope: !85)
!102 = !DILocation(line: 34, column: 16, scope: !85)
!103 = !DILocation(line: 34, column: 9, scope: !85)
!104 = !DILocation(line: 34, column: 47, scope: !85)
!105 = !DILocation(line: 34, column: 56, scope: !85)
!106 = !DILocation(line: 34, column: 54, scope: !85)
!107 = !DILocation(line: 34, column: 43, scope: !85)
!108 = !DILocation(line: 34, column: 40, scope: !85)
!109 = !DILocation(line: 34, column: 38, scope: !85)
!110 = !DILocation(line: 36, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !85, file: !3, line: 36, column: 9)
!112 = !DILocation(line: 36, column: 14, scope: !111)
!113 = !DILocation(line: 36, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !3, line: 36, column: 9)
!115 = !DILocation(line: 36, column: 23, scope: !114)
!116 = !DILocation(line: 36, column: 9, scope: !111)
!117 = !DILocation(line: 37, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !3, line: 37, column: 17)
!119 = !DILocation(line: 37, column: 22, scope: !118)
!120 = !DILocation(line: 37, column: 29, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !3, line: 37, column: 17)
!122 = !DILocation(line: 37, column: 37, scope: !121)
!123 = !DILocation(line: 37, column: 35, scope: !121)
!124 = !DILocation(line: 37, column: 31, scope: !121)
!125 = !DILocation(line: 37, column: 17, scope: !118)
!126 = !DILocation(line: 38, column: 52, scope: !121)
!127 = !DILocation(line: 38, column: 55, scope: !121)
!128 = !DILocation(line: 38, column: 68, scope: !121)
!129 = !DILocation(line: 38, column: 71, scope: !121)
!130 = !DILocation(line: 38, column: 58, scope: !121)
!131 = !DILocation(line: 38, column: 25, scope: !121)
!132 = !DILocation(line: 37, column: 41, scope: !121)
!133 = !DILocation(line: 37, column: 17, scope: !121)
!134 = distinct !{!134, !125, !135}
!135 = !DILocation(line: 38, column: 73, scope: !118)
!136 = !DILocation(line: 36, column: 30, scope: !114)
!137 = !DILocation(line: 36, column: 9, scope: !114)
!138 = distinct !{!138, !116, !139}
!139 = !DILocation(line: 38, column: 73, scope: !111)
!140 = !DILocation(line: 40, column: 9, scope: !85)
