; ModuleID = 'active-object.c'
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
  %x.addr = alloca %struct.integ_t*, align 8
  %tv = alloca %struct.timeval, align 8
  %t = alloca double, align 8
  %v = alloca double, align 8
  %f = alloca double (double)*, align 8
  store %struct.integ_t* %x, %struct.integ_t** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.integ_t** %x.addr, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata %struct.timeval* %tv, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata double* %t, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata double* %v, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata double (double)** %f, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !46
  %func = getelementptr inbounds %struct.integ_t, %struct.integ_t* %0, i32 0, i32 0, !dbg !47
  %1 = load double (double)*, double (double)** %func, align 8, !dbg !47
  store double (double)* %1, double (double)** %f, align 8, !dbg !48
  %call = call i32 @gettimeofday(%struct.timeval* %tv, i8* null) #4, !dbg !49
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 0, !dbg !50
  %2 = load i64, i64* %tv_sec, align 8, !dbg !50
  %3 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !51
  %start = getelementptr inbounds %struct.integ_t, %struct.integ_t* %3, i32 0, i32 1, !dbg !52
  %tv_sec1 = getelementptr inbounds %struct.timeval, %struct.timeval* %start, i32 0, i32 0, !dbg !53
  %4 = load i64, i64* %tv_sec1, align 8, !dbg !53
  %sub = sub nsw i64 %2, %4, !dbg !54
  %mul = mul nsw i64 %sub, 1000000, !dbg !55
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 1, !dbg !56
  %5 = load i64, i64* %tv_usec, align 8, !dbg !56
  %add = add nsw i64 %mul, %5, !dbg !57
  %6 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !58
  %start2 = getelementptr inbounds %struct.integ_t, %struct.integ_t* %6, i32 0, i32 1, !dbg !59
  %tv_usec3 = getelementptr inbounds %struct.timeval, %struct.timeval* %start2, i32 0, i32 1, !dbg !60
  %7 = load i64, i64* %tv_usec3, align 8, !dbg !60
  %sub4 = sub nsw i64 %add, %7, !dbg !61
  %conv = sitofp i64 %sub4 to double, !dbg !62
  %mul5 = fmul double %conv, 0x3EB0C6F7A0B5ED8D, !dbg !63
  store double %mul5, double* %t, align 8, !dbg !64
  %8 = load double (double)*, double (double)** %f, align 8, !dbg !65
  %tobool = icmp ne double (double)* %8, null, !dbg !65
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !65

cond.true:                                        ; preds = %entry
  %9 = load double (double)*, double (double)** %f, align 8, !dbg !66
  %10 = load double, double* %t, align 8, !dbg !67
  %call6 = call double %9(double %10), !dbg !66
  br label %cond.end, !dbg !65

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !65

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %call6, %cond.true ], [ 0.000000e+00, %cond.false ], !dbg !65
  store double %cond, double* %v, align 8, !dbg !68
  %11 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !69
  %last_v = getelementptr inbounds %struct.integ_t, %struct.integ_t* %11, i32 0, i32 3, !dbg !70
  %12 = load double, double* %last_v, align 8, !dbg !70
  %13 = load double, double* %v, align 8, !dbg !71
  %add7 = fadd double %12, %13, !dbg !72
  %14 = load double, double* %t, align 8, !dbg !73
  %15 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !74
  %last_t = getelementptr inbounds %struct.integ_t, %struct.integ_t* %15, i32 0, i32 4, !dbg !75
  %16 = load double, double* %last_t, align 8, !dbg !75
  %sub8 = fsub double %14, %16, !dbg !76
  %mul9 = fmul double %add7, %sub8, !dbg !77
  %div = fdiv double %mul9, 2.000000e+00, !dbg !78
  %17 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !79
  %v10 = getelementptr inbounds %struct.integ_t, %struct.integ_t* %17, i32 0, i32 2, !dbg !80
  %18 = load double, double* %v10, align 8, !dbg !81
  %add11 = fadd double %18, %div, !dbg !81
  store double %add11, double* %v10, align 8, !dbg !81
  %19 = load double, double* %t, align 8, !dbg !82
  %20 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !83
  %last_t12 = getelementptr inbounds %struct.integ_t, %struct.integ_t* %20, i32 0, i32 4, !dbg !84
  store double %19, double* %last_t12, align 8, !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @tick(i8* %a) #0 !dbg !87 {
entry:
  %a.addr = alloca i8*, align 8
  %x = alloca %struct.integ_t*, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata %struct.integ_t** %x, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = load i8*, i8** %a.addr, align 8, !dbg !95
  %1 = bitcast i8* %0 to %struct.integ_t*, !dbg !95
  store %struct.integ_t* %1, %struct.integ_t** %x, align 8, !dbg !94
  br label %while.body, !dbg !96

while.body:                                       ; preds = %entry, %while.body
  %call = call i32 @usleep(i32 100000), !dbg !97
  %2 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !99
  call void @update(%struct.integ_t* %2), !dbg !100
  br label %while.body, !dbg !96, !llvm.loop !101
}

declare dso_local i32 @usleep(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @set_input(%struct.integ_t* %x, double (double)* %func) #0 !dbg !103 {
entry:
  %x.addr = alloca %struct.integ_t*, align 8
  %func.addr = alloca double (double)*, align 8
  store %struct.integ_t* %x, %struct.integ_t** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.integ_t** %x.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store double (double)* %func, double (double)** %func.addr, align 8
  call void @llvm.dbg.declare(metadata double (double)** %func.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !110
  call void @update(%struct.integ_t* %0), !dbg !111
  %1 = load double (double)*, double (double)** %func.addr, align 8, !dbg !112
  %2 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !113
  %func1 = getelementptr inbounds %struct.integ_t, %struct.integ_t* %2, i32 0, i32 0, !dbg !114
  store double (double)* %1, double (double)** %func1, align 8, !dbg !115
  %3 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !116
  %last_t = getelementptr inbounds %struct.integ_t, %struct.integ_t* %3, i32 0, i32 4, !dbg !117
  store double 0.000000e+00, double* %last_t, align 8, !dbg !118
  %4 = load double (double)*, double (double)** %func.addr, align 8, !dbg !119
  %tobool = icmp ne double (double)* %4, null, !dbg !119
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !119

cond.true:                                        ; preds = %entry
  %5 = load double (double)*, double (double)** %func.addr, align 8, !dbg !120
  %call = call double %5(double 0.000000e+00), !dbg !120
  br label %cond.end, !dbg !119

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !119

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %call, %cond.true ], [ 0.000000e+00, %cond.false ], !dbg !119
  %6 = load %struct.integ_t*, %struct.integ_t** %x.addr, align 8, !dbg !121
  %last_v = getelementptr inbounds %struct.integ_t, %struct.integ_t* %6, i32 0, i32 3, !dbg !122
  store double %cond, double* %last_v, align 8, !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.integ_t* @new_integ(double (double)* %func) #0 !dbg !125 {
entry:
  %func.addr = alloca double (double)*, align 8
  %x = alloca %struct.integ_t*, align 8
  store double (double)* %func, double (double)** %func.addr, align 8
  call void @llvm.dbg.declare(metadata double (double)** %func.addr, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata %struct.integ_t** %x, metadata !130, metadata !DIExpression()), !dbg !131
  %call = call noalias i8* @malloc(i64 56) #4, !dbg !132
  %0 = bitcast i8* %call to %struct.integ_t*, !dbg !132
  store %struct.integ_t* %0, %struct.integ_t** %x, align 8, !dbg !131
  %1 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !133
  %last_v = getelementptr inbounds %struct.integ_t, %struct.integ_t* %1, i32 0, i32 3, !dbg !134
  store double 0.000000e+00, double* %last_v, align 8, !dbg !135
  %2 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !136
  %v = getelementptr inbounds %struct.integ_t, %struct.integ_t* %2, i32 0, i32 2, !dbg !137
  store double 0.000000e+00, double* %v, align 8, !dbg !138
  %3 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !139
  %func1 = getelementptr inbounds %struct.integ_t, %struct.integ_t* %3, i32 0, i32 0, !dbg !140
  store double (double)* null, double (double)** %func1, align 8, !dbg !141
  %4 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !142
  %start = getelementptr inbounds %struct.integ_t, %struct.integ_t* %4, i32 0, i32 1, !dbg !143
  %call2 = call i32 @gettimeofday(%struct.timeval* %start, i8* null) #4, !dbg !144
  %5 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !145
  %6 = load double (double)*, double (double)** %func.addr, align 8, !dbg !146
  call void @set_input(%struct.integ_t* %5, double (double)* %6), !dbg !147
  %7 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !148
  %id = getelementptr inbounds %struct.integ_t, %struct.integ_t* %7, i32 0, i32 5, !dbg !149
  %8 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !150
  %9 = bitcast %struct.integ_t* %8 to i8*, !dbg !150
  %call3 = call i32 @pthread_create(i64* %id, %union.pthread_attr_t* null, i8* (i8*)* @tick, i8* %9) #4, !dbg !151
  %10 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !152
  ret %struct.integ_t* %10, !dbg !153
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare !callback !154 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @sine(double %t) #0 !dbg !156 {
entry:
  %t.addr = alloca double, align 8
  store double %t, double* %t.addr, align 8
  call void @llvm.dbg.declare(metadata double* %t.addr, metadata !157, metadata !DIExpression()), !dbg !158
  %call = call double @atan2(double 1.000000e+00, double 1.000000e+00) #4, !dbg !159
  %mul = fmul double 4.000000e+00, %call, !dbg !160
  %0 = load double, double* %t.addr, align 8, !dbg !161
  %mul1 = fmul double %mul, %0, !dbg !162
  %call2 = call double @sin(double %mul1) #4, !dbg !163
  ret double %call2, !dbg !164
}

; Function Attrs: nounwind
declare dso_local double @sin(double) #2

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !165 {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.integ_t*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.integ_t** %x, metadata !169, metadata !DIExpression()), !dbg !170
  %call = call %struct.integ_t* @new_integ(double (double)* @sine), !dbg !171
  store %struct.integ_t* %call, %struct.integ_t** %x, align 8, !dbg !170
  %call1 = call i32 @sleep(i32 2), !dbg !172
  %0 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !173
  call void @set_input(%struct.integ_t* %0, double (double)* null), !dbg !174
  %call2 = call i32 @usleep(i32 500000), !dbg !175
  %1 = load %struct.integ_t*, %struct.integ_t** %x, align 8, !dbg !176
  %v = getelementptr inbounds %struct.integ_t, %struct.integ_t* %1, i32 0, i32 2, !dbg !177
  %2 = load double, double* %v, align 8, !dbg !177
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %2), !dbg !178
  ret i32 0, !dbg !179
}

declare dso_local i32 @sleep(i32) #3

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "active-object.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Active-object")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!37 = !DILocation(line: 17, column: 19, scope: !7)
!38 = !DILocalVariable(name: "tv", scope: !7, file: !1, line: 19, type: !20)
!39 = !DILocation(line: 19, column: 17, scope: !7)
!40 = !DILocalVariable(name: "t", scope: !7, file: !1, line: 20, type: !18)
!41 = !DILocation(line: 20, column: 9, scope: !7)
!42 = !DILocalVariable(name: "v", scope: !7, file: !1, line: 20, type: !18)
!43 = !DILocation(line: 20, column: 12, scope: !7)
!44 = !DILocalVariable(name: "f", scope: !7, file: !1, line: 20, type: !15)
!45 = !DILocation(line: 20, column: 17, scope: !7)
!46 = !DILocation(line: 22, column: 6, scope: !7)
!47 = !DILocation(line: 22, column: 9, scope: !7)
!48 = !DILocation(line: 22, column: 4, scope: !7)
!49 = !DILocation(line: 23, column: 2, scope: !7)
!50 = !DILocation(line: 24, column: 11, scope: !7)
!51 = !DILocation(line: 24, column: 20, scope: !7)
!52 = !DILocation(line: 24, column: 23, scope: !7)
!53 = !DILocation(line: 24, column: 29, scope: !7)
!54 = !DILocation(line: 24, column: 18, scope: !7)
!55 = !DILocation(line: 24, column: 37, scope: !7)
!56 = !DILocation(line: 25, column: 8, scope: !7)
!57 = !DILocation(line: 25, column: 3, scope: !7)
!58 = !DILocation(line: 25, column: 18, scope: !7)
!59 = !DILocation(line: 25, column: 21, scope: !7)
!60 = !DILocation(line: 25, column: 27, scope: !7)
!61 = !DILocation(line: 25, column: 16, scope: !7)
!62 = !DILocation(line: 24, column: 6, scope: !7)
!63 = !DILocation(line: 25, column: 36, scope: !7)
!64 = !DILocation(line: 24, column: 4, scope: !7)
!65 = !DILocation(line: 26, column: 6, scope: !7)
!66 = !DILocation(line: 26, column: 10, scope: !7)
!67 = !DILocation(line: 26, column: 12, scope: !7)
!68 = !DILocation(line: 26, column: 4, scope: !7)
!69 = !DILocation(line: 27, column: 11, scope: !7)
!70 = !DILocation(line: 27, column: 14, scope: !7)
!71 = !DILocation(line: 27, column: 23, scope: !7)
!72 = !DILocation(line: 27, column: 21, scope: !7)
!73 = !DILocation(line: 27, column: 29, scope: !7)
!74 = !DILocation(line: 27, column: 33, scope: !7)
!75 = !DILocation(line: 27, column: 36, scope: !7)
!76 = !DILocation(line: 27, column: 31, scope: !7)
!77 = !DILocation(line: 27, column: 26, scope: !7)
!78 = !DILocation(line: 27, column: 44, scope: !7)
!79 = !DILocation(line: 27, column: 2, scope: !7)
!80 = !DILocation(line: 27, column: 5, scope: !7)
!81 = !DILocation(line: 27, column: 7, scope: !7)
!82 = !DILocation(line: 28, column: 14, scope: !7)
!83 = !DILocation(line: 28, column: 2, scope: !7)
!84 = !DILocation(line: 28, column: 5, scope: !7)
!85 = !DILocation(line: 28, column: 12, scope: !7)
!86 = !DILocation(line: 29, column: 1, scope: !7)
!87 = distinct !DISubprogram(name: "tick", scope: !1, file: !1, line: 31, type: !88, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!91 = !DILocalVariable(name: "a", arg: 1, scope: !87, file: !1, line: 31, type: !90)
!92 = !DILocation(line: 31, column: 18, scope: !87)
!93 = !DILocalVariable(name: "x", scope: !87, file: !1, line: 33, type: !10)
!94 = !DILocation(line: 33, column: 8, scope: !87)
!95 = !DILocation(line: 33, column: 12, scope: !87)
!96 = !DILocation(line: 34, column: 2, scope: !87)
!97 = !DILocation(line: 35, column: 3, scope: !98)
!98 = distinct !DILexicalBlock(scope: !87, file: !1, line: 34, column: 12)
!99 = !DILocation(line: 36, column: 10, scope: !98)
!100 = !DILocation(line: 36, column: 3, scope: !98)
!101 = distinct !{!101, !96, !102}
!102 = !DILocation(line: 37, column: 2, scope: !87)
!103 = distinct !DISubprogram(name: "set_input", scope: !1, file: !1, line: 40, type: !104, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{null, !10, !15}
!106 = !DILocalVariable(name: "x", arg: 1, scope: !103, file: !1, line: 40, type: !10)
!107 = !DILocation(line: 40, column: 22, scope: !103)
!108 = !DILocalVariable(name: "func", arg: 2, scope: !103, file: !1, line: 40, type: !15)
!109 = !DILocation(line: 40, column: 34, scope: !103)
!110 = !DILocation(line: 42, column: 9, scope: !103)
!111 = !DILocation(line: 42, column: 2, scope: !103)
!112 = !DILocation(line: 43, column: 12, scope: !103)
!113 = !DILocation(line: 43, column: 2, scope: !103)
!114 = !DILocation(line: 43, column: 5, scope: !103)
!115 = !DILocation(line: 43, column: 10, scope: !103)
!116 = !DILocation(line: 44, column: 2, scope: !103)
!117 = !DILocation(line: 44, column: 5, scope: !103)
!118 = !DILocation(line: 44, column: 12, scope: !103)
!119 = !DILocation(line: 45, column: 14, scope: !103)
!120 = !DILocation(line: 45, column: 21, scope: !103)
!121 = !DILocation(line: 45, column: 2, scope: !103)
!122 = !DILocation(line: 45, column: 5, scope: !103)
!123 = !DILocation(line: 45, column: 12, scope: !103)
!124 = !DILocation(line: 46, column: 1, scope: !103)
!125 = distinct !DISubprogram(name: "new_integ", scope: !1, file: !1, line: 48, type: !126, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DISubroutineType(types: !127)
!127 = !{!10, !15}
!128 = !DILocalVariable(name: "func", arg: 1, scope: !125, file: !1, line: 48, type: !15)
!129 = !DILocation(line: 48, column: 26, scope: !125)
!130 = !DILocalVariable(name: "x", scope: !125, file: !1, line: 50, type: !10)
!131 = !DILocation(line: 50, column: 8, scope: !125)
!132 = !DILocation(line: 50, column: 12, scope: !125)
!133 = !DILocation(line: 51, column: 9, scope: !125)
!134 = !DILocation(line: 51, column: 12, scope: !125)
!135 = !DILocation(line: 51, column: 19, scope: !125)
!136 = !DILocation(line: 51, column: 2, scope: !125)
!137 = !DILocation(line: 51, column: 5, scope: !125)
!138 = !DILocation(line: 51, column: 7, scope: !125)
!139 = !DILocation(line: 52, column: 2, scope: !125)
!140 = !DILocation(line: 52, column: 5, scope: !125)
!141 = !DILocation(line: 52, column: 10, scope: !125)
!142 = !DILocation(line: 53, column: 16, scope: !125)
!143 = !DILocation(line: 53, column: 19, scope: !125)
!144 = !DILocation(line: 53, column: 2, scope: !125)
!145 = !DILocation(line: 54, column: 12, scope: !125)
!146 = !DILocation(line: 54, column: 15, scope: !125)
!147 = !DILocation(line: 54, column: 2, scope: !125)
!148 = !DILocation(line: 55, column: 18, scope: !125)
!149 = !DILocation(line: 55, column: 21, scope: !125)
!150 = !DILocation(line: 55, column: 34, scope: !125)
!151 = !DILocation(line: 55, column: 2, scope: !125)
!152 = !DILocation(line: 56, column: 9, scope: !125)
!153 = !DILocation(line: 56, column: 2, scope: !125)
!154 = !{!155}
!155 = !{i64 2, i64 3, i1 false}
!156 = distinct !DISubprogram(name: "sine", scope: !1, file: !1, line: 59, type: !16, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocalVariable(name: "t", arg: 1, scope: !156, file: !1, line: 59, type: !18)
!158 = !DILocation(line: 59, column: 20, scope: !156)
!159 = !DILocation(line: 59, column: 40, scope: !156)
!160 = !DILocation(line: 59, column: 38, scope: !156)
!161 = !DILocation(line: 59, column: 54, scope: !156)
!162 = !DILocation(line: 59, column: 52, scope: !156)
!163 = !DILocation(line: 59, column: 32, scope: !156)
!164 = !DILocation(line: 59, column: 25, scope: !156)
!165 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 61, type: !166, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!166 = !DISubroutineType(types: !167)
!167 = !{!168}
!168 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!169 = !DILocalVariable(name: "x", scope: !165, file: !1, line: 63, type: !10)
!170 = !DILocation(line: 63, column: 8, scope: !165)
!171 = !DILocation(line: 63, column: 12, scope: !165)
!172 = !DILocation(line: 64, column: 2, scope: !165)
!173 = !DILocation(line: 65, column: 12, scope: !165)
!174 = !DILocation(line: 65, column: 2, scope: !165)
!175 = !DILocation(line: 66, column: 2, scope: !165)
!176 = !DILocation(line: 67, column: 17, scope: !165)
!177 = !DILocation(line: 67, column: 20, scope: !165)
!178 = !DILocation(line: 67, column: 2, scope: !165)
!179 = !DILocation(line: 69, column: 2, scope: !165)
