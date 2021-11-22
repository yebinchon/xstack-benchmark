; ModuleID = 'execute-hq9+.c'
source_filename = "execute-hq9+.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Hello, world!\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"%d bottles of beer on the wall\0A\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"%d bottles of beer\0A\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"Take one down, pass it around\0A\00", align 1
@.str.5 = private unnamed_addr constant [33 x i8] c"%d bottles of beer on the wall\0A\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @runCode(i8* %code) #0 !dbg !7 {
entry:
  %code.addr = alloca i8*, align 8
  %c_len = alloca i32, align 4
  %i = alloca i32, align 4
  %bottles = alloca i32, align 4
  %accumulator = alloca i32, align 4
  store i8* %code, i8** %code.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %code.addr, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %c_len, metadata !15, metadata !DIExpression()), !dbg !17
  %0 = load i8*, i8** %code.addr, align 8, !dbg !18
  %call = call i64 @strlen(i8* %0), !dbg !19
  %conv = trunc i64 %call to i32, !dbg !19
  store i32 %conv, i32* %c_len, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %bottles, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %accumulator, metadata !24, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %accumulator, align 4, !dbg !26
  store i32 0, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !30
  %2 = load i32, i32* %c_len, align 4, !dbg !32
  %cmp = icmp slt i32 %1, %2, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %code.addr, align 8, !dbg !35
  %4 = load i32, i32* %i, align 4, !dbg !37
  %idxprom = sext i32 %4 to i64, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom, !dbg !35
  %5 = load i8, i8* %arrayidx, align 1, !dbg !35
  %conv2 = sext i8 %5 to i32, !dbg !35
  switch i32 %conv2, label %sw.epilog [
    i32 81, label %sw.bb
    i32 72, label %sw.bb4
    i32 57, label %sw.bb6
    i32 43, label %sw.bb13
  ], !dbg !38

sw.bb:                                            ; preds = %for.body
  %6 = load i8*, i8** %code.addr, align 8, !dbg !39
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* %6), !dbg !41
  br label %sw.epilog, !dbg !42

sw.bb4:                                           ; preds = %for.body
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)), !dbg !43
  br label %sw.epilog, !dbg !44

sw.bb6:                                           ; preds = %for.body
  store i32 99, i32* %bottles, align 4, !dbg !45
  br label %do.body, !dbg !46

do.body:                                          ; preds = %do.cond, %sw.bb6
  %7 = load i32, i32* %bottles, align 4, !dbg !47
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %7), !dbg !49
  %8 = load i32, i32* %bottles, align 4, !dbg !50
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i32 %8), !dbg !51
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !52
  %9 = load i32, i32* %bottles, align 4, !dbg !53
  %dec = add nsw i32 %9, -1, !dbg !53
  store i32 %dec, i32* %bottles, align 4, !dbg !53
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.5, i64 0, i64 0), i32 %dec), !dbg !54
  br label %do.cond, !dbg !55

do.cond:                                          ; preds = %do.body
  %10 = load i32, i32* %bottles, align 4, !dbg !56
  %cmp11 = icmp sgt i32 %10, 0, !dbg !57
  br i1 %cmp11, label %do.body, label %do.end, !dbg !55, !llvm.loop !58

do.end:                                           ; preds = %do.cond
  br label %sw.epilog, !dbg !60

sw.bb13:                                          ; preds = %for.body
  %11 = load i32, i32* %accumulator, align 4, !dbg !61
  %inc = add i32 %11, 1, !dbg !61
  store i32 %inc, i32* %accumulator, align 4, !dbg !61
  br label %sw.epilog, !dbg !62

sw.epilog:                                        ; preds = %for.body, %sw.bb13, %do.end, %sw.bb4, %sw.bb
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %sw.epilog
  %12 = load i32, i32* %i, align 4, !dbg !64
  %inc14 = add nsw i32 %12, 1, !dbg !64
  store i32 %inc14, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  ret void, !dbg !68
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i64 @strlen(i8*) #2

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "execute-hq9+.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Execute-HQ9+")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "runCode", scope: !1, file: !1, line: 1, type: !8, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DILocalVariable(name: "code", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 1, column: 26, scope: !7)
!15 = !DILocalVariable(name: "c_len", scope: !7, file: !1, line: 3, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 3, column: 9, scope: !7)
!18 = !DILocation(line: 3, column: 24, scope: !7)
!19 = !DILocation(line: 3, column: 17, scope: !7)
!20 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 4, type: !16)
!21 = !DILocation(line: 4, column: 9, scope: !7)
!22 = !DILocalVariable(name: "bottles", scope: !7, file: !1, line: 4, type: !16)
!23 = !DILocation(line: 4, column: 12, scope: !7)
!24 = !DILocalVariable(name: "accumulator", scope: !7, file: !1, line: 5, type: !25)
!25 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!26 = !DILocation(line: 5, column: 14, scope: !7)
!27 = !DILocation(line: 6, column: 10, scope: !28)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 5)
!29 = !DILocation(line: 6, column: 9, scope: !28)
!30 = !DILocation(line: 6, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !1, line: 6, column: 5)
!32 = !DILocation(line: 6, column: 15, scope: !31)
!33 = !DILocation(line: 6, column: 14, scope: !31)
!34 = !DILocation(line: 6, column: 5, scope: !28)
!35 = !DILocation(line: 8, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !1, line: 7, column: 5)
!37 = !DILocation(line: 8, column: 21, scope: !36)
!38 = !DILocation(line: 8, column: 9, scope: !36)
!39 = !DILocation(line: 11, column: 32, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !1, line: 9, column: 9)
!41 = !DILocation(line: 11, column: 17, scope: !40)
!42 = !DILocation(line: 12, column: 17, scope: !40)
!43 = !DILocation(line: 15, column: 17, scope: !40)
!44 = !DILocation(line: 16, column: 17, scope: !40)
!45 = !DILocation(line: 20, column: 25, scope: !40)
!46 = !DILocation(line: 21, column: 17, scope: !40)
!47 = !DILocation(line: 22, column: 64, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !1, line: 21, column: 20)
!49 = !DILocation(line: 22, column: 21, scope: !48)
!50 = !DILocation(line: 23, column: 52, scope: !48)
!51 = !DILocation(line: 23, column: 21, scope: !48)
!52 = !DILocation(line: 24, column: 21, scope: !48)
!53 = !DILocation(line: 25, column: 66, scope: !48)
!54 = !DILocation(line: 25, column: 21, scope: !48)
!55 = !DILocation(line: 26, column: 17, scope: !48)
!56 = !DILocation(line: 26, column: 26, scope: !40)
!57 = !DILocation(line: 26, column: 34, scope: !40)
!58 = distinct !{!58, !46, !59}
!59 = !DILocation(line: 26, column: 38, scope: !40)
!60 = !DILocation(line: 27, column: 17, scope: !40)
!61 = !DILocation(line: 31, column: 28, scope: !40)
!62 = !DILocation(line: 32, column: 17, scope: !40)
!63 = !DILocation(line: 34, column: 5, scope: !36)
!64 = !DILocation(line: 6, column: 22, scope: !31)
!65 = !DILocation(line: 6, column: 5, scope: !31)
!66 = distinct !{!66, !34, !67}
!67 = !DILocation(line: 34, column: 5, scope: !28)
!68 = !DILocation(line: 35, column: 1, scope: !7)
