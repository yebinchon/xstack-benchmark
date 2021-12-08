; ModuleID = 'binary-digits.bc'
source_filename = "binary-digits.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i64, align 8
  %binstr = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %i, metadata !13, metadata !DIExpression()), !dbg !18
  store i64 0, i64* %i, align 8, !dbg !18
  br label %for.cond, !dbg !19

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !20
  %cmp = icmp ult i64 %0, 20, !dbg !22
  br i1 %cmp, label %for.body, label %for.end, !dbg !23

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8** %binstr, metadata !24, metadata !DIExpression()), !dbg !28
  %1 = load i64, i64* %i, align 8, !dbg !29
  %conv = trunc i64 %1 to i32, !dbg !29
  %call = call i8* @bin(i32 %conv), !dbg !30
  store i8* %call, i8** %binstr, align 8, !dbg !28
  %2 = load i8*, i8** %binstr, align 8, !dbg !31
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* %2), !dbg !32
  %3 = load i8*, i8** %binstr, align 8, !dbg !33
  call void @free(i8* %3) #4, !dbg !34
  br label %for.inc, !dbg !35

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !36
  %inc = add i64 %4, 1, !dbg !36
  store i64 %inc, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !37, !llvm.loop !38

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %retval, align 4, !dbg !40
  ret i32 %5, !dbg !40
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @bin(i32 %x) #0 !dbg !41 {
entry:
  %x.addr = alloca i32, align 4
  %bits = alloca i64, align 8
  %ret = alloca i8*, align 8
  %i = alloca i64, align 8
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %bits, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32, i32* %x.addr, align 4, !dbg !53
  %cmp = icmp eq i32 %0, 0, !dbg !54
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !55

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !55

cond.false:                                       ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4, !dbg !56
  %conv = uitofp i32 %1 to double, !dbg !57
  %call = call double @log10(double %conv) #4, !dbg !58
  %call1 = call double @log10(double 2.000000e+00) #4, !dbg !59
  %div = fdiv double %call, %call1, !dbg !60
  %add = fadd double %div, 1.000000e+00, !dbg !61
  br label %cond.end, !dbg !55

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ 1.000000e+00, %cond.true ], [ %add, %cond.false ], !dbg !55
  %conv2 = fptoui double %cond to i64, !dbg !55
  store i64 %conv2, i64* %bits, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata i8** %ret, metadata !62, metadata !DIExpression()), !dbg !63
  %2 = load i64, i64* %bits, align 8, !dbg !64
  %add3 = add i64 %2, 1, !dbg !65
  %mul = mul i64 %add3, 1, !dbg !66
  %call4 = call noalias i8* @malloc(i64 %mul) #4, !dbg !67
  store i8* %call4, i8** %ret, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i64* %i, metadata !68, metadata !DIExpression()), !dbg !70
  store i64 0, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %cond.end
  %3 = load i64, i64* %i, align 8, !dbg !72
  %4 = load i64, i64* %bits, align 8, !dbg !74
  %cmp5 = icmp ult i64 %3, %4, !dbg !75
  br i1 %cmp5, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %x.addr, align 4, !dbg !77
  %and = and i32 %5, 1, !dbg !79
  %tobool = icmp ne i32 %and, 0, !dbg !80
  %6 = zext i1 %tobool to i64, !dbg !80
  %cond7 = select i1 %tobool, i32 49, i32 48, !dbg !80
  %conv8 = trunc i32 %cond7 to i8, !dbg !80
  %7 = load i8*, i8** %ret, align 8, !dbg !81
  %8 = load i64, i64* %bits, align 8, !dbg !82
  %9 = load i64, i64* %i, align 8, !dbg !83
  %sub = sub i64 %8, %9, !dbg !84
  %sub9 = sub i64 %sub, 1, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %sub9, !dbg !81
  store i8 %conv8, i8* %arrayidx, align 1, !dbg !86
  %10 = load i32, i32* %x.addr, align 4, !dbg !87
  %shr = lshr i32 %10, 1, !dbg !87
  store i32 %shr, i32* %x.addr, align 4, !dbg !87
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !89
  %inc = add i64 %11, 1, !dbg !89
  store i64 %inc, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !90, !llvm.loop !91

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %ret, align 8, !dbg !93
  %13 = load i64, i64* %bits, align 8, !dbg !94
  %arrayidx10 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !93
  store i8 0, i8* %arrayidx10, align 1, !dbg !95
  %14 = load i8*, i8** %ret, align 8, !dbg !96
  ret i8* %14, !dbg !97
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: nounwind
declare dso_local double @log10(double) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "binary-digits.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Binary-digits")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !10, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "i", scope: !14, file: !1, line: 10, type: !15)
!14 = distinct !DILexicalBlock(scope: !9, file: !1, line: 10, column: 5)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !17)
!16 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!17 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!18 = !DILocation(line: 10, column: 17, scope: !14)
!19 = !DILocation(line: 10, column: 10, scope: !14)
!20 = !DILocation(line: 10, column: 24, scope: !21)
!21 = distinct !DILexicalBlock(scope: !14, file: !1, line: 10, column: 5)
!22 = !DILocation(line: 10, column: 26, scope: !21)
!23 = !DILocation(line: 10, column: 5, scope: !14)
!24 = !DILocalVariable(name: "binstr", scope: !25, file: !1, line: 11, type: !26)
!25 = distinct !DILexicalBlock(scope: !21, file: !1, line: 10, column: 37)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !DILocation(line: 11, column: 15, scope: !25)
!29 = !DILocation(line: 11, column: 28, scope: !25)
!30 = !DILocation(line: 11, column: 24, scope: !25)
!31 = !DILocation(line: 12, column: 24, scope: !25)
!32 = !DILocation(line: 12, column: 9, scope: !25)
!33 = !DILocation(line: 13, column: 14, scope: !25)
!34 = !DILocation(line: 13, column: 9, scope: !25)
!35 = !DILocation(line: 14, column: 5, scope: !25)
!36 = !DILocation(line: 10, column: 33, scope: !21)
!37 = !DILocation(line: 10, column: 5, scope: !21)
!38 = distinct !{!38, !23, !39}
!39 = !DILocation(line: 14, column: 5, scope: !14)
!40 = !DILocation(line: 15, column: 1, scope: !9)
!41 = distinct !DISubprogram(name: "bin", scope: !1, file: !1, line: 17, type: !42, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!26, !44}
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !45, line: 26, baseType: !46)
!45 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !47, line: 42, baseType: !48)
!47 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!48 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!49 = !DILocalVariable(name: "x", arg: 1, scope: !41, file: !1, line: 17, type: !44)
!50 = !DILocation(line: 17, column: 20, scope: !41)
!51 = !DILocalVariable(name: "bits", scope: !41, file: !1, line: 19, type: !15)
!52 = !DILocation(line: 19, column: 12, scope: !41)
!53 = !DILocation(line: 19, column: 20, scope: !41)
!54 = !DILocation(line: 19, column: 22, scope: !41)
!55 = !DILocation(line: 19, column: 19, scope: !41)
!56 = !DILocation(line: 19, column: 49, scope: !41)
!57 = !DILocation(line: 19, column: 40, scope: !41)
!58 = !DILocation(line: 19, column: 34, scope: !41)
!59 = !DILocation(line: 19, column: 52, scope: !41)
!60 = !DILocation(line: 19, column: 51, scope: !41)
!61 = !DILocation(line: 19, column: 61, scope: !41)
!62 = !DILocalVariable(name: "ret", scope: !41, file: !1, line: 20, type: !26)
!63 = !DILocation(line: 20, column: 11, scope: !41)
!64 = !DILocation(line: 20, column: 25, scope: !41)
!65 = !DILocation(line: 20, column: 30, scope: !41)
!66 = !DILocation(line: 20, column: 35, scope: !41)
!67 = !DILocation(line: 20, column: 17, scope: !41)
!68 = !DILocalVariable(name: "i", scope: !69, file: !1, line: 21, type: !15)
!69 = distinct !DILexicalBlock(scope: !41, file: !1, line: 21, column: 5)
!70 = !DILocation(line: 21, column: 17, scope: !69)
!71 = !DILocation(line: 21, column: 10, scope: !69)
!72 = !DILocation(line: 21, column: 24, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !1, line: 21, column: 5)
!74 = !DILocation(line: 21, column: 28, scope: !73)
!75 = !DILocation(line: 21, column: 26, scope: !73)
!76 = !DILocation(line: 21, column: 5, scope: !69)
!77 = !DILocation(line: 22, column: 29, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !1, line: 21, column: 40)
!79 = !DILocation(line: 22, column: 31, scope: !78)
!80 = !DILocation(line: 22, column: 28, scope: !78)
!81 = !DILocation(line: 22, column: 8, scope: !78)
!82 = !DILocation(line: 22, column: 12, scope: !78)
!83 = !DILocation(line: 22, column: 19, scope: !78)
!84 = !DILocation(line: 22, column: 17, scope: !78)
!85 = !DILocation(line: 22, column: 21, scope: !78)
!86 = !DILocation(line: 22, column: 26, scope: !78)
!87 = !DILocation(line: 23, column: 10, scope: !78)
!88 = !DILocation(line: 24, column: 5, scope: !78)
!89 = !DILocation(line: 21, column: 36, scope: !73)
!90 = !DILocation(line: 21, column: 5, scope: !73)
!91 = distinct !{!91, !76, !92}
!92 = !DILocation(line: 24, column: 5, scope: !69)
!93 = !DILocation(line: 25, column: 5, scope: !41)
!94 = !DILocation(line: 25, column: 9, scope: !41)
!95 = !DILocation(line: 25, column: 15, scope: !41)
!96 = !DILocation(line: 26, column: 12, scope: !41)
!97 = !DILocation(line: 26, column: 5, scope: !41)
