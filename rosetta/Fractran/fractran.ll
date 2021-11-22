; ModuleID = 'fractran.c'
source_filename = "fractran.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.frac_s = type { i32, i32, %struct.frac_s* }
%struct.__mpz_struct = type { i32, i32, i64* }

@.str = private unnamed_addr constant [8 x i8] c"%d/%d%n\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"\0A[2^%d = %Zd]\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c" %Zd\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"\0Ahalt: %Zd has no divisors\0A\00", align 1
@.str.4 = private unnamed_addr constant [81 x i8] c"17/91 78/85 19/51 23/38 29/33 77/29 95/23 77/19 1/17 11/13 13/11 15/14 15/2 55/1\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.frac_s* @parse(i8* %s) #0 !dbg !7 {
entry:
  %s.addr = alloca i8*, align 8
  %offset = alloca i32, align 4
  %h = alloca %struct.frac_s, align 8
  %p = alloca %struct.frac_s*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 0, i32* %offset, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata %struct.frac_s* %h, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = bitcast %struct.frac_s* %h to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 16, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata %struct.frac_s** %p, metadata !26, metadata !DIExpression()), !dbg !27
  store %struct.frac_s* %h, %struct.frac_s** %p, align 8, !dbg !27
  br label %while.cond, !dbg !28

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i8*, i8** %s.addr, align 8, !dbg !29
  %n = getelementptr inbounds %struct.frac_s, %struct.frac_s* %h, i32 0, i32 0, !dbg !30
  %d = getelementptr inbounds %struct.frac_s, %struct.frac_s* %h, i32 0, i32 1, !dbg !31
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32* %n, i32* %d, i32* %offset) #6, !dbg !32
  %cmp = icmp eq i32 2, %call, !dbg !33
  br i1 %cmp, label %while.body, label %while.end, !dbg !28

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %offset, align 4, !dbg !34
  %3 = load i8*, i8** %s.addr, align 8, !dbg !36
  %idx.ext = sext i32 %2 to i64, !dbg !36
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 %idx.ext, !dbg !36
  store i8* %add.ptr, i8** %s.addr, align 8, !dbg !36
  %call1 = call noalias i8* @malloc(i64 16) #6, !dbg !37
  %4 = bitcast i8* %call1 to %struct.frac_s*, !dbg !37
  %5 = load %struct.frac_s*, %struct.frac_s** %p, align 8, !dbg !38
  %next = getelementptr inbounds %struct.frac_s, %struct.frac_s* %5, i32 0, i32 2, !dbg !39
  store %struct.frac_s* %4, %struct.frac_s** %next, align 8, !dbg !40
  store %struct.frac_s* %4, %struct.frac_s** %p, align 8, !dbg !41
  %6 = load %struct.frac_s*, %struct.frac_s** %p, align 8, !dbg !42
  %7 = bitcast %struct.frac_s* %6 to i8*, !dbg !43
  %8 = bitcast %struct.frac_s* %h to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 8 %8, i64 16, i1 false), !dbg !43
  %9 = load %struct.frac_s*, %struct.frac_s** %p, align 8, !dbg !44
  %next2 = getelementptr inbounds %struct.frac_s, %struct.frac_s* %9, i32 0, i32 2, !dbg !45
  store %struct.frac_s* null, %struct.frac_s** %next2, align 8, !dbg !46
  br label %while.cond, !dbg !28, !llvm.loop !47

while.end:                                        ; preds = %while.cond
  %next3 = getelementptr inbounds %struct.frac_s, %struct.frac_s* %h, i32 0, i32 2, !dbg !49
  %10 = load %struct.frac_s*, %struct.frac_s** %next3, align 8, !dbg !49
  ret %struct.frac_s* %10, !dbg !50
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @run(i32 %v, i8* %s) #0 !dbg !51 {
entry:
  %v.addr = alloca i32, align 4
  %s.addr = alloca i8*, align 8
  %n = alloca %struct.frac_s*, align 8
  %p = alloca %struct.frac_s*, align 8
  %val = alloca [1 x %struct.__mpz_struct], align 16
  store i32 %v, i32* %v.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %v.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata %struct.frac_s** %n, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata %struct.frac_s** %p, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i8*, i8** %s.addr, align 8, !dbg !62
  %call = call %struct.frac_s* @parse(i8* %0), !dbg !63
  store %struct.frac_s* %call, %struct.frac_s** %p, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpz_struct]* %val, metadata !64, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !80
  %1 = load i32, i32* %v.addr, align 4, !dbg !81
  %conv = sext i32 %1 to i64, !dbg !81
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* %arraydecay, i64 %conv), !dbg !82
  br label %loop, !dbg !82

loop:                                             ; preds = %if.end15, %entry
  call void @llvm.dbg.label(metadata !83), !dbg !84
  %2 = load %struct.frac_s*, %struct.frac_s** %p, align 8, !dbg !85
  store %struct.frac_s* %2, %struct.frac_s** %n, align 8, !dbg !86
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !87
  %call2 = call i64 @__gmpz_popcount(%struct.__mpz_struct* %arraydecay1) #7, !dbg !89
  %cmp = icmp eq i64 %call2, 1, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91, !cf.info !92

if.then:                                          ; preds = %loop
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !93
  %call5 = call i64 @__gmpz_scan1(%struct.__mpz_struct* %arraydecay4, i64 0) #7, !dbg !94
  %arraydecay6 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !95
  %call7 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i64 %call5, %struct.__mpz_struct* %arraydecay6), !dbg !96
  br label %if.end, !dbg !96

if.else:                                          ; preds = %loop
  %arraydecay8 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !97
  %call9 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), %struct.__mpz_struct* %arraydecay8), !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load %struct.frac_s*, %struct.frac_s** %p, align 8, !dbg !99
  store %struct.frac_s* %3, %struct.frac_s** %n, align 8, !dbg !101
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load %struct.frac_s*, %struct.frac_s** %n, align 8, !dbg !103
  %tobool = icmp ne %struct.frac_s* %4, null, !dbg !105
  br i1 %tobool, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %arraydecay10 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !106
  %5 = load %struct.frac_s*, %struct.frac_s** %n, align 8, !dbg !109
  %d = getelementptr inbounds %struct.frac_s, %struct.frac_s* %5, i32 0, i32 1, !dbg !110
  %6 = load i32, i32* %d, align 4, !dbg !110
  %conv11 = sext i32 %6 to i64, !dbg !109
  %call12 = call i32 @__gmpz_divisible_ui_p(%struct.__mpz_struct* %arraydecay10, i64 %conv11) #7, !dbg !111
  %tobool13 = icmp ne i32 %call12, 0, !dbg !111
  br i1 %tobool13, label %if.end15, label %if.then14, !dbg !112, !cf.info !92

if.then14:                                        ; preds = %for.body
  br label %for.inc, !dbg !113

if.end15:                                         ; preds = %for.body
  %arraydecay16 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !114
  %arraydecay17 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !115
  %7 = load %struct.frac_s*, %struct.frac_s** %n, align 8, !dbg !116
  %d18 = getelementptr inbounds %struct.frac_s, %struct.frac_s* %7, i32 0, i32 1, !dbg !117
  %8 = load i32, i32* %d18, align 4, !dbg !117
  %conv19 = sext i32 %8 to i64, !dbg !116
  call void @__gmpz_divexact_ui(%struct.__mpz_struct* %arraydecay16, %struct.__mpz_struct* %arraydecay17, i64 %conv19), !dbg !118
  %arraydecay20 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !119
  %arraydecay21 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !120
  %9 = load %struct.frac_s*, %struct.frac_s** %n, align 8, !dbg !121
  %n22 = getelementptr inbounds %struct.frac_s, %struct.frac_s* %9, i32 0, i32 0, !dbg !122
  %10 = load i32, i32* %n22, align 8, !dbg !122
  %conv23 = sext i32 %10 to i64, !dbg !121
  call void @__gmpz_mul_ui(%struct.__mpz_struct* %arraydecay20, %struct.__mpz_struct* %arraydecay21, i64 %conv23), !dbg !123
  br label %loop, !dbg !124

for.inc:                                          ; preds = %if.then14
  %11 = load %struct.frac_s*, %struct.frac_s** %n, align 8, !dbg !125
  %next = getelementptr inbounds %struct.frac_s, %struct.frac_s* %11, i32 0, i32 2, !dbg !126
  %12 = load %struct.frac_s*, %struct.frac_s** %next, align 8, !dbg !126
  store %struct.frac_s* %12, %struct.frac_s** %n, align 8, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %arraydecay24 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !131
  %call25 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i64 0, i64 0), %struct.__mpz_struct* %arraydecay24), !dbg !132
  %arraydecay26 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %val, i64 0, i64 0, !dbg !133
  call void @__gmpz_clear(%struct.__mpz_struct* %arraydecay26), !dbg !134
  br label %while.cond, !dbg !135

while.cond:                                       ; preds = %while.body, %for.end
  %13 = load %struct.frac_s*, %struct.frac_s** %p, align 8, !dbg !136
  %tobool27 = icmp ne %struct.frac_s* %13, null, !dbg !135
  br i1 %tobool27, label %while.body, label %while.end, !dbg !135

while.body:                                       ; preds = %while.cond
  %14 = load %struct.frac_s*, %struct.frac_s** %p, align 8, !dbg !137
  %next28 = getelementptr inbounds %struct.frac_s, %struct.frac_s* %14, i32 0, i32 2, !dbg !139
  %15 = load %struct.frac_s*, %struct.frac_s** %next28, align 8, !dbg !139
  store %struct.frac_s* %15, %struct.frac_s** %n, align 8, !dbg !140
  %16 = load %struct.frac_s*, %struct.frac_s** %p, align 8, !dbg !141
  %17 = bitcast %struct.frac_s* %16 to i8*, !dbg !141
  call void @free(i8* %17) #6, !dbg !142
  %18 = load %struct.frac_s*, %struct.frac_s** %n, align 8, !dbg !143
  store %struct.frac_s* %18, %struct.frac_s** %p, align 8, !dbg !144
  br label %while.cond, !dbg !135, !llvm.loop !145

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !147
}

declare dso_local void @__gmpz_init_set_ui(%struct.__mpz_struct*, i64) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @__gmpz_popcount(%struct.__mpz_struct*) #5

declare dso_local i32 @__gmp_printf(i8*, ...) #4

; Function Attrs: nounwind readonly
declare dso_local i64 @__gmpz_scan1(%struct.__mpz_struct*, i64) #5

; Function Attrs: nounwind readonly
declare dso_local i32 @__gmpz_divisible_ui_p(%struct.__mpz_struct*, i64) #5

declare dso_local void @__gmpz_divexact_ui(%struct.__mpz_struct*, %struct.__mpz_struct*, i64) #4

declare dso_local void @__gmpz_mul_ui(%struct.__mpz_struct*, %struct.__mpz_struct*, i64) #4

declare dso_local void @__gmpz_clear(%struct.__mpz_struct*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !148 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @run(i32 2, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.4, i64 0, i64 0)), !dbg !151
  ret i32 0, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "fractran.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Fractran")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "parse", scope: !1, file: !1, line: 11, type: !8, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !18}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac", file: !1, line: 5, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "frac_s", file: !1, line: 6, size: 128, elements: !13)
!13 = !{!14, !16, !17}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !12, file: !1, line: 7, baseType: !15, size: 32)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "d", scope: !12, file: !1, line: 7, baseType: !15, size: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !12, file: !1, line: 8, baseType: !10, size: 64, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !DILocalVariable(name: "s", arg: 1, scope: !7, file: !1, line: 11, type: !18)
!21 = !DILocation(line: 11, column: 18, scope: !7)
!22 = !DILocalVariable(name: "offset", scope: !7, file: !1, line: 13, type: !15)
!23 = !DILocation(line: 13, column: 6, scope: !7)
!24 = !DILocalVariable(name: "h", scope: !7, file: !1, line: 14, type: !12)
!25 = !DILocation(line: 14, column: 16, scope: !7)
!26 = !DILocalVariable(name: "p", scope: !7, file: !1, line: 14, type: !11)
!27 = !DILocation(line: 14, column: 26, scope: !7)
!28 = !DILocation(line: 16, column: 2, scope: !7)
!29 = !DILocation(line: 16, column: 21, scope: !7)
!30 = !DILocation(line: 16, column: 38, scope: !7)
!31 = !DILocation(line: 16, column: 44, scope: !7)
!32 = !DILocation(line: 16, column: 14, scope: !7)
!33 = !DILocation(line: 16, column: 11, scope: !7)
!34 = !DILocation(line: 17, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 57)
!36 = !DILocation(line: 17, column: 5, scope: !35)
!37 = !DILocation(line: 18, column: 17, scope: !35)
!38 = !DILocation(line: 18, column: 7, scope: !35)
!39 = !DILocation(line: 18, column: 10, scope: !35)
!40 = !DILocation(line: 18, column: 15, scope: !35)
!41 = !DILocation(line: 18, column: 5, scope: !35)
!42 = !DILocation(line: 19, column: 4, scope: !35)
!43 = !DILocation(line: 19, column: 8, scope: !35)
!44 = !DILocation(line: 20, column: 3, scope: !35)
!45 = !DILocation(line: 20, column: 6, scope: !35)
!46 = !DILocation(line: 20, column: 11, scope: !35)
!47 = distinct !{!47, !28, !48}
!48 = !DILocation(line: 21, column: 2, scope: !7)
!49 = !DILocation(line: 23, column: 11, scope: !7)
!50 = !DILocation(line: 23, column: 2, scope: !7)
!51 = distinct !DISubprogram(name: "run", scope: !1, file: !1, line: 26, type: !52, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!15, !15, !18}
!54 = !DILocalVariable(name: "v", arg: 1, scope: !51, file: !1, line: 26, type: !15)
!55 = !DILocation(line: 26, column: 13, scope: !51)
!56 = !DILocalVariable(name: "s", arg: 2, scope: !51, file: !1, line: 26, type: !18)
!57 = !DILocation(line: 26, column: 22, scope: !51)
!58 = !DILocalVariable(name: "n", scope: !51, file: !1, line: 28, type: !10)
!59 = !DILocation(line: 28, column: 7, scope: !51)
!60 = !DILocalVariable(name: "p", scope: !51, file: !1, line: 28, type: !10)
!61 = !DILocation(line: 28, column: 10, scope: !51)
!62 = !DILocation(line: 28, column: 20, scope: !51)
!63 = !DILocation(line: 28, column: 14, scope: !51)
!64 = !DILocalVariable(name: "val", scope: !51, file: !1, line: 29, type: !65)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !66, line: 164, baseType: !67)
!66 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/gmp.h", directory: "")
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 128, elements: !77)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpz_struct", file: !66, line: 158, baseType: !69)
!69 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !66, line: 150, size: 128, elements: !70)
!70 = !{!71, !72, !73}
!71 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_alloc", scope: !69, file: !66, line: 152, baseType: !15, size: 32)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_size", scope: !69, file: !66, line: 154, baseType: !15, size: 32, offset: 32)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_d", scope: !69, file: !66, line: 157, baseType: !74, size: 64, offset: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_limb_t", file: !66, line: 141, baseType: !76)
!76 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!77 = !{!78}
!78 = !DISubrange(count: 1)
!79 = !DILocation(line: 29, column: 8, scope: !51)
!80 = !DILocation(line: 30, column: 18, scope: !51)
!81 = !DILocation(line: 30, column: 23, scope: !51)
!82 = !DILocation(line: 30, column: 2, scope: !51)
!83 = !DILabel(scope: !51, name: "loop", file: !1, line: 32)
!84 = !DILocation(line: 32, column: 1, scope: !51)
!85 = !DILocation(line: 32, column: 11, scope: !51)
!86 = !DILocation(line: 32, column: 9, scope: !51)
!87 = !DILocation(line: 33, column: 19, scope: !88)
!88 = distinct !DILexicalBlock(scope: !51, file: !1, line: 33, column: 6)
!89 = !DILocation(line: 33, column: 6, scope: !88)
!90 = !DILocation(line: 33, column: 24, scope: !88)
!91 = !DILocation(line: 33, column: 6, scope: !51)
!92 = !{!"if"}
!93 = !DILocation(line: 34, column: 42, scope: !88)
!94 = !DILocation(line: 34, column: 32, scope: !88)
!95 = !DILocation(line: 34, column: 51, scope: !88)
!96 = !DILocation(line: 34, column: 3, scope: !88)
!97 = !DILocation(line: 36, column: 22, scope: !88)
!98 = !DILocation(line: 36, column: 3, scope: !88)
!99 = !DILocation(line: 38, column: 11, scope: !100)
!100 = distinct !DILexicalBlock(scope: !51, file: !1, line: 38, column: 2)
!101 = !DILocation(line: 38, column: 9, scope: !100)
!102 = !DILocation(line: 38, column: 7, scope: !100)
!103 = !DILocation(line: 38, column: 14, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 38, column: 2)
!105 = !DILocation(line: 38, column: 2, scope: !100)
!106 = !DILocation(line: 40, column: 27, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !1, line: 40, column: 7)
!108 = distinct !DILexicalBlock(scope: !104, file: !1, line: 38, column: 30)
!109 = !DILocation(line: 40, column: 32, scope: !107)
!110 = !DILocation(line: 40, column: 35, scope: !107)
!111 = !DILocation(line: 40, column: 8, scope: !107)
!112 = !DILocation(line: 40, column: 7, scope: !108)
!113 = !DILocation(line: 40, column: 39, scope: !107)
!114 = !DILocation(line: 42, column: 19, scope: !108)
!115 = !DILocation(line: 42, column: 24, scope: !108)
!116 = !DILocation(line: 42, column: 29, scope: !108)
!117 = !DILocation(line: 42, column: 32, scope: !108)
!118 = !DILocation(line: 42, column: 3, scope: !108)
!119 = !DILocation(line: 43, column: 14, scope: !108)
!120 = !DILocation(line: 43, column: 19, scope: !108)
!121 = !DILocation(line: 43, column: 24, scope: !108)
!122 = !DILocation(line: 43, column: 27, scope: !108)
!123 = !DILocation(line: 43, column: 3, scope: !108)
!124 = !DILocation(line: 44, column: 3, scope: !108)
!125 = !DILocation(line: 38, column: 21, scope: !104)
!126 = !DILocation(line: 38, column: 24, scope: !104)
!127 = !DILocation(line: 38, column: 19, scope: !104)
!128 = !DILocation(line: 38, column: 2, scope: !104)
!129 = distinct !{!129, !105, !130}
!130 = !DILocation(line: 45, column: 2, scope: !100)
!131 = !DILocation(line: 47, column: 46, scope: !51)
!132 = !DILocation(line: 47, column: 2, scope: !51)
!133 = !DILocation(line: 49, column: 12, scope: !51)
!134 = !DILocation(line: 49, column: 2, scope: !51)
!135 = !DILocation(line: 50, column: 2, scope: !51)
!136 = !DILocation(line: 50, column: 9, scope: !51)
!137 = !DILocation(line: 51, column: 7, scope: !138)
!138 = distinct !DILexicalBlock(scope: !51, file: !1, line: 50, column: 12)
!139 = !DILocation(line: 51, column: 10, scope: !138)
!140 = !DILocation(line: 51, column: 5, scope: !138)
!141 = !DILocation(line: 52, column: 8, scope: !138)
!142 = !DILocation(line: 52, column: 3, scope: !138)
!143 = !DILocation(line: 53, column: 7, scope: !138)
!144 = !DILocation(line: 53, column: 5, scope: !138)
!145 = distinct !{!145, !135, !146}
!146 = !DILocation(line: 54, column: 2, scope: !51)
!147 = !DILocation(line: 56, column: 2, scope: !51)
!148 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 59, type: !149, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DISubroutineType(types: !150)
!150 = !{!15}
!151 = !DILocation(line: 61, column: 2, scope: !148)
!152 = !DILocation(line: 64, column: 2, scope: !148)
