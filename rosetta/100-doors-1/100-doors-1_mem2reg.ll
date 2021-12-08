; ModuleID = '100-doors-1.ll'
source_filename = "100-doors-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"door #%d is %s.\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"open\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"closed\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %is_open = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata [100 x i8]* %is_open, metadata !11, metadata !DIExpression()), !dbg !16
  %0 = bitcast [100 x i8]* %is_open to i8*, !dbg !16
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 100, i1 false), !dbg !16
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !18
  br label %for.cond, !dbg !19

for.cond:                                         ; preds = %for.inc7, %entry
  %pass.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc7 ], !dbg !21
  call void @llvm.dbg.value(metadata i32 %pass.0, metadata !17, metadata !DIExpression()), !dbg !18
  %cmp = icmp slt i32 %pass.0, 100, !dbg !22
  br i1 %cmp, label %for.body, label %for.end8, !dbg !24

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 %pass.0, metadata !25, metadata !DIExpression()), !dbg !18
  br label %for.cond1, !dbg !26

for.cond1:                                        ; preds = %for.inc, %for.body
  %door.0 = phi i32 [ %pass.0, %for.body ], [ %add6, %for.inc ], !dbg !28
  call void @llvm.dbg.value(metadata i32 %door.0, metadata !25, metadata !DIExpression()), !dbg !18
  %cmp2 = icmp slt i32 %door.0, 100, !dbg !29
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !31

for.body3:                                        ; preds = %for.cond1
  %idxprom = sext i32 %door.0 to i64, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %is_open, i64 0, i64 %idxprom, !dbg !32
  %1 = load i8, i8* %arrayidx, align 1, !dbg !32
  %tobool = icmp ne i8 %1, 0, !dbg !33
  %lnot = xor i1 %tobool, true, !dbg !33
  %lnot.ext = zext i1 %lnot to i32, !dbg !33
  %conv = trunc i32 %lnot.ext to i8, !dbg !33
  %idxprom4 = sext i32 %door.0 to i64, !dbg !34
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %is_open, i64 0, i64 %idxprom4, !dbg !34
  store i8 %conv, i8* %arrayidx5, align 1, !dbg !35
  br label %for.inc, !dbg !34

for.inc:                                          ; preds = %for.body3
  %add = add nsw i32 %pass.0, 1, !dbg !36
  %add6 = add nsw i32 %door.0, %add, !dbg !37
  call void @llvm.dbg.value(metadata i32 %add6, metadata !25, metadata !DIExpression()), !dbg !18
  br label %for.cond1, !dbg !38, !llvm.loop !39

for.end:                                          ; preds = %for.cond1
  br label %for.inc7, !dbg !40

for.inc7:                                         ; preds = %for.end
  %inc = add nsw i32 %pass.0, 1, !dbg !41
  call void @llvm.dbg.value(metadata i32 %inc, metadata !17, metadata !DIExpression()), !dbg !18
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end8:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !25, metadata !DIExpression()), !dbg !18
  br label %for.cond9, !dbg !45

for.cond9:                                        ; preds = %for.inc18, %for.end8
  %door.1 = phi i32 [ 0, %for.end8 ], [ %inc19, %for.inc18 ], !dbg !47
  call void @llvm.dbg.value(metadata i32 %door.1, metadata !25, metadata !DIExpression()), !dbg !18
  %cmp10 = icmp slt i32 %door.1, 100, !dbg !48
  br i1 %cmp10, label %for.body12, label %for.end20, !dbg !50

for.body12:                                       ; preds = %for.cond9
  %add13 = add nsw i32 %door.1, 1, !dbg !51
  %idxprom14 = sext i32 %door.1 to i64, !dbg !52
  %arrayidx15 = getelementptr inbounds [100 x i8], [100 x i8]* %is_open, i64 0, i64 %idxprom14, !dbg !52
  %2 = load i8, i8* %arrayidx15, align 1, !dbg !52
  %conv16 = sext i8 %2 to i32, !dbg !52
  %tobool17 = icmp ne i32 %conv16, 0, !dbg !52
  %3 = zext i1 %tobool17 to i64, !dbg !52
  %cond = select i1 %tobool17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), !dbg !52
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i32 %add13, i8* %cond), !dbg !53
  br label %for.inc18, !dbg !53

for.inc18:                                        ; preds = %for.body12
  %inc19 = add nsw i32 %door.1, 1, !dbg !54
  call void @llvm.dbg.value(metadata i32 %inc19, metadata !25, metadata !DIExpression()), !dbg !18
  br label %for.cond9, !dbg !55, !llvm.loop !56

for.end20:                                        ; preds = %for.cond9
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "100-doors-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/100-doors-1")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "is_open", scope: !7, file: !1, line: 5, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 800, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !DILocation(line: 5, column: 8, scope: !7)
!17 = !DILocalVariable(name: "pass", scope: !7, file: !1, line: 6, type: !10)
!18 = !DILocation(line: 0, scope: !7)
!19 = !DILocation(line: 9, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 3)
!21 = !DILocation(line: 0, scope: !20)
!22 = !DILocation(line: 9, column: 23, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !1, line: 9, column: 3)
!24 = !DILocation(line: 9, column: 3, scope: !20)
!25 = !DILocalVariable(name: "door", scope: !7, file: !1, line: 6, type: !10)
!26 = !DILocation(line: 10, column: 10, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !1, line: 10, column: 5)
!28 = !DILocation(line: 0, scope: !27)
!29 = !DILocation(line: 10, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !1, line: 10, column: 5)
!31 = !DILocation(line: 10, column: 5, scope: !27)
!32 = !DILocation(line: 11, column: 24, scope: !30)
!33 = !DILocation(line: 11, column: 23, scope: !30)
!34 = !DILocation(line: 11, column: 7, scope: !30)
!35 = !DILocation(line: 11, column: 21, scope: !30)
!36 = !DILocation(line: 10, column: 47, scope: !30)
!37 = !DILocation(line: 10, column: 40, scope: !30)
!38 = !DILocation(line: 10, column: 5, scope: !30)
!39 = distinct !{!39, !31, !40}
!40 = !DILocation(line: 11, column: 36, scope: !27)
!41 = !DILocation(line: 9, column: 30, scope: !23)
!42 = !DILocation(line: 9, column: 3, scope: !23)
!43 = distinct !{!43, !24, !44}
!44 = !DILocation(line: 11, column: 36, scope: !20)
!45 = !DILocation(line: 14, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 3)
!47 = !DILocation(line: 0, scope: !46)
!48 = !DILocation(line: 14, column: 23, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !1, line: 14, column: 3)
!50 = !DILocation(line: 14, column: 3, scope: !46)
!51 = !DILocation(line: 15, column: 37, scope: !49)
!52 = !DILocation(line: 15, column: 42, scope: !49)
!53 = !DILocation(line: 15, column: 5, scope: !49)
!54 = !DILocation(line: 14, column: 30, scope: !49)
!55 = !DILocation(line: 14, column: 3, scope: !49)
!56 = distinct !{!56, !50, !57}
!57 = !DILocation(line: 15, column: 75, scope: !46)
!58 = !DILocation(line: 17, column: 3, scope: !7)
