; ModuleID = 'best-shuffle-4.ll'
source_filename = "best-shuffle-4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"abracadabra\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"seesaw\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"elk\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"grrrrrr\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"up\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"%s %s (%d)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @best_shuffle(i8* %s, i32* %diff) #0 !dbg !9 {
entry:
  %cnt = alloca [128 x i32], align 16
  %buf = alloca [256 x i8], align 16
  call void @llvm.dbg.value(metadata i8* %s, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32* %diff, metadata !19, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 0, metadata !20, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 0, metadata !21, metadata !DIExpression()), !dbg !18
  %call = call i64 @strlen(i8* %s) #6, !dbg !22
  %conv = trunc i64 %call to i32, !dbg !22
  call void @llvm.dbg.value(metadata i32 %conv, metadata !23, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [128 x i32]* %cnt, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = bitcast [128 x i32]* %cnt to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 512, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata [256 x i8]* %buf, metadata !29, metadata !DIExpression()), !dbg !33
  %1 = bitcast [256 x i8]* %buf to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 256, i1 false), !dbg !33
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !18
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc ], !dbg !37
  %max.0 = phi i32 [ 0, %entry ], [ %max.1, %for.inc ], !dbg !18
  call void @llvm.dbg.value(metadata i32 %max.0, metadata !21, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !34, metadata !DIExpression()), !dbg !18
  %cmp = icmp slt i32 %i.0, %conv, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %s, i64 %idxprom, !dbg !40
  %2 = load i8, i8* %arrayidx, align 1, !dbg !40
  %conv2 = sext i8 %2 to i32, !dbg !42
  %idxprom3 = sext i32 %conv2 to i64, !dbg !43
  %arrayidx4 = getelementptr inbounds [128 x i32], [128 x i32]* %cnt, i64 0, i64 %idxprom3, !dbg !43
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !44
  %inc = add nsw i32 %3, 1, !dbg !44
  store i32 %inc, i32* %arrayidx4, align 4, !dbg !44
  %cmp5 = icmp sgt i32 %inc, %max.0, !dbg !45
  br i1 %cmp5, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %for.body
  %idxprom7 = sext i32 %i.0 to i64, !dbg !47
  %arrayidx8 = getelementptr inbounds i8, i8* %s, i64 %idxprom7, !dbg !47
  %4 = load i8, i8* %arrayidx8, align 1, !dbg !47
  %conv9 = sext i8 %4 to i32, !dbg !48
  %idxprom10 = sext i32 %conv9 to i64, !dbg !49
  %arrayidx11 = getelementptr inbounds [128 x i32], [128 x i32]* %cnt, i64 0, i64 %idxprom10, !dbg !49
  %5 = load i32, i32* %arrayidx11, align 4, !dbg !49
  call void @llvm.dbg.value(metadata i32 %5, metadata !21, metadata !DIExpression()), !dbg !18
  br label %if.end, !dbg !50

if.end:                                           ; preds = %if.then, %for.body
  %max.1 = phi i32 [ %5, %if.then ], [ %max.0, %for.body ], !dbg !18
  call void @llvm.dbg.value(metadata i32 %max.1, metadata !21, metadata !DIExpression()), !dbg !18
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %if.end
  %inc12 = add nsw i32 %i.0, 1, !dbg !38
  call void @llvm.dbg.value(metadata i32 %inc12, metadata !34, metadata !DIExpression()), !dbg !18
  br label %for.cond, !dbg !38, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !18
  br label %for.cond13, !dbg !54

for.cond13:                                       ; preds = %for.inc23, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc24, %for.inc23 ], !dbg !56
  %j.0 = phi i32 [ 0, %for.end ], [ %j.1, %for.inc23 ], !dbg !57
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !20, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !34, metadata !DIExpression()), !dbg !18
  %cmp14 = icmp slt i32 %i.1, 128, !dbg !58
  br i1 %cmp14, label %for.body16, label %for.end25, !dbg !54

for.body16:                                       ; preds = %for.cond13
  br label %while.cond, !dbg !60

while.cond:                                       ; preds = %while.body, %for.body16
  %j.1 = phi i32 [ %j.0, %for.body16 ], [ %inc20, %while.body ], !dbg !18
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !20, metadata !DIExpression()), !dbg !18
  %idxprom17 = sext i32 %i.1 to i64, !dbg !61
  %arrayidx18 = getelementptr inbounds [128 x i32], [128 x i32]* %cnt, i64 0, i64 %idxprom17, !dbg !61
  %6 = load i32, i32* %arrayidx18, align 4, !dbg !62
  %dec = add nsw i32 %6, -1, !dbg !62
  store i32 %dec, i32* %arrayidx18, align 4, !dbg !62
  %tobool = icmp ne i32 %6, 0, !dbg !60
  br i1 %tobool, label %while.body, label %while.end, !dbg !60

while.body:                                       ; preds = %while.cond
  %conv19 = trunc i32 %i.1 to i8, !dbg !63
  %inc20 = add nsw i32 %j.1, 1, !dbg !64
  call void @llvm.dbg.value(metadata i32 %inc20, metadata !20, metadata !DIExpression()), !dbg !18
  %idxprom21 = sext i32 %j.1 to i64, !dbg !65
  %arrayidx22 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i64 0, i64 %idxprom21, !dbg !65
  store i8 %conv19, i8* %arrayidx22, align 1, !dbg !66
  br label %while.cond, !dbg !60, !llvm.loop !67

while.end:                                        ; preds = %while.cond
  br label %for.inc23, !dbg !60

for.inc23:                                        ; preds = %while.end
  %inc24 = add nsw i32 %i.1, 1, !dbg !58
  call void @llvm.dbg.value(metadata i32 %inc24, metadata !34, metadata !DIExpression()), !dbg !18
  br label %for.cond13, !dbg !58, !llvm.loop !68

for.end25:                                        ; preds = %for.cond13
  %call26 = call noalias i8* @strdup(i8* %s) #7, !dbg !70
  call void @llvm.dbg.value(metadata i8* %call26, metadata !71, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !18
  br label %for.cond27, !dbg !72

for.cond27:                                       ; preds = %for.inc58, %for.end25
  %i.2 = phi i32 [ 0, %for.end25 ], [ %inc59, %for.inc58 ], !dbg !74
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !34, metadata !DIExpression()), !dbg !18
  %cmp28 = icmp slt i32 %i.2, %conv, !dbg !75
  br i1 %cmp28, label %for.body30, label %for.end60, !dbg !72

for.body30:                                       ; preds = %for.cond27
  call void @llvm.dbg.value(metadata i32 0, metadata !20, metadata !DIExpression()), !dbg !18
  br label %for.cond31, !dbg !77

for.cond31:                                       ; preds = %for.inc55, %for.body30
  %j.2 = phi i32 [ 0, %for.body30 ], [ %inc56, %for.inc55 ], !dbg !79
  call void @llvm.dbg.value(metadata i32 %j.2, metadata !20, metadata !DIExpression()), !dbg !18
  %cmp32 = icmp slt i32 %j.2, %conv, !dbg !80
  br i1 %cmp32, label %for.body34, label %for.end57.loopexit, !dbg !77

for.body34:                                       ; preds = %for.cond31
  %idxprom35 = sext i32 %i.2 to i64, !dbg !82
  %arrayidx36 = getelementptr inbounds i8, i8* %call26, i64 %idxprom35, !dbg !82
  %7 = load i8, i8* %arrayidx36, align 1, !dbg !82
  %conv37 = sext i8 %7 to i32, !dbg !82
  %idxprom38 = sext i32 %j.2 to i64, !dbg !84
  %arrayidx39 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i64 0, i64 %idxprom38, !dbg !84
  %8 = load i8, i8* %arrayidx39, align 1, !dbg !84
  %conv40 = sext i8 %8 to i32, !dbg !84
  %cmp41 = icmp eq i32 %conv37, %conv40, !dbg !85
  br i1 %cmp41, label %if.then43, label %if.end54, !dbg !86

if.then43:                                        ; preds = %for.body34
  %add = add nsw i32 %j.2, %max.0, !dbg !87
  %rem = srem i32 %add, %conv, !dbg !89
  %idxprom44 = sext i32 %rem to i64, !dbg !90
  %arrayidx45 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i64 0, i64 %idxprom44, !dbg !90
  %9 = load i8, i8* %arrayidx45, align 1, !dbg !90
  %conv46 = sext i8 %9 to i32, !dbg !90
  %and = and i32 %conv46, -129, !dbg !91
  %conv47 = trunc i32 %and to i8, !dbg !90
  %idxprom48 = sext i32 %i.2 to i64, !dbg !92
  %arrayidx49 = getelementptr inbounds i8, i8* %call26, i64 %idxprom48, !dbg !92
  store i8 %conv47, i8* %arrayidx49, align 1, !dbg !93
  %idxprom50 = sext i32 %j.2 to i64, !dbg !94
  %arrayidx51 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i64 0, i64 %idxprom50, !dbg !94
  %10 = load i8, i8* %arrayidx51, align 1, !dbg !95
  %conv52 = sext i8 %10 to i32, !dbg !95
  %or = or i32 %conv52, 128, !dbg !95
  %conv53 = trunc i32 %or to i8, !dbg !95
  store i8 %conv53, i8* %arrayidx51, align 1, !dbg !95
  br label %for.end57, !dbg !96

if.end54:                                         ; preds = %for.body34
  br label %for.inc55, !dbg !97

for.inc55:                                        ; preds = %if.end54
  %inc56 = add nsw i32 %j.2, 1, !dbg !80
  call void @llvm.dbg.value(metadata i32 %inc56, metadata !20, metadata !DIExpression()), !dbg !18
  br label %for.cond31, !dbg !80, !llvm.loop !98

for.end57.loopexit:                               ; preds = %for.cond31
  br label %for.end57, !dbg !99

for.end57:                                        ; preds = %for.end57.loopexit, %if.then43
  br label %for.inc58, !dbg !99

for.inc58:                                        ; preds = %for.end57
  %inc59 = add nsw i32 %i.2, 1, !dbg !75
  call void @llvm.dbg.value(metadata i32 %inc59, metadata !34, metadata !DIExpression()), !dbg !18
  br label %for.cond27, !dbg !75, !llvm.loop !100

for.end60:                                        ; preds = %for.cond27
  store i32 0, i32* %diff, align 4, !dbg !102
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !18
  br label %for.cond61, !dbg !103

for.cond61:                                       ; preds = %for.inc74, %for.end60
  %i.3 = phi i32 [ 0, %for.end60 ], [ %inc75, %for.inc74 ], !dbg !105
  call void @llvm.dbg.value(metadata i32 %i.3, metadata !34, metadata !DIExpression()), !dbg !18
  %cmp62 = icmp slt i32 %i.3, %conv, !dbg !106
  br i1 %cmp62, label %for.body64, label %for.end76, !dbg !103

for.body64:                                       ; preds = %for.cond61
  %idxprom65 = sext i32 %i.3 to i64, !dbg !108
  %arrayidx66 = getelementptr inbounds i8, i8* %call26, i64 %idxprom65, !dbg !108
  %11 = load i8, i8* %arrayidx66, align 1, !dbg !108
  %conv67 = sext i8 %11 to i32, !dbg !108
  %idxprom68 = sext i32 %i.3 to i64, !dbg !109
  %arrayidx69 = getelementptr inbounds i8, i8* %s, i64 %idxprom68, !dbg !109
  %12 = load i8, i8* %arrayidx69, align 1, !dbg !109
  %conv70 = sext i8 %12 to i32, !dbg !109
  %cmp71 = icmp eq i32 %conv67, %conv70, !dbg !110
  %conv72 = zext i1 %cmp71 to i32, !dbg !110
  %13 = load i32, i32* %diff, align 4, !dbg !111
  %add73 = add nsw i32 %13, %conv72, !dbg !111
  store i32 %add73, i32* %diff, align 4, !dbg !111
  br label %for.inc74, !dbg !112

for.inc74:                                        ; preds = %for.body64
  %inc75 = add nsw i32 %i.3, 1, !dbg !106
  call void @llvm.dbg.value(metadata i32 %inc75, metadata !34, metadata !DIExpression()), !dbg !18
  br label %for.cond61, !dbg !106, !llvm.loop !113

for.end76:                                        ; preds = %for.cond61
  ret i8* %call26, !dbg !115
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !116 {
entry:
  %d = alloca i32, align 4
  %t = alloca [7 x i8*], align 16
  call void @llvm.dbg.declare(metadata i32* %d, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [7 x i8*]* %t, metadata !120, metadata !DIExpression()), !dbg !124
  %0 = bitcast [7 x i8*]* %t to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 56, i1 false), !dbg !124
  %1 = bitcast i8* %0 to [7 x i8*]*, !dbg !124
  %2 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 0, !dbg !124
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8** %2, align 16, !dbg !124
  %3 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 1, !dbg !124
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8** %3, align 8, !dbg !124
  %4 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 2, !dbg !124
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8** %4, align 16, !dbg !124
  %5 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 3, !dbg !124
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i8** %5, align 8, !dbg !124
  %6 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 4, !dbg !124
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i8** %6, align 16, !dbg !124
  %7 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 5, !dbg !124
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %7, align 8, !dbg !124
  call void @llvm.dbg.value(metadata i32 0, metadata !125, metadata !DIExpression()), !dbg !126
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !129
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !125, metadata !DIExpression()), !dbg !126
  %idxprom = sext i32 %i.0 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [7 x i8*], [7 x i8*]* %t, i64 0, i64 %idxprom, !dbg !130
  %8 = load i8*, i8** %arrayidx, align 8, !dbg !130
  %tobool = icmp ne i8* %8, null, !dbg !132
  br i1 %tobool, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %idxprom1 = sext i32 %i.0 to i64, !dbg !133
  %arrayidx2 = getelementptr inbounds [7 x i8*], [7 x i8*]* %t, i64 0, i64 %idxprom1, !dbg !133
  %9 = load i8*, i8** %arrayidx2, align 8, !dbg !133
  %call = call i8* @best_shuffle(i8* %9, i32* %d), !dbg !135
  call void @llvm.dbg.value(metadata i8* %call, metadata !136, metadata !DIExpression()), !dbg !126
  %idxprom3 = sext i32 %i.0 to i64, !dbg !137
  %arrayidx4 = getelementptr inbounds [7 x i8*], [7 x i8*]* %t, i64 0, i64 %idxprom3, !dbg !137
  %10 = load i8*, i8** %arrayidx4, align 8, !dbg !137
  %11 = load i32, i32* %d, align 4, !dbg !138
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i8* %10, i8* %call, i32 %11), !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !141
  call void @llvm.dbg.value(metadata i32 %inc, metadata !125, metadata !DIExpression()), !dbg !126
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !145
}

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "best-shuffle-4.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Best-shuffle-4")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = distinct !DISubprogram(name: "best_shuffle", scope: !1, file: !1, line: 5, type: !10, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !14, !16}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!17 = !DILocalVariable(name: "s", arg: 1, scope: !9, file: !1, line: 5, type: !14)
!18 = !DILocation(line: 0, scope: !9)
!19 = !DILocalVariable(name: "diff", arg: 2, scope: !9, file: !1, line: 5, type: !16)
!20 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 7, type: !4)
!21 = !DILocalVariable(name: "max", scope: !9, file: !1, line: 7, type: !4)
!22 = !DILocation(line: 7, column: 29, scope: !9)
!23 = !DILocalVariable(name: "l", scope: !9, file: !1, line: 7, type: !4)
!24 = !DILocalVariable(name: "cnt", scope: !9, file: !1, line: 7, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 4096, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 128)
!28 = !DILocation(line: 7, column: 40, scope: !9)
!29 = !DILocalVariable(name: "buf", scope: !9, file: !1, line: 8, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2048, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 256)
!33 = !DILocation(line: 8, column: 7, scope: !9)
!34 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 7, type: !4)
!35 = !DILocation(line: 10, column: 2, scope: !36)
!36 = distinct !DILexicalBlock(scope: !9, file: !1, line: 10, column: 2)
!37 = !DILocation(line: 0, scope: !36)
!38 = !DILocation(line: 10, column: 2, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !1, line: 10, column: 2)
!40 = !DILocation(line: 10, column: 27, scope: !41)
!41 = distinct !DILexicalBlock(scope: !39, file: !1, line: 10, column: 16)
!42 = !DILocation(line: 10, column: 22, scope: !41)
!43 = !DILocation(line: 10, column: 18, scope: !41)
!44 = !DILocation(line: 10, column: 16, scope: !41)
!45 = !DILocation(line: 10, column: 33, scope: !41)
!46 = !DILocation(line: 10, column: 16, scope: !39)
!47 = !DILocation(line: 10, column: 55, scope: !41)
!48 = !DILocation(line: 10, column: 50, scope: !41)
!49 = !DILocation(line: 10, column: 46, scope: !41)
!50 = !DILocation(line: 10, column: 40, scope: !41)
!51 = !DILocation(line: 10, column: 35, scope: !41)
!52 = distinct !{!52, !35, !53}
!53 = !DILocation(line: 10, column: 59, scope: !36)
!54 = !DILocation(line: 11, column: 2, scope: !55)
!55 = distinct !DILexicalBlock(scope: !9, file: !1, line: 11, column: 2)
!56 = !DILocation(line: 0, scope: !55)
!57 = !DILocation(line: 7, column: 9, scope: !9)
!58 = !DILocation(line: 11, column: 2, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !1, line: 11, column: 2)
!60 = !DILocation(line: 11, column: 14, scope: !59)
!61 = !DILocation(line: 11, column: 21, scope: !59)
!62 = !DILocation(line: 11, column: 27, scope: !59)
!63 = !DILocation(line: 11, column: 42, scope: !59)
!64 = !DILocation(line: 11, column: 36, scope: !59)
!65 = !DILocation(line: 11, column: 31, scope: !59)
!66 = !DILocation(line: 11, column: 40, scope: !59)
!67 = distinct !{!67, !60, !63}
!68 = distinct !{!68, !54, !69}
!69 = !DILocation(line: 11, column: 42, scope: !55)
!70 = !DILocation(line: 13, column: 6, scope: !9)
!71 = !DILocalVariable(name: "r", scope: !9, file: !1, line: 8, type: !12)
!72 = !DILocation(line: 14, column: 2, scope: !73)
!73 = distinct !DILexicalBlock(scope: !9, file: !1, line: 14, column: 2)
!74 = !DILocation(line: 0, scope: !73)
!75 = !DILocation(line: 14, column: 2, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !1, line: 14, column: 2)
!77 = !DILocation(line: 14, column: 12, scope: !78)
!78 = distinct !DILexicalBlock(scope: !76, file: !1, line: 14, column: 12)
!79 = !DILocation(line: 0, scope: !78)
!80 = !DILocation(line: 14, column: 12, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !1, line: 14, column: 12)
!82 = !DILocation(line: 15, column: 7, scope: !83)
!83 = distinct !DILexicalBlock(scope: !81, file: !1, line: 15, column: 7)
!84 = !DILocation(line: 15, column: 15, scope: !83)
!85 = !DILocation(line: 15, column: 12, scope: !83)
!86 = !DILocation(line: 15, column: 7, scope: !81)
!87 = !DILocation(line: 16, column: 18, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !1, line: 15, column: 23)
!89 = !DILocation(line: 16, column: 25, scope: !88)
!90 = !DILocation(line: 16, column: 11, scope: !88)
!91 = !DILocation(line: 16, column: 30, scope: !88)
!92 = !DILocation(line: 16, column: 4, scope: !88)
!93 = !DILocation(line: 16, column: 9, scope: !88)
!94 = !DILocation(line: 17, column: 4, scope: !88)
!95 = !DILocation(line: 17, column: 11, scope: !88)
!96 = !DILocation(line: 18, column: 4, scope: !88)
!97 = !DILocation(line: 15, column: 20, scope: !83)
!98 = distinct !{!98, !77, !99}
!99 = !DILocation(line: 19, column: 3, scope: !78)
!100 = distinct !{!100, !72, !101}
!101 = !DILocation(line: 19, column: 3, scope: !73)
!102 = !DILocation(line: 21, column: 8, scope: !9)
!103 = !DILocation(line: 22, column: 2, scope: !104)
!104 = distinct !DILexicalBlock(scope: !9, file: !1, line: 22, column: 2)
!105 = !DILocation(line: 0, scope: !104)
!106 = !DILocation(line: 22, column: 2, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !1, line: 22, column: 2)
!108 = !DILocation(line: 22, column: 21, scope: !107)
!109 = !DILocation(line: 22, column: 29, scope: !107)
!110 = !DILocation(line: 22, column: 26, scope: !107)
!111 = !DILocation(line: 22, column: 18, scope: !107)
!112 = !DILocation(line: 22, column: 12, scope: !107)
!113 = distinct !{!113, !103, !114}
!114 = !DILocation(line: 22, column: 32, scope: !104)
!115 = !DILocation(line: 24, column: 2, scope: !9)
!116 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 27, type: !117, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DISubroutineType(types: !3)
!118 = !DILocalVariable(name: "d", scope: !116, file: !1, line: 29, type: !4)
!119 = !DILocation(line: 29, column: 9, scope: !116)
!120 = !DILocalVariable(name: "t", scope: !116, file: !1, line: 30, type: !121)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 448, elements: !122)
!122 = !{!123}
!123 = !DISubrange(count: 7)
!124 = !DILocation(line: 30, column: 18, scope: !116)
!125 = !DILocalVariable(name: "i", scope: !116, file: !1, line: 29, type: !4)
!126 = !DILocation(line: 0, scope: !116)
!127 = !DILocation(line: 31, column: 7, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !1, line: 31, column: 2)
!129 = !DILocation(line: 0, scope: !128)
!130 = !DILocation(line: 31, column: 14, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !1, line: 31, column: 2)
!132 = !DILocation(line: 31, column: 2, scope: !128)
!133 = !DILocation(line: 32, column: 20, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !1, line: 31, column: 25)
!135 = !DILocation(line: 32, column: 7, scope: !134)
!136 = !DILocalVariable(name: "r", scope: !116, file: !1, line: 30, type: !14)
!137 = !DILocation(line: 33, column: 26, scope: !134)
!138 = !DILocation(line: 33, column: 35, scope: !134)
!139 = !DILocation(line: 33, column: 3, scope: !134)
!140 = !DILocation(line: 34, column: 2, scope: !134)
!141 = !DILocation(line: 31, column: 21, scope: !131)
!142 = !DILocation(line: 31, column: 2, scope: !131)
!143 = distinct !{!143, !132, !144}
!144 = !DILocation(line: 34, column: 2, scope: !128)
!145 = !DILocation(line: 35, column: 2, scope: !116)
