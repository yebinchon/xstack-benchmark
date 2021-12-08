; ModuleID = 'combinations-with-repetitions.ll'
source_filename = "combinations-with-repetitions.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"iced\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"jam\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"plain\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"something completely different\00", align 1
@donuts = dso_local global [4 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i32 0, i32 0)], align 16, !dbg !0
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\09\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [60 x i8] c"\0AWere there ten donuts, we'd have had %ld choices of three\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @choose(i32* %got, i32 %n_chosen, i32 %len, i32 %at, i32 %max_types) #0 !dbg !16 {
entry:
  call void @llvm.dbg.value(metadata i32* %got, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 %n_chosen, metadata !24, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 %len, metadata !25, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 %at, metadata !26, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 %max_types, metadata !27, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i64 0, metadata !28, metadata !DIExpression()), !dbg !23
  %cmp = icmp eq i32 %n_chosen, %len, !dbg !29
  br i1 %cmp, label %if.then, label %if.end6, !dbg !31

if.then:                                          ; preds = %entry
  %tobool = icmp ne i32* %got, null, !dbg !32
  br i1 %tobool, label %if.end, label %if.then1, !dbg !35

if.then1:                                         ; preds = %if.then
  br label %return, !dbg !36

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.value(metadata i32 0, metadata !37, metadata !DIExpression()), !dbg !23
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !40
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !37, metadata !DIExpression()), !dbg !23
  %cmp2 = icmp slt i32 %i.0, %len, !dbg !41
  br i1 %cmp2, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %got, i64 %idxprom, !dbg !44
  %0 = load i32, i32* %arrayidx, align 4, !dbg !44
  %idxprom3 = sext i32 %0 to i64, !dbg !45
  %arrayidx4 = getelementptr inbounds [4 x i8*], [4 x i8*]* @donuts, i64 0, i64 %idxprom3, !dbg !45
  %1 = load i8*, i8** %arrayidx4, align 8, !dbg !45
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i8* %1), !dbg !46
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !47
  call void @llvm.dbg.value(metadata i32 %inc, metadata !37, metadata !DIExpression()), !dbg !23
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !51
  br label %return, !dbg !52

if.end6:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i32 %at, metadata !37, metadata !DIExpression()), !dbg !23
  br label %for.cond7, !dbg !53

for.cond7:                                        ; preds = %for.inc17, %if.end6
  %i.1 = phi i32 [ %at, %if.end6 ], [ %inc18, %for.inc17 ], !dbg !55
  %count.0 = phi i64 [ 0, %if.end6 ], [ %add16, %for.inc17 ], !dbg !23
  call void @llvm.dbg.value(metadata i64 %count.0, metadata !28, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !37, metadata !DIExpression()), !dbg !23
  %cmp8 = icmp slt i32 %i.1, %max_types, !dbg !56
  br i1 %cmp8, label %for.body9, label %for.end19, !dbg !58

for.body9:                                        ; preds = %for.cond7
  %tobool10 = icmp ne i32* %got, null, !dbg !59
  br i1 %tobool10, label %if.then11, label %if.end14, !dbg !62

if.then11:                                        ; preds = %for.body9
  %idxprom12 = sext i32 %n_chosen to i64, !dbg !63
  %arrayidx13 = getelementptr inbounds i32, i32* %got, i64 %idxprom12, !dbg !63
  store i32 %i.1, i32* %arrayidx13, align 4, !dbg !64
  br label %if.end14, !dbg !63

if.end14:                                         ; preds = %if.then11, %for.body9
  %add = add nsw i32 %n_chosen, 1, !dbg !65
  %call15 = call i64 @choose(i32* %got, i32 %add, i32 %len, i32 %i.1, i32 %max_types), !dbg !66
  %add16 = add nsw i64 %count.0, %call15, !dbg !67
  call void @llvm.dbg.value(metadata i64 %add16, metadata !28, metadata !DIExpression()), !dbg !23
  br label %for.inc17, !dbg !68

for.inc17:                                        ; preds = %if.end14
  %inc18 = add nsw i32 %i.1, 1, !dbg !69
  call void @llvm.dbg.value(metadata i32 %inc18, metadata !37, metadata !DIExpression()), !dbg !23
  br label %for.cond7, !dbg !70, !llvm.loop !71

for.end19:                                        ; preds = %for.cond7
  br label %return, !dbg !73

return:                                           ; preds = %for.end19, %for.end, %if.then1
  %retval.0 = phi i64 [ 1, %for.end ], [ 1, %if.then1 ], [ %count.0, %for.end19 ], !dbg !23
  ret i64 %retval.0, !dbg !74
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !75 {
entry:
  %chosen = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %chosen, metadata !78, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %chosen, i64 0, i64 0, !dbg !83
  %call = call i64 @choose(i32* %arraydecay, i32 0, i32 2, i32 0, i32 3), !dbg !84
  %call1 = call i64 @choose(i32* null, i32 0, i32 3, i32 0, i32 10), !dbg !85
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.6, i64 0, i64 0), i64 %call1), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "donuts", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "combinations-with-repetitions.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Combinations-with-repetitions")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 256, elements: !10)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{!11}
!11 = !DISubrange(count: 4)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!16 = distinct !DISubprogram(name: "choose", scope: !3, file: !3, line: 4, type: !17, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{!19, !20, !21, !21, !21, !21}
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocalVariable(name: "got", arg: 1, scope: !16, file: !3, line: 4, type: !20)
!23 = !DILocation(line: 0, scope: !16)
!24 = !DILocalVariable(name: "n_chosen", arg: 2, scope: !16, file: !3, line: 4, type: !21)
!25 = !DILocalVariable(name: "len", arg: 3, scope: !16, file: !3, line: 4, type: !21)
!26 = !DILocalVariable(name: "at", arg: 4, scope: !16, file: !3, line: 4, type: !21)
!27 = !DILocalVariable(name: "max_types", arg: 5, scope: !16, file: !3, line: 4, type: !21)
!28 = !DILocalVariable(name: "count", scope: !16, file: !3, line: 7, type: !19)
!29 = !DILocation(line: 8, column: 22, scope: !30)
!30 = distinct !DILexicalBlock(scope: !16, file: !3, line: 8, column: 13)
!31 = !DILocation(line: 8, column: 13, scope: !16)
!32 = !DILocation(line: 9, column: 22, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !3, line: 9, column: 21)
!34 = distinct !DILexicalBlock(scope: !30, file: !3, line: 8, column: 30)
!35 = !DILocation(line: 9, column: 21, scope: !34)
!36 = !DILocation(line: 9, column: 27, scope: !33)
!37 = !DILocalVariable(name: "i", scope: !16, file: !3, line: 6, type: !21)
!38 = !DILocation(line: 11, column: 22, scope: !39)
!39 = distinct !DILexicalBlock(scope: !34, file: !3, line: 11, column: 17)
!40 = !DILocation(line: 0, scope: !39)
!41 = !DILocation(line: 11, column: 31, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !3, line: 11, column: 17)
!43 = !DILocation(line: 11, column: 17, scope: !39)
!44 = !DILocation(line: 12, column: 47, scope: !42)
!45 = !DILocation(line: 12, column: 40, scope: !42)
!46 = !DILocation(line: 12, column: 25, scope: !42)
!47 = !DILocation(line: 11, column: 39, scope: !42)
!48 = !DILocation(line: 11, column: 17, scope: !42)
!49 = distinct !{!49, !43, !50}
!50 = !DILocation(line: 12, column: 54, scope: !39)
!51 = !DILocation(line: 13, column: 17, scope: !34)
!52 = !DILocation(line: 14, column: 17, scope: !34)
!53 = !DILocation(line: 17, column: 14, scope: !54)
!54 = distinct !DILexicalBlock(scope: !16, file: !3, line: 17, column: 9)
!55 = !DILocation(line: 0, scope: !54)
!56 = !DILocation(line: 17, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !3, line: 17, column: 9)
!58 = !DILocation(line: 17, column: 9, scope: !54)
!59 = !DILocation(line: 18, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !61, file: !3, line: 18, column: 21)
!61 = distinct !DILexicalBlock(scope: !57, file: !3, line: 17, column: 42)
!62 = !DILocation(line: 18, column: 21, scope: !61)
!63 = !DILocation(line: 18, column: 26, scope: !60)
!64 = !DILocation(line: 18, column: 40, scope: !60)
!65 = !DILocation(line: 19, column: 47, scope: !61)
!66 = !DILocation(line: 19, column: 26, scope: !61)
!67 = !DILocation(line: 19, column: 23, scope: !61)
!68 = !DILocation(line: 20, column: 9, scope: !61)
!69 = !DILocation(line: 17, column: 38, scope: !57)
!70 = !DILocation(line: 17, column: 9, scope: !57)
!71 = distinct !{!71, !58, !72}
!72 = !DILocation(line: 20, column: 9, scope: !54)
!73 = !DILocation(line: 21, column: 9, scope: !16)
!74 = !DILocation(line: 22, column: 1, scope: !16)
!75 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 24, type: !76, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!21}
!78 = !DILocalVariable(name: "chosen", scope: !75, file: !3, line: 26, type: !79)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 96, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 3)
!82 = !DILocation(line: 26, column: 13, scope: !75)
!83 = !DILocation(line: 27, column: 16, scope: !75)
!84 = !DILocation(line: 27, column: 9, scope: !75)
!85 = !DILocation(line: 30, column: 17, scope: !75)
!86 = !DILocation(line: 29, column: 9, scope: !75)
!87 = !DILocation(line: 31, column: 9, scope: !75)
