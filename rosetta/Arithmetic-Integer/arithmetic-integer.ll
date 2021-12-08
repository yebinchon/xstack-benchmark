; ModuleID = 'arithmetic-integer.ll'
source_filename = "arithmetic-integer.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"a+b = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"a-b = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"a*b = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"a/b = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"a%%b = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %a, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %b, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32, i32* %argc.addr, align 4, !dbg !22
  %cmp = icmp slt i32 %0, 3, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 1) #5, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !27
  %2 = load i32, i32* %argc.addr, align 4, !dbg !28
  %dec = add nsw i32 %2, -1, !dbg !28
  store i32 %dec, i32* %argc.addr, align 4, !dbg !28
  %idxprom = sext i32 %dec to i64, !dbg !27
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 %idxprom, !dbg !27
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !27
  %call = call i32 @atoi(i8* %3) #6, !dbg !29
  store i32 %call, i32* %b, align 4, !dbg !30
  %4 = load i32, i32* %b, align 4, !dbg !31
  %cmp1 = icmp eq i32 %4, 0, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !34

if.then2:                                         ; preds = %if.end
  call void @exit(i32 2) #5, !dbg !35
  unreachable, !dbg !35

if.end3:                                          ; preds = %if.end
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !36
  %6 = load i32, i32* %argc.addr, align 4, !dbg !37
  %dec4 = add nsw i32 %6, -1, !dbg !37
  store i32 %dec4, i32* %argc.addr, align 4, !dbg !37
  %idxprom5 = sext i32 %dec4 to i64, !dbg !36
  %arrayidx6 = getelementptr inbounds i8*, i8** %5, i64 %idxprom5, !dbg !36
  %7 = load i8*, i8** %arrayidx6, align 8, !dbg !36
  %call7 = call i32 @atoi(i8* %7) #6, !dbg !38
  store i32 %call7, i32* %a, align 4, !dbg !39
  %8 = load i32, i32* %a, align 4, !dbg !40
  %9 = load i32, i32* %b, align 4, !dbg !41
  %add = add nsw i32 %8, %9, !dbg !42
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %add), !dbg !43
  %10 = load i32, i32* %a, align 4, !dbg !44
  %11 = load i32, i32* %b, align 4, !dbg !45
  %sub = sub nsw i32 %10, %11, !dbg !46
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 %sub), !dbg !47
  %12 = load i32, i32* %a, align 4, !dbg !48
  %13 = load i32, i32* %b, align 4, !dbg !49
  %mul = mul nsw i32 %12, %13, !dbg !50
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i32 %mul), !dbg !51
  %14 = load i32, i32* %a, align 4, !dbg !52
  %15 = load i32, i32* %b, align 4, !dbg !53
  %div = sdiv i32 %14, %15, !dbg !54
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %div), !dbg !55
  %16 = load i32, i32* %a, align 4, !dbg !56
  %17 = load i32, i32* %b, align 4, !dbg !57
  %rem = srem i32 %16, %17, !dbg !58
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i32 %rem), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "arithmetic-integer.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arithmetic-Integer")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!15 = !DILocation(line: 4, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 4, type: !11)
!17 = !DILocation(line: 4, column: 26, scope: !7)
!18 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 6, type: !10)
!19 = !DILocation(line: 6, column: 7, scope: !7)
!20 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 6, type: !10)
!21 = !DILocation(line: 6, column: 10, scope: !7)
!22 = !DILocation(line: 7, column: 7, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 7)
!24 = !DILocation(line: 7, column: 12, scope: !23)
!25 = !DILocation(line: 7, column: 7, scope: !7)
!26 = !DILocation(line: 7, column: 17, scope: !23)
!27 = !DILocation(line: 8, column: 12, scope: !7)
!28 = !DILocation(line: 8, column: 17, scope: !7)
!29 = !DILocation(line: 8, column: 7, scope: !7)
!30 = !DILocation(line: 8, column: 5, scope: !7)
!31 = !DILocation(line: 9, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 7)
!33 = !DILocation(line: 9, column: 9, scope: !32)
!34 = !DILocation(line: 9, column: 7, scope: !7)
!35 = !DILocation(line: 9, column: 15, scope: !32)
!36 = !DILocation(line: 10, column: 12, scope: !7)
!37 = !DILocation(line: 10, column: 17, scope: !7)
!38 = !DILocation(line: 10, column: 7, scope: !7)
!39 = !DILocation(line: 10, column: 5, scope: !7)
!40 = !DILocation(line: 11, column: 24, scope: !7)
!41 = !DILocation(line: 11, column: 26, scope: !7)
!42 = !DILocation(line: 11, column: 25, scope: !7)
!43 = !DILocation(line: 11, column: 3, scope: !7)
!44 = !DILocation(line: 12, column: 24, scope: !7)
!45 = !DILocation(line: 12, column: 26, scope: !7)
!46 = !DILocation(line: 12, column: 25, scope: !7)
!47 = !DILocation(line: 12, column: 3, scope: !7)
!48 = !DILocation(line: 13, column: 24, scope: !7)
!49 = !DILocation(line: 13, column: 26, scope: !7)
!50 = !DILocation(line: 13, column: 25, scope: !7)
!51 = !DILocation(line: 13, column: 3, scope: !7)
!52 = !DILocation(line: 14, column: 24, scope: !7)
!53 = !DILocation(line: 14, column: 26, scope: !7)
!54 = !DILocation(line: 14, column: 25, scope: !7)
!55 = !DILocation(line: 14, column: 3, scope: !7)
!56 = !DILocation(line: 15, column: 25, scope: !7)
!57 = !DILocation(line: 15, column: 27, scope: !7)
!58 = !DILocation(line: 15, column: 26, scope: !7)
!59 = !DILocation(line: 15, column: 3, scope: !7)
!60 = !DILocation(line: 16, column: 3, scope: !7)
