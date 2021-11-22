; ModuleID = 'binary-search.c'
source_filename = "binary-search.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.a = private unnamed_addr constant [10 x i32] [i32 -31, i32 0, i32 1, i32 2, i32 2, i32 4, i32 65, i32 83, i32 99, i32 782], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d is at index %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bsearch(i32* %a, i32 %n, i32 %x) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 0, i32* %i, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %j, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32, i32* %n.addr, align 4, !dbg !22
  %sub = sub nsw i32 %0, 1, !dbg !23
  store i32 %sub, i32* %j, align 4, !dbg !21
  br label %while.cond, !dbg !24

while.cond:                                       ; preds = %if.end10, %entry
  %1 = load i32, i32* %i, align 4, !dbg !25
  %2 = load i32, i32* %j, align 4, !dbg !26
  %cmp = icmp sle i32 %1, %2, !dbg !27
  br i1 %cmp, label %while.body, label %while.end, !dbg !24

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i32* %k, metadata !28, metadata !DIExpression()), !dbg !30
  %3 = load i32, i32* %i, align 4, !dbg !31
  %4 = load i32, i32* %j, align 4, !dbg !32
  %5 = load i32, i32* %i, align 4, !dbg !33
  %sub1 = sub nsw i32 %4, %5, !dbg !34
  %div = sdiv i32 %sub1, 2, !dbg !35
  %add = add nsw i32 %3, %div, !dbg !36
  store i32 %add, i32* %k, align 4, !dbg !30
  %6 = load i32*, i32** %a.addr, align 8, !dbg !37
  %7 = load i32, i32* %k, align 4, !dbg !39
  %idxprom = sext i32 %7 to i64, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !37
  %8 = load i32, i32* %arrayidx, align 4, !dbg !37
  %9 = load i32, i32* %x.addr, align 4, !dbg !40
  %cmp2 = icmp eq i32 %8, %9, !dbg !41
  br i1 %cmp2, label %if.then, label %if.else, !dbg !42, !cf.info !43

if.then:                                          ; preds = %while.body
  %10 = load i32, i32* %k, align 4, !dbg !44
  store i32 %10, i32* %retval, align 4, !dbg !46
  br label %return, !dbg !46

if.else:                                          ; preds = %while.body
  %11 = load i32*, i32** %a.addr, align 8, !dbg !47
  %12 = load i32, i32* %k, align 4, !dbg !49
  %idxprom3 = sext i32 %12 to i64, !dbg !47
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 %idxprom3, !dbg !47
  %13 = load i32, i32* %arrayidx4, align 4, !dbg !47
  %14 = load i32, i32* %x.addr, align 4, !dbg !50
  %cmp5 = icmp slt i32 %13, %14, !dbg !51
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !52, !cf.info !43

if.then6:                                         ; preds = %if.else
  %15 = load i32, i32* %k, align 4, !dbg !53
  %add7 = add nsw i32 %15, 1, !dbg !55
  store i32 %add7, i32* %i, align 4, !dbg !56
  br label %if.end, !dbg !57

if.else8:                                         ; preds = %if.else
  %16 = load i32, i32* %k, align 4, !dbg !58
  %sub9 = sub nsw i32 %16, 1, !dbg !60
  store i32 %sub9, i32* %j, align 4, !dbg !61
  br label %if.end

if.end:                                           ; preds = %if.else8, %if.then6
  br label %if.end10

if.end10:                                         ; preds = %if.end
  br label %while.cond, !dbg !24, !llvm.loop !62

while.end:                                        ; preds = %while.cond
  store i32 -1, i32* %retval, align 4, !dbg !64
  br label %return, !dbg !64

return:                                           ; preds = %while.end, %if.then
  %17 = load i32, i32* %retval, align 4, !dbg !65
  ret i32 %17, !dbg !65
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bsearch_r(i32* %a, i32 %x, i32 %i, i32 %j) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %x.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 %j, i32* %j.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %j.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load i32, i32* %j.addr, align 4, !dbg !77
  %1 = load i32, i32* %i.addr, align 4, !dbg !79
  %cmp = icmp slt i32 %0, %1, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81, !cf.info !43

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !82
  br label %return, !dbg !82

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %k, metadata !84, metadata !DIExpression()), !dbg !85
  %2 = load i32, i32* %i.addr, align 4, !dbg !86
  %3 = load i32, i32* %j.addr, align 4, !dbg !87
  %4 = load i32, i32* %i.addr, align 4, !dbg !88
  %sub = sub nsw i32 %3, %4, !dbg !89
  %div = sdiv i32 %sub, 2, !dbg !90
  %add = add nsw i32 %2, %div, !dbg !91
  store i32 %add, i32* %k, align 4, !dbg !85
  %5 = load i32*, i32** %a.addr, align 8, !dbg !92
  %6 = load i32, i32* %k, align 4, !dbg !94
  %idxprom = sext i32 %6 to i64, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !92
  %7 = load i32, i32* %arrayidx, align 4, !dbg !92
  %8 = load i32, i32* %x.addr, align 4, !dbg !95
  %cmp1 = icmp eq i32 %7, %8, !dbg !96
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !97, !cf.info !43

if.then2:                                         ; preds = %if.end
  %9 = load i32, i32* %k, align 4, !dbg !98
  store i32 %9, i32* %retval, align 4, !dbg !100
  br label %return, !dbg !100

if.else:                                          ; preds = %if.end
  %10 = load i32*, i32** %a.addr, align 8, !dbg !101
  %11 = load i32, i32* %k, align 4, !dbg !103
  %idxprom3 = sext i32 %11 to i64, !dbg !101
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %idxprom3, !dbg !101
  %12 = load i32, i32* %arrayidx4, align 4, !dbg !101
  %13 = load i32, i32* %x.addr, align 4, !dbg !104
  %cmp5 = icmp slt i32 %12, %13, !dbg !105
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !106, !cf.info !43

if.then6:                                         ; preds = %if.else
  %14 = load i32*, i32** %a.addr, align 8, !dbg !107
  %15 = load i32, i32* %x.addr, align 4, !dbg !109
  %16 = load i32, i32* %k, align 4, !dbg !110
  %add7 = add nsw i32 %16, 1, !dbg !111
  %17 = load i32, i32* %j.addr, align 4, !dbg !112
  %call = call i32 @bsearch_r(i32* %14, i32 %15, i32 %add7, i32 %17), !dbg !113
  store i32 %call, i32* %retval, align 4, !dbg !114
  br label %return, !dbg !114

if.else8:                                         ; preds = %if.else
  %18 = load i32*, i32** %a.addr, align 8, !dbg !115
  %19 = load i32, i32* %x.addr, align 4, !dbg !117
  %20 = load i32, i32* %i.addr, align 4, !dbg !118
  %21 = load i32, i32* %k, align 4, !dbg !119
  %sub9 = sub nsw i32 %21, 1, !dbg !120
  %call10 = call i32 @bsearch_r(i32* %18, i32 %19, i32 %20, i32 %sub9), !dbg !121
  store i32 %call10, i32* %retval, align 4, !dbg !122
  br label %return, !dbg !122

return:                                           ; preds = %if.else8, %if.then6, %if.then2, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !123
  ret i32 %22, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !124 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [10 x i32], align 16
  %n = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %a, metadata !127, metadata !DIExpression()), !dbg !131
  %0 = bitcast [10 x i32]* %a to i8*, !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x i32]* @__const.main.a to i8*), i64 40, i1 false), !dbg !131
  call void @llvm.dbg.declare(metadata i32* %n, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 10, i32* %n, align 4, !dbg !133
  call void @llvm.dbg.declare(metadata i32* %x, metadata !134, metadata !DIExpression()), !dbg !135
  store i32 2, i32* %x, align 4, !dbg !135
  call void @llvm.dbg.declare(metadata i32* %i, metadata !136, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 0, !dbg !138
  %1 = load i32, i32* %n, align 4, !dbg !139
  %2 = load i32, i32* %x, align 4, !dbg !140
  %call = call i32 @bsearch(i32* %arraydecay, i32 %1, i32 %2), !dbg !141
  store i32 %call, i32* %i, align 4, !dbg !137
  %3 = load i32, i32* %x, align 4, !dbg !142
  %4 = load i32, i32* %i, align 4, !dbg !143
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i32 %3, i32 %4), !dbg !144
  store i32 5, i32* %x, align 4, !dbg !145
  %arraydecay2 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 0, !dbg !146
  %5 = load i32, i32* %x, align 4, !dbg !147
  %6 = load i32, i32* %n, align 4, !dbg !148
  %sub = sub nsw i32 %6, 1, !dbg !149
  %call3 = call i32 @bsearch_r(i32* %arraydecay2, i32 %5, i32 0, i32 %sub), !dbg !150
  store i32 %call3, i32* %i, align 4, !dbg !151
  %7 = load i32, i32* %x, align 4, !dbg !152
  %8 = load i32, i32* %i, align 4, !dbg !153
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i32 %7, i32 %8), !dbg !154
  ret i32 0, !dbg !155
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "binary-search.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Binary-search")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "bsearch", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 3, type: !11)
!13 = !DILocation(line: 3, column: 19, scope: !7)
!14 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!15 = !DILocation(line: 3, column: 26, scope: !7)
!16 = !DILocalVariable(name: "x", arg: 3, scope: !7, file: !1, line: 3, type: !10)
!17 = !DILocation(line: 3, column: 33, scope: !7)
!18 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 4, type: !10)
!19 = !DILocation(line: 4, column: 9, scope: !7)
!20 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 4, type: !10)
!21 = !DILocation(line: 4, column: 16, scope: !7)
!22 = !DILocation(line: 4, column: 20, scope: !7)
!23 = !DILocation(line: 4, column: 22, scope: !7)
!24 = !DILocation(line: 5, column: 5, scope: !7)
!25 = !DILocation(line: 5, column: 12, scope: !7)
!26 = !DILocation(line: 5, column: 17, scope: !7)
!27 = !DILocation(line: 5, column: 14, scope: !7)
!28 = !DILocalVariable(name: "k", scope: !29, file: !1, line: 6, type: !10)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 20)
!30 = !DILocation(line: 6, column: 13, scope: !29)
!31 = !DILocation(line: 6, column: 17, scope: !29)
!32 = !DILocation(line: 6, column: 23, scope: !29)
!33 = !DILocation(line: 6, column: 27, scope: !29)
!34 = !DILocation(line: 6, column: 25, scope: !29)
!35 = !DILocation(line: 6, column: 30, scope: !29)
!36 = !DILocation(line: 6, column: 19, scope: !29)
!37 = !DILocation(line: 7, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !1, line: 7, column: 13)
!39 = !DILocation(line: 7, column: 15, scope: !38)
!40 = !DILocation(line: 7, column: 21, scope: !38)
!41 = !DILocation(line: 7, column: 18, scope: !38)
!42 = !DILocation(line: 7, column: 13, scope: !29)
!43 = !{!"if"}
!44 = !DILocation(line: 8, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !1, line: 7, column: 24)
!46 = !DILocation(line: 8, column: 13, scope: !45)
!47 = !DILocation(line: 10, column: 18, scope: !48)
!48 = distinct !DILexicalBlock(scope: !38, file: !1, line: 10, column: 18)
!49 = !DILocation(line: 10, column: 20, scope: !48)
!50 = !DILocation(line: 10, column: 25, scope: !48)
!51 = !DILocation(line: 10, column: 23, scope: !48)
!52 = !DILocation(line: 10, column: 18, scope: !38)
!53 = !DILocation(line: 11, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !1, line: 10, column: 28)
!55 = !DILocation(line: 11, column: 19, scope: !54)
!56 = !DILocation(line: 11, column: 15, scope: !54)
!57 = !DILocation(line: 12, column: 9, scope: !54)
!58 = !DILocation(line: 14, column: 17, scope: !59)
!59 = distinct !DILexicalBlock(scope: !48, file: !1, line: 13, column: 14)
!60 = !DILocation(line: 14, column: 19, scope: !59)
!61 = !DILocation(line: 14, column: 15, scope: !59)
!62 = distinct !{!62, !24, !63}
!63 = !DILocation(line: 16, column: 5, scope: !7)
!64 = !DILocation(line: 17, column: 5, scope: !7)
!65 = !DILocation(line: 18, column: 1, scope: !7)
!66 = distinct !DISubprogram(name: "bsearch_r", scope: !1, file: !1, line: 20, type: !67, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!10, !11, !10, !10, !10}
!69 = !DILocalVariable(name: "a", arg: 1, scope: !66, file: !1, line: 20, type: !11)
!70 = !DILocation(line: 20, column: 21, scope: !66)
!71 = !DILocalVariable(name: "x", arg: 2, scope: !66, file: !1, line: 20, type: !10)
!72 = !DILocation(line: 20, column: 28, scope: !66)
!73 = !DILocalVariable(name: "i", arg: 3, scope: !66, file: !1, line: 20, type: !10)
!74 = !DILocation(line: 20, column: 35, scope: !66)
!75 = !DILocalVariable(name: "j", arg: 4, scope: !66, file: !1, line: 20, type: !10)
!76 = !DILocation(line: 20, column: 42, scope: !66)
!77 = !DILocation(line: 21, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !66, file: !1, line: 21, column: 9)
!79 = !DILocation(line: 21, column: 13, scope: !78)
!80 = !DILocation(line: 21, column: 11, scope: !78)
!81 = !DILocation(line: 21, column: 9, scope: !66)
!82 = !DILocation(line: 22, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !1, line: 21, column: 16)
!84 = !DILocalVariable(name: "k", scope: !66, file: !1, line: 24, type: !10)
!85 = !DILocation(line: 24, column: 9, scope: !66)
!86 = !DILocation(line: 24, column: 13, scope: !66)
!87 = !DILocation(line: 24, column: 19, scope: !66)
!88 = !DILocation(line: 24, column: 23, scope: !66)
!89 = !DILocation(line: 24, column: 21, scope: !66)
!90 = !DILocation(line: 24, column: 26, scope: !66)
!91 = !DILocation(line: 24, column: 15, scope: !66)
!92 = !DILocation(line: 25, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !66, file: !1, line: 25, column: 9)
!94 = !DILocation(line: 25, column: 11, scope: !93)
!95 = !DILocation(line: 25, column: 17, scope: !93)
!96 = !DILocation(line: 25, column: 14, scope: !93)
!97 = !DILocation(line: 25, column: 9, scope: !66)
!98 = !DILocation(line: 26, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !1, line: 25, column: 20)
!100 = !DILocation(line: 26, column: 9, scope: !99)
!101 = !DILocation(line: 28, column: 14, scope: !102)
!102 = distinct !DILexicalBlock(scope: !93, file: !1, line: 28, column: 14)
!103 = !DILocation(line: 28, column: 16, scope: !102)
!104 = !DILocation(line: 28, column: 21, scope: !102)
!105 = !DILocation(line: 28, column: 19, scope: !102)
!106 = !DILocation(line: 28, column: 14, scope: !93)
!107 = !DILocation(line: 29, column: 26, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !1, line: 28, column: 24)
!109 = !DILocation(line: 29, column: 29, scope: !108)
!110 = !DILocation(line: 29, column: 32, scope: !108)
!111 = !DILocation(line: 29, column: 34, scope: !108)
!112 = !DILocation(line: 29, column: 39, scope: !108)
!113 = !DILocation(line: 29, column: 16, scope: !108)
!114 = !DILocation(line: 29, column: 9, scope: !108)
!115 = !DILocation(line: 32, column: 26, scope: !116)
!116 = distinct !DILexicalBlock(scope: !102, file: !1, line: 31, column: 10)
!117 = !DILocation(line: 32, column: 29, scope: !116)
!118 = !DILocation(line: 32, column: 32, scope: !116)
!119 = !DILocation(line: 32, column: 35, scope: !116)
!120 = !DILocation(line: 32, column: 37, scope: !116)
!121 = !DILocation(line: 32, column: 16, scope: !116)
!122 = !DILocation(line: 32, column: 9, scope: !116)
!123 = !DILocation(line: 34, column: 1, scope: !66)
!124 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 36, type: !125, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DISubroutineType(types: !126)
!126 = !{!10}
!127 = !DILocalVariable(name: "a", scope: !124, file: !1, line: 37, type: !128)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !129)
!129 = !{!130}
!130 = !DISubrange(count: 10)
!131 = !DILocation(line: 37, column: 9, scope: !124)
!132 = !DILocalVariable(name: "n", scope: !124, file: !1, line: 38, type: !10)
!133 = !DILocation(line: 38, column: 9, scope: !124)
!134 = !DILocalVariable(name: "x", scope: !124, file: !1, line: 39, type: !10)
!135 = !DILocation(line: 39, column: 9, scope: !124)
!136 = !DILocalVariable(name: "i", scope: !124, file: !1, line: 40, type: !10)
!137 = !DILocation(line: 40, column: 9, scope: !124)
!138 = !DILocation(line: 40, column: 21, scope: !124)
!139 = !DILocation(line: 40, column: 24, scope: !124)
!140 = !DILocation(line: 40, column: 27, scope: !124)
!141 = !DILocation(line: 40, column: 13, scope: !124)
!142 = !DILocation(line: 41, column: 35, scope: !124)
!143 = !DILocation(line: 41, column: 38, scope: !124)
!144 = !DILocation(line: 41, column: 5, scope: !124)
!145 = !DILocation(line: 42, column: 7, scope: !124)
!146 = !DILocation(line: 43, column: 19, scope: !124)
!147 = !DILocation(line: 43, column: 22, scope: !124)
!148 = !DILocation(line: 43, column: 28, scope: !124)
!149 = !DILocation(line: 43, column: 30, scope: !124)
!150 = !DILocation(line: 43, column: 9, scope: !124)
!151 = !DILocation(line: 43, column: 7, scope: !124)
!152 = !DILocation(line: 44, column: 35, scope: !124)
!153 = !DILocation(line: 44, column: 38, scope: !124)
!154 = !DILocation(line: 44, column: 5, scope: !124)
!155 = !DILocation(line: 45, column: 5, scope: !124)
