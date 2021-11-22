; ModuleID = 'five-weekends-1.c'
source_filename = "five-weekends-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@.str = private unnamed_addr constant [28 x i8] c"Months with five weekends:\0A\00", align 1
@long_months = internal global [7 x i32] [i32 0, i32 2, i32 4, i32 6, i32 7, i32 9, i32 11], align 16, !dbg !0
@.str.1 = private unnamed_addr constant [14 x i8] c"Error: %d %s\0A\00", align 1
@months = internal global [12 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.15, i32 0, i32 0)], align 16, !dbg !6
@.str.2 = private unnamed_addr constant [9 x i8] c"  %d %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"%d total\0A\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"January\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"February\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"March\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"April\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"May\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"June\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"July\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"August\00", align 1
@.str.12 = private unnamed_addr constant [10 x i8] c"September\00", align 1
@.str.13 = private unnamed_addr constant [8 x i8] c"October\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"November\00", align 1
@.str.15 = private unnamed_addr constant [9 x i8] c"December\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !22 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %y = alloca i32, align 4
  %i = alloca i32, align 4
  %m = alloca i32, align 4
  %t = alloca %struct.tm, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %n, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %y, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %m, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata %struct.tm* %t, metadata !33, metadata !DIExpression()), !dbg !49
  %0 = bitcast %struct.tm* %t to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 56, i1 false), !dbg !49
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0)), !dbg !50
  store i32 1900, i32* %y, align 4, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc16, %entry
  %1 = load i32, i32* %y, align 4, !dbg !54
  %cmp = icmp sle i32 %1, 2100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end18, !dbg !57

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !58
  br label %for.cond1, !dbg !61

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %i, align 4, !dbg !62
  %cmp2 = icmp slt i32 %2, 7, !dbg !64
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !65

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %i, align 4, !dbg !66
  %idxprom = sext i32 %3 to i64, !dbg !68
  %arrayidx = getelementptr inbounds [7 x i32], [7 x i32]* @long_months, i64 0, i64 %idxprom, !dbg !68
  %4 = load i32, i32* %arrayidx, align 4, !dbg !68
  store i32 %4, i32* %m, align 4, !dbg !69
  %5 = load i32, i32* %y, align 4, !dbg !70
  %sub = sub nsw i32 %5, 1900, !dbg !71
  %tm_year = getelementptr inbounds %struct.tm, %struct.tm* %t, i32 0, i32 5, !dbg !72
  store i32 %sub, i32* %tm_year, align 4, !dbg !73
  %6 = load i32, i32* %m, align 4, !dbg !74
  %tm_mon = getelementptr inbounds %struct.tm, %struct.tm* %t, i32 0, i32 4, !dbg !75
  store i32 %6, i32* %tm_mon, align 8, !dbg !76
  %tm_mday = getelementptr inbounds %struct.tm, %struct.tm* %t, i32 0, i32 3, !dbg !77
  store i32 1, i32* %tm_mday, align 4, !dbg !78
  %call4 = call i64 @mktime(%struct.tm* %t) #5, !dbg !79
  %cmp5 = icmp eq i64 %call4, -1, !dbg !81
  br i1 %cmp5, label %if.then, label %if.end, !dbg !82, !cf.info !83

if.then:                                          ; preds = %for.body3
  %7 = load i32, i32* %y, align 4, !dbg !84
  %8 = load i32, i32* %m, align 4, !dbg !86
  %idxprom6 = sext i32 %8 to i64, !dbg !87
  %arrayidx7 = getelementptr inbounds [12 x i8*], [12 x i8*]* @months, i64 0, i64 %idxprom6, !dbg !87
  %9 = load i8*, i8** %arrayidx7, align 8, !dbg !87
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %7, i8* %9), !dbg !88
  br label %for.inc, !dbg !89

if.end:                                           ; preds = %for.body3
  %tm_wday = getelementptr inbounds %struct.tm, %struct.tm* %t, i32 0, i32 6, !dbg !90
  %10 = load i32, i32* %tm_wday, align 8, !dbg !90
  %cmp9 = icmp eq i32 %10, 5, !dbg !92
  br i1 %cmp9, label %if.then10, label %if.end14, !dbg !93, !cf.info !83

if.then10:                                        ; preds = %if.end
  %11 = load i32, i32* %y, align 4, !dbg !94
  %12 = load i32, i32* %m, align 4, !dbg !96
  %idxprom11 = sext i32 %12 to i64, !dbg !97
  %arrayidx12 = getelementptr inbounds [12 x i8*], [12 x i8*]* @months, i64 0, i64 %idxprom11, !dbg !97
  %13 = load i8*, i8** %arrayidx12, align 8, !dbg !97
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 %11, i8* %13), !dbg !98
  %14 = load i32, i32* %n, align 4, !dbg !99
  %inc = add nsw i32 %14, 1, !dbg !99
  store i32 %inc, i32* %n, align 4, !dbg !99
  br label %if.end14, !dbg !100

if.end14:                                         ; preds = %if.then10, %if.end
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %if.end14, %if.then
  %15 = load i32, i32* %i, align 4, !dbg !102
  %inc15 = add nsw i32 %15, 1, !dbg !102
  store i32 %inc15, i32* %i, align 4, !dbg !102
  br label %for.cond1, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond1
  br label %for.inc16, !dbg !106

for.inc16:                                        ; preds = %for.end
  %16 = load i32, i32* %y, align 4, !dbg !107
  %inc17 = add nsw i32 %16, 1, !dbg !107
  store i32 %inc17, i32* %y, align 4, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end18:                                        ; preds = %for.cond
  %17 = load i32, i32* %n, align 4, !dbg !111
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %17), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local i64 @mktime(%struct.tm*) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "long_months", scope: !2, file: !3, line: 6, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "five-weekends-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Five-weekends")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "months", scope: !2, file: !3, line: 4, type: !8, isLocal: true, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 768, elements: !12)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 12)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 224, elements: !16)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{!17}
!17 = !DISubrange(count: 7)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!22 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 8, type: !23, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{!15}
!25 = !DILocalVariable(name: "n", scope: !22, file: !3, line: 9, type: !15)
!26 = !DILocation(line: 9, column: 9, scope: !22)
!27 = !DILocalVariable(name: "y", scope: !22, file: !3, line: 9, type: !15)
!28 = !DILocation(line: 9, column: 16, scope: !22)
!29 = !DILocalVariable(name: "i", scope: !22, file: !3, line: 9, type: !15)
!30 = !DILocation(line: 9, column: 19, scope: !22)
!31 = !DILocalVariable(name: "m", scope: !22, file: !3, line: 9, type: !15)
!32 = !DILocation(line: 9, column: 22, scope: !22)
!33 = !DILocalVariable(name: "t", scope: !22, file: !3, line: 10, type: !34)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !35, line: 7, size: 448, elements: !36)
!35 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!36 = !{!37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !48}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !34, file: !35, line: 9, baseType: !15, size: 32)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !34, file: !35, line: 10, baseType: !15, size: 32, offset: 32)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !34, file: !35, line: 11, baseType: !15, size: 32, offset: 64)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !34, file: !35, line: 12, baseType: !15, size: 32, offset: 96)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !34, file: !35, line: 13, baseType: !15, size: 32, offset: 128)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !34, file: !35, line: 14, baseType: !15, size: 32, offset: 160)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !34, file: !35, line: 15, baseType: !15, size: 32, offset: 192)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !34, file: !35, line: 16, baseType: !15, size: 32, offset: 224)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !34, file: !35, line: 17, baseType: !15, size: 32, offset: 256)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !34, file: !35, line: 20, baseType: !47, size: 64, offset: 320)
!47 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !34, file: !35, line: 21, baseType: !9, size: 64, offset: 384)
!49 = !DILocation(line: 10, column: 15, scope: !22)
!50 = !DILocation(line: 11, column: 5, scope: !22)
!51 = !DILocation(line: 12, column: 12, scope: !52)
!52 = distinct !DILexicalBlock(scope: !22, file: !3, line: 12, column: 5)
!53 = !DILocation(line: 12, column: 10, scope: !52)
!54 = !DILocation(line: 12, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !3, line: 12, column: 5)
!56 = !DILocation(line: 12, column: 22, scope: !55)
!57 = !DILocation(line: 12, column: 5, scope: !52)
!58 = !DILocation(line: 13, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !60, file: !3, line: 13, column: 9)
!60 = distinct !DILexicalBlock(scope: !55, file: !3, line: 12, column: 36)
!61 = !DILocation(line: 13, column: 14, scope: !59)
!62 = !DILocation(line: 13, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !3, line: 13, column: 9)
!64 = !DILocation(line: 13, column: 23, scope: !63)
!65 = !DILocation(line: 13, column: 9, scope: !59)
!66 = !DILocation(line: 14, column: 29, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !3, line: 13, column: 33)
!68 = !DILocation(line: 14, column: 17, scope: !67)
!69 = !DILocation(line: 14, column: 15, scope: !67)
!70 = !DILocation(line: 15, column: 25, scope: !67)
!71 = !DILocation(line: 15, column: 26, scope: !67)
!72 = !DILocation(line: 15, column: 15, scope: !67)
!73 = !DILocation(line: 15, column: 23, scope: !67)
!74 = !DILocation(line: 16, column: 17, scope: !67)
!75 = !DILocation(line: 16, column: 8, scope: !67)
!76 = !DILocation(line: 16, column: 15, scope: !67)
!77 = !DILocation(line: 17, column: 8, scope: !67)
!78 = !DILocation(line: 17, column: 16, scope: !67)
!79 = !DILocation(line: 18, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !67, file: !3, line: 18, column: 17)
!81 = !DILocation(line: 18, column: 28, scope: !80)
!82 = !DILocation(line: 18, column: 17, scope: !67)
!83 = !{!"if"}
!84 = !DILocation(line: 19, column: 42, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !3, line: 18, column: 35)
!86 = !DILocation(line: 19, column: 52, scope: !85)
!87 = !DILocation(line: 19, column: 45, scope: !85)
!88 = !DILocation(line: 19, column: 17, scope: !85)
!89 = !DILocation(line: 20, column: 17, scope: !85)
!90 = !DILocation(line: 22, column: 19, scope: !91)
!91 = distinct !DILexicalBlock(scope: !67, file: !3, line: 22, column: 17)
!92 = !DILocation(line: 22, column: 27, scope: !91)
!93 = !DILocation(line: 22, column: 17, scope: !67)
!94 = !DILocation(line: 23, column: 37, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !3, line: 22, column: 33)
!96 = !DILocation(line: 23, column: 47, scope: !95)
!97 = !DILocation(line: 23, column: 40, scope: !95)
!98 = !DILocation(line: 23, column: 17, scope: !95)
!99 = !DILocation(line: 24, column: 18, scope: !95)
!100 = !DILocation(line: 25, column: 13, scope: !95)
!101 = !DILocation(line: 26, column: 9, scope: !67)
!102 = !DILocation(line: 13, column: 29, scope: !63)
!103 = !DILocation(line: 13, column: 9, scope: !63)
!104 = distinct !{!104, !65, !105}
!105 = !DILocation(line: 26, column: 9, scope: !59)
!106 = !DILocation(line: 27, column: 5, scope: !60)
!107 = !DILocation(line: 12, column: 32, scope: !55)
!108 = !DILocation(line: 12, column: 5, scope: !55)
!109 = distinct !{!109, !57, !110}
!110 = !DILocation(line: 27, column: 5, scope: !52)
!111 = !DILocation(line: 28, column: 26, scope: !22)
!112 = !DILocation(line: 28, column: 5, scope: !22)
!113 = !DILocation(line: 29, column: 5, scope: !22)
