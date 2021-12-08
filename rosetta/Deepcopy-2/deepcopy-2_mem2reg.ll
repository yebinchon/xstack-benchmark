; ModuleID = 'deepcopy-2.ll'
source_filename = "deepcopy-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.elem = type { i32, %struct.elem* }

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"List a is : \00", align 1
@.str.3 = private unnamed_addr constant [32 x i8] c"\0AList a destroyed, List b is : \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @addToList(%struct.elem** %a, i32 %num) #0 !dbg !18 {
entry:
  call void @llvm.dbg.value(metadata %struct.elem** %a, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 %num, metadata !24, metadata !DIExpression()), !dbg !23
  %0 = load %struct.elem*, %struct.elem** %a, align 8, !dbg !25
  %cmp = icmp eq %struct.elem* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !29
  %1 = bitcast i8* %call to %struct.elem*, !dbg !31
  store %struct.elem* %1, %struct.elem** %a, align 8, !dbg !32
  %2 = load %struct.elem*, %struct.elem** %a, align 8, !dbg !33
  %data = getelementptr inbounds %struct.elem, %struct.elem* %2, i32 0, i32 0, !dbg !34
  store i32 %num, i32* %data, align 8, !dbg !35
  %3 = load %struct.elem*, %struct.elem** %a, align 8, !dbg !36
  %next = getelementptr inbounds %struct.elem, %struct.elem* %3, i32 0, i32 1, !dbg !37
  store %struct.elem* null, %struct.elem** %next, align 8, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  %4 = load %struct.elem*, %struct.elem** %a, align 8, !dbg !40
  call void @llvm.dbg.value(metadata %struct.elem* %4, metadata !42, metadata !DIExpression()), !dbg !23
  br label %while.cond, !dbg !43

while.cond:                                       ; preds = %while.body, %if.else
  %temp.0 = phi %struct.elem* [ %4, %if.else ], [ %6, %while.body ], !dbg !44
  call void @llvm.dbg.value(metadata %struct.elem* %temp.0, metadata !42, metadata !DIExpression()), !dbg !23
  %next1 = getelementptr inbounds %struct.elem, %struct.elem* %temp.0, i32 0, i32 1, !dbg !45
  %5 = load %struct.elem*, %struct.elem** %next1, align 8, !dbg !45
  %cmp2 = icmp ne %struct.elem* %5, null, !dbg !46
  br i1 %cmp2, label %while.body, label %while.end, !dbg !43

while.body:                                       ; preds = %while.cond
  %next3 = getelementptr inbounds %struct.elem, %struct.elem* %temp.0, i32 0, i32 1, !dbg !47
  %6 = load %struct.elem*, %struct.elem** %next3, align 8, !dbg !47
  call void @llvm.dbg.value(metadata %struct.elem* %6, metadata !42, metadata !DIExpression()), !dbg !23
  br label %while.cond, !dbg !43, !llvm.loop !48

while.end:                                        ; preds = %while.cond
  %call4 = call noalias i8* @malloc(i64 16) #4, !dbg !49
  %7 = bitcast i8* %call4 to %struct.elem*, !dbg !50
  call void @llvm.dbg.value(metadata %struct.elem* %7, metadata !51, metadata !DIExpression()), !dbg !23
  %data5 = getelementptr inbounds %struct.elem, %struct.elem* %7, i32 0, i32 0, !dbg !52
  store i32 %num, i32* %data5, align 8, !dbg !53
  %next6 = getelementptr inbounds %struct.elem, %struct.elem* %7, i32 0, i32 1, !dbg !54
  store %struct.elem* null, %struct.elem** %next6, align 8, !dbg !55
  %next7 = getelementptr inbounds %struct.elem, %struct.elem* %temp.0, i32 0, i32 1, !dbg !56
  store %struct.elem* %7, %struct.elem** %next7, align 8, !dbg !57
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  ret void, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.elem* @copyList(%struct.elem* %a) #0 !dbg !59 {
entry:
  call void @llvm.dbg.value(metadata %struct.elem* %a, metadata !62, metadata !DIExpression()), !dbg !63
  %cmp = icmp ne %struct.elem* %a, null, !dbg !64
  br i1 %cmp, label %if.then, label %if.end, !dbg !66

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !67
  %0 = bitcast i8* %call to %struct.elem*, !dbg !69
  call void @llvm.dbg.value(metadata %struct.elem* %0, metadata !70, metadata !DIExpression()), !dbg !63
  %data = getelementptr inbounds %struct.elem, %struct.elem* %a, i32 0, i32 0, !dbg !71
  %1 = load i32, i32* %data, align 8, !dbg !71
  %data1 = getelementptr inbounds %struct.elem, %struct.elem* %0, i32 0, i32 0, !dbg !72
  store i32 %1, i32* %data1, align 8, !dbg !73
  %next = getelementptr inbounds %struct.elem, %struct.elem* %0, i32 0, i32 1, !dbg !74
  store %struct.elem* null, %struct.elem** %next, align 8, !dbg !75
  %next2 = getelementptr inbounds %struct.elem, %struct.elem* %a, i32 0, i32 1, !dbg !76
  %2 = load %struct.elem*, %struct.elem** %next2, align 8, !dbg !76
  call void @llvm.dbg.value(metadata %struct.elem* %2, metadata !77, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata %struct.elem* %0, metadata !78, metadata !DIExpression()), !dbg !63
  br label %while.cond, !dbg !79

while.cond:                                       ; preds = %while.body, %if.then
  %tempA.0 = phi %struct.elem* [ %2, %if.then ], [ %5, %while.body ], !dbg !80
  %tempB.0 = phi %struct.elem* [ %0, %if.then ], [ %3, %while.body ], !dbg !80
  call void @llvm.dbg.value(metadata %struct.elem* %tempB.0, metadata !78, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata %struct.elem* %tempA.0, metadata !77, metadata !DIExpression()), !dbg !63
  %cmp3 = icmp ne %struct.elem* %tempA.0, null, !dbg !81
  br i1 %cmp3, label %while.body, label %while.end, !dbg !79

while.body:                                       ; preds = %while.cond
  %call4 = call noalias i8* @malloc(i64 16) #4, !dbg !82
  %3 = bitcast i8* %call4 to %struct.elem*, !dbg !84
  call void @llvm.dbg.value(metadata %struct.elem* %3, metadata !85, metadata !DIExpression()), !dbg !63
  %data5 = getelementptr inbounds %struct.elem, %struct.elem* %tempA.0, i32 0, i32 0, !dbg !86
  %4 = load i32, i32* %data5, align 8, !dbg !86
  %data6 = getelementptr inbounds %struct.elem, %struct.elem* %3, i32 0, i32 0, !dbg !87
  store i32 %4, i32* %data6, align 8, !dbg !88
  %next7 = getelementptr inbounds %struct.elem, %struct.elem* %3, i32 0, i32 1, !dbg !89
  store %struct.elem* null, %struct.elem** %next7, align 8, !dbg !90
  %next8 = getelementptr inbounds %struct.elem, %struct.elem* %tempB.0, i32 0, i32 1, !dbg !91
  store %struct.elem* %3, %struct.elem** %next8, align 8, !dbg !92
  call void @llvm.dbg.value(metadata %struct.elem* %3, metadata !78, metadata !DIExpression()), !dbg !63
  %next9 = getelementptr inbounds %struct.elem, %struct.elem* %tempA.0, i32 0, i32 1, !dbg !93
  %5 = load %struct.elem*, %struct.elem** %next9, align 8, !dbg !93
  call void @llvm.dbg.value(metadata %struct.elem* %5, metadata !77, metadata !DIExpression()), !dbg !63
  br label %while.cond, !dbg !79, !llvm.loop !94

while.end:                                        ; preds = %while.cond
  br label %if.end, !dbg !96

if.end:                                           ; preds = %while.end, %entry
  %b.0 = phi %struct.elem* [ %0, %while.end ], [ undef, %entry ]
  call void @llvm.dbg.value(metadata %struct.elem* %b.0, metadata !70, metadata !DIExpression()), !dbg !63
  ret %struct.elem* %b.0, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printList(%struct.elem* %a) #0 !dbg !98 {
entry:
  call void @llvm.dbg.value(metadata %struct.elem* %a, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata %struct.elem* %a, metadata !103, metadata !DIExpression()), !dbg !102
  br label %while.cond, !dbg !104

while.cond:                                       ; preds = %while.body, %entry
  %temp.0 = phi %struct.elem* [ %a, %entry ], [ %1, %while.body ], !dbg !102
  call void @llvm.dbg.value(metadata %struct.elem* %temp.0, metadata !103, metadata !DIExpression()), !dbg !102
  %cmp = icmp ne %struct.elem* %temp.0, null, !dbg !105
  br i1 %cmp, label %while.body, label %while.end, !dbg !104

while.body:                                       ; preds = %while.cond
  %data = getelementptr inbounds %struct.elem, %struct.elem* %temp.0, i32 0, i32 0, !dbg !106
  %0 = load i32, i32* %data, align 8, !dbg !106
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !108
  %next = getelementptr inbounds %struct.elem, %struct.elem* %temp.0, i32 0, i32 1, !dbg !109
  %1 = load %struct.elem*, %struct.elem** %next, align 8, !dbg !109
  call void @llvm.dbg.value(metadata %struct.elem* %1, metadata !103, metadata !DIExpression()), !dbg !102
  br label %while.cond, !dbg !104, !llvm.loop !110

while.end:                                        ; preds = %while.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  ret void, !dbg !113
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !114 {
entry:
  %a = alloca %struct.elem*, align 8
  call void @llvm.dbg.declare(metadata %struct.elem** %a, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i32 1, metadata !119, metadata !DIExpression()), !dbg !120
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !123
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !119, metadata !DIExpression()), !dbg !120
  %cmp = icmp sle i32 %i.0, 5, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  call void @addToList(%struct.elem** %a, i32 %i.0), !dbg !127
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !128
  call void @llvm.dbg.value(metadata i32 %inc, metadata !119, metadata !DIExpression()), !dbg !120
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0)), !dbg !132
  %0 = load %struct.elem*, %struct.elem** %a, align 8, !dbg !133
  call void @printList(%struct.elem* %0), !dbg !134
  %1 = load %struct.elem*, %struct.elem** %a, align 8, !dbg !135
  %call1 = call %struct.elem* @copyList(%struct.elem* %1), !dbg !136
  call void @llvm.dbg.value(metadata %struct.elem* %call1, metadata !137, metadata !DIExpression()), !dbg !120
  %2 = load %struct.elem*, %struct.elem** %a, align 8, !dbg !138
  %3 = bitcast %struct.elem* %2 to i8*, !dbg !138
  call void @free(i8* %3) #4, !dbg !139
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.3, i64 0, i64 0)), !dbg !140
  call void @printList(%struct.elem* %call1), !dbg !141
  ret i32 0, !dbg !142
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "deepcopy-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Deepcopy-2")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "list", file: !1, line: 9, baseType: !6)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "cell", file: !1, line: 7, baseType: !8)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "elem", file: !1, line: 4, size: 128, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !1, line: 5, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !8, file: !1, line: 6, baseType: !13, size: 64, offset: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!18 = distinct !DISubprogram(name: "addToList", scope: !1, file: !1, line: 11, type: !19, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21, !11}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!22 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 11, type: !21)
!23 = !DILocation(line: 0, scope: !18)
!24 = !DILocalVariable(name: "num", arg: 2, scope: !18, file: !1, line: 11, type: !11)
!25 = !DILocation(line: 14, column: 5, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !1, line: 14, column: 5)
!27 = !DILocation(line: 14, column: 7, scope: !26)
!28 = !DILocation(line: 14, column: 5, scope: !18)
!29 = !DILocation(line: 15, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 14, column: 14)
!31 = !DILocation(line: 15, column: 8, scope: !30)
!32 = !DILocation(line: 15, column: 6, scope: !30)
!33 = !DILocation(line: 16, column: 4, scope: !30)
!34 = !DILocation(line: 16, column: 9, scope: !30)
!35 = !DILocation(line: 16, column: 14, scope: !30)
!36 = !DILocation(line: 17, column: 4, scope: !30)
!37 = !DILocation(line: 17, column: 9, scope: !30)
!38 = !DILocation(line: 17, column: 14, scope: !30)
!39 = !DILocation(line: 18, column: 2, scope: !30)
!40 = !DILocation(line: 20, column: 10, scope: !41)
!41 = distinct !DILexicalBlock(scope: !26, file: !1, line: 19, column: 6)
!42 = !DILocalVariable(name: "temp", scope: !18, file: !1, line: 12, type: !5)
!43 = !DILocation(line: 22, column: 3, scope: !41)
!44 = !DILocation(line: 0, scope: !41)
!45 = !DILocation(line: 22, column: 15, scope: !41)
!46 = !DILocation(line: 22, column: 19, scope: !41)
!47 = !DILocation(line: 23, column: 17, scope: !41)
!48 = distinct !{!48, !43, !47}
!49 = !DILocation(line: 25, column: 18, scope: !41)
!50 = !DILocation(line: 25, column: 12, scope: !41)
!51 = !DILocalVariable(name: "holder", scope: !18, file: !1, line: 12, type: !5)
!52 = !DILocation(line: 26, column: 11, scope: !41)
!53 = !DILocation(line: 26, column: 16, scope: !41)
!54 = !DILocation(line: 27, column: 11, scope: !41)
!55 = !DILocation(line: 27, column: 16, scope: !41)
!56 = !DILocation(line: 29, column: 9, scope: !41)
!57 = !DILocation(line: 29, column: 14, scope: !41)
!58 = !DILocation(line: 31, column: 1, scope: !18)
!59 = distinct !DISubprogram(name: "copyList", scope: !1, file: !1, line: 33, type: !60, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!5, !5}
!62 = !DILocalVariable(name: "a", arg: 1, scope: !59, file: !1, line: 33, type: !5)
!63 = !DILocation(line: 0, scope: !59)
!64 = !DILocation(line: 36, column: 6, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !1, line: 36, column: 5)
!66 = !DILocation(line: 36, column: 5, scope: !59)
!67 = !DILocation(line: 37, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !1, line: 36, column: 13)
!69 = !DILocation(line: 37, column: 7, scope: !68)
!70 = !DILocalVariable(name: "b", scope: !59, file: !1, line: 34, type: !5)
!71 = !DILocation(line: 38, column: 16, scope: !68)
!72 = !DILocation(line: 38, column: 6, scope: !68)
!73 = !DILocation(line: 38, column: 11, scope: !68)
!74 = !DILocation(line: 39, column: 6, scope: !68)
!75 = !DILocation(line: 39, column: 11, scope: !68)
!76 = !DILocation(line: 41, column: 14, scope: !68)
!77 = !DILocalVariable(name: "tempA", scope: !59, file: !1, line: 34, type: !5)
!78 = !DILocalVariable(name: "tempB", scope: !59, file: !1, line: 34, type: !5)
!79 = !DILocation(line: 44, column: 3, scope: !68)
!80 = !DILocation(line: 0, scope: !68)
!81 = !DILocation(line: 44, column: 14, scope: !68)
!82 = !DILocation(line: 45, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !68, file: !1, line: 44, column: 21)
!84 = !DILocation(line: 45, column: 11, scope: !83)
!85 = !DILocalVariable(name: "temp", scope: !59, file: !1, line: 34, type: !5)
!86 = !DILocation(line: 46, column: 24, scope: !83)
!87 = !DILocation(line: 46, column: 10, scope: !83)
!88 = !DILocation(line: 46, column: 15, scope: !83)
!89 = !DILocation(line: 47, column: 10, scope: !83)
!90 = !DILocation(line: 47, column: 15, scope: !83)
!91 = !DILocation(line: 49, column: 11, scope: !83)
!92 = !DILocation(line: 49, column: 16, scope: !83)
!93 = !DILocation(line: 52, column: 19, scope: !83)
!94 = distinct !{!94, !79, !95}
!95 = !DILocation(line: 53, column: 3, scope: !68)
!96 = !DILocation(line: 54, column: 2, scope: !68)
!97 = !DILocation(line: 56, column: 2, scope: !59)
!98 = distinct !DISubprogram(name: "printList", scope: !1, file: !1, line: 59, type: !99, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{null, !5}
!101 = !DILocalVariable(name: "a", arg: 1, scope: !98, file: !1, line: 59, type: !5)
!102 = !DILocation(line: 0, scope: !98)
!103 = !DILocalVariable(name: "temp", scope: !98, file: !1, line: 60, type: !5)
!104 = !DILocation(line: 62, column: 2, scope: !98)
!105 = !DILocation(line: 62, column: 12, scope: !98)
!106 = !DILocation(line: 63, column: 22, scope: !107)
!107 = distinct !DILexicalBlock(scope: !98, file: !1, line: 62, column: 19)
!108 = !DILocation(line: 63, column: 3, scope: !107)
!109 = !DILocation(line: 64, column: 16, scope: !107)
!110 = distinct !{!110, !104, !111}
!111 = !DILocation(line: 65, column: 2, scope: !98)
!112 = !DILocation(line: 66, column: 2, scope: !98)
!113 = !DILocation(line: 67, column: 1, scope: !98)
!114 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 69, type: !115, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DISubroutineType(types: !116)
!116 = !{!11}
!117 = !DILocalVariable(name: "a", scope: !114, file: !1, line: 71, type: !5)
!118 = !DILocation(line: 71, column: 7, scope: !114)
!119 = !DILocalVariable(name: "i", scope: !114, file: !1, line: 72, type: !11)
!120 = !DILocation(line: 0, scope: !114)
!121 = !DILocation(line: 74, column: 6, scope: !122)
!122 = distinct !DILexicalBlock(scope: !114, file: !1, line: 74, column: 2)
!123 = !DILocation(line: 0, scope: !122)
!124 = !DILocation(line: 74, column: 11, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !1, line: 74, column: 2)
!126 = !DILocation(line: 74, column: 2, scope: !122)
!127 = !DILocation(line: 75, column: 3, scope: !125)
!128 = !DILocation(line: 74, column: 16, scope: !125)
!129 = !DILocation(line: 74, column: 2, scope: !125)
!130 = distinct !{!130, !126, !131}
!131 = !DILocation(line: 75, column: 17, scope: !122)
!132 = !DILocation(line: 77, column: 2, scope: !114)
!133 = !DILocation(line: 79, column: 12, scope: !114)
!134 = !DILocation(line: 79, column: 2, scope: !114)
!135 = !DILocation(line: 81, column: 15, scope: !114)
!136 = !DILocation(line: 81, column: 6, scope: !114)
!137 = !DILocalVariable(name: "b", scope: !114, file: !1, line: 71, type: !5)
!138 = !DILocation(line: 83, column: 7, scope: !114)
!139 = !DILocation(line: 83, column: 2, scope: !114)
!140 = !DILocation(line: 85, column: 2, scope: !114)
!141 = !DILocation(line: 87, column: 2, scope: !114)
!142 = !DILocation(line: 89, column: 2, scope: !114)
