; ModuleID = 'fizzbuzz-10.ll'
source_filename = "fizzbuzz-10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.f = private unnamed_addr constant [11 x i8] c"FizzBuzz%d\00", align 1
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %f = alloca [11 x i8], align 1
  call void @llvm.dbg.value(metadata i32 0, metadata !11, metadata !DIExpression()), !dbg !13
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !13
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !11, metadata !DIExpression()), !dbg !13
  %inc = add nsw i32 %i.0, 1, !dbg !15
  call void @llvm.dbg.value(metadata i32 %inc, metadata !11, metadata !DIExpression()), !dbg !13
  %cmp = icmp slt i32 %inc, 101, !dbg !17
  br i1 %cmp, label %for.body, label %for.end, !dbg !18

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %f, metadata !19, metadata !DIExpression()), !dbg !25
  %0 = bitcast [11 x i8]* %f to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.main.f, i32 0, i32 0), i64 11, i1 false), !dbg !25
  %rem = srem i32 %inc, 5, !dbg !26
  %sub = sub nsw i32 8, %rem, !dbg !27
  %and = and i32 %sub, 12, !dbg !28
  %idxprom = sext i32 %and to i64, !dbg !29
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %f, i64 0, i64 %idxprom, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %f, i64 0, i64 0, !dbg !31
  %sub1 = sub nsw i32 0, %inc, !dbg !32
  %rem2 = srem i32 %sub1, 3, !dbg !33
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %f, i64 0, i64 8, !dbg !34
  %1 = load i8, i8* %arrayidx3, align 1, !dbg !34
  %conv = sext i8 %1 to i32, !dbg !34
  %div = sdiv i32 %conv, 8, !dbg !35
  %add = add nsw i32 4, %div, !dbg !36
  %and4 = and i32 %rem2, %add, !dbg !37
  %idx.ext = sext i32 %and4 to i64, !dbg !38
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay, i64 %idx.ext, !dbg !38
  %call = call i32 (i8*, ...) @printf(i8* %add.ptr, i32 %inc), !dbg !39
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %call5 = call i32 @puts(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0)), !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !45
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @puts(i8*) #3

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
!1 = !DIFile(filename: "fizzbuzz-10.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/FizzBuzz")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 2, type: !8, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "i", scope: !12, file: !1, line: 4, type: !10)
!12 = distinct !DILexicalBlock(scope: !7, file: !1, line: 4, column: 5)
!13 = !DILocation(line: 0, scope: !12)
!14 = !DILocation(line: 4, column: 10, scope: !12)
!15 = !DILocation(line: 4, column: 18, scope: !16)
!16 = distinct !DILexicalBlock(scope: !12, file: !1, line: 4, column: 5)
!17 = !DILocation(line: 4, column: 21, scope: !16)
!18 = !DILocation(line: 4, column: 5, scope: !12)
!19 = !DILocalVariable(name: "f", scope: !20, file: !1, line: 6, type: !21)
!20 = distinct !DILexicalBlock(scope: !16, file: !1, line: 5, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 88, elements: !23)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !{!24}
!24 = !DISubrange(count: 11)
!25 = !DILocation(line: 6, column: 14, scope: !20)
!26 = !DILocation(line: 7, column: 14, scope: !20)
!27 = !DILocation(line: 7, column: 12, scope: !20)
!28 = !DILocation(line: 7, column: 16, scope: !20)
!29 = !DILocation(line: 7, column: 9, scope: !20)
!30 = !DILocation(line: 7, column: 20, scope: !20)
!31 = !DILocation(line: 8, column: 17, scope: !20)
!32 = !DILocation(line: 8, column: 20, scope: !20)
!33 = !DILocation(line: 8, column: 22, scope: !20)
!34 = !DILocation(line: 8, column: 27, scope: !20)
!35 = !DILocation(line: 8, column: 31, scope: !20)
!36 = !DILocation(line: 8, column: 26, scope: !20)
!37 = !DILocation(line: 8, column: 24, scope: !20)
!38 = !DILocation(line: 8, column: 18, scope: !20)
!39 = !DILocation(line: 8, column: 9, scope: !20)
!40 = !DILocation(line: 9, column: 5, scope: !20)
!41 = !DILocation(line: 4, column: 26, scope: !16)
!42 = !DILocation(line: 4, column: 5, scope: !16)
!43 = distinct !{!43, !18, !44}
!44 = !DILocation(line: 9, column: 5, scope: !12)
!45 = !DILocation(line: 10, column: 1, scope: !7)
