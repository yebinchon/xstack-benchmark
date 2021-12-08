; ModuleID = 'create-a-two-dimensional-array-at-runtime-2.ll'
source_filename = "create-a-two-dimensional-array-at-runtime-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [52 x i8] c"invalid negative rank argument passed to allocarray\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c"\0A%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"memory allocation failure\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @allocarray(i64 %rank, i64* %shape, i64 %itemSize) #0 !dbg !12 {
entry:
  %retval = alloca i8*, align 8
  %rank.addr = alloca i64, align 8
  %shape.addr = alloca i64*, align 8
  %itemSize.addr = alloca i64, align 8
  %size = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %dataSpace = alloca i64, align 8
  %pointerSpace = alloca i64, align 8
  %pointers = alloca i64, align 8
  %nextLevelIncrement = alloca i64, align 8
  %memory = alloca i8*, align 8
  %pc = alloca i8*, align 8
  %nextpc = alloca i8*, align 8
  store i64 %rank, i64* %rank.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %rank.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i64* %shape, i64** %shape.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %shape.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store i64 %itemSize, i64* %itemSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %itemSize.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %size, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %j, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %dataSpace, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %pointerSpace, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %pointers, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %nextLevelIncrement, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i8** %memory, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i8** %pc, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i8** %nextpc, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i64, i64* %rank.addr, align 8, !dbg !45
  %cmp = icmp ult i64 %0, 2, !dbg !47
  br i1 %cmp, label %if.then, label %if.end4, !dbg !48

if.then:                                          ; preds = %entry
  %1 = load i64, i64* %rank.addr, align 8, !dbg !49
  %cmp1 = icmp ult i64 %1, 0, !dbg !52
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !53

if.then2:                                         ; preds = %if.then
  call void @error(i32 1, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str, i64 0, i64 0)), !dbg !54
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then2, %if.then
  %2 = load i64, i64* %rank.addr, align 8, !dbg !55
  %cmp3 = icmp ult i64 %2, 1, !dbg !56
  br i1 %cmp3, label %cond.true, label %cond.false, !dbg !55

cond.true:                                        ; preds = %if.end
  br label %cond.end, !dbg !55

cond.false:                                       ; preds = %if.end
  %3 = load i64*, i64** %shape.addr, align 8, !dbg !57
  %4 = load i64, i64* %3, align 8, !dbg !58
  br label %cond.end, !dbg !55

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ 1, %cond.true ], [ %4, %cond.false ], !dbg !55
  store i64 %cond, i64* %size, align 8, !dbg !59
  %5 = load i64, i64* %size, align 8, !dbg !60
  %conv = trunc i64 %5 to i32, !dbg !60
  %6 = load i64, i64* %itemSize.addr, align 8, !dbg !61
  %call = call i8* @dwlcalloc(i32 %conv, i64 %6), !dbg !62
  store i8* %call, i8** %retval, align 8, !dbg !63
  br label %return, !dbg !63

if.end4:                                          ; preds = %entry
  store i64 0, i64* %pointerSpace, align 8, !dbg !64
  store i64 1, i64* %dataSpace, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load i64, i64* %i, align 8, !dbg !69
  %8 = load i64, i64* %rank.addr, align 8, !dbg !71
  %sub = sub i64 %8, 1, !dbg !72
  %cmp5 = icmp ult i64 %7, %sub, !dbg !73
  br i1 %cmp5, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %9 = load i64*, i64** %shape.addr, align 8, !dbg !75
  %10 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !75
  %11 = load i64, i64* %arrayidx, align 8, !dbg !75
  %12 = load i64, i64* %dataSpace, align 8, !dbg !77
  %mul = mul i64 %12, %11, !dbg !77
  store i64 %mul, i64* %dataSpace, align 8, !dbg !77
  %13 = load i64, i64* %pointerSpace, align 8, !dbg !78
  %add = add i64 %13, %mul, !dbg !78
  store i64 %add, i64* %pointerSpace, align 8, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %14, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %15 = load i64, i64* %pointerSpace, align 8, !dbg !84
  %mul7 = mul i64 %15, 8, !dbg !84
  store i64 %mul7, i64* %pointerSpace, align 8, !dbg !84
  %16 = load i64*, i64** %shape.addr, align 8, !dbg !85
  %17 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx8 = getelementptr inbounds i64, i64* %16, i64 %17, !dbg !85
  %18 = load i64, i64* %arrayidx8, align 8, !dbg !85
  %19 = load i64, i64* %itemSize.addr, align 8, !dbg !87
  %mul9 = mul i64 %18, %19, !dbg !88
  %20 = load i64, i64* %dataSpace, align 8, !dbg !89
  %mul10 = mul i64 %20, %mul9, !dbg !89
  store i64 %mul10, i64* %dataSpace, align 8, !dbg !89
  %21 = load i64, i64* %pointerSpace, align 8, !dbg !90
  %22 = load i64, i64* %dataSpace, align 8, !dbg !91
  %add11 = add i64 %21, %22, !dbg !92
  %call12 = call i8* @dwlcalloc(i32 1, i64 %add11), !dbg !93
  store i8* %call12, i8** %pc, align 8, !dbg !94
  store i8* %call12, i8** %memory, align 8, !dbg !95
  store i64 1, i64* %pointers, align 8, !dbg !96
  store i64 0, i64* %i, align 8, !dbg !97
  br label %for.cond13, !dbg !99

for.cond13:                                       ; preds = %for.end32, %for.end
  %23 = load i64, i64* %i, align 8, !dbg !100
  %24 = load i64, i64* %rank.addr, align 8, !dbg !102
  %sub14 = sub i64 %24, 2, !dbg !103
  %cmp15 = icmp ult i64 %23, %sub14, !dbg !104
  br i1 %cmp15, label %for.body17, label %for.end33, !dbg !105

for.body17:                                       ; preds = %for.cond13
  %25 = load i8*, i8** %pc, align 8, !dbg !106
  %26 = load i64*, i64** %shape.addr, align 8, !dbg !108
  %27 = load i64, i64* %i, align 8, !dbg !109
  %arrayidx18 = getelementptr inbounds i64, i64* %26, i64 %27, !dbg !108
  %28 = load i64, i64* %arrayidx18, align 8, !dbg !108
  %29 = load i64, i64* %pointers, align 8, !dbg !110
  %mul19 = mul i64 %29, %28, !dbg !110
  store i64 %mul19, i64* %pointers, align 8, !dbg !110
  %mul20 = mul i64 %mul19, 8, !dbg !111
  %add.ptr = getelementptr inbounds i8, i8* %25, i64 %mul20, !dbg !112
  store i8* %add.ptr, i8** %nextpc, align 8, !dbg !113
  %30 = load i64*, i64** %shape.addr, align 8, !dbg !114
  %31 = load i64, i64* %i, align 8, !dbg !115
  %inc21 = add i64 %31, 1, !dbg !115
  store i64 %inc21, i64* %i, align 8, !dbg !115
  %arrayidx22 = getelementptr inbounds i64, i64* %30, i64 %inc21, !dbg !114
  %32 = load i64, i64* %arrayidx22, align 8, !dbg !114
  %mul23 = mul i64 %32, 8, !dbg !116
  store i64 %mul23, i64* %nextLevelIncrement, align 8, !dbg !117
  store i64 0, i64* %j, align 8, !dbg !118
  br label %for.cond24, !dbg !120

for.cond24:                                       ; preds = %for.inc30, %for.body17
  %33 = load i64, i64* %j, align 8, !dbg !121
  %34 = load i64, i64* %pointers, align 8, !dbg !123
  %cmp25 = icmp ult i64 %33, %34, !dbg !124
  br i1 %cmp25, label %for.body27, label %for.end32, !dbg !125

for.body27:                                       ; preds = %for.cond24
  %35 = load i8*, i8** %nextpc, align 8, !dbg !126
  %36 = load i8*, i8** %pc, align 8, !dbg !127
  %37 = bitcast i8* %36 to i8**, !dbg !128
  store i8* %35, i8** %37, align 8, !dbg !129
  %38 = load i8*, i8** %pc, align 8, !dbg !130
  %add.ptr28 = getelementptr inbounds i8, i8* %38, i64 8, !dbg !130
  store i8* %add.ptr28, i8** %pc, align 8, !dbg !130
  %39 = load i64, i64* %nextLevelIncrement, align 8, !dbg !131
  %40 = load i8*, i8** %nextpc, align 8, !dbg !132
  %add.ptr29 = getelementptr inbounds i8, i8* %40, i64 %39, !dbg !132
  store i8* %add.ptr29, i8** %nextpc, align 8, !dbg !132
  br label %for.inc30, !dbg !128

for.inc30:                                        ; preds = %for.body27
  %41 = load i64, i64* %j, align 8, !dbg !133
  %inc31 = add i64 %41, 1, !dbg !133
  store i64 %inc31, i64* %j, align 8, !dbg !133
  br label %for.cond24, !dbg !134, !llvm.loop !135

for.end32:                                        ; preds = %for.cond24
  br label %for.cond13, !dbg !137, !llvm.loop !138

for.end33:                                        ; preds = %for.cond13
  %42 = load i8*, i8** %pc, align 8, !dbg !140
  %43 = load i64*, i64** %shape.addr, align 8, !dbg !141
  %44 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx34 = getelementptr inbounds i64, i64* %43, i64 %44, !dbg !141
  %45 = load i64, i64* %arrayidx34, align 8, !dbg !141
  %46 = load i64, i64* %pointers, align 8, !dbg !143
  %mul35 = mul i64 %46, %45, !dbg !143
  store i64 %mul35, i64* %pointers, align 8, !dbg !143
  %mul36 = mul i64 %mul35, 8, !dbg !144
  %add.ptr37 = getelementptr inbounds i8, i8* %42, i64 %mul36, !dbg !145
  store i8* %add.ptr37, i8** %nextpc, align 8, !dbg !146
  %47 = load i64*, i64** %shape.addr, align 8, !dbg !147
  %48 = load i64, i64* %i, align 8, !dbg !148
  %inc38 = add i64 %48, 1, !dbg !148
  store i64 %inc38, i64* %i, align 8, !dbg !148
  %arrayidx39 = getelementptr inbounds i64, i64* %47, i64 %inc38, !dbg !147
  %49 = load i64, i64* %arrayidx39, align 8, !dbg !147
  %50 = load i64, i64* %itemSize.addr, align 8, !dbg !149
  %mul40 = mul i64 %49, %50, !dbg !150
  store i64 %mul40, i64* %nextLevelIncrement, align 8, !dbg !151
  store i64 0, i64* %j, align 8, !dbg !152
  br label %for.cond41, !dbg !154

for.cond41:                                       ; preds = %for.inc47, %for.end33
  %51 = load i64, i64* %j, align 8, !dbg !155
  %52 = load i64, i64* %pointers, align 8, !dbg !157
  %cmp42 = icmp ult i64 %51, %52, !dbg !158
  br i1 %cmp42, label %for.body44, label %for.end49, !dbg !159

for.body44:                                       ; preds = %for.cond41
  %53 = load i8*, i8** %nextpc, align 8, !dbg !160
  %54 = load i8*, i8** %pc, align 8, !dbg !161
  %55 = bitcast i8* %54 to i8**, !dbg !162
  store i8* %53, i8** %55, align 8, !dbg !163
  %56 = load i8*, i8** %pc, align 8, !dbg !164
  %add.ptr45 = getelementptr inbounds i8, i8* %56, i64 8, !dbg !164
  store i8* %add.ptr45, i8** %pc, align 8, !dbg !164
  %57 = load i64, i64* %nextLevelIncrement, align 8, !dbg !165
  %58 = load i8*, i8** %nextpc, align 8, !dbg !166
  %add.ptr46 = getelementptr inbounds i8, i8* %58, i64 %57, !dbg !166
  store i8* %add.ptr46, i8** %nextpc, align 8, !dbg !166
  br label %for.inc47, !dbg !162

for.inc47:                                        ; preds = %for.body44
  %59 = load i64, i64* %j, align 8, !dbg !167
  %inc48 = add i64 %59, 1, !dbg !167
  store i64 %inc48, i64* %j, align 8, !dbg !167
  br label %for.cond41, !dbg !168, !llvm.loop !169

for.end49:                                        ; preds = %for.cond41
  %60 = load i8*, i8** %memory, align 8, !dbg !171
  store i8* %60, i8** %retval, align 8, !dbg !172
  br label %return, !dbg !172

return:                                           ; preds = %for.end49, %cond.end
  %61 = load i8*, i8** %retval, align 8, !dbg !173
  ret i8* %61, !dbg !173
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @error(i32 %status, i8* %message) #0 !dbg !174 {
entry:
  %status.addr = alloca i32, align 4
  %message.addr = alloca i8*, align 8
  store i32 %status, i32* %status.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %status.addr, metadata !178, metadata !DIExpression()), !dbg !179
  store i8* %message, i8** %message.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %message.addr, metadata !180, metadata !DIExpression()), !dbg !181
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !182
  %1 = load i8*, i8** %message.addr, align 8, !dbg !183
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* %1), !dbg !184
  %2 = load i32, i32* %status.addr, align 4, !dbg !185
  call void @exit(i32 %2) #5, !dbg !186
  unreachable, !dbg !186
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @dwlcalloc(i32 %n, i64 %bytes) #0 !dbg !187 {
entry:
  %n.addr = alloca i32, align 4
  %bytes.addr = alloca i64, align 8
  %rv = alloca i8*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !190, metadata !DIExpression()), !dbg !191
  store i64 %bytes, i64* %bytes.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bytes.addr, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata i8** %rv, metadata !194, metadata !DIExpression()), !dbg !195
  %0 = load i32, i32* %n.addr, align 4, !dbg !196
  %conv = sext i32 %0 to i64, !dbg !196
  %1 = load i64, i64* %bytes.addr, align 8, !dbg !197
  %call = call noalias i8* @calloc(i64 %conv, i64 %1) #6, !dbg !198
  store i8* %call, i8** %rv, align 8, !dbg !195
  %2 = load i8*, i8** %rv, align 8, !dbg !199
  %cmp = icmp eq i8* null, %2, !dbg !201
  br i1 %cmp, label %if.then, label %if.end, !dbg !202

if.then:                                          ; preds = %entry
  call void @error(i32 1, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0)), !dbg !203
  br label %if.end, !dbg !203

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %rv, align 8, !dbg !204
  ret i8* %3, !dbg !205
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "create-a-two-dimensional-array-at-runtime-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Create-a-two-dimensional-array-at-runtime-2")
!2 = !{}
!3 = !{!4, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!12 = distinct !DISubprogram(name: "allocarray", scope: !1, file: !1, line: 21, type: !13, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{!7, !15, !18, !15}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !17)
!16 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!17 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!19 = !DILocalVariable(name: "rank", arg: 1, scope: !12, file: !1, line: 21, type: !15)
!20 = !DILocation(line: 21, column: 24, scope: !12)
!21 = !DILocalVariable(name: "shape", arg: 2, scope: !12, file: !1, line: 21, type: !18)
!22 = !DILocation(line: 21, column: 36, scope: !12)
!23 = !DILocalVariable(name: "itemSize", arg: 3, scope: !12, file: !1, line: 21, type: !15)
!24 = !DILocation(line: 21, column: 49, scope: !12)
!25 = !DILocalVariable(name: "size", scope: !12, file: !1, line: 31, type: !15)
!26 = !DILocation(line: 31, column: 10, scope: !12)
!27 = !DILocalVariable(name: "i", scope: !12, file: !1, line: 31, type: !15)
!28 = !DILocation(line: 31, column: 15, scope: !12)
!29 = !DILocalVariable(name: "j", scope: !12, file: !1, line: 31, type: !15)
!30 = !DILocation(line: 31, column: 17, scope: !12)
!31 = !DILocalVariable(name: "dataSpace", scope: !12, file: !1, line: 31, type: !15)
!32 = !DILocation(line: 31, column: 19, scope: !12)
!33 = !DILocalVariable(name: "pointerSpace", scope: !12, file: !1, line: 31, type: !15)
!34 = !DILocation(line: 31, column: 29, scope: !12)
!35 = !DILocalVariable(name: "pointers", scope: !12, file: !1, line: 31, type: !15)
!36 = !DILocation(line: 31, column: 42, scope: !12)
!37 = !DILocalVariable(name: "nextLevelIncrement", scope: !12, file: !1, line: 31, type: !15)
!38 = !DILocation(line: 31, column: 51, scope: !12)
!39 = !DILocalVariable(name: "memory", scope: !12, file: !1, line: 32, type: !5)
!40 = !DILocation(line: 32, column: 8, scope: !12)
!41 = !DILocalVariable(name: "pc", scope: !12, file: !1, line: 32, type: !5)
!42 = !DILocation(line: 32, column: 16, scope: !12)
!43 = !DILocalVariable(name: "nextpc", scope: !12, file: !1, line: 32, type: !5)
!44 = !DILocation(line: 32, column: 20, scope: !12)
!45 = !DILocation(line: 33, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !12, file: !1, line: 33, column: 7)
!47 = !DILocation(line: 33, column: 12, scope: !46)
!48 = !DILocation(line: 33, column: 7, scope: !12)
!49 = !DILocation(line: 34, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 34, column: 9)
!51 = distinct !DILexicalBlock(scope: !46, file: !1, line: 33, column: 17)
!52 = !DILocation(line: 34, column: 14, scope: !50)
!53 = !DILocation(line: 34, column: 9, scope: !51)
!54 = !DILocation(line: 35, column: 7, scope: !50)
!55 = !DILocation(line: 36, column: 12, scope: !51)
!56 = !DILocation(line: 36, column: 17, scope: !51)
!57 = !DILocation(line: 36, column: 28, scope: !51)
!58 = !DILocation(line: 36, column: 27, scope: !51)
!59 = !DILocation(line: 36, column: 10, scope: !51)
!60 = !DILocation(line: 37, column: 22, scope: !51)
!61 = !DILocation(line: 37, column: 27, scope: !51)
!62 = !DILocation(line: 37, column: 12, scope: !51)
!63 = !DILocation(line: 37, column: 5, scope: !51)
!64 = !DILocation(line: 39, column: 16, scope: !12)
!65 = !DILocation(line: 39, column: 31, scope: !12)
!66 = !DILocation(line: 40, column: 10, scope: !67)
!67 = distinct !DILexicalBlock(scope: !12, file: !1, line: 40, column: 3)
!68 = !DILocation(line: 40, column: 8, scope: !67)
!69 = !DILocation(line: 40, column: 15, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !1, line: 40, column: 3)
!71 = !DILocation(line: 40, column: 19, scope: !70)
!72 = !DILocation(line: 40, column: 23, scope: !70)
!73 = !DILocation(line: 40, column: 17, scope: !70)
!74 = !DILocation(line: 40, column: 3, scope: !67)
!75 = !DILocation(line: 41, column: 35, scope: !70)
!76 = !DILocation(line: 41, column: 41, scope: !70)
!77 = !DILocation(line: 41, column: 32, scope: !70)
!78 = !DILocation(line: 41, column: 18, scope: !70)
!79 = !DILocation(line: 41, column: 5, scope: !70)
!80 = !DILocation(line: 40, column: 27, scope: !70)
!81 = !DILocation(line: 40, column: 3, scope: !70)
!82 = distinct !{!82, !74, !83}
!83 = !DILocation(line: 41, column: 43, scope: !67)
!84 = !DILocation(line: 42, column: 16, scope: !12)
!85 = !DILocation(line: 43, column: 16, scope: !12)
!86 = !DILocation(line: 43, column: 22, scope: !12)
!87 = !DILocation(line: 43, column: 25, scope: !12)
!88 = !DILocation(line: 43, column: 24, scope: !12)
!89 = !DILocation(line: 43, column: 13, scope: !12)
!90 = !DILocation(line: 44, column: 29, scope: !12)
!91 = !DILocation(line: 44, column: 42, scope: !12)
!92 = !DILocation(line: 44, column: 41, scope: !12)
!93 = !DILocation(line: 44, column: 17, scope: !12)
!94 = !DILocation(line: 44, column: 15, scope: !12)
!95 = !DILocation(line: 44, column: 10, scope: !12)
!96 = !DILocation(line: 45, column: 12, scope: !12)
!97 = !DILocation(line: 46, column: 10, scope: !98)
!98 = distinct !DILexicalBlock(scope: !12, file: !1, line: 46, column: 3)
!99 = !DILocation(line: 46, column: 8, scope: !98)
!100 = !DILocation(line: 46, column: 15, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !1, line: 46, column: 3)
!102 = !DILocation(line: 46, column: 19, scope: !101)
!103 = !DILocation(line: 46, column: 23, scope: !101)
!104 = !DILocation(line: 46, column: 17, scope: !101)
!105 = !DILocation(line: 46, column: 3, scope: !98)
!106 = !DILocation(line: 47, column: 14, scope: !107)
!107 = distinct !DILexicalBlock(scope: !101, file: !1, line: 46, column: 29)
!108 = !DILocation(line: 47, column: 32, scope: !107)
!109 = !DILocation(line: 47, column: 38, scope: !107)
!110 = !DILocation(line: 47, column: 29, scope: !107)
!111 = !DILocation(line: 47, column: 41, scope: !107)
!112 = !DILocation(line: 47, column: 17, scope: !107)
!113 = !DILocation(line: 47, column: 12, scope: !107)
!114 = !DILocation(line: 48, column: 26, scope: !107)
!115 = !DILocation(line: 48, column: 32, scope: !107)
!116 = !DILocation(line: 48, column: 36, scope: !107)
!117 = !DILocation(line: 48, column: 24, scope: !107)
!118 = !DILocation(line: 49, column: 12, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !1, line: 49, column: 5)
!120 = !DILocation(line: 49, column: 10, scope: !119)
!121 = !DILocation(line: 49, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !1, line: 49, column: 5)
!123 = !DILocation(line: 49, column: 21, scope: !122)
!124 = !DILocation(line: 49, column: 19, scope: !122)
!125 = !DILocation(line: 49, column: 5, scope: !119)
!126 = !DILocation(line: 50, column: 23, scope: !122)
!127 = !DILocation(line: 50, column: 17, scope: !122)
!128 = !DILocation(line: 50, column: 7, scope: !122)
!129 = !DILocation(line: 50, column: 21, scope: !122)
!130 = !DILocation(line: 50, column: 33, scope: !122)
!131 = !DILocation(line: 50, column: 60, scope: !122)
!132 = !DILocation(line: 50, column: 57, scope: !122)
!133 = !DILocation(line: 49, column: 31, scope: !122)
!134 = !DILocation(line: 49, column: 5, scope: !122)
!135 = distinct !{!135, !125, !136}
!136 = !DILocation(line: 50, column: 60, scope: !119)
!137 = !DILocation(line: 46, column: 3, scope: !101)
!138 = distinct !{!138, !105, !139}
!139 = !DILocation(line: 51, column: 3, scope: !98)
!140 = !DILocation(line: 52, column: 12, scope: !12)
!141 = !DILocation(line: 52, column: 30, scope: !12)
!142 = !DILocation(line: 52, column: 36, scope: !12)
!143 = !DILocation(line: 52, column: 27, scope: !12)
!144 = !DILocation(line: 52, column: 39, scope: !12)
!145 = !DILocation(line: 52, column: 15, scope: !12)
!146 = !DILocation(line: 52, column: 10, scope: !12)
!147 = !DILocation(line: 53, column: 24, scope: !12)
!148 = !DILocation(line: 53, column: 30, scope: !12)
!149 = !DILocation(line: 53, column: 35, scope: !12)
!150 = !DILocation(line: 53, column: 34, scope: !12)
!151 = !DILocation(line: 53, column: 22, scope: !12)
!152 = !DILocation(line: 54, column: 10, scope: !153)
!153 = distinct !DILexicalBlock(scope: !12, file: !1, line: 54, column: 3)
!154 = !DILocation(line: 54, column: 8, scope: !153)
!155 = !DILocation(line: 54, column: 15, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !1, line: 54, column: 3)
!157 = !DILocation(line: 54, column: 19, scope: !156)
!158 = !DILocation(line: 54, column: 17, scope: !156)
!159 = !DILocation(line: 54, column: 3, scope: !153)
!160 = !DILocation(line: 55, column: 21, scope: !156)
!161 = !DILocation(line: 55, column: 15, scope: !156)
!162 = !DILocation(line: 55, column: 5, scope: !156)
!163 = !DILocation(line: 55, column: 19, scope: !156)
!164 = !DILocation(line: 55, column: 31, scope: !156)
!165 = !DILocation(line: 55, column: 58, scope: !156)
!166 = !DILocation(line: 55, column: 55, scope: !156)
!167 = !DILocation(line: 54, column: 29, scope: !156)
!168 = !DILocation(line: 54, column: 3, scope: !156)
!169 = distinct !{!169, !159, !170}
!170 = !DILocation(line: 55, column: 58, scope: !153)
!171 = !DILocation(line: 56, column: 10, scope: !12)
!172 = !DILocation(line: 56, column: 3, scope: !12)
!173 = !DILocation(line: 57, column: 1, scope: !12)
!174 = distinct !DISubprogram(name: "error", scope: !1, file: !1, line: 9, type: !175, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!175 = !DISubroutineType(types: !176)
!176 = !{null, !177, !5}
!177 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!178 = !DILocalVariable(name: "status", arg: 1, scope: !174, file: !1, line: 9, type: !177)
!179 = !DILocation(line: 9, column: 23, scope: !174)
!180 = !DILocalVariable(name: "message", arg: 2, scope: !174, file: !1, line: 9, type: !5)
!181 = !DILocation(line: 9, column: 36, scope: !174)
!182 = !DILocation(line: 10, column: 11, scope: !174)
!183 = !DILocation(line: 10, column: 27, scope: !174)
!184 = !DILocation(line: 10, column: 3, scope: !174)
!185 = !DILocation(line: 11, column: 8, scope: !174)
!186 = !DILocation(line: 11, column: 3, scope: !174)
!187 = distinct !DISubprogram(name: "dwlcalloc", scope: !1, file: !1, line: 14, type: !188, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!188 = !DISubroutineType(types: !189)
!189 = !{!7, !177, !15}
!190 = !DILocalVariable(name: "n", arg: 1, scope: !187, file: !1, line: 14, type: !177)
!191 = !DILocation(line: 14, column: 27, scope: !187)
!192 = !DILocalVariable(name: "bytes", arg: 2, scope: !187, file: !1, line: 14, type: !15)
!193 = !DILocation(line: 14, column: 36, scope: !187)
!194 = !DILocalVariable(name: "rv", scope: !187, file: !1, line: 15, type: !7)
!195 = !DILocation(line: 15, column: 8, scope: !187)
!196 = !DILocation(line: 15, column: 27, scope: !187)
!197 = !DILocation(line: 15, column: 29, scope: !187)
!198 = !DILocation(line: 15, column: 20, scope: !187)
!199 = !DILocation(line: 16, column: 15, scope: !200)
!200 = distinct !DILexicalBlock(scope: !187, file: !1, line: 16, column: 7)
!201 = !DILocation(line: 16, column: 12, scope: !200)
!202 = !DILocation(line: 16, column: 7, scope: !187)
!203 = !DILocation(line: 17, column: 5, scope: !200)
!204 = !DILocation(line: 18, column: 10, scope: !187)
!205 = !DILocation(line: 18, column: 3, scope: !187)
