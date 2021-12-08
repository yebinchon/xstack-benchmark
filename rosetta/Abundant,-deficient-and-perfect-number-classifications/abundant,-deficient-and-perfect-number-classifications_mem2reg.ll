; ModuleID = 'abundant,-deficient-and-perfect-number-classifications.ll'
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
  %count_list = alloca [3 x i32], align 4
  call void @llvm.dbg.value(metadata i32 0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 0, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata [3 x i32]* %count_list, metadata !14, metadata !DIExpression()), !dbg !18
  %0 = bitcast [3 x i32]* %count_list to i8*, !dbg !18
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([3 x i32]* @__const.main.count_list to i8*), i64 12, i1 false), !dbg !18
  call void @llvm.dbg.value(metadata i32 2, metadata !19, metadata !DIExpression()), !dbg !12
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.inc20, %entry
  %i.0 = phi i32 [ 2, %entry ], [ %inc21, %for.inc20 ], !dbg !22
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !19, metadata !DIExpression()), !dbg !12
  %cmp = icmp sle i32 %i.0, 20000, !dbg !23
  br i1 %cmp, label %for.body, label %for.end22, !dbg !25

for.body:                                         ; preds = %for.cond
  %div = sdiv i32 %i.0, 2, !dbg !26
  call void @llvm.dbg.value(metadata i32 %div, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 1, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 2, metadata !28, metadata !DIExpression()), !dbg !12
  br label %for.cond1, !dbg !29

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 2, %for.body ], [ %inc, %for.inc ], !dbg !31
  %sum.0 = phi i32 [ 1, %for.body ], [ %sum.2, %for.inc ], !dbg !32
  %try_max.0 = phi i32 [ %div, %for.body ], [ %try_max.1, %for.inc ], !dbg !33
  call void @llvm.dbg.value(metadata i32 %try_max.0, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !28, metadata !DIExpression()), !dbg !12
  %cmp2 = icmp slt i32 %j.0, %try_max.0, !dbg !34
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !36

for.body3:                                        ; preds = %for.cond1
  %rem = srem i32 %i.0, %j.0, !dbg !37
  %tobool = icmp ne i32 %rem, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %for.body3
  br label %for.inc, !dbg !41

if.end:                                           ; preds = %for.body3
  %div4 = sdiv i32 %i.0, %j.0, !dbg !42
  call void @llvm.dbg.value(metadata i32 %div4, metadata !13, metadata !DIExpression()), !dbg !12
  %add = add nsw i32 %sum.0, %j.0, !dbg !43
  call void @llvm.dbg.value(metadata i32 %add, metadata !11, metadata !DIExpression()), !dbg !12
  %cmp5 = icmp ne i32 %j.0, %div4, !dbg !44
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !46

if.then6:                                         ; preds = %if.end
  %add7 = add nsw i32 %add, %div4, !dbg !47
  call void @llvm.dbg.value(metadata i32 %add7, metadata !11, metadata !DIExpression()), !dbg !12
  br label %if.end8, !dbg !48

if.end8:                                          ; preds = %if.then6, %if.end
  %sum.1 = phi i32 [ %add7, %if.then6 ], [ %add, %if.end ], !dbg !49
  call void @llvm.dbg.value(metadata i32 %sum.1, metadata !11, metadata !DIExpression()), !dbg !12
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %if.end8, %if.then
  %sum.2 = phi i32 [ %sum.0, %if.then ], [ %sum.1, %if.end8 ], !dbg !51
  %try_max.1 = phi i32 [ %try_max.0, %if.then ], [ %div4, %if.end8 ], !dbg !51
  call void @llvm.dbg.value(metadata i32 %try_max.1, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %sum.2, metadata !11, metadata !DIExpression()), !dbg !12
  %inc = add nsw i32 %j.0, 1, !dbg !52
  call void @llvm.dbg.value(metadata i32 %inc, metadata !28, metadata !DIExpression()), !dbg !12
  br label %for.cond1, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond1
  %cmp9 = icmp slt i32 %sum.0, %i.0, !dbg !56
  br i1 %cmp9, label %if.then10, label %if.end12, !dbg !58

if.then10:                                        ; preds = %for.end
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 0, !dbg !59
  %1 = load i32, i32* %arrayidx, align 4, !dbg !61
  %inc11 = add nsw i32 %1, 1, !dbg !61
  store i32 %inc11, i32* %arrayidx, align 4, !dbg !61
  br label %for.inc20, !dbg !62

if.end12:                                         ; preds = %for.end
  %cmp13 = icmp sgt i32 %sum.0, %i.0, !dbg !63
  br i1 %cmp13, label %if.then14, label %if.end17, !dbg !65

if.then14:                                        ; preds = %if.end12
  %arrayidx15 = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 2, !dbg !66
  %2 = load i32, i32* %arrayidx15, align 4, !dbg !68
  %inc16 = add nsw i32 %2, 1, !dbg !68
  store i32 %inc16, i32* %arrayidx15, align 4, !dbg !68
  br label %for.inc20, !dbg !69

if.end17:                                         ; preds = %if.end12
  %arrayidx18 = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 1, !dbg !70
  %3 = load i32, i32* %arrayidx18, align 4, !dbg !71
  %inc19 = add nsw i32 %3, 1, !dbg !71
  store i32 %inc19, i32* %arrayidx18, align 4, !dbg !71
  br label %for.inc20, !dbg !72

for.inc20:                                        ; preds = %if.end17, %if.then14, %if.then10
  %inc21 = add nsw i32 %i.0, 1, !dbg !73
  call void @llvm.dbg.value(metadata i32 %inc21, metadata !19, metadata !DIExpression()), !dbg !12
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end22:                                        ; preds = %for.cond
  %arrayidx23 = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 0, !dbg !77
  %4 = load i32, i32* %arrayidx23, align 4, !dbg !77
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i32 %4), !dbg !78
  %arrayidx24 = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 1, !dbg !79
  %5 = load i32, i32* %arrayidx24, align 4, !dbg !79
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 %5), !dbg !80
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %count_list, i64 0, i64 2, !dbg !81
  %6 = load i32, i32* %arrayidx26, align 4, !dbg !81
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.2, i64 0, i64 0), i32 %6), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "abundant,-deficient-and-perfect-number-classifications.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Abundant,-deficient-and-perfect-number-classifications")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !8, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 7, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "try_max", scope: !7, file: !1, line: 8, type: !10)
!14 = !DILocalVariable(name: "count_list", scope: !7, file: !1, line: 10, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 96, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 3)
!18 = !DILocation(line: 10, column: 8, scope: !7)
!19 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 7, type: !10)
!20 = !DILocation(line: 11, column: 6, scope: !21)
!21 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 2)
!22 = !DILocation(line: 0, scope: !21)
!23 = !DILocation(line: 11, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !1, line: 11, column: 2)
!25 = !DILocation(line: 11, column: 2, scope: !21)
!26 = !DILocation(line: 13, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !1, line: 11, column: 27)
!28 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 7, type: !10)
!29 = !DILocation(line: 16, column: 7, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !1, line: 16, column: 3)
!31 = !DILocation(line: 0, scope: !30)
!32 = !DILocation(line: 15, column: 7, scope: !27)
!33 = !DILocation(line: 13, column: 11, scope: !27)
!34 = !DILocation(line: 16, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !30, file: !1, line: 16, column: 3)
!36 = !DILocation(line: 16, column: 3, scope: !30)
!37 = !DILocation(line: 18, column: 10, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 18, column: 8)
!39 = distinct !DILexicalBlock(scope: !35, file: !1, line: 16, column: 27)
!40 = !DILocation(line: 18, column: 8, scope: !39)
!41 = !DILocation(line: 19, column: 5, scope: !38)
!42 = !DILocation(line: 21, column: 15, scope: !39)
!43 = !DILocation(line: 23, column: 8, scope: !39)
!44 = !DILocation(line: 24, column: 10, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !1, line: 24, column: 8)
!46 = !DILocation(line: 24, column: 8, scope: !39)
!47 = !DILocation(line: 25, column: 9, scope: !45)
!48 = !DILocation(line: 25, column: 5, scope: !45)
!49 = !DILocation(line: 0, scope: !39)
!50 = !DILocation(line: 26, column: 3, scope: !39)
!51 = !DILocation(line: 0, scope: !27)
!52 = !DILocation(line: 16, column: 24, scope: !35)
!53 = !DILocation(line: 16, column: 3, scope: !35)
!54 = distinct !{!54, !36, !55}
!55 = !DILocation(line: 26, column: 3, scope: !30)
!56 = !DILocation(line: 28, column: 11, scope: !57)
!57 = distinct !DILexicalBlock(scope: !27, file: !1, line: 28, column: 7)
!58 = !DILocation(line: 28, column: 7, scope: !27)
!59 = !DILocation(line: 29, column: 4, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !1, line: 28, column: 15)
!61 = !DILocation(line: 29, column: 18, scope: !60)
!62 = !DILocation(line: 30, column: 4, scope: !60)
!63 = !DILocation(line: 32, column: 11, scope: !64)
!64 = distinct !DILexicalBlock(scope: !27, file: !1, line: 32, column: 7)
!65 = !DILocation(line: 32, column: 7, scope: !27)
!66 = !DILocation(line: 33, column: 4, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !1, line: 32, column: 15)
!68 = !DILocation(line: 33, column: 18, scope: !67)
!69 = !DILocation(line: 34, column: 4, scope: !67)
!70 = !DILocation(line: 36, column: 3, scope: !27)
!71 = !DILocation(line: 36, column: 17, scope: !27)
!72 = !DILocation(line: 37, column: 2, scope: !27)
!73 = !DILocation(line: 11, column: 24, scope: !24)
!74 = !DILocation(line: 11, column: 2, scope: !24)
!75 = distinct !{!75, !25, !76}
!76 = !DILocation(line: 37, column: 2, scope: !21)
!77 = !DILocation(line: 38, column: 38, scope: !7)
!78 = !DILocation(line: 38, column: 2, scope: !7)
!79 = !DILocation(line: 39, column: 25, scope: !7)
!80 = !DILocation(line: 39, column: 2, scope: !7)
!81 = !DILocation(line: 40, column: 56, scope: !7)
!82 = !DILocation(line: 40, column: 2, scope: !7)
!83 = !DILocation(line: 41, column: 1, scope: !7)
