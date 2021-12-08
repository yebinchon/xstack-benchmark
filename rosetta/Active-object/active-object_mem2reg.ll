; ModuleID = 'active-object.ll'
source_filename = "active-object.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.integ_t = type { double (double)*, %struct.timeval, double, double, double, i64 }
%struct.timeval = type { i64, i64 }
%union.pthread_attr_t = type { i64, [48 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @update(%struct.integ_t* %x) #0 !dbg !7 {
entry:
  %tv = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata %struct.integ_t* %x, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata %struct.timeval* %tv, metadata !38, metadata !DIExpression()), !dbg !39
  %func = getelementptr inbounds %struct.integ_t, %struct.integ_t* %x, i32 0, i32 0, !dbg !40
  %0 = load double (double)*, double (double)** %func, align 8, !dbg !40
  call void @llvm.dbg.value(metadata double (double)* %0, metadata !41, metadata !DIExpression()), !dbg !37
  %call = call i32 @gettimeofday(%struct.timeval* %tv, i8* null) #4, !dbg !42
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 0, !dbg !43
  %1 = load i64, i64* %tv_sec, align 8, !dbg !43
  %start = getelementptr inbounds %struct.integ_t, %struct.integ_t* %x, i32 0, i32 1, !dbg !44
  %tv_sec1 = getelementptr inbounds %struct.timeval, %struct.timeval* %start, i32 0, i32 0, !dbg !45
  %2 = load i64, i64* %tv_sec1, align 8, !dbg !45
  %sub = sub nsw i64 %1, %2, !dbg !46
  %mul = mul nsw i64 %sub, 1000000, !dbg !47
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 1, !dbg !48
  %3 = load i64, i64* %tv_usec, align 8, !dbg !48
  %add = add nsw i64 %mul, %3, !dbg !49
  %start2 = getelementptr inbounds %struct.integ_t, %struct.integ_t* %x, i32 0, i32 1, !dbg !50
  %tv_usec3 = getelementptr inbounds %struct.timeval, %struct.timeval* %start2, i32 0, i32 1, !dbg !51
  %4 = load i64, i64* %tv_usec3, align 8, !dbg !51
  %sub4 = sub nsw i64 %add, %4, !dbg !52
  %conv = sitofp i64 %sub4 to double, !dbg !53
  %mul5 = fmul double %conv, 0x3EB0C6F7A0B5ED8D, !dbg !54
  call void @llvm.dbg.value(metadata double %mul5, metadata !55, metadata !DIExpression()), !dbg !37
  %tobool = icmp ne double (double)* %0, null, !dbg !56
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !56

cond.true:                                        ; preds = %entry
  %call6 = call double %0(double %mul5), !dbg !57
  br label %cond.end, !dbg !56

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !56

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %call6, %cond.true ], [ 0.000000e+00, %cond.false ], !dbg !56
  call void @llvm.dbg.value(metadata double %cond, metadata !58, metadata !DIExpression()), !dbg !37
  %last_v = getelementptr inbounds %struct.integ_t, %struct.integ_t* %x, i32 0, i32 3, !dbg !59
  %5 = load double, double* %last_v, align 8, !dbg !59
  %add7 = fadd double %5, %cond, !dbg !60
  %last_t = getelementptr inbounds %struct.integ_t, %struct.integ_t* %x, i32 0, i32 4, !dbg !61
  %6 = load double, double* %last_t, align 8, !dbg !61
  %sub8 = fsub double %mul5, %6, !dbg !62
  %mul9 = fmul double %add7, %sub8, !dbg !63
  %div = fdiv double %mul9, 2.000000e+00, !dbg !64
  %v10 = getelementptr inbounds %struct.integ_t, %struct.integ_t* %x, i32 0, i32 2, !dbg !65
  %7 = load double, double* %v10, align 8, !dbg !66
  %add11 = fadd double %7, %div, !dbg !66
  store double %add11, double* %v10, align 8, !dbg !66
  %last_t12 = getelementptr inbounds %struct.integ_t, %struct.integ_t* %x, i32 0, i32 4, !dbg !67
  store double %mul5, double* %last_t12, align 8, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @tick(i8* %a) #0 !dbg !70 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = bitcast i8* %a to %struct.integ_t*, !dbg !76
  call void @llvm.dbg.value(metadata %struct.integ_t* %0, metadata !77, metadata !DIExpression()), !dbg !75
  br label %while.body, !dbg !78

while.body:                                       ; preds = %while.body, %entry
  %call = call i32 @usleep(i32 100000), !dbg !79
  call void @update(%struct.integ_t* %0), !dbg !81
  br label %while.body, !dbg !78, !llvm.loop !82
}

declare dso_local i32 @usleep(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @set_input(%struct.integ_t* %x, double (double)* %func) #0 !dbg !84 {
entry:
  call void @llvm.dbg.value(metadata %struct.integ_t* %x, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.value(metadata double (double)* %func, metadata !89, metadata !DIExpression()), !dbg !88
  call void @update(%struct.integ_t* %x), !dbg !90
  %func1 = getelementptr inbounds %struct.integ_t, %struct.integ_t* %x, i32 0, i32 0, !dbg !91
  store double (double)* %func, double (double)** %func1, align 8, !dbg !92
  %last_t = getelementptr inbounds %struct.integ_t, %struct.integ_t* %x, i32 0, i32 4, !dbg !93
  store double 0.000000e+00, double* %last_t, align 8, !dbg !94
  %tobool = icmp ne double (double)* %func, null, !dbg !95
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !95

cond.true:                                        ; preds = %entry
  %call = call double %func(double 0.000000e+00), !dbg !96
  br label %cond.end, !dbg !95

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !95

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %call, %cond.true ], [ 0.000000e+00, %cond.false ], !dbg !95
  %last_v = getelementptr inbounds %struct.integ_t, %struct.integ_t* %x, i32 0, i32 3, !dbg !97
  store double %cond, double* %last_v, align 8, !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.integ_t* @new_integ(double (double)* %func) #0 !dbg !100 {
entry:
  call void @llvm.dbg.value(metadata double (double)* %func, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call noalias i8* @malloc(i64 56) #4, !dbg !105
  %0 = bitcast i8* %call to %struct.integ_t*, !dbg !105
  call void @llvm.dbg.value(metadata %struct.integ_t* %0, metadata !106, metadata !DIExpression()), !dbg !104
  %last_v = getelementptr inbounds %struct.integ_t, %struct.integ_t* %0, i32 0, i32 3, !dbg !107
  store double 0.000000e+00, double* %last_v, align 8, !dbg !108
  %v = getelementptr inbounds %struct.integ_t, %struct.integ_t* %0, i32 0, i32 2, !dbg !109
  store double 0.000000e+00, double* %v, align 8, !dbg !110
  %func1 = getelementptr inbounds %struct.integ_t, %struct.integ_t* %0, i32 0, i32 0, !dbg !111
  store double (double)* null, double (double)** %func1, align 8, !dbg !112
  %start = getelementptr inbounds %struct.integ_t, %struct.integ_t* %0, i32 0, i32 1, !dbg !113
  %call2 = call i32 @gettimeofday(%struct.timeval* %start, i8* null) #4, !dbg !114
  call void @set_input(%struct.integ_t* %0, double (double)* %func), !dbg !115
  %id = getelementptr inbounds %struct.integ_t, %struct.integ_t* %0, i32 0, i32 5, !dbg !116
  %1 = bitcast %struct.integ_t* %0 to i8*, !dbg !117
  %call3 = call i32 @pthread_create(i64* %id, %union.pthread_attr_t* null, i8* (i8*)* @tick, i8* %1) #4, !dbg !118
  ret %struct.integ_t* %0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare !callback !120 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @sine(double %t) #0 !dbg !122 {
entry:
  call void @llvm.dbg.value(metadata double %t, metadata !123, metadata !DIExpression()), !dbg !124
  %call = call double @atan2(double 1.000000e+00, double 1.000000e+00) #4, !dbg !125
  %mul = fmul double 4.000000e+00, %call, !dbg !126
  %mul1 = fmul double %mul, %t, !dbg !127
  %call2 = call double @sin(double %mul1) #4, !dbg !128
  ret double %call2, !dbg !129
}

; Function Attrs: nounwind
declare dso_local double @sin(double) #2

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !130 {
entry:
  %call = call %struct.integ_t* @new_integ(double (double)* @sine), !dbg !134
  call void @llvm.dbg.value(metadata %struct.integ_t* %call, metadata !135, metadata !DIExpression()), !dbg !136
  %call1 = call i32 @sleep(i32 2), !dbg !137
  call void @set_input(%struct.integ_t* %call, double (double)* null), !dbg !138
  %call2 = call i32 @usleep(i32 500000), !dbg !139
  %v = getelementptr inbounds %struct.integ_t, %struct.integ_t* %call, i32 0, i32 2, !dbg !140
  %0 = load double, double* %v, align 8, !dbg !140
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %0), !dbg !141
  ret i32 0, !dbg !142
}

declare dso_local i32 @sleep(i32) #3

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "active-object.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Active-object")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "update", scope: !1, file: !1, line: 17, type: !8, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "integ", file: !1, line: 15, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 10, size: 448, elements: !13)
!13 = !{!14, !19, !29, !30, !31, !32}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "func", scope: !12, file: !1, line: 11, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !18}
!18 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "start", scope: !12, file: !1, line: 12, baseType: !20, size: 128, offset: 64)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !21, line: 8, size: 128, elements: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "")
!22 = !{!23, !27}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !20, file: !21, line: 10, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !25, line: 160, baseType: !26)
!25 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!26 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !20, file: !21, line: 11, baseType: !28, size: 64, offset: 64)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !25, line: 162, baseType: !26)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !12, file: !1, line: 13, baseType: !18, size: 64, offset: 192)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "last_v", scope: !12, file: !1, line: 13, baseType: !18, size: 64, offset: 256)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "last_t", scope: !12, file: !1, line: 13, baseType: !18, size: 64, offset: 320)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !12, file: !1, line: 14, baseType: !33, size: 64, offset: 384)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !34, line: 27, baseType: !35)
!34 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 17, type: !10)
!37 = !DILocation(line: 0, scope: !7)
!38 = !DILocalVariable(name: "tv", scope: !7, file: !1, line: 19, type: !20)
!39 = !DILocation(line: 19, column: 17, scope: !7)
!40 = !DILocation(line: 22, column: 9, scope: !7)
!41 = !DILocalVariable(name: "f", scope: !7, file: !1, line: 20, type: !15)
!42 = !DILocation(line: 23, column: 2, scope: !7)
!43 = !DILocation(line: 24, column: 11, scope: !7)
!44 = !DILocation(line: 24, column: 23, scope: !7)
!45 = !DILocation(line: 24, column: 29, scope: !7)
!46 = !DILocation(line: 24, column: 18, scope: !7)
!47 = !DILocation(line: 24, column: 37, scope: !7)
!48 = !DILocation(line: 25, column: 8, scope: !7)
!49 = !DILocation(line: 25, column: 3, scope: !7)
!50 = !DILocation(line: 25, column: 21, scope: !7)
!51 = !DILocation(line: 25, column: 27, scope: !7)
!52 = !DILocation(line: 25, column: 16, scope: !7)
!53 = !DILocation(line: 24, column: 6, scope: !7)
!54 = !DILocation(line: 25, column: 36, scope: !7)
!55 = !DILocalVariable(name: "t", scope: !7, file: !1, line: 20, type: !18)
!56 = !DILocation(line: 26, column: 6, scope: !7)
!57 = !DILocation(line: 26, column: 10, scope: !7)
!58 = !DILocalVariable(name: "v", scope: !7, file: !1, line: 20, type: !18)
!59 = !DILocation(line: 27, column: 14, scope: !7)
!60 = !DILocation(line: 27, column: 21, scope: !7)
!61 = !DILocation(line: 27, column: 36, scope: !7)
!62 = !DILocation(line: 27, column: 31, scope: !7)
!63 = !DILocation(line: 27, column: 26, scope: !7)
!64 = !DILocation(line: 27, column: 44, scope: !7)
!65 = !DILocation(line: 27, column: 5, scope: !7)
!66 = !DILocation(line: 27, column: 7, scope: !7)
!67 = !DILocation(line: 28, column: 5, scope: !7)
!68 = !DILocation(line: 28, column: 12, scope: !7)
!69 = !DILocation(line: 29, column: 1, scope: !7)
!70 = distinct !DISubprogram(name: "tick", scope: !1, file: !1, line: 31, type: !71, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!73, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!74 = !DILocalVariable(name: "a", arg: 1, scope: !70, file: !1, line: 31, type: !73)
!75 = !DILocation(line: 0, scope: !70)
!76 = !DILocation(line: 33, column: 12, scope: !70)
!77 = !DILocalVariable(name: "x", scope: !70, file: !1, line: 33, type: !10)
!78 = !DILocation(line: 34, column: 2, scope: !70)
!79 = !DILocation(line: 35, column: 3, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !1, line: 34, column: 12)
!81 = !DILocation(line: 36, column: 3, scope: !80)
!82 = distinct !{!82, !78, !83}
!83 = !DILocation(line: 37, column: 2, scope: !70)
!84 = distinct !DISubprogram(name: "set_input", scope: !1, file: !1, line: 40, type: !85, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{null, !10, !15}
!87 = !DILocalVariable(name: "x", arg: 1, scope: !84, file: !1, line: 40, type: !10)
!88 = !DILocation(line: 0, scope: !84)
!89 = !DILocalVariable(name: "func", arg: 2, scope: !84, file: !1, line: 40, type: !15)
!90 = !DILocation(line: 42, column: 2, scope: !84)
!91 = !DILocation(line: 43, column: 5, scope: !84)
!92 = !DILocation(line: 43, column: 10, scope: !84)
!93 = !DILocation(line: 44, column: 5, scope: !84)
!94 = !DILocation(line: 44, column: 12, scope: !84)
!95 = !DILocation(line: 45, column: 14, scope: !84)
!96 = !DILocation(line: 45, column: 21, scope: !84)
!97 = !DILocation(line: 45, column: 5, scope: !84)
!98 = !DILocation(line: 45, column: 12, scope: !84)
!99 = !DILocation(line: 46, column: 1, scope: !84)
!100 = distinct !DISubprogram(name: "new_integ", scope: !1, file: !1, line: 48, type: !101, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!10, !15}
!103 = !DILocalVariable(name: "func", arg: 1, scope: !100, file: !1, line: 48, type: !15)
!104 = !DILocation(line: 0, scope: !100)
!105 = !DILocation(line: 50, column: 12, scope: !100)
!106 = !DILocalVariable(name: "x", scope: !100, file: !1, line: 50, type: !10)
!107 = !DILocation(line: 51, column: 12, scope: !100)
!108 = !DILocation(line: 51, column: 19, scope: !100)
!109 = !DILocation(line: 51, column: 5, scope: !100)
!110 = !DILocation(line: 51, column: 7, scope: !100)
!111 = !DILocation(line: 52, column: 5, scope: !100)
!112 = !DILocation(line: 52, column: 10, scope: !100)
!113 = !DILocation(line: 53, column: 19, scope: !100)
!114 = !DILocation(line: 53, column: 2, scope: !100)
!115 = !DILocation(line: 54, column: 2, scope: !100)
!116 = !DILocation(line: 55, column: 21, scope: !100)
!117 = !DILocation(line: 55, column: 34, scope: !100)
!118 = !DILocation(line: 55, column: 2, scope: !100)
!119 = !DILocation(line: 56, column: 2, scope: !100)
!120 = !{!121}
!121 = !{i64 2, i64 3, i1 false}
!122 = distinct !DISubprogram(name: "sine", scope: !1, file: !1, line: 59, type: !16, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "t", arg: 1, scope: !122, file: !1, line: 59, type: !18)
!124 = !DILocation(line: 0, scope: !122)
!125 = !DILocation(line: 59, column: 40, scope: !122)
!126 = !DILocation(line: 59, column: 38, scope: !122)
!127 = !DILocation(line: 59, column: 52, scope: !122)
!128 = !DILocation(line: 59, column: 32, scope: !122)
!129 = !DILocation(line: 59, column: 25, scope: !122)
!130 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 61, type: !131, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DISubroutineType(types: !132)
!132 = !{!133}
!133 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!134 = !DILocation(line: 63, column: 12, scope: !130)
!135 = !DILocalVariable(name: "x", scope: !130, file: !1, line: 63, type: !10)
!136 = !DILocation(line: 0, scope: !130)
!137 = !DILocation(line: 64, column: 2, scope: !130)
!138 = !DILocation(line: 65, column: 2, scope: !130)
!139 = !DILocation(line: 66, column: 2, scope: !130)
!140 = !DILocation(line: 67, column: 20, scope: !130)
!141 = !DILocation(line: 67, column: 2, scope: !130)
!142 = !DILocation(line: 69, column: 2, scope: !130)
