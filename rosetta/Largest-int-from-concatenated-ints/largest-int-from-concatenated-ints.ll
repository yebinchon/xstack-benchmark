; ModuleID = 'largest-int-from-concatenated-ints.c'
source_filename = "largest-int-from-concatenated-ints.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@__const.main.x = private unnamed_addr constant [8 x i32] [i32 1, i32 34, i32 3, i32 98, i32 9, i32 76, i32 45, i32 4], align 16
@__const.main.y = private unnamed_addr constant [4 x i32] [i32 54, i32 546, i32 548, i32 60], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @catcmp(i8* %a, i8* %b) #0 !dbg !10 {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ab = alloca [32 x i8], align 16
  %ba = alloca [32 x i8], align 16
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [32 x i8]* %ab, metadata !19, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [32 x i8]* %ba, metadata !25, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %ab, i64 0, i64 0, !dbg !27
  %0 = load i8*, i8** %a.addr, align 8, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  %2 = load i32, i32* %1, align 4, !dbg !30
  %3 = load i8*, i8** %b.addr, align 8, !dbg !31
  %4 = bitcast i8* %3 to i32*, !dbg !32
  %5 = load i32, i32* %4, align 4, !dbg !33
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %2, i32 %5) #6, !dbg !34
  %arraydecay1 = getelementptr inbounds [32 x i8], [32 x i8]* %ba, i64 0, i64 0, !dbg !35
  %6 = load i8*, i8** %b.addr, align 8, !dbg !36
  %7 = bitcast i8* %6 to i32*, !dbg !37
  %8 = load i32, i32* %7, align 4, !dbg !38
  %9 = load i8*, i8** %a.addr, align 8, !dbg !39
  %10 = bitcast i8* %9 to i32*, !dbg !40
  %11 = load i32, i32* %10, align 4, !dbg !41
  %call2 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %8, i32 %11) #6, !dbg !42
  %arraydecay3 = getelementptr inbounds [32 x i8], [32 x i8]* %ba, i64 0, i64 0, !dbg !43
  %arraydecay4 = getelementptr inbounds [32 x i8], [32 x i8]* %ab, i64 0, i64 0, !dbg !44
  %call5 = call i32 @strcmp(i8* %arraydecay3, i8* %arraydecay4) #7, !dbg !45
  ret i32 %call5, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @maxcat(i32* %a, i32 %len) #0 !dbg !47 {
entry:
  %a.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %i, metadata !54, metadata !DIExpression()), !dbg !55
  %0 = load i32*, i32** %a.addr, align 8, !dbg !56
  %1 = bitcast i32* %0 to i8*, !dbg !56
  %2 = load i32, i32* %len.addr, align 4, !dbg !57
  %conv = sext i32 %2 to i64, !dbg !57
  call void @qsort(i8* %1, i64 %conv, i64 4, i32 (i8*, i8*)* @catcmp), !dbg !58
  store i32 0, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !62
  %4 = load i32, i32* %len.addr, align 4, !dbg !64
  %cmp = icmp slt i32 %3, %4, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %a.addr, align 8, !dbg !67
  %6 = load i32, i32* %i, align 4, !dbg !68
  %idxprom = sext i32 %6 to i64, !dbg !67
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !67
  %7 = load i32, i32* %arrayidx, align 4, !dbg !67
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %7), !dbg !69
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !70
  %inc = add nsw i32 %8, 1, !dbg !70
  store i32 %inc, i32* %i, align 4, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %call2 = call i32 @putchar(i32 10), !dbg !74
  ret void, !dbg !75
}

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #4

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @putchar(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %x = alloca [8 x i32], align 16
  %y = alloca [4 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [8 x i32]* %x, metadata !79, metadata !DIExpression()), !dbg !83
  %0 = bitcast [8 x i32]* %x to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([8 x i32]* @__const.main.x to i8*), i64 32, i1 false), !dbg !83
  call void @llvm.dbg.declare(metadata [4 x i32]* %y, metadata !84, metadata !DIExpression()), !dbg !88
  %1 = bitcast [4 x i32]* %y to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([4 x i32]* @__const.main.y to i8*), i64 16, i1 false), !dbg !88
  %arraydecay = getelementptr inbounds [8 x i32], [8 x i32]* %x, i64 0, i64 0, !dbg !89
  call void @maxcat(i32* %arraydecay, i32 8), !dbg !90
  %arraydecay1 = getelementptr inbounds [4 x i32], [4 x i32]* %y, i64 0, i64 0, !dbg !91
  call void @maxcat(i32* %arraydecay1, i32 4), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "largest-int-from-concatenated-ints.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Largest-int-from-concatenated-ints")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!10 = distinct !DISubprogram(name: "catcmp", scope: !1, file: !1, line: 5, type: !11, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!5, !13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!15 = !DILocalVariable(name: "a", arg: 1, scope: !10, file: !1, line: 5, type: !13)
!16 = !DILocation(line: 5, column: 24, scope: !10)
!17 = !DILocalVariable(name: "b", arg: 2, scope: !10, file: !1, line: 5, type: !13)
!18 = !DILocation(line: 5, column: 39, scope: !10)
!19 = !DILocalVariable(name: "ab", scope: !10, file: !1, line: 7, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 256, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 32)
!24 = !DILocation(line: 7, column: 7, scope: !10)
!25 = !DILocalVariable(name: "ba", scope: !10, file: !1, line: 7, type: !20)
!26 = !DILocation(line: 7, column: 15, scope: !10)
!27 = !DILocation(line: 8, column: 10, scope: !10)
!28 = !DILocation(line: 8, column: 29, scope: !10)
!29 = !DILocation(line: 8, column: 23, scope: !10)
!30 = !DILocation(line: 8, column: 22, scope: !10)
!31 = !DILocation(line: 8, column: 39, scope: !10)
!32 = !DILocation(line: 8, column: 33, scope: !10)
!33 = !DILocation(line: 8, column: 32, scope: !10)
!34 = !DILocation(line: 8, column: 2, scope: !10)
!35 = !DILocation(line: 9, column: 10, scope: !10)
!36 = !DILocation(line: 9, column: 29, scope: !10)
!37 = !DILocation(line: 9, column: 23, scope: !10)
!38 = !DILocation(line: 9, column: 22, scope: !10)
!39 = !DILocation(line: 9, column: 39, scope: !10)
!40 = !DILocation(line: 9, column: 33, scope: !10)
!41 = !DILocation(line: 9, column: 32, scope: !10)
!42 = !DILocation(line: 9, column: 2, scope: !10)
!43 = !DILocation(line: 10, column: 16, scope: !10)
!44 = !DILocation(line: 10, column: 20, scope: !10)
!45 = !DILocation(line: 10, column: 9, scope: !10)
!46 = !DILocation(line: 10, column: 2, scope: !10)
!47 = distinct !DISubprogram(name: "maxcat", scope: !1, file: !1, line: 13, type: !48, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !4, !5}
!50 = !DILocalVariable(name: "a", arg: 1, scope: !47, file: !1, line: 13, type: !4)
!51 = !DILocation(line: 13, column: 18, scope: !47)
!52 = !DILocalVariable(name: "len", arg: 2, scope: !47, file: !1, line: 13, type: !5)
!53 = !DILocation(line: 13, column: 25, scope: !47)
!54 = !DILocalVariable(name: "i", scope: !47, file: !1, line: 15, type: !5)
!55 = !DILocation(line: 15, column: 6, scope: !47)
!56 = !DILocation(line: 16, column: 8, scope: !47)
!57 = !DILocation(line: 16, column: 11, scope: !47)
!58 = !DILocation(line: 16, column: 2, scope: !47)
!59 = !DILocation(line: 17, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !47, file: !1, line: 17, column: 2)
!61 = !DILocation(line: 17, column: 7, scope: !60)
!62 = !DILocation(line: 17, column: 14, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !1, line: 17, column: 2)
!64 = !DILocation(line: 17, column: 18, scope: !63)
!65 = !DILocation(line: 17, column: 16, scope: !63)
!66 = !DILocation(line: 17, column: 2, scope: !60)
!67 = !DILocation(line: 18, column: 16, scope: !63)
!68 = !DILocation(line: 18, column: 18, scope: !63)
!69 = !DILocation(line: 18, column: 3, scope: !63)
!70 = !DILocation(line: 17, column: 24, scope: !63)
!71 = !DILocation(line: 17, column: 2, scope: !63)
!72 = distinct !{!72, !66, !73}
!73 = !DILocation(line: 18, column: 20, scope: !60)
!74 = !DILocation(line: 19, column: 2, scope: !47)
!75 = !DILocation(line: 20, column: 1, scope: !47)
!76 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 22, type: !77, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!5}
!79 = !DILocalVariable(name: "x", scope: !76, file: !1, line: 24, type: !80)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 256, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 8)
!83 = !DILocation(line: 24, column: 6, scope: !76)
!84 = !DILocalVariable(name: "y", scope: !76, file: !1, line: 25, type: !85)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 4)
!88 = !DILocation(line: 25, column: 6, scope: !76)
!89 = !DILocation(line: 27, column: 9, scope: !76)
!90 = !DILocation(line: 27, column: 2, scope: !76)
!91 = !DILocation(line: 28, column: 9, scope: !76)
!92 = !DILocation(line: 28, column: 2, scope: !76)
!93 = !DILocation(line: 30, column: 2, scope: !76)
