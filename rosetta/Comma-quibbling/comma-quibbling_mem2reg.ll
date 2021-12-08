; ModuleID = 'comma-quibbling.ll'
source_filename = "comma-quibbling.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [24 x i8] c"Can't allocate memory!\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c" and \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"ABC\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"DEF\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"H\00", align 1
@__const.main.test = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0)], align 16
@.str.9 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @quib(i8** %strs, i64 %size) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i8** %strs, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %size, metadata !20, metadata !DIExpression()), !dbg !19
  %cmp = icmp ugt i64 %size, 1, !dbg !21
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !22

cond.true:                                        ; preds = %entry
  %mul = mul i64 2, %size, !dbg !23
  %add = add i64 %mul, 1, !dbg !24
  br label %cond.end, !dbg !22

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !22

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %add, %cond.true ], [ 0, %cond.false ], !dbg !22
  %add1 = add i64 3, %cond, !dbg !25
  call void @llvm.dbg.value(metadata i64 %add1, metadata !26, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 0, metadata !27, metadata !DIExpression()), !dbg !19
  br label %for.cond, !dbg !28

for.cond:                                         ; preds = %for.inc, %cond.end
  %len.0 = phi i64 [ %add1, %cond.end ], [ %add3, %for.inc ], !dbg !19
  %i.0 = phi i64 [ 0, %cond.end ], [ %inc, %for.inc ], !dbg !30
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !27, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %len.0, metadata !26, metadata !DIExpression()), !dbg !19
  %cmp2 = icmp ult i64 %i.0, %size, !dbg !31
  br i1 %cmp2, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i8*, i8** %strs, i64 %i.0, !dbg !34
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !34
  %call = call i64 @strlen(i8* %0) #7, !dbg !35
  %add3 = add i64 %len.0, %call, !dbg !36
  call void @llvm.dbg.value(metadata i64 %add3, metadata !26, metadata !DIExpression()), !dbg !19
  br label %for.inc, !dbg !37

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1, !dbg !38
  call void @llvm.dbg.value(metadata i64 %inc, metadata !27, metadata !DIExpression()), !dbg !19
  br label %for.cond, !dbg !39, !llvm.loop !40

for.end:                                          ; preds = %for.cond
  %mul4 = mul i64 %len.0, 1, !dbg !42
  %call5 = call noalias i8* @malloc(i64 %mul4) #8, !dbg !43
  call void @llvm.dbg.value(metadata i8* %call5, metadata !44, metadata !DIExpression()), !dbg !19
  %tobool = icmp ne i8* %call5, null, !dbg !45
  br i1 %tobool, label %if.end, label %if.then, !dbg !47

if.then:                                          ; preds = %for.end
  call void @perror(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @exit(i32 1) #9, !dbg !50
  unreachable, !dbg !50

if.end:                                           ; preds = %for.end
  %call6 = call i8* @strcpy(i8* %call5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)) #8, !dbg !51
  switch i64 %size, label %sw.default [
    i64 0, label %sw.bb
    i64 1, label %sw.bb7
  ], !dbg !52

sw.bb:                                            ; preds = %if.end
  br label %sw.epilog, !dbg !53

sw.bb7:                                           ; preds = %if.end
  %arrayidx8 = getelementptr inbounds i8*, i8** %strs, i64 0, !dbg !55
  %1 = load i8*, i8** %arrayidx8, align 8, !dbg !55
  %call9 = call i8* @strcat(i8* %call5, i8* %1) #8, !dbg !56
  br label %sw.epilog, !dbg !57

sw.default:                                       ; preds = %if.end
  call void @llvm.dbg.value(metadata i64 0, metadata !27, metadata !DIExpression()), !dbg !19
  br label %for.cond10, !dbg !58

for.cond10:                                       ; preds = %for.inc21, %sw.default
  %i.1 = phi i64 [ 0, %sw.default ], [ %inc22, %for.inc21 ], !dbg !60
  call void @llvm.dbg.value(metadata i64 %i.1, metadata !27, metadata !DIExpression()), !dbg !19
  %sub = sub i64 %size, 1, !dbg !61
  %cmp11 = icmp ult i64 %i.1, %sub, !dbg !63
  br i1 %cmp11, label %for.body12, label %for.end23, !dbg !64

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds i8*, i8** %strs, i64 %i.1, !dbg !65
  %2 = load i8*, i8** %arrayidx13, align 8, !dbg !65
  %call14 = call i8* @strcat(i8* %call5, i8* %2) #8, !dbg !67
  %sub15 = sub i64 %size, 2, !dbg !68
  %cmp16 = icmp ult i64 %i.1, %sub15, !dbg !70
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !71

if.then17:                                        ; preds = %for.body12
  %call18 = call i8* @strcat(i8* %call5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0)) #8, !dbg !72
  br label %if.end20, !dbg !72

if.else:                                          ; preds = %for.body12
  %call19 = call i8* @strcat(i8* %call5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)) #8, !dbg !73
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then17
  br label %for.inc21, !dbg !74

for.inc21:                                        ; preds = %if.end20
  %inc22 = add i64 %i.1, 1, !dbg !75
  call void @llvm.dbg.value(metadata i64 %inc22, metadata !27, metadata !DIExpression()), !dbg !19
  br label %for.cond10, !dbg !76, !llvm.loop !77

for.end23:                                        ; preds = %for.cond10
  %arrayidx24 = getelementptr inbounds i8*, i8** %strs, i64 %i.1, !dbg !79
  %3 = load i8*, i8** %arrayidx24, align 8, !dbg !79
  %call25 = call i8* @strcat(i8* %call5, i8* %3) #8, !dbg !80
  br label %sw.epilog, !dbg !81

sw.epilog:                                        ; preds = %for.end23, %sw.bb7, %sw.bb
  %call26 = call i8* @strcat(i8* %call5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)) #8, !dbg !82
  ret i8* %call5, !dbg !83
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

declare dso_local void @perror(i8*) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !84 {
entry:
  %test = alloca [4 x i8*], align 16
  call void @llvm.dbg.declare(metadata [4 x i8*]* %test, metadata !88, metadata !DIExpression()), !dbg !92
  %0 = bitcast [4 x i8*]* %test to i8*, !dbg !92
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x i8*]* @__const.main.test to i8*), i64 32, i1 false), !dbg !92
  call void @llvm.dbg.value(metadata i64 0, metadata !93, metadata !DIExpression()), !dbg !95
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %inc, %for.inc ], !dbg !95
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !93, metadata !DIExpression()), !dbg !95
  %cmp = icmp ult i64 %i.0, 5, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [4 x i8*], [4 x i8*]* %test, i64 0, i64 0, !dbg !100
  %call = call i8* @quib(i8** %arraydecay, i64 %i.0), !dbg !102
  call void @llvm.dbg.value(metadata i8* %call, metadata !103, metadata !DIExpression()), !dbg !104
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i8* %call), !dbg !105
  call void @free(i8* %call) #8, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1, !dbg !108
  call void @llvm.dbg.value(metadata i64 %inc, metadata !93, metadata !DIExpression()), !dbg !95
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !112
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "comma-quibbling.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Comma-quibbling")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "quib", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !12, !15}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !17)
!16 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!17 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!18 = !DILocalVariable(name: "strs", arg: 1, scope: !7, file: !1, line: 5, type: !12)
!19 = !DILocation(line: 0, scope: !7)
!20 = !DILocalVariable(name: "size", arg: 2, scope: !7, file: !1, line: 5, type: !15)
!21 = !DILocation(line: 8, column: 29, scope: !7)
!22 = !DILocation(line: 8, column: 23, scope: !7)
!23 = !DILocation(line: 8, column: 39, scope: !7)
!24 = !DILocation(line: 8, column: 46, scope: !7)
!25 = !DILocation(line: 8, column: 20, scope: !7)
!26 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 8, type: !15)
!27 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 9, type: !15)
!28 = !DILocation(line: 11, column: 10, scope: !29)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 5)
!30 = !DILocation(line: 0, scope: !29)
!31 = !DILocation(line: 11, column: 19, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !1, line: 11, column: 5)
!33 = !DILocation(line: 11, column: 5, scope: !29)
!34 = !DILocation(line: 12, column: 23, scope: !32)
!35 = !DILocation(line: 12, column: 16, scope: !32)
!36 = !DILocation(line: 12, column: 13, scope: !32)
!37 = !DILocation(line: 12, column: 9, scope: !32)
!38 = !DILocation(line: 11, column: 28, scope: !32)
!39 = !DILocation(line: 11, column: 5, scope: !32)
!40 = distinct !{!40, !33, !41}
!41 = !DILocation(line: 12, column: 30, scope: !29)
!42 = !DILocation(line: 14, column: 26, scope: !7)
!43 = !DILocation(line: 14, column: 15, scope: !7)
!44 = !DILocalVariable(name: "s", scope: !7, file: !1, line: 14, type: !10)
!45 = !DILocation(line: 15, column: 10, scope: !46)
!46 = distinct !DILexicalBlock(scope: !7, file: !1, line: 15, column: 9)
!47 = !DILocation(line: 15, column: 9, scope: !7)
!48 = !DILocation(line: 17, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !1, line: 16, column: 5)
!50 = !DILocation(line: 18, column: 9, scope: !49)
!51 = !DILocation(line: 21, column: 5, scope: !7)
!52 = !DILocation(line: 22, column: 5, scope: !7)
!53 = !DILocation(line: 23, column: 18, scope: !54)
!54 = distinct !DILexicalBlock(scope: !7, file: !1, line: 22, column: 19)
!55 = !DILocation(line: 24, column: 28, scope: !54)
!56 = !DILocation(line: 24, column: 18, scope: !54)
!57 = !DILocation(line: 25, column: 18, scope: !54)
!58 = !DILocation(line: 26, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !1, line: 26, column: 18)
!60 = !DILocation(line: 0, scope: !59)
!61 = !DILocation(line: 26, column: 39, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !1, line: 26, column: 18)
!63 = !DILocation(line: 26, column: 32, scope: !62)
!64 = !DILocation(line: 26, column: 18, scope: !59)
!65 = !DILocation(line: 28, column: 32, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 27, column: 18)
!67 = !DILocation(line: 28, column: 22, scope: !66)
!68 = !DILocation(line: 29, column: 35, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !1, line: 29, column: 26)
!70 = !DILocation(line: 29, column: 28, scope: !69)
!71 = !DILocation(line: 29, column: 26, scope: !66)
!72 = !DILocation(line: 30, column: 26, scope: !69)
!73 = !DILocation(line: 32, column: 26, scope: !69)
!74 = !DILocation(line: 33, column: 18, scope: !66)
!75 = !DILocation(line: 26, column: 45, scope: !62)
!76 = !DILocation(line: 26, column: 18, scope: !62)
!77 = distinct !{!77, !64, !78}
!78 = !DILocation(line: 33, column: 18, scope: !59)
!79 = !DILocation(line: 34, column: 28, scope: !54)
!80 = !DILocation(line: 34, column: 18, scope: !54)
!81 = !DILocation(line: 35, column: 18, scope: !54)
!82 = !DILocation(line: 37, column: 5, scope: !7)
!83 = !DILocation(line: 38, column: 5, scope: !7)
!84 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 41, type: !85, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DILocalVariable(name: "test", scope: !84, file: !1, line: 43, type: !89)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 256, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 4)
!92 = !DILocation(line: 43, column: 17, scope: !84)
!93 = !DILocalVariable(name: "i", scope: !94, file: !1, line: 46, type: !15)
!94 = distinct !DILexicalBlock(scope: !84, file: !1, line: 46, column: 5)
!95 = !DILocation(line: 0, scope: !94)
!96 = !DILocation(line: 46, column: 10, scope: !94)
!97 = !DILocation(line: 46, column: 26, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 46, column: 5)
!99 = !DILocation(line: 46, column: 5, scope: !94)
!100 = !DILocation(line: 48, column: 18, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !1, line: 47, column: 5)
!102 = !DILocation(line: 48, column: 13, scope: !101)
!103 = !DILocalVariable(name: "s", scope: !84, file: !1, line: 44, type: !10)
!104 = !DILocation(line: 0, scope: !84)
!105 = !DILocation(line: 49, column: 9, scope: !101)
!106 = !DILocation(line: 50, column: 9, scope: !101)
!107 = !DILocation(line: 51, column: 5, scope: !101)
!108 = !DILocation(line: 46, column: 32, scope: !98)
!109 = !DILocation(line: 46, column: 5, scope: !98)
!110 = distinct !{!110, !99, !111}
!111 = !DILocation(line: 51, column: 5, scope: !94)
!112 = !DILocation(line: 52, column: 5, scope: !84)
