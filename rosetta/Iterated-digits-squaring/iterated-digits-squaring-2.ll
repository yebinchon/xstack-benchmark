; ModuleID = 'iterated-digits-squaring-2.c'
source_filename = "iterated-digits-squaring-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@digits = dso_local constant [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9], align 16, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @factorial(i32 %n) #0 !dbg !15 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* %n.addr, align 4, !dbg !20
  %cmp = icmp eq i32 %0, 0, !dbg !21
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !20

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !20

cond.false:                                       ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !22
  %2 = load i32, i32* %n.addr, align 4, !dbg !23
  %sub = sub nsw i32 %2, 1, !dbg !24
  %call = call i32 @factorial(i32 %sub), !dbg !25
  %mul = mul nsw i32 %1, %call, !dbg !26
  br label %cond.end, !dbg !20

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %mul, %cond.false ], !dbg !20
  ret i32 %cond, !dbg !27
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @sum_square_digits(i32 %n) #0 !dbg !28 {
entry:
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %num = alloca i32, align 4
  %sum = alloca i32, align 4
  %digit = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %num, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* %n.addr, align 4, !dbg !38
  store i32 %0, i32* %num, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 0, i32* %sum, align 4, !dbg !40
  br label %while.cond, !dbg !41

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, i32* %num, align 4, !dbg !42
  %cmp = icmp sgt i32 %1, 0, !dbg !43
  br i1 %cmp, label %while.body, label %while.end, !dbg !41

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i32* %digit, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = load i32, i32* %num, align 4, !dbg !47
  %rem = srem i32 %2, 10, !dbg !48
  store i32 %rem, i32* %digit, align 4, !dbg !46
  %3 = load i32, i32* %num, align 4, !dbg !49
  %4 = load i32, i32* %digit, align 4, !dbg !50
  %sub = sub nsw i32 %3, %4, !dbg !51
  %div = sdiv i32 %sub, 10, !dbg !52
  store i32 %div, i32* %num, align 4, !dbg !53
  %5 = load i32, i32* %sum, align 4, !dbg !54
  %6 = load i32, i32* %digit, align 4, !dbg !55
  %7 = load i32, i32* %digit, align 4, !dbg !56
  %mul = mul nsw i32 %6, %7, !dbg !57
  %add = add nsw i32 %5, %mul, !dbg !58
  store i32 %add, i32* %sum, align 4, !dbg !59
  br label %while.cond, !dbg !41, !llvm.loop !60

while.end:                                        ; preds = %while.cond
  %8 = load i32, i32* %sum, align 4, !dbg !62
  ret i32 %8, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @choose_sum_and_count_89(i32* %got, i32 %n_chosen, i32 %len, i32 %at, i32 %max_types, i32* %count89) #0 !dbg !64 {
entry:
  %retval = alloca i64, align 8
  %got.addr = alloca i32*, align 8
  %n_chosen.addr = alloca i32, align 4
  %len.addr = alloca i32, align 4
  %at.addr = alloca i32, align 4
  %max_types.addr = alloca i32, align 4
  %count89.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %count = alloca i64, align 8
  %digitcounts = alloca [10 x i32], align 16
  %sum = alloca i32, align 4
  %digit = alloca i32, align 4
  %count_this_comb = alloca i32, align 4
  store i32* %got, i32** %got.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %got.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 %n_chosen, i32* %n_chosen.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n_chosen.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 %at, i32* %at.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %at.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 %max_types, i32* %max_types.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max_types.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* %count89, i32** %count89.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %count89.addr, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32* %i, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i64* %count, metadata !83, metadata !DIExpression()), !dbg !84
  store i64 0, i64* %count, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata [10 x i32]* %digitcounts, metadata !85, metadata !DIExpression()), !dbg !87
  store i32 0, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !91
  %cmp = icmp slt i32 %0, 10, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !95
  %idxprom = sext i32 %1 to i64, !dbg !97
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %digitcounts, i64 0, i64 %idxprom, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !100
  %inc = add nsw i32 %2, 1, !dbg !100
  store i32 %inc, i32* %i, align 4, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  %3 = load i32, i32* %n_chosen.addr, align 4, !dbg !104
  %4 = load i32, i32* %len.addr, align 4, !dbg !106
  %cmp1 = icmp eq i32 %3, %4, !dbg !107
  br i1 %cmp1, label %if.then, label %if.end39, !dbg !108, !cf.info !109

if.then:                                          ; preds = %for.end
  %5 = load i32*, i32** %got.addr, align 8, !dbg !110
  %tobool = icmp ne i32* %5, null, !dbg !110
  br i1 %tobool, label %if.end, label %if.then2, !dbg !113, !cf.info !109

if.then2:                                         ; preds = %if.then
  store i64 1, i64* %retval, align 8, !dbg !114
  br label %return, !dbg !114

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 0, i32* %sum, align 4, !dbg !116
  store i32 0, i32* %i, align 4, !dbg !117
  br label %for.cond3, !dbg !119

for.cond3:                                        ; preds = %for.inc13, %if.end
  %6 = load i32, i32* %i, align 4, !dbg !120
  %7 = load i32, i32* %len.addr, align 4, !dbg !122
  %cmp4 = icmp slt i32 %6, %7, !dbg !123
  br i1 %cmp4, label %for.body5, label %for.end15, !dbg !124

for.body5:                                        ; preds = %for.cond3
  call void @llvm.dbg.declare(metadata i32* %digit, metadata !125, metadata !DIExpression()), !dbg !127
  %8 = load i32*, i32** %got.addr, align 8, !dbg !128
  %9 = load i32, i32* %i, align 4, !dbg !129
  %idxprom6 = sext i32 %9 to i64, !dbg !128
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %idxprom6, !dbg !128
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !128
  %idxprom8 = sext i32 %10 to i64, !dbg !130
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* @digits, i64 0, i64 %idxprom8, !dbg !130
  %11 = load i32, i32* %arrayidx9, align 4, !dbg !130
  store i32 %11, i32* %digit, align 4, !dbg !127
  %12 = load i32, i32* %digit, align 4, !dbg !131
  %idxprom10 = sext i32 %12 to i64, !dbg !132
  %arrayidx11 = getelementptr inbounds [10 x i32], [10 x i32]* %digitcounts, i64 0, i64 %idxprom10, !dbg !132
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !133
  %inc12 = add nsw i32 %13, 1, !dbg !133
  store i32 %inc12, i32* %arrayidx11, align 4, !dbg !133
  %14 = load i32, i32* %sum, align 4, !dbg !134
  %15 = load i32, i32* %digit, align 4, !dbg !135
  %16 = load i32, i32* %digit, align 4, !dbg !136
  %mul = mul nsw i32 %15, %16, !dbg !137
  %add = add nsw i32 %14, %mul, !dbg !138
  store i32 %add, i32* %sum, align 4, !dbg !139
  br label %for.inc13, !dbg !140

for.inc13:                                        ; preds = %for.body5
  %17 = load i32, i32* %i, align 4, !dbg !141
  %inc14 = add nsw i32 %17, 1, !dbg !141
  store i32 %inc14, i32* %i, align 4, !dbg !141
  br label %for.cond3, !dbg !142, !llvm.loop !143

for.end15:                                        ; preds = %for.cond3
  %18 = load i32, i32* %sum, align 4, !dbg !145
  %cmp16 = icmp eq i32 %18, 0, !dbg !147
  br i1 %cmp16, label %if.then17, label %if.end18, !dbg !148, !cf.info !109

if.then17:                                        ; preds = %for.end15
  store i64 1, i64* %retval, align 8, !dbg !149
  br label %return, !dbg !149

if.end18:                                         ; preds = %for.end15
  %19 = load i32, i32* %sum, align 4, !dbg !151
  %cmp19 = icmp ne i32 %19, 1, !dbg !153
  br i1 %cmp19, label %land.lhs.true, label %if.end24, !dbg !154, !cf.info !109

land.lhs.true:                                    ; preds = %if.end18
  %20 = load i32, i32* %sum, align 4, !dbg !155
  %cmp20 = icmp ne i32 %20, 89, !dbg !156
  br i1 %cmp20, label %if.then21, label %if.end24, !dbg !157, !cf.info !109

if.then21:                                        ; preds = %land.lhs.true
  br label %while.cond, !dbg !158

while.cond:                                       ; preds = %while.body, %if.then21
  %21 = load i32, i32* %sum, align 4, !dbg !160
  %cmp22 = icmp ne i32 %21, 1, !dbg !161
  br i1 %cmp22, label %land.rhs, label %land.end, !dbg !162

land.rhs:                                         ; preds = %while.cond
  %22 = load i32, i32* %sum, align 4, !dbg !163
  %cmp23 = icmp ne i32 %22, 89, !dbg !164
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %23 = phi i1 [ false, %while.cond ], [ %cmp23, %land.rhs ], !dbg !165
  br i1 %23, label %while.body, label %while.end, !dbg !158

while.body:                                       ; preds = %land.end
  %24 = load i32, i32* %sum, align 4, !dbg !166
  %call = call i32 @sum_square_digits(i32 %24), !dbg !168
  store i32 %call, i32* %sum, align 4, !dbg !169
  br label %while.cond, !dbg !158, !llvm.loop !170

while.end:                                        ; preds = %land.end
  br label %if.end24, !dbg !172

if.end24:                                         ; preds = %while.end, %land.lhs.true, %if.end18
  %25 = load i32, i32* %sum, align 4, !dbg !173
  %cmp25 = icmp eq i32 %25, 89, !dbg !175
  br i1 %cmp25, label %if.then26, label %if.end38, !dbg !176, !cf.info !109

if.then26:                                        ; preds = %if.end24
  call void @llvm.dbg.declare(metadata i32* %count_this_comb, metadata !177, metadata !DIExpression()), !dbg !179
  %26 = load i32, i32* %len.addr, align 4, !dbg !180
  %call27 = call i32 @factorial(i32 %26), !dbg !181
  store i32 %call27, i32* %count_this_comb, align 4, !dbg !179
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond28, !dbg !184

for.cond28:                                       ; preds = %for.inc34, %if.then26
  %27 = load i32, i32* %i, align 4, !dbg !185
  %cmp29 = icmp slt i32 %27, 10, !dbg !187
  br i1 %cmp29, label %for.body30, label %for.end36, !dbg !188

for.body30:                                       ; preds = %for.cond28
  %28 = load i32, i32* %i, align 4, !dbg !189
  %idxprom31 = sext i32 %28 to i64, !dbg !191
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %digitcounts, i64 0, i64 %idxprom31, !dbg !191
  %29 = load i32, i32* %arrayidx32, align 4, !dbg !191
  %call33 = call i32 @factorial(i32 %29), !dbg !192
  %30 = load i32, i32* %count_this_comb, align 4, !dbg !193
  %div = sdiv i32 %30, %call33, !dbg !193
  store i32 %div, i32* %count_this_comb, align 4, !dbg !193
  br label %for.inc34, !dbg !194

for.inc34:                                        ; preds = %for.body30
  %31 = load i32, i32* %i, align 4, !dbg !195
  %inc35 = add nsw i32 %31, 1, !dbg !195
  store i32 %inc35, i32* %i, align 4, !dbg !195
  br label %for.cond28, !dbg !196, !llvm.loop !197

for.end36:                                        ; preds = %for.cond28
  %32 = load i32, i32* %count_this_comb, align 4, !dbg !199
  %33 = load i32*, i32** %count89.addr, align 8, !dbg !200
  %34 = load i32, i32* %33, align 4, !dbg !201
  %add37 = add nsw i32 %34, %32, !dbg !201
  store i32 %add37, i32* %33, align 4, !dbg !201
  br label %if.end38, !dbg !202

if.end38:                                         ; preds = %for.end36, %if.end24
  store i64 1, i64* %retval, align 8, !dbg !203
  br label %return, !dbg !203

if.end39:                                         ; preds = %for.end
  %35 = load i32, i32* %at.addr, align 4, !dbg !204
  store i32 %35, i32* %i, align 4, !dbg !206
  br label %for.cond40, !dbg !207

for.cond40:                                       ; preds = %for.inc51, %if.end39
  %36 = load i32, i32* %i, align 4, !dbg !208
  %37 = load i32, i32* %max_types.addr, align 4, !dbg !210
  %cmp41 = icmp slt i32 %36, %37, !dbg !211
  br i1 %cmp41, label %for.body42, label %for.end53, !dbg !212

for.body42:                                       ; preds = %for.cond40
  %38 = load i32*, i32** %got.addr, align 8, !dbg !213
  %tobool43 = icmp ne i32* %38, null, !dbg !213
  br i1 %tobool43, label %if.then44, label %if.end47, !dbg !216, !cf.info !109

if.then44:                                        ; preds = %for.body42
  %39 = load i32, i32* %i, align 4, !dbg !217
  %40 = load i32*, i32** %got.addr, align 8, !dbg !218
  %41 = load i32, i32* %n_chosen.addr, align 4, !dbg !219
  %idxprom45 = sext i32 %41 to i64, !dbg !218
  %arrayidx46 = getelementptr inbounds i32, i32* %40, i64 %idxprom45, !dbg !218
  store i32 %39, i32* %arrayidx46, align 4, !dbg !220
  br label %if.end47, !dbg !218

if.end47:                                         ; preds = %if.then44, %for.body42
  %42 = load i32*, i32** %got.addr, align 8, !dbg !221
  %43 = load i32, i32* %n_chosen.addr, align 4, !dbg !222
  %add48 = add nsw i32 %43, 1, !dbg !223
  %44 = load i32, i32* %len.addr, align 4, !dbg !224
  %45 = load i32, i32* %i, align 4, !dbg !225
  %46 = load i32, i32* %max_types.addr, align 4, !dbg !226
  %47 = load i32*, i32** %count89.addr, align 8, !dbg !227
  %call49 = call i64 @choose_sum_and_count_89(i32* %42, i32 %add48, i32 %44, i32 %45, i32 %46, i32* %47), !dbg !228
  %48 = load i64, i64* %count, align 8, !dbg !229
  %add50 = add nsw i64 %48, %call49, !dbg !229
  store i64 %add50, i64* %count, align 8, !dbg !229
  br label %for.inc51, !dbg !230

for.inc51:                                        ; preds = %if.end47
  %49 = load i32, i32* %i, align 4, !dbg !231
  %inc52 = add nsw i32 %49, 1, !dbg !231
  store i32 %inc52, i32* %i, align 4, !dbg !231
  br label %for.cond40, !dbg !232, !llvm.loop !233

for.end53:                                        ; preds = %for.cond40
  %50 = load i64, i64* %count, align 8, !dbg !235
  store i64 %50, i64* %retval, align 8, !dbg !236
  br label %return, !dbg !236

return:                                           ; preds = %for.end53, %if.end38, %if.then17, %if.then2
  %51 = load i64, i64* %retval, align 8, !dbg !237
  ret i64 %51, !dbg !237
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !238 {
entry:
  %retval = alloca i32, align 4
  %chosen = alloca [10 x i32], align 16
  %count = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %chosen, metadata !241, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.declare(metadata i32* %count, metadata !243, metadata !DIExpression()), !dbg !244
  store i32 0, i32* %count, align 4, !dbg !244
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %chosen, i64 0, i64 0, !dbg !245
  %call = call i64 @choose_sum_and_count_89(i32* %arraydecay, i32 0, i32 8, i32 0, i32 10, i32* %count), !dbg !246
  %0 = load i32, i32* %count, align 4, !dbg !247
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !248
  ret i32 0, !dbg !249
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "digits", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "iterated-digits-squaring-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Iterated-digits-squaring")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !9)
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{!10}
!10 = !DISubrange(count: 10)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!15 = distinct !DISubprogram(name: "factorial", scope: !3, file: !3, line: 6, type: !16, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{!8, !8}
!18 = !DILocalVariable(name: "n", arg: 1, scope: !15, file: !3, line: 6, type: !8)
!19 = !DILocation(line: 6, column: 19, scope: !15)
!20 = !DILocation(line: 7, column: 12, scope: !15)
!21 = !DILocation(line: 7, column: 14, scope: !15)
!22 = !DILocation(line: 7, column: 25, scope: !15)
!23 = !DILocation(line: 7, column: 39, scope: !15)
!24 = !DILocation(line: 7, column: 41, scope: !15)
!25 = !DILocation(line: 7, column: 29, scope: !15)
!26 = !DILocation(line: 7, column: 27, scope: !15)
!27 = !DILocation(line: 7, column: 5, scope: !15)
!28 = distinct !DISubprogram(name: "sum_square_digits", scope: !3, file: !3, line: 11, type: !29, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !31}
!31 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!32 = !DILocalVariable(name: "n", arg: 1, scope: !28, file: !3, line: 11, type: !31)
!33 = !DILocation(line: 11, column: 45, scope: !28)
!34 = !DILocalVariable(name: "i", scope: !28, file: !3, line: 12, type: !8)
!35 = !DILocation(line: 12, column: 13, scope: !28)
!36 = !DILocalVariable(name: "num", scope: !28, file: !3, line: 12, type: !8)
!37 = !DILocation(line: 12, column: 15, scope: !28)
!38 = !DILocation(line: 12, column: 19, scope: !28)
!39 = !DILocalVariable(name: "sum", scope: !28, file: !3, line: 12, type: !8)
!40 = !DILocation(line: 12, column: 21, scope: !28)
!41 = !DILocation(line: 14, column: 9, scope: !28)
!42 = !DILocation(line: 14, column: 16, scope: !28)
!43 = !DILocation(line: 14, column: 20, scope: !28)
!44 = !DILocalVariable(name: "digit", scope: !45, file: !3, line: 16, type: !8)
!45 = distinct !DILexicalBlock(scope: !28, file: !3, line: 14, column: 25)
!46 = !DILocation(line: 16, column: 21, scope: !45)
!47 = !DILocation(line: 16, column: 27, scope: !45)
!48 = !DILocation(line: 16, column: 31, scope: !45)
!49 = !DILocation(line: 17, column: 22, scope: !45)
!50 = !DILocation(line: 17, column: 28, scope: !45)
!51 = !DILocation(line: 17, column: 26, scope: !45)
!52 = !DILocation(line: 17, column: 34, scope: !45)
!53 = !DILocation(line: 17, column: 20, scope: !45)
!54 = !DILocation(line: 19, column: 21, scope: !45)
!55 = !DILocation(line: 19, column: 25, scope: !45)
!56 = !DILocation(line: 19, column: 31, scope: !45)
!57 = !DILocation(line: 19, column: 30, scope: !45)
!58 = !DILocation(line: 19, column: 24, scope: !45)
!59 = !DILocation(line: 19, column: 20, scope: !45)
!60 = distinct !{!60, !41, !61}
!61 = !DILocation(line: 20, column: 9, scope: !28)
!62 = !DILocation(line: 21, column: 16, scope: !28)
!63 = !DILocation(line: 21, column: 9, scope: !28)
!64 = distinct !DISubprogram(name: "choose_sum_and_count_89", scope: !3, file: !3, line: 28, type: !65, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !68, !8, !8, !8, !8, !68}
!67 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!69 = !DILocalVariable(name: "got", arg: 1, scope: !64, file: !3, line: 28, type: !68)
!70 = !DILocation(line: 28, column: 36, scope: !64)
!71 = !DILocalVariable(name: "n_chosen", arg: 2, scope: !64, file: !3, line: 28, type: !8)
!72 = !DILocation(line: 28, column: 45, scope: !64)
!73 = !DILocalVariable(name: "len", arg: 3, scope: !64, file: !3, line: 28, type: !8)
!74 = !DILocation(line: 28, column: 59, scope: !64)
!75 = !DILocalVariable(name: "at", arg: 4, scope: !64, file: !3, line: 28, type: !8)
!76 = !DILocation(line: 28, column: 68, scope: !64)
!77 = !DILocalVariable(name: "max_types", arg: 5, scope: !64, file: !3, line: 28, type: !8)
!78 = !DILocation(line: 28, column: 76, scope: !64)
!79 = !DILocalVariable(name: "count89", arg: 6, scope: !64, file: !3, line: 28, type: !68)
!80 = !DILocation(line: 28, column: 92, scope: !64)
!81 = !DILocalVariable(name: "i", scope: !64, file: !3, line: 30, type: !8)
!82 = !DILocation(line: 30, column: 13, scope: !64)
!83 = !DILocalVariable(name: "count", scope: !64, file: !3, line: 31, type: !67)
!84 = !DILocation(line: 31, column: 14, scope: !64)
!85 = !DILocalVariable(name: "digitcounts", scope: !64, file: !3, line: 32, type: !86)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 320, elements: !9)
!87 = !DILocation(line: 32, column: 13, scope: !64)
!88 = !DILocation(line: 33, column: 15, scope: !89)
!89 = distinct !DILexicalBlock(scope: !64, file: !3, line: 33, column: 9)
!90 = !DILocation(line: 33, column: 14, scope: !89)
!91 = !DILocation(line: 33, column: 19, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !3, line: 33, column: 9)
!93 = !DILocation(line: 33, column: 21, scope: !92)
!94 = !DILocation(line: 33, column: 9, scope: !89)
!95 = !DILocation(line: 34, column: 29, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 33, column: 32)
!97 = !DILocation(line: 34, column: 17, scope: !96)
!98 = !DILocation(line: 34, column: 31, scope: !96)
!99 = !DILocation(line: 35, column: 9, scope: !96)
!100 = !DILocation(line: 33, column: 28, scope: !92)
!101 = !DILocation(line: 33, column: 9, scope: !92)
!102 = distinct !{!102, !94, !103}
!103 = !DILocation(line: 35, column: 9, scope: !89)
!104 = !DILocation(line: 36, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !64, file: !3, line: 36, column: 13)
!106 = !DILocation(line: 36, column: 25, scope: !105)
!107 = !DILocation(line: 36, column: 22, scope: !105)
!108 = !DILocation(line: 36, column: 13, scope: !64)
!109 = !{!"if"}
!110 = !DILocation(line: 37, column: 22, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !3, line: 37, column: 21)
!112 = distinct !DILexicalBlock(scope: !105, file: !3, line: 36, column: 30)
!113 = !DILocation(line: 37, column: 21, scope: !112)
!114 = !DILocation(line: 37, column: 27, scope: !111)
!115 = !DILocalVariable(name: "sum", scope: !112, file: !3, line: 39, type: !8)
!116 = !DILocation(line: 39, column: 21, scope: !112)
!117 = !DILocation(line: 40, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !3, line: 40, column: 17)
!119 = !DILocation(line: 40, column: 22, scope: !118)
!120 = !DILocation(line: 40, column: 29, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !3, line: 40, column: 17)
!122 = !DILocation(line: 40, column: 33, scope: !121)
!123 = !DILocation(line: 40, column: 31, scope: !121)
!124 = !DILocation(line: 40, column: 17, scope: !118)
!125 = !DILocalVariable(name: "digit", scope: !126, file: !3, line: 41, type: !8)
!126 = distinct !DILexicalBlock(scope: !121, file: !3, line: 40, column: 43)
!127 = !DILocation(line: 41, column: 29, scope: !126)
!128 = !DILocation(line: 41, column: 42, scope: !126)
!129 = !DILocation(line: 41, column: 46, scope: !126)
!130 = !DILocation(line: 41, column: 35, scope: !126)
!131 = !DILocation(line: 42, column: 37, scope: !126)
!132 = !DILocation(line: 42, column: 25, scope: !126)
!133 = !DILocation(line: 42, column: 43, scope: !126)
!134 = !DILocation(line: 43, column: 29, scope: !126)
!135 = !DILocation(line: 43, column: 35, scope: !126)
!136 = !DILocation(line: 43, column: 43, scope: !126)
!137 = !DILocation(line: 43, column: 41, scope: !126)
!138 = !DILocation(line: 43, column: 33, scope: !126)
!139 = !DILocation(line: 43, column: 28, scope: !126)
!140 = !DILocation(line: 44, column: 17, scope: !126)
!141 = !DILocation(line: 40, column: 39, scope: !121)
!142 = !DILocation(line: 40, column: 17, scope: !121)
!143 = distinct !{!143, !124, !144}
!144 = !DILocation(line: 44, column: 17, scope: !118)
!145 = !DILocation(line: 45, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !112, file: !3, line: 45, column: 21)
!147 = !DILocation(line: 45, column: 25, scope: !146)
!148 = !DILocation(line: 45, column: 21, scope: !112)
!149 = !DILocation(line: 46, column: 25, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !3, line: 45, column: 31)
!151 = !DILocation(line: 48, column: 22, scope: !152)
!152 = distinct !DILexicalBlock(scope: !112, file: !3, line: 48, column: 21)
!153 = !DILocation(line: 48, column: 26, scope: !152)
!154 = !DILocation(line: 48, column: 32, scope: !152)
!155 = !DILocation(line: 48, column: 36, scope: !152)
!156 = !DILocation(line: 48, column: 40, scope: !152)
!157 = !DILocation(line: 48, column: 21, scope: !112)
!158 = !DILocation(line: 49, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !152, file: !3, line: 48, column: 48)
!160 = !DILocation(line: 49, column: 33, scope: !159)
!161 = !DILocation(line: 49, column: 37, scope: !159)
!162 = !DILocation(line: 49, column: 43, scope: !159)
!163 = !DILocation(line: 49, column: 47, scope: !159)
!164 = !DILocation(line: 49, column: 51, scope: !159)
!165 = !DILocation(line: 0, scope: !159)
!166 = !DILocation(line: 50, column: 55, scope: !167)
!167 = distinct !DILexicalBlock(scope: !159, file: !3, line: 49, column: 59)
!168 = !DILocation(line: 50, column: 37, scope: !167)
!169 = !DILocation(line: 50, column: 36, scope: !167)
!170 = distinct !{!170, !158, !171}
!171 = !DILocation(line: 51, column: 25, scope: !159)
!172 = !DILocation(line: 52, column: 17, scope: !159)
!173 = !DILocation(line: 53, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !112, file: !3, line: 53, column: 21)
!175 = !DILocation(line: 53, column: 25, scope: !174)
!176 = !DILocation(line: 53, column: 21, scope: !112)
!177 = !DILocalVariable(name: "count_this_comb", scope: !178, file: !3, line: 54, type: !8)
!178 = distinct !DILexicalBlock(scope: !174, file: !3, line: 53, column: 32)
!179 = !DILocation(line: 54, column: 29, scope: !178)
!180 = !DILocation(line: 54, column: 55, scope: !178)
!181 = !DILocation(line: 54, column: 45, scope: !178)
!182 = !DILocation(line: 55, column: 31, scope: !183)
!183 = distinct !DILexicalBlock(scope: !178, file: !3, line: 55, column: 25)
!184 = !DILocation(line: 55, column: 30, scope: !183)
!185 = !DILocation(line: 55, column: 35, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !3, line: 55, column: 25)
!187 = !DILocation(line: 55, column: 36, scope: !186)
!188 = !DILocation(line: 55, column: 25, scope: !183)
!189 = !DILocation(line: 56, column: 72, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !3, line: 55, column: 46)
!191 = !DILocation(line: 56, column: 60, scope: !190)
!192 = !DILocation(line: 56, column: 50, scope: !190)
!193 = !DILocation(line: 56, column: 48, scope: !190)
!194 = !DILocation(line: 57, column: 25, scope: !190)
!195 = !DILocation(line: 55, column: 42, scope: !186)
!196 = !DILocation(line: 55, column: 25, scope: !186)
!197 = distinct !{!197, !188, !198}
!198 = !DILocation(line: 57, column: 25, scope: !183)
!199 = !DILocation(line: 58, column: 37, scope: !178)
!200 = !DILocation(line: 58, column: 27, scope: !178)
!201 = !DILocation(line: 58, column: 35, scope: !178)
!202 = !DILocation(line: 59, column: 17, scope: !178)
!203 = !DILocation(line: 61, column: 17, scope: !112)
!204 = !DILocation(line: 64, column: 18, scope: !205)
!205 = distinct !DILexicalBlock(scope: !64, file: !3, line: 64, column: 9)
!206 = !DILocation(line: 64, column: 16, scope: !205)
!207 = !DILocation(line: 64, column: 14, scope: !205)
!208 = !DILocation(line: 64, column: 22, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !3, line: 64, column: 9)
!210 = !DILocation(line: 64, column: 26, scope: !209)
!211 = !DILocation(line: 64, column: 24, scope: !209)
!212 = !DILocation(line: 64, column: 9, scope: !205)
!213 = !DILocation(line: 65, column: 21, scope: !214)
!214 = distinct !DILexicalBlock(scope: !215, file: !3, line: 65, column: 21)
!215 = distinct !DILexicalBlock(scope: !209, file: !3, line: 64, column: 42)
!216 = !DILocation(line: 65, column: 21, scope: !215)
!217 = !DILocation(line: 65, column: 42, scope: !214)
!218 = !DILocation(line: 65, column: 26, scope: !214)
!219 = !DILocation(line: 65, column: 30, scope: !214)
!220 = !DILocation(line: 65, column: 40, scope: !214)
!221 = !DILocation(line: 66, column: 50, scope: !215)
!222 = !DILocation(line: 66, column: 55, scope: !215)
!223 = !DILocation(line: 66, column: 64, scope: !215)
!224 = !DILocation(line: 66, column: 69, scope: !215)
!225 = !DILocation(line: 66, column: 74, scope: !215)
!226 = !DILocation(line: 66, column: 77, scope: !215)
!227 = !DILocation(line: 66, column: 88, scope: !215)
!228 = !DILocation(line: 66, column: 26, scope: !215)
!229 = !DILocation(line: 66, column: 23, scope: !215)
!230 = !DILocation(line: 67, column: 9, scope: !215)
!231 = !DILocation(line: 64, column: 38, scope: !209)
!232 = !DILocation(line: 64, column: 9, scope: !209)
!233 = distinct !{!233, !212, !234}
!234 = !DILocation(line: 67, column: 9, scope: !205)
!235 = !DILocation(line: 68, column: 16, scope: !64)
!236 = !DILocation(line: 68, column: 9, scope: !64)
!237 = !DILocation(line: 69, column: 1, scope: !64)
!238 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 71, type: !239, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!239 = !DISubroutineType(types: !240)
!240 = !{!8}
!241 = !DILocalVariable(name: "chosen", scope: !238, file: !3, line: 73, type: !86)
!242 = !DILocation(line: 73, column: 13, scope: !238)
!243 = !DILocalVariable(name: "count", scope: !238, file: !3, line: 74, type: !8)
!244 = !DILocation(line: 74, column: 13, scope: !238)
!245 = !DILocation(line: 79, column: 33, scope: !238)
!246 = !DILocation(line: 79, column: 9, scope: !238)
!247 = !DILocation(line: 80, column: 23, scope: !238)
!248 = !DILocation(line: 80, column: 9, scope: !238)
!249 = !DILocation(line: 81, column: 9, scope: !238)
