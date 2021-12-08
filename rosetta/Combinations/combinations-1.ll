; ModuleID = 'combinations-1.bc'
source_filename = "combinations-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@one = dso_local global i64 1, align 8, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @comb(i32 %pool, i32 %need, i64 %chosen, i32 %at) #0 !dbg !12 {
entry:
  %pool.addr = alloca i32, align 4
  %need.addr = alloca i32, align 4
  %chosen.addr = alloca i64, align 8
  %at.addr = alloca i32, align 4
  store i32 %pool, i32* %pool.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pool.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 %need, i32* %need.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %need.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i64 %chosen, i64* %chosen.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %chosen.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %at, i32* %at.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %at.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* %pool.addr, align 4, !dbg !24
  %1 = load i32, i32* %need.addr, align 4, !dbg !26
  %2 = load i32, i32* %at.addr, align 4, !dbg !27
  %add = add nsw i32 %1, %2, !dbg !28
  %cmp = icmp slt i32 %0, %add, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  br label %return, !dbg !31

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %need.addr, align 4, !dbg !32
  %tobool = icmp ne i32 %3, 0, !dbg !32
  br i1 %tobool, label %if.end7, label %if.then1, !dbg !34

if.then1:                                         ; preds = %if.end
  store i32 0, i32* %at.addr, align 4, !dbg !35
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %at.addr, align 4, !dbg !39
  %5 = load i32, i32* %pool.addr, align 4, !dbg !41
  %cmp2 = icmp slt i32 %4, %5, !dbg !42
  br i1 %cmp2, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %chosen.addr, align 8, !dbg !44
  %7 = load i64, i64* @one, align 8, !dbg !46
  %8 = load i32, i32* %at.addr, align 4, !dbg !47
  %sh_prom = zext i32 %8 to i64, !dbg !48
  %shl = shl i64 %7, %sh_prom, !dbg !48
  %and = and i64 %6, %shl, !dbg !49
  %tobool3 = icmp ne i64 %and, 0, !dbg !49
  br i1 %tobool3, label %if.then4, label %if.end5, !dbg !50

if.then4:                                         ; preds = %for.body
  %9 = load i32, i32* %at.addr, align 4, !dbg !51
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %9), !dbg !52
  br label %if.end5, !dbg !52

if.end5:                                          ; preds = %if.then4, %for.body
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %if.end5
  %10 = load i32, i32* %at.addr, align 4, !dbg !54
  %inc = add nsw i32 %10, 1, !dbg !54
  store i32 %inc, i32* %at.addr, align 4, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  br label %return, !dbg !59

if.end7:                                          ; preds = %if.end
  %11 = load i32, i32* %pool.addr, align 4, !dbg !60
  %12 = load i32, i32* %need.addr, align 4, !dbg !61
  %sub = sub nsw i32 %12, 1, !dbg !62
  %13 = load i64, i64* %chosen.addr, align 8, !dbg !63
  %14 = load i64, i64* @one, align 8, !dbg !64
  %15 = load i32, i32* %at.addr, align 4, !dbg !65
  %sh_prom8 = zext i32 %15 to i64, !dbg !66
  %shl9 = shl i64 %14, %sh_prom8, !dbg !66
  %or = or i64 %13, %shl9, !dbg !67
  %16 = load i32, i32* %at.addr, align 4, !dbg !68
  %add10 = add nsw i32 %16, 1, !dbg !69
  call void @comb(i32 %11, i32 %sub, i64 %or, i32 %add10), !dbg !70
  %17 = load i32, i32* %pool.addr, align 4, !dbg !71
  %18 = load i32, i32* %need.addr, align 4, !dbg !72
  %19 = load i64, i64* %chosen.addr, align 8, !dbg !73
  %20 = load i32, i32* %at.addr, align 4, !dbg !74
  %add11 = add nsw i32 %20, 1, !dbg !75
  call void @comb(i32 %17, i32 %18, i64 %19, i32 %add11), !dbg !76
  br label %return, !dbg !77

return:                                           ; preds = %if.end7, %for.end, %if.then
  ret void, !dbg !77
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @comb(i32 5, i32 3, i64 0, i32 0), !dbg !81
  ret i32 0, !dbg !82
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "one", scope: !2, file: !3, line: 6, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "combinations-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Combinations")
!4 = !{}
!5 = !{!0}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "marker", file: !3, line: 5, baseType: !7)
!7 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!12 = distinct !DISubprogram(name: "comb", scope: !3, file: !3, line: 8, type: !13, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15, !15, !6, !15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "pool", arg: 1, scope: !12, file: !3, line: 8, type: !15)
!17 = !DILocation(line: 8, column: 15, scope: !12)
!18 = !DILocalVariable(name: "need", arg: 2, scope: !12, file: !3, line: 8, type: !15)
!19 = !DILocation(line: 8, column: 25, scope: !12)
!20 = !DILocalVariable(name: "chosen", arg: 3, scope: !12, file: !3, line: 8, type: !6)
!21 = !DILocation(line: 8, column: 38, scope: !12)
!22 = !DILocalVariable(name: "at", arg: 4, scope: !12, file: !3, line: 8, type: !15)
!23 = !DILocation(line: 8, column: 50, scope: !12)
!24 = !DILocation(line: 10, column: 6, scope: !25)
!25 = distinct !DILexicalBlock(scope: !12, file: !3, line: 10, column: 6)
!26 = !DILocation(line: 10, column: 13, scope: !25)
!27 = !DILocation(line: 10, column: 20, scope: !25)
!28 = !DILocation(line: 10, column: 18, scope: !25)
!29 = !DILocation(line: 10, column: 11, scope: !25)
!30 = !DILocation(line: 10, column: 6, scope: !12)
!31 = !DILocation(line: 10, column: 24, scope: !25)
!32 = !DILocation(line: 12, column: 7, scope: !33)
!33 = distinct !DILexicalBlock(scope: !12, file: !3, line: 12, column: 6)
!34 = !DILocation(line: 12, column: 6, scope: !12)
!35 = !DILocation(line: 15, column: 11, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 15, column: 3)
!37 = distinct !DILexicalBlock(scope: !33, file: !3, line: 12, column: 13)
!38 = !DILocation(line: 15, column: 8, scope: !36)
!39 = !DILocation(line: 15, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !3, line: 15, column: 3)
!41 = !DILocation(line: 15, column: 21, scope: !40)
!42 = !DILocation(line: 15, column: 19, scope: !40)
!43 = !DILocation(line: 15, column: 3, scope: !36)
!44 = !DILocation(line: 16, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !3, line: 16, column: 8)
!46 = !DILocation(line: 16, column: 18, scope: !45)
!47 = !DILocation(line: 16, column: 25, scope: !45)
!48 = !DILocation(line: 16, column: 22, scope: !45)
!49 = !DILocation(line: 16, column: 15, scope: !45)
!50 = !DILocation(line: 16, column: 8, scope: !40)
!51 = !DILocation(line: 16, column: 44, scope: !45)
!52 = !DILocation(line: 16, column: 30, scope: !45)
!53 = !DILocation(line: 16, column: 27, scope: !45)
!54 = !DILocation(line: 15, column: 29, scope: !40)
!55 = !DILocation(line: 15, column: 3, scope: !40)
!56 = distinct !{!56, !43, !57}
!57 = !DILocation(line: 16, column: 46, scope: !36)
!58 = !DILocation(line: 17, column: 3, scope: !37)
!59 = !DILocation(line: 18, column: 3, scope: !37)
!60 = !DILocation(line: 21, column: 7, scope: !12)
!61 = !DILocation(line: 21, column: 13, scope: !12)
!62 = !DILocation(line: 21, column: 18, scope: !12)
!63 = !DILocation(line: 21, column: 23, scope: !12)
!64 = !DILocation(line: 21, column: 33, scope: !12)
!65 = !DILocation(line: 21, column: 40, scope: !12)
!66 = !DILocation(line: 21, column: 37, scope: !12)
!67 = !DILocation(line: 21, column: 30, scope: !12)
!68 = !DILocation(line: 21, column: 45, scope: !12)
!69 = !DILocation(line: 21, column: 48, scope: !12)
!70 = !DILocation(line: 21, column: 2, scope: !12)
!71 = !DILocation(line: 22, column: 7, scope: !12)
!72 = !DILocation(line: 22, column: 13, scope: !12)
!73 = !DILocation(line: 22, column: 19, scope: !12)
!74 = !DILocation(line: 22, column: 27, scope: !12)
!75 = !DILocation(line: 22, column: 30, scope: !12)
!76 = !DILocation(line: 22, column: 2, scope: !12)
!77 = !DILocation(line: 23, column: 1, scope: !12)
!78 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 25, type: !79, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!15}
!81 = !DILocation(line: 27, column: 2, scope: !78)
!82 = !DILocation(line: 28, column: 2, scope: !78)
