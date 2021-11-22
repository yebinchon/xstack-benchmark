; ModuleID = 'chat-server.c'
source_filename = "chat-server.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.client = type { [4096 x i8], i32, [32 x i8] }
%struct.fd_set = type { [16 x i64] }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.timeval = type { i64, i64 }
%struct.sockaddr = type { i16, [14 x i8] }

@connections = common dso_local global [1024 x %struct.client*] zeroinitializer, align 16, !dbg !0
@status = common dso_local global %struct.fd_set zeroinitializer, align 8, !dbg !54
@.str = private unnamed_addr constant [21 x i8] c"* Disconnected: %s\0D\0A\00", align 1
@tsocket = common dso_local global i32 0, align 4, !dbg !31
@.str.1 = private unnamed_addr constant [31 x i8] c"-- Connection %d disconnected\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"* Connected: %s\0D\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"%s: %.*s\0D\0A\00", align 1
@current = common dso_local global %struct.fd_set zeroinitializer, align 8, !dbg !63
@.str.4 = private unnamed_addr constant [7 x i8] c"Select\00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"Couldn't accept connection\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"Unable to accept new connection.\0A\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"Enter name: \00", align 1
@.str.8 = private unnamed_addr constant [34 x i8] c"-- New connection %d from %s:%hu\0A\00", align 1
@tsockinfo = common dso_local global %struct.sockaddr_in zeroinitializer, align 4, !dbg !33
@.str.9 = private unnamed_addr constant [23 x i8] c"Socket %d on port %hu\0A\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"Couldn't bind socket\00", align 1
@.str.11 = private unnamed_addr constant [24 x i8] c"Couldn't listen to port\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @AddConnection(i32 %handle) #0 !dbg !85 {
entry:
  %handle.addr = alloca i32, align 4
  store i32 %handle, i32* %handle.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %handle.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call noalias i8* @malloc(i64 4132) #7, !dbg !91
  %0 = bitcast i8* %call to %struct.client*, !dbg !91
  %1 = load i32, i32* %handle.addr, align 4, !dbg !92
  %idxprom = sext i32 %1 to i64, !dbg !93
  %arrayidx = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom, !dbg !93
  store %struct.client* %0, %struct.client** %arrayidx, align 8, !dbg !94
  %2 = load i32, i32* %handle.addr, align 4, !dbg !95
  %idxprom1 = sext i32 %2 to i64, !dbg !96
  %arrayidx2 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom1, !dbg !96
  %3 = load %struct.client*, %struct.client** %arrayidx2, align 8, !dbg !96
  %buffer = getelementptr inbounds %struct.client, %struct.client* %3, i32 0, i32 0, !dbg !97
  %arrayidx3 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer, i64 0, i64 0, !dbg !96
  store i8 0, i8* %arrayidx3, align 4, !dbg !98
  %4 = load i32, i32* %handle.addr, align 4, !dbg !99
  %idxprom4 = sext i32 %4 to i64, !dbg !100
  %arrayidx5 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom4, !dbg !100
  %5 = load %struct.client*, %struct.client** %arrayidx5, align 8, !dbg !100
  %pos = getelementptr inbounds %struct.client, %struct.client* %5, i32 0, i32 1, !dbg !101
  store i32 0, i32* %pos, align 4, !dbg !102
  %6 = load i32, i32* %handle.addr, align 4, !dbg !103
  %idxprom6 = sext i32 %6 to i64, !dbg !104
  %arrayidx7 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom6, !dbg !104
  %7 = load %struct.client*, %struct.client** %arrayidx7, align 8, !dbg !104
  %name = getelementptr inbounds %struct.client, %struct.client* %7, i32 0, i32 2, !dbg !105
  %arrayidx8 = getelementptr inbounds [32 x i8], [32 x i8]* %name, i64 0, i64 0, !dbg !104
  store i8 0, i8* %arrayidx8, align 4, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CloseConnection(i32 %handle) #0 !dbg !108 {
entry:
  %handle.addr = alloca i32, align 4
  %buf = alloca [512 x i8], align 16
  %j = alloca i32, align 4
  store i32 %handle, i32* %handle.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %handle.addr, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [512 x i8]* %buf, metadata !111, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %j, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = load i32, i32* %handle.addr, align 4, !dbg !118
  %rem = srem i32 %0, 64, !dbg !118
  %sh_prom = zext i32 %rem to i64, !dbg !118
  %shl = shl i64 1, %sh_prom, !dbg !118
  %neg = xor i64 %shl, -1, !dbg !118
  %1 = load i32, i32* %handle.addr, align 4, !dbg !118
  %div = sdiv i32 %1, 64, !dbg !118
  %idxprom = sext i32 %div to i64, !dbg !118
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom, !dbg !118
  %2 = load i64, i64* %arrayidx, align 8, !dbg !118
  %and = and i64 %2, %neg, !dbg !118
  store i64 %and, i64* %arrayidx, align 8, !dbg !118
  %3 = load i32, i32* %handle.addr, align 4, !dbg !119
  %idxprom1 = sext i32 %3 to i64, !dbg !121
  %arrayidx2 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom1, !dbg !121
  %4 = load %struct.client*, %struct.client** %arrayidx2, align 8, !dbg !121
  %name = getelementptr inbounds %struct.client, %struct.client* %4, i32 0, i32 2, !dbg !122
  %arrayidx3 = getelementptr inbounds [32 x i8], [32 x i8]* %name, i64 0, i64 0, !dbg !121
  %5 = load i8, i8* %arrayidx3, align 4, !dbg !121
  %tobool = icmp ne i8 %5, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.else, !dbg !123, !cf.info !124

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !125
  %6 = load i32, i32* %handle.addr, align 4, !dbg !127
  %idxprom4 = sext i32 %6 to i64, !dbg !128
  %arrayidx5 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom4, !dbg !128
  %7 = load %struct.client*, %struct.client** %arrayidx5, align 8, !dbg !128
  %name6 = getelementptr inbounds %struct.client, %struct.client* %7, i32 0, i32 2, !dbg !129
  %arraydecay7 = getelementptr inbounds [32 x i8], [32 x i8]* %name6, i64 0, i64 0, !dbg !128
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i8* %arraydecay7) #7, !dbg !130
  store i32 0, i32* %j, align 4, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.then
  %8 = load i32, i32* %j, align 4, !dbg !134
  %cmp = icmp slt i32 %8, 1024, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %handle.addr, align 4, !dbg !138
  %10 = load i32, i32* %j, align 4, !dbg !141
  %cmp8 = icmp ne i32 %9, %10, !dbg !142
  br i1 %cmp8, label %land.lhs.true, label %if.end26, !dbg !143, !cf.info !124

land.lhs.true:                                    ; preds = %for.body
  %11 = load i32, i32* %j, align 4, !dbg !144
  %12 = load i32, i32* @tsocket, align 4, !dbg !145
  %cmp9 = icmp ne i32 %11, %12, !dbg !146
  br i1 %cmp9, label %land.lhs.true10, label %if.end26, !dbg !147, !cf.info !124

land.lhs.true10:                                  ; preds = %land.lhs.true
  %13 = load i32, i32* %j, align 4, !dbg !148
  %div11 = sdiv i32 %13, 64, !dbg !148
  %idxprom12 = sext i32 %div11 to i64, !dbg !148
  %arrayidx13 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom12, !dbg !148
  %14 = load i64, i64* %arrayidx13, align 8, !dbg !148
  %15 = load i32, i32* %j, align 4, !dbg !148
  %rem14 = srem i32 %15, 64, !dbg !148
  %sh_prom15 = zext i32 %rem14 to i64, !dbg !148
  %shl16 = shl i64 1, %sh_prom15, !dbg !148
  %and17 = and i64 %14, %shl16, !dbg !148
  %cmp18 = icmp ne i64 %and17, 0, !dbg !148
  br i1 %cmp18, label %if.then19, label %if.end26, !dbg !149, !cf.info !124

if.then19:                                        ; preds = %land.lhs.true10
  %16 = load i32, i32* %j, align 4, !dbg !150
  %arraydecay20 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !153
  %arraydecay21 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !154
  %call22 = call i64 @strlen(i8* %arraydecay21), !dbg !155
  %call23 = call i32 (i32, i8*, i64, ...) bitcast (i32 (...)* @write to i32 (i32, i8*, i64, ...)*)(i32 %16, i8* %arraydecay20, i64 %call22), !dbg !156
  %cmp24 = icmp slt i32 %call23, 0, !dbg !157
  br i1 %cmp24, label %if.then25, label %if.end, !dbg !158, !cf.info !124

if.then25:                                        ; preds = %if.then19
  %17 = load i32, i32* %j, align 4, !dbg !159
  call void @CloseConnection(i32 %17), !dbg !161
  br label %if.end, !dbg !162

if.end:                                           ; preds = %if.then25, %if.then19
  br label %if.end26, !dbg !163

if.end26:                                         ; preds = %if.end, %land.lhs.true10, %land.lhs.true, %for.body
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %if.end26
  %18 = load i32, i32* %j, align 4, !dbg !165
  %inc = add nsw i32 %18, 1, !dbg !165
  store i32 %inc, i32* %j, align 4, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  br label %if.end28, !dbg !169

if.else:                                          ; preds = %entry
  %19 = load i32, i32* %handle.addr, align 4, !dbg !170
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 %19), !dbg !172
  br label %if.end28

if.end28:                                         ; preds = %if.else, %for.end
  %20 = load i32, i32* %handle.addr, align 4, !dbg !173
  %idxprom29 = sext i32 %20 to i64, !dbg !175
  %arrayidx30 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom29, !dbg !175
  %21 = load %struct.client*, %struct.client** %arrayidx30, align 8, !dbg !175
  %tobool31 = icmp ne %struct.client* %21, null, !dbg !175
  br i1 %tobool31, label %if.then32, label %if.end35, !dbg !176, !cf.info !124

if.then32:                                        ; preds = %if.end28
  %22 = load i32, i32* %handle.addr, align 4, !dbg !177
  %idxprom33 = sext i32 %22 to i64, !dbg !179
  %arrayidx34 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom33, !dbg !179
  %23 = load %struct.client*, %struct.client** %arrayidx34, align 8, !dbg !179
  %24 = bitcast %struct.client* %23 to i8*, !dbg !179
  call void @free(i8* %24) #7, !dbg !180
  br label %if.end35, !dbg !181

if.end35:                                         ; preds = %if.then32, %if.end28
  %25 = load i32, i32* %handle.addr, align 4, !dbg !182
  %call36 = call i32 (i32, ...) bitcast (i32 (...)* @close to i32 (i32, ...)*)(i32 %25), !dbg !183
  ret void, !dbg !184
}

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #2

declare dso_local i32 @write(...) #3

declare dso_local i64 @strlen(i8*) #3

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

declare dso_local i32 @close(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @strip(i8* %buf) #0 !dbg !185 {
entry:
  %buf.addr = alloca i8*, align 8
  %x = alloca i8*, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i8** %x, metadata !191, metadata !DIExpression()), !dbg !192
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !193
  %call = call i8* @strchr(i8* %0, i32 10), !dbg !194
  store i8* %call, i8** %x, align 8, !dbg !195
  %1 = load i8*, i8** %x, align 8, !dbg !196
  %tobool = icmp ne i8* %1, null, !dbg !196
  br i1 %tobool, label %if.then, label %if.end, !dbg !198, !cf.info !124

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %x, align 8, !dbg !199
  store i8 0, i8* %2, align 1, !dbg !201
  br label %if.end, !dbg !202

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !203
  %call1 = call i8* @strchr(i8* %3, i32 13), !dbg !204
  store i8* %call1, i8** %x, align 8, !dbg !205
  %4 = load i8*, i8** %x, align 8, !dbg !206
  %tobool2 = icmp ne i8* %4, null, !dbg !206
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !208, !cf.info !124

if.then3:                                         ; preds = %if.end
  %5 = load i8*, i8** %x, align 8, !dbg !209
  store i8 0, i8* %5, align 1, !dbg !211
  br label %if.end4, !dbg !212

if.end4:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !213
}

declare dso_local i8* @strchr(i8*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @RelayText(i32 %handle) #0 !dbg !214 {
entry:
  %handle.addr = alloca i32, align 4
  %begin = alloca i8*, align 8
  %end = alloca i8*, align 8
  %ret = alloca i32, align 4
  %output = alloca [8000 x i8], align 16
  %j = alloca i32, align 4
  store i32 %handle, i32* %handle.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %handle.addr, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata i8** %begin, metadata !219, metadata !DIExpression()), !dbg !220
  call void @llvm.dbg.declare(metadata i8** %end, metadata !221, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !223, metadata !DIExpression()), !dbg !224
  store i32 0, i32* %ret, align 4, !dbg !224
  %0 = load i32, i32* %handle.addr, align 4, !dbg !225
  %idxprom = sext i32 %0 to i64, !dbg !226
  %arrayidx = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom, !dbg !226
  %1 = load %struct.client*, %struct.client** %arrayidx, align 8, !dbg !226
  %buffer = getelementptr inbounds %struct.client, %struct.client* %1, i32 0, i32 0, !dbg !227
  %arraydecay = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer, i64 0, i64 0, !dbg !226
  store i8* %arraydecay, i8** %begin, align 8, !dbg !228
  %2 = load i32, i32* %handle.addr, align 4, !dbg !229
  %idxprom1 = sext i32 %2 to i64, !dbg !231
  %arrayidx2 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom1, !dbg !231
  %3 = load %struct.client*, %struct.client** %arrayidx2, align 8, !dbg !231
  %pos = getelementptr inbounds %struct.client, %struct.client* %3, i32 0, i32 1, !dbg !232
  %4 = load i32, i32* %pos, align 4, !dbg !232
  %cmp = icmp eq i32 %4, 4000, !dbg !233
  br i1 %cmp, label %if.then, label %if.else10, !dbg !234, !cf.info !124

if.then:                                          ; preds = %entry
  %5 = load i8*, i8** %begin, align 8, !dbg !235
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 3999, !dbg !235
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !235
  %conv = sext i8 %6 to i32, !dbg !235
  %cmp4 = icmp ne i32 %conv, 10, !dbg !238
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !239, !cf.info !124

if.then6:                                         ; preds = %if.then
  %7 = load i8*, i8** %begin, align 8, !dbg !240
  %arrayidx7 = getelementptr inbounds i8, i8* %7, i64 4000, !dbg !240
  store i8 0, i8* %arrayidx7, align 1, !dbg !241
  br label %if.end, !dbg !240

if.else:                                          ; preds = %if.then
  %8 = load i8*, i8** %begin, align 8, !dbg !242
  %arrayidx8 = getelementptr inbounds i8, i8* %8, i64 4000, !dbg !242
  store i8 10, i8* %arrayidx8, align 1, !dbg !244
  %9 = load i8*, i8** %begin, align 8, !dbg !245
  %arrayidx9 = getelementptr inbounds i8, i8* %9, i64 4001, !dbg !245
  store i8 0, i8* %arrayidx9, align 1, !dbg !246
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  br label %if.end16, !dbg !247

if.else10:                                        ; preds = %entry
  %10 = load i8*, i8** %begin, align 8, !dbg !248
  %11 = load i32, i32* %handle.addr, align 4, !dbg !250
  %idxprom11 = sext i32 %11 to i64, !dbg !251
  %arrayidx12 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom11, !dbg !251
  %12 = load %struct.client*, %struct.client** %arrayidx12, align 8, !dbg !251
  %pos13 = getelementptr inbounds %struct.client, %struct.client* %12, i32 0, i32 1, !dbg !252
  %13 = load i32, i32* %pos13, align 4, !dbg !252
  %idxprom14 = sext i32 %13 to i64, !dbg !248
  %arrayidx15 = getelementptr inbounds i8, i8* %10, i64 %idxprom14, !dbg !248
  store i8 0, i8* %arrayidx15, align 1, !dbg !253
  br label %if.end16

if.end16:                                         ; preds = %if.else10, %if.end
  %14 = load i8*, i8** %begin, align 8, !dbg !254
  %call = call i8* @strchr(i8* %14, i32 10), !dbg !255
  store i8* %call, i8** %end, align 8, !dbg !256
  br label %while.cond, !dbg !257

while.cond:                                       ; preds = %if.end75, %if.end16
  %15 = load i8*, i8** %end, align 8, !dbg !258
  %cmp17 = icmp ne i8* %15, null, !dbg !259
  br i1 %cmp17, label %while.body, label %while.end, !dbg !257

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata [8000 x i8]* %output, metadata !260, metadata !DIExpression()), !dbg !265
  %arrayidx19 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !266
  store i8 0, i8* %arrayidx19, align 16, !dbg !267
  %16 = load i32, i32* %handle.addr, align 4, !dbg !268
  %idxprom20 = sext i32 %16 to i64, !dbg !270
  %arrayidx21 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom20, !dbg !270
  %17 = load %struct.client*, %struct.client** %arrayidx21, align 8, !dbg !270
  %name = getelementptr inbounds %struct.client, %struct.client* %17, i32 0, i32 2, !dbg !271
  %arrayidx22 = getelementptr inbounds [32 x i8], [32 x i8]* %name, i64 0, i64 0, !dbg !270
  %18 = load i8, i8* %arrayidx22, align 4, !dbg !270
  %tobool = icmp ne i8 %18, 0, !dbg !270
  br i1 %tobool, label %if.else43, label %if.then23, !dbg !272, !cf.info !124

if.then23:                                        ; preds = %while.body
  %19 = load i32, i32* %handle.addr, align 4, !dbg !273
  %idxprom24 = sext i32 %19 to i64, !dbg !275
  %arrayidx25 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom24, !dbg !275
  %20 = load %struct.client*, %struct.client** %arrayidx25, align 8, !dbg !275
  %name26 = getelementptr inbounds %struct.client, %struct.client* %20, i32 0, i32 2, !dbg !276
  %arraydecay27 = getelementptr inbounds [32 x i8], [32 x i8]* %name26, i64 0, i64 0, !dbg !275
  %21 = load i8*, i8** %begin, align 8, !dbg !277
  %call28 = call i8* @strncpy(i8* %arraydecay27, i8* %21, i64 31), !dbg !278
  %22 = load i32, i32* %handle.addr, align 4, !dbg !279
  %idxprom29 = sext i32 %22 to i64, !dbg !280
  %arrayidx30 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom29, !dbg !280
  %23 = load %struct.client*, %struct.client** %arrayidx30, align 8, !dbg !280
  %name31 = getelementptr inbounds %struct.client, %struct.client* %23, i32 0, i32 2, !dbg !281
  %arrayidx32 = getelementptr inbounds [32 x i8], [32 x i8]* %name31, i64 0, i64 31, !dbg !280
  store i8 0, i8* %arrayidx32, align 1, !dbg !282
  %24 = load i32, i32* %handle.addr, align 4, !dbg !283
  %idxprom33 = sext i32 %24 to i64, !dbg !284
  %arrayidx34 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom33, !dbg !284
  %25 = load %struct.client*, %struct.client** %arrayidx34, align 8, !dbg !284
  %name35 = getelementptr inbounds %struct.client, %struct.client* %25, i32 0, i32 2, !dbg !285
  %arraydecay36 = getelementptr inbounds [32 x i8], [32 x i8]* %name35, i64 0, i64 0, !dbg !284
  call void @strip(i8* %arraydecay36), !dbg !286
  %arraydecay37 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !287
  %26 = load i32, i32* %handle.addr, align 4, !dbg !288
  %idxprom38 = sext i32 %26 to i64, !dbg !289
  %arrayidx39 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom38, !dbg !289
  %27 = load %struct.client*, %struct.client** %arrayidx39, align 8, !dbg !289
  %name40 = getelementptr inbounds %struct.client, %struct.client* %27, i32 0, i32 2, !dbg !290
  %arraydecay41 = getelementptr inbounds [32 x i8], [32 x i8]* %name40, i64 0, i64 0, !dbg !289
  %call42 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay37, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay41) #7, !dbg !291
  store i32 1, i32* %ret, align 4, !dbg !292
  br label %if.end50, !dbg !293

if.else43:                                        ; preds = %while.body
  %arraydecay44 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !294
  %28 = load i32, i32* %handle.addr, align 4, !dbg !296
  %idxprom45 = sext i32 %28 to i64, !dbg !297
  %arrayidx46 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom45, !dbg !297
  %29 = load %struct.client*, %struct.client** %arrayidx46, align 8, !dbg !297
  %name47 = getelementptr inbounds %struct.client, %struct.client* %29, i32 0, i32 2, !dbg !298
  %arraydecay48 = getelementptr inbounds [32 x i8], [32 x i8]* %name47, i64 0, i64 0, !dbg !297
  %30 = load i8*, i8** %end, align 8, !dbg !299
  %31 = load i8*, i8** %begin, align 8, !dbg !300
  %sub.ptr.lhs.cast = ptrtoint i8* %30 to i64, !dbg !301
  %sub.ptr.rhs.cast = ptrtoint i8* %31 to i64, !dbg !301
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !301
  %32 = load i8*, i8** %begin, align 8, !dbg !302
  %call49 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay44, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i8* %arraydecay48, i64 %sub.ptr.sub, i8* %32) #7, !dbg !303
  store i32 1, i32* %ret, align 4, !dbg !304
  br label %if.end50

if.end50:                                         ; preds = %if.else43, %if.then23
  %arrayidx51 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !305
  %33 = load i8, i8* %arrayidx51, align 16, !dbg !305
  %tobool52 = icmp ne i8 %33, 0, !dbg !305
  br i1 %tobool52, label %if.then53, label %if.end75, !dbg !307, !cf.info !124

if.then53:                                        ; preds = %if.end50
  call void @llvm.dbg.declare(metadata i32* %j, metadata !308, metadata !DIExpression()), !dbg !310
  store i32 0, i32* %j, align 4, !dbg !311
  br label %for.cond, !dbg !313

for.cond:                                         ; preds = %for.inc, %if.then53
  %34 = load i32, i32* %j, align 4, !dbg !314
  %cmp54 = icmp slt i32 %34, 1024, !dbg !316
  br i1 %cmp54, label %for.body, label %for.end, !dbg !317

for.body:                                         ; preds = %for.cond
  %35 = load i32, i32* %handle.addr, align 4, !dbg !318
  %36 = load i32, i32* %j, align 4, !dbg !321
  %cmp56 = icmp ne i32 %35, %36, !dbg !322
  br i1 %cmp56, label %land.lhs.true, label %if.end74, !dbg !323, !cf.info !124

land.lhs.true:                                    ; preds = %for.body
  %37 = load i32, i32* %j, align 4, !dbg !324
  %38 = load i32, i32* @tsocket, align 4, !dbg !325
  %cmp58 = icmp ne i32 %37, %38, !dbg !326
  br i1 %cmp58, label %land.lhs.true60, label %if.end74, !dbg !327, !cf.info !124

land.lhs.true60:                                  ; preds = %land.lhs.true
  %39 = load i32, i32* %j, align 4, !dbg !328
  %div = sdiv i32 %39, 64, !dbg !328
  %idxprom61 = sext i32 %div to i64, !dbg !328
  %arrayidx62 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom61, !dbg !328
  %40 = load i64, i64* %arrayidx62, align 8, !dbg !328
  %41 = load i32, i32* %j, align 4, !dbg !328
  %rem = srem i32 %41, 64, !dbg !328
  %sh_prom = zext i32 %rem to i64, !dbg !328
  %shl = shl i64 1, %sh_prom, !dbg !328
  %and = and i64 %40, %shl, !dbg !328
  %cmp63 = icmp ne i64 %and, 0, !dbg !328
  br i1 %cmp63, label %if.then65, label %if.end74, !dbg !329, !cf.info !124

if.then65:                                        ; preds = %land.lhs.true60
  %42 = load i32, i32* %j, align 4, !dbg !330
  %arraydecay66 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !333
  %arraydecay67 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !334
  %call68 = call i64 @strlen(i8* %arraydecay67), !dbg !335
  %call69 = call i32 (i32, i8*, i64, ...) bitcast (i32 (...)* @write to i32 (i32, i8*, i64, ...)*)(i32 %42, i8* %arraydecay66, i64 %call68), !dbg !336
  %cmp70 = icmp slt i32 %call69, 0, !dbg !337
  br i1 %cmp70, label %if.then72, label %if.end73, !dbg !338, !cf.info !124

if.then72:                                        ; preds = %if.then65
  %43 = load i32, i32* %j, align 4, !dbg !339
  call void @CloseConnection(i32 %43), !dbg !341
  br label %if.end73, !dbg !342

if.end73:                                         ; preds = %if.then72, %if.then65
  br label %if.end74, !dbg !343

if.end74:                                         ; preds = %if.end73, %land.lhs.true60, %land.lhs.true, %for.body
  br label %for.inc, !dbg !344

for.inc:                                          ; preds = %if.end74
  %44 = load i32, i32* %j, align 4, !dbg !345
  %inc = add nsw i32 %44, 1, !dbg !345
  store i32 %inc, i32* %j, align 4, !dbg !345
  br label %for.cond, !dbg !346, !llvm.loop !347

for.end:                                          ; preds = %for.cond
  br label %if.end75, !dbg !349

if.end75:                                         ; preds = %for.end, %if.end50
  %45 = load i8*, i8** %end, align 8, !dbg !350
  %add.ptr = getelementptr inbounds i8, i8* %45, i64 1, !dbg !351
  store i8* %add.ptr, i8** %begin, align 8, !dbg !352
  %46 = load i8*, i8** %begin, align 8, !dbg !353
  %call76 = call i8* @strchr(i8* %46, i32 10), !dbg !354
  store i8* %call76, i8** %end, align 8, !dbg !355
  br label %while.cond, !dbg !257, !llvm.loop !356

while.end:                                        ; preds = %while.cond
  %47 = load i32, i32* %handle.addr, align 4, !dbg !358
  %idxprom77 = sext i32 %47 to i64, !dbg !359
  %arrayidx78 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom77, !dbg !359
  %48 = load %struct.client*, %struct.client** %arrayidx78, align 8, !dbg !359
  %buffer79 = getelementptr inbounds %struct.client, %struct.client* %48, i32 0, i32 0, !dbg !360
  %arraydecay80 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer79, i64 0, i64 0, !dbg !359
  %49 = load i8*, i8** %begin, align 8, !dbg !361
  %call81 = call i8* @strcpy(i8* %arraydecay80, i8* %49), !dbg !362
  %50 = load i8*, i8** %begin, align 8, !dbg !363
  %51 = load i32, i32* %handle.addr, align 4, !dbg !364
  %idxprom82 = sext i32 %51 to i64, !dbg !365
  %arrayidx83 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom82, !dbg !365
  %52 = load %struct.client*, %struct.client** %arrayidx83, align 8, !dbg !365
  %buffer84 = getelementptr inbounds %struct.client, %struct.client* %52, i32 0, i32 0, !dbg !366
  %arraydecay85 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer84, i64 0, i64 0, !dbg !365
  %sub.ptr.lhs.cast86 = ptrtoint i8* %50 to i64, !dbg !367
  %sub.ptr.rhs.cast87 = ptrtoint i8* %arraydecay85 to i64, !dbg !367
  %sub.ptr.sub88 = sub i64 %sub.ptr.lhs.cast86, %sub.ptr.rhs.cast87, !dbg !367
  %53 = load i32, i32* %handle.addr, align 4, !dbg !368
  %idxprom89 = sext i32 %53 to i64, !dbg !369
  %arrayidx90 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom89, !dbg !369
  %54 = load %struct.client*, %struct.client** %arrayidx90, align 8, !dbg !369
  %pos91 = getelementptr inbounds %struct.client, %struct.client* %54, i32 0, i32 1, !dbg !370
  %55 = load i32, i32* %pos91, align 4, !dbg !371
  %conv92 = sext i32 %55 to i64, !dbg !371
  %sub = sub nsw i64 %conv92, %sub.ptr.sub88, !dbg !371
  %conv93 = trunc i64 %sub to i32, !dbg !371
  store i32 %conv93, i32* %pos91, align 4, !dbg !371
  %56 = load i32, i32* %ret, align 4, !dbg !372
  ret i32 %56, !dbg !373
}

declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @ClientText(i32 %handle, i8* %buf, i32 %buf_len) #0 !dbg !374 {
entry:
  %handle.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %buf_len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %handle, i32* %handle.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %handle.addr, metadata !377, metadata !DIExpression()), !dbg !378
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !379, metadata !DIExpression()), !dbg !380
  store i32 %buf_len, i32* %buf_len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %buf_len.addr, metadata !381, metadata !DIExpression()), !dbg !382
  call void @llvm.dbg.declare(metadata i32* %i, metadata !383, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.declare(metadata i32* %j, metadata !385, metadata !DIExpression()), !dbg !386
  %0 = load i32, i32* %handle.addr, align 4, !dbg !387
  %idxprom = sext i32 %0 to i64, !dbg !389
  %arrayidx = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom, !dbg !389
  %1 = load %struct.client*, %struct.client** %arrayidx, align 8, !dbg !389
  %tobool = icmp ne %struct.client* %1, null, !dbg !389
  br i1 %tobool, label %if.end, label %if.then, !dbg !390, !cf.info !124

if.then:                                          ; preds = %entry
  br label %while.end24, !dbg !391

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %handle.addr, align 4, !dbg !392
  %idxprom1 = sext i32 %2 to i64, !dbg !393
  %arrayidx2 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom1, !dbg !393
  %3 = load %struct.client*, %struct.client** %arrayidx2, align 8, !dbg !393
  %pos = getelementptr inbounds %struct.client, %struct.client* %3, i32 0, i32 1, !dbg !394
  %4 = load i32, i32* %pos, align 4, !dbg !394
  store i32 %4, i32* %j, align 4, !dbg !395
  store i32 0, i32* %i, align 4, !dbg !396
  br label %for.cond, !dbg !398

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !399
  %6 = load i32, i32* %buf_len.addr, align 4, !dbg !401
  %cmp = icmp slt i32 %5, %6, !dbg !402
  br i1 %cmp, label %for.body, label %for.end, !dbg !403

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %buf.addr, align 8, !dbg !404
  %8 = load i32, i32* %i, align 4, !dbg !406
  %idxprom3 = sext i32 %8 to i64, !dbg !404
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %idxprom3, !dbg !404
  %9 = load i8, i8* %arrayidx4, align 1, !dbg !404
  %10 = load i32, i32* %handle.addr, align 4, !dbg !407
  %idxprom5 = sext i32 %10 to i64, !dbg !408
  %arrayidx6 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom5, !dbg !408
  %11 = load %struct.client*, %struct.client** %arrayidx6, align 8, !dbg !408
  %buffer = getelementptr inbounds %struct.client, %struct.client* %11, i32 0, i32 0, !dbg !409
  %12 = load i32, i32* %j, align 4, !dbg !410
  %idxprom7 = sext i32 %12 to i64, !dbg !408
  %arrayidx8 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer, i64 0, i64 %idxprom7, !dbg !408
  store i8 %9, i8* %arrayidx8, align 1, !dbg !411
  %13 = load i32, i32* %j, align 4, !dbg !412
  %cmp9 = icmp eq i32 %13, 4000, !dbg !414
  br i1 %cmp9, label %if.then10, label %if.end15, !dbg !415, !cf.info !124

if.then10:                                        ; preds = %for.body
  br label %while.cond, !dbg !416

while.cond:                                       ; preds = %while.body, %if.then10
  %14 = load i32, i32* %handle.addr, align 4, !dbg !418
  %call = call i32 @RelayText(i32 %14), !dbg !419
  %tobool11 = icmp ne i32 %call, 0, !dbg !416
  br i1 %tobool11, label %while.body, label %while.end, !dbg !416

while.body:                                       ; preds = %while.cond
  br label %while.cond, !dbg !416, !llvm.loop !420

while.end:                                        ; preds = %while.cond
  %15 = load i32, i32* %handle.addr, align 4, !dbg !422
  %idxprom12 = sext i32 %15 to i64, !dbg !423
  %arrayidx13 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom12, !dbg !423
  %16 = load %struct.client*, %struct.client** %arrayidx13, align 8, !dbg !423
  %pos14 = getelementptr inbounds %struct.client, %struct.client* %16, i32 0, i32 1, !dbg !424
  %17 = load i32, i32* %pos14, align 4, !dbg !424
  store i32 %17, i32* %j, align 4, !dbg !425
  br label %if.end15, !dbg !426

if.end15:                                         ; preds = %while.end, %for.body
  br label %for.inc, !dbg !427

for.inc:                                          ; preds = %if.end15
  %18 = load i32, i32* %i, align 4, !dbg !428
  %inc = add nsw i32 %18, 1, !dbg !428
  store i32 %inc, i32* %i, align 4, !dbg !428
  %19 = load i32, i32* %j, align 4, !dbg !429
  %inc16 = add nsw i32 %19, 1, !dbg !429
  store i32 %inc16, i32* %j, align 4, !dbg !429
  br label %for.cond, !dbg !430, !llvm.loop !431

for.end:                                          ; preds = %for.cond
  %20 = load i32, i32* %j, align 4, !dbg !433
  %21 = load i32, i32* %handle.addr, align 4, !dbg !434
  %idxprom17 = sext i32 %21 to i64, !dbg !435
  %arrayidx18 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom17, !dbg !435
  %22 = load %struct.client*, %struct.client** %arrayidx18, align 8, !dbg !435
  %pos19 = getelementptr inbounds %struct.client, %struct.client* %22, i32 0, i32 1, !dbg !436
  store i32 %20, i32* %pos19, align 4, !dbg !437
  br label %while.cond20, !dbg !438

while.cond20:                                     ; preds = %while.body23, %for.end
  %23 = load i32, i32* %handle.addr, align 4, !dbg !439
  %call21 = call i32 @RelayText(i32 %23), !dbg !440
  %tobool22 = icmp ne i32 %call21, 0, !dbg !438
  br i1 %tobool22, label %while.body23, label %while.end24, !dbg !438

while.body23:                                     ; preds = %while.cond20
  br label %while.cond20, !dbg !438, !llvm.loop !441

while.end24:                                      ; preds = %if.then, %while.cond20
  ret void, !dbg !443
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ChatLoop() #0 !dbg !444 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %__d0 = alloca i32, align 4
  %__d1 = alloca i32, align 4
  %cliinfo = alloca %struct.sockaddr_in, align 4
  %addrlen = alloca i32, align 4
  %handle = alloca i32, align 4
  %buf = alloca [512 x i8], align 16
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !447, metadata !DIExpression()), !dbg !448
  call void @llvm.dbg.declare(metadata i32* %j, metadata !449, metadata !DIExpression()), !dbg !450
  br label %do.body, !dbg !451

do.body:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %__d0, metadata !452, metadata !DIExpression()), !dbg !454
  call void @llvm.dbg.declare(metadata i32* %__d1, metadata !455, metadata !DIExpression()), !dbg !454
  %0 = call { i64, i64* } asm sideeffect "cld; rep; stosq", "={cx},={di},{ax},0,1,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 0, i64 16, i64* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0, i64 0)) #7, !dbg !454, !srcloc !456
  %asmresult = extractvalue { i64, i64* } %0, 0, !dbg !454
  %asmresult1 = extractvalue { i64, i64* } %0, 1, !dbg !454
  %1 = trunc i64 %asmresult to i32, !dbg !454
  store i32 %1, i32* %__d0, align 4, !dbg !454
  %2 = ptrtoint i64* %asmresult1 to i64, !dbg !454
  %3 = trunc i64 %2 to i32, !dbg !454
  store i32 %3, i32* %__d1, align 4, !dbg !454
  br label %do.end, !dbg !454

do.end:                                           ; preds = %do.body
  %4 = load i32, i32* @tsocket, align 4, !dbg !457
  %rem = srem i32 %4, 64, !dbg !457
  %sh_prom = zext i32 %rem to i64, !dbg !457
  %shl = shl i64 1, %sh_prom, !dbg !457
  %5 = load i32, i32* @tsocket, align 4, !dbg !457
  %div = sdiv i32 %5, 64, !dbg !457
  %idxprom = sext i32 %div to i64, !dbg !457
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom, !dbg !457
  %6 = load i64, i64* %arrayidx, align 8, !dbg !457
  %or = or i64 %6, %shl, !dbg !457
  store i64 %or, i64* %arrayidx, align 8, !dbg !457
  %7 = load i64, i64* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0, i64 0), align 8, !dbg !458
  %or2 = or i64 %7, 1, !dbg !458
  store i64 %or2, i64* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0, i64 0), align 8, !dbg !458
  br label %while.body, !dbg !459

while.body:                                       ; preds = %do.end, %for.end
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 bitcast (%struct.fd_set* @current to i8*), i8* align 8 bitcast (%struct.fd_set* @status to i8*), i64 128, i1 false), !dbg !460
  %call = call i32 @select(i32 1024, %struct.fd_set* @current, %struct.fd_set* null, %struct.fd_set* null, %struct.timeval* null), !dbg !462
  %cmp = icmp eq i32 %call, -1, !dbg !464
  br i1 %cmp, label %if.then, label %if.end, !dbg !465, !cf.info !124

if.then:                                          ; preds = %while.body
  call void @perror(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0)), !dbg !466
  ret i32 0, !dbg !468

if.end:                                           ; preds = %while.body
  store i32 0, i32* %i, align 4, !dbg !469
  br label %for.cond, !dbg !471

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !472
  %cmp3 = icmp slt i32 %8, 1024, !dbg !474
  br i1 %cmp3, label %for.body, label %for.end, !dbg !475

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !476
  %div4 = sdiv i32 %9, 64, !dbg !476
  %idxprom5 = sext i32 %div4 to i64, !dbg !476
  %arrayidx6 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @current, i32 0, i32 0), i64 0, i64 %idxprom5, !dbg !476
  %10 = load i64, i64* %arrayidx6, align 8, !dbg !476
  %11 = load i32, i32* %i, align 4, !dbg !476
  %rem7 = srem i32 %11, 64, !dbg !476
  %sh_prom8 = zext i32 %rem7 to i64, !dbg !476
  %shl9 = shl i64 1, %sh_prom8, !dbg !476
  %and = and i64 %10, %shl9, !dbg !476
  %cmp10 = icmp ne i64 %and, 0, !dbg !476
  br i1 %cmp10, label %if.then11, label %if.end47, !dbg !479, !cf.info !124

if.then11:                                        ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !480
  %13 = load i32, i32* @tsocket, align 4, !dbg !483
  %cmp12 = icmp eq i32 %12, %13, !dbg !484
  br i1 %cmp12, label %if.then13, label %if.else38, !dbg !485, !cf.info !124

if.then13:                                        ; preds = %if.then11
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %cliinfo, metadata !486, metadata !DIExpression()), !dbg !488
  call void @llvm.dbg.declare(metadata i32* %addrlen, metadata !489, metadata !DIExpression()), !dbg !493
  store i32 16, i32* %addrlen, align 4, !dbg !493
  call void @llvm.dbg.declare(metadata i32* %handle, metadata !494, metadata !DIExpression()), !dbg !495
  %14 = load i32, i32* @tsocket, align 4, !dbg !496
  %15 = bitcast %struct.sockaddr_in* %cliinfo to %struct.sockaddr*, !dbg !497
  %call14 = call i32 @accept(i32 %14, %struct.sockaddr* %15, i32* %addrlen), !dbg !498
  store i32 %call14, i32* %handle, align 4, !dbg !499
  %16 = load i32, i32* %handle, align 4, !dbg !500
  %cmp15 = icmp eq i32 %16, -1, !dbg !502
  br i1 %cmp15, label %if.then16, label %if.else, !dbg !503, !cf.info !124

if.then16:                                        ; preds = %if.then13
  call void @perror(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.5, i64 0, i64 0)), !dbg !504
  br label %if.end37, !dbg !506

if.else:                                          ; preds = %if.then13
  %17 = load i32, i32* %handle, align 4, !dbg !507
  %cmp17 = icmp sgt i32 %17, 1024, !dbg !509
  br i1 %cmp17, label %if.then18, label %if.else21, !dbg !510, !cf.info !124

if.then18:                                        ; preds = %if.else
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i64 0, i64 0)), !dbg !511
  %18 = load i32, i32* %handle, align 4, !dbg !513
  %call20 = call i32 (i32, ...) bitcast (i32 (...)* @close to i32 (i32, ...)*)(i32 %18), !dbg !514
  br label %if.end36, !dbg !515

if.else21:                                        ; preds = %if.else
  %19 = load i32, i32* %handle, align 4, !dbg !516
  %call22 = call i32 (i32, i8*, i32, ...) bitcast (i32 (...)* @write to i32 (i32, i8*, i32, ...)*)(i32 %19, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i64 0, i64 0), i32 12), !dbg !519
  %cmp23 = icmp sge i32 %call22, 0, !dbg !520
  br i1 %cmp23, label %if.then24, label %if.end35, !dbg !521, !cf.info !124

if.then24:                                        ; preds = %if.else21
  %20 = load i32, i32* %handle, align 4, !dbg !522
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %cliinfo, i32 0, i32 2, !dbg !524
  %coerce.dive = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !525
  %21 = load i32, i32* %coerce.dive, align 4, !dbg !525
  %call25 = call i32 (i32, ...) bitcast (i32 (...)* @inet_ntoa to i32 (i32, ...)*)(i32 %21), !dbg !525
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %cliinfo, i32 0, i32 1, !dbg !526
  %22 = load i16, i16* %sin_port, align 2, !dbg !526
  %call26 = call zeroext i16 @ntohs(i16 zeroext %22) #8, !dbg !527
  %conv = zext i16 %call26 to i32, !dbg !527
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.8, i64 0, i64 0), i32 %20, i32 %call25, i32 %conv), !dbg !528
  %23 = load i32, i32* %handle, align 4, !dbg !529
  %rem28 = srem i32 %23, 64, !dbg !529
  %sh_prom29 = zext i32 %rem28 to i64, !dbg !529
  %shl30 = shl i64 1, %sh_prom29, !dbg !529
  %24 = load i32, i32* %handle, align 4, !dbg !529
  %div31 = sdiv i32 %24, 64, !dbg !529
  %idxprom32 = sext i32 %div31 to i64, !dbg !529
  %arrayidx33 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom32, !dbg !529
  %25 = load i64, i64* %arrayidx33, align 8, !dbg !529
  %or34 = or i64 %25, %shl30, !dbg !529
  store i64 %or34, i64* %arrayidx33, align 8, !dbg !529
  %26 = load i32, i32* %handle, align 4, !dbg !530
  call void @AddConnection(i32 %26), !dbg !531
  br label %if.end35, !dbg !532

if.end35:                                         ; preds = %if.then24, %if.else21
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then18
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then16
  br label %if.end46, !dbg !533

if.else38:                                        ; preds = %if.then11
  call void @llvm.dbg.declare(metadata [512 x i8]* %buf, metadata !534, metadata !DIExpression()), !dbg !536
  call void @llvm.dbg.declare(metadata i32* %b, metadata !537, metadata !DIExpression()), !dbg !538
  %27 = load i32, i32* %i, align 4, !dbg !539
  %arraydecay = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !540
  %call39 = call i32 (i32, i8*, i32, ...) bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %27, i8* %arraydecay, i32 500), !dbg !541
  store i32 %call39, i32* %b, align 4, !dbg !542
  %28 = load i32, i32* %b, align 4, !dbg !543
  %cmp40 = icmp sle i32 %28, 0, !dbg !545
  br i1 %cmp40, label %if.then42, label %if.else43, !dbg !546, !cf.info !124

if.then42:                                        ; preds = %if.else38
  %29 = load i32, i32* %i, align 4, !dbg !547
  call void @CloseConnection(i32 %29), !dbg !549
  br label %if.end45, !dbg !550

if.else43:                                        ; preds = %if.else38
  %30 = load i32, i32* %i, align 4, !dbg !551
  %arraydecay44 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !553
  %31 = load i32, i32* %b, align 4, !dbg !554
  call void @ClientText(i32 %30, i8* %arraydecay44, i32 %31), !dbg !555
  br label %if.end45

if.end45:                                         ; preds = %if.else43, %if.then42
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.end37
  br label %if.end47, !dbg !556

if.end47:                                         ; preds = %if.end46, %for.body
  br label %for.inc, !dbg !557

for.inc:                                          ; preds = %if.end47
  %32 = load i32, i32* %i, align 4, !dbg !558
  %inc = add nsw i32 %32, 1, !dbg !558
  store i32 %inc, i32* %i, align 4, !dbg !558
  br label %for.cond, !dbg !559, !llvm.loop !560

for.end:                                          ; preds = %for.cond
  br label %while.body, !dbg !459, !llvm.loop !562
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i32 @select(i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*) #3

declare dso_local void @perror(i8*) #3

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #3

declare dso_local i32 @inet_ntoa(...) #3

; Function Attrs: nounwind readnone
declare dso_local zeroext i16 @ntohs(i16 zeroext) #5

declare dso_local i32 @read(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !564 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !568, metadata !DIExpression()), !dbg !569
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !570, metadata !DIExpression()), !dbg !571
  %call = call i32 @socket(i32 2, i32 1, i32 0) #7, !dbg !572
  store i32 %call, i32* @tsocket, align 4, !dbg !573
  store i16 2, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 0), align 4, !dbg !574
  %call1 = call zeroext i16 @htons(i16 zeroext 7070) #8, !dbg !575
  store i16 %call1, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 1), align 2, !dbg !576
  %0 = load i32, i32* %argc.addr, align 4, !dbg !577
  %cmp = icmp sgt i32 %0, 1, !dbg !579
  br i1 %cmp, label %if.then, label %if.end, !dbg !580, !cf.info !124

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !581
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !581
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !581
  %call2 = call i32 @atoi(i8* %2) #9, !dbg !583
  %conv = trunc i32 %call2 to i16, !dbg !583
  %call3 = call zeroext i16 @htons(i16 zeroext %conv) #8, !dbg !584
  store i16 %call3, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 1), align 2, !dbg !585
  br label %if.end, !dbg !586

if.end:                                           ; preds = %if.then, %entry
  %call4 = call i32 @htonl(i32 0) #8, !dbg !587
  store i32 %call4, i32* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 2, i32 0), align 4, !dbg !588
  %3 = load i32, i32* @tsocket, align 4, !dbg !589
  %4 = load i16, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 1), align 2, !dbg !590
  %call5 = call zeroext i16 @ntohs(i16 zeroext %4) #8, !dbg !591
  %conv6 = zext i16 %call5 to i32, !dbg !591
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.9, i64 0, i64 0), i32 %3, i32 %conv6), !dbg !592
  %5 = load i32, i32* @tsocket, align 4, !dbg !593
  %call8 = call i32 @bind(i32 %5, %struct.sockaddr* bitcast (%struct.sockaddr_in* @tsockinfo to %struct.sockaddr*), i32 16) #7, !dbg !595
  %cmp9 = icmp eq i32 %call8, -1, !dbg !596
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !597, !cf.info !124

if.then11:                                        ; preds = %if.end
  call void @perror(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0)), !dbg !598
  store i32 -1, i32* %retval, align 4, !dbg !600
  br label %return, !dbg !600

if.end12:                                         ; preds = %if.end
  %6 = load i32, i32* @tsocket, align 4, !dbg !601
  %call13 = call i32 @listen(i32 %6, i32 10) #7, !dbg !603
  %cmp14 = icmp eq i32 %call13, -1, !dbg !604
  br i1 %cmp14, label %if.then16, label %if.end17, !dbg !605, !cf.info !124

if.then16:                                        ; preds = %if.end12
  call void @perror(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i64 0, i64 0)), !dbg !606
  br label %if.end17, !dbg !608

if.end17:                                         ; preds = %if.then16, %if.end12
  %call18 = call i32 @ChatLoop(), !dbg !609
  store i32 0, i32* %retval, align 4, !dbg !610
  br label %return, !dbg !610

return:                                           ; preds = %if.end17, %if.then11
  %7 = load i32, i32* %retval, align 4, !dbg !611
  ret i32 %7, !dbg !611
}

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: nounwind readnone
declare dso_local zeroext i16 @htons(i16 zeroext) #5

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #6

; Function Attrs: nounwind readnone
declare dso_local i32 @htonl(i32) #5

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #2

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone }
attributes #9 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!81, !82, !83}
!llvm.ident = !{!84}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "connections", scope: !2, file: !3, line: 18, type: !65, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !18, globals: !30, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "chat-server.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Chat-server")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !6, line: 24, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17}
!9 = !DIEnumerator(name: "SOCK_STREAM", value: 1, isUnsigned: true)
!10 = !DIEnumerator(name: "SOCK_DGRAM", value: 2, isUnsigned: true)
!11 = !DIEnumerator(name: "SOCK_RAW", value: 3, isUnsigned: true)
!12 = !DIEnumerator(name: "SOCK_RDM", value: 4, isUnsigned: true)
!13 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5, isUnsigned: true)
!14 = !DIEnumerator(name: "SOCK_DCCP", value: 6, isUnsigned: true)
!15 = !DIEnumerator(name: "SOCK_PACKET", value: 10, isUnsigned: true)
!16 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288, isUnsigned: true)
!17 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048, isUnsigned: true)
!18 = !{!19, !22, !23, !24}
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fd_mask", file: !20, line: 49, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/select.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !25, line: 30, baseType: !26)
!25 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !27, line: 26, baseType: !28)
!27 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !29, line: 42, baseType: !7)
!29 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!30 = !{!31, !33, !54, !63, !0}
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "tsocket", scope: !2, file: !3, line: 8, type: !22, isLocal: false, isDefinition: true)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "tsockinfo", scope: !2, file: !3, line: 9, type: !35, isLocal: false, isDefinition: true)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !25, line: 238, size: 128, elements: !36)
!36 = !{!37, !41, !45, !49}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !35, file: !25, line: 240, baseType: !38, size: 16)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !39, line: 28, baseType: !40)
!39 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!40 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !35, file: !25, line: 241, baseType: !42, size: 16, offset: 16)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !25, line: 119, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !27, line: 25, baseType: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !29, line: 40, baseType: !40)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !35, file: !25, line: 242, baseType: !46, size: 32, offset: 32)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !25, line: 31, size: 32, elements: !47)
!47 = !{!48}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !46, file: !25, line: 33, baseType: !24, size: 32)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !35, file: !25, line: 245, baseType: !50, size: 64, offset: 64)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 64, elements: !52)
!51 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!52 = !{!53}
!53 = !DISubrange(count: 8)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "status", scope: !2, file: !3, line: 10, type: !56, isLocal: false, isDefinition: true)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "fd_set", file: !20, line: 70, baseType: !57)
!57 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !20, line: 59, size: 1024, elements: !58)
!58 = !{!59}
!59 = !DIDerivedType(tag: DW_TAG_member, name: "__fds_bits", scope: !57, file: !20, line: 67, baseType: !60, size: 1024)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 1024, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 16)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(name: "current", scope: !2, file: !3, line: 10, type: !56, isLocal: false, isDefinition: true)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !66, size: 65536, elements: !79)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "client", file: !3, line: 13, size: 33056, elements: !68)
!68 = !{!69, !74, !75}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !67, file: !3, line: 15, baseType: !70, size: 32768)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 32768, elements: !72)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !{!73}
!73 = !DISubrange(count: 4096)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !67, file: !3, line: 16, baseType: !22, size: 32, offset: 32768)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !67, file: !3, line: 17, baseType: !76, size: 256, offset: 32800)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 256, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 32)
!79 = !{!80}
!80 = !DISubrange(count: 1024)
!81 = !{i32 7, !"Dwarf Version", i32 4}
!82 = !{i32 2, !"Debug Info Version", i32 3}
!83 = !{i32 1, !"wchar_size", i32 4}
!84 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!85 = distinct !DISubprogram(name: "AddConnection", scope: !3, file: !3, line: 20, type: !86, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!86 = !DISubroutineType(types: !87)
!87 = !{null, !22}
!88 = !{}
!89 = !DILocalVariable(name: "handle", arg: 1, scope: !85, file: !3, line: 20, type: !22)
!90 = !DILocation(line: 20, column: 24, scope: !85)
!91 = !DILocation(line: 22, column: 27, scope: !85)
!92 = !DILocation(line: 22, column: 17, scope: !85)
!93 = !DILocation(line: 22, column: 5, scope: !85)
!94 = !DILocation(line: 22, column: 25, scope: !85)
!95 = !DILocation(line: 23, column: 17, scope: !85)
!96 = !DILocation(line: 23, column: 5, scope: !85)
!97 = !DILocation(line: 23, column: 26, scope: !85)
!98 = !DILocation(line: 23, column: 36, scope: !85)
!99 = !DILocation(line: 24, column: 17, scope: !85)
!100 = !DILocation(line: 24, column: 5, scope: !85)
!101 = !DILocation(line: 24, column: 26, scope: !85)
!102 = !DILocation(line: 24, column: 30, scope: !85)
!103 = !DILocation(line: 25, column: 17, scope: !85)
!104 = !DILocation(line: 25, column: 5, scope: !85)
!105 = !DILocation(line: 25, column: 26, scope: !85)
!106 = !DILocation(line: 25, column: 34, scope: !85)
!107 = !DILocation(line: 26, column: 1, scope: !85)
!108 = distinct !DISubprogram(name: "CloseConnection", scope: !3, file: !3, line: 28, type: !86, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!109 = !DILocalVariable(name: "handle", arg: 1, scope: !108, file: !3, line: 28, type: !22)
!110 = !DILocation(line: 28, column: 26, scope: !108)
!111 = !DILocalVariable(name: "buf", scope: !108, file: !3, line: 30, type: !112)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 4096, elements: !113)
!113 = !{!114}
!114 = !DISubrange(count: 512)
!115 = !DILocation(line: 30, column: 10, scope: !108)
!116 = !DILocalVariable(name: "j", scope: !108, file: !3, line: 31, type: !22)
!117 = !DILocation(line: 31, column: 9, scope: !108)
!118 = !DILocation(line: 33, column: 5, scope: !108)
!119 = !DILocation(line: 35, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !108, file: !3, line: 35, column: 9)
!121 = !DILocation(line: 35, column: 9, scope: !120)
!122 = !DILocation(line: 35, column: 30, scope: !120)
!123 = !DILocation(line: 35, column: 9, scope: !108)
!124 = !{!"if"}
!125 = !DILocation(line: 37, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !3, line: 36, column: 5)
!127 = !DILocation(line: 37, column: 60, scope: !126)
!128 = !DILocation(line: 37, column: 48, scope: !126)
!129 = !DILocation(line: 37, column: 69, scope: !126)
!130 = !DILocation(line: 37, column: 9, scope: !126)
!131 = !DILocation(line: 39, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !3, line: 39, column: 9)
!133 = !DILocation(line: 39, column: 14, scope: !132)
!134 = !DILocation(line: 39, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !3, line: 39, column: 9)
!136 = !DILocation(line: 39, column: 23, scope: !135)
!137 = !DILocation(line: 39, column: 9, scope: !132)
!138 = !DILocation(line: 41, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !140, file: !3, line: 41, column: 17)
!140 = distinct !DILexicalBlock(scope: !135, file: !3, line: 40, column: 9)
!141 = !DILocation(line: 41, column: 27, scope: !139)
!142 = !DILocation(line: 41, column: 24, scope: !139)
!143 = !DILocation(line: 41, column: 29, scope: !139)
!144 = !DILocation(line: 41, column: 32, scope: !139)
!145 = !DILocation(line: 41, column: 37, scope: !139)
!146 = !DILocation(line: 41, column: 34, scope: !139)
!147 = !DILocation(line: 41, column: 45, scope: !139)
!148 = !DILocation(line: 41, column: 48, scope: !139)
!149 = !DILocation(line: 41, column: 17, scope: !140)
!150 = !DILocation(line: 43, column: 27, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !3, line: 43, column: 21)
!152 = distinct !DILexicalBlock(scope: !139, file: !3, line: 42, column: 13)
!153 = !DILocation(line: 43, column: 30, scope: !151)
!154 = !DILocation(line: 43, column: 42, scope: !151)
!155 = !DILocation(line: 43, column: 35, scope: !151)
!156 = !DILocation(line: 43, column: 21, scope: !151)
!157 = !DILocation(line: 43, column: 48, scope: !151)
!158 = !DILocation(line: 43, column: 21, scope: !152)
!159 = !DILocation(line: 45, column: 37, scope: !160)
!160 = distinct !DILexicalBlock(scope: !151, file: !3, line: 44, column: 17)
!161 = !DILocation(line: 45, column: 21, scope: !160)
!162 = !DILocation(line: 46, column: 17, scope: !160)
!163 = !DILocation(line: 47, column: 13, scope: !152)
!164 = !DILocation(line: 48, column: 9, scope: !140)
!165 = !DILocation(line: 39, column: 38, scope: !135)
!166 = !DILocation(line: 39, column: 9, scope: !135)
!167 = distinct !{!167, !137, !168}
!168 = !DILocation(line: 48, column: 9, scope: !132)
!169 = !DILocation(line: 49, column: 5, scope: !126)
!170 = !DILocation(line: 51, column: 52, scope: !171)
!171 = distinct !DILexicalBlock(scope: !120, file: !3, line: 50, column: 5)
!172 = !DILocation(line: 51, column: 9, scope: !171)
!173 = !DILocation(line: 53, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !108, file: !3, line: 53, column: 9)
!175 = !DILocation(line: 53, column: 9, scope: !174)
!176 = !DILocation(line: 53, column: 9, scope: !108)
!177 = !DILocation(line: 55, column: 26, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !3, line: 54, column: 5)
!179 = !DILocation(line: 55, column: 14, scope: !178)
!180 = !DILocation(line: 55, column: 9, scope: !178)
!181 = !DILocation(line: 56, column: 5, scope: !178)
!182 = !DILocation(line: 57, column: 11, scope: !108)
!183 = !DILocation(line: 57, column: 5, scope: !108)
!184 = !DILocation(line: 58, column: 1, scope: !108)
!185 = distinct !DISubprogram(name: "strip", scope: !3, file: !3, line: 60, type: !186, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!186 = !DISubroutineType(types: !187)
!187 = !{null, !188}
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!189 = !DILocalVariable(name: "buf", arg: 1, scope: !185, file: !3, line: 60, type: !188)
!190 = !DILocation(line: 60, column: 18, scope: !185)
!191 = !DILocalVariable(name: "x", scope: !185, file: !3, line: 62, type: !188)
!192 = !DILocation(line: 62, column: 11, scope: !185)
!193 = !DILocation(line: 64, column: 16, scope: !185)
!194 = !DILocation(line: 64, column: 9, scope: !185)
!195 = !DILocation(line: 64, column: 7, scope: !185)
!196 = !DILocation(line: 65, column: 9, scope: !197)
!197 = distinct !DILexicalBlock(scope: !185, file: !3, line: 65, column: 9)
!198 = !DILocation(line: 65, column: 9, scope: !185)
!199 = !DILocation(line: 65, column: 15, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !3, line: 65, column: 12)
!201 = !DILocation(line: 65, column: 16, scope: !200)
!202 = !DILocation(line: 65, column: 23, scope: !200)
!203 = !DILocation(line: 66, column: 16, scope: !185)
!204 = !DILocation(line: 66, column: 9, scope: !185)
!205 = !DILocation(line: 66, column: 7, scope: !185)
!206 = !DILocation(line: 67, column: 9, scope: !207)
!207 = distinct !DILexicalBlock(scope: !185, file: !3, line: 67, column: 9)
!208 = !DILocation(line: 67, column: 9, scope: !185)
!209 = !DILocation(line: 67, column: 15, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !3, line: 67, column: 12)
!211 = !DILocation(line: 67, column: 16, scope: !210)
!212 = !DILocation(line: 67, column: 23, scope: !210)
!213 = !DILocation(line: 68, column: 1, scope: !185)
!214 = distinct !DISubprogram(name: "RelayText", scope: !3, file: !3, line: 70, type: !215, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!215 = !DISubroutineType(types: !216)
!216 = !{!22, !22}
!217 = !DILocalVariable(name: "handle", arg: 1, scope: !214, file: !3, line: 70, type: !22)
!218 = !DILocation(line: 70, column: 19, scope: !214)
!219 = !DILocalVariable(name: "begin", scope: !214, file: !3, line: 72, type: !188)
!220 = !DILocation(line: 72, column: 11, scope: !214)
!221 = !DILocalVariable(name: "end", scope: !214, file: !3, line: 72, type: !188)
!222 = !DILocation(line: 72, column: 19, scope: !214)
!223 = !DILocalVariable(name: "ret", scope: !214, file: !3, line: 73, type: !22)
!224 = !DILocation(line: 73, column: 9, scope: !214)
!225 = !DILocation(line: 74, column: 25, scope: !214)
!226 = !DILocation(line: 74, column: 13, scope: !214)
!227 = !DILocation(line: 74, column: 34, scope: !214)
!228 = !DILocation(line: 74, column: 11, scope: !214)
!229 = !DILocation(line: 75, column: 21, scope: !230)
!230 = distinct !DILexicalBlock(scope: !214, file: !3, line: 75, column: 9)
!231 = !DILocation(line: 75, column: 9, scope: !230)
!232 = !DILocation(line: 75, column: 30, scope: !230)
!233 = !DILocation(line: 75, column: 34, scope: !230)
!234 = !DILocation(line: 75, column: 9, scope: !214)
!235 = !DILocation(line: 77, column: 13, scope: !236)
!236 = distinct !DILexicalBlock(scope: !237, file: !3, line: 77, column: 13)
!237 = distinct !DILexicalBlock(scope: !230, file: !3, line: 76, column: 5)
!238 = !DILocation(line: 77, column: 25, scope: !236)
!239 = !DILocation(line: 77, column: 13, scope: !237)
!240 = !DILocation(line: 78, column: 13, scope: !236)
!241 = !DILocation(line: 78, column: 25, scope: !236)
!242 = !DILocation(line: 80, column: 13, scope: !243)
!243 = distinct !DILexicalBlock(scope: !236, file: !3, line: 79, column: 14)
!244 = !DILocation(line: 80, column: 25, scope: !243)
!245 = !DILocation(line: 81, column: 13, scope: !243)
!246 = !DILocation(line: 81, column: 25, scope: !243)
!247 = !DILocation(line: 83, column: 5, scope: !237)
!248 = !DILocation(line: 84, column: 9, scope: !249)
!249 = distinct !DILexicalBlock(scope: !230, file: !3, line: 83, column: 12)
!250 = !DILocation(line: 84, column: 27, scope: !249)
!251 = !DILocation(line: 84, column: 15, scope: !249)
!252 = !DILocation(line: 84, column: 36, scope: !249)
!253 = !DILocation(line: 84, column: 41, scope: !249)
!254 = !DILocation(line: 87, column: 18, scope: !214)
!255 = !DILocation(line: 87, column: 11, scope: !214)
!256 = !DILocation(line: 87, column: 9, scope: !214)
!257 = !DILocation(line: 88, column: 5, scope: !214)
!258 = !DILocation(line: 88, column: 12, scope: !214)
!259 = !DILocation(line: 88, column: 16, scope: !214)
!260 = !DILocalVariable(name: "output", scope: !261, file: !3, line: 90, type: !262)
!261 = distinct !DILexicalBlock(scope: !214, file: !3, line: 89, column: 5)
!262 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 64000, elements: !263)
!263 = !{!264}
!264 = !DISubrange(count: 8000)
!265 = !DILocation(line: 90, column: 14, scope: !261)
!266 = !DILocation(line: 91, column: 9, scope: !261)
!267 = !DILocation(line: 91, column: 19, scope: !261)
!268 = !DILocation(line: 92, column: 26, scope: !269)
!269 = distinct !DILexicalBlock(scope: !261, file: !3, line: 92, column: 13)
!270 = !DILocation(line: 92, column: 14, scope: !269)
!271 = !DILocation(line: 92, column: 35, scope: !269)
!272 = !DILocation(line: 92, column: 13, scope: !261)
!273 = !DILocation(line: 94, column: 33, scope: !274)
!274 = distinct !DILexicalBlock(scope: !269, file: !3, line: 93, column: 9)
!275 = !DILocation(line: 94, column: 21, scope: !274)
!276 = !DILocation(line: 94, column: 42, scope: !274)
!277 = !DILocation(line: 94, column: 48, scope: !274)
!278 = !DILocation(line: 94, column: 13, scope: !274)
!279 = !DILocation(line: 95, column: 25, scope: !274)
!280 = !DILocation(line: 95, column: 13, scope: !274)
!281 = !DILocation(line: 95, column: 34, scope: !274)
!282 = !DILocation(line: 95, column: 43, scope: !274)
!283 = !DILocation(line: 97, column: 31, scope: !274)
!284 = !DILocation(line: 97, column: 19, scope: !274)
!285 = !DILocation(line: 97, column: 40, scope: !274)
!286 = !DILocation(line: 97, column: 13, scope: !274)
!287 = !DILocation(line: 98, column: 21, scope: !274)
!288 = !DILocation(line: 98, column: 64, scope: !274)
!289 = !DILocation(line: 98, column: 52, scope: !274)
!290 = !DILocation(line: 98, column: 73, scope: !274)
!291 = !DILocation(line: 98, column: 13, scope: !274)
!292 = !DILocation(line: 99, column: 17, scope: !274)
!293 = !DILocation(line: 100, column: 9, scope: !274)
!294 = !DILocation(line: 102, column: 21, scope: !295)
!295 = distinct !DILexicalBlock(scope: !269, file: !3, line: 101, column: 9)
!296 = !DILocation(line: 102, column: 57, scope: !295)
!297 = !DILocation(line: 102, column: 45, scope: !295)
!298 = !DILocation(line: 102, column: 66, scope: !295)
!299 = !DILocation(line: 103, column: 21, scope: !295)
!300 = !DILocation(line: 103, column: 25, scope: !295)
!301 = !DILocation(line: 103, column: 24, scope: !295)
!302 = !DILocation(line: 103, column: 32, scope: !295)
!303 = !DILocation(line: 102, column: 13, scope: !295)
!304 = !DILocation(line: 104, column: 17, scope: !295)
!305 = !DILocation(line: 107, column: 13, scope: !306)
!306 = distinct !DILexicalBlock(scope: !261, file: !3, line: 107, column: 13)
!307 = !DILocation(line: 107, column: 13, scope: !261)
!308 = !DILocalVariable(name: "j", scope: !309, file: !3, line: 109, type: !22)
!309 = distinct !DILexicalBlock(scope: !306, file: !3, line: 108, column: 9)
!310 = !DILocation(line: 109, column: 17, scope: !309)
!311 = !DILocation(line: 110, column: 20, scope: !312)
!312 = distinct !DILexicalBlock(scope: !309, file: !3, line: 110, column: 13)
!313 = !DILocation(line: 110, column: 18, scope: !312)
!314 = !DILocation(line: 110, column: 25, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !3, line: 110, column: 13)
!316 = !DILocation(line: 110, column: 27, scope: !315)
!317 = !DILocation(line: 110, column: 13, scope: !312)
!318 = !DILocation(line: 112, column: 21, scope: !319)
!319 = distinct !DILexicalBlock(scope: !320, file: !3, line: 112, column: 21)
!320 = distinct !DILexicalBlock(scope: !315, file: !3, line: 111, column: 13)
!321 = !DILocation(line: 112, column: 31, scope: !319)
!322 = !DILocation(line: 112, column: 28, scope: !319)
!323 = !DILocation(line: 112, column: 33, scope: !319)
!324 = !DILocation(line: 112, column: 36, scope: !319)
!325 = !DILocation(line: 112, column: 41, scope: !319)
!326 = !DILocation(line: 112, column: 38, scope: !319)
!327 = !DILocation(line: 112, column: 49, scope: !319)
!328 = !DILocation(line: 112, column: 52, scope: !319)
!329 = !DILocation(line: 112, column: 21, scope: !320)
!330 = !DILocation(line: 114, column: 31, scope: !331)
!331 = distinct !DILexicalBlock(scope: !332, file: !3, line: 114, column: 25)
!332 = distinct !DILexicalBlock(scope: !319, file: !3, line: 113, column: 17)
!333 = !DILocation(line: 114, column: 34, scope: !331)
!334 = !DILocation(line: 114, column: 49, scope: !331)
!335 = !DILocation(line: 114, column: 42, scope: !331)
!336 = !DILocation(line: 114, column: 25, scope: !331)
!337 = !DILocation(line: 114, column: 58, scope: !331)
!338 = !DILocation(line: 114, column: 25, scope: !332)
!339 = !DILocation(line: 116, column: 41, scope: !340)
!340 = distinct !DILexicalBlock(scope: !331, file: !3, line: 115, column: 21)
!341 = !DILocation(line: 116, column: 25, scope: !340)
!342 = !DILocation(line: 117, column: 21, scope: !340)
!343 = !DILocation(line: 118, column: 17, scope: !332)
!344 = !DILocation(line: 119, column: 13, scope: !320)
!345 = !DILocation(line: 110, column: 42, scope: !315)
!346 = !DILocation(line: 110, column: 13, scope: !315)
!347 = distinct !{!347, !317, !348}
!348 = !DILocation(line: 119, column: 13, scope: !312)
!349 = !DILocation(line: 120, column: 9, scope: !309)
!350 = !DILocation(line: 121, column: 17, scope: !261)
!351 = !DILocation(line: 121, column: 20, scope: !261)
!352 = !DILocation(line: 121, column: 15, scope: !261)
!353 = !DILocation(line: 122, column: 22, scope: !261)
!354 = !DILocation(line: 122, column: 15, scope: !261)
!355 = !DILocation(line: 122, column: 13, scope: !261)
!356 = distinct !{!356, !257, !357}
!357 = !DILocation(line: 123, column: 5, scope: !214)
!358 = !DILocation(line: 125, column: 24, scope: !214)
!359 = !DILocation(line: 125, column: 12, scope: !214)
!360 = !DILocation(line: 125, column: 33, scope: !214)
!361 = !DILocation(line: 125, column: 41, scope: !214)
!362 = !DILocation(line: 125, column: 5, scope: !214)
!363 = !DILocation(line: 126, column: 33, scope: !214)
!364 = !DILocation(line: 126, column: 53, scope: !214)
!365 = !DILocation(line: 126, column: 41, scope: !214)
!366 = !DILocation(line: 126, column: 62, scope: !214)
!367 = !DILocation(line: 126, column: 39, scope: !214)
!368 = !DILocation(line: 126, column: 17, scope: !214)
!369 = !DILocation(line: 126, column: 5, scope: !214)
!370 = !DILocation(line: 126, column: 26, scope: !214)
!371 = !DILocation(line: 126, column: 30, scope: !214)
!372 = !DILocation(line: 127, column: 12, scope: !214)
!373 = !DILocation(line: 127, column: 5, scope: !214)
!374 = distinct !DISubprogram(name: "ClientText", scope: !3, file: !3, line: 130, type: !375, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!375 = !DISubroutineType(types: !376)
!376 = !{null, !22, !188, !22}
!377 = !DILocalVariable(name: "handle", arg: 1, scope: !374, file: !3, line: 130, type: !22)
!378 = !DILocation(line: 130, column: 21, scope: !374)
!379 = !DILocalVariable(name: "buf", arg: 2, scope: !374, file: !3, line: 130, type: !188)
!380 = !DILocation(line: 130, column: 35, scope: !374)
!381 = !DILocalVariable(name: "buf_len", arg: 3, scope: !374, file: !3, line: 130, type: !22)
!382 = !DILocation(line: 130, column: 44, scope: !374)
!383 = !DILocalVariable(name: "i", scope: !374, file: !3, line: 132, type: !22)
!384 = !DILocation(line: 132, column: 9, scope: !374)
!385 = !DILocalVariable(name: "j", scope: !374, file: !3, line: 132, type: !22)
!386 = !DILocation(line: 132, column: 12, scope: !374)
!387 = !DILocation(line: 133, column: 22, scope: !388)
!388 = distinct !DILexicalBlock(scope: !374, file: !3, line: 133, column: 9)
!389 = !DILocation(line: 133, column: 10, scope: !388)
!390 = !DILocation(line: 133, column: 9, scope: !374)
!391 = !DILocation(line: 134, column: 9, scope: !388)
!392 = !DILocation(line: 135, column: 21, scope: !374)
!393 = !DILocation(line: 135, column: 9, scope: !374)
!394 = !DILocation(line: 135, column: 30, scope: !374)
!395 = !DILocation(line: 135, column: 7, scope: !374)
!396 = !DILocation(line: 137, column: 12, scope: !397)
!397 = distinct !DILexicalBlock(scope: !374, file: !3, line: 137, column: 5)
!398 = !DILocation(line: 137, column: 10, scope: !397)
!399 = !DILocation(line: 137, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !397, file: !3, line: 137, column: 5)
!401 = !DILocation(line: 137, column: 21, scope: !400)
!402 = !DILocation(line: 137, column: 19, scope: !400)
!403 = !DILocation(line: 137, column: 5, scope: !397)
!404 = !DILocation(line: 139, column: 42, scope: !405)
!405 = distinct !DILexicalBlock(scope: !400, file: !3, line: 138, column: 5)
!406 = !DILocation(line: 139, column: 46, scope: !405)
!407 = !DILocation(line: 139, column: 21, scope: !405)
!408 = !DILocation(line: 139, column: 9, scope: !405)
!409 = !DILocation(line: 139, column: 30, scope: !405)
!410 = !DILocation(line: 139, column: 37, scope: !405)
!411 = !DILocation(line: 139, column: 40, scope: !405)
!412 = !DILocation(line: 141, column: 13, scope: !413)
!413 = distinct !DILexicalBlock(scope: !405, file: !3, line: 141, column: 13)
!414 = !DILocation(line: 141, column: 15, scope: !413)
!415 = !DILocation(line: 141, column: 13, scope: !405)
!416 = !DILocation(line: 143, column: 13, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !3, line: 142, column: 9)
!418 = !DILocation(line: 143, column: 30, scope: !417)
!419 = !DILocation(line: 143, column: 20, scope: !417)
!420 = distinct !{!420, !416, !421}
!421 = !DILocation(line: 143, column: 38, scope: !417)
!422 = !DILocation(line: 144, column: 29, scope: !417)
!423 = !DILocation(line: 144, column: 17, scope: !417)
!424 = !DILocation(line: 144, column: 38, scope: !417)
!425 = !DILocation(line: 144, column: 15, scope: !417)
!426 = !DILocation(line: 145, column: 9, scope: !417)
!427 = !DILocation(line: 146, column: 5, scope: !405)
!428 = !DILocation(line: 137, column: 30, scope: !400)
!429 = !DILocation(line: 137, column: 35, scope: !400)
!430 = !DILocation(line: 137, column: 5, scope: !400)
!431 = distinct !{!431, !403, !432}
!432 = !DILocation(line: 146, column: 5, scope: !397)
!433 = !DILocation(line: 147, column: 32, scope: !374)
!434 = !DILocation(line: 147, column: 17, scope: !374)
!435 = !DILocation(line: 147, column: 5, scope: !374)
!436 = !DILocation(line: 147, column: 26, scope: !374)
!437 = !DILocation(line: 147, column: 30, scope: !374)
!438 = !DILocation(line: 149, column: 5, scope: !374)
!439 = !DILocation(line: 149, column: 22, scope: !374)
!440 = !DILocation(line: 149, column: 12, scope: !374)
!441 = distinct !{!441, !438, !442}
!442 = !DILocation(line: 149, column: 30, scope: !374)
!443 = !DILocation(line: 150, column: 1, scope: !374)
!444 = distinct !DISubprogram(name: "ChatLoop", scope: !3, file: !3, line: 153, type: !445, scopeLine: 154, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!445 = !DISubroutineType(types: !446)
!446 = !{!22}
!447 = !DILocalVariable(name: "i", scope: !444, file: !3, line: 155, type: !22)
!448 = !DILocation(line: 155, column: 9, scope: !444)
!449 = !DILocalVariable(name: "j", scope: !444, file: !3, line: 155, type: !22)
!450 = !DILocation(line: 155, column: 12, scope: !444)
!451 = !DILocation(line: 156, column: 5, scope: !444)
!452 = !DILocalVariable(name: "__d0", scope: !453, file: !3, line: 156, type: !22)
!453 = distinct !DILexicalBlock(scope: !444, file: !3, line: 156, column: 5)
!454 = !DILocation(line: 156, column: 5, scope: !453)
!455 = !DILocalVariable(name: "__d1", scope: !453, file: !3, line: 156, type: !22)
!456 = !{i32 -2147138770}
!457 = !DILocation(line: 158, column: 5, scope: !444)
!458 = !DILocation(line: 159, column: 5, scope: !444)
!459 = !DILocation(line: 161, column: 5, scope: !444)
!460 = !DILocation(line: 163, column: 19, scope: !461)
!461 = distinct !DILexicalBlock(scope: !444, file: !3, line: 162, column: 5)
!462 = !DILocation(line: 164, column: 13, scope: !463)
!463 = distinct !DILexicalBlock(scope: !461, file: !3, line: 164, column: 13)
!464 = !DILocation(line: 164, column: 59, scope: !463)
!465 = !DILocation(line: 164, column: 13, scope: !461)
!466 = !DILocation(line: 166, column: 13, scope: !467)
!467 = distinct !DILexicalBlock(scope: !463, file: !3, line: 165, column: 9)
!468 = !DILocation(line: 167, column: 13, scope: !467)
!469 = !DILocation(line: 169, column: 16, scope: !470)
!470 = distinct !DILexicalBlock(scope: !461, file: !3, line: 169, column: 9)
!471 = !DILocation(line: 169, column: 14, scope: !470)
!472 = !DILocation(line: 169, column: 21, scope: !473)
!473 = distinct !DILexicalBlock(scope: !470, file: !3, line: 169, column: 9)
!474 = !DILocation(line: 169, column: 23, scope: !473)
!475 = !DILocation(line: 169, column: 9, scope: !470)
!476 = !DILocation(line: 171, column: 17, scope: !477)
!477 = distinct !DILexicalBlock(scope: !478, file: !3, line: 171, column: 17)
!478 = distinct !DILexicalBlock(scope: !473, file: !3, line: 170, column: 9)
!479 = !DILocation(line: 171, column: 17, scope: !478)
!480 = !DILocation(line: 173, column: 21, scope: !481)
!481 = distinct !DILexicalBlock(scope: !482, file: !3, line: 173, column: 21)
!482 = distinct !DILexicalBlock(scope: !477, file: !3, line: 172, column: 13)
!483 = !DILocation(line: 173, column: 26, scope: !481)
!484 = !DILocation(line: 173, column: 23, scope: !481)
!485 = !DILocation(line: 173, column: 21, scope: !482)
!486 = !DILocalVariable(name: "cliinfo", scope: !487, file: !3, line: 175, type: !35)
!487 = distinct !DILexicalBlock(scope: !481, file: !3, line: 174, column: 17)
!488 = !DILocation(line: 175, column: 40, scope: !487)
!489 = !DILocalVariable(name: "addrlen", scope: !487, file: !3, line: 176, type: !490)
!490 = !DIDerivedType(tag: DW_TAG_typedef, name: "socklen_t", file: !491, line: 33, baseType: !492)
!491 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!492 = !DIDerivedType(tag: DW_TAG_typedef, name: "__socklen_t", file: !29, line: 209, baseType: !7)
!493 = !DILocation(line: 176, column: 31, scope: !487)
!494 = !DILocalVariable(name: "handle", scope: !487, file: !3, line: 177, type: !22)
!495 = !DILocation(line: 177, column: 25, scope: !487)
!496 = !DILocation(line: 178, column: 37, scope: !487)
!497 = !DILocation(line: 178, column: 46, scope: !487)
!498 = !DILocation(line: 178, column: 30, scope: !487)
!499 = !DILocation(line: 178, column: 28, scope: !487)
!500 = !DILocation(line: 179, column: 25, scope: !501)
!501 = distinct !DILexicalBlock(scope: !487, file: !3, line: 179, column: 25)
!502 = !DILocation(line: 179, column: 32, scope: !501)
!503 = !DILocation(line: 179, column: 25, scope: !487)
!504 = !DILocation(line: 181, column: 25, scope: !505)
!505 = distinct !DILexicalBlock(scope: !501, file: !3, line: 180, column: 21)
!506 = !DILocation(line: 182, column: 21, scope: !505)
!507 = !DILocation(line: 182, column: 32, scope: !508)
!508 = distinct !DILexicalBlock(scope: !501, file: !3, line: 182, column: 32)
!509 = !DILocation(line: 182, column: 39, scope: !508)
!510 = !DILocation(line: 182, column: 32, scope: !501)
!511 = !DILocation(line: 184, column: 25, scope: !512)
!512 = distinct !DILexicalBlock(scope: !508, file: !3, line: 183, column: 21)
!513 = !DILocation(line: 185, column: 31, scope: !512)
!514 = !DILocation(line: 185, column: 25, scope: !512)
!515 = !DILocation(line: 186, column: 21, scope: !512)
!516 = !DILocation(line: 189, column: 35, scope: !517)
!517 = distinct !DILexicalBlock(scope: !518, file: !3, line: 189, column: 29)
!518 = distinct !DILexicalBlock(scope: !508, file: !3, line: 188, column: 21)
!519 = !DILocation(line: 189, column: 29, scope: !517)
!520 = !DILocation(line: 189, column: 63, scope: !517)
!521 = !DILocation(line: 189, column: 29, scope: !518)
!522 = !DILocation(line: 192, column: 33, scope: !523)
!523 = distinct !DILexicalBlock(scope: !517, file: !3, line: 190, column: 25)
!524 = !DILocation(line: 193, column: 52, scope: !523)
!525 = !DILocation(line: 193, column: 33, scope: !523)
!526 = !DILocation(line: 194, column: 47, scope: !523)
!527 = !DILocation(line: 194, column: 33, scope: !523)
!528 = !DILocation(line: 191, column: 29, scope: !523)
!529 = !DILocation(line: 195, column: 29, scope: !523)
!530 = !DILocation(line: 197, column: 43, scope: !523)
!531 = !DILocation(line: 197, column: 29, scope: !523)
!532 = !DILocation(line: 198, column: 25, scope: !523)
!533 = !DILocation(line: 200, column: 17, scope: !487)
!534 = !DILocalVariable(name: "buf", scope: !535, file: !3, line: 203, type: !112)
!535 = distinct !DILexicalBlock(scope: !481, file: !3, line: 202, column: 17)
!536 = !DILocation(line: 203, column: 26, scope: !535)
!537 = !DILocalVariable(name: "b", scope: !535, file: !3, line: 204, type: !22)
!538 = !DILocation(line: 204, column: 25, scope: !535)
!539 = !DILocation(line: 206, column: 30, scope: !535)
!540 = !DILocation(line: 206, column: 33, scope: !535)
!541 = !DILocation(line: 206, column: 25, scope: !535)
!542 = !DILocation(line: 206, column: 23, scope: !535)
!543 = !DILocation(line: 207, column: 25, scope: !544)
!544 = distinct !DILexicalBlock(scope: !535, file: !3, line: 207, column: 25)
!545 = !DILocation(line: 207, column: 27, scope: !544)
!546 = !DILocation(line: 207, column: 25, scope: !535)
!547 = !DILocation(line: 209, column: 41, scope: !548)
!548 = distinct !DILexicalBlock(scope: !544, file: !3, line: 208, column: 21)
!549 = !DILocation(line: 209, column: 25, scope: !548)
!550 = !DILocation(line: 210, column: 21, scope: !548)
!551 = !DILocation(line: 213, column: 36, scope: !552)
!552 = distinct !DILexicalBlock(scope: !544, file: !3, line: 212, column: 21)
!553 = !DILocation(line: 213, column: 39, scope: !552)
!554 = !DILocation(line: 213, column: 44, scope: !552)
!555 = !DILocation(line: 213, column: 25, scope: !552)
!556 = !DILocation(line: 216, column: 13, scope: !482)
!557 = !DILocation(line: 217, column: 9, scope: !478)
!558 = !DILocation(line: 169, column: 37, scope: !473)
!559 = !DILocation(line: 169, column: 9, scope: !473)
!560 = distinct !{!560, !475, !561}
!561 = !DILocation(line: 217, column: 9, scope: !470)
!562 = distinct !{!562, !459, !563}
!563 = !DILocation(line: 218, column: 5, scope: !444)
!564 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 221, type: !565, scopeLine: 222, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!565 = !DISubroutineType(types: !566)
!566 = !{!22, !22, !567}
!567 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!568 = !DILocalVariable(name: "argc", arg: 1, scope: !564, file: !3, line: 221, type: !22)
!569 = !DILocation(line: 221, column: 15, scope: !564)
!570 = !DILocalVariable(name: "argv", arg: 2, scope: !564, file: !3, line: 221, type: !567)
!571 = !DILocation(line: 221, column: 26, scope: !564)
!572 = !DILocation(line: 223, column: 15, scope: !564)
!573 = !DILocation(line: 223, column: 13, scope: !564)
!574 = !DILocation(line: 225, column: 26, scope: !564)
!575 = !DILocation(line: 226, column: 26, scope: !564)
!576 = !DILocation(line: 226, column: 24, scope: !564)
!577 = !DILocation(line: 227, column: 9, scope: !578)
!578 = distinct !DILexicalBlock(scope: !564, file: !3, line: 227, column: 9)
!579 = !DILocation(line: 227, column: 14, scope: !578)
!580 = !DILocation(line: 227, column: 9, scope: !564)
!581 = !DILocation(line: 229, column: 41, scope: !582)
!582 = distinct !DILexicalBlock(scope: !578, file: !3, line: 228, column: 5)
!583 = !DILocation(line: 229, column: 36, scope: !582)
!584 = !DILocation(line: 229, column: 30, scope: !582)
!585 = !DILocation(line: 229, column: 28, scope: !582)
!586 = !DILocation(line: 230, column: 5, scope: !582)
!587 = !DILocation(line: 231, column: 33, scope: !564)
!588 = !DILocation(line: 231, column: 31, scope: !564)
!589 = !DILocation(line: 232, column: 40, scope: !564)
!590 = !DILocation(line: 232, column: 65, scope: !564)
!591 = !DILocation(line: 232, column: 49, scope: !564)
!592 = !DILocation(line: 232, column: 5, scope: !564)
!593 = !DILocation(line: 234, column: 14, scope: !594)
!594 = distinct !DILexicalBlock(scope: !564, file: !3, line: 234, column: 9)
!595 = !DILocation(line: 234, column: 9, scope: !594)
!596 = !DILocation(line: 234, column: 54, scope: !594)
!597 = !DILocation(line: 234, column: 9, scope: !564)
!598 = !DILocation(line: 236, column: 9, scope: !599)
!599 = distinct !DILexicalBlock(scope: !594, file: !3, line: 235, column: 5)
!600 = !DILocation(line: 237, column: 9, scope: !599)
!601 = !DILocation(line: 240, column: 16, scope: !602)
!602 = distinct !DILexicalBlock(scope: !564, file: !3, line: 240, column: 9)
!603 = !DILocation(line: 240, column: 9, scope: !602)
!604 = !DILocation(line: 240, column: 29, scope: !602)
!605 = !DILocation(line: 240, column: 9, scope: !564)
!606 = !DILocation(line: 242, column: 9, scope: !607)
!607 = distinct !DILexicalBlock(scope: !602, file: !3, line: 241, column: 5)
!608 = !DILocation(line: 243, column: 5, scope: !607)
!609 = !DILocation(line: 245, column: 5, scope: !564)
!610 = !DILocation(line: 247, column: 5, scope: !564)
!611 = !DILocation(line: 248, column: 1, scope: !564)
