; ModuleID = 'count-occurrences-of-a-substring-2.ll'
source_filename = "count-occurrences-of-a-substring-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"the three truths\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"th\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"ababababab\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"abab\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"abaabba*bbaba*bbab\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"a*b\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @countSubstring(i8* %str, i8* %sub) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i8* %str, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8* %sub, metadata !16, metadata !DIExpression()), !dbg !15
  %call = call i64 @strlen(i8* %sub) #4, !dbg !17
  %conv = trunc i64 %call to i32, !dbg !17
  call void @llvm.dbg.value(metadata i32 %conv, metadata !18, metadata !DIExpression()), !dbg !15
  %cmp = icmp eq i32 %conv, 0, !dbg !19
  br i1 %cmp, label %if.then, label %if.end, !dbg !21, !cf.info !22

if.then:                                          ; preds = %entry
  br label %return, !dbg !23

if.end:                                           ; preds = %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !24, metadata !DIExpression()), !dbg !15
  %call2 = call i8* @strstr(i8* %str, i8* %sub) #4, !dbg !25
  call void @llvm.dbg.value(metadata i8* %call2, metadata !14, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %if.end
  %count.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !15
  %str.addr.0 = phi i8* [ %call2, %if.end ], [ %call3, %for.inc ], !dbg !28
  call void @llvm.dbg.value(metadata i8* %str.addr.0, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %count.0, metadata !24, metadata !DIExpression()), !dbg !15
  %tobool = icmp ne i8* %str.addr.0, null, !dbg !29
  br i1 %tobool, label %for.body, label %for.end, !dbg !29

for.body:                                         ; preds = %for.cond
  %inc = add nsw i32 %count.0, 1, !dbg !30
  call void @llvm.dbg.value(metadata i32 %inc, metadata !24, metadata !DIExpression()), !dbg !15
  br label %for.inc, !dbg !30

for.inc:                                          ; preds = %for.body
  %idx.ext = sext i32 %conv to i64, !dbg !32
  %add.ptr = getelementptr inbounds i8, i8* %str.addr.0, i64 %idx.ext, !dbg !32
  %call3 = call i8* @strstr(i8* %add.ptr, i8* %sub) #4, !dbg !33
  call void @llvm.dbg.value(metadata i8* %call3, metadata !14, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !37

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %count.0, %for.end ], !dbg !15
  ret i32 %retval.0, !dbg !38
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind readonly
declare dso_local i8* @strstr(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !39 {
entry:
  %call = call i32 @countSubstring(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0)), !dbg !42
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !43
  %call2 = call i32 @countSubstring(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0)), !dbg !44
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call2), !dbg !45
  %call4 = call i32 @countSubstring(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0)), !dbg !46
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call4), !dbg !47
  ret i32 0, !dbg !48
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "count-occurrences-of-a-substring-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Count-occurrences-of-a-substring")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "countSubstring", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "str", arg: 1, scope: !7, file: !1, line: 5, type: !11)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "sub", arg: 2, scope: !7, file: !1, line: 5, type: !11)
!17 = !DILocation(line: 7, column: 18, scope: !7)
!18 = !DILocalVariable(name: "length", scope: !7, file: !1, line: 7, type: !10)
!19 = !DILocation(line: 8, column: 16, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 9)
!21 = !DILocation(line: 8, column: 9, scope: !7)
!22 = !{!"if"}
!23 = !DILocation(line: 8, column: 22, scope: !20)
!24 = !DILocalVariable(name: "count", scope: !7, file: !1, line: 9, type: !10)
!25 = !DILocation(line: 10, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 5)
!27 = !DILocation(line: 10, column: 10, scope: !26)
!28 = !DILocation(line: 0, scope: !26)
!29 = !DILocation(line: 10, column: 5, scope: !26)
!30 = !DILocation(line: 11, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !1, line: 10, column: 5)
!32 = !DILocation(line: 10, column: 56, scope: !31)
!33 = !DILocation(line: 10, column: 45, scope: !31)
!34 = !DILocation(line: 10, column: 5, scope: !31)
!35 = distinct !{!35, !29, !36}
!36 = !DILocation(line: 11, column: 11, scope: !26)
!37 = !DILocation(line: 12, column: 5, scope: !7)
!38 = !DILocation(line: 13, column: 1, scope: !7)
!39 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 15, type: !40, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!10}
!42 = !DILocation(line: 17, column: 20, scope: !39)
!43 = !DILocation(line: 17, column: 5, scope: !39)
!44 = !DILocation(line: 18, column: 20, scope: !39)
!45 = !DILocation(line: 18, column: 5, scope: !39)
!46 = !DILocation(line: 19, column: 20, scope: !39)
!47 = !DILocation(line: 19, column: 5, scope: !39)
!48 = !DILocation(line: 21, column: 5, scope: !39)
