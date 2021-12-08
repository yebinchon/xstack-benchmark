; ModuleID = 'binary-search.bc'
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
  br i1 %cmp2, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %while.body
  %10 = load i32, i32* %k, align 4, !dbg !43
  store i32 %10, i32* %retval, align 4, !dbg !45
  br label %return, !dbg !45

if.else:                                          ; preds = %while.body
  %11 = load i32*, i32** %a.addr, align 8, !dbg !46
  %12 = load i32, i32* %k, align 4, !dbg !48
  %idxprom3 = sext i32 %12 to i64, !dbg !46
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 %idxprom3, !dbg !46
  %13 = load i32, i32* %arrayidx4, align 4, !dbg !46
  %14 = load i32, i32* %x.addr, align 4, !dbg !49
  %cmp5 = icmp slt i32 %13, %14, !dbg !50
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !51

if.then6:                                         ; preds = %if.else
  %15 = load i32, i32* %k, align 4, !dbg !52
  %add7 = add nsw i32 %15, 1, !dbg !54
  store i32 %add7, i32* %i, align 4, !dbg !55
  br label %if.end, !dbg !56

if.else8:                                         ; preds = %if.else
  %16 = load i32, i32* %k, align 4, !dbg !57
  %sub9 = sub nsw i32 %16, 1, !dbg !59
  store i32 %sub9, i32* %j, align 4, !dbg !60
  br label %if.end

if.end:                                           ; preds = %if.else8, %if.then6
  br label %if.end10

if.end10:                                         ; preds = %if.end
  br label %while.cond, !dbg !24, !llvm.loop !61

while.end:                                        ; preds = %while.cond
  store i32 -1, i32* %retval, align 4, !dbg !63
  br label %return, !dbg !63

return:                                           ; preds = %while.end, %if.then
  %17 = load i32, i32* %retval, align 4, !dbg !64
  ret i32 %17, !dbg !64
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bsearch_r(i32* %a, i32 %x, i32 %i, i32 %j) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %x.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 %j, i32* %j.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %j.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = load i32, i32* %j.addr, align 4, !dbg !76
  %1 = load i32, i32* %i.addr, align 4, !dbg !78
  %cmp = icmp slt i32 %0, %1, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !81
  br label %return, !dbg !81

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %k, metadata !83, metadata !DIExpression()), !dbg !84
  %2 = load i32, i32* %i.addr, align 4, !dbg !85
  %3 = load i32, i32* %j.addr, align 4, !dbg !86
  %4 = load i32, i32* %i.addr, align 4, !dbg !87
  %sub = sub nsw i32 %3, %4, !dbg !88
  %div = sdiv i32 %sub, 2, !dbg !89
  %add = add nsw i32 %2, %div, !dbg !90
  store i32 %add, i32* %k, align 4, !dbg !84
  %5 = load i32*, i32** %a.addr, align 8, !dbg !91
  %6 = load i32, i32* %k, align 4, !dbg !93
  %idxprom = sext i32 %6 to i64, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !91
  %7 = load i32, i32* %arrayidx, align 4, !dbg !91
  %8 = load i32, i32* %x.addr, align 4, !dbg !94
  %cmp1 = icmp eq i32 %7, %8, !dbg !95
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !96

if.then2:                                         ; preds = %if.end
  %9 = load i32, i32* %k, align 4, !dbg !97
  store i32 %9, i32* %retval, align 4, !dbg !99
  br label %return, !dbg !99

if.else:                                          ; preds = %if.end
  %10 = load i32*, i32** %a.addr, align 8, !dbg !100
  %11 = load i32, i32* %k, align 4, !dbg !102
  %idxprom3 = sext i32 %11 to i64, !dbg !100
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %idxprom3, !dbg !100
  %12 = load i32, i32* %arrayidx4, align 4, !dbg !100
  %13 = load i32, i32* %x.addr, align 4, !dbg !103
  %cmp5 = icmp slt i32 %12, %13, !dbg !104
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !105

if.then6:                                         ; preds = %if.else
  %14 = load i32*, i32** %a.addr, align 8, !dbg !106
  %15 = load i32, i32* %x.addr, align 4, !dbg !108
  %16 = load i32, i32* %k, align 4, !dbg !109
  %add7 = add nsw i32 %16, 1, !dbg !110
  %17 = load i32, i32* %j.addr, align 4, !dbg !111
  %call = call i32 @bsearch_r(i32* %14, i32 %15, i32 %add7, i32 %17), !dbg !112
  store i32 %call, i32* %retval, align 4, !dbg !113
  br label %return, !dbg !113

if.else8:                                         ; preds = %if.else
  %18 = load i32*, i32** %a.addr, align 8, !dbg !114
  %19 = load i32, i32* %x.addr, align 4, !dbg !116
  %20 = load i32, i32* %i.addr, align 4, !dbg !117
  %21 = load i32, i32* %k, align 4, !dbg !118
  %sub9 = sub nsw i32 %21, 1, !dbg !119
  %call10 = call i32 @bsearch_r(i32* %18, i32 %19, i32 %20, i32 %sub9), !dbg !120
  store i32 %call10, i32* %retval, align 4, !dbg !121
  br label %return, !dbg !121

return:                                           ; preds = %if.else8, %if.then6, %if.then2, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !122
  ret i32 %22, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !123 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [10 x i32], align 16
  %n = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %a, metadata !126, metadata !DIExpression()), !dbg !130
  %0 = bitcast [10 x i32]* %a to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x i32]* @__const.main.a to i8*), i64 40, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i32* %n, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 10, i32* %n, align 4, !dbg !132
  call void @llvm.dbg.declare(metadata i32* %x, metadata !133, metadata !DIExpression()), !dbg !134
  store i32 2, i32* %x, align 4, !dbg !134
  call void @llvm.dbg.declare(metadata i32* %i, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 0, !dbg !137
  %1 = load i32, i32* %n, align 4, !dbg !138
  %2 = load i32, i32* %x, align 4, !dbg !139
  %call = call i32 @bsearch(i32* %arraydecay, i32 %1, i32 %2), !dbg !140
  store i32 %call, i32* %i, align 4, !dbg !136
  %3 = load i32, i32* %x, align 4, !dbg !141
  %4 = load i32, i32* %i, align 4, !dbg !142
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i32 %3, i32 %4), !dbg !143
  store i32 5, i32* %x, align 4, !dbg !144
  %arraydecay2 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 0, !dbg !145
  %5 = load i32, i32* %x, align 4, !dbg !146
  %6 = load i32, i32* %n, align 4, !dbg !147
  %sub = sub nsw i32 %6, 1, !dbg !148
  %call3 = call i32 @bsearch_r(i32* %arraydecay2, i32 %5, i32 0, i32 %sub), !dbg !149
  store i32 %call3, i32* %i, align 4, !dbg !150
  %7 = load i32, i32* %x, align 4, !dbg !151
  %8 = load i32, i32* %i, align 4, !dbg !152
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i32 %7, i32 %8), !dbg !153
  ret i32 0, !dbg !154
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "binary-search.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Binary-search")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!43 = !DILocation(line: 8, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 7, column: 24)
!45 = !DILocation(line: 8, column: 13, scope: !44)
!46 = !DILocation(line: 10, column: 18, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !1, line: 10, column: 18)
!48 = !DILocation(line: 10, column: 20, scope: !47)
!49 = !DILocation(line: 10, column: 25, scope: !47)
!50 = !DILocation(line: 10, column: 23, scope: !47)
!51 = !DILocation(line: 10, column: 18, scope: !38)
!52 = !DILocation(line: 11, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !1, line: 10, column: 28)
!54 = !DILocation(line: 11, column: 19, scope: !53)
!55 = !DILocation(line: 11, column: 15, scope: !53)
!56 = !DILocation(line: 12, column: 9, scope: !53)
!57 = !DILocation(line: 14, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !47, file: !1, line: 13, column: 14)
!59 = !DILocation(line: 14, column: 19, scope: !58)
!60 = !DILocation(line: 14, column: 15, scope: !58)
!61 = distinct !{!61, !24, !62}
!62 = !DILocation(line: 16, column: 5, scope: !7)
!63 = !DILocation(line: 17, column: 5, scope: !7)
!64 = !DILocation(line: 18, column: 1, scope: !7)
!65 = distinct !DISubprogram(name: "bsearch_r", scope: !1, file: !1, line: 20, type: !66, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!10, !11, !10, !10, !10}
!68 = !DILocalVariable(name: "a", arg: 1, scope: !65, file: !1, line: 20, type: !11)
!69 = !DILocation(line: 20, column: 21, scope: !65)
!70 = !DILocalVariable(name: "x", arg: 2, scope: !65, file: !1, line: 20, type: !10)
!71 = !DILocation(line: 20, column: 28, scope: !65)
!72 = !DILocalVariable(name: "i", arg: 3, scope: !65, file: !1, line: 20, type: !10)
!73 = !DILocation(line: 20, column: 35, scope: !65)
!74 = !DILocalVariable(name: "j", arg: 4, scope: !65, file: !1, line: 20, type: !10)
!75 = !DILocation(line: 20, column: 42, scope: !65)
!76 = !DILocation(line: 21, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !65, file: !1, line: 21, column: 9)
!78 = !DILocation(line: 21, column: 13, scope: !77)
!79 = !DILocation(line: 21, column: 11, scope: !77)
!80 = !DILocation(line: 21, column: 9, scope: !65)
!81 = !DILocation(line: 22, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !1, line: 21, column: 16)
!83 = !DILocalVariable(name: "k", scope: !65, file: !1, line: 24, type: !10)
!84 = !DILocation(line: 24, column: 9, scope: !65)
!85 = !DILocation(line: 24, column: 13, scope: !65)
!86 = !DILocation(line: 24, column: 19, scope: !65)
!87 = !DILocation(line: 24, column: 23, scope: !65)
!88 = !DILocation(line: 24, column: 21, scope: !65)
!89 = !DILocation(line: 24, column: 26, scope: !65)
!90 = !DILocation(line: 24, column: 15, scope: !65)
!91 = !DILocation(line: 25, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !65, file: !1, line: 25, column: 9)
!93 = !DILocation(line: 25, column: 11, scope: !92)
!94 = !DILocation(line: 25, column: 17, scope: !92)
!95 = !DILocation(line: 25, column: 14, scope: !92)
!96 = !DILocation(line: 25, column: 9, scope: !65)
!97 = !DILocation(line: 26, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !1, line: 25, column: 20)
!99 = !DILocation(line: 26, column: 9, scope: !98)
!100 = !DILocation(line: 28, column: 14, scope: !101)
!101 = distinct !DILexicalBlock(scope: !92, file: !1, line: 28, column: 14)
!102 = !DILocation(line: 28, column: 16, scope: !101)
!103 = !DILocation(line: 28, column: 21, scope: !101)
!104 = !DILocation(line: 28, column: 19, scope: !101)
!105 = !DILocation(line: 28, column: 14, scope: !92)
!106 = !DILocation(line: 29, column: 26, scope: !107)
!107 = distinct !DILexicalBlock(scope: !101, file: !1, line: 28, column: 24)
!108 = !DILocation(line: 29, column: 29, scope: !107)
!109 = !DILocation(line: 29, column: 32, scope: !107)
!110 = !DILocation(line: 29, column: 34, scope: !107)
!111 = !DILocation(line: 29, column: 39, scope: !107)
!112 = !DILocation(line: 29, column: 16, scope: !107)
!113 = !DILocation(line: 29, column: 9, scope: !107)
!114 = !DILocation(line: 32, column: 26, scope: !115)
!115 = distinct !DILexicalBlock(scope: !101, file: !1, line: 31, column: 10)
!116 = !DILocation(line: 32, column: 29, scope: !115)
!117 = !DILocation(line: 32, column: 32, scope: !115)
!118 = !DILocation(line: 32, column: 35, scope: !115)
!119 = !DILocation(line: 32, column: 37, scope: !115)
!120 = !DILocation(line: 32, column: 16, scope: !115)
!121 = !DILocation(line: 32, column: 9, scope: !115)
!122 = !DILocation(line: 34, column: 1, scope: !65)
!123 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 36, type: !124, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DISubroutineType(types: !125)
!125 = !{!10}
!126 = !DILocalVariable(name: "a", scope: !123, file: !1, line: 37, type: !127)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 10)
!130 = !DILocation(line: 37, column: 9, scope: !123)
!131 = !DILocalVariable(name: "n", scope: !123, file: !1, line: 38, type: !10)
!132 = !DILocation(line: 38, column: 9, scope: !123)
!133 = !DILocalVariable(name: "x", scope: !123, file: !1, line: 39, type: !10)
!134 = !DILocation(line: 39, column: 9, scope: !123)
!135 = !DILocalVariable(name: "i", scope: !123, file: !1, line: 40, type: !10)
!136 = !DILocation(line: 40, column: 9, scope: !123)
!137 = !DILocation(line: 40, column: 21, scope: !123)
!138 = !DILocation(line: 40, column: 24, scope: !123)
!139 = !DILocation(line: 40, column: 27, scope: !123)
!140 = !DILocation(line: 40, column: 13, scope: !123)
!141 = !DILocation(line: 41, column: 35, scope: !123)
!142 = !DILocation(line: 41, column: 38, scope: !123)
!143 = !DILocation(line: 41, column: 5, scope: !123)
!144 = !DILocation(line: 42, column: 7, scope: !123)
!145 = !DILocation(line: 43, column: 19, scope: !123)
!146 = !DILocation(line: 43, column: 22, scope: !123)
!147 = !DILocation(line: 43, column: 28, scope: !123)
!148 = !DILocation(line: 43, column: 30, scope: !123)
!149 = !DILocation(line: 43, column: 9, scope: !123)
!150 = !DILocation(line: 43, column: 7, scope: !123)
!151 = !DILocation(line: 44, column: 35, scope: !123)
!152 = !DILocation(line: 44, column: 38, scope: !123)
!153 = !DILocation(line: 44, column: 5, scope: !123)
!154 = !DILocation(line: 45, column: 5, scope: !123)
