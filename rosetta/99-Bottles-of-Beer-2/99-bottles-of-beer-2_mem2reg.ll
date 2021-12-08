; ModuleID = '99-bottles-of-beer-2.ll'
source_filename = "99-bottles-of-beer-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [33 x i8] c"%d bottle%c of beer on the wall\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"%d bottle%c of beer\0A\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Take one down, pass it around\0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"%d bottle%c of beer on the wall\0A\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !9 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i8** %argv, metadata !18, metadata !DIExpression()), !dbg !17
  %cmp = icmp eq i32 %argc, 99, !dbg !19
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  br label %return, !dbg !22

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 0, !dbg !23
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !23
  %cmp1 = icmp ne i8* %0, null, !dbg !25
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !26

if.then2:                                         ; preds = %if.end
  %arrayidx3 = getelementptr inbounds i8*, i8** %argv, i64 0, !dbg !27
  store i8* null, i8** %arrayidx3, align 8, !dbg !29
  call void @llvm.dbg.value(metadata i32 0, metadata !16, metadata !DIExpression()), !dbg !17
  br label %if.end4, !dbg !30

if.end4:                                          ; preds = %if.then2, %if.end
  %argc.addr.0 = phi i32 [ 0, %if.then2 ], [ %argc, %if.end ]
  call void @llvm.dbg.value(metadata i32 %argc.addr.0, metadata !16, metadata !DIExpression()), !dbg !17
  %add = add nsw i32 %argc.addr.0, 1, !dbg !31
  %call = call i32 @main(i32 %add, i8** %argv), !dbg !32
  call void @llvm.dbg.value(metadata i32 %call, metadata !16, metadata !DIExpression()), !dbg !17
  %cmp5 = icmp eq i32 %call, 1, !dbg !33
  %1 = zext i1 %cmp5 to i64, !dbg !34
  %cond = select i1 %cmp5, i32 0, i32 115, !dbg !34
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i64 0, i64 0), i32 %call, i32 %cond), !dbg !35
  %cmp7 = icmp eq i32 %call, 1, !dbg !36
  %2 = zext i1 %cmp7 to i64, !dbg !37
  %cond8 = select i1 %cmp7, i32 0, i32 115, !dbg !37
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), i32 %call, i32 %cond8), !dbg !38
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0)), !dbg !39
  %sub = sub nsw i32 %call, 1, !dbg !40
  %sub11 = sub nsw i32 %call, 1, !dbg !41
  %cmp12 = icmp eq i32 %sub11, 1, !dbg !42
  %3 = zext i1 %cmp12 to i64, !dbg !43
  %cond13 = select i1 %cmp12, i32 0, i32 115, !dbg !43
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %cond13), !dbg !44
  %sub15 = sub nsw i32 %call, 1, !dbg !45
  br label %return, !dbg !46

return:                                           ; preds = %if.end4, %if.then
  %retval.0 = phi i32 [ 99, %if.then ], [ %sub15, %if.end4 ], !dbg !17
  ret i32 %retval.0, !dbg !47
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "99-bottles-of-beer-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/99-Bottles-of-Beer-2")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !10, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !13}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !1, line: 3, type: !12)
!17 = !DILocation(line: 0, scope: !9)
!18 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !1, line: 3, type: !13)
!19 = !DILocation(line: 5, column: 17, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !1, line: 5, column: 12)
!21 = !DILocation(line: 5, column: 12, scope: !9)
!22 = !DILocation(line: 6, column: 17, scope: !20)
!23 = !DILocation(line: 7, column: 12, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !1, line: 7, column: 12)
!25 = !DILocation(line: 7, column: 20, scope: !24)
!26 = !DILocation(line: 7, column: 12, scope: !9)
!27 = !DILocation(line: 8, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !1, line: 7, column: 28)
!29 = !DILocation(line: 8, column: 25, scope: !28)
!30 = !DILocation(line: 10, column: 9, scope: !28)
!31 = !DILocation(line: 11, column: 26, scope: !9)
!32 = !DILocation(line: 11, column: 16, scope: !9)
!33 = !DILocation(line: 12, column: 64, scope: !9)
!34 = !DILocation(line: 12, column: 59, scope: !9)
!35 = !DILocation(line: 12, column: 9, scope: !9)
!36 = !DILocation(line: 13, column: 52, scope: !9)
!37 = !DILocation(line: 13, column: 47, scope: !9)
!38 = !DILocation(line: 13, column: 9, scope: !9)
!39 = !DILocation(line: 14, column: 9, scope: !9)
!40 = !DILocation(line: 15, column: 60, scope: !9)
!41 = !DILocation(line: 15, column: 71, scope: !9)
!42 = !DILocation(line: 15, column: 76, scope: !9)
!43 = !DILocation(line: 15, column: 65, scope: !9)
!44 = !DILocation(line: 15, column: 9, scope: !9)
!45 = !DILocation(line: 16, column: 21, scope: !9)
!46 = !DILocation(line: 16, column: 9, scope: !9)
!47 = !DILocation(line: 17, column: 1, scope: !9)
