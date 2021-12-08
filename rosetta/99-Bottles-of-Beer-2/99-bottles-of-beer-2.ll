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
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* %argc.addr, align 4, !dbg !20
  %cmp = icmp eq i32 %0, 99, !dbg !22
  br i1 %cmp, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  store i32 99, i32* %retval, align 4, !dbg !24
  br label %return, !dbg !24

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !25
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !25
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !25
  %cmp1 = icmp ne i8* %2, null, !dbg !27
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !28

if.then2:                                         ; preds = %if.end
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !29
  %arrayidx3 = getelementptr inbounds i8*, i8** %3, i64 0, !dbg !29
  store i8* null, i8** %arrayidx3, align 8, !dbg !31
  store i32 0, i32* %argc.addr, align 4, !dbg !32
  br label %if.end4, !dbg !33

if.end4:                                          ; preds = %if.then2, %if.end
  %4 = load i32, i32* %argc.addr, align 4, !dbg !34
  %add = add nsw i32 %4, 1, !dbg !35
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !36
  %call = call i32 @main(i32 %add, i8** %5), !dbg !37
  store i32 %call, i32* %argc.addr, align 4, !dbg !38
  %6 = load i32, i32* %argc.addr, align 4, !dbg !39
  %7 = load i32, i32* %argc.addr, align 4, !dbg !40
  %cmp5 = icmp eq i32 %7, 1, !dbg !41
  %8 = zext i1 %cmp5 to i64, !dbg !40
  %cond = select i1 %cmp5, i32 0, i32 115, !dbg !40
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i64 0, i64 0), i32 %6, i32 %cond), !dbg !42
  %9 = load i32, i32* %argc.addr, align 4, !dbg !43
  %10 = load i32, i32* %argc.addr, align 4, !dbg !44
  %cmp7 = icmp eq i32 %10, 1, !dbg !45
  %11 = zext i1 %cmp7 to i64, !dbg !44
  %cond8 = select i1 %cmp7, i32 0, i32 115, !dbg !44
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), i32 %9, i32 %cond8), !dbg !46
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0)), !dbg !47
  %12 = load i32, i32* %argc.addr, align 4, !dbg !48
  %sub = sub nsw i32 %12, 1, !dbg !49
  %13 = load i32, i32* %argc.addr, align 4, !dbg !50
  %sub11 = sub nsw i32 %13, 1, !dbg !51
  %cmp12 = icmp eq i32 %sub11, 1, !dbg !52
  %14 = zext i1 %cmp12 to i64, !dbg !53
  %cond13 = select i1 %cmp12, i32 0, i32 115, !dbg !53
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %cond13), !dbg !54
  %15 = load i32, i32* %argc.addr, align 4, !dbg !55
  %sub15 = sub nsw i32 %15, 1, !dbg !56
  store i32 %sub15, i32* %retval, align 4, !dbg !57
  br label %return, !dbg !57

return:                                           ; preds = %if.end4, %if.then
  %16 = load i32, i32* %retval, align 4, !dbg !58
  ret i32 %16, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

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
!17 = !DILocation(line: 3, column: 14, scope: !9)
!18 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !1, line: 3, type: !13)
!19 = !DILocation(line: 3, column: 26, scope: !9)
!20 = !DILocation(line: 5, column: 12, scope: !21)
!21 = distinct !DILexicalBlock(scope: !9, file: !1, line: 5, column: 12)
!22 = !DILocation(line: 5, column: 17, scope: !21)
!23 = !DILocation(line: 5, column: 12, scope: !9)
!24 = !DILocation(line: 6, column: 17, scope: !21)
!25 = !DILocation(line: 7, column: 12, scope: !26)
!26 = distinct !DILexicalBlock(scope: !9, file: !1, line: 7, column: 12)
!27 = !DILocation(line: 7, column: 20, scope: !26)
!28 = !DILocation(line: 7, column: 12, scope: !9)
!29 = !DILocation(line: 8, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 7, column: 28)
!31 = !DILocation(line: 8, column: 25, scope: !30)
!32 = !DILocation(line: 9, column: 22, scope: !30)
!33 = !DILocation(line: 10, column: 9, scope: !30)
!34 = !DILocation(line: 11, column: 21, scope: !9)
!35 = !DILocation(line: 11, column: 26, scope: !9)
!36 = !DILocation(line: 11, column: 31, scope: !9)
!37 = !DILocation(line: 11, column: 16, scope: !9)
!38 = !DILocation(line: 11, column: 14, scope: !9)
!39 = !DILocation(line: 12, column: 53, scope: !9)
!40 = !DILocation(line: 12, column: 59, scope: !9)
!41 = !DILocation(line: 12, column: 64, scope: !9)
!42 = !DILocation(line: 12, column: 9, scope: !9)
!43 = !DILocation(line: 13, column: 41, scope: !9)
!44 = !DILocation(line: 13, column: 47, scope: !9)
!45 = !DILocation(line: 13, column: 52, scope: !9)
!46 = !DILocation(line: 13, column: 9, scope: !9)
!47 = !DILocation(line: 14, column: 9, scope: !9)
!48 = !DILocation(line: 15, column: 55, scope: !9)
!49 = !DILocation(line: 15, column: 60, scope: !9)
!50 = !DILocation(line: 15, column: 66, scope: !9)
!51 = !DILocation(line: 15, column: 71, scope: !9)
!52 = !DILocation(line: 15, column: 76, scope: !9)
!53 = !DILocation(line: 15, column: 65, scope: !9)
!54 = !DILocation(line: 15, column: 9, scope: !9)
!55 = !DILocation(line: 16, column: 16, scope: !9)
!56 = !DILocation(line: 16, column: 21, scope: !9)
!57 = !DILocation(line: 16, column: 9, scope: !9)
!58 = !DILocation(line: 17, column: 1, scope: !9)
