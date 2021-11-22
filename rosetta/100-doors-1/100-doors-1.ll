; ModuleID = '100-doors-1.c'
source_filename = "100-doors-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"door #%d is %s.\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"open\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"closed\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %is_open = alloca [100 x i8], align 16
  %pass = alloca i32, align 4
  %door = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [100 x i8]* %is_open, metadata !11, metadata !DIExpression()), !dbg !16
  %0 = bitcast [100 x i8]* %is_open to i8*, !dbg !16
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 100, i1 false), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %pass, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %door, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %pass, align 4, !dbg !21
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc7, %entry
  %1 = load i32, i32* %pass, align 4, !dbg !24
  %cmp = icmp slt i32 %1, 100, !dbg !26
  br i1 %cmp, label %for.body, label %for.end8, !dbg !27

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %pass, align 4, !dbg !28
  store i32 %2, i32* %door, align 4, !dbg !30
  br label %for.cond1, !dbg !31

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %door, align 4, !dbg !32
  %cmp2 = icmp slt i32 %3, 100, !dbg !34
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !35

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %door, align 4, !dbg !36
  %idxprom = sext i32 %4 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %is_open, i64 0, i64 %idxprom, !dbg !37
  %5 = load i8, i8* %arrayidx, align 1, !dbg !37
  %tobool = icmp ne i8 %5, 0, !dbg !38
  %lnot = xor i1 %tobool, true, !dbg !38
  %lnot.ext = zext i1 %lnot to i32, !dbg !38
  %conv = trunc i32 %lnot.ext to i8, !dbg !38
  %6 = load i32, i32* %door, align 4, !dbg !39
  %idxprom4 = sext i32 %6 to i64, !dbg !40
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %is_open, i64 0, i64 %idxprom4, !dbg !40
  store i8 %conv, i8* %arrayidx5, align 1, !dbg !41
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body3
  %7 = load i32, i32* %pass, align 4, !dbg !42
  %add = add nsw i32 %7, 1, !dbg !43
  %8 = load i32, i32* %door, align 4, !dbg !44
  %add6 = add nsw i32 %8, %add, !dbg !44
  store i32 %add6, i32* %door, align 4, !dbg !44
  br label %for.cond1, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond1
  br label %for.inc7, !dbg !47

for.inc7:                                         ; preds = %for.end
  %9 = load i32, i32* %pass, align 4, !dbg !48
  %inc = add nsw i32 %9, 1, !dbg !48
  store i32 %inc, i32* %pass, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end8:                                         ; preds = %for.cond
  store i32 0, i32* %door, align 4, !dbg !52
  br label %for.cond9, !dbg !54

for.cond9:                                        ; preds = %for.inc18, %for.end8
  %10 = load i32, i32* %door, align 4, !dbg !55
  %cmp10 = icmp slt i32 %10, 100, !dbg !57
  br i1 %cmp10, label %for.body12, label %for.end20, !dbg !58

for.body12:                                       ; preds = %for.cond9
  %11 = load i32, i32* %door, align 4, !dbg !59
  %add13 = add nsw i32 %11, 1, !dbg !60
  %12 = load i32, i32* %door, align 4, !dbg !61
  %idxprom14 = sext i32 %12 to i64, !dbg !62
  %arrayidx15 = getelementptr inbounds [100 x i8], [100 x i8]* %is_open, i64 0, i64 %idxprom14, !dbg !62
  %13 = load i8, i8* %arrayidx15, align 1, !dbg !62
  %conv16 = sext i8 %13 to i32, !dbg !62
  %tobool17 = icmp ne i32 %conv16, 0, !dbg !62
  %14 = zext i1 %tobool17 to i64, !dbg !62
  %cond = select i1 %tobool17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), !dbg !62
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i32 %add13, i8* %cond), !dbg !63
  br label %for.inc18, !dbg !63

for.inc18:                                        ; preds = %for.body12
  %15 = load i32, i32* %door, align 4, !dbg !64
  %inc19 = add nsw i32 %15, 1, !dbg !64
  store i32 %inc19, i32* %door, align 4, !dbg !64
  br label %for.cond9, !dbg !65, !llvm.loop !66

for.end20:                                        ; preds = %for.cond9
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

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
!18 = !DILocation(line: 6, column: 7, scope: !7)
!19 = !DILocalVariable(name: "door", scope: !7, file: !1, line: 6, type: !10)
!20 = !DILocation(line: 6, column: 13, scope: !7)
!21 = !DILocation(line: 9, column: 13, scope: !22)
!22 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 3)
!23 = !DILocation(line: 9, column: 8, scope: !22)
!24 = !DILocation(line: 9, column: 18, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !1, line: 9, column: 3)
!26 = !DILocation(line: 9, column: 23, scope: !25)
!27 = !DILocation(line: 9, column: 3, scope: !22)
!28 = !DILocation(line: 10, column: 17, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 10, column: 5)
!30 = !DILocation(line: 10, column: 15, scope: !29)
!31 = !DILocation(line: 10, column: 10, scope: !29)
!32 = !DILocation(line: 10, column: 23, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !1, line: 10, column: 5)
!34 = !DILocation(line: 10, column: 28, scope: !33)
!35 = !DILocation(line: 10, column: 5, scope: !29)
!36 = !DILocation(line: 11, column: 32, scope: !33)
!37 = !DILocation(line: 11, column: 24, scope: !33)
!38 = !DILocation(line: 11, column: 23, scope: !33)
!39 = !DILocation(line: 11, column: 15, scope: !33)
!40 = !DILocation(line: 11, column: 7, scope: !33)
!41 = !DILocation(line: 11, column: 21, scope: !33)
!42 = !DILocation(line: 10, column: 43, scope: !33)
!43 = !DILocation(line: 10, column: 47, scope: !33)
!44 = !DILocation(line: 10, column: 40, scope: !33)
!45 = !DILocation(line: 10, column: 5, scope: !33)
!46 = distinct !{!46, !35, !47}
!47 = !DILocation(line: 11, column: 36, scope: !29)
!48 = !DILocation(line: 9, column: 30, scope: !25)
!49 = !DILocation(line: 9, column: 3, scope: !25)
!50 = distinct !{!50, !27, !51}
!51 = !DILocation(line: 11, column: 36, scope: !22)
!52 = !DILocation(line: 14, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 3)
!54 = !DILocation(line: 14, column: 8, scope: !53)
!55 = !DILocation(line: 14, column: 18, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !1, line: 14, column: 3)
!57 = !DILocation(line: 14, column: 23, scope: !56)
!58 = !DILocation(line: 14, column: 3, scope: !53)
!59 = !DILocation(line: 15, column: 33, scope: !56)
!60 = !DILocation(line: 15, column: 37, scope: !56)
!61 = !DILocation(line: 15, column: 50, scope: !56)
!62 = !DILocation(line: 15, column: 42, scope: !56)
!63 = !DILocation(line: 15, column: 5, scope: !56)
!64 = !DILocation(line: 14, column: 30, scope: !56)
!65 = !DILocation(line: 14, column: 3, scope: !56)
!66 = distinct !{!66, !58, !67}
!67 = !DILocation(line: 15, column: 75, scope: !53)
!68 = !DILocation(line: 17, column: 3, scope: !7)
