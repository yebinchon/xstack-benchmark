; ModuleID = 'arena-storage-pool-7.ll'
source_filename = "arena-storage-pool-7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__ALLOCC_ENTRY__ = type { i8*, i64, %struct.__ALLOCC_ENTRY__* }

@__ALLOCC_ROOT__ = dso_local global %struct.__ALLOCC_ENTRY__* null, align 8, !dbg !0
@__ALLOCC_TAIL__ = dso_local global %struct.__ALLOCC_ENTRY__* null, align 8, !dbg !19
@.str = private unnamed_addr constant [14 x i8] c"p1[%d] == %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_add_mem_entry(i8* %location, i64 %size) #0 !dbg !25 {
entry:
  %location.addr = alloca i8*, align 8
  %size.addr = alloca i64, align 8
  %newEntry = alloca %struct.__ALLOCC_ENTRY__*, align 8
  %tail = alloca %struct.__ALLOCC_ENTRY__*, align 8
  store i8* %location, i8** %location.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %location.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata %struct.__ALLOCC_ENTRY__** %newEntry, metadata !32, metadata !DIExpression()), !dbg !33
  %call = call i8* @mmap(i8* null, i64 24, i32 3, i32 34, i32 -1, i64 0) #4, !dbg !34
  %0 = bitcast i8* %call to %struct.__ALLOCC_ENTRY__*, !dbg !35
  store %struct.__ALLOCC_ENTRY__* %0, %struct.__ALLOCC_ENTRY__** %newEntry, align 8, !dbg !33
  %1 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !36
  %cmp = icmp ne %struct.__ALLOCC_ENTRY__* %1, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %2 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %newEntry, align 8, !dbg !40
  %3 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !42
  %next = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %3, i32 0, i32 2, !dbg !43
  store %struct.__ALLOCC_ENTRY__* %2, %struct.__ALLOCC_ENTRY__** %next, align 8, !dbg !44
  %4 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !45
  %next1 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %4, i32 0, i32 2, !dbg !46
  %5 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next1, align 8, !dbg !46
  store %struct.__ALLOCC_ENTRY__* %5, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !47
  br label %if.end, !dbg !48

if.else:                                          ; preds = %entry
  %6 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %newEntry, align 8, !dbg !49
  store %struct.__ALLOCC_ENTRY__* %6, %struct.__ALLOCC_ENTRY__** @__ALLOCC_ROOT__, align 8, !dbg !51
  %7 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %newEntry, align 8, !dbg !52
  store %struct.__ALLOCC_ENTRY__* %7, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !53
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata %struct.__ALLOCC_ENTRY__** %tail, metadata !54, metadata !DIExpression()), !dbg !55
  %8 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !56
  store %struct.__ALLOCC_ENTRY__* %8, %struct.__ALLOCC_ENTRY__** %tail, align 8, !dbg !55
  %9 = load i8*, i8** %location.addr, align 8, !dbg !57
  %10 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %tail, align 8, !dbg !58
  %allocatedAddr = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %10, i32 0, i32 0, !dbg !59
  store i8* %9, i8** %allocatedAddr, align 8, !dbg !60
  %11 = load i64, i64* %size.addr, align 8, !dbg !61
  %12 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %tail, align 8, !dbg !62
  %size2 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %12, i32 0, i32 1, !dbg !63
  store i64 %11, i64* %size2, align 8, !dbg !64
  %13 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %tail, align 8, !dbg !65
  %next3 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %13, i32 0, i32 2, !dbg !66
  store %struct.__ALLOCC_ENTRY__* null, %struct.__ALLOCC_ENTRY__** %next3, align 8, !dbg !67
  %14 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %tail, align 8, !dbg !68
  store %struct.__ALLOCC_ENTRY__* %14, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @mmap(i8*, i64, i32, i32, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @_remove_mem_entry(i8* %location) #0 !dbg !71 {
entry:
  %retval = alloca i64, align 8
  %location.addr = alloca i8*, align 8
  %curNode = alloca %struct.__ALLOCC_ENTRY__*, align 8
  %chunkSize = alloca i64, align 8
  %nextNode = alloca %struct.__ALLOCC_ENTRY__*, align 8
  %chunkSize13 = alloca i64, align 8
  store i8* %location, i8** %location.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %location.addr, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata %struct.__ALLOCC_ENTRY__** %curNode, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_ROOT__, align 8, !dbg !78
  store %struct.__ALLOCC_ENTRY__* %0, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !77
  %1 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !79
  %cmp = icmp eq %struct.__ALLOCC_ENTRY__* %1, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  store i64 0, i64* %retval, align 8, !dbg !83
  br label %return, !dbg !83

if.end:                                           ; preds = %entry
  %2 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !85
  %allocatedAddr = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %2, i32 0, i32 0, !dbg !87
  %3 = load i8*, i8** %allocatedAddr, align 8, !dbg !87
  %4 = load i8*, i8** %location.addr, align 8, !dbg !88
  %cmp1 = icmp eq i8* %3, %4, !dbg !89
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !90

if.then2:                                         ; preds = %if.end
  %5 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !91
  %next = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %5, i32 0, i32 2, !dbg !93
  %6 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next, align 8, !dbg !93
  store %struct.__ALLOCC_ENTRY__* %6, %struct.__ALLOCC_ENTRY__** @__ALLOCC_ROOT__, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i64* %chunkSize, metadata !95, metadata !DIExpression()), !dbg !96
  %7 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !97
  %size = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %7, i32 0, i32 1, !dbg !98
  %8 = load i64, i64* %size, align 8, !dbg !98
  store i64 %8, i64* %chunkSize, align 8, !dbg !96
  %9 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_ROOT__, align 8, !dbg !99
  %cmp3 = icmp eq %struct.__ALLOCC_ENTRY__* %9, null, !dbg !101
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !102

if.then4:                                         ; preds = %if.then2
  store %struct.__ALLOCC_ENTRY__* null, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !103
  br label %if.end5, !dbg !105

if.end5:                                          ; preds = %if.then4, %if.then2
  %10 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !106
  %11 = bitcast %struct.__ALLOCC_ENTRY__* %10 to i8*, !dbg !106
  %call = call i32 @munmap(i8* %11, i64 24) #4, !dbg !107
  %12 = load i64, i64* %chunkSize, align 8, !dbg !108
  store i64 %12, i64* %retval, align 8, !dbg !109
  br label %return, !dbg !109

if.end6:                                          ; preds = %if.end
  br label %while.cond, !dbg !110

while.cond:                                       ; preds = %if.end22, %if.end6
  %13 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !111
  %next7 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %13, i32 0, i32 2, !dbg !112
  %14 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next7, align 8, !dbg !112
  %cmp8 = icmp ne %struct.__ALLOCC_ENTRY__* %14, null, !dbg !113
  br i1 %cmp8, label %while.body, label %while.end, !dbg !110

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct.__ALLOCC_ENTRY__** %nextNode, metadata !114, metadata !DIExpression()), !dbg !116
  %15 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !117
  %next9 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %15, i32 0, i32 2, !dbg !118
  %16 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next9, align 8, !dbg !118
  store %struct.__ALLOCC_ENTRY__* %16, %struct.__ALLOCC_ENTRY__** %nextNode, align 8, !dbg !116
  %17 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %nextNode, align 8, !dbg !119
  %allocatedAddr10 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %17, i32 0, i32 0, !dbg !121
  %18 = load i8*, i8** %allocatedAddr10, align 8, !dbg !121
  %19 = load i8*, i8** %location.addr, align 8, !dbg !122
  %cmp11 = icmp eq i8* %18, %19, !dbg !123
  br i1 %cmp11, label %if.then12, label %if.end22, !dbg !124

if.then12:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %chunkSize13, metadata !125, metadata !DIExpression()), !dbg !127
  %20 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %nextNode, align 8, !dbg !128
  %size14 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %20, i32 0, i32 1, !dbg !129
  %21 = load i64, i64* %size14, align 8, !dbg !129
  store i64 %21, i64* %chunkSize13, align 8, !dbg !127
  %22 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !130
  %next15 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %22, i32 0, i32 2, !dbg !132
  %23 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next15, align 8, !dbg !132
  %24 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !133
  %cmp16 = icmp eq %struct.__ALLOCC_ENTRY__* %23, %24, !dbg !134
  br i1 %cmp16, label %if.then17, label %if.end18, !dbg !135

if.then17:                                        ; preds = %if.then12
  %25 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !136
  store %struct.__ALLOCC_ENTRY__* %25, %struct.__ALLOCC_ENTRY__** @__ALLOCC_TAIL__, align 8, !dbg !138
  br label %if.end18, !dbg !139

if.end18:                                         ; preds = %if.then17, %if.then12
  %26 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %nextNode, align 8, !dbg !140
  %next19 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %26, i32 0, i32 2, !dbg !141
  %27 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %next19, align 8, !dbg !141
  %28 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !142
  %next20 = getelementptr inbounds %struct.__ALLOCC_ENTRY__, %struct.__ALLOCC_ENTRY__* %28, i32 0, i32 2, !dbg !143
  store %struct.__ALLOCC_ENTRY__* %27, %struct.__ALLOCC_ENTRY__** %next20, align 8, !dbg !144
  %29 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %nextNode, align 8, !dbg !145
  %30 = bitcast %struct.__ALLOCC_ENTRY__* %29 to i8*, !dbg !145
  %call21 = call i32 @munmap(i8* %30, i64 24) #4, !dbg !146
  %31 = load i64, i64* %chunkSize13, align 8, !dbg !147
  store i64 %31, i64* %retval, align 8, !dbg !148
  br label %return, !dbg !148

if.end22:                                         ; preds = %while.body
  %32 = load %struct.__ALLOCC_ENTRY__*, %struct.__ALLOCC_ENTRY__** %nextNode, align 8, !dbg !149
  store %struct.__ALLOCC_ENTRY__* %32, %struct.__ALLOCC_ENTRY__** %curNode, align 8, !dbg !150
  br label %while.cond, !dbg !110, !llvm.loop !151

while.end:                                        ; preds = %while.cond
  store i64 0, i64* %retval, align 8, !dbg !153
  br label %return, !dbg !153

return:                                           ; preds = %while.end, %if.end18, %if.end5, %if.then
  %33 = load i64, i64* %retval, align 8, !dbg !154
  ret i64 %33, !dbg !154
}

; Function Attrs: nounwind
declare dso_local i32 @munmap(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @customMalloc(i64 %size) #0 !dbg !155 {
entry:
  %retval = alloca i8*, align 8
  %size.addr = alloca i64, align 8
  %mapped = alloca i8*, align 8
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !158, metadata !DIExpression()), !dbg !159
  %0 = load i64, i64* %size.addr, align 8, !dbg !160
  %cmp = icmp eq i64 %0, 0, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !164
  br label %return, !dbg !164

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %mapped, metadata !166, metadata !DIExpression()), !dbg !167
  %1 = load i64, i64* %size.addr, align 8, !dbg !168
  %call = call i8* @mmap(i8* null, i64 %1, i32 3, i32 34, i32 -1, i64 0) #4, !dbg !169
  store i8* %call, i8** %mapped, align 8, !dbg !167
  %2 = load i8*, i8** %mapped, align 8, !dbg !170
  %3 = load i64, i64* %size.addr, align 8, !dbg !171
  call void @_add_mem_entry(i8* %2, i64 %3), !dbg !172
  %4 = load i8*, i8** %mapped, align 8, !dbg !173
  store i8* %4, i8** %retval, align 8, !dbg !174
  br label %return, !dbg !174

return:                                           ; preds = %if.end, %if.then
  %5 = load i8*, i8** %retval, align 8, !dbg !175
  ret i8* %5, !dbg !175
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @customFree(i8* %addr) #0 !dbg !176 {
entry:
  %addr.addr = alloca i8*, align 8
  %size = alloca i64, align 8
  store i8* %addr, i8** %addr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %addr.addr, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata i64* %size, metadata !181, metadata !DIExpression()), !dbg !182
  %0 = load i8*, i8** %addr.addr, align 8, !dbg !183
  %call = call i64 @_remove_mem_entry(i8* %0), !dbg !184
  store i64 %call, i64* %size, align 8, !dbg !182
  %1 = load i8*, i8** %addr.addr, align 8, !dbg !185
  %2 = load i64, i64* %size, align 8, !dbg !186
  %call1 = call i32 @munmap(i8* %1, i64 %2) #4, !dbg !187
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !189 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %p1 = alloca i32*, align 8
  %p2 = alloca i32*, align 8
  %p3 = alloca i32*, align 8
  %n = alloca i32, align 4
  %n3 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !197, metadata !DIExpression()), !dbg !198
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32** %p1, metadata !201, metadata !DIExpression()), !dbg !203
  %call = call i8* @customMalloc(i64 16), !dbg !204
  %0 = bitcast i8* %call to i32*, !dbg !204
  store i32* %0, i32** %p1, align 8, !dbg !203
  call void @llvm.dbg.declare(metadata i32** %p2, metadata !205, metadata !DIExpression()), !dbg !206
  %call1 = call i8* @customMalloc(i64 16), !dbg !207
  %1 = bitcast i8* %call1 to i32*, !dbg !207
  store i32* %1, i32** %p2, align 8, !dbg !206
  call void @llvm.dbg.declare(metadata i32** %p3, metadata !208, metadata !DIExpression()), !dbg !209
  %call2 = call i8* @customMalloc(i64 16), !dbg !210
  %2 = bitcast i8* %call2 to i32*, !dbg !210
  store i32* %2, i32** %p3, align 8, !dbg !209
  %3 = load i32*, i32** %p1, align 8, !dbg !211
  %tobool = icmp ne i32* %3, null, !dbg !211
  br i1 %tobool, label %if.then, label %if.end, !dbg !213

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %n, metadata !214, metadata !DIExpression()), !dbg !217
  store i32 0, i32* %n, align 4, !dbg !217
  br label %for.cond, !dbg !218

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %n, align 4, !dbg !219
  %cmp = icmp slt i32 %4, 4, !dbg !221
  br i1 %cmp, label %for.body, label %for.end, !dbg !222

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %n, align 4, !dbg !223
  %6 = load i32, i32* %n, align 4, !dbg !224
  %mul = mul nsw i32 %5, %6, !dbg !225
  %7 = load i32*, i32** %p1, align 8, !dbg !226
  %8 = load i32, i32* %n, align 4, !dbg !227
  %idxprom = sext i32 %8 to i64, !dbg !226
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !226
  store i32 %mul, i32* %arrayidx, align 4, !dbg !228
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %n, align 4, !dbg !229
  %inc = add nsw i32 %9, 1, !dbg !229
  store i32 %inc, i32* %n, align 4, !dbg !229
  br label %for.cond, !dbg !230, !llvm.loop !231

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %n3, metadata !233, metadata !DIExpression()), !dbg !235
  store i32 0, i32* %n3, align 4, !dbg !235
  br label %for.cond4, !dbg !236

for.cond4:                                        ; preds = %for.inc10, %for.end
  %10 = load i32, i32* %n3, align 4, !dbg !237
  %cmp5 = icmp slt i32 %10, 4, !dbg !239
  br i1 %cmp5, label %for.body6, label %for.end12, !dbg !240

for.body6:                                        ; preds = %for.cond4
  %11 = load i32, i32* %n3, align 4, !dbg !241
  %12 = load i32*, i32** %p1, align 8, !dbg !242
  %13 = load i32, i32* %n3, align 4, !dbg !243
  %idxprom7 = sext i32 %13 to i64, !dbg !242
  %arrayidx8 = getelementptr inbounds i32, i32* %12, i64 %idxprom7, !dbg !242
  %14 = load i32, i32* %arrayidx8, align 4, !dbg !242
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %11, i32 %14), !dbg !244
  br label %for.inc10, !dbg !244

for.inc10:                                        ; preds = %for.body6
  %15 = load i32, i32* %n3, align 4, !dbg !245
  %inc11 = add nsw i32 %15, 1, !dbg !245
  store i32 %inc11, i32* %n3, align 4, !dbg !245
  br label %for.cond4, !dbg !246, !llvm.loop !247

for.end12:                                        ; preds = %for.cond4
  br label %if.end, !dbg !249

if.end:                                           ; preds = %for.end12, %entry
  %16 = load i32*, i32** %p1, align 8, !dbg !250
  %17 = bitcast i32* %16 to i8*, !dbg !250
  call void @customFree(i8* %17), !dbg !251
  %18 = load i32*, i32** %p2, align 8, !dbg !252
  %19 = bitcast i32* %18 to i8*, !dbg !252
  call void @customFree(i8* %19), !dbg !253
  %20 = load i32*, i32** %p3, align 8, !dbg !254
  %21 = bitcast i32* %20 to i8*, !dbg !254
  call void @customFree(i8* %21), !dbg !255
  ret i32 0, !dbg !256
}

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ALLOCC_ROOT__", scope: !2, file: !3, line: 17, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !18, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "arena-storage-pool-7.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arena-storage-pool")
!4 = !{}
!5 = !{!6, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ALLOCC_ENTRY__", file: !3, line: 14, baseType: !8)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__ALLOCC_ENTRY__", file: !3, line: 8, size: 192, elements: !9)
!9 = !{!10, !12, !16}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "allocatedAddr", scope: !8, file: !3, line: 10, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !8, file: !3, line: 11, baseType: !13, size: 64, offset: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !14, line: 46, baseType: !15)
!14 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!15 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !8, file: !3, line: 12, baseType: !17, size: 64, offset: 128)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!18 = !{!0, !19}
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "__ALLOCC_TAIL__", scope: !2, file: !3, line: 18, type: !6, isLocal: false, isDefinition: true)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!25 = distinct !DISubprogram(name: "_add_mem_entry", scope: !3, file: !3, line: 21, type: !26, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !11, !13}
!28 = !DILocalVariable(name: "location", arg: 1, scope: !25, file: !3, line: 21, type: !11)
!29 = !DILocation(line: 21, column: 28, scope: !25)
!30 = !DILocalVariable(name: "size", arg: 2, scope: !25, file: !3, line: 21, type: !13)
!31 = !DILocation(line: 21, column: 45, scope: !25)
!32 = !DILocalVariable(name: "newEntry", scope: !25, file: !3, line: 24, type: !6)
!33 = !DILocation(line: 24, column: 24, scope: !25)
!34 = !DILocation(line: 24, column: 56, scope: !25)
!35 = !DILocation(line: 24, column: 35, scope: !25)
!36 = !DILocation(line: 26, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !25, file: !3, line: 26, column: 9)
!38 = !DILocation(line: 26, column: 25, scope: !37)
!39 = !DILocation(line: 26, column: 9, scope: !25)
!40 = !DILocation(line: 28, column: 35, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !3, line: 27, column: 5)
!42 = !DILocation(line: 28, column: 9, scope: !41)
!43 = !DILocation(line: 28, column: 28, scope: !41)
!44 = !DILocation(line: 28, column: 33, scope: !41)
!45 = !DILocation(line: 29, column: 27, scope: !41)
!46 = !DILocation(line: 29, column: 46, scope: !41)
!47 = !DILocation(line: 29, column: 25, scope: !41)
!48 = !DILocation(line: 30, column: 5, scope: !41)
!49 = !DILocation(line: 34, column: 27, scope: !50)
!50 = distinct !DILexicalBlock(scope: !37, file: !3, line: 32, column: 5)
!51 = !DILocation(line: 34, column: 25, scope: !50)
!52 = !DILocation(line: 35, column: 27, scope: !50)
!53 = !DILocation(line: 35, column: 25, scope: !50)
!54 = !DILocalVariable(name: "tail", scope: !25, file: !3, line: 38, type: !6)
!55 = !DILocation(line: 38, column: 24, scope: !25)
!56 = !DILocation(line: 38, column: 31, scope: !25)
!57 = !DILocation(line: 39, column: 29, scope: !25)
!58 = !DILocation(line: 39, column: 5, scope: !25)
!59 = !DILocation(line: 39, column: 13, scope: !25)
!60 = !DILocation(line: 39, column: 27, scope: !25)
!61 = !DILocation(line: 40, column: 20, scope: !25)
!62 = !DILocation(line: 40, column: 5, scope: !25)
!63 = !DILocation(line: 40, column: 13, scope: !25)
!64 = !DILocation(line: 40, column: 18, scope: !25)
!65 = !DILocation(line: 41, column: 5, scope: !25)
!66 = !DILocation(line: 41, column: 13, scope: !25)
!67 = !DILocation(line: 41, column: 18, scope: !25)
!68 = !DILocation(line: 42, column: 23, scope: !25)
!69 = !DILocation(line: 42, column: 21, scope: !25)
!70 = !DILocation(line: 43, column: 1, scope: !25)
!71 = distinct !DISubprogram(name: "_remove_mem_entry", scope: !3, file: !3, line: 46, type: !72, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!13, !11}
!74 = !DILocalVariable(name: "location", arg: 1, scope: !71, file: !3, line: 46, type: !11)
!75 = !DILocation(line: 46, column: 33, scope: !71)
!76 = !DILocalVariable(name: "curNode", scope: !71, file: !3, line: 48, type: !6)
!77 = !DILocation(line: 48, column: 24, scope: !71)
!78 = !DILocation(line: 48, column: 34, scope: !71)
!79 = !DILocation(line: 51, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !71, file: !3, line: 51, column: 9)
!81 = !DILocation(line: 51, column: 17, scope: !80)
!82 = !DILocation(line: 51, column: 9, scope: !71)
!83 = !DILocation(line: 53, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !3, line: 52, column: 5)
!85 = !DILocation(line: 57, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !71, file: !3, line: 57, column: 9)
!87 = !DILocation(line: 57, column: 20, scope: !86)
!88 = !DILocation(line: 57, column: 37, scope: !86)
!89 = !DILocation(line: 57, column: 34, scope: !86)
!90 = !DILocation(line: 57, column: 9, scope: !71)
!91 = !DILocation(line: 59, column: 27, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !3, line: 58, column: 5)
!93 = !DILocation(line: 59, column: 38, scope: !92)
!94 = !DILocation(line: 59, column: 25, scope: !92)
!95 = !DILocalVariable(name: "chunkSize", scope: !92, file: !3, line: 60, type: !13)
!96 = !DILocation(line: 60, column: 16, scope: !92)
!97 = !DILocation(line: 60, column: 28, scope: !92)
!98 = !DILocation(line: 60, column: 39, scope: !92)
!99 = !DILocation(line: 63, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !92, file: !3, line: 63, column: 13)
!101 = !DILocation(line: 63, column: 29, scope: !100)
!102 = !DILocation(line: 63, column: 13, scope: !92)
!103 = !DILocation(line: 65, column: 29, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !3, line: 64, column: 9)
!105 = !DILocation(line: 66, column: 9, scope: !104)
!106 = !DILocation(line: 67, column: 16, scope: !92)
!107 = !DILocation(line: 67, column: 9, scope: !92)
!108 = !DILocation(line: 69, column: 16, scope: !92)
!109 = !DILocation(line: 69, column: 9, scope: !92)
!110 = !DILocation(line: 73, column: 5, scope: !71)
!111 = !DILocation(line: 73, column: 12, scope: !71)
!112 = !DILocation(line: 73, column: 23, scope: !71)
!113 = !DILocation(line: 73, column: 28, scope: !71)
!114 = !DILocalVariable(name: "nextNode", scope: !115, file: !3, line: 75, type: !6)
!115 = distinct !DILexicalBlock(scope: !71, file: !3, line: 74, column: 5)
!116 = !DILocation(line: 75, column: 28, scope: !115)
!117 = !DILocation(line: 75, column: 39, scope: !115)
!118 = !DILocation(line: 75, column: 50, scope: !115)
!119 = !DILocation(line: 77, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !3, line: 77, column: 13)
!121 = !DILocation(line: 77, column: 25, scope: !120)
!122 = !DILocation(line: 77, column: 42, scope: !120)
!123 = !DILocation(line: 77, column: 39, scope: !120)
!124 = !DILocation(line: 77, column: 13, scope: !115)
!125 = !DILocalVariable(name: "chunkSize", scope: !126, file: !3, line: 79, type: !13)
!126 = distinct !DILexicalBlock(scope: !120, file: !3, line: 78, column: 9)
!127 = !DILocation(line: 79, column: 20, scope: !126)
!128 = !DILocation(line: 79, column: 32, scope: !126)
!129 = !DILocation(line: 79, column: 44, scope: !126)
!130 = !DILocation(line: 81, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !3, line: 81, column: 16)
!132 = !DILocation(line: 81, column: 27, scope: !131)
!133 = !DILocation(line: 81, column: 35, scope: !131)
!134 = !DILocation(line: 81, column: 32, scope: !131)
!135 = !DILocation(line: 81, column: 16, scope: !126)
!136 = !DILocation(line: 83, column: 35, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !3, line: 82, column: 13)
!138 = !DILocation(line: 83, column: 33, scope: !137)
!139 = !DILocation(line: 84, column: 13, scope: !137)
!140 = !DILocation(line: 85, column: 31, scope: !126)
!141 = !DILocation(line: 85, column: 43, scope: !126)
!142 = !DILocation(line: 85, column: 13, scope: !126)
!143 = !DILocation(line: 85, column: 24, scope: !126)
!144 = !DILocation(line: 85, column: 29, scope: !126)
!145 = !DILocation(line: 86, column: 20, scope: !126)
!146 = !DILocation(line: 86, column: 13, scope: !126)
!147 = !DILocation(line: 88, column: 20, scope: !126)
!148 = !DILocation(line: 88, column: 13, scope: !126)
!149 = !DILocation(line: 91, column: 19, scope: !115)
!150 = !DILocation(line: 91, column: 17, scope: !115)
!151 = distinct !{!151, !110, !152}
!152 = !DILocation(line: 92, column: 5, scope: !71)
!153 = !DILocation(line: 95, column: 5, scope: !71)
!154 = !DILocation(line: 96, column: 1, scope: !71)
!155 = distinct !DISubprogram(name: "customMalloc", scope: !3, file: !3, line: 100, type: !156, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DISubroutineType(types: !157)
!157 = !{!11, !13}
!158 = !DILocalVariable(name: "size", arg: 1, scope: !155, file: !3, line: 100, type: !13)
!159 = !DILocation(line: 100, column: 28, scope: !155)
!160 = !DILocation(line: 103, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !155, file: !3, line: 103, column: 9)
!162 = !DILocation(line: 103, column: 14, scope: !161)
!163 = !DILocation(line: 103, column: 9, scope: !155)
!164 = !DILocation(line: 105, column: 9, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !3, line: 104, column: 5)
!166 = !DILocalVariable(name: "mapped", scope: !155, file: !3, line: 108, type: !11)
!167 = !DILocation(line: 108, column: 12, scope: !155)
!168 = !DILocation(line: 108, column: 32, scope: !155)
!169 = !DILocation(line: 108, column: 21, scope: !155)
!170 = !DILocation(line: 111, column: 20, scope: !155)
!171 = !DILocation(line: 111, column: 28, scope: !155)
!172 = !DILocation(line: 111, column: 5, scope: !155)
!173 = !DILocation(line: 113, column: 12, scope: !155)
!174 = !DILocation(line: 113, column: 5, scope: !155)
!175 = !DILocation(line: 114, column: 1, scope: !155)
!176 = distinct !DISubprogram(name: "customFree", scope: !3, file: !3, line: 117, type: !177, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!177 = !DISubroutineType(types: !178)
!178 = !{null, !11}
!179 = !DILocalVariable(name: "addr", arg: 1, scope: !176, file: !3, line: 117, type: !11)
!180 = !DILocation(line: 117, column: 24, scope: !176)
!181 = !DILocalVariable(name: "size", scope: !176, file: !3, line: 119, type: !13)
!182 = !DILocation(line: 119, column: 12, scope: !176)
!183 = !DILocation(line: 119, column: 37, scope: !176)
!184 = !DILocation(line: 119, column: 19, scope: !176)
!185 = !DILocation(line: 121, column: 12, scope: !176)
!186 = !DILocation(line: 121, column: 18, scope: !176)
!187 = !DILocation(line: 121, column: 5, scope: !176)
!188 = !DILocation(line: 122, column: 1, scope: !176)
!189 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 124, type: !190, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!190 = !DISubroutineType(types: !191)
!191 = !{!192, !192, !193}
!192 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 64)
!194 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !195, size: 64)
!195 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !196)
!196 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!197 = !DILocalVariable(name: "argc", arg: 1, scope: !189, file: !3, line: 124, type: !192)
!198 = !DILocation(line: 124, column: 14, scope: !189)
!199 = !DILocalVariable(name: "argv", arg: 2, scope: !189, file: !3, line: 124, type: !193)
!200 = !DILocation(line: 124, column: 32, scope: !189)
!201 = !DILocalVariable(name: "p1", scope: !189, file: !3, line: 126, type: !202)
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!203 = !DILocation(line: 126, column: 10, scope: !189)
!204 = !DILocation(line: 126, column: 15, scope: !189)
!205 = !DILocalVariable(name: "p2", scope: !189, file: !3, line: 127, type: !202)
!206 = !DILocation(line: 127, column: 10, scope: !189)
!207 = !DILocation(line: 127, column: 15, scope: !189)
!208 = !DILocalVariable(name: "p3", scope: !189, file: !3, line: 128, type: !202)
!209 = !DILocation(line: 128, column: 10, scope: !189)
!210 = !DILocation(line: 128, column: 15, scope: !189)
!211 = !DILocation(line: 130, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !189, file: !3, line: 130, column: 8)
!213 = !DILocation(line: 130, column: 8, scope: !189)
!214 = !DILocalVariable(name: "n", scope: !215, file: !3, line: 131, type: !192)
!215 = distinct !DILexicalBlock(scope: !216, file: !3, line: 131, column: 9)
!216 = distinct !DILexicalBlock(scope: !212, file: !3, line: 130, column: 12)
!217 = !DILocation(line: 131, column: 17, scope: !215)
!218 = !DILocation(line: 131, column: 13, scope: !215)
!219 = !DILocation(line: 131, column: 22, scope: !220)
!220 = distinct !DILexicalBlock(scope: !215, file: !3, line: 131, column: 9)
!221 = !DILocation(line: 131, column: 23, scope: !220)
!222 = !DILocation(line: 131, column: 9, scope: !215)
!223 = !DILocation(line: 132, column: 21, scope: !220)
!224 = !DILocation(line: 132, column: 23, scope: !220)
!225 = !DILocation(line: 132, column: 22, scope: !220)
!226 = !DILocation(line: 132, column: 13, scope: !220)
!227 = !DILocation(line: 132, column: 16, scope: !220)
!228 = !DILocation(line: 132, column: 19, scope: !220)
!229 = !DILocation(line: 131, column: 27, scope: !220)
!230 = !DILocation(line: 131, column: 9, scope: !220)
!231 = distinct !{!231, !222, !232}
!232 = !DILocation(line: 132, column: 23, scope: !215)
!233 = !DILocalVariable(name: "n", scope: !234, file: !3, line: 133, type: !192)
!234 = distinct !DILexicalBlock(scope: !216, file: !3, line: 133, column: 9)
!235 = !DILocation(line: 133, column: 17, scope: !234)
!236 = !DILocation(line: 133, column: 13, scope: !234)
!237 = !DILocation(line: 133, column: 22, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !3, line: 133, column: 9)
!239 = !DILocation(line: 133, column: 23, scope: !238)
!240 = !DILocation(line: 133, column: 9, scope: !234)
!241 = !DILocation(line: 134, column: 38, scope: !238)
!242 = !DILocation(line: 134, column: 41, scope: !238)
!243 = !DILocation(line: 134, column: 44, scope: !238)
!244 = !DILocation(line: 134, column: 13, scope: !238)
!245 = !DILocation(line: 133, column: 27, scope: !238)
!246 = !DILocation(line: 133, column: 9, scope: !238)
!247 = distinct !{!247, !240, !248}
!248 = !DILocation(line: 134, column: 46, scope: !234)
!249 = !DILocation(line: 135, column: 5, scope: !216)
!250 = !DILocation(line: 137, column: 16, scope: !189)
!251 = !DILocation(line: 137, column: 5, scope: !189)
!252 = !DILocation(line: 138, column: 16, scope: !189)
!253 = !DILocation(line: 138, column: 5, scope: !189)
!254 = !DILocation(line: 139, column: 16, scope: !189)
!255 = !DILocation(line: 139, column: 5, scope: !189)
!256 = !DILocation(line: 141, column: 5, scope: !189)
