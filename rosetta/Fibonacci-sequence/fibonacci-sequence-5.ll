; ModuleID = 'fibonacci-sequence-5.c'
source_filename = "fibonacci-sequence-5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, [1 x %struct.__mpz_struct], %struct.node* }
%struct.__mpz_struct = type { i32, i32, i64* }

@cache = common dso_local global [37 x %struct.node*] zeroinitializer, align 16, !dbg !0
@tmp1 = common dso_local global [1 x %struct.__mpz_struct] zeroinitializer, align 16, !dbg !6
@tmp2 = common dso_local global [1 x %struct.__mpz_struct] zeroinitializer, align 16, !dbg !23
@.str = private unnamed_addr constant [15 x i8] c"bad input: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%Zd\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.node* @find_cache(i32 %n) #0 !dbg !39 {
entry:
  %retval = alloca %struct.node*, align 8
  %n.addr = alloca i32, align 4
  %idx = alloca i32, align 4
  %p = alloca %struct.node*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %idx, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32, i32* %n.addr, align 4, !dbg !46
  %rem = srem i32 %0, 37, !dbg !47
  store i32 %rem, i32* %idx, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata %struct.node** %p, metadata !48, metadata !DIExpression()), !dbg !49
  %1 = load i32, i32* %idx, align 4, !dbg !50
  %idxprom = sext i32 %1 to i64, !dbg !52
  %arrayidx = getelementptr inbounds [37 x %struct.node*], [37 x %struct.node*]* @cache, i64 0, i64 %idxprom, !dbg !52
  %2 = load %struct.node*, %struct.node** %arrayidx, align 8, !dbg !52
  store %struct.node* %2, %struct.node** %p, align 8, !dbg !53
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load %struct.node*, %struct.node** %p, align 8, !dbg !55
  %tobool = icmp ne %struct.node* %3, null, !dbg !55
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !57

land.rhs:                                         ; preds = %for.cond
  %4 = load %struct.node*, %struct.node** %p, align 8, !dbg !58
  %n1 = getelementptr inbounds %struct.node, %struct.node* %4, i32 0, i32 0, !dbg !59
  %5 = load i32, i32* %n1, align 8, !dbg !59
  %6 = load i32, i32* %n.addr, align 4, !dbg !60
  %cmp = icmp ne i32 %5, %6, !dbg !61
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %7 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !62
  br i1 %7, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %land.end
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load %struct.node*, %struct.node** %p, align 8, !dbg !64
  %next = getelementptr inbounds %struct.node, %struct.node* %8, i32 0, i32 2, !dbg !65
  %9 = load %struct.node*, %struct.node** %next, align 8, !dbg !65
  store %struct.node* %9, %struct.node** %p, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %land.end
  %10 = load %struct.node*, %struct.node** %p, align 8, !dbg !70
  %tobool2 = icmp ne %struct.node* %10, null, !dbg !70
  br i1 %tobool2, label %if.then, label %if.end, !dbg !72, !cf.info !73

if.then:                                          ; preds = %for.end
  %11 = load %struct.node*, %struct.node** %p, align 8, !dbg !74
  store %struct.node* %11, %struct.node** %retval, align 8, !dbg !75
  br label %return, !dbg !75

if.end:                                           ; preds = %for.end
  %call = call noalias i8* @malloc(i64 32) #5, !dbg !76
  %12 = bitcast i8* %call to %struct.node*, !dbg !76
  store %struct.node* %12, %struct.node** %p, align 8, !dbg !77
  %13 = load i32, i32* %idx, align 4, !dbg !78
  %idxprom3 = sext i32 %13 to i64, !dbg !79
  %arrayidx4 = getelementptr inbounds [37 x %struct.node*], [37 x %struct.node*]* @cache, i64 0, i64 %idxprom3, !dbg !79
  %14 = load %struct.node*, %struct.node** %arrayidx4, align 8, !dbg !79
  %15 = load %struct.node*, %struct.node** %p, align 8, !dbg !80
  %next5 = getelementptr inbounds %struct.node, %struct.node* %15, i32 0, i32 2, !dbg !81
  store %struct.node* %14, %struct.node** %next5, align 8, !dbg !82
  %16 = load %struct.node*, %struct.node** %p, align 8, !dbg !83
  %17 = load i32, i32* %idx, align 4, !dbg !84
  %idxprom6 = sext i32 %17 to i64, !dbg !85
  %arrayidx7 = getelementptr inbounds [37 x %struct.node*], [37 x %struct.node*]* @cache, i64 0, i64 %idxprom6, !dbg !85
  store %struct.node* %16, %struct.node** %arrayidx7, align 8, !dbg !86
  %18 = load i32, i32* %n.addr, align 4, !dbg !87
  %cmp8 = icmp slt i32 %18, 2, !dbg !89
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !90, !cf.info !73

if.then9:                                         ; preds = %if.end
  %19 = load i32, i32* %n.addr, align 4, !dbg !91
  %20 = load %struct.node*, %struct.node** %p, align 8, !dbg !93
  %n10 = getelementptr inbounds %struct.node, %struct.node* %20, i32 0, i32 0, !dbg !94
  store i32 %19, i32* %n10, align 8, !dbg !95
  %21 = load %struct.node*, %struct.node** %p, align 8, !dbg !96
  %v = getelementptr inbounds %struct.node, %struct.node* %21, i32 0, i32 1, !dbg !97
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %v, i64 0, i64 0, !dbg !96
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* %arraydecay, i64 1), !dbg !98
  br label %if.end14, !dbg !99

if.else:                                          ; preds = %if.end
  %22 = load %struct.node*, %struct.node** %p, align 8, !dbg !100
  %n11 = getelementptr inbounds %struct.node, %struct.node* %22, i32 0, i32 0, !dbg !102
  store i32 -1, i32* %n11, align 8, !dbg !103
  %23 = load %struct.node*, %struct.node** %p, align 8, !dbg !104
  %v12 = getelementptr inbounds %struct.node, %struct.node* %23, i32 0, i32 1, !dbg !105
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %v12, i64 0, i64 0, !dbg !104
  call void @__gmpz_init(%struct.__mpz_struct* %arraydecay13), !dbg !106
  br label %if.end14

if.end14:                                         ; preds = %if.else, %if.then9
  %24 = load %struct.node*, %struct.node** %p, align 8, !dbg !107
  store %struct.node* %24, %struct.node** %retval, align 8, !dbg !108
  br label %return, !dbg !108

return:                                           ; preds = %if.end14, %if.then
  %25 = load %struct.node*, %struct.node** %retval, align 8, !dbg !109
  ret %struct.node* %25, !dbg !109
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local void @__gmpz_init_set_ui(%struct.__mpz_struct*, i64) #3

declare dso_local void @__gmpz_init(%struct.__mpz_struct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local [1 x %struct.__mpz_struct]* @fib(i32 %n) #0 !dbg !110 {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca i32, align 4
  %p = alloca %struct.node*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %x, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata %struct.node** %p, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = load i32, i32* %n.addr, align 4, !dbg !120
  %call = call %struct.node* @find_cache(i32 %0), !dbg !121
  store %struct.node* %call, %struct.node** %p, align 8, !dbg !119
  %1 = load %struct.node*, %struct.node** %p, align 8, !dbg !122
  %n1 = getelementptr inbounds %struct.node, %struct.node* %1, i32 0, i32 0, !dbg !124
  %2 = load i32, i32* %n1, align 8, !dbg !124
  %cmp = icmp slt i32 %2, 0, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126, !cf.info !73

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %n.addr, align 4, !dbg !127
  %4 = load %struct.node*, %struct.node** %p, align 8, !dbg !129
  %n2 = getelementptr inbounds %struct.node, %struct.node* %4, i32 0, i32 0, !dbg !130
  store i32 %3, i32* %n2, align 8, !dbg !131
  %5 = load i32, i32* %n.addr, align 4, !dbg !132
  %div = sdiv i32 %5, 2, !dbg !133
  store i32 %div, i32* %x, align 4, !dbg !134
  %6 = load i32, i32* %x, align 4, !dbg !135
  %sub = sub nsw i32 %6, 1, !dbg !136
  %call3 = call [1 x %struct.__mpz_struct]* @fib(i32 %sub), !dbg !137
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %call3, i64 0, i64 0, !dbg !138
  %7 = load i32, i32* %n.addr, align 4, !dbg !139
  %8 = load i32, i32* %x, align 4, !dbg !140
  %sub4 = sub nsw i32 %7, %8, !dbg !141
  %sub5 = sub nsw i32 %sub4, 1, !dbg !142
  %call6 = call [1 x %struct.__mpz_struct]* @fib(i32 %sub5), !dbg !143
  %arraydecay7 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %call6, i64 0, i64 0, !dbg !144
  call void @__gmpz_mul(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp1, i64 0, i64 0), %struct.__mpz_struct* %arraydecay, %struct.__mpz_struct* %arraydecay7), !dbg !145
  %9 = load i32, i32* %x, align 4, !dbg !146
  %call8 = call [1 x %struct.__mpz_struct]* @fib(i32 %9), !dbg !147
  %arraydecay9 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %call8, i64 0, i64 0, !dbg !148
  %10 = load i32, i32* %n.addr, align 4, !dbg !149
  %11 = load i32, i32* %x, align 4, !dbg !150
  %sub10 = sub nsw i32 %10, %11, !dbg !151
  %call11 = call [1 x %struct.__mpz_struct]* @fib(i32 %sub10), !dbg !152
  %arraydecay12 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %call11, i64 0, i64 0, !dbg !153
  call void @__gmpz_mul(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp2, i64 0, i64 0), %struct.__mpz_struct* %arraydecay9, %struct.__mpz_struct* %arraydecay12), !dbg !154
  %12 = load %struct.node*, %struct.node** %p, align 8, !dbg !155
  %v = getelementptr inbounds %struct.node, %struct.node* %12, i32 0, i32 1, !dbg !156
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %v, i64 0, i64 0, !dbg !155
  call void @__gmpz_add(%struct.__mpz_struct* %arraydecay13, %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp1, i64 0, i64 0), %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp2, i64 0, i64 0)), !dbg !157
  br label %if.end, !dbg !158

if.end:                                           ; preds = %if.then, %entry
  %13 = load %struct.node*, %struct.node** %p, align 8, !dbg !159
  %v14 = getelementptr inbounds %struct.node, %struct.node* %13, i32 0, i32 1, !dbg !160
  ret [1 x %struct.__mpz_struct]* %v14, !dbg !161
}

declare dso_local void @__gmpz_mul(%struct.__mpz_struct*, %struct.__mpz_struct*, %struct.__mpz_struct*) #3

declare dso_local void @__gmpz_add(%struct.__mpz_struct*, %struct.__mpz_struct*, %struct.__mpz_struct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !162 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !168, metadata !DIExpression()), !dbg !169
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !170, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata i32* %i, metadata !172, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata i32* %n, metadata !174, metadata !DIExpression()), !dbg !175
  %0 = load i32, i32* %argc.addr, align 4, !dbg !176
  %cmp = icmp slt i32 %0, 2, !dbg !178
  br i1 %cmp, label %if.then, label %if.end, !dbg !179, !cf.info !73

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !180
  br label %return, !dbg !180

if.end:                                           ; preds = %entry
  call void @__gmpz_init(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp1, i64 0, i64 0)), !dbg !181
  call void @__gmpz_init(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp2, i64 0, i64 0)), !dbg !182
  store i32 1, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !186
  %2 = load i32, i32* %argc.addr, align 4, !dbg !188
  %cmp1 = icmp slt i32 %1, %2, !dbg !189
  br i1 %cmp1, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !191
  %4 = load i32, i32* %i, align 4, !dbg !193
  %idxprom = sext i32 %4 to i64, !dbg !191
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 %idxprom, !dbg !191
  %5 = load i8*, i8** %arrayidx, align 8, !dbg !191
  %call = call i32 @atoi(i8* %5) #6, !dbg !194
  store i32 %call, i32* %n, align 4, !dbg !195
  %6 = load i32, i32* %n, align 4, !dbg !196
  %cmp2 = icmp slt i32 %6, 0, !dbg !198
  br i1 %cmp2, label %if.then3, label %if.end7, !dbg !199, !cf.info !73

if.then3:                                         ; preds = %for.body
  %7 = load i8**, i8*** %argv.addr, align 8, !dbg !200
  %8 = load i32, i32* %i, align 4, !dbg !202
  %idxprom4 = sext i32 %8 to i64, !dbg !200
  %arrayidx5 = getelementptr inbounds i8*, i8** %7, i64 %idxprom4, !dbg !200
  %9 = load i8*, i8** %arrayidx5, align 8, !dbg !200
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i8* %9), !dbg !203
  br label %for.inc, !dbg !204

if.end7:                                          ; preds = %for.body
  %10 = load i32, i32* %n, align 4, !dbg !205
  %call8 = call [1 x %struct.__mpz_struct]* @fib(i32 %10), !dbg !206
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %call8, i64 0, i64 0, !dbg !207
  %call9 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), %struct.__mpz_struct* %arraydecay), !dbg !208
  br label %for.inc, !dbg !209

for.inc:                                          ; preds = %if.end7, %if.then3
  %11 = load i32, i32* %i, align 4, !dbg !210
  %inc = add nsw i32 %11, 1, !dbg !210
  store i32 %inc, i32* %i, align 4, !dbg !210
  br label %for.cond, !dbg !211, !llvm.loop !212

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4, !dbg !214
  br label %return, !dbg !214

return:                                           ; preds = %for.end, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !215
  ret i32 %12, !dbg !215
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #4

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @__gmp_printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!35, !36, !37}
!llvm.ident = !{!38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "cache", scope: !2, file: !3, line: 13, type: !25, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "fibonacci-sequence-5.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Fibonacci-sequence")
!4 = !{}
!5 = !{!0, !6, !23}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "tmp1", scope: !2, file: !3, line: 38, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !9, line: 164, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/gmp.h", directory: "")
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, elements: !21)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpz_struct", file: !9, line: 158, baseType: !12)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 150, size: 128, elements: !13)
!13 = !{!14, !16, !17}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_alloc", scope: !12, file: !9, line: 152, baseType: !15, size: 32)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_size", scope: !12, file: !9, line: 154, baseType: !15, size: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_d", scope: !12, file: !9, line: 157, baseType: !18, size: 64, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_limb_t", file: !9, line: 141, baseType: !20)
!20 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!21 = !{!22}
!22 = !DISubrange(count: 1)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "tmp2", scope: !2, file: !3, line: 38, type: !8, isLocal: false, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 2368, elements: !33)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "node", file: !3, line: 5, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "node", file: !3, line: 6, size: 256, elements: !29)
!29 = !{!30, !31, !32}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !28, file: !3, line: 7, baseType: !15, size: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !28, file: !3, line: 8, baseType: !8, size: 128, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !28, file: !3, line: 9, baseType: !26, size: 64, offset: 192)
!33 = !{!34}
!34 = !DISubrange(count: 37)
!35 = !{i32 7, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{i32 1, !"wchar_size", i32 4}
!38 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!39 = distinct !DISubprogram(name: "find_cache", scope: !3, file: !3, line: 16, type: !40, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!26, !15}
!42 = !DILocalVariable(name: "n", arg: 1, scope: !39, file: !3, line: 16, type: !15)
!43 = !DILocation(line: 16, column: 23, scope: !39)
!44 = !DILocalVariable(name: "idx", scope: !39, file: !3, line: 18, type: !15)
!45 = !DILocation(line: 18, column: 6, scope: !39)
!46 = !DILocation(line: 18, column: 12, scope: !39)
!47 = !DILocation(line: 18, column: 14, scope: !39)
!48 = !DILocalVariable(name: "p", scope: !39, file: !3, line: 19, type: !26)
!49 = !DILocation(line: 19, column: 8, scope: !39)
!50 = !DILocation(line: 21, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !39, file: !3, line: 21, column: 2)
!52 = !DILocation(line: 21, column: 11, scope: !51)
!53 = !DILocation(line: 21, column: 9, scope: !51)
!54 = !DILocation(line: 21, column: 7, scope: !51)
!55 = !DILocation(line: 21, column: 23, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !3, line: 21, column: 2)
!57 = !DILocation(line: 21, column: 25, scope: !56)
!58 = !DILocation(line: 21, column: 28, scope: !56)
!59 = !DILocation(line: 21, column: 31, scope: !56)
!60 = !DILocation(line: 21, column: 36, scope: !56)
!61 = !DILocation(line: 21, column: 33, scope: !56)
!62 = !DILocation(line: 0, scope: !56)
!63 = !DILocation(line: 21, column: 2, scope: !51)
!64 = !DILocation(line: 21, column: 43, scope: !56)
!65 = !DILocation(line: 21, column: 46, scope: !56)
!66 = !DILocation(line: 21, column: 41, scope: !56)
!67 = !DILocation(line: 21, column: 2, scope: !56)
!68 = distinct !{!68, !63, !69}
!69 = !DILocation(line: 21, column: 51, scope: !51)
!70 = !DILocation(line: 22, column: 6, scope: !71)
!71 = distinct !DILexicalBlock(scope: !39, file: !3, line: 22, column: 6)
!72 = !DILocation(line: 22, column: 6, scope: !39)
!73 = !{!"if"}
!74 = !DILocation(line: 22, column: 16, scope: !71)
!75 = !DILocation(line: 22, column: 9, scope: !71)
!76 = !DILocation(line: 24, column: 6, scope: !39)
!77 = !DILocation(line: 24, column: 4, scope: !39)
!78 = !DILocation(line: 25, column: 18, scope: !39)
!79 = !DILocation(line: 25, column: 12, scope: !39)
!80 = !DILocation(line: 25, column: 2, scope: !39)
!81 = !DILocation(line: 25, column: 5, scope: !39)
!82 = !DILocation(line: 25, column: 10, scope: !39)
!83 = !DILocation(line: 26, column: 15, scope: !39)
!84 = !DILocation(line: 26, column: 8, scope: !39)
!85 = !DILocation(line: 26, column: 2, scope: !39)
!86 = !DILocation(line: 26, column: 13, scope: !39)
!87 = !DILocation(line: 28, column: 6, scope: !88)
!88 = distinct !DILexicalBlock(scope: !39, file: !3, line: 28, column: 6)
!89 = !DILocation(line: 28, column: 8, scope: !88)
!90 = !DILocation(line: 28, column: 6, scope: !39)
!91 = !DILocation(line: 29, column: 10, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 28, column: 13)
!93 = !DILocation(line: 29, column: 3, scope: !92)
!94 = !DILocation(line: 29, column: 6, scope: !92)
!95 = !DILocation(line: 29, column: 8, scope: !92)
!96 = !DILocation(line: 30, column: 19, scope: !92)
!97 = !DILocation(line: 30, column: 22, scope: !92)
!98 = !DILocation(line: 30, column: 3, scope: !92)
!99 = !DILocation(line: 31, column: 2, scope: !92)
!100 = !DILocation(line: 32, column: 3, scope: !101)
!101 = distinct !DILexicalBlock(scope: !88, file: !3, line: 31, column: 9)
!102 = !DILocation(line: 32, column: 6, scope: !101)
!103 = !DILocation(line: 32, column: 8, scope: !101)
!104 = !DILocation(line: 33, column: 12, scope: !101)
!105 = !DILocation(line: 33, column: 15, scope: !101)
!106 = !DILocation(line: 33, column: 3, scope: !101)
!107 = !DILocation(line: 35, column: 9, scope: !39)
!108 = !DILocation(line: 35, column: 2, scope: !39)
!109 = !DILocation(line: 36, column: 1, scope: !39)
!110 = distinct !DISubprogram(name: "fib", scope: !3, file: !3, line: 39, type: !111, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DISubroutineType(types: !112)
!112 = !{!113, !15}
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!114 = !DILocalVariable(name: "n", arg: 1, scope: !110, file: !3, line: 39, type: !15)
!115 = !DILocation(line: 39, column: 16, scope: !110)
!116 = !DILocalVariable(name: "x", scope: !110, file: !3, line: 41, type: !15)
!117 = !DILocation(line: 41, column: 6, scope: !110)
!118 = !DILocalVariable(name: "p", scope: !110, file: !3, line: 42, type: !26)
!119 = !DILocation(line: 42, column: 8, scope: !110)
!120 = !DILocation(line: 42, column: 23, scope: !110)
!121 = !DILocation(line: 42, column: 12, scope: !110)
!122 = !DILocation(line: 44, column: 6, scope: !123)
!123 = distinct !DILexicalBlock(scope: !110, file: !3, line: 44, column: 6)
!124 = !DILocation(line: 44, column: 9, scope: !123)
!125 = !DILocation(line: 44, column: 11, scope: !123)
!126 = !DILocation(line: 44, column: 6, scope: !110)
!127 = !DILocation(line: 45, column: 10, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !3, line: 44, column: 16)
!129 = !DILocation(line: 45, column: 3, scope: !128)
!130 = !DILocation(line: 45, column: 6, scope: !128)
!131 = !DILocation(line: 45, column: 8, scope: !128)
!132 = !DILocation(line: 46, column: 7, scope: !128)
!133 = !DILocation(line: 46, column: 9, scope: !128)
!134 = !DILocation(line: 46, column: 5, scope: !128)
!135 = !DILocation(line: 48, column: 22, scope: !128)
!136 = !DILocation(line: 48, column: 23, scope: !128)
!137 = !DILocation(line: 48, column: 18, scope: !128)
!138 = !DILocation(line: 48, column: 17, scope: !128)
!139 = !DILocation(line: 48, column: 33, scope: !128)
!140 = !DILocation(line: 48, column: 37, scope: !128)
!141 = !DILocation(line: 48, column: 35, scope: !128)
!142 = !DILocation(line: 48, column: 39, scope: !128)
!143 = !DILocation(line: 48, column: 29, scope: !128)
!144 = !DILocation(line: 48, column: 28, scope: !128)
!145 = !DILocation(line: 48, column: 3, scope: !128)
!146 = !DILocation(line: 49, column: 22, scope: !128)
!147 = !DILocation(line: 49, column: 18, scope: !128)
!148 = !DILocation(line: 49, column: 17, scope: !128)
!149 = !DILocation(line: 49, column: 31, scope: !128)
!150 = !DILocation(line: 49, column: 35, scope: !128)
!151 = !DILocation(line: 49, column: 33, scope: !128)
!152 = !DILocation(line: 49, column: 27, scope: !128)
!153 = !DILocation(line: 49, column: 26, scope: !128)
!154 = !DILocation(line: 49, column: 3, scope: !128)
!155 = !DILocation(line: 50, column: 11, scope: !128)
!156 = !DILocation(line: 50, column: 14, scope: !128)
!157 = !DILocation(line: 50, column: 3, scope: !128)
!158 = !DILocation(line: 51, column: 2, scope: !128)
!159 = !DILocation(line: 52, column: 10, scope: !110)
!160 = !DILocation(line: 52, column: 13, scope: !110)
!161 = !DILocation(line: 52, column: 2, scope: !110)
!162 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 55, type: !163, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DISubroutineType(types: !164)
!164 = !{!15, !15, !165}
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!168 = !DILocalVariable(name: "argc", arg: 1, scope: !162, file: !3, line: 55, type: !15)
!169 = !DILocation(line: 55, column: 14, scope: !162)
!170 = !DILocalVariable(name: "argv", arg: 2, scope: !162, file: !3, line: 55, type: !165)
!171 = !DILocation(line: 55, column: 27, scope: !162)
!172 = !DILocalVariable(name: "i", scope: !162, file: !3, line: 57, type: !15)
!173 = !DILocation(line: 57, column: 6, scope: !162)
!174 = !DILocalVariable(name: "n", scope: !162, file: !3, line: 57, type: !15)
!175 = !DILocation(line: 57, column: 9, scope: !162)
!176 = !DILocation(line: 58, column: 6, scope: !177)
!177 = distinct !DILexicalBlock(scope: !162, file: !3, line: 58, column: 6)
!178 = !DILocation(line: 58, column: 11, scope: !177)
!179 = !DILocation(line: 58, column: 6, scope: !162)
!180 = !DILocation(line: 58, column: 16, scope: !177)
!181 = !DILocation(line: 60, column: 2, scope: !162)
!182 = !DILocation(line: 61, column: 2, scope: !162)
!183 = !DILocation(line: 63, column: 9, scope: !184)
!184 = distinct !DILexicalBlock(scope: !162, file: !3, line: 63, column: 2)
!185 = !DILocation(line: 63, column: 7, scope: !184)
!186 = !DILocation(line: 63, column: 14, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !3, line: 63, column: 2)
!188 = !DILocation(line: 63, column: 18, scope: !187)
!189 = !DILocation(line: 63, column: 16, scope: !187)
!190 = !DILocation(line: 63, column: 2, scope: !184)
!191 = !DILocation(line: 64, column: 12, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !3, line: 63, column: 29)
!193 = !DILocation(line: 64, column: 17, scope: !192)
!194 = !DILocation(line: 64, column: 7, scope: !192)
!195 = !DILocation(line: 64, column: 5, scope: !192)
!196 = !DILocation(line: 65, column: 7, scope: !197)
!197 = distinct !DILexicalBlock(scope: !192, file: !3, line: 65, column: 7)
!198 = !DILocation(line: 65, column: 9, scope: !197)
!199 = !DILocation(line: 65, column: 7, scope: !192)
!200 = !DILocation(line: 66, column: 30, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !3, line: 65, column: 14)
!202 = !DILocation(line: 66, column: 35, scope: !201)
!203 = !DILocation(line: 66, column: 4, scope: !201)
!204 = !DILocation(line: 67, column: 4, scope: !201)
!205 = !DILocation(line: 71, column: 28, scope: !192)
!206 = !DILocation(line: 71, column: 24, scope: !192)
!207 = !DILocation(line: 71, column: 23, scope: !192)
!208 = !DILocation(line: 71, column: 3, scope: !192)
!209 = !DILocation(line: 72, column: 2, scope: !192)
!210 = !DILocation(line: 63, column: 25, scope: !187)
!211 = !DILocation(line: 63, column: 2, scope: !187)
!212 = distinct !{!212, !190, !213}
!213 = !DILocation(line: 72, column: 2, scope: !184)
!214 = !DILocation(line: 73, column: 2, scope: !162)
!215 = !DILocation(line: 74, column: 1, scope: !162)
