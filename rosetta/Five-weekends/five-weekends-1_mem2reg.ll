; ModuleID = 'five-weekends-1.ll'
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
  %t = alloca %struct.tm, align 8
  call void @llvm.dbg.value(metadata i32 0, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct.tm* %t, metadata !27, metadata !DIExpression()), !dbg !43
  %0 = bitcast %struct.tm* %t to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 56, i1 false), !dbg !43
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0)), !dbg !44
  call void @llvm.dbg.value(metadata i32 1900, metadata !45, metadata !DIExpression()), !dbg !26
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc16, %entry
  %y.0 = phi i32 [ 1900, %entry ], [ %inc17, %for.inc16 ], !dbg !48
  %n.0 = phi i32 [ 0, %entry ], [ %n.1, %for.inc16 ], !dbg !49
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.value(metadata i32 %y.0, metadata !45, metadata !DIExpression()), !dbg !26
  %cmp = icmp sle i32 %y.0, 2100, !dbg !50
  br i1 %cmp, label %for.body, label %for.end18, !dbg !52

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !53, metadata !DIExpression()), !dbg !26
  br label %for.cond1, !dbg !54

for.cond1:                                        ; preds = %for.inc, %for.body
  %n.1 = phi i32 [ %n.0, %for.body ], [ %n.3, %for.inc ], !dbg !49
  %i.0 = phi i32 [ 0, %for.body ], [ %inc15, %for.inc ], !dbg !57
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !53, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !25, metadata !DIExpression()), !dbg !26
  %cmp2 = icmp slt i32 %i.0, 7, !dbg !58
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !60

for.body3:                                        ; preds = %for.cond1
  %idxprom = sext i32 %i.0 to i64, !dbg !61
  %arrayidx = getelementptr inbounds [7 x i32], [7 x i32]* @long_months, i64 0, i64 %idxprom, !dbg !61
  %1 = load i32, i32* %arrayidx, align 4, !dbg !61
  call void @llvm.dbg.value(metadata i32 %1, metadata !63, metadata !DIExpression()), !dbg !26
  %sub = sub nsw i32 %y.0, 1900, !dbg !64
  %tm_year = getelementptr inbounds %struct.tm, %struct.tm* %t, i32 0, i32 5, !dbg !65
  store i32 %sub, i32* %tm_year, align 4, !dbg !66
  %tm_mon = getelementptr inbounds %struct.tm, %struct.tm* %t, i32 0, i32 4, !dbg !67
  store i32 %1, i32* %tm_mon, align 8, !dbg !68
  %tm_mday = getelementptr inbounds %struct.tm, %struct.tm* %t, i32 0, i32 3, !dbg !69
  store i32 1, i32* %tm_mday, align 4, !dbg !70
  %call4 = call i64 @mktime(%struct.tm* %t) #5, !dbg !71
  %cmp5 = icmp eq i64 %call4, -1, !dbg !73
  br i1 %cmp5, label %if.then, label %if.end, !dbg !74, !cf.info !75

if.then:                                          ; preds = %for.body3
  %idxprom6 = sext i32 %1 to i64, !dbg !76
  %arrayidx7 = getelementptr inbounds [12 x i8*], [12 x i8*]* @months, i64 0, i64 %idxprom6, !dbg !76
  %2 = load i8*, i8** %arrayidx7, align 8, !dbg !76
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %y.0, i8* %2), !dbg !78
  br label %for.inc, !dbg !79

if.end:                                           ; preds = %for.body3
  %tm_wday = getelementptr inbounds %struct.tm, %struct.tm* %t, i32 0, i32 6, !dbg !80
  %3 = load i32, i32* %tm_wday, align 8, !dbg !80
  %cmp9 = icmp eq i32 %3, 5, !dbg !82
  br i1 %cmp9, label %if.then10, label %if.end14, !dbg !83, !cf.info !75

if.then10:                                        ; preds = %if.end
  %idxprom11 = sext i32 %1 to i64, !dbg !84
  %arrayidx12 = getelementptr inbounds [12 x i8*], [12 x i8*]* @months, i64 0, i64 %idxprom11, !dbg !84
  %4 = load i8*, i8** %arrayidx12, align 8, !dbg !84
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 %y.0, i8* %4), !dbg !86
  %inc = add nsw i32 %n.1, 1, !dbg !87
  call void @llvm.dbg.value(metadata i32 %inc, metadata !25, metadata !DIExpression()), !dbg !26
  br label %if.end14, !dbg !88

if.end14:                                         ; preds = %if.then10, %if.end
  %n.2 = phi i32 [ %inc, %if.then10 ], [ %n.1, %if.end ], !dbg !26
  call void @llvm.dbg.value(metadata i32 %n.2, metadata !25, metadata !DIExpression()), !dbg !26
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %if.end14, %if.then
  %n.3 = phi i32 [ %n.1, %if.then ], [ %n.2, %if.end14 ], !dbg !26
  call void @llvm.dbg.value(metadata i32 %n.3, metadata !25, metadata !DIExpression()), !dbg !26
  %inc15 = add nsw i32 %i.0, 1, !dbg !90
  call void @llvm.dbg.value(metadata i32 %inc15, metadata !53, metadata !DIExpression()), !dbg !26
  br label %for.cond1, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond1
  br label %for.inc16, !dbg !94

for.inc16:                                        ; preds = %for.end
  %inc17 = add nsw i32 %y.0, 1, !dbg !95
  call void @llvm.dbg.value(metadata i32 %inc17, metadata !45, metadata !DIExpression()), !dbg !26
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end18:                                        ; preds = %for.cond
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %n.0), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local i64 @mktime(%struct.tm*) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!26 = !DILocation(line: 0, scope: !22)
!27 = !DILocalVariable(name: "t", scope: !22, file: !3, line: 10, type: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !29, line: 7, size: 448, elements: !30)
!29 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!30 = !{!31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !42}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !28, file: !29, line: 9, baseType: !15, size: 32)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !28, file: !29, line: 10, baseType: !15, size: 32, offset: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !28, file: !29, line: 11, baseType: !15, size: 32, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !28, file: !29, line: 12, baseType: !15, size: 32, offset: 96)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !28, file: !29, line: 13, baseType: !15, size: 32, offset: 128)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !28, file: !29, line: 14, baseType: !15, size: 32, offset: 160)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !28, file: !29, line: 15, baseType: !15, size: 32, offset: 192)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !28, file: !29, line: 16, baseType: !15, size: 32, offset: 224)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !28, file: !29, line: 17, baseType: !15, size: 32, offset: 256)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !28, file: !29, line: 20, baseType: !41, size: 64, offset: 320)
!41 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !28, file: !29, line: 21, baseType: !9, size: 64, offset: 384)
!43 = !DILocation(line: 10, column: 15, scope: !22)
!44 = !DILocation(line: 11, column: 5, scope: !22)
!45 = !DILocalVariable(name: "y", scope: !22, file: !3, line: 9, type: !15)
!46 = !DILocation(line: 12, column: 10, scope: !47)
!47 = distinct !DILexicalBlock(scope: !22, file: !3, line: 12, column: 5)
!48 = !DILocation(line: 0, scope: !47)
!49 = !DILocation(line: 9, column: 9, scope: !22)
!50 = !DILocation(line: 12, column: 22, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !3, line: 12, column: 5)
!52 = !DILocation(line: 12, column: 5, scope: !47)
!53 = !DILocalVariable(name: "i", scope: !22, file: !3, line: 9, type: !15)
!54 = !DILocation(line: 13, column: 14, scope: !55)
!55 = distinct !DILexicalBlock(scope: !56, file: !3, line: 13, column: 9)
!56 = distinct !DILexicalBlock(scope: !51, file: !3, line: 12, column: 36)
!57 = !DILocation(line: 0, scope: !55)
!58 = !DILocation(line: 13, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !3, line: 13, column: 9)
!60 = !DILocation(line: 13, column: 9, scope: !55)
!61 = !DILocation(line: 14, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !3, line: 13, column: 33)
!63 = !DILocalVariable(name: "m", scope: !22, file: !3, line: 9, type: !15)
!64 = !DILocation(line: 15, column: 26, scope: !62)
!65 = !DILocation(line: 15, column: 15, scope: !62)
!66 = !DILocation(line: 15, column: 23, scope: !62)
!67 = !DILocation(line: 16, column: 8, scope: !62)
!68 = !DILocation(line: 16, column: 15, scope: !62)
!69 = !DILocation(line: 17, column: 8, scope: !62)
!70 = !DILocation(line: 17, column: 16, scope: !62)
!71 = !DILocation(line: 18, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !62, file: !3, line: 18, column: 17)
!73 = !DILocation(line: 18, column: 28, scope: !72)
!74 = !DILocation(line: 18, column: 17, scope: !62)
!75 = !{!"if"}
!76 = !DILocation(line: 19, column: 45, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !3, line: 18, column: 35)
!78 = !DILocation(line: 19, column: 17, scope: !77)
!79 = !DILocation(line: 20, column: 17, scope: !77)
!80 = !DILocation(line: 22, column: 19, scope: !81)
!81 = distinct !DILexicalBlock(scope: !62, file: !3, line: 22, column: 17)
!82 = !DILocation(line: 22, column: 27, scope: !81)
!83 = !DILocation(line: 22, column: 17, scope: !62)
!84 = !DILocation(line: 23, column: 40, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !3, line: 22, column: 33)
!86 = !DILocation(line: 23, column: 17, scope: !85)
!87 = !DILocation(line: 24, column: 18, scope: !85)
!88 = !DILocation(line: 25, column: 13, scope: !85)
!89 = !DILocation(line: 26, column: 9, scope: !62)
!90 = !DILocation(line: 13, column: 29, scope: !59)
!91 = !DILocation(line: 13, column: 9, scope: !59)
!92 = distinct !{!92, !60, !93}
!93 = !DILocation(line: 26, column: 9, scope: !55)
!94 = !DILocation(line: 27, column: 5, scope: !56)
!95 = !DILocation(line: 12, column: 32, scope: !51)
!96 = !DILocation(line: 12, column: 5, scope: !51)
!97 = distinct !{!97, !52, !98}
!98 = !DILocation(line: 27, column: 5, scope: !47)
!99 = !DILocation(line: 28, column: 5, scope: !22)
!100 = !DILocation(line: 29, column: 5, scope: !22)
