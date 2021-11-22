; ModuleID = 'abc-problem.c'
source_filename = "abc-problem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"BO\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"XK\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"DQ\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"CP\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"NA\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"GT\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"RE\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"TG\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"QD\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"FS\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"JW\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"HU\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"VI\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"AN\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"OB\00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"ER\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"LY\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"PC\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"ZM\00", align 1
@__const.main.blocks = private unnamed_addr constant [21 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0), i8* null], align 16
@.str.19 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.20 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"BARK\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c"BOOK\00", align 1
@.str.23 = private unnamed_addr constant [6 x i8] c"TREAT\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"COMMON\00", align 1
@.str.25 = private unnamed_addr constant [6 x i8] c"SQUAD\00", align 1
@.str.26 = private unnamed_addr constant [8 x i8] c"Confuse\00", align 1
@__const.main.words = private unnamed_addr constant [9 x i8*] [i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.26, i32 0, i32 0), i8* null], align 16
@.str.27 = private unnamed_addr constant [7 x i8] c"%s\09%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @can_make_words(i8** %b, i8* %word) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %b.addr = alloca i8**, align 8
  %word.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %ret = alloca i32, align 4
  %c = alloca i32, align 4
  %tmp = alloca i8*, align 8
  %tmp41 = alloca i8*, align 8
  store i8** %b, i8*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %b.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8* %word, i8** %word.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %word.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %ret, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %c, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i8*, i8** %word.addr, align 8, !dbg !24
  %1 = load i8, i8* %0, align 1, !dbg !25
  %conv = sext i8 %1 to i32, !dbg !25
  %call = call i32 @toupper(i32 %conv) #5, !dbg !26
  store i32 %call, i32* %c, align 4, !dbg !23
  %2 = load i32, i32* %c, align 4, !dbg !27
  %tobool = icmp ne i32 %2, 0, !dbg !27
  br i1 %tobool, label %if.end, label %if.then, !dbg !29, !cf.info !30

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

if.end:                                           ; preds = %entry
  %3 = load i8**, i8*** %b.addr, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 0, !dbg !32
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !32
  %tobool1 = icmp ne i8* %4, null, !dbg !32
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !34, !cf.info !30

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !35
  br label %return, !dbg !35

if.end3:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i8**, i8*** %b.addr, align 8, !dbg !39
  %6 = load i32, i32* %i, align 4, !dbg !41
  %idxprom = sext i32 %6 to i64, !dbg !39
  %arrayidx4 = getelementptr inbounds i8*, i8** %5, i64 %idxprom, !dbg !39
  %7 = load i8*, i8** %arrayidx4, align 8, !dbg !39
  %tobool5 = icmp ne i8* %7, null, !dbg !39
  br i1 %tobool5, label %land.rhs, label %land.end, !dbg !42

land.rhs:                                         ; preds = %for.cond
  %8 = load i32, i32* %ret, align 4, !dbg !43
  %tobool6 = icmp ne i32 %8, 0, !dbg !44
  %lnot = xor i1 %tobool6, true, !dbg !44
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %9 = phi i1 [ false, %for.cond ], [ %lnot, %land.rhs ], !dbg !45
  br i1 %9, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %land.end
  %10 = load i8**, i8*** %b.addr, align 8, !dbg !47
  %11 = load i32, i32* %i, align 4, !dbg !50
  %idxprom7 = sext i32 %11 to i64, !dbg !47
  %arrayidx8 = getelementptr inbounds i8*, i8** %10, i64 %idxprom7, !dbg !47
  %12 = load i8*, i8** %arrayidx8, align 8, !dbg !47
  %arrayidx9 = getelementptr inbounds i8, i8* %12, i64 0, !dbg !47
  %13 = load i8, i8* %arrayidx9, align 1, !dbg !47
  %conv10 = sext i8 %13 to i32, !dbg !47
  %14 = load i32, i32* %c, align 4, !dbg !51
  %cmp = icmp ne i32 %conv10, %14, !dbg !52
  br i1 %cmp, label %land.lhs.true, label %if.end19, !dbg !53, !cf.info !30

land.lhs.true:                                    ; preds = %for.body
  %15 = load i8**, i8*** %b.addr, align 8, !dbg !54
  %16 = load i32, i32* %i, align 4, !dbg !55
  %idxprom12 = sext i32 %16 to i64, !dbg !54
  %arrayidx13 = getelementptr inbounds i8*, i8** %15, i64 %idxprom12, !dbg !54
  %17 = load i8*, i8** %arrayidx13, align 8, !dbg !54
  %arrayidx14 = getelementptr inbounds i8, i8* %17, i64 1, !dbg !54
  %18 = load i8, i8* %arrayidx14, align 1, !dbg !54
  %conv15 = sext i8 %18 to i32, !dbg !54
  %19 = load i32, i32* %c, align 4, !dbg !56
  %cmp16 = icmp ne i32 %conv15, %19, !dbg !57
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !58, !cf.info !30

if.then18:                                        ; preds = %land.lhs.true
  br label %for.inc, !dbg !59

if.end19:                                         ; preds = %land.lhs.true, %for.body
  %20 = load i8**, i8*** %b.addr, align 8, !dbg !60
  %21 = load i32, i32* %i, align 4, !dbg !60
  %idxprom20 = sext i32 %21 to i64, !dbg !60
  %arrayidx21 = getelementptr inbounds i8*, i8** %20, i64 %idxprom20, !dbg !60
  %22 = load i8*, i8** %arrayidx21, align 8, !dbg !60
  %23 = load i8**, i8*** %b.addr, align 8, !dbg !60
  %arrayidx22 = getelementptr inbounds i8*, i8** %23, i64 0, !dbg !60
  %24 = load i8*, i8** %arrayidx22, align 8, !dbg !60
  %cmp23 = icmp ne i8* %22, %24, !dbg !60
  br i1 %cmp23, label %if.then25, label %if.end32, !dbg !62, !cf.info !30

if.then25:                                        ; preds = %if.end19
  call void @llvm.dbg.declare(metadata i8** %tmp, metadata !63, metadata !DIExpression()), !dbg !65
  %25 = load i8**, i8*** %b.addr, align 8, !dbg !65
  %26 = load i32, i32* %i, align 4, !dbg !65
  %idxprom26 = sext i32 %26 to i64, !dbg !65
  %arrayidx27 = getelementptr inbounds i8*, i8** %25, i64 %idxprom26, !dbg !65
  %27 = load i8*, i8** %arrayidx27, align 8, !dbg !65
  store i8* %27, i8** %tmp, align 8, !dbg !65
  %28 = load i8**, i8*** %b.addr, align 8, !dbg !65
  %arrayidx28 = getelementptr inbounds i8*, i8** %28, i64 0, !dbg !65
  %29 = load i8*, i8** %arrayidx28, align 8, !dbg !65
  %30 = load i8**, i8*** %b.addr, align 8, !dbg !65
  %31 = load i32, i32* %i, align 4, !dbg !65
  %idxprom29 = sext i32 %31 to i64, !dbg !65
  %arrayidx30 = getelementptr inbounds i8*, i8** %30, i64 %idxprom29, !dbg !65
  store i8* %29, i8** %arrayidx30, align 8, !dbg !65
  %32 = load i8*, i8** %tmp, align 8, !dbg !65
  %33 = load i8**, i8*** %b.addr, align 8, !dbg !65
  %arrayidx31 = getelementptr inbounds i8*, i8** %33, i64 0, !dbg !65
  store i8* %32, i8** %arrayidx31, align 8, !dbg !65
  br label %if.end32, !dbg !65

if.end32:                                         ; preds = %if.then25, %if.end19
  %34 = load i8**, i8*** %b.addr, align 8, !dbg !66
  %add.ptr = getelementptr inbounds i8*, i8** %34, i64 1, !dbg !67
  %35 = load i8*, i8** %word.addr, align 8, !dbg !68
  %add.ptr33 = getelementptr inbounds i8, i8* %35, i64 1, !dbg !69
  %call34 = call i32 @can_make_words(i8** %add.ptr, i8* %add.ptr33), !dbg !70
  store i32 %call34, i32* %ret, align 4, !dbg !71
  %36 = load i8**, i8*** %b.addr, align 8, !dbg !72
  %37 = load i32, i32* %i, align 4, !dbg !72
  %idxprom35 = sext i32 %37 to i64, !dbg !72
  %arrayidx36 = getelementptr inbounds i8*, i8** %36, i64 %idxprom35, !dbg !72
  %38 = load i8*, i8** %arrayidx36, align 8, !dbg !72
  %39 = load i8**, i8*** %b.addr, align 8, !dbg !72
  %arrayidx37 = getelementptr inbounds i8*, i8** %39, i64 0, !dbg !72
  %40 = load i8*, i8** %arrayidx37, align 8, !dbg !72
  %cmp38 = icmp ne i8* %38, %40, !dbg !72
  br i1 %cmp38, label %if.then40, label %if.end48, !dbg !74, !cf.info !30

if.then40:                                        ; preds = %if.end32
  call void @llvm.dbg.declare(metadata i8** %tmp41, metadata !75, metadata !DIExpression()), !dbg !77
  %41 = load i8**, i8*** %b.addr, align 8, !dbg !77
  %42 = load i32, i32* %i, align 4, !dbg !77
  %idxprom42 = sext i32 %42 to i64, !dbg !77
  %arrayidx43 = getelementptr inbounds i8*, i8** %41, i64 %idxprom42, !dbg !77
  %43 = load i8*, i8** %arrayidx43, align 8, !dbg !77
  store i8* %43, i8** %tmp41, align 8, !dbg !77
  %44 = load i8**, i8*** %b.addr, align 8, !dbg !77
  %arrayidx44 = getelementptr inbounds i8*, i8** %44, i64 0, !dbg !77
  %45 = load i8*, i8** %arrayidx44, align 8, !dbg !77
  %46 = load i8**, i8*** %b.addr, align 8, !dbg !77
  %47 = load i32, i32* %i, align 4, !dbg !77
  %idxprom45 = sext i32 %47 to i64, !dbg !77
  %arrayidx46 = getelementptr inbounds i8*, i8** %46, i64 %idxprom45, !dbg !77
  store i8* %45, i8** %arrayidx46, align 8, !dbg !77
  %48 = load i8*, i8** %tmp41, align 8, !dbg !77
  %49 = load i8**, i8*** %b.addr, align 8, !dbg !77
  %arrayidx47 = getelementptr inbounds i8*, i8** %49, i64 0, !dbg !77
  store i8* %48, i8** %arrayidx47, align 8, !dbg !77
  br label %if.end48, !dbg !77

if.end48:                                         ; preds = %if.then40, %if.end32
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %if.end48, %if.then18
  %50 = load i32, i32* %i, align 4, !dbg !79
  %inc = add nsw i32 %50, 1, !dbg !79
  store i32 %inc, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %land.end
  %51 = load i32, i32* %ret, align 4, !dbg !83
  store i32 %51, i32* %retval, align 4, !dbg !84
  br label %return, !dbg !84

return:                                           ; preds = %for.end, %if.then2, %if.then
  %52 = load i32, i32* %retval, align 4, !dbg !85
  ret i32 %52, !dbg !85
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @toupper(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %blocks = alloca [21 x i8*], align 16
  %words = alloca [9 x i8*], align 16
  %w = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [21 x i8*]* %blocks, metadata !89, metadata !DIExpression()), !dbg !93
  %0 = bitcast [21 x i8*]* %blocks to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([21 x i8*]* @__const.main.blocks to i8*), i64 168, i1 false), !dbg !93
  call void @llvm.dbg.declare(metadata [9 x i8*]* %words, metadata !94, metadata !DIExpression()), !dbg !98
  %1 = bitcast [9 x i8*]* %words to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([9 x i8*]* @__const.main.words to i8*), i64 72, i1 false), !dbg !98
  call void @llvm.dbg.declare(metadata i8*** %w, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [9 x i8*], [9 x i8*]* %words, i64 0, i64 0, !dbg !101
  store i8** %arraydecay, i8*** %w, align 8, !dbg !103
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i8**, i8*** %w, align 8, !dbg !105
  %3 = load i8*, i8** %2, align 8, !dbg !107
  %tobool = icmp ne i8* %3, null, !dbg !108
  br i1 %tobool, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %4 = load i8**, i8*** %w, align 8, !dbg !109
  %5 = load i8*, i8** %4, align 8, !dbg !110
  %arraydecay1 = getelementptr inbounds [21 x i8*], [21 x i8*]* %blocks, i64 0, i64 0, !dbg !111
  %6 = load i8**, i8*** %w, align 8, !dbg !112
  %7 = load i8*, i8** %6, align 8, !dbg !113
  %call = call i32 @can_make_words(i8** %arraydecay1, i8* %7), !dbg !114
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27, i64 0, i64 0), i8* %5, i32 %call), !dbg !115
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %for.body
  %8 = load i8**, i8*** %w, align 8, !dbg !116
  %incdec.ptr = getelementptr inbounds i8*, i8** %8, i32 1, !dbg !116
  store i8** %incdec.ptr, i8*** %w, align 8, !dbg !116
  br label %for.cond, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !120
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "abc-problem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/ABC-Problem")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "can_make_words", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !12}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "b", arg: 1, scope: !7, file: !1, line: 4, type: !11)
!15 = !DILocation(line: 4, column: 27, scope: !7)
!16 = !DILocalVariable(name: "word", arg: 2, scope: !7, file: !1, line: 4, type: !12)
!17 = !DILocation(line: 4, column: 36, scope: !7)
!18 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 6, type: !10)
!19 = !DILocation(line: 6, column: 6, scope: !7)
!20 = !DILocalVariable(name: "ret", scope: !7, file: !1, line: 6, type: !10)
!21 = !DILocation(line: 6, column: 9, scope: !7)
!22 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 6, type: !10)
!23 = !DILocation(line: 6, column: 18, scope: !7)
!24 = !DILocation(line: 6, column: 31, scope: !7)
!25 = !DILocation(line: 6, column: 30, scope: !7)
!26 = !DILocation(line: 6, column: 22, scope: !7)
!27 = !DILocation(line: 10, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 6)
!29 = !DILocation(line: 10, column: 6, scope: !7)
!30 = !{!"if"}
!31 = !DILocation(line: 10, column: 10, scope: !28)
!32 = !DILocation(line: 11, column: 7, scope: !33)
!33 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 6)
!34 = !DILocation(line: 11, column: 6, scope: !7)
!35 = !DILocation(line: 11, column: 13, scope: !33)
!36 = !DILocation(line: 13, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 2)
!38 = !DILocation(line: 13, column: 7, scope: !37)
!39 = !DILocation(line: 13, column: 14, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 13, column: 2)
!41 = !DILocation(line: 13, column: 16, scope: !40)
!42 = !DILocation(line: 13, column: 19, scope: !40)
!43 = !DILocation(line: 13, column: 23, scope: !40)
!44 = !DILocation(line: 13, column: 22, scope: !40)
!45 = !DILocation(line: 0, scope: !40)
!46 = !DILocation(line: 13, column: 2, scope: !37)
!47 = !DILocation(line: 14, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 14, column: 7)
!49 = distinct !DILexicalBlock(scope: !40, file: !1, line: 13, column: 33)
!50 = !DILocation(line: 14, column: 9, scope: !48)
!51 = !DILocation(line: 14, column: 18, scope: !48)
!52 = !DILocation(line: 14, column: 15, scope: !48)
!53 = !DILocation(line: 14, column: 20, scope: !48)
!54 = !DILocation(line: 14, column: 23, scope: !48)
!55 = !DILocation(line: 14, column: 25, scope: !48)
!56 = !DILocation(line: 14, column: 34, scope: !48)
!57 = !DILocation(line: 14, column: 31, scope: !48)
!58 = !DILocation(line: 14, column: 7, scope: !49)
!59 = !DILocation(line: 14, column: 37, scope: !48)
!60 = !DILocation(line: 15, column: 3, scope: !61)
!61 = distinct !DILexicalBlock(scope: !49, file: !1, line: 15, column: 3)
!62 = !DILocation(line: 15, column: 3, scope: !49)
!63 = !DILocalVariable(name: "tmp", scope: !64, file: !1, line: 15, type: !12)
!64 = distinct !DILexicalBlock(scope: !61, file: !1, line: 15, column: 3)
!65 = !DILocation(line: 15, column: 3, scope: !64)
!66 = !DILocation(line: 16, column: 24, scope: !49)
!67 = !DILocation(line: 16, column: 26, scope: !49)
!68 = !DILocation(line: 16, column: 31, scope: !49)
!69 = !DILocation(line: 16, column: 36, scope: !49)
!70 = !DILocation(line: 16, column: 9, scope: !49)
!71 = !DILocation(line: 16, column: 7, scope: !49)
!72 = !DILocation(line: 17, column: 3, scope: !73)
!73 = distinct !DILexicalBlock(scope: !49, file: !1, line: 17, column: 3)
!74 = !DILocation(line: 17, column: 3, scope: !49)
!75 = !DILocalVariable(name: "tmp", scope: !76, file: !1, line: 17, type: !12)
!76 = distinct !DILexicalBlock(scope: !73, file: !1, line: 17, column: 3)
!77 = !DILocation(line: 17, column: 3, scope: !76)
!78 = !DILocation(line: 18, column: 2, scope: !49)
!79 = !DILocation(line: 13, column: 29, scope: !40)
!80 = !DILocation(line: 13, column: 2, scope: !40)
!81 = distinct !{!81, !46, !82}
!82 = !DILocation(line: 18, column: 2, scope: !37)
!83 = !DILocation(line: 20, column: 9, scope: !7)
!84 = !DILocation(line: 20, column: 2, scope: !7)
!85 = !DILocation(line: 21, column: 1, scope: !7)
!86 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 23, type: !87, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!10}
!89 = !DILocalVariable(name: "blocks", scope: !86, file: !1, line: 25, type: !90)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1344, elements: !91)
!91 = !{!92}
!92 = !DISubrange(count: 21)
!93 = !DILocation(line: 25, column: 8, scope: !86)
!94 = !DILocalVariable(name: "words", scope: !86, file: !1, line: 32, type: !95)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 576, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 9)
!98 = !DILocation(line: 32, column: 8, scope: !86)
!99 = !DILocalVariable(name: "w", scope: !86, file: !1, line: 36, type: !11)
!100 = !DILocation(line: 36, column: 9, scope: !86)
!101 = !DILocation(line: 37, column: 11, scope: !102)
!102 = distinct !DILexicalBlock(scope: !86, file: !1, line: 37, column: 2)
!103 = !DILocation(line: 37, column: 9, scope: !102)
!104 = !DILocation(line: 37, column: 7, scope: !102)
!105 = !DILocation(line: 37, column: 19, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 37, column: 2)
!107 = !DILocation(line: 37, column: 18, scope: !106)
!108 = !DILocation(line: 37, column: 2, scope: !102)
!109 = !DILocation(line: 38, column: 23, scope: !106)
!110 = !DILocation(line: 38, column: 22, scope: !106)
!111 = !DILocation(line: 38, column: 41, scope: !106)
!112 = !DILocation(line: 38, column: 50, scope: !106)
!113 = !DILocation(line: 38, column: 49, scope: !106)
!114 = !DILocation(line: 38, column: 26, scope: !106)
!115 = !DILocation(line: 38, column: 3, scope: !106)
!116 = !DILocation(line: 37, column: 23, scope: !106)
!117 = !DILocation(line: 37, column: 2, scope: !106)
!118 = distinct !{!118, !108, !119}
!119 = !DILocation(line: 38, column: 52, scope: !102)
!120 = !DILocation(line: 40, column: 2, scope: !86)
