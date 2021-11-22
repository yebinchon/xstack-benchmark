; ModuleID = 'carmichael-3-strong-pseudoprimes.c'
source_filename = "carmichael-3-strong-pseudoprimes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_prime(i32 %n) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !12, metadata !DIExpression()), !dbg !13
  %0 = load i32, i32* %n.addr, align 4, !dbg !14
  %cmp = icmp ule i32 %0, 3, !dbg !16
  br i1 %cmp, label %if.then, label %if.else, !dbg !17, !cf.info !18

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !19
  %cmp1 = icmp ugt i32 %1, 1, !dbg !21
  %conv = zext i1 %cmp1 to i32, !dbg !21
  store i32 %conv, i32* %retval, align 4, !dbg !22
  br label %return, !dbg !22

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !23
  %rem = urem i32 %2, 2, !dbg !25
  %tobool = icmp ne i32 %rem, 0, !dbg !25
  br i1 %tobool, label %lor.lhs.false, label %if.then4, !dbg !26, !cf.info !18

lor.lhs.false:                                    ; preds = %if.else
  %3 = load i32, i32* %n.addr, align 4, !dbg !27
  %rem2 = urem i32 %3, 3, !dbg !28
  %tobool3 = icmp ne i32 %rem2, 0, !dbg !28
  br i1 %tobool3, label %if.else5, label %if.then4, !dbg !29, !cf.info !18

if.then4:                                         ; preds = %lor.lhs.false, %if.else
  store i32 0, i32* %retval, align 4, !dbg !30
  br label %return, !dbg !30

if.else5:                                         ; preds = %lor.lhs.false
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !34
  store i32 5, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %if.else5
  %4 = load i32, i32* %i, align 4, !dbg !38
  %5 = load i32, i32* %i, align 4, !dbg !40
  %mul = mul i32 %4, %5, !dbg !41
  %6 = load i32, i32* %n.addr, align 4, !dbg !42
  %cmp6 = icmp ule i32 %mul, %6, !dbg !43
  br i1 %cmp6, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %n.addr, align 4, !dbg !45
  %8 = load i32, i32* %i, align 4, !dbg !47
  %rem8 = urem i32 %7, %8, !dbg !48
  %tobool9 = icmp ne i32 %rem8, 0, !dbg !48
  br i1 %tobool9, label %lor.lhs.false10, label %if.then13, !dbg !49, !cf.info !18

lor.lhs.false10:                                  ; preds = %for.body
  %9 = load i32, i32* %n.addr, align 4, !dbg !50
  %10 = load i32, i32* %i, align 4, !dbg !51
  %add = add i32 %10, 2, !dbg !52
  %rem11 = urem i32 %9, %add, !dbg !53
  %tobool12 = icmp ne i32 %rem11, 0, !dbg !53
  br i1 %tobool12, label %if.end, label %if.then13, !dbg !54, !cf.info !18

if.then13:                                        ; preds = %lor.lhs.false10, %for.body
  store i32 0, i32* %retval, align 4, !dbg !55
  br label %return, !dbg !55

if.end:                                           ; preds = %lor.lhs.false10
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4, !dbg !57
  %add14 = add i32 %11, 6, !dbg !57
  store i32 %add14, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !61
  br label %return, !dbg !61

return:                                           ; preds = %for.end, %if.then13, %if.then4, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !62
  ret i32 %12, !dbg !62
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @carmichael3(i32 %p1) #0 !dbg !63 {
entry:
  %p1.addr = alloca i32, align 4
  %h3 = alloca i32, align 4
  %d = alloca i32, align 4
  %p2 = alloca i32, align 4
  %p3 = alloca i32, align 4
  store i32 %p1, i32* %p1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %p1.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32, i32* %p1.addr, align 4, !dbg !68
  %call = call i32 @is_prime(i32 %0), !dbg !70
  %tobool = icmp ne i32 %call, 0, !dbg !70
  br i1 %tobool, label %if.end, label %if.then, !dbg !71, !cf.info !18

if.then:                                          ; preds = %entry
  br label %for.end37, !dbg !72

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %h3, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %d, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %p2, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32* %p3, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 1, i32* %h3, align 4, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc35, %if.end
  %1 = load i32, i32* %h3, align 4, !dbg !84
  %2 = load i32, i32* %p1.addr, align 4, !dbg !86
  %cmp = icmp slt i32 %1, %2, !dbg !87
  br i1 %cmp, label %for.body, label %for.end37, !dbg !88

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %d, align 4, !dbg !89
  br label %for.cond1, !dbg !92

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %d, align 4, !dbg !93
  %4 = load i32, i32* %h3, align 4, !dbg !95
  %5 = load i32, i32* %p1.addr, align 4, !dbg !96
  %add = add nsw i32 %4, %5, !dbg !97
  %cmp2 = icmp slt i32 %3, %add, !dbg !98
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !99

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* %h3, align 4, !dbg !100
  %7 = load i32, i32* %p1.addr, align 4, !dbg !103
  %add4 = add nsw i32 %6, %7, !dbg !104
  %8 = load i32, i32* %p1.addr, align 4, !dbg !105
  %sub = sub nsw i32 %8, 1, !dbg !106
  %mul = mul nsw i32 %add4, %sub, !dbg !107
  %9 = load i32, i32* %d, align 4, !dbg !108
  %rem = srem i32 %mul, %9, !dbg !109
  %cmp5 = icmp eq i32 %rem, 0, !dbg !110
  br i1 %cmp5, label %land.lhs.true, label %if.end34, !dbg !111, !cf.info !18

land.lhs.true:                                    ; preds = %for.body3
  %10 = load i32, i32* %p1.addr, align 4, !dbg !112
  %sub6 = sub nsw i32 0, %10, !dbg !112
  %11 = load i32, i32* %p1.addr, align 4, !dbg !112
  %mul7 = mul nsw i32 %sub6, %11, !dbg !112
  %12 = load i32, i32* %h3, align 4, !dbg !112
  %rem8 = srem i32 %mul7, %12, !dbg !112
  %13 = load i32, i32* %h3, align 4, !dbg !112
  %add9 = add nsw i32 %rem8, %13, !dbg !112
  %14 = load i32, i32* %h3, align 4, !dbg !112
  %rem10 = srem i32 %add9, %14, !dbg !112
  %15 = load i32, i32* %d, align 4, !dbg !113
  %16 = load i32, i32* %h3, align 4, !dbg !114
  %rem11 = srem i32 %15, %16, !dbg !115
  %cmp12 = icmp eq i32 %rem10, %rem11, !dbg !116
  br i1 %cmp12, label %if.then13, label %if.end34, !dbg !117, !cf.info !18

if.then13:                                        ; preds = %land.lhs.true
  %17 = load i32, i32* %p1.addr, align 4, !dbg !118
  %sub14 = sub nsw i32 %17, 1, !dbg !120
  %18 = load i32, i32* %h3, align 4, !dbg !121
  %19 = load i32, i32* %p1.addr, align 4, !dbg !122
  %add15 = add nsw i32 %18, %19, !dbg !123
  %mul16 = mul nsw i32 %sub14, %add15, !dbg !124
  %20 = load i32, i32* %d, align 4, !dbg !125
  %div = sdiv i32 %mul16, %20, !dbg !126
  %add17 = add nsw i32 1, %div, !dbg !127
  store i32 %add17, i32* %p2, align 4, !dbg !128
  %21 = load i32, i32* %p2, align 4, !dbg !129
  %call18 = call i32 @is_prime(i32 %21), !dbg !131
  %tobool19 = icmp ne i32 %call18, 0, !dbg !131
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !132, !cf.info !18

if.then20:                                        ; preds = %if.then13
  br label %for.inc, !dbg !133

if.end21:                                         ; preds = %if.then13
  %22 = load i32, i32* %p1.addr, align 4, !dbg !134
  %23 = load i32, i32* %p2, align 4, !dbg !135
  %mul22 = mul nsw i32 %22, %23, !dbg !136
  %24 = load i32, i32* %h3, align 4, !dbg !137
  %div23 = sdiv i32 %mul22, %24, !dbg !138
  %add24 = add nsw i32 1, %div23, !dbg !139
  store i32 %add24, i32* %p3, align 4, !dbg !140
  %25 = load i32, i32* %p3, align 4, !dbg !141
  %call25 = call i32 @is_prime(i32 %25), !dbg !143
  %tobool26 = icmp ne i32 %call25, 0, !dbg !143
  br i1 %tobool26, label %lor.lhs.false, label %if.then31, !dbg !144, !cf.info !18

lor.lhs.false:                                    ; preds = %if.end21
  %26 = load i32, i32* %p2, align 4, !dbg !145
  %27 = load i32, i32* %p3, align 4, !dbg !146
  %mul27 = mul nsw i32 %26, %27, !dbg !147
  %28 = load i32, i32* %p1.addr, align 4, !dbg !148
  %sub28 = sub nsw i32 %28, 1, !dbg !149
  %rem29 = srem i32 %mul27, %sub28, !dbg !150
  %cmp30 = icmp ne i32 %rem29, 1, !dbg !151
  br i1 %cmp30, label %if.then31, label %if.end32, !dbg !152, !cf.info !18

if.then31:                                        ; preds = %lor.lhs.false, %if.end21
  br label %for.inc, !dbg !153

if.end32:                                         ; preds = %lor.lhs.false
  %29 = load i32, i32* %p1.addr, align 4, !dbg !154
  %30 = load i32, i32* %p2, align 4, !dbg !155
  %31 = load i32, i32* %p3, align 4, !dbg !156
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %29, i32 %30, i32 %31), !dbg !157
  br label %if.end34, !dbg !158

if.end34:                                         ; preds = %if.end32, %land.lhs.true, %for.body3
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %if.end34, %if.then31, %if.then20
  %32 = load i32, i32* %d, align 4, !dbg !160
  %inc = add nsw i32 %32, 1, !dbg !160
  store i32 %inc, i32* %d, align 4, !dbg !160
  br label %for.cond1, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond1
  br label %for.inc35, !dbg !164

for.inc35:                                        ; preds = %for.end
  %33 = load i32, i32* %h3, align 4, !dbg !165
  %inc36 = add nsw i32 %33, 1, !dbg !165
  store i32 %inc36, i32* %h3, align 4, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end37:                                        ; preds = %if.then, %for.cond
  ret void, !dbg !169
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !170 {
entry:
  %retval = alloca i32, align 4
  %p1 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %p1, metadata !173, metadata !DIExpression()), !dbg !174
  store i32 2, i32* %p1, align 4, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %p1, align 4, !dbg !178
  %cmp = icmp slt i32 %0, 62, !dbg !180
  br i1 %cmp, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %p1, align 4, !dbg !182
  call void @carmichael3(i32 %1), !dbg !183
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %p1, align 4, !dbg !184
  %inc = add nsw i32 %2, 1, !dbg !184
  store i32 %inc, i32* %p1, align 4, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !188
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "carmichael-3-strong-pseudoprimes.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Carmichael-3-strong-pseudoprimes")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "is_prime", scope: !1, file: !1, line: 7, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 7, type: !11)
!13 = !DILocation(line: 7, column: 27, scope: !7)
!14 = !DILocation(line: 9, column: 9, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 9)
!16 = !DILocation(line: 9, column: 11, scope: !15)
!17 = !DILocation(line: 9, column: 9, scope: !7)
!18 = !{!"if"}
!19 = !DILocation(line: 10, column: 16, scope: !20)
!20 = distinct !DILexicalBlock(scope: !15, file: !1, line: 9, column: 17)
!21 = !DILocation(line: 10, column: 18, scope: !20)
!22 = !DILocation(line: 10, column: 9, scope: !20)
!23 = !DILocation(line: 12, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !15, file: !1, line: 12, column: 14)
!25 = !DILocation(line: 12, column: 18, scope: !24)
!26 = !DILocation(line: 12, column: 23, scope: !24)
!27 = !DILocation(line: 12, column: 28, scope: !24)
!28 = !DILocation(line: 12, column: 30, scope: !24)
!29 = !DILocation(line: 12, column: 14, scope: !15)
!30 = !DILocation(line: 13, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !1, line: 12, column: 36)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 16, type: !11)
!33 = distinct !DILexicalBlock(scope: !24, file: !1, line: 15, column: 10)
!34 = !DILocation(line: 16, column: 22, scope: !33)
!35 = !DILocation(line: 17, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !1, line: 17, column: 9)
!37 = !DILocation(line: 17, column: 14, scope: !36)
!38 = !DILocation(line: 17, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !1, line: 17, column: 9)
!40 = !DILocation(line: 17, column: 23, scope: !39)
!41 = !DILocation(line: 17, column: 22, scope: !39)
!42 = !DILocation(line: 17, column: 28, scope: !39)
!43 = !DILocation(line: 17, column: 25, scope: !39)
!44 = !DILocation(line: 17, column: 9, scope: !36)
!45 = !DILocation(line: 18, column: 19, scope: !46)
!46 = distinct !DILexicalBlock(scope: !39, file: !1, line: 18, column: 17)
!47 = !DILocation(line: 18, column: 23, scope: !46)
!48 = !DILocation(line: 18, column: 21, scope: !46)
!49 = !DILocation(line: 18, column: 26, scope: !46)
!50 = !DILocation(line: 18, column: 31, scope: !46)
!51 = !DILocation(line: 18, column: 36, scope: !46)
!52 = !DILocation(line: 18, column: 38, scope: !46)
!53 = !DILocation(line: 18, column: 33, scope: !46)
!54 = !DILocation(line: 18, column: 17, scope: !39)
!55 = !DILocation(line: 19, column: 17, scope: !46)
!56 = !DILocation(line: 18, column: 42, scope: !46)
!57 = !DILocation(line: 17, column: 33, scope: !39)
!58 = !DILocation(line: 17, column: 9, scope: !39)
!59 = distinct !{!59, !44, !60}
!60 = !DILocation(line: 19, column: 24, scope: !36)
!61 = !DILocation(line: 20, column: 9, scope: !33)
!62 = !DILocation(line: 22, column: 1, scope: !7)
!63 = distinct !DISubprogram(name: "carmichael3", scope: !1, file: !1, line: 24, type: !64, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !10}
!66 = !DILocalVariable(name: "p1", arg: 1, scope: !63, file: !1, line: 24, type: !10)
!67 = !DILocation(line: 24, column: 22, scope: !63)
!68 = !DILocation(line: 26, column: 19, scope: !69)
!69 = distinct !DILexicalBlock(scope: !63, file: !1, line: 26, column: 9)
!70 = !DILocation(line: 26, column: 10, scope: !69)
!71 = !DILocation(line: 26, column: 9, scope: !63)
!72 = !DILocation(line: 26, column: 24, scope: !69)
!73 = !DILocalVariable(name: "h3", scope: !63, file: !1, line: 28, type: !10)
!74 = !DILocation(line: 28, column: 9, scope: !63)
!75 = !DILocalVariable(name: "d", scope: !63, file: !1, line: 28, type: !10)
!76 = !DILocation(line: 28, column: 13, scope: !63)
!77 = !DILocalVariable(name: "p2", scope: !63, file: !1, line: 28, type: !10)
!78 = !DILocation(line: 28, column: 16, scope: !63)
!79 = !DILocalVariable(name: "p3", scope: !63, file: !1, line: 28, type: !10)
!80 = !DILocation(line: 28, column: 20, scope: !63)
!81 = !DILocation(line: 29, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !63, file: !1, line: 29, column: 5)
!83 = !DILocation(line: 29, column: 10, scope: !82)
!84 = !DILocation(line: 29, column: 18, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 29, column: 5)
!86 = !DILocation(line: 29, column: 23, scope: !85)
!87 = !DILocation(line: 29, column: 21, scope: !85)
!88 = !DILocation(line: 29, column: 5, scope: !82)
!89 = !DILocation(line: 30, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 30, column: 9)
!91 = distinct !DILexicalBlock(scope: !85, file: !1, line: 29, column: 33)
!92 = !DILocation(line: 30, column: 14, scope: !90)
!93 = !DILocation(line: 30, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !1, line: 30, column: 9)
!95 = !DILocation(line: 30, column: 25, scope: !94)
!96 = !DILocation(line: 30, column: 30, scope: !94)
!97 = !DILocation(line: 30, column: 28, scope: !94)
!98 = !DILocation(line: 30, column: 23, scope: !94)
!99 = !DILocation(line: 30, column: 9, scope: !90)
!100 = !DILocation(line: 31, column: 18, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !1, line: 31, column: 17)
!102 = distinct !DILexicalBlock(scope: !94, file: !1, line: 30, column: 39)
!103 = !DILocation(line: 31, column: 23, scope: !101)
!104 = !DILocation(line: 31, column: 21, scope: !101)
!105 = !DILocation(line: 31, column: 28, scope: !101)
!106 = !DILocation(line: 31, column: 31, scope: !101)
!107 = !DILocation(line: 31, column: 26, scope: !101)
!108 = !DILocation(line: 31, column: 38, scope: !101)
!109 = !DILocation(line: 31, column: 36, scope: !101)
!110 = !DILocation(line: 31, column: 40, scope: !101)
!111 = !DILocation(line: 31, column: 45, scope: !101)
!112 = !DILocation(line: 31, column: 48, scope: !101)
!113 = !DILocation(line: 31, column: 69, scope: !101)
!114 = !DILocation(line: 31, column: 73, scope: !101)
!115 = !DILocation(line: 31, column: 71, scope: !101)
!116 = !DILocation(line: 31, column: 66, scope: !101)
!117 = !DILocation(line: 31, column: 17, scope: !102)
!118 = !DILocation(line: 32, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !101, file: !1, line: 31, column: 77)
!120 = !DILocation(line: 32, column: 31, scope: !119)
!121 = !DILocation(line: 32, column: 39, scope: !119)
!122 = !DILocation(line: 32, column: 44, scope: !119)
!123 = !DILocation(line: 32, column: 42, scope: !119)
!124 = !DILocation(line: 32, column: 36, scope: !119)
!125 = !DILocation(line: 32, column: 48, scope: !119)
!126 = !DILocation(line: 32, column: 47, scope: !119)
!127 = !DILocation(line: 32, column: 24, scope: !119)
!128 = !DILocation(line: 32, column: 20, scope: !119)
!129 = !DILocation(line: 33, column: 31, scope: !130)
!130 = distinct !DILexicalBlock(scope: !119, file: !1, line: 33, column: 21)
!131 = !DILocation(line: 33, column: 22, scope: !130)
!132 = !DILocation(line: 33, column: 21, scope: !119)
!133 = !DILocation(line: 33, column: 36, scope: !130)
!134 = !DILocation(line: 34, column: 27, scope: !119)
!135 = !DILocation(line: 34, column: 32, scope: !119)
!136 = !DILocation(line: 34, column: 30, scope: !119)
!137 = !DILocation(line: 34, column: 37, scope: !119)
!138 = !DILocation(line: 34, column: 35, scope: !119)
!139 = !DILocation(line: 34, column: 24, scope: !119)
!140 = !DILocation(line: 34, column: 20, scope: !119)
!141 = !DILocation(line: 35, column: 31, scope: !142)
!142 = distinct !DILexicalBlock(scope: !119, file: !1, line: 35, column: 21)
!143 = !DILocation(line: 35, column: 22, scope: !142)
!144 = !DILocation(line: 35, column: 35, scope: !142)
!145 = !DILocation(line: 35, column: 39, scope: !142)
!146 = !DILocation(line: 35, column: 44, scope: !142)
!147 = !DILocation(line: 35, column: 42, scope: !142)
!148 = !DILocation(line: 35, column: 51, scope: !142)
!149 = !DILocation(line: 35, column: 54, scope: !142)
!150 = !DILocation(line: 35, column: 48, scope: !142)
!151 = !DILocation(line: 35, column: 59, scope: !142)
!152 = !DILocation(line: 35, column: 21, scope: !119)
!153 = !DILocation(line: 35, column: 65, scope: !142)
!154 = !DILocation(line: 36, column: 38, scope: !119)
!155 = !DILocation(line: 36, column: 42, scope: !119)
!156 = !DILocation(line: 36, column: 46, scope: !119)
!157 = !DILocation(line: 36, column: 17, scope: !119)
!158 = !DILocation(line: 37, column: 13, scope: !119)
!159 = !DILocation(line: 38, column: 9, scope: !102)
!160 = !DILocation(line: 30, column: 34, scope: !94)
!161 = !DILocation(line: 30, column: 9, scope: !94)
!162 = distinct !{!162, !99, !163}
!163 = !DILocation(line: 38, column: 9, scope: !90)
!164 = !DILocation(line: 39, column: 5, scope: !91)
!165 = !DILocation(line: 29, column: 27, scope: !85)
!166 = !DILocation(line: 29, column: 5, scope: !85)
!167 = distinct !{!167, !88, !168}
!168 = !DILocation(line: 39, column: 5, scope: !82)
!169 = !DILocation(line: 40, column: 1, scope: !63)
!170 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !171, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!171 = !DISubroutineType(types: !172)
!172 = !{!10}
!173 = !DILocalVariable(name: "p1", scope: !170, file: !1, line: 44, type: !10)
!174 = !DILocation(line: 44, column: 9, scope: !170)
!175 = !DILocation(line: 45, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !170, file: !1, line: 45, column: 5)
!177 = !DILocation(line: 45, column: 10, scope: !176)
!178 = !DILocation(line: 45, column: 18, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !1, line: 45, column: 5)
!180 = !DILocation(line: 45, column: 21, scope: !179)
!181 = !DILocation(line: 45, column: 5, scope: !176)
!182 = !DILocation(line: 46, column: 21, scope: !179)
!183 = !DILocation(line: 46, column: 9, scope: !179)
!184 = !DILocation(line: 45, column: 27, scope: !179)
!185 = !DILocation(line: 45, column: 5, scope: !179)
!186 = distinct !{!186, !181, !187}
!187 = !DILocation(line: 46, column: 23, scope: !176)
!188 = !DILocation(line: 47, column: 5, scope: !170)
