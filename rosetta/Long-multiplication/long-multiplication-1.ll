; ModuleID = 'long-multiplication-1.c'
source_filename = "long-multiplication-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"-18446744073709551616\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @longmulti(i8* %a, i8* %b, i8* %c) #0 !dbg !7 {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %carry = alloca i32, align 4
  %la = alloca i32, align 4
  %lb = alloca i32, align 4
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i8* %c, i8** %c.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %c.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %i, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %j, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %j, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %k, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %k, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %n, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %carry, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %la, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %lb, metadata !33, metadata !DIExpression()), !dbg !34
  %0 = load i8*, i8** %a.addr, align 8, !dbg !35
  %call = call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #5, !dbg !37
  %tobool = icmp ne i32 %call, 0, !dbg !37
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !38, !cf.info !39

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %b.addr, align 8, !dbg !40
  %call1 = call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #5, !dbg !41
  %tobool2 = icmp ne i32 %call1, 0, !dbg !41
  br i1 %tobool2, label %if.end, label %if.then, !dbg !42, !cf.info !39

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i8*, i8** %c.addr, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !43
  store i8 48, i8* %arrayidx, align 1, !dbg !45
  %3 = load i8*, i8** %c.addr, align 8, !dbg !46
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 1, !dbg !46
  store i8 0, i8* %arrayidx3, align 1, !dbg !47
  br label %return, !dbg !48

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i8*, i8** %a.addr, align 8, !dbg !49
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 0, !dbg !49
  %5 = load i8, i8* %arrayidx4, align 1, !dbg !49
  %conv = sext i8 %5 to i32, !dbg !49
  %cmp = icmp eq i32 %conv, 45, !dbg !51
  br i1 %cmp, label %if.then6, label %if.end8, !dbg !52, !cf.info !39

if.then6:                                         ; preds = %if.end
  store i32 1, i32* %i, align 4, !dbg !53
  %6 = load i32, i32* %k, align 4, !dbg !55
  %tobool7 = icmp ne i32 %6, 0, !dbg !56
  %lnot = xor i1 %tobool7, true, !dbg !56
  %lnot.ext = zext i1 %lnot to i32, !dbg !56
  store i32 %lnot.ext, i32* %k, align 4, !dbg !57
  br label %if.end8, !dbg !58

if.end8:                                          ; preds = %if.then6, %if.end
  %7 = load i8*, i8** %b.addr, align 8, !dbg !59
  %arrayidx9 = getelementptr inbounds i8, i8* %7, i64 0, !dbg !59
  %8 = load i8, i8* %arrayidx9, align 1, !dbg !59
  %conv10 = sext i8 %8 to i32, !dbg !59
  %cmp11 = icmp eq i32 %conv10, 45, !dbg !61
  br i1 %cmp11, label %if.then13, label %if.end17, !dbg !62, !cf.info !39

if.then13:                                        ; preds = %if.end8
  store i32 1, i32* %j, align 4, !dbg !63
  %9 = load i32, i32* %k, align 4, !dbg !65
  %tobool14 = icmp ne i32 %9, 0, !dbg !66
  %lnot15 = xor i1 %tobool14, true, !dbg !66
  %lnot.ext16 = zext i1 %lnot15 to i32, !dbg !66
  store i32 %lnot.ext16, i32* %k, align 4, !dbg !67
  br label %if.end17, !dbg !68

if.end17:                                         ; preds = %if.then13, %if.end8
  %10 = load i32, i32* %i, align 4, !dbg !69
  %tobool18 = icmp ne i32 %10, 0, !dbg !69
  br i1 %tobool18, label %if.then21, label %lor.lhs.false19, !dbg !71, !cf.info !39

lor.lhs.false19:                                  ; preds = %if.end17
  %11 = load i32, i32* %j, align 4, !dbg !72
  %tobool20 = icmp ne i32 %11, 0, !dbg !72
  br i1 %tobool20, label %if.then21, label %if.end30, !dbg !73, !cf.info !39

if.then21:                                        ; preds = %lor.lhs.false19, %if.end17
  %12 = load i32, i32* %k, align 4, !dbg !74
  %tobool22 = icmp ne i32 %12, 0, !dbg !74
  br i1 %tobool22, label %if.then23, label %if.end25, !dbg !77, !cf.info !39

if.then23:                                        ; preds = %if.then21
  %13 = load i8*, i8** %c.addr, align 8, !dbg !78
  %arrayidx24 = getelementptr inbounds i8, i8* %13, i64 0, !dbg !78
  store i8 45, i8* %arrayidx24, align 1, !dbg !79
  br label %if.end25, !dbg !78

if.end25:                                         ; preds = %if.then23, %if.then21
  %14 = load i8*, i8** %a.addr, align 8, !dbg !80
  %15 = load i32, i32* %i, align 4, !dbg !81
  %idx.ext = sext i32 %15 to i64, !dbg !82
  %add.ptr = getelementptr inbounds i8, i8* %14, i64 %idx.ext, !dbg !82
  %16 = load i8*, i8** %b.addr, align 8, !dbg !83
  %17 = load i32, i32* %j, align 4, !dbg !84
  %idx.ext26 = sext i32 %17 to i64, !dbg !85
  %add.ptr27 = getelementptr inbounds i8, i8* %16, i64 %idx.ext26, !dbg !85
  %18 = load i8*, i8** %c.addr, align 8, !dbg !86
  %19 = load i32, i32* %k, align 4, !dbg !87
  %idx.ext28 = sext i32 %19 to i64, !dbg !88
  %add.ptr29 = getelementptr inbounds i8, i8* %18, i64 %idx.ext28, !dbg !88
  call void @longmulti(i8* %add.ptr, i8* %add.ptr27, i8* %add.ptr29), !dbg !89
  br label %return, !dbg !90

if.end30:                                         ; preds = %lor.lhs.false19
  %20 = load i8*, i8** %a.addr, align 8, !dbg !91
  %call31 = call i64 @strlen(i8* %20) #5, !dbg !92
  %conv32 = trunc i64 %call31 to i32, !dbg !92
  store i32 %conv32, i32* %la, align 4, !dbg !93
  %21 = load i8*, i8** %b.addr, align 8, !dbg !94
  %call33 = call i64 @strlen(i8* %21) #5, !dbg !95
  %conv34 = trunc i64 %call33 to i32, !dbg !95
  store i32 %conv34, i32* %lb, align 4, !dbg !96
  %22 = load i8*, i8** %c.addr, align 8, !dbg !97
  %23 = load i32, i32* %la, align 4, !dbg !98
  %24 = load i32, i32* %lb, align 4, !dbg !99
  %add = add nsw i32 %23, %24, !dbg !100
  %conv35 = sext i32 %add to i64, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %22, i8 48, i64 %conv35, i1 false), !dbg !101
  %25 = load i8*, i8** %c.addr, align 8, !dbg !102
  %26 = load i32, i32* %la, align 4, !dbg !103
  %27 = load i32, i32* %lb, align 4, !dbg !104
  %add36 = add nsw i32 %26, %27, !dbg !105
  %idxprom = sext i32 %add36 to i64, !dbg !102
  %arrayidx37 = getelementptr inbounds i8, i8* %25, i64 %idxprom, !dbg !102
  store i8 0, i8* %arrayidx37, align 1, !dbg !106
  %28 = load i32, i32* %la, align 4, !dbg !107
  %sub = sub nsw i32 %28, 1, !dbg !109
  store i32 %sub, i32* %i, align 4, !dbg !110
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc71, %if.end30
  %29 = load i32, i32* %i, align 4, !dbg !112
  %cmp38 = icmp sge i32 %29, 0, !dbg !114
  br i1 %cmp38, label %for.body, label %for.end73, !dbg !115

for.body:                                         ; preds = %for.cond
  %30 = load i32, i32* %lb, align 4, !dbg !116
  %sub40 = sub nsw i32 %30, 1, !dbg !119
  store i32 %sub40, i32* %j, align 4, !dbg !120
  %31 = load i32, i32* %i, align 4, !dbg !121
  %32 = load i32, i32* %j, align 4, !dbg !122
  %add41 = add nsw i32 %31, %32, !dbg !123
  %add42 = add nsw i32 %add41, 1, !dbg !124
  store i32 %add42, i32* %k, align 4, !dbg !125
  store i32 0, i32* %carry, align 4, !dbg !126
  br label %for.cond43, !dbg !127

for.cond43:                                       ; preds = %for.inc, %for.body
  %33 = load i32, i32* %j, align 4, !dbg !128
  %cmp44 = icmp sge i32 %33, 0, !dbg !130
  br i1 %cmp44, label %for.body46, label %for.end, !dbg !131

for.body46:                                       ; preds = %for.cond43
  %34 = load i8*, i8** %a.addr, align 8, !dbg !132
  %35 = load i32, i32* %i, align 4, !dbg !132
  %idxprom47 = sext i32 %35 to i64, !dbg !132
  %arrayidx48 = getelementptr inbounds i8, i8* %34, i64 %idxprom47, !dbg !132
  %36 = load i8, i8* %arrayidx48, align 1, !dbg !132
  %conv49 = sext i8 %36 to i32, !dbg !132
  %sub50 = sub nsw i32 %conv49, 48, !dbg !132
  %37 = load i8*, i8** %b.addr, align 8, !dbg !134
  %38 = load i32, i32* %j, align 4, !dbg !134
  %idxprom51 = sext i32 %38 to i64, !dbg !134
  %arrayidx52 = getelementptr inbounds i8, i8* %37, i64 %idxprom51, !dbg !134
  %39 = load i8, i8* %arrayidx52, align 1, !dbg !134
  %conv53 = sext i8 %39 to i32, !dbg !134
  %sub54 = sub nsw i32 %conv53, 48, !dbg !134
  %mul = mul nsw i32 %sub50, %sub54, !dbg !135
  %40 = load i8*, i8** %c.addr, align 8, !dbg !136
  %41 = load i32, i32* %k, align 4, !dbg !136
  %idxprom55 = sext i32 %41 to i64, !dbg !136
  %arrayidx56 = getelementptr inbounds i8, i8* %40, i64 %idxprom55, !dbg !136
  %42 = load i8, i8* %arrayidx56, align 1, !dbg !136
  %conv57 = sext i8 %42 to i32, !dbg !136
  %sub58 = sub nsw i32 %conv57, 48, !dbg !136
  %add59 = add nsw i32 %mul, %sub58, !dbg !137
  %43 = load i32, i32* %carry, align 4, !dbg !138
  %add60 = add nsw i32 %add59, %43, !dbg !139
  store i32 %add60, i32* %n, align 4, !dbg !140
  %44 = load i32, i32* %n, align 4, !dbg !141
  %div = sdiv i32 %44, 10, !dbg !142
  store i32 %div, i32* %carry, align 4, !dbg !143
  %45 = load i32, i32* %n, align 4, !dbg !144
  %rem = srem i32 %45, 10, !dbg !145
  %add61 = add nsw i32 %rem, 48, !dbg !146
  %conv62 = trunc i32 %add61 to i8, !dbg !147
  %46 = load i8*, i8** %c.addr, align 8, !dbg !148
  %47 = load i32, i32* %k, align 4, !dbg !149
  %idxprom63 = sext i32 %47 to i64, !dbg !148
  %arrayidx64 = getelementptr inbounds i8, i8* %46, i64 %idxprom63, !dbg !148
  store i8 %conv62, i8* %arrayidx64, align 1, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body46
  %48 = load i32, i32* %j, align 4, !dbg !152
  %dec = add nsw i32 %48, -1, !dbg !152
  store i32 %dec, i32* %j, align 4, !dbg !152
  %49 = load i32, i32* %k, align 4, !dbg !153
  %dec65 = add nsw i32 %49, -1, !dbg !153
  store i32 %dec65, i32* %k, align 4, !dbg !153
  br label %for.cond43, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond43
  %50 = load i32, i32* %carry, align 4, !dbg !157
  %51 = load i8*, i8** %c.addr, align 8, !dbg !158
  %52 = load i32, i32* %k, align 4, !dbg !159
  %idxprom66 = sext i32 %52 to i64, !dbg !158
  %arrayidx67 = getelementptr inbounds i8, i8* %51, i64 %idxprom66, !dbg !158
  %53 = load i8, i8* %arrayidx67, align 1, !dbg !160
  %conv68 = sext i8 %53 to i32, !dbg !160
  %add69 = add nsw i32 %conv68, %50, !dbg !160
  %conv70 = trunc i32 %add69 to i8, !dbg !160
  store i8 %conv70, i8* %arrayidx67, align 1, !dbg !160
  br label %for.inc71, !dbg !161

for.inc71:                                        ; preds = %for.end
  %54 = load i32, i32* %i, align 4, !dbg !162
  %dec72 = add nsw i32 %54, -1, !dbg !162
  store i32 %dec72, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end73:                                        ; preds = %for.cond
  %55 = load i8*, i8** %c.addr, align 8, !dbg !166
  %arrayidx74 = getelementptr inbounds i8, i8* %55, i64 0, !dbg !166
  %56 = load i8, i8* %arrayidx74, align 1, !dbg !166
  %conv75 = sext i8 %56 to i32, !dbg !166
  %cmp76 = icmp eq i32 %conv75, 48, !dbg !168
  br i1 %cmp76, label %if.then78, label %if.end82, !dbg !169, !cf.info !39

if.then78:                                        ; preds = %for.end73
  %57 = load i8*, i8** %c.addr, align 8, !dbg !170
  %58 = load i8*, i8** %c.addr, align 8, !dbg !171
  %add.ptr79 = getelementptr inbounds i8, i8* %58, i64 1, !dbg !172
  %59 = load i32, i32* %la, align 4, !dbg !173
  %60 = load i32, i32* %lb, align 4, !dbg !174
  %add80 = add nsw i32 %59, %60, !dbg !175
  %conv81 = sext i32 %add80 to i64, !dbg !173
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %57, i8* align 1 %add.ptr79, i64 %conv81, i1 false), !dbg !176
  br label %if.end82, !dbg !176

if.end82:                                         ; preds = %if.then78, %for.end73
  br label %return, !dbg !177

return:                                           ; preds = %if.end82, %if.end25, %if.then
  ret void, !dbg !178
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !179 {
entry:
  %retval = alloca i32, align 4
  %c = alloca [1024 x i8], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [1024 x i8]* %c, metadata !182, metadata !DIExpression()), !dbg !186
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %c, i64 0, i64 0, !dbg !187
  call void @longmulti(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i8* %arraydecay), !dbg !188
  %arraydecay1 = getelementptr inbounds [1024 x i8], [1024 x i8]* %c, i64 0, i64 0, !dbg !189
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay1), !dbg !190
  ret i32 0, !dbg !191
}

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
!1 = !DIFile(filename: "long-multiplication-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Long-multiplication")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "longmulti", scope: !1, file: !1, line: 6, type: !8, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !13}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 6, type: !10)
!15 = !DILocation(line: 6, column: 28, scope: !7)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 6, type: !10)
!17 = !DILocation(line: 6, column: 43, scope: !7)
!18 = !DILocalVariable(name: "c", arg: 3, scope: !7, file: !1, line: 6, type: !13)
!19 = !DILocation(line: 6, column: 52, scope: !7)
!20 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 8, type: !21)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocation(line: 8, column: 6, scope: !7)
!23 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 8, type: !21)
!24 = !DILocation(line: 8, column: 13, scope: !7)
!25 = !DILocalVariable(name: "k", scope: !7, file: !1, line: 8, type: !21)
!26 = !DILocation(line: 8, column: 20, scope: !7)
!27 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 8, type: !21)
!28 = !DILocation(line: 8, column: 27, scope: !7)
!29 = !DILocalVariable(name: "carry", scope: !7, file: !1, line: 8, type: !21)
!30 = !DILocation(line: 8, column: 30, scope: !7)
!31 = !DILocalVariable(name: "la", scope: !7, file: !1, line: 9, type: !21)
!32 = !DILocation(line: 9, column: 6, scope: !7)
!33 = !DILocalVariable(name: "lb", scope: !7, file: !1, line: 9, type: !21)
!34 = !DILocation(line: 9, column: 10, scope: !7)
!35 = !DILocation(line: 12, column: 14, scope: !36)
!36 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 6)
!37 = !DILocation(line: 12, column: 7, scope: !36)
!38 = !DILocation(line: 12, column: 22, scope: !36)
!39 = !{!"if"}
!40 = !DILocation(line: 12, column: 33, scope: !36)
!41 = !DILocation(line: 12, column: 26, scope: !36)
!42 = !DILocation(line: 12, column: 6, scope: !7)
!43 = !DILocation(line: 13, column: 3, scope: !44)
!44 = distinct !DILexicalBlock(scope: !36, file: !1, line: 12, column: 42)
!45 = !DILocation(line: 13, column: 8, scope: !44)
!46 = !DILocation(line: 13, column: 15, scope: !44)
!47 = !DILocation(line: 13, column: 20, scope: !44)
!48 = !DILocation(line: 14, column: 3, scope: !44)
!49 = !DILocation(line: 18, column: 6, scope: !50)
!50 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 6)
!51 = !DILocation(line: 18, column: 11, scope: !50)
!52 = !DILocation(line: 18, column: 6, scope: !7)
!53 = !DILocation(line: 18, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 18, column: 19)
!55 = !DILocation(line: 18, column: 33, scope: !54)
!56 = !DILocation(line: 18, column: 32, scope: !54)
!57 = !DILocation(line: 18, column: 30, scope: !54)
!58 = !DILocation(line: 18, column: 36, scope: !54)
!59 = !DILocation(line: 19, column: 6, scope: !60)
!60 = distinct !DILexicalBlock(scope: !7, file: !1, line: 19, column: 6)
!61 = !DILocation(line: 19, column: 11, scope: !60)
!62 = !DILocation(line: 19, column: 6, scope: !7)
!63 = !DILocation(line: 19, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !1, line: 19, column: 19)
!65 = !DILocation(line: 19, column: 33, scope: !64)
!66 = !DILocation(line: 19, column: 32, scope: !64)
!67 = !DILocation(line: 19, column: 30, scope: !64)
!68 = !DILocation(line: 19, column: 36, scope: !64)
!69 = !DILocation(line: 22, column: 6, scope: !70)
!70 = distinct !DILexicalBlock(scope: !7, file: !1, line: 22, column: 6)
!71 = !DILocation(line: 22, column: 8, scope: !70)
!72 = !DILocation(line: 22, column: 11, scope: !70)
!73 = !DILocation(line: 22, column: 6, scope: !7)
!74 = !DILocation(line: 23, column: 7, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 23, column: 7)
!76 = distinct !DILexicalBlock(scope: !70, file: !1, line: 22, column: 14)
!77 = !DILocation(line: 23, column: 7, scope: !76)
!78 = !DILocation(line: 23, column: 10, scope: !75)
!79 = !DILocation(line: 23, column: 15, scope: !75)
!80 = !DILocation(line: 24, column: 13, scope: !76)
!81 = !DILocation(line: 24, column: 17, scope: !76)
!82 = !DILocation(line: 24, column: 15, scope: !76)
!83 = !DILocation(line: 24, column: 20, scope: !76)
!84 = !DILocation(line: 24, column: 24, scope: !76)
!85 = !DILocation(line: 24, column: 22, scope: !76)
!86 = !DILocation(line: 24, column: 27, scope: !76)
!87 = !DILocation(line: 24, column: 31, scope: !76)
!88 = !DILocation(line: 24, column: 29, scope: !76)
!89 = !DILocation(line: 24, column: 3, scope: !76)
!90 = !DILocation(line: 25, column: 3, scope: !76)
!91 = !DILocation(line: 28, column: 14, scope: !7)
!92 = !DILocation(line: 28, column: 7, scope: !7)
!93 = !DILocation(line: 28, column: 5, scope: !7)
!94 = !DILocation(line: 29, column: 14, scope: !7)
!95 = !DILocation(line: 29, column: 7, scope: !7)
!96 = !DILocation(line: 29, column: 5, scope: !7)
!97 = !DILocation(line: 30, column: 9, scope: !7)
!98 = !DILocation(line: 30, column: 17, scope: !7)
!99 = !DILocation(line: 30, column: 22, scope: !7)
!100 = !DILocation(line: 30, column: 20, scope: !7)
!101 = !DILocation(line: 30, column: 2, scope: !7)
!102 = !DILocation(line: 31, column: 2, scope: !7)
!103 = !DILocation(line: 31, column: 4, scope: !7)
!104 = !DILocation(line: 31, column: 9, scope: !7)
!105 = !DILocation(line: 31, column: 7, scope: !7)
!106 = !DILocation(line: 31, column: 13, scope: !7)
!107 = !DILocation(line: 34, column: 11, scope: !108)
!108 = distinct !DILexicalBlock(scope: !7, file: !1, line: 34, column: 2)
!109 = !DILocation(line: 34, column: 14, scope: !108)
!110 = !DILocation(line: 34, column: 9, scope: !108)
!111 = !DILocation(line: 34, column: 7, scope: !108)
!112 = !DILocation(line: 34, column: 19, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !1, line: 34, column: 2)
!114 = !DILocation(line: 34, column: 21, scope: !113)
!115 = !DILocation(line: 34, column: 2, scope: !108)
!116 = !DILocation(line: 35, column: 12, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !1, line: 35, column: 3)
!118 = distinct !DILexicalBlock(scope: !113, file: !1, line: 34, column: 32)
!119 = !DILocation(line: 35, column: 15, scope: !117)
!120 = !DILocation(line: 35, column: 10, scope: !117)
!121 = !DILocation(line: 35, column: 24, scope: !117)
!122 = !DILocation(line: 35, column: 28, scope: !117)
!123 = !DILocation(line: 35, column: 26, scope: !117)
!124 = !DILocation(line: 35, column: 30, scope: !117)
!125 = !DILocation(line: 35, column: 22, scope: !117)
!126 = !DILocation(line: 35, column: 41, scope: !117)
!127 = !DILocation(line: 35, column: 8, scope: !117)
!128 = !DILocation(line: 35, column: 46, scope: !129)
!129 = distinct !DILexicalBlock(scope: !117, file: !1, line: 35, column: 3)
!130 = !DILocation(line: 35, column: 48, scope: !129)
!131 = !DILocation(line: 35, column: 3, scope: !117)
!132 = !DILocation(line: 36, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !1, line: 35, column: 64)
!134 = !DILocation(line: 36, column: 18, scope: !133)
!135 = !DILocation(line: 36, column: 16, scope: !133)
!136 = !DILocation(line: 36, column: 28, scope: !133)
!137 = !DILocation(line: 36, column: 26, scope: !133)
!138 = !DILocation(line: 36, column: 38, scope: !133)
!139 = !DILocation(line: 36, column: 36, scope: !133)
!140 = !DILocation(line: 36, column: 6, scope: !133)
!141 = !DILocation(line: 37, column: 12, scope: !133)
!142 = !DILocation(line: 37, column: 14, scope: !133)
!143 = !DILocation(line: 37, column: 10, scope: !133)
!144 = !DILocation(line: 38, column: 12, scope: !133)
!145 = !DILocation(line: 38, column: 14, scope: !133)
!146 = !DILocation(line: 38, column: 20, scope: !133)
!147 = !DILocation(line: 38, column: 11, scope: !133)
!148 = !DILocation(line: 38, column: 4, scope: !133)
!149 = !DILocation(line: 38, column: 6, scope: !133)
!150 = !DILocation(line: 38, column: 9, scope: !133)
!151 = !DILocation(line: 39, column: 3, scope: !133)
!152 = !DILocation(line: 35, column: 55, scope: !129)
!153 = !DILocation(line: 35, column: 60, scope: !129)
!154 = !DILocation(line: 35, column: 3, scope: !129)
!155 = distinct !{!155, !131, !156}
!156 = !DILocation(line: 39, column: 3, scope: !117)
!157 = !DILocation(line: 40, column: 11, scope: !118)
!158 = !DILocation(line: 40, column: 3, scope: !118)
!159 = !DILocation(line: 40, column: 5, scope: !118)
!160 = !DILocation(line: 40, column: 8, scope: !118)
!161 = !DILocation(line: 41, column: 2, scope: !118)
!162 = !DILocation(line: 34, column: 28, scope: !113)
!163 = !DILocation(line: 34, column: 2, scope: !113)
!164 = distinct !{!164, !115, !165}
!165 = !DILocation(line: 41, column: 2, scope: !108)
!166 = !DILocation(line: 43, column: 6, scope: !167)
!167 = distinct !DILexicalBlock(scope: !7, file: !1, line: 43, column: 6)
!168 = !DILocation(line: 43, column: 11, scope: !167)
!169 = !DILocation(line: 43, column: 6, scope: !7)
!170 = !DILocation(line: 43, column: 27, scope: !167)
!171 = !DILocation(line: 43, column: 30, scope: !167)
!172 = !DILocation(line: 43, column: 32, scope: !167)
!173 = !DILocation(line: 43, column: 37, scope: !167)
!174 = !DILocation(line: 43, column: 42, scope: !167)
!175 = !DILocation(line: 43, column: 40, scope: !167)
!176 = !DILocation(line: 43, column: 19, scope: !167)
!177 = !DILocation(line: 45, column: 2, scope: !7)
!178 = !DILocation(line: 46, column: 1, scope: !7)
!179 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 48, type: !180, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!180 = !DISubroutineType(types: !181)
!181 = !{!21}
!182 = !DILocalVariable(name: "c", scope: !179, file: !1, line: 50, type: !183)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 8192, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 1024)
!186 = !DILocation(line: 50, column: 7, scope: !179)
!187 = !DILocation(line: 51, column: 62, scope: !179)
!188 = !DILocation(line: 51, column: 2, scope: !179)
!189 = !DILocation(line: 52, column: 17, scope: !179)
!190 = !DILocation(line: 52, column: 2, scope: !179)
!191 = !DILocation(line: 54, column: 2, scope: !179)
