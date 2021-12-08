; ModuleID = 'dining-philosophers-3.ll'
source_filename = "dining-philosophers-3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timespec = type { i64, i64 }
%union.mtx_t = type { i64, [32 x i8] }
%struct.Philosopher = type { i8*, i32, i32 }

@time1 = common dso_local global %struct.timespec zeroinitializer, align 8, !dbg !0
@forks = common dso_local global [5 x %union.mtx_t] zeroinitializer, align 16, !dbg !31
@.str = private unnamed_addr constant [14 x i8] c"%s is eating\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"%s is done eating\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Teral\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"Billy\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"Daniel\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"Philip\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"Bennet\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"FAILED IN MUTEX INIT!\00", align 1
@.str.8 = private unnamed_addr constant [27 x i8] c"%d-th thread create error\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.Philosopher* @create(i8* %nam, i32 %lef, i32 %righ) #0 !dbg !57 {
entry:
  call void @llvm.dbg.value(metadata i8* %nam, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.value(metadata i32 %lef, metadata !63, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.value(metadata i32 %righ, metadata !64, metadata !DIExpression()), !dbg !62
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !65
  %0 = bitcast i8* %call to %struct.Philosopher*, !dbg !65
  call void @llvm.dbg.value(metadata %struct.Philosopher* %0, metadata !66, metadata !DIExpression()), !dbg !62
  %name = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %0, i32 0, i32 0, !dbg !67
  store i8* %nam, i8** %name, align 8, !dbg !68
  %left = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %0, i32 0, i32 1, !dbg !69
  store i32 %lef, i32* %left, align 8, !dbg !70
  %right = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %0, i32 0, i32 2, !dbg !71
  store i32 %righ, i32* %right, align 4, !dbg !72
  ret %struct.Philosopher* %0, !dbg !73
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @eat(i8* %data) #0 !dbg !74 {
entry:
  call void @llvm.dbg.value(metadata i8* %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i64 1, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time1, i32 0, i32 0), align 8, !dbg !80
  %0 = bitcast i8* %data to %struct.Philosopher*, !dbg !81
  call void @llvm.dbg.value(metadata %struct.Philosopher* %0, metadata !82, metadata !DIExpression()), !dbg !79
  %left = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %0, i32 0, i32 1, !dbg !83
  %1 = load i32, i32* %left, align 8, !dbg !83
  %idxprom = sext i32 %1 to i64, !dbg !84
  %arrayidx = getelementptr inbounds [5 x %union.mtx_t], [5 x %union.mtx_t]* @forks, i64 0, i64 %idxprom, !dbg !84
  %call = call i32 @mtx_lock(%union.mtx_t* %arrayidx), !dbg !85
  %right = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %0, i32 0, i32 2, !dbg !86
  %2 = load i32, i32* %right, align 4, !dbg !86
  %idxprom1 = sext i32 %2 to i64, !dbg !87
  %arrayidx2 = getelementptr inbounds [5 x %union.mtx_t], [5 x %union.mtx_t]* @forks, i64 0, i64 %idxprom1, !dbg !87
  %call3 = call i32 @mtx_lock(%union.mtx_t* %arrayidx2), !dbg !88
  %name = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %0, i32 0, i32 0, !dbg !89
  %3 = load i8*, i8** %name, align 8, !dbg !89
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i8* %3), !dbg !90
  %call5 = call i32 @thrd_sleep(%struct.timespec* @time1, %struct.timespec* null), !dbg !91
  %name6 = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %0, i32 0, i32 0, !dbg !92
  %4 = load i8*, i8** %name6, align 8, !dbg !92
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i8* %4), !dbg !93
  %left8 = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %0, i32 0, i32 1, !dbg !94
  %5 = load i32, i32* %left8, align 8, !dbg !94
  %idxprom9 = sext i32 %5 to i64, !dbg !95
  %arrayidx10 = getelementptr inbounds [5 x %union.mtx_t], [5 x %union.mtx_t]* @forks, i64 0, i64 %idxprom9, !dbg !95
  %call11 = call i32 @mtx_unlock(%union.mtx_t* %arrayidx10), !dbg !96
  %right12 = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %0, i32 0, i32 2, !dbg !97
  %6 = load i32, i32* %right12, align 4, !dbg !97
  %idxprom13 = sext i32 %6 to i64, !dbg !98
  %arrayidx14 = getelementptr inbounds [5 x %union.mtx_t], [5 x %union.mtx_t]* @forks, i64 0, i64 %idxprom13, !dbg !98
  %call15 = call i32 @mtx_unlock(%union.mtx_t* %arrayidx14), !dbg !99
  ret i32 0, !dbg !100
}

declare dso_local i32 @mtx_lock(%union.mtx_t*) #3

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @thrd_sleep(%struct.timespec*, %struct.timespec*) #3

declare dso_local i32 @mtx_unlock(%union.mtx_t*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !101 {
entry:
  %threadId = alloca [5 x i64], align 16
  %all = alloca [5 x %struct.Philosopher*], align 16
  call void @llvm.dbg.declare(metadata [5 x i64]* %threadId, metadata !104, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [5 x %struct.Philosopher*]* %all, metadata !109, metadata !DIExpression()), !dbg !111
  %arrayinit.begin = getelementptr inbounds [5 x %struct.Philosopher*], [5 x %struct.Philosopher*]* %all, i64 0, i64 0, !dbg !112
  %call = call %struct.Philosopher* @create(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i32 0, i32 1), !dbg !113
  store %struct.Philosopher* %call, %struct.Philosopher** %arrayinit.begin, align 8, !dbg !112
  %arrayinit.element = getelementptr inbounds %struct.Philosopher*, %struct.Philosopher** %arrayinit.begin, i64 1, !dbg !112
  %call1 = call %struct.Philosopher* @create(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 1, i32 2), !dbg !114
  store %struct.Philosopher* %call1, %struct.Philosopher** %arrayinit.element, align 8, !dbg !112
  %arrayinit.element2 = getelementptr inbounds %struct.Philosopher*, %struct.Philosopher** %arrayinit.element, i64 1, !dbg !112
  %call3 = call %struct.Philosopher* @create(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i32 2, i32 3), !dbg !115
  store %struct.Philosopher* %call3, %struct.Philosopher** %arrayinit.element2, align 8, !dbg !112
  %arrayinit.element4 = getelementptr inbounds %struct.Philosopher*, %struct.Philosopher** %arrayinit.element2, i64 1, !dbg !112
  %call5 = call %struct.Philosopher* @create(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 3, i32 4), !dbg !116
  store %struct.Philosopher* %call5, %struct.Philosopher** %arrayinit.element4, align 8, !dbg !112
  %arrayinit.element6 = getelementptr inbounds %struct.Philosopher*, %struct.Philosopher** %arrayinit.element4, i64 1, !dbg !112
  %call7 = call %struct.Philosopher* @create(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i32 0, i32 4), !dbg !117
  store %struct.Philosopher* %call7, %struct.Philosopher** %arrayinit.element6, align 8, !dbg !112
  call void @llvm.dbg.value(metadata i32 0, metadata !118, metadata !DIExpression()), !dbg !120
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !120
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !118, metadata !DIExpression()), !dbg !120
  %cmp = icmp slt i32 %i.0, 5, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !125
  %arrayidx = getelementptr inbounds [5 x %union.mtx_t], [5 x %union.mtx_t]* @forks, i64 0, i64 %idxprom, !dbg !125
  %call8 = call i32 @mtx_init(%union.mtx_t* %arrayidx, i32 0), !dbg !128
  %cmp9 = icmp ne i32 %call8, 0, !dbg !129
  br i1 %cmp9, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %for.body
  %call10 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i64 0, i64 0)), !dbg !131
  br label %return, !dbg !133

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !135
  call void @llvm.dbg.value(metadata i32 %inc, metadata !118, metadata !DIExpression()), !dbg !120
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !139, metadata !DIExpression()), !dbg !141
  br label %for.cond12, !dbg !142

for.cond12:                                       ; preds = %for.inc22, %for.end
  %i11.0 = phi i32 [ 0, %for.end ], [ %inc23, %for.inc22 ], !dbg !141
  call void @llvm.dbg.value(metadata i32 %i11.0, metadata !139, metadata !DIExpression()), !dbg !141
  %cmp13 = icmp slt i32 %i11.0, 5, !dbg !143
  br i1 %cmp13, label %for.body14, label %for.end24, !dbg !145

for.body14:                                       ; preds = %for.cond12
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %threadId, i64 0, i64 0, !dbg !146
  %idx.ext = sext i32 %i11.0 to i64, !dbg !149
  %add.ptr = getelementptr inbounds i64, i64* %arraydecay, i64 %idx.ext, !dbg !149
  %idxprom15 = sext i32 %i11.0 to i64, !dbg !150
  %arrayidx16 = getelementptr inbounds [5 x %struct.Philosopher*], [5 x %struct.Philosopher*]* %all, i64 0, i64 %idxprom15, !dbg !150
  %0 = load %struct.Philosopher*, %struct.Philosopher** %arrayidx16, align 8, !dbg !150
  %1 = bitcast %struct.Philosopher* %0 to i8*, !dbg !150
  %call17 = call i32 @thrd_create(i64* %add.ptr, i32 (i8*)* @eat, i8* %1), !dbg !151
  %cmp18 = icmp ne i32 %call17, 0, !dbg !152
  br i1 %cmp18, label %if.then19, label %if.end21, !dbg !153

if.then19:                                        ; preds = %for.body14
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i64 0, i64 0), i32 %i11.0), !dbg !154
  br label %return, !dbg !156

if.end21:                                         ; preds = %for.body14
  br label %for.inc22, !dbg !157

for.inc22:                                        ; preds = %if.end21
  %inc23 = add nsw i32 %i11.0, 1, !dbg !158
  call void @llvm.dbg.value(metadata i32 %inc23, metadata !139, metadata !DIExpression()), !dbg !141
  br label %for.cond12, !dbg !159, !llvm.loop !160

for.end24:                                        ; preds = %for.cond12
  call void @llvm.dbg.value(metadata i32 0, metadata !162, metadata !DIExpression()), !dbg !164
  br label %for.cond26, !dbg !165

for.cond26:                                       ; preds = %for.inc32, %for.end24
  %i25.0 = phi i32 [ 0, %for.end24 ], [ %inc33, %for.inc32 ], !dbg !164
  call void @llvm.dbg.value(metadata i32 %i25.0, metadata !162, metadata !DIExpression()), !dbg !164
  %cmp27 = icmp slt i32 %i25.0, 5, !dbg !166
  br i1 %cmp27, label %for.body28, label %for.end34, !dbg !168

for.body28:                                       ; preds = %for.cond26
  %idxprom29 = sext i32 %i25.0 to i64, !dbg !169
  %arrayidx30 = getelementptr inbounds [5 x i64], [5 x i64]* %threadId, i64 0, i64 %idxprom29, !dbg !169
  %2 = load i64, i64* %arrayidx30, align 8, !dbg !169
  %call31 = call i32 @thrd_join(i64 %2, i32* null), !dbg !170
  br label %for.inc32, !dbg !170

for.inc32:                                        ; preds = %for.body28
  %inc33 = add nsw i32 %i25.0, 1, !dbg !171
  call void @llvm.dbg.value(metadata i32 %inc33, metadata !162, metadata !DIExpression()), !dbg !164
  br label %for.cond26, !dbg !172, !llvm.loop !173

for.end34:                                        ; preds = %for.cond26
  br label %return, !dbg !175

return:                                           ; preds = %for.end34, %if.then19, %if.then
  ret i32 0, !dbg !176
}

declare dso_local i32 @mtx_init(%union.mtx_t*, i32) #3

declare dso_local i32 @puts(i8*) #3

declare dso_local i32 @thrd_create(i64*, i32 (i8*)*, i8*) #3

declare dso_local i32 @thrd_join(i64, i32*) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!53, !54, !55}
!llvm.ident = !{!56}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "time1", scope: !2, file: !3, line: 7, type: !45, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !19, globals: !30, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "dining-philosophers-3.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Dining-philosophers-3")
!4 = !{!5, !12}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 52, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/threads.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11}
!9 = !DIEnumerator(name: "mtx_plain", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "mtx_recursive", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "mtx_timed", value: 2, isUnsigned: true)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 42, baseType: !7, size: 32, elements: !13)
!13 = !{!14, !15, !16, !17, !18}
!14 = !DIEnumerator(name: "thrd_success", value: 0, isUnsigned: true)
!15 = !DIEnumerator(name: "thrd_busy", value: 1, isUnsigned: true)
!16 = !DIEnumerator(name: "thrd_error", value: 2, isUnsigned: true)
!17 = !DIEnumerator(name: "thrd_nomem", value: 3, isUnsigned: true)
!18 = !DIEnumerator(name: "thrd_timedout", value: 4, isUnsigned: true)
!19 = !{!20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "Philosopher", file: !3, line: 14, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 10, size: 128, elements: !23)
!23 = !{!24, !27, !29}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !22, file: !3, line: 11, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "left", scope: !22, file: !3, line: 12, baseType: !28, size: 32, offset: 64)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "right", scope: !22, file: !3, line: 13, baseType: !28, size: 32, offset: 96)
!30 = !{!0, !31}
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "forks", scope: !2, file: !3, line: 8, type: !33, isLocal: false, isDefinition: true)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 1600, elements: !43)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "mtx_t", file: !6, line: 69, baseType: !35)
!35 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !6, line: 65, size: 320, elements: !36)
!36 = !{!37, !41}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !35, file: !6, line: 67, baseType: !38, size: 320)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 320, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 40)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !35, file: !6, line: 68, baseType: !42, size: 64)
!42 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!43 = !{!44}
!44 = !DISubrange(count: 5)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !46, line: 10, size: 128, elements: !47)
!46 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!47 = !{!48, !51}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !45, file: !46, line: 12, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !50, line: 160, baseType: !42)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !45, file: !46, line: 16, baseType: !52, size: 64, offset: 64)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !50, line: 196, baseType: !42)
!53 = !{i32 7, !"Dwarf Version", i32 4}
!54 = !{i32 2, !"Debug Info Version", i32 3}
!55 = !{i32 1, !"wchar_size", i32 4}
!56 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!57 = distinct !DISubprogram(name: "create", scope: !3, file: !3, line: 16, type: !58, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!58 = !DISubroutineType(types: !59)
!59 = !{!20, !25, !28, !28}
!60 = !{}
!61 = !DILocalVariable(name: "nam", arg: 1, scope: !57, file: !3, line: 16, type: !25)
!62 = !DILocation(line: 0, scope: !57)
!63 = !DILocalVariable(name: "lef", arg: 2, scope: !57, file: !3, line: 16, type: !28)
!64 = !DILocalVariable(name: "righ", arg: 3, scope: !57, file: !3, line: 16, type: !28)
!65 = !DILocation(line: 17, column: 19, scope: !57)
!66 = !DILocalVariable(name: "x", scope: !57, file: !3, line: 17, type: !20)
!67 = !DILocation(line: 18, column: 5, scope: !57)
!68 = !DILocation(line: 18, column: 10, scope: !57)
!69 = !DILocation(line: 19, column: 5, scope: !57)
!70 = !DILocation(line: 19, column: 10, scope: !57)
!71 = !DILocation(line: 20, column: 5, scope: !57)
!72 = !DILocation(line: 20, column: 11, scope: !57)
!73 = !DILocation(line: 21, column: 2, scope: !57)
!74 = distinct !DISubprogram(name: "eat", scope: !3, file: !3, line: 24, type: !75, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!75 = !DISubroutineType(types: !76)
!76 = !{!28, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!78 = !DILocalVariable(name: "data", arg: 1, scope: !74, file: !3, line: 24, type: !77)
!79 = !DILocation(line: 0, scope: !74)
!80 = !DILocation(line: 25, column: 15, scope: !74)
!81 = !DILocation(line: 26, column: 21, scope: !74)
!82 = !DILocalVariable(name: "foo", scope: !74, file: !3, line: 26, type: !20)
!83 = !DILocation(line: 27, column: 23, scope: !74)
!84 = !DILocation(line: 27, column: 12, scope: !74)
!85 = !DILocation(line: 27, column: 2, scope: !74)
!86 = !DILocation(line: 28, column: 23, scope: !74)
!87 = !DILocation(line: 28, column: 12, scope: !74)
!88 = !DILocation(line: 28, column: 2, scope: !74)
!89 = !DILocation(line: 29, column: 33, scope: !74)
!90 = !DILocation(line: 29, column: 2, scope: !74)
!91 = !DILocation(line: 30, column: 2, scope: !74)
!92 = !DILocation(line: 31, column: 38, scope: !74)
!93 = !DILocation(line: 31, column: 2, scope: !74)
!94 = !DILocation(line: 32, column: 25, scope: !74)
!95 = !DILocation(line: 32, column: 14, scope: !74)
!96 = !DILocation(line: 32, column: 2, scope: !74)
!97 = !DILocation(line: 33, column: 25, scope: !74)
!98 = !DILocation(line: 33, column: 14, scope: !74)
!99 = !DILocation(line: 33, column: 2, scope: !74)
!100 = !DILocation(line: 34, column: 2, scope: !74)
!101 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 37, type: !102, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!102 = !DISubroutineType(types: !103)
!103 = !{!28}
!104 = !DILocalVariable(name: "threadId", scope: !101, file: !3, line: 38, type: !105)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 320, elements: !43)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "thrd_t", file: !6, line: 38, baseType: !107)
!107 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!108 = !DILocation(line: 38, column: 12, scope: !101)
!109 = !DILocalVariable(name: "all", scope: !101, file: !3, line: 39, type: !110)
!110 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 320, elements: !43)
!111 = !DILocation(line: 39, column: 15, scope: !101)
!112 = !DILocation(line: 39, column: 34, scope: !101)
!113 = !DILocation(line: 39, column: 35, scope: !101)
!114 = !DILocation(line: 40, column: 6, scope: !101)
!115 = !DILocation(line: 41, column: 6, scope: !101)
!116 = !DILocation(line: 42, column: 6, scope: !101)
!117 = !DILocation(line: 43, column: 6, scope: !101)
!118 = !DILocalVariable(name: "i", scope: !119, file: !3, line: 44, type: !28)
!119 = distinct !DILexicalBlock(scope: !101, file: !3, line: 44, column: 2)
!120 = !DILocation(line: 0, scope: !119)
!121 = !DILocation(line: 44, column: 7, scope: !119)
!122 = !DILocation(line: 44, column: 20, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !3, line: 44, column: 2)
!124 = !DILocation(line: 44, column: 2, scope: !119)
!125 = !DILocation(line: 45, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !127, file: !3, line: 45, column: 7)
!127 = distinct !DILexicalBlock(scope: !123, file: !3, line: 44, column: 39)
!128 = !DILocation(line: 45, column: 7, scope: !126)
!129 = !DILocation(line: 45, column: 38, scope: !126)
!130 = !DILocation(line: 45, column: 7, scope: !127)
!131 = !DILocation(line: 46, column: 4, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !3, line: 45, column: 54)
!133 = !DILocation(line: 47, column: 4, scope: !132)
!134 = !DILocation(line: 49, column: 2, scope: !127)
!135 = !DILocation(line: 44, column: 36, scope: !123)
!136 = !DILocation(line: 44, column: 2, scope: !123)
!137 = distinct !{!137, !124, !138}
!138 = !DILocation(line: 49, column: 2, scope: !119)
!139 = !DILocalVariable(name: "i", scope: !140, file: !3, line: 50, type: !28)
!140 = distinct !DILexicalBlock(scope: !101, file: !3, line: 50, column: 5)
!141 = !DILocation(line: 0, scope: !140)
!142 = !DILocation(line: 50, column: 10, scope: !140)
!143 = !DILocation(line: 50, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !3, line: 50, column: 5)
!145 = !DILocation(line: 50, column: 5, scope: !140)
!146 = !DILocation(line: 51, column: 25, scope: !147)
!147 = distinct !DILexicalBlock(scope: !148, file: !3, line: 51, column: 13)
!148 = distinct !DILexicalBlock(scope: !144, file: !3, line: 50, column: 41)
!149 = !DILocation(line: 51, column: 33, scope: !147)
!150 = !DILocation(line: 51, column: 42, scope: !147)
!151 = !DILocation(line: 51, column: 13, scope: !147)
!152 = !DILocation(line: 51, column: 50, scope: !147)
!153 = !DILocation(line: 51, column: 13, scope: !148)
!154 = !DILocation(line: 52, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !147, file: !3, line: 51, column: 67)
!156 = !DILocation(line: 53, column: 13, scope: !155)
!157 = !DILocation(line: 55, column: 5, scope: !148)
!158 = !DILocation(line: 50, column: 36, scope: !144)
!159 = !DILocation(line: 50, column: 5, scope: !144)
!160 = distinct !{!160, !145, !161}
!161 = !DILocation(line: 55, column: 5, scope: !140)
!162 = !DILocalVariable(name: "i", scope: !163, file: !3, line: 57, type: !28)
!163 = distinct !DILexicalBlock(scope: !101, file: !3, line: 57, column: 5)
!164 = !DILocation(line: 0, scope: !163)
!165 = !DILocation(line: 57, column: 10, scope: !163)
!166 = !DILocation(line: 57, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !3, line: 57, column: 5)
!168 = !DILocation(line: 57, column: 5, scope: !163)
!169 = !DILocation(line: 58, column: 19, scope: !167)
!170 = !DILocation(line: 58, column: 9, scope: !167)
!171 = !DILocation(line: 57, column: 36, scope: !167)
!172 = !DILocation(line: 57, column: 5, scope: !167)
!173 = distinct !{!173, !168, !174}
!174 = !DILocation(line: 58, column: 36, scope: !163)
!175 = !DILocation(line: 59, column: 5, scope: !101)
!176 = !DILocation(line: 60, column: 1, scope: !101)
