; ModuleID = 'kaprekar-numbers-1.ll'
source_filename = "kaprekar-numbers-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"base 10:\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"%3d: %llu\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"\0Abase %d:\0A  1: 1\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"%3d: %llu\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c" \09\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c" + \00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @kaprekar(i64 %n, i32 %base) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i64 %n, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 %base, metadata !19, metadata !DIExpression()), !dbg !18
  %mul = mul i64 %n, %n, !dbg !20
  call void @llvm.dbg.value(metadata i64 %mul, metadata !21, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i64 1, metadata !22, metadata !DIExpression()), !dbg !18
  %sub = sub i64 %mul, %n, !dbg !23
  %sub1 = sub nsw i32 %base, 1, !dbg !25
  %conv = sext i32 %sub1 to i64, !dbg !26
  %rem = urem i64 %sub, %conv, !dbg !27
  %tobool = icmp ne i64 %rem, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !28, !cf.info !29

if.then:                                          ; preds = %entry
  br label %return, !dbg !30

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !31

while.cond:                                       ; preds = %while.body, %if.end
  %tens.0 = phi i64 [ 1, %if.end ], [ %mul4, %while.body ], !dbg !18
  call void @llvm.dbg.value(metadata i64 %tens.0, metadata !22, metadata !DIExpression()), !dbg !18
  %cmp = icmp ult i64 %tens.0, %n, !dbg !32
  br i1 %cmp, label %while.body, label %while.end, !dbg !31

while.body:                                       ; preds = %while.cond
  %conv3 = sext i32 %base to i64, !dbg !33
  %mul4 = mul i64 %tens.0, %conv3, !dbg !34
  call void @llvm.dbg.value(metadata i64 %mul4, metadata !22, metadata !DIExpression()), !dbg !18
  br label %while.cond, !dbg !31, !llvm.loop !35

while.end:                                        ; preds = %while.cond
  %cmp5 = icmp eq i64 %n, %tens.0, !dbg !36
  br i1 %cmp5, label %if.then7, label %if.end10, !dbg !38, !cf.info !29

if.then7:                                         ; preds = %while.end
  %cmp8 = icmp eq i64 1, %n, !dbg !39
  %conv9 = zext i1 %cmp8 to i32, !dbg !39
  br label %return, !dbg !40

if.end10:                                         ; preds = %while.end
  br label %while.cond11, !dbg !41

while.cond11:                                     ; preds = %if.end20, %if.end10
  %tens.1 = phi i64 [ %tens.0, %if.end10 ], [ %mul22, %if.end20 ], !dbg !18
  call void @llvm.dbg.value(metadata i64 %tens.1, metadata !22, metadata !DIExpression()), !dbg !18
  %rem12 = urem i64 %mul, %tens.1, !dbg !42
  call void @llvm.dbg.value(metadata i64 %rem12, metadata !43, metadata !DIExpression()), !dbg !18
  %cmp13 = icmp ult i64 %rem12, %n, !dbg !44
  br i1 %cmp13, label %while.body15, label %while.end23, !dbg !41

while.body15:                                     ; preds = %while.cond11
  %div = udiv i64 %mul, %tens.1, !dbg !45
  %add = add i64 %div, %rem12, !dbg !48
  %cmp16 = icmp eq i64 %add, %n, !dbg !49
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !50, !cf.info !29

if.then18:                                        ; preds = %while.body15
  %conv19 = trunc i64 %tens.1 to i32, !dbg !51
  br label %return, !dbg !52

if.end20:                                         ; preds = %while.body15
  %conv21 = sext i32 %base to i64, !dbg !53
  %mul22 = mul i64 %tens.1, %conv21, !dbg !54
  call void @llvm.dbg.value(metadata i64 %mul22, metadata !22, metadata !DIExpression()), !dbg !18
  br label %while.cond11, !dbg !41, !llvm.loop !55

while.end23:                                      ; preds = %while.cond11
  br label %return, !dbg !57

return:                                           ; preds = %while.end23, %if.then18, %if.then7, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %conv9, %if.then7 ], [ %conv19, %if.then18 ], [ 0, %while.end23 ], !dbg !18
  ret i32 %retval.0, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_num(i64 %n, i32 %base) #0 !dbg !59 {
entry:
  call void @llvm.dbg.value(metadata i64 %n, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata i32 %base, metadata !64, metadata !DIExpression()), !dbg !63
  %conv = sext i32 %base to i64, !dbg !65
  call void @llvm.dbg.value(metadata i64 %conv, metadata !66, metadata !DIExpression()), !dbg !63
  br label %while.cond, !dbg !67

while.cond:                                       ; preds = %while.body, %entry
  %div.0 = phi i64 [ %conv, %entry ], [ %mul, %while.body ], !dbg !63
  call void @llvm.dbg.value(metadata i64 %div.0, metadata !66, metadata !DIExpression()), !dbg !63
  %cmp = icmp ult i64 %div.0, %n, !dbg !68
  br i1 %cmp, label %while.body, label %while.end, !dbg !67

while.body:                                       ; preds = %while.cond
  %conv2 = sext i32 %base to i64, !dbg !69
  %mul = mul i64 %div.0, %conv2, !dbg !70
  call void @llvm.dbg.value(metadata i64 %mul, metadata !66, metadata !DIExpression()), !dbg !63
  br label %while.cond, !dbg !67, !llvm.loop !71

while.end:                                        ; preds = %while.cond
  br label %while.cond3, !dbg !72

while.cond3:                                      ; preds = %if.end, %while.end
  %div.1 = phi i64 [ %div.0, %while.end ], [ %div.2, %if.end ], !dbg !63
  %n.addr.0 = phi i64 [ %n, %while.end ], [ %sub16, %if.end ]
  call void @llvm.dbg.value(metadata i64 %n.addr.0, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata i64 %div.1, metadata !66, metadata !DIExpression()), !dbg !63
  %tobool = icmp ne i64 %n.addr.0, 0, !dbg !73
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !74

land.rhs:                                         ; preds = %while.cond3
  %conv4 = sext i32 %base to i64, !dbg !75
  %div5 = udiv i64 %div.1, %conv4, !dbg !76
  call void @llvm.dbg.value(metadata i64 %div5, metadata !66, metadata !DIExpression()), !dbg !63
  %tobool6 = icmp ne i64 %div5, 0, !dbg !74
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %div.2 = phi i64 [ %div5, %land.rhs ], [ %div.1, %while.cond3 ], !dbg !63
  %0 = phi i1 [ false, %while.cond3 ], [ %tobool6, %land.rhs ], !dbg !63
  call void @llvm.dbg.value(metadata i64 %div.2, metadata !66, metadata !DIExpression()), !dbg !63
  br i1 %0, label %while.body7, label %while.end17, !dbg !72

while.body7:                                      ; preds = %land.end
  %div8 = udiv i64 %n.addr.0, %div.2, !dbg !77
  call void @llvm.dbg.value(metadata i64 %div8, metadata !79, metadata !DIExpression()), !dbg !63
  %cmp9 = icmp ult i64 %div8, 10, !dbg !80
  br i1 %cmp9, label %if.then, label %if.else, !dbg !82, !cf.info !29

if.then:                                          ; preds = %while.body7
  %add = add i64 %div8, 48, !dbg !83
  %conv11 = trunc i64 %add to i32, !dbg !84
  %call = call i32 @putchar(i32 %conv11), !dbg !85
  br label %if.end, !dbg !85

if.else:                                          ; preds = %while.body7
  %add12 = add i64 %div8, 97, !dbg !86
  %sub = sub i64 %add12, 10, !dbg !87
  %conv13 = trunc i64 %sub to i32, !dbg !88
  %call14 = call i32 @putchar(i32 %conv13), !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %mul15 = mul i64 %div8, %div.2, !dbg !90
  %sub16 = sub i64 %n.addr.0, %mul15, !dbg !91
  call void @llvm.dbg.value(metadata i64 %sub16, metadata !62, metadata !DIExpression()), !dbg !63
  br label %while.cond3, !dbg !72, !llvm.loop !92

while.end17:                                      ; preds = %land.end
  ret void, !dbg !94
}

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !95 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.value(metadata i32 10, metadata !100, metadata !DIExpression()), !dbg !99
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @llvm.dbg.value(metadata i64 1, metadata !102, metadata !DIExpression()), !dbg !99
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %entry
  %cnt.0 = phi i32 [ 0, %entry ], [ %cnt.1, %for.inc ], !dbg !99
  %i.0 = phi i64 [ 1, %entry ], [ %inc3, %for.inc ], !dbg !105
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !102, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.value(metadata i32 %cnt.0, metadata !98, metadata !DIExpression()), !dbg !99
  %cmp = icmp ult i64 %i.0, 1000000, !dbg !106
  br i1 %cmp, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %call1 = call i32 @kaprekar(i64 %i.0, i32 10), !dbg !109
  %tobool = icmp ne i32 %call1, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.end, !dbg !111, !cf.info !29

if.then:                                          ; preds = %for.body
  %inc = add nsw i32 %cnt.0, 1, !dbg !112
  call void @llvm.dbg.value(metadata i32 %inc, metadata !98, metadata !DIExpression()), !dbg !99
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 %inc, i64 %i.0), !dbg !113
  br label %if.end, !dbg !113

if.end:                                           ; preds = %if.then, %for.body
  %cnt.1 = phi i32 [ %inc, %if.then ], [ %cnt.0, %for.body ], !dbg !99
  call void @llvm.dbg.value(metadata i32 %cnt.1, metadata !98, metadata !DIExpression()), !dbg !99
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %if.end
  %inc3 = add i64 %i.0, 1, !dbg !115
  call void @llvm.dbg.value(metadata i64 %inc3, metadata !102, metadata !DIExpression()), !dbg !99
  br label %for.cond, !dbg !116, !llvm.loop !117

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 17, metadata !100, metadata !DIExpression()), !dbg !99
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i32 17), !dbg !119
  call void @llvm.dbg.value(metadata i64 2, metadata !102, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.value(metadata i32 1, metadata !98, metadata !DIExpression()), !dbg !99
  br label %for.cond5, !dbg !120

for.cond5:                                        ; preds = %for.inc21, %for.end
  %cnt.2 = phi i32 [ 1, %for.end ], [ %cnt.3, %for.inc21 ], !dbg !122
  %i.1 = phi i64 [ 2, %for.end ], [ %inc22, %for.inc21 ], !dbg !122
  call void @llvm.dbg.value(metadata i64 %i.1, metadata !102, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.value(metadata i32 %cnt.2, metadata !98, metadata !DIExpression()), !dbg !99
  %cmp6 = icmp ult i64 %i.1, 1000000, !dbg !123
  br i1 %cmp6, label %for.body7, label %for.end23, !dbg !125

for.body7:                                        ; preds = %for.cond5
  %call8 = call i32 @kaprekar(i64 %i.1, i32 17), !dbg !126
  %conv = sext i32 %call8 to i64, !dbg !126
  call void @llvm.dbg.value(metadata i64 %conv, metadata !128, metadata !DIExpression()), !dbg !99
  %tobool9 = icmp ne i64 %conv, 0, !dbg !129
  br i1 %tobool9, label %if.then10, label %if.end20, !dbg !130, !cf.info !29

if.then10:                                        ; preds = %for.body7
  %inc11 = add nsw i32 %cnt.2, 1, !dbg !131
  call void @llvm.dbg.value(metadata i32 %inc11, metadata !98, metadata !DIExpression()), !dbg !99
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %inc11, i64 %i.1), !dbg !133
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)), !dbg !134
  call void @print_num(i64 %i.1, i32 17), !dbg !135
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !136
  %mul = mul i64 %i.1, %i.1, !dbg !137
  call void @print_num(i64 %mul, i32 17), !dbg !138
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !139
  %mul16 = mul i64 %i.1, %i.1, !dbg !140
  %div = udiv i64 %mul16, %conv, !dbg !141
  call void @print_num(i64 %div, i32 17), !dbg !142
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0)), !dbg !143
  %mul18 = mul i64 %i.1, %i.1, !dbg !144
  %rem = urem i64 %mul18, %conv, !dbg !145
  call void @print_num(i64 %rem, i32 17), !dbg !146
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)), !dbg !147
  br label %if.end20, !dbg !148

if.end20:                                         ; preds = %if.then10, %for.body7
  %cnt.3 = phi i32 [ %inc11, %if.then10 ], [ %cnt.2, %for.body7 ], !dbg !122
  call void @llvm.dbg.value(metadata i32 %cnt.3, metadata !98, metadata !DIExpression()), !dbg !99
  br label %for.inc21, !dbg !149

for.inc21:                                        ; preds = %if.end20
  %inc22 = add i64 %i.1, 1, !dbg !150
  call void @llvm.dbg.value(metadata i64 %inc22, metadata !102, metadata !DIExpression()), !dbg !99
  br label %for.cond5, !dbg !151, !llvm.loop !152

for.end23:                                        ; preds = %for.cond5
  ret i32 0, !dbg !154
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "kaprekar-numbers-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Kaprekar-numbers")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "kaprekar", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "ulong", file: !1, line: 3, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !15, line: 45, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!16 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!17 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 5, type: !11)
!18 = !DILocation(line: 0, scope: !7)
!19 = !DILocalVariable(name: "base", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!20 = !DILocation(line: 7, column: 15, scope: !7)
!21 = !DILocalVariable(name: "nn", scope: !7, file: !1, line: 7, type: !11)
!22 = !DILocalVariable(name: "tens", scope: !7, file: !1, line: 7, type: !11)
!23 = !DILocation(line: 9, column: 10, scope: !24)
!24 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 6)
!25 = !DILocation(line: 9, column: 23, scope: !24)
!26 = !DILocation(line: 9, column: 17, scope: !24)
!27 = !DILocation(line: 9, column: 15, scope: !24)
!28 = !DILocation(line: 9, column: 6, scope: !7)
!29 = !{!"if"}
!30 = !DILocation(line: 9, column: 29, scope: !24)
!31 = !DILocation(line: 11, column: 2, scope: !7)
!32 = !DILocation(line: 11, column: 14, scope: !7)
!33 = !DILocation(line: 11, column: 27, scope: !7)
!34 = !DILocation(line: 11, column: 24, scope: !7)
!35 = distinct !{!35, !31, !33}
!36 = !DILocation(line: 12, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 6)
!38 = !DILocation(line: 12, column: 6, scope: !7)
!39 = !DILocation(line: 12, column: 26, scope: !37)
!40 = !DILocation(line: 12, column: 17, scope: !37)
!41 = !DILocation(line: 14, column: 2, scope: !7)
!42 = !DILocation(line: 14, column: 17, scope: !7)
!43 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 7, type: !11)
!44 = !DILocation(line: 14, column: 25, scope: !7)
!45 = !DILocation(line: 15, column: 10, scope: !46)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 15, column: 7)
!47 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 30)
!48 = !DILocation(line: 15, column: 17, scope: !46)
!49 = !DILocation(line: 15, column: 21, scope: !46)
!50 = !DILocation(line: 15, column: 7, scope: !47)
!51 = !DILocation(line: 15, column: 34, scope: !46)
!52 = !DILocation(line: 15, column: 27, scope: !46)
!53 = !DILocation(line: 16, column: 11, scope: !47)
!54 = !DILocation(line: 16, column: 8, scope: !47)
!55 = distinct !{!55, !41, !56}
!56 = !DILocation(line: 17, column: 2, scope: !7)
!57 = !DILocation(line: 19, column: 2, scope: !7)
!58 = !DILocation(line: 20, column: 1, scope: !7)
!59 = distinct !DISubprogram(name: "print_num", scope: !1, file: !1, line: 22, type: !60, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{null, !11, !10}
!62 = !DILocalVariable(name: "n", arg: 1, scope: !59, file: !1, line: 22, type: !11)
!63 = !DILocation(line: 0, scope: !59)
!64 = !DILocalVariable(name: "base", arg: 2, scope: !59, file: !1, line: 22, type: !10)
!65 = !DILocation(line: 24, column: 17, scope: !59)
!66 = !DILocalVariable(name: "div", scope: !59, file: !1, line: 24, type: !11)
!67 = !DILocation(line: 26, column: 2, scope: !59)
!68 = !DILocation(line: 26, column: 13, scope: !59)
!69 = !DILocation(line: 26, column: 25, scope: !59)
!70 = !DILocation(line: 26, column: 22, scope: !59)
!71 = distinct !{!71, !67, !69}
!72 = !DILocation(line: 27, column: 2, scope: !59)
!73 = !DILocation(line: 27, column: 9, scope: !59)
!74 = !DILocation(line: 27, column: 11, scope: !59)
!75 = !DILocation(line: 27, column: 22, scope: !59)
!76 = !DILocation(line: 27, column: 19, scope: !59)
!77 = !DILocation(line: 28, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !59, file: !1, line: 27, column: 29)
!79 = !DILocalVariable(name: "q", scope: !59, file: !1, line: 24, type: !11)
!80 = !DILocation(line: 29, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !1, line: 29, column: 7)
!82 = !DILocation(line: 29, column: 7, scope: !78)
!83 = !DILocation(line: 29, column: 29, scope: !81)
!84 = !DILocation(line: 29, column: 27, scope: !81)
!85 = !DILocation(line: 29, column: 19, scope: !81)
!86 = !DILocation(line: 30, column: 29, scope: !81)
!87 = !DILocation(line: 30, column: 35, scope: !81)
!88 = !DILocation(line: 30, column: 27, scope: !81)
!89 = !DILocation(line: 30, column: 19, scope: !81)
!90 = !DILocation(line: 31, column: 10, scope: !78)
!91 = !DILocation(line: 31, column: 5, scope: !78)
!92 = distinct !{!92, !72, !93}
!93 = !DILocation(line: 32, column: 2, scope: !59)
!94 = !DILocation(line: 33, column: 1, scope: !59)
!95 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 35, type: !96, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!10}
!98 = !DILocalVariable(name: "cnt", scope: !95, file: !1, line: 38, type: !10)
!99 = !DILocation(line: 0, scope: !95)
!100 = !DILocalVariable(name: "base", scope: !95, file: !1, line: 39, type: !10)
!101 = !DILocation(line: 41, column: 2, scope: !95)
!102 = !DILocalVariable(name: "i", scope: !95, file: !1, line: 37, type: !11)
!103 = !DILocation(line: 42, column: 7, scope: !104)
!104 = distinct !DILexicalBlock(scope: !95, file: !1, line: 42, column: 2)
!105 = !DILocation(line: 0, scope: !104)
!106 = !DILocation(line: 42, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !1, line: 42, column: 2)
!108 = !DILocation(line: 42, column: 2, scope: !104)
!109 = !DILocation(line: 43, column: 7, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !1, line: 43, column: 7)
!111 = !DILocation(line: 43, column: 7, scope: !107)
!112 = !DILocation(line: 44, column: 26, scope: !110)
!113 = !DILocation(line: 44, column: 4, scope: !110)
!114 = !DILocation(line: 43, column: 23, scope: !110)
!115 = !DILocation(line: 42, column: 28, scope: !107)
!116 = !DILocation(line: 42, column: 2, scope: !107)
!117 = distinct !{!117, !108, !118}
!118 = !DILocation(line: 44, column: 34, scope: !104)
!119 = !DILocation(line: 47, column: 2, scope: !95)
!120 = !DILocation(line: 48, column: 7, scope: !121)
!121 = distinct !DILexicalBlock(scope: !95, file: !1, line: 48, column: 2)
!122 = !DILocation(line: 0, scope: !121)
!123 = !DILocation(line: 48, column: 25, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !1, line: 48, column: 2)
!125 = !DILocation(line: 48, column: 2, scope: !121)
!126 = !DILocation(line: 49, column: 15, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !1, line: 49, column: 7)
!128 = !DILocalVariable(name: "tens", scope: !95, file: !1, line: 37, type: !11)
!129 = !DILocation(line: 49, column: 13, scope: !127)
!130 = !DILocation(line: 49, column: 7, scope: !124)
!131 = !DILocation(line: 50, column: 24, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !1, line: 49, column: 35)
!133 = !DILocation(line: 50, column: 4, scope: !132)
!134 = !DILocation(line: 51, column: 4, scope: !132)
!135 = !DILocation(line: 51, column: 19, scope: !132)
!136 = !DILocation(line: 52, column: 4, scope: !132)
!137 = !DILocation(line: 52, column: 31, scope: !132)
!138 = !DILocation(line: 52, column: 19, scope: !132)
!139 = !DILocation(line: 53, column: 4, scope: !132)
!140 = !DILocation(line: 53, column: 31, scope: !132)
!141 = !DILocation(line: 53, column: 35, scope: !132)
!142 = !DILocation(line: 53, column: 19, scope: !132)
!143 = !DILocation(line: 54, column: 4, scope: !132)
!144 = !DILocation(line: 54, column: 31, scope: !132)
!145 = !DILocation(line: 54, column: 35, scope: !132)
!146 = !DILocation(line: 54, column: 19, scope: !132)
!147 = !DILocation(line: 55, column: 4, scope: !132)
!148 = !DILocation(line: 56, column: 3, scope: !132)
!149 = !DILocation(line: 49, column: 32, scope: !127)
!150 = !DILocation(line: 48, column: 37, scope: !124)
!151 = !DILocation(line: 48, column: 2, scope: !124)
!152 = distinct !{!152, !125, !153}
!153 = !DILocation(line: 56, column: 3, scope: !121)
!154 = !DILocation(line: 58, column: 2, scope: !95)
