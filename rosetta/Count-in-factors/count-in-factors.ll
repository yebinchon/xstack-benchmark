; ModuleID = 'count-in-factors.c'
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
  %idx.addr = alloca i32, align 4
  %last = alloca i64, align 8
  %p = alloca i64, align 8
  %i = alloca i32, align 4
  store i32 %idx, i32* %idx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %idx.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %last, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %p, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i32, i32* %idx.addr, align 4, !dbg !30
  %conv = sext i32 %0 to i64, !dbg !30
  %1 = load i64, i64* @get_prime.n_primes, align 8, !dbg !32
  %cmp = icmp sge i64 %conv, %1, !dbg !33
  br i1 %cmp, label %if.then, label %if.end28, !dbg !34, !cf.info !35

if.then:                                          ; preds = %entry
  %2 = load i64, i64* @get_prime.n_primes, align 8, !dbg !36
  %3 = load i64, i64* @get_prime.alloc, align 8, !dbg !39
  %cmp2 = icmp sge i64 %2, %3, !dbg !40
  br i1 %cmp2, label %if.then4, label %if.end, !dbg !41, !cf.info !35

if.then4:                                         ; preds = %if.then
  %4 = load i64, i64* @get_prime.alloc, align 8, !dbg !42
  %add = add nsw i64 %4, 16, !dbg !42
  store i64 %add, i64* @get_prime.alloc, align 8, !dbg !42
  %5 = load i64*, i64** @get_prime.primes, align 8, !dbg !44
  %6 = bitcast i64* %5 to i8*, !dbg !44
  %7 = load i64, i64* @get_prime.alloc, align 8, !dbg !45
  %mul = mul i64 8, %7, !dbg !46
  %call = call i8* @realloc(i8* %6, i64 %mul) #4, !dbg !47
  %8 = bitcast i8* %call to i64*, !dbg !47
  store i64* %8, i64** @get_prime.primes, align 8, !dbg !48
  br label %if.end, !dbg !49

if.end:                                           ; preds = %if.then4, %if.then
  %9 = load i64, i64* @get_prime.n_primes, align 8, !dbg !50
  %tobool = icmp ne i64 %9, 0, !dbg !50
  br i1 %tobool, label %if.end7, label %if.then5, !dbg !52, !cf.info !35

if.then5:                                         ; preds = %if.end
  %10 = load i64*, i64** @get_prime.primes, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !53
  store i64 2, i64* %arrayidx, align 8, !dbg !55
  %11 = load i64*, i64** @get_prime.primes, align 8, !dbg !56
  %arrayidx6 = getelementptr inbounds i64, i64* %11, i64 1, !dbg !56
  store i64 3, i64* %arrayidx6, align 8, !dbg !57
  store i64 2, i64* @get_prime.n_primes, align 8, !dbg !58
  br label %if.end7, !dbg !59

if.end7:                                          ; preds = %if.then5, %if.end
  %12 = load i64*, i64** @get_prime.primes, align 8, !dbg !60
  %13 = load i64, i64* @get_prime.n_primes, align 8, !dbg !61
  %sub = sub nsw i64 %13, 1, !dbg !62
  %arrayidx8 = getelementptr inbounds i64, i64* %12, i64 %sub, !dbg !60
  %14 = load i64, i64* %arrayidx8, align 8, !dbg !60
  store i64 %14, i64* %last, align 8, !dbg !63
  br label %while.cond, !dbg !64

while.cond:                                       ; preds = %for.end, %if.end7
  %15 = load i32, i32* %idx.addr, align 4, !dbg !65
  %conv9 = sext i32 %15 to i64, !dbg !65
  %16 = load i64, i64* @get_prime.n_primes, align 8, !dbg !66
  %cmp10 = icmp sge i64 %conv9, %16, !dbg !67
  br i1 %cmp10, label %while.body, label %while.end, !dbg !64

while.body:                                       ; preds = %while.cond
  %17 = load i64, i64* %last, align 8, !dbg !68
  %add12 = add i64 %17, 2, !dbg !68
  store i64 %add12, i64* %last, align 8, !dbg !68
  store i32 0, i32* %i, align 4, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %while.body
  %18 = load i32, i32* %i, align 4, !dbg !73
  %conv13 = sext i32 %18 to i64, !dbg !73
  %19 = load i64, i64* @get_prime.n_primes, align 8, !dbg !75
  %cmp14 = icmp slt i64 %conv13, %19, !dbg !76
  br i1 %cmp14, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %20 = load i64*, i64** @get_prime.primes, align 8, !dbg !78
  %21 = load i32, i32* %i, align 4, !dbg !80
  %idxprom = sext i32 %21 to i64, !dbg !78
  %arrayidx16 = getelementptr inbounds i64, i64* %20, i64 %idxprom, !dbg !78
  %22 = load i64, i64* %arrayidx16, align 8, !dbg !78
  store i64 %22, i64* %p, align 8, !dbg !81
  %23 = load i64, i64* %p, align 8, !dbg !82
  %24 = load i64, i64* %p, align 8, !dbg !84
  %mul17 = mul i64 %23, %24, !dbg !85
  %25 = load i64, i64* %last, align 8, !dbg !86
  %cmp18 = icmp ugt i64 %mul17, %25, !dbg !87
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !88, !cf.info !35

if.then20:                                        ; preds = %for.body
  %26 = load i64, i64* %last, align 8, !dbg !89
  %27 = load i64*, i64** @get_prime.primes, align 8, !dbg !91
  %28 = load i64, i64* @get_prime.n_primes, align 8, !dbg !92
  %inc = add nsw i64 %28, 1, !dbg !92
  store i64 %inc, i64* @get_prime.n_primes, align 8, !dbg !92
  %arrayidx21 = getelementptr inbounds i64, i64* %27, i64 %28, !dbg !91
  store i64 %26, i64* %arrayidx21, align 8, !dbg !93
  br label %for.end, !dbg !94

if.end22:                                         ; preds = %for.body
  %29 = load i64, i64* %last, align 8, !dbg !95
  %30 = load i64, i64* %p, align 8, !dbg !97
  %rem = urem i64 %29, %30, !dbg !98
  %cmp23 = icmp eq i64 %rem, 0, !dbg !99
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !100, !cf.info !35

if.then25:                                        ; preds = %if.end22
  br label %for.end, !dbg !101

if.end26:                                         ; preds = %if.end22
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %if.end26
  %31 = load i32, i32* %i, align 4, !dbg !103
  %inc27 = add nsw i32 %31, 1, !dbg !103
  store i32 %inc27, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %if.then25, %if.then20, %for.cond
  br label %while.cond, !dbg !64, !llvm.loop !107

while.end:                                        ; preds = %while.cond
  br label %if.end28, !dbg !109

if.end28:                                         ; preds = %while.end, %entry
  %32 = load i64*, i64** @get_prime.primes, align 8, !dbg !110
  %33 = load i32, i32* %idx.addr, align 4, !dbg !111
  %idxprom29 = sext i32 %33 to i64, !dbg !110
  %arrayidx30 = getelementptr inbounds i64, i64* %32, i64 %idxprom29, !dbg !110
  %34 = load i64, i64* %arrayidx30, align 8, !dbg !110
  ret i64 %34, !dbg !112
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i64, align 8
  %x = alloca i64, align 8
  %p = alloca i64, align 8
  %i = alloca i32, align 4
  %first = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %n, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %x, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %p, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32* %i, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32* %first, metadata !124, metadata !DIExpression()), !dbg !125
  store i64 1, i64* %x, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc18, %entry
  %0 = load i64, i64* %x, align 8, !dbg !129
  store i64 %0, i64* %n, align 8, !dbg !132
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i64 %0), !dbg !133
  store i32 0, i32* %i, align 4, !dbg !134
  store i32 1, i32* %first, align 4, !dbg !136
  br label %for.cond1, !dbg !137

for.cond1:                                        ; preds = %for.inc, %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !138
  %call2 = call i64 @get_prime(i32 %1), !dbg !141
  store i64 %call2, i64* %p, align 8, !dbg !142
  br label %while.cond, !dbg !143

while.cond:                                       ; preds = %if.end, %for.cond1
  %2 = load i64, i64* %n, align 8, !dbg !144
  %3 = load i64, i64* %p, align 8, !dbg !145
  %rem = urem i64 %2, %3, !dbg !146
  %cmp = icmp eq i64 %rem, 0, !dbg !147
  br i1 %cmp, label %while.body, label %while.end, !dbg !143

while.body:                                       ; preds = %while.cond
  %4 = load i64, i64* %p, align 8, !dbg !148
  %5 = load i64, i64* %n, align 8, !dbg !150
  %div = udiv i64 %5, %4, !dbg !150
  store i64 %div, i64* %n, align 8, !dbg !150
  %6 = load i32, i32* %first, align 4, !dbg !151
  %tobool = icmp ne i32 %6, 0, !dbg !151
  br i1 %tobool, label %if.end, label %if.then, !dbg !153, !cf.info !35

if.then:                                          ; preds = %while.body
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !154
  br label %if.end, !dbg !154

if.end:                                           ; preds = %if.then, %while.body
  store i32 0, i32* %first, align 4, !dbg !155
  %7 = load i64, i64* %p, align 8, !dbg !156
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %7), !dbg !157
  br label %while.cond, !dbg !143, !llvm.loop !158

while.end:                                        ; preds = %while.cond
  %8 = load i64, i64* %n, align 8, !dbg !160
  %9 = load i64, i64* %p, align 8, !dbg !162
  %10 = load i64, i64* %p, align 8, !dbg !163
  %mul = mul i64 %9, %10, !dbg !164
  %cmp5 = icmp ule i64 %8, %mul, !dbg !165
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !166, !cf.info !35

if.then6:                                         ; preds = %while.end
  br label %for.end, !dbg !167

if.end7:                                          ; preds = %while.end
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %if.end7
  %11 = load i32, i32* %i, align 4, !dbg !169
  %inc = add nsw i32 %11, 1, !dbg !169
  store i32 %inc, i32* %i, align 4, !dbg !169
  br label %for.cond1, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %if.then6
  %12 = load i32, i32* %first, align 4, !dbg !174
  %tobool8 = icmp ne i32 %12, 0, !dbg !174
  br i1 %tobool8, label %if.then9, label %if.else, !dbg !176, !cf.info !35

if.then9:                                         ; preds = %for.end
  %13 = load i64, i64* %n, align 8, !dbg !177
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 %13), !dbg !178
  br label %if.end17, !dbg !178

if.else:                                          ; preds = %for.end
  %14 = load i64, i64* %n, align 8, !dbg !179
  %cmp11 = icmp ugt i64 %14, 1, !dbg !181
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !182, !cf.info !35

if.then12:                                        ; preds = %if.else
  %15 = load i64, i64* %n, align 8, !dbg !183
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), i64 %15), !dbg !184
  br label %if.end16, !dbg !184

if.else14:                                        ; preds = %if.else
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !185
  br label %if.end16

if.end16:                                         ; preds = %if.else14, %if.then12
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then9
  br label %for.inc18, !dbg !186

for.inc18:                                        ; preds = %if.end17
  %16 = load i64, i64* %x, align 8, !dbg !187
  %inc19 = add i64 %16, 1, !dbg !187
  store i64 %inc19, i64* %x, align 8, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189
}

declare dso_local i32 @printf(i8*, ...) #3

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
!9 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, globals: !11, splitDebugInlining: false, nameTableKind: None)
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
!21 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!22 = !DILocalVariable(name: "idx", arg: 1, scope: !2, file: !3, line: 6, type: !8)
!23 = !DILocation(line: 6, column: 21, scope: !2)
!24 = !DILocalVariable(name: "last", scope: !2, file: !3, line: 10, type: !6)
!25 = !DILocation(line: 10, column: 15, scope: !2)
!26 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 10, type: !6)
!27 = !DILocation(line: 10, column: 21, scope: !2)
!28 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 11, type: !8)
!29 = !DILocation(line: 11, column: 13, scope: !2)
!30 = !DILocation(line: 13, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !2, file: !3, line: 13, column: 13)
!32 = !DILocation(line: 13, column: 20, scope: !31)
!33 = !DILocation(line: 13, column: 17, scope: !31)
!34 = !DILocation(line: 13, column: 13, scope: !2)
!35 = !{!"if"}
!36 = !DILocation(line: 14, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !38, file: !3, line: 14, column: 21)
!38 = distinct !DILexicalBlock(scope: !31, file: !3, line: 13, column: 30)
!39 = !DILocation(line: 14, column: 33, scope: !37)
!40 = !DILocation(line: 14, column: 30, scope: !37)
!41 = !DILocation(line: 14, column: 21, scope: !38)
!42 = !DILocation(line: 15, column: 31, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !3, line: 14, column: 40)
!44 = !DILocation(line: 16, column: 42, scope: !43)
!45 = !DILocation(line: 16, column: 66, scope: !43)
!46 = !DILocation(line: 16, column: 64, scope: !43)
!47 = !DILocation(line: 16, column: 34, scope: !43)
!48 = !DILocation(line: 16, column: 32, scope: !43)
!49 = !DILocation(line: 17, column: 17, scope: !43)
!50 = !DILocation(line: 18, column: 22, scope: !51)
!51 = distinct !DILexicalBlock(scope: !38, file: !3, line: 18, column: 21)
!52 = !DILocation(line: 18, column: 21, scope: !38)
!53 = !DILocation(line: 19, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !3, line: 18, column: 32)
!55 = !DILocation(line: 19, column: 35, scope: !54)
!56 = !DILocation(line: 20, column: 25, scope: !54)
!57 = !DILocation(line: 20, column: 35, scope: !54)
!58 = !DILocation(line: 21, column: 34, scope: !54)
!59 = !DILocation(line: 22, column: 17, scope: !54)
!60 = !DILocation(line: 24, column: 24, scope: !38)
!61 = !DILocation(line: 24, column: 31, scope: !38)
!62 = !DILocation(line: 24, column: 39, scope: !38)
!63 = !DILocation(line: 24, column: 22, scope: !38)
!64 = !DILocation(line: 25, column: 17, scope: !38)
!65 = !DILocation(line: 25, column: 24, scope: !38)
!66 = !DILocation(line: 25, column: 31, scope: !38)
!67 = !DILocation(line: 25, column: 28, scope: !38)
!68 = !DILocation(line: 26, column: 30, scope: !69)
!69 = distinct !DILexicalBlock(scope: !38, file: !3, line: 25, column: 41)
!70 = !DILocation(line: 27, column: 32, scope: !71)
!71 = distinct !DILexicalBlock(scope: !69, file: !3, line: 27, column: 25)
!72 = !DILocation(line: 27, column: 30, scope: !71)
!73 = !DILocation(line: 27, column: 37, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !3, line: 27, column: 25)
!75 = !DILocation(line: 27, column: 41, scope: !74)
!76 = !DILocation(line: 27, column: 39, scope: !74)
!77 = !DILocation(line: 27, column: 25, scope: !71)
!78 = !DILocation(line: 28, column: 37, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !3, line: 27, column: 56)
!80 = !DILocation(line: 28, column: 44, scope: !79)
!81 = !DILocation(line: 28, column: 35, scope: !79)
!82 = !DILocation(line: 29, column: 37, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !3, line: 29, column: 37)
!84 = !DILocation(line: 29, column: 41, scope: !83)
!85 = !DILocation(line: 29, column: 39, scope: !83)
!86 = !DILocation(line: 29, column: 45, scope: !83)
!87 = !DILocation(line: 29, column: 43, scope: !83)
!88 = !DILocation(line: 29, column: 37, scope: !79)
!89 = !DILocation(line: 30, column: 62, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !3, line: 29, column: 51)
!91 = !DILocation(line: 30, column: 41, scope: !90)
!92 = !DILocation(line: 30, column: 56, scope: !90)
!93 = !DILocation(line: 30, column: 60, scope: !90)
!94 = !DILocation(line: 31, column: 41, scope: !90)
!95 = !DILocation(line: 33, column: 37, scope: !96)
!96 = distinct !DILexicalBlock(scope: !79, file: !3, line: 33, column: 37)
!97 = !DILocation(line: 33, column: 44, scope: !96)
!98 = !DILocation(line: 33, column: 42, scope: !96)
!99 = !DILocation(line: 33, column: 46, scope: !96)
!100 = !DILocation(line: 33, column: 37, scope: !79)
!101 = !DILocation(line: 33, column: 52, scope: !96)
!102 = !DILocation(line: 34, column: 25, scope: !79)
!103 = !DILocation(line: 27, column: 52, scope: !74)
!104 = !DILocation(line: 27, column: 25, scope: !74)
!105 = distinct !{!105, !77, !106}
!106 = !DILocation(line: 34, column: 25, scope: !71)
!107 = distinct !{!107, !64, !108}
!108 = !DILocation(line: 35, column: 17, scope: !38)
!109 = !DILocation(line: 36, column: 9, scope: !38)
!110 = !DILocation(line: 37, column: 16, scope: !2)
!111 = !DILocation(line: 37, column: 23, scope: !2)
!112 = !DILocation(line: 37, column: 9, scope: !2)
!113 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 40, type: !114, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!114 = !DISubroutineType(types: !115)
!115 = !{!8}
!116 = !DILocalVariable(name: "n", scope: !113, file: !3, line: 42, type: !6)
!117 = !DILocation(line: 42, column: 15, scope: !113)
!118 = !DILocalVariable(name: "x", scope: !113, file: !3, line: 42, type: !6)
!119 = !DILocation(line: 42, column: 18, scope: !113)
!120 = !DILocalVariable(name: "p", scope: !113, file: !3, line: 42, type: !6)
!121 = !DILocation(line: 42, column: 21, scope: !113)
!122 = !DILocalVariable(name: "i", scope: !113, file: !3, line: 43, type: !8)
!123 = !DILocation(line: 43, column: 13, scope: !113)
!124 = !DILocalVariable(name: "first", scope: !113, file: !3, line: 43, type: !8)
!125 = !DILocation(line: 43, column: 16, scope: !113)
!126 = !DILocation(line: 45, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !113, file: !3, line: 45, column: 9)
!128 = !DILocation(line: 45, column: 14, scope: !127)
!129 = !DILocation(line: 46, column: 39, scope: !130)
!130 = distinct !DILexicalBlock(scope: !131, file: !3, line: 45, column: 28)
!131 = distinct !DILexicalBlock(scope: !127, file: !3, line: 45, column: 9)
!132 = !DILocation(line: 46, column: 37, scope: !130)
!133 = !DILocation(line: 46, column: 17, scope: !130)
!134 = !DILocation(line: 48, column: 24, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !3, line: 48, column: 17)
!136 = !DILocation(line: 48, column: 35, scope: !135)
!137 = !DILocation(line: 48, column: 22, scope: !135)
!138 = !DILocation(line: 49, column: 39, scope: !139)
!139 = distinct !DILexicalBlock(scope: !140, file: !3, line: 48, column: 47)
!140 = distinct !DILexicalBlock(scope: !135, file: !3, line: 48, column: 17)
!141 = !DILocation(line: 49, column: 29, scope: !139)
!142 = !DILocation(line: 49, column: 27, scope: !139)
!143 = !DILocation(line: 50, column: 25, scope: !139)
!144 = !DILocation(line: 50, column: 32, scope: !139)
!145 = !DILocation(line: 50, column: 36, scope: !139)
!146 = !DILocation(line: 50, column: 34, scope: !139)
!147 = !DILocation(line: 50, column: 38, scope: !139)
!148 = !DILocation(line: 51, column: 38, scope: !149)
!149 = distinct !DILexicalBlock(scope: !139, file: !3, line: 50, column: 44)
!150 = !DILocation(line: 51, column: 35, scope: !149)
!151 = !DILocation(line: 52, column: 38, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !3, line: 52, column: 37)
!153 = !DILocation(line: 52, column: 37, scope: !149)
!154 = !DILocation(line: 52, column: 45, scope: !152)
!155 = !DILocation(line: 53, column: 39, scope: !149)
!156 = !DILocation(line: 54, column: 48, scope: !149)
!157 = !DILocation(line: 54, column: 33, scope: !149)
!158 = distinct !{!158, !143, !159}
!159 = !DILocation(line: 55, column: 25, scope: !139)
!160 = !DILocation(line: 56, column: 29, scope: !161)
!161 = distinct !DILexicalBlock(scope: !139, file: !3, line: 56, column: 29)
!162 = !DILocation(line: 56, column: 34, scope: !161)
!163 = !DILocation(line: 56, column: 38, scope: !161)
!164 = !DILocation(line: 56, column: 36, scope: !161)
!165 = !DILocation(line: 56, column: 31, scope: !161)
!166 = !DILocation(line: 56, column: 29, scope: !139)
!167 = !DILocation(line: 56, column: 41, scope: !161)
!168 = !DILocation(line: 57, column: 17, scope: !139)
!169 = !DILocation(line: 48, column: 43, scope: !140)
!170 = !DILocation(line: 48, column: 17, scope: !140)
!171 = distinct !{!171, !172, !173}
!172 = !DILocation(line: 48, column: 17, scope: !135)
!173 = !DILocation(line: 57, column: 17, scope: !135)
!174 = !DILocation(line: 59, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !130, file: !3, line: 59, column: 21)
!176 = !DILocation(line: 59, column: 21, scope: !130)
!177 = !DILocation(line: 59, column: 50, scope: !175)
!178 = !DILocation(line: 59, column: 33, scope: !175)
!179 = !DILocation(line: 60, column: 26, scope: !180)
!180 = distinct !DILexicalBlock(scope: !175, file: !3, line: 60, column: 26)
!181 = !DILocation(line: 60, column: 28, scope: !180)
!182 = !DILocation(line: 60, column: 26, scope: !175)
!183 = !DILocation(line: 60, column: 53, scope: !180)
!184 = !DILocation(line: 60, column: 33, scope: !180)
!185 = !DILocation(line: 61, column: 33, scope: !180)
!186 = !DILocation(line: 62, column: 9, scope: !130)
!187 = !DILocation(line: 45, column: 24, scope: !131)
!188 = !DILocation(line: 45, column: 9, scope: !131)
!189 = distinct !{!189, !190, !191}
!190 = !DILocation(line: 45, column: 9, scope: !127)
!191 = !DILocation(line: 62, column: 9, scope: !127)
