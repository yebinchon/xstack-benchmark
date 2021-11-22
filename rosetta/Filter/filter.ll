; ModuleID = 'filter.c'
source_filename = "filter.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.in = private unnamed_addr constant [10 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10], align 16
@.str = private unnamed_addr constant [15 x i8] c"Filtered even:\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [37 x i8] c"In-place filtered not multiple of 3:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @even_sel(i32 %x) #0 !dbg !7 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %x.addr, align 4, !dbg !13
  %and = and i32 %0, 1, !dbg !14
  %tobool = icmp ne i32 %and, 0, !dbg !15
  %lnot = xor i1 %tobool, true, !dbg !15
  %lnot.ext = zext i1 %lnot to i32, !dbg !15
  ret i32 %lnot.ext, !dbg !16
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @tri_sel(i32 %x) #0 !dbg !17 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* %x.addr, align 4, !dbg !20
  %rem = srem i32 %0, 3, !dbg !21
  ret i32 %rem, !dbg !22
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @grep(i32* %in, i32 %len, i32* %outlen, i32 (i32)* %sel, i32 %inplace) #0 !dbg !23 {
entry:
  %in.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %outlen.addr = alloca i32*, align 8
  %sel.addr = alloca i32 (i32)*, align 8
  %inplace.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %out = alloca i32*, align 8
  store i32* %in, i32** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %in.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !30, metadata !DIExpression()), !dbg !31
  store i32* %outlen, i32** %outlen.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %outlen.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store i32 (i32)* %sel, i32 (i32)** %sel.addr, align 8
  call void @llvm.dbg.declare(metadata i32 (i32)** %sel.addr, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 %inplace, i32* %inplace.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %inplace.addr, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %i, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %j, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32** %out, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* %inplace.addr, align 4, !dbg !44
  %tobool = icmp ne i32 %0, 0, !dbg !44
  br i1 %tobool, label %if.then, label %if.else, !dbg !46, !cf.info !47

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %in.addr, align 8, !dbg !48
  store i32* %1, i32** %out, align 8, !dbg !49
  br label %if.end, !dbg !50

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %len.addr, align 4, !dbg !51
  %conv = sext i32 %2 to i64, !dbg !51
  %mul = mul i64 4, %conv, !dbg !52
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !53
  %3 = bitcast i8* %call to i32*, !dbg !53
  store i32* %3, i32** %out, align 8, !dbg !54
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* %j, align 4, !dbg !55
  store i32 0, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !59
  %5 = load i32, i32* %len.addr, align 4, !dbg !61
  %cmp = icmp slt i32 %4, %5, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %6 = load i32 (i32)*, i32 (i32)** %sel.addr, align 8, !dbg !64
  %7 = load i32*, i32** %in.addr, align 8, !dbg !66
  %8 = load i32, i32* %i, align 4, !dbg !67
  %idxprom = sext i32 %8 to i64, !dbg !66
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !66
  %9 = load i32, i32* %arrayidx, align 4, !dbg !66
  %call2 = call i32 %6(i32 %9), !dbg !64
  %tobool3 = icmp ne i32 %call2, 0, !dbg !64
  br i1 %tobool3, label %if.then4, label %if.end9, !dbg !68, !cf.info !47

if.then4:                                         ; preds = %for.body
  %10 = load i32*, i32** %in.addr, align 8, !dbg !69
  %11 = load i32, i32* %i, align 4, !dbg !70
  %idxprom5 = sext i32 %11 to i64, !dbg !69
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 %idxprom5, !dbg !69
  %12 = load i32, i32* %arrayidx6, align 4, !dbg !69
  %13 = load i32*, i32** %out, align 8, !dbg !71
  %14 = load i32, i32* %j, align 4, !dbg !72
  %inc = add nsw i32 %14, 1, !dbg !72
  store i32 %inc, i32* %j, align 4, !dbg !72
  %idxprom7 = sext i32 %14 to i64, !dbg !71
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 %idxprom7, !dbg !71
  store i32 %12, i32* %arrayidx8, align 4, !dbg !73
  br label %if.end9, !dbg !71

if.end9:                                          ; preds = %if.then4, %for.body
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %if.end9
  %15 = load i32, i32* %i, align 4, !dbg !75
  %inc10 = add nsw i32 %15, 1, !dbg !75
  store i32 %inc10, i32* %i, align 4, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %inplace.addr, align 4, !dbg !79
  %tobool11 = icmp ne i32 %16, 0, !dbg !79
  br i1 %tobool11, label %if.end18, label %land.lhs.true, !dbg !81, !cf.info !47

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %j, align 4, !dbg !82
  %18 = load i32, i32* %len.addr, align 4, !dbg !83
  %cmp12 = icmp slt i32 %17, %18, !dbg !84
  br i1 %cmp12, label %if.then14, label %if.end18, !dbg !85, !cf.info !47

if.then14:                                        ; preds = %land.lhs.true
  %19 = load i32*, i32** %out, align 8, !dbg !86
  %20 = bitcast i32* %19 to i8*, !dbg !86
  %21 = load i32, i32* %j, align 4, !dbg !87
  %conv15 = sext i32 %21 to i64, !dbg !87
  %mul16 = mul i64 4, %conv15, !dbg !88
  %call17 = call i8* @realloc(i8* %20, i64 %mul16) #5, !dbg !89
  %22 = bitcast i8* %call17 to i32*, !dbg !89
  store i32* %22, i32** %out, align 8, !dbg !90
  br label %if.end18, !dbg !91

if.end18:                                         ; preds = %if.then14, %land.lhs.true, %for.end
  %23 = load i32, i32* %j, align 4, !dbg !92
  %24 = load i32*, i32** %outlen.addr, align 8, !dbg !93
  store i32 %23, i32* %24, align 4, !dbg !94
  %25 = load i32*, i32** %out, align 8, !dbg !95
  ret i32* %25, !dbg !96
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %in = alloca [10 x i32], align 16
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %even = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %in, metadata !100, metadata !DIExpression()), !dbg !104
  %0 = bitcast [10 x i32]* %in to i8*, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x i32]* @__const.main.in to i8*), i64 40, i1 false), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %i, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %len, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32** %even, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %in, i64 0, i64 0, !dbg !111
  %call = call i32* @grep(i32* %arraydecay, i32 10, i32* %len, i32 (i32)* @even_sel, i32 0), !dbg !112
  store i32* %call, i32** %even, align 8, !dbg !110
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0)), !dbg !113
  store i32 0, i32* %i, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !117
  %2 = load i32, i32* %len, align 4, !dbg !119
  %cmp = icmp slt i32 %1, %2, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %even, align 8, !dbg !122
  %4 = load i32, i32* %i, align 4, !dbg !123
  %idxprom = sext i32 %4 to i64, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !122
  %5 = load i32, i32* %arrayidx, align 4, !dbg !122
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %5), !dbg !124
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !125
  %inc = add nsw i32 %6, 1, !dbg !125
  store i32 %inc, i32* %i, align 4, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !129
  %arraydecay4 = getelementptr inbounds [10 x i32], [10 x i32]* %in, i64 0, i64 0, !dbg !130
  %call5 = call i32* @grep(i32* %arraydecay4, i32 8, i32* %len, i32 (i32)* @tri_sel, i32 1), !dbg !131
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.3, i64 0, i64 0)), !dbg !132
  store i32 0, i32* %i, align 4, !dbg !133
  br label %for.cond7, !dbg !135

for.cond7:                                        ; preds = %for.inc13, %for.end
  %7 = load i32, i32* %i, align 4, !dbg !136
  %8 = load i32, i32* %len, align 4, !dbg !138
  %cmp8 = icmp slt i32 %7, %8, !dbg !139
  br i1 %cmp8, label %for.body9, label %for.end15, !dbg !140

for.body9:                                        ; preds = %for.cond7
  %9 = load i32, i32* %i, align 4, !dbg !141
  %idxprom10 = sext i32 %9 to i64, !dbg !142
  %arrayidx11 = getelementptr inbounds [10 x i32], [10 x i32]* %in, i64 0, i64 %idxprom10, !dbg !142
  %10 = load i32, i32* %arrayidx11, align 4, !dbg !142
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %10), !dbg !143
  br label %for.inc13, !dbg !143

for.inc13:                                        ; preds = %for.body9
  %11 = load i32, i32* %i, align 4, !dbg !144
  %inc14 = add nsw i32 %11, 1, !dbg !144
  store i32 %inc14, i32* %i, align 4, !dbg !144
  br label %for.cond7, !dbg !145, !llvm.loop !146

for.end15:                                        ; preds = %for.cond7
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !148
  ret i32 0, !dbg !149
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "filter.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Filter")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "even_sel", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 18, scope: !7)
!13 = !DILocation(line: 4, column: 32, scope: !7)
!14 = !DILocation(line: 4, column: 34, scope: !7)
!15 = !DILocation(line: 4, column: 30, scope: !7)
!16 = !DILocation(line: 4, column: 23, scope: !7)
!17 = distinct !DISubprogram(name: "tri_sel", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DILocalVariable(name: "x", arg: 1, scope: !17, file: !1, line: 5, type: !10)
!19 = !DILocation(line: 5, column: 17, scope: !17)
!20 = !DILocation(line: 5, column: 29, scope: !17)
!21 = !DILocation(line: 5, column: 31, scope: !17)
!22 = !DILocation(line: 5, column: 22, scope: !17)
!23 = distinct !DISubprogram(name: "grep", scope: !1, file: !1, line: 8, type: !24, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !26, !10, !26, !27, !10}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!28 = !DILocalVariable(name: "in", arg: 1, scope: !23, file: !1, line: 8, type: !26)
!29 = !DILocation(line: 8, column: 16, scope: !23)
!30 = !DILocalVariable(name: "len", arg: 2, scope: !23, file: !1, line: 8, type: !10)
!31 = !DILocation(line: 8, column: 24, scope: !23)
!32 = !DILocalVariable(name: "outlen", arg: 3, scope: !23, file: !1, line: 8, type: !26)
!33 = !DILocation(line: 8, column: 34, scope: !23)
!34 = !DILocalVariable(name: "sel", arg: 4, scope: !23, file: !1, line: 8, type: !27)
!35 = !DILocation(line: 8, column: 48, scope: !23)
!36 = !DILocalVariable(name: "inplace", arg: 5, scope: !23, file: !1, line: 8, type: !10)
!37 = !DILocation(line: 8, column: 63, scope: !23)
!38 = !DILocalVariable(name: "i", scope: !23, file: !1, line: 10, type: !10)
!39 = !DILocation(line: 10, column: 6, scope: !23)
!40 = !DILocalVariable(name: "j", scope: !23, file: !1, line: 10, type: !10)
!41 = !DILocation(line: 10, column: 9, scope: !23)
!42 = !DILocalVariable(name: "out", scope: !23, file: !1, line: 10, type: !26)
!43 = !DILocation(line: 10, column: 13, scope: !23)
!44 = !DILocation(line: 12, column: 6, scope: !45)
!45 = distinct !DILexicalBlock(scope: !23, file: !1, line: 12, column: 6)
!46 = !DILocation(line: 12, column: 6, scope: !23)
!47 = !{!"if"}
!48 = !DILocation(line: 12, column: 21, scope: !45)
!49 = !DILocation(line: 12, column: 19, scope: !45)
!50 = !DILocation(line: 12, column: 15, scope: !45)
!51 = !DILocation(line: 13, column: 35, scope: !45)
!52 = !DILocation(line: 13, column: 33, scope: !45)
!53 = !DILocation(line: 13, column: 14, scope: !45)
!54 = !DILocation(line: 13, column: 12, scope: !45)
!55 = !DILocation(line: 15, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !23, file: !1, line: 15, column: 2)
!57 = !DILocation(line: 15, column: 9, scope: !56)
!58 = !DILocation(line: 15, column: 7, scope: !56)
!59 = !DILocation(line: 15, column: 18, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !1, line: 15, column: 2)
!61 = !DILocation(line: 15, column: 22, scope: !60)
!62 = !DILocation(line: 15, column: 20, scope: !60)
!63 = !DILocation(line: 15, column: 2, scope: !56)
!64 = !DILocation(line: 16, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !1, line: 16, column: 7)
!66 = !DILocation(line: 16, column: 11, scope: !65)
!67 = !DILocation(line: 16, column: 14, scope: !65)
!68 = !DILocation(line: 16, column: 7, scope: !60)
!69 = !DILocation(line: 17, column: 15, scope: !65)
!70 = !DILocation(line: 17, column: 18, scope: !65)
!71 = !DILocation(line: 17, column: 4, scope: !65)
!72 = !DILocation(line: 17, column: 9, scope: !65)
!73 = !DILocation(line: 17, column: 13, scope: !65)
!74 = !DILocation(line: 16, column: 16, scope: !65)
!75 = !DILocation(line: 15, column: 28, scope: !60)
!76 = !DILocation(line: 15, column: 2, scope: !60)
!77 = distinct !{!77, !63, !78}
!78 = !DILocation(line: 17, column: 19, scope: !56)
!79 = !DILocation(line: 19, column: 7, scope: !80)
!80 = distinct !DILexicalBlock(scope: !23, file: !1, line: 19, column: 6)
!81 = !DILocation(line: 19, column: 15, scope: !80)
!82 = !DILocation(line: 19, column: 18, scope: !80)
!83 = !DILocation(line: 19, column: 22, scope: !80)
!84 = !DILocation(line: 19, column: 20, scope: !80)
!85 = !DILocation(line: 19, column: 6, scope: !23)
!86 = !DILocation(line: 20, column: 17, scope: !80)
!87 = !DILocation(line: 20, column: 36, scope: !80)
!88 = !DILocation(line: 20, column: 34, scope: !80)
!89 = !DILocation(line: 20, column: 9, scope: !80)
!90 = !DILocation(line: 20, column: 7, scope: !80)
!91 = !DILocation(line: 20, column: 3, scope: !80)
!92 = !DILocation(line: 22, column: 12, scope: !23)
!93 = !DILocation(line: 22, column: 3, scope: !23)
!94 = !DILocation(line: 22, column: 10, scope: !23)
!95 = !DILocation(line: 23, column: 9, scope: !23)
!96 = !DILocation(line: 23, column: 2, scope: !23)
!97 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 26, type: !98, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!10}
!100 = !DILocalVariable(name: "in", scope: !97, file: !1, line: 28, type: !101)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !102)
!102 = !{!103}
!103 = !DISubrange(count: 10)
!104 = !DILocation(line: 28, column: 6, scope: !97)
!105 = !DILocalVariable(name: "i", scope: !97, file: !1, line: 29, type: !10)
!106 = !DILocation(line: 29, column: 6, scope: !97)
!107 = !DILocalVariable(name: "len", scope: !97, file: !1, line: 29, type: !10)
!108 = !DILocation(line: 29, column: 9, scope: !97)
!109 = !DILocalVariable(name: "even", scope: !97, file: !1, line: 31, type: !26)
!110 = !DILocation(line: 31, column: 7, scope: !97)
!111 = !DILocation(line: 31, column: 19, scope: !97)
!112 = !DILocation(line: 31, column: 14, scope: !97)
!113 = !DILocation(line: 32, column: 2, scope: !97)
!114 = !DILocation(line: 33, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !97, file: !1, line: 33, column: 2)
!116 = !DILocation(line: 33, column: 7, scope: !115)
!117 = !DILocation(line: 33, column: 14, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !1, line: 33, column: 2)
!119 = !DILocation(line: 33, column: 18, scope: !118)
!120 = !DILocation(line: 33, column: 16, scope: !118)
!121 = !DILocation(line: 33, column: 2, scope: !115)
!122 = !DILocation(line: 33, column: 42, scope: !118)
!123 = !DILocation(line: 33, column: 47, scope: !118)
!124 = !DILocation(line: 33, column: 28, scope: !118)
!125 = !DILocation(line: 33, column: 24, scope: !118)
!126 = !DILocation(line: 33, column: 2, scope: !118)
!127 = distinct !{!127, !121, !128}
!128 = !DILocation(line: 33, column: 49, scope: !115)
!129 = !DILocation(line: 34, column: 2, scope: !97)
!130 = !DILocation(line: 36, column: 7, scope: !97)
!131 = !DILocation(line: 36, column: 2, scope: !97)
!132 = !DILocation(line: 37, column: 2, scope: !97)
!133 = !DILocation(line: 38, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !97, file: !1, line: 38, column: 2)
!135 = !DILocation(line: 38, column: 7, scope: !134)
!136 = !DILocation(line: 38, column: 14, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !1, line: 38, column: 2)
!138 = !DILocation(line: 38, column: 18, scope: !137)
!139 = !DILocation(line: 38, column: 16, scope: !137)
!140 = !DILocation(line: 38, column: 2, scope: !134)
!141 = !DILocation(line: 38, column: 45, scope: !137)
!142 = !DILocation(line: 38, column: 42, scope: !137)
!143 = !DILocation(line: 38, column: 28, scope: !137)
!144 = !DILocation(line: 38, column: 24, scope: !137)
!145 = !DILocation(line: 38, column: 2, scope: !137)
!146 = distinct !{!146, !140, !147}
!147 = !DILocation(line: 38, column: 47, scope: !134)
!148 = !DILocation(line: 40, column: 2, scope: !97)
!149 = !DILocation(line: 42, column: 2, scope: !97)
