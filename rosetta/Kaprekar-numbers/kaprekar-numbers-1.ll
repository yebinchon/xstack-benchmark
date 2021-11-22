; ModuleID = 'kaprekar-numbers-1.c'
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
  %retval = alloca i32, align 4
  %n.addr = alloca i64, align 8
  %base.addr = alloca i32, align 4
  %nn = alloca i64, align 8
  %r = alloca i64, align 8
  %tens = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 %base, i32* %base.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %base.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i64* %nn, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i64, i64* %n.addr, align 8, !dbg !23
  %1 = load i64, i64* %n.addr, align 8, !dbg !24
  %mul = mul i64 %0, %1, !dbg !25
  store i64 %mul, i64* %nn, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i64* %r, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %tens, metadata !28, metadata !DIExpression()), !dbg !29
  store i64 1, i64* %tens, align 8, !dbg !29
  %2 = load i64, i64* %nn, align 8, !dbg !30
  %3 = load i64, i64* %n.addr, align 8, !dbg !32
  %sub = sub i64 %2, %3, !dbg !33
  %4 = load i32, i32* %base.addr, align 4, !dbg !34
  %sub1 = sub nsw i32 %4, 1, !dbg !35
  %conv = sext i32 %sub1 to i64, !dbg !36
  %rem = urem i64 %sub, %conv, !dbg !37
  %tobool = icmp ne i64 %rem, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.end, !dbg !38, !cf.info !39

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !40
  br label %return, !dbg !40

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !41

while.cond:                                       ; preds = %while.body, %if.end
  %5 = load i64, i64* %tens, align 8, !dbg !42
  %6 = load i64, i64* %n.addr, align 8, !dbg !43
  %cmp = icmp ult i64 %5, %6, !dbg !44
  br i1 %cmp, label %while.body, label %while.end, !dbg !41

while.body:                                       ; preds = %while.cond
  %7 = load i32, i32* %base.addr, align 4, !dbg !45
  %conv3 = sext i32 %7 to i64, !dbg !45
  %8 = load i64, i64* %tens, align 8, !dbg !46
  %mul4 = mul i64 %8, %conv3, !dbg !46
  store i64 %mul4, i64* %tens, align 8, !dbg !46
  br label %while.cond, !dbg !41, !llvm.loop !47

while.end:                                        ; preds = %while.cond
  %9 = load i64, i64* %n.addr, align 8, !dbg !48
  %10 = load i64, i64* %tens, align 8, !dbg !50
  %cmp5 = icmp eq i64 %9, %10, !dbg !51
  br i1 %cmp5, label %if.then7, label %if.end10, !dbg !52, !cf.info !39

if.then7:                                         ; preds = %while.end
  %11 = load i64, i64* %n.addr, align 8, !dbg !53
  %cmp8 = icmp eq i64 1, %11, !dbg !54
  %conv9 = zext i1 %cmp8 to i32, !dbg !54
  store i32 %conv9, i32* %retval, align 4, !dbg !55
  br label %return, !dbg !55

if.end10:                                         ; preds = %while.end
  br label %while.cond11, !dbg !56

while.cond11:                                     ; preds = %if.end20, %if.end10
  %12 = load i64, i64* %nn, align 8, !dbg !57
  %13 = load i64, i64* %tens, align 8, !dbg !58
  %rem12 = urem i64 %12, %13, !dbg !59
  store i64 %rem12, i64* %r, align 8, !dbg !60
  %14 = load i64, i64* %n.addr, align 8, !dbg !61
  %cmp13 = icmp ult i64 %rem12, %14, !dbg !62
  br i1 %cmp13, label %while.body15, label %while.end23, !dbg !56

while.body15:                                     ; preds = %while.cond11
  %15 = load i64, i64* %nn, align 8, !dbg !63
  %16 = load i64, i64* %tens, align 8, !dbg !66
  %div = udiv i64 %15, %16, !dbg !67
  %17 = load i64, i64* %r, align 8, !dbg !68
  %add = add i64 %div, %17, !dbg !69
  %18 = load i64, i64* %n.addr, align 8, !dbg !70
  %cmp16 = icmp eq i64 %add, %18, !dbg !71
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !72, !cf.info !39

if.then18:                                        ; preds = %while.body15
  %19 = load i64, i64* %tens, align 8, !dbg !73
  %conv19 = trunc i64 %19 to i32, !dbg !73
  store i32 %conv19, i32* %retval, align 4, !dbg !74
  br label %return, !dbg !74

if.end20:                                         ; preds = %while.body15
  %20 = load i32, i32* %base.addr, align 4, !dbg !75
  %conv21 = sext i32 %20 to i64, !dbg !75
  %21 = load i64, i64* %tens, align 8, !dbg !76
  %mul22 = mul i64 %21, %conv21, !dbg !76
  store i64 %mul22, i64* %tens, align 8, !dbg !76
  br label %while.cond11, !dbg !56, !llvm.loop !77

while.end23:                                      ; preds = %while.cond11
  store i32 0, i32* %retval, align 4, !dbg !79
  br label %return, !dbg !79

return:                                           ; preds = %while.end23, %if.then18, %if.then7, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !80
  ret i32 %22, !dbg !80
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_num(i64 %n, i32 %base) #0 !dbg !81 {
entry:
  %n.addr = alloca i64, align 8
  %base.addr = alloca i32, align 4
  %q = alloca i64, align 8
  %div = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 %base, i32* %base.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %base.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i64* %q, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64* %div, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = load i32, i32* %base.addr, align 4, !dbg !92
  %conv = sext i32 %0 to i64, !dbg !92
  store i64 %conv, i64* %div, align 8, !dbg !91
  br label %while.cond, !dbg !93

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i64, i64* %div, align 8, !dbg !94
  %2 = load i64, i64* %n.addr, align 8, !dbg !95
  %cmp = icmp ult i64 %1, %2, !dbg !96
  br i1 %cmp, label %while.body, label %while.end, !dbg !93

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %base.addr, align 4, !dbg !97
  %conv2 = sext i32 %3 to i64, !dbg !97
  %4 = load i64, i64* %div, align 8, !dbg !98
  %mul = mul i64 %4, %conv2, !dbg !98
  store i64 %mul, i64* %div, align 8, !dbg !98
  br label %while.cond, !dbg !93, !llvm.loop !99

while.end:                                        ; preds = %while.cond
  br label %while.cond3, !dbg !100

while.cond3:                                      ; preds = %if.end, %while.end
  %5 = load i64, i64* %n.addr, align 8, !dbg !101
  %tobool = icmp ne i64 %5, 0, !dbg !101
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !102

land.rhs:                                         ; preds = %while.cond3
  %6 = load i32, i32* %base.addr, align 4, !dbg !103
  %conv4 = sext i32 %6 to i64, !dbg !103
  %7 = load i64, i64* %div, align 8, !dbg !104
  %div5 = udiv i64 %7, %conv4, !dbg !104
  store i64 %div5, i64* %div, align 8, !dbg !104
  %tobool6 = icmp ne i64 %div5, 0, !dbg !102
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %8 = phi i1 [ false, %while.cond3 ], [ %tobool6, %land.rhs ], !dbg !105
  br i1 %8, label %while.body7, label %while.end17, !dbg !100

while.body7:                                      ; preds = %land.end
  %9 = load i64, i64* %n.addr, align 8, !dbg !106
  %10 = load i64, i64* %div, align 8, !dbg !108
  %div8 = udiv i64 %9, %10, !dbg !109
  store i64 %div8, i64* %q, align 8, !dbg !110
  %11 = load i64, i64* %q, align 8, !dbg !111
  %cmp9 = icmp ult i64 %11, 10, !dbg !113
  br i1 %cmp9, label %if.then, label %if.else, !dbg !114, !cf.info !39

if.then:                                          ; preds = %while.body7
  %12 = load i64, i64* %q, align 8, !dbg !115
  %add = add i64 %12, 48, !dbg !116
  %conv11 = trunc i64 %add to i32, !dbg !115
  %call = call i32 @putchar(i32 %conv11), !dbg !117
  br label %if.end, !dbg !117

if.else:                                          ; preds = %while.body7
  %13 = load i64, i64* %q, align 8, !dbg !118
  %add12 = add i64 %13, 97, !dbg !119
  %sub = sub i64 %add12, 10, !dbg !120
  %conv13 = trunc i64 %sub to i32, !dbg !118
  %call14 = call i32 @putchar(i32 %conv13), !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = load i64, i64* %q, align 8, !dbg !122
  %15 = load i64, i64* %div, align 8, !dbg !123
  %mul15 = mul i64 %14, %15, !dbg !124
  %16 = load i64, i64* %n.addr, align 8, !dbg !125
  %sub16 = sub i64 %16, %mul15, !dbg !125
  store i64 %sub16, i64* %n.addr, align 8, !dbg !125
  br label %while.cond3, !dbg !100, !llvm.loop !126

while.end17:                                      ; preds = %land.end
  ret void, !dbg !128
}

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !129 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i64, align 8
  %tens = alloca i64, align 8
  %cnt = alloca i32, align 4
  %base = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %tens, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i32* %cnt, metadata !136, metadata !DIExpression()), !dbg !137
  store i32 0, i32* %cnt, align 4, !dbg !137
  call void @llvm.dbg.declare(metadata i32* %base, metadata !138, metadata !DIExpression()), !dbg !139
  store i32 10, i32* %base, align 4, !dbg !139
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !140
  store i64 1, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !144
  %cmp = icmp ult i64 %0, 1000000, !dbg !146
  br i1 %cmp, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !148
  %2 = load i32, i32* %base, align 4, !dbg !150
  %call1 = call i32 @kaprekar(i64 %1, i32 %2), !dbg !151
  %tobool = icmp ne i32 %call1, 0, !dbg !151
  br i1 %tobool, label %if.then, label %if.end, !dbg !152, !cf.info !39

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %cnt, align 4, !dbg !153
  %inc = add nsw i32 %3, 1, !dbg !153
  store i32 %inc, i32* %cnt, align 4, !dbg !153
  %4 = load i64, i64* %i, align 8, !dbg !154
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 %inc, i64 %4), !dbg !155
  br label %if.end, !dbg !155

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %if.end
  %5 = load i64, i64* %i, align 8, !dbg !157
  %inc3 = add i64 %5, 1, !dbg !157
  store i64 %inc3, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  store i32 17, i32* %base, align 4, !dbg !161
  %6 = load i32, i32* %base, align 4, !dbg !162
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i32 %6), !dbg !163
  store i64 2, i64* %i, align 8, !dbg !164
  store i32 1, i32* %cnt, align 4, !dbg !166
  br label %for.cond5, !dbg !167

for.cond5:                                        ; preds = %for.inc21, %for.end
  %7 = load i64, i64* %i, align 8, !dbg !168
  %cmp6 = icmp ult i64 %7, 1000000, !dbg !170
  br i1 %cmp6, label %for.body7, label %for.end23, !dbg !171

for.body7:                                        ; preds = %for.cond5
  %8 = load i64, i64* %i, align 8, !dbg !172
  %9 = load i32, i32* %base, align 4, !dbg !174
  %call8 = call i32 @kaprekar(i64 %8, i32 %9), !dbg !175
  %conv = sext i32 %call8 to i64, !dbg !175
  store i64 %conv, i64* %tens, align 8, !dbg !176
  %tobool9 = icmp ne i64 %conv, 0, !dbg !176
  br i1 %tobool9, label %if.then10, label %if.end20, !dbg !177, !cf.info !39

if.then10:                                        ; preds = %for.body7
  %10 = load i32, i32* %cnt, align 4, !dbg !178
  %inc11 = add nsw i32 %10, 1, !dbg !178
  store i32 %inc11, i32* %cnt, align 4, !dbg !178
  %11 = load i64, i64* %i, align 8, !dbg !180
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %inc11, i64 %11), !dbg !181
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)), !dbg !182
  %12 = load i64, i64* %i, align 8, !dbg !183
  %13 = load i32, i32* %base, align 4, !dbg !184
  call void @print_num(i64 %12, i32 %13), !dbg !185
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !186
  %14 = load i64, i64* %i, align 8, !dbg !187
  %15 = load i64, i64* %i, align 8, !dbg !188
  %mul = mul i64 %14, %15, !dbg !189
  %16 = load i32, i32* %base, align 4, !dbg !190
  call void @print_num(i64 %mul, i32 %16), !dbg !191
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !192
  %17 = load i64, i64* %i, align 8, !dbg !193
  %18 = load i64, i64* %i, align 8, !dbg !194
  %mul16 = mul i64 %17, %18, !dbg !195
  %19 = load i64, i64* %tens, align 8, !dbg !196
  %div = udiv i64 %mul16, %19, !dbg !197
  %20 = load i32, i32* %base, align 4, !dbg !198
  call void @print_num(i64 %div, i32 %20), !dbg !199
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0)), !dbg !200
  %21 = load i64, i64* %i, align 8, !dbg !201
  %22 = load i64, i64* %i, align 8, !dbg !202
  %mul18 = mul i64 %21, %22, !dbg !203
  %23 = load i64, i64* %tens, align 8, !dbg !204
  %rem = urem i64 %mul18, %23, !dbg !205
  %24 = load i32, i32* %base, align 4, !dbg !206
  call void @print_num(i64 %rem, i32 %24), !dbg !207
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)), !dbg !208
  br label %if.end20, !dbg !209

if.end20:                                         ; preds = %if.then10, %for.body7
  br label %for.inc21, !dbg !210

for.inc21:                                        ; preds = %if.end20
  %25 = load i64, i64* %i, align 8, !dbg !211
  %inc22 = add i64 %25, 1, !dbg !211
  store i64 %inc22, i64* %i, align 8, !dbg !211
  br label %for.cond5, !dbg !212, !llvm.loop !213

for.end23:                                        ; preds = %for.cond5
  ret i32 0, !dbg !215
}

declare dso_local i32 @printf(i8*, ...) #2

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
!18 = !DILocation(line: 5, column: 20, scope: !7)
!19 = !DILocalVariable(name: "base", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!20 = !DILocation(line: 5, column: 27, scope: !7)
!21 = !DILocalVariable(name: "nn", scope: !7, file: !1, line: 7, type: !11)
!22 = !DILocation(line: 7, column: 8, scope: !7)
!23 = !DILocation(line: 7, column: 13, scope: !7)
!24 = !DILocation(line: 7, column: 17, scope: !7)
!25 = !DILocation(line: 7, column: 15, scope: !7)
!26 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 7, type: !11)
!27 = !DILocation(line: 7, column: 20, scope: !7)
!28 = !DILocalVariable(name: "tens", scope: !7, file: !1, line: 7, type: !11)
!29 = !DILocation(line: 7, column: 23, scope: !7)
!30 = !DILocation(line: 9, column: 7, scope: !31)
!31 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 6)
!32 = !DILocation(line: 9, column: 12, scope: !31)
!33 = !DILocation(line: 9, column: 10, scope: !31)
!34 = !DILocation(line: 9, column: 18, scope: !31)
!35 = !DILocation(line: 9, column: 23, scope: !31)
!36 = !DILocation(line: 9, column: 17, scope: !31)
!37 = !DILocation(line: 9, column: 15, scope: !31)
!38 = !DILocation(line: 9, column: 6, scope: !7)
!39 = !{!"if"}
!40 = !DILocation(line: 9, column: 29, scope: !31)
!41 = !DILocation(line: 11, column: 2, scope: !7)
!42 = !DILocation(line: 11, column: 9, scope: !7)
!43 = !DILocation(line: 11, column: 16, scope: !7)
!44 = !DILocation(line: 11, column: 14, scope: !7)
!45 = !DILocation(line: 11, column: 27, scope: !7)
!46 = !DILocation(line: 11, column: 24, scope: !7)
!47 = distinct !{!47, !41, !45}
!48 = !DILocation(line: 12, column: 6, scope: !49)
!49 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 6)
!50 = !DILocation(line: 12, column: 11, scope: !49)
!51 = !DILocation(line: 12, column: 8, scope: !49)
!52 = !DILocation(line: 12, column: 6, scope: !7)
!53 = !DILocation(line: 12, column: 29, scope: !49)
!54 = !DILocation(line: 12, column: 26, scope: !49)
!55 = !DILocation(line: 12, column: 17, scope: !49)
!56 = !DILocation(line: 14, column: 2, scope: !7)
!57 = !DILocation(line: 14, column: 14, scope: !7)
!58 = !DILocation(line: 14, column: 19, scope: !7)
!59 = !DILocation(line: 14, column: 17, scope: !7)
!60 = !DILocation(line: 14, column: 12, scope: !7)
!61 = !DILocation(line: 14, column: 27, scope: !7)
!62 = !DILocation(line: 14, column: 25, scope: !7)
!63 = !DILocation(line: 15, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !65, file: !1, line: 15, column: 7)
!65 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 30)
!66 = !DILocation(line: 15, column: 12, scope: !64)
!67 = !DILocation(line: 15, column: 10, scope: !64)
!68 = !DILocation(line: 15, column: 19, scope: !64)
!69 = !DILocation(line: 15, column: 17, scope: !64)
!70 = !DILocation(line: 15, column: 24, scope: !64)
!71 = !DILocation(line: 15, column: 21, scope: !64)
!72 = !DILocation(line: 15, column: 7, scope: !65)
!73 = !DILocation(line: 15, column: 34, scope: !64)
!74 = !DILocation(line: 15, column: 27, scope: !64)
!75 = !DILocation(line: 16, column: 11, scope: !65)
!76 = !DILocation(line: 16, column: 8, scope: !65)
!77 = distinct !{!77, !56, !78}
!78 = !DILocation(line: 17, column: 2, scope: !7)
!79 = !DILocation(line: 19, column: 2, scope: !7)
!80 = !DILocation(line: 20, column: 1, scope: !7)
!81 = distinct !DISubprogram(name: "print_num", scope: !1, file: !1, line: 22, type: !82, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{null, !11, !10}
!84 = !DILocalVariable(name: "n", arg: 1, scope: !81, file: !1, line: 22, type: !11)
!85 = !DILocation(line: 22, column: 22, scope: !81)
!86 = !DILocalVariable(name: "base", arg: 2, scope: !81, file: !1, line: 22, type: !10)
!87 = !DILocation(line: 22, column: 29, scope: !81)
!88 = !DILocalVariable(name: "q", scope: !81, file: !1, line: 24, type: !11)
!89 = !DILocation(line: 24, column: 8, scope: !81)
!90 = !DILocalVariable(name: "div", scope: !81, file: !1, line: 24, type: !11)
!91 = !DILocation(line: 24, column: 11, scope: !81)
!92 = !DILocation(line: 24, column: 17, scope: !81)
!93 = !DILocation(line: 26, column: 2, scope: !81)
!94 = !DILocation(line: 26, column: 9, scope: !81)
!95 = !DILocation(line: 26, column: 15, scope: !81)
!96 = !DILocation(line: 26, column: 13, scope: !81)
!97 = !DILocation(line: 26, column: 25, scope: !81)
!98 = !DILocation(line: 26, column: 22, scope: !81)
!99 = distinct !{!99, !93, !97}
!100 = !DILocation(line: 27, column: 2, scope: !81)
!101 = !DILocation(line: 27, column: 9, scope: !81)
!102 = !DILocation(line: 27, column: 11, scope: !81)
!103 = !DILocation(line: 27, column: 22, scope: !81)
!104 = !DILocation(line: 27, column: 19, scope: !81)
!105 = !DILocation(line: 0, scope: !81)
!106 = !DILocation(line: 28, column: 7, scope: !107)
!107 = distinct !DILexicalBlock(scope: !81, file: !1, line: 27, column: 29)
!108 = !DILocation(line: 28, column: 11, scope: !107)
!109 = !DILocation(line: 28, column: 9, scope: !107)
!110 = !DILocation(line: 28, column: 5, scope: !107)
!111 = !DILocation(line: 29, column: 7, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !1, line: 29, column: 7)
!113 = !DILocation(line: 29, column: 9, scope: !112)
!114 = !DILocation(line: 29, column: 7, scope: !107)
!115 = !DILocation(line: 29, column: 27, scope: !112)
!116 = !DILocation(line: 29, column: 29, scope: !112)
!117 = !DILocation(line: 29, column: 19, scope: !112)
!118 = !DILocation(line: 30, column: 27, scope: !112)
!119 = !DILocation(line: 30, column: 29, scope: !112)
!120 = !DILocation(line: 30, column: 35, scope: !112)
!121 = !DILocation(line: 30, column: 19, scope: !112)
!122 = !DILocation(line: 31, column: 8, scope: !107)
!123 = !DILocation(line: 31, column: 12, scope: !107)
!124 = !DILocation(line: 31, column: 10, scope: !107)
!125 = !DILocation(line: 31, column: 5, scope: !107)
!126 = distinct !{!126, !100, !127}
!127 = !DILocation(line: 32, column: 2, scope: !81)
!128 = !DILocation(line: 33, column: 1, scope: !81)
!129 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 35, type: !130, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DISubroutineType(types: !131)
!131 = !{!10}
!132 = !DILocalVariable(name: "i", scope: !129, file: !1, line: 37, type: !11)
!133 = !DILocation(line: 37, column: 8, scope: !129)
!134 = !DILocalVariable(name: "tens", scope: !129, file: !1, line: 37, type: !11)
!135 = !DILocation(line: 37, column: 11, scope: !129)
!136 = !DILocalVariable(name: "cnt", scope: !129, file: !1, line: 38, type: !10)
!137 = !DILocation(line: 38, column: 6, scope: !129)
!138 = !DILocalVariable(name: "base", scope: !129, file: !1, line: 39, type: !10)
!139 = !DILocation(line: 39, column: 6, scope: !129)
!140 = !DILocation(line: 41, column: 2, scope: !129)
!141 = !DILocation(line: 42, column: 9, scope: !142)
!142 = distinct !DILexicalBlock(scope: !129, file: !1, line: 42, column: 2)
!143 = !DILocation(line: 42, column: 7, scope: !142)
!144 = !DILocation(line: 42, column: 14, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !1, line: 42, column: 2)
!146 = !DILocation(line: 42, column: 16, scope: !145)
!147 = !DILocation(line: 42, column: 2, scope: !142)
!148 = !DILocation(line: 43, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !1, line: 43, column: 7)
!150 = !DILocation(line: 43, column: 19, scope: !149)
!151 = !DILocation(line: 43, column: 7, scope: !149)
!152 = !DILocation(line: 43, column: 7, scope: !145)
!153 = !DILocation(line: 44, column: 26, scope: !149)
!154 = !DILocation(line: 44, column: 33, scope: !149)
!155 = !DILocation(line: 44, column: 4, scope: !149)
!156 = !DILocation(line: 43, column: 23, scope: !149)
!157 = !DILocation(line: 42, column: 28, scope: !145)
!158 = !DILocation(line: 42, column: 2, scope: !145)
!159 = distinct !{!159, !147, !160}
!160 = !DILocation(line: 44, column: 34, scope: !142)
!161 = !DILocation(line: 46, column: 7, scope: !129)
!162 = !DILocation(line: 47, column: 33, scope: !129)
!163 = !DILocation(line: 47, column: 2, scope: !129)
!164 = !DILocation(line: 48, column: 9, scope: !165)
!165 = distinct !DILexicalBlock(scope: !129, file: !1, line: 48, column: 2)
!166 = !DILocation(line: 48, column: 18, scope: !165)
!167 = !DILocation(line: 48, column: 7, scope: !165)
!168 = !DILocation(line: 48, column: 23, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !1, line: 48, column: 2)
!170 = !DILocation(line: 48, column: 25, scope: !169)
!171 = !DILocation(line: 48, column: 2, scope: !165)
!172 = !DILocation(line: 49, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !1, line: 49, column: 7)
!174 = !DILocation(line: 49, column: 27, scope: !173)
!175 = !DILocation(line: 49, column: 15, scope: !173)
!176 = !DILocation(line: 49, column: 13, scope: !173)
!177 = !DILocation(line: 49, column: 7, scope: !169)
!178 = !DILocation(line: 50, column: 24, scope: !179)
!179 = distinct !DILexicalBlock(scope: !173, file: !1, line: 49, column: 35)
!180 = !DILocation(line: 50, column: 31, scope: !179)
!181 = !DILocation(line: 50, column: 4, scope: !179)
!182 = !DILocation(line: 51, column: 4, scope: !179)
!183 = !DILocation(line: 51, column: 29, scope: !179)
!184 = !DILocation(line: 51, column: 32, scope: !179)
!185 = !DILocation(line: 51, column: 19, scope: !179)
!186 = !DILocation(line: 52, column: 4, scope: !179)
!187 = !DILocation(line: 52, column: 29, scope: !179)
!188 = !DILocation(line: 52, column: 33, scope: !179)
!189 = !DILocation(line: 52, column: 31, scope: !179)
!190 = !DILocation(line: 52, column: 36, scope: !179)
!191 = !DILocation(line: 52, column: 19, scope: !179)
!192 = !DILocation(line: 53, column: 4, scope: !179)
!193 = !DILocation(line: 53, column: 29, scope: !179)
!194 = !DILocation(line: 53, column: 33, scope: !179)
!195 = !DILocation(line: 53, column: 31, scope: !179)
!196 = !DILocation(line: 53, column: 37, scope: !179)
!197 = !DILocation(line: 53, column: 35, scope: !179)
!198 = !DILocation(line: 53, column: 43, scope: !179)
!199 = !DILocation(line: 53, column: 19, scope: !179)
!200 = !DILocation(line: 54, column: 4, scope: !179)
!201 = !DILocation(line: 54, column: 29, scope: !179)
!202 = !DILocation(line: 54, column: 33, scope: !179)
!203 = !DILocation(line: 54, column: 31, scope: !179)
!204 = !DILocation(line: 54, column: 37, scope: !179)
!205 = !DILocation(line: 54, column: 35, scope: !179)
!206 = !DILocation(line: 54, column: 43, scope: !179)
!207 = !DILocation(line: 54, column: 19, scope: !179)
!208 = !DILocation(line: 55, column: 4, scope: !179)
!209 = !DILocation(line: 56, column: 3, scope: !179)
!210 = !DILocation(line: 49, column: 32, scope: !173)
!211 = !DILocation(line: 48, column: 37, scope: !169)
!212 = !DILocation(line: 48, column: 2, scope: !169)
!213 = distinct !{!213, !171, !214}
!214 = !DILocation(line: 56, column: 3, scope: !165)
!215 = !DILocation(line: 58, column: 2, scope: !129)
