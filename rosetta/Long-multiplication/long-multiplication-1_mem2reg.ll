; ModuleID = 'long-multiplication-1.ll'
source_filename = "long-multiplication-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"-18446744073709551616\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @longmulti(i8* %a, i8* %b, i8* %c) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8* %b, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8* %c, metadata !17, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !18, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !20, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !21, metadata !DIExpression()), !dbg !15
  %call = call i32 @strcmp(i8* %a, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #5, !dbg !22
  %tobool = icmp ne i32 %call, 0, !dbg !22
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !24, !cf.info !25

lor.lhs.false:                                    ; preds = %entry
  %call1 = call i32 @strcmp(i8* %b, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #5, !dbg !26
  %tobool2 = icmp ne i32 %call1, 0, !dbg !26
  br i1 %tobool2, label %if.end, label %if.then, !dbg !27, !cf.info !25

if.then:                                          ; preds = %lor.lhs.false, %entry
  %arrayidx = getelementptr inbounds i8, i8* %c, i64 0, !dbg !28
  store i8 48, i8* %arrayidx, align 1, !dbg !30
  %arrayidx3 = getelementptr inbounds i8, i8* %c, i64 1, !dbg !31
  store i8 0, i8* %arrayidx3, align 1, !dbg !32
  br label %return, !dbg !33

if.end:                                           ; preds = %lor.lhs.false
  %arrayidx4 = getelementptr inbounds i8, i8* %a, i64 0, !dbg !34
  %0 = load i8, i8* %arrayidx4, align 1, !dbg !34
  %conv = sext i8 %0 to i32, !dbg !34
  %cmp = icmp eq i32 %conv, 45, !dbg !36
  br i1 %cmp, label %if.then6, label %if.end8, !dbg !37, !cf.info !25

if.then6:                                         ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 1, metadata !18, metadata !DIExpression()), !dbg !15
  %tobool7 = icmp ne i32 0, 0, !dbg !38
  %lnot = xor i1 %tobool7, true, !dbg !38
  %lnot.ext = zext i1 %lnot to i32, !dbg !38
  call void @llvm.dbg.value(metadata i32 %lnot.ext, metadata !21, metadata !DIExpression()), !dbg !15
  br label %if.end8, !dbg !40

if.end8:                                          ; preds = %if.then6, %if.end
  %i.0 = phi i32 [ 1, %if.then6 ], [ 0, %if.end ], !dbg !15
  %k.0 = phi i32 [ %lnot.ext, %if.then6 ], [ 0, %if.end ], !dbg !15
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !21, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !18, metadata !DIExpression()), !dbg !15
  %arrayidx9 = getelementptr inbounds i8, i8* %b, i64 0, !dbg !41
  %1 = load i8, i8* %arrayidx9, align 1, !dbg !41
  %conv10 = sext i8 %1 to i32, !dbg !41
  %cmp11 = icmp eq i32 %conv10, 45, !dbg !43
  br i1 %cmp11, label %if.then13, label %if.end17, !dbg !44, !cf.info !25

if.then13:                                        ; preds = %if.end8
  call void @llvm.dbg.value(metadata i32 1, metadata !20, metadata !DIExpression()), !dbg !15
  %tobool14 = icmp ne i32 %k.0, 0, !dbg !45
  %lnot15 = xor i1 %tobool14, true, !dbg !45
  %lnot.ext16 = zext i1 %lnot15 to i32, !dbg !45
  call void @llvm.dbg.value(metadata i32 %lnot.ext16, metadata !21, metadata !DIExpression()), !dbg !15
  br label %if.end17, !dbg !47

if.end17:                                         ; preds = %if.then13, %if.end8
  %j.0 = phi i32 [ 1, %if.then13 ], [ 0, %if.end8 ], !dbg !15
  %k.1 = phi i32 [ %lnot.ext16, %if.then13 ], [ %k.0, %if.end8 ], !dbg !15
  call void @llvm.dbg.value(metadata i32 %k.1, metadata !21, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !20, metadata !DIExpression()), !dbg !15
  %tobool18 = icmp ne i32 %i.0, 0, !dbg !48
  br i1 %tobool18, label %if.then21, label %lor.lhs.false19, !dbg !50, !cf.info !25

lor.lhs.false19:                                  ; preds = %if.end17
  %tobool20 = icmp ne i32 %j.0, 0, !dbg !51
  br i1 %tobool20, label %if.then21, label %if.end30, !dbg !52, !cf.info !25

if.then21:                                        ; preds = %lor.lhs.false19, %if.end17
  %tobool22 = icmp ne i32 %k.1, 0, !dbg !53
  br i1 %tobool22, label %if.then23, label %if.end25, !dbg !56, !cf.info !25

if.then23:                                        ; preds = %if.then21
  %arrayidx24 = getelementptr inbounds i8, i8* %c, i64 0, !dbg !57
  store i8 45, i8* %arrayidx24, align 1, !dbg !58
  br label %if.end25, !dbg !57

if.end25:                                         ; preds = %if.then23, %if.then21
  %idx.ext = sext i32 %i.0 to i64, !dbg !59
  %add.ptr = getelementptr inbounds i8, i8* %a, i64 %idx.ext, !dbg !59
  %idx.ext26 = sext i32 %j.0 to i64, !dbg !60
  %add.ptr27 = getelementptr inbounds i8, i8* %b, i64 %idx.ext26, !dbg !60
  %idx.ext28 = sext i32 %k.1 to i64, !dbg !61
  %add.ptr29 = getelementptr inbounds i8, i8* %c, i64 %idx.ext28, !dbg !61
  call void @longmulti(i8* %add.ptr, i8* %add.ptr27, i8* %add.ptr29), !dbg !62
  br label %return, !dbg !63

if.end30:                                         ; preds = %lor.lhs.false19
  %call31 = call i64 @strlen(i8* %a) #5, !dbg !64
  %conv32 = trunc i64 %call31 to i32, !dbg !64
  call void @llvm.dbg.value(metadata i32 %conv32, metadata !65, metadata !DIExpression()), !dbg !15
  %call33 = call i64 @strlen(i8* %b) #5, !dbg !66
  %conv34 = trunc i64 %call33 to i32, !dbg !66
  call void @llvm.dbg.value(metadata i32 %conv34, metadata !67, metadata !DIExpression()), !dbg !15
  %add = add nsw i32 %conv32, %conv34, !dbg !68
  %conv35 = sext i32 %add to i64, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 1 %c, i8 48, i64 %conv35, i1 false), !dbg !70
  %add36 = add nsw i32 %conv32, %conv34, !dbg !71
  %idxprom = sext i32 %add36 to i64, !dbg !72
  %arrayidx37 = getelementptr inbounds i8, i8* %c, i64 %idxprom, !dbg !72
  store i8 0, i8* %arrayidx37, align 1, !dbg !73
  %sub = sub nsw i32 %conv32, 1, !dbg !74
  call void @llvm.dbg.value(metadata i32 %sub, metadata !18, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !76

for.cond:                                         ; preds = %for.inc71, %if.end30
  %i.1 = phi i32 [ %sub, %if.end30 ], [ %dec72, %for.inc71 ], !dbg !77
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !18, metadata !DIExpression()), !dbg !15
  %cmp38 = icmp sge i32 %i.1, 0, !dbg !78
  br i1 %cmp38, label %for.body, label %for.end73, !dbg !80

for.body:                                         ; preds = %for.cond
  %sub40 = sub nsw i32 %conv34, 1, !dbg !81
  call void @llvm.dbg.value(metadata i32 %sub40, metadata !20, metadata !DIExpression()), !dbg !15
  %add41 = add nsw i32 %i.1, %sub40, !dbg !84
  %add42 = add nsw i32 %add41, 1, !dbg !85
  call void @llvm.dbg.value(metadata i32 %add42, metadata !21, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !86, metadata !DIExpression()), !dbg !15
  br label %for.cond43, !dbg !87

for.cond43:                                       ; preds = %for.inc, %for.body
  %j.1 = phi i32 [ %sub40, %for.body ], [ %dec, %for.inc ], !dbg !88
  %k.2 = phi i32 [ %add42, %for.body ], [ %dec65, %for.inc ], !dbg !88
  %carry.0 = phi i32 [ 0, %for.body ], [ %div, %for.inc ], !dbg !88
  call void @llvm.dbg.value(metadata i32 %carry.0, metadata !86, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %k.2, metadata !21, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !20, metadata !DIExpression()), !dbg !15
  %cmp44 = icmp sge i32 %j.1, 0, !dbg !89
  br i1 %cmp44, label %for.body46, label %for.end, !dbg !91

for.body46:                                       ; preds = %for.cond43
  %idxprom47 = sext i32 %i.1 to i64, !dbg !92
  %arrayidx48 = getelementptr inbounds i8, i8* %a, i64 %idxprom47, !dbg !92
  %2 = load i8, i8* %arrayidx48, align 1, !dbg !92
  %conv49 = sext i8 %2 to i32, !dbg !92
  %sub50 = sub nsw i32 %conv49, 48, !dbg !92
  %idxprom51 = sext i32 %j.1 to i64, !dbg !94
  %arrayidx52 = getelementptr inbounds i8, i8* %b, i64 %idxprom51, !dbg !94
  %3 = load i8, i8* %arrayidx52, align 1, !dbg !94
  %conv53 = sext i8 %3 to i32, !dbg !94
  %sub54 = sub nsw i32 %conv53, 48, !dbg !94
  %mul = mul nsw i32 %sub50, %sub54, !dbg !95
  %idxprom55 = sext i32 %k.2 to i64, !dbg !96
  %arrayidx56 = getelementptr inbounds i8, i8* %c, i64 %idxprom55, !dbg !96
  %4 = load i8, i8* %arrayidx56, align 1, !dbg !96
  %conv57 = sext i8 %4 to i32, !dbg !96
  %sub58 = sub nsw i32 %conv57, 48, !dbg !96
  %add59 = add nsw i32 %mul, %sub58, !dbg !97
  %add60 = add nsw i32 %add59, %carry.0, !dbg !98
  call void @llvm.dbg.value(metadata i32 %add60, metadata !99, metadata !DIExpression()), !dbg !15
  %div = sdiv i32 %add60, 10, !dbg !100
  call void @llvm.dbg.value(metadata i32 %div, metadata !86, metadata !DIExpression()), !dbg !15
  %rem = srem i32 %add60, 10, !dbg !101
  %add61 = add nsw i32 %rem, 48, !dbg !102
  %conv62 = trunc i32 %add61 to i8, !dbg !103
  %idxprom63 = sext i32 %k.2 to i64, !dbg !104
  %arrayidx64 = getelementptr inbounds i8, i8* %c, i64 %idxprom63, !dbg !104
  store i8 %conv62, i8* %arrayidx64, align 1, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body46
  %dec = add nsw i32 %j.1, -1, !dbg !107
  call void @llvm.dbg.value(metadata i32 %dec, metadata !20, metadata !DIExpression()), !dbg !15
  %dec65 = add nsw i32 %k.2, -1, !dbg !108
  call void @llvm.dbg.value(metadata i32 %dec65, metadata !21, metadata !DIExpression()), !dbg !15
  br label %for.cond43, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond43
  %idxprom66 = sext i32 %k.2 to i64, !dbg !112
  %arrayidx67 = getelementptr inbounds i8, i8* %c, i64 %idxprom66, !dbg !112
  %5 = load i8, i8* %arrayidx67, align 1, !dbg !113
  %conv68 = sext i8 %5 to i32, !dbg !113
  %add69 = add nsw i32 %conv68, %carry.0, !dbg !113
  %conv70 = trunc i32 %add69 to i8, !dbg !113
  store i8 %conv70, i8* %arrayidx67, align 1, !dbg !113
  br label %for.inc71, !dbg !114

for.inc71:                                        ; preds = %for.end
  %dec72 = add nsw i32 %i.1, -1, !dbg !115
  call void @llvm.dbg.value(metadata i32 %dec72, metadata !18, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !116, !llvm.loop !117

for.end73:                                        ; preds = %for.cond
  %arrayidx74 = getelementptr inbounds i8, i8* %c, i64 0, !dbg !119
  %6 = load i8, i8* %arrayidx74, align 1, !dbg !119
  %conv75 = sext i8 %6 to i32, !dbg !119
  %cmp76 = icmp eq i32 %conv75, 48, !dbg !121
  br i1 %cmp76, label %if.then78, label %if.end82, !dbg !122, !cf.info !25

if.then78:                                        ; preds = %for.end73
  %add.ptr79 = getelementptr inbounds i8, i8* %c, i64 1, !dbg !123
  %add80 = add nsw i32 %conv32, %conv34, !dbg !124
  %conv81 = sext i32 %add80 to i64, !dbg !125
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %c, i8* align 1 %add.ptr79, i64 %conv81, i1 false), !dbg !126
  br label %if.end82, !dbg !126

if.end82:                                         ; preds = %if.then78, %for.end73
  br label %return, !dbg !127

return:                                           ; preds = %if.end82, %if.end25, %if.then
  ret void, !dbg !128
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !129 {
entry:
  %c = alloca [1024 x i8], align 16
  call void @llvm.dbg.declare(metadata [1024 x i8]* %c, metadata !132, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %c, i64 0, i64 0, !dbg !137
  call void @longmulti(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i8* %arraydecay), !dbg !138
  %arraydecay1 = getelementptr inbounds [1024 x i8], [1024 x i8]* %c, i64 0, i64 0, !dbg !139
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay1), !dbg !140
  ret i32 0, !dbg !141
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "long-multiplication-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Long-multiplication")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "longmulti", scope: !1, file: !1, line: 6, type: !8, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !13}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 6, type: !10)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 6, type: !10)
!17 = !DILocalVariable(name: "c", arg: 3, scope: !7, file: !1, line: 6, type: !13)
!18 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 8, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 8, type: !19)
!21 = !DILocalVariable(name: "k", scope: !7, file: !1, line: 8, type: !19)
!22 = !DILocation(line: 12, column: 7, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 6)
!24 = !DILocation(line: 12, column: 22, scope: !23)
!25 = !{!"if"}
!26 = !DILocation(line: 12, column: 26, scope: !23)
!27 = !DILocation(line: 12, column: 6, scope: !7)
!28 = !DILocation(line: 13, column: 3, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !1, line: 12, column: 42)
!30 = !DILocation(line: 13, column: 8, scope: !29)
!31 = !DILocation(line: 13, column: 15, scope: !29)
!32 = !DILocation(line: 13, column: 20, scope: !29)
!33 = !DILocation(line: 14, column: 3, scope: !29)
!34 = !DILocation(line: 18, column: 6, scope: !35)
!35 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 6)
!36 = !DILocation(line: 18, column: 11, scope: !35)
!37 = !DILocation(line: 18, column: 6, scope: !7)
!38 = !DILocation(line: 18, column: 32, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !1, line: 18, column: 19)
!40 = !DILocation(line: 18, column: 36, scope: !39)
!41 = !DILocation(line: 19, column: 6, scope: !42)
!42 = distinct !DILexicalBlock(scope: !7, file: !1, line: 19, column: 6)
!43 = !DILocation(line: 19, column: 11, scope: !42)
!44 = !DILocation(line: 19, column: 6, scope: !7)
!45 = !DILocation(line: 19, column: 32, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 19, column: 19)
!47 = !DILocation(line: 19, column: 36, scope: !46)
!48 = !DILocation(line: 22, column: 6, scope: !49)
!49 = distinct !DILexicalBlock(scope: !7, file: !1, line: 22, column: 6)
!50 = !DILocation(line: 22, column: 8, scope: !49)
!51 = !DILocation(line: 22, column: 11, scope: !49)
!52 = !DILocation(line: 22, column: 6, scope: !7)
!53 = !DILocation(line: 23, column: 7, scope: !54)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 23, column: 7)
!55 = distinct !DILexicalBlock(scope: !49, file: !1, line: 22, column: 14)
!56 = !DILocation(line: 23, column: 7, scope: !55)
!57 = !DILocation(line: 23, column: 10, scope: !54)
!58 = !DILocation(line: 23, column: 15, scope: !54)
!59 = !DILocation(line: 24, column: 15, scope: !55)
!60 = !DILocation(line: 24, column: 22, scope: !55)
!61 = !DILocation(line: 24, column: 29, scope: !55)
!62 = !DILocation(line: 24, column: 3, scope: !55)
!63 = !DILocation(line: 25, column: 3, scope: !55)
!64 = !DILocation(line: 28, column: 7, scope: !7)
!65 = !DILocalVariable(name: "la", scope: !7, file: !1, line: 9, type: !19)
!66 = !DILocation(line: 29, column: 7, scope: !7)
!67 = !DILocalVariable(name: "lb", scope: !7, file: !1, line: 9, type: !19)
!68 = !DILocation(line: 30, column: 20, scope: !7)
!69 = !DILocation(line: 30, column: 17, scope: !7)
!70 = !DILocation(line: 30, column: 2, scope: !7)
!71 = !DILocation(line: 31, column: 7, scope: !7)
!72 = !DILocation(line: 31, column: 2, scope: !7)
!73 = !DILocation(line: 31, column: 13, scope: !7)
!74 = !DILocation(line: 34, column: 14, scope: !75)
!75 = distinct !DILexicalBlock(scope: !7, file: !1, line: 34, column: 2)
!76 = !DILocation(line: 34, column: 7, scope: !75)
!77 = !DILocation(line: 0, scope: !75)
!78 = !DILocation(line: 34, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !1, line: 34, column: 2)
!80 = !DILocation(line: 34, column: 2, scope: !75)
!81 = !DILocation(line: 35, column: 15, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 35, column: 3)
!83 = distinct !DILexicalBlock(scope: !79, file: !1, line: 34, column: 32)
!84 = !DILocation(line: 35, column: 26, scope: !82)
!85 = !DILocation(line: 35, column: 30, scope: !82)
!86 = !DILocalVariable(name: "carry", scope: !7, file: !1, line: 8, type: !19)
!87 = !DILocation(line: 35, column: 8, scope: !82)
!88 = !DILocation(line: 0, scope: !82)
!89 = !DILocation(line: 35, column: 48, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !1, line: 35, column: 3)
!91 = !DILocation(line: 35, column: 3, scope: !82)
!92 = !DILocation(line: 36, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !1, line: 35, column: 64)
!94 = !DILocation(line: 36, column: 18, scope: !93)
!95 = !DILocation(line: 36, column: 16, scope: !93)
!96 = !DILocation(line: 36, column: 28, scope: !93)
!97 = !DILocation(line: 36, column: 26, scope: !93)
!98 = !DILocation(line: 36, column: 36, scope: !93)
!99 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 8, type: !19)
!100 = !DILocation(line: 37, column: 14, scope: !93)
!101 = !DILocation(line: 38, column: 14, scope: !93)
!102 = !DILocation(line: 38, column: 20, scope: !93)
!103 = !DILocation(line: 38, column: 11, scope: !93)
!104 = !DILocation(line: 38, column: 4, scope: !93)
!105 = !DILocation(line: 38, column: 9, scope: !93)
!106 = !DILocation(line: 39, column: 3, scope: !93)
!107 = !DILocation(line: 35, column: 55, scope: !90)
!108 = !DILocation(line: 35, column: 60, scope: !90)
!109 = !DILocation(line: 35, column: 3, scope: !90)
!110 = distinct !{!110, !91, !111}
!111 = !DILocation(line: 39, column: 3, scope: !82)
!112 = !DILocation(line: 40, column: 3, scope: !83)
!113 = !DILocation(line: 40, column: 8, scope: !83)
!114 = !DILocation(line: 41, column: 2, scope: !83)
!115 = !DILocation(line: 34, column: 28, scope: !79)
!116 = !DILocation(line: 34, column: 2, scope: !79)
!117 = distinct !{!117, !80, !118}
!118 = !DILocation(line: 41, column: 2, scope: !75)
!119 = !DILocation(line: 43, column: 6, scope: !120)
!120 = distinct !DILexicalBlock(scope: !7, file: !1, line: 43, column: 6)
!121 = !DILocation(line: 43, column: 11, scope: !120)
!122 = !DILocation(line: 43, column: 6, scope: !7)
!123 = !DILocation(line: 43, column: 32, scope: !120)
!124 = !DILocation(line: 43, column: 40, scope: !120)
!125 = !DILocation(line: 43, column: 37, scope: !120)
!126 = !DILocation(line: 43, column: 19, scope: !120)
!127 = !DILocation(line: 45, column: 2, scope: !7)
!128 = !DILocation(line: 46, column: 1, scope: !7)
!129 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 48, type: !130, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DISubroutineType(types: !131)
!131 = !{!19}
!132 = !DILocalVariable(name: "c", scope: !129, file: !1, line: 50, type: !133)
!133 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 8192, elements: !134)
!134 = !{!135}
!135 = !DISubrange(count: 1024)
!136 = !DILocation(line: 50, column: 7, scope: !129)
!137 = !DILocation(line: 51, column: 62, scope: !129)
!138 = !DILocation(line: 51, column: 2, scope: !129)
!139 = !DILocation(line: 52, column: 17, scope: !129)
!140 = !DILocation(line: 52, column: 2, scope: !129)
!141 = !DILocation(line: 54, column: 2, scope: !129)
