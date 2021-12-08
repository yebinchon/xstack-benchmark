; ModuleID = 'chat-server.bc'
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
  br i1 %tobool, label %if.then, label %if.else, !dbg !123

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !124
  %6 = load i32, i32* %handle.addr, align 4, !dbg !126
  %idxprom4 = sext i32 %6 to i64, !dbg !127
  %arrayidx5 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom4, !dbg !127
  %7 = load %struct.client*, %struct.client** %arrayidx5, align 8, !dbg !127
  %name6 = getelementptr inbounds %struct.client, %struct.client* %7, i32 0, i32 2, !dbg !128
  %arraydecay7 = getelementptr inbounds [32 x i8], [32 x i8]* %name6, i64 0, i64 0, !dbg !127
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i8* %arraydecay7) #7, !dbg !129
  store i32 0, i32* %j, align 4, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.then
  %8 = load i32, i32* %j, align 4, !dbg !133
  %cmp = icmp slt i32 %8, 1024, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %handle.addr, align 4, !dbg !137
  %10 = load i32, i32* %j, align 4, !dbg !140
  %cmp8 = icmp ne i32 %9, %10, !dbg !141
  br i1 %cmp8, label %land.lhs.true, label %if.end26, !dbg !142

land.lhs.true:                                    ; preds = %for.body
  %11 = load i32, i32* %j, align 4, !dbg !143
  %12 = load i32, i32* @tsocket, align 4, !dbg !144
  %cmp9 = icmp ne i32 %11, %12, !dbg !145
  br i1 %cmp9, label %land.lhs.true10, label %if.end26, !dbg !146

land.lhs.true10:                                  ; preds = %land.lhs.true
  %13 = load i32, i32* %j, align 4, !dbg !147
  %div11 = sdiv i32 %13, 64, !dbg !147
  %idxprom12 = sext i32 %div11 to i64, !dbg !147
  %arrayidx13 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom12, !dbg !147
  %14 = load i64, i64* %arrayidx13, align 8, !dbg !147
  %15 = load i32, i32* %j, align 4, !dbg !147
  %rem14 = srem i32 %15, 64, !dbg !147
  %sh_prom15 = zext i32 %rem14 to i64, !dbg !147
  %shl16 = shl i64 1, %sh_prom15, !dbg !147
  %and17 = and i64 %14, %shl16, !dbg !147
  %cmp18 = icmp ne i64 %and17, 0, !dbg !147
  br i1 %cmp18, label %if.then19, label %if.end26, !dbg !148

if.then19:                                        ; preds = %land.lhs.true10
  %16 = load i32, i32* %j, align 4, !dbg !149
  %arraydecay20 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !152
  %arraydecay21 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !153
  %call22 = call i64 @strlen(i8* %arraydecay21), !dbg !154
  %call23 = call i32 (i32, i8*, i64, ...) bitcast (i32 (...)* @write to i32 (i32, i8*, i64, ...)*)(i32 %16, i8* %arraydecay20, i64 %call22), !dbg !155
  %cmp24 = icmp slt i32 %call23, 0, !dbg !156
  br i1 %cmp24, label %if.then25, label %if.end, !dbg !157

if.then25:                                        ; preds = %if.then19
  %17 = load i32, i32* %j, align 4, !dbg !158
  call void @CloseConnection(i32 %17), !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then25, %if.then19
  br label %if.end26, !dbg !162

if.end26:                                         ; preds = %if.end, %land.lhs.true10, %land.lhs.true, %for.body
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %if.end26
  %18 = load i32, i32* %j, align 4, !dbg !164
  %inc = add nsw i32 %18, 1, !dbg !164
  store i32 %inc, i32* %j, align 4, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  br label %if.end28, !dbg !168

if.else:                                          ; preds = %entry
  %19 = load i32, i32* %handle.addr, align 4, !dbg !169
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 %19), !dbg !171
  br label %if.end28

if.end28:                                         ; preds = %if.else, %for.end
  %20 = load i32, i32* %handle.addr, align 4, !dbg !172
  %idxprom29 = sext i32 %20 to i64, !dbg !174
  %arrayidx30 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom29, !dbg !174
  %21 = load %struct.client*, %struct.client** %arrayidx30, align 8, !dbg !174
  %tobool31 = icmp ne %struct.client* %21, null, !dbg !174
  br i1 %tobool31, label %if.then32, label %if.end35, !dbg !175

if.then32:                                        ; preds = %if.end28
  %22 = load i32, i32* %handle.addr, align 4, !dbg !176
  %idxprom33 = sext i32 %22 to i64, !dbg !178
  %arrayidx34 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom33, !dbg !178
  %23 = load %struct.client*, %struct.client** %arrayidx34, align 8, !dbg !178
  %24 = bitcast %struct.client* %23 to i8*, !dbg !178
  call void @free(i8* %24) #7, !dbg !179
  br label %if.end35, !dbg !180

if.end35:                                         ; preds = %if.then32, %if.end28
  %25 = load i32, i32* %handle.addr, align 4, !dbg !181
  %call36 = call i32 (i32, ...) bitcast (i32 (...)* @close to i32 (i32, ...)*)(i32 %25), !dbg !182
  ret void, !dbg !183
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
define dso_local void @strip(i8* %buf) #0 !dbg !184 {
entry:
  %buf.addr = alloca i8*, align 8
  %x = alloca i8*, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !188, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata i8** %x, metadata !190, metadata !DIExpression()), !dbg !191
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !192
  %call = call i8* @strchr(i8* %0, i32 10), !dbg !193
  store i8* %call, i8** %x, align 8, !dbg !194
  %1 = load i8*, i8** %x, align 8, !dbg !195
  %tobool = icmp ne i8* %1, null, !dbg !195
  br i1 %tobool, label %if.then, label %if.end, !dbg !197

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %x, align 8, !dbg !198
  store i8 0, i8* %2, align 1, !dbg !200
  br label %if.end, !dbg !201

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !202
  %call1 = call i8* @strchr(i8* %3, i32 13), !dbg !203
  store i8* %call1, i8** %x, align 8, !dbg !204
  %4 = load i8*, i8** %x, align 8, !dbg !205
  %tobool2 = icmp ne i8* %4, null, !dbg !205
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !207

if.then3:                                         ; preds = %if.end
  %5 = load i8*, i8** %x, align 8, !dbg !208
  store i8 0, i8* %5, align 1, !dbg !210
  br label %if.end4, !dbg !211

if.end4:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !212
}

declare dso_local i8* @strchr(i8*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @RelayText(i32 %handle) #0 !dbg !213 {
entry:
  %handle.addr = alloca i32, align 4
  %begin = alloca i8*, align 8
  %end = alloca i8*, align 8
  %ret = alloca i32, align 4
  %output = alloca [8000 x i8], align 16
  %j = alloca i32, align 4
  store i32 %handle, i32* %handle.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %handle.addr, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i8** %begin, metadata !218, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata i8** %end, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !222, metadata !DIExpression()), !dbg !223
  store i32 0, i32* %ret, align 4, !dbg !223
  %0 = load i32, i32* %handle.addr, align 4, !dbg !224
  %idxprom = sext i32 %0 to i64, !dbg !225
  %arrayidx = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom, !dbg !225
  %1 = load %struct.client*, %struct.client** %arrayidx, align 8, !dbg !225
  %buffer = getelementptr inbounds %struct.client, %struct.client* %1, i32 0, i32 0, !dbg !226
  %arraydecay = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer, i64 0, i64 0, !dbg !225
  store i8* %arraydecay, i8** %begin, align 8, !dbg !227
  %2 = load i32, i32* %handle.addr, align 4, !dbg !228
  %idxprom1 = sext i32 %2 to i64, !dbg !230
  %arrayidx2 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom1, !dbg !230
  %3 = load %struct.client*, %struct.client** %arrayidx2, align 8, !dbg !230
  %pos = getelementptr inbounds %struct.client, %struct.client* %3, i32 0, i32 1, !dbg !231
  %4 = load i32, i32* %pos, align 4, !dbg !231
  %cmp = icmp eq i32 %4, 4000, !dbg !232
  br i1 %cmp, label %if.then, label %if.else10, !dbg !233

if.then:                                          ; preds = %entry
  %5 = load i8*, i8** %begin, align 8, !dbg !234
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 3999, !dbg !234
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !234
  %conv = sext i8 %6 to i32, !dbg !234
  %cmp4 = icmp ne i32 %conv, 10, !dbg !237
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !238

if.then6:                                         ; preds = %if.then
  %7 = load i8*, i8** %begin, align 8, !dbg !239
  %arrayidx7 = getelementptr inbounds i8, i8* %7, i64 4000, !dbg !239
  store i8 0, i8* %arrayidx7, align 1, !dbg !240
  br label %if.end, !dbg !239

if.else:                                          ; preds = %if.then
  %8 = load i8*, i8** %begin, align 8, !dbg !241
  %arrayidx8 = getelementptr inbounds i8, i8* %8, i64 4000, !dbg !241
  store i8 10, i8* %arrayidx8, align 1, !dbg !243
  %9 = load i8*, i8** %begin, align 8, !dbg !244
  %arrayidx9 = getelementptr inbounds i8, i8* %9, i64 4001, !dbg !244
  store i8 0, i8* %arrayidx9, align 1, !dbg !245
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  br label %if.end16, !dbg !246

if.else10:                                        ; preds = %entry
  %10 = load i8*, i8** %begin, align 8, !dbg !247
  %11 = load i32, i32* %handle.addr, align 4, !dbg !249
  %idxprom11 = sext i32 %11 to i64, !dbg !250
  %arrayidx12 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom11, !dbg !250
  %12 = load %struct.client*, %struct.client** %arrayidx12, align 8, !dbg !250
  %pos13 = getelementptr inbounds %struct.client, %struct.client* %12, i32 0, i32 1, !dbg !251
  %13 = load i32, i32* %pos13, align 4, !dbg !251
  %idxprom14 = sext i32 %13 to i64, !dbg !247
  %arrayidx15 = getelementptr inbounds i8, i8* %10, i64 %idxprom14, !dbg !247
  store i8 0, i8* %arrayidx15, align 1, !dbg !252
  br label %if.end16

if.end16:                                         ; preds = %if.else10, %if.end
  %14 = load i8*, i8** %begin, align 8, !dbg !253
  %call = call i8* @strchr(i8* %14, i32 10), !dbg !254
  store i8* %call, i8** %end, align 8, !dbg !255
  br label %while.cond, !dbg !256

while.cond:                                       ; preds = %if.end75, %if.end16
  %15 = load i8*, i8** %end, align 8, !dbg !257
  %cmp17 = icmp ne i8* %15, null, !dbg !258
  br i1 %cmp17, label %while.body, label %while.end, !dbg !256

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata [8000 x i8]* %output, metadata !259, metadata !DIExpression()), !dbg !264
  %arrayidx19 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !265
  store i8 0, i8* %arrayidx19, align 16, !dbg !266
  %16 = load i32, i32* %handle.addr, align 4, !dbg !267
  %idxprom20 = sext i32 %16 to i64, !dbg !269
  %arrayidx21 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom20, !dbg !269
  %17 = load %struct.client*, %struct.client** %arrayidx21, align 8, !dbg !269
  %name = getelementptr inbounds %struct.client, %struct.client* %17, i32 0, i32 2, !dbg !270
  %arrayidx22 = getelementptr inbounds [32 x i8], [32 x i8]* %name, i64 0, i64 0, !dbg !269
  %18 = load i8, i8* %arrayidx22, align 4, !dbg !269
  %tobool = icmp ne i8 %18, 0, !dbg !269
  br i1 %tobool, label %if.else43, label %if.then23, !dbg !271

if.then23:                                        ; preds = %while.body
  %19 = load i32, i32* %handle.addr, align 4, !dbg !272
  %idxprom24 = sext i32 %19 to i64, !dbg !274
  %arrayidx25 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom24, !dbg !274
  %20 = load %struct.client*, %struct.client** %arrayidx25, align 8, !dbg !274
  %name26 = getelementptr inbounds %struct.client, %struct.client* %20, i32 0, i32 2, !dbg !275
  %arraydecay27 = getelementptr inbounds [32 x i8], [32 x i8]* %name26, i64 0, i64 0, !dbg !274
  %21 = load i8*, i8** %begin, align 8, !dbg !276
  %call28 = call i8* @strncpy(i8* %arraydecay27, i8* %21, i64 31), !dbg !277
  %22 = load i32, i32* %handle.addr, align 4, !dbg !278
  %idxprom29 = sext i32 %22 to i64, !dbg !279
  %arrayidx30 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom29, !dbg !279
  %23 = load %struct.client*, %struct.client** %arrayidx30, align 8, !dbg !279
  %name31 = getelementptr inbounds %struct.client, %struct.client* %23, i32 0, i32 2, !dbg !280
  %arrayidx32 = getelementptr inbounds [32 x i8], [32 x i8]* %name31, i64 0, i64 31, !dbg !279
  store i8 0, i8* %arrayidx32, align 1, !dbg !281
  %24 = load i32, i32* %handle.addr, align 4, !dbg !282
  %idxprom33 = sext i32 %24 to i64, !dbg !283
  %arrayidx34 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom33, !dbg !283
  %25 = load %struct.client*, %struct.client** %arrayidx34, align 8, !dbg !283
  %name35 = getelementptr inbounds %struct.client, %struct.client* %25, i32 0, i32 2, !dbg !284
  %arraydecay36 = getelementptr inbounds [32 x i8], [32 x i8]* %name35, i64 0, i64 0, !dbg !283
  call void @strip(i8* %arraydecay36), !dbg !285
  %arraydecay37 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !286
  %26 = load i32, i32* %handle.addr, align 4, !dbg !287
  %idxprom38 = sext i32 %26 to i64, !dbg !288
  %arrayidx39 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom38, !dbg !288
  %27 = load %struct.client*, %struct.client** %arrayidx39, align 8, !dbg !288
  %name40 = getelementptr inbounds %struct.client, %struct.client* %27, i32 0, i32 2, !dbg !289
  %arraydecay41 = getelementptr inbounds [32 x i8], [32 x i8]* %name40, i64 0, i64 0, !dbg !288
  %call42 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay37, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay41) #7, !dbg !290
  store i32 1, i32* %ret, align 4, !dbg !291
  br label %if.end50, !dbg !292

if.else43:                                        ; preds = %while.body
  %arraydecay44 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !293
  %28 = load i32, i32* %handle.addr, align 4, !dbg !295
  %idxprom45 = sext i32 %28 to i64, !dbg !296
  %arrayidx46 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom45, !dbg !296
  %29 = load %struct.client*, %struct.client** %arrayidx46, align 8, !dbg !296
  %name47 = getelementptr inbounds %struct.client, %struct.client* %29, i32 0, i32 2, !dbg !297
  %arraydecay48 = getelementptr inbounds [32 x i8], [32 x i8]* %name47, i64 0, i64 0, !dbg !296
  %30 = load i8*, i8** %end, align 8, !dbg !298
  %31 = load i8*, i8** %begin, align 8, !dbg !299
  %sub.ptr.lhs.cast = ptrtoint i8* %30 to i64, !dbg !300
  %sub.ptr.rhs.cast = ptrtoint i8* %31 to i64, !dbg !300
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !300
  %32 = load i8*, i8** %begin, align 8, !dbg !301
  %call49 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay44, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i8* %arraydecay48, i64 %sub.ptr.sub, i8* %32) #7, !dbg !302
  store i32 1, i32* %ret, align 4, !dbg !303
  br label %if.end50

if.end50:                                         ; preds = %if.else43, %if.then23
  %arrayidx51 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !304
  %33 = load i8, i8* %arrayidx51, align 16, !dbg !304
  %tobool52 = icmp ne i8 %33, 0, !dbg !304
  br i1 %tobool52, label %if.then53, label %if.end75, !dbg !306

if.then53:                                        ; preds = %if.end50
  call void @llvm.dbg.declare(metadata i32* %j, metadata !307, metadata !DIExpression()), !dbg !309
  store i32 0, i32* %j, align 4, !dbg !310
  br label %for.cond, !dbg !312

for.cond:                                         ; preds = %for.inc, %if.then53
  %34 = load i32, i32* %j, align 4, !dbg !313
  %cmp54 = icmp slt i32 %34, 1024, !dbg !315
  br i1 %cmp54, label %for.body, label %for.end, !dbg !316

for.body:                                         ; preds = %for.cond
  %35 = load i32, i32* %handle.addr, align 4, !dbg !317
  %36 = load i32, i32* %j, align 4, !dbg !320
  %cmp56 = icmp ne i32 %35, %36, !dbg !321
  br i1 %cmp56, label %land.lhs.true, label %if.end74, !dbg !322

land.lhs.true:                                    ; preds = %for.body
  %37 = load i32, i32* %j, align 4, !dbg !323
  %38 = load i32, i32* @tsocket, align 4, !dbg !324
  %cmp58 = icmp ne i32 %37, %38, !dbg !325
  br i1 %cmp58, label %land.lhs.true60, label %if.end74, !dbg !326

land.lhs.true60:                                  ; preds = %land.lhs.true
  %39 = load i32, i32* %j, align 4, !dbg !327
  %div = sdiv i32 %39, 64, !dbg !327
  %idxprom61 = sext i32 %div to i64, !dbg !327
  %arrayidx62 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom61, !dbg !327
  %40 = load i64, i64* %arrayidx62, align 8, !dbg !327
  %41 = load i32, i32* %j, align 4, !dbg !327
  %rem = srem i32 %41, 64, !dbg !327
  %sh_prom = zext i32 %rem to i64, !dbg !327
  %shl = shl i64 1, %sh_prom, !dbg !327
  %and = and i64 %40, %shl, !dbg !327
  %cmp63 = icmp ne i64 %and, 0, !dbg !327
  br i1 %cmp63, label %if.then65, label %if.end74, !dbg !328

if.then65:                                        ; preds = %land.lhs.true60
  %42 = load i32, i32* %j, align 4, !dbg !329
  %arraydecay66 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !332
  %arraydecay67 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !333
  %call68 = call i64 @strlen(i8* %arraydecay67), !dbg !334
  %call69 = call i32 (i32, i8*, i64, ...) bitcast (i32 (...)* @write to i32 (i32, i8*, i64, ...)*)(i32 %42, i8* %arraydecay66, i64 %call68), !dbg !335
  %cmp70 = icmp slt i32 %call69, 0, !dbg !336
  br i1 %cmp70, label %if.then72, label %if.end73, !dbg !337

if.then72:                                        ; preds = %if.then65
  %43 = load i32, i32* %j, align 4, !dbg !338
  call void @CloseConnection(i32 %43), !dbg !340
  br label %if.end73, !dbg !341

if.end73:                                         ; preds = %if.then72, %if.then65
  br label %if.end74, !dbg !342

if.end74:                                         ; preds = %if.end73, %land.lhs.true60, %land.lhs.true, %for.body
  br label %for.inc, !dbg !343

for.inc:                                          ; preds = %if.end74
  %44 = load i32, i32* %j, align 4, !dbg !344
  %inc = add nsw i32 %44, 1, !dbg !344
  store i32 %inc, i32* %j, align 4, !dbg !344
  br label %for.cond, !dbg !345, !llvm.loop !346

for.end:                                          ; preds = %for.cond
  br label %if.end75, !dbg !348

if.end75:                                         ; preds = %for.end, %if.end50
  %45 = load i8*, i8** %end, align 8, !dbg !349
  %add.ptr = getelementptr inbounds i8, i8* %45, i64 1, !dbg !350
  store i8* %add.ptr, i8** %begin, align 8, !dbg !351
  %46 = load i8*, i8** %begin, align 8, !dbg !352
  %call76 = call i8* @strchr(i8* %46, i32 10), !dbg !353
  store i8* %call76, i8** %end, align 8, !dbg !354
  br label %while.cond, !dbg !256, !llvm.loop !355

while.end:                                        ; preds = %while.cond
  %47 = load i32, i32* %handle.addr, align 4, !dbg !357
  %idxprom77 = sext i32 %47 to i64, !dbg !358
  %arrayidx78 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom77, !dbg !358
  %48 = load %struct.client*, %struct.client** %arrayidx78, align 8, !dbg !358
  %buffer79 = getelementptr inbounds %struct.client, %struct.client* %48, i32 0, i32 0, !dbg !359
  %arraydecay80 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer79, i64 0, i64 0, !dbg !358
  %49 = load i8*, i8** %begin, align 8, !dbg !360
  %call81 = call i8* @strcpy(i8* %arraydecay80, i8* %49), !dbg !361
  %50 = load i8*, i8** %begin, align 8, !dbg !362
  %51 = load i32, i32* %handle.addr, align 4, !dbg !363
  %idxprom82 = sext i32 %51 to i64, !dbg !364
  %arrayidx83 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom82, !dbg !364
  %52 = load %struct.client*, %struct.client** %arrayidx83, align 8, !dbg !364
  %buffer84 = getelementptr inbounds %struct.client, %struct.client* %52, i32 0, i32 0, !dbg !365
  %arraydecay85 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer84, i64 0, i64 0, !dbg !364
  %sub.ptr.lhs.cast86 = ptrtoint i8* %50 to i64, !dbg !366
  %sub.ptr.rhs.cast87 = ptrtoint i8* %arraydecay85 to i64, !dbg !366
  %sub.ptr.sub88 = sub i64 %sub.ptr.lhs.cast86, %sub.ptr.rhs.cast87, !dbg !366
  %53 = load i32, i32* %handle.addr, align 4, !dbg !367
  %idxprom89 = sext i32 %53 to i64, !dbg !368
  %arrayidx90 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom89, !dbg !368
  %54 = load %struct.client*, %struct.client** %arrayidx90, align 8, !dbg !368
  %pos91 = getelementptr inbounds %struct.client, %struct.client* %54, i32 0, i32 1, !dbg !369
  %55 = load i32, i32* %pos91, align 4, !dbg !370
  %conv92 = sext i32 %55 to i64, !dbg !370
  %sub = sub nsw i64 %conv92, %sub.ptr.sub88, !dbg !370
  %conv93 = trunc i64 %sub to i32, !dbg !370
  store i32 %conv93, i32* %pos91, align 4, !dbg !370
  %56 = load i32, i32* %ret, align 4, !dbg !371
  ret i32 %56, !dbg !372
}

declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @ClientText(i32 %handle, i8* %buf, i32 %buf_len) #0 !dbg !373 {
entry:
  %handle.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %buf_len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %handle, i32* %handle.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %handle.addr, metadata !376, metadata !DIExpression()), !dbg !377
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !378, metadata !DIExpression()), !dbg !379
  store i32 %buf_len, i32* %buf_len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %buf_len.addr, metadata !380, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.declare(metadata i32* %i, metadata !382, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.declare(metadata i32* %j, metadata !384, metadata !DIExpression()), !dbg !385
  %0 = load i32, i32* %handle.addr, align 4, !dbg !386
  %idxprom = sext i32 %0 to i64, !dbg !388
  %arrayidx = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom, !dbg !388
  %1 = load %struct.client*, %struct.client** %arrayidx, align 8, !dbg !388
  %tobool = icmp ne %struct.client* %1, null, !dbg !388
  br i1 %tobool, label %if.end, label %if.then, !dbg !389

if.then:                                          ; preds = %entry
  br label %while.end24, !dbg !390

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %handle.addr, align 4, !dbg !391
  %idxprom1 = sext i32 %2 to i64, !dbg !392
  %arrayidx2 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom1, !dbg !392
  %3 = load %struct.client*, %struct.client** %arrayidx2, align 8, !dbg !392
  %pos = getelementptr inbounds %struct.client, %struct.client* %3, i32 0, i32 1, !dbg !393
  %4 = load i32, i32* %pos, align 4, !dbg !393
  store i32 %4, i32* %j, align 4, !dbg !394
  store i32 0, i32* %i, align 4, !dbg !395
  br label %for.cond, !dbg !397

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !398
  %6 = load i32, i32* %buf_len.addr, align 4, !dbg !400
  %cmp = icmp slt i32 %5, %6, !dbg !401
  br i1 %cmp, label %for.body, label %for.end, !dbg !402

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %buf.addr, align 8, !dbg !403
  %8 = load i32, i32* %i, align 4, !dbg !405
  %idxprom3 = sext i32 %8 to i64, !dbg !403
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %idxprom3, !dbg !403
  %9 = load i8, i8* %arrayidx4, align 1, !dbg !403
  %10 = load i32, i32* %handle.addr, align 4, !dbg !406
  %idxprom5 = sext i32 %10 to i64, !dbg !407
  %arrayidx6 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom5, !dbg !407
  %11 = load %struct.client*, %struct.client** %arrayidx6, align 8, !dbg !407
  %buffer = getelementptr inbounds %struct.client, %struct.client* %11, i32 0, i32 0, !dbg !408
  %12 = load i32, i32* %j, align 4, !dbg !409
  %idxprom7 = sext i32 %12 to i64, !dbg !407
  %arrayidx8 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer, i64 0, i64 %idxprom7, !dbg !407
  store i8 %9, i8* %arrayidx8, align 1, !dbg !410
  %13 = load i32, i32* %j, align 4, !dbg !411
  %cmp9 = icmp eq i32 %13, 4000, !dbg !413
  br i1 %cmp9, label %if.then10, label %if.end15, !dbg !414

if.then10:                                        ; preds = %for.body
  br label %while.cond, !dbg !415

while.cond:                                       ; preds = %while.body, %if.then10
  %14 = load i32, i32* %handle.addr, align 4, !dbg !417
  %call = call i32 @RelayText(i32 %14), !dbg !418
  %tobool11 = icmp ne i32 %call, 0, !dbg !415
  br i1 %tobool11, label %while.body, label %while.end, !dbg !415

while.body:                                       ; preds = %while.cond
  br label %while.cond, !dbg !415, !llvm.loop !419

while.end:                                        ; preds = %while.cond
  %15 = load i32, i32* %handle.addr, align 4, !dbg !421
  %idxprom12 = sext i32 %15 to i64, !dbg !422
  %arrayidx13 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom12, !dbg !422
  %16 = load %struct.client*, %struct.client** %arrayidx13, align 8, !dbg !422
  %pos14 = getelementptr inbounds %struct.client, %struct.client* %16, i32 0, i32 1, !dbg !423
  %17 = load i32, i32* %pos14, align 4, !dbg !423
  store i32 %17, i32* %j, align 4, !dbg !424
  br label %if.end15, !dbg !425

if.end15:                                         ; preds = %while.end, %for.body
  br label %for.inc, !dbg !426

for.inc:                                          ; preds = %if.end15
  %18 = load i32, i32* %i, align 4, !dbg !427
  %inc = add nsw i32 %18, 1, !dbg !427
  store i32 %inc, i32* %i, align 4, !dbg !427
  %19 = load i32, i32* %j, align 4, !dbg !428
  %inc16 = add nsw i32 %19, 1, !dbg !428
  store i32 %inc16, i32* %j, align 4, !dbg !428
  br label %for.cond, !dbg !429, !llvm.loop !430

for.end:                                          ; preds = %for.cond
  %20 = load i32, i32* %j, align 4, !dbg !432
  %21 = load i32, i32* %handle.addr, align 4, !dbg !433
  %idxprom17 = sext i32 %21 to i64, !dbg !434
  %arrayidx18 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom17, !dbg !434
  %22 = load %struct.client*, %struct.client** %arrayidx18, align 8, !dbg !434
  %pos19 = getelementptr inbounds %struct.client, %struct.client* %22, i32 0, i32 1, !dbg !435
  store i32 %20, i32* %pos19, align 4, !dbg !436
  br label %while.cond20, !dbg !437

while.cond20:                                     ; preds = %while.body23, %for.end
  %23 = load i32, i32* %handle.addr, align 4, !dbg !438
  %call21 = call i32 @RelayText(i32 %23), !dbg !439
  %tobool22 = icmp ne i32 %call21, 0, !dbg !437
  br i1 %tobool22, label %while.body23, label %while.end24.loopexit, !dbg !437

while.body23:                                     ; preds = %while.cond20
  br label %while.cond20, !dbg !437, !llvm.loop !440

while.end24.loopexit:                             ; preds = %while.cond20
  br label %while.end24, !dbg !442

while.end24:                                      ; preds = %while.end24.loopexit, %if.then
  ret void, !dbg !442
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ChatLoop() #0 !dbg !443 {
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !446, metadata !DIExpression()), !dbg !447
  call void @llvm.dbg.declare(metadata i32* %j, metadata !448, metadata !DIExpression()), !dbg !449
  br label %do.body, !dbg !450

do.body:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %__d0, metadata !451, metadata !DIExpression()), !dbg !453
  call void @llvm.dbg.declare(metadata i32* %__d1, metadata !454, metadata !DIExpression()), !dbg !453
  %0 = call { i64, i64* } asm sideeffect "cld; rep; stosq", "={cx},={di},{ax},0,1,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 0, i64 16, i64* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0, i64 0)) #7, !dbg !453, !srcloc !455
  %asmresult = extractvalue { i64, i64* } %0, 0, !dbg !453
  %asmresult1 = extractvalue { i64, i64* } %0, 1, !dbg !453
  %1 = trunc i64 %asmresult to i32, !dbg !453
  store i32 %1, i32* %__d0, align 4, !dbg !453
  %2 = ptrtoint i64* %asmresult1 to i64, !dbg !453
  %3 = trunc i64 %2 to i32, !dbg !453
  store i32 %3, i32* %__d1, align 4, !dbg !453
  br label %do.end, !dbg !453

do.end:                                           ; preds = %do.body
  %4 = load i32, i32* @tsocket, align 4, !dbg !456
  %rem = srem i32 %4, 64, !dbg !456
  %sh_prom = zext i32 %rem to i64, !dbg !456
  %shl = shl i64 1, %sh_prom, !dbg !456
  %5 = load i32, i32* @tsocket, align 4, !dbg !456
  %div = sdiv i32 %5, 64, !dbg !456
  %idxprom = sext i32 %div to i64, !dbg !456
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom, !dbg !456
  %6 = load i64, i64* %arrayidx, align 8, !dbg !456
  %or = or i64 %6, %shl, !dbg !456
  store i64 %or, i64* %arrayidx, align 8, !dbg !456
  %7 = load i64, i64* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0, i64 0), align 8, !dbg !457
  %or2 = or i64 %7, 1, !dbg !457
  store i64 %or2, i64* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0, i64 0), align 8, !dbg !457
  br label %while.body, !dbg !458

while.body:                                       ; preds = %for.end, %do.end
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 bitcast (%struct.fd_set* @current to i8*), i8* align 8 bitcast (%struct.fd_set* @status to i8*), i64 128, i1 false), !dbg !459
  %call = call i32 @select(i32 1024, %struct.fd_set* @current, %struct.fd_set* null, %struct.fd_set* null, %struct.timeval* null), !dbg !461
  %cmp = icmp eq i32 %call, -1, !dbg !463
  br i1 %cmp, label %if.then, label %if.end, !dbg !464

if.then:                                          ; preds = %while.body
  call void @perror(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0)), !dbg !465
  ret i32 0, !dbg !467

if.end:                                           ; preds = %while.body
  store i32 0, i32* %i, align 4, !dbg !468
  br label %for.cond, !dbg !470

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !471
  %cmp3 = icmp slt i32 %8, 1024, !dbg !473
  br i1 %cmp3, label %for.body, label %for.end, !dbg !474

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !475
  %div4 = sdiv i32 %9, 64, !dbg !475
  %idxprom5 = sext i32 %div4 to i64, !dbg !475
  %arrayidx6 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @current, i32 0, i32 0), i64 0, i64 %idxprom5, !dbg !475
  %10 = load i64, i64* %arrayidx6, align 8, !dbg !475
  %11 = load i32, i32* %i, align 4, !dbg !475
  %rem7 = srem i32 %11, 64, !dbg !475
  %sh_prom8 = zext i32 %rem7 to i64, !dbg !475
  %shl9 = shl i64 1, %sh_prom8, !dbg !475
  %and = and i64 %10, %shl9, !dbg !475
  %cmp10 = icmp ne i64 %and, 0, !dbg !475
  br i1 %cmp10, label %if.then11, label %if.end47, !dbg !478

if.then11:                                        ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !479
  %13 = load i32, i32* @tsocket, align 4, !dbg !482
  %cmp12 = icmp eq i32 %12, %13, !dbg !483
  br i1 %cmp12, label %if.then13, label %if.else38, !dbg !484

if.then13:                                        ; preds = %if.then11
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %cliinfo, metadata !485, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.declare(metadata i32* %addrlen, metadata !488, metadata !DIExpression()), !dbg !492
  store i32 16, i32* %addrlen, align 4, !dbg !492
  call void @llvm.dbg.declare(metadata i32* %handle, metadata !493, metadata !DIExpression()), !dbg !494
  %14 = load i32, i32* @tsocket, align 4, !dbg !495
  %15 = bitcast %struct.sockaddr_in* %cliinfo to %struct.sockaddr*, !dbg !496
  %call14 = call i32 @accept(i32 %14, %struct.sockaddr* %15, i32* %addrlen), !dbg !497
  store i32 %call14, i32* %handle, align 4, !dbg !498
  %16 = load i32, i32* %handle, align 4, !dbg !499
  %cmp15 = icmp eq i32 %16, -1, !dbg !501
  br i1 %cmp15, label %if.then16, label %if.else, !dbg !502

if.then16:                                        ; preds = %if.then13
  call void @perror(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.5, i64 0, i64 0)), !dbg !503
  br label %if.end37, !dbg !505

if.else:                                          ; preds = %if.then13
  %17 = load i32, i32* %handle, align 4, !dbg !506
  %cmp17 = icmp sgt i32 %17, 1024, !dbg !508
  br i1 %cmp17, label %if.then18, label %if.else21, !dbg !509

if.then18:                                        ; preds = %if.else
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i64 0, i64 0)), !dbg !510
  %18 = load i32, i32* %handle, align 4, !dbg !512
  %call20 = call i32 (i32, ...) bitcast (i32 (...)* @close to i32 (i32, ...)*)(i32 %18), !dbg !513
  br label %if.end36, !dbg !514

if.else21:                                        ; preds = %if.else
  %19 = load i32, i32* %handle, align 4, !dbg !515
  %call22 = call i32 (i32, i8*, i32, ...) bitcast (i32 (...)* @write to i32 (i32, i8*, i32, ...)*)(i32 %19, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i64 0, i64 0), i32 12), !dbg !518
  %cmp23 = icmp sge i32 %call22, 0, !dbg !519
  br i1 %cmp23, label %if.then24, label %if.end35, !dbg !520

if.then24:                                        ; preds = %if.else21
  %20 = load i32, i32* %handle, align 4, !dbg !521
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %cliinfo, i32 0, i32 2, !dbg !523
  %coerce.dive = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !524
  %21 = load i32, i32* %coerce.dive, align 4, !dbg !524
  %call25 = call i32 (i32, ...) bitcast (i32 (...)* @inet_ntoa to i32 (i32, ...)*)(i32 %21), !dbg !524
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %cliinfo, i32 0, i32 1, !dbg !525
  %22 = load i16, i16* %sin_port, align 2, !dbg !525
  %call26 = call zeroext i16 @ntohs(i16 zeroext %22) #8, !dbg !526
  %conv = zext i16 %call26 to i32, !dbg !526
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.8, i64 0, i64 0), i32 %20, i32 %call25, i32 %conv), !dbg !527
  %23 = load i32, i32* %handle, align 4, !dbg !528
  %rem28 = srem i32 %23, 64, !dbg !528
  %sh_prom29 = zext i32 %rem28 to i64, !dbg !528
  %shl30 = shl i64 1, %sh_prom29, !dbg !528
  %24 = load i32, i32* %handle, align 4, !dbg !528
  %div31 = sdiv i32 %24, 64, !dbg !528
  %idxprom32 = sext i32 %div31 to i64, !dbg !528
  %arrayidx33 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom32, !dbg !528
  %25 = load i64, i64* %arrayidx33, align 8, !dbg !528
  %or34 = or i64 %25, %shl30, !dbg !528
  store i64 %or34, i64* %arrayidx33, align 8, !dbg !528
  %26 = load i32, i32* %handle, align 4, !dbg !529
  call void @AddConnection(i32 %26), !dbg !530
  br label %if.end35, !dbg !531

if.end35:                                         ; preds = %if.then24, %if.else21
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then18
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then16
  br label %if.end46, !dbg !532

if.else38:                                        ; preds = %if.then11
  call void @llvm.dbg.declare(metadata [512 x i8]* %buf, metadata !533, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.declare(metadata i32* %b, metadata !536, metadata !DIExpression()), !dbg !537
  %27 = load i32, i32* %i, align 4, !dbg !538
  %arraydecay = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !539
  %call39 = call i32 (i32, i8*, i32, ...) bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %27, i8* %arraydecay, i32 500), !dbg !540
  store i32 %call39, i32* %b, align 4, !dbg !541
  %28 = load i32, i32* %b, align 4, !dbg !542
  %cmp40 = icmp sle i32 %28, 0, !dbg !544
  br i1 %cmp40, label %if.then42, label %if.else43, !dbg !545

if.then42:                                        ; preds = %if.else38
  %29 = load i32, i32* %i, align 4, !dbg !546
  call void @CloseConnection(i32 %29), !dbg !548
  br label %if.end45, !dbg !549

if.else43:                                        ; preds = %if.else38
  %30 = load i32, i32* %i, align 4, !dbg !550
  %arraydecay44 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !552
  %31 = load i32, i32* %b, align 4, !dbg !553
  call void @ClientText(i32 %30, i8* %arraydecay44, i32 %31), !dbg !554
  br label %if.end45

if.end45:                                         ; preds = %if.else43, %if.then42
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.end37
  br label %if.end47, !dbg !555

if.end47:                                         ; preds = %if.end46, %for.body
  br label %for.inc, !dbg !556

for.inc:                                          ; preds = %if.end47
  %32 = load i32, i32* %i, align 4, !dbg !557
  %inc = add nsw i32 %32, 1, !dbg !557
  store i32 %inc, i32* %i, align 4, !dbg !557
  br label %for.cond, !dbg !558, !llvm.loop !559

for.end:                                          ; preds = %for.cond
  br label %while.body, !dbg !458, !llvm.loop !561
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
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !563 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !567, metadata !DIExpression()), !dbg !568
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !569, metadata !DIExpression()), !dbg !570
  %call = call i32 @socket(i32 2, i32 1, i32 0) #7, !dbg !571
  store i32 %call, i32* @tsocket, align 4, !dbg !572
  store i16 2, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 0), align 4, !dbg !573
  %call1 = call zeroext i16 @htons(i16 zeroext 7070) #8, !dbg !574
  store i16 %call1, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 1), align 2, !dbg !575
  %0 = load i32, i32* %argc.addr, align 4, !dbg !576
  %cmp = icmp sgt i32 %0, 1, !dbg !578
  br i1 %cmp, label %if.then, label %if.end, !dbg !579

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !580
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !580
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !580
  %call2 = call i32 @atoi(i8* %2) #9, !dbg !582
  %conv = trunc i32 %call2 to i16, !dbg !582
  %call3 = call zeroext i16 @htons(i16 zeroext %conv) #8, !dbg !583
  store i16 %call3, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 1), align 2, !dbg !584
  br label %if.end, !dbg !585

if.end:                                           ; preds = %if.then, %entry
  %call4 = call i32 @htonl(i32 0) #8, !dbg !586
  store i32 %call4, i32* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 2, i32 0), align 4, !dbg !587
  %3 = load i32, i32* @tsocket, align 4, !dbg !588
  %4 = load i16, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 1), align 2, !dbg !589
  %call5 = call zeroext i16 @ntohs(i16 zeroext %4) #8, !dbg !590
  %conv6 = zext i16 %call5 to i32, !dbg !590
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.9, i64 0, i64 0), i32 %3, i32 %conv6), !dbg !591
  %5 = load i32, i32* @tsocket, align 4, !dbg !592
  %call8 = call i32 @bind(i32 %5, %struct.sockaddr* bitcast (%struct.sockaddr_in* @tsockinfo to %struct.sockaddr*), i32 16) #7, !dbg !594
  %cmp9 = icmp eq i32 %call8, -1, !dbg !595
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !596

if.then11:                                        ; preds = %if.end
  call void @perror(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0)), !dbg !597
  store i32 -1, i32* %retval, align 4, !dbg !599
  br label %return, !dbg !599

if.end12:                                         ; preds = %if.end
  %6 = load i32, i32* @tsocket, align 4, !dbg !600
  %call13 = call i32 @listen(i32 %6, i32 10) #7, !dbg !602
  %cmp14 = icmp eq i32 %call13, -1, !dbg !603
  br i1 %cmp14, label %if.then16, label %if.end17, !dbg !604

if.then16:                                        ; preds = %if.end12
  call void @perror(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i64 0, i64 0)), !dbg !605
  br label %if.end17, !dbg !607

if.end17:                                         ; preds = %if.then16, %if.end12
  %call18 = call i32 @ChatLoop(), !dbg !608
  store i32 0, i32* %retval, align 4, !dbg !609
  br label %return, !dbg !609

return:                                           ; preds = %if.end17, %if.then11
  %7 = load i32, i32* %retval, align 4, !dbg !610
  ret i32 %7, !dbg !610
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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !18, globals: !30, splitDebugInlining: false, nameTableKind: None)
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
!84 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!124 = !DILocation(line: 37, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !3, line: 36, column: 5)
!126 = !DILocation(line: 37, column: 60, scope: !125)
!127 = !DILocation(line: 37, column: 48, scope: !125)
!128 = !DILocation(line: 37, column: 69, scope: !125)
!129 = !DILocation(line: 37, column: 9, scope: !125)
!130 = !DILocation(line: 39, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !3, line: 39, column: 9)
!132 = !DILocation(line: 39, column: 14, scope: !131)
!133 = !DILocation(line: 39, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !3, line: 39, column: 9)
!135 = !DILocation(line: 39, column: 23, scope: !134)
!136 = !DILocation(line: 39, column: 9, scope: !131)
!137 = !DILocation(line: 41, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !139, file: !3, line: 41, column: 17)
!139 = distinct !DILexicalBlock(scope: !134, file: !3, line: 40, column: 9)
!140 = !DILocation(line: 41, column: 27, scope: !138)
!141 = !DILocation(line: 41, column: 24, scope: !138)
!142 = !DILocation(line: 41, column: 29, scope: !138)
!143 = !DILocation(line: 41, column: 32, scope: !138)
!144 = !DILocation(line: 41, column: 37, scope: !138)
!145 = !DILocation(line: 41, column: 34, scope: !138)
!146 = !DILocation(line: 41, column: 45, scope: !138)
!147 = !DILocation(line: 41, column: 48, scope: !138)
!148 = !DILocation(line: 41, column: 17, scope: !139)
!149 = !DILocation(line: 43, column: 27, scope: !150)
!150 = distinct !DILexicalBlock(scope: !151, file: !3, line: 43, column: 21)
!151 = distinct !DILexicalBlock(scope: !138, file: !3, line: 42, column: 13)
!152 = !DILocation(line: 43, column: 30, scope: !150)
!153 = !DILocation(line: 43, column: 42, scope: !150)
!154 = !DILocation(line: 43, column: 35, scope: !150)
!155 = !DILocation(line: 43, column: 21, scope: !150)
!156 = !DILocation(line: 43, column: 48, scope: !150)
!157 = !DILocation(line: 43, column: 21, scope: !151)
!158 = !DILocation(line: 45, column: 37, scope: !159)
!159 = distinct !DILexicalBlock(scope: !150, file: !3, line: 44, column: 17)
!160 = !DILocation(line: 45, column: 21, scope: !159)
!161 = !DILocation(line: 46, column: 17, scope: !159)
!162 = !DILocation(line: 47, column: 13, scope: !151)
!163 = !DILocation(line: 48, column: 9, scope: !139)
!164 = !DILocation(line: 39, column: 38, scope: !134)
!165 = !DILocation(line: 39, column: 9, scope: !134)
!166 = distinct !{!166, !136, !167}
!167 = !DILocation(line: 48, column: 9, scope: !131)
!168 = !DILocation(line: 49, column: 5, scope: !125)
!169 = !DILocation(line: 51, column: 52, scope: !170)
!170 = distinct !DILexicalBlock(scope: !120, file: !3, line: 50, column: 5)
!171 = !DILocation(line: 51, column: 9, scope: !170)
!172 = !DILocation(line: 53, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !108, file: !3, line: 53, column: 9)
!174 = !DILocation(line: 53, column: 9, scope: !173)
!175 = !DILocation(line: 53, column: 9, scope: !108)
!176 = !DILocation(line: 55, column: 26, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !3, line: 54, column: 5)
!178 = !DILocation(line: 55, column: 14, scope: !177)
!179 = !DILocation(line: 55, column: 9, scope: !177)
!180 = !DILocation(line: 56, column: 5, scope: !177)
!181 = !DILocation(line: 57, column: 11, scope: !108)
!182 = !DILocation(line: 57, column: 5, scope: !108)
!183 = !DILocation(line: 58, column: 1, scope: !108)
!184 = distinct !DISubprogram(name: "strip", scope: !3, file: !3, line: 60, type: !185, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!185 = !DISubroutineType(types: !186)
!186 = !{null, !187}
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!188 = !DILocalVariable(name: "buf", arg: 1, scope: !184, file: !3, line: 60, type: !187)
!189 = !DILocation(line: 60, column: 18, scope: !184)
!190 = !DILocalVariable(name: "x", scope: !184, file: !3, line: 62, type: !187)
!191 = !DILocation(line: 62, column: 11, scope: !184)
!192 = !DILocation(line: 64, column: 16, scope: !184)
!193 = !DILocation(line: 64, column: 9, scope: !184)
!194 = !DILocation(line: 64, column: 7, scope: !184)
!195 = !DILocation(line: 65, column: 9, scope: !196)
!196 = distinct !DILexicalBlock(scope: !184, file: !3, line: 65, column: 9)
!197 = !DILocation(line: 65, column: 9, scope: !184)
!198 = !DILocation(line: 65, column: 15, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !3, line: 65, column: 12)
!200 = !DILocation(line: 65, column: 16, scope: !199)
!201 = !DILocation(line: 65, column: 23, scope: !199)
!202 = !DILocation(line: 66, column: 16, scope: !184)
!203 = !DILocation(line: 66, column: 9, scope: !184)
!204 = !DILocation(line: 66, column: 7, scope: !184)
!205 = !DILocation(line: 67, column: 9, scope: !206)
!206 = distinct !DILexicalBlock(scope: !184, file: !3, line: 67, column: 9)
!207 = !DILocation(line: 67, column: 9, scope: !184)
!208 = !DILocation(line: 67, column: 15, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !3, line: 67, column: 12)
!210 = !DILocation(line: 67, column: 16, scope: !209)
!211 = !DILocation(line: 67, column: 23, scope: !209)
!212 = !DILocation(line: 68, column: 1, scope: !184)
!213 = distinct !DISubprogram(name: "RelayText", scope: !3, file: !3, line: 70, type: !214, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!214 = !DISubroutineType(types: !215)
!215 = !{!22, !22}
!216 = !DILocalVariable(name: "handle", arg: 1, scope: !213, file: !3, line: 70, type: !22)
!217 = !DILocation(line: 70, column: 19, scope: !213)
!218 = !DILocalVariable(name: "begin", scope: !213, file: !3, line: 72, type: !187)
!219 = !DILocation(line: 72, column: 11, scope: !213)
!220 = !DILocalVariable(name: "end", scope: !213, file: !3, line: 72, type: !187)
!221 = !DILocation(line: 72, column: 19, scope: !213)
!222 = !DILocalVariable(name: "ret", scope: !213, file: !3, line: 73, type: !22)
!223 = !DILocation(line: 73, column: 9, scope: !213)
!224 = !DILocation(line: 74, column: 25, scope: !213)
!225 = !DILocation(line: 74, column: 13, scope: !213)
!226 = !DILocation(line: 74, column: 34, scope: !213)
!227 = !DILocation(line: 74, column: 11, scope: !213)
!228 = !DILocation(line: 75, column: 21, scope: !229)
!229 = distinct !DILexicalBlock(scope: !213, file: !3, line: 75, column: 9)
!230 = !DILocation(line: 75, column: 9, scope: !229)
!231 = !DILocation(line: 75, column: 30, scope: !229)
!232 = !DILocation(line: 75, column: 34, scope: !229)
!233 = !DILocation(line: 75, column: 9, scope: !213)
!234 = !DILocation(line: 77, column: 13, scope: !235)
!235 = distinct !DILexicalBlock(scope: !236, file: !3, line: 77, column: 13)
!236 = distinct !DILexicalBlock(scope: !229, file: !3, line: 76, column: 5)
!237 = !DILocation(line: 77, column: 25, scope: !235)
!238 = !DILocation(line: 77, column: 13, scope: !236)
!239 = !DILocation(line: 78, column: 13, scope: !235)
!240 = !DILocation(line: 78, column: 25, scope: !235)
!241 = !DILocation(line: 80, column: 13, scope: !242)
!242 = distinct !DILexicalBlock(scope: !235, file: !3, line: 79, column: 14)
!243 = !DILocation(line: 80, column: 25, scope: !242)
!244 = !DILocation(line: 81, column: 13, scope: !242)
!245 = !DILocation(line: 81, column: 25, scope: !242)
!246 = !DILocation(line: 83, column: 5, scope: !236)
!247 = !DILocation(line: 84, column: 9, scope: !248)
!248 = distinct !DILexicalBlock(scope: !229, file: !3, line: 83, column: 12)
!249 = !DILocation(line: 84, column: 27, scope: !248)
!250 = !DILocation(line: 84, column: 15, scope: !248)
!251 = !DILocation(line: 84, column: 36, scope: !248)
!252 = !DILocation(line: 84, column: 41, scope: !248)
!253 = !DILocation(line: 87, column: 18, scope: !213)
!254 = !DILocation(line: 87, column: 11, scope: !213)
!255 = !DILocation(line: 87, column: 9, scope: !213)
!256 = !DILocation(line: 88, column: 5, scope: !213)
!257 = !DILocation(line: 88, column: 12, scope: !213)
!258 = !DILocation(line: 88, column: 16, scope: !213)
!259 = !DILocalVariable(name: "output", scope: !260, file: !3, line: 90, type: !261)
!260 = distinct !DILexicalBlock(scope: !213, file: !3, line: 89, column: 5)
!261 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 64000, elements: !262)
!262 = !{!263}
!263 = !DISubrange(count: 8000)
!264 = !DILocation(line: 90, column: 14, scope: !260)
!265 = !DILocation(line: 91, column: 9, scope: !260)
!266 = !DILocation(line: 91, column: 19, scope: !260)
!267 = !DILocation(line: 92, column: 26, scope: !268)
!268 = distinct !DILexicalBlock(scope: !260, file: !3, line: 92, column: 13)
!269 = !DILocation(line: 92, column: 14, scope: !268)
!270 = !DILocation(line: 92, column: 35, scope: !268)
!271 = !DILocation(line: 92, column: 13, scope: !260)
!272 = !DILocation(line: 94, column: 33, scope: !273)
!273 = distinct !DILexicalBlock(scope: !268, file: !3, line: 93, column: 9)
!274 = !DILocation(line: 94, column: 21, scope: !273)
!275 = !DILocation(line: 94, column: 42, scope: !273)
!276 = !DILocation(line: 94, column: 48, scope: !273)
!277 = !DILocation(line: 94, column: 13, scope: !273)
!278 = !DILocation(line: 95, column: 25, scope: !273)
!279 = !DILocation(line: 95, column: 13, scope: !273)
!280 = !DILocation(line: 95, column: 34, scope: !273)
!281 = !DILocation(line: 95, column: 43, scope: !273)
!282 = !DILocation(line: 97, column: 31, scope: !273)
!283 = !DILocation(line: 97, column: 19, scope: !273)
!284 = !DILocation(line: 97, column: 40, scope: !273)
!285 = !DILocation(line: 97, column: 13, scope: !273)
!286 = !DILocation(line: 98, column: 21, scope: !273)
!287 = !DILocation(line: 98, column: 64, scope: !273)
!288 = !DILocation(line: 98, column: 52, scope: !273)
!289 = !DILocation(line: 98, column: 73, scope: !273)
!290 = !DILocation(line: 98, column: 13, scope: !273)
!291 = !DILocation(line: 99, column: 17, scope: !273)
!292 = !DILocation(line: 100, column: 9, scope: !273)
!293 = !DILocation(line: 102, column: 21, scope: !294)
!294 = distinct !DILexicalBlock(scope: !268, file: !3, line: 101, column: 9)
!295 = !DILocation(line: 102, column: 57, scope: !294)
!296 = !DILocation(line: 102, column: 45, scope: !294)
!297 = !DILocation(line: 102, column: 66, scope: !294)
!298 = !DILocation(line: 103, column: 21, scope: !294)
!299 = !DILocation(line: 103, column: 25, scope: !294)
!300 = !DILocation(line: 103, column: 24, scope: !294)
!301 = !DILocation(line: 103, column: 32, scope: !294)
!302 = !DILocation(line: 102, column: 13, scope: !294)
!303 = !DILocation(line: 104, column: 17, scope: !294)
!304 = !DILocation(line: 107, column: 13, scope: !305)
!305 = distinct !DILexicalBlock(scope: !260, file: !3, line: 107, column: 13)
!306 = !DILocation(line: 107, column: 13, scope: !260)
!307 = !DILocalVariable(name: "j", scope: !308, file: !3, line: 109, type: !22)
!308 = distinct !DILexicalBlock(scope: !305, file: !3, line: 108, column: 9)
!309 = !DILocation(line: 109, column: 17, scope: !308)
!310 = !DILocation(line: 110, column: 20, scope: !311)
!311 = distinct !DILexicalBlock(scope: !308, file: !3, line: 110, column: 13)
!312 = !DILocation(line: 110, column: 18, scope: !311)
!313 = !DILocation(line: 110, column: 25, scope: !314)
!314 = distinct !DILexicalBlock(scope: !311, file: !3, line: 110, column: 13)
!315 = !DILocation(line: 110, column: 27, scope: !314)
!316 = !DILocation(line: 110, column: 13, scope: !311)
!317 = !DILocation(line: 112, column: 21, scope: !318)
!318 = distinct !DILexicalBlock(scope: !319, file: !3, line: 112, column: 21)
!319 = distinct !DILexicalBlock(scope: !314, file: !3, line: 111, column: 13)
!320 = !DILocation(line: 112, column: 31, scope: !318)
!321 = !DILocation(line: 112, column: 28, scope: !318)
!322 = !DILocation(line: 112, column: 33, scope: !318)
!323 = !DILocation(line: 112, column: 36, scope: !318)
!324 = !DILocation(line: 112, column: 41, scope: !318)
!325 = !DILocation(line: 112, column: 38, scope: !318)
!326 = !DILocation(line: 112, column: 49, scope: !318)
!327 = !DILocation(line: 112, column: 52, scope: !318)
!328 = !DILocation(line: 112, column: 21, scope: !319)
!329 = !DILocation(line: 114, column: 31, scope: !330)
!330 = distinct !DILexicalBlock(scope: !331, file: !3, line: 114, column: 25)
!331 = distinct !DILexicalBlock(scope: !318, file: !3, line: 113, column: 17)
!332 = !DILocation(line: 114, column: 34, scope: !330)
!333 = !DILocation(line: 114, column: 49, scope: !330)
!334 = !DILocation(line: 114, column: 42, scope: !330)
!335 = !DILocation(line: 114, column: 25, scope: !330)
!336 = !DILocation(line: 114, column: 58, scope: !330)
!337 = !DILocation(line: 114, column: 25, scope: !331)
!338 = !DILocation(line: 116, column: 41, scope: !339)
!339 = distinct !DILexicalBlock(scope: !330, file: !3, line: 115, column: 21)
!340 = !DILocation(line: 116, column: 25, scope: !339)
!341 = !DILocation(line: 117, column: 21, scope: !339)
!342 = !DILocation(line: 118, column: 17, scope: !331)
!343 = !DILocation(line: 119, column: 13, scope: !319)
!344 = !DILocation(line: 110, column: 42, scope: !314)
!345 = !DILocation(line: 110, column: 13, scope: !314)
!346 = distinct !{!346, !316, !347}
!347 = !DILocation(line: 119, column: 13, scope: !311)
!348 = !DILocation(line: 120, column: 9, scope: !308)
!349 = !DILocation(line: 121, column: 17, scope: !260)
!350 = !DILocation(line: 121, column: 20, scope: !260)
!351 = !DILocation(line: 121, column: 15, scope: !260)
!352 = !DILocation(line: 122, column: 22, scope: !260)
!353 = !DILocation(line: 122, column: 15, scope: !260)
!354 = !DILocation(line: 122, column: 13, scope: !260)
!355 = distinct !{!355, !256, !356}
!356 = !DILocation(line: 123, column: 5, scope: !213)
!357 = !DILocation(line: 125, column: 24, scope: !213)
!358 = !DILocation(line: 125, column: 12, scope: !213)
!359 = !DILocation(line: 125, column: 33, scope: !213)
!360 = !DILocation(line: 125, column: 41, scope: !213)
!361 = !DILocation(line: 125, column: 5, scope: !213)
!362 = !DILocation(line: 126, column: 33, scope: !213)
!363 = !DILocation(line: 126, column: 53, scope: !213)
!364 = !DILocation(line: 126, column: 41, scope: !213)
!365 = !DILocation(line: 126, column: 62, scope: !213)
!366 = !DILocation(line: 126, column: 39, scope: !213)
!367 = !DILocation(line: 126, column: 17, scope: !213)
!368 = !DILocation(line: 126, column: 5, scope: !213)
!369 = !DILocation(line: 126, column: 26, scope: !213)
!370 = !DILocation(line: 126, column: 30, scope: !213)
!371 = !DILocation(line: 127, column: 12, scope: !213)
!372 = !DILocation(line: 127, column: 5, scope: !213)
!373 = distinct !DISubprogram(name: "ClientText", scope: !3, file: !3, line: 130, type: !374, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!374 = !DISubroutineType(types: !375)
!375 = !{null, !22, !187, !22}
!376 = !DILocalVariable(name: "handle", arg: 1, scope: !373, file: !3, line: 130, type: !22)
!377 = !DILocation(line: 130, column: 21, scope: !373)
!378 = !DILocalVariable(name: "buf", arg: 2, scope: !373, file: !3, line: 130, type: !187)
!379 = !DILocation(line: 130, column: 35, scope: !373)
!380 = !DILocalVariable(name: "buf_len", arg: 3, scope: !373, file: !3, line: 130, type: !22)
!381 = !DILocation(line: 130, column: 44, scope: !373)
!382 = !DILocalVariable(name: "i", scope: !373, file: !3, line: 132, type: !22)
!383 = !DILocation(line: 132, column: 9, scope: !373)
!384 = !DILocalVariable(name: "j", scope: !373, file: !3, line: 132, type: !22)
!385 = !DILocation(line: 132, column: 12, scope: !373)
!386 = !DILocation(line: 133, column: 22, scope: !387)
!387 = distinct !DILexicalBlock(scope: !373, file: !3, line: 133, column: 9)
!388 = !DILocation(line: 133, column: 10, scope: !387)
!389 = !DILocation(line: 133, column: 9, scope: !373)
!390 = !DILocation(line: 134, column: 9, scope: !387)
!391 = !DILocation(line: 135, column: 21, scope: !373)
!392 = !DILocation(line: 135, column: 9, scope: !373)
!393 = !DILocation(line: 135, column: 30, scope: !373)
!394 = !DILocation(line: 135, column: 7, scope: !373)
!395 = !DILocation(line: 137, column: 12, scope: !396)
!396 = distinct !DILexicalBlock(scope: !373, file: !3, line: 137, column: 5)
!397 = !DILocation(line: 137, column: 10, scope: !396)
!398 = !DILocation(line: 137, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !396, file: !3, line: 137, column: 5)
!400 = !DILocation(line: 137, column: 21, scope: !399)
!401 = !DILocation(line: 137, column: 19, scope: !399)
!402 = !DILocation(line: 137, column: 5, scope: !396)
!403 = !DILocation(line: 139, column: 42, scope: !404)
!404 = distinct !DILexicalBlock(scope: !399, file: !3, line: 138, column: 5)
!405 = !DILocation(line: 139, column: 46, scope: !404)
!406 = !DILocation(line: 139, column: 21, scope: !404)
!407 = !DILocation(line: 139, column: 9, scope: !404)
!408 = !DILocation(line: 139, column: 30, scope: !404)
!409 = !DILocation(line: 139, column: 37, scope: !404)
!410 = !DILocation(line: 139, column: 40, scope: !404)
!411 = !DILocation(line: 141, column: 13, scope: !412)
!412 = distinct !DILexicalBlock(scope: !404, file: !3, line: 141, column: 13)
!413 = !DILocation(line: 141, column: 15, scope: !412)
!414 = !DILocation(line: 141, column: 13, scope: !404)
!415 = !DILocation(line: 143, column: 13, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !3, line: 142, column: 9)
!417 = !DILocation(line: 143, column: 30, scope: !416)
!418 = !DILocation(line: 143, column: 20, scope: !416)
!419 = distinct !{!419, !415, !420}
!420 = !DILocation(line: 143, column: 38, scope: !416)
!421 = !DILocation(line: 144, column: 29, scope: !416)
!422 = !DILocation(line: 144, column: 17, scope: !416)
!423 = !DILocation(line: 144, column: 38, scope: !416)
!424 = !DILocation(line: 144, column: 15, scope: !416)
!425 = !DILocation(line: 145, column: 9, scope: !416)
!426 = !DILocation(line: 146, column: 5, scope: !404)
!427 = !DILocation(line: 137, column: 30, scope: !399)
!428 = !DILocation(line: 137, column: 35, scope: !399)
!429 = !DILocation(line: 137, column: 5, scope: !399)
!430 = distinct !{!430, !402, !431}
!431 = !DILocation(line: 146, column: 5, scope: !396)
!432 = !DILocation(line: 147, column: 32, scope: !373)
!433 = !DILocation(line: 147, column: 17, scope: !373)
!434 = !DILocation(line: 147, column: 5, scope: !373)
!435 = !DILocation(line: 147, column: 26, scope: !373)
!436 = !DILocation(line: 147, column: 30, scope: !373)
!437 = !DILocation(line: 149, column: 5, scope: !373)
!438 = !DILocation(line: 149, column: 22, scope: !373)
!439 = !DILocation(line: 149, column: 12, scope: !373)
!440 = distinct !{!440, !437, !441}
!441 = !DILocation(line: 149, column: 30, scope: !373)
!442 = !DILocation(line: 150, column: 1, scope: !373)
!443 = distinct !DISubprogram(name: "ChatLoop", scope: !3, file: !3, line: 153, type: !444, scopeLine: 154, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!444 = !DISubroutineType(types: !445)
!445 = !{!22}
!446 = !DILocalVariable(name: "i", scope: !443, file: !3, line: 155, type: !22)
!447 = !DILocation(line: 155, column: 9, scope: !443)
!448 = !DILocalVariable(name: "j", scope: !443, file: !3, line: 155, type: !22)
!449 = !DILocation(line: 155, column: 12, scope: !443)
!450 = !DILocation(line: 156, column: 5, scope: !443)
!451 = !DILocalVariable(name: "__d0", scope: !452, file: !3, line: 156, type: !22)
!452 = distinct !DILexicalBlock(scope: !443, file: !3, line: 156, column: 5)
!453 = !DILocation(line: 156, column: 5, scope: !452)
!454 = !DILocalVariable(name: "__d1", scope: !452, file: !3, line: 156, type: !22)
!455 = !{i32 -2147138770}
!456 = !DILocation(line: 158, column: 5, scope: !443)
!457 = !DILocation(line: 159, column: 5, scope: !443)
!458 = !DILocation(line: 161, column: 5, scope: !443)
!459 = !DILocation(line: 163, column: 19, scope: !460)
!460 = distinct !DILexicalBlock(scope: !443, file: !3, line: 162, column: 5)
!461 = !DILocation(line: 164, column: 13, scope: !462)
!462 = distinct !DILexicalBlock(scope: !460, file: !3, line: 164, column: 13)
!463 = !DILocation(line: 164, column: 59, scope: !462)
!464 = !DILocation(line: 164, column: 13, scope: !460)
!465 = !DILocation(line: 166, column: 13, scope: !466)
!466 = distinct !DILexicalBlock(scope: !462, file: !3, line: 165, column: 9)
!467 = !DILocation(line: 167, column: 13, scope: !466)
!468 = !DILocation(line: 169, column: 16, scope: !469)
!469 = distinct !DILexicalBlock(scope: !460, file: !3, line: 169, column: 9)
!470 = !DILocation(line: 169, column: 14, scope: !469)
!471 = !DILocation(line: 169, column: 21, scope: !472)
!472 = distinct !DILexicalBlock(scope: !469, file: !3, line: 169, column: 9)
!473 = !DILocation(line: 169, column: 23, scope: !472)
!474 = !DILocation(line: 169, column: 9, scope: !469)
!475 = !DILocation(line: 171, column: 17, scope: !476)
!476 = distinct !DILexicalBlock(scope: !477, file: !3, line: 171, column: 17)
!477 = distinct !DILexicalBlock(scope: !472, file: !3, line: 170, column: 9)
!478 = !DILocation(line: 171, column: 17, scope: !477)
!479 = !DILocation(line: 173, column: 21, scope: !480)
!480 = distinct !DILexicalBlock(scope: !481, file: !3, line: 173, column: 21)
!481 = distinct !DILexicalBlock(scope: !476, file: !3, line: 172, column: 13)
!482 = !DILocation(line: 173, column: 26, scope: !480)
!483 = !DILocation(line: 173, column: 23, scope: !480)
!484 = !DILocation(line: 173, column: 21, scope: !481)
!485 = !DILocalVariable(name: "cliinfo", scope: !486, file: !3, line: 175, type: !35)
!486 = distinct !DILexicalBlock(scope: !480, file: !3, line: 174, column: 17)
!487 = !DILocation(line: 175, column: 40, scope: !486)
!488 = !DILocalVariable(name: "addrlen", scope: !486, file: !3, line: 176, type: !489)
!489 = !DIDerivedType(tag: DW_TAG_typedef, name: "socklen_t", file: !490, line: 33, baseType: !491)
!490 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "__socklen_t", file: !29, line: 209, baseType: !7)
!492 = !DILocation(line: 176, column: 31, scope: !486)
!493 = !DILocalVariable(name: "handle", scope: !486, file: !3, line: 177, type: !22)
!494 = !DILocation(line: 177, column: 25, scope: !486)
!495 = !DILocation(line: 178, column: 37, scope: !486)
!496 = !DILocation(line: 178, column: 46, scope: !486)
!497 = !DILocation(line: 178, column: 30, scope: !486)
!498 = !DILocation(line: 178, column: 28, scope: !486)
!499 = !DILocation(line: 179, column: 25, scope: !500)
!500 = distinct !DILexicalBlock(scope: !486, file: !3, line: 179, column: 25)
!501 = !DILocation(line: 179, column: 32, scope: !500)
!502 = !DILocation(line: 179, column: 25, scope: !486)
!503 = !DILocation(line: 181, column: 25, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !3, line: 180, column: 21)
!505 = !DILocation(line: 182, column: 21, scope: !504)
!506 = !DILocation(line: 182, column: 32, scope: !507)
!507 = distinct !DILexicalBlock(scope: !500, file: !3, line: 182, column: 32)
!508 = !DILocation(line: 182, column: 39, scope: !507)
!509 = !DILocation(line: 182, column: 32, scope: !500)
!510 = !DILocation(line: 184, column: 25, scope: !511)
!511 = distinct !DILexicalBlock(scope: !507, file: !3, line: 183, column: 21)
!512 = !DILocation(line: 185, column: 31, scope: !511)
!513 = !DILocation(line: 185, column: 25, scope: !511)
!514 = !DILocation(line: 186, column: 21, scope: !511)
!515 = !DILocation(line: 189, column: 35, scope: !516)
!516 = distinct !DILexicalBlock(scope: !517, file: !3, line: 189, column: 29)
!517 = distinct !DILexicalBlock(scope: !507, file: !3, line: 188, column: 21)
!518 = !DILocation(line: 189, column: 29, scope: !516)
!519 = !DILocation(line: 189, column: 63, scope: !516)
!520 = !DILocation(line: 189, column: 29, scope: !517)
!521 = !DILocation(line: 192, column: 33, scope: !522)
!522 = distinct !DILexicalBlock(scope: !516, file: !3, line: 190, column: 25)
!523 = !DILocation(line: 193, column: 52, scope: !522)
!524 = !DILocation(line: 193, column: 33, scope: !522)
!525 = !DILocation(line: 194, column: 47, scope: !522)
!526 = !DILocation(line: 194, column: 33, scope: !522)
!527 = !DILocation(line: 191, column: 29, scope: !522)
!528 = !DILocation(line: 195, column: 29, scope: !522)
!529 = !DILocation(line: 197, column: 43, scope: !522)
!530 = !DILocation(line: 197, column: 29, scope: !522)
!531 = !DILocation(line: 198, column: 25, scope: !522)
!532 = !DILocation(line: 200, column: 17, scope: !486)
!533 = !DILocalVariable(name: "buf", scope: !534, file: !3, line: 203, type: !112)
!534 = distinct !DILexicalBlock(scope: !480, file: !3, line: 202, column: 17)
!535 = !DILocation(line: 203, column: 26, scope: !534)
!536 = !DILocalVariable(name: "b", scope: !534, file: !3, line: 204, type: !22)
!537 = !DILocation(line: 204, column: 25, scope: !534)
!538 = !DILocation(line: 206, column: 30, scope: !534)
!539 = !DILocation(line: 206, column: 33, scope: !534)
!540 = !DILocation(line: 206, column: 25, scope: !534)
!541 = !DILocation(line: 206, column: 23, scope: !534)
!542 = !DILocation(line: 207, column: 25, scope: !543)
!543 = distinct !DILexicalBlock(scope: !534, file: !3, line: 207, column: 25)
!544 = !DILocation(line: 207, column: 27, scope: !543)
!545 = !DILocation(line: 207, column: 25, scope: !534)
!546 = !DILocation(line: 209, column: 41, scope: !547)
!547 = distinct !DILexicalBlock(scope: !543, file: !3, line: 208, column: 21)
!548 = !DILocation(line: 209, column: 25, scope: !547)
!549 = !DILocation(line: 210, column: 21, scope: !547)
!550 = !DILocation(line: 213, column: 36, scope: !551)
!551 = distinct !DILexicalBlock(scope: !543, file: !3, line: 212, column: 21)
!552 = !DILocation(line: 213, column: 39, scope: !551)
!553 = !DILocation(line: 213, column: 44, scope: !551)
!554 = !DILocation(line: 213, column: 25, scope: !551)
!555 = !DILocation(line: 216, column: 13, scope: !481)
!556 = !DILocation(line: 217, column: 9, scope: !477)
!557 = !DILocation(line: 169, column: 37, scope: !472)
!558 = !DILocation(line: 169, column: 9, scope: !472)
!559 = distinct !{!559, !474, !560}
!560 = !DILocation(line: 217, column: 9, scope: !469)
!561 = distinct !{!561, !458, !562}
!562 = !DILocation(line: 218, column: 5, scope: !443)
!563 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 221, type: !564, scopeLine: 222, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!564 = !DISubroutineType(types: !565)
!565 = !{!22, !22, !566}
!566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64)
!567 = !DILocalVariable(name: "argc", arg: 1, scope: !563, file: !3, line: 221, type: !22)
!568 = !DILocation(line: 221, column: 15, scope: !563)
!569 = !DILocalVariable(name: "argv", arg: 2, scope: !563, file: !3, line: 221, type: !566)
!570 = !DILocation(line: 221, column: 26, scope: !563)
!571 = !DILocation(line: 223, column: 15, scope: !563)
!572 = !DILocation(line: 223, column: 13, scope: !563)
!573 = !DILocation(line: 225, column: 26, scope: !563)
!574 = !DILocation(line: 226, column: 26, scope: !563)
!575 = !DILocation(line: 226, column: 24, scope: !563)
!576 = !DILocation(line: 227, column: 9, scope: !577)
!577 = distinct !DILexicalBlock(scope: !563, file: !3, line: 227, column: 9)
!578 = !DILocation(line: 227, column: 14, scope: !577)
!579 = !DILocation(line: 227, column: 9, scope: !563)
!580 = !DILocation(line: 229, column: 41, scope: !581)
!581 = distinct !DILexicalBlock(scope: !577, file: !3, line: 228, column: 5)
!582 = !DILocation(line: 229, column: 36, scope: !581)
!583 = !DILocation(line: 229, column: 30, scope: !581)
!584 = !DILocation(line: 229, column: 28, scope: !581)
!585 = !DILocation(line: 230, column: 5, scope: !581)
!586 = !DILocation(line: 231, column: 33, scope: !563)
!587 = !DILocation(line: 231, column: 31, scope: !563)
!588 = !DILocation(line: 232, column: 40, scope: !563)
!589 = !DILocation(line: 232, column: 65, scope: !563)
!590 = !DILocation(line: 232, column: 49, scope: !563)
!591 = !DILocation(line: 232, column: 5, scope: !563)
!592 = !DILocation(line: 234, column: 14, scope: !593)
!593 = distinct !DILexicalBlock(scope: !563, file: !3, line: 234, column: 9)
!594 = !DILocation(line: 234, column: 9, scope: !593)
!595 = !DILocation(line: 234, column: 54, scope: !593)
!596 = !DILocation(line: 234, column: 9, scope: !563)
!597 = !DILocation(line: 236, column: 9, scope: !598)
!598 = distinct !DILexicalBlock(scope: !593, file: !3, line: 235, column: 5)
!599 = !DILocation(line: 237, column: 9, scope: !598)
!600 = !DILocation(line: 240, column: 16, scope: !601)
!601 = distinct !DILexicalBlock(scope: !563, file: !3, line: 240, column: 9)
!602 = !DILocation(line: 240, column: 9, scope: !601)
!603 = !DILocation(line: 240, column: 29, scope: !601)
!604 = !DILocation(line: 240, column: 9, scope: !563)
!605 = !DILocation(line: 242, column: 9, scope: !606)
!606 = distinct !DILexicalBlock(scope: !601, file: !3, line: 241, column: 5)
!607 = !DILocation(line: 243, column: 5, scope: !606)
!608 = !DILocation(line: 245, column: 5, scope: !563)
!609 = !DILocation(line: 247, column: 5, scope: !563)
!610 = !DILocation(line: 248, column: 1, scope: !563)
