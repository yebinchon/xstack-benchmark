; ModuleID = 'sorting-algorithms-permutation-sort.ll'
source_filename = "sorting-algorithms-permutation-sort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"spqr\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"giant squid\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"stuff\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"def\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @perm_sort(i8* %a, i32 %n, i64 %msize, i32 (i8*, i8*)* %_cmp) #0 !dbg !15 {
entry:
  %a.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %msize.addr = alloca i64, align 8
  %_cmp.addr = alloca i32 (i8*, i8*)*, align 8
  %p = alloca i8*, align 8
  %q = alloca i8*, align 8
  %tmp = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !30, metadata !DIExpression()), !dbg !31
  store i64 %msize, i64* %msize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %msize.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store i32 (i8*, i8*)* %_cmp, i32 (i8*, i8*)** %_cmp.addr, align 8
  call void @llvm.dbg.declare(metadata i32 (i8*, i8*)** %_cmp.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i8** %p, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i8** %q, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i8** %tmp, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i64, i64* %msize.addr, align 8, !dbg !42
  %call = call noalias i8* @malloc(i64 %0) #6, !dbg !43
  store i8* %call, i8** %tmp, align 8, !dbg !41
  br label %while.body, !dbg !44

while.body:                                       ; preds = %for.end40, %entry
  %1 = load i8*, i8** %a.addr, align 8, !dbg !45
  %2 = load i64, i64* %msize.addr, align 8, !dbg !45
  %3 = load i32, i32* %n.addr, align 4, !dbg !45
  %sub = sub nsw i32 %3, 1, !dbg !45
  %conv = sext i32 %sub to i64, !dbg !45
  %mul = mul i64 %2, %conv, !dbg !45
  %add.ptr = getelementptr inbounds i8, i8* %1, i64 %mul, !dbg !45
  store i8* %add.ptr, i8** %p, align 8, !dbg !48
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %while.body
  %4 = load i8*, i8** %p, align 8, !dbg !50
  %5 = load i8*, i8** %a.addr, align 8, !dbg !52
  %cmp = icmp ugt i8* %4, %5, !dbg !53
  br i1 %cmp, label %for.body, label %for.end.loopexit, !dbg !54

for.body:                                         ; preds = %for.cond
  %6 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %_cmp.addr, align 8, !dbg !55
  %7 = load i8*, i8** %p, align 8, !dbg !57
  %8 = load i64, i64* %msize.addr, align 8, !dbg !58
  %idx.neg = sub i64 0, %8, !dbg !59
  %add.ptr2 = getelementptr inbounds i8, i8* %7, i64 %idx.neg, !dbg !59
  store i8* %add.ptr2, i8** %q, align 8, !dbg !60
  %9 = load i8*, i8** %p, align 8, !dbg !61
  %call3 = call i32 %6(i8* %add.ptr2, i8* %9), !dbg !55
  %cmp4 = icmp sgt i32 %call3, 0, !dbg !62
  br i1 %cmp4, label %if.then, label %if.end, !dbg !63

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !64

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %if.end
  %10 = load i8*, i8** %q, align 8, !dbg !66
  store i8* %10, i8** %p, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end, !dbg !71

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %11 = load i8*, i8** %p, align 8, !dbg !71
  %12 = load i8*, i8** %a.addr, align 8, !dbg !73
  %cmp6 = icmp ule i8* %11, %12, !dbg !74
  br i1 %cmp6, label %if.then8, label %if.end9, !dbg !75

if.then8:                                         ; preds = %for.end
  br label %while.end, !dbg !76

if.end9:                                          ; preds = %for.end
  %13 = load i8*, i8** %a.addr, align 8, !dbg !77
  %14 = load i64, i64* %msize.addr, align 8, !dbg !77
  %15 = load i32, i32* %n.addr, align 4, !dbg !77
  %sub10 = sub nsw i32 %15, 1, !dbg !77
  %conv11 = sext i32 %sub10 to i64, !dbg !77
  %mul12 = mul i64 %14, %conv11, !dbg !77
  %add.ptr13 = getelementptr inbounds i8, i8* %13, i64 %mul12, !dbg !77
  store i8* %add.ptr13, i8** %p, align 8, !dbg !79
  br label %for.cond14, !dbg !80

for.cond14:                                       ; preds = %for.inc23, %if.end9
  %16 = load i8*, i8** %p, align 8, !dbg !81
  %17 = load i8*, i8** %q, align 8, !dbg !83
  %cmp15 = icmp ugt i8* %16, %17, !dbg !84
  br i1 %cmp15, label %for.body17, label %for.end26.loopexit, !dbg !85

for.body17:                                       ; preds = %for.cond14
  %18 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %_cmp.addr, align 8, !dbg !86
  %19 = load i8*, i8** %q, align 8, !dbg !88
  %20 = load i8*, i8** %p, align 8, !dbg !89
  %call18 = call i32 %18(i8* %19, i8* %20), !dbg !86
  %cmp19 = icmp sgt i32 %call18, 0, !dbg !90
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !91

if.then21:                                        ; preds = %for.body17
  br label %for.end26, !dbg !92

if.end22:                                         ; preds = %for.body17
  br label %for.inc23, !dbg !93

for.inc23:                                        ; preds = %if.end22
  %21 = load i64, i64* %msize.addr, align 8, !dbg !94
  %22 = load i8*, i8** %p, align 8, !dbg !95
  %idx.neg24 = sub i64 0, %21, !dbg !95
  %add.ptr25 = getelementptr inbounds i8, i8* %22, i64 %idx.neg24, !dbg !95
  store i8* %add.ptr25, i8** %p, align 8, !dbg !95
  br label %for.cond14, !dbg !96, !llvm.loop !97

for.end26.loopexit:                               ; preds = %for.cond14
  br label %for.end26, !dbg !99

for.end26:                                        ; preds = %for.end26.loopexit, %if.then21
  %23 = load i8*, i8** %tmp, align 8, !dbg !99
  %24 = load i8*, i8** %p, align 8, !dbg !99
  %25 = load i64, i64* %msize.addr, align 8, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %23, i8* align 1 %24, i64 %25, i1 false), !dbg !99
  %26 = load i8*, i8** %p, align 8, !dbg !99
  %27 = load i8*, i8** %q, align 8, !dbg !99
  %28 = load i64, i64* %msize.addr, align 8, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %26, i8* align 1 %27, i64 %28, i1 false), !dbg !99
  %29 = load i8*, i8** %q, align 8, !dbg !99
  %30 = load i8*, i8** %tmp, align 8, !dbg !99
  %31 = load i64, i64* %msize.addr, align 8, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %29, i8* align 1 %30, i64 %31, i1 false), !dbg !99
  %32 = load i64, i64* %msize.addr, align 8, !dbg !101
  %33 = load i8*, i8** %q, align 8, !dbg !103
  %add.ptr27 = getelementptr inbounds i8, i8* %33, i64 %32, !dbg !103
  store i8* %add.ptr27, i8** %q, align 8, !dbg !103
  %34 = load i8*, i8** %a.addr, align 8, !dbg !104
  %35 = load i64, i64* %msize.addr, align 8, !dbg !104
  %36 = load i32, i32* %n.addr, align 4, !dbg !104
  %sub28 = sub nsw i32 %36, 1, !dbg !104
  %conv29 = sext i32 %sub28 to i64, !dbg !104
  %mul30 = mul i64 %35, %conv29, !dbg !104
  %add.ptr31 = getelementptr inbounds i8, i8* %34, i64 %mul30, !dbg !104
  store i8* %add.ptr31, i8** %p, align 8, !dbg !105
  br label %for.cond32, !dbg !106

for.cond32:                                       ; preds = %for.inc36, %for.end26
  %37 = load i8*, i8** %q, align 8, !dbg !107
  %38 = load i8*, i8** %p, align 8, !dbg !109
  %cmp33 = icmp ult i8* %37, %38, !dbg !110
  br i1 %cmp33, label %for.body35, label %for.end40, !dbg !111

for.body35:                                       ; preds = %for.cond32
  %39 = load i8*, i8** %tmp, align 8, !dbg !112
  %40 = load i8*, i8** %p, align 8, !dbg !112
  %41 = load i64, i64* %msize.addr, align 8, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %39, i8* align 1 %40, i64 %41, i1 false), !dbg !112
  %42 = load i8*, i8** %p, align 8, !dbg !112
  %43 = load i8*, i8** %q, align 8, !dbg !112
  %44 = load i64, i64* %msize.addr, align 8, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %42, i8* align 1 %43, i64 %44, i1 false), !dbg !112
  %45 = load i8*, i8** %q, align 8, !dbg !112
  %46 = load i8*, i8** %tmp, align 8, !dbg !112
  %47 = load i64, i64* %msize.addr, align 8, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %45, i8* align 1 %46, i64 %47, i1 false), !dbg !112
  br label %for.inc36, !dbg !112

for.inc36:                                        ; preds = %for.body35
  %48 = load i64, i64* %msize.addr, align 8, !dbg !114
  %49 = load i8*, i8** %q, align 8, !dbg !115
  %add.ptr37 = getelementptr inbounds i8, i8* %49, i64 %48, !dbg !115
  store i8* %add.ptr37, i8** %q, align 8, !dbg !115
  %50 = load i64, i64* %msize.addr, align 8, !dbg !116
  %51 = load i8*, i8** %p, align 8, !dbg !117
  %idx.neg38 = sub i64 0, %50, !dbg !117
  %add.ptr39 = getelementptr inbounds i8, i8* %51, i64 %idx.neg38, !dbg !117
  store i8* %add.ptr39, i8** %p, align 8, !dbg !117
  br label %for.cond32, !dbg !118, !llvm.loop !119

for.end40:                                        ; preds = %for.cond32
  br label %while.body, !dbg !44, !llvm.loop !121

while.end:                                        ; preds = %if.then8
  %52 = load i8*, i8** %tmp, align 8, !dbg !123
  call void @free(i8* %52) #6, !dbg !124
  ret void, !dbg !125
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @scmp(i8* %a, i8* %b) #0 !dbg !126 {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !127, metadata !DIExpression()), !dbg !128
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !129, metadata !DIExpression()), !dbg !130
  %0 = load i8*, i8** %a.addr, align 8, !dbg !131
  %1 = bitcast i8* %0 to i8**, !dbg !132
  %2 = load i8*, i8** %1, align 8, !dbg !133
  %3 = load i8*, i8** %b.addr, align 8, !dbg !134
  %4 = bitcast i8* %3 to i8**, !dbg !135
  %5 = load i8*, i8** %4, align 8, !dbg !136
  %call = call i32 @strcmp(i8* %2, i8* %5) #7, !dbg !137
  ret i32 %call, !dbg !138
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !139 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %strs = alloca [5 x i8*], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [5 x i8*]* %strs, metadata !144, metadata !DIExpression()), !dbg !148
  %0 = bitcast [5 x i8*]* %strs to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !148
  %1 = bitcast i8* %0 to [5 x i8*]*, !dbg !148
  %2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 0, !dbg !148
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8** %2, align 16, !dbg !148
  %3 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 1, !dbg !148
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8** %3, align 8, !dbg !148
  %4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 2, !dbg !148
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i8** %4, align 16, !dbg !148
  %5 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 3, !dbg !148
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8** %5, align 8, !dbg !148
  %6 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 4, !dbg !148
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8** %6, align 16, !dbg !148
  %arraydecay = getelementptr inbounds [5 x i8*], [5 x i8*]* %strs, i64 0, i64 0, !dbg !149
  %7 = bitcast i8** %arraydecay to i8*, !dbg !149
  call void @perm_sort(i8* %7, i32 5, i64 8, i32 (i8*, i8*)* @scmp), !dbg !150
  store i32 0, i32* %i, align 4, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %i, align 4, !dbg !154
  %cmp = icmp slt i32 %8, 5, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !158
  %idxprom = sext i32 %9 to i64, !dbg !159
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* %strs, i64 0, i64 %idxprom, !dbg !159
  %10 = load i8*, i8** %arrayidx, align 8, !dbg !159
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i8* %10), !dbg !160
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !161
  %inc = add nsw i32 %11, 1, !dbg !161
  store i32 %inc, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !165
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "sorting-algorithms-permutation-sort.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Sorting-algorithms-Permutation-sort")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!15 = distinct !DISubprogram(name: "perm_sort", scope: !1, file: !1, line: 7, type: !16, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{null, !6, !18, !19, !22}
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !20, line: 46, baseType: !21)
!20 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs-old/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!21 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "cmp_func", file: !1, line: 5, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{!18, !26, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!28 = !DILocalVariable(name: "a", arg: 1, scope: !15, file: !1, line: 7, type: !6)
!29 = !DILocation(line: 7, column: 22, scope: !15)
!30 = !DILocalVariable(name: "n", arg: 2, scope: !15, file: !1, line: 7, type: !18)
!31 = !DILocation(line: 7, column: 29, scope: !15)
!32 = !DILocalVariable(name: "msize", arg: 3, scope: !15, file: !1, line: 7, type: !19)
!33 = !DILocation(line: 7, column: 39, scope: !15)
!34 = !DILocalVariable(name: "_cmp", arg: 4, scope: !15, file: !1, line: 7, type: !22)
!35 = !DILocation(line: 7, column: 55, scope: !15)
!36 = !DILocalVariable(name: "p", scope: !15, file: !1, line: 9, type: !4)
!37 = !DILocation(line: 9, column: 8, scope: !15)
!38 = !DILocalVariable(name: "q", scope: !15, file: !1, line: 9, type: !4)
!39 = !DILocation(line: 9, column: 12, scope: !15)
!40 = !DILocalVariable(name: "tmp", scope: !15, file: !1, line: 9, type: !4)
!41 = !DILocation(line: 9, column: 16, scope: !15)
!42 = !DILocation(line: 9, column: 29, scope: !15)
!43 = !DILocation(line: 9, column: 22, scope: !15)
!44 = !DILocation(line: 15, column: 2, scope: !15)
!45 = !DILocation(line: 17, column: 12, scope: !46)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 17, column: 3)
!47 = distinct !DILexicalBlock(scope: !15, file: !1, line: 15, column: 12)
!48 = !DILocation(line: 17, column: 10, scope: !46)
!49 = !DILocation(line: 17, column: 8, scope: !46)
!50 = !DILocation(line: 17, column: 29, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !1, line: 17, column: 3)
!52 = !DILocation(line: 17, column: 33, scope: !51)
!53 = !DILocation(line: 17, column: 31, scope: !51)
!54 = !DILocation(line: 17, column: 3, scope: !46)
!55 = !DILocation(line: 18, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !1, line: 18, column: 8)
!57 = !DILocation(line: 18, column: 17, scope: !56)
!58 = !DILocation(line: 18, column: 21, scope: !56)
!59 = !DILocation(line: 18, column: 19, scope: !56)
!60 = !DILocation(line: 18, column: 15, scope: !56)
!61 = !DILocation(line: 18, column: 28, scope: !56)
!62 = !DILocation(line: 18, column: 31, scope: !56)
!63 = !DILocation(line: 18, column: 8, scope: !51)
!64 = !DILocation(line: 19, column: 5, scope: !56)
!65 = !DILocation(line: 18, column: 33, scope: !56)
!66 = !DILocation(line: 17, column: 40, scope: !51)
!67 = !DILocation(line: 17, column: 38, scope: !51)
!68 = !DILocation(line: 17, column: 3, scope: !51)
!69 = distinct !{!69, !54, !70}
!70 = !DILocation(line: 19, column: 5, scope: !46)
!71 = !DILocation(line: 21, column: 14, scope: !72)
!72 = distinct !DILexicalBlock(scope: !47, file: !1, line: 21, column: 7)
!73 = !DILocation(line: 21, column: 19, scope: !72)
!74 = !DILocation(line: 21, column: 16, scope: !72)
!75 = !DILocation(line: 21, column: 7, scope: !47)
!76 = !DILocation(line: 21, column: 22, scope: !72)
!77 = !DILocation(line: 24, column: 12, scope: !78)
!78 = distinct !DILexicalBlock(scope: !47, file: !1, line: 24, column: 3)
!79 = !DILocation(line: 24, column: 10, scope: !78)
!80 = !DILocation(line: 24, column: 8, scope: !78)
!81 = !DILocation(line: 24, column: 22, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !1, line: 24, column: 3)
!83 = !DILocation(line: 24, column: 26, scope: !82)
!84 = !DILocation(line: 24, column: 24, scope: !82)
!85 = !DILocation(line: 24, column: 3, scope: !78)
!86 = !DILocation(line: 25, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !1, line: 25, column: 8)
!88 = !DILocation(line: 25, column: 13, scope: !87)
!89 = !DILocation(line: 25, column: 16, scope: !87)
!90 = !DILocation(line: 25, column: 19, scope: !87)
!91 = !DILocation(line: 25, column: 8, scope: !82)
!92 = !DILocation(line: 25, column: 24, scope: !87)
!93 = !DILocation(line: 25, column: 21, scope: !87)
!94 = !DILocation(line: 24, column: 33, scope: !82)
!95 = !DILocation(line: 24, column: 30, scope: !82)
!96 = !DILocation(line: 24, column: 3, scope: !82)
!97 = distinct !{!97, !85, !98}
!98 = !DILocation(line: 25, column: 24, scope: !78)
!99 = !DILocation(line: 27, column: 3, scope: !100)
!100 = distinct !DILexicalBlock(scope: !47, file: !1, line: 27, column: 3)
!101 = !DILocation(line: 29, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !47, file: !1, line: 29, column: 3)
!103 = !DILocation(line: 29, column: 10, scope: !102)
!104 = !DILocation(line: 29, column: 24, scope: !102)
!105 = !DILocation(line: 29, column: 22, scope: !102)
!106 = !DILocation(line: 29, column: 8, scope: !102)
!107 = !DILocation(line: 29, column: 34, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !1, line: 29, column: 3)
!109 = !DILocation(line: 29, column: 38, scope: !108)
!110 = !DILocation(line: 29, column: 36, scope: !108)
!111 = !DILocation(line: 29, column: 3, scope: !102)
!112 = !DILocation(line: 30, column: 4, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !1, line: 30, column: 4)
!114 = !DILocation(line: 29, column: 46, scope: !108)
!115 = !DILocation(line: 29, column: 43, scope: !108)
!116 = !DILocation(line: 29, column: 58, scope: !108)
!117 = !DILocation(line: 29, column: 55, scope: !108)
!118 = !DILocation(line: 29, column: 3, scope: !108)
!119 = distinct !{!119, !111, !120}
!120 = !DILocation(line: 30, column: 4, scope: !102)
!121 = distinct !{!121, !44, !122}
!122 = !DILocation(line: 31, column: 2, scope: !15)
!123 = !DILocation(line: 32, column: 7, scope: !15)
!124 = !DILocation(line: 32, column: 2, scope: !15)
!125 = !DILocation(line: 33, column: 1, scope: !15)
!126 = distinct !DISubprogram(name: "scmp", scope: !1, file: !1, line: 35, type: !24, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "a", arg: 1, scope: !126, file: !1, line: 35, type: !26)
!128 = !DILocation(line: 35, column: 22, scope: !126)
!129 = !DILocalVariable(name: "b", arg: 2, scope: !126, file: !1, line: 35, type: !26)
!130 = !DILocation(line: 35, column: 37, scope: !126)
!131 = !DILocation(line: 35, column: 78, scope: !126)
!132 = !DILocation(line: 35, column: 57, scope: !126)
!133 = !DILocation(line: 35, column: 56, scope: !126)
!134 = !DILocation(line: 35, column: 103, scope: !126)
!135 = !DILocation(line: 35, column: 82, scope: !126)
!136 = !DILocation(line: 35, column: 81, scope: !126)
!137 = !DILocation(line: 35, column: 49, scope: !126)
!138 = !DILocation(line: 35, column: 42, scope: !126)
!139 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 37, type: !140, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DISubroutineType(types: !141)
!141 = !{!18}
!142 = !DILocalVariable(name: "i", scope: !139, file: !1, line: 39, type: !18)
!143 = !DILocation(line: 39, column: 6, scope: !139)
!144 = !DILocalVariable(name: "strs", scope: !139, file: !1, line: 40, type: !145)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 320, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 5)
!148 = !DILocation(line: 40, column: 14, scope: !139)
!149 = !DILocation(line: 41, column: 12, scope: !139)
!150 = !DILocation(line: 41, column: 2, scope: !139)
!151 = !DILocation(line: 43, column: 9, scope: !152)
!152 = distinct !DILexicalBlock(scope: !139, file: !1, line: 43, column: 2)
!153 = !DILocation(line: 43, column: 7, scope: !152)
!154 = !DILocation(line: 43, column: 14, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !1, line: 43, column: 2)
!156 = !DILocation(line: 43, column: 16, scope: !155)
!157 = !DILocation(line: 43, column: 2, scope: !152)
!158 = !DILocation(line: 44, column: 23, scope: !155)
!159 = !DILocation(line: 44, column: 18, scope: !155)
!160 = !DILocation(line: 44, column: 3, scope: !155)
!161 = !DILocation(line: 43, column: 22, scope: !155)
!162 = !DILocation(line: 43, column: 2, scope: !155)
!163 = distinct !{!163, !157, !164}
!164 = !DILocation(line: 44, column: 25, scope: !152)
!165 = !DILocation(line: 45, column: 2, scope: !139)
