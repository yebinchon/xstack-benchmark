; ModuleID = 'hofstadter-figure-figure-sequences.c'
source_filename = "hofstadter-figure-figure-sequences.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.xarray = type { i64, i64, i64* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@rs = common dso_local global %struct.xarray zeroinitializer, align 8, !dbg !0
@ss = common dso_local global %struct.xarray zeroinitializer, align 8, !dbg !6
@.str = private unnamed_addr constant [12 x i8] c"R(1 .. 10):\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c" %llu\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [13 x i8] c"%d not seen\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"\0Afirst 1000 ok\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @setsize(%struct.xarray* %a, i64 %size) #0 !dbg !24 {
entry:
  %a.addr = alloca %struct.xarray*, align 8
  %size.addr = alloca i64, align 8
  %n = alloca i64, align 8
  store %struct.xarray* %a, %struct.xarray** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.xarray** %a.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %n, metadata !32, metadata !DIExpression()), !dbg !33
  %0 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !34
  %alloc = getelementptr inbounds %struct.xarray, %struct.xarray* %0, i32 0, i32 1, !dbg !35
  %1 = load i64, i64* %alloc, align 8, !dbg !35
  store i64 %1, i64* %n, align 8, !dbg !33
  %2 = load i64, i64* %n, align 8, !dbg !36
  %tobool = icmp ne i64 %2, 0, !dbg !36
  br i1 %tobool, label %if.end, label %if.then, !dbg !38, !cf.info !39

if.then:                                          ; preds = %entry
  store i64 1, i64* %n, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !42

while.cond:                                       ; preds = %while.body, %if.end
  %3 = load i64, i64* %n, align 8, !dbg !43
  %4 = load i64, i64* %size.addr, align 8, !dbg !44
  %cmp = icmp ult i64 %3, %4, !dbg !45
  br i1 %cmp, label %while.body, label %while.end, !dbg !42

while.body:                                       ; preds = %while.cond
  %5 = load i64, i64* %n, align 8, !dbg !46
  %shl = shl i64 %5, 1, !dbg !46
  store i64 %shl, i64* %n, align 8, !dbg !46
  br label %while.cond, !dbg !42, !llvm.loop !47

while.end:                                        ; preds = %while.cond
  %6 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !49
  %alloc1 = getelementptr inbounds %struct.xarray, %struct.xarray* %6, i32 0, i32 1, !dbg !51
  %7 = load i64, i64* %alloc1, align 8, !dbg !51
  %8 = load i64, i64* %n, align 8, !dbg !52
  %cmp2 = icmp ult i64 %7, %8, !dbg !53
  br i1 %cmp2, label %if.then3, label %if.end10, !dbg !54, !cf.info !39

if.then3:                                         ; preds = %while.end
  %9 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !55
  %buf = getelementptr inbounds %struct.xarray, %struct.xarray* %9, i32 0, i32 2, !dbg !57
  %10 = load i64*, i64** %buf, align 8, !dbg !57
  %11 = bitcast i64* %10 to i8*, !dbg !55
  %12 = load i64, i64* %n, align 8, !dbg !58
  %mul = mul i64 8, %12, !dbg !59
  %call = call i8* @realloc(i8* %11, i64 %mul) #6, !dbg !60
  %13 = bitcast i8* %call to i64*, !dbg !60
  %14 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !61
  %buf4 = getelementptr inbounds %struct.xarray, %struct.xarray* %14, i32 0, i32 2, !dbg !62
  store i64* %13, i64** %buf4, align 8, !dbg !63
  %15 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !64
  %buf5 = getelementptr inbounds %struct.xarray, %struct.xarray* %15, i32 0, i32 2, !dbg !66
  %16 = load i64*, i64** %buf5, align 8, !dbg !66
  %tobool6 = icmp ne i64* %16, null, !dbg !64
  br i1 %tobool6, label %if.end8, label %if.then7, !dbg !67, !cf.info !39

if.then7:                                         ; preds = %if.then3
  call void @abort() #7, !dbg !68
  unreachable, !dbg !68

if.end8:                                          ; preds = %if.then3
  %17 = load i64, i64* %n, align 8, !dbg !69
  %18 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !70
  %alloc9 = getelementptr inbounds %struct.xarray, %struct.xarray* %18, i32 0, i32 1, !dbg !71
  store i64 %17, i64* %alloc9, align 8, !dbg !72
  br label %if.end10, !dbg !73

if.end10:                                         ; preds = %if.end8, %while.end
  ret void, !dbg !74
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @push(%struct.xarray* %a, i64 %v) #0 !dbg !75 {
entry:
  %a.addr = alloca %struct.xarray*, align 8
  %v.addr = alloca i64, align 8
  store %struct.xarray* %a, %struct.xarray** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.xarray** %a.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i64 %v, i64* %v.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %v.addr, metadata !80, metadata !DIExpression()), !dbg !81
  br label %while.cond, !dbg !82

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !83
  %alloc = getelementptr inbounds %struct.xarray, %struct.xarray* %0, i32 0, i32 1, !dbg !84
  %1 = load i64, i64* %alloc, align 8, !dbg !84
  %2 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !85
  %len = getelementptr inbounds %struct.xarray, %struct.xarray* %2, i32 0, i32 0, !dbg !86
  %3 = load i64, i64* %len, align 8, !dbg !86
  %cmp = icmp ule i64 %1, %3, !dbg !87
  br i1 %cmp, label %while.body, label %while.end, !dbg !82

while.body:                                       ; preds = %while.cond
  %4 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !88
  %5 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !89
  %alloc1 = getelementptr inbounds %struct.xarray, %struct.xarray* %5, i32 0, i32 1, !dbg !90
  %6 = load i64, i64* %alloc1, align 8, !dbg !90
  %mul = mul i64 %6, 2, !dbg !91
  call void @setsize(%struct.xarray* %4, i64 %mul), !dbg !92
  br label %while.cond, !dbg !82, !llvm.loop !93

while.end:                                        ; preds = %while.cond
  %7 = load i64, i64* %v.addr, align 8, !dbg !95
  %8 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !96
  %buf = getelementptr inbounds %struct.xarray, %struct.xarray* %8, i32 0, i32 2, !dbg !97
  %9 = load i64*, i64** %buf, align 8, !dbg !97
  %10 = load %struct.xarray*, %struct.xarray** %a.addr, align 8, !dbg !98
  %len2 = getelementptr inbounds %struct.xarray, %struct.xarray* %10, i32 0, i32 0, !dbg !99
  %11 = load i64, i64* %len2, align 8, !dbg !100
  %inc = add i64 %11, 1, !dbg !100
  store i64 %inc, i64* %len2, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 %11, !dbg !96
  store i64 %7, i64* %arrayidx, align 8, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @R(i32 %n) #0 !dbg !103 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !107, metadata !DIExpression()), !dbg !108
  br label %while.cond, !dbg !109

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %n.addr, align 4, !dbg !110
  %conv = sext i32 %0 to i64, !dbg !110
  %1 = load i64, i64* getelementptr inbounds (%struct.xarray, %struct.xarray* @rs, i32 0, i32 0), align 8, !dbg !111
  %cmp = icmp ugt i64 %conv, %1, !dbg !112
  br i1 %cmp, label %while.body, label %while.end, !dbg !109

while.body:                                       ; preds = %while.cond
  call void @RS_append(), !dbg !113
  br label %while.cond, !dbg !109, !llvm.loop !114

while.end:                                        ; preds = %while.cond
  %2 = load i64*, i64** getelementptr inbounds (%struct.xarray, %struct.xarray* @rs, i32 0, i32 2), align 8, !dbg !116
  %3 = load i32, i32* %n.addr, align 4, !dbg !117
  %sub = sub nsw i32 %3, 1, !dbg !118
  %idxprom = sext i32 %sub to i64, !dbg !119
  %arrayidx = getelementptr inbounds i64, i64* %2, i64 %idxprom, !dbg !119
  %4 = load i64, i64* %arrayidx, align 8, !dbg !119
  ret i64 %4, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @RS_append() #0 !dbg !121 {
entry:
  %n = alloca i32, align 4
  %r = alloca i64, align 8
  %s = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %n, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = load i64, i64* getelementptr inbounds (%struct.xarray, %struct.xarray* @rs, i32 0, i32 0), align 8, !dbg !126
  %conv = trunc i64 %0 to i32, !dbg !127
  store i32 %conv, i32* %n, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata i64* %r, metadata !128, metadata !DIExpression()), !dbg !129
  %1 = load i32, i32* %n, align 4, !dbg !130
  %call = call i64 @R(i32 %1), !dbg !131
  %2 = load i32, i32* %n, align 4, !dbg !132
  %call1 = call i64 @S(i32 %2), !dbg !133
  %add = add i64 %call, %call1, !dbg !134
  store i64 %add, i64* %r, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i64* %s, metadata !135, metadata !DIExpression()), !dbg !136
  %3 = load i64, i64* getelementptr inbounds (%struct.xarray, %struct.xarray* @ss, i32 0, i32 0), align 8, !dbg !137
  %conv2 = trunc i64 %3 to i32, !dbg !138
  %call3 = call i64 @S(i32 %conv2), !dbg !139
  store i64 %call3, i64* %s, align 8, !dbg !136
  %4 = load i64, i64* %r, align 8, !dbg !140
  call void @push(%struct.xarray* @rs, i64 %4), !dbg !141
  br label %while.cond, !dbg !142

while.cond:                                       ; preds = %while.body, %entry
  %5 = load i64, i64* %s, align 8, !dbg !143
  %inc = add i64 %5, 1, !dbg !143
  store i64 %inc, i64* %s, align 8, !dbg !143
  %6 = load i64, i64* %r, align 8, !dbg !144
  %cmp = icmp ult i64 %inc, %6, !dbg !145
  br i1 %cmp, label %while.body, label %while.end, !dbg !142

while.body:                                       ; preds = %while.cond
  %7 = load i64, i64* %s, align 8, !dbg !146
  call void @push(%struct.xarray* @ss, i64 %7), !dbg !147
  br label %while.cond, !dbg !142, !llvm.loop !148

while.end:                                        ; preds = %while.cond
  %8 = load i64, i64* %r, align 8, !dbg !150
  %add5 = add i64 %8, 1, !dbg !151
  call void @push(%struct.xarray* @ss, i64 %add5), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @S(i32 %n) #0 !dbg !154 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !155, metadata !DIExpression()), !dbg !156
  br label %while.cond, !dbg !157

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %n.addr, align 4, !dbg !158
  %conv = sext i32 %0 to i64, !dbg !158
  %1 = load i64, i64* getelementptr inbounds (%struct.xarray, %struct.xarray* @ss, i32 0, i32 0), align 8, !dbg !159
  %cmp = icmp ugt i64 %conv, %1, !dbg !160
  br i1 %cmp, label %while.body, label %while.end, !dbg !157

while.body:                                       ; preds = %while.cond
  call void @RS_append(), !dbg !161
  br label %while.cond, !dbg !157, !llvm.loop !162

while.end:                                        ; preds = %while.cond
  %2 = load i64*, i64** getelementptr inbounds (%struct.xarray, %struct.xarray* @ss, i32 0, i32 2), align 8, !dbg !164
  %3 = load i32, i32* %n.addr, align 4, !dbg !165
  %sub = sub nsw i32 %3, 1, !dbg !166
  %idxprom = sext i32 %sub to i64, !dbg !167
  %arrayidx = getelementptr inbounds i64, i64* %2, i64 %idxprom, !dbg !167
  %4 = load i64, i64* %arrayidx, align 8, !dbg !167
  ret i64 %4, !dbg !168
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !169 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %seen = alloca [1001 x i8], align 16
  store i32 0, i32* %retval, align 4
  call void @push(%struct.xarray* @rs, i64 1), !dbg !172
  call void @push(%struct.xarray* @ss, i64 2), !dbg !173
  call void @llvm.dbg.declare(metadata i32* %i, metadata !174, metadata !DIExpression()), !dbg !175
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0)), !dbg !176
  store i32 1, i32* %i, align 4, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !180
  %cmp = icmp sle i32 %0, 10, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !184
  %call1 = call i64 @R(i32 %1), !dbg !185
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %call1), !dbg !186
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !187
  %inc = add nsw i32 %2, 1, !dbg !187
  store i32 %inc, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [1001 x i8]* %seen, metadata !191, metadata !DIExpression()), !dbg !196
  %3 = bitcast [1001 x i8]* %seen to i8*, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 1001, i1 false), !dbg !196
  store i32 1, i32* %i, align 4, !dbg !197
  br label %for.cond3, !dbg !199

for.cond3:                                        ; preds = %for.inc7, %for.end
  %4 = load i32, i32* %i, align 4, !dbg !200
  %cmp4 = icmp sle i32 %4, 40, !dbg !202
  br i1 %cmp4, label %for.body5, label %for.end9, !dbg !203

for.body5:                                        ; preds = %for.cond3
  %5 = load i32, i32* %i, align 4, !dbg !204
  %call6 = call i64 @R(i32 %5), !dbg !205
  %arrayidx = getelementptr inbounds [1001 x i8], [1001 x i8]* %seen, i64 0, i64 %call6, !dbg !206
  store i8 1, i8* %arrayidx, align 1, !dbg !207
  br label %for.inc7, !dbg !206

for.inc7:                                         ; preds = %for.body5
  %6 = load i32, i32* %i, align 4, !dbg !208
  %inc8 = add nsw i32 %6, 1, !dbg !208
  store i32 %inc8, i32* %i, align 4, !dbg !208
  br label %for.cond3, !dbg !209, !llvm.loop !210

for.end9:                                         ; preds = %for.cond3
  store i32 1, i32* %i, align 4, !dbg !212
  br label %for.cond10, !dbg !214

for.cond10:                                       ; preds = %for.inc15, %for.end9
  %7 = load i32, i32* %i, align 4, !dbg !215
  %cmp11 = icmp sle i32 %7, 960, !dbg !217
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !218

for.body12:                                       ; preds = %for.cond10
  %8 = load i32, i32* %i, align 4, !dbg !219
  %call13 = call i64 @S(i32 %8), !dbg !220
  %arrayidx14 = getelementptr inbounds [1001 x i8], [1001 x i8]* %seen, i64 0, i64 %call13, !dbg !221
  store i8 1, i8* %arrayidx14, align 1, !dbg !222
  br label %for.inc15, !dbg !221

for.inc15:                                        ; preds = %for.body12
  %9 = load i32, i32* %i, align 4, !dbg !223
  %inc16 = add nsw i32 %9, 1, !dbg !223
  store i32 %inc16, i32* %i, align 4, !dbg !223
  br label %for.cond10, !dbg !224, !llvm.loop !225

for.end17:                                        ; preds = %for.cond10
  store i32 1, i32* %i, align 4, !dbg !227
  br label %for.cond18, !dbg !229

for.cond18:                                       ; preds = %for.inc22, %for.end17
  %10 = load i32, i32* %i, align 4, !dbg !230
  %cmp19 = icmp sle i32 %10, 1000, !dbg !232
  br i1 %cmp19, label %land.rhs, label %land.end, !dbg !233

land.rhs:                                         ; preds = %for.cond18
  %11 = load i32, i32* %i, align 4, !dbg !234
  %idxprom = sext i32 %11 to i64, !dbg !235
  %arrayidx20 = getelementptr inbounds [1001 x i8], [1001 x i8]* %seen, i64 0, i64 %idxprom, !dbg !235
  %12 = load i8, i8* %arrayidx20, align 1, !dbg !235
  %conv = sext i8 %12 to i32, !dbg !235
  %tobool = icmp ne i32 %conv, 0, !dbg !233
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond18
  %13 = phi i1 [ false, %for.cond18 ], [ %tobool, %land.rhs ], !dbg !236
  br i1 %13, label %for.body21, label %for.end24, !dbg !237

for.body21:                                       ; preds = %land.end
  br label %for.inc22, !dbg !237

for.inc22:                                        ; preds = %for.body21
  %14 = load i32, i32* %i, align 4, !dbg !238
  %inc23 = add nsw i32 %14, 1, !dbg !238
  store i32 %inc23, i32* %i, align 4, !dbg !238
  br label %for.cond18, !dbg !239, !llvm.loop !240

for.end24:                                        ; preds = %land.end
  %15 = load i32, i32* %i, align 4, !dbg !242
  %cmp25 = icmp sle i32 %15, 1000, !dbg !244
  br i1 %cmp25, label %if.then, label %if.end, !dbg !245, !cf.info !39

if.then:                                          ; preds = %for.end24
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !246
  %17 = load i32, i32* %i, align 4, !dbg !248
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 %17), !dbg !249
  call void @abort() #7, !dbg !250
  unreachable, !dbg !250

if.end:                                           ; preds = %for.end24
  %call28 = call i32 @puts(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !251
  ret i32 0, !dbg !252
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

declare dso_local i32 @puts(i8*) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "rs", scope: !2, file: !3, line: 12, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "hofstadter-figure-figure-sequences.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Hofstadter-Figure-Figure-sequences")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "ss", scope: !2, file: !3, line: 12, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "xarray", file: !3, line: 10, baseType: !9)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 7, size: 192, elements: !10)
!10 = !{!11, !15, !16}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !9, file: !3, line: 8, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !13, line: 46, baseType: !14)
!13 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!14 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "alloc", scope: !9, file: !3, line: 8, baseType: !12, size: 64, offset: 64)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "buf", scope: !9, file: !3, line: 9, baseType: !17, size: 64, offset: 128)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "xint", file: !3, line: 5, baseType: !19)
!19 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!24 = distinct !DISubprogram(name: "setsize", scope: !3, file: !3, line: 14, type: !25, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !27, !12}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!28 = !DILocalVariable(name: "a", arg: 1, scope: !24, file: !3, line: 14, type: !27)
!29 = !DILocation(line: 14, column: 22, scope: !24)
!30 = !DILocalVariable(name: "size", arg: 2, scope: !24, file: !3, line: 14, type: !12)
!31 = !DILocation(line: 14, column: 32, scope: !24)
!32 = !DILocalVariable(name: "n", scope: !24, file: !3, line: 16, type: !12)
!33 = !DILocation(line: 16, column: 9, scope: !24)
!34 = !DILocation(line: 16, column: 13, scope: !24)
!35 = !DILocation(line: 16, column: 16, scope: !24)
!36 = !DILocation(line: 17, column: 7, scope: !37)
!37 = distinct !DILexicalBlock(scope: !24, file: !3, line: 17, column: 6)
!38 = !DILocation(line: 17, column: 6, scope: !24)
!39 = !{!"if"}
!40 = !DILocation(line: 17, column: 12, scope: !37)
!41 = !DILocation(line: 17, column: 10, scope: !37)
!42 = !DILocation(line: 19, column: 2, scope: !24)
!43 = !DILocation(line: 19, column: 9, scope: !24)
!44 = !DILocation(line: 19, column: 13, scope: !24)
!45 = !DILocation(line: 19, column: 11, scope: !24)
!46 = !DILocation(line: 19, column: 21, scope: !24)
!47 = distinct !{!47, !42, !48}
!48 = !DILocation(line: 19, column: 25, scope: !24)
!49 = !DILocation(line: 20, column: 6, scope: !50)
!50 = distinct !DILexicalBlock(scope: !24, file: !3, line: 20, column: 6)
!51 = !DILocation(line: 20, column: 9, scope: !50)
!52 = !DILocation(line: 20, column: 17, scope: !50)
!53 = !DILocation(line: 20, column: 15, scope: !50)
!54 = !DILocation(line: 20, column: 6, scope: !24)
!55 = !DILocation(line: 21, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !3, line: 20, column: 20)
!57 = !DILocation(line: 21, column: 23, scope: !56)
!58 = !DILocation(line: 21, column: 43, scope: !56)
!59 = !DILocation(line: 21, column: 41, scope: !56)
!60 = !DILocation(line: 21, column: 12, scope: !56)
!61 = !DILocation(line: 21, column: 3, scope: !56)
!62 = !DILocation(line: 21, column: 6, scope: !56)
!63 = !DILocation(line: 21, column: 10, scope: !56)
!64 = !DILocation(line: 22, column: 8, scope: !65)
!65 = distinct !DILexicalBlock(scope: !56, file: !3, line: 22, column: 7)
!66 = !DILocation(line: 22, column: 11, scope: !65)
!67 = !DILocation(line: 22, column: 7, scope: !56)
!68 = !DILocation(line: 22, column: 16, scope: !65)
!69 = !DILocation(line: 23, column: 14, scope: !56)
!70 = !DILocation(line: 23, column: 3, scope: !56)
!71 = !DILocation(line: 23, column: 6, scope: !56)
!72 = !DILocation(line: 23, column: 12, scope: !56)
!73 = !DILocation(line: 24, column: 2, scope: !56)
!74 = !DILocation(line: 25, column: 1, scope: !24)
!75 = distinct !DISubprogram(name: "push", scope: !3, file: !3, line: 27, type: !76, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{null, !27, !18}
!78 = !DILocalVariable(name: "a", arg: 1, scope: !75, file: !3, line: 27, type: !27)
!79 = !DILocation(line: 27, column: 19, scope: !75)
!80 = !DILocalVariable(name: "v", arg: 2, scope: !75, file: !3, line: 27, type: !18)
!81 = !DILocation(line: 27, column: 27, scope: !75)
!82 = !DILocation(line: 29, column: 2, scope: !75)
!83 = !DILocation(line: 29, column: 9, scope: !75)
!84 = !DILocation(line: 29, column: 12, scope: !75)
!85 = !DILocation(line: 29, column: 21, scope: !75)
!86 = !DILocation(line: 29, column: 24, scope: !75)
!87 = !DILocation(line: 29, column: 18, scope: !75)
!88 = !DILocation(line: 30, column: 11, scope: !75)
!89 = !DILocation(line: 30, column: 14, scope: !75)
!90 = !DILocation(line: 30, column: 17, scope: !75)
!91 = !DILocation(line: 30, column: 23, scope: !75)
!92 = !DILocation(line: 30, column: 3, scope: !75)
!93 = distinct !{!93, !82, !94}
!94 = !DILocation(line: 30, column: 26, scope: !75)
!95 = !DILocation(line: 32, column: 21, scope: !75)
!96 = !DILocation(line: 32, column: 2, scope: !75)
!97 = !DILocation(line: 32, column: 5, scope: !75)
!98 = !DILocation(line: 32, column: 9, scope: !75)
!99 = !DILocation(line: 32, column: 12, scope: !75)
!100 = !DILocation(line: 32, column: 15, scope: !75)
!101 = !DILocation(line: 32, column: 19, scope: !75)
!102 = !DILocation(line: 33, column: 1, scope: !75)
!103 = distinct !DISubprogram(name: "R", scope: !3, file: !3, line: 39, type: !104, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DISubroutineType(types: !105)
!105 = !{!18, !106}
!106 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!107 = !DILocalVariable(name: "n", arg: 1, scope: !103, file: !3, line: 39, type: !106)
!108 = !DILocation(line: 39, column: 12, scope: !103)
!109 = !DILocation(line: 41, column: 2, scope: !103)
!110 = !DILocation(line: 41, column: 9, scope: !103)
!111 = !DILocation(line: 41, column: 16, scope: !103)
!112 = !DILocation(line: 41, column: 11, scope: !103)
!113 = !DILocation(line: 41, column: 21, scope: !103)
!114 = distinct !{!114, !109, !115}
!115 = !DILocation(line: 41, column: 31, scope: !103)
!116 = !DILocation(line: 42, column: 12, scope: !103)
!117 = !DILocation(line: 42, column: 16, scope: !103)
!118 = !DILocation(line: 42, column: 18, scope: !103)
!119 = !DILocation(line: 42, column: 9, scope: !103)
!120 = !DILocation(line: 42, column: 2, scope: !103)
!121 = distinct !DISubprogram(name: "RS_append", scope: !3, file: !3, line: 51, type: !122, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DISubroutineType(types: !123)
!123 = !{null}
!124 = !DILocalVariable(name: "n", scope: !121, file: !3, line: 53, type: !106)
!125 = !DILocation(line: 53, column: 6, scope: !121)
!126 = !DILocation(line: 53, column: 13, scope: !121)
!127 = !DILocation(line: 53, column: 10, scope: !121)
!128 = !DILocalVariable(name: "r", scope: !121, file: !3, line: 54, type: !18)
!129 = !DILocation(line: 54, column: 7, scope: !121)
!130 = !DILocation(line: 54, column: 13, scope: !121)
!131 = !DILocation(line: 54, column: 11, scope: !121)
!132 = !DILocation(line: 54, column: 20, scope: !121)
!133 = !DILocation(line: 54, column: 18, scope: !121)
!134 = !DILocation(line: 54, column: 16, scope: !121)
!135 = !DILocalVariable(name: "s", scope: !121, file: !3, line: 55, type: !18)
!136 = !DILocation(line: 55, column: 7, scope: !121)
!137 = !DILocation(line: 55, column: 16, scope: !121)
!138 = !DILocation(line: 55, column: 13, scope: !121)
!139 = !DILocation(line: 55, column: 11, scope: !121)
!140 = !DILocation(line: 57, column: 12, scope: !121)
!141 = !DILocation(line: 57, column: 2, scope: !121)
!142 = !DILocation(line: 58, column: 2, scope: !121)
!143 = !DILocation(line: 58, column: 9, scope: !121)
!144 = !DILocation(line: 58, column: 15, scope: !121)
!145 = !DILocation(line: 58, column: 13, scope: !121)
!146 = !DILocation(line: 58, column: 28, scope: !121)
!147 = !DILocation(line: 58, column: 18, scope: !121)
!148 = distinct !{!148, !142, !149}
!149 = !DILocation(line: 58, column: 29, scope: !121)
!150 = !DILocation(line: 59, column: 12, scope: !121)
!151 = !DILocation(line: 59, column: 14, scope: !121)
!152 = !DILocation(line: 59, column: 2, scope: !121)
!153 = !DILocation(line: 60, column: 1, scope: !121)
!154 = distinct !DISubprogram(name: "S", scope: !3, file: !3, line: 45, type: !104, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocalVariable(name: "n", arg: 1, scope: !154, file: !3, line: 45, type: !106)
!156 = !DILocation(line: 45, column: 12, scope: !154)
!157 = !DILocation(line: 47, column: 2, scope: !154)
!158 = !DILocation(line: 47, column: 9, scope: !154)
!159 = !DILocation(line: 47, column: 16, scope: !154)
!160 = !DILocation(line: 47, column: 11, scope: !154)
!161 = !DILocation(line: 47, column: 21, scope: !154)
!162 = distinct !{!162, !157, !163}
!163 = !DILocation(line: 47, column: 31, scope: !154)
!164 = !DILocation(line: 48, column: 12, scope: !154)
!165 = !DILocation(line: 48, column: 16, scope: !154)
!166 = !DILocation(line: 48, column: 18, scope: !154)
!167 = !DILocation(line: 48, column: 9, scope: !154)
!168 = !DILocation(line: 48, column: 2, scope: !154)
!169 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 62, type: !170, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!170 = !DISubroutineType(types: !171)
!171 = !{!106}
!172 = !DILocation(line: 64, column: 2, scope: !169)
!173 = !DILocation(line: 65, column: 2, scope: !169)
!174 = !DILocalVariable(name: "i", scope: !169, file: !3, line: 67, type: !106)
!175 = !DILocation(line: 67, column: 6, scope: !169)
!176 = !DILocation(line: 68, column: 2, scope: !169)
!177 = !DILocation(line: 69, column: 9, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !3, line: 69, column: 2)
!179 = !DILocation(line: 69, column: 7, scope: !178)
!180 = !DILocation(line: 69, column: 14, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !3, line: 69, column: 2)
!182 = !DILocation(line: 69, column: 16, scope: !181)
!183 = !DILocation(line: 69, column: 2, scope: !178)
!184 = !DILocation(line: 70, column: 21, scope: !181)
!185 = !DILocation(line: 70, column: 19, scope: !181)
!186 = !DILocation(line: 70, column: 3, scope: !181)
!187 = !DILocation(line: 69, column: 24, scope: !181)
!188 = !DILocation(line: 69, column: 2, scope: !181)
!189 = distinct !{!189, !183, !190}
!190 = !DILocation(line: 70, column: 23, scope: !178)
!191 = !DILocalVariable(name: "seen", scope: !169, file: !3, line: 72, type: !192)
!192 = !DICompositeType(tag: DW_TAG_array_type, baseType: !193, size: 8008, elements: !194)
!193 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!194 = !{!195}
!195 = !DISubrange(count: 1001)
!196 = !DILocation(line: 72, column: 7, scope: !169)
!197 = !DILocation(line: 73, column: 9, scope: !198)
!198 = distinct !DILexicalBlock(scope: !169, file: !3, line: 73, column: 2)
!199 = !DILocation(line: 73, column: 7, scope: !198)
!200 = !DILocation(line: 73, column: 14, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !3, line: 73, column: 2)
!202 = !DILocation(line: 73, column: 16, scope: !201)
!203 = !DILocation(line: 73, column: 2, scope: !198)
!204 = !DILocation(line: 73, column: 37, scope: !201)
!205 = !DILocation(line: 73, column: 35, scope: !201)
!206 = !DILocation(line: 73, column: 29, scope: !201)
!207 = !DILocation(line: 73, column: 42, scope: !201)
!208 = !DILocation(line: 73, column: 25, scope: !201)
!209 = !DILocation(line: 73, column: 2, scope: !201)
!210 = distinct !{!210, !203, !211}
!211 = !DILocation(line: 73, column: 44, scope: !198)
!212 = !DILocation(line: 74, column: 9, scope: !213)
!213 = distinct !DILexicalBlock(scope: !169, file: !3, line: 74, column: 2)
!214 = !DILocation(line: 74, column: 7, scope: !213)
!215 = !DILocation(line: 74, column: 14, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !3, line: 74, column: 2)
!217 = !DILocation(line: 74, column: 16, scope: !216)
!218 = !DILocation(line: 74, column: 2, scope: !213)
!219 = !DILocation(line: 74, column: 37, scope: !216)
!220 = !DILocation(line: 74, column: 35, scope: !216)
!221 = !DILocation(line: 74, column: 29, scope: !216)
!222 = !DILocation(line: 74, column: 42, scope: !216)
!223 = !DILocation(line: 74, column: 25, scope: !216)
!224 = !DILocation(line: 74, column: 2, scope: !216)
!225 = distinct !{!225, !218, !226}
!226 = !DILocation(line: 74, column: 44, scope: !213)
!227 = !DILocation(line: 75, column: 9, scope: !228)
!228 = distinct !DILexicalBlock(scope: !169, file: !3, line: 75, column: 2)
!229 = !DILocation(line: 75, column: 7, scope: !228)
!230 = !DILocation(line: 75, column: 14, scope: !231)
!231 = distinct !DILexicalBlock(scope: !228, file: !3, line: 75, column: 2)
!232 = !DILocation(line: 75, column: 16, scope: !231)
!233 = !DILocation(line: 75, column: 24, scope: !231)
!234 = !DILocation(line: 75, column: 32, scope: !231)
!235 = !DILocation(line: 75, column: 27, scope: !231)
!236 = !DILocation(line: 0, scope: !231)
!237 = !DILocation(line: 75, column: 2, scope: !228)
!238 = !DILocation(line: 75, column: 37, scope: !231)
!239 = !DILocation(line: 75, column: 2, scope: !231)
!240 = distinct !{!240, !237, !241}
!241 = !DILocation(line: 75, column: 40, scope: !228)
!242 = !DILocation(line: 77, column: 6, scope: !243)
!243 = distinct !DILexicalBlock(scope: !169, file: !3, line: 77, column: 6)
!244 = !DILocation(line: 77, column: 8, scope: !243)
!245 = !DILocation(line: 77, column: 6, scope: !169)
!246 = !DILocation(line: 78, column: 11, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !3, line: 77, column: 17)
!248 = !DILocation(line: 78, column: 36, scope: !247)
!249 = !DILocation(line: 78, column: 3, scope: !247)
!250 = !DILocation(line: 79, column: 3, scope: !247)
!251 = !DILocation(line: 82, column: 2, scope: !169)
!252 = !DILocation(line: 83, column: 2, scope: !169)
