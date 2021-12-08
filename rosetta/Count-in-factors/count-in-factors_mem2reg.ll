; ModuleID = 'count-in-factors.ll'
source_filename = "count-in-factors.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@get_prime.n_primes = internal global i64 0, align 8, !dbg !0
@get_prime.alloc = internal global i64 0, align 8, !dbg !12
@get_prime.primes = internal global i64* null, align 8, !dbg !15
@.str = private unnamed_addr constant [8 x i8] c"%lld = \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" x \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c" x %lld\0A\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @get_prime(i32 %idx) #0 !dbg !2 {
entry:
  call void @llvm.dbg.value(metadata i32 %idx, metadata !22, metadata !DIExpression()), !dbg !23
  %conv = sext i32 %idx to i64, !dbg !24
  %0 = load i64, i64* @get_prime.n_primes, align 8, !dbg !26
  %cmp = icmp sge i64 %conv, %0, !dbg !27
  br i1 %cmp, label %if.then, label %if.end28, !dbg !28

if.then:                                          ; preds = %entry
  %1 = load i64, i64* @get_prime.n_primes, align 8, !dbg !29
  %2 = load i64, i64* @get_prime.alloc, align 8, !dbg !32
  %cmp2 = icmp sge i64 %1, %2, !dbg !33
  br i1 %cmp2, label %if.then4, label %if.end, !dbg !34

if.then4:                                         ; preds = %if.then
  %3 = load i64, i64* @get_prime.alloc, align 8, !dbg !35
  %add = add nsw i64 %3, 16, !dbg !35
  store i64 %add, i64* @get_prime.alloc, align 8, !dbg !35
  %4 = load i64*, i64** @get_prime.primes, align 8, !dbg !37
  %5 = bitcast i64* %4 to i8*, !dbg !37
  %6 = load i64, i64* @get_prime.alloc, align 8, !dbg !38
  %mul = mul i64 8, %6, !dbg !39
  %call = call i8* @realloc(i8* %5, i64 %mul) #4, !dbg !40
  %7 = bitcast i8* %call to i64*, !dbg !40
  store i64* %7, i64** @get_prime.primes, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then4, %if.then
  %8 = load i64, i64* @get_prime.n_primes, align 8, !dbg !43
  %tobool = icmp ne i64 %8, 0, !dbg !43
  br i1 %tobool, label %if.end7, label %if.then5, !dbg !45

if.then5:                                         ; preds = %if.end
  %9 = load i64*, i64** @get_prime.primes, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !46
  store i64 2, i64* %arrayidx, align 8, !dbg !48
  %10 = load i64*, i64** @get_prime.primes, align 8, !dbg !49
  %arrayidx6 = getelementptr inbounds i64, i64* %10, i64 1, !dbg !49
  store i64 3, i64* %arrayidx6, align 8, !dbg !50
  store i64 2, i64* @get_prime.n_primes, align 8, !dbg !51
  br label %if.end7, !dbg !52

if.end7:                                          ; preds = %if.then5, %if.end
  %11 = load i64*, i64** @get_prime.primes, align 8, !dbg !53
  %12 = load i64, i64* @get_prime.n_primes, align 8, !dbg !54
  %sub = sub nsw i64 %12, 1, !dbg !55
  %arrayidx8 = getelementptr inbounds i64, i64* %11, i64 %sub, !dbg !53
  %13 = load i64, i64* %arrayidx8, align 8, !dbg !53
  call void @llvm.dbg.value(metadata i64 %13, metadata !56, metadata !DIExpression()), !dbg !23
  br label %while.cond, !dbg !57

while.cond:                                       ; preds = %for.end, %if.end7
  %last.0 = phi i64 [ %13, %if.end7 ], [ %add12, %for.end ], !dbg !58
  call void @llvm.dbg.value(metadata i64 %last.0, metadata !56, metadata !DIExpression()), !dbg !23
  %conv9 = sext i32 %idx to i64, !dbg !59
  %14 = load i64, i64* @get_prime.n_primes, align 8, !dbg !60
  %cmp10 = icmp sge i64 %conv9, %14, !dbg !61
  br i1 %cmp10, label %while.body, label %while.end, !dbg !57

while.body:                                       ; preds = %while.cond
  %add12 = add i64 %last.0, 2, !dbg !62
  call void @llvm.dbg.value(metadata i64 %add12, metadata !56, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 0, metadata !64, metadata !DIExpression()), !dbg !23
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc27, %for.inc ], !dbg !67
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !64, metadata !DIExpression()), !dbg !23
  %conv13 = sext i32 %i.0 to i64, !dbg !68
  %15 = load i64, i64* @get_prime.n_primes, align 8, !dbg !70
  %cmp14 = icmp slt i64 %conv13, %15, !dbg !71
  br i1 %cmp14, label %for.body, label %for.end.loopexit, !dbg !72

for.body:                                         ; preds = %for.cond
  %16 = load i64*, i64** @get_prime.primes, align 8, !dbg !73
  %idxprom = sext i32 %i.0 to i64, !dbg !73
  %arrayidx16 = getelementptr inbounds i64, i64* %16, i64 %idxprom, !dbg !73
  %17 = load i64, i64* %arrayidx16, align 8, !dbg !73
  call void @llvm.dbg.value(metadata i64 %17, metadata !75, metadata !DIExpression()), !dbg !23
  %mul17 = mul i64 %17, %17, !dbg !76
  %cmp18 = icmp ugt i64 %mul17, %add12, !dbg !78
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !79

if.then20:                                        ; preds = %for.body
  %18 = load i64*, i64** @get_prime.primes, align 8, !dbg !80
  %19 = load i64, i64* @get_prime.n_primes, align 8, !dbg !82
  %inc = add nsw i64 %19, 1, !dbg !82
  store i64 %inc, i64* @get_prime.n_primes, align 8, !dbg !82
  %arrayidx21 = getelementptr inbounds i64, i64* %18, i64 %19, !dbg !80
  store i64 %add12, i64* %arrayidx21, align 8, !dbg !83
  br label %for.end, !dbg !84

if.end22:                                         ; preds = %for.body
  %rem = urem i64 %add12, %17, !dbg !85
  %cmp23 = icmp eq i64 %rem, 0, !dbg !87
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !88

if.then25:                                        ; preds = %if.end22
  br label %for.end, !dbg !89

if.end26:                                         ; preds = %if.end22
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %if.end26
  %inc27 = add nsw i32 %i.0, 1, !dbg !91
  call void @llvm.dbg.value(metadata i32 %inc27, metadata !64, metadata !DIExpression()), !dbg !23
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end, !dbg !57

for.end:                                          ; preds = %for.end.loopexit, %if.then25, %if.then20
  br label %while.cond, !dbg !57, !llvm.loop !95

while.end:                                        ; preds = %while.cond
  br label %if.end28, !dbg !97

if.end28:                                         ; preds = %while.end, %entry
  %20 = load i64*, i64** @get_prime.primes, align 8, !dbg !98
  %idxprom29 = sext i32 %idx to i64, !dbg !98
  %arrayidx30 = getelementptr inbounds i64, i64* %20, i64 %idxprom29, !dbg !98
  %21 = load i64, i64* %arrayidx30, align 8, !dbg !98
  ret i64 %21, !dbg !99
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !100 {
entry:
  call void @llvm.dbg.value(metadata i64 1, metadata !103, metadata !DIExpression()), !dbg !104
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc18, %entry
  %x.0 = phi i64 [ 1, %entry ], [ %inc19, %for.inc18 ], !dbg !107
  call void @llvm.dbg.value(metadata i64 %x.0, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i64 %x.0, metadata !108, metadata !DIExpression()), !dbg !104
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i64 %x.0), !dbg !109
  call void @llvm.dbg.value(metadata i32 0, metadata !112, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 1, metadata !113, metadata !DIExpression()), !dbg !104
  br label %for.cond1, !dbg !114

for.cond1:                                        ; preds = %for.inc, %for.cond
  %i.0 = phi i32 [ 0, %for.cond ], [ %inc, %for.inc ], !dbg !116
  %n.0 = phi i64 [ %x.0, %for.cond ], [ %n.1, %for.inc ], !dbg !117
  %first.0 = phi i32 [ 1, %for.cond ], [ %first.1, %for.inc ], !dbg !118
  call void @llvm.dbg.value(metadata i32 %first.0, metadata !113, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i64 %n.0, metadata !108, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !112, metadata !DIExpression()), !dbg !104
  %call2 = call i64 @get_prime(i32 %i.0), !dbg !119
  call void @llvm.dbg.value(metadata i64 %call2, metadata !122, metadata !DIExpression()), !dbg !104
  br label %while.cond, !dbg !123

while.cond:                                       ; preds = %if.end, %for.cond1
  %n.1 = phi i64 [ %n.0, %for.cond1 ], [ %div, %if.end ], !dbg !124
  %first.1 = phi i32 [ %first.0, %for.cond1 ], [ 0, %if.end ], !dbg !116
  call void @llvm.dbg.value(metadata i32 %first.1, metadata !113, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i64 %n.1, metadata !108, metadata !DIExpression()), !dbg !104
  %rem = urem i64 %n.1, %call2, !dbg !125
  %cmp = icmp eq i64 %rem, 0, !dbg !126
  br i1 %cmp, label %while.body, label %while.end, !dbg !123

while.body:                                       ; preds = %while.cond
  %div = udiv i64 %n.1, %call2, !dbg !127
  call void @llvm.dbg.value(metadata i64 %div, metadata !108, metadata !DIExpression()), !dbg !104
  %tobool = icmp ne i32 %first.1, 0, !dbg !129
  br i1 %tobool, label %if.end, label %if.then, !dbg !131

if.then:                                          ; preds = %while.body
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !132
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %while.body
  call void @llvm.dbg.value(metadata i32 0, metadata !113, metadata !DIExpression()), !dbg !104
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %call2), !dbg !133
  br label %while.cond, !dbg !123, !llvm.loop !134

while.end:                                        ; preds = %while.cond
  %mul = mul i64 %call2, %call2, !dbg !136
  %cmp5 = icmp ule i64 %n.1, %mul, !dbg !138
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !139

if.then6:                                         ; preds = %while.end
  br label %for.end, !dbg !140

if.end7:                                          ; preds = %while.end
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %if.end7
  %inc = add nsw i32 %i.0, 1, !dbg !142
  call void @llvm.dbg.value(metadata i32 %inc, metadata !112, metadata !DIExpression()), !dbg !104
  br label %for.cond1, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %if.then6
  %tobool8 = icmp ne i32 %first.1, 0, !dbg !147
  br i1 %tobool8, label %if.then9, label %if.else, !dbg !149

if.then9:                                         ; preds = %for.end
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 %n.1), !dbg !150
  br label %if.end17, !dbg !150

if.else:                                          ; preds = %for.end
  %cmp11 = icmp ugt i64 %n.1, 1, !dbg !151
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !153

if.then12:                                        ; preds = %if.else
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), i64 %n.1), !dbg !154
  br label %if.end16, !dbg !154

if.else14:                                        ; preds = %if.else
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !155
  br label %if.end16

if.end16:                                         ; preds = %if.else14, %if.then12
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then9
  br label %for.inc18, !dbg !156

for.inc18:                                        ; preds = %if.end17
  %inc19 = add i64 %x.0, 1, !dbg !157
  call void @llvm.dbg.value(metadata i64 %inc19, metadata !103, metadata !DIExpression()), !dbg !104
  br label %for.cond, !dbg !158, !llvm.loop !159
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!9}
!llvm.module.flags = !{!18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "n_primes", scope: !2, file: !3, line: 8, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "get_prime", scope: !3, file: !3, line: 6, type: !4, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!3 = !DIFile(filename: "count-in-factors.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Count-in-factors")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "ULONG", file: !3, line: 4, baseType: !7)
!7 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, globals: !11, splitDebugInlining: false, nameTableKind: None)
!10 = !{}
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "alloc", scope: !2, file: !3, line: 8, type: !14, isLocal: true, isDefinition: true)
!14 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "primes", scope: !2, file: !3, line: 9, type: !17, isLocal: true, isDefinition: true)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!22 = !DILocalVariable(name: "idx", arg: 1, scope: !2, file: !3, line: 6, type: !8)
!23 = !DILocation(line: 0, scope: !2)
!24 = !DILocation(line: 13, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !2, file: !3, line: 13, column: 13)
!26 = !DILocation(line: 13, column: 20, scope: !25)
!27 = !DILocation(line: 13, column: 17, scope: !25)
!28 = !DILocation(line: 13, column: 13, scope: !2)
!29 = !DILocation(line: 14, column: 21, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !3, line: 14, column: 21)
!31 = distinct !DILexicalBlock(scope: !25, file: !3, line: 13, column: 30)
!32 = !DILocation(line: 14, column: 33, scope: !30)
!33 = !DILocation(line: 14, column: 30, scope: !30)
!34 = !DILocation(line: 14, column: 21, scope: !31)
!35 = !DILocation(line: 15, column: 31, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !3, line: 14, column: 40)
!37 = !DILocation(line: 16, column: 42, scope: !36)
!38 = !DILocation(line: 16, column: 66, scope: !36)
!39 = !DILocation(line: 16, column: 64, scope: !36)
!40 = !DILocation(line: 16, column: 34, scope: !36)
!41 = !DILocation(line: 16, column: 32, scope: !36)
!42 = !DILocation(line: 17, column: 17, scope: !36)
!43 = !DILocation(line: 18, column: 22, scope: !44)
!44 = distinct !DILexicalBlock(scope: !31, file: !3, line: 18, column: 21)
!45 = !DILocation(line: 18, column: 21, scope: !31)
!46 = !DILocation(line: 19, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !3, line: 18, column: 32)
!48 = !DILocation(line: 19, column: 35, scope: !47)
!49 = !DILocation(line: 20, column: 25, scope: !47)
!50 = !DILocation(line: 20, column: 35, scope: !47)
!51 = !DILocation(line: 21, column: 34, scope: !47)
!52 = !DILocation(line: 22, column: 17, scope: !47)
!53 = !DILocation(line: 24, column: 24, scope: !31)
!54 = !DILocation(line: 24, column: 31, scope: !31)
!55 = !DILocation(line: 24, column: 39, scope: !31)
!56 = !DILocalVariable(name: "last", scope: !2, file: !3, line: 10, type: !6)
!57 = !DILocation(line: 25, column: 17, scope: !31)
!58 = !DILocation(line: 0, scope: !31)
!59 = !DILocation(line: 25, column: 24, scope: !31)
!60 = !DILocation(line: 25, column: 31, scope: !31)
!61 = !DILocation(line: 25, column: 28, scope: !31)
!62 = !DILocation(line: 26, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !31, file: !3, line: 25, column: 41)
!64 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 11, type: !8)
!65 = !DILocation(line: 27, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !3, line: 27, column: 25)
!67 = !DILocation(line: 0, scope: !66)
!68 = !DILocation(line: 27, column: 37, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !3, line: 27, column: 25)
!70 = !DILocation(line: 27, column: 41, scope: !69)
!71 = !DILocation(line: 27, column: 39, scope: !69)
!72 = !DILocation(line: 27, column: 25, scope: !66)
!73 = !DILocation(line: 28, column: 37, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !3, line: 27, column: 56)
!75 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 10, type: !6)
!76 = !DILocation(line: 29, column: 39, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !3, line: 29, column: 37)
!78 = !DILocation(line: 29, column: 43, scope: !77)
!79 = !DILocation(line: 29, column: 37, scope: !74)
!80 = !DILocation(line: 30, column: 41, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !3, line: 29, column: 51)
!82 = !DILocation(line: 30, column: 56, scope: !81)
!83 = !DILocation(line: 30, column: 60, scope: !81)
!84 = !DILocation(line: 31, column: 41, scope: !81)
!85 = !DILocation(line: 33, column: 42, scope: !86)
!86 = distinct !DILexicalBlock(scope: !74, file: !3, line: 33, column: 37)
!87 = !DILocation(line: 33, column: 46, scope: !86)
!88 = !DILocation(line: 33, column: 37, scope: !74)
!89 = !DILocation(line: 33, column: 52, scope: !86)
!90 = !DILocation(line: 34, column: 25, scope: !74)
!91 = !DILocation(line: 27, column: 52, scope: !69)
!92 = !DILocation(line: 27, column: 25, scope: !69)
!93 = distinct !{!93, !72, !94}
!94 = !DILocation(line: 34, column: 25, scope: !66)
!95 = distinct !{!95, !57, !96}
!96 = !DILocation(line: 35, column: 17, scope: !31)
!97 = !DILocation(line: 36, column: 9, scope: !31)
!98 = !DILocation(line: 37, column: 16, scope: !2)
!99 = !DILocation(line: 37, column: 9, scope: !2)
!100 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 40, type: !101, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!101 = !DISubroutineType(types: !102)
!102 = !{!8}
!103 = !DILocalVariable(name: "x", scope: !100, file: !3, line: 42, type: !6)
!104 = !DILocation(line: 0, scope: !100)
!105 = !DILocation(line: 45, column: 14, scope: !106)
!106 = distinct !DILexicalBlock(scope: !100, file: !3, line: 45, column: 9)
!107 = !DILocation(line: 0, scope: !106)
!108 = !DILocalVariable(name: "n", scope: !100, file: !3, line: 42, type: !6)
!109 = !DILocation(line: 46, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !3, line: 45, column: 28)
!111 = distinct !DILexicalBlock(scope: !106, file: !3, line: 45, column: 9)
!112 = !DILocalVariable(name: "i", scope: !100, file: !3, line: 43, type: !8)
!113 = !DILocalVariable(name: "first", scope: !100, file: !3, line: 43, type: !8)
!114 = !DILocation(line: 48, column: 22, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !3, line: 48, column: 17)
!116 = !DILocation(line: 0, scope: !115)
!117 = !DILocation(line: 46, column: 37, scope: !110)
!118 = !DILocation(line: 48, column: 35, scope: !115)
!119 = !DILocation(line: 49, column: 29, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !3, line: 48, column: 47)
!121 = distinct !DILexicalBlock(scope: !115, file: !3, line: 48, column: 17)
!122 = !DILocalVariable(name: "p", scope: !100, file: !3, line: 42, type: !6)
!123 = !DILocation(line: 50, column: 25, scope: !120)
!124 = !DILocation(line: 0, scope: !110)
!125 = !DILocation(line: 50, column: 34, scope: !120)
!126 = !DILocation(line: 50, column: 38, scope: !120)
!127 = !DILocation(line: 51, column: 35, scope: !128)
!128 = distinct !DILexicalBlock(scope: !120, file: !3, line: 50, column: 44)
!129 = !DILocation(line: 52, column: 38, scope: !130)
!130 = distinct !DILexicalBlock(scope: !128, file: !3, line: 52, column: 37)
!131 = !DILocation(line: 52, column: 37, scope: !128)
!132 = !DILocation(line: 52, column: 45, scope: !130)
!133 = !DILocation(line: 54, column: 33, scope: !128)
!134 = distinct !{!134, !123, !135}
!135 = !DILocation(line: 55, column: 25, scope: !120)
!136 = !DILocation(line: 56, column: 36, scope: !137)
!137 = distinct !DILexicalBlock(scope: !120, file: !3, line: 56, column: 29)
!138 = !DILocation(line: 56, column: 31, scope: !137)
!139 = !DILocation(line: 56, column: 29, scope: !120)
!140 = !DILocation(line: 56, column: 41, scope: !137)
!141 = !DILocation(line: 57, column: 17, scope: !120)
!142 = !DILocation(line: 48, column: 43, scope: !121)
!143 = !DILocation(line: 48, column: 17, scope: !121)
!144 = distinct !{!144, !145, !146}
!145 = !DILocation(line: 48, column: 17, scope: !115)
!146 = !DILocation(line: 57, column: 17, scope: !115)
!147 = !DILocation(line: 59, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !110, file: !3, line: 59, column: 21)
!149 = !DILocation(line: 59, column: 21, scope: !110)
!150 = !DILocation(line: 59, column: 33, scope: !148)
!151 = !DILocation(line: 60, column: 28, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 60, column: 26)
!153 = !DILocation(line: 60, column: 26, scope: !148)
!154 = !DILocation(line: 60, column: 33, scope: !152)
!155 = !DILocation(line: 61, column: 33, scope: !152)
!156 = !DILocation(line: 62, column: 9, scope: !110)
!157 = !DILocation(line: 45, column: 24, scope: !111)
!158 = !DILocation(line: 45, column: 9, scope: !111)
!159 = distinct !{!159, !160, !161}
!160 = !DILocation(line: 45, column: 9, scope: !106)
!161 = !DILocation(line: 62, column: 9, scope: !106)
