; ModuleID = 'arena-storage-pool-7.ll'
source_filename = "arena-storage-pool-7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__ALLOCC_ENTRY__ = type { i8*, i64, %struct.__ALLOCC_ENTRY__* }

@__ALLOCC_ROOT__ = dso_local global %struct.__ALLOCC_ENTRY__* null, align 8, !dbg !0
@__ALLOCC_TAIL__ = dso_local global %struct.__ALLOCC_ENTRY__* null, align 8, !dbg !19
@.str = private unnamed_addr constant [14 x i8] c"p1[%d] == %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_add_mem_entry(i8* %location, i64 %size) #0 !dbg !25 {
entry:
  call void @llvm.dbg.value(metadata i8* %location, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i64 %size, metadata !30, metadata !DIExpression()), !dbg !29
  %call = call i8* @mmap(i8* null, i64 24, i32 3, i32 34, i32 -1, i64 0) #4, !dbg !31
  %0 = bitcast i8* %call to %struct.__ALLOCC_ENTRY__*, !dbg !32
  call void @llvm.dbg.value(metadata %struct.__ALLOCC_ENTRY__* %0, metadata !33, metadata !DIExpression()), !dbg !29
  %1 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !34
  %cmp = icmp ne %struct.__ALLOCC_ENTRY__* %1, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %2 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !38
  %next = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %2, i32 0, i32 2, !dbg !40
  store %struct.__ALLOCC_ENTRY__* %0, %struct.__ALLOCC_ENTRY__** %next, align 8, !dbg !41
  %3 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !42
  %next1 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %3, i32 0, i32 2, !dbg !43
  %4 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next1, align 8, !dbg !43
  store %struct.__ALLOCC_ENTRY__* %4, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !44
  br label %if.end, !dbg !45

if.else:                                          ; preds = %entry
  store %struct.__ALLOCC_ENTRY__* %0, %struct.__ALLOCC_ENTRY__** @__ALLOCC_ROOT__, align 8, !dbg !46
  store %struct.__ALLOCC_ENTRY__* %0, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !48
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !49
  call void @llvm.dbg.value(metadata %struct.__ALLOCC_ENTRY__* %5, metadata !50, metadata !DIExpression()), !dbg !29
  %allocatedAddr = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %5, i32 0, i32 0, !dbg !51
  store i8* %location, i8** %allocatedAddr, align 8, !dbg !52
  %size2 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %5, i32 0, i32 1, !dbg !53
  store i64 %size, i64* %size2, align 8, !dbg !54
  %next3 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %5, i32 0, i32 2, !dbg !55
  store %struct.__ALLOCC_ENTRY__* null, %struct.__ALLOCC_ENTRY__** %next3, align 8, !dbg !56
  store %struct.__ALLOCC_ENTRY__* %5, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @mmap(i8*, i64, i32, i32, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @_remove_mem_entry(i8* %location) #0 !dbg !59 {
entry:
  call void @llvm.dbg.value(metadata i8* %location, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_ROOT__, align 8, !dbg !64
  call void @llvm.dbg.value(metadata %struct.__ALLOCC_ENTRY__* %0, metadata !65, metadata !DIExpression()), !dbg !63
  %cmp = icmp eq %struct.__ALLOCC_ENTRY__* %0, null, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !68

if.then:                                          ; preds = %entry
  br label %return, !dbg !69

if.end:                                           ; preds = %entry
  %allocatedAddr = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %0, i32 0, i32 0, !dbg !71
  %1 = load i8*, i8** %allocatedAddr, align 8, !dbg !71
  %cmp1 = icmp eq i8* %1, %location, !dbg !73
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !74

if.then2:                                         ; preds = %if.end
  %next = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %0, i32 0, i32 2, !dbg !75
  %2 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next, align 8, !dbg !75
  store %struct.__ALLOCC_ENTRY__* %2, %struct.__ALLOCC_ENTRY__** @__ALLOCC_ROOT__, align 8, !dbg !77
  %size = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %0, i32 0, i32 1, !dbg !78
  %3 = load i64, i64* %size, align 8, !dbg !78
  call void @llvm.dbg.value(metadata i64 %3, metadata !79, metadata !DIExpression()), !dbg !80
  %4 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_ROOT__, align 8, !dbg !81
  %cmp3 = icmp eq %struct.__ALLOCC_ENTRY__* %4, null, !dbg !83
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !84

if.then4:                                         ; preds = %if.then2
  store %struct.__ALLOCC_ENTRY__* null, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !85
  br label %if.end5, !dbg !87

if.end5:                                          ; preds = %if.then4, %if.then2
  %5 = bitcast %struct.__ALLOCC_ENTRY__* %0 to i8*, !dbg !88
  %call = call i32 @munmap(i8* %5, i64 24) #4, !dbg !89
  br label %return, !dbg !90

if.end6:                                          ; preds = %if.end
  br label %while.cond, !dbg !91

while.cond:                                       ; preds = %if.end22, %if.end6
  %curNode.0 = phi %struct.__ALLOCC_ENTRY__* [ %0, %if.end6 ], [ %7, %if.end22 ], !dbg !63
  call void @llvm.dbg.value(metadata %struct.__ALLOCC_ENTRY__* %curNode.0, metadata !65, metadata !DIExpression()), !dbg !63
  %next7 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %curNode.0, i32 0, i32 2, !dbg !92
  %6 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next7, align 8, !dbg !92
  %cmp8 = icmp ne %struct.__ALLOCC_ENTRY__* %6, null, !dbg !93
  br i1 %cmp8, label %while.body, label %while.end, !dbg !91

while.body:                                       ; preds = %while.cond
  %next9 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %curNode.0, i32 0, i32 2, !dbg !94
  %7 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next9, align 8, !dbg !94
  call void @llvm.dbg.value(metadata %struct.__ALLOCC_ENTRY__* %7, metadata !96, metadata !DIExpression()), !dbg !97
  %allocatedAddr10 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %7, i32 0, i32 0, !dbg !98
  %8 = load i8*, i8** %allocatedAddr10, align 8, !dbg !98
  %cmp11 = icmp eq i8* %8, %location, !dbg !100
  br i1 %cmp11, label %if.then12, label %if.end22, !dbg !101

if.then12:                                        ; preds = %while.body
  %size14 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %7, i32 0, i32 1, !dbg !102
  %9 = load i64, i64* %size14, align 8, !dbg !102
  call void @llvm.dbg.value(metadata i64 %9, metadata !104, metadata !DIExpression()), !dbg !105
  %next15 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %curNode.0, i32 0, i32 2, !dbg !106
  %10 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next15, align 8, !dbg !106
  %11 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !108
  %cmp16 = icmp eq %struct.__ALLOCC_ENTRY__* %10, %11, !dbg !109
  br i1 %cmp16, label %if.then17, label %if.end18, !dbg !110

if.then17:                                        ; preds = %if.then12
  store %struct.__ALLOCC_ENTRY__* %curNode.0, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !111
  br label %if.end18, !dbg !113

if.end18:                                         ; preds = %if.then17, %if.then12
  %next19 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %7, i32 0, i32 2, !dbg !114
  %12 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next19, align 8, !dbg !114
  %next20 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %curNode.0, i32 0, i32 2, !dbg !115
  store %struct.__ALLOCC_ENTRY__* %12, %struct.__ALLOCC_ENTRY__** %next20, align 8, !dbg !116
  %13 = bitcast %struct.__ALLOCC_ENTRY__* %7 to i8*, !dbg !117
  %call21 = call i32 @munmap(i8* %13, i64 24) #4, !dbg !118
  br label %return, !dbg !119

if.end22:                                         ; preds = %while.body
  call void @llvm.dbg.value(metadata %struct.__ALLOCC_ENTRY__* %7, metadata !65, metadata !DIExpression()), !dbg !63
  br label %while.cond, !dbg !91, !llvm.loop !120

while.end:                                        ; preds = %while.cond
  br label %return, !dbg !122

return:                                           ; preds = %while.end, %if.end18, %if.end5, %if.then
  %retval.0 = phi i64 [ 0, %if.then ], [ %3, %if.end5 ], [ %9, %if.end18 ], [ 0, %while.end ], !dbg !63
  ret i64 %retval.0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local i32 @munmap(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @customMalloc(i64 %size) #0 !dbg !124 {
entry:
  call void @llvm.dbg.value(metadata i64 %size, metadata !127, metadata !DIExpression()), !dbg !128
  %cmp = icmp eq i64 %size, 0, !dbg !129
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  br label %return, !dbg !132

if.end:                                           ; preds = %entry
  %call = call i8* @mmap(i8* null, i64 %size, i32 3, i32 34, i32 -1, i64 0) #4, !dbg !134
  call void @llvm.dbg.value(metadata i8* %call, metadata !135, metadata !DIExpression()), !dbg !128
  call void @_add_mem_entry(i8* %call, i64 %size), !dbg !136
  br label %return, !dbg !137

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i8* [ null, %if.then ], [ %call, %if.end ], !dbg !128
  ret i8* %retval.0, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @customFree(i8* %addr) #0 !dbg !139 {
entry:
  call void @llvm.dbg.value(metadata i8* %addr, metadata !142, metadata !DIExpression()), !dbg !143
  %call = call i64 @_remove_mem_entry(i8* %addr), !dbg !144
  call void @llvm.dbg.value(metadata i64 %call, metadata !145, metadata !DIExpression()), !dbg !143
  %call1 = call i32 @munmap(i8* %addr, i64 %call) #4, !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !148 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.value(metadata i8** %argv, metadata !158, metadata !DIExpression()), !dbg !157
  %call = call i8* @customMalloc(i64 16), !dbg !159
  %0 = bitcast i8* %call to i32*, !dbg !159
  call void @llvm.dbg.value(metadata i32* %0, metadata !160, metadata !DIExpression()), !dbg !157
  %call1 = call i8* @customMalloc(i64 16), !dbg !162
  %1 = bitcast i8* %call1 to i32*, !dbg !162
  call void @llvm.dbg.value(metadata i32* %1, metadata !163, metadata !DIExpression()), !dbg !157
  %call2 = call i8* @customMalloc(i64 16), !dbg !164
  %2 = bitcast i8* %call2 to i32*, !dbg !164
  call void @llvm.dbg.value(metadata i32* %2, metadata !165, metadata !DIExpression()), !dbg !157
  %tobool = icmp ne i32* %0, null, !dbg !166
  br i1 %tobool, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !169, metadata !DIExpression()), !dbg !172
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.then
  %n.0 = phi i32 [ 0, %if.then ], [ %inc, %for.inc ], !dbg !172
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !169, metadata !DIExpression()), !dbg !172
  %cmp = icmp slt i32 %n.0, 4, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %n.0, %n.0, !dbg !177
  %idxprom = sext i32 %n.0 to i64, !dbg !178
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom, !dbg !178
  store i32 %mul, i32* %arrayidx, align 4, !dbg !179
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %n.0, 1, !dbg !180
  call void @llvm.dbg.value(metadata i32 %inc, metadata !169, metadata !DIExpression()), !dbg !172
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !184, metadata !DIExpression()), !dbg !186
  br label %for.cond4, !dbg !187

for.cond4:                                        ; preds = %for.inc10, %for.end
  %n3.0 = phi i32 [ 0, %for.end ], [ %inc11, %for.inc10 ], !dbg !186
  call void @llvm.dbg.value(metadata i32 %n3.0, metadata !184, metadata !DIExpression()), !dbg !186
  %cmp5 = icmp slt i32 %n3.0, 4, !dbg !188
  br i1 %cmp5, label %for.body6, label %for.end12, !dbg !190

for.body6:                                        ; preds = %for.cond4
  %idxprom7 = sext i32 %n3.0 to i64, !dbg !191
  %arrayidx8 = getelementptr inbounds i32, i32* %0, i64 %idxprom7, !dbg !191
  %3 = load i32, i32* %arrayidx8, align 4, !dbg !191
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %n3.0, i32 %3), !dbg !192
  br label %for.inc10, !dbg !192

for.inc10:                                        ; preds = %for.body6
  %inc11 = add nsw i32 %n3.0, 1, !dbg !193
  call void @llvm.dbg.value(metadata i32 %inc11, metadata !184, metadata !DIExpression()), !dbg !186
  br label %for.cond4, !dbg !194, !llvm.loop !195

for.end12:                                        ; preds = %for.cond4
  br label %if.end, !dbg !197

if.end:                                           ; preds = %for.end12, %entry
  %4 = bitcast i32* %0 to i8*, !dbg !198
  call void @customFree(i8* %4), !dbg !199
  %5 = bitcast i32* %1 to i8*, !dbg !200
  call void @customFree(i8* %5), !dbg !201
  %6 = bitcast i32* %2 to i8*, !dbg !202
  call void @customFree(i8* %6), !dbg !203
  ret i32 0, !dbg !204
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ALLOCC_ROOT__", scope: !2, file: !3, line: 17, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !18, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "arena-storage-pool-7.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arena-storage-pool")
!4 = !{}
!5 = !{!6, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ALLOCC_ENTRY__", file: !3, line: 14, baseType: !8)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__ALLOCC_ENTRY__", file: !3, line: 8, size: 192, elements: !9)
!9 = !{!10, !12, !16}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "allocatedAddr", scope: !8, file: !3, line: 10, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !8, file: !3, line: 11, baseType: !13, size: 64, offset: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !14, line: 46, baseType: !15)
!14 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!15 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !8, file: !3, line: 12, baseType: !17, size: 64, offset: 128)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!18 = !{!0, !19}
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "__ALLOCC_TAIL__", scope: !2, file: !3, line: 18, type: !6, isLocal: false, isDefinition: true)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!25 = distinct !DISubprogram(name: "_add_mem_entry", scope: !3, file: !3, line: 21, type: !26, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !11, !13}
!28 = !DILocalVariable(name: "location", arg: 1, scope: !25, file: !3, line: 21, type: !11)
!29 = !DILocation(line: 0, scope: !25)
!30 = !DILocalVariable(name: "size", arg: 2, scope: !25, file: !3, line: 21, type: !13)
!31 = !DILocation(line: 24, column: 56, scope: !25)
!32 = !DILocation(line: 24, column: 35, scope: !25)
!33 = !DILocalVariable(name: "newEntry", scope: !25, file: !3, line: 24, type: !6)
!34 = !DILocation(line: 26, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !25, file: !3, line: 26, column: 9)
!36 = !DILocation(line: 26, column: 25, scope: !35)
!37 = !DILocation(line: 26, column: 9, scope: !25)
!38 = !DILocation(line: 28, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !3, line: 27, column: 5)
!40 = !DILocation(line: 28, column: 28, scope: !39)
!41 = !DILocation(line: 28, column: 33, scope: !39)
!42 = !DILocation(line: 29, column: 27, scope: !39)
!43 = !DILocation(line: 29, column: 46, scope: !39)
!44 = !DILocation(line: 29, column: 25, scope: !39)
!45 = !DILocation(line: 30, column: 5, scope: !39)
!46 = !DILocation(line: 34, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !35, file: !3, line: 32, column: 5)
!48 = !DILocation(line: 35, column: 25, scope: !47)
!49 = !DILocation(line: 38, column: 31, scope: !25)
!50 = !DILocalVariable(name: "tail", scope: !25, file: !3, line: 38, type: !6)
!51 = !DILocation(line: 39, column: 13, scope: !25)
!52 = !DILocation(line: 39, column: 27, scope: !25)
!53 = !DILocation(line: 40, column: 13, scope: !25)
!54 = !DILocation(line: 40, column: 18, scope: !25)
!55 = !DILocation(line: 41, column: 13, scope: !25)
!56 = !DILocation(line: 41, column: 18, scope: !25)
!57 = !DILocation(line: 42, column: 21, scope: !25)
!58 = !DILocation(line: 43, column: 1, scope: !25)
!59 = distinct !DISubprogram(name: "_remove_mem_entry", scope: !3, file: !3, line: 46, type: !60, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!13, !11}
!62 = !DILocalVariable(name: "location", arg: 1, scope: !59, file: !3, line: 46, type: !11)
!63 = !DILocation(line: 0, scope: !59)
!64 = !DILocation(line: 48, column: 34, scope: !59)
!65 = !DILocalVariable(name: "curNode", scope: !59, file: !3, line: 48, type: !6)
!66 = !DILocation(line: 51, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !59, file: !3, line: 51, column: 9)
!68 = !DILocation(line: 51, column: 9, scope: !59)
!69 = !DILocation(line: 53, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !3, line: 52, column: 5)
!71 = !DILocation(line: 57, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !59, file: !3, line: 57, column: 9)
!73 = !DILocation(line: 57, column: 34, scope: !72)
!74 = !DILocation(line: 57, column: 9, scope: !59)
!75 = !DILocation(line: 59, column: 38, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !3, line: 58, column: 5)
!77 = !DILocation(line: 59, column: 25, scope: !76)
!78 = !DILocation(line: 60, column: 39, scope: !76)
!79 = !DILocalVariable(name: "chunkSize", scope: !76, file: !3, line: 60, type: !13)
!80 = !DILocation(line: 0, scope: !76)
!81 = !DILocation(line: 63, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !3, line: 63, column: 13)
!83 = !DILocation(line: 63, column: 29, scope: !82)
!84 = !DILocation(line: 63, column: 13, scope: !76)
!85 = !DILocation(line: 65, column: 29, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !3, line: 64, column: 9)
!87 = !DILocation(line: 66, column: 9, scope: !86)
!88 = !DILocation(line: 67, column: 16, scope: !76)
!89 = !DILocation(line: 67, column: 9, scope: !76)
!90 = !DILocation(line: 69, column: 9, scope: !76)
!91 = !DILocation(line: 73, column: 5, scope: !59)
!92 = !DILocation(line: 73, column: 23, scope: !59)
!93 = !DILocation(line: 73, column: 28, scope: !59)
!94 = !DILocation(line: 75, column: 50, scope: !95)
!95 = distinct !DILexicalBlock(scope: !59, file: !3, line: 74, column: 5)
!96 = !DILocalVariable(name: "nextNode", scope: !95, file: !3, line: 75, type: !6)
!97 = !DILocation(line: 0, scope: !95)
!98 = !DILocation(line: 77, column: 25, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !3, line: 77, column: 13)
!100 = !DILocation(line: 77, column: 39, scope: !99)
!101 = !DILocation(line: 77, column: 13, scope: !95)
!102 = !DILocation(line: 79, column: 44, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 78, column: 9)
!104 = !DILocalVariable(name: "chunkSize", scope: !103, file: !3, line: 79, type: !13)
!105 = !DILocation(line: 0, scope: !103)
!106 = !DILocation(line: 81, column: 27, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !3, line: 81, column: 16)
!108 = !DILocation(line: 81, column: 35, scope: !107)
!109 = !DILocation(line: 81, column: 32, scope: !107)
!110 = !DILocation(line: 81, column: 16, scope: !103)
!111 = !DILocation(line: 83, column: 33, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !3, line: 82, column: 13)
!113 = !DILocation(line: 84, column: 13, scope: !112)
!114 = !DILocation(line: 85, column: 43, scope: !103)
!115 = !DILocation(line: 85, column: 24, scope: !103)
!116 = !DILocation(line: 85, column: 29, scope: !103)
!117 = !DILocation(line: 86, column: 20, scope: !103)
!118 = !DILocation(line: 86, column: 13, scope: !103)
!119 = !DILocation(line: 88, column: 13, scope: !103)
!120 = distinct !{!120, !91, !121}
!121 = !DILocation(line: 92, column: 5, scope: !59)
!122 = !DILocation(line: 95, column: 5, scope: !59)
!123 = !DILocation(line: 96, column: 1, scope: !59)
!124 = distinct !DISubprogram(name: "customMalloc", scope: !3, file: !3, line: 100, type: !125, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DISubroutineType(types: !126)
!126 = !{!11, !13}
!127 = !DILocalVariable(name: "size", arg: 1, scope: !124, file: !3, line: 100, type: !13)
!128 = !DILocation(line: 0, scope: !124)
!129 = !DILocation(line: 103, column: 14, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !3, line: 103, column: 9)
!131 = !DILocation(line: 103, column: 9, scope: !124)
!132 = !DILocation(line: 105, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !3, line: 104, column: 5)
!134 = !DILocation(line: 108, column: 21, scope: !124)
!135 = !DILocalVariable(name: "mapped", scope: !124, file: !3, line: 108, type: !11)
!136 = !DILocation(line: 111, column: 5, scope: !124)
!137 = !DILocation(line: 113, column: 5, scope: !124)
!138 = !DILocation(line: 114, column: 1, scope: !124)
!139 = distinct !DISubprogram(name: "customFree", scope: !3, file: !3, line: 117, type: !140, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DISubroutineType(types: !141)
!141 = !{null, !11}
!142 = !DILocalVariable(name: "addr", arg: 1, scope: !139, file: !3, line: 117, type: !11)
!143 = !DILocation(line: 0, scope: !139)
!144 = !DILocation(line: 119, column: 19, scope: !139)
!145 = !DILocalVariable(name: "size", scope: !139, file: !3, line: 119, type: !13)
!146 = !DILocation(line: 121, column: 5, scope: !139)
!147 = !DILocation(line: 122, column: 1, scope: !139)
!148 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 124, type: !149, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!149 = !DISubroutineType(types: !150)
!150 = !{!151, !151, !152}
!151 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!154 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !155)
!155 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!156 = !DILocalVariable(name: "argc", arg: 1, scope: !148, file: !3, line: 124, type: !151)
!157 = !DILocation(line: 0, scope: !148)
!158 = !DILocalVariable(name: "argv", arg: 2, scope: !148, file: !3, line: 124, type: !152)
!159 = !DILocation(line: 126, column: 15, scope: !148)
!160 = !DILocalVariable(name: "p1", scope: !148, file: !3, line: 126, type: !161)
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !151, size: 64)
!162 = !DILocation(line: 127, column: 15, scope: !148)
!163 = !DILocalVariable(name: "p2", scope: !148, file: !3, line: 127, type: !161)
!164 = !DILocation(line: 128, column: 15, scope: !148)
!165 = !DILocalVariable(name: "p3", scope: !148, file: !3, line: 128, type: !161)
!166 = !DILocation(line: 130, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !148, file: !3, line: 130, column: 8)
!168 = !DILocation(line: 130, column: 8, scope: !148)
!169 = !DILocalVariable(name: "n", scope: !170, file: !3, line: 131, type: !151)
!170 = distinct !DILexicalBlock(scope: !171, file: !3, line: 131, column: 9)
!171 = distinct !DILexicalBlock(scope: !167, file: !3, line: 130, column: 12)
!172 = !DILocation(line: 0, scope: !170)
!173 = !DILocation(line: 131, column: 13, scope: !170)
!174 = !DILocation(line: 131, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !3, line: 131, column: 9)
!176 = !DILocation(line: 131, column: 9, scope: !170)
!177 = !DILocation(line: 132, column: 22, scope: !175)
!178 = !DILocation(line: 132, column: 13, scope: !175)
!179 = !DILocation(line: 132, column: 19, scope: !175)
!180 = !DILocation(line: 131, column: 27, scope: !175)
!181 = !DILocation(line: 131, column: 9, scope: !175)
!182 = distinct !{!182, !176, !183}
!183 = !DILocation(line: 132, column: 23, scope: !170)
!184 = !DILocalVariable(name: "n", scope: !185, file: !3, line: 133, type: !151)
!185 = distinct !DILexicalBlock(scope: !171, file: !3, line: 133, column: 9)
!186 = !DILocation(line: 0, scope: !185)
!187 = !DILocation(line: 133, column: 13, scope: !185)
!188 = !DILocation(line: 133, column: 23, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !3, line: 133, column: 9)
!190 = !DILocation(line: 133, column: 9, scope: !185)
!191 = !DILocation(line: 134, column: 41, scope: !189)
!192 = !DILocation(line: 134, column: 13, scope: !189)
!193 = !DILocation(line: 133, column: 27, scope: !189)
!194 = !DILocation(line: 133, column: 9, scope: !189)
!195 = distinct !{!195, !190, !196}
!196 = !DILocation(line: 134, column: 46, scope: !185)
!197 = !DILocation(line: 135, column: 5, scope: !171)
!198 = !DILocation(line: 137, column: 16, scope: !148)
!199 = !DILocation(line: 137, column: 5, scope: !148)
!200 = !DILocation(line: 138, column: 16, scope: !148)
!201 = !DILocation(line: 138, column: 5, scope: !148)
!202 = !DILocation(line: 139, column: 16, scope: !148)
!203 = !DILocation(line: 139, column: 5, scope: !148)
!204 = !DILocation(line: 141, column: 5, scope: !148)
