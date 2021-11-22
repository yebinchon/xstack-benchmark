; ModuleID = 'abundant,-deficient-and-perfect-number-classifications.c'
source_filename = "abundant,-deficient-and-perfect-number-classifications.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.count_list = private unnamed_addr constant [3 x i32] [i32 1, i32 0, i32 0], align 4
@.str = private unnamed_addr constant [25 x i8] c"\0AThere are %d deficient,\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c" %d perfect,\00", align 1
@.str.2 = private unnamed_addr constant [43 x i8] c" %d abundant numbers between 1 and 20000.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %try_max = alloca i32, align 4
  %count_list = alloca [3 x i32], align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 0, i32* %sum, align 4, !dbg !12
  call void @llvm.dbg.declare(metadata i32* %i, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %j, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %try_max, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %try_max, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata [3 x i32]* %count_list, metadata !19, metadata !DIExpression()), !dbg !23
  %0 = bitcast [3 x i32]* %count_list to i8*, !dbg !23
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([3 x i32]* @__const.main.count_list to i8*), i64 12, i1 false), !dbg !23
  store i32 2, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc20, %entry
  %1 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp sle i32 %1, 20000, !dbg !29
  br i1 %cmp, label %for.body, label %for.end22, !dbg !30

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !31
  %div = sdiv i32 %2, 2, !dbg !33
  store i32 %div, i32* %try_max, align 4, !dbg !34
  store i32 1, i32* %sum, align 4, !dbg !35
  store i32 2, i32* %j, align 4, !dbg !36
  br label %for.cond1, !dbg !38

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %j, align 4, !dbg !39
  %4 = load i32, i32* %try_max, align 4, !dbg !41
  %cmp2 = icmp slt i32 %3, %4, !dbg !42
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !43

for.body3:                                        ; preds = %for.cond1
  %5 = load i32, i32* %i, align 4, !dbg !44
  %6 = load i32, i32* %j, align 4, !dbg !47
  %rem = srem i32 %5, %6, !dbg !48
  %tobool = icmp ne i32 %rem, 0, !dbg !48
  br i1 %tobool, label %if.then, label %if.end, !dbg !49, !cf.info !50

if.then:                                          ; preds = %for.body3
  br label %for.inc, !dbg !51

if.end:                                           ; preds = %for.body3
  %7 = load i32, i32* %i, align 4, !dbg !52
  %8 = load i32, i32* %j, align 4, !dbg !53
  %div4 = sdiv i32 %7, %8, !dbg !54
  store i32 %div4, i32* %try_max, align 4, !dbg !55
  %9 = load i32, i32* %j, align 4, !dbg !56
  %10 = load i32, i32* %sum, align 4, !dbg !57
  %add = add nsw i32 %10, %9, !dbg !57
  store i32 %add, i32* %sum, align 4, !dbg !57
  %11 = load i32, i32* %j, align 4, !dbg !58
  %12 = load i32, i32* %try_max, align 4, !dbg !60
  %cmp5 = icmp ne i32 %11, %12, !dbg !61
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !62, !cf.info !50

if.then6:                                         ; preds = %if.end
  %13 = load i32, i32* %try_max, align 4, !dbg !63
  %14 = load i32, i32* %sum, align 4, !dbg !64
  %add7 = add nsw i32 %14, %13, !dbg !64
  store i32 %add7, i32* %sum, align 4, !dbg !64
  br label %if.end8, !dbg !65

if.end8:                                          ; preds = %if.then6, %if.end
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %if.end8, %if.then
  %15 = load i32, i32* %j, align 4, !dbg !67
  %inc = add nsw i32 %15, 1, !dbg !67
  store i32 %inc, i32* %j, align 4, !dbg !67
  br label %for.cond1, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond1
  %16 = load i32, i32* %sum, align 4, !dbg !71
  %17 = load i32, i32* %i, align 4, !dbg !73
  %cmp9 = icmp slt i32 %16, %17, !dbg !74
  br i1 %cmp9, label %if.then10, label %if.end12, !dbg !75, !cf.info !50

if.then10:                                        ; preds = %for.end
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 0, !dbg !76
  %18 = load i32, i32* %arrayidx, align 4, !dbg !78
  %inc11 = add nsw i32 %18, 1, !dbg !78
  store i32 %inc11, i32* %arrayidx, align 4, !dbg !78
  br label %for.inc20, !dbg !79

if.end12:                                         ; preds = %for.end
  %19 = load i32, i32* %sum, align 4, !dbg !80
  %20 = load i32, i32* %i, align 4, !dbg !82
  %cmp13 = icmp sgt i32 %19, %20, !dbg !83
  br i1 %cmp13, label %if.then14, label %if.end17, !dbg !84, !cf.info !50

if.then14:                                        ; preds = %if.end12
  %arrayidx15 = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 2, !dbg !85
  %21 = load i32, i32* %arrayidx15, align 4, !dbg !87
  %inc16 = add nsw i32 %21, 1, !dbg !87
  store i32 %inc16, i32* %arrayidx15, align 4, !dbg !87
  br label %for.inc20, !dbg !88

if.end17:                                         ; preds = %if.end12
  %arrayidx18 = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 1, !dbg !89
  %22 = load i32, i32* %arrayidx18, align 4, !dbg !90
  %inc19 = add nsw i32 %22, 1, !dbg !90
  store i32 %inc19, i32* %arrayidx18, align 4, !dbg !90
  br label %for.inc20, !dbg !91

for.inc20:                                        ; preds = %if.end17, %if.then14, %if.then10
  %23 = load i32, i32* %i, align 4, !dbg !92
  %inc21 = add nsw i32 %23, 1, !dbg !92
  store i32 %inc21, i32* %i, align 4, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end22:                                        ; preds = %for.cond
  %arrayidx23 = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 0, !dbg !96
  %24 = load i32, i32* %arrayidx23, align 4, !dbg !96
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i32 %24), !dbg !97
  %arrayidx24 = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 1, !dbg !98
  %25 = load i32, i32* %arrayidx24, align 4, !dbg !98
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 %25), !dbg !99
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 2, !dbg !100
  %26 = load i32, i32* %arrayidx26, align 4, !dbg !100
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.2, i64 0, i64 0), i32 %26), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "abundant,-deficient-and-perfect-number-classifications.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Abundant,-deficient-and-perfect-number-classifications")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !8, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 7, type: !10)
!12 = !DILocation(line: 7, column: 6, scope: !7)
!13 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 7, type: !10)
!14 = !DILocation(line: 7, column: 15, scope: !7)
!15 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocation(line: 7, column: 18, scope: !7)
!17 = !DILocalVariable(name: "try_max", scope: !7, file: !1, line: 8, type: !10)
!18 = !DILocation(line: 8, column: 6, scope: !7)
!19 = !DILocalVariable(name: "count_list", scope: !7, file: !1, line: 10, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 96, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 3)
!23 = !DILocation(line: 10, column: 8, scope: !7)
!24 = !DILocation(line: 11, column: 7, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 2)
!26 = !DILocation(line: 11, column: 6, scope: !25)
!27 = !DILocation(line: 11, column: 11, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 11, column: 2)
!29 = !DILocation(line: 11, column: 13, scope: !28)
!30 = !DILocation(line: 11, column: 2, scope: !25)
!31 = !DILocation(line: 13, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 11, column: 27)
!33 = !DILocation(line: 13, column: 14, scope: !32)
!34 = !DILocation(line: 13, column: 11, scope: !32)
!35 = !DILocation(line: 15, column: 7, scope: !32)
!36 = !DILocation(line: 16, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 16, column: 3)
!38 = !DILocation(line: 16, column: 7, scope: !37)
!39 = !DILocation(line: 16, column: 12, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 16, column: 3)
!41 = !DILocation(line: 16, column: 14, scope: !40)
!42 = !DILocation(line: 16, column: 13, scope: !40)
!43 = !DILocation(line: 16, column: 3, scope: !37)
!44 = !DILocation(line: 18, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !46, file: !1, line: 18, column: 8)
!46 = distinct !DILexicalBlock(scope: !40, file: !1, line: 16, column: 27)
!47 = !DILocation(line: 18, column: 12, scope: !45)
!48 = !DILocation(line: 18, column: 10, scope: !45)
!49 = !DILocation(line: 18, column: 8, scope: !46)
!50 = !{!"if"}
!51 = !DILocation(line: 19, column: 5, scope: !45)
!52 = !DILocation(line: 21, column: 14, scope: !46)
!53 = !DILocation(line: 21, column: 16, scope: !46)
!54 = !DILocation(line: 21, column: 15, scope: !46)
!55 = !DILocation(line: 21, column: 12, scope: !46)
!56 = !DILocation(line: 23, column: 11, scope: !46)
!57 = !DILocation(line: 23, column: 8, scope: !46)
!58 = !DILocation(line: 24, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !46, file: !1, line: 24, column: 8)
!60 = !DILocation(line: 24, column: 13, scope: !59)
!61 = !DILocation(line: 24, column: 10, scope: !59)
!62 = !DILocation(line: 24, column: 8, scope: !46)
!63 = !DILocation(line: 25, column: 12, scope: !59)
!64 = !DILocation(line: 25, column: 9, scope: !59)
!65 = !DILocation(line: 25, column: 5, scope: !59)
!66 = !DILocation(line: 26, column: 3, scope: !46)
!67 = !DILocation(line: 16, column: 24, scope: !40)
!68 = !DILocation(line: 16, column: 3, scope: !40)
!69 = distinct !{!69, !43, !70}
!70 = !DILocation(line: 26, column: 3, scope: !37)
!71 = !DILocation(line: 28, column: 7, scope: !72)
!72 = distinct !DILexicalBlock(scope: !32, file: !1, line: 28, column: 7)
!73 = !DILocation(line: 28, column: 13, scope: !72)
!74 = !DILocation(line: 28, column: 11, scope: !72)
!75 = !DILocation(line: 28, column: 7, scope: !32)
!76 = !DILocation(line: 29, column: 4, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !1, line: 28, column: 15)
!78 = !DILocation(line: 29, column: 18, scope: !77)
!79 = !DILocation(line: 30, column: 4, scope: !77)
!80 = !DILocation(line: 32, column: 7, scope: !81)
!81 = distinct !DILexicalBlock(scope: !32, file: !1, line: 32, column: 7)
!82 = !DILocation(line: 32, column: 13, scope: !81)
!83 = !DILocation(line: 32, column: 11, scope: !81)
!84 = !DILocation(line: 32, column: 7, scope: !32)
!85 = !DILocation(line: 33, column: 4, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 32, column: 15)
!87 = !DILocation(line: 33, column: 18, scope: !86)
!88 = !DILocation(line: 34, column: 4, scope: !86)
!89 = !DILocation(line: 36, column: 3, scope: !32)
!90 = !DILocation(line: 36, column: 17, scope: !32)
!91 = !DILocation(line: 37, column: 2, scope: !32)
!92 = !DILocation(line: 11, column: 24, scope: !28)
!93 = !DILocation(line: 11, column: 2, scope: !28)
!94 = distinct !{!94, !30, !95}
!95 = !DILocation(line: 37, column: 2, scope: !25)
!96 = !DILocation(line: 38, column: 38, scope: !7)
!97 = !DILocation(line: 38, column: 2, scope: !7)
!98 = !DILocation(line: 39, column: 25, scope: !7)
!99 = !DILocation(line: 39, column: 2, scope: !7)
!100 = !DILocation(line: 40, column: 56, scope: !7)
!101 = !DILocation(line: 40, column: 2, scope: !7)
!102 = !DILocation(line: 41, column: 1, scope: !7)
