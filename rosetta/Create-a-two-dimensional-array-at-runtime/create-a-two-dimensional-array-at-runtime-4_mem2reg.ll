; ModuleID = 'create-a-two-dimensional-array-at-runtime-4.ll'
source_filename = "create-a-two-dimensional-array-at-runtime-4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Enter size of array:  \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %user1 = alloca i32, align 4
  call void @llvm.dbg.value(metadata i32 %argc, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8** %argv, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %user1, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %user1, align 4, !dbg !18
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0)), !dbg !19
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* %user1), !dbg !20
  %0 = load i32, i32* %user1, align 4, !dbg !21
  %add = add nsw i32 %0, 1, !dbg !22
  %1 = load i32, i32* %user1, align 4, !dbg !23
  %mul = mul nsw i32 %add, %1, !dbg !24
  %div = sdiv i32 %mul, 2, !dbg !25
  call void @llvm.dbg.value(metadata i32 %div, metadata !26, metadata !DIExpression()), !dbg !15
  %conv = sext i32 %div to i64, !dbg !27
  %mul2 = mul i64 %conv, 4, !dbg !28
  %call3 = call noalias i8* @malloc(i64 %mul2) #4, !dbg !29
  %2 = bitcast i8* %call3 to i32*, !dbg !29
  call void @llvm.dbg.value(metadata i32* %2, metadata !30, metadata !DIExpression()), !dbg !15
  %3 = load i32, i32* %user1, align 4, !dbg !32
  %conv4 = sext i32 %3 to i64, !dbg !32
  %mul5 = mul i64 %conv4, 8, !dbg !33
  %call6 = call noalias i8* @malloc(i64 %mul5) #4, !dbg !34
  %4 = bitcast i8* %call6 to i32**, !dbg !34
  call void @llvm.dbg.value(metadata i32** %4, metadata !35, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !37, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !38, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc19, %entry
  %row.0 = phi i32 [ 0, %entry ], [ %inc22, %for.inc19 ], !dbg !41
  %offset.0 = phi i32 [ 0, %entry ], [ %add21, %for.inc19 ], !dbg !41
  call void @llvm.dbg.value(metadata i32 %offset.0, metadata !38, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %row.0, metadata !37, metadata !DIExpression()), !dbg !15
  %5 = load i32, i32* %user1, align 4, !dbg !42
  %cmp = icmp slt i32 %row.0, %5, !dbg !44
  br i1 %cmp, label %for.body, label %for.end23, !dbg !45

for.body:                                         ; preds = %for.cond
  %idx.ext = sext i32 %offset.0 to i64, !dbg !46
  %add.ptr = getelementptr inbounds i32, i32* %2, i64 %idx.ext, !dbg !46
  %idx.ext8 = sext i32 %row.0 to i64, !dbg !48
  %idx.neg = sub i64 0, %idx.ext8, !dbg !48
  %add.ptr9 = getelementptr inbounds i32, i32* %add.ptr, i64 %idx.neg, !dbg !48
  %idxprom = sext i32 %row.0 to i64, !dbg !49
  %arrayidx = getelementptr inbounds i32*, i32** %4, i64 %idxprom, !dbg !49
  store i32* %add.ptr9, i32** %arrayidx, align 8, !dbg !50
  call void @llvm.dbg.value(metadata i32 %row.0, metadata !51, metadata !DIExpression()), !dbg !15
  br label %for.cond10, !dbg !52

for.cond10:                                       ; preds = %for.inc, %for.body
  %col.0 = phi i32 [ %row.0, %for.body ], [ %inc, %for.inc ], !dbg !54
  call void @llvm.dbg.value(metadata i32 %col.0, metadata !51, metadata !DIExpression()), !dbg !15
  %6 = load i32, i32* %user1, align 4, !dbg !55
  %cmp11 = icmp slt i32 %col.0, %6, !dbg !57
  br i1 %cmp11, label %for.body13, label %for.end, !dbg !58

for.body13:                                       ; preds = %for.cond10
  %add14 = add nsw i32 1, %col.0, !dbg !59
  %sub = sub nsw i32 %add14, %row.0, !dbg !60
  %idxprom15 = sext i32 %row.0 to i64, !dbg !61
  %arrayidx16 = getelementptr inbounds i32*, i32** %4, i64 %idxprom15, !dbg !61
  %7 = load i32*, i32** %arrayidx16, align 8, !dbg !61
  %idxprom17 = sext i32 %col.0 to i64, !dbg !61
  %arrayidx18 = getelementptr inbounds i32, i32* %7, i64 %idxprom17, !dbg !61
  store i32 %sub, i32* %arrayidx18, align 4, !dbg !62
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body13
  %inc = add nsw i32 %col.0, 1, !dbg !63
  call void @llvm.dbg.value(metadata i32 %inc, metadata !51, metadata !DIExpression()), !dbg !15
  br label %for.cond10, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond10
  br label %for.inc19, !dbg !67

for.inc19:                                        ; preds = %for.end
  %8 = load i32, i32* %user1, align 4, !dbg !68
  %sub20 = sub nsw i32 %8, %row.0, !dbg !69
  %add21 = add nsw i32 %offset.0, %sub20, !dbg !70
  call void @llvm.dbg.value(metadata i32 %add21, metadata !38, metadata !DIExpression()), !dbg !15
  %inc22 = add nsw i32 %row.0, 1, !dbg !71
  call void @llvm.dbg.value(metadata i32 %inc22, metadata !37, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end23:                                        ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !37, metadata !DIExpression()), !dbg !15
  br label %for.cond24, !dbg !75

for.cond24:                                       ; preds = %for.inc34, %for.end23
  %row.1 = phi i32 [ 0, %for.end23 ], [ %inc35, %for.inc34 ], !dbg !77
  call void @llvm.dbg.value(metadata i32 %row.1, metadata !37, metadata !DIExpression()), !dbg !15
  %9 = load i32, i32* %user1, align 4, !dbg !78
  %cmp25 = icmp slt i32 %row.1, %9, !dbg !80
  br i1 %cmp25, label %for.body27, label %for.end36, !dbg !81

for.body27:                                       ; preds = %for.cond24
  %idxprom28 = sext i32 %row.1 to i64, !dbg !82
  %arrayidx29 = getelementptr inbounds i32*, i32** %4, i64 %idxprom28, !dbg !82
  %10 = load i32*, i32** %arrayidx29, align 8, !dbg !82
  %11 = load i32, i32* %user1, align 4, !dbg !83
  %sub30 = sub nsw i32 %11, 1, !dbg !84
  %idxprom31 = sext i32 %sub30 to i64, !dbg !82
  %arrayidx32 = getelementptr inbounds i32, i32* %10, i64 %idxprom31, !dbg !82
  %12 = load i32, i32* %arrayidx32, align 4, !dbg !82
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %12), !dbg !85
  br label %for.inc34, !dbg !85

for.inc34:                                        ; preds = %for.body27
  %inc35 = add nsw i32 %row.1, 1, !dbg !86
  call void @llvm.dbg.value(metadata i32 %inc35, metadata !37, metadata !DIExpression()), !dbg !15
  br label %for.cond24, !dbg !87, !llvm.loop !88

for.end36:                                        ; preds = %for.cond24
  %call37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  %13 = bitcast i32** %4 to i8*, !dbg !91
  call void @free(i8* %13) #4, !dbg !92
  %14 = bitcast i32* %2 to i8*, !dbg !93
  call void @free(i8* %14) #4, !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "create-a-two-dimensional-array-at-runtime-4.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Create-a-two-dimensional-array-at-runtime")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 3, type: !11)
!17 = !DILocalVariable(name: "user1", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 5, column: 8, scope: !7)
!19 = !DILocation(line: 10, column: 4, scope: !7)
!20 = !DILocation(line: 11, column: 4, scope: !7)
!21 = !DILocation(line: 13, column: 20, scope: !7)
!22 = !DILocation(line: 13, column: 25, scope: !7)
!23 = !DILocation(line: 13, column: 29, scope: !7)
!24 = !DILocation(line: 13, column: 28, scope: !7)
!25 = !DILocation(line: 13, column: 34, scope: !7)
!26 = !DILocalVariable(name: "space_needed", scope: !7, file: !1, line: 6, type: !10)
!27 = !DILocation(line: 14, column: 16, scope: !7)
!28 = !DILocation(line: 14, column: 29, scope: !7)
!29 = !DILocation(line: 14, column: 9, scope: !7)
!30 = !DILocalVariable(name: "a1", scope: !7, file: !1, line: 7, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!32 = !DILocation(line: 15, column: 19, scope: !7)
!33 = !DILocation(line: 15, column: 25, scope: !7)
!34 = !DILocation(line: 15, column: 12, scope: !7)
!35 = !DILocalVariable(name: "array", scope: !7, file: !1, line: 7, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!37 = !DILocalVariable(name: "row", scope: !7, file: !1, line: 8, type: !10)
!38 = !DILocalVariable(name: "offset", scope: !7, file: !1, line: 8, type: !10)
!39 = !DILocation(line: 16, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 4)
!41 = !DILocation(line: 0, scope: !40)
!42 = !DILocation(line: 16, column: 29, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 16, column: 4)
!44 = !DILocation(line: 16, column: 28, scope: !43)
!45 = !DILocation(line: 16, column: 4, scope: !40)
!46 = !DILocation(line: 17, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 16, column: 64)
!48 = !DILocation(line: 17, column: 27, scope: !47)
!49 = !DILocation(line: 17, column: 7, scope: !47)
!50 = !DILocation(line: 17, column: 17, scope: !47)
!51 = !DILocalVariable(name: "col", scope: !7, file: !1, line: 8, type: !10)
!52 = !DILocation(line: 18, column: 12, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !1, line: 18, column: 7)
!54 = !DILocation(line: 0, scope: !53)
!55 = !DILocation(line: 18, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !1, line: 18, column: 7)
!57 = !DILocation(line: 18, column: 24, scope: !56)
!58 = !DILocation(line: 18, column: 7, scope: !53)
!59 = !DILocation(line: 19, column: 30, scope: !56)
!60 = !DILocation(line: 19, column: 34, scope: !56)
!61 = !DILocation(line: 19, column: 11, scope: !56)
!62 = !DILocation(line: 19, column: 27, scope: !56)
!63 = !DILocation(line: 18, column: 35, scope: !56)
!64 = !DILocation(line: 18, column: 7, scope: !56)
!65 = distinct !{!65, !58, !66}
!66 = !DILocation(line: 19, column: 35, scope: !53)
!67 = !DILocation(line: 20, column: 4, scope: !47)
!68 = !DILocation(line: 16, column: 45, scope: !43)
!69 = !DILocation(line: 16, column: 50, scope: !43)
!70 = !DILocation(line: 16, column: 42, scope: !43)
!71 = !DILocation(line: 16, column: 60, scope: !43)
!72 = !DILocation(line: 16, column: 4, scope: !43)
!73 = distinct !{!73, !45, !74}
!74 = !DILocation(line: 20, column: 4, scope: !40)
!75 = !DILocation(line: 21, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 4)
!77 = !DILocation(line: 0, scope: !76)
!78 = !DILocation(line: 21, column: 20, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !1, line: 21, column: 4)
!80 = !DILocation(line: 21, column: 19, scope: !79)
!81 = !DILocation(line: 21, column: 4, scope: !76)
!82 = !DILocation(line: 22, column: 21, scope: !79)
!83 = !DILocation(line: 22, column: 32, scope: !79)
!84 = !DILocation(line: 22, column: 37, scope: !79)
!85 = !DILocation(line: 22, column: 7, scope: !79)
!86 = !DILocation(line: 21, column: 30, scope: !79)
!87 = !DILocation(line: 21, column: 4, scope: !79)
!88 = distinct !{!88, !81, !89}
!89 = !DILocation(line: 22, column: 40, scope: !76)
!90 = !DILocation(line: 23, column: 4, scope: !7)
!91 = !DILocation(line: 25, column: 9, scope: !7)
!92 = !DILocation(line: 25, column: 4, scope: !7)
!93 = !DILocation(line: 26, column: 9, scope: !7)
!94 = !DILocation(line: 26, column: 4, scope: !7)
!95 = !DILocation(line: 27, column: 4, scope: !7)
