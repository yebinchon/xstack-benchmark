; ModuleID = 'carmichael-3-strong-pseudoprimes.ll'
source_filename = "carmichael-3-strong-pseudoprimes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_prime(i32 %n) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !12, metadata !DIExpression()), !dbg !13
  %cmp = icmp ule i32 %n, 3, !dbg !14
  br i1 %cmp, label %if.then, label %if.else, !dbg !16

if.then:                                          ; preds = %entry
  %cmp1 = icmp ugt i32 %n, 1, !dbg !17
  %conv = zext i1 %cmp1 to i32, !dbg !17
  br label %return, !dbg !19

if.else:                                          ; preds = %entry
  %rem = urem i32 %n, 2, !dbg !20
  %tobool = icmp ne i32 %rem, 0, !dbg !20
  br i1 %tobool, label %lor.lhs.false, label %if.then4, !dbg !22

lor.lhs.false:                                    ; preds = %if.else
  %rem2 = urem i32 %n, 3, !dbg !23
  %tobool3 = icmp ne i32 %rem2, 0, !dbg !23
  br i1 %tobool3, label %if.else5, label %if.then4, !dbg !24

if.then4:                                         ; preds = %lor.lhs.false, %if.else
  br label %return, !dbg !25

if.else5:                                         ; preds = %lor.lhs.false
  call void @llvm.dbg.value(metadata i32 5, metadata !27, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %if.else5
  %i.0 = phi i32 [ 5, %if.else5 ], [ %add14, %for.inc ], !dbg !32
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !27, metadata !DIExpression()), !dbg !29
  %mul = mul i32 %i.0, %i.0, !dbg !33
  %cmp6 = icmp ule i32 %mul, %n, !dbg !35
  br i1 %cmp6, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %rem8 = urem i32 %n, %i.0, !dbg !37
  %tobool9 = icmp ne i32 %rem8, 0, !dbg !37
  br i1 %tobool9, label %lor.lhs.false10, label %if.then13, !dbg !39

lor.lhs.false10:                                  ; preds = %for.body
  %add = add i32 %i.0, 2, !dbg !40
  %rem11 = urem i32 %n, %add, !dbg !41
  %tobool12 = icmp ne i32 %rem11, 0, !dbg !41
  br i1 %tobool12, label %if.end, label %if.then13, !dbg !42

if.then13:                                        ; preds = %lor.lhs.false10, %for.body
  br label %return, !dbg !43

if.end:                                           ; preds = %lor.lhs.false10
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %if.end
  %add14 = add i32 %i.0, 6, !dbg !45
  call void @llvm.dbg.value(metadata i32 %add14, metadata !27, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !49

return:                                           ; preds = %for.end, %if.then13, %if.then4, %if.then
  %retval.0 = phi i32 [ %conv, %if.then ], [ 0, %if.then13 ], [ 1, %for.end ], [ 0, %if.then4 ], !dbg !50
  ret i32 %retval.0, !dbg !51
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @carmichael3(i32 %p1) #0 !dbg !52 {
entry:
  call void @llvm.dbg.value(metadata i32 %p1, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i32 @is_prime(i32 %p1), !dbg !57
  %tobool = icmp ne i32 %call, 0, !dbg !57
  br i1 %tobool, label %if.end, label %if.then, !dbg !59

if.then:                                          ; preds = %entry
  br label %for.end37, !dbg !60

if.end:                                           ; preds = %entry
  call void @llvm.dbg.value(metadata i32 1, metadata !61, metadata !DIExpression()), !dbg !56
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc35, %if.end
  %h3.0 = phi i32 [ 1, %if.end ], [ %inc36, %for.inc35 ], !dbg !64
  call void @llvm.dbg.value(metadata i32 %h3.0, metadata !61, metadata !DIExpression()), !dbg !56
  %cmp = icmp slt i32 %h3.0, %p1, !dbg !65
  br i1 %cmp, label %for.body, label %for.end37.loopexit, !dbg !67

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 1, metadata !68, metadata !DIExpression()), !dbg !56
  br label %for.cond1, !dbg !69

for.cond1:                                        ; preds = %for.inc, %for.body
  %d.0 = phi i32 [ 1, %for.body ], [ %inc, %for.inc ], !dbg !72
  call void @llvm.dbg.value(metadata i32 %d.0, metadata !68, metadata !DIExpression()), !dbg !56
  %add = add nsw i32 %h3.0, %p1, !dbg !73
  %cmp2 = icmp slt i32 %d.0, %add, !dbg !75
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !76

for.body3:                                        ; preds = %for.cond1
  %add4 = add nsw i32 %h3.0, %p1, !dbg !77
  %sub = sub nsw i32 %p1, 1, !dbg !80
  %mul = mul nsw i32 %add4, %sub, !dbg !81
  %rem = srem i32 %mul, %d.0, !dbg !82
  %cmp5 = icmp eq i32 %rem, 0, !dbg !83
  br i1 %cmp5, label %land.lhs.true, label %if.end34, !dbg !84

land.lhs.true:                                    ; preds = %for.body3
  %sub6 = sub nsw i32 0, %p1, !dbg !85
  %mul7 = mul nsw i32 %sub6, %p1, !dbg !85
  %rem8 = srem i32 %mul7, %h3.0, !dbg !85
  %add9 = add nsw i32 %rem8, %h3.0, !dbg !85
  %rem10 = srem i32 %add9, %h3.0, !dbg !85
  %rem11 = srem i32 %d.0, %h3.0, !dbg !86
  %cmp12 = icmp eq i32 %rem10, %rem11, !dbg !87
  br i1 %cmp12, label %if.then13, label %if.end34, !dbg !88

if.then13:                                        ; preds = %land.lhs.true
  %sub14 = sub nsw i32 %p1, 1, !dbg !89
  %add15 = add nsw i32 %h3.0, %p1, !dbg !91
  %mul16 = mul nsw i32 %sub14, %add15, !dbg !92
  %div = sdiv i32 %mul16, %d.0, !dbg !93
  %add17 = add nsw i32 1, %div, !dbg !94
  call void @llvm.dbg.value(metadata i32 %add17, metadata !95, metadata !DIExpression()), !dbg !56
  %call18 = call i32 @is_prime(i32 %add17), !dbg !96
  %tobool19 = icmp ne i32 %call18, 0, !dbg !96
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !98

if.then20:                                        ; preds = %if.then13
  br label %for.inc, !dbg !99

if.end21:                                         ; preds = %if.then13
  %mul22 = mul nsw i32 %p1, %add17, !dbg !100
  %div23 = sdiv i32 %mul22, %h3.0, !dbg !101
  %add24 = add nsw i32 1, %div23, !dbg !102
  call void @llvm.dbg.value(metadata i32 %add24, metadata !103, metadata !DIExpression()), !dbg !56
  %call25 = call i32 @is_prime(i32 %add24), !dbg !104
  %tobool26 = icmp ne i32 %call25, 0, !dbg !104
  br i1 %tobool26, label %lor.lhs.false, label %if.then31, !dbg !106

lor.lhs.false:                                    ; preds = %if.end21
  %mul27 = mul nsw i32 %add17, %add24, !dbg !107
  %sub28 = sub nsw i32 %p1, 1, !dbg !108
  %rem29 = srem i32 %mul27, %sub28, !dbg !109
  %cmp30 = icmp ne i32 %rem29, 1, !dbg !110
  br i1 %cmp30, label %if.then31, label %if.end32, !dbg !111

if.then31:                                        ; preds = %lor.lhs.false, %if.end21
  br label %for.inc, !dbg !112

if.end32:                                         ; preds = %lor.lhs.false
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %p1, i32 %add17, i32 %add24), !dbg !113
  br label %if.end34, !dbg !114

if.end34:                                         ; preds = %if.end32, %land.lhs.true, %for.body3
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %if.end34, %if.then31, %if.then20
  %inc = add nsw i32 %d.0, 1, !dbg !116
  call void @llvm.dbg.value(metadata i32 %inc, metadata !68, metadata !DIExpression()), !dbg !56
  br label %for.cond1, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond1
  br label %for.inc35, !dbg !120

for.inc35:                                        ; preds = %for.end
  %inc36 = add nsw i32 %h3.0, 1, !dbg !121
  call void @llvm.dbg.value(metadata i32 %inc36, metadata !61, metadata !DIExpression()), !dbg !56
  br label %for.cond, !dbg !122, !llvm.loop !123

for.end37.loopexit:                               ; preds = %for.cond
  br label %for.end37, !dbg !125

for.end37:                                        ; preds = %for.end37.loopexit, %if.then
  ret void, !dbg !125
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !126 {
entry:
  call void @llvm.dbg.value(metadata i32 2, metadata !129, metadata !DIExpression()), !dbg !130
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %entry
  %p1.0 = phi i32 [ 2, %entry ], [ %inc, %for.inc ], !dbg !133
  call void @llvm.dbg.value(metadata i32 %p1.0, metadata !129, metadata !DIExpression()), !dbg !130
  %cmp = icmp slt i32 %p1.0, 62, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  call void @carmichael3(i32 %p1.0), !dbg !137
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %p1.0, 1, !dbg !138
  call void @llvm.dbg.value(metadata i32 %inc, metadata !129, metadata !DIExpression()), !dbg !130
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !142
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "carmichael-3-strong-pseudoprimes.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Carmichael-3-strong-pseudoprimes")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "is_prime", scope: !1, file: !1, line: 7, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 7, type: !11)
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocation(line: 9, column: 11, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 9)
!16 = !DILocation(line: 9, column: 9, scope: !7)
!17 = !DILocation(line: 10, column: 18, scope: !18)
!18 = distinct !DILexicalBlock(scope: !15, file: !1, line: 9, column: 17)
!19 = !DILocation(line: 10, column: 9, scope: !18)
!20 = !DILocation(line: 12, column: 18, scope: !21)
!21 = distinct !DILexicalBlock(scope: !15, file: !1, line: 12, column: 14)
!22 = !DILocation(line: 12, column: 23, scope: !21)
!23 = !DILocation(line: 12, column: 30, scope: !21)
!24 = !DILocation(line: 12, column: 14, scope: !15)
!25 = !DILocation(line: 13, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !21, file: !1, line: 12, column: 36)
!27 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 16, type: !11)
!28 = distinct !DILexicalBlock(scope: !21, file: !1, line: 15, column: 10)
!29 = !DILocation(line: 0, scope: !28)
!30 = !DILocation(line: 17, column: 14, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !1, line: 17, column: 9)
!32 = !DILocation(line: 0, scope: !31)
!33 = !DILocation(line: 17, column: 22, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !1, line: 17, column: 9)
!35 = !DILocation(line: 17, column: 25, scope: !34)
!36 = !DILocation(line: 17, column: 9, scope: !31)
!37 = !DILocation(line: 18, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !1, line: 18, column: 17)
!39 = !DILocation(line: 18, column: 26, scope: !38)
!40 = !DILocation(line: 18, column: 38, scope: !38)
!41 = !DILocation(line: 18, column: 33, scope: !38)
!42 = !DILocation(line: 18, column: 17, scope: !34)
!43 = !DILocation(line: 19, column: 17, scope: !38)
!44 = !DILocation(line: 18, column: 42, scope: !38)
!45 = !DILocation(line: 17, column: 33, scope: !34)
!46 = !DILocation(line: 17, column: 9, scope: !34)
!47 = distinct !{!47, !36, !48}
!48 = !DILocation(line: 19, column: 24, scope: !31)
!49 = !DILocation(line: 20, column: 9, scope: !28)
!50 = !DILocation(line: 0, scope: !15)
!51 = !DILocation(line: 22, column: 1, scope: !7)
!52 = distinct !DISubprogram(name: "carmichael3", scope: !1, file: !1, line: 24, type: !53, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{null, !10}
!55 = !DILocalVariable(name: "p1", arg: 1, scope: !52, file: !1, line: 24, type: !10)
!56 = !DILocation(line: 0, scope: !52)
!57 = !DILocation(line: 26, column: 10, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !1, line: 26, column: 9)
!59 = !DILocation(line: 26, column: 9, scope: !52)
!60 = !DILocation(line: 26, column: 24, scope: !58)
!61 = !DILocalVariable(name: "h3", scope: !52, file: !1, line: 28, type: !10)
!62 = !DILocation(line: 29, column: 10, scope: !63)
!63 = distinct !DILexicalBlock(scope: !52, file: !1, line: 29, column: 5)
!64 = !DILocation(line: 0, scope: !63)
!65 = !DILocation(line: 29, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !1, line: 29, column: 5)
!67 = !DILocation(line: 29, column: 5, scope: !63)
!68 = !DILocalVariable(name: "d", scope: !52, file: !1, line: 28, type: !10)
!69 = !DILocation(line: 30, column: 14, scope: !70)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 30, column: 9)
!71 = distinct !DILexicalBlock(scope: !66, file: !1, line: 29, column: 33)
!72 = !DILocation(line: 0, scope: !70)
!73 = !DILocation(line: 30, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !1, line: 30, column: 9)
!75 = !DILocation(line: 30, column: 23, scope: !74)
!76 = !DILocation(line: 30, column: 9, scope: !70)
!77 = !DILocation(line: 31, column: 21, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 31, column: 17)
!79 = distinct !DILexicalBlock(scope: !74, file: !1, line: 30, column: 39)
!80 = !DILocation(line: 31, column: 31, scope: !78)
!81 = !DILocation(line: 31, column: 26, scope: !78)
!82 = !DILocation(line: 31, column: 36, scope: !78)
!83 = !DILocation(line: 31, column: 40, scope: !78)
!84 = !DILocation(line: 31, column: 45, scope: !78)
!85 = !DILocation(line: 31, column: 48, scope: !78)
!86 = !DILocation(line: 31, column: 71, scope: !78)
!87 = !DILocation(line: 31, column: 66, scope: !78)
!88 = !DILocation(line: 31, column: 17, scope: !79)
!89 = !DILocation(line: 32, column: 31, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !1, line: 31, column: 77)
!91 = !DILocation(line: 32, column: 42, scope: !90)
!92 = !DILocation(line: 32, column: 36, scope: !90)
!93 = !DILocation(line: 32, column: 47, scope: !90)
!94 = !DILocation(line: 32, column: 24, scope: !90)
!95 = !DILocalVariable(name: "p2", scope: !52, file: !1, line: 28, type: !10)
!96 = !DILocation(line: 33, column: 22, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !1, line: 33, column: 21)
!98 = !DILocation(line: 33, column: 21, scope: !90)
!99 = !DILocation(line: 33, column: 36, scope: !97)
!100 = !DILocation(line: 34, column: 30, scope: !90)
!101 = !DILocation(line: 34, column: 35, scope: !90)
!102 = !DILocation(line: 34, column: 24, scope: !90)
!103 = !DILocalVariable(name: "p3", scope: !52, file: !1, line: 28, type: !10)
!104 = !DILocation(line: 35, column: 22, scope: !105)
!105 = distinct !DILexicalBlock(scope: !90, file: !1, line: 35, column: 21)
!106 = !DILocation(line: 35, column: 35, scope: !105)
!107 = !DILocation(line: 35, column: 42, scope: !105)
!108 = !DILocation(line: 35, column: 54, scope: !105)
!109 = !DILocation(line: 35, column: 48, scope: !105)
!110 = !DILocation(line: 35, column: 59, scope: !105)
!111 = !DILocation(line: 35, column: 21, scope: !90)
!112 = !DILocation(line: 35, column: 65, scope: !105)
!113 = !DILocation(line: 36, column: 17, scope: !90)
!114 = !DILocation(line: 37, column: 13, scope: !90)
!115 = !DILocation(line: 38, column: 9, scope: !79)
!116 = !DILocation(line: 30, column: 34, scope: !74)
!117 = !DILocation(line: 30, column: 9, scope: !74)
!118 = distinct !{!118, !76, !119}
!119 = !DILocation(line: 38, column: 9, scope: !70)
!120 = !DILocation(line: 39, column: 5, scope: !71)
!121 = !DILocation(line: 29, column: 27, scope: !66)
!122 = !DILocation(line: 29, column: 5, scope: !66)
!123 = distinct !{!123, !67, !124}
!124 = !DILocation(line: 39, column: 5, scope: !63)
!125 = !DILocation(line: 40, column: 1, scope: !52)
!126 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !127, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DISubroutineType(types: !128)
!128 = !{!10}
!129 = !DILocalVariable(name: "p1", scope: !126, file: !1, line: 44, type: !10)
!130 = !DILocation(line: 0, scope: !126)
!131 = !DILocation(line: 45, column: 10, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !1, line: 45, column: 5)
!133 = !DILocation(line: 0, scope: !132)
!134 = !DILocation(line: 45, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !1, line: 45, column: 5)
!136 = !DILocation(line: 45, column: 5, scope: !132)
!137 = !DILocation(line: 46, column: 9, scope: !135)
!138 = !DILocation(line: 45, column: 27, scope: !135)
!139 = !DILocation(line: 45, column: 5, scope: !135)
!140 = distinct !{!140, !136, !141}
!141 = !DILocation(line: 46, column: 23, scope: !132)
!142 = !DILocation(line: 47, column: 5, scope: !126)
