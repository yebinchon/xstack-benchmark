; ModuleID = 'digital-root-multiplicative-digital-root.ll'
source_filename = "digital-root-multiplicative-digital-root.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.values = private unnamed_addr constant [4 x i32] [i32 123321, i32 7739, i32 893, i32 899998], align 16
@.str = private unnamed_addr constant [21 x i8] c"Number    MDR    MP\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"%6d   %3d   %3d\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"\0AMDR: [n0..n4]\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"%3d: [\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"%d%s\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"]\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_mdr(i32* %rmdr, i32* %rmp, i64 %n) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32* %rmdr, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32* %rmp, metadata !15, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i64 %n, metadata !16, metadata !DIExpression()), !dbg !14
  %tobool = icmp ne i64 %n, 0, !dbg !17
  %0 = zext i1 %tobool to i64, !dbg !17
  %cond = select i1 %tobool, i32 1, i32 0, !dbg !17
  call void @llvm.dbg.value(metadata i32 %cond, metadata !18, metadata !DIExpression()), !dbg !14
  br label %while.cond, !dbg !19

while.cond:                                       ; preds = %while.body, %entry
  %n.addr.0 = phi i64 [ %n, %entry ], [ %div, %while.body ]
  %r.0 = phi i32 [ %cond, %entry ], [ %conv2, %while.body ], !dbg !14
  call void @llvm.dbg.value(metadata i32 %r.0, metadata !18, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i64 %n.addr.0, metadata !16, metadata !DIExpression()), !dbg !14
  %tobool1 = icmp ne i64 %n.addr.0, 0, !dbg !19
  br i1 %tobool1, label %while.body, label %while.end, !dbg !19

while.body:                                       ; preds = %while.cond
  %rem = srem i64 %n.addr.0, 10, !dbg !20
  %conv = sext i32 %r.0 to i64, !dbg !22
  %mul = mul nsw i64 %conv, %rem, !dbg !22
  %conv2 = trunc i64 %mul to i32, !dbg !22
  call void @llvm.dbg.value(metadata i32 %conv2, metadata !18, metadata !DIExpression()), !dbg !14
  %div = sdiv i64 %n.addr.0, 10, !dbg !23
  call void @llvm.dbg.value(metadata i64 %div, metadata !16, metadata !DIExpression()), !dbg !14
  br label %while.cond, !dbg !19, !llvm.loop !24

while.end:                                        ; preds = %while.cond
  %1 = load i32, i32* %rmp, align 4, !dbg !26
  %inc = add nsw i32 %1, 1, !dbg !26
  store i32 %inc, i32* %rmp, align 4, !dbg !26
  %cmp = icmp sge i32 %r.0, 10, !dbg !27
  br i1 %cmp, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %while.end
  %conv4 = sext i32 %r.0 to i64, !dbg !30
  call void @_mdr(i32* %rmdr, i32* %rmp, i64 %conv4), !dbg !31
  br label %if.end, !dbg !31

if.else:                                          ; preds = %while.end
  store i32 %r.0, i32* %rmdr, align 4, !dbg !32
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !34 {
entry:
  %vmdr = alloca i32, align 4
  %vmp = alloca i32, align 4
  %values = alloca [4 x i32], align 16
  %table = alloca [10 x [5 x i32]], align 16
  %tfill = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %vmdr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %vmp, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [4 x i32]* %values, metadata !41, metadata !DIExpression()), !dbg !46
  %0 = bitcast [4 x i32]* %values to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x i32]* @__const.main.values to i8*), i64 16, i1 false), !dbg !46
  call void @llvm.dbg.value(metadata i32 4, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !49
  call void @llvm.dbg.value(metadata i32 0, metadata !50, metadata !DIExpression()), !dbg !48
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !53
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !50, metadata !DIExpression()), !dbg !48
  %cmp = icmp slt i32 %i.0, 4, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  br label %do.body, !dbg !57

do.body:                                          ; preds = %for.body
  store i32 0, i32* %vmp, align 4, !dbg !59
  %idxprom = sext i32 %i.0 to i64, !dbg !59
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %values, i64 0, i64 %idxprom, !dbg !59
  %1 = load i32, i32* %arrayidx, align 4, !dbg !59
  %conv = sext i32 %1 to i64, !dbg !59
  call void @_mdr(i32* %vmdr, i32* %vmp, i64 %conv), !dbg !59
  br label %do.end, !dbg !59

do.end:                                           ; preds = %do.body
  %idxprom1 = sext i32 %i.0 to i64, !dbg !61
  %arrayidx2 = getelementptr inbounds [4 x i32], [4 x i32]* %values, i64 0, i64 %idxprom1, !dbg !61
  %2 = load i32, i32* %arrayidx2, align 4, !dbg !61
  %3 = load i32, i32* %vmdr, align 4, !dbg !62
  %4 = load i32, i32* %vmp, align 4, !dbg !63
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 %2, i32 %3, i32 %4), !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %do.end
  %inc = add nsw i32 %i.0, 1, !dbg !66
  call void @llvm.dbg.value(metadata i32 %inc, metadata !50, metadata !DIExpression()), !dbg !48
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [10 x [5 x i32]]* %table, metadata !70, metadata !DIExpression()), !dbg !75
  %5 = bitcast [10 x [5 x i32]]* %table to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !75
  call void @llvm.dbg.declare(metadata [10 x i32]* %tfill, metadata !76, metadata !DIExpression()), !dbg !79
  %6 = bitcast [10 x i32]* %tfill to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !79
  call void @llvm.dbg.value(metadata i32 0, metadata !80, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.value(metadata i32 0, metadata !50, metadata !DIExpression()), !dbg !48
  br label %for.cond4, !dbg !81

for.cond4:                                        ; preds = %for.inc23, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc24, %for.inc23 ], !dbg !83
  %total.0 = phi i32 [ 0, %for.end ], [ %total.1, %for.inc23 ], !dbg !48
  call void @llvm.dbg.value(metadata i32 %total.0, metadata !80, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !50, metadata !DIExpression()), !dbg !48
  %cmp5 = icmp slt i32 %total.0, 50, !dbg !84
  br i1 %cmp5, label %for.body7, label %for.end25, !dbg !86

for.body7:                                        ; preds = %for.cond4
  br label %do.body8, !dbg !87

do.body8:                                         ; preds = %for.body7
  store i32 0, i32* %vmp, align 4, !dbg !89
  %conv9 = sext i32 %i.1 to i64, !dbg !89
  call void @_mdr(i32* %vmdr, i32* %vmp, i64 %conv9), !dbg !89
  br label %do.end10, !dbg !89

do.end10:                                         ; preds = %do.body8
  %7 = load i32, i32* %vmdr, align 4, !dbg !91
  %idxprom11 = sext i32 %7 to i64, !dbg !93
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %tfill, i64 0, i64 %idxprom11, !dbg !93
  %8 = load i32, i32* %arrayidx12, align 4, !dbg !93
  %cmp13 = icmp slt i32 %8, 5, !dbg !94
  br i1 %cmp13, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %do.end10
  %9 = load i32, i32* %vmdr, align 4, !dbg !96
  %idxprom15 = sext i32 %9 to i64, !dbg !98
  %arrayidx16 = getelementptr inbounds [10 x [5 x i32]], [10 x [5 x i32]]* %table, i64 0, i64 %idxprom15, !dbg !98
  %10 = load i32, i32* %vmdr, align 4, !dbg !99
  %idxprom17 = sext i32 %10 to i64, !dbg !100
  %arrayidx18 = getelementptr inbounds [10 x i32], [10 x i32]* %tfill, i64 0, i64 %idxprom17, !dbg !100
  %11 = load i32, i32* %arrayidx18, align 4, !dbg !101
  %inc19 = add nsw i32 %11, 1, !dbg !101
  store i32 %inc19, i32* %arrayidx18, align 4, !dbg !101
  %idxprom20 = sext i32 %11 to i64, !dbg !98
  %arrayidx21 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx16, i64 0, i64 %idxprom20, !dbg !98
  store i32 %i.1, i32* %arrayidx21, align 4, !dbg !102
  %inc22 = add nsw i32 %total.0, 1, !dbg !103
  call void @llvm.dbg.value(metadata i32 %inc22, metadata !80, metadata !DIExpression()), !dbg !48
  br label %if.end, !dbg !104

if.end:                                           ; preds = %if.then, %do.end10
  %total.1 = phi i32 [ %inc22, %if.then ], [ %total.0, %do.end10 ], !dbg !48
  call void @llvm.dbg.value(metadata i32 %total.1, metadata !80, metadata !DIExpression()), !dbg !48
  br label %for.inc23, !dbg !105

for.inc23:                                        ; preds = %if.end
  %inc24 = add nsw i32 %i.1, 1, !dbg !106
  call void @llvm.dbg.value(metadata i32 %inc24, metadata !50, metadata !DIExpression()), !dbg !48
  br label %for.cond4, !dbg !107, !llvm.loop !108

for.end25:                                        ; preds = %for.cond4
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @llvm.dbg.value(metadata i32 0, metadata !50, metadata !DIExpression()), !dbg !48
  br label %for.cond27, !dbg !111

for.cond27:                                       ; preds = %for.inc47, %for.end25
  %i.2 = phi i32 [ 0, %for.end25 ], [ %inc48, %for.inc47 ], !dbg !113
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !50, metadata !DIExpression()), !dbg !48
  %cmp28 = icmp slt i32 %i.2, 10, !dbg !114
  br i1 %cmp28, label %for.body30, label %for.end49, !dbg !116

for.body30:                                       ; preds = %for.cond27
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i32 %i.2), !dbg !117
  call void @llvm.dbg.value(metadata i32 0, metadata !119, metadata !DIExpression()), !dbg !48
  br label %for.cond32, !dbg !120

for.cond32:                                       ; preds = %for.inc43, %for.body30
  %j.0 = phi i32 [ 0, %for.body30 ], [ %inc44, %for.inc43 ], !dbg !122
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !119, metadata !DIExpression()), !dbg !48
  %cmp33 = icmp slt i32 %j.0, 5, !dbg !123
  br i1 %cmp33, label %for.body35, label %for.end45, !dbg !125

for.body35:                                       ; preds = %for.cond32
  %idxprom36 = sext i32 %i.2 to i64, !dbg !126
  %arrayidx37 = getelementptr inbounds [10 x [5 x i32]], [10 x [5 x i32]]* %table, i64 0, i64 %idxprom36, !dbg !126
  %idxprom38 = sext i32 %j.0 to i64, !dbg !126
  %arrayidx39 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx37, i64 0, i64 %idxprom38, !dbg !126
  %12 = load i32, i32* %arrayidx39, align 4, !dbg !126
  %cmp40 = icmp ne i32 %j.0, 4, !dbg !127
  %13 = zext i1 %cmp40 to i64, !dbg !128
  %cond = select i1 %cmp40, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i64 0, i64 0), !dbg !128
  %call42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0), i32 %12, i8* %cond), !dbg !129
  br label %for.inc43, !dbg !129

for.inc43:                                        ; preds = %for.body35
  %inc44 = add nsw i32 %j.0, 1, !dbg !130
  call void @llvm.dbg.value(metadata i32 %inc44, metadata !119, metadata !DIExpression()), !dbg !48
  br label %for.cond32, !dbg !131, !llvm.loop !132

for.end45:                                        ; preds = %for.cond32
  %call46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)), !dbg !134
  br label %for.inc47, !dbg !135

for.inc47:                                        ; preds = %for.end45
  %inc48 = add nsw i32 %i.2, 1, !dbg !136
  call void @llvm.dbg.value(metadata i32 %inc48, metadata !50, metadata !DIExpression()), !dbg !48
  br label %for.cond27, !dbg !137, !llvm.loop !138

for.end49:                                        ; preds = %for.cond27
  ret i32 0, !dbg !140
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "digital-root-multiplicative-digital-root.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Digital-root-Multiplicative-digital-root")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "_mdr", scope: !1, file: !1, line: 7, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !12}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "rmdr", arg: 1, scope: !7, file: !1, line: 7, type: !10)
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocalVariable(name: "rmp", arg: 2, scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocalVariable(name: "n", arg: 3, scope: !7, file: !1, line: 7, type: !12)
!17 = !DILocation(line: 10, column: 13, scope: !7)
!18 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 10, type: !11)
!19 = !DILocation(line: 11, column: 5, scope: !7)
!20 = !DILocation(line: 12, column: 17, scope: !21)
!21 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 15)
!22 = !DILocation(line: 12, column: 11, scope: !21)
!23 = !DILocation(line: 13, column: 11, scope: !21)
!24 = distinct !{!24, !19, !25}
!25 = !DILocation(line: 14, column: 5, scope: !7)
!26 = !DILocation(line: 16, column: 11, scope: !7)
!27 = !DILocation(line: 17, column: 11, scope: !28)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 17, column: 9)
!29 = !DILocation(line: 17, column: 9, scope: !7)
!30 = !DILocation(line: 18, column: 25, scope: !28)
!31 = !DILocation(line: 18, column: 9, scope: !28)
!32 = !DILocation(line: 20, column: 15, scope: !28)
!33 = !DILocation(line: 21, column: 1, scope: !7)
!34 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 23, type: !35, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!11}
!37 = !DILocalVariable(name: "vmdr", scope: !34, file: !1, line: 25, type: !11)
!38 = !DILocation(line: 25, column: 15, scope: !34)
!39 = !DILocalVariable(name: "vmp", scope: !34, file: !1, line: 25, type: !11)
!40 = !DILocation(line: 25, column: 21, scope: !34)
!41 = !DILocalVariable(name: "values", scope: !34, file: !1, line: 26, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 128, elements: !44)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!44 = !{!45}
!45 = !DISubrange(count: 4)
!46 = !DILocation(line: 26, column: 15, scope: !34)
!47 = !DILocalVariable(name: "vsize", scope: !34, file: !1, line: 27, type: !43)
!48 = !DILocation(line: 0, scope: !34)
!49 = !DILocation(line: 30, column: 5, scope: !34)
!50 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 25, type: !11)
!51 = !DILocation(line: 31, column: 10, scope: !52)
!52 = distinct !DILexicalBlock(scope: !34, file: !1, line: 31, column: 5)
!53 = !DILocation(line: 0, scope: !52)
!54 = !DILocation(line: 31, column: 19, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !1, line: 31, column: 5)
!56 = !DILocation(line: 31, column: 5, scope: !52)
!57 = !DILocation(line: 32, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !1, line: 31, column: 33)
!59 = !DILocation(line: 32, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !58, file: !1, line: 32, column: 9)
!61 = !DILocation(line: 33, column: 37, scope: !58)
!62 = !DILocation(line: 33, column: 48, scope: !58)
!63 = !DILocation(line: 33, column: 54, scope: !58)
!64 = !DILocation(line: 33, column: 9, scope: !58)
!65 = !DILocation(line: 34, column: 5, scope: !58)
!66 = !DILocation(line: 31, column: 28, scope: !55)
!67 = !DILocation(line: 31, column: 5, scope: !55)
!68 = distinct !{!68, !56, !69}
!69 = !DILocation(line: 34, column: 5, scope: !52)
!70 = !DILocalVariable(name: "table", scope: !34, file: !1, line: 37, type: !71)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1600, elements: !72)
!72 = !{!73, !74}
!73 = !DISubrange(count: 10)
!74 = !DISubrange(count: 5)
!75 = !DILocation(line: 37, column: 9, scope: !34)
!76 = !DILocalVariable(name: "tfill", scope: !34, file: !1, line: 38, type: !77)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !78)
!78 = !{!73}
!79 = !DILocation(line: 38, column: 9, scope: !34)
!80 = !DILocalVariable(name: "total", scope: !34, file: !1, line: 39, type: !11)
!81 = !DILocation(line: 40, column: 10, scope: !82)
!82 = distinct !DILexicalBlock(scope: !34, file: !1, line: 40, column: 5)
!83 = !DILocation(line: 0, scope: !82)
!84 = !DILocation(line: 40, column: 23, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 40, column: 5)
!86 = !DILocation(line: 40, column: 5, scope: !82)
!87 = !DILocation(line: 41, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !1, line: 40, column: 43)
!89 = !DILocation(line: 41, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !88, file: !1, line: 41, column: 9)
!91 = !DILocation(line: 42, column: 19, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 42, column: 13)
!93 = !DILocation(line: 42, column: 13, scope: !92)
!94 = !DILocation(line: 42, column: 25, scope: !92)
!95 = !DILocation(line: 42, column: 13, scope: !88)
!96 = !DILocation(line: 43, column: 19, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !1, line: 42, column: 35)
!98 = !DILocation(line: 43, column: 13, scope: !97)
!99 = !DILocation(line: 43, column: 31, scope: !97)
!100 = !DILocation(line: 43, column: 25, scope: !97)
!101 = !DILocation(line: 43, column: 36, scope: !97)
!102 = !DILocation(line: 43, column: 40, scope: !97)
!103 = !DILocation(line: 44, column: 18, scope: !97)
!104 = !DILocation(line: 45, column: 9, scope: !97)
!105 = !DILocation(line: 46, column: 5, scope: !88)
!106 = !DILocation(line: 40, column: 38, scope: !85)
!107 = !DILocation(line: 40, column: 5, scope: !85)
!108 = distinct !{!108, !86, !109}
!109 = !DILocation(line: 46, column: 5, scope: !82)
!110 = !DILocation(line: 49, column: 5, scope: !34)
!111 = !DILocation(line: 50, column: 10, scope: !112)
!112 = distinct !DILexicalBlock(scope: !34, file: !1, line: 50, column: 5)
!113 = !DILocation(line: 0, scope: !112)
!114 = !DILocation(line: 50, column: 19, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !1, line: 50, column: 5)
!116 = !DILocation(line: 50, column: 5, scope: !112)
!117 = !DILocation(line: 51, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !1, line: 50, column: 30)
!119 = !DILocalVariable(name: "j", scope: !34, file: !1, line: 25, type: !11)
!120 = !DILocation(line: 52, column: 14, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !1, line: 52, column: 9)
!122 = !DILocation(line: 0, scope: !121)
!123 = !DILocation(line: 52, column: 23, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !1, line: 52, column: 9)
!125 = !DILocation(line: 52, column: 9, scope: !121)
!126 = !DILocation(line: 53, column: 28, scope: !124)
!127 = !DILocation(line: 53, column: 43, scope: !124)
!128 = !DILocation(line: 53, column: 41, scope: !124)
!129 = !DILocation(line: 53, column: 13, scope: !124)
!130 = !DILocation(line: 52, column: 33, scope: !124)
!131 = !DILocation(line: 52, column: 9, scope: !124)
!132 = distinct !{!132, !125, !133}
!133 = !DILocation(line: 53, column: 68, scope: !121)
!134 = !DILocation(line: 54, column: 9, scope: !118)
!135 = !DILocation(line: 55, column: 5, scope: !118)
!136 = !DILocation(line: 50, column: 25, scope: !115)
!137 = !DILocation(line: 50, column: 5, scope: !115)
!138 = distinct !{!138, !116, !139}
!139 = !DILocation(line: 55, column: 5, scope: !112)
!140 = !DILocation(line: 57, column: 5, scope: !34)
