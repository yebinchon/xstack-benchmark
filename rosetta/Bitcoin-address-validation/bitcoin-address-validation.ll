; ModuleID = 'bitcoin-address-validation.c'
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
  br i1 %tobool3, label %if.end, label %if.then, !dbg !49, !cf.info !50

if.then:                                          ; preds = %for.body
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i8** @coin_err, align 8, !dbg !51
  store i32 0, i32* %retval, align 4, !dbg !51
  br label %return, !dbg !51

if.end:                                           ; preds = %for.body
  %8 = load i8*, i8** %p, align 8, !dbg !53
  %9 = load i8*, i8** @unbase58.tmpl, align 8, !dbg !54
  %sub.ptr.lhs.cast = ptrtoint i8* %8 to i64, !dbg !55
  %sub.ptr.rhs.cast = ptrtoint i8* %9 to i64, !dbg !55
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !55
  %conv4 = trunc i64 %sub.ptr.sub to i32, !dbg !53
  store i32 %conv4, i32* %c, align 4, !dbg !56
  store i32 25, i32* %j, align 4, !dbg !57
  br label %for.cond5, !dbg !59

for.cond5:                                        ; preds = %for.body7, %if.end
  %10 = load i32, i32* %j, align 4, !dbg !60
  %dec = add nsw i32 %10, -1, !dbg !60
  store i32 %dec, i32* %j, align 4, !dbg !60
  %tobool6 = icmp ne i32 %10, 0, !dbg !62
  br i1 %tobool6, label %for.body7, label %for.end, !dbg !62

for.body7:                                        ; preds = %for.cond5
  %11 = load i8*, i8** %out.addr, align 8, !dbg !63
  %12 = load i32, i32* %j, align 4, !dbg !65
  %idxprom8 = sext i32 %12 to i64, !dbg !63
  %arrayidx9 = getelementptr inbounds i8, i8* %11, i64 %idxprom8, !dbg !63
  %13 = load i8, i8* %arrayidx9, align 1, !dbg !63
  %conv10 = zext i8 %13 to i32, !dbg !63
  %mul = mul nsw i32 58, %conv10, !dbg !66
  %14 = load i32, i32* %c, align 4, !dbg !67
  %add = add nsw i32 %14, %mul, !dbg !67
  store i32 %add, i32* %c, align 4, !dbg !67
  %15 = load i32, i32* %c, align 4, !dbg !68
  %rem = srem i32 %15, 256, !dbg !69
  %conv11 = trunc i32 %rem to i8, !dbg !68
  %16 = load i8*, i8** %out.addr, align 8, !dbg !70
  %17 = load i32, i32* %j, align 4, !dbg !71
  %idxprom12 = sext i32 %17 to i64, !dbg !70
  %arrayidx13 = getelementptr inbounds i8, i8* %16, i64 %idxprom12, !dbg !70
  store i8 %conv11, i8* %arrayidx13, align 1, !dbg !72
  %18 = load i32, i32* %c, align 4, !dbg !73
  %div = sdiv i32 %18, 256, !dbg !73
  store i32 %div, i32* %c, align 4, !dbg !73
  br label %for.cond5, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond5
  %19 = load i32, i32* %c, align 4, !dbg !77
  %tobool14 = icmp ne i32 %19, 0, !dbg !77
  br i1 %tobool14, label %if.then15, label %if.end16, !dbg !79, !cf.info !50

if.then15:                                        ; preds = %for.end
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i8** @coin_err, align 8, !dbg !80
  store i32 0, i32* %retval, align 4, !dbg !80
  br label %return, !dbg !80

if.end16:                                         ; preds = %for.end
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %if.end16
  %20 = load i32, i32* %i, align 4, !dbg !83
  %inc = add nsw i32 %20, 1, !dbg !83
  store i32 %inc, i32* %i, align 4, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end17:                                        ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !87
  br label %return, !dbg !87

return:                                           ; preds = %for.end17, %if.then15, %if.then
  %21 = load i32, i32* %retval, align 4, !dbg !88
  ret i32 %21, !dbg !88
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly
declare dso_local i8* @strchr(i8*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @valid(i8* %s) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 8
  %dec = alloca [32 x i8], align 16
  %d1 = alloca [32 x i8], align 16
  %d2 = alloca [32 x i8], align 16
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [32 x i8]* %dec, metadata !94, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [32 x i8]* %d1, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [32 x i8]* %d2, metadata !101, metadata !DIExpression()), !dbg !102
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i64 0, i64 0), i8** @coin_err, align 8, !dbg !103
  %0 = load i8*, i8** %s.addr, align 8, !dbg !104
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %dec, i64 0, i64 0, !dbg !106
  %call = call i32 @unbase58(i8* %0, i8* %arraydecay), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.end, label %if.then, !dbg !108, !cf.info !50

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !109
  br label %return, !dbg !109

if.end:                                           ; preds = %entry
  %arraydecay1 = getelementptr inbounds [32 x i8], [32 x i8]* %dec, i64 0, i64 0, !dbg !110
  %arraydecay2 = getelementptr inbounds [32 x i8], [32 x i8]* %d1, i64 0, i64 0, !dbg !111
  %call3 = call i8* @SHA256(i8* %arraydecay1, i64 21, i8* %arraydecay2), !dbg !112
  %arraydecay4 = getelementptr inbounds [32 x i8], [32 x i8]* %d2, i64 0, i64 0, !dbg !113
  %call5 = call i8* @SHA256(i8* %call3, i64 32, i8* %arraydecay4), !dbg !114
  %arraydecay6 = getelementptr inbounds [32 x i8], [32 x i8]* %dec, i64 0, i64 0, !dbg !115
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay6, i64 21, !dbg !117
  %arraydecay7 = getelementptr inbounds [32 x i8], [32 x i8]* %d2, i64 0, i64 0, !dbg !118
  %call8 = call i32 @memcmp(i8* %add.ptr, i8* %arraydecay7, i64 4) #5, !dbg !119
  %tobool9 = icmp ne i32 %call8, 0, !dbg !119
  br i1 %tobool9, label %if.then10, label %if.end11, !dbg !120, !cf.info !50

if.then10:                                        ; preds = %if.end
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i8** @coin_err, align 8, !dbg !121
  store i32 0, i32* %retval, align 4, !dbg !121
  br label %return, !dbg !121

if.end11:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !123
  br label %return, !dbg !123

return:                                           ; preds = %if.end11, %if.then10, %if.then
  %1 = load i32, i32* %retval, align 4, !dbg !124
  ret i32 %1, !dbg !124
}

declare dso_local i8* @SHA256(i8*, i64, i8*) #4

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !125 {
entry:
  %retval = alloca i32, align 4
  %s = alloca [5 x i8*], align 16
  %i = alloca i32, align 4
  %status = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i8*]* %s, metadata !128, metadata !DIExpression()), !dbg !132
  %0 = bitcast [5 x i8*]* %s to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !132
  %1 = bitcast i8* %0 to [5 x i8*]*, !dbg !132
  %2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 0, !dbg !132
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i32 0, i32 0), i8** %2, align 16, !dbg !132
  %3 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 1, !dbg !132
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.6, i32 0, i32 0), i8** %3, align 8, !dbg !132
  %4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 2, !dbg !132
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7, i32 0, i32 0), i8** %4, align 16, !dbg !132
  %5 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 3, !dbg !132
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8, i32 0, i32 0), i8** %5, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i32* %i, metadata !133, metadata !DIExpression()), !dbg !134
  store i32 0, i32* %i, align 4, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %i, align 4, !dbg !138
  %idxprom = sext i32 %6 to i64, !dbg !140
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* %s, i64 0, i64 %idxprom, !dbg !140
  %7 = load i8*, i8** %arrayidx, align 8, !dbg !140
  %tobool = icmp ne i8* %7, null, !dbg !141
  br i1 %tobool, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %status, metadata !142, metadata !DIExpression()), !dbg !144
  %8 = load i32, i32* %i, align 4, !dbg !145
  %idxprom1 = sext i32 %8 to i64, !dbg !146
  %arrayidx2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %s, i64 0, i64 %idxprom1, !dbg !146
  %9 = load i8*, i8** %arrayidx2, align 8, !dbg !146
  %call = call i32 @valid(i8* %9), !dbg !147
  store i32 %call, i32* %status, align 4, !dbg !144
  %10 = load i32, i32* %i, align 4, !dbg !148
  %idxprom3 = sext i32 %10 to i64, !dbg !149
  %arrayidx4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %s, i64 0, i64 %idxprom3, !dbg !149
  %11 = load i8*, i8** %arrayidx4, align 8, !dbg !149
  %12 = load i32, i32* %status, align 4, !dbg !150
  %tobool5 = icmp ne i32 %12, 0, !dbg !150
  br i1 %tobool5, label %cond.true, label %cond.false, !dbg !150

cond.true:                                        ; preds = %for.body
  br label %cond.end, !dbg !150

cond.false:                                       ; preds = %for.body
  %13 = load i8*, i8** @coin_err, align 8, !dbg !151
  br label %cond.end, !dbg !150

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0), %cond.true ], [ %13, %cond.false ], !dbg !150
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* %11, i8* %cond), !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %cond.end
  %14 = load i32, i32* %i, align 4, !dbg !154
  %inc = add nsw i32 %14, 1, !dbg !154
  store i32 %inc, i32* %i, align 4, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !158
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
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, globals: !14, splitDebugInlining: false, nameTableKind: None)
!13 = !{}
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "coin_err", scope: !12, file: !3, line: 5, type: !7, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!50 = !{!"if"}
!51 = !DILocation(line: 18, column: 4, scope: !52)
!52 = distinct !DILexicalBlock(scope: !43, file: !3, line: 18, column: 4)
!53 = !DILocation(line: 20, column: 7, scope: !44)
!54 = !DILocation(line: 20, column: 11, scope: !44)
!55 = !DILocation(line: 20, column: 9, scope: !44)
!56 = !DILocation(line: 20, column: 5, scope: !44)
!57 = !DILocation(line: 21, column: 10, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !3, line: 21, column: 3)
!59 = !DILocation(line: 21, column: 8, scope: !58)
!60 = !DILocation(line: 21, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !3, line: 21, column: 3)
!62 = !DILocation(line: 21, column: 3, scope: !58)
!63 = !DILocation(line: 22, column: 14, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !3, line: 21, column: 23)
!65 = !DILocation(line: 22, column: 18, scope: !64)
!66 = !DILocation(line: 22, column: 12, scope: !64)
!67 = !DILocation(line: 22, column: 6, scope: !64)
!68 = !DILocation(line: 23, column: 13, scope: !64)
!69 = !DILocation(line: 23, column: 15, scope: !64)
!70 = !DILocation(line: 23, column: 4, scope: !64)
!71 = !DILocation(line: 23, column: 8, scope: !64)
!72 = !DILocation(line: 23, column: 11, scope: !64)
!73 = !DILocation(line: 24, column: 6, scope: !64)
!74 = !DILocation(line: 21, column: 3, scope: !61)
!75 = distinct !{!75, !62, !76}
!76 = !DILocation(line: 25, column: 3, scope: !58)
!77 = !DILocation(line: 27, column: 7, scope: !78)
!78 = distinct !DILexicalBlock(scope: !44, file: !3, line: 27, column: 7)
!79 = !DILocation(line: 27, column: 7, scope: !44)
!80 = !DILocation(line: 27, column: 10, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !3, line: 27, column: 10)
!82 = !DILocation(line: 28, column: 2, scope: !44)
!83 = !DILocation(line: 16, column: 21, scope: !39)
!84 = !DILocation(line: 16, column: 2, scope: !39)
!85 = distinct !{!85, !41, !86}
!86 = !DILocation(line: 28, column: 2, scope: !36)
!87 = !DILocation(line: 30, column: 2, scope: !2)
!88 = !DILocation(line: 31, column: 1, scope: !2)
!89 = distinct !DISubprogram(name: "valid", scope: !3, file: !3, line: 33, type: !90, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !13)
!90 = !DISubroutineType(types: !91)
!91 = !{!6, !7}
!92 = !DILocalVariable(name: "s", arg: 1, scope: !89, file: !3, line: 33, type: !7)
!93 = !DILocation(line: 33, column: 23, scope: !89)
!94 = !DILocalVariable(name: "dec", scope: !89, file: !3, line: 34, type: !95)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 256, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 32)
!98 = !DILocation(line: 34, column: 16, scope: !89)
!99 = !DILocalVariable(name: "d1", scope: !89, file: !3, line: 34, type: !95)
!100 = !DILocation(line: 34, column: 25, scope: !89)
!101 = !DILocalVariable(name: "d2", scope: !89, file: !3, line: 34, type: !95)
!102 = !DILocation(line: 34, column: 51, scope: !89)
!103 = !DILocation(line: 36, column: 11, scope: !89)
!104 = !DILocation(line: 37, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !89, file: !3, line: 37, column: 6)
!106 = !DILocation(line: 37, column: 19, scope: !105)
!107 = !DILocation(line: 37, column: 7, scope: !105)
!108 = !DILocation(line: 37, column: 6, scope: !89)
!109 = !DILocation(line: 37, column: 25, scope: !105)
!110 = !DILocation(line: 39, column: 16, scope: !89)
!111 = !DILocation(line: 39, column: 25, scope: !89)
!112 = !DILocation(line: 39, column: 9, scope: !89)
!113 = !DILocation(line: 39, column: 52, scope: !89)
!114 = !DILocation(line: 39, column: 2, scope: !89)
!115 = !DILocation(line: 41, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !89, file: !3, line: 41, column: 6)
!117 = !DILocation(line: 41, column: 17, scope: !116)
!118 = !DILocation(line: 41, column: 23, scope: !116)
!119 = !DILocation(line: 41, column: 6, scope: !116)
!120 = !DILocation(line: 41, column: 6, scope: !89)
!121 = !DILocation(line: 42, column: 3, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !3, line: 42, column: 3)
!123 = !DILocation(line: 44, column: 2, scope: !89)
!124 = !DILocation(line: 45, column: 1, scope: !89)
!125 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 47, type: !126, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !13)
!126 = !DISubroutineType(types: !127)
!127 = !{!6}
!128 = !DILocalVariable(name: "s", scope: !125, file: !3, line: 48, type: !129)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !130)
!130 = !{!131}
!131 = !DISubrange(count: 5)
!132 = !DILocation(line: 48, column: 14, scope: !125)
!133 = !DILocalVariable(name: "i", scope: !125, file: !3, line: 54, type: !6)
!134 = !DILocation(line: 54, column: 6, scope: !125)
!135 = !DILocation(line: 55, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !125, file: !3, line: 55, column: 2)
!137 = !DILocation(line: 55, column: 7, scope: !136)
!138 = !DILocation(line: 55, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !3, line: 55, column: 2)
!140 = !DILocation(line: 55, column: 14, scope: !139)
!141 = !DILocation(line: 55, column: 2, scope: !136)
!142 = !DILocalVariable(name: "status", scope: !143, file: !3, line: 56, type: !6)
!143 = distinct !DILexicalBlock(scope: !139, file: !3, line: 55, column: 25)
!144 = !DILocation(line: 56, column: 7, scope: !143)
!145 = !DILocation(line: 56, column: 24, scope: !143)
!146 = !DILocation(line: 56, column: 22, scope: !143)
!147 = !DILocation(line: 56, column: 16, scope: !143)
!148 = !DILocation(line: 57, column: 24, scope: !143)
!149 = !DILocation(line: 57, column: 22, scope: !143)
!150 = !DILocation(line: 57, column: 28, scope: !143)
!151 = !DILocation(line: 57, column: 44, scope: !143)
!152 = !DILocation(line: 57, column: 3, scope: !143)
!153 = !DILocation(line: 58, column: 2, scope: !143)
!154 = !DILocation(line: 55, column: 21, scope: !139)
!155 = !DILocation(line: 55, column: 2, scope: !139)
!156 = distinct !{!156, !141, !157}
!157 = !DILocation(line: 58, column: 2, scope: !136)
!158 = !DILocation(line: 60, column: 2, scope: !125)
