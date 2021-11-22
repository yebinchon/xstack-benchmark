; ModuleID = 'longest-increasing-subsequence.c'
source_filename = "longest-increasing-subsequence.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, i32, %struct.node* }

@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@__const.main.x = private unnamed_addr constant [6 x i32] [i32 3, i32 2, i32 6, i32 4, i32 5, i32 1], align 16
@__const.main.y = private unnamed_addr constant [16 x i32] [i32 0, i32 8, i32 4, i32 12, i32 2, i32 10, i32 6, i32 14, i32 1, i32 9, i32 5, i32 13, i32 3, i32 11, i32 7, i32 15], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @lis(i32* %v, i32 %len) #0 !dbg !7 {
entry:
  %v.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %p = alloca %struct.node*, align 8
  %n = alloca %struct.node*, align 8
  store i32* %v, i32** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %v.addr, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %struct.node** %p, metadata !18, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct.node** %n, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %len.addr, align 4, !dbg !28
  %conv = sext i32 %0 to i64, !dbg !28
  %call = call noalias i8* @calloc(i64 %conv, i64 16) #5, !dbg !29
  %1 = bitcast i8* %call to %struct.node*, !dbg !29
  store %struct.node* %1, %struct.node** %n, align 8, !dbg !27
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !33
  %3 = load i32, i32* %len.addr, align 4, !dbg !35
  %cmp = icmp slt i32 %2, %3, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %v.addr, align 8, !dbg !38
  %5 = load i32, i32* %i, align 4, !dbg !39
  %idxprom = sext i32 %5 to i64, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !38
  %6 = load i32, i32* %arrayidx, align 4, !dbg !38
  %7 = load %struct.node*, %struct.node** %n, align 8, !dbg !40
  %8 = load i32, i32* %i, align 4, !dbg !41
  %idxprom2 = sext i32 %8 to i64, !dbg !40
  %arrayidx3 = getelementptr inbounds %struct.node, %struct.node* %7, i64 %idxprom2, !dbg !40
  %val = getelementptr inbounds %struct.node, %struct.node* %arrayidx3, i32 0, i32 0, !dbg !42
  store i32 %6, i32* %val, align 8, !dbg !43
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %9, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %len.addr, align 4, !dbg !48
  store i32 %10, i32* %i, align 4, !dbg !50
  br label %for.cond4, !dbg !51

for.cond4:                                        ; preds = %for.end30, %for.end
  %11 = load i32, i32* %i, align 4, !dbg !52
  %dec = add nsw i32 %11, -1, !dbg !52
  store i32 %dec, i32* %i, align 4, !dbg !52
  %tobool = icmp ne i32 %11, 0, !dbg !54
  br i1 %tobool, label %for.body5, label %for.end31, !dbg !54

for.body5:                                        ; preds = %for.cond4
  %12 = load %struct.node*, %struct.node** %n, align 8, !dbg !55
  %13 = load i32, i32* %i, align 4, !dbg !58
  %idx.ext = sext i32 %13 to i64, !dbg !59
  %add.ptr = getelementptr inbounds %struct.node, %struct.node* %12, i64 %idx.ext, !dbg !59
  store %struct.node* %add.ptr, %struct.node** %p, align 8, !dbg !60
  br label %for.cond6, !dbg !61

for.cond6:                                        ; preds = %if.end, %for.body5
  %14 = load %struct.node*, %struct.node** %p, align 8, !dbg !62
  %incdec.ptr = getelementptr inbounds %struct.node, %struct.node* %14, i32 1, !dbg !62
  store %struct.node* %incdec.ptr, %struct.node** %p, align 8, !dbg !62
  %15 = load %struct.node*, %struct.node** %n, align 8, !dbg !64
  %16 = load i32, i32* %len.addr, align 4, !dbg !65
  %idx.ext7 = sext i32 %16 to i64, !dbg !66
  %add.ptr8 = getelementptr inbounds %struct.node, %struct.node* %15, i64 %idx.ext7, !dbg !66
  %cmp9 = icmp ult %struct.node* %14, %add.ptr8, !dbg !67
  br i1 %cmp9, label %for.body11, label %for.end30, !dbg !68

for.body11:                                       ; preds = %for.cond6
  %17 = load %struct.node*, %struct.node** %p, align 8, !dbg !69
  %val12 = getelementptr inbounds %struct.node, %struct.node* %17, i32 0, i32 0, !dbg !72
  %18 = load i32, i32* %val12, align 8, !dbg !72
  %19 = load %struct.node*, %struct.node** %n, align 8, !dbg !73
  %20 = load i32, i32* %i, align 4, !dbg !74
  %idxprom13 = sext i32 %20 to i64, !dbg !73
  %arrayidx14 = getelementptr inbounds %struct.node, %struct.node* %19, i64 %idxprom13, !dbg !73
  %val15 = getelementptr inbounds %struct.node, %struct.node* %arrayidx14, i32 0, i32 0, !dbg !75
  %21 = load i32, i32* %val15, align 8, !dbg !75
  %cmp16 = icmp sgt i32 %18, %21, !dbg !76
  br i1 %cmp16, label %land.lhs.true, label %if.end, !dbg !77, !cf.info !78

land.lhs.true:                                    ; preds = %for.body11
  %22 = load %struct.node*, %struct.node** %p, align 8, !dbg !79
  %len18 = getelementptr inbounds %struct.node, %struct.node* %22, i32 0, i32 1, !dbg !80
  %23 = load i32, i32* %len18, align 4, !dbg !80
  %24 = load %struct.node*, %struct.node** %n, align 8, !dbg !81
  %25 = load i32, i32* %i, align 4, !dbg !82
  %idxprom19 = sext i32 %25 to i64, !dbg !81
  %arrayidx20 = getelementptr inbounds %struct.node, %struct.node* %24, i64 %idxprom19, !dbg !81
  %len21 = getelementptr inbounds %struct.node, %struct.node* %arrayidx20, i32 0, i32 1, !dbg !83
  %26 = load i32, i32* %len21, align 4, !dbg !83
  %cmp22 = icmp sge i32 %23, %26, !dbg !84
  br i1 %cmp22, label %if.then, label %if.end, !dbg !85, !cf.info !78

if.then:                                          ; preds = %land.lhs.true
  %27 = load %struct.node*, %struct.node** %p, align 8, !dbg !86
  %28 = load %struct.node*, %struct.node** %n, align 8, !dbg !88
  %29 = load i32, i32* %i, align 4, !dbg !89
  %idxprom24 = sext i32 %29 to i64, !dbg !88
  %arrayidx25 = getelementptr inbounds %struct.node, %struct.node* %28, i64 %idxprom24, !dbg !88
  %next = getelementptr inbounds %struct.node, %struct.node* %arrayidx25, i32 0, i32 2, !dbg !90
  store %struct.node* %27, %struct.node** %next, align 8, !dbg !91
  %30 = load %struct.node*, %struct.node** %p, align 8, !dbg !92
  %len26 = getelementptr inbounds %struct.node, %struct.node* %30, i32 0, i32 1, !dbg !93
  %31 = load i32, i32* %len26, align 4, !dbg !93
  %add = add nsw i32 %31, 1, !dbg !94
  %32 = load %struct.node*, %struct.node** %n, align 8, !dbg !95
  %33 = load i32, i32* %i, align 4, !dbg !96
  %idxprom27 = sext i32 %33 to i64, !dbg !95
  %arrayidx28 = getelementptr inbounds %struct.node, %struct.node* %32, i64 %idxprom27, !dbg !95
  %len29 = getelementptr inbounds %struct.node, %struct.node* %arrayidx28, i32 0, i32 1, !dbg !97
  store i32 %add, i32* %len29, align 4, !dbg !98
  br label %if.end, !dbg !99

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body11
  br label %for.cond6, !dbg !100, !llvm.loop !101

for.end30:                                        ; preds = %for.cond6
  br label %for.cond4, !dbg !103, !llvm.loop !104

for.end31:                                        ; preds = %for.cond4
  store i32 0, i32* %i, align 4, !dbg !106
  %34 = load %struct.node*, %struct.node** %n, align 8, !dbg !108
  store %struct.node* %34, %struct.node** %p, align 8, !dbg !109
  br label %for.cond32, !dbg !110

for.cond32:                                       ; preds = %for.inc46, %for.end31
  %35 = load i32, i32* %i, align 4, !dbg !111
  %36 = load i32, i32* %len.addr, align 4, !dbg !113
  %cmp33 = icmp slt i32 %35, %36, !dbg !114
  br i1 %cmp33, label %for.body35, label %for.end48, !dbg !115

for.body35:                                       ; preds = %for.cond32
  %37 = load %struct.node*, %struct.node** %n, align 8, !dbg !116
  %38 = load i32, i32* %i, align 4, !dbg !118
  %idxprom36 = sext i32 %38 to i64, !dbg !116
  %arrayidx37 = getelementptr inbounds %struct.node, %struct.node* %37, i64 %idxprom36, !dbg !116
  %len38 = getelementptr inbounds %struct.node, %struct.node* %arrayidx37, i32 0, i32 1, !dbg !119
  %39 = load i32, i32* %len38, align 4, !dbg !119
  %40 = load %struct.node*, %struct.node** %p, align 8, !dbg !120
  %len39 = getelementptr inbounds %struct.node, %struct.node* %40, i32 0, i32 1, !dbg !121
  %41 = load i32, i32* %len39, align 4, !dbg !121
  %cmp40 = icmp sgt i32 %39, %41, !dbg !122
  br i1 %cmp40, label %if.then42, label %if.end45, !dbg !123, !cf.info !78

if.then42:                                        ; preds = %for.body35
  %42 = load %struct.node*, %struct.node** %n, align 8, !dbg !124
  %43 = load i32, i32* %i, align 4, !dbg !125
  %idx.ext43 = sext i32 %43 to i64, !dbg !126
  %add.ptr44 = getelementptr inbounds %struct.node, %struct.node* %42, i64 %idx.ext43, !dbg !126
  store %struct.node* %add.ptr44, %struct.node** %p, align 8, !dbg !127
  br label %if.end45, !dbg !128

if.end45:                                         ; preds = %if.then42, %for.body35
  br label %for.inc46, !dbg !121

for.inc46:                                        ; preds = %if.end45
  %44 = load i32, i32* %i, align 4, !dbg !129
  %inc47 = add nsw i32 %44, 1, !dbg !129
  store i32 %inc47, i32* %i, align 4, !dbg !129
  br label %for.cond32, !dbg !130, !llvm.loop !131

for.end48:                                        ; preds = %for.cond32
  br label %do.body, !dbg !133

do.body:                                          ; preds = %do.cond, %for.end48
  %45 = load %struct.node*, %struct.node** %p, align 8, !dbg !134
  %val49 = getelementptr inbounds %struct.node, %struct.node* %45, i32 0, i32 0, !dbg !135
  %46 = load i32, i32* %val49, align 8, !dbg !135
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %46), !dbg !136
  br label %do.cond, !dbg !136

do.cond:                                          ; preds = %do.body
  %47 = load %struct.node*, %struct.node** %p, align 8, !dbg !137
  %next51 = getelementptr inbounds %struct.node, %struct.node* %47, i32 0, i32 2, !dbg !138
  %48 = load %struct.node*, %struct.node** %next51, align 8, !dbg !138
  store %struct.node* %48, %struct.node** %p, align 8, !dbg !139
  %tobool52 = icmp ne %struct.node* %48, null, !dbg !136
  br i1 %tobool52, label %do.body, label %do.end, !dbg !136, !llvm.loop !140

do.end:                                           ; preds = %do.cond
  %call53 = call i32 @putchar(i32 10), !dbg !142
  %49 = load %struct.node*, %struct.node** %n, align 8, !dbg !143
  %50 = bitcast %struct.node* %49 to i8*, !dbg !143
  call void @free(i8* %50) #5, !dbg !144
  ret void, !dbg !145
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #2

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @putchar(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !146 {
entry:
  %retval = alloca i32, align 4
  %x = alloca [6 x i32], align 16
  %y = alloca [16 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [6 x i32]* %x, metadata !149, metadata !DIExpression()), !dbg !153
  %0 = bitcast [6 x i32]* %x to i8*, !dbg !153
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([6 x i32]* @__const.main.x to i8*), i64 24, i1 false), !dbg !153
  call void @llvm.dbg.declare(metadata [16 x i32]* %y, metadata !154, metadata !DIExpression()), !dbg !158
  %1 = bitcast [16 x i32]* %y to i8*, !dbg !158
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([16 x i32]* @__const.main.y to i8*), i64 64, i1 false), !dbg !158
  %arraydecay = getelementptr inbounds [6 x i32], [6 x i32]* %x, i64 0, i64 0, !dbg !159
  call void @lis(i32* %arraydecay, i32 6), !dbg !160
  %arraydecay1 = getelementptr inbounds [16 x i32], [16 x i32]* %y, i64 0, i64 0, !dbg !161
  call void @lis(i32* %arraydecay1, i32 16), !dbg !162
  ret i32 0, !dbg !163
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "longest-increasing-subsequence.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Longest-increasing-subsequence")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "lis", scope: !1, file: !1, line: 9, type: !8, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !11}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "v", arg: 1, scope: !7, file: !1, line: 9, type: !10)
!13 = !DILocation(line: 9, column: 15, scope: !7)
!14 = !DILocalVariable(name: "len", arg: 2, scope: !7, file: !1, line: 9, type: !11)
!15 = !DILocation(line: 9, column: 22, scope: !7)
!16 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 11, type: !11)
!17 = !DILocation(line: 11, column: 6, scope: !7)
!18 = !DILocalVariable(name: "p", scope: !7, file: !1, line: 12, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "node", file: !1, line: 4, size: 128, elements: !21)
!21 = !{!22, !23, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !20, file: !1, line: 5, baseType: !11, size: 32)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !20, file: !1, line: 5, baseType: !11, size: 32, offset: 32)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !20, file: !1, line: 6, baseType: !19, size: 64, offset: 64)
!25 = !DILocation(line: 12, column: 15, scope: !7)
!26 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 12, type: !19)
!27 = !DILocation(line: 12, column: 19, scope: !7)
!28 = !DILocation(line: 12, column: 30, scope: !7)
!29 = !DILocation(line: 12, column: 23, scope: !7)
!30 = !DILocation(line: 13, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 2)
!32 = !DILocation(line: 13, column: 7, scope: !31)
!33 = !DILocation(line: 13, column: 14, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !1, line: 13, column: 2)
!35 = !DILocation(line: 13, column: 18, scope: !34)
!36 = !DILocation(line: 13, column: 16, scope: !34)
!37 = !DILocation(line: 13, column: 2, scope: !31)
!38 = !DILocation(line: 14, column: 14, scope: !34)
!39 = !DILocation(line: 14, column: 16, scope: !34)
!40 = !DILocation(line: 14, column: 3, scope: !34)
!41 = !DILocation(line: 14, column: 5, scope: !34)
!42 = !DILocation(line: 14, column: 8, scope: !34)
!43 = !DILocation(line: 14, column: 12, scope: !34)
!44 = !DILocation(line: 13, column: 24, scope: !34)
!45 = !DILocation(line: 13, column: 2, scope: !34)
!46 = distinct !{!46, !37, !47}
!47 = !DILocation(line: 14, column: 17, scope: !31)
!48 = !DILocation(line: 16, column: 11, scope: !49)
!49 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 2)
!50 = !DILocation(line: 16, column: 9, scope: !49)
!51 = !DILocation(line: 16, column: 7, scope: !49)
!52 = !DILocation(line: 16, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !1, line: 16, column: 2)
!54 = !DILocation(line: 16, column: 2, scope: !49)
!55 = !DILocation(line: 18, column: 12, scope: !56)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 18, column: 3)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 16, column: 23)
!58 = !DILocation(line: 18, column: 16, scope: !56)
!59 = !DILocation(line: 18, column: 14, scope: !56)
!60 = !DILocation(line: 18, column: 10, scope: !56)
!61 = !DILocation(line: 18, column: 8, scope: !56)
!62 = !DILocation(line: 18, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !56, file: !1, line: 18, column: 3)
!64 = !DILocation(line: 18, column: 25, scope: !63)
!65 = !DILocation(line: 18, column: 29, scope: !63)
!66 = !DILocation(line: 18, column: 27, scope: !63)
!67 = !DILocation(line: 18, column: 23, scope: !63)
!68 = !DILocation(line: 18, column: 3, scope: !56)
!69 = !DILocation(line: 19, column: 8, scope: !70)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 19, column: 8)
!71 = distinct !DILexicalBlock(scope: !63, file: !1, line: 18, column: 36)
!72 = !DILocation(line: 19, column: 11, scope: !70)
!73 = !DILocation(line: 19, column: 17, scope: !70)
!74 = !DILocation(line: 19, column: 19, scope: !70)
!75 = !DILocation(line: 19, column: 22, scope: !70)
!76 = !DILocation(line: 19, column: 15, scope: !70)
!77 = !DILocation(line: 19, column: 26, scope: !70)
!78 = !{!"if"}
!79 = !DILocation(line: 19, column: 29, scope: !70)
!80 = !DILocation(line: 19, column: 32, scope: !70)
!81 = !DILocation(line: 19, column: 39, scope: !70)
!82 = !DILocation(line: 19, column: 41, scope: !70)
!83 = !DILocation(line: 19, column: 44, scope: !70)
!84 = !DILocation(line: 19, column: 36, scope: !70)
!85 = !DILocation(line: 19, column: 8, scope: !71)
!86 = !DILocation(line: 20, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !70, file: !1, line: 19, column: 49)
!88 = !DILocation(line: 20, column: 5, scope: !87)
!89 = !DILocation(line: 20, column: 7, scope: !87)
!90 = !DILocation(line: 20, column: 10, scope: !87)
!91 = !DILocation(line: 20, column: 15, scope: !87)
!92 = !DILocation(line: 21, column: 16, scope: !87)
!93 = !DILocation(line: 21, column: 19, scope: !87)
!94 = !DILocation(line: 21, column: 23, scope: !87)
!95 = !DILocation(line: 21, column: 5, scope: !87)
!96 = !DILocation(line: 21, column: 7, scope: !87)
!97 = !DILocation(line: 21, column: 10, scope: !87)
!98 = !DILocation(line: 21, column: 14, scope: !87)
!99 = !DILocation(line: 22, column: 4, scope: !87)
!100 = !DILocation(line: 18, column: 3, scope: !63)
!101 = distinct !{!101, !68, !102}
!102 = !DILocation(line: 23, column: 3, scope: !56)
!103 = !DILocation(line: 16, column: 2, scope: !53)
!104 = distinct !{!104, !54, !105}
!105 = !DILocation(line: 24, column: 2, scope: !49)
!106 = !DILocation(line: 27, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !7, file: !1, line: 27, column: 2)
!108 = !DILocation(line: 27, column: 18, scope: !107)
!109 = !DILocation(line: 27, column: 16, scope: !107)
!110 = !DILocation(line: 27, column: 7, scope: !107)
!111 = !DILocation(line: 27, column: 21, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !1, line: 27, column: 2)
!113 = !DILocation(line: 27, column: 25, scope: !112)
!114 = !DILocation(line: 27, column: 23, scope: !112)
!115 = !DILocation(line: 27, column: 2, scope: !107)
!116 = !DILocation(line: 28, column: 7, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !1, line: 28, column: 7)
!118 = !DILocation(line: 28, column: 9, scope: !117)
!119 = !DILocation(line: 28, column: 12, scope: !117)
!120 = !DILocation(line: 28, column: 18, scope: !117)
!121 = !DILocation(line: 28, column: 21, scope: !117)
!122 = !DILocation(line: 28, column: 16, scope: !117)
!123 = !DILocation(line: 28, column: 7, scope: !112)
!124 = !DILocation(line: 28, column: 30, scope: !117)
!125 = !DILocation(line: 28, column: 34, scope: !117)
!126 = !DILocation(line: 28, column: 32, scope: !117)
!127 = !DILocation(line: 28, column: 28, scope: !117)
!128 = !DILocation(line: 28, column: 26, scope: !117)
!129 = !DILocation(line: 27, column: 31, scope: !112)
!130 = !DILocation(line: 27, column: 2, scope: !112)
!131 = distinct !{!131, !115, !132}
!132 = !DILocation(line: 28, column: 34, scope: !107)
!133 = !DILocation(line: 30, column: 2, scope: !7)
!134 = !DILocation(line: 30, column: 19, scope: !7)
!135 = !DILocation(line: 30, column: 22, scope: !7)
!136 = !DILocation(line: 30, column: 5, scope: !7)
!137 = !DILocation(line: 30, column: 40, scope: !7)
!138 = !DILocation(line: 30, column: 43, scope: !7)
!139 = !DILocation(line: 30, column: 38, scope: !7)
!140 = distinct !{!140, !133, !141}
!141 = !DILocation(line: 30, column: 48, scope: !7)
!142 = !DILocation(line: 31, column: 2, scope: !7)
!143 = !DILocation(line: 33, column: 7, scope: !7)
!144 = !DILocation(line: 33, column: 2, scope: !7)
!145 = !DILocation(line: 34, column: 1, scope: !7)
!146 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 36, type: !147, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DISubroutineType(types: !148)
!148 = !{!11}
!149 = !DILocalVariable(name: "x", scope: !146, file: !1, line: 38, type: !150)
!150 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 192, elements: !151)
!151 = !{!152}
!152 = !DISubrange(count: 6)
!153 = !DILocation(line: 38, column: 6, scope: !146)
!154 = !DILocalVariable(name: "y", scope: !146, file: !1, line: 39, type: !155)
!155 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 512, elements: !156)
!156 = !{!157}
!157 = !DISubrange(count: 16)
!158 = !DILocation(line: 39, column: 6, scope: !146)
!159 = !DILocation(line: 41, column: 6, scope: !146)
!160 = !DILocation(line: 41, column: 2, scope: !146)
!161 = !DILocation(line: 42, column: 6, scope: !146)
!162 = !DILocation(line: 42, column: 2, scope: !146)
!163 = !DILocation(line: 43, column: 2, scope: !146)
