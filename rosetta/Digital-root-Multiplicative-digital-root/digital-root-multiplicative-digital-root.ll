; ModuleID = 'digital-root-multiplicative-digital-root.bc'
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
  %rmdr.addr = alloca i32*, align 8
  %rmp.addr = alloca i32*, align 8
  %n.addr = alloca i64, align 8
  %r = alloca i32, align 4
  store i32* %rmdr, i32** %rmdr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %rmdr.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32* %rmp, i32** %rmp.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %rmp.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %r, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i64, i64* %n.addr, align 8, !dbg !21
  %tobool = icmp ne i64 %0, 0, !dbg !21
  %1 = zext i1 %tobool to i64, !dbg !21
  %cond = select i1 %tobool, i32 1, i32 0, !dbg !21
  store i32 %cond, i32* %r, align 4, !dbg !20
  br label %while.cond, !dbg !22

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, i64* %n.addr, align 8, !dbg !23
  %tobool1 = icmp ne i64 %2, 0, !dbg !22
  br i1 %tobool1, label %while.body, label %while.end, !dbg !22

while.body:                                       ; preds = %while.cond
  %3 = load i64, i64* %n.addr, align 8, !dbg !24
  %rem = srem i64 %3, 10, !dbg !26
  %4 = load i32, i32* %r, align 4, !dbg !27
  %conv = sext i32 %4 to i64, !dbg !27
  %mul = mul nsw i64 %conv, %rem, !dbg !27
  %conv2 = trunc i64 %mul to i32, !dbg !27
  store i32 %conv2, i32* %r, align 4, !dbg !27
  %5 = load i64, i64* %n.addr, align 8, !dbg !28
  %div = sdiv i64 %5, 10, !dbg !28
  store i64 %div, i64* %n.addr, align 8, !dbg !28
  br label %while.cond, !dbg !22, !llvm.loop !29

while.end:                                        ; preds = %while.cond
  %6 = load i32*, i32** %rmp.addr, align 8, !dbg !31
  %7 = load i32, i32* %6, align 4, !dbg !32
  %inc = add nsw i32 %7, 1, !dbg !32
  store i32 %inc, i32* %6, align 4, !dbg !32
  %8 = load i32, i32* %r, align 4, !dbg !33
  %cmp = icmp sge i32 %8, 10, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !36

if.then:                                          ; preds = %while.end
  %9 = load i32*, i32** %rmdr.addr, align 8, !dbg !37
  %10 = load i32*, i32** %rmp.addr, align 8, !dbg !38
  %11 = load i32, i32* %r, align 4, !dbg !39
  %conv4 = sext i32 %11 to i64, !dbg !39
  call void @_mdr(i32* %9, i32* %10, i64 %conv4), !dbg !40
  br label %if.end, !dbg !40

if.else:                                          ; preds = %while.end
  %12 = load i32, i32* %r, align 4, !dbg !41
  %13 = load i32*, i32** %rmdr.addr, align 8, !dbg !42
  store i32 %12, i32* %13, align 4, !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !44
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %vmdr = alloca i32, align 4
  %vmp = alloca i32, align 4
  %values = alloca [4 x i32], align 16
  %vsize = alloca i32, align 4
  %table = alloca [10 x [5 x i32]], align 16
  %tfill = alloca [10 x i32], align 16
  %total = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %j, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %vmdr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %vmp, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [4 x i32]* %values, metadata !56, metadata !DIExpression()), !dbg !61
  %0 = bitcast [4 x i32]* %values to i8*, !dbg !61
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x i32]* @__const.main.values to i8*), i64 16, i1 false), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %vsize, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 4, i32* %vsize, align 4, !dbg !63
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !64
  store i32 0, i32* %i, align 4, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !68
  %cmp = icmp slt i32 %1, 4, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  br label %do.body, !dbg !72

do.body:                                          ; preds = %for.body
  store i32 0, i32* %vmp, align 4, !dbg !74
  %2 = load i32, i32* %i, align 4, !dbg !74
  %idxprom = sext i32 %2 to i64, !dbg !74
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %values, i64 0, i64 %idxprom, !dbg !74
  %3 = load i32, i32* %arrayidx, align 4, !dbg !74
  %conv = sext i32 %3 to i64, !dbg !74
  call void @_mdr(i32* %vmdr, i32* %vmp, i64 %conv), !dbg !74
  br label %do.end, !dbg !74

do.end:                                           ; preds = %do.body
  %4 = load i32, i32* %i, align 4, !dbg !76
  %idxprom1 = sext i32 %4 to i64, !dbg !77
  %arrayidx2 = getelementptr inbounds [4 x i32], [4 x i32]* %values, i64 0, i64 %idxprom1, !dbg !77
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !77
  %6 = load i32, i32* %vmdr, align 4, !dbg !78
  %7 = load i32, i32* %vmp, align 4, !dbg !79
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 %5, i32 %6, i32 %7), !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %do.end
  %8 = load i32, i32* %i, align 4, !dbg !82
  %inc = add nsw i32 %8, 1, !dbg !82
  store i32 %inc, i32* %i, align 4, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [10 x [5 x i32]]* %table, metadata !86, metadata !DIExpression()), !dbg !91
  %9 = bitcast [10 x [5 x i32]]* %table to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 200, i1 false), !dbg !91
  call void @llvm.dbg.declare(metadata [10 x i32]* %tfill, metadata !92, metadata !DIExpression()), !dbg !95
  %10 = bitcast [10 x i32]* %tfill to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !95
  call void @llvm.dbg.declare(metadata i32* %total, metadata !96, metadata !DIExpression()), !dbg !97
  store i32 0, i32* %total, align 4, !dbg !97
  store i32 0, i32* %i, align 4, !dbg !98
  br label %for.cond4, !dbg !100

for.cond4:                                        ; preds = %for.inc23, %for.end
  %11 = load i32, i32* %total, align 4, !dbg !101
  %cmp5 = icmp slt i32 %11, 50, !dbg !103
  br i1 %cmp5, label %for.body7, label %for.end25, !dbg !104

for.body7:                                        ; preds = %for.cond4
  br label %do.body8, !dbg !105

do.body8:                                         ; preds = %for.body7
  store i32 0, i32* %vmp, align 4, !dbg !107
  %12 = load i32, i32* %i, align 4, !dbg !107
  %conv9 = sext i32 %12 to i64, !dbg !107
  call void @_mdr(i32* %vmdr, i32* %vmp, i64 %conv9), !dbg !107
  br label %do.end10, !dbg !107

do.end10:                                         ; preds = %do.body8
  %13 = load i32, i32* %vmdr, align 4, !dbg !109
  %idxprom11 = sext i32 %13 to i64, !dbg !111
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %tfill, i64 0, i64 %idxprom11, !dbg !111
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !111
  %cmp13 = icmp slt i32 %14, 5, !dbg !112
  br i1 %cmp13, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %do.end10
  %15 = load i32, i32* %i, align 4, !dbg !114
  %16 = load i32, i32* %vmdr, align 4, !dbg !116
  %idxprom15 = sext i32 %16 to i64, !dbg !117
  %arrayidx16 = getelementptr inbounds [10 x [5 x i32]], [10 x [5 x i32]]* %table, i64 0, i64 %idxprom15, !dbg !117
  %17 = load i32, i32* %vmdr, align 4, !dbg !118
  %idxprom17 = sext i32 %17 to i64, !dbg !119
  %arrayidx18 = getelementptr inbounds [10 x i32], [10 x i32]* %tfill, i64 0, i64 %idxprom17, !dbg !119
  %18 = load i32, i32* %arrayidx18, align 4, !dbg !120
  %inc19 = add nsw i32 %18, 1, !dbg !120
  store i32 %inc19, i32* %arrayidx18, align 4, !dbg !120
  %idxprom20 = sext i32 %18 to i64, !dbg !117
  %arrayidx21 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx16, i64 0, i64 %idxprom20, !dbg !117
  store i32 %15, i32* %arrayidx21, align 4, !dbg !121
  %19 = load i32, i32* %total, align 4, !dbg !122
  %inc22 = add nsw i32 %19, 1, !dbg !122
  store i32 %inc22, i32* %total, align 4, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %do.end10
  br label %for.inc23, !dbg !124

for.inc23:                                        ; preds = %if.end
  %20 = load i32, i32* %i, align 4, !dbg !125
  %inc24 = add nsw i32 %20, 1, !dbg !125
  store i32 %inc24, i32* %i, align 4, !dbg !125
  br label %for.cond4, !dbg !126, !llvm.loop !127

for.end25:                                        ; preds = %for.cond4
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !129
  store i32 0, i32* %i, align 4, !dbg !130
  br label %for.cond27, !dbg !132

for.cond27:                                       ; preds = %for.inc47, %for.end25
  %21 = load i32, i32* %i, align 4, !dbg !133
  %cmp28 = icmp slt i32 %21, 10, !dbg !135
  br i1 %cmp28, label %for.body30, label %for.end49, !dbg !136

for.body30:                                       ; preds = %for.cond27
  %22 = load i32, i32* %i, align 4, !dbg !137
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i32 %22), !dbg !139
  store i32 0, i32* %j, align 4, !dbg !140
  br label %for.cond32, !dbg !142

for.cond32:                                       ; preds = %for.inc43, %for.body30
  %23 = load i32, i32* %j, align 4, !dbg !143
  %cmp33 = icmp slt i32 %23, 5, !dbg !145
  br i1 %cmp33, label %for.body35, label %for.end45, !dbg !146

for.body35:                                       ; preds = %for.cond32
  %24 = load i32, i32* %i, align 4, !dbg !147
  %idxprom36 = sext i32 %24 to i64, !dbg !148
  %arrayidx37 = getelementptr inbounds [10 x [5 x i32]], [10 x [5 x i32]]* %table, i64 0, i64 %idxprom36, !dbg !148
  %25 = load i32, i32* %j, align 4, !dbg !149
  %idxprom38 = sext i32 %25 to i64, !dbg !148
  %arrayidx39 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx37, i64 0, i64 %idxprom38, !dbg !148
  %26 = load i32, i32* %arrayidx39, align 4, !dbg !148
  %27 = load i32, i32* %j, align 4, !dbg !150
  %cmp40 = icmp ne i32 %27, 4, !dbg !151
  %28 = zext i1 %cmp40 to i64, !dbg !150
  %cond = select i1 %cmp40, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i64 0, i64 0), !dbg !150
  %call42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0), i32 %26, i8* %cond), !dbg !152
  br label %for.inc43, !dbg !152

for.inc43:                                        ; preds = %for.body35
  %29 = load i32, i32* %j, align 4, !dbg !153
  %inc44 = add nsw i32 %29, 1, !dbg !153
  store i32 %inc44, i32* %j, align 4, !dbg !153
  br label %for.cond32, !dbg !154, !llvm.loop !155

for.end45:                                        ; preds = %for.cond32
  %call46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)), !dbg !157
  br label %for.inc47, !dbg !158

for.inc47:                                        ; preds = %for.end45
  %30 = load i32, i32* %i, align 4, !dbg !159
  %inc48 = add nsw i32 %30, 1, !dbg !159
  store i32 %inc48, i32* %i, align 4, !dbg !159
  br label %for.cond27, !dbg !160, !llvm.loop !161

for.end49:                                        ; preds = %for.cond27
  ret i32 0, !dbg !163
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

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
!14 = !DILocation(line: 7, column: 16, scope: !7)
!15 = !DILocalVariable(name: "rmp", arg: 2, scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocation(line: 7, column: 27, scope: !7)
!17 = !DILocalVariable(name: "n", arg: 3, scope: !7, file: !1, line: 7, type: !12)
!18 = !DILocation(line: 7, column: 42, scope: !7)
!19 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 10, type: !11)
!20 = !DILocation(line: 10, column: 9, scope: !7)
!21 = !DILocation(line: 10, column: 13, scope: !7)
!22 = !DILocation(line: 11, column: 5, scope: !7)
!23 = !DILocation(line: 11, column: 12, scope: !7)
!24 = !DILocation(line: 12, column: 15, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 15)
!26 = !DILocation(line: 12, column: 17, scope: !25)
!27 = !DILocation(line: 12, column: 11, scope: !25)
!28 = !DILocation(line: 13, column: 11, scope: !25)
!29 = distinct !{!29, !22, !30}
!30 = !DILocation(line: 14, column: 5, scope: !7)
!31 = !DILocation(line: 16, column: 7, scope: !7)
!32 = !DILocation(line: 16, column: 11, scope: !7)
!33 = !DILocation(line: 17, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !7, file: !1, line: 17, column: 9)
!35 = !DILocation(line: 17, column: 11, scope: !34)
!36 = !DILocation(line: 17, column: 9, scope: !7)
!37 = !DILocation(line: 18, column: 14, scope: !34)
!38 = !DILocation(line: 18, column: 20, scope: !34)
!39 = !DILocation(line: 18, column: 25, scope: !34)
!40 = !DILocation(line: 18, column: 9, scope: !34)
!41 = !DILocation(line: 20, column: 17, scope: !34)
!42 = !DILocation(line: 20, column: 10, scope: !34)
!43 = !DILocation(line: 20, column: 15, scope: !34)
!44 = !DILocation(line: 21, column: 1, scope: !7)
!45 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 23, type: !46, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!11}
!48 = !DILocalVariable(name: "i", scope: !45, file: !1, line: 25, type: !11)
!49 = !DILocation(line: 25, column: 9, scope: !45)
!50 = !DILocalVariable(name: "j", scope: !45, file: !1, line: 25, type: !11)
!51 = !DILocation(line: 25, column: 12, scope: !45)
!52 = !DILocalVariable(name: "vmdr", scope: !45, file: !1, line: 25, type: !11)
!53 = !DILocation(line: 25, column: 15, scope: !45)
!54 = !DILocalVariable(name: "vmp", scope: !45, file: !1, line: 25, type: !11)
!55 = !DILocation(line: 25, column: 21, scope: !45)
!56 = !DILocalVariable(name: "values", scope: !45, file: !1, line: 26, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 128, elements: !59)
!58 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!59 = !{!60}
!60 = !DISubrange(count: 4)
!61 = !DILocation(line: 26, column: 15, scope: !45)
!62 = !DILocalVariable(name: "vsize", scope: !45, file: !1, line: 27, type: !58)
!63 = !DILocation(line: 27, column: 15, scope: !45)
!64 = !DILocation(line: 30, column: 5, scope: !45)
!65 = !DILocation(line: 31, column: 12, scope: !66)
!66 = distinct !DILexicalBlock(scope: !45, file: !1, line: 31, column: 5)
!67 = !DILocation(line: 31, column: 10, scope: !66)
!68 = !DILocation(line: 31, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !1, line: 31, column: 5)
!70 = !DILocation(line: 31, column: 19, scope: !69)
!71 = !DILocation(line: 31, column: 5, scope: !66)
!72 = !DILocation(line: 32, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !1, line: 31, column: 33)
!74 = !DILocation(line: 32, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !73, file: !1, line: 32, column: 9)
!76 = !DILocation(line: 33, column: 44, scope: !73)
!77 = !DILocation(line: 33, column: 37, scope: !73)
!78 = !DILocation(line: 33, column: 48, scope: !73)
!79 = !DILocation(line: 33, column: 54, scope: !73)
!80 = !DILocation(line: 33, column: 9, scope: !73)
!81 = !DILocation(line: 34, column: 5, scope: !73)
!82 = !DILocation(line: 31, column: 28, scope: !69)
!83 = !DILocation(line: 31, column: 5, scope: !69)
!84 = distinct !{!84, !71, !85}
!85 = !DILocation(line: 34, column: 5, scope: !66)
!86 = !DILocalVariable(name: "table", scope: !45, file: !1, line: 37, type: !87)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1600, elements: !88)
!88 = !{!89, !90}
!89 = !DISubrange(count: 10)
!90 = !DISubrange(count: 5)
!91 = !DILocation(line: 37, column: 9, scope: !45)
!92 = !DILocalVariable(name: "tfill", scope: !45, file: !1, line: 38, type: !93)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !94)
!94 = !{!89}
!95 = !DILocation(line: 38, column: 9, scope: !45)
!96 = !DILocalVariable(name: "total", scope: !45, file: !1, line: 39, type: !11)
!97 = !DILocation(line: 39, column: 9, scope: !45)
!98 = !DILocation(line: 40, column: 12, scope: !99)
!99 = distinct !DILexicalBlock(scope: !45, file: !1, line: 40, column: 5)
!100 = !DILocation(line: 40, column: 10, scope: !99)
!101 = !DILocation(line: 40, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !1, line: 40, column: 5)
!103 = !DILocation(line: 40, column: 23, scope: !102)
!104 = !DILocation(line: 40, column: 5, scope: !99)
!105 = !DILocation(line: 41, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 40, column: 43)
!107 = !DILocation(line: 41, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !106, file: !1, line: 41, column: 9)
!109 = !DILocation(line: 42, column: 19, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !1, line: 42, column: 13)
!111 = !DILocation(line: 42, column: 13, scope: !110)
!112 = !DILocation(line: 42, column: 25, scope: !110)
!113 = !DILocation(line: 42, column: 13, scope: !106)
!114 = !DILocation(line: 43, column: 42, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !1, line: 42, column: 35)
!116 = !DILocation(line: 43, column: 19, scope: !115)
!117 = !DILocation(line: 43, column: 13, scope: !115)
!118 = !DILocation(line: 43, column: 31, scope: !115)
!119 = !DILocation(line: 43, column: 25, scope: !115)
!120 = !DILocation(line: 43, column: 36, scope: !115)
!121 = !DILocation(line: 43, column: 40, scope: !115)
!122 = !DILocation(line: 44, column: 18, scope: !115)
!123 = !DILocation(line: 45, column: 9, scope: !115)
!124 = !DILocation(line: 46, column: 5, scope: !106)
!125 = !DILocation(line: 40, column: 38, scope: !102)
!126 = !DILocation(line: 40, column: 5, scope: !102)
!127 = distinct !{!127, !104, !128}
!128 = !DILocation(line: 46, column: 5, scope: !99)
!129 = !DILocation(line: 49, column: 5, scope: !45)
!130 = !DILocation(line: 50, column: 12, scope: !131)
!131 = distinct !DILexicalBlock(scope: !45, file: !1, line: 50, column: 5)
!132 = !DILocation(line: 50, column: 10, scope: !131)
!133 = !DILocation(line: 50, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !1, line: 50, column: 5)
!135 = !DILocation(line: 50, column: 19, scope: !134)
!136 = !DILocation(line: 50, column: 5, scope: !131)
!137 = !DILocation(line: 51, column: 26, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !1, line: 50, column: 30)
!139 = !DILocation(line: 51, column: 9, scope: !138)
!140 = !DILocation(line: 52, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !1, line: 52, column: 9)
!142 = !DILocation(line: 52, column: 14, scope: !141)
!143 = !DILocation(line: 52, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !1, line: 52, column: 9)
!145 = !DILocation(line: 52, column: 23, scope: !144)
!146 = !DILocation(line: 52, column: 9, scope: !141)
!147 = !DILocation(line: 53, column: 34, scope: !144)
!148 = !DILocation(line: 53, column: 28, scope: !144)
!149 = !DILocation(line: 53, column: 37, scope: !144)
!150 = !DILocation(line: 53, column: 41, scope: !144)
!151 = !DILocation(line: 53, column: 43, scope: !144)
!152 = !DILocation(line: 53, column: 13, scope: !144)
!153 = !DILocation(line: 52, column: 33, scope: !144)
!154 = !DILocation(line: 52, column: 9, scope: !144)
!155 = distinct !{!155, !146, !156}
!156 = !DILocation(line: 53, column: 68, scope: !141)
!157 = !DILocation(line: 54, column: 9, scope: !138)
!158 = !DILocation(line: 55, column: 5, scope: !138)
!159 = !DILocation(line: 50, column: 25, scope: !134)
!160 = !DILocation(line: 50, column: 5, scope: !134)
!161 = distinct !{!161, !136, !162}
!162 = !DILocation(line: 55, column: 5, scope: !131)
!163 = !DILocation(line: 57, column: 5, scope: !45)
