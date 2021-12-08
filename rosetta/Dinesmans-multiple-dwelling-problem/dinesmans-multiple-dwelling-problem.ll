; ModuleID = 'dinesmans-multiple-dwelling-problem.ll'
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
  br i1 %cmp, label %if.then, label %if.end30, !dbg !75

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !76
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc15, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !80
  %cmp1 = icmp slt i32 %1, 6, !dbg !82
  br i1 %cmp1, label %for.body, label %for.end17, !dbg !83

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !84
  %idxprom = sext i32 %2 to i64, !dbg !87
  %arrayidx = getelementptr inbounds [6 x i32 (i32*)*], [6 x i32 (i32*)*]* @cond, i64 0, i64 %idxprom, !dbg !87
  %3 = load i32 (i32*)*, i32 (i32*)** %arrayidx, align 8, !dbg !87
  %call = call i32 %3(i32* getelementptr inbounds ([5 x i32], [5 x i32]* @solution, i64 0, i64 0)), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then2, label %if.end, !dbg !88

if.then2:                                         ; preds = %for.body
  br label %for.inc15, !dbg !89

if.end:                                           ; preds = %for.body
  %4 = load i32, i32* @verbose, align 4, !dbg !90
  %tobool3 = icmp ne i32 %4, 0, !dbg !90
  br i1 %tobool3, label %if.then4, label %if.end14, !dbg !92

if.then4:                                         ; preds = %if.end
  store i32 0, i32* %j, align 4, !dbg !93
  br label %for.cond5, !dbg !96

for.cond5:                                        ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %j, align 4, !dbg !97
  %cmp6 = icmp slt i32 %5, 5, !dbg !99
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !100

for.body7:                                        ; preds = %for.cond5
  %6 = load i32, i32* %j, align 4, !dbg !101
  %idxprom8 = sext i32 %6 to i64, !dbg !102
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* @solution, i64 0, i64 %idxprom8, !dbg !102
  %7 = load i32, i32* %arrayidx9, align 4, !dbg !102
  %8 = load i32, i32* %j, align 4, !dbg !103
  %idxprom10 = sext i32 %8 to i64, !dbg !104
  %arrayidx11 = getelementptr inbounds [5 x i8*], [5 x i8*]* @names, i64 0, i64 %idxprom10, !dbg !104
  %9 = load i8*, i8** %arrayidx11, align 8, !dbg !104
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 %7, i8* %9), !dbg !105
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body7
  %10 = load i32, i32* %j, align 4, !dbg !106
  %inc = add nsw i32 %10, 1, !dbg !106
  store i32 %inc, i32* %j, align 4, !dbg !106
  br label %for.cond5, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond5
  %11 = load i32, i32* %i, align 4, !dbg !110
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i32 %11), !dbg !111
  br label %if.end14, !dbg !112

if.end14:                                         ; preds = %for.end, %if.end
  store i32 0, i32* %retval, align 4, !dbg !113
  br label %return, !dbg !113

for.inc15:                                        ; preds = %if.then2
  %12 = load i32, i32* %i, align 4, !dbg !114
  %inc16 = add nsw i32 %12, 1, !dbg !114
  store i32 %inc16, i32* %i, align 4, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end17:                                        ; preds = %for.cond
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i64 0, i64 0)), !dbg !118
  store i32 0, i32* %i, align 4, !dbg !119
  br label %for.cond19, !dbg !121

for.cond19:                                       ; preds = %for.inc27, %for.end17
  %13 = load i32, i32* %i, align 4, !dbg !122
  %cmp20 = icmp slt i32 %13, 5, !dbg !124
  br i1 %cmp20, label %for.body21, label %for.end29, !dbg !125

for.body21:                                       ; preds = %for.cond19
  %14 = load i32, i32* %i, align 4, !dbg !126
  %idxprom22 = sext i32 %14 to i64, !dbg !127
  %arrayidx23 = getelementptr inbounds [5 x i32], [5 x i32]* @solution, i64 0, i64 %idxprom22, !dbg !127
  %15 = load i32, i32* %arrayidx23, align 4, !dbg !127
  %16 = load i32, i32* %i, align 4, !dbg !128
  %idxprom24 = sext i32 %16 to i64, !dbg !129
  %arrayidx25 = getelementptr inbounds [5 x i8*], [5 x i8*]* @names, i64 0, i64 %idxprom24, !dbg !129
  %17 = load i8*, i8** %arrayidx25, align 8, !dbg !129
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 %15, i8* %17), !dbg !130
  br label %for.inc27, !dbg !130

for.inc27:                                        ; preds = %for.body21
  %18 = load i32, i32* %i, align 4, !dbg !131
  %inc28 = add nsw i32 %18, 1, !dbg !131
  store i32 %inc28, i32* %i, align 4, !dbg !131
  br label %for.cond19, !dbg !132, !llvm.loop !133

for.end29:                                        ; preds = %for.cond19
  store i32 1, i32* %retval, align 4, !dbg !135
  br label %return, !dbg !135

if.end30:                                         ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !136
  br label %for.cond31, !dbg !138

for.cond31:                                       ; preds = %for.inc49, %if.end30
  %19 = load i32, i32* %i, align 4, !dbg !139
  %cmp32 = icmp slt i32 %19, 5, !dbg !141
  br i1 %cmp32, label %for.body33, label %for.end51, !dbg !142

for.body33:                                       ; preds = %for.cond31
  %20 = load i32, i32* %i, align 4, !dbg !143
  %idxprom34 = sext i32 %20 to i64, !dbg !146
  %arrayidx35 = getelementptr inbounds [5 x i32], [5 x i32]* @occupied, i64 0, i64 %idxprom34, !dbg !146
  %21 = load i32, i32* %arrayidx35, align 4, !dbg !146
  %tobool36 = icmp ne i32 %21, 0, !dbg !146
  br i1 %tobool36, label %if.then37, label %if.end38, !dbg !147

if.then37:                                        ; preds = %for.body33
  br label %for.inc49, !dbg !148

if.end38:                                         ; preds = %for.body33
  %22 = load i32, i32* %i, align 4, !dbg !149
  %23 = load i32, i32* %person.addr, align 4, !dbg !150
  %idxprom39 = sext i32 %23 to i64, !dbg !151
  %arrayidx40 = getelementptr inbounds [5 x i32], [5 x i32]* @solution, i64 0, i64 %idxprom39, !dbg !151
  store i32 %22, i32* %arrayidx40, align 4, !dbg !152
  %24 = load i32, i32* %i, align 4, !dbg !153
  %idxprom41 = sext i32 %24 to i64, !dbg !154
  %arrayidx42 = getelementptr inbounds [5 x i32], [5 x i32]* @occupied, i64 0, i64 %idxprom41, !dbg !154
  store i32 1, i32* %arrayidx42, align 4, !dbg !155
  %25 = load i32, i32* %person.addr, align 4, !dbg !156
  %add = add nsw i32 %25, 1, !dbg !158
  %call43 = call i32 @solve(i32 %add), !dbg !159
  %tobool44 = icmp ne i32 %call43, 0, !dbg !159
  br i1 %tobool44, label %if.then45, label %if.end46, !dbg !160

if.then45:                                        ; preds = %if.end38
  store i32 1, i32* %retval, align 4, !dbg !161
  br label %return, !dbg !161

if.end46:                                         ; preds = %if.end38
  %26 = load i32, i32* %i, align 4, !dbg !162
  %idxprom47 = sext i32 %26 to i64, !dbg !163
  %arrayidx48 = getelementptr inbounds [5 x i32], [5 x i32]* @occupied, i64 0, i64 %idxprom47, !dbg !163
  store i32 0, i32* %arrayidx48, align 4, !dbg !164
  br label %for.inc49, !dbg !165

for.inc49:                                        ; preds = %if.end46, %if.then37
  %27 = load i32, i32* %i, align 4, !dbg !166
  %inc50 = add nsw i32 %27, 1, !dbg !166
  store i32 %inc50, i32* %i, align 4, !dbg !166
  br label %for.cond31, !dbg !167, !llvm.loop !168

for.end51:                                        ; preds = %for.cond31
  store i32 0, i32* %retval, align 4, !dbg !170
  br label %return, !dbg !170

return:                                           ; preds = %for.end51, %if.then45, %for.end29, %if.end14
  %28 = load i32, i32* %retval, align 4, !dbg !171
  ret i32 %28, !dbg !171
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !172 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* @verbose, align 4, !dbg !175
  %call = call i32 @solve(i32 0), !dbg !176
  %tobool = icmp ne i32 %call, 0, !dbg !176
  br i1 %tobool, label %if.end, label %if.then, !dbg !178

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0)), !dbg !179
  br label %if.end, !dbg !179

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !180
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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
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
!42 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!76 = !DILocation(line: 49, column: 10, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !3, line: 49, column: 3)
!78 = distinct !DILexicalBlock(scope: !73, file: !3, line: 47, column: 38)
!79 = !DILocation(line: 49, column: 8, scope: !77)
!80 = !DILocation(line: 49, column: 15, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !3, line: 49, column: 3)
!82 = !DILocation(line: 49, column: 17, scope: !81)
!83 = !DILocation(line: 49, column: 3, scope: !77)
!84 = !DILocation(line: 50, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !3, line: 50, column: 8)
!86 = distinct !DILexicalBlock(scope: !81, file: !3, line: 49, column: 38)
!87 = !DILocation(line: 50, column: 8, scope: !85)
!88 = !DILocation(line: 50, column: 8, scope: !86)
!89 = !DILocation(line: 50, column: 27, scope: !85)
!90 = !DILocation(line: 52, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !3, line: 52, column: 8)
!92 = !DILocation(line: 52, column: 8, scope: !86)
!93 = !DILocation(line: 53, column: 12, scope: !94)
!94 = distinct !DILexicalBlock(scope: !95, file: !3, line: 53, column: 5)
!95 = distinct !DILexicalBlock(scope: !91, file: !3, line: 52, column: 17)
!96 = !DILocation(line: 53, column: 10, scope: !94)
!97 = !DILocation(line: 53, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 53, column: 5)
!99 = !DILocation(line: 53, column: 19, scope: !98)
!100 = !DILocation(line: 53, column: 5, scope: !94)
!101 = !DILocation(line: 54, column: 33, scope: !98)
!102 = !DILocation(line: 54, column: 24, scope: !98)
!103 = !DILocation(line: 54, column: 43, scope: !98)
!104 = !DILocation(line: 54, column: 37, scope: !98)
!105 = !DILocation(line: 54, column: 6, scope: !98)
!106 = !DILocation(line: 53, column: 32, scope: !98)
!107 = !DILocation(line: 53, column: 5, scope: !98)
!108 = distinct !{!108, !100, !109}
!109 = !DILocation(line: 54, column: 45, scope: !94)
!110 = !DILocation(line: 55, column: 31, scope: !95)
!111 = !DILocation(line: 55, column: 5, scope: !95)
!112 = !DILocation(line: 56, column: 4, scope: !95)
!113 = !DILocation(line: 57, column: 4, scope: !86)
!114 = !DILocation(line: 49, column: 34, scope: !81)
!115 = !DILocation(line: 49, column: 3, scope: !81)
!116 = distinct !{!116, !83, !117}
!117 = !DILocation(line: 58, column: 3, scope: !77)
!118 = !DILocation(line: 60, column: 3, scope: !78)
!119 = !DILocation(line: 61, column: 10, scope: !120)
!120 = distinct !DILexicalBlock(scope: !78, file: !3, line: 61, column: 3)
!121 = !DILocation(line: 61, column: 8, scope: !120)
!122 = !DILocation(line: 61, column: 15, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !3, line: 61, column: 3)
!124 = !DILocation(line: 61, column: 17, scope: !123)
!125 = !DILocation(line: 61, column: 3, scope: !120)
!126 = !DILocation(line: 62, column: 31, scope: !123)
!127 = !DILocation(line: 62, column: 22, scope: !123)
!128 = !DILocation(line: 62, column: 41, scope: !123)
!129 = !DILocation(line: 62, column: 35, scope: !123)
!130 = !DILocation(line: 62, column: 4, scope: !123)
!131 = !DILocation(line: 61, column: 30, scope: !123)
!132 = !DILocation(line: 61, column: 3, scope: !123)
!133 = distinct !{!133, !125, !134}
!134 = !DILocation(line: 62, column: 43, scope: !120)
!135 = !DILocation(line: 63, column: 3, scope: !78)
!136 = !DILocation(line: 66, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !63, file: !3, line: 66, column: 2)
!138 = !DILocation(line: 66, column: 7, scope: !137)
!139 = !DILocation(line: 66, column: 14, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !3, line: 66, column: 2)
!141 = !DILocation(line: 66, column: 16, scope: !140)
!142 = !DILocation(line: 66, column: 2, scope: !137)
!143 = !DILocation(line: 67, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !145, file: !3, line: 67, column: 7)
!145 = distinct !DILexicalBlock(scope: !140, file: !3, line: 66, column: 33)
!146 = !DILocation(line: 67, column: 7, scope: !144)
!147 = !DILocation(line: 67, column: 7, scope: !145)
!148 = !DILocation(line: 67, column: 20, scope: !144)
!149 = !DILocation(line: 68, column: 22, scope: !145)
!150 = !DILocation(line: 68, column: 12, scope: !145)
!151 = !DILocation(line: 68, column: 3, scope: !145)
!152 = !DILocation(line: 68, column: 20, scope: !145)
!153 = !DILocation(line: 69, column: 12, scope: !145)
!154 = !DILocation(line: 69, column: 3, scope: !145)
!155 = !DILocation(line: 69, column: 15, scope: !145)
!156 = !DILocation(line: 70, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !145, file: !3, line: 70, column: 7)
!158 = !DILocation(line: 70, column: 20, scope: !157)
!159 = !DILocation(line: 70, column: 7, scope: !157)
!160 = !DILocation(line: 70, column: 7, scope: !145)
!161 = !DILocation(line: 70, column: 26, scope: !157)
!162 = !DILocation(line: 71, column: 12, scope: !145)
!163 = !DILocation(line: 71, column: 3, scope: !145)
!164 = !DILocation(line: 71, column: 15, scope: !145)
!165 = !DILocation(line: 72, column: 2, scope: !145)
!166 = !DILocation(line: 66, column: 29, scope: !140)
!167 = !DILocation(line: 66, column: 2, scope: !140)
!168 = distinct !{!168, !142, !169}
!169 = !DILocation(line: 72, column: 2, scope: !137)
!170 = !DILocation(line: 73, column: 2, scope: !63)
!171 = !DILocation(line: 74, column: 1, scope: !63)
!172 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 76, type: !173, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!173 = !DISubroutineType(types: !174)
!174 = !{!18}
!175 = !DILocation(line: 78, column: 10, scope: !172)
!176 = !DILocation(line: 79, column: 7, scope: !177)
!177 = distinct !DILexicalBlock(scope: !172, file: !3, line: 79, column: 6)
!178 = !DILocation(line: 79, column: 6, scope: !172)
!179 = !DILocation(line: 79, column: 17, scope: !177)
!180 = !DILocation(line: 80, column: 2, scope: !172)
