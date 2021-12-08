; ModuleID = 'concurrent-computing-1.ll'
source_filename = "concurrent-computing-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%union.pthread_cond_t = type { %struct.__pthread_cond_s }
%struct.__pthread_cond_s = type { %union.anon, %union.anon.0, [2 x i32], [2 x i32], i32, i32, [2 x i32] }
%union.anon = type { i64 }
%union.anon.0 = type { i64 }
%union.pthread_attr_t = type { i64, [48 x i8] }

@condm = dso_local global %union.pthread_mutex_t zeroinitializer, align 8, !dbg !0
@cond = dso_local global %union.pthread_cond_t zeroinitializer, align 8, !dbg !8
@bang = dso_local global i32 0, align 4, !dbg !53
@.str = private unnamed_addr constant [7 x i8] c"Enjoy\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"Rosetta\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Code\0A\00", align 1
@__const.main.p = private unnamed_addr constant [3 x i8* (i8*)*] [i8* (i8*)* @t_enjoy, i8* (i8*)* @t_rosetta, i8* (i8*)* @t_code], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @t_enjoy(i8* %p) #0 !dbg !88 {
entry:
  call void @llvm.dbg.value(metadata i8* %p, metadata !91, metadata !DIExpression()), !dbg !92
  br label %do.body, !dbg !93

do.body:                                          ; preds = %entry
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @condm) #6, !dbg !94
  br label %while.cond, !dbg !94

while.cond:                                       ; preds = %while.body, %do.body
  %0 = load i32, i32* @bang, align 4, !dbg !94
  %cmp = icmp eq i32 %0, 0, !dbg !94
  br i1 %cmp, label %while.body, label %while.end, !dbg !94

while.body:                                       ; preds = %while.cond
  %call1 = call i32 @pthread_cond_wait(%union.pthread_cond_t* @cond, %union.pthread_mutex_t* @condm), !dbg !96
  br label %while.cond, !dbg !94, !llvm.loop !98

while.end:                                        ; preds = %while.cond
  %call2 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @condm) #6, !dbg !94
  br label %do.end, !dbg !94

do.end:                                           ; preds = %while.end
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @pthread_exit(i8* null) #7, !dbg !100
  unreachable, !dbg !100
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #2

declare dso_local i32 @pthread_cond_wait(%union.pthread_cond_t*, %union.pthread_mutex_t*) #3

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noreturn
declare dso_local void @pthread_exit(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @t_rosetta(i8* %p) #0 !dbg !101 {
entry:
  call void @llvm.dbg.value(metadata i8* %p, metadata !102, metadata !DIExpression()), !dbg !103
  br label %do.body, !dbg !104

do.body:                                          ; preds = %entry
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @condm) #6, !dbg !105
  br label %while.cond, !dbg !105

while.cond:                                       ; preds = %while.body, %do.body
  %0 = load i32, i32* @bang, align 4, !dbg !105
  %cmp = icmp eq i32 %0, 0, !dbg !105
  br i1 %cmp, label %while.body, label %while.end, !dbg !105

while.body:                                       ; preds = %while.cond
  %call1 = call i32 @pthread_cond_wait(%union.pthread_cond_t* @cond, %union.pthread_mutex_t* @condm), !dbg !107
  br label %while.cond, !dbg !105, !llvm.loop !109

while.end:                                        ; preds = %while.cond
  %call2 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @condm) #6, !dbg !105
  br label %do.end, !dbg !105

do.end:                                           ; preds = %while.end
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @pthread_exit(i8* null) #7, !dbg !111
  unreachable, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @t_code(i8* %p) #0 !dbg !112 {
entry:
  call void @llvm.dbg.value(metadata i8* %p, metadata !113, metadata !DIExpression()), !dbg !114
  br label %do.body, !dbg !115

do.body:                                          ; preds = %entry
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @condm) #6, !dbg !116
  br label %while.cond, !dbg !116

while.cond:                                       ; preds = %while.body, %do.body
  %0 = load i32, i32* @bang, align 4, !dbg !116
  %cmp = icmp eq i32 %0, 0, !dbg !116
  br i1 %cmp, label %while.body, label %while.end, !dbg !116

while.body:                                       ; preds = %while.cond
  %call1 = call i32 @pthread_cond_wait(%union.pthread_cond_t* @cond, %union.pthread_mutex_t* @condm), !dbg !118
  br label %while.cond, !dbg !116, !llvm.loop !120

while.end:                                        ; preds = %while.cond
  %call2 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @condm) #6, !dbg !116
  br label %do.end, !dbg !116

do.end:                                           ; preds = %while.end
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0)), !dbg !121
  call void @pthread_exit(i8* null) #7, !dbg !122
  unreachable, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !123 {
entry:
  %a = alloca [3 x i64], align 16
  %p = alloca [3 x i8* (i8*)*], align 16
  call void @llvm.dbg.declare(metadata [3 x i64]* %a, metadata !126, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [3 x i8* (i8*)*]* %p, metadata !133, metadata !DIExpression()), !dbg !137
  %0 = bitcast [3 x i8* (i8*)*]* %p to i8*, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([3 x i8* (i8*)*]* @__const.main.p to i8*), i64 24, i1 false), !dbg !137
  call void @llvm.dbg.value(metadata i32 0, metadata !138, metadata !DIExpression()), !dbg !139
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !142
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !138, metadata !DIExpression()), !dbg !139
  %cmp = icmp slt i32 %i.0, 3, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !146
  %arrayidx = getelementptr inbounds [3 x i64], [3 x i64]* %a, i64 0, i64 %idxprom, !dbg !146
  %idxprom1 = sext i32 %i.0 to i64, !dbg !148
  %arrayidx2 = getelementptr inbounds [3 x i8* (i8*)*], [3 x i8* (i8*)*]* %p, i64 0, i64 %idxprom1, !dbg !148
  %1 = load i8* (i8*)*, i8* (i8*)** %arrayidx2, align 8, !dbg !148
  %call = call i32 @pthread_create(i64* %arrayidx, %union.pthread_attr_t* null, i8* (i8*)* %1, i8* null) #6, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !151
  call void @llvm.dbg.value(metadata i32 %inc, metadata !138, metadata !DIExpression()), !dbg !139
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %call3 = call i32 @sleep(i32 1), !dbg !155
  store i32 1, i32* @bang, align 4, !dbg !156
  %call4 = call i32 @pthread_cond_broadcast(%union.pthread_cond_t* @cond) #6, !dbg !157
  call void @llvm.dbg.value(metadata i32 0, metadata !138, metadata !DIExpression()), !dbg !139
  br label %for.cond5, !dbg !158

for.cond5:                                        ; preds = %for.inc11, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc12, %for.inc11 ], !dbg !160
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !138, metadata !DIExpression()), !dbg !139
  %cmp6 = icmp slt i32 %i.1, 3, !dbg !161
  br i1 %cmp6, label %for.body7, label %for.end13, !dbg !163

for.body7:                                        ; preds = %for.cond5
  %idxprom8 = sext i32 %i.1 to i64, !dbg !164
  %arrayidx9 = getelementptr inbounds [3 x i64], [3 x i64]* %a, i64 0, i64 %idxprom8, !dbg !164
  %2 = load i64, i64* %arrayidx9, align 8, !dbg !164
  %call10 = call i32 @pthread_join(i64 %2, i8** null), !dbg !166
  br label %for.inc11, !dbg !167

for.inc11:                                        ; preds = %for.body7
  %inc12 = add nsw i32 %i.1, 1, !dbg !168
  call void @llvm.dbg.value(metadata i32 %inc12, metadata !138, metadata !DIExpression()), !dbg !139
  br label %for.cond5, !dbg !169, !llvm.loop !170

for.end13:                                        ; preds = %for.cond5
  ret i32 0, !dbg !172
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare !callback !173 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #2

declare dso_local i32 @sleep(i32) #3

; Function Attrs: nounwind
declare dso_local i32 @pthread_cond_broadcast(%union.pthread_cond_t*) #2

declare dso_local i32 @pthread_join(i64, i8**) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!84, !85, !86}
!llvm.ident = !{!87}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "condm", scope: !2, file: !3, line: 5, type: !56, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "concurrent-computing-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Concurrent-computing")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{!0, !8, !53}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "cond", scope: !2, file: !3, line: 6, type: !10, isLocal: false, isDefinition: true)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_cond_t", file: !11, line: 80, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "")
!12 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !11, line: 75, size: 384, elements: !13)
!13 = !{!14, !46, !51}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "__data", scope: !12, file: !11, line: 77, baseType: !15, size: 384)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_cond_s", file: !16, line: 92, size: 384, elements: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h", directory: "")
!17 = !{!18, !29, !38, !42, !43, !44, !45}
!18 = !DIDerivedType(tag: DW_TAG_member, scope: !15, file: !16, line: 94, baseType: !19, size: 64)
!19 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !15, file: !16, line: 94, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "__wseq", scope: !19, file: !16, line: 96, baseType: !22, size: 64)
!22 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "__wseq32", scope: !19, file: !16, line: 101, baseType: !24, size: 64)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !19, file: !16, line: 97, size: 64, elements: !25)
!25 = !{!26, !28}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "__low", scope: !24, file: !16, line: 99, baseType: !27, size: 32)
!27 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "__high", scope: !24, file: !16, line: 100, baseType: !27, size: 32, offset: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, scope: !15, file: !16, line: 103, baseType: !30, size: 64, offset: 64)
!30 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !15, file: !16, line: 103, size: 64, elements: !31)
!31 = !{!32, !33}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "__g1_start", scope: !30, file: !16, line: 105, baseType: !22, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "__g1_start32", scope: !30, file: !16, line: 110, baseType: !34, size: 64)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !30, file: !16, line: 106, size: 64, elements: !35)
!35 = !{!36, !37}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "__low", scope: !34, file: !16, line: 108, baseType: !27, size: 32)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "__high", scope: !34, file: !16, line: 109, baseType: !27, size: 32, offset: 32)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "__g_refs", scope: !15, file: !16, line: 112, baseType: !39, size: 64, offset: 128)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 64, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 2)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "__g_size", scope: !15, file: !16, line: 113, baseType: !39, size: 64, offset: 192)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "__g1_orig_size", scope: !15, file: !16, line: 114, baseType: !27, size: 32, offset: 256)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "__wrefs", scope: !15, file: !16, line: 115, baseType: !27, size: 32, offset: 288)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "__g_signals", scope: !15, file: !16, line: 116, baseType: !39, size: 64, offset: 320)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !12, file: !11, line: 78, baseType: !47, size: 384)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 384, elements: !49)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !{!50}
!50 = !DISubrange(count: 48)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !12, file: !11, line: 79, baseType: !52, size: 64)
!52 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(name: "bang", scope: !2, file: !3, line: 7, type: !55, isLocal: false, isDefinition: true)
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_mutex_t", file: !11, line: 72, baseType: !57)
!57 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !11, line: 67, size: 320, elements: !58)
!58 = !{!59, !78, !82}
!59 = !DIDerivedType(tag: DW_TAG_member, name: "__data", scope: !57, file: !11, line: 69, baseType: !60, size: 320)
!60 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_mutex_s", file: !61, line: 22, size: 320, elements: !62)
!61 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h", directory: "")
!62 = !{!63, !64, !65, !66, !67, !68, !70, !71}
!63 = !DIDerivedType(tag: DW_TAG_member, name: "__lock", scope: !60, file: !61, line: 24, baseType: !55, size: 32)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !60, file: !61, line: 25, baseType: !27, size: 32, offset: 32)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "__owner", scope: !60, file: !61, line: 26, baseType: !55, size: 32, offset: 64)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "__nusers", scope: !60, file: !61, line: 28, baseType: !27, size: 32, offset: 96)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "__kind", scope: !60, file: !61, line: 32, baseType: !55, size: 32, offset: 128)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "__spins", scope: !60, file: !61, line: 34, baseType: !69, size: 16, offset: 160)
!69 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "__elision", scope: !60, file: !61, line: 35, baseType: !69, size: 16, offset: 176)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "__list", scope: !60, file: !61, line: 36, baseType: !72, size: 128, offset: 192)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pthread_list_t", file: !16, line: 53, baseType: !73)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_internal_list", file: !16, line: 49, size: 128, elements: !74)
!74 = !{!75, !77}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "__prev", scope: !73, file: !16, line: 51, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "__next", scope: !73, file: !16, line: 52, baseType: !76, size: 64, offset: 64)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !57, file: !11, line: 70, baseType: !79, size: 320)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 320, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 40)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !57, file: !11, line: 71, baseType: !83, size: 64)
!83 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!84 = !{i32 7, !"Dwarf Version", i32 4}
!85 = !{i32 2, !"Debug Info Version", i32 3}
!86 = !{i32 1, !"wchar_size", i32 4}
!87 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!88 = distinct !DISubprogram(name: "t_enjoy", scope: !3, file: !3, line: 17, type: !89, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DISubroutineType(types: !90)
!90 = !{!6, !6}
!91 = !DILocalVariable(name: "p", arg: 1, scope: !88, file: !3, line: 17, type: !6)
!92 = !DILocation(line: 0, scope: !88)
!93 = !DILocation(line: 19, column: 3, scope: !88)
!94 = !DILocation(line: 19, column: 3, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !3, line: 19, column: 3)
!96 = !DILocation(line: 19, column: 3, scope: !97)
!97 = distinct !DILexicalBlock(scope: !95, file: !3, line: 19, column: 3)
!98 = distinct !{!98, !94, !94}
!99 = !DILocation(line: 20, column: 3, scope: !88)
!100 = !DILocation(line: 21, column: 3, scope: !88)
!101 = distinct !DISubprogram(name: "t_rosetta", scope: !3, file: !3, line: 24, type: !89, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "p", arg: 1, scope: !101, file: !3, line: 24, type: !6)
!103 = !DILocation(line: 0, scope: !101)
!104 = !DILocation(line: 26, column: 3, scope: !101)
!105 = !DILocation(line: 26, column: 3, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !3, line: 26, column: 3)
!107 = !DILocation(line: 26, column: 3, scope: !108)
!108 = distinct !DILexicalBlock(scope: !106, file: !3, line: 26, column: 3)
!109 = distinct !{!109, !105, !105}
!110 = !DILocation(line: 27, column: 3, scope: !101)
!111 = !DILocation(line: 28, column: 3, scope: !101)
!112 = distinct !DISubprogram(name: "t_code", scope: !3, file: !3, line: 31, type: !89, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "p", arg: 1, scope: !112, file: !3, line: 31, type: !6)
!114 = !DILocation(line: 0, scope: !112)
!115 = !DILocation(line: 33, column: 3, scope: !112)
!116 = !DILocation(line: 33, column: 3, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !3, line: 33, column: 3)
!118 = !DILocation(line: 33, column: 3, scope: !119)
!119 = distinct !DILexicalBlock(scope: !117, file: !3, line: 33, column: 3)
!120 = distinct !{!120, !116, !116}
!121 = !DILocation(line: 34, column: 3, scope: !112)
!122 = !DILocation(line: 35, column: 3, scope: !112)
!123 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 39, type: !124, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DISubroutineType(types: !125)
!125 = !{!55}
!126 = !DILocalVariable(name: "a", scope: !123, file: !3, line: 42, type: !127)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !128, size: 192, elements: !130)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !11, line: 27, baseType: !129)
!129 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!130 = !{!131}
!131 = !DISubrange(count: 3)
!132 = !DILocation(line: 42, column: 14, scope: !123)
!133 = !DILocalVariable(name: "p", scope: !123, file: !3, line: 43, type: !134)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !135, size: 192, elements: !130)
!135 = !DIDerivedType(tag: DW_TAG_typedef, name: "threadfunc", file: !3, line: 38, baseType: !136)
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!137 = !DILocation(line: 43, column: 15, scope: !123)
!138 = !DILocalVariable(name: "i", scope: !123, file: !3, line: 41, type: !55)
!139 = !DILocation(line: 0, scope: !123)
!140 = !DILocation(line: 45, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !123, file: !3, line: 45, column: 4)
!142 = !DILocation(line: 0, scope: !141)
!143 = !DILocation(line: 45, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !3, line: 45, column: 4)
!145 = !DILocation(line: 45, column: 4, scope: !141)
!146 = !DILocation(line: 47, column: 22, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !3, line: 46, column: 4)
!148 = !DILocation(line: 47, column: 34, scope: !147)
!149 = !DILocation(line: 47, column: 6, scope: !147)
!150 = !DILocation(line: 48, column: 4, scope: !147)
!151 = !DILocation(line: 45, column: 17, scope: !144)
!152 = !DILocation(line: 45, column: 4, scope: !144)
!153 = distinct !{!153, !145, !154}
!154 = !DILocation(line: 48, column: 4, scope: !141)
!155 = !DILocation(line: 49, column: 4, scope: !123)
!156 = !DILocation(line: 50, column: 9, scope: !123)
!157 = !DILocation(line: 51, column: 4, scope: !123)
!158 = !DILocation(line: 52, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !123, file: !3, line: 52, column: 4)
!160 = !DILocation(line: 0, scope: !159)
!161 = !DILocation(line: 52, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !3, line: 52, column: 4)
!163 = !DILocation(line: 52, column: 4, scope: !159)
!164 = !DILocation(line: 54, column: 19, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !3, line: 53, column: 4)
!166 = !DILocation(line: 54, column: 6, scope: !165)
!167 = !DILocation(line: 55, column: 4, scope: !165)
!168 = !DILocation(line: 52, column: 17, scope: !162)
!169 = !DILocation(line: 52, column: 4, scope: !162)
!170 = distinct !{!170, !163, !171}
!171 = !DILocation(line: 55, column: 4, scope: !159)
!172 = !DILocation(line: 56, column: 1, scope: !123)
!173 = !{!174}
!174 = !{i64 2, i64 3, i1 false}
