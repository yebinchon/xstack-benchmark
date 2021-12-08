; ModuleID = 'delegates.ll'
source_filename = "delegates.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sDelegate = type { i8* (i32)* }
%struct.sDelegator = type { i32, i8*, %struct.sDelegate* }

@.str = private unnamed_addr constant [23 x i8] c"default implementation\00", align 1
@defaultDel = internal global %struct.sDelegate { i8* (i32)* @defaultResponse }, align 8, !dbg !0
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"We're in thing1 with value %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"delegate implementation\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"A stellar vista, Baby.\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"Delegator returns %s\0A\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.sDelegate* @NewDelegate(i8* (i32)* %rspndr) #0 !dbg !21 {
entry:
  call void @llvm.dbg.value(metadata i8* (i32)* %rspndr, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias i8* @malloc(i64 8) #4, !dbg !28
  %0 = bitcast i8* %call to %struct.sDelegate*, !dbg !28
  call void @llvm.dbg.value(metadata %struct.sDelegate* %0, metadata !29, metadata !DIExpression()), !dbg !27
  %operation = getelementptr inbounds %struct.sDelegate, %struct.sDelegate* %0, i32 0, i32 0, !dbg !30
  store i8* (i32)* %rspndr, i8* (i32)** %operation, align 8, !dbg !31
  ret %struct.sDelegate* %0, !dbg !32
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @DelegateThing(%struct.sDelegate* %dl, i32 %p1) #0 !dbg !33 {
entry:
  call void @llvm.dbg.value(metadata %struct.sDelegate* %dl, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i32 %p1, metadata !38, metadata !DIExpression()), !dbg !37
  %operation = getelementptr inbounds %struct.sDelegate, %struct.sDelegate* %dl, i32 0, i32 0, !dbg !39
  %0 = load i8* (i32)*, i8* (i32)** %operation, align 8, !dbg !39
  %tobool = icmp ne i8* (i32)* %0, null, !dbg !40
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !40

cond.true:                                        ; preds = %entry
  %operation1 = getelementptr inbounds %struct.sDelegate, %struct.sDelegate* %dl, i32 0, i32 0, !dbg !41
  %1 = load i8* (i32)*, i8* (i32)** %operation1, align 8, !dbg !41
  %call = call i8* %1(i32 %p1), !dbg !42
  br label %cond.end, !dbg !40

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !40

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ null, %cond.false ], !dbg !40
  ret i8* %cond, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @defaultResponse(i32 %p1) #0 !dbg !44 {
entry:
  call void @llvm.dbg.value(metadata i32 %p1, metadata !45, metadata !DIExpression()), !dbg !46
  ret i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.sDelegator* @NewDelegator(i32 %p, i8* %phrase) #0 !dbg !48 {
entry:
  call void @llvm.dbg.value(metadata i32 %p, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.value(metadata i8* %phrase, metadata !61, metadata !DIExpression()), !dbg !60
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !62
  %0 = bitcast i8* %call to %struct.sDelegator*, !dbg !62
  call void @llvm.dbg.value(metadata %struct.sDelegator* %0, metadata !63, metadata !DIExpression()), !dbg !60
  %param = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %0, i32 0, i32 0, !dbg !64
  store i32 %p, i32* %param, align 8, !dbg !65
  %phrase1 = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %0, i32 0, i32 1, !dbg !66
  store i8* %phrase, i8** %phrase1, align 8, !dbg !67
  %delegate = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %0, i32 0, i32 2, !dbg !68
  store %struct.sDelegate* @defaultDel, %struct.sDelegate** %delegate, align 8, !dbg !69
  ret %struct.sDelegator* %0, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @Delegator_Operation(%struct.sDelegator* %theDelegator, i32 %p1, %struct.sDelegate* %delroy) #0 !dbg !71 {
entry:
  call void @llvm.dbg.value(metadata %struct.sDelegator* %theDelegator, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata i32 %p1, metadata !76, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata %struct.sDelegate* %delroy, metadata !77, metadata !DIExpression()), !dbg !75
  %tobool = icmp ne %struct.sDelegate* %delroy, null, !dbg !78
  br i1 %tobool, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  %call = call i8* @DelegateThing(%struct.sDelegate* %delroy, i32 %p1), !dbg !81
  call void @llvm.dbg.value(metadata i8* %call, metadata !83, metadata !DIExpression()), !dbg !75
  %tobool1 = icmp ne i8* %call, null, !dbg !84
  br i1 %tobool1, label %if.end, label %if.then2, !dbg !86

if.then2:                                         ; preds = %if.then
  %delegate = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %theDelegator, i32 0, i32 2, !dbg !87
  %0 = load %struct.sDelegate*, %struct.sDelegate** %delegate, align 8, !dbg !87
  %call3 = call i8* @DelegateThing(%struct.sDelegate* %0, i32 %p1), !dbg !89
  call void @llvm.dbg.value(metadata i8* %call3, metadata !83, metadata !DIExpression()), !dbg !75
  br label %if.end, !dbg !90

if.end:                                           ; preds = %if.then2, %if.then
  %rtn.0 = phi i8* [ %call, %if.then ], [ %call3, %if.then2 ], !dbg !91
  call void @llvm.dbg.value(metadata i8* %rtn.0, metadata !83, metadata !DIExpression()), !dbg !75
  br label %if.end6, !dbg !92

if.else:                                          ; preds = %entry
  %delegate4 = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %theDelegator, i32 0, i32 2, !dbg !93
  %1 = load %struct.sDelegate*, %struct.sDelegate** %delegate4, align 8, !dbg !93
  %call5 = call i8* @DelegateThing(%struct.sDelegate* %1, i32 %p1), !dbg !94
  call void @llvm.dbg.value(metadata i8* %call5, metadata !83, metadata !DIExpression()), !dbg !75
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.end
  %rtn.1 = phi i8* [ %rtn.0, %if.end ], [ %call5, %if.else ], !dbg !95
  call void @llvm.dbg.value(metadata i8* %rtn.1, metadata !83, metadata !DIExpression()), !dbg !75
  %phrase = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %theDelegator, i32 0, i32 1, !dbg !96
  %2 = load i8*, i8** %phrase, align 8, !dbg !96
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* %2), !dbg !97
  ret i8* %rtn.1, !dbg !98
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @thing1(i32 %p1) #0 !dbg !99 {
entry:
  call void @llvm.dbg.value(metadata i32 %p1, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i32 %p1), !dbg !102
  ret i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i64 0, i64 0), !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !104 {
entry:
  %call = call %struct.sDelegate* @NewDelegate(i8* (i32)* @thing1), !dbg !107
  call void @llvm.dbg.value(metadata %struct.sDelegate* %call, metadata !108, metadata !DIExpression()), !dbg !109
  %call1 = call %struct.sDelegate* @NewDelegate(i8* (i32)* null), !dbg !110
  call void @llvm.dbg.value(metadata %struct.sDelegate* %call1, metadata !111, metadata !DIExpression()), !dbg !109
  %call2 = call %struct.sDelegator* @NewDelegator(i32 14, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  call void @llvm.dbg.value(metadata %struct.sDelegator* %call2, metadata !113, metadata !DIExpression()), !dbg !109
  %call3 = call i8* @Delegator_Operation(%struct.sDelegator* %call2, i32 3, %struct.sDelegate* null), !dbg !114
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* %call3), !dbg !115
  %call5 = call i8* @Delegator_Operation(%struct.sDelegator* %call2, i32 3, %struct.sDelegate* %call), !dbg !116
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* %call5), !dbg !117
  %call7 = call i8* @Delegator_Operation(%struct.sDelegator* %call2, i32 3, %struct.sDelegate* %call1), !dbg !118
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* %call7), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "defaultDel", scope: !2, file: !3, line: 37, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "delegates.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Delegates")
!4 = !{}
!5 = !{!0}
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sDelegate", file: !3, line: 7, size: 64, elements: !7)
!7 = !{!8}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "operation", scope: !6, file: !3, line: 8, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "Responder", file: !3, line: 5, baseType: !10)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !16}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!21 = distinct !DISubprogram(name: "NewDelegate", scope: !3, file: !3, line: 12, type: !22, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{!24, !9}
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "Delegate", file: !3, line: 9, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!26 = !DILocalVariable(name: "rspndr", arg: 1, scope: !21, file: !3, line: 12, type: !9)
!27 = !DILocation(line: 0, scope: !21)
!28 = !DILocation(line: 14, column: 19, scope: !21)
!29 = !DILocalVariable(name: "dl", scope: !21, file: !3, line: 14, type: !24)
!30 = !DILocation(line: 15, column: 9, scope: !21)
!31 = !DILocation(line: 15, column: 19, scope: !21)
!32 = !DILocation(line: 16, column: 5, scope: !21)
!33 = distinct !DISubprogram(name: "DelegateThing", scope: !3, file: !3, line: 20, type: !34, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DISubroutineType(types: !35)
!35 = !{!13, !24, !16}
!36 = !DILocalVariable(name: "dl", arg: 1, scope: !33, file: !3, line: 20, type: !24)
!37 = !DILocation(line: 0, scope: !33)
!38 = !DILocalVariable(name: "p1", arg: 2, scope: !33, file: !3, line: 20, type: !16)
!39 = !DILocation(line: 22, column: 18, scope: !33)
!40 = !DILocation(line: 22, column: 13, scope: !33)
!41 = !DILocation(line: 22, column: 36, scope: !33)
!42 = !DILocation(line: 22, column: 30, scope: !33)
!43 = !DILocation(line: 22, column: 5, scope: !33)
!44 = distinct !DISubprogram(name: "defaultResponse", scope: !3, file: !3, line: 32, type: !11, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocalVariable(name: "p1", arg: 1, scope: !44, file: !3, line: 32, type: !16)
!46 = !DILocation(line: 0, scope: !44)
!47 = !DILocation(line: 34, column: 5, scope: !44)
!48 = distinct !DISubprogram(name: "NewDelegator", scope: !3, file: !3, line: 40, type: !49, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !16, !57}
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "Delegator", file: !3, line: 30, baseType: !52)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sDelegator", file: !3, line: 26, size: 192, elements: !54)
!54 = !{!55, !56, !58}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "param", scope: !53, file: !3, line: 27, baseType: !16, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "phrase", scope: !53, file: !3, line: 28, baseType: !57, size: 64, offset: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "delegate", scope: !53, file: !3, line: 29, baseType: !24, size: 64, offset: 128)
!59 = !DILocalVariable(name: "p", arg: 1, scope: !48, file: !3, line: 40, type: !16)
!60 = !DILocation(line: 0, scope: !48)
!61 = !DILocalVariable(name: "phrase", arg: 2, scope: !48, file: !3, line: 40, type: !57)
!62 = !DILocation(line: 42, column: 20, scope: !48)
!63 = !DILocalVariable(name: "d", scope: !48, file: !3, line: 42, type: !51)
!64 = !DILocation(line: 43, column: 8, scope: !48)
!65 = !DILocation(line: 43, column: 14, scope: !48)
!66 = !DILocation(line: 44, column: 8, scope: !48)
!67 = !DILocation(line: 44, column: 15, scope: !48)
!68 = !DILocation(line: 45, column: 8, scope: !48)
!69 = !DILocation(line: 45, column: 17, scope: !48)
!70 = !DILocation(line: 46, column: 5, scope: !48)
!71 = distinct !DISubprogram(name: "Delegator_Operation", scope: !3, file: !3, line: 50, type: !72, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!13, !51, !16, !24}
!74 = !DILocalVariable(name: "theDelegator", arg: 1, scope: !71, file: !3, line: 50, type: !51)
!75 = !DILocation(line: 0, scope: !71)
!76 = !DILocalVariable(name: "p1", arg: 2, scope: !71, file: !3, line: 50, type: !16)
!77 = !DILocalVariable(name: "delroy", arg: 3, scope: !71, file: !3, line: 50, type: !24)
!78 = !DILocation(line: 53, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !71, file: !3, line: 53, column: 9)
!80 = !DILocation(line: 53, column: 9, scope: !71)
!81 = !DILocation(line: 54, column: 15, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !3, line: 53, column: 17)
!83 = !DILocalVariable(name: "rtn", scope: !71, file: !3, line: 52, type: !13)
!84 = !DILocation(line: 55, column: 14, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !3, line: 55, column: 13)
!86 = !DILocation(line: 55, column: 13, scope: !82)
!87 = !DILocation(line: 56, column: 47, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !3, line: 55, column: 19)
!89 = !DILocation(line: 56, column: 19, scope: !88)
!90 = !DILocation(line: 57, column: 9, scope: !88)
!91 = !DILocation(line: 0, scope: !82)
!92 = !DILocation(line: 58, column: 5, scope: !82)
!93 = !DILocation(line: 60, column: 43, scope: !79)
!94 = !DILocation(line: 60, column: 15, scope: !79)
!95 = !DILocation(line: 0, scope: !79)
!96 = !DILocation(line: 62, column: 34, scope: !71)
!97 = !DILocation(line: 62, column: 5, scope: !71)
!98 = !DILocation(line: 63, column: 5, scope: !71)
!99 = distinct !DISubprogram(name: "thing1", scope: !3, file: !3, line: 67, type: !11, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "p1", arg: 1, scope: !99, file: !3, line: 67, type: !16)
!101 = !DILocation(line: 0, scope: !99)
!102 = !DILocation(line: 69, column: 5, scope: !99)
!103 = !DILocation(line: 70, column: 5, scope: !99)
!104 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 73, type: !105, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DISubroutineType(types: !106)
!106 = !{!16}
!107 = !DILocation(line: 75, column: 21, scope: !104)
!108 = !DILocalVariable(name: "del1", scope: !104, file: !3, line: 75, type: !24)
!109 = !DILocation(line: 0, scope: !104)
!110 = !DILocation(line: 76, column: 21, scope: !104)
!111 = !DILocalVariable(name: "del2", scope: !104, file: !3, line: 76, type: !24)
!112 = !DILocation(line: 77, column: 30, scope: !104)
!113 = !DILocalVariable(name: "theDelegator", scope: !104, file: !3, line: 77, type: !51)
!114 = !DILocation(line: 80, column: 13, scope: !104)
!115 = !DILocation(line: 79, column: 5, scope: !104)
!116 = !DILocation(line: 82, column: 13, scope: !104)
!117 = !DILocation(line: 81, column: 5, scope: !104)
!118 = !DILocation(line: 84, column: 13, scope: !104)
!119 = !DILocation(line: 83, column: 5, scope: !104)
!120 = !DILocation(line: 85, column: 5, scope: !104)
