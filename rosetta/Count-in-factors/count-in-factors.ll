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
  br i1 %cmp, label %if.then, label %if.end28, !dbg !34

if.then:                                          ; preds = %entry
  %2 = load i64, i64* @get_prime.n_primes, align 8, !dbg !35
  %3 = load i64, i64* @get_prime.alloc, align 8, !dbg !38
  %cmp2 = icmp sge i64 %2, %3, !dbg !39
  br i1 %cmp2, label %if.then4, label %if.end, !dbg !40

if.then4:                                         ; preds = %if.then
  %4 = load i64, i64* @get_prime.alloc, align 8, !dbg !41
  %add = add nsw i64 %4, 16, !dbg !41
  store i64 %add, i64* @get_prime.alloc, align 8, !dbg !41
  %5 = load i64*, i64** @get_prime.primes, align 8, !dbg !43
  %6 = bitcast i64* %5 to i8*, !dbg !43
  %7 = load i64, i64* @get_prime.alloc, align 8, !dbg !44
  %mul = mul i64 8, %7, !dbg !45
  %call = call i8* @realloc(i8* %6, i64 %mul) #4, !dbg !46
  %8 = bitcast i8* %call to i64*, !dbg !46
  store i64* %8, i64** @get_prime.primes, align 8, !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then4, %if.then
  %9 = load i64, i64* @get_prime.n_primes, align 8, !dbg !49
  %tobool = icmp ne i64 %9, 0, !dbg !49
  br i1 %tobool, label %if.end7, label %if.then5, !dbg !51

if.then5:                                         ; preds = %if.end
  %10 = load i64*, i64** @get_prime.primes, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !52
  store i64 2, i64* %arrayidx, align 8, !dbg !54
  %11 = load i64*, i64** @get_prime.primes, align 8, !dbg !55
  %arrayidx6 = getelementptr inbounds i64, i64* %11, i64 1, !dbg !55
  store i64 3, i64* %arrayidx6, align 8, !dbg !56
  store i64 2, i64* @get_prime.n_primes, align 8, !dbg !57
  br label %if.end7, !dbg !58

if.end7:                                          ; preds = %if.then5, %if.end
  %12 = load i64*, i64** @get_prime.primes, align 8, !dbg !59
  %13 = load i64, i64* @get_prime.n_primes, align 8, !dbg !60
  %sub = sub nsw i64 %13, 1, !dbg !61
  %arrayidx8 = getelementptr inbounds i64, i64* %12, i64 %sub, !dbg !59
  %14 = load i64, i64* %arrayidx8, align 8, !dbg !59
  store i64 %14, i64* %last, align 8, !dbg !62
  br label %while.cond, !dbg !63

while.cond:                                       ; preds = %for.end, %if.end7
  %15 = load i32, i32* %idx.addr, align 4, !dbg !64
  %conv9 = sext i32 %15 to i64, !dbg !64
  %16 = load i64, i64* @get_prime.n_primes, align 8, !dbg !65
  %cmp10 = icmp sge i64 %conv9, %16, !dbg !66
  br i1 %cmp10, label %while.body, label %while.end, !dbg !63

while.body:                                       ; preds = %while.cond
  %17 = load i64, i64* %last, align 8, !dbg !67
  %add12 = add i64 %17, 2, !dbg !67
  store i64 %add12, i64* %last, align 8, !dbg !67
  store i32 0, i32* %i, align 4, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %while.body
  %18 = load i32, i32* %i, align 4, !dbg !72
  %conv13 = sext i32 %18 to i64, !dbg !72
  %19 = load i64, i64* @get_prime.n_primes, align 8, !dbg !74
  %cmp14 = icmp slt i64 %conv13, %19, !dbg !75
  br i1 %cmp14, label %for.body, label %for.end.loopexit, !dbg !76

for.body:                                         ; preds = %for.cond
  %20 = load i64*, i64** @get_prime.primes, align 8, !dbg !77
  %21 = load i32, i32* %i, align 4, !dbg !79
  %idxprom = sext i32 %21 to i64, !dbg !77
  %arrayidx16 = getelementptr inbounds i64, i64* %20, i64 %idxprom, !dbg !77
  %22 = load i64, i64* %arrayidx16, align 8, !dbg !77
  store i64 %22, i64* %p, align 8, !dbg !80
  %23 = load i64, i64* %p, align 8, !dbg !81
  %24 = load i64, i64* %p, align 8, !dbg !83
  %mul17 = mul i64 %23, %24, !dbg !84
  %25 = load i64, i64* %last, align 8, !dbg !85
  %cmp18 = icmp ugt i64 %mul17, %25, !dbg !86
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !87

if.then20:                                        ; preds = %for.body
  %26 = load i64, i64* %last, align 8, !dbg !88
  %27 = load i64*, i64** @get_prime.primes, align 8, !dbg !90
  %28 = load i64, i64* @get_prime.n_primes, align 8, !dbg !91
  %inc = add nsw i64 %28, 1, !dbg !91
  store i64 %inc, i64* @get_prime.n_primes, align 8, !dbg !91
  %arrayidx21 = getelementptr inbounds i64, i64* %27, i64 %28, !dbg !90
  store i64 %26, i64* %arrayidx21, align 8, !dbg !92
  br label %for.end, !dbg !93

if.end22:                                         ; preds = %for.body
  %29 = load i64, i64* %last, align 8, !dbg !94
  %30 = load i64, i64* %p, align 8, !dbg !96
  %rem = urem i64 %29, %30, !dbg !97
  %cmp23 = icmp eq i64 %rem, 0, !dbg !98
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !99

if.then25:                                        ; preds = %if.end22
  br label %for.end, !dbg !100

if.end26:                                         ; preds = %if.end22
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %if.end26
  %31 = load i32, i32* %i, align 4, !dbg !102
  %inc27 = add nsw i32 %31, 1, !dbg !102
  store i32 %inc27, i32* %i, align 4, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end, !dbg !63

for.end:                                          ; preds = %for.end.loopexit, %if.then25, %if.then20
  br label %while.cond, !dbg !63, !llvm.loop !106

while.end:                                        ; preds = %while.cond
  br label %if.end28, !dbg !108

if.end28:                                         ; preds = %while.end, %entry
  %32 = load i64*, i64** @get_prime.primes, align 8, !dbg !109
  %33 = load i32, i32* %idx.addr, align 4, !dbg !110
  %idxprom29 = sext i32 %33 to i64, !dbg !109
  %arrayidx30 = getelementptr inbounds i64, i64* %32, i64 %idxprom29, !dbg !109
  %34 = load i64, i64* %arrayidx30, align 8, !dbg !109
  ret i64 %34, !dbg !111
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !112 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i64, align 8
  %x = alloca i64, align 8
  %p = alloca i64, align 8
  %i = alloca i32, align 4
  %first = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %n, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %x, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %p, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32* %i, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32* %first, metadata !123, metadata !DIExpression()), !dbg !124
  store i64 1, i64* %x, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc18, %entry
  %0 = load i64, i64* %x, align 8, !dbg !128
  store i64 %0, i64* %n, align 8, !dbg !131
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i64 %0), !dbg !132
  store i32 0, i32* %i, align 4, !dbg !133
  store i32 1, i32* %first, align 4, !dbg !135
  br label %for.cond1, !dbg !136

for.cond1:                                        ; preds = %for.inc, %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !137
  %call2 = call i64 @get_prime(i32 %1), !dbg !140
  store i64 %call2, i64* %p, align 8, !dbg !141
  br label %while.cond, !dbg !142

while.cond:                                       ; preds = %if.end, %for.cond1
  %2 = load i64, i64* %n, align 8, !dbg !143
  %3 = load i64, i64* %p, align 8, !dbg !144
  %rem = urem i64 %2, %3, !dbg !145
  %cmp = icmp eq i64 %rem, 0, !dbg !146
  br i1 %cmp, label %while.body, label %while.end, !dbg !142

while.body:                                       ; preds = %while.cond
  %4 = load i64, i64* %p, align 8, !dbg !147
  %5 = load i64, i64* %n, align 8, !dbg !149
  %div = udiv i64 %5, %4, !dbg !149
  store i64 %div, i64* %n, align 8, !dbg !149
  %6 = load i32, i32* %first, align 4, !dbg !150
  %tobool = icmp ne i32 %6, 0, !dbg !150
  br i1 %tobool, label %if.end, label %if.then, !dbg !152

if.then:                                          ; preds = %while.body
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !153
  br label %if.end, !dbg !153

if.end:                                           ; preds = %if.then, %while.body
  store i32 0, i32* %first, align 4, !dbg !154
  %7 = load i64, i64* %p, align 8, !dbg !155
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %7), !dbg !156
  br label %while.cond, !dbg !142, !llvm.loop !157

while.end:                                        ; preds = %while.cond
  %8 = load i64, i64* %n, align 8, !dbg !159
  %9 = load i64, i64* %p, align 8, !dbg !161
  %10 = load i64, i64* %p, align 8, !dbg !162
  %mul = mul i64 %9, %10, !dbg !163
  %cmp5 = icmp ule i64 %8, %mul, !dbg !164
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !165

if.then6:                                         ; preds = %while.end
  br label %for.end, !dbg !166

if.end7:                                          ; preds = %while.end
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %if.end7
  %11 = load i32, i32* %i, align 4, !dbg !168
  %inc = add nsw i32 %11, 1, !dbg !168
  store i32 %inc, i32* %i, align 4, !dbg !168
  br label %for.cond1, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %if.then6
  %12 = load i32, i32* %first, align 4, !dbg !173
  %tobool8 = icmp ne i32 %12, 0, !dbg !173
  br i1 %tobool8, label %if.then9, label %if.else, !dbg !175

if.then9:                                         ; preds = %for.end
  %13 = load i64, i64* %n, align 8, !dbg !176
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 %13), !dbg !177
  br label %if.end17, !dbg !177

if.else:                                          ; preds = %for.end
  %14 = load i64, i64* %n, align 8, !dbg !178
  %cmp11 = icmp ugt i64 %14, 1, !dbg !180
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !181

if.then12:                                        ; preds = %if.else
  %15 = load i64, i64* %n, align 8, !dbg !182
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), i64 %15), !dbg !183
  br label %if.end16, !dbg !183

if.else14:                                        ; preds = %if.else
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !184
  br label %if.end16

if.end16:                                         ; preds = %if.else14, %if.then12
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then9
  br label %for.inc18, !dbg !185

for.inc18:                                        ; preds = %if.end17
  %16 = load i64, i64* %x, align 8, !dbg !186
  %inc19 = add i64 %16, 1, !dbg !186
  store i64 %inc19, i64* %x, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188
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
!35 = !DILocation(line: 14, column: 21, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 14, column: 21)
!37 = distinct !DILexicalBlock(scope: !31, file: !3, line: 13, column: 30)
!38 = !DILocation(line: 14, column: 33, scope: !36)
!39 = !DILocation(line: 14, column: 30, scope: !36)
!40 = !DILocation(line: 14, column: 21, scope: !37)
!41 = !DILocation(line: 15, column: 31, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !3, line: 14, column: 40)
!43 = !DILocation(line: 16, column: 42, scope: !42)
!44 = !DILocation(line: 16, column: 66, scope: !42)
!45 = !DILocation(line: 16, column: 64, scope: !42)
!46 = !DILocation(line: 16, column: 34, scope: !42)
!47 = !DILocation(line: 16, column: 32, scope: !42)
!48 = !DILocation(line: 17, column: 17, scope: !42)
!49 = !DILocation(line: 18, column: 22, scope: !50)
!50 = distinct !DILexicalBlock(scope: !37, file: !3, line: 18, column: 21)
!51 = !DILocation(line: 18, column: 21, scope: !37)
!52 = !DILocation(line: 19, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !3, line: 18, column: 32)
!54 = !DILocation(line: 19, column: 35, scope: !53)
!55 = !DILocation(line: 20, column: 25, scope: !53)
!56 = !DILocation(line: 20, column: 35, scope: !53)
!57 = !DILocation(line: 21, column: 34, scope: !53)
!58 = !DILocation(line: 22, column: 17, scope: !53)
!59 = !DILocation(line: 24, column: 24, scope: !37)
!60 = !DILocation(line: 24, column: 31, scope: !37)
!61 = !DILocation(line: 24, column: 39, scope: !37)
!62 = !DILocation(line: 24, column: 22, scope: !37)
!63 = !DILocation(line: 25, column: 17, scope: !37)
!64 = !DILocation(line: 25, column: 24, scope: !37)
!65 = !DILocation(line: 25, column: 31, scope: !37)
!66 = !DILocation(line: 25, column: 28, scope: !37)
!67 = !DILocation(line: 26, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !37, file: !3, line: 25, column: 41)
!69 = !DILocation(line: 27, column: 32, scope: !70)
!70 = distinct !DILexicalBlock(scope: !68, file: !3, line: 27, column: 25)
!71 = !DILocation(line: 27, column: 30, scope: !70)
!72 = !DILocation(line: 27, column: 37, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !3, line: 27, column: 25)
!74 = !DILocation(line: 27, column: 41, scope: !73)
!75 = !DILocation(line: 27, column: 39, scope: !73)
!76 = !DILocation(line: 27, column: 25, scope: !70)
!77 = !DILocation(line: 28, column: 37, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !3, line: 27, column: 56)
!79 = !DILocation(line: 28, column: 44, scope: !78)
!80 = !DILocation(line: 28, column: 35, scope: !78)
!81 = !DILocation(line: 29, column: 37, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !3, line: 29, column: 37)
!83 = !DILocation(line: 29, column: 41, scope: !82)
!84 = !DILocation(line: 29, column: 39, scope: !82)
!85 = !DILocation(line: 29, column: 45, scope: !82)
!86 = !DILocation(line: 29, column: 43, scope: !82)
!87 = !DILocation(line: 29, column: 37, scope: !78)
!88 = !DILocation(line: 30, column: 62, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !3, line: 29, column: 51)
!90 = !DILocation(line: 30, column: 41, scope: !89)
!91 = !DILocation(line: 30, column: 56, scope: !89)
!92 = !DILocation(line: 30, column: 60, scope: !89)
!93 = !DILocation(line: 31, column: 41, scope: !89)
!94 = !DILocation(line: 33, column: 37, scope: !95)
!95 = distinct !DILexicalBlock(scope: !78, file: !3, line: 33, column: 37)
!96 = !DILocation(line: 33, column: 44, scope: !95)
!97 = !DILocation(line: 33, column: 42, scope: !95)
!98 = !DILocation(line: 33, column: 46, scope: !95)
!99 = !DILocation(line: 33, column: 37, scope: !78)
!100 = !DILocation(line: 33, column: 52, scope: !95)
!101 = !DILocation(line: 34, column: 25, scope: !78)
!102 = !DILocation(line: 27, column: 52, scope: !73)
!103 = !DILocation(line: 27, column: 25, scope: !73)
!104 = distinct !{!104, !76, !105}
!105 = !DILocation(line: 34, column: 25, scope: !70)
!106 = distinct !{!106, !63, !107}
!107 = !DILocation(line: 35, column: 17, scope: !37)
!108 = !DILocation(line: 36, column: 9, scope: !37)
!109 = !DILocation(line: 37, column: 16, scope: !2)
!110 = !DILocation(line: 37, column: 23, scope: !2)
!111 = !DILocation(line: 37, column: 9, scope: !2)
!112 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 40, type: !113, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!113 = !DISubroutineType(types: !114)
!114 = !{!8}
!115 = !DILocalVariable(name: "n", scope: !112, file: !3, line: 42, type: !6)
!116 = !DILocation(line: 42, column: 15, scope: !112)
!117 = !DILocalVariable(name: "x", scope: !112, file: !3, line: 42, type: !6)
!118 = !DILocation(line: 42, column: 18, scope: !112)
!119 = !DILocalVariable(name: "p", scope: !112, file: !3, line: 42, type: !6)
!120 = !DILocation(line: 42, column: 21, scope: !112)
!121 = !DILocalVariable(name: "i", scope: !112, file: !3, line: 43, type: !8)
!122 = !DILocation(line: 43, column: 13, scope: !112)
!123 = !DILocalVariable(name: "first", scope: !112, file: !3, line: 43, type: !8)
!124 = !DILocation(line: 43, column: 16, scope: !112)
!125 = !DILocation(line: 45, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !112, file: !3, line: 45, column: 9)
!127 = !DILocation(line: 45, column: 14, scope: !126)
!128 = !DILocation(line: 46, column: 39, scope: !129)
!129 = distinct !DILexicalBlock(scope: !130, file: !3, line: 45, column: 28)
!130 = distinct !DILexicalBlock(scope: !126, file: !3, line: 45, column: 9)
!131 = !DILocation(line: 46, column: 37, scope: !129)
!132 = !DILocation(line: 46, column: 17, scope: !129)
!133 = !DILocation(line: 48, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !3, line: 48, column: 17)
!135 = !DILocation(line: 48, column: 35, scope: !134)
!136 = !DILocation(line: 48, column: 22, scope: !134)
!137 = !DILocation(line: 49, column: 39, scope: !138)
!138 = distinct !DILexicalBlock(scope: !139, file: !3, line: 48, column: 47)
!139 = distinct !DILexicalBlock(scope: !134, file: !3, line: 48, column: 17)
!140 = !DILocation(line: 49, column: 29, scope: !138)
!141 = !DILocation(line: 49, column: 27, scope: !138)
!142 = !DILocation(line: 50, column: 25, scope: !138)
!143 = !DILocation(line: 50, column: 32, scope: !138)
!144 = !DILocation(line: 50, column: 36, scope: !138)
!145 = !DILocation(line: 50, column: 34, scope: !138)
!146 = !DILocation(line: 50, column: 38, scope: !138)
!147 = !DILocation(line: 51, column: 38, scope: !148)
!148 = distinct !DILexicalBlock(scope: !138, file: !3, line: 50, column: 44)
!149 = !DILocation(line: 51, column: 35, scope: !148)
!150 = !DILocation(line: 52, column: 38, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !3, line: 52, column: 37)
!152 = !DILocation(line: 52, column: 37, scope: !148)
!153 = !DILocation(line: 52, column: 45, scope: !151)
!154 = !DILocation(line: 53, column: 39, scope: !148)
!155 = !DILocation(line: 54, column: 48, scope: !148)
!156 = !DILocation(line: 54, column: 33, scope: !148)
!157 = distinct !{!157, !142, !158}
!158 = !DILocation(line: 55, column: 25, scope: !138)
!159 = !DILocation(line: 56, column: 29, scope: !160)
!160 = distinct !DILexicalBlock(scope: !138, file: !3, line: 56, column: 29)
!161 = !DILocation(line: 56, column: 34, scope: !160)
!162 = !DILocation(line: 56, column: 38, scope: !160)
!163 = !DILocation(line: 56, column: 36, scope: !160)
!164 = !DILocation(line: 56, column: 31, scope: !160)
!165 = !DILocation(line: 56, column: 29, scope: !138)
!166 = !DILocation(line: 56, column: 41, scope: !160)
!167 = !DILocation(line: 57, column: 17, scope: !138)
!168 = !DILocation(line: 48, column: 43, scope: !139)
!169 = !DILocation(line: 48, column: 17, scope: !139)
!170 = distinct !{!170, !171, !172}
!171 = !DILocation(line: 48, column: 17, scope: !134)
!172 = !DILocation(line: 57, column: 17, scope: !134)
!173 = !DILocation(line: 59, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !129, file: !3, line: 59, column: 21)
!175 = !DILocation(line: 59, column: 21, scope: !129)
!176 = !DILocation(line: 59, column: 50, scope: !174)
!177 = !DILocation(line: 59, column: 33, scope: !174)
!178 = !DILocation(line: 60, column: 26, scope: !179)
!179 = distinct !DILexicalBlock(scope: !174, file: !3, line: 60, column: 26)
!180 = !DILocation(line: 60, column: 28, scope: !179)
!181 = !DILocation(line: 60, column: 26, scope: !174)
!182 = !DILocation(line: 60, column: 53, scope: !179)
!183 = !DILocation(line: 60, column: 33, scope: !179)
!184 = !DILocation(line: 61, column: 33, scope: !179)
!185 = !DILocation(line: 62, column: 9, scope: !129)
!186 = !DILocation(line: 45, column: 24, scope: !130)
!187 = !DILocation(line: 45, column: 9, scope: !130)
!188 = distinct !{!188, !189, !190}
!189 = !DILocation(line: 45, column: 9, scope: !126)
!190 = !DILocation(line: 62, column: 9, scope: !126)
