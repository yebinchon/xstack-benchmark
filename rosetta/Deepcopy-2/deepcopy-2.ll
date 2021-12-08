; ModuleID = 'deepcopy-2.bc'
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
  %a.addr = alloca %struct.elem**, align 8
  %num.addr = alloca i32, align 4
  %temp = alloca %struct.elem*, align 8
  %holder = alloca %struct.elem*, align 8
  store %struct.elem** %a, %struct.elem*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.elem*** %a.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct.elem** %temp, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %struct.elem** %holder, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load %struct.elem**, %struct.elem*** %a.addr, align 8, !dbg !30
  %1 = load %struct.elem*, %struct.elem** %0, align 8, !dbg !32
  %cmp = icmp eq %struct.elem* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !35
  %2 = bitcast i8* %call to %struct.elem*, !dbg !37
  %3 = load %struct.elem**, %struct.elem*** %a.addr, align 8, !dbg !38
  store %struct.elem* %2, %struct.elem** %3, align 8, !dbg !39
  %4 = load i32, i32* %num.addr, align 4, !dbg !40
  %5 = load %struct.elem**, %struct.elem*** %a.addr, align 8, !dbg !41
  %6 = load %struct.elem*, %struct.elem** %5, align 8, !dbg !42
  %data = getelementptr inbounds %struct.elem, %struct.elem* %6, i32 0, i32 0, !dbg !43
  store i32 %4, i32* %data, align 8, !dbg !44
  %7 = load %struct.elem**, %struct.elem*** %a.addr, align 8, !dbg !45
  %8 = load %struct.elem*, %struct.elem** %7, align 8, !dbg !46
  %next = getelementptr inbounds %struct.elem, %struct.elem* %8, i32 0, i32 1, !dbg !47
  store %struct.elem* null, %struct.elem** %next, align 8, !dbg !48
  br label %if.end, !dbg !49

if.else:                                          ; preds = %entry
  %9 = load %struct.elem**, %struct.elem*** %a.addr, align 8, !dbg !50
  %10 = load %struct.elem*, %struct.elem** %9, align 8, !dbg !52
  store %struct.elem* %10, %struct.elem** %temp, align 8, !dbg !53
  br label %while.cond, !dbg !54

while.cond:                                       ; preds = %while.body, %if.else
  %11 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !55
  %next1 = getelementptr inbounds %struct.elem, %struct.elem* %11, i32 0, i32 1, !dbg !56
  %12 = load %struct.elem*, %struct.elem** %next1, align 8, !dbg !56
  %cmp2 = icmp ne %struct.elem* %12, null, !dbg !57
  br i1 %cmp2, label %while.body, label %while.end, !dbg !54

while.body:                                       ; preds = %while.cond
  %13 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !58
  %next3 = getelementptr inbounds %struct.elem, %struct.elem* %13, i32 0, i32 1, !dbg !59
  %14 = load %struct.elem*, %struct.elem** %next3, align 8, !dbg !59
  store %struct.elem* %14, %struct.elem** %temp, align 8, !dbg !60
  br label %while.cond, !dbg !54, !llvm.loop !61

while.end:                                        ; preds = %while.cond
  %call4 = call noalias i8* @malloc(i64 16) #4, !dbg !62
  %15 = bitcast i8* %call4 to %struct.elem*, !dbg !63
  store %struct.elem* %15, %struct.elem** %holder, align 8, !dbg !64
  %16 = load i32, i32* %num.addr, align 4, !dbg !65
  %17 = load %struct.elem*, %struct.elem** %holder, align 8, !dbg !66
  %data5 = getelementptr inbounds %struct.elem, %struct.elem* %17, i32 0, i32 0, !dbg !67
  store i32 %16, i32* %data5, align 8, !dbg !68
  %18 = load %struct.elem*, %struct.elem** %holder, align 8, !dbg !69
  %next6 = getelementptr inbounds %struct.elem, %struct.elem* %18, i32 0, i32 1, !dbg !70
  store %struct.elem* null, %struct.elem** %next6, align 8, !dbg !71
  %19 = load %struct.elem*, %struct.elem** %holder, align 8, !dbg !72
  %20 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !73
  %next7 = getelementptr inbounds %struct.elem, %struct.elem* %20, i32 0, i32 1, !dbg !74
  store %struct.elem* %19, %struct.elem** %next7, align 8, !dbg !75
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  ret void, !dbg !76
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.elem* @copyList(%struct.elem* %a) #0 !dbg !77 {
entry:
  %a.addr = alloca %struct.elem*, align 8
  %b = alloca %struct.elem*, align 8
  %tempA = alloca %struct.elem*, align 8
  %tempB = alloca %struct.elem*, align 8
  %temp = alloca %struct.elem*, align 8
  store %struct.elem* %a, %struct.elem** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.elem** %a.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.elem** %b, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.elem** %tempA, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.elem** %tempB, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %struct.elem** %temp, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = load %struct.elem*, %struct.elem** %a.addr, align 8, !dbg !90
  %cmp = icmp ne %struct.elem* %0, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !94
  %1 = bitcast i8* %call to %struct.elem*, !dbg !96
  store %struct.elem* %1, %struct.elem** %b, align 8, !dbg !97
  %2 = load %struct.elem*, %struct.elem** %a.addr, align 8, !dbg !98
  %data = getelementptr inbounds %struct.elem, %struct.elem* %2, i32 0, i32 0, !dbg !99
  %3 = load i32, i32* %data, align 8, !dbg !99
  %4 = load %struct.elem*, %struct.elem** %b, align 8, !dbg !100
  %data1 = getelementptr inbounds %struct.elem, %struct.elem* %4, i32 0, i32 0, !dbg !101
  store i32 %3, i32* %data1, align 8, !dbg !102
  %5 = load %struct.elem*, %struct.elem** %b, align 8, !dbg !103
  %next = getelementptr inbounds %struct.elem, %struct.elem* %5, i32 0, i32 1, !dbg !104
  store %struct.elem* null, %struct.elem** %next, align 8, !dbg !105
  %6 = load %struct.elem*, %struct.elem** %a.addr, align 8, !dbg !106
  %next2 = getelementptr inbounds %struct.elem, %struct.elem* %6, i32 0, i32 1, !dbg !107
  %7 = load %struct.elem*, %struct.elem** %next2, align 8, !dbg !107
  store %struct.elem* %7, %struct.elem** %tempA, align 8, !dbg !108
  %8 = load %struct.elem*, %struct.elem** %b, align 8, !dbg !109
  store %struct.elem* %8, %struct.elem** %tempB, align 8, !dbg !110
  br label %while.cond, !dbg !111

while.cond:                                       ; preds = %while.body, %if.then
  %9 = load %struct.elem*, %struct.elem** %tempA, align 8, !dbg !112
  %cmp3 = icmp ne %struct.elem* %9, null, !dbg !113
  br i1 %cmp3, label %while.body, label %while.end, !dbg !111

while.body:                                       ; preds = %while.cond
  %call4 = call noalias i8* @malloc(i64 16) #4, !dbg !114
  %10 = bitcast i8* %call4 to %struct.elem*, !dbg !116
  store %struct.elem* %10, %struct.elem** %temp, align 8, !dbg !117
  %11 = load %struct.elem*, %struct.elem** %tempA, align 8, !dbg !118
  %data5 = getelementptr inbounds %struct.elem, %struct.elem* %11, i32 0, i32 0, !dbg !119
  %12 = load i32, i32* %data5, align 8, !dbg !119
  %13 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !120
  %data6 = getelementptr inbounds %struct.elem, %struct.elem* %13, i32 0, i32 0, !dbg !121
  store i32 %12, i32* %data6, align 8, !dbg !122
  %14 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !123
  %next7 = getelementptr inbounds %struct.elem, %struct.elem* %14, i32 0, i32 1, !dbg !124
  store %struct.elem* null, %struct.elem** %next7, align 8, !dbg !125
  %15 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !126
  %16 = load %struct.elem*, %struct.elem** %tempB, align 8, !dbg !127
  %next8 = getelementptr inbounds %struct.elem, %struct.elem* %16, i32 0, i32 1, !dbg !128
  store %struct.elem* %15, %struct.elem** %next8, align 8, !dbg !129
  %17 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !130
  store %struct.elem* %17, %struct.elem** %tempB, align 8, !dbg !131
  %18 = load %struct.elem*, %struct.elem** %tempA, align 8, !dbg !132
  %next9 = getelementptr inbounds %struct.elem, %struct.elem* %18, i32 0, i32 1, !dbg !133
  %19 = load %struct.elem*, %struct.elem** %next9, align 8, !dbg !133
  store %struct.elem* %19, %struct.elem** %tempA, align 8, !dbg !134
  br label %while.cond, !dbg !111, !llvm.loop !135

while.end:                                        ; preds = %while.cond
  br label %if.end, !dbg !137

if.end:                                           ; preds = %while.end, %entry
  %20 = load %struct.elem*, %struct.elem** %b, align 8, !dbg !138
  ret %struct.elem* %20, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printList(%struct.elem* %a) #0 !dbg !140 {
entry:
  %a.addr = alloca %struct.elem*, align 8
  %temp = alloca %struct.elem*, align 8
  store %struct.elem* %a, %struct.elem** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.elem** %a.addr, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata %struct.elem** %temp, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = load %struct.elem*, %struct.elem** %a.addr, align 8, !dbg !147
  store %struct.elem* %0, %struct.elem** %temp, align 8, !dbg !146
  br label %while.cond, !dbg !148

while.cond:                                       ; preds = %while.body, %entry
  %1 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !149
  %cmp = icmp ne %struct.elem* %1, null, !dbg !150
  br i1 %cmp, label %while.body, label %while.end, !dbg !148

while.body:                                       ; preds = %while.cond
  %2 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !151
  %data = getelementptr inbounds %struct.elem, %struct.elem* %2, i32 0, i32 0, !dbg !153
  %3 = load i32, i32* %data, align 8, !dbg !153
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %3), !dbg !154
  %4 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !155
  %next = getelementptr inbounds %struct.elem, %struct.elem* %4, i32 0, i32 1, !dbg !156
  %5 = load %struct.elem*, %struct.elem** %next, align 8, !dbg !156
  store %struct.elem* %5, %struct.elem** %temp, align 8, !dbg !157
  br label %while.cond, !dbg !148, !llvm.loop !158

while.end:                                        ; preds = %while.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !160
  ret void, !dbg !161
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !162 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.elem*, align 8
  %b = alloca %struct.elem*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.elem** %a, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata %struct.elem** %b, metadata !167, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata i32* %i, metadata !169, metadata !DIExpression()), !dbg !170
  store i32 1, i32* %i, align 4, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !174
  %cmp = icmp sle i32 %0, 5, !dbg !176
  br i1 %cmp, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !178
  call void @addToList(%struct.elem** %a, i32 %1), !dbg !179
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !180
  %inc = add nsw i32 %2, 1, !dbg !180
  store i32 %inc, i32* %i, align 4, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0)), !dbg !184
  %3 = load %struct.elem*, %struct.elem** %a, align 8, !dbg !185
  call void @printList(%struct.elem* %3), !dbg !186
  %4 = load %struct.elem*, %struct.elem** %a, align 8, !dbg !187
  %call1 = call %struct.elem* @copyList(%struct.elem* %4), !dbg !188
  store %struct.elem* %call1, %struct.elem** %b, align 8, !dbg !189
  %5 = load %struct.elem*, %struct.elem** %a, align 8, !dbg !190
  %6 = bitcast %struct.elem* %5 to i8*, !dbg !190
  call void @free(i8* %6) #4, !dbg !191
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.3, i64 0, i64 0)), !dbg !192
  %7 = load %struct.elem*, %struct.elem** %b, align 8, !dbg !193
  call void @printList(%struct.elem* %7), !dbg !194
  ret i32 0, !dbg !195
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

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
!23 = !DILocation(line: 11, column: 22, scope: !18)
!24 = !DILocalVariable(name: "num", arg: 2, scope: !18, file: !1, line: 11, type: !11)
!25 = !DILocation(line: 11, column: 28, scope: !18)
!26 = !DILocalVariable(name: "temp", scope: !18, file: !1, line: 12, type: !5)
!27 = !DILocation(line: 12, column: 7, scope: !18)
!28 = !DILocalVariable(name: "holder", scope: !18, file: !1, line: 12, type: !5)
!29 = !DILocation(line: 12, column: 13, scope: !18)
!30 = !DILocation(line: 14, column: 6, scope: !31)
!31 = distinct !DILexicalBlock(scope: !18, file: !1, line: 14, column: 5)
!32 = !DILocation(line: 14, column: 5, scope: !31)
!33 = !DILocation(line: 14, column: 7, scope: !31)
!34 = !DILocation(line: 14, column: 5, scope: !18)
!35 = !DILocation(line: 15, column: 14, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !1, line: 14, column: 14)
!37 = !DILocation(line: 15, column: 8, scope: !36)
!38 = !DILocation(line: 15, column: 4, scope: !36)
!39 = !DILocation(line: 15, column: 6, scope: !36)
!40 = !DILocation(line: 16, column: 16, scope: !36)
!41 = !DILocation(line: 16, column: 5, scope: !36)
!42 = !DILocation(line: 16, column: 4, scope: !36)
!43 = !DILocation(line: 16, column: 9, scope: !36)
!44 = !DILocation(line: 16, column: 14, scope: !36)
!45 = !DILocation(line: 17, column: 5, scope: !36)
!46 = !DILocation(line: 17, column: 4, scope: !36)
!47 = !DILocation(line: 17, column: 9, scope: !36)
!48 = !DILocation(line: 17, column: 14, scope: !36)
!49 = !DILocation(line: 18, column: 2, scope: !36)
!50 = !DILocation(line: 20, column: 11, scope: !51)
!51 = distinct !DILexicalBlock(scope: !31, file: !1, line: 19, column: 6)
!52 = !DILocation(line: 20, column: 10, scope: !51)
!53 = !DILocation(line: 20, column: 8, scope: !51)
!54 = !DILocation(line: 22, column: 3, scope: !51)
!55 = !DILocation(line: 22, column: 9, scope: !51)
!56 = !DILocation(line: 22, column: 15, scope: !51)
!57 = !DILocation(line: 22, column: 19, scope: !51)
!58 = !DILocation(line: 23, column: 11, scope: !51)
!59 = !DILocation(line: 23, column: 17, scope: !51)
!60 = !DILocation(line: 23, column: 9, scope: !51)
!61 = distinct !{!61, !54, !59}
!62 = !DILocation(line: 25, column: 18, scope: !51)
!63 = !DILocation(line: 25, column: 12, scope: !51)
!64 = !DILocation(line: 25, column: 10, scope: !51)
!65 = !DILocation(line: 26, column: 18, scope: !51)
!66 = !DILocation(line: 26, column: 3, scope: !51)
!67 = !DILocation(line: 26, column: 11, scope: !51)
!68 = !DILocation(line: 26, column: 16, scope: !51)
!69 = !DILocation(line: 27, column: 3, scope: !51)
!70 = !DILocation(line: 27, column: 11, scope: !51)
!71 = !DILocation(line: 27, column: 16, scope: !51)
!72 = !DILocation(line: 29, column: 16, scope: !51)
!73 = !DILocation(line: 29, column: 3, scope: !51)
!74 = !DILocation(line: 29, column: 9, scope: !51)
!75 = !DILocation(line: 29, column: 14, scope: !51)
!76 = !DILocation(line: 31, column: 1, scope: !18)
!77 = distinct !DISubprogram(name: "copyList", scope: !1, file: !1, line: 33, type: !78, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!5, !5}
!80 = !DILocalVariable(name: "a", arg: 1, scope: !77, file: !1, line: 33, type: !5)
!81 = !DILocation(line: 33, column: 20, scope: !77)
!82 = !DILocalVariable(name: "b", scope: !77, file: !1, line: 34, type: !5)
!83 = !DILocation(line: 34, column: 7, scope: !77)
!84 = !DILocalVariable(name: "tempA", scope: !77, file: !1, line: 34, type: !5)
!85 = !DILocation(line: 34, column: 10, scope: !77)
!86 = !DILocalVariable(name: "tempB", scope: !77, file: !1, line: 34, type: !5)
!87 = !DILocation(line: 34, column: 17, scope: !77)
!88 = !DILocalVariable(name: "temp", scope: !77, file: !1, line: 34, type: !5)
!89 = !DILocation(line: 34, column: 24, scope: !77)
!90 = !DILocation(line: 36, column: 5, scope: !91)
!91 = distinct !DILexicalBlock(scope: !77, file: !1, line: 36, column: 5)
!92 = !DILocation(line: 36, column: 6, scope: !91)
!93 = !DILocation(line: 36, column: 5, scope: !77)
!94 = !DILocation(line: 37, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !1, line: 36, column: 13)
!96 = !DILocation(line: 37, column: 7, scope: !95)
!97 = !DILocation(line: 37, column: 5, scope: !95)
!98 = !DILocation(line: 38, column: 13, scope: !95)
!99 = !DILocation(line: 38, column: 16, scope: !95)
!100 = !DILocation(line: 38, column: 3, scope: !95)
!101 = !DILocation(line: 38, column: 6, scope: !95)
!102 = !DILocation(line: 38, column: 11, scope: !95)
!103 = !DILocation(line: 39, column: 3, scope: !95)
!104 = !DILocation(line: 39, column: 6, scope: !95)
!105 = !DILocation(line: 39, column: 11, scope: !95)
!106 = !DILocation(line: 41, column: 11, scope: !95)
!107 = !DILocation(line: 41, column: 14, scope: !95)
!108 = !DILocation(line: 41, column: 9, scope: !95)
!109 = !DILocation(line: 42, column: 11, scope: !95)
!110 = !DILocation(line: 42, column: 9, scope: !95)
!111 = !DILocation(line: 44, column: 3, scope: !95)
!112 = !DILocation(line: 44, column: 9, scope: !95)
!113 = !DILocation(line: 44, column: 14, scope: !95)
!114 = !DILocation(line: 45, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !95, file: !1, line: 44, column: 21)
!116 = !DILocation(line: 45, column: 11, scope: !115)
!117 = !DILocation(line: 45, column: 9, scope: !115)
!118 = !DILocation(line: 46, column: 17, scope: !115)
!119 = !DILocation(line: 46, column: 24, scope: !115)
!120 = !DILocation(line: 46, column: 4, scope: !115)
!121 = !DILocation(line: 46, column: 10, scope: !115)
!122 = !DILocation(line: 46, column: 15, scope: !115)
!123 = !DILocation(line: 47, column: 4, scope: !115)
!124 = !DILocation(line: 47, column: 10, scope: !115)
!125 = !DILocation(line: 47, column: 15, scope: !115)
!126 = !DILocation(line: 49, column: 18, scope: !115)
!127 = !DILocation(line: 49, column: 4, scope: !115)
!128 = !DILocation(line: 49, column: 11, scope: !115)
!129 = !DILocation(line: 49, column: 16, scope: !115)
!130 = !DILocation(line: 50, column: 12, scope: !115)
!131 = !DILocation(line: 50, column: 10, scope: !115)
!132 = !DILocation(line: 52, column: 12, scope: !115)
!133 = !DILocation(line: 52, column: 19, scope: !115)
!134 = !DILocation(line: 52, column: 10, scope: !115)
!135 = distinct !{!135, !111, !136}
!136 = !DILocation(line: 53, column: 3, scope: !95)
!137 = !DILocation(line: 54, column: 2, scope: !95)
!138 = !DILocation(line: 56, column: 9, scope: !77)
!139 = !DILocation(line: 56, column: 2, scope: !77)
!140 = distinct !DISubprogram(name: "printList", scope: !1, file: !1, line: 59, type: !141, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!141 = !DISubroutineType(types: !142)
!142 = !{null, !5}
!143 = !DILocalVariable(name: "a", arg: 1, scope: !140, file: !1, line: 59, type: !5)
!144 = !DILocation(line: 59, column: 21, scope: !140)
!145 = !DILocalVariable(name: "temp", scope: !140, file: !1, line: 60, type: !5)
!146 = !DILocation(line: 60, column: 7, scope: !140)
!147 = !DILocation(line: 60, column: 14, scope: !140)
!148 = !DILocation(line: 62, column: 2, scope: !140)
!149 = !DILocation(line: 62, column: 8, scope: !140)
!150 = !DILocation(line: 62, column: 12, scope: !140)
!151 = !DILocation(line: 63, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !140, file: !1, line: 62, column: 19)
!153 = !DILocation(line: 63, column: 22, scope: !152)
!154 = !DILocation(line: 63, column: 3, scope: !152)
!155 = !DILocation(line: 64, column: 10, scope: !152)
!156 = !DILocation(line: 64, column: 16, scope: !152)
!157 = !DILocation(line: 64, column: 8, scope: !152)
!158 = distinct !{!158, !148, !159}
!159 = !DILocation(line: 65, column: 2, scope: !140)
!160 = !DILocation(line: 66, column: 2, scope: !140)
!161 = !DILocation(line: 67, column: 1, scope: !140)
!162 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 69, type: !163, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!163 = !DISubroutineType(types: !164)
!164 = !{!11}
!165 = !DILocalVariable(name: "a", scope: !162, file: !1, line: 71, type: !5)
!166 = !DILocation(line: 71, column: 7, scope: !162)
!167 = !DILocalVariable(name: "b", scope: !162, file: !1, line: 71, type: !5)
!168 = !DILocation(line: 71, column: 9, scope: !162)
!169 = !DILocalVariable(name: "i", scope: !162, file: !1, line: 72, type: !11)
!170 = !DILocation(line: 72, column: 6, scope: !162)
!171 = !DILocation(line: 74, column: 7, scope: !172)
!172 = distinct !DILexicalBlock(scope: !162, file: !1, line: 74, column: 2)
!173 = !DILocation(line: 74, column: 6, scope: !172)
!174 = !DILocation(line: 74, column: 10, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !1, line: 74, column: 2)
!176 = !DILocation(line: 74, column: 11, scope: !175)
!177 = !DILocation(line: 74, column: 2, scope: !172)
!178 = !DILocation(line: 75, column: 16, scope: !175)
!179 = !DILocation(line: 75, column: 3, scope: !175)
!180 = !DILocation(line: 74, column: 16, scope: !175)
!181 = !DILocation(line: 74, column: 2, scope: !175)
!182 = distinct !{!182, !177, !183}
!183 = !DILocation(line: 75, column: 17, scope: !172)
!184 = !DILocation(line: 77, column: 2, scope: !162)
!185 = !DILocation(line: 79, column: 12, scope: !162)
!186 = !DILocation(line: 79, column: 2, scope: !162)
!187 = !DILocation(line: 81, column: 15, scope: !162)
!188 = !DILocation(line: 81, column: 6, scope: !162)
!189 = !DILocation(line: 81, column: 4, scope: !162)
!190 = !DILocation(line: 83, column: 7, scope: !162)
!191 = !DILocation(line: 83, column: 2, scope: !162)
!192 = !DILocation(line: 85, column: 2, scope: !162)
!193 = !DILocation(line: 87, column: 12, scope: !162)
!194 = !DILocation(line: 87, column: 2, scope: !162)
!195 = !DILocation(line: 89, column: 2, scope: !162)
