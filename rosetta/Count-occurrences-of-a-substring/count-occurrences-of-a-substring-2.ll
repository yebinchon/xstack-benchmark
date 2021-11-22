; ModuleID = 'count-occurrences-of-a-substring-2.c'
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
  %retval = alloca i32, align 4
  %str.addr = alloca i8*, align 8
  %sub.addr = alloca i8*, align 8
  %length = alloca i32, align 4
  %count = alloca i32, align 4
  store i8* %str, i8** %str.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %str.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8* %sub, i8** %sub.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %sub.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %length, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8*, i8** %sub.addr, align 8, !dbg !20
  %call = call i64 @strlen(i8* %0) #4, !dbg !21
  %conv = trunc i64 %call to i32, !dbg !21
  store i32 %conv, i32* %length, align 4, !dbg !19
  %1 = load i32, i32* %length, align 4, !dbg !22
  %cmp = icmp eq i32 %1, 0, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25, !cf.info !26

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !27
  br label %return, !dbg !27

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %count, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 0, i32* %count, align 4, !dbg !29
  %2 = load i8*, i8** %str.addr, align 8, !dbg !30
  %3 = load i8*, i8** %sub.addr, align 8, !dbg !32
  %call2 = call i8* @strstr(i8* %2, i8* %3) #4, !dbg !33
  store i8* %call2, i8** %str.addr, align 8, !dbg !34
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i8*, i8** %str.addr, align 8, !dbg !36
  %tobool = icmp ne i8* %4, null, !dbg !38
  br i1 %tobool, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %count, align 4, !dbg !39
  %inc = add nsw i32 %5, 1, !dbg !39
  store i32 %inc, i32* %count, align 4, !dbg !39
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %str.addr, align 8, !dbg !40
  %7 = load i32, i32* %length, align 4, !dbg !41
  %idx.ext = sext i32 %7 to i64, !dbg !42
  %add.ptr = getelementptr inbounds i8, i8* %6, i64 %idx.ext, !dbg !42
  %8 = load i8*, i8** %sub.addr, align 8, !dbg !43
  %call3 = call i8* @strstr(i8* %add.ptr, i8* %8) #4, !dbg !44
  store i8* %call3, i8** %str.addr, align 8, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %count, align 4, !dbg !49
  store i32 %9, i32* %retval, align 4, !dbg !50
  br label %return, !dbg !50

return:                                           ; preds = %for.end, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !51
  ret i32 %10, !dbg !51
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind readonly
declare dso_local i8* @strstr(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @countSubstring(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !56
  %call2 = call i32 @countSubstring(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0)), !dbg !57
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call2), !dbg !58
  %call4 = call i32 @countSubstring(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0)), !dbg !59
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call4), !dbg !60
  ret i32 0, !dbg !61
}

declare dso_local i32 @printf(i8*, ...) #3

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
!15 = !DILocation(line: 5, column: 32, scope: !7)
!16 = !DILocalVariable(name: "sub", arg: 2, scope: !7, file: !1, line: 5, type: !11)
!17 = !DILocation(line: 5, column: 49, scope: !7)
!18 = !DILocalVariable(name: "length", scope: !7, file: !1, line: 7, type: !10)
!19 = !DILocation(line: 7, column: 9, scope: !7)
!20 = !DILocation(line: 7, column: 25, scope: !7)
!21 = !DILocation(line: 7, column: 18, scope: !7)
!22 = !DILocation(line: 8, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 9)
!24 = !DILocation(line: 8, column: 16, scope: !23)
!25 = !DILocation(line: 8, column: 9, scope: !7)
!26 = !{!"if"}
!27 = !DILocation(line: 8, column: 22, scope: !23)
!28 = !DILocalVariable(name: "count", scope: !7, file: !1, line: 9, type: !10)
!29 = !DILocation(line: 9, column: 9, scope: !7)
!30 = !DILocation(line: 10, column: 23, scope: !31)
!31 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 5)
!32 = !DILocation(line: 10, column: 28, scope: !31)
!33 = !DILocation(line: 10, column: 16, scope: !31)
!34 = !DILocation(line: 10, column: 14, scope: !31)
!35 = !DILocation(line: 10, column: 10, scope: !31)
!36 = !DILocation(line: 10, column: 34, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 10, column: 5)
!38 = !DILocation(line: 10, column: 5, scope: !31)
!39 = !DILocation(line: 11, column: 9, scope: !37)
!40 = !DILocation(line: 10, column: 52, scope: !37)
!41 = !DILocation(line: 10, column: 58, scope: !37)
!42 = !DILocation(line: 10, column: 56, scope: !37)
!43 = !DILocation(line: 10, column: 66, scope: !37)
!44 = !DILocation(line: 10, column: 45, scope: !37)
!45 = !DILocation(line: 10, column: 43, scope: !37)
!46 = !DILocation(line: 10, column: 5, scope: !37)
!47 = distinct !{!47, !38, !48}
!48 = !DILocation(line: 11, column: 11, scope: !31)
!49 = !DILocation(line: 12, column: 12, scope: !7)
!50 = !DILocation(line: 12, column: 5, scope: !7)
!51 = !DILocation(line: 13, column: 1, scope: !7)
!52 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 15, type: !53, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!10}
!55 = !DILocation(line: 17, column: 20, scope: !52)
!56 = !DILocation(line: 17, column: 5, scope: !52)
!57 = !DILocation(line: 18, column: 20, scope: !52)
!58 = !DILocation(line: 18, column: 5, scope: !52)
!59 = !DILocation(line: 19, column: 20, scope: !52)
!60 = !DILocation(line: 19, column: 5, scope: !52)
!61 = !DILocation(line: 21, column: 5, scope: !52)
