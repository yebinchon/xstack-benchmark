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
  %nam.addr = alloca i8*, align 8
  %lef.addr = alloca i32, align 4
  %righ.addr = alloca i32, align 4
  %x = alloca %struct.Philosopher*, align 8
  store i8* %nam, i8** %nam.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %nam.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 %lef, i32* %lef.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %lef.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 %righ, i32* %righ.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %righ.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata %struct.Philosopher** %x, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !69
  %0 = bitcast i8* %call to %struct.Philosopher*, !dbg !69
  store %struct.Philosopher* %0, %struct.Philosopher** %x, align 8, !dbg !68
  %1 = load i8*, i8** %nam.addr, align 8, !dbg !70
  %2 = load %struct.Philosopher*, %struct.Philosopher** %x, align 8, !dbg !71
  %name = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %2, i32 0, i32 0, !dbg !72
  store i8* %1, i8** %name, align 8, !dbg !73
  %3 = load i32, i32* %lef.addr, align 4, !dbg !74
  %4 = load %struct.Philosopher*, %struct.Philosopher** %x, align 8, !dbg !75
  %left = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %4, i32 0, i32 1, !dbg !76
  store i32 %3, i32* %left, align 8, !dbg !77
  %5 = load i32, i32* %righ.addr, align 4, !dbg !78
  %6 = load %struct.Philosopher*, %struct.Philosopher** %x, align 8, !dbg !79
  %right = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %6, i32 0, i32 2, !dbg !80
  store i32 %5, i32* %right, align 4, !dbg !81
  %7 = load %struct.Philosopher*, %struct.Philosopher** %x, align 8, !dbg !82
  ret %struct.Philosopher* %7, !dbg !83
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @eat(i8* %data) #0 !dbg !84 {
entry:
  %data.addr = alloca i8*, align 8
  %foo = alloca %struct.Philosopher*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i64 1, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time1, i32 0, i32 0), align 8, !dbg !90
  call void @llvm.dbg.declare(metadata %struct.Philosopher** %foo, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = load i8*, i8** %data.addr, align 8, !dbg !93
  %1 = bitcast i8* %0 to %struct.Philosopher*, !dbg !94
  store %struct.Philosopher* %1, %struct.Philosopher** %foo, align 8, !dbg !92
  %2 = load %struct.Philosopher*, %struct.Philosopher** %foo, align 8, !dbg !95
  %left = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %2, i32 0, i32 1, !dbg !96
  %3 = load i32, i32* %left, align 8, !dbg !96
  %idxprom = sext i32 %3 to i64, !dbg !97
  %arrayidx = getelementptr inbounds [5 x %union.mtx_t], [5 x %union.mtx_t]* @forks, i64 0, i64 %idxprom, !dbg !97
  %call = call i32 @mtx_lock(%union.mtx_t* %arrayidx), !dbg !98
  %4 = load %struct.Philosopher*, %struct.Philosopher** %foo, align 8, !dbg !99
  %right = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %4, i32 0, i32 2, !dbg !100
  %5 = load i32, i32* %right, align 4, !dbg !100
  %idxprom1 = sext i32 %5 to i64, !dbg !101
  %arrayidx2 = getelementptr inbounds [5 x %union.mtx_t], [5 x %union.mtx_t]* @forks, i64 0, i64 %idxprom1, !dbg !101
  %call3 = call i32 @mtx_lock(%union.mtx_t* %arrayidx2), !dbg !102
  %6 = load %struct.Philosopher*, %struct.Philosopher** %foo, align 8, !dbg !103
  %name = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %6, i32 0, i32 0, !dbg !104
  %7 = load i8*, i8** %name, align 8, !dbg !104
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i8* %7), !dbg !105
  %call5 = call i32 @thrd_sleep(%struct.timespec* @time1, %struct.timespec* null), !dbg !106
  %8 = load %struct.Philosopher*, %struct.Philosopher** %foo, align 8, !dbg !107
  %name6 = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %8, i32 0, i32 0, !dbg !108
  %9 = load i8*, i8** %name6, align 8, !dbg !108
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i8* %9), !dbg !109
  %10 = load %struct.Philosopher*, %struct.Philosopher** %foo, align 8, !dbg !110
  %left8 = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %10, i32 0, i32 1, !dbg !111
  %11 = load i32, i32* %left8, align 8, !dbg !111
  %idxprom9 = sext i32 %11 to i64, !dbg !112
  %arrayidx10 = getelementptr inbounds [5 x %union.mtx_t], [5 x %union.mtx_t]* @forks, i64 0, i64 %idxprom9, !dbg !112
  %call11 = call i32 @mtx_unlock(%union.mtx_t* %arrayidx10), !dbg !113
  %12 = load %struct.Philosopher*, %struct.Philosopher** %foo, align 8, !dbg !114
  %right12 = getelementptr inbounds %struct.Philosopher, %struct.Philosopher* %12, i32 0, i32 2, !dbg !115
  %13 = load i32, i32* %right12, align 4, !dbg !115
  %idxprom13 = sext i32 %13 to i64, !dbg !116
  %arrayidx14 = getelementptr inbounds [5 x %union.mtx_t], [5 x %union.mtx_t]* @forks, i64 0, i64 %idxprom13, !dbg !116
  %call15 = call i32 @mtx_unlock(%union.mtx_t* %arrayidx14), !dbg !117
  ret i32 0, !dbg !118
}

declare dso_local i32 @mtx_lock(%union.mtx_t*) #3

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @thrd_sleep(%struct.timespec*, %struct.timespec*) #3

declare dso_local i32 @mtx_unlock(%union.mtx_t*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !119 {
entry:
  %retval = alloca i32, align 4
  %threadId = alloca [5 x i64], align 16
  %all = alloca [5 x %struct.Philosopher*], align 16
  %i = alloca i32, align 4
  %i11 = alloca i32, align 4
  %i25 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i64]* %threadId, metadata !122, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [5 x %struct.Philosopher*]* %all, metadata !127, metadata !DIExpression()), !dbg !129
  %arrayinit.begin = getelementptr inbounds [5 x %struct.Philosopher*], [5 x %struct.Philosopher*]* %all, i64 0, i64 0, !dbg !130
  %call = call %struct.Philosopher* @create(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i32 0, i32 1), !dbg !131
  store %struct.Philosopher* %call, %struct.Philosopher** %arrayinit.begin, align 8, !dbg !130
  %arrayinit.element = getelementptr inbounds %struct.Philosopher*, %struct.Philosopher** %arrayinit.begin, i64 1, !dbg !130
  %call1 = call %struct.Philosopher* @create(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 1, i32 2), !dbg !132
  store %struct.Philosopher* %call1, %struct.Philosopher** %arrayinit.element, align 8, !dbg !130
  %arrayinit.element2 = getelementptr inbounds %struct.Philosopher*, %struct.Philosopher** %arrayinit.element, i64 1, !dbg !130
  %call3 = call %struct.Philosopher* @create(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i32 2, i32 3), !dbg !133
  store %struct.Philosopher* %call3, %struct.Philosopher** %arrayinit.element2, align 8, !dbg !130
  %arrayinit.element4 = getelementptr inbounds %struct.Philosopher*, %struct.Philosopher** %arrayinit.element2, i64 1, !dbg !130
  %call5 = call %struct.Philosopher* @create(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 3, i32 4), !dbg !134
  store %struct.Philosopher* %call5, %struct.Philosopher** %arrayinit.element4, align 8, !dbg !130
  %arrayinit.element6 = getelementptr inbounds %struct.Philosopher*, %struct.Philosopher** %arrayinit.element4, i64 1, !dbg !130
  %call7 = call %struct.Philosopher* @create(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i32 0, i32 4), !dbg !135
  store %struct.Philosopher* %call7, %struct.Philosopher** %arrayinit.element6, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i32* %i, metadata !136, metadata !DIExpression()), !dbg !138
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !140
  %cmp = icmp slt i32 %0, 5, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !144
  %idxprom = sext i32 %1 to i64, !dbg !147
  %arrayidx = getelementptr inbounds [5 x %union.mtx_t], [5 x %union.mtx_t]* @forks, i64 0, i64 %idxprom, !dbg !147
  %call8 = call i32 @mtx_init(%union.mtx_t* %arrayidx, i32 0), !dbg !148
  %cmp9 = icmp ne i32 %call8, 0, !dbg !149
  br i1 %cmp9, label %if.then, label %if.end, !dbg !150

if.then:                                          ; preds = %for.body
  %call10 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i64 0, i64 0)), !dbg !151
  store i32 0, i32* %retval, align 4, !dbg !153
  br label %return, !dbg !153

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %if.end
  %2 = load i32, i32* %i, align 4, !dbg !155
  %inc = add nsw i32 %2, 1, !dbg !155
  store i32 %inc, i32* %i, align 4, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !159, metadata !DIExpression()), !dbg !161
  store i32 0, i32* %i11, align 4, !dbg !161
  br label %for.cond12, !dbg !162

for.cond12:                                       ; preds = %for.inc22, %for.end
  %3 = load i32, i32* %i11, align 4, !dbg !163
  %cmp13 = icmp slt i32 %3, 5, !dbg !165
  br i1 %cmp13, label %for.body14, label %for.end24, !dbg !166

for.body14:                                       ; preds = %for.cond12
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %threadId, i64 0, i64 0, !dbg !167
  %4 = load i32, i32* %i11, align 4, !dbg !170
  %idx.ext = sext i32 %4 to i64, !dbg !171
  %add.ptr = getelementptr inbounds i64, i64* %arraydecay, i64 %idx.ext, !dbg !171
  %5 = load i32, i32* %i11, align 4, !dbg !172
  %idxprom15 = sext i32 %5 to i64, !dbg !173
  %arrayidx16 = getelementptr inbounds [5 x %struct.Philosopher*], [5 x %struct.Philosopher*]* %all, i64 0, i64 %idxprom15, !dbg !173
  %6 = load %struct.Philosopher*, %struct.Philosopher** %arrayidx16, align 8, !dbg !173
  %7 = bitcast %struct.Philosopher* %6 to i8*, !dbg !173
  %call17 = call i32 @thrd_create(i64* %add.ptr, i32 (i8*)* @eat, i8* %7), !dbg !174
  %cmp18 = icmp ne i32 %call17, 0, !dbg !175
  br i1 %cmp18, label %if.then19, label %if.end21, !dbg !176

if.then19:                                        ; preds = %for.body14
  %8 = load i32, i32* %i11, align 4, !dbg !177
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i64 0, i64 0), i32 %8), !dbg !179
  store i32 0, i32* %retval, align 4, !dbg !180
  br label %return, !dbg !180

if.end21:                                         ; preds = %for.body14
  br label %for.inc22, !dbg !181

for.inc22:                                        ; preds = %if.end21
  %9 = load i32, i32* %i11, align 4, !dbg !182
  %inc23 = add nsw i32 %9, 1, !dbg !182
  store i32 %inc23, i32* %i11, align 4, !dbg !182
  br label %for.cond12, !dbg !183, !llvm.loop !184

for.end24:                                        ; preds = %for.cond12
  call void @llvm.dbg.declare(metadata i32* %i25, metadata !186, metadata !DIExpression()), !dbg !188
  store i32 0, i32* %i25, align 4, !dbg !188
  br label %for.cond26, !dbg !189

for.cond26:                                       ; preds = %for.inc32, %for.end24
  %10 = load i32, i32* %i25, align 4, !dbg !190
  %cmp27 = icmp slt i32 %10, 5, !dbg !192
  br i1 %cmp27, label %for.body28, label %for.end34, !dbg !193

for.body28:                                       ; preds = %for.cond26
  %11 = load i32, i32* %i25, align 4, !dbg !194
  %idxprom29 = sext i32 %11 to i64, !dbg !195
  %arrayidx30 = getelementptr inbounds [5 x i64], [5 x i64]* %threadId, i64 0, i64 %idxprom29, !dbg !195
  %12 = load i64, i64* %arrayidx30, align 8, !dbg !195
  %call31 = call i32 @thrd_join(i64 %12, i32* null), !dbg !196
  br label %for.inc32, !dbg !196

for.inc32:                                        ; preds = %for.body28
  %13 = load i32, i32* %i25, align 4, !dbg !197
  %inc33 = add nsw i32 %13, 1, !dbg !197
  store i32 %inc33, i32* %i25, align 4, !dbg !197
  br label %for.cond26, !dbg !198, !llvm.loop !199

for.end34:                                        ; preds = %for.cond26
  store i32 0, i32* %retval, align 4, !dbg !201
  br label %return, !dbg !201

return:                                           ; preds = %for.end34, %if.then19, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !202
  ret i32 %14, !dbg !202
}

declare dso_local i32 @mtx_init(%union.mtx_t*, i32) #3

declare dso_local i32 @puts(i8*) #3

declare dso_local i32 @thrd_create(i64*, i32 (i8*)*, i8*) #3

declare dso_local i32 @thrd_join(i64, i32*) #3

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
!62 = !DILocation(line: 16, column: 27, scope: !57)
!63 = !DILocalVariable(name: "lef", arg: 2, scope: !57, file: !3, line: 16, type: !28)
!64 = !DILocation(line: 16, column: 36, scope: !57)
!65 = !DILocalVariable(name: "righ", arg: 3, scope: !57, file: !3, line: 16, type: !28)
!66 = !DILocation(line: 16, column: 45, scope: !57)
!67 = !DILocalVariable(name: "x", scope: !57, file: !3, line: 17, type: !20)
!68 = !DILocation(line: 17, column: 15, scope: !57)
!69 = !DILocation(line: 17, column: 19, scope: !57)
!70 = !DILocation(line: 18, column: 12, scope: !57)
!71 = !DILocation(line: 18, column: 2, scope: !57)
!72 = !DILocation(line: 18, column: 5, scope: !57)
!73 = !DILocation(line: 18, column: 10, scope: !57)
!74 = !DILocation(line: 19, column: 12, scope: !57)
!75 = !DILocation(line: 19, column: 2, scope: !57)
!76 = !DILocation(line: 19, column: 5, scope: !57)
!77 = !DILocation(line: 19, column: 10, scope: !57)
!78 = !DILocation(line: 20, column: 13, scope: !57)
!79 = !DILocation(line: 20, column: 2, scope: !57)
!80 = !DILocation(line: 20, column: 5, scope: !57)
!81 = !DILocation(line: 20, column: 11, scope: !57)
!82 = !DILocation(line: 21, column: 9, scope: !57)
!83 = !DILocation(line: 21, column: 2, scope: !57)
!84 = distinct !DISubprogram(name: "eat", scope: !3, file: !3, line: 24, type: !85, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!85 = !DISubroutineType(types: !86)
!86 = !{!28, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!88 = !DILocalVariable(name: "data", arg: 1, scope: !84, file: !3, line: 24, type: !87)
!89 = !DILocation(line: 24, column: 15, scope: !84)
!90 = !DILocation(line: 25, column: 15, scope: !84)
!91 = !DILocalVariable(name: "foo", scope: !84, file: !3, line: 26, type: !20)
!92 = !DILocation(line: 26, column: 15, scope: !84)
!93 = !DILocation(line: 26, column: 37, scope: !84)
!94 = !DILocation(line: 26, column: 21, scope: !84)
!95 = !DILocation(line: 27, column: 18, scope: !84)
!96 = !DILocation(line: 27, column: 23, scope: !84)
!97 = !DILocation(line: 27, column: 12, scope: !84)
!98 = !DILocation(line: 27, column: 2, scope: !84)
!99 = !DILocation(line: 28, column: 18, scope: !84)
!100 = !DILocation(line: 28, column: 23, scope: !84)
!101 = !DILocation(line: 28, column: 12, scope: !84)
!102 = !DILocation(line: 28, column: 2, scope: !84)
!103 = !DILocation(line: 29, column: 28, scope: !84)
!104 = !DILocation(line: 29, column: 33, scope: !84)
!105 = !DILocation(line: 29, column: 2, scope: !84)
!106 = !DILocation(line: 30, column: 2, scope: !84)
!107 = !DILocation(line: 31, column: 33, scope: !84)
!108 = !DILocation(line: 31, column: 38, scope: !84)
!109 = !DILocation(line: 31, column: 2, scope: !84)
!110 = !DILocation(line: 32, column: 20, scope: !84)
!111 = !DILocation(line: 32, column: 25, scope: !84)
!112 = !DILocation(line: 32, column: 14, scope: !84)
!113 = !DILocation(line: 32, column: 2, scope: !84)
!114 = !DILocation(line: 33, column: 20, scope: !84)
!115 = !DILocation(line: 33, column: 25, scope: !84)
!116 = !DILocation(line: 33, column: 14, scope: !84)
!117 = !DILocation(line: 33, column: 2, scope: !84)
!118 = !DILocation(line: 34, column: 2, scope: !84)
!119 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 37, type: !120, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!120 = !DISubroutineType(types: !121)
!121 = !{!28}
!122 = !DILocalVariable(name: "threadId", scope: !119, file: !3, line: 38, type: !123)
!123 = !DICompositeType(tag: DW_TAG_array_type, baseType: !124, size: 320, elements: !43)
!124 = !DIDerivedType(tag: DW_TAG_typedef, name: "thrd_t", file: !6, line: 38, baseType: !125)
!125 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!126 = !DILocation(line: 38, column: 12, scope: !119)
!127 = !DILocalVariable(name: "all", scope: !119, file: !3, line: 39, type: !128)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 320, elements: !43)
!129 = !DILocation(line: 39, column: 15, scope: !119)
!130 = !DILocation(line: 39, column: 34, scope: !119)
!131 = !DILocation(line: 39, column: 35, scope: !119)
!132 = !DILocation(line: 40, column: 6, scope: !119)
!133 = !DILocation(line: 41, column: 6, scope: !119)
!134 = !DILocation(line: 42, column: 6, scope: !119)
!135 = !DILocation(line: 43, column: 6, scope: !119)
!136 = !DILocalVariable(name: "i", scope: !137, file: !3, line: 44, type: !28)
!137 = distinct !DILexicalBlock(scope: !119, file: !3, line: 44, column: 2)
!138 = !DILocation(line: 44, column: 11, scope: !137)
!139 = !DILocation(line: 44, column: 7, scope: !137)
!140 = !DILocation(line: 44, column: 18, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !3, line: 44, column: 2)
!142 = !DILocation(line: 44, column: 20, scope: !141)
!143 = !DILocation(line: 44, column: 2, scope: !137)
!144 = !DILocation(line: 45, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !3, line: 45, column: 7)
!146 = distinct !DILexicalBlock(scope: !141, file: !3, line: 44, column: 39)
!147 = !DILocation(line: 45, column: 17, scope: !145)
!148 = !DILocation(line: 45, column: 7, scope: !145)
!149 = !DILocation(line: 45, column: 38, scope: !145)
!150 = !DILocation(line: 45, column: 7, scope: !146)
!151 = !DILocation(line: 46, column: 4, scope: !152)
!152 = distinct !DILexicalBlock(scope: !145, file: !3, line: 45, column: 54)
!153 = !DILocation(line: 47, column: 4, scope: !152)
!154 = !DILocation(line: 49, column: 2, scope: !146)
!155 = !DILocation(line: 44, column: 36, scope: !141)
!156 = !DILocation(line: 44, column: 2, scope: !141)
!157 = distinct !{!157, !143, !158}
!158 = !DILocation(line: 49, column: 2, scope: !137)
!159 = !DILocalVariable(name: "i", scope: !160, file: !3, line: 50, type: !28)
!160 = distinct !DILexicalBlock(scope: !119, file: !3, line: 50, column: 5)
!161 = !DILocation(line: 50, column: 14, scope: !160)
!162 = !DILocation(line: 50, column: 10, scope: !160)
!163 = !DILocation(line: 50, column: 19, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !3, line: 50, column: 5)
!165 = !DILocation(line: 50, column: 21, scope: !164)
!166 = !DILocation(line: 50, column: 5, scope: !160)
!167 = !DILocation(line: 51, column: 25, scope: !168)
!168 = distinct !DILexicalBlock(scope: !169, file: !3, line: 51, column: 13)
!169 = distinct !DILexicalBlock(scope: !164, file: !3, line: 50, column: 41)
!170 = !DILocation(line: 51, column: 34, scope: !168)
!171 = !DILocation(line: 51, column: 33, scope: !168)
!172 = !DILocation(line: 51, column: 46, scope: !168)
!173 = !DILocation(line: 51, column: 42, scope: !168)
!174 = !DILocation(line: 51, column: 13, scope: !168)
!175 = !DILocation(line: 51, column: 50, scope: !168)
!176 = !DILocation(line: 51, column: 13, scope: !169)
!177 = !DILocation(line: 52, column: 51, scope: !178)
!178 = distinct !DILexicalBlock(scope: !168, file: !3, line: 51, column: 67)
!179 = !DILocation(line: 52, column: 13, scope: !178)
!180 = !DILocation(line: 53, column: 13, scope: !178)
!181 = !DILocation(line: 55, column: 5, scope: !169)
!182 = !DILocation(line: 50, column: 36, scope: !164)
!183 = !DILocation(line: 50, column: 5, scope: !164)
!184 = distinct !{!184, !166, !185}
!185 = !DILocation(line: 55, column: 5, scope: !160)
!186 = !DILocalVariable(name: "i", scope: !187, file: !3, line: 57, type: !28)
!187 = distinct !DILexicalBlock(scope: !119, file: !3, line: 57, column: 5)
!188 = !DILocation(line: 57, column: 14, scope: !187)
!189 = !DILocation(line: 57, column: 10, scope: !187)
!190 = !DILocation(line: 57, column: 19, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !3, line: 57, column: 5)
!192 = !DILocation(line: 57, column: 21, scope: !191)
!193 = !DILocation(line: 57, column: 5, scope: !187)
!194 = !DILocation(line: 58, column: 28, scope: !191)
!195 = !DILocation(line: 58, column: 19, scope: !191)
!196 = !DILocation(line: 58, column: 9, scope: !191)
!197 = !DILocation(line: 57, column: 36, scope: !191)
!198 = !DILocation(line: 57, column: 5, scope: !191)
!199 = distinct !{!199, !193, !200}
!200 = !DILocation(line: 58, column: 36, scope: !187)
!201 = !DILocation(line: 59, column: 5, scope: !119)
!202 = !DILocation(line: 60, column: 1, scope: !119)
