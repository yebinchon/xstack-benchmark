; ModuleID = 'increment-a-numerical-string.c'
source_filename = "increment-a-numerical-string.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"-1\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"text: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"  ->: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"+0\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"-41\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"+41\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"999\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"+999\00", align 1
@.str.8 = private unnamed_addr constant [43 x i8] c"109999999999999999999999999999999999999999\00", align 1
@.str.9 = private unnamed_addr constant [47 x i8] c"-100000000000000000000000000000000000000000000\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @incr(i8* %s) #0 !dbg !7 {
entry:
  %retval = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %begin = alloca i32, align 4
  %tail = alloca i32, align 4
  %len = alloca i32, align 4
  %neg = alloca i32, align 4
  %tgt = alloca i8, align 1
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !12, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.declare(metadata i32* %i, metadata !14, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %begin, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %tail, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %len, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %neg, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i8*, i8** %s.addr, align 8, !dbg !25
  %1 = load i8, i8* %0, align 1, !dbg !26
  %conv = sext i8 %1 to i32, !dbg !26
  %cmp = icmp eq i32 %conv, 45, !dbg !27
  %conv1 = zext i1 %cmp to i32, !dbg !27
  store i32 %conv1, i32* %neg, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i8* %tgt, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = load i32, i32* %neg, align 4, !dbg !30
  %tobool = icmp ne i32 %2, 0, !dbg !30
  %3 = zext i1 %tobool to i64, !dbg !30
  %cond = select i1 %tobool, i32 48, i32 57, !dbg !30
  %conv2 = trunc i32 %cond to i8, !dbg !30
  store i8 %conv2, i8* %tgt, align 1, !dbg !29
  %4 = load i8*, i8** %s.addr, align 8, !dbg !31
  %call = call i32 @strcmp(i8* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)) #5, !dbg !33
  %tobool3 = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool3, label %if.end, label %if.then, !dbg !34, !cf.info !35

if.then:                                          ; preds = %entry
  %5 = load i8*, i8** %s.addr, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !36
  store i8 48, i8* %arrayidx, align 1, !dbg !38
  %6 = load i8*, i8** %s.addr, align 8, !dbg !39
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 1, !dbg !39
  store i8 0, i8* %arrayidx4, align 1, !dbg !40
  %7 = load i8*, i8** %s.addr, align 8, !dbg !41
  store i8* %7, i8** %retval, align 8, !dbg !42
  br label %return, !dbg !42

if.end:                                           ; preds = %entry
  %8 = load i8*, i8** %s.addr, align 8, !dbg !43
  %call5 = call i64 @strlen(i8* %8) #5, !dbg !44
  %conv6 = trunc i64 %call5 to i32, !dbg !44
  store i32 %conv6, i32* %len, align 4, !dbg !45
  %9 = load i8*, i8** %s.addr, align 8, !dbg !46
  %10 = load i8, i8* %9, align 1, !dbg !47
  %conv7 = sext i8 %10 to i32, !dbg !47
  %cmp8 = icmp eq i32 %conv7, 45, !dbg !48
  br i1 %cmp8, label %lor.end, label %lor.rhs, !dbg !49

lor.rhs:                                          ; preds = %if.end
  %11 = load i8*, i8** %s.addr, align 8, !dbg !50
  %12 = load i8, i8* %11, align 1, !dbg !51
  %conv10 = sext i8 %12 to i32, !dbg !51
  %cmp11 = icmp eq i32 %conv10, 43, !dbg !52
  br label %lor.end, !dbg !49

lor.end:                                          ; preds = %lor.rhs, %if.end
  %13 = phi i1 [ true, %if.end ], [ %cmp11, %lor.rhs ]
  %14 = zext i1 %13 to i64, !dbg !53
  %cond13 = select i1 %13, i32 1, i32 0, !dbg !53
  store i32 %cond13, i32* %begin, align 4, !dbg !54
  %15 = load i32, i32* %len, align 4, !dbg !55
  %sub = sub nsw i32 %15, 1, !dbg !57
  store i32 %sub, i32* %tail, align 4, !dbg !58
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %lor.end
  %16 = load i32, i32* %tail, align 4, !dbg !60
  %17 = load i32, i32* %begin, align 4, !dbg !62
  %cmp14 = icmp sge i32 %16, %17, !dbg !63
  br i1 %cmp14, label %land.rhs, label %land.end, !dbg !64

land.rhs:                                         ; preds = %for.cond
  %18 = load i8*, i8** %s.addr, align 8, !dbg !65
  %19 = load i32, i32* %tail, align 4, !dbg !66
  %idxprom = sext i32 %19 to i64, !dbg !65
  %arrayidx16 = getelementptr inbounds i8, i8* %18, i64 %idxprom, !dbg !65
  %20 = load i8, i8* %arrayidx16, align 1, !dbg !65
  %conv17 = sext i8 %20 to i32, !dbg !65
  %21 = load i8, i8* %tgt, align 1, !dbg !67
  %conv18 = sext i8 %21 to i32, !dbg !67
  %cmp19 = icmp eq i32 %conv17, %conv18, !dbg !68
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %22 = phi i1 [ false, %for.cond ], [ %cmp19, %land.rhs ], !dbg !69
  br i1 %22, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %land.end
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %tail, align 4, !dbg !71
  %dec = add nsw i32 %23, -1, !dbg !71
  store i32 %dec, i32* %tail, align 4, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %land.end
  %24 = load i32, i32* %tail, align 4, !dbg !75
  %25 = load i32, i32* %begin, align 4, !dbg !77
  %cmp21 = icmp slt i32 %24, %25, !dbg !78
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !79, !cf.info !35

land.lhs.true:                                    ; preds = %for.end
  %26 = load i32, i32* %neg, align 4, !dbg !80
  %tobool23 = icmp ne i32 %26, 0, !dbg !80
  br i1 %tobool23, label %if.else, label %if.then24, !dbg !81, !cf.info !35

if.then24:                                        ; preds = %land.lhs.true
  %27 = load i32, i32* %begin, align 4, !dbg !82
  %tobool25 = icmp ne i32 %27, 0, !dbg !82
  br i1 %tobool25, label %if.end29, label %if.then26, !dbg !85, !cf.info !35

if.then26:                                        ; preds = %if.then24
  %28 = load i8*, i8** %s.addr, align 8, !dbg !86
  %29 = load i32, i32* %len, align 4, !dbg !87
  %add = add nsw i32 %29, 2, !dbg !88
  %conv27 = sext i32 %add to i64, !dbg !87
  %call28 = call i8* @realloc(i8* %28, i64 %conv27) #6, !dbg !89
  store i8* %call28, i8** %s.addr, align 8, !dbg !90
  br label %if.end29, !dbg !91

if.end29:                                         ; preds = %if.then26, %if.then24
  %30 = load i8*, i8** %s.addr, align 8, !dbg !92
  %arrayidx30 = getelementptr inbounds i8, i8* %30, i64 0, !dbg !92
  store i8 49, i8* %arrayidx30, align 1, !dbg !93
  store i32 1, i32* %i, align 4, !dbg !94
  br label %for.cond31, !dbg !96

for.cond31:                                       ; preds = %for.inc38, %if.end29
  %31 = load i32, i32* %i, align 4, !dbg !97
  %32 = load i32, i32* %len, align 4, !dbg !99
  %33 = load i32, i32* %begin, align 4, !dbg !100
  %sub32 = sub nsw i32 %32, %33, !dbg !101
  %cmp33 = icmp sle i32 %31, %sub32, !dbg !102
  br i1 %cmp33, label %for.body35, label %for.end39, !dbg !103

for.body35:                                       ; preds = %for.cond31
  %34 = load i8*, i8** %s.addr, align 8, !dbg !104
  %35 = load i32, i32* %i, align 4, !dbg !105
  %idxprom36 = sext i32 %35 to i64, !dbg !104
  %arrayidx37 = getelementptr inbounds i8, i8* %34, i64 %idxprom36, !dbg !104
  store i8 48, i8* %arrayidx37, align 1, !dbg !106
  br label %for.inc38, !dbg !104

for.inc38:                                        ; preds = %for.body35
  %36 = load i32, i32* %i, align 4, !dbg !107
  %inc = add nsw i32 %36, 1, !dbg !107
  store i32 %inc, i32* %i, align 4, !dbg !107
  br label %for.cond31, !dbg !108, !llvm.loop !109

for.end39:                                        ; preds = %for.cond31
  %37 = load i8*, i8** %s.addr, align 8, !dbg !111
  %38 = load i32, i32* %len, align 4, !dbg !112
  %add40 = add nsw i32 %38, 1, !dbg !113
  %idxprom41 = sext i32 %add40 to i64, !dbg !111
  %arrayidx42 = getelementptr inbounds i8, i8* %37, i64 %idxprom41, !dbg !111
  store i8 0, i8* %arrayidx42, align 1, !dbg !114
  br label %if.end88, !dbg !115

if.else:                                          ; preds = %land.lhs.true, %for.end
  %39 = load i32, i32* %tail, align 4, !dbg !116
  %40 = load i32, i32* %begin, align 4, !dbg !118
  %cmp43 = icmp eq i32 %39, %40, !dbg !119
  br i1 %cmp43, label %land.lhs.true45, label %if.else66, !dbg !120, !cf.info !35

land.lhs.true45:                                  ; preds = %if.else
  %41 = load i32, i32* %neg, align 4, !dbg !121
  %tobool46 = icmp ne i32 %41, 0, !dbg !121
  br i1 %tobool46, label %land.lhs.true47, label %if.else66, !dbg !122, !cf.info !35

land.lhs.true47:                                  ; preds = %land.lhs.true45
  %42 = load i8*, i8** %s.addr, align 8, !dbg !123
  %arrayidx48 = getelementptr inbounds i8, i8* %42, i64 1, !dbg !123
  %43 = load i8, i8* %arrayidx48, align 1, !dbg !123
  %conv49 = sext i8 %43 to i32, !dbg !123
  %cmp50 = icmp eq i32 %conv49, 49, !dbg !124
  br i1 %cmp50, label %if.then52, label %if.else66, !dbg !125, !cf.info !35

if.then52:                                        ; preds = %land.lhs.true47
  store i32 1, i32* %i, align 4, !dbg !126
  br label %for.cond53, !dbg !129

for.cond53:                                       ; preds = %for.inc60, %if.then52
  %44 = load i32, i32* %i, align 4, !dbg !130
  %45 = load i32, i32* %len, align 4, !dbg !132
  %46 = load i32, i32* %begin, align 4, !dbg !133
  %sub54 = sub nsw i32 %45, %46, !dbg !134
  %cmp55 = icmp slt i32 %44, %sub54, !dbg !135
  br i1 %cmp55, label %for.body57, label %for.end62, !dbg !136

for.body57:                                       ; preds = %for.cond53
  %47 = load i8*, i8** %s.addr, align 8, !dbg !137
  %48 = load i32, i32* %i, align 4, !dbg !138
  %idxprom58 = sext i32 %48 to i64, !dbg !137
  %arrayidx59 = getelementptr inbounds i8, i8* %47, i64 %idxprom58, !dbg !137
  store i8 57, i8* %arrayidx59, align 1, !dbg !139
  br label %for.inc60, !dbg !137

for.inc60:                                        ; preds = %for.body57
  %49 = load i32, i32* %i, align 4, !dbg !140
  %inc61 = add nsw i32 %49, 1, !dbg !140
  store i32 %inc61, i32* %i, align 4, !dbg !140
  br label %for.cond53, !dbg !141, !llvm.loop !142

for.end62:                                        ; preds = %for.cond53
  %50 = load i8*, i8** %s.addr, align 8, !dbg !144
  %51 = load i32, i32* %len, align 4, !dbg !145
  %sub63 = sub nsw i32 %51, 1, !dbg !146
  %idxprom64 = sext i32 %sub63 to i64, !dbg !144
  %arrayidx65 = getelementptr inbounds i8, i8* %50, i64 %idxprom64, !dbg !144
  store i8 0, i8* %arrayidx65, align 1, !dbg !147
  br label %if.end87, !dbg !148

if.else66:                                        ; preds = %land.lhs.true47, %land.lhs.true45, %if.else
  %52 = load i32, i32* %len, align 4, !dbg !149
  %sub67 = sub nsw i32 %52, 1, !dbg !152
  store i32 %sub67, i32* %i, align 4, !dbg !153
  br label %for.cond68, !dbg !154

for.cond68:                                       ; preds = %for.inc77, %if.else66
  %53 = load i32, i32* %i, align 4, !dbg !155
  %54 = load i32, i32* %tail, align 4, !dbg !157
  %cmp69 = icmp sgt i32 %53, %54, !dbg !158
  br i1 %cmp69, label %for.body71, label %for.end79, !dbg !159

for.body71:                                       ; preds = %for.cond68
  %55 = load i32, i32* %neg, align 4, !dbg !160
  %tobool72 = icmp ne i32 %55, 0, !dbg !160
  %56 = zext i1 %tobool72 to i64, !dbg !160
  %cond73 = select i1 %tobool72, i32 57, i32 48, !dbg !160
  %conv74 = trunc i32 %cond73 to i8, !dbg !160
  %57 = load i8*, i8** %s.addr, align 8, !dbg !161
  %58 = load i32, i32* %i, align 4, !dbg !162
  %idxprom75 = sext i32 %58 to i64, !dbg !161
  %arrayidx76 = getelementptr inbounds i8, i8* %57, i64 %idxprom75, !dbg !161
  store i8 %conv74, i8* %arrayidx76, align 1, !dbg !163
  br label %for.inc77, !dbg !161

for.inc77:                                        ; preds = %for.body71
  %59 = load i32, i32* %i, align 4, !dbg !164
  %dec78 = add nsw i32 %59, -1, !dbg !164
  store i32 %dec78, i32* %i, align 4, !dbg !164
  br label %for.cond68, !dbg !165, !llvm.loop !166

for.end79:                                        ; preds = %for.cond68
  %60 = load i32, i32* %neg, align 4, !dbg !168
  %tobool80 = icmp ne i32 %60, 0, !dbg !168
  %61 = zext i1 %tobool80 to i64, !dbg !168
  %cond81 = select i1 %tobool80, i32 -1, i32 1, !dbg !168
  %62 = load i8*, i8** %s.addr, align 8, !dbg !169
  %63 = load i32, i32* %tail, align 4, !dbg !170
  %idxprom82 = sext i32 %63 to i64, !dbg !169
  %arrayidx83 = getelementptr inbounds i8, i8* %62, i64 %idxprom82, !dbg !169
  %64 = load i8, i8* %arrayidx83, align 1, !dbg !171
  %conv84 = sext i8 %64 to i32, !dbg !171
  %add85 = add nsw i32 %conv84, %cond81, !dbg !171
  %conv86 = trunc i32 %add85 to i8, !dbg !171
  store i8 %conv86, i8* %arrayidx83, align 1, !dbg !171
  br label %if.end87

if.end87:                                         ; preds = %for.end79, %for.end62
  br label %if.end88

if.end88:                                         ; preds = %if.end87, %for.end39
  %65 = load i8*, i8** %s.addr, align 8, !dbg !172
  store i8* %65, i8** %retval, align 8, !dbg !173
  br label %return, !dbg !173

return:                                           ; preds = %if.end88, %if.then
  %66 = load i8*, i8** %retval, align 8, !dbg !174
  ret i8* %66, !dbg !174
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @string_test(i8* %s) #0 !dbg !175 {
entry:
  %s.addr = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i8** %ret, metadata !182, metadata !DIExpression()), !dbg !183
  %0 = load i8*, i8** %s.addr, align 8, !dbg !184
  %call = call i64 @strlen(i8* %0) #5, !dbg !185
  %call1 = call noalias i8* @malloc(i64 %call) #6, !dbg !186
  store i8* %call1, i8** %ret, align 8, !dbg !183
  %1 = load i8*, i8** %ret, align 8, !dbg !187
  %2 = load i8*, i8** %s.addr, align 8, !dbg !188
  %call2 = call i8* @strcpy(i8* %1, i8* %2) #6, !dbg !189
  %3 = load i8*, i8** %ret, align 8, !dbg !190
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i8* %3), !dbg !191
  %4 = load i8*, i8** %ret, align 8, !dbg !192
  %call4 = call i8* @incr(i8* %4), !dbg !193
  store i8* %call4, i8** %ret, align 8, !dbg !194
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i8* %call4), !dbg !195
  %5 = load i8*, i8** %ret, align 8, !dbg !196
  call void @free(i8* %5) #6, !dbg !197
  ret void, !dbg !198
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !199 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @string_test(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)), !dbg !202
  call void @string_test(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !203
  call void @string_test(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0)), !dbg !204
  call void @string_test(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0)), !dbg !205
  call void @string_test(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0)), !dbg !206
  call void @string_test(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0)), !dbg !207
  call void @string_test(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.8, i64 0, i64 0)), !dbg !208
  call void @string_test(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.9, i64 0, i64 0)), !dbg !209
  ret i32 0, !dbg !210
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "increment-a-numerical-string.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Increment-a-numerical-string")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "incr", scope: !1, file: !1, line: 11, type: !8, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !DILocalVariable(name: "s", arg: 1, scope: !7, file: !1, line: 11, type: !10)
!13 = !DILocation(line: 11, column: 19, scope: !7)
!14 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 13, type: !15)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocation(line: 13, column: 6, scope: !7)
!17 = !DILocalVariable(name: "begin", scope: !7, file: !1, line: 13, type: !15)
!18 = !DILocation(line: 13, column: 9, scope: !7)
!19 = !DILocalVariable(name: "tail", scope: !7, file: !1, line: 13, type: !15)
!20 = !DILocation(line: 13, column: 16, scope: !7)
!21 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 13, type: !15)
!22 = !DILocation(line: 13, column: 22, scope: !7)
!23 = !DILocalVariable(name: "neg", scope: !7, file: !1, line: 14, type: !15)
!24 = !DILocation(line: 14, column: 6, scope: !7)
!25 = !DILocation(line: 14, column: 14, scope: !7)
!26 = !DILocation(line: 14, column: 13, scope: !7)
!27 = !DILocation(line: 14, column: 16, scope: !7)
!28 = !DILocalVariable(name: "tgt", scope: !7, file: !1, line: 15, type: !11)
!29 = !DILocation(line: 15, column: 7, scope: !7)
!30 = !DILocation(line: 15, column: 13, scope: !7)
!31 = !DILocation(line: 18, column: 14, scope: !32)
!32 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 6)
!33 = !DILocation(line: 18, column: 7, scope: !32)
!34 = !DILocation(line: 18, column: 6, scope: !7)
!35 = !{!"if"}
!36 = !DILocation(line: 19, column: 3, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 18, column: 24)
!38 = !DILocation(line: 19, column: 8, scope: !37)
!39 = !DILocation(line: 19, column: 15, scope: !37)
!40 = !DILocation(line: 19, column: 20, scope: !37)
!41 = !DILocation(line: 20, column: 10, scope: !37)
!42 = !DILocation(line: 20, column: 3, scope: !37)
!43 = !DILocation(line: 23, column: 15, scope: !7)
!44 = !DILocation(line: 23, column: 8, scope: !7)
!45 = !DILocation(line: 23, column: 6, scope: !7)
!46 = !DILocation(line: 24, column: 12, scope: !7)
!47 = !DILocation(line: 24, column: 11, scope: !7)
!48 = !DILocation(line: 24, column: 14, scope: !7)
!49 = !DILocation(line: 24, column: 21, scope: !7)
!50 = !DILocation(line: 24, column: 25, scope: !7)
!51 = !DILocation(line: 24, column: 24, scope: !7)
!52 = !DILocation(line: 24, column: 27, scope: !7)
!53 = !DILocation(line: 24, column: 10, scope: !7)
!54 = !DILocation(line: 24, column: 8, scope: !7)
!55 = !DILocation(line: 27, column: 14, scope: !56)
!56 = distinct !DILexicalBlock(scope: !7, file: !1, line: 27, column: 2)
!57 = !DILocation(line: 27, column: 18, scope: !56)
!58 = !DILocation(line: 27, column: 12, scope: !56)
!59 = !DILocation(line: 27, column: 7, scope: !56)
!60 = !DILocation(line: 27, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !1, line: 27, column: 2)
!62 = !DILocation(line: 27, column: 31, scope: !61)
!63 = !DILocation(line: 27, column: 28, scope: !61)
!64 = !DILocation(line: 27, column: 37, scope: !61)
!65 = !DILocation(line: 27, column: 40, scope: !61)
!66 = !DILocation(line: 27, column: 42, scope: !61)
!67 = !DILocation(line: 27, column: 51, scope: !61)
!68 = !DILocation(line: 27, column: 48, scope: !61)
!69 = !DILocation(line: 0, scope: !61)
!70 = !DILocation(line: 27, column: 2, scope: !56)
!71 = !DILocation(line: 27, column: 60, scope: !61)
!72 = !DILocation(line: 27, column: 2, scope: !61)
!73 = distinct !{!73, !70, !74}
!74 = !DILocation(line: 27, column: 63, scope: !56)
!75 = !DILocation(line: 29, column: 6, scope: !76)
!76 = distinct !DILexicalBlock(scope: !7, file: !1, line: 29, column: 6)
!77 = !DILocation(line: 29, column: 13, scope: !76)
!78 = !DILocation(line: 29, column: 11, scope: !76)
!79 = !DILocation(line: 29, column: 19, scope: !76)
!80 = !DILocation(line: 29, column: 23, scope: !76)
!81 = !DILocation(line: 29, column: 6, scope: !7)
!82 = !DILocation(line: 31, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 31, column: 7)
!84 = distinct !DILexicalBlock(scope: !76, file: !1, line: 29, column: 28)
!85 = !DILocation(line: 31, column: 7, scope: !84)
!86 = !DILocation(line: 31, column: 27, scope: !83)
!87 = !DILocation(line: 31, column: 30, scope: !83)
!88 = !DILocation(line: 31, column: 34, scope: !83)
!89 = !DILocation(line: 31, column: 19, scope: !83)
!90 = !DILocation(line: 31, column: 17, scope: !83)
!91 = !DILocation(line: 31, column: 15, scope: !83)
!92 = !DILocation(line: 32, column: 3, scope: !84)
!93 = !DILocation(line: 32, column: 8, scope: !84)
!94 = !DILocation(line: 33, column: 10, scope: !95)
!95 = distinct !DILexicalBlock(scope: !84, file: !1, line: 33, column: 3)
!96 = !DILocation(line: 33, column: 8, scope: !95)
!97 = !DILocation(line: 33, column: 15, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !1, line: 33, column: 3)
!99 = !DILocation(line: 33, column: 20, scope: !98)
!100 = !DILocation(line: 33, column: 26, scope: !98)
!101 = !DILocation(line: 33, column: 24, scope: !98)
!102 = !DILocation(line: 33, column: 17, scope: !98)
!103 = !DILocation(line: 33, column: 3, scope: !95)
!104 = !DILocation(line: 33, column: 38, scope: !98)
!105 = !DILocation(line: 33, column: 40, scope: !98)
!106 = !DILocation(line: 33, column: 43, scope: !98)
!107 = !DILocation(line: 33, column: 34, scope: !98)
!108 = !DILocation(line: 33, column: 3, scope: !98)
!109 = distinct !{!109, !103, !110}
!110 = !DILocation(line: 33, column: 45, scope: !95)
!111 = !DILocation(line: 34, column: 3, scope: !84)
!112 = !DILocation(line: 34, column: 5, scope: !84)
!113 = !DILocation(line: 34, column: 9, scope: !84)
!114 = !DILocation(line: 34, column: 14, scope: !84)
!115 = !DILocation(line: 35, column: 2, scope: !84)
!116 = !DILocation(line: 35, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !76, file: !1, line: 35, column: 13)
!118 = !DILocation(line: 35, column: 21, scope: !117)
!119 = !DILocation(line: 35, column: 18, scope: !117)
!120 = !DILocation(line: 35, column: 27, scope: !117)
!121 = !DILocation(line: 35, column: 30, scope: !117)
!122 = !DILocation(line: 35, column: 34, scope: !117)
!123 = !DILocation(line: 35, column: 37, scope: !117)
!124 = !DILocation(line: 35, column: 42, scope: !117)
!125 = !DILocation(line: 35, column: 13, scope: !76)
!126 = !DILocation(line: 37, column: 10, scope: !127)
!127 = distinct !DILexicalBlock(scope: !128, file: !1, line: 37, column: 3)
!128 = distinct !DILexicalBlock(scope: !117, file: !1, line: 35, column: 50)
!129 = !DILocation(line: 37, column: 8, scope: !127)
!130 = !DILocation(line: 37, column: 15, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !1, line: 37, column: 3)
!132 = !DILocation(line: 37, column: 19, scope: !131)
!133 = !DILocation(line: 37, column: 25, scope: !131)
!134 = !DILocation(line: 37, column: 23, scope: !131)
!135 = !DILocation(line: 37, column: 17, scope: !131)
!136 = !DILocation(line: 37, column: 3, scope: !127)
!137 = !DILocation(line: 37, column: 37, scope: !131)
!138 = !DILocation(line: 37, column: 39, scope: !131)
!139 = !DILocation(line: 37, column: 42, scope: !131)
!140 = !DILocation(line: 37, column: 33, scope: !131)
!141 = !DILocation(line: 37, column: 3, scope: !131)
!142 = distinct !{!142, !136, !143}
!143 = !DILocation(line: 37, column: 44, scope: !127)
!144 = !DILocation(line: 38, column: 3, scope: !128)
!145 = !DILocation(line: 38, column: 5, scope: !128)
!146 = !DILocation(line: 38, column: 9, scope: !128)
!147 = !DILocation(line: 38, column: 14, scope: !128)
!148 = !DILocation(line: 39, column: 2, scope: !128)
!149 = !DILocation(line: 40, column: 12, scope: !150)
!150 = distinct !DILexicalBlock(scope: !151, file: !1, line: 40, column: 3)
!151 = distinct !DILexicalBlock(scope: !117, file: !1, line: 39, column: 9)
!152 = !DILocation(line: 40, column: 16, scope: !150)
!153 = !DILocation(line: 40, column: 10, scope: !150)
!154 = !DILocation(line: 40, column: 8, scope: !150)
!155 = !DILocation(line: 40, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !150, file: !1, line: 40, column: 3)
!157 = !DILocation(line: 40, column: 25, scope: !156)
!158 = !DILocation(line: 40, column: 23, scope: !156)
!159 = !DILocation(line: 40, column: 3, scope: !150)
!160 = !DILocation(line: 41, column: 11, scope: !156)
!161 = !DILocation(line: 41, column: 4, scope: !156)
!162 = !DILocation(line: 41, column: 6, scope: !156)
!163 = !DILocation(line: 41, column: 9, scope: !156)
!164 = !DILocation(line: 40, column: 32, scope: !156)
!165 = !DILocation(line: 40, column: 3, scope: !156)
!166 = distinct !{!166, !159, !167}
!167 = !DILocation(line: 41, column: 23, scope: !150)
!168 = !DILocation(line: 42, column: 14, scope: !151)
!169 = !DILocation(line: 42, column: 3, scope: !151)
!170 = !DILocation(line: 42, column: 5, scope: !151)
!171 = !DILocation(line: 42, column: 11, scope: !151)
!172 = !DILocation(line: 45, column: 9, scope: !7)
!173 = !DILocation(line: 45, column: 2, scope: !7)
!174 = !DILocation(line: 46, column: 1, scope: !7)
!175 = distinct !DISubprogram(name: "string_test", scope: !1, file: !1, line: 48, type: !176, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!176 = !DISubroutineType(types: !177)
!177 = !{null, !178}
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!179 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!180 = !DILocalVariable(name: "s", arg: 1, scope: !175, file: !1, line: 48, type: !178)
!181 = !DILocation(line: 48, column: 30, scope: !175)
!182 = !DILocalVariable(name: "ret", scope: !175, file: !1, line: 50, type: !10)
!183 = !DILocation(line: 50, column: 8, scope: !175)
!184 = !DILocation(line: 50, column: 28, scope: !175)
!185 = !DILocation(line: 50, column: 21, scope: !175)
!186 = !DILocation(line: 50, column: 14, scope: !175)
!187 = !DILocation(line: 51, column: 9, scope: !175)
!188 = !DILocation(line: 51, column: 14, scope: !175)
!189 = !DILocation(line: 51, column: 2, scope: !175)
!190 = !DILocation(line: 53, column: 23, scope: !175)
!191 = !DILocation(line: 53, column: 2, scope: !175)
!192 = !DILocation(line: 54, column: 34, scope: !175)
!193 = !DILocation(line: 54, column: 29, scope: !175)
!194 = !DILocation(line: 54, column: 27, scope: !175)
!195 = !DILocation(line: 54, column: 2, scope: !175)
!196 = !DILocation(line: 55, column: 7, scope: !175)
!197 = !DILocation(line: 55, column: 2, scope: !175)
!198 = !DILocation(line: 56, column: 1, scope: !175)
!199 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 58, type: !200, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!200 = !DISubroutineType(types: !201)
!201 = !{!15}
!202 = !DILocation(line: 60, column: 2, scope: !199)
!203 = !DILocation(line: 61, column: 2, scope: !199)
!204 = !DILocation(line: 62, column: 2, scope: !199)
!205 = !DILocation(line: 63, column: 2, scope: !199)
!206 = !DILocation(line: 64, column: 2, scope: !199)
!207 = !DILocation(line: 65, column: 2, scope: !199)
!208 = !DILocation(line: 66, column: 2, scope: !199)
!209 = !DILocation(line: 67, column: 2, scope: !199)
!210 = !DILocation(line: 69, column: 2, scope: !199)
