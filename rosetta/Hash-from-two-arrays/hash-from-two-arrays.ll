; ModuleID = 'hash-from-two-arrays.c'
source_filename = "hash-from-two-arrays.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.he = type { %struct.sHme*, %struct.sHme* }
%struct.sHme = type { i8*, i32, %struct.sHme* }

@hash = common dso_local global [4096 x %struct.he] zeroinitializer, align 16, !dbg !0
@main.keyList = internal global [6 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0)], align 16, !dbg !8
@.str = private unnamed_addr constant [4 x i8] c"red\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"orange\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"yellow\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"green\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"blue\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"violet\00", align 1
@main.valuList = internal global [6 x i32] [i32 1, i32 43, i32 640, i32 747, i32 42, i32 42], align 16, !dbg !20

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @strhashkey(i8* %key, i32 %max) #0 !dbg !42 {
entry:
  %key.addr = alloca i8*, align 8
  %max.addr = alloca i32, align 4
  %h = alloca i32, align 4
  %hl = alloca i32, align 4
  %hr = alloca i32, align 4
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 %max, i32* %max.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max.addr, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %h, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 0, i32* %h, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata i32* %hl, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %hr, metadata !54, metadata !DIExpression()), !dbg !55
  br label %while.cond, !dbg !56

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i8*, i8** %key.addr, align 8, !dbg !57
  %1 = load i8, i8* %0, align 1, !dbg !58
  %tobool = icmp ne i8 %1, 0, !dbg !56
  br i1 %tobool, label %while.body, label %while.end, !dbg !56

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %key.addr, align 8, !dbg !59
  %3 = load i8, i8* %2, align 1, !dbg !61
  %conv = sext i8 %3 to i32, !dbg !61
  %4 = load i32, i32* %h, align 4, !dbg !62
  %add = add i32 %4, %conv, !dbg !62
  store i32 %add, i32* %h, align 4, !dbg !62
  %5 = load i32, i32* %h, align 4, !dbg !63
  %and = and i32 %5, -1048576, !dbg !64
  %shr = lshr i32 %and, 18, !dbg !65
  %xor = xor i32 1477, %shr, !dbg !66
  store i32 %xor, i32* %hl, align 4, !dbg !67
  %6 = load i32, i32* %h, align 4, !dbg !68
  %and1 = and i32 %6, 1048575, !dbg !69
  store i32 %and1, i32* %hr, align 4, !dbg !70
  %7 = load i32, i32* %hl, align 4, !dbg !71
  %8 = load i32, i32* %hr, align 4, !dbg !72
  %xor2 = xor i32 %7, %8, !dbg !73
  %9 = load i8*, i8** %key.addr, align 8, !dbg !74
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1, !dbg !74
  store i8* %incdec.ptr, i8** %key.addr, align 8, !dbg !74
  %10 = load i8, i8* %9, align 1, !dbg !75
  %conv3 = sext i8 %10 to i32, !dbg !75
  %xor4 = xor i32 %xor2, %conv3, !dbg !76
  store i32 %xor4, i32* %h, align 4, !dbg !77
  br label %while.cond, !dbg !56, !llvm.loop !78

while.end:                                        ; preds = %while.cond
  %11 = load i32, i32* %h, align 4, !dbg !80
  %12 = load i32, i32* %max.addr, align 4, !dbg !81
  %rem = urem i32 %11, %12, !dbg !82
  ret i32 %rem, !dbg !83
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @HashAddH(i8* %key, i32 %value, void (i8**, i8*)* %copyKey, void (i32*, i32)* %copyVal, i32 (i8*, i32)* %hashKey, i32 (i8*, i8*)* %keySame) #0 !dbg !84 {
entry:
  %key.addr = alloca i8*, align 8
  %value.addr = alloca i32, align 4
  %copyKey.addr = alloca void (i8**, i8*)*, align 8
  %copyVal.addr = alloca void (i32*, i32)*, align 8
  %hashKey.addr = alloca i32 (i8*, i32)*, align 8
  %keySame.addr = alloca i32 (i8*, i8*)*, align 8
  %hix = alloca i32, align 4
  %m_ent = alloca %struct.sHme*, align 8
  %last = alloca %struct.sHme*, align 8
  %hme = alloca %struct.sHme*, align 8
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store void (i8**, i8*)* %copyKey, void (i8**, i8*)** %copyKey.addr, align 8
  call void @llvm.dbg.declare(metadata void (i8**, i8*)** %copyKey.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store void (i32*, i32)* %copyVal, void (i32*, i32)** %copyVal.addr, align 8
  call void @llvm.dbg.declare(metadata void (i32*, i32)** %copyVal.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 (i8*, i32)* %hashKey, i32 (i8*, i32)** %hashKey.addr, align 8
  call void @llvm.dbg.declare(metadata i32 (i8*, i32)** %hashKey.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 (i8*, i8*)* %keySame, i32 (i8*, i8*)** %keySame.addr, align 8
  call void @llvm.dbg.declare(metadata i32 (i8*, i8*)** %keySame.addr, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32* %hix, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32 (i8*, i32)*, i32 (i8*, i32)** %hashKey.addr, align 8, !dbg !117
  %1 = load i8*, i8** %key.addr, align 8, !dbg !118
  %call = call i32 %0(i8* %1, i32 4096), !dbg !119
  store i32 %call, i32* %hix, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata %struct.sHme** %m_ent, metadata !120, metadata !DIExpression()), !dbg !121
  %2 = load i32, i32* %hix, align 4, !dbg !122
  %idxprom = zext i32 %2 to i64, !dbg !124
  %arrayidx = getelementptr inbounds [4096 x %struct.he], [4096 x %struct.he]* @hash, i64 0, i64 %idxprom, !dbg !124
  %first = getelementptr inbounds %struct.he, %struct.he* %arrayidx, i32 0, i32 0, !dbg !125
  %3 = load %struct.sHme*, %struct.sHme** %first, align 16, !dbg !125
  store %struct.sHme* %3, %struct.sHme** %m_ent, align 8, !dbg !126
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !128
  %tobool = icmp ne %struct.sHme* %4, null, !dbg !128
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !130

land.rhs:                                         ; preds = %for.cond
  %5 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %keySame.addr, align 8, !dbg !131
  %6 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !132
  %key1 = getelementptr inbounds %struct.sHme, %struct.sHme* %6, i32 0, i32 0, !dbg !133
  %7 = load i8*, i8** %key1, align 8, !dbg !133
  %8 = load i8*, i8** %key.addr, align 8, !dbg !134
  %call2 = call i32 %5(i8* %7, i8* %8), !dbg !135
  %tobool3 = icmp ne i32 %call2, 0, !dbg !136
  %lnot = xor i1 %tobool3, true, !dbg !136
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %9 = phi i1 [ false, %for.cond ], [ %lnot, %land.rhs ], !dbg !137
  br i1 %9, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %land.end
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %10 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !139
  %link = getelementptr inbounds %struct.sHme, %struct.sHme* %10, i32 0, i32 2, !dbg !140
  %11 = load %struct.sHme*, %struct.sHme** %link, align 8, !dbg !140
  store %struct.sHme* %11, %struct.sHme** %m_ent, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %land.end
  %12 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !145
  %tobool4 = icmp ne %struct.sHme* %12, null, !dbg !145
  br i1 %tobool4, label %if.then, label %if.else, !dbg !147, !cf.info !148

if.then:                                          ; preds = %for.end
  %13 = load void (i32*, i32)*, void (i32*, i32)** %copyVal.addr, align 8, !dbg !149
  %14 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !151
  %value5 = getelementptr inbounds %struct.sHme, %struct.sHme* %14, i32 0, i32 1, !dbg !152
  %15 = load i32, i32* %value.addr, align 4, !dbg !153
  call void %13(i32* %value5, i32 %15), !dbg !154
  br label %if.end23, !dbg !155

if.else:                                          ; preds = %for.end
  call void @llvm.dbg.declare(metadata %struct.sHme** %last, metadata !156, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata %struct.sHme** %hme, metadata !159, metadata !DIExpression()), !dbg !160
  %call6 = call noalias i8* @malloc(i64 24) #4, !dbg !161
  %16 = bitcast i8* %call6 to %struct.sHme*, !dbg !161
  store %struct.sHme* %16, %struct.sHme** %hme, align 8, !dbg !160
  %17 = load void (i8**, i8*)*, void (i8**, i8*)** %copyKey.addr, align 8, !dbg !162
  %18 = load %struct.sHme*, %struct.sHme** %hme, align 8, !dbg !163
  %key7 = getelementptr inbounds %struct.sHme, %struct.sHme* %18, i32 0, i32 0, !dbg !164
  %19 = load i8*, i8** %key.addr, align 8, !dbg !165
  call void %17(i8** %key7, i8* %19), !dbg !166
  %20 = load void (i32*, i32)*, void (i32*, i32)** %copyVal.addr, align 8, !dbg !167
  %21 = load %struct.sHme*, %struct.sHme** %hme, align 8, !dbg !168
  %value8 = getelementptr inbounds %struct.sHme, %struct.sHme* %21, i32 0, i32 1, !dbg !169
  %22 = load i32, i32* %value.addr, align 4, !dbg !170
  call void %20(i32* %value8, i32 %22), !dbg !171
  %23 = load %struct.sHme*, %struct.sHme** %hme, align 8, !dbg !172
  %link9 = getelementptr inbounds %struct.sHme, %struct.sHme* %23, i32 0, i32 2, !dbg !173
  store %struct.sHme* null, %struct.sHme** %link9, align 8, !dbg !174
  %24 = load i32, i32* %hix, align 4, !dbg !175
  %idxprom10 = zext i32 %24 to i64, !dbg !176
  %arrayidx11 = getelementptr inbounds [4096 x %struct.he], [4096 x %struct.he]* @hash, i64 0, i64 %idxprom10, !dbg !176
  %last12 = getelementptr inbounds %struct.he, %struct.he* %arrayidx11, i32 0, i32 1, !dbg !177
  %25 = load %struct.sHme*, %struct.sHme** %last12, align 8, !dbg !177
  store %struct.sHme* %25, %struct.sHme** %last, align 8, !dbg !178
  %26 = load %struct.sHme*, %struct.sHme** %last, align 8, !dbg !179
  %tobool13 = icmp ne %struct.sHme* %26, null, !dbg !179
  br i1 %tobool13, label %if.then14, label %if.else16, !dbg !181, !cf.info !148

if.then14:                                        ; preds = %if.else
  %27 = load %struct.sHme*, %struct.sHme** %hme, align 8, !dbg !182
  %28 = load %struct.sHme*, %struct.sHme** %last, align 8, !dbg !184
  %link15 = getelementptr inbounds %struct.sHme, %struct.sHme* %28, i32 0, i32 2, !dbg !185
  store %struct.sHme* %27, %struct.sHme** %link15, align 8, !dbg !186
  br label %if.end, !dbg !187

if.else16:                                        ; preds = %if.else
  %29 = load %struct.sHme*, %struct.sHme** %hme, align 8, !dbg !188
  %30 = load i32, i32* %hix, align 4, !dbg !189
  %idxprom17 = zext i32 %30 to i64, !dbg !190
  %arrayidx18 = getelementptr inbounds [4096 x %struct.he], [4096 x %struct.he]* @hash, i64 0, i64 %idxprom17, !dbg !190
  %first19 = getelementptr inbounds %struct.he, %struct.he* %arrayidx18, i32 0, i32 0, !dbg !191
  store %struct.sHme* %29, %struct.sHme** %first19, align 16, !dbg !192
  br label %if.end

if.end:                                           ; preds = %if.else16, %if.then14
  %31 = load %struct.sHme*, %struct.sHme** %hme, align 8, !dbg !193
  %32 = load i32, i32* %hix, align 4, !dbg !194
  %idxprom20 = zext i32 %32 to i64, !dbg !195
  %arrayidx21 = getelementptr inbounds [4096 x %struct.he], [4096 x %struct.he]* @hash, i64 0, i64 %idxprom20, !dbg !195
  %last22 = getelementptr inbounds %struct.he, %struct.he* %arrayidx21, i32 0, i32 1, !dbg !196
  store %struct.sHme* %31, %struct.sHme** %last22, align 8, !dbg !197
  br label %if.end23

if.end23:                                         ; preds = %if.end, %if.then
  ret void, !dbg !198
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @HashGetH(i32* %val, i8* %key, i32 (i8*, i32)* %hashKey, i32 (i8*, i8*)* %keySame) #0 !dbg !199 {
entry:
  %val.addr = alloca i32*, align 8
  %key.addr = alloca i8*, align 8
  %hashKey.addr = alloca i32 (i8*, i32)*, align 8
  %keySame.addr = alloca i32 (i8*, i8*)*, align 8
  %hix = alloca i32, align 4
  %m_ent = alloca %struct.sHme*, align 8
  store i32* %val, i32** %val.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %val.addr, metadata !202, metadata !DIExpression()), !dbg !203
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 (i8*, i32)* %hashKey, i32 (i8*, i32)** %hashKey.addr, align 8
  call void @llvm.dbg.declare(metadata i32 (i8*, i32)** %hashKey.addr, metadata !206, metadata !DIExpression()), !dbg !207
  store i32 (i8*, i8*)* %keySame, i32 (i8*, i8*)** %keySame.addr, align 8
  call void @llvm.dbg.declare(metadata i32 (i8*, i8*)** %keySame.addr, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata i32* %hix, metadata !210, metadata !DIExpression()), !dbg !211
  %0 = load i32 (i8*, i32)*, i32 (i8*, i32)** %hashKey.addr, align 8, !dbg !212
  %1 = load i8*, i8** %key.addr, align 8, !dbg !213
  %call = call i32 %0(i8* %1, i32 4096), !dbg !214
  store i32 %call, i32* %hix, align 4, !dbg !211
  call void @llvm.dbg.declare(metadata %struct.sHme** %m_ent, metadata !215, metadata !DIExpression()), !dbg !216
  %2 = load i32, i32* %hix, align 4, !dbg !217
  %idxprom = zext i32 %2 to i64, !dbg !219
  %arrayidx = getelementptr inbounds [4096 x %struct.he], [4096 x %struct.he]* @hash, i64 0, i64 %idxprom, !dbg !219
  %first = getelementptr inbounds %struct.he, %struct.he* %arrayidx, i32 0, i32 0, !dbg !220
  %3 = load %struct.sHme*, %struct.sHme** %first, align 16, !dbg !220
  store %struct.sHme* %3, %struct.sHme** %m_ent, align 8, !dbg !221
  br label %for.cond, !dbg !222

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !223
  %tobool = icmp ne %struct.sHme* %4, null, !dbg !223
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !225

land.rhs:                                         ; preds = %for.cond
  %5 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %keySame.addr, align 8, !dbg !226
  %6 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !227
  %key1 = getelementptr inbounds %struct.sHme, %struct.sHme* %6, i32 0, i32 0, !dbg !228
  %7 = load i8*, i8** %key1, align 8, !dbg !228
  %8 = load i8*, i8** %key.addr, align 8, !dbg !229
  %call2 = call i32 %5(i8* %7, i8* %8), !dbg !230
  %tobool3 = icmp ne i32 %call2, 0, !dbg !231
  %lnot = xor i1 %tobool3, true, !dbg !231
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %9 = phi i1 [ false, %for.cond ], [ %lnot, %land.rhs ], !dbg !232
  br i1 %9, label %for.body, label %for.end, !dbg !233

for.body:                                         ; preds = %land.end
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %for.body
  %10 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !234
  %link = getelementptr inbounds %struct.sHme, %struct.sHme* %10, i32 0, i32 2, !dbg !235
  %11 = load %struct.sHme*, %struct.sHme** %link, align 8, !dbg !235
  store %struct.sHme* %11, %struct.sHme** %m_ent, align 8, !dbg !236
  br label %for.cond, !dbg !237, !llvm.loop !238

for.end:                                          ; preds = %land.end
  %12 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !240
  %tobool4 = icmp ne %struct.sHme* %12, null, !dbg !240
  br i1 %tobool4, label %if.then, label %if.end, !dbg !242, !cf.info !148

if.then:                                          ; preds = %for.end
  %13 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !243
  %value = getelementptr inbounds %struct.sHme, %struct.sHme* %13, i32 0, i32 1, !dbg !245
  %14 = load i32, i32* %value, align 8, !dbg !245
  %15 = load i32*, i32** %val.addr, align 8, !dbg !246
  store i32 %14, i32* %15, align 4, !dbg !247
  br label %if.end, !dbg !248

if.end:                                           ; preds = %if.then, %for.end
  %16 = load %struct.sHme*, %struct.sHme** %m_ent, align 8, !dbg !249
  %cmp = icmp ne %struct.sHme* %16, null, !dbg !250
  %conv = zext i1 %cmp to i32, !dbg !250
  ret i32 %conv, !dbg !251
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @copyStr(i8** %dest, i8* %src) #0 !dbg !252 {
entry:
  %dest.addr = alloca i8**, align 8
  %src.addr = alloca i8*, align 8
  store i8** %dest, i8*** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dest.addr, metadata !253, metadata !DIExpression()), !dbg !254
  store i8* %src, i8** %src.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %src.addr, metadata !255, metadata !DIExpression()), !dbg !256
  %0 = load i8*, i8** %src.addr, align 8, !dbg !257
  %call = call noalias i8* @strdup(i8* %0) #4, !dbg !258
  %1 = load i8**, i8*** %dest.addr, align 8, !dbg !259
  store i8* %call, i8** %1, align 8, !dbg !260
  ret void, !dbg !261
}

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @copyInt(i32* %dest, i32 %src) #0 !dbg !262 {
entry:
  %dest.addr = alloca i32*, align 8
  %src.addr = alloca i32, align 4
  store i32* %dest, i32** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dest.addr, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 %src, i32* %src.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %src.addr, metadata !265, metadata !DIExpression()), !dbg !266
  %0 = load i32, i32* %src.addr, align 4, !dbg !267
  %1 = load i32*, i32** %dest.addr, align 8, !dbg !268
  store i32 %0, i32* %1, align 4, !dbg !269
  ret void, !dbg !270
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @strCompare(i8* %key1, i8* %key2) #0 !dbg !271 {
entry:
  %key1.addr = alloca i8*, align 8
  %key2.addr = alloca i8*, align 8
  store i8* %key1, i8** %key1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key1.addr, metadata !272, metadata !DIExpression()), !dbg !273
  store i8* %key2, i8** %key2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key2.addr, metadata !274, metadata !DIExpression()), !dbg !275
  %0 = load i8*, i8** %key1.addr, align 8, !dbg !276
  %1 = load i8*, i8** %key2.addr, align 8, !dbg !277
  %call = call i32 @strcmp(i8* %0, i8* %1) #5, !dbg !278
  %cmp = icmp eq i32 %call, 0, !dbg !279
  %conv = zext i1 %cmp to i32, !dbg !279
  ret i32 %conv, !dbg !280
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @HashAdd(i8* %key, i32 %value) #0 !dbg !281 {
entry:
  %key.addr = alloca i8*, align 8
  %value.addr = alloca i32, align 4
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !284, metadata !DIExpression()), !dbg !285
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !286, metadata !DIExpression()), !dbg !287
  %0 = load i8*, i8** %key.addr, align 8, !dbg !288
  %1 = load i32, i32* %value.addr, align 4, !dbg !289
  call void @HashAddH(i8* %0, i32 %1, void (i8**, i8*)* @copyStr, void (i32*, i32)* @copyInt, i32 (i8*, i32)* @strhashkey, i32 (i8*, i8*)* @strCompare), !dbg !290
  ret void, !dbg !291
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @HashGet(i32* %val, i8* %key) #0 !dbg !292 {
entry:
  %val.addr = alloca i32*, align 8
  %key.addr = alloca i8*, align 8
  store i32* %val, i32** %val.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %val.addr, metadata !295, metadata !DIExpression()), !dbg !296
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !297, metadata !DIExpression()), !dbg !298
  %0 = load i32*, i32** %val.addr, align 8, !dbg !299
  %1 = load i8*, i8** %key.addr, align 8, !dbg !300
  %call = call i32 @HashGetH(i32* %0, i8* %1, i32 (i8*, i32)* @strhashkey, i32 (i8*, i8*)* @strCompare), !dbg !301
  ret i32 %call, !dbg !302
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  %ix = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %ix, metadata !303, metadata !DIExpression()), !dbg !304
  store i32 0, i32* %ix, align 4, !dbg !305
  br label %for.cond, !dbg !307

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %ix, align 4, !dbg !308
  %cmp = icmp slt i32 %0, 6, !dbg !310
  br i1 %cmp, label %for.body, label %for.end, !dbg !311

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %ix, align 4, !dbg !312
  %idxprom = sext i32 %1 to i64, !dbg !314
  %arrayidx = getelementptr inbounds [6 x i8*], [6 x i8*]* @main.keyList, i64 0, i64 %idxprom, !dbg !314
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !314
  %3 = load i32, i32* %ix, align 4, !dbg !315
  %idxprom1 = sext i32 %3 to i64, !dbg !316
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* @main.valuList, i64 0, i64 %idxprom1, !dbg !316
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !316
  call void @HashAdd(i8* %2, i32 %4), !dbg !317
  br label %for.inc, !dbg !318

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %ix, align 4, !dbg !319
  %inc = add nsw i32 %5, 1, !dbg !319
  store i32 %inc, i32* %ix, align 4, !dbg !319
  br label %for.cond, !dbg !320, !llvm.loop !321

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !323
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!38, !39, !40}
!llvm.ident = !{!41}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "hash", scope: !2, file: !3, line: 35, type: !23, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "hash-from-two-arrays.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Hash-from-two-arrays")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{!8, !20, !0}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "keyList", scope: !10, file: !3, line: 107, type: !14, isLocal: true, isDefinition: true)
!10 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 105, type: !11, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 384, elements: !18)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 6)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "valuList", scope: !10, file: !3, line: 108, type: !22, isLocal: true, isDefinition: true)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 192, elements: !18)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 524288, elements: !36)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "HashElement", file: !3, line: 33, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "he", file: !3, line: 31, size: 128, elements: !26)
!26 = !{!27, !35}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "first", scope: !25, file: !3, line: 32, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "MapEntry", file: !3, line: 29, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sHme", file: !3, line: 25, size: 192, elements: !31)
!31 = !{!32, !33, !34}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !30, file: !3, line: 26, baseType: !15, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !30, file: !3, line: 27, baseType: !13, size: 32, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "link", scope: !30, file: !3, line: 28, baseType: !29, size: 64, offset: 128)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "last", scope: !25, file: !3, line: 32, baseType: !28, size: 64, offset: 64)
!36 = !{!37}
!37 = !DISubrange(count: 4096)
!38 = !{i32 7, !"Dwarf Version", i32 4}
!39 = !{i32 2, !"Debug Info Version", i32 3}
!40 = !{i32 1, !"wchar_size", i32 4}
!41 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!42 = distinct !DISubprogram(name: "strhashkey", scope: !3, file: !3, line: 11, type: !43, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !15, !13}
!45 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!46 = !DILocalVariable(name: "key", arg: 1, scope: !42, file: !3, line: 11, type: !15)
!47 = !DILocation(line: 11, column: 35, scope: !42)
!48 = !DILocalVariable(name: "max", arg: 2, scope: !42, file: !3, line: 11, type: !13)
!49 = !DILocation(line: 11, column: 44, scope: !42)
!50 = !DILocalVariable(name: "h", scope: !42, file: !3, line: 13, type: !45)
!51 = !DILocation(line: 13, column: 14, scope: !42)
!52 = !DILocalVariable(name: "hl", scope: !42, file: !3, line: 14, type: !45)
!53 = !DILocation(line: 14, column: 14, scope: !42)
!54 = !DILocalVariable(name: "hr", scope: !42, file: !3, line: 14, type: !45)
!55 = !DILocation(line: 14, column: 18, scope: !42)
!56 = !DILocation(line: 16, column: 5, scope: !42)
!57 = !DILocation(line: 16, column: 12, scope: !42)
!58 = !DILocation(line: 16, column: 11, scope: !42)
!59 = !DILocation(line: 17, column: 15, scope: !60)
!60 = distinct !DILexicalBlock(scope: !42, file: !3, line: 16, column: 17)
!61 = !DILocation(line: 17, column: 14, scope: !60)
!62 = !DILocation(line: 17, column: 11, scope: !60)
!63 = !DILocation(line: 18, column: 22, scope: !60)
!64 = !DILocation(line: 18, column: 23, scope: !60)
!65 = !DILocation(line: 18, column: 36, scope: !60)
!66 = !DILocation(line: 18, column: 19, scope: !60)
!67 = !DILocation(line: 18, column: 11, scope: !60)
!68 = !DILocation(line: 19, column: 14, scope: !60)
!69 = !DILocation(line: 19, column: 15, scope: !60)
!70 = !DILocation(line: 19, column: 12, scope: !60)
!71 = !DILocation(line: 20, column: 13, scope: !60)
!72 = !DILocation(line: 20, column: 18, scope: !60)
!73 = !DILocation(line: 20, column: 16, scope: !60)
!74 = !DILocation(line: 20, column: 27, scope: !60)
!75 = !DILocation(line: 20, column: 23, scope: !60)
!76 = !DILocation(line: 20, column: 21, scope: !60)
!77 = !DILocation(line: 20, column: 11, scope: !60)
!78 = distinct !{!78, !56, !79}
!79 = !DILocation(line: 21, column: 5, scope: !42)
!80 = !DILocation(line: 22, column: 12, scope: !42)
!81 = !DILocation(line: 22, column: 16, scope: !42)
!82 = !DILocation(line: 22, column: 14, scope: !42)
!83 = !DILocation(line: 22, column: 5, scope: !42)
!84 = distinct !DISubprogram(name: "HashAddH", scope: !3, file: !3, line: 42, type: !85, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{null, !15, !13, !87, !92, !97, !99}
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "KeyCopyF", file: !3, line: 37, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DISubroutineType(types: !90)
!90 = !{null, !91, !15}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "ValCopyF", file: !3, line: 38, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DISubroutineType(types: !95)
!95 = !{null, !96, !13}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "KeyHashF", file: !3, line: 39, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "KeyCmprF", file: !3, line: 40, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DISubroutineType(types: !102)
!102 = !{!13, !15, !15}
!103 = !DILocalVariable(name: "key", arg: 1, scope: !84, file: !3, line: 42, type: !15)
!104 = !DILocation(line: 42, column: 24, scope: !84)
!105 = !DILocalVariable(name: "value", arg: 2, scope: !84, file: !3, line: 42, type: !13)
!106 = !DILocation(line: 42, column: 37, scope: !84)
!107 = !DILocalVariable(name: "copyKey", arg: 3, scope: !84, file: !3, line: 43, type: !87)
!108 = !DILocation(line: 43, column: 18, scope: !84)
!109 = !DILocalVariable(name: "copyVal", arg: 4, scope: !84, file: !3, line: 43, type: !92)
!110 = !DILocation(line: 43, column: 36, scope: !84)
!111 = !DILocalVariable(name: "hashKey", arg: 5, scope: !84, file: !3, line: 43, type: !97)
!112 = !DILocation(line: 43, column: 54, scope: !84)
!113 = !DILocalVariable(name: "keySame", arg: 6, scope: !84, file: !3, line: 43, type: !99)
!114 = !DILocation(line: 43, column: 72, scope: !84)
!115 = !DILocalVariable(name: "hix", scope: !84, file: !3, line: 45, type: !45)
!116 = !DILocation(line: 45, column: 14, scope: !84)
!117 = !DILocation(line: 45, column: 22, scope: !84)
!118 = !DILocation(line: 45, column: 31, scope: !84)
!119 = !DILocation(line: 45, column: 20, scope: !84)
!120 = !DILocalVariable(name: "m_ent", scope: !84, file: !3, line: 46, type: !28)
!121 = !DILocation(line: 46, column: 14, scope: !84)
!122 = !DILocation(line: 48, column: 22, scope: !123)
!123 = distinct !DILexicalBlock(scope: !84, file: !3, line: 48, column: 5)
!124 = !DILocation(line: 48, column: 17, scope: !123)
!125 = !DILocation(line: 48, column: 27, scope: !123)
!126 = !DILocation(line: 48, column: 15, scope: !123)
!127 = !DILocation(line: 48, column: 10, scope: !123)
!128 = !DILocation(line: 49, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !3, line: 48, column: 5)
!130 = !DILocation(line: 49, column: 19, scope: !129)
!131 = !DILocation(line: 49, column: 25, scope: !129)
!132 = !DILocation(line: 49, column: 34, scope: !129)
!133 = !DILocation(line: 49, column: 41, scope: !129)
!134 = !DILocation(line: 49, column: 45, scope: !129)
!135 = !DILocation(line: 49, column: 23, scope: !129)
!136 = !DILocation(line: 49, column: 22, scope: !129)
!137 = !DILocation(line: 0, scope: !129)
!138 = !DILocation(line: 48, column: 5, scope: !123)
!139 = !DILocation(line: 49, column: 57, scope: !129)
!140 = !DILocation(line: 49, column: 64, scope: !129)
!141 = !DILocation(line: 49, column: 56, scope: !129)
!142 = !DILocation(line: 48, column: 5, scope: !129)
!143 = distinct !{!143, !138, !144}
!144 = !DILocation(line: 49, column: 69, scope: !123)
!145 = !DILocation(line: 50, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !84, file: !3, line: 50, column: 9)
!147 = !DILocation(line: 50, column: 9, scope: !84)
!148 = !{!"if"}
!149 = !DILocation(line: 51, column: 11, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !3, line: 50, column: 16)
!151 = !DILocation(line: 51, column: 21, scope: !150)
!152 = !DILocation(line: 51, column: 28, scope: !150)
!153 = !DILocation(line: 51, column: 35, scope: !150)
!154 = !DILocation(line: 51, column: 9, scope: !150)
!155 = !DILocation(line: 52, column: 5, scope: !150)
!156 = !DILocalVariable(name: "last", scope: !157, file: !3, line: 54, type: !28)
!157 = distinct !DILexicalBlock(scope: !146, file: !3, line: 53, column: 10)
!158 = !DILocation(line: 54, column: 18, scope: !157)
!159 = !DILocalVariable(name: "hme", scope: !157, file: !3, line: 55, type: !28)
!160 = !DILocation(line: 55, column: 18, scope: !157)
!161 = !DILocation(line: 55, column: 24, scope: !157)
!162 = !DILocation(line: 56, column: 11, scope: !157)
!163 = !DILocation(line: 56, column: 21, scope: !157)
!164 = !DILocation(line: 56, column: 26, scope: !157)
!165 = !DILocation(line: 56, column: 31, scope: !157)
!166 = !DILocation(line: 56, column: 9, scope: !157)
!167 = !DILocation(line: 57, column: 11, scope: !157)
!168 = !DILocation(line: 57, column: 21, scope: !157)
!169 = !DILocation(line: 57, column: 26, scope: !157)
!170 = !DILocation(line: 57, column: 33, scope: !157)
!171 = !DILocation(line: 57, column: 9, scope: !157)
!172 = !DILocation(line: 58, column: 9, scope: !157)
!173 = !DILocation(line: 58, column: 14, scope: !157)
!174 = !DILocation(line: 58, column: 19, scope: !157)
!175 = !DILocation(line: 59, column: 21, scope: !157)
!176 = !DILocation(line: 59, column: 16, scope: !157)
!177 = !DILocation(line: 59, column: 26, scope: !157)
!178 = !DILocation(line: 59, column: 14, scope: !157)
!179 = !DILocation(line: 60, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !157, file: !3, line: 60, column: 13)
!181 = !DILocation(line: 60, column: 13, scope: !157)
!182 = !DILocation(line: 62, column: 26, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !3, line: 60, column: 19)
!184 = !DILocation(line: 62, column: 13, scope: !183)
!185 = !DILocation(line: 62, column: 19, scope: !183)
!186 = !DILocation(line: 62, column: 24, scope: !183)
!187 = !DILocation(line: 63, column: 9, scope: !183)
!188 = !DILocation(line: 65, column: 31, scope: !180)
!189 = !DILocation(line: 65, column: 18, scope: !180)
!190 = !DILocation(line: 65, column: 13, scope: !180)
!191 = !DILocation(line: 65, column: 23, scope: !180)
!192 = !DILocation(line: 65, column: 29, scope: !180)
!193 = !DILocation(line: 66, column: 26, scope: !157)
!194 = !DILocation(line: 66, column: 14, scope: !157)
!195 = !DILocation(line: 66, column: 9, scope: !157)
!196 = !DILocation(line: 66, column: 19, scope: !157)
!197 = !DILocation(line: 66, column: 24, scope: !157)
!198 = !DILocation(line: 68, column: 1, scope: !84)
!199 = distinct !DISubprogram(name: "HashGetH", scope: !3, file: !3, line: 70, type: !200, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!200 = !DISubroutineType(types: !201)
!201 = !{!13, !96, !15, !97, !99}
!202 = !DILocalVariable(name: "val", arg: 1, scope: !199, file: !3, line: 70, type: !96)
!203 = !DILocation(line: 70, column: 23, scope: !199)
!204 = !DILocalVariable(name: "key", arg: 2, scope: !199, file: !3, line: 70, type: !15)
!205 = !DILocation(line: 70, column: 36, scope: !199)
!206 = !DILocalVariable(name: "hashKey", arg: 3, scope: !199, file: !3, line: 70, type: !97)
!207 = !DILocation(line: 70, column: 50, scope: !199)
!208 = !DILocalVariable(name: "keySame", arg: 4, scope: !199, file: !3, line: 70, type: !99)
!209 = !DILocation(line: 70, column: 68, scope: !199)
!210 = !DILocalVariable(name: "hix", scope: !199, file: !3, line: 72, type: !45)
!211 = !DILocation(line: 72, column: 14, scope: !199)
!212 = !DILocation(line: 72, column: 22, scope: !199)
!213 = !DILocation(line: 72, column: 31, scope: !199)
!214 = !DILocation(line: 72, column: 20, scope: !199)
!215 = !DILocalVariable(name: "m_ent", scope: !199, file: !3, line: 73, type: !28)
!216 = !DILocation(line: 73, column: 14, scope: !199)
!217 = !DILocation(line: 74, column: 22, scope: !218)
!218 = distinct !DILexicalBlock(scope: !199, file: !3, line: 74, column: 5)
!219 = !DILocation(line: 74, column: 17, scope: !218)
!220 = !DILocation(line: 74, column: 27, scope: !218)
!221 = !DILocation(line: 74, column: 15, scope: !218)
!222 = !DILocation(line: 74, column: 10, scope: !218)
!223 = !DILocation(line: 75, column: 13, scope: !224)
!224 = distinct !DILexicalBlock(scope: !218, file: !3, line: 74, column: 5)
!225 = !DILocation(line: 75, column: 19, scope: !224)
!226 = !DILocation(line: 75, column: 25, scope: !224)
!227 = !DILocation(line: 75, column: 34, scope: !224)
!228 = !DILocation(line: 75, column: 41, scope: !224)
!229 = !DILocation(line: 75, column: 45, scope: !224)
!230 = !DILocation(line: 75, column: 23, scope: !224)
!231 = !DILocation(line: 75, column: 22, scope: !224)
!232 = !DILocation(line: 0, scope: !224)
!233 = !DILocation(line: 74, column: 5, scope: !218)
!234 = !DILocation(line: 75, column: 57, scope: !224)
!235 = !DILocation(line: 75, column: 64, scope: !224)
!236 = !DILocation(line: 75, column: 56, scope: !224)
!237 = !DILocation(line: 74, column: 5, scope: !224)
!238 = distinct !{!238, !233, !239}
!239 = !DILocation(line: 75, column: 69, scope: !218)
!240 = !DILocation(line: 76, column: 9, scope: !241)
!241 = distinct !DILexicalBlock(scope: !199, file: !3, line: 76, column: 9)
!242 = !DILocation(line: 76, column: 9, scope: !199)
!243 = !DILocation(line: 77, column: 16, scope: !244)
!244 = distinct !DILexicalBlock(scope: !241, file: !3, line: 76, column: 16)
!245 = !DILocation(line: 77, column: 23, scope: !244)
!246 = !DILocation(line: 77, column: 10, scope: !244)
!247 = !DILocation(line: 77, column: 14, scope: !244)
!248 = !DILocation(line: 78, column: 5, scope: !244)
!249 = !DILocation(line: 79, column: 13, scope: !199)
!250 = !DILocation(line: 79, column: 19, scope: !199)
!251 = !DILocation(line: 79, column: 5, scope: !199)
!252 = distinct !DISubprogram(name: "copyStr", scope: !3, file: !3, line: 82, type: !89, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!253 = !DILocalVariable(name: "dest", arg: 1, scope: !252, file: !3, line: 82, type: !91)
!254 = !DILocation(line: 82, column: 26, scope: !252)
!255 = !DILocalVariable(name: "src", arg: 2, scope: !252, file: !3, line: 82, type: !15)
!256 = !DILocation(line: 82, column: 44, scope: !252)
!257 = !DILocation(line: 84, column: 20, scope: !252)
!258 = !DILocation(line: 84, column: 13, scope: !252)
!259 = !DILocation(line: 84, column: 6, scope: !252)
!260 = !DILocation(line: 84, column: 11, scope: !252)
!261 = !DILocation(line: 85, column: 1, scope: !252)
!262 = distinct !DISubprogram(name: "copyInt", scope: !3, file: !3, line: 86, type: !94, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!263 = !DILocalVariable(name: "dest", arg: 1, scope: !262, file: !3, line: 86, type: !96)
!264 = !DILocation(line: 86, column: 20, scope: !262)
!265 = !DILocalVariable(name: "src", arg: 2, scope: !262, file: !3, line: 86, type: !13)
!266 = !DILocation(line: 86, column: 30, scope: !262)
!267 = !DILocation(line: 88, column: 13, scope: !262)
!268 = !DILocation(line: 88, column: 6, scope: !262)
!269 = !DILocation(line: 88, column: 11, scope: !262)
!270 = !DILocation(line: 89, column: 1, scope: !262)
!271 = distinct !DISubprogram(name: "strCompare", scope: !3, file: !3, line: 90, type: !101, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!272 = !DILocalVariable(name: "key1", arg: 1, scope: !271, file: !3, line: 90, type: !15)
!273 = !DILocation(line: 90, column: 29, scope: !271)
!274 = !DILocalVariable(name: "key2", arg: 2, scope: !271, file: !3, line: 90, type: !15)
!275 = !DILocation(line: 90, column: 47, scope: !271)
!276 = !DILocation(line: 92, column: 19, scope: !271)
!277 = !DILocation(line: 92, column: 25, scope: !271)
!278 = !DILocation(line: 92, column: 12, scope: !271)
!279 = !DILocation(line: 92, column: 31, scope: !271)
!280 = !DILocation(line: 92, column: 5, scope: !271)
!281 = distinct !DISubprogram(name: "HashAdd", scope: !3, file: !3, line: 95, type: !282, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!282 = !DISubroutineType(types: !283)
!283 = !{null, !15, !13}
!284 = !DILocalVariable(name: "key", arg: 1, scope: !281, file: !3, line: 95, type: !15)
!285 = !DILocation(line: 95, column: 23, scope: !281)
!286 = !DILocalVariable(name: "value", arg: 2, scope: !281, file: !3, line: 95, type: !13)
!287 = !DILocation(line: 95, column: 36, scope: !281)
!288 = !DILocation(line: 97, column: 15, scope: !281)
!289 = !DILocation(line: 97, column: 20, scope: !281)
!290 = !DILocation(line: 97, column: 5, scope: !281)
!291 = !DILocation(line: 98, column: 1, scope: !281)
!292 = distinct !DISubprogram(name: "HashGet", scope: !3, file: !3, line: 100, type: !293, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!293 = !DISubroutineType(types: !294)
!294 = !{!13, !96, !15}
!295 = !DILocalVariable(name: "val", arg: 1, scope: !292, file: !3, line: 100, type: !96)
!296 = !DILocation(line: 100, column: 22, scope: !292)
!297 = !DILocalVariable(name: "key", arg: 2, scope: !292, file: !3, line: 100, type: !15)
!298 = !DILocation(line: 100, column: 35, scope: !292)
!299 = !DILocation(line: 102, column: 22, scope: !292)
!300 = !DILocation(line: 102, column: 27, scope: !292)
!301 = !DILocation(line: 102, column: 12, scope: !292)
!302 = !DILocation(line: 102, column: 5, scope: !292)
!303 = !DILocalVariable(name: "ix", scope: !10, file: !3, line: 109, type: !13)
!304 = !DILocation(line: 109, column: 9, scope: !10)
!305 = !DILocation(line: 111, column: 12, scope: !306)
!306 = distinct !DILexicalBlock(scope: !10, file: !3, line: 111, column: 5)
!307 = !DILocation(line: 111, column: 10, scope: !306)
!308 = !DILocation(line: 111, column: 16, scope: !309)
!309 = distinct !DILexicalBlock(scope: !306, file: !3, line: 111, column: 5)
!310 = !DILocation(line: 111, column: 18, scope: !309)
!311 = !DILocation(line: 111, column: 5, scope: !306)
!312 = !DILocation(line: 112, column: 25, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !3, line: 111, column: 28)
!314 = !DILocation(line: 112, column: 17, scope: !313)
!315 = !DILocation(line: 112, column: 39, scope: !313)
!316 = !DILocation(line: 112, column: 30, scope: !313)
!317 = !DILocation(line: 112, column: 9, scope: !313)
!318 = !DILocation(line: 113, column: 5, scope: !313)
!319 = !DILocation(line: 111, column: 24, scope: !309)
!320 = !DILocation(line: 111, column: 5, scope: !309)
!321 = distinct !{!321, !311, !322}
!322 = !DILocation(line: 113, column: 5, scope: !306)
!323 = !DILocation(line: 114, column: 5, scope: !10)
