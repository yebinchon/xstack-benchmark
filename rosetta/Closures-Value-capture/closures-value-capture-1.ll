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
  %v.addr = alloca i32, align 4
  %len = alloca i64, align 8
  %ret = alloca i32 (...)*, align 8
  %p = alloca i8*, align 8
  store i32 %v, i32* %v.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %v.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %len, metadata !32, metadata !DIExpression()), !dbg !36
  store i64 sub (i64 ptrtoint (i32 (...)* (i32)* @dupf to i64), i64 ptrtoint (i32 ()* @_tmpl to i64)), i64* %len, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32 (...)** %ret, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i64, i64* %len, align 8, !dbg !39
  %call = call i8* @mmap(i8* null, i64 %0, i32 6, i32 34, i32 0, i64 0) #6, !dbg !40
  %1 = bitcast i8* %call to i32 (...)*, !dbg !40
  store i32 (...)* %1, i32 (...)** %ret, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %p, metadata !41, metadata !DIExpression()), !dbg !42
  %2 = load i32 (...)*, i32 (...)** %ret, align 8, !dbg !43
  %cmp = icmp eq i32 (...)* %2, inttoptr (i64 -1 to i32 (...)*), !dbg !45
  br i1 %cmp, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  call void @perror(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !47
  call void @exit(i32 -1) #7, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  %3 = load i32 (...)*, i32 (...)** %ret, align 8, !dbg !50
  %4 = bitcast i32 (...)* %3 to i8*, !dbg !51
  %5 = load i64, i64* %len, align 8, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 bitcast (i32 ()* @_tmpl to i8*), i64 %5, i1 false), !dbg !51
  %6 = load i32 (...)*, i32 (...)** %ret, align 8, !dbg !53
  %7 = bitcast i32 (...)* %6 to i8*, !dbg !55
  store i8* %7, i8** %p, align 8, !dbg !56
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i8*, i8** %p, align 8, !dbg !58
  %9 = load i32 (...)*, i32 (...)** %ret, align 8, !dbg !60
  %10 = bitcast i32 (...)* %9 to i8*, !dbg !61
  %11 = load i64, i64* %len, align 8, !dbg !62
  %add.ptr = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !63
  %add.ptr1 = getelementptr inbounds i8, i8* %add.ptr, i64 -4, !dbg !64
  %cmp2 = icmp ult i8* %8, %add.ptr1, !dbg !65
  br i1 %cmp2, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %12 = load i8*, i8** %p, align 8, !dbg !67
  %13 = bitcast i8* %12 to i32*, !dbg !69
  %14 = load i32, i32* %13, align 4, !dbg !69
  %cmp3 = icmp eq i32 %14, -559038737, !dbg !70
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !71

if.then4:                                         ; preds = %for.body
  %15 = load i32, i32* %v.addr, align 4, !dbg !72
  %16 = load i8*, i8** %p, align 8, !dbg !73
  %17 = bitcast i8* %16 to i32*, !dbg !74
  store i32 %15, i32* %17, align 4, !dbg !75
  br label %if.end5, !dbg !74

if.end5:                                          ; preds = %if.then4, %for.body
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %if.end5
  %18 = load i8*, i8** %p, align 8, !dbg !77
  %incdec.ptr = getelementptr inbounds i8, i8* %18, i32 1, !dbg !77
  store i8* %incdec.ptr, i8** %p, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %19 = load i32 (...)*, i32 (...)** %ret, align 8, !dbg !81
  ret i32 (...)* %19, !dbg !82
}

; Function Attrs: nounwind
declare dso_local i8* @mmap(i8*, i64, i32, i32, i32, i64) #2

declare dso_local void @perror(i8*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %funcs = alloca [10 x i32 (...)*], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32 (...)*]* %funcs, metadata !84, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32* %i, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 0, i32* %i, align 4, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !94
  %cmp = icmp slt i32 %0, 10, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !98
  %call = call i32 (...)* @dupf(i32 %1), !dbg !99
  %2 = load i32, i32* %i, align 4, !dbg !100
  %idxprom = sext i32 %2 to i64, !dbg !101
  %arrayidx = getelementptr inbounds [10 x i32 (...)*], [10 x i32 (...)*]* %funcs, i64 0, i64 %idxprom, !dbg !101
  store i32 (...)* %call, i32 (...)** %arrayidx, align 8, !dbg !102
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !103
  %inc = add nsw i32 %3, 1, !dbg !103
  store i32 %inc, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !107
  br label %for.cond1, !dbg !109

for.cond1:                                        ; preds = %for.inc8, %for.end
  %4 = load i32, i32* %i, align 4, !dbg !110
  %cmp2 = icmp slt i32 %4, 9, !dbg !112
  br i1 %cmp2, label %for.body3, label %for.end10, !dbg !113

for.body3:                                        ; preds = %for.cond1
  %5 = load i32, i32* %i, align 4, !dbg !114
  %6 = load i32, i32* %i, align 4, !dbg !115
  %idxprom4 = sext i32 %6 to i64, !dbg !116
  %arrayidx5 = getelementptr inbounds [10 x i32 (...)*], [10 x i32 (...)*]* %funcs, i64 0, i64 %idxprom4, !dbg !116
  %7 = load i32 (...)*, i32 (...)** %arrayidx5, align 8, !dbg !116
  %call6 = call i32 (...) %7(), !dbg !116
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %5, i32 %call6), !dbg !117
  br label %for.inc8, !dbg !117

for.inc8:                                         ; preds = %for.body3
  %8 = load i32, i32* %i, align 4, !dbg !118
  %inc9 = add nsw i32 %8, 1, !dbg !118
  store i32 %inc9, i32* %i, align 4, !dbg !118
  br label %for.cond1, !dbg !119, !llvm.loop !120

for.end10:                                        ; preds = %for.cond1
  ret i32 0, !dbg !122
}

declare dso_local i32 @printf(i8*, ...) #3

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
!31 = !DILocation(line: 16, column: 16, scope: !23)
!32 = !DILocalVariable(name: "len", scope: !23, file: !1, line: 18, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 18, column: 9, scope: !23)
!37 = !DILocalVariable(name: "ret", scope: !23, file: !1, line: 19, type: !26)
!38 = !DILocation(line: 19, column: 8, scope: !23)
!39 = !DILocation(line: 19, column: 25, scope: !23)
!40 = !DILocation(line: 19, column: 14, scope: !23)
!41 = !DILocalVariable(name: "p", scope: !23, file: !1, line: 20, type: !5)
!42 = !DILocation(line: 20, column: 8, scope: !23)
!43 = !DILocation(line: 21, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !23, file: !1, line: 21, column: 5)
!45 = !DILocation(line: 21, column: 9, scope: !44)
!46 = !DILocation(line: 21, column: 5, scope: !23)
!47 = !DILocation(line: 22, column: 3, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 21, column: 24)
!49 = !DILocation(line: 23, column: 3, scope: !48)
!50 = !DILocation(line: 25, column: 9, scope: !23)
!51 = !DILocation(line: 25, column: 2, scope: !23)
!52 = !DILocation(line: 25, column: 21, scope: !23)
!53 = !DILocation(line: 26, column: 18, scope: !54)
!54 = distinct !DILexicalBlock(scope: !23, file: !1, line: 26, column: 2)
!55 = !DILocation(line: 26, column: 11, scope: !54)
!56 = !DILocation(line: 26, column: 9, scope: !54)
!57 = !DILocation(line: 26, column: 7, scope: !54)
!58 = !DILocation(line: 26, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !1, line: 26, column: 2)
!60 = !DILocation(line: 26, column: 34, scope: !59)
!61 = !DILocation(line: 26, column: 27, scope: !59)
!62 = !DILocation(line: 26, column: 40, scope: !59)
!63 = !DILocation(line: 26, column: 38, scope: !59)
!64 = !DILocation(line: 26, column: 44, scope: !59)
!65 = !DILocation(line: 26, column: 25, scope: !59)
!66 = !DILocation(line: 26, column: 2, scope: !54)
!67 = !DILocation(line: 27, column: 15, scope: !68)
!68 = distinct !DILexicalBlock(scope: !59, file: !1, line: 27, column: 7)
!69 = !DILocation(line: 27, column: 7, scope: !68)
!70 = !DILocation(line: 27, column: 17, scope: !68)
!71 = !DILocation(line: 27, column: 7, scope: !59)
!72 = !DILocation(line: 27, column: 37, scope: !68)
!73 = !DILocation(line: 27, column: 33, scope: !68)
!74 = !DILocation(line: 27, column: 25, scope: !68)
!75 = !DILocation(line: 27, column: 35, scope: !68)
!76 = !DILocation(line: 27, column: 20, scope: !68)
!77 = !DILocation(line: 26, column: 60, scope: !59)
!78 = !DILocation(line: 26, column: 2, scope: !59)
!79 = distinct !{!79, !66, !80}
!80 = !DILocation(line: 27, column: 37, scope: !54)
!81 = !DILocation(line: 28, column: 9, scope: !23)
!82 = !DILocation(line: 28, column: 2, scope: !23)
!83 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 31, type: !14, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "funcs", scope: !83, file: !1, line: 33, type: !85)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 640, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 10)
!88 = !DILocation(line: 33, column: 8, scope: !83)
!89 = !DILocalVariable(name: "i", scope: !83, file: !1, line: 34, type: !8)
!90 = !DILocation(line: 34, column: 6, scope: !83)
!91 = !DILocation(line: 35, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !83, file: !1, line: 35, column: 2)
!93 = !DILocation(line: 35, column: 7, scope: !92)
!94 = !DILocation(line: 35, column: 14, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 35, column: 2)
!96 = !DILocation(line: 35, column: 16, scope: !95)
!97 = !DILocation(line: 35, column: 2, scope: !92)
!98 = !DILocation(line: 35, column: 43, scope: !95)
!99 = !DILocation(line: 35, column: 38, scope: !95)
!100 = !DILocation(line: 35, column: 33, scope: !95)
!101 = !DILocation(line: 35, column: 27, scope: !95)
!102 = !DILocation(line: 35, column: 36, scope: !95)
!103 = !DILocation(line: 35, column: 23, scope: !95)
!104 = !DILocation(line: 35, column: 2, scope: !95)
!105 = distinct !{!105, !97, !106}
!106 = !DILocation(line: 35, column: 44, scope: !92)
!107 = !DILocation(line: 37, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !83, file: !1, line: 37, column: 2)
!109 = !DILocation(line: 37, column: 7, scope: !108)
!110 = !DILocation(line: 37, column: 14, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !1, line: 37, column: 2)
!112 = !DILocation(line: 37, column: 16, scope: !111)
!113 = !DILocation(line: 37, column: 2, scope: !108)
!114 = !DILocation(line: 38, column: 28, scope: !111)
!115 = !DILocation(line: 38, column: 37, scope: !111)
!116 = !DILocation(line: 38, column: 31, scope: !111)
!117 = !DILocation(line: 38, column: 3, scope: !111)
!118 = !DILocation(line: 37, column: 22, scope: !111)
!119 = !DILocation(line: 37, column: 2, scope: !111)
!120 = distinct !{!120, !113, !121}
!121 = !DILocation(line: 38, column: 41, scope: !108)
!122 = !DILocation(line: 40, column: 2, scope: !83)
