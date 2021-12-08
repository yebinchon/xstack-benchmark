; ModuleID = 'binary-digits.ll'
source_filename = "binary-digits.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  call void @llvm.dbg.value(metadata i64 0, metadata !13, metadata !DIExpression()), !dbg !18
  br label %for.cond, !dbg !19

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %inc, %for.inc ], !dbg !18
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !13, metadata !DIExpression()), !dbg !18
  %cmp = icmp ult i64 %i.0, 20, !dbg !20
  br i1 %cmp, label %for.body, label %for.end, !dbg !22

for.body:                                         ; preds = %for.cond
  %conv = trunc i64 %i.0 to i32, !dbg !23
  %call = call i8* @bin(i32 %conv), !dbg !25
  call void @llvm.dbg.value(metadata i8* %call, metadata !26, metadata !DIExpression()), !dbg !29
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* %call), !dbg !30
  call void @free(i8* %call) #4, !dbg !31
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1, !dbg !33
  call void @llvm.dbg.value(metadata i64 %inc, metadata !13, metadata !DIExpression()), !dbg !18
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @bin(i32 %x) #0 !dbg !38 {
entry:
  call void @llvm.dbg.value(metadata i32 %x, metadata !46, metadata !DIExpression()), !dbg !47
  %cmp = icmp eq i32 %x, 0, !dbg !48
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !49

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !49

cond.false:                                       ; preds = %entry
  %conv = uitofp i32 %x to double, !dbg !50
  %call = call double @log10(double %conv) #4, !dbg !51
  %call1 = call double @log10(double 2.000000e+00) #4, !dbg !52
  %div = fdiv double %call, %call1, !dbg !53
  %add = fadd double %div, 1.000000e+00, !dbg !54
  br label %cond.end, !dbg !49

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ 1.000000e+00, %cond.true ], [ %add, %cond.false ], !dbg !49
  %conv2 = fptoui double %cond to i64, !dbg !49
  call void @llvm.dbg.value(metadata i64 %conv2, metadata !55, metadata !DIExpression()), !dbg !47
  %add3 = add i64 %conv2, 1, !dbg !56
  %mul = mul i64 %add3, 1, !dbg !57
  %call4 = call noalias i8* @malloc(i64 %mul) #4, !dbg !58
  call void @llvm.dbg.value(metadata i8* %call4, metadata !59, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i64 0, metadata !60, metadata !DIExpression()), !dbg !62
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %cond.end
  %i.0 = phi i64 [ 0, %cond.end ], [ %inc, %for.inc ], !dbg !62
  %x.addr.0 = phi i32 [ %x, %cond.end ], [ %shr, %for.inc ]
  call void @llvm.dbg.value(metadata i32 %x.addr.0, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !60, metadata !DIExpression()), !dbg !62
  %cmp5 = icmp ult i64 %i.0, %conv2, !dbg !64
  br i1 %cmp5, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %and = and i32 %x.addr.0, 1, !dbg !67
  %tobool = icmp ne i32 %and, 0, !dbg !69
  %0 = zext i1 %tobool to i64, !dbg !69
  %cond7 = select i1 %tobool, i32 49, i32 48, !dbg !69
  %conv8 = trunc i32 %cond7 to i8, !dbg !69
  %sub = sub i64 %conv2, %i.0, !dbg !70
  %sub9 = sub i64 %sub, 1, !dbg !71
  %arrayidx = getelementptr inbounds i8, i8* %call4, i64 %sub9, !dbg !72
  store i8 %conv8, i8* %arrayidx, align 1, !dbg !73
  %shr = lshr i32 %x.addr.0, 1, !dbg !74
  call void @llvm.dbg.value(metadata i32 %shr, metadata !46, metadata !DIExpression()), !dbg !47
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1, !dbg !76
  call void @llvm.dbg.value(metadata i64 %inc, metadata !60, metadata !DIExpression()), !dbg !62
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds i8, i8* %call4, i64 %conv2, !dbg !80
  store i8 0, i8* %arrayidx10, align 1, !dbg !81
  ret i8* %call4, !dbg !82
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: nounwind
declare dso_local double @log10(double) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!18 = !DILocation(line: 0, scope: !14)
!19 = !DILocation(line: 10, column: 10, scope: !14)
!20 = !DILocation(line: 10, column: 26, scope: !21)
!21 = distinct !DILexicalBlock(scope: !14, file: !1, line: 10, column: 5)
!22 = !DILocation(line: 10, column: 5, scope: !14)
!23 = !DILocation(line: 11, column: 28, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !1, line: 10, column: 37)
!25 = !DILocation(line: 11, column: 24, scope: !24)
!26 = !DILocalVariable(name: "binstr", scope: !24, file: !1, line: 11, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !DILocation(line: 0, scope: !24)
!30 = !DILocation(line: 12, column: 9, scope: !24)
!31 = !DILocation(line: 13, column: 9, scope: !24)
!32 = !DILocation(line: 14, column: 5, scope: !24)
!33 = !DILocation(line: 10, column: 33, scope: !21)
!34 = !DILocation(line: 10, column: 5, scope: !21)
!35 = distinct !{!35, !22, !36}
!36 = !DILocation(line: 14, column: 5, scope: !14)
!37 = !DILocation(line: 15, column: 1, scope: !9)
!38 = distinct !DISubprogram(name: "bin", scope: !1, file: !1, line: 17, type: !39, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!27, !41}
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !42, line: 26, baseType: !43)
!42 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !44, line: 42, baseType: !45)
!44 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!45 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!46 = !DILocalVariable(name: "x", arg: 1, scope: !38, file: !1, line: 17, type: !41)
!47 = !DILocation(line: 0, scope: !38)
!48 = !DILocation(line: 19, column: 22, scope: !38)
!49 = !DILocation(line: 19, column: 19, scope: !38)
!50 = !DILocation(line: 19, column: 40, scope: !38)
!51 = !DILocation(line: 19, column: 34, scope: !38)
!52 = !DILocation(line: 19, column: 52, scope: !38)
!53 = !DILocation(line: 19, column: 51, scope: !38)
!54 = !DILocation(line: 19, column: 61, scope: !38)
!55 = !DILocalVariable(name: "bits", scope: !38, file: !1, line: 19, type: !15)
!56 = !DILocation(line: 20, column: 30, scope: !38)
!57 = !DILocation(line: 20, column: 35, scope: !38)
!58 = !DILocation(line: 20, column: 17, scope: !38)
!59 = !DILocalVariable(name: "ret", scope: !38, file: !1, line: 20, type: !27)
!60 = !DILocalVariable(name: "i", scope: !61, file: !1, line: 21, type: !15)
!61 = distinct !DILexicalBlock(scope: !38, file: !1, line: 21, column: 5)
!62 = !DILocation(line: 0, scope: !61)
!63 = !DILocation(line: 21, column: 10, scope: !61)
!64 = !DILocation(line: 21, column: 26, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !1, line: 21, column: 5)
!66 = !DILocation(line: 21, column: 5, scope: !61)
!67 = !DILocation(line: 22, column: 31, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !1, line: 21, column: 40)
!69 = !DILocation(line: 22, column: 28, scope: !68)
!70 = !DILocation(line: 22, column: 17, scope: !68)
!71 = !DILocation(line: 22, column: 21, scope: !68)
!72 = !DILocation(line: 22, column: 8, scope: !68)
!73 = !DILocation(line: 22, column: 26, scope: !68)
!74 = !DILocation(line: 23, column: 10, scope: !68)
!75 = !DILocation(line: 24, column: 5, scope: !68)
!76 = !DILocation(line: 21, column: 36, scope: !65)
!77 = !DILocation(line: 21, column: 5, scope: !65)
!78 = distinct !{!78, !66, !79}
!79 = !DILocation(line: 24, column: 5, scope: !61)
!80 = !DILocation(line: 25, column: 5, scope: !38)
!81 = !DILocation(line: 25, column: 15, scope: !38)
!82 = !DILocation(line: 26, column: 5, scope: !38)
