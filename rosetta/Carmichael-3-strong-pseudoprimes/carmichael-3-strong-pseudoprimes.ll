; ModuleID = 'carmichael-3-strong-pseudoprimes.bc'
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
  br i1 %cmp, label %if.then, label %if.else, !dbg !17

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !18
  %cmp1 = icmp ugt i32 %1, 1, !dbg !20
  %conv = zext i1 %cmp1 to i32, !dbg !20
  store i32 %conv, i32* %retval, align 4, !dbg !21
  br label %return, !dbg !21

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !22
  %rem = urem i32 %2, 2, !dbg !24
  %tobool = icmp ne i32 %rem, 0, !dbg !24
  br i1 %tobool, label %lor.lhs.false, label %if.then4, !dbg !25

lor.lhs.false:                                    ; preds = %if.else
  %3 = load i32, i32* %n.addr, align 4, !dbg !26
  %rem2 = urem i32 %3, 3, !dbg !27
  %tobool3 = icmp ne i32 %rem2, 0, !dbg !27
  br i1 %tobool3, label %if.else5, label %if.then4, !dbg !28

if.then4:                                         ; preds = %lor.lhs.false, %if.else
  store i32 0, i32* %retval, align 4, !dbg !29
  br label %return, !dbg !29

if.else5:                                         ; preds = %lor.lhs.false
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !33
  store i32 5, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %if.else5
  %4 = load i32, i32* %i, align 4, !dbg !37
  %5 = load i32, i32* %i, align 4, !dbg !39
  %mul = mul i32 %4, %5, !dbg !40
  %6 = load i32, i32* %n.addr, align 4, !dbg !41
  %cmp6 = icmp ule i32 %mul, %6, !dbg !42
  br i1 %cmp6, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %n.addr, align 4, !dbg !44
  %8 = load i32, i32* %i, align 4, !dbg !46
  %rem8 = urem i32 %7, %8, !dbg !47
  %tobool9 = icmp ne i32 %rem8, 0, !dbg !47
  br i1 %tobool9, label %lor.lhs.false10, label %if.then13, !dbg !48

lor.lhs.false10:                                  ; preds = %for.body
  %9 = load i32, i32* %n.addr, align 4, !dbg !49
  %10 = load i32, i32* %i, align 4, !dbg !50
  %add = add i32 %10, 2, !dbg !51
  %rem11 = urem i32 %9, %add, !dbg !52
  %tobool12 = icmp ne i32 %rem11, 0, !dbg !52
  br i1 %tobool12, label %if.end, label %if.then13, !dbg !53

if.then13:                                        ; preds = %lor.lhs.false10, %for.body
  store i32 0, i32* %retval, align 4, !dbg !54
  br label %return, !dbg !54

if.end:                                           ; preds = %lor.lhs.false10
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4, !dbg !56
  %add14 = add i32 %11, 6, !dbg !56
  store i32 %add14, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !60
  br label %return, !dbg !60

return:                                           ; preds = %for.end, %if.then13, %if.then4, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !61
  ret i32 %12, !dbg !61
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @carmichael3(i32 %p1) #0 !dbg !62 {
entry:
  %p1.addr = alloca i32, align 4
  %h3 = alloca i32, align 4
  %d = alloca i32, align 4
  %p2 = alloca i32, align 4
  %p3 = alloca i32, align 4
  store i32 %p1, i32* %p1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %p1.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32, i32* %p1.addr, align 4, !dbg !67
  %call = call i32 @is_prime(i32 %0), !dbg !69
  %tobool = icmp ne i32 %call, 0, !dbg !69
  br i1 %tobool, label %if.end, label %if.then, !dbg !70

if.then:                                          ; preds = %entry
  br label %for.end37, !dbg !71

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %h3, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32* %d, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32* %p2, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %p3, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 1, i32* %h3, align 4, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc35, %if.end
  %1 = load i32, i32* %h3, align 4, !dbg !83
  %2 = load i32, i32* %p1.addr, align 4, !dbg !85
  %cmp = icmp slt i32 %1, %2, !dbg !86
  br i1 %cmp, label %for.body, label %for.end37.loopexit, !dbg !87

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %d, align 4, !dbg !88
  br label %for.cond1, !dbg !91

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %d, align 4, !dbg !92
  %4 = load i32, i32* %h3, align 4, !dbg !94
  %5 = load i32, i32* %p1.addr, align 4, !dbg !95
  %add = add nsw i32 %4, %5, !dbg !96
  %cmp2 = icmp slt i32 %3, %add, !dbg !97
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !98

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* %h3, align 4, !dbg !99
  %7 = load i32, i32* %p1.addr, align 4, !dbg !102
  %add4 = add nsw i32 %6, %7, !dbg !103
  %8 = load i32, i32* %p1.addr, align 4, !dbg !104
  %sub = sub nsw i32 %8, 1, !dbg !105
  %mul = mul nsw i32 %add4, %sub, !dbg !106
  %9 = load i32, i32* %d, align 4, !dbg !107
  %rem = srem i32 %mul, %9, !dbg !108
  %cmp5 = icmp eq i32 %rem, 0, !dbg !109
  br i1 %cmp5, label %land.lhs.true, label %if.end34, !dbg !110

land.lhs.true:                                    ; preds = %for.body3
  %10 = load i32, i32* %p1.addr, align 4, !dbg !111
  %sub6 = sub nsw i32 0, %10, !dbg !111
  %11 = load i32, i32* %p1.addr, align 4, !dbg !111
  %mul7 = mul nsw i32 %sub6, %11, !dbg !111
  %12 = load i32, i32* %h3, align 4, !dbg !111
  %rem8 = srem i32 %mul7, %12, !dbg !111
  %13 = load i32, i32* %h3, align 4, !dbg !111
  %add9 = add nsw i32 %rem8, %13, !dbg !111
  %14 = load i32, i32* %h3, align 4, !dbg !111
  %rem10 = srem i32 %add9, %14, !dbg !111
  %15 = load i32, i32* %d, align 4, !dbg !112
  %16 = load i32, i32* %h3, align 4, !dbg !113
  %rem11 = srem i32 %15, %16, !dbg !114
  %cmp12 = icmp eq i32 %rem10, %rem11, !dbg !115
  br i1 %cmp12, label %if.then13, label %if.end34, !dbg !116

if.then13:                                        ; preds = %land.lhs.true
  %17 = load i32, i32* %p1.addr, align 4, !dbg !117
  %sub14 = sub nsw i32 %17, 1, !dbg !119
  %18 = load i32, i32* %h3, align 4, !dbg !120
  %19 = load i32, i32* %p1.addr, align 4, !dbg !121
  %add15 = add nsw i32 %18, %19, !dbg !122
  %mul16 = mul nsw i32 %sub14, %add15, !dbg !123
  %20 = load i32, i32* %d, align 4, !dbg !124
  %div = sdiv i32 %mul16, %20, !dbg !125
  %add17 = add nsw i32 1, %div, !dbg !126
  store i32 %add17, i32* %p2, align 4, !dbg !127
  %21 = load i32, i32* %p2, align 4, !dbg !128
  %call18 = call i32 @is_prime(i32 %21), !dbg !130
  %tobool19 = icmp ne i32 %call18, 0, !dbg !130
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !131

if.then20:                                        ; preds = %if.then13
  br label %for.inc, !dbg !132

if.end21:                                         ; preds = %if.then13
  %22 = load i32, i32* %p1.addr, align 4, !dbg !133
  %23 = load i32, i32* %p2, align 4, !dbg !134
  %mul22 = mul nsw i32 %22, %23, !dbg !135
  %24 = load i32, i32* %h3, align 4, !dbg !136
  %div23 = sdiv i32 %mul22, %24, !dbg !137
  %add24 = add nsw i32 1, %div23, !dbg !138
  store i32 %add24, i32* %p3, align 4, !dbg !139
  %25 = load i32, i32* %p3, align 4, !dbg !140
  %call25 = call i32 @is_prime(i32 %25), !dbg !142
  %tobool26 = icmp ne i32 %call25, 0, !dbg !142
  br i1 %tobool26, label %lor.lhs.false, label %if.then31, !dbg !143

lor.lhs.false:                                    ; preds = %if.end21
  %26 = load i32, i32* %p2, align 4, !dbg !144
  %27 = load i32, i32* %p3, align 4, !dbg !145
  %mul27 = mul nsw i32 %26, %27, !dbg !146
  %28 = load i32, i32* %p1.addr, align 4, !dbg !147
  %sub28 = sub nsw i32 %28, 1, !dbg !148
  %rem29 = srem i32 %mul27, %sub28, !dbg !149
  %cmp30 = icmp ne i32 %rem29, 1, !dbg !150
  br i1 %cmp30, label %if.then31, label %if.end32, !dbg !151

if.then31:                                        ; preds = %lor.lhs.false, %if.end21
  br label %for.inc, !dbg !152

if.end32:                                         ; preds = %lor.lhs.false
  %29 = load i32, i32* %p1.addr, align 4, !dbg !153
  %30 = load i32, i32* %p2, align 4, !dbg !154
  %31 = load i32, i32* %p3, align 4, !dbg !155
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %29, i32 %30, i32 %31), !dbg !156
  br label %if.end34, !dbg !157

if.end34:                                         ; preds = %if.end32, %land.lhs.true, %for.body3
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %if.end34, %if.then31, %if.then20
  %32 = load i32, i32* %d, align 4, !dbg !159
  %inc = add nsw i32 %32, 1, !dbg !159
  store i32 %inc, i32* %d, align 4, !dbg !159
  br label %for.cond1, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond1
  br label %for.inc35, !dbg !163

for.inc35:                                        ; preds = %for.end
  %33 = load i32, i32* %h3, align 4, !dbg !164
  %inc36 = add nsw i32 %33, 1, !dbg !164
  store i32 %inc36, i32* %h3, align 4, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end37.loopexit:                               ; preds = %for.cond
  br label %for.end37, !dbg !168

for.end37:                                        ; preds = %for.end37.loopexit, %if.then
  ret void, !dbg !168
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !169 {
entry:
  %retval = alloca i32, align 4
  %p1 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %p1, metadata !172, metadata !DIExpression()), !dbg !173
  store i32 2, i32* %p1, align 4, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %p1, align 4, !dbg !177
  %cmp = icmp slt i32 %0, 62, !dbg !179
  br i1 %cmp, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %p1, align 4, !dbg !181
  call void @carmichael3(i32 %1), !dbg !182
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %p1, align 4, !dbg !183
  %inc = add nsw i32 %2, 1, !dbg !183
  store i32 %inc, i32* %p1, align 4, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !187
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "carmichael-3-strong-pseudoprimes.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Carmichael-3-strong-pseudoprimes")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!18 = !DILocation(line: 10, column: 16, scope: !19)
!19 = distinct !DILexicalBlock(scope: !15, file: !1, line: 9, column: 17)
!20 = !DILocation(line: 10, column: 18, scope: !19)
!21 = !DILocation(line: 10, column: 9, scope: !19)
!22 = !DILocation(line: 12, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !15, file: !1, line: 12, column: 14)
!24 = !DILocation(line: 12, column: 18, scope: !23)
!25 = !DILocation(line: 12, column: 23, scope: !23)
!26 = !DILocation(line: 12, column: 28, scope: !23)
!27 = !DILocation(line: 12, column: 30, scope: !23)
!28 = !DILocation(line: 12, column: 14, scope: !15)
!29 = !DILocation(line: 13, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !1, line: 12, column: 36)
!31 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 16, type: !11)
!32 = distinct !DILexicalBlock(scope: !23, file: !1, line: 15, column: 10)
!33 = !DILocation(line: 16, column: 22, scope: !32)
!34 = !DILocation(line: 17, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !1, line: 17, column: 9)
!36 = !DILocation(line: 17, column: 14, scope: !35)
!37 = !DILocation(line: 17, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !1, line: 17, column: 9)
!39 = !DILocation(line: 17, column: 23, scope: !38)
!40 = !DILocation(line: 17, column: 22, scope: !38)
!41 = !DILocation(line: 17, column: 28, scope: !38)
!42 = !DILocation(line: 17, column: 25, scope: !38)
!43 = !DILocation(line: 17, column: 9, scope: !35)
!44 = !DILocation(line: 18, column: 19, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !1, line: 18, column: 17)
!46 = !DILocation(line: 18, column: 23, scope: !45)
!47 = !DILocation(line: 18, column: 21, scope: !45)
!48 = !DILocation(line: 18, column: 26, scope: !45)
!49 = !DILocation(line: 18, column: 31, scope: !45)
!50 = !DILocation(line: 18, column: 36, scope: !45)
!51 = !DILocation(line: 18, column: 38, scope: !45)
!52 = !DILocation(line: 18, column: 33, scope: !45)
!53 = !DILocation(line: 18, column: 17, scope: !38)
!54 = !DILocation(line: 19, column: 17, scope: !45)
!55 = !DILocation(line: 18, column: 42, scope: !45)
!56 = !DILocation(line: 17, column: 33, scope: !38)
!57 = !DILocation(line: 17, column: 9, scope: !38)
!58 = distinct !{!58, !43, !59}
!59 = !DILocation(line: 19, column: 24, scope: !35)
!60 = !DILocation(line: 20, column: 9, scope: !32)
!61 = !DILocation(line: 22, column: 1, scope: !7)
!62 = distinct !DISubprogram(name: "carmichael3", scope: !1, file: !1, line: 24, type: !63, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{null, !10}
!65 = !DILocalVariable(name: "p1", arg: 1, scope: !62, file: !1, line: 24, type: !10)
!66 = !DILocation(line: 24, column: 22, scope: !62)
!67 = !DILocation(line: 26, column: 19, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !1, line: 26, column: 9)
!69 = !DILocation(line: 26, column: 10, scope: !68)
!70 = !DILocation(line: 26, column: 9, scope: !62)
!71 = !DILocation(line: 26, column: 24, scope: !68)
!72 = !DILocalVariable(name: "h3", scope: !62, file: !1, line: 28, type: !10)
!73 = !DILocation(line: 28, column: 9, scope: !62)
!74 = !DILocalVariable(name: "d", scope: !62, file: !1, line: 28, type: !10)
!75 = !DILocation(line: 28, column: 13, scope: !62)
!76 = !DILocalVariable(name: "p2", scope: !62, file: !1, line: 28, type: !10)
!77 = !DILocation(line: 28, column: 16, scope: !62)
!78 = !DILocalVariable(name: "p3", scope: !62, file: !1, line: 28, type: !10)
!79 = !DILocation(line: 28, column: 20, scope: !62)
!80 = !DILocation(line: 29, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !62, file: !1, line: 29, column: 5)
!82 = !DILocation(line: 29, column: 10, scope: !81)
!83 = !DILocation(line: 29, column: 18, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 29, column: 5)
!85 = !DILocation(line: 29, column: 23, scope: !84)
!86 = !DILocation(line: 29, column: 21, scope: !84)
!87 = !DILocation(line: 29, column: 5, scope: !81)
!88 = !DILocation(line: 30, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 30, column: 9)
!90 = distinct !DILexicalBlock(scope: !84, file: !1, line: 29, column: 33)
!91 = !DILocation(line: 30, column: 14, scope: !89)
!92 = !DILocation(line: 30, column: 21, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !1, line: 30, column: 9)
!94 = !DILocation(line: 30, column: 25, scope: !93)
!95 = !DILocation(line: 30, column: 30, scope: !93)
!96 = !DILocation(line: 30, column: 28, scope: !93)
!97 = !DILocation(line: 30, column: 23, scope: !93)
!98 = !DILocation(line: 30, column: 9, scope: !89)
!99 = !DILocation(line: 31, column: 18, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !1, line: 31, column: 17)
!101 = distinct !DILexicalBlock(scope: !93, file: !1, line: 30, column: 39)
!102 = !DILocation(line: 31, column: 23, scope: !100)
!103 = !DILocation(line: 31, column: 21, scope: !100)
!104 = !DILocation(line: 31, column: 28, scope: !100)
!105 = !DILocation(line: 31, column: 31, scope: !100)
!106 = !DILocation(line: 31, column: 26, scope: !100)
!107 = !DILocation(line: 31, column: 38, scope: !100)
!108 = !DILocation(line: 31, column: 36, scope: !100)
!109 = !DILocation(line: 31, column: 40, scope: !100)
!110 = !DILocation(line: 31, column: 45, scope: !100)
!111 = !DILocation(line: 31, column: 48, scope: !100)
!112 = !DILocation(line: 31, column: 69, scope: !100)
!113 = !DILocation(line: 31, column: 73, scope: !100)
!114 = !DILocation(line: 31, column: 71, scope: !100)
!115 = !DILocation(line: 31, column: 66, scope: !100)
!116 = !DILocation(line: 31, column: 17, scope: !101)
!117 = !DILocation(line: 32, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !100, file: !1, line: 31, column: 77)
!119 = !DILocation(line: 32, column: 31, scope: !118)
!120 = !DILocation(line: 32, column: 39, scope: !118)
!121 = !DILocation(line: 32, column: 44, scope: !118)
!122 = !DILocation(line: 32, column: 42, scope: !118)
!123 = !DILocation(line: 32, column: 36, scope: !118)
!124 = !DILocation(line: 32, column: 48, scope: !118)
!125 = !DILocation(line: 32, column: 47, scope: !118)
!126 = !DILocation(line: 32, column: 24, scope: !118)
!127 = !DILocation(line: 32, column: 20, scope: !118)
!128 = !DILocation(line: 33, column: 31, scope: !129)
!129 = distinct !DILexicalBlock(scope: !118, file: !1, line: 33, column: 21)
!130 = !DILocation(line: 33, column: 22, scope: !129)
!131 = !DILocation(line: 33, column: 21, scope: !118)
!132 = !DILocation(line: 33, column: 36, scope: !129)
!133 = !DILocation(line: 34, column: 27, scope: !118)
!134 = !DILocation(line: 34, column: 32, scope: !118)
!135 = !DILocation(line: 34, column: 30, scope: !118)
!136 = !DILocation(line: 34, column: 37, scope: !118)
!137 = !DILocation(line: 34, column: 35, scope: !118)
!138 = !DILocation(line: 34, column: 24, scope: !118)
!139 = !DILocation(line: 34, column: 20, scope: !118)
!140 = !DILocation(line: 35, column: 31, scope: !141)
!141 = distinct !DILexicalBlock(scope: !118, file: !1, line: 35, column: 21)
!142 = !DILocation(line: 35, column: 22, scope: !141)
!143 = !DILocation(line: 35, column: 35, scope: !141)
!144 = !DILocation(line: 35, column: 39, scope: !141)
!145 = !DILocation(line: 35, column: 44, scope: !141)
!146 = !DILocation(line: 35, column: 42, scope: !141)
!147 = !DILocation(line: 35, column: 51, scope: !141)
!148 = !DILocation(line: 35, column: 54, scope: !141)
!149 = !DILocation(line: 35, column: 48, scope: !141)
!150 = !DILocation(line: 35, column: 59, scope: !141)
!151 = !DILocation(line: 35, column: 21, scope: !118)
!152 = !DILocation(line: 35, column: 65, scope: !141)
!153 = !DILocation(line: 36, column: 38, scope: !118)
!154 = !DILocation(line: 36, column: 42, scope: !118)
!155 = !DILocation(line: 36, column: 46, scope: !118)
!156 = !DILocation(line: 36, column: 17, scope: !118)
!157 = !DILocation(line: 37, column: 13, scope: !118)
!158 = !DILocation(line: 38, column: 9, scope: !101)
!159 = !DILocation(line: 30, column: 34, scope: !93)
!160 = !DILocation(line: 30, column: 9, scope: !93)
!161 = distinct !{!161, !98, !162}
!162 = !DILocation(line: 38, column: 9, scope: !89)
!163 = !DILocation(line: 39, column: 5, scope: !90)
!164 = !DILocation(line: 29, column: 27, scope: !84)
!165 = !DILocation(line: 29, column: 5, scope: !84)
!166 = distinct !{!166, !87, !167}
!167 = !DILocation(line: 39, column: 5, scope: !81)
!168 = !DILocation(line: 40, column: 1, scope: !62)
!169 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !170, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!170 = !DISubroutineType(types: !171)
!171 = !{!10}
!172 = !DILocalVariable(name: "p1", scope: !169, file: !1, line: 44, type: !10)
!173 = !DILocation(line: 44, column: 9, scope: !169)
!174 = !DILocation(line: 45, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !169, file: !1, line: 45, column: 5)
!176 = !DILocation(line: 45, column: 10, scope: !175)
!177 = !DILocation(line: 45, column: 18, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !1, line: 45, column: 5)
!179 = !DILocation(line: 45, column: 21, scope: !178)
!180 = !DILocation(line: 45, column: 5, scope: !175)
!181 = !DILocation(line: 46, column: 21, scope: !178)
!182 = !DILocation(line: 46, column: 9, scope: !178)
!183 = !DILocation(line: 45, column: 27, scope: !178)
!184 = !DILocation(line: 45, column: 5, scope: !178)
!185 = distinct !{!185, !180, !186}
!186 = !DILocation(line: 46, column: 23, scope: !175)
!187 = !DILocation(line: 47, column: 5, scope: !169)
