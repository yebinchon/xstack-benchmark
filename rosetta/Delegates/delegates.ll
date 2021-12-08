; ModuleID = 'delegates.bc'
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
  %rspndr.addr = alloca i8* (i32)*, align 8
  %dl = alloca %struct.sDelegate*, align 8
  store i8* (i32)* %rspndr, i8* (i32)** %rspndr.addr, align 8
  call void @llvm.dbg.declare(metadata i8* (i32)** %rspndr.addr, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %struct.sDelegate** %dl, metadata !28, metadata !DIExpression()), !dbg !29
  %call = call noalias i8* @malloc(i64 8) #4, !dbg !30
  %0 = bitcast i8* %call to %struct.sDelegate*, !dbg !30
  store %struct.sDelegate* %0, %struct.sDelegate** %dl, align 8, !dbg !29
  %1 = load i8* (i32)*, i8* (i32)** %rspndr.addr, align 8, !dbg !31
  %2 = load %struct.sDelegate*, %struct.sDelegate** %dl, align 8, !dbg !32
  %operation = getelementptr inbounds %struct.sDelegate, %struct.sDelegate* %2, i32 0, i32 0, !dbg !33
  store i8* (i32)* %1, i8* (i32)** %operation, align 8, !dbg !34
  %3 = load %struct.sDelegate*, %struct.sDelegate** %dl, align 8, !dbg !35
  ret %struct.sDelegate* %3, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @DelegateThing(%struct.sDelegate* %dl, i32 %p1) #0 !dbg !37 {
entry:
  %dl.addr = alloca %struct.sDelegate*, align 8
  %p1.addr = alloca i32, align 4
  store %struct.sDelegate* %dl, %struct.sDelegate** %dl.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sDelegate** %dl.addr, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 %p1, i32* %p1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %p1.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load %struct.sDelegate*, %struct.sDelegate** %dl.addr, align 8, !dbg !44
  %operation = getelementptr inbounds %struct.sDelegate, %struct.sDelegate* %0, i32 0, i32 0, !dbg !45
  %1 = load i8* (i32)*, i8* (i32)** %operation, align 8, !dbg !45
  %tobool = icmp ne i8* (i32)* %1, null, !dbg !46
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !46

cond.true:                                        ; preds = %entry
  %2 = load %struct.sDelegate*, %struct.sDelegate** %dl.addr, align 8, !dbg !47
  %operation1 = getelementptr inbounds %struct.sDelegate, %struct.sDelegate* %2, i32 0, i32 0, !dbg !48
  %3 = load i8* (i32)*, i8* (i32)** %operation1, align 8, !dbg !48
  %4 = load i32, i32* %p1.addr, align 4, !dbg !49
  %call = call i8* %3(i32 %4), !dbg !50
  br label %cond.end, !dbg !46

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !46

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ null, %cond.false ], !dbg !46
  ret i8* %cond, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @defaultResponse(i32 %p1) #0 !dbg !52 {
entry:
  %p1.addr = alloca i32, align 4
  store i32 %p1, i32* %p1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %p1.addr, metadata !53, metadata !DIExpression()), !dbg !54
  ret i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.sDelegator* @NewDelegator(i32 %p, i8* %phrase) #0 !dbg !56 {
entry:
  %p.addr = alloca i32, align 4
  %phrase.addr = alloca i8*, align 8
  %d = alloca %struct.sDelegator*, align 8
  store i32 %p, i32* %p.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %p.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8* %phrase, i8** %phrase.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %phrase.addr, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata %struct.sDelegator** %d, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !73
  %0 = bitcast i8* %call to %struct.sDelegator*, !dbg !73
  store %struct.sDelegator* %0, %struct.sDelegator** %d, align 8, !dbg !72
  %1 = load i32, i32* %p.addr, align 4, !dbg !74
  %2 = load %struct.sDelegator*, %struct.sDelegator** %d, align 8, !dbg !75
  %param = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %2, i32 0, i32 0, !dbg !76
  store i32 %1, i32* %param, align 8, !dbg !77
  %3 = load i8*, i8** %phrase.addr, align 8, !dbg !78
  %4 = load %struct.sDelegator*, %struct.sDelegator** %d, align 8, !dbg !79
  %phrase1 = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %4, i32 0, i32 1, !dbg !80
  store i8* %3, i8** %phrase1, align 8, !dbg !81
  %5 = load %struct.sDelegator*, %struct.sDelegator** %d, align 8, !dbg !82
  %delegate = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %5, i32 0, i32 2, !dbg !83
  store %struct.sDelegate* @defaultDel, %struct.sDelegate** %delegate, align 8, !dbg !84
  %6 = load %struct.sDelegator*, %struct.sDelegator** %d, align 8, !dbg !85
  ret %struct.sDelegator* %6, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @Delegator_Operation(%struct.sDelegator* %theDelegator, i32 %p1, %struct.sDelegate* %delroy) #0 !dbg !87 {
entry:
  %theDelegator.addr = alloca %struct.sDelegator*, align 8
  %p1.addr = alloca i32, align 4
  %delroy.addr = alloca %struct.sDelegate*, align 8
  %rtn = alloca i8*, align 8
  store %struct.sDelegator* %theDelegator, %struct.sDelegator** %theDelegator.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sDelegator** %theDelegator.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 %p1, i32* %p1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %p1.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store %struct.sDelegate* %delroy, %struct.sDelegate** %delroy.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sDelegate** %delroy.addr, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i8** %rtn, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load %struct.sDelegate*, %struct.sDelegate** %delroy.addr, align 8, !dbg !98
  %tobool = icmp ne %struct.sDelegate* %0, null, !dbg !98
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  %1 = load %struct.sDelegate*, %struct.sDelegate** %delroy.addr, align 8, !dbg !101
  %2 = load i32, i32* %p1.addr, align 4, !dbg !103
  %call = call i8* @DelegateThing(%struct.sDelegate* %1, i32 %2), !dbg !104
  store i8* %call, i8** %rtn, align 8, !dbg !105
  %3 = load i8*, i8** %rtn, align 8, !dbg !106
  %tobool1 = icmp ne i8* %3, null, !dbg !106
  br i1 %tobool1, label %if.end, label %if.then2, !dbg !108

if.then2:                                         ; preds = %if.then
  %4 = load %struct.sDelegator*, %struct.sDelegator** %theDelegator.addr, align 8, !dbg !109
  %delegate = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %4, i32 0, i32 2, !dbg !111
  %5 = load %struct.sDelegate*, %struct.sDelegate** %delegate, align 8, !dbg !111
  %6 = load i32, i32* %p1.addr, align 4, !dbg !112
  %call3 = call i8* @DelegateThing(%struct.sDelegate* %5, i32 %6), !dbg !113
  store i8* %call3, i8** %rtn, align 8, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then2, %if.then
  br label %if.end6, !dbg !116

if.else:                                          ; preds = %entry
  %7 = load %struct.sDelegator*, %struct.sDelegator** %theDelegator.addr, align 8, !dbg !117
  %delegate4 = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %7, i32 0, i32 2, !dbg !118
  %8 = load %struct.sDelegate*, %struct.sDelegate** %delegate4, align 8, !dbg !118
  %9 = load i32, i32* %p1.addr, align 4, !dbg !119
  %call5 = call i8* @DelegateThing(%struct.sDelegate* %8, i32 %9), !dbg !120
  store i8* %call5, i8** %rtn, align 8, !dbg !121
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.end
  %10 = load %struct.sDelegator*, %struct.sDelegator** %theDelegator.addr, align 8, !dbg !122
  %phrase = getelementptr inbounds %struct.sDelegator, %struct.sDelegator* %10, i32 0, i32 1, !dbg !123
  %11 = load i8*, i8** %phrase, align 8, !dbg !123
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* %11), !dbg !124
  %12 = load i8*, i8** %rtn, align 8, !dbg !125
  ret i8* %12, !dbg !126
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @thing1(i32 %p1) #0 !dbg !127 {
entry:
  %p1.addr = alloca i32, align 4
  store i32 %p1, i32* %p1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %p1.addr, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = load i32, i32* %p1.addr, align 4, !dbg !130
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i32 %0), !dbg !131
  ret i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i64 0, i64 0), !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !133 {
entry:
  %retval = alloca i32, align 4
  %del1 = alloca %struct.sDelegate*, align 8
  %del2 = alloca %struct.sDelegate*, align 8
  %theDelegator = alloca %struct.sDelegator*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.sDelegate** %del1, metadata !136, metadata !DIExpression()), !dbg !137
  %call = call %struct.sDelegate* @NewDelegate(i8* (i32)* @thing1), !dbg !138
  store %struct.sDelegate* %call, %struct.sDelegate** %del1, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata %struct.sDelegate** %del2, metadata !139, metadata !DIExpression()), !dbg !140
  %call1 = call %struct.sDelegate* @NewDelegate(i8* (i32)* null), !dbg !141
  store %struct.sDelegate* %call1, %struct.sDelegate** %del2, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata %struct.sDelegator** %theDelegator, metadata !142, metadata !DIExpression()), !dbg !143
  %call2 = call %struct.sDelegator* @NewDelegator(i32 14, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i64 0, i64 0)), !dbg !144
  store %struct.sDelegator* %call2, %struct.sDelegator** %theDelegator, align 8, !dbg !143
  %0 = load %struct.sDelegator*, %struct.sDelegator** %theDelegator, align 8, !dbg !145
  %call3 = call i8* @Delegator_Operation(%struct.sDelegator* %0, i32 3, %struct.sDelegate* null), !dbg !146
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* %call3), !dbg !147
  %1 = load %struct.sDelegator*, %struct.sDelegator** %theDelegator, align 8, !dbg !148
  %2 = load %struct.sDelegate*, %struct.sDelegate** %del1, align 8, !dbg !149
  %call5 = call i8* @Delegator_Operation(%struct.sDelegator* %1, i32 3, %struct.sDelegate* %2), !dbg !150
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* %call5), !dbg !151
  %3 = load %struct.sDelegator*, %struct.sDelegator** %theDelegator, align 8, !dbg !152
  %4 = load %struct.sDelegate*, %struct.sDelegate** %del2, align 8, !dbg !153
  %call7 = call i8* @Delegator_Operation(%struct.sDelegator* %3, i32 3, %struct.sDelegate* %4), !dbg !154
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* %call7), !dbg !155
  ret i32 0, !dbg !156
}

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
!27 = !DILocation(line: 12, column: 33, scope: !21)
!28 = !DILocalVariable(name: "dl", scope: !21, file: !3, line: 14, type: !24)
!29 = !DILocation(line: 14, column: 14, scope: !21)
!30 = !DILocation(line: 14, column: 19, scope: !21)
!31 = !DILocation(line: 15, column: 21, scope: !21)
!32 = !DILocation(line: 15, column: 5, scope: !21)
!33 = !DILocation(line: 15, column: 9, scope: !21)
!34 = !DILocation(line: 15, column: 19, scope: !21)
!35 = !DILocation(line: 16, column: 12, scope: !21)
!36 = !DILocation(line: 16, column: 5, scope: !21)
!37 = distinct !DISubprogram(name: "DelegateThing", scope: !3, file: !3, line: 20, type: !38, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{!13, !24, !16}
!40 = !DILocalVariable(name: "dl", arg: 1, scope: !37, file: !3, line: 20, type: !24)
!41 = !DILocation(line: 20, column: 36, scope: !37)
!42 = !DILocalVariable(name: "p1", arg: 2, scope: !37, file: !3, line: 20, type: !16)
!43 = !DILocation(line: 20, column: 44, scope: !37)
!44 = !DILocation(line: 22, column: 14, scope: !37)
!45 = !DILocation(line: 22, column: 18, scope: !37)
!46 = !DILocation(line: 22, column: 13, scope: !37)
!47 = !DILocation(line: 22, column: 32, scope: !37)
!48 = !DILocation(line: 22, column: 36, scope: !37)
!49 = !DILocation(line: 22, column: 47, scope: !37)
!50 = !DILocation(line: 22, column: 30, scope: !37)
!51 = !DILocation(line: 22, column: 5, scope: !37)
!52 = distinct !DISubprogram(name: "defaultResponse", scope: !3, file: !3, line: 32, type: !11, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocalVariable(name: "p1", arg: 1, scope: !52, file: !3, line: 32, type: !16)
!54 = !DILocation(line: 32, column: 35, scope: !52)
!55 = !DILocation(line: 34, column: 5, scope: !52)
!56 = distinct !DISubprogram(name: "NewDelegator", scope: !3, file: !3, line: 40, type: !57, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !16, !65}
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "Delegator", file: !3, line: 30, baseType: !60)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sDelegator", file: !3, line: 26, size: 192, elements: !62)
!62 = !{!63, !64, !66}
!63 = !DIDerivedType(tag: DW_TAG_member, name: "param", scope: !61, file: !3, line: 27, baseType: !16, size: 32)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "phrase", scope: !61, file: !3, line: 28, baseType: !65, size: 64, offset: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "delegate", scope: !61, file: !3, line: 29, baseType: !24, size: 64, offset: 128)
!67 = !DILocalVariable(name: "p", arg: 1, scope: !56, file: !3, line: 40, type: !16)
!68 = !DILocation(line: 40, column: 29, scope: !56)
!69 = !DILocalVariable(name: "phrase", arg: 2, scope: !56, file: !3, line: 40, type: !65)
!70 = !DILocation(line: 40, column: 38, scope: !56)
!71 = !DILocalVariable(name: "d", scope: !56, file: !3, line: 42, type: !59)
!72 = !DILocation(line: 42, column: 15, scope: !56)
!73 = !DILocation(line: 42, column: 20, scope: !56)
!74 = !DILocation(line: 43, column: 16, scope: !56)
!75 = !DILocation(line: 43, column: 5, scope: !56)
!76 = !DILocation(line: 43, column: 8, scope: !56)
!77 = !DILocation(line: 43, column: 14, scope: !56)
!78 = !DILocation(line: 44, column: 17, scope: !56)
!79 = !DILocation(line: 44, column: 5, scope: !56)
!80 = !DILocation(line: 44, column: 8, scope: !56)
!81 = !DILocation(line: 44, column: 15, scope: !56)
!82 = !DILocation(line: 45, column: 5, scope: !56)
!83 = !DILocation(line: 45, column: 8, scope: !56)
!84 = !DILocation(line: 45, column: 17, scope: !56)
!85 = !DILocation(line: 46, column: 12, scope: !56)
!86 = !DILocation(line: 46, column: 5, scope: !56)
!87 = distinct !DISubprogram(name: "Delegator_Operation", scope: !3, file: !3, line: 50, type: !88, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DISubroutineType(types: !89)
!89 = !{!13, !59, !16, !24}
!90 = !DILocalVariable(name: "theDelegator", arg: 1, scope: !87, file: !3, line: 50, type: !59)
!91 = !DILocation(line: 50, column: 44, scope: !87)
!92 = !DILocalVariable(name: "p1", arg: 2, scope: !87, file: !3, line: 50, type: !16)
!93 = !DILocation(line: 50, column: 62, scope: !87)
!94 = !DILocalVariable(name: "delroy", arg: 3, scope: !87, file: !3, line: 50, type: !24)
!95 = !DILocation(line: 50, column: 75, scope: !87)
!96 = !DILocalVariable(name: "rtn", scope: !87, file: !3, line: 52, type: !13)
!97 = !DILocation(line: 52, column: 17, scope: !87)
!98 = !DILocation(line: 53, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !87, file: !3, line: 53, column: 9)
!100 = !DILocation(line: 53, column: 9, scope: !87)
!101 = !DILocation(line: 54, column: 29, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !3, line: 53, column: 17)
!103 = !DILocation(line: 54, column: 37, scope: !102)
!104 = !DILocation(line: 54, column: 15, scope: !102)
!105 = !DILocation(line: 54, column: 13, scope: !102)
!106 = !DILocation(line: 55, column: 14, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !3, line: 55, column: 13)
!108 = !DILocation(line: 55, column: 13, scope: !102)
!109 = !DILocation(line: 56, column: 33, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !3, line: 55, column: 19)
!111 = !DILocation(line: 56, column: 47, scope: !110)
!112 = !DILocation(line: 56, column: 57, scope: !110)
!113 = !DILocation(line: 56, column: 19, scope: !110)
!114 = !DILocation(line: 56, column: 17, scope: !110)
!115 = !DILocation(line: 57, column: 9, scope: !110)
!116 = !DILocation(line: 58, column: 5, scope: !102)
!117 = !DILocation(line: 60, column: 29, scope: !99)
!118 = !DILocation(line: 60, column: 43, scope: !99)
!119 = !DILocation(line: 60, column: 53, scope: !99)
!120 = !DILocation(line: 60, column: 15, scope: !99)
!121 = !DILocation(line: 60, column: 13, scope: !99)
!122 = !DILocation(line: 62, column: 20, scope: !87)
!123 = !DILocation(line: 62, column: 34, scope: !87)
!124 = !DILocation(line: 62, column: 5, scope: !87)
!125 = !DILocation(line: 63, column: 12, scope: !87)
!126 = !DILocation(line: 63, column: 5, scope: !87)
!127 = distinct !DISubprogram(name: "thing1", scope: !3, file: !3, line: 67, type: !11, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "p1", arg: 1, scope: !127, file: !3, line: 67, type: !16)
!129 = !DILocation(line: 67, column: 25, scope: !127)
!130 = !DILocation(line: 69, column: 48, scope: !127)
!131 = !DILocation(line: 69, column: 5, scope: !127)
!132 = !DILocation(line: 70, column: 5, scope: !127)
!133 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 73, type: !134, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DISubroutineType(types: !135)
!135 = !{!16}
!136 = !DILocalVariable(name: "del1", scope: !133, file: !3, line: 75, type: !24)
!137 = !DILocation(line: 75, column: 14, scope: !133)
!138 = !DILocation(line: 75, column: 21, scope: !133)
!139 = !DILocalVariable(name: "del2", scope: !133, file: !3, line: 76, type: !24)
!140 = !DILocation(line: 76, column: 14, scope: !133)
!141 = !DILocation(line: 76, column: 21, scope: !133)
!142 = !DILocalVariable(name: "theDelegator", scope: !133, file: !3, line: 77, type: !59)
!143 = !DILocation(line: 77, column: 15, scope: !133)
!144 = !DILocation(line: 77, column: 30, scope: !133)
!145 = !DILocation(line: 80, column: 34, scope: !133)
!146 = !DILocation(line: 80, column: 13, scope: !133)
!147 = !DILocation(line: 79, column: 5, scope: !133)
!148 = !DILocation(line: 82, column: 34, scope: !133)
!149 = !DILocation(line: 82, column: 51, scope: !133)
!150 = !DILocation(line: 82, column: 13, scope: !133)
!151 = !DILocation(line: 81, column: 5, scope: !133)
!152 = !DILocation(line: 84, column: 34, scope: !133)
!153 = !DILocation(line: 84, column: 51, scope: !133)
!154 = !DILocation(line: 84, column: 13, scope: !133)
!155 = !DILocation(line: 83, column: 5, scope: !133)
!156 = !DILocation(line: 85, column: 5, scope: !133)
