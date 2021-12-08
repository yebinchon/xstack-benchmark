; ModuleID = 'closures-value-capture-1.ll'
source_filename = "closures-value-capture-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"mmap\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"func[%d]: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @_tmpl() #0 !dbg !13 {
entry:
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !16, metadata !DIExpression()), !dbg !18
  store volatile i32 -559038737, i32* %x, align 4, !dbg !18
  %0 = load volatile i32, i32* %x, align 4, !dbg !19
  %1 = load volatile i32, i32* %x, align 4, !dbg !20
  %mul = mul nsw i32 %0, %1, !dbg !21
  ret i32 %mul, !dbg !22
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 (...)* @dupf(i32 %v) #0 !dbg !23 {
entry:
  call void @llvm.dbg.value(metadata i32 %v, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i64 sub (i64 ptrtoint (i32 (...)* (i32)* @dupf to i64), i64 ptrtoint (i32 ()* @_tmpl to i64)), metadata !32, metadata !DIExpression()), !dbg !31
  %call = call i8* @mmap(i8* null, i64 sub (i64 ptrtoint (i32 (...)* (i32)* @dupf to i64), i64 ptrtoint (i32 ()* @_tmpl to i64)), i32 6, i32 34, i32 0, i64 0) #6, !dbg !36
  %0 = bitcast i8* %call to i32 (...)*, !dbg !36
  call void @llvm.dbg.value(metadata i32 (...)* %0, metadata !37, metadata !DIExpression()), !dbg !31
  %cmp = icmp eq i32 (...)* %0, inttoptr (i64 -1 to i32 (...)*), !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @perror(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !41
  call void @exit(i32 -1) #7, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %entry
  %1 = bitcast i32 (...)* %0 to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 4 bitcast (i32 ()* @_tmpl to i8*), i64 sub (i64 ptrtoint (i32 (...)* (i32)* @dupf to i64), i64 ptrtoint (i32 ()* @_tmpl to i64)), i1 false), !dbg !44
  %2 = bitcast i32 (...)* %0 to i8*, !dbg !45
  call void @llvm.dbg.value(metadata i8* %2, metadata !47, metadata !DIExpression()), !dbg !31
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end
  %p.0 = phi i8* [ %2, %if.end ], [ %incdec.ptr, %for.inc ], !dbg !49
  call void @llvm.dbg.value(metadata i8* %p.0, metadata !47, metadata !DIExpression()), !dbg !31
  %3 = bitcast i32 (...)* %0 to i8*, !dbg !50
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 sub (i64 ptrtoint (i32 (...)* (i32)* @dupf to i64), i64 ptrtoint (i32 ()* @_tmpl to i64)), !dbg !52
  %add.ptr1 = getelementptr inbounds i8, i8* %add.ptr, i64 -4, !dbg !53
  %cmp2 = icmp ult i8* %p.0, %add.ptr1, !dbg !54
  br i1 %cmp2, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %4 = bitcast i8* %p.0 to i32*, !dbg !56
  %5 = load i32, i32* %4, align 4, !dbg !56
  %cmp3 = icmp eq i32 %5, -559038737, !dbg !58
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !59

if.then4:                                         ; preds = %for.body
  %6 = bitcast i8* %p.0 to i32*, !dbg !60
  store i32 %v, i32* %6, align 4, !dbg !61
  br label %if.end5, !dbg !60

if.end5:                                          ; preds = %if.then4, %for.body
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %if.end5
  %incdec.ptr = getelementptr inbounds i8, i8* %p.0, i32 1, !dbg !63
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !47, metadata !DIExpression()), !dbg !31
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  ret i32 (...)* %0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local i8* @mmap(i8*, i64, i32, i32, i32, i64) #2

declare dso_local void @perror(i8*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !68 {
entry:
  %funcs = alloca [10 x i32 (...)*], align 16
  call void @llvm.dbg.declare(metadata [10 x i32 (...)*]* %funcs, metadata !69, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 0, metadata !74, metadata !DIExpression()), !dbg !75
  br label %for.cond, !dbg !76

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !78
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !74, metadata !DIExpression()), !dbg !75
  %cmp = icmp slt i32 %i.0, 10, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %call = call i32 (...)* @dupf(i32 %i.0), !dbg !82
  %idxprom = sext i32 %i.0 to i64, !dbg !83
  %arrayidx = getelementptr inbounds [10 x i32 (...)*], [10 x i32 (...)*]* %funcs, i64 0, i64 %idxprom, !dbg !83
  store i32 (...)* %call, i32 (...)** %arrayidx, align 8, !dbg !84
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !85
  call void @llvm.dbg.value(metadata i32 %inc, metadata !74, metadata !DIExpression()), !dbg !75
  br label %for.cond, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !74, metadata !DIExpression()), !dbg !75
  br label %for.cond1, !dbg !89

for.cond1:                                        ; preds = %for.inc8, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc9, %for.inc8 ], !dbg !91
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !74, metadata !DIExpression()), !dbg !75
  %cmp2 = icmp slt i32 %i.1, 9, !dbg !92
  br i1 %cmp2, label %for.body3, label %for.end10, !dbg !94

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %i.1 to i64, !dbg !95
  %arrayidx5 = getelementptr inbounds [10 x i32 (...)*], [10 x i32 (...)*]* %funcs, i64 0, i64 %idxprom4, !dbg !95
  %0 = load i32 (...)*, i32 (...)** %arrayidx5, align 8, !dbg !95
  %call6 = call i32 (...) %0(), !dbg !95
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %i.1, i32 %call6), !dbg !96
  br label %for.inc8, !dbg !96

for.inc8:                                         ; preds = %for.body3
  %inc9 = add nsw i32 %i.1, 1, !dbg !97
  call void @llvm.dbg.value(metadata i32 %inc9, metadata !74, metadata !DIExpression()), !dbg !75
  br label %for.cond1, !dbg !98, !llvm.loop !99

for.end10:                                        ; preds = %for.cond1
  ret i32 0, !dbg !101
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "closures-value-capture-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Closures-Value-capture")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!13 = distinct !DISubprogram(name: "_tmpl", scope: !1, file: !1, line: 9, type: !14, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{!8}
!16 = !DILocalVariable(name: "x", scope: !13, file: !1, line: 10, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !8)
!18 = !DILocation(line: 10, column: 15, scope: !13)
!19 = !DILocation(line: 11, column: 9, scope: !13)
!20 = !DILocation(line: 11, column: 13, scope: !13)
!21 = !DILocation(line: 11, column: 11, scope: !13)
!22 = !DILocation(line: 11, column: 2, scope: !13)
!23 = distinct !DISubprogram(name: "dupf", scope: !1, file: !1, line: 16, type: !24, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !8}
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "f_int", file: !1, line: 6, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DISubroutineType(types: !29)
!29 = !{!8, null}
!30 = !DILocalVariable(name: "v", arg: 1, scope: !23, file: !1, line: 16, type: !8)
!31 = !DILocation(line: 0, scope: !23)
!32 = !DILocalVariable(name: "len", scope: !23, file: !1, line: 18, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 19, column: 14, scope: !23)
!37 = !DILocalVariable(name: "ret", scope: !23, file: !1, line: 19, type: !26)
!38 = !DILocation(line: 21, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !23, file: !1, line: 21, column: 5)
!40 = !DILocation(line: 21, column: 5, scope: !23)
!41 = !DILocation(line: 22, column: 3, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !1, line: 21, column: 24)
!43 = !DILocation(line: 23, column: 3, scope: !42)
!44 = !DILocation(line: 25, column: 2, scope: !23)
!45 = !DILocation(line: 26, column: 11, scope: !46)
!46 = distinct !DILexicalBlock(scope: !23, file: !1, line: 26, column: 2)
!47 = !DILocalVariable(name: "p", scope: !23, file: !1, line: 20, type: !5)
!48 = !DILocation(line: 26, column: 7, scope: !46)
!49 = !DILocation(line: 0, scope: !46)
!50 = !DILocation(line: 26, column: 27, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !1, line: 26, column: 2)
!52 = !DILocation(line: 26, column: 38, scope: !51)
!53 = !DILocation(line: 26, column: 44, scope: !51)
!54 = !DILocation(line: 26, column: 25, scope: !51)
!55 = !DILocation(line: 26, column: 2, scope: !46)
!56 = !DILocation(line: 27, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !1, line: 27, column: 7)
!58 = !DILocation(line: 27, column: 17, scope: !57)
!59 = !DILocation(line: 27, column: 7, scope: !51)
!60 = !DILocation(line: 27, column: 25, scope: !57)
!61 = !DILocation(line: 27, column: 35, scope: !57)
!62 = !DILocation(line: 27, column: 20, scope: !57)
!63 = !DILocation(line: 26, column: 60, scope: !51)
!64 = !DILocation(line: 26, column: 2, scope: !51)
!65 = distinct !{!65, !55, !66}
!66 = !DILocation(line: 27, column: 37, scope: !46)
!67 = !DILocation(line: 28, column: 2, scope: !23)
!68 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 31, type: !14, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "funcs", scope: !68, file: !1, line: 33, type: !70)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 640, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 10)
!73 = !DILocation(line: 33, column: 8, scope: !68)
!74 = !DILocalVariable(name: "i", scope: !68, file: !1, line: 34, type: !8)
!75 = !DILocation(line: 0, scope: !68)
!76 = !DILocation(line: 35, column: 7, scope: !77)
!77 = distinct !DILexicalBlock(scope: !68, file: !1, line: 35, column: 2)
!78 = !DILocation(line: 0, scope: !77)
!79 = !DILocation(line: 35, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !1, line: 35, column: 2)
!81 = !DILocation(line: 35, column: 2, scope: !77)
!82 = !DILocation(line: 35, column: 38, scope: !80)
!83 = !DILocation(line: 35, column: 27, scope: !80)
!84 = !DILocation(line: 35, column: 36, scope: !80)
!85 = !DILocation(line: 35, column: 23, scope: !80)
!86 = !DILocation(line: 35, column: 2, scope: !80)
!87 = distinct !{!87, !81, !88}
!88 = !DILocation(line: 35, column: 44, scope: !77)
!89 = !DILocation(line: 37, column: 7, scope: !90)
!90 = distinct !DILexicalBlock(scope: !68, file: !1, line: 37, column: 2)
!91 = !DILocation(line: 0, scope: !90)
!92 = !DILocation(line: 37, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !1, line: 37, column: 2)
!94 = !DILocation(line: 37, column: 2, scope: !90)
!95 = !DILocation(line: 38, column: 31, scope: !93)
!96 = !DILocation(line: 38, column: 3, scope: !93)
!97 = !DILocation(line: 37, column: 22, scope: !93)
!98 = !DILocation(line: 37, column: 2, scope: !93)
!99 = distinct !{!99, !94, !100}
!100 = !DILocation(line: 38, column: 41, scope: !90)
!101 = !DILocation(line: 40, column: 2, scope: !68)
