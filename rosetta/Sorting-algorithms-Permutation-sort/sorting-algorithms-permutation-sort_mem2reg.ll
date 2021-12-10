; ModuleID = 'sorting-algorithms-permutation-sort.ll'
source_filename = "sorting-algorithms-permutation-sort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"spqr\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"giant squid\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"stuff\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"def\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @perm_sort(i8* %a, i32 %n, i64 %msize, i32 (i8*, i8*)* %_cmp) #0 !dbg !15 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 %n, metadata !30, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i64 %msize, metadata !31, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 (i8*, i8*)* %_cmp, metadata !32, metadata !DIExpression()), !dbg !29
  %call = call noalias i8* @malloc(i64 %msize) #6, !dbg !33
  call void @llvm.dbg.value(metadata i8* %call, metadata !34, metadata !DIExpression()), !dbg !29
  br label %while.body, !dbg !35

while.body:                                       ; preds = %for.end40, %entry
  %q.0 = phi i8* [ undef, %entry ], [ %q.3, %for.end40 ]
  call void @llvm.dbg.value(metadata i8* %q.0, metadata !36, metadata !DIExpression()), !dbg !29
  %sub = sub nsw i32 %n, 1, !dbg !37
  %conv = sext i32 %sub to i64, !dbg !37
  %mul = mul i64 %msize, %conv, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %a, i64 %mul, !dbg !37
  call void @llvm.dbg.value(metadata i8* %add.ptr, metadata !40, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %while.body
  %p.0 = phi i8* [ %add.ptr, %while.body ], [ %add.ptr2, %for.inc ], !dbg !42
  %q.1 = phi i8* [ %q.0, %while.body ], [ %add.ptr2, %for.inc ]
  call void @llvm.dbg.value(metadata i8* %q.1, metadata !36, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i8* %p.0, metadata !40, metadata !DIExpression()), !dbg !29
  %cmp = icmp ugt i8* %p.0, %a, !dbg !43
  br i1 %cmp, label %for.body, label %for.end.loopexit, !dbg !45

for.body:                                         ; preds = %for.cond
  %idx.neg = sub i64 0, %msize, !dbg !46
  %add.ptr2 = getelementptr inbounds i8, i8* %p.0, i64 %idx.neg, !dbg !46
  call void @llvm.dbg.value(metadata i8* %add.ptr2, metadata !36, metadata !DIExpression()), !dbg !29
  %call3 = call i32 %_cmp(i8* %add.ptr2, i8* %p.0), !dbg !48
  %cmp4 = icmp sgt i32 %call3, 0, !dbg !49
  br i1 %cmp4, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !51

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %if.end
  call void @llvm.dbg.value(metadata i8* %add.ptr2, metadata !40, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end, !dbg !56

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %q.2 = phi i8* [ %add.ptr2, %if.then ], [ %q.1, %for.end.loopexit ]
  call void @llvm.dbg.value(metadata i8* %q.2, metadata !36, metadata !DIExpression()), !dbg !29
  %cmp6 = icmp ule i8* %p.0, %a, !dbg !58
  br i1 %cmp6, label %if.then8, label %if.end9, !dbg !59

if.then8:                                         ; preds = %for.end
  br label %while.end, !dbg !60

if.end9:                                          ; preds = %for.end
  %sub10 = sub nsw i32 %n, 1, !dbg !61
  %conv11 = sext i32 %sub10 to i64, !dbg !61
  %mul12 = mul i64 %msize, %conv11, !dbg !61
  %add.ptr13 = getelementptr inbounds i8, i8* %a, i64 %mul12, !dbg !61
  call void @llvm.dbg.value(metadata i8* %add.ptr13, metadata !40, metadata !DIExpression()), !dbg !29
  br label %for.cond14, !dbg !63

for.cond14:                                       ; preds = %for.inc23, %if.end9
  %p.1 = phi i8* [ %add.ptr13, %if.end9 ], [ %add.ptr25, %for.inc23 ], !dbg !64
  call void @llvm.dbg.value(metadata i8* %p.1, metadata !40, metadata !DIExpression()), !dbg !29
  %cmp15 = icmp ugt i8* %p.1, %q.2, !dbg !65
  br i1 %cmp15, label %for.body17, label %for.end26.loopexit, !dbg !67

for.body17:                                       ; preds = %for.cond14
  %call18 = call i32 %_cmp(i8* %q.2, i8* %p.1), !dbg !68
  %cmp19 = icmp sgt i32 %call18, 0, !dbg !70
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !71

if.then21:                                        ; preds = %for.body17
  br label %for.end26, !dbg !72

if.end22:                                         ; preds = %for.body17
  br label %for.inc23, !dbg !73

for.inc23:                                        ; preds = %if.end22
  %idx.neg24 = sub i64 0, %msize, !dbg !74
  %add.ptr25 = getelementptr inbounds i8, i8* %p.1, i64 %idx.neg24, !dbg !74
  call void @llvm.dbg.value(metadata i8* %add.ptr25, metadata !40, metadata !DIExpression()), !dbg !29
  br label %for.cond14, !dbg !75, !llvm.loop !76

for.end26.loopexit:                               ; preds = %for.cond14
  br label %for.end26, !dbg !78

for.end26:                                        ; preds = %for.end26.loopexit, %if.then21
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call, i8* align 1 %p.1, i64 %msize, i1 false), !dbg !78
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %p.1, i8* align 1 %q.2, i64 %msize, i1 false), !dbg !78
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %q.2, i8* align 1 %call, i64 %msize, i1 false), !dbg !78
  %add.ptr27 = getelementptr inbounds i8, i8* %q.2, i64 %msize, !dbg !80
  call void @llvm.dbg.value(metadata i8* %add.ptr27, metadata !36, metadata !DIExpression()), !dbg !29
  %sub28 = sub nsw i32 %n, 1, !dbg !82
  %conv29 = sext i32 %sub28 to i64, !dbg !82
  %mul30 = mul i64 %msize, %conv29, !dbg !82
  %add.ptr31 = getelementptr inbounds i8, i8* %a, i64 %mul30, !dbg !82
  call void @llvm.dbg.value(metadata i8* %add.ptr31, metadata !40, metadata !DIExpression()), !dbg !29
  br label %for.cond32, !dbg !83

for.cond32:                                       ; preds = %for.inc36, %for.end26
  %p.2 = phi i8* [ %add.ptr31, %for.end26 ], [ %add.ptr39, %for.inc36 ], !dbg !84
  %q.3 = phi i8* [ %add.ptr27, %for.end26 ], [ %add.ptr37, %for.inc36 ], !dbg !84
  call void @llvm.dbg.value(metadata i8* %q.3, metadata !36, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i8* %p.2, metadata !40, metadata !DIExpression()), !dbg !29
  %cmp33 = icmp ult i8* %q.3, %p.2, !dbg !85
  br i1 %cmp33, label %for.body35, label %for.end40, !dbg !87

for.body35:                                       ; preds = %for.cond32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call, i8* align 1 %p.2, i64 %msize, i1 false), !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %p.2, i8* align 1 %q.3, i64 %msize, i1 false), !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %q.3, i8* align 1 %call, i64 %msize, i1 false), !dbg !88
  br label %for.inc36, !dbg !88

for.inc36:                                        ; preds = %for.body35
  %add.ptr37 = getelementptr inbounds i8, i8* %q.3, i64 %msize, !dbg !90
  call void @llvm.dbg.value(metadata i8* %add.ptr37, metadata !36, metadata !DIExpression()), !dbg !29
  %idx.neg38 = sub i64 0, %msize, !dbg !91
  %add.ptr39 = getelementptr inbounds i8, i8* %p.2, i64 %idx.neg38, !dbg !91
  call void @llvm.dbg.value(metadata i8* %add.ptr39, metadata !40, metadata !DIExpression()), !dbg !29
  br label %for.cond32, !dbg !92, !llvm.loop !93

for.end40:                                        ; preds = %for.cond32
  br label %while.body, !dbg !35, !llvm.loop !95

while.end:                                        ; preds = %if.then8
  call void @free(i8* %call) #6, !dbg !97
  ret void, !dbg !98
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @scmp(i8* %a, i8* %b) #0 !dbg !99 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata i8* %b, metadata !102, metadata !DIExpression()), !dbg !101
  %0 = bitcast i8* %a to i8**, !dbg !103
  %1 = load i8*, i8** %0, align 8, !dbg !104
  %2 = bitcast i8* %b to i8**, !dbg !105
  %3 = load i8*, i8** %2, align 8, !dbg !106
  %call = call i32 @strcmp(i8* %1, i8* %3) #7, !dbg !107
  ret i32 %call, !dbg !108
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !109 {
entry:
  %strs = alloca [5 x i8*], align 16
  call void @llvm.dbg.declare(metadata [5 x i8*]* %strs, metadata !112, metadata !DIExpression()), !dbg !116
  %0 = bitcast [5 x i8*]* %strs to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !116
  %1 = bitcast i8* %0 to [5 x i8*]*, !dbg !116
  %2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 0, !dbg !116
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8** %2, align 16, !dbg !116
  %3 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 1, !dbg !116
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8** %3, align 8, !dbg !116
  %4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 2, !dbg !116
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i8** %4, align 16, !dbg !116
  %5 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 3, !dbg !116
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8** %5, align 8, !dbg !116
  %6 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 4, !dbg !116
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8** %6, align 16, !dbg !116
  %arraydecay = getelementptr inbounds [5 x i8*], [5 x i8*]* %strs, i64 0, i64 0, !dbg !117
  %7 = bitcast i8** %arraydecay to i8*, !dbg !117
  call void @perm_sort(i8* %7, i32 5, i64 8, i32 (i8*, i8*)* @scmp), !dbg !118
  call void @llvm.dbg.value(metadata i32 0, metadata !119, metadata !DIExpression()), !dbg !120
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !123
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !119, metadata !DIExpression()), !dbg !120
  %cmp = icmp slt i32 %i.0, 5, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !127
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* %strs, i64 0, i64 %idxprom, !dbg !127
  %8 = load i8*, i8** %arrayidx, align 8, !dbg !127
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i8* %8), !dbg !128
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !129
  call void @llvm.dbg.value(metadata i32 %inc, metadata !119, metadata !DIExpression()), !dbg !120
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !133
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "sorting-algorithms-permutation-sort.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Sorting-algorithms-Permutation-sort")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!15 = distinct !DISubprogram(name: "perm_sort", scope: !1, file: !1, line: 7, type: !16, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{null, !6, !18, !19, !22}
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !20, line: 46, baseType: !21)
!20 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs-old/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!21 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "cmp_func", file: !1, line: 5, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{!18, !26, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!28 = !DILocalVariable(name: "a", arg: 1, scope: !15, file: !1, line: 7, type: !6)
!29 = !DILocation(line: 0, scope: !15)
!30 = !DILocalVariable(name: "n", arg: 2, scope: !15, file: !1, line: 7, type: !18)
!31 = !DILocalVariable(name: "msize", arg: 3, scope: !15, file: !1, line: 7, type: !19)
!32 = !DILocalVariable(name: "_cmp", arg: 4, scope: !15, file: !1, line: 7, type: !22)
!33 = !DILocation(line: 9, column: 22, scope: !15)
!34 = !DILocalVariable(name: "tmp", scope: !15, file: !1, line: 9, type: !4)
!35 = !DILocation(line: 15, column: 2, scope: !15)
!36 = !DILocalVariable(name: "q", scope: !15, file: !1, line: 9, type: !4)
!37 = !DILocation(line: 17, column: 12, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 17, column: 3)
!39 = distinct !DILexicalBlock(scope: !15, file: !1, line: 15, column: 12)
!40 = !DILocalVariable(name: "p", scope: !15, file: !1, line: 9, type: !4)
!41 = !DILocation(line: 17, column: 8, scope: !38)
!42 = !DILocation(line: 0, scope: !38)
!43 = !DILocation(line: 17, column: 31, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 17, column: 3)
!45 = !DILocation(line: 17, column: 3, scope: !38)
!46 = !DILocation(line: 18, column: 19, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 18, column: 8)
!48 = !DILocation(line: 18, column: 8, scope: !47)
!49 = !DILocation(line: 18, column: 31, scope: !47)
!50 = !DILocation(line: 18, column: 8, scope: !44)
!51 = !DILocation(line: 19, column: 5, scope: !47)
!52 = !DILocation(line: 18, column: 33, scope: !47)
!53 = !DILocation(line: 17, column: 3, scope: !44)
!54 = distinct !{!54, !45, !55}
!55 = !DILocation(line: 19, column: 5, scope: !38)
!56 = !DILocation(line: 21, column: 14, scope: !57)
!57 = distinct !DILexicalBlock(scope: !39, file: !1, line: 21, column: 7)
!58 = !DILocation(line: 21, column: 16, scope: !57)
!59 = !DILocation(line: 21, column: 7, scope: !39)
!60 = !DILocation(line: 21, column: 22, scope: !57)
!61 = !DILocation(line: 24, column: 12, scope: !62)
!62 = distinct !DILexicalBlock(scope: !39, file: !1, line: 24, column: 3)
!63 = !DILocation(line: 24, column: 8, scope: !62)
!64 = !DILocation(line: 0, scope: !62)
!65 = !DILocation(line: 24, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 24, column: 3)
!67 = !DILocation(line: 24, column: 3, scope: !62)
!68 = !DILocation(line: 25, column: 8, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !1, line: 25, column: 8)
!70 = !DILocation(line: 25, column: 19, scope: !69)
!71 = !DILocation(line: 25, column: 8, scope: !66)
!72 = !DILocation(line: 25, column: 24, scope: !69)
!73 = !DILocation(line: 25, column: 21, scope: !69)
!74 = !DILocation(line: 24, column: 30, scope: !66)
!75 = !DILocation(line: 24, column: 3, scope: !66)
!76 = distinct !{!76, !67, !77}
!77 = !DILocation(line: 25, column: 24, scope: !62)
!78 = !DILocation(line: 27, column: 3, scope: !79)
!79 = distinct !DILexicalBlock(scope: !39, file: !1, line: 27, column: 3)
!80 = !DILocation(line: 29, column: 10, scope: !81)
!81 = distinct !DILexicalBlock(scope: !39, file: !1, line: 29, column: 3)
!82 = !DILocation(line: 29, column: 24, scope: !81)
!83 = !DILocation(line: 29, column: 8, scope: !81)
!84 = !DILocation(line: 0, scope: !81)
!85 = !DILocation(line: 29, column: 36, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 29, column: 3)
!87 = !DILocation(line: 29, column: 3, scope: !81)
!88 = !DILocation(line: 30, column: 4, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 30, column: 4)
!90 = !DILocation(line: 29, column: 43, scope: !86)
!91 = !DILocation(line: 29, column: 55, scope: !86)
!92 = !DILocation(line: 29, column: 3, scope: !86)
!93 = distinct !{!93, !87, !94}
!94 = !DILocation(line: 30, column: 4, scope: !81)
!95 = distinct !{!95, !35, !96}
!96 = !DILocation(line: 31, column: 2, scope: !15)
!97 = !DILocation(line: 32, column: 2, scope: !15)
!98 = !DILocation(line: 33, column: 1, scope: !15)
!99 = distinct !DISubprogram(name: "scmp", scope: !1, file: !1, line: 35, type: !24, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "a", arg: 1, scope: !99, file: !1, line: 35, type: !26)
!101 = !DILocation(line: 0, scope: !99)
!102 = !DILocalVariable(name: "b", arg: 2, scope: !99, file: !1, line: 35, type: !26)
!103 = !DILocation(line: 35, column: 57, scope: !99)
!104 = !DILocation(line: 35, column: 56, scope: !99)
!105 = !DILocation(line: 35, column: 82, scope: !99)
!106 = !DILocation(line: 35, column: 81, scope: !99)
!107 = !DILocation(line: 35, column: 49, scope: !99)
!108 = !DILocation(line: 35, column: 42, scope: !99)
!109 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 37, type: !110, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!18}
!112 = !DILocalVariable(name: "strs", scope: !109, file: !1, line: 40, type: !113)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 320, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 5)
!116 = !DILocation(line: 40, column: 14, scope: !109)
!117 = !DILocation(line: 41, column: 12, scope: !109)
!118 = !DILocation(line: 41, column: 2, scope: !109)
!119 = !DILocalVariable(name: "i", scope: !109, file: !1, line: 39, type: !18)
!120 = !DILocation(line: 0, scope: !109)
!121 = !DILocation(line: 43, column: 7, scope: !122)
!122 = distinct !DILexicalBlock(scope: !109, file: !1, line: 43, column: 2)
!123 = !DILocation(line: 0, scope: !122)
!124 = !DILocation(line: 43, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !1, line: 43, column: 2)
!126 = !DILocation(line: 43, column: 2, scope: !122)
!127 = !DILocation(line: 44, column: 18, scope: !125)
!128 = !DILocation(line: 44, column: 3, scope: !125)
!129 = !DILocation(line: 43, column: 22, scope: !125)
!130 = !DILocation(line: 43, column: 2, scope: !125)
!131 = distinct !{!131, !126, !132}
!132 = !DILocation(line: 44, column: 25, scope: !122)
!133 = !DILocation(line: 45, column: 2, scope: !109)
