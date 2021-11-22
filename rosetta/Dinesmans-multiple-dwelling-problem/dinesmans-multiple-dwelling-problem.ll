; ModuleID = 'dinesmans-multiple-dwelling-problem.c'
source_filename = "dinesmans-multiple-dwelling-problem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@verbose = dso_local global i32 0, align 4, !dbg !0
@solution = dso_local global [5 x i32] zeroinitializer, align 16, !dbg !15
@occupied = dso_local global [5 x i32] zeroinitializer, align 16, !dbg !21
@.str = private unnamed_addr constant [6 x i8] c"baker\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"cooper\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"fletcher\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"miller\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"smith\00", align 1
@names = dso_local global [5 x i8*] [i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0)], align 16, !dbg !23
@cond = dso_local global [6 x i32 (i32*)*] [i32 (i32*)* @c0, i32 (i32*)* @c1, i32 (i32*)* @c2, i32 (i32*)* @c3, i32 (i32*)* @c4, i32 (i32*)* @c5], align 16, !dbg !29
@.str.5 = private unnamed_addr constant [7 x i8] c"%d %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"cond %d bad\0A\0A\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"Found arrangement:\0A\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"Nobody lives anywhere\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c0(i32* %s) #0 !dbg !43 {
entry:
  %s.addr = alloca i32*, align 8
  store i32* %s, i32** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %s.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32*, i32** %s.addr, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !46
  %1 = load i32, i32* %arrayidx, align 4, !dbg !46
  %cmp = icmp ne i32 %1, 4, !dbg !46
  %conv = zext i1 %cmp to i32, !dbg !46
  ret i32 %conv, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c1(i32* %s) #0 !dbg !47 {
entry:
  %s.addr = alloca i32*, align 8
  store i32* %s, i32** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %s.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i32*, i32** %s.addr, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 1, !dbg !49
  %1 = load i32, i32* %arrayidx, align 4, !dbg !49
  %cmp = icmp ne i32 %1, 0, !dbg !49
  %conv = zext i1 %cmp to i32, !dbg !49
  ret i32 %conv, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c2(i32* %s) #0 !dbg !50 {
entry:
  %s.addr = alloca i32*, align 8
  store i32* %s, i32** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %s.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32*, i32** %s.addr, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 2, !dbg !52
  %1 = load i32, i32* %arrayidx, align 4, !dbg !52
  %cmp = icmp ne i32 %1, 0, !dbg !52
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !52

land.rhs:                                         ; preds = %entry
  %2 = load i32*, i32** %s.addr, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 2, !dbg !52
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !52
  %cmp2 = icmp ne i32 %3, 4, !dbg !52
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %4 = phi i1 [ false, %entry ], [ %cmp2, %land.rhs ], !dbg !53
  %land.ext = zext i1 %4 to i32, !dbg !52
  ret i32 %land.ext, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c3(i32* %s) #0 !dbg !54 {
entry:
  %s.addr = alloca i32*, align 8
  store i32* %s, i32** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %s.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32*, i32** %s.addr, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 3, !dbg !56
  %1 = load i32, i32* %arrayidx, align 4, !dbg !56
  %2 = load i32*, i32** %s.addr, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 1, !dbg !56
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !56
  %cmp = icmp sgt i32 %1, %3, !dbg !56
  %conv = zext i1 %cmp to i32, !dbg !56
  ret i32 %conv, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c4(i32* %s) #0 !dbg !57 {
entry:
  %s.addr = alloca i32*, align 8
  store i32* %s, i32** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %s.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = load i32*, i32** %s.addr, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 4, !dbg !59
  %1 = load i32, i32* %arrayidx, align 4, !dbg !59
  %2 = load i32*, i32** %s.addr, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 2, !dbg !59
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !59
  %sub = sub nsw i32 %1, %3, !dbg !59
  %call = call i32 @abs(i32 %sub) #4, !dbg !59
  %cmp = icmp ne i32 %call, 1, !dbg !59
  %conv = zext i1 %cmp to i32, !dbg !59
  ret i32 %conv, !dbg !59
}

; Function Attrs: nounwind readnone
declare dso_local i32 @abs(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c5(i32* %s) #0 !dbg !60 {
entry:
  %s.addr = alloca i32*, align 8
  store i32* %s, i32** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %s.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i32*, i32** %s.addr, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 1, !dbg !62
  %1 = load i32, i32* %arrayidx, align 4, !dbg !62
  %2 = load i32*, i32** %s.addr, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 2, !dbg !62
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !62
  %sub = sub nsw i32 %1, %3, !dbg !62
  %call = call i32 @abs(i32 %sub) #4, !dbg !62
  %cmp = icmp ne i32 %call, 1, !dbg !62
  %conv = zext i1 %cmp to i32, !dbg !62
  ret i32 %conv, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @solve(i32 %person) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %person.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %person, i32* %person.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %person.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %i, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %j, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load i32, i32* %person.addr, align 4, !dbg !72
  %cmp = icmp eq i32 %0, 5, !dbg !74
  br i1 %cmp, label %if.then, label %if.end30, !dbg !75, !cf.info !76

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc15, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !81
  %cmp1 = icmp slt i32 %1, 6, !dbg !83
  br i1 %cmp1, label %for.body, label %for.end17, !dbg !84

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !85
  %idxprom = sext i32 %2 to i64, !dbg !88
  %arrayidx = getelementptr inbounds [6 x i32 (i32*)*], [6 x i32 (i32*)*]* @cond, i64 0, i64 %idxprom, !dbg !88
  %3 = load i32 (i32*)*, i32 (i32*)** %arrayidx, align 8, !dbg !88
  %call = call i32 %3(i32* getelementptr inbounds ([5 x i32], [5 x i32]* @solution, i64 0, i64 0)), !dbg !88
  %tobool = icmp ne i32 %call, 0, !dbg !88
  br i1 %tobool, label %if.then2, label %if.end, !dbg !89, !cf.info !76

if.then2:                                         ; preds = %for.body
  br label %for.inc15, !dbg !90

if.end:                                           ; preds = %for.body
  %4 = load i32, i32* @verbose, align 4, !dbg !91
  %tobool3 = icmp ne i32 %4, 0, !dbg !91
  br i1 %tobool3, label %if.then4, label %if.end14, !dbg !93, !cf.info !76

if.then4:                                         ; preds = %if.end
  store i32 0, i32* %j, align 4, !dbg !94
  br label %for.cond5, !dbg !97

for.cond5:                                        ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %j, align 4, !dbg !98
  %cmp6 = icmp slt i32 %5, 5, !dbg !100
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !101

for.body7:                                        ; preds = %for.cond5
  %6 = load i32, i32* %j, align 4, !dbg !102
  %idxprom8 = sext i32 %6 to i64, !dbg !103
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* @solution, i64 0, i64 %idxprom8, !dbg !103
  %7 = load i32, i32* %arrayidx9, align 4, !dbg !103
  %8 = load i32, i32* %j, align 4, !dbg !104
  %idxprom10 = sext i32 %8 to i64, !dbg !105
  %arrayidx11 = getelementptr inbounds [5 x i8*], [5 x i8*]* @names, i64 0, i64 %idxprom10, !dbg !105
  %9 = load i8*, i8** %arrayidx11, align 8, !dbg !105
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 %7, i8* %9), !dbg !106
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body7
  %10 = load i32, i32* %j, align 4, !dbg !107
  %inc = add nsw i32 %10, 1, !dbg !107
  store i32 %inc, i32* %j, align 4, !dbg !107
  br label %for.cond5, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond5
  %11 = load i32, i32* %i, align 4, !dbg !111
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i32 %11), !dbg !112
  br label %if.end14, !dbg !113

if.end14:                                         ; preds = %for.end, %if.end
  store i32 0, i32* %retval, align 4, !dbg !114
  br label %return, !dbg !114

for.inc15:                                        ; preds = %if.then2
  %12 = load i32, i32* %i, align 4, !dbg !115
  %inc16 = add nsw i32 %12, 1, !dbg !115
  store i32 %inc16, i32* %i, align 4, !dbg !115
  br label %for.cond, !dbg !116, !llvm.loop !117

for.end17:                                        ; preds = %for.cond
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i64 0, i64 0)), !dbg !119
  store i32 0, i32* %i, align 4, !dbg !120
  br label %for.cond19, !dbg !122

for.cond19:                                       ; preds = %for.inc27, %for.end17
  %13 = load i32, i32* %i, align 4, !dbg !123
  %cmp20 = icmp slt i32 %13, 5, !dbg !125
  br i1 %cmp20, label %for.body21, label %for.end29, !dbg !126

for.body21:                                       ; preds = %for.cond19
  %14 = load i32, i32* %i, align 4, !dbg !127
  %idxprom22 = sext i32 %14 to i64, !dbg !128
  %arrayidx23 = getelementptr inbounds [5 x i32], [5 x i32]* @solution, i64 0, i64 %idxprom22, !dbg !128
  %15 = load i32, i32* %arrayidx23, align 4, !dbg !128
  %16 = load i32, i32* %i, align 4, !dbg !129
  %idxprom24 = sext i32 %16 to i64, !dbg !130
  %arrayidx25 = getelementptr inbounds [5 x i8*], [5 x i8*]* @names, i64 0, i64 %idxprom24, !dbg !130
  %17 = load i8*, i8** %arrayidx25, align 8, !dbg !130
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 %15, i8* %17), !dbg !131
  br label %for.inc27, !dbg !131

for.inc27:                                        ; preds = %for.body21
  %18 = load i32, i32* %i, align 4, !dbg !132
  %inc28 = add nsw i32 %18, 1, !dbg !132
  store i32 %inc28, i32* %i, align 4, !dbg !132
  br label %for.cond19, !dbg !133, !llvm.loop !134

for.end29:                                        ; preds = %for.cond19
  store i32 1, i32* %retval, align 4, !dbg !136
  br label %return, !dbg !136

if.end30:                                         ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !137
  br label %for.cond31, !dbg !139

for.cond31:                                       ; preds = %for.inc49, %if.end30
  %19 = load i32, i32* %i, align 4, !dbg !140
  %cmp32 = icmp slt i32 %19, 5, !dbg !142
  br i1 %cmp32, label %for.body33, label %for.end51, !dbg !143

for.body33:                                       ; preds = %for.cond31
  %20 = load i32, i32* %i, align 4, !dbg !144
  %idxprom34 = sext i32 %20 to i64, !dbg !147
  %arrayidx35 = getelementptr inbounds [5 x i32], [5 x i32]* @occupied, i64 0, i64 %idxprom34, !dbg !147
  %21 = load i32, i32* %arrayidx35, align 4, !dbg !147
  %tobool36 = icmp ne i32 %21, 0, !dbg !147
  br i1 %tobool36, label %if.then37, label %if.end38, !dbg !148, !cf.info !76

if.then37:                                        ; preds = %for.body33
  br label %for.inc49, !dbg !149

if.end38:                                         ; preds = %for.body33
  %22 = load i32, i32* %i, align 4, !dbg !150
  %23 = load i32, i32* %person.addr, align 4, !dbg !151
  %idxprom39 = sext i32 %23 to i64, !dbg !152
  %arrayidx40 = getelementptr inbounds [5 x i32], [5 x i32]* @solution, i64 0, i64 %idxprom39, !dbg !152
  store i32 %22, i32* %arrayidx40, align 4, !dbg !153
  %24 = load i32, i32* %i, align 4, !dbg !154
  %idxprom41 = sext i32 %24 to i64, !dbg !155
  %arrayidx42 = getelementptr inbounds [5 x i32], [5 x i32]* @occupied, i64 0, i64 %idxprom41, !dbg !155
  store i32 1, i32* %arrayidx42, align 4, !dbg !156
  %25 = load i32, i32* %person.addr, align 4, !dbg !157
  %add = add nsw i32 %25, 1, !dbg !159
  %call43 = call i32 @solve(i32 %add), !dbg !160
  %tobool44 = icmp ne i32 %call43, 0, !dbg !160
  br i1 %tobool44, label %if.then45, label %if.end46, !dbg !161, !cf.info !76

if.then45:                                        ; preds = %if.end38
  store i32 1, i32* %retval, align 4, !dbg !162
  br label %return, !dbg !162

if.end46:                                         ; preds = %if.end38
  %26 = load i32, i32* %i, align 4, !dbg !163
  %idxprom47 = sext i32 %26 to i64, !dbg !164
  %arrayidx48 = getelementptr inbounds [5 x i32], [5 x i32]* @occupied, i64 0, i64 %idxprom47, !dbg !164
  store i32 0, i32* %arrayidx48, align 4, !dbg !165
  br label %for.inc49, !dbg !166

for.inc49:                                        ; preds = %if.end46, %if.then37
  %27 = load i32, i32* %i, align 4, !dbg !167
  %inc50 = add nsw i32 %27, 1, !dbg !167
  store i32 %inc50, i32* %i, align 4, !dbg !167
  br label %for.cond31, !dbg !168, !llvm.loop !169

for.end51:                                        ; preds = %for.cond31
  store i32 0, i32* %retval, align 4, !dbg !171
  br label %return, !dbg !171

return:                                           ; preds = %for.end51, %if.then45, %for.end29, %if.end14
  %28 = load i32, i32* %retval, align 4, !dbg !172
  ret i32 %28, !dbg !172
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !173 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* @verbose, align 4, !dbg !176
  %call = call i32 @solve(i32 0), !dbg !177
  %tobool = icmp ne i32 %call, 0, !dbg !177
  br i1 %tobool, label %if.end, label %if.then, !dbg !179, !cf.info !76

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0)), !dbg !180
  br label %if.end, !dbg !180

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !181
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!39, !40, !41}
!llvm.ident = !{!42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "verbose", scope: !2, file: !3, line: 4, type: !18, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "dinesmans-multiple-dwelling-problem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Dinesmans-multiple-dwelling-problem")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "tenants", file: !3, line: 14, baseType: !6, size: 32, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10, !11, !12, !13}
!8 = !DIEnumerator(name: "baker", value: 0, isUnsigned: true)
!9 = !DIEnumerator(name: "cooper", value: 1, isUnsigned: true)
!10 = !DIEnumerator(name: "fletcher", value: 2, isUnsigned: true)
!11 = !DIEnumerator(name: "miller", value: 3, isUnsigned: true)
!12 = !DIEnumerator(name: "smith", value: 4, isUnsigned: true)
!13 = !DIEnumerator(name: "phantom_of_the_opera", value: 5, isUnsigned: true)
!14 = !{!0, !15, !21, !23, !29}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "solution", scope: !2, file: !3, line: 11, type: !17, isLocal: false, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 160, elements: !19)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !{!20}
!20 = !DISubrange(count: 5)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "occupied", scope: !2, file: !3, line: 12, type: !17, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "names", scope: !2, file: !3, line: 23, type: !25, isLocal: false, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 320, elements: !19)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "cond", scope: !2, file: !3, line: 39, type: !31, isLocal: false, isDefinition: true)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 384, elements: !37)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "condition", file: !3, line: 6, baseType: !33)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DISubroutineType(types: !35)
!35 = !{!18, !36}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!37 = !{!38}
!38 = !DISubrange(count: 6)
!39 = !{i32 7, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{i32 1, !"wchar_size", i32 4}
!42 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!43 = distinct !DISubprogram(name: "c0", scope: !3, file: !3, line: 31, type: !34, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!44 = !{}
!45 = !DILocalVariable(name: "s", arg: 1, scope: !43, file: !3, line: 31, type: !36)
!46 = !DILocation(line: 31, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "c1", scope: !3, file: !3, line: 32, type: !34, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!48 = !DILocalVariable(name: "s", arg: 1, scope: !47, file: !3, line: 32, type: !36)
!49 = !DILocation(line: 32, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "c2", scope: !3, file: !3, line: 33, type: !34, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!51 = !DILocalVariable(name: "s", arg: 1, scope: !50, file: !3, line: 33, type: !36)
!52 = !DILocation(line: 33, column: 1, scope: !50)
!53 = !DILocation(line: 0, scope: !50)
!54 = distinct !DISubprogram(name: "c3", scope: !3, file: !3, line: 34, type: !34, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!55 = !DILocalVariable(name: "s", arg: 1, scope: !54, file: !3, line: 34, type: !36)
!56 = !DILocation(line: 34, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "c4", scope: !3, file: !3, line: 35, type: !34, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!58 = !DILocalVariable(name: "s", arg: 1, scope: !57, file: !3, line: 35, type: !36)
!59 = !DILocation(line: 35, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "c5", scope: !3, file: !3, line: 36, type: !34, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!61 = !DILocalVariable(name: "s", arg: 1, scope: !60, file: !3, line: 36, type: !36)
!62 = !DILocation(line: 36, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "solve", scope: !3, file: !3, line: 44, type: !64, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!64 = !DISubroutineType(types: !65)
!65 = !{!18, !18}
!66 = !DILocalVariable(name: "person", arg: 1, scope: !63, file: !3, line: 44, type: !18)
!67 = !DILocation(line: 44, column: 15, scope: !63)
!68 = !DILocalVariable(name: "i", scope: !63, file: !3, line: 46, type: !18)
!69 = !DILocation(line: 46, column: 6, scope: !63)
!70 = !DILocalVariable(name: "j", scope: !63, file: !3, line: 46, type: !18)
!71 = !DILocation(line: 46, column: 9, scope: !63)
!72 = !DILocation(line: 47, column: 6, scope: !73)
!73 = distinct !DILexicalBlock(scope: !63, file: !3, line: 47, column: 6)
!74 = !DILocation(line: 47, column: 13, scope: !73)
!75 = !DILocation(line: 47, column: 6, scope: !63)
!76 = !{!"if"}
!77 = !DILocation(line: 49, column: 10, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !3, line: 49, column: 3)
!79 = distinct !DILexicalBlock(scope: !73, file: !3, line: 47, column: 38)
!80 = !DILocation(line: 49, column: 8, scope: !78)
!81 = !DILocation(line: 49, column: 15, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !3, line: 49, column: 3)
!83 = !DILocation(line: 49, column: 17, scope: !82)
!84 = !DILocation(line: 49, column: 3, scope: !78)
!85 = !DILocation(line: 50, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !3, line: 50, column: 8)
!87 = distinct !DILexicalBlock(scope: !82, file: !3, line: 49, column: 38)
!88 = !DILocation(line: 50, column: 8, scope: !86)
!89 = !DILocation(line: 50, column: 8, scope: !87)
!90 = !DILocation(line: 50, column: 27, scope: !86)
!91 = !DILocation(line: 52, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !3, line: 52, column: 8)
!93 = !DILocation(line: 52, column: 8, scope: !87)
!94 = !DILocation(line: 53, column: 12, scope: !95)
!95 = distinct !DILexicalBlock(scope: !96, file: !3, line: 53, column: 5)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 52, column: 17)
!97 = !DILocation(line: 53, column: 10, scope: !95)
!98 = !DILocation(line: 53, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !3, line: 53, column: 5)
!100 = !DILocation(line: 53, column: 19, scope: !99)
!101 = !DILocation(line: 53, column: 5, scope: !95)
!102 = !DILocation(line: 54, column: 33, scope: !99)
!103 = !DILocation(line: 54, column: 24, scope: !99)
!104 = !DILocation(line: 54, column: 43, scope: !99)
!105 = !DILocation(line: 54, column: 37, scope: !99)
!106 = !DILocation(line: 54, column: 6, scope: !99)
!107 = !DILocation(line: 53, column: 32, scope: !99)
!108 = !DILocation(line: 53, column: 5, scope: !99)
!109 = distinct !{!109, !101, !110}
!110 = !DILocation(line: 54, column: 45, scope: !95)
!111 = !DILocation(line: 55, column: 31, scope: !96)
!112 = !DILocation(line: 55, column: 5, scope: !96)
!113 = !DILocation(line: 56, column: 4, scope: !96)
!114 = !DILocation(line: 57, column: 4, scope: !87)
!115 = !DILocation(line: 49, column: 34, scope: !82)
!116 = !DILocation(line: 49, column: 3, scope: !82)
!117 = distinct !{!117, !84, !118}
!118 = !DILocation(line: 58, column: 3, scope: !78)
!119 = !DILocation(line: 60, column: 3, scope: !79)
!120 = !DILocation(line: 61, column: 10, scope: !121)
!121 = distinct !DILexicalBlock(scope: !79, file: !3, line: 61, column: 3)
!122 = !DILocation(line: 61, column: 8, scope: !121)
!123 = !DILocation(line: 61, column: 15, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !3, line: 61, column: 3)
!125 = !DILocation(line: 61, column: 17, scope: !124)
!126 = !DILocation(line: 61, column: 3, scope: !121)
!127 = !DILocation(line: 62, column: 31, scope: !124)
!128 = !DILocation(line: 62, column: 22, scope: !124)
!129 = !DILocation(line: 62, column: 41, scope: !124)
!130 = !DILocation(line: 62, column: 35, scope: !124)
!131 = !DILocation(line: 62, column: 4, scope: !124)
!132 = !DILocation(line: 61, column: 30, scope: !124)
!133 = !DILocation(line: 61, column: 3, scope: !124)
!134 = distinct !{!134, !126, !135}
!135 = !DILocation(line: 62, column: 43, scope: !121)
!136 = !DILocation(line: 63, column: 3, scope: !79)
!137 = !DILocation(line: 66, column: 9, scope: !138)
!138 = distinct !DILexicalBlock(scope: !63, file: !3, line: 66, column: 2)
!139 = !DILocation(line: 66, column: 7, scope: !138)
!140 = !DILocation(line: 66, column: 14, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !3, line: 66, column: 2)
!142 = !DILocation(line: 66, column: 16, scope: !141)
!143 = !DILocation(line: 66, column: 2, scope: !138)
!144 = !DILocation(line: 67, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !3, line: 67, column: 7)
!146 = distinct !DILexicalBlock(scope: !141, file: !3, line: 66, column: 33)
!147 = !DILocation(line: 67, column: 7, scope: !145)
!148 = !DILocation(line: 67, column: 7, scope: !146)
!149 = !DILocation(line: 67, column: 20, scope: !145)
!150 = !DILocation(line: 68, column: 22, scope: !146)
!151 = !DILocation(line: 68, column: 12, scope: !146)
!152 = !DILocation(line: 68, column: 3, scope: !146)
!153 = !DILocation(line: 68, column: 20, scope: !146)
!154 = !DILocation(line: 69, column: 12, scope: !146)
!155 = !DILocation(line: 69, column: 3, scope: !146)
!156 = !DILocation(line: 69, column: 15, scope: !146)
!157 = !DILocation(line: 70, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !146, file: !3, line: 70, column: 7)
!159 = !DILocation(line: 70, column: 20, scope: !158)
!160 = !DILocation(line: 70, column: 7, scope: !158)
!161 = !DILocation(line: 70, column: 7, scope: !146)
!162 = !DILocation(line: 70, column: 26, scope: !158)
!163 = !DILocation(line: 71, column: 12, scope: !146)
!164 = !DILocation(line: 71, column: 3, scope: !146)
!165 = !DILocation(line: 71, column: 15, scope: !146)
!166 = !DILocation(line: 72, column: 2, scope: !146)
!167 = !DILocation(line: 66, column: 29, scope: !141)
!168 = !DILocation(line: 66, column: 2, scope: !141)
!169 = distinct !{!169, !143, !170}
!170 = !DILocation(line: 72, column: 2, scope: !138)
!171 = !DILocation(line: 73, column: 2, scope: !63)
!172 = !DILocation(line: 74, column: 1, scope: !63)
!173 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 76, type: !174, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!174 = !DISubroutineType(types: !175)
!175 = !{!18}
!176 = !DILocation(line: 78, column: 10, scope: !173)
!177 = !DILocation(line: 79, column: 7, scope: !178)
!178 = distinct !DILexicalBlock(scope: !173, file: !3, line: 79, column: 6)
!179 = !DILocation(line: 79, column: 6, scope: !173)
!180 = !DILocation(line: 79, column: 17, scope: !178)
!181 = !DILocation(line: 80, column: 2, scope: !173)
