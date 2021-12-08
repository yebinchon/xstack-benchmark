; ModuleID = 'bitcoin-address-validation.bc'
source_filename = "bitcoin-address-validation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@unbase58.tmpl = internal global i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
@.str = private unnamed_addr constant [59 x i8] c"123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"bad char\00", align 1
@coin_err = common dso_local global i8* null, align 8, !dbg !15
@.str.2 = private unnamed_addr constant [17 x i8] c"address too long\00", align 1
@.str.3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"bad digest\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"1Q1pE5vPGEEMqRcVRMbtBK842Y6Pzo6nK9\00", align 1
@.str.6 = private unnamed_addr constant [35 x i8] c"1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62i\00", align 1
@.str.7 = private unnamed_addr constant [35 x i8] c"1Q1pE5vPGEEMqRcVRMbtBK842Y6Pzo6nJ9\00", align 1
@.str.8 = private unnamed_addr constant [35 x i8] c"1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62I\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"%s: %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"Ok\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @unbase58(i8* %s, i8* %out) #0 !dbg !2 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %c = alloca i32, align 4
  %p = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %j, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %c, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i8** %p, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i8*, i8** %out.addr, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 25, i1 false), !dbg !34
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s.addr, align 8, !dbg !38
  %2 = load i32, i32* %i, align 4, !dbg !40
  %idxprom = sext i32 %2 to i64, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !38
  %3 = load i8, i8* %arrayidx, align 1, !dbg !38
  %tobool = icmp ne i8 %3, 0, !dbg !41
  br i1 %tobool, label %for.body, label %for.end17, !dbg !41

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** @unbase58.tmpl, align 8, !dbg !42
  %5 = load i8*, i8** %s.addr, align 8, !dbg !45
  %6 = load i32, i32* %i, align 4, !dbg !46
  %idxprom1 = sext i32 %6 to i64, !dbg !45
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i64 %idxprom1, !dbg !45
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !45
  %conv = sext i8 %7 to i32, !dbg !45
  %call = call i8* @strchr(i8* %4, i32 %conv) #5, !dbg !47
  store i8* %call, i8** %p, align 8, !dbg !48
  %tobool3 = icmp ne i8* %call, null, !dbg !48
  br i1 %tobool3, label %if.end, label %if.then, !dbg !49

if.then:                                          ; preds = %for.body
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i8** @coin_err, align 8, !dbg !50
  store i32 0, i32* %retval, align 4, !dbg !50
  br label %return, !dbg !50

if.end:                                           ; preds = %for.body
  %8 = load i8*, i8** %p, align 8, !dbg !52
  %9 = load i8*, i8** @unbase58.tmpl, align 8, !dbg !53
  %sub.ptr.lhs.cast = ptrtoint i8* %8 to i64, !dbg !54
  %sub.ptr.rhs.cast = ptrtoint i8* %9 to i64, !dbg !54
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !54
  %conv4 = trunc i64 %sub.ptr.sub to i32, !dbg !52
  store i32 %conv4, i32* %c, align 4, !dbg !55
  store i32 25, i32* %j, align 4, !dbg !56
  br label %for.cond5, !dbg !58

for.cond5:                                        ; preds = %for.body7, %if.end
  %10 = load i32, i32* %j, align 4, !dbg !59
  %dec = add nsw i32 %10, -1, !dbg !59
  store i32 %dec, i32* %j, align 4, !dbg !59
  %tobool6 = icmp ne i32 %10, 0, !dbg !61
  br i1 %tobool6, label %for.body7, label %for.end, !dbg !61

for.body7:                                        ; preds = %for.cond5
  %11 = load i8*, i8** %out.addr, align 8, !dbg !62
  %12 = load i32, i32* %j, align 4, !dbg !64
  %idxprom8 = sext i32 %12 to i64, !dbg !62
  %arrayidx9 = getelementptr inbounds i8, i8* %11, i64 %idxprom8, !dbg !62
  %13 = load i8, i8* %arrayidx9, align 1, !dbg !62
  %conv10 = zext i8 %13 to i32, !dbg !62
  %mul = mul nsw i32 58, %conv10, !dbg !65
  %14 = load i32, i32* %c, align 4, !dbg !66
  %add = add nsw i32 %14, %mul, !dbg !66
  store i32 %add, i32* %c, align 4, !dbg !66
  %15 = load i32, i32* %c, align 4, !dbg !67
  %rem = srem i32 %15, 256, !dbg !68
  %conv11 = trunc i32 %rem to i8, !dbg !67
  %16 = load i8*, i8** %out.addr, align 8, !dbg !69
  %17 = load i32, i32* %j, align 4, !dbg !70
  %idxprom12 = sext i32 %17 to i64, !dbg !69
  %arrayidx13 = getelementptr inbounds i8, i8* %16, i64 %idxprom12, !dbg !69
  store i8 %conv11, i8* %arrayidx13, align 1, !dbg !71
  %18 = load i32, i32* %c, align 4, !dbg !72
  %div = sdiv i32 %18, 256, !dbg !72
  store i32 %div, i32* %c, align 4, !dbg !72
  br label %for.cond5, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond5
  %19 = load i32, i32* %c, align 4, !dbg !76
  %tobool14 = icmp ne i32 %19, 0, !dbg !76
  br i1 %tobool14, label %if.then15, label %if.end16, !dbg !78

if.then15:                                        ; preds = %for.end
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i8** @coin_err, align 8, !dbg !79
  store i32 0, i32* %retval, align 4, !dbg !79
  br label %return, !dbg !79

if.end16:                                         ; preds = %for.end
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %if.end16
  %20 = load i32, i32* %i, align 4, !dbg !82
  %inc = add nsw i32 %20, 1, !dbg !82
  store i32 %inc, i32* %i, align 4, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end17:                                        ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !86
  br label %return, !dbg !86

return:                                           ; preds = %for.end17, %if.then15, %if.then
  %21 = load i32, i32* %retval, align 4, !dbg !87
  ret i32 %21, !dbg !87
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly
declare dso_local i8* @strchr(i8*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @valid(i8* %s) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 8
  %dec = alloca [32 x i8], align 16
  %d1 = alloca [32 x i8], align 16
  %d2 = alloca [32 x i8], align 16
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [32 x i8]* %dec, metadata !93, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [32 x i8]* %d1, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [32 x i8]* %d2, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i64 0, i64 0), i8** @coin_err, align 8, !dbg !102
  %0 = load i8*, i8** %s.addr, align 8, !dbg !103
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %dec, i64 0, i64 0, !dbg !105
  %call = call i32 @unbase58(i8* %0, i8* %arraydecay), !dbg !106
  %tobool = icmp ne i32 %call, 0, !dbg !106
  br i1 %tobool, label %if.end, label %if.then, !dbg !107

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !108
  br label %return, !dbg !108

if.end:                                           ; preds = %entry
  %arraydecay1 = getelementptr inbounds [32 x i8], [32 x i8]* %dec, i64 0, i64 0, !dbg !109
  %arraydecay2 = getelementptr inbounds [32 x i8], [32 x i8]* %d1, i64 0, i64 0, !dbg !110
  %call3 = call i8* @SHA256(i8* %arraydecay1, i64 21, i8* %arraydecay2), !dbg !111
  %arraydecay4 = getelementptr inbounds [32 x i8], [32 x i8]* %d2, i64 0, i64 0, !dbg !112
  %call5 = call i8* @SHA256(i8* %call3, i64 32, i8* %arraydecay4), !dbg !113
  %arraydecay6 = getelementptr inbounds [32 x i8], [32 x i8]* %dec, i64 0, i64 0, !dbg !114
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay6, i64 21, !dbg !116
  %arraydecay7 = getelementptr inbounds [32 x i8], [32 x i8]* %d2, i64 0, i64 0, !dbg !117
  %call8 = call i32 @memcmp(i8* %add.ptr, i8* %arraydecay7, i64 4) #5, !dbg !118
  %tobool9 = icmp ne i32 %call8, 0, !dbg !118
  br i1 %tobool9, label %if.then10, label %if.end11, !dbg !119

if.then10:                                        ; preds = %if.end
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i8** @coin_err, align 8, !dbg !120
  store i32 0, i32* %retval, align 4, !dbg !120
  br label %return, !dbg !120

if.end11:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !122
  br label %return, !dbg !122

return:                                           ; preds = %if.end11, %if.then10, %if.then
  %1 = load i32, i32* %retval, align 4, !dbg !123
  ret i32 %1, !dbg !123
}

declare dso_local i8* @SHA256(i8*, i64, i8*) #4

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !124 {
entry:
  %retval = alloca i32, align 4
  %s = alloca [5 x i8*], align 16
  %i = alloca i32, align 4
  %status = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i8*]* %s, metadata !127, metadata !DIExpression()), !dbg !131
  %0 = bitcast [5 x i8*]* %s to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !131
  %1 = bitcast i8* %0 to [5 x i8*]*, !dbg !131
  %2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 0, !dbg !131
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i32 0, i32 0), i8** %2, align 16, !dbg !131
  %3 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 1, !dbg !131
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.6, i32 0, i32 0), i8** %3, align 8, !dbg !131
  %4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 2, !dbg !131
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7, i32 0, i32 0), i8** %4, align 16, !dbg !131
  %5 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 3, !dbg !131
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8, i32 0, i32 0), i8** %5, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i32* %i, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 0, i32* %i, align 4, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %i, align 4, !dbg !137
  %idxprom = sext i32 %6 to i64, !dbg !139
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* %s, i64 0, i64 %idxprom, !dbg !139
  %7 = load i8*, i8** %arrayidx, align 8, !dbg !139
  %tobool = icmp ne i8* %7, null, !dbg !140
  br i1 %tobool, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %status, metadata !141, metadata !DIExpression()), !dbg !143
  %8 = load i32, i32* %i, align 4, !dbg !144
  %idxprom1 = sext i32 %8 to i64, !dbg !145
  %arrayidx2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %s, i64 0, i64 %idxprom1, !dbg !145
  %9 = load i8*, i8** %arrayidx2, align 8, !dbg !145
  %call = call i32 @valid(i8* %9), !dbg !146
  store i32 %call, i32* %status, align 4, !dbg !143
  %10 = load i32, i32* %i, align 4, !dbg !147
  %idxprom3 = sext i32 %10 to i64, !dbg !148
  %arrayidx4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %s, i64 0, i64 %idxprom3, !dbg !148
  %11 = load i8*, i8** %arrayidx4, align 8, !dbg !148
  %12 = load i32, i32* %status, align 4, !dbg !149
  %tobool5 = icmp ne i32 %12, 0, !dbg !149
  br i1 %tobool5, label %cond.true, label %cond.false, !dbg !149

cond.true:                                        ; preds = %for.body
  br label %cond.end, !dbg !149

cond.false:                                       ; preds = %for.body
  %13 = load i8*, i8** @coin_err, align 8, !dbg !150
  br label %cond.end, !dbg !149

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0), %cond.true ], [ %13, %cond.false ], !dbg !149
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* %11, i8* %cond), !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %cond.end
  %14 = load i32, i32* %i, align 4, !dbg !153
  %inc = add nsw i32 %14, 1, !dbg !153
  store i32 %inc, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !157
}

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "tmpl", scope: !2, file: !3, line: 9, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "unbase58", scope: !3, file: !3, line: 8, type: !4, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !13)
!3 = !DIFile(filename: "bitcoin-address-validation.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Bitcoin-address-validation")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7, !10}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, globals: !14, splitDebugInlining: false, nameTableKind: None)
!13 = !{}
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "coin_err", scope: !12, file: !3, line: 5, type: !7, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!21 = !DILocalVariable(name: "s", arg: 1, scope: !2, file: !3, line: 8, type: !7)
!22 = !DILocation(line: 8, column: 26, scope: !2)
!23 = !DILocalVariable(name: "out", arg: 2, scope: !2, file: !3, line: 8, type: !10)
!24 = !DILocation(line: 8, column: 44, scope: !2)
!25 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 12, type: !6)
!26 = !DILocation(line: 12, column: 6, scope: !2)
!27 = !DILocalVariable(name: "j", scope: !2, file: !3, line: 12, type: !6)
!28 = !DILocation(line: 12, column: 9, scope: !2)
!29 = !DILocalVariable(name: "c", scope: !2, file: !3, line: 12, type: !6)
!30 = !DILocation(line: 12, column: 12, scope: !2)
!31 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 13, type: !7)
!32 = !DILocation(line: 13, column: 14, scope: !2)
!33 = !DILocation(line: 15, column: 9, scope: !2)
!34 = !DILocation(line: 15, column: 2, scope: !2)
!35 = !DILocation(line: 16, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !2, file: !3, line: 16, column: 2)
!37 = !DILocation(line: 16, column: 7, scope: !36)
!38 = !DILocation(line: 16, column: 14, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !3, line: 16, column: 2)
!40 = !DILocation(line: 16, column: 16, scope: !39)
!41 = !DILocation(line: 16, column: 2, scope: !36)
!42 = !DILocation(line: 17, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !44, file: !3, line: 17, column: 7)
!44 = distinct !DILexicalBlock(scope: !39, file: !3, line: 16, column: 25)
!45 = !DILocation(line: 17, column: 26, scope: !43)
!46 = !DILocation(line: 17, column: 28, scope: !43)
!47 = !DILocation(line: 17, column: 13, scope: !43)
!48 = !DILocation(line: 17, column: 11, scope: !43)
!49 = !DILocation(line: 17, column: 7, scope: !44)
!50 = !DILocation(line: 18, column: 4, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !3, line: 18, column: 4)
!52 = !DILocation(line: 20, column: 7, scope: !44)
!53 = !DILocation(line: 20, column: 11, scope: !44)
!54 = !DILocation(line: 20, column: 9, scope: !44)
!55 = !DILocation(line: 20, column: 5, scope: !44)
!56 = !DILocation(line: 21, column: 10, scope: !57)
!57 = distinct !DILexicalBlock(scope: !44, file: !3, line: 21, column: 3)
!58 = !DILocation(line: 21, column: 8, scope: !57)
!59 = !DILocation(line: 21, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !3, line: 21, column: 3)
!61 = !DILocation(line: 21, column: 3, scope: !57)
!62 = !DILocation(line: 22, column: 14, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !3, line: 21, column: 23)
!64 = !DILocation(line: 22, column: 18, scope: !63)
!65 = !DILocation(line: 22, column: 12, scope: !63)
!66 = !DILocation(line: 22, column: 6, scope: !63)
!67 = !DILocation(line: 23, column: 13, scope: !63)
!68 = !DILocation(line: 23, column: 15, scope: !63)
!69 = !DILocation(line: 23, column: 4, scope: !63)
!70 = !DILocation(line: 23, column: 8, scope: !63)
!71 = !DILocation(line: 23, column: 11, scope: !63)
!72 = !DILocation(line: 24, column: 6, scope: !63)
!73 = !DILocation(line: 21, column: 3, scope: !60)
!74 = distinct !{!74, !61, !75}
!75 = !DILocation(line: 25, column: 3, scope: !57)
!76 = !DILocation(line: 27, column: 7, scope: !77)
!77 = distinct !DILexicalBlock(scope: !44, file: !3, line: 27, column: 7)
!78 = !DILocation(line: 27, column: 7, scope: !44)
!79 = !DILocation(line: 27, column: 10, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !3, line: 27, column: 10)
!81 = !DILocation(line: 28, column: 2, scope: !44)
!82 = !DILocation(line: 16, column: 21, scope: !39)
!83 = !DILocation(line: 16, column: 2, scope: !39)
!84 = distinct !{!84, !41, !85}
!85 = !DILocation(line: 28, column: 2, scope: !36)
!86 = !DILocation(line: 30, column: 2, scope: !2)
!87 = !DILocation(line: 31, column: 1, scope: !2)
!88 = distinct !DISubprogram(name: "valid", scope: !3, file: !3, line: 33, type: !89, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !13)
!89 = !DISubroutineType(types: !90)
!90 = !{!6, !7}
!91 = !DILocalVariable(name: "s", arg: 1, scope: !88, file: !3, line: 33, type: !7)
!92 = !DILocation(line: 33, column: 23, scope: !88)
!93 = !DILocalVariable(name: "dec", scope: !88, file: !3, line: 34, type: !94)
!94 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 256, elements: !95)
!95 = !{!96}
!96 = !DISubrange(count: 32)
!97 = !DILocation(line: 34, column: 16, scope: !88)
!98 = !DILocalVariable(name: "d1", scope: !88, file: !3, line: 34, type: !94)
!99 = !DILocation(line: 34, column: 25, scope: !88)
!100 = !DILocalVariable(name: "d2", scope: !88, file: !3, line: 34, type: !94)
!101 = !DILocation(line: 34, column: 51, scope: !88)
!102 = !DILocation(line: 36, column: 11, scope: !88)
!103 = !DILocation(line: 37, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !88, file: !3, line: 37, column: 6)
!105 = !DILocation(line: 37, column: 19, scope: !104)
!106 = !DILocation(line: 37, column: 7, scope: !104)
!107 = !DILocation(line: 37, column: 6, scope: !88)
!108 = !DILocation(line: 37, column: 25, scope: !104)
!109 = !DILocation(line: 39, column: 16, scope: !88)
!110 = !DILocation(line: 39, column: 25, scope: !88)
!111 = !DILocation(line: 39, column: 9, scope: !88)
!112 = !DILocation(line: 39, column: 52, scope: !88)
!113 = !DILocation(line: 39, column: 2, scope: !88)
!114 = !DILocation(line: 41, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !88, file: !3, line: 41, column: 6)
!116 = !DILocation(line: 41, column: 17, scope: !115)
!117 = !DILocation(line: 41, column: 23, scope: !115)
!118 = !DILocation(line: 41, column: 6, scope: !115)
!119 = !DILocation(line: 41, column: 6, scope: !88)
!120 = !DILocation(line: 42, column: 3, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !3, line: 42, column: 3)
!122 = !DILocation(line: 44, column: 2, scope: !88)
!123 = !DILocation(line: 45, column: 1, scope: !88)
!124 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 47, type: !125, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !13)
!125 = !DISubroutineType(types: !126)
!126 = !{!6}
!127 = !DILocalVariable(name: "s", scope: !124, file: !3, line: 48, type: !128)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !129)
!129 = !{!130}
!130 = !DISubrange(count: 5)
!131 = !DILocation(line: 48, column: 14, scope: !124)
!132 = !DILocalVariable(name: "i", scope: !124, file: !3, line: 54, type: !6)
!133 = !DILocation(line: 54, column: 6, scope: !124)
!134 = !DILocation(line: 55, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !124, file: !3, line: 55, column: 2)
!136 = !DILocation(line: 55, column: 7, scope: !135)
!137 = !DILocation(line: 55, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !3, line: 55, column: 2)
!139 = !DILocation(line: 55, column: 14, scope: !138)
!140 = !DILocation(line: 55, column: 2, scope: !135)
!141 = !DILocalVariable(name: "status", scope: !142, file: !3, line: 56, type: !6)
!142 = distinct !DILexicalBlock(scope: !138, file: !3, line: 55, column: 25)
!143 = !DILocation(line: 56, column: 7, scope: !142)
!144 = !DILocation(line: 56, column: 24, scope: !142)
!145 = !DILocation(line: 56, column: 22, scope: !142)
!146 = !DILocation(line: 56, column: 16, scope: !142)
!147 = !DILocation(line: 57, column: 24, scope: !142)
!148 = !DILocation(line: 57, column: 22, scope: !142)
!149 = !DILocation(line: 57, column: 28, scope: !142)
!150 = !DILocation(line: 57, column: 44, scope: !142)
!151 = !DILocation(line: 57, column: 3, scope: !142)
!152 = !DILocation(line: 58, column: 2, scope: !142)
!153 = !DILocation(line: 55, column: 21, scope: !138)
!154 = !DILocation(line: 55, column: 2, scope: !138)
!155 = distinct !{!155, !140, !156}
!156 = !DILocation(line: 58, column: 2, scope: !135)
!157 = !DILocation(line: 60, column: 2, scope: !124)
