; ModuleID = 'chat-server.ll'
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
  call void @llvm.dbg.value(metadata i32 %handle, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call noalias i8* @malloc(i64 4132) #7, !dbg !91
  %0 = bitcast i8* %call to %struct.client*, !dbg !91
  %idxprom = sext i32 %handle to i64, !dbg !92
  %arrayidx = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom, !dbg !92
  store %struct.client* %0, %struct.client** %arrayidx, align 8, !dbg !93
  %idxprom1 = sext i32 %handle to i64, !dbg !94
  %arrayidx2 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom1, !dbg !94
  %1 = load %struct.client*, %struct.client** %arrayidx2, align 8, !dbg !94
  %buffer = getelementptr inbounds %struct.client, %struct.client* %1, i32 0, i32 0, !dbg !95
  %arrayidx3 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer, i64 0, i64 0, !dbg !94
  store i8 0, i8* %arrayidx3, align 4, !dbg !96
  %idxprom4 = sext i32 %handle to i64, !dbg !97
  %arrayidx5 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom4, !dbg !97
  %2 = load %struct.client*, %struct.client** %arrayidx5, align 8, !dbg !97
  %pos = getelementptr inbounds %struct.client, %struct.client* %2, i32 0, i32 1, !dbg !98
  store i32 0, i32* %pos, align 4, !dbg !99
  %idxprom6 = sext i32 %handle to i64, !dbg !100
  %arrayidx7 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom6, !dbg !100
  %3 = load %struct.client*, %struct.client** %arrayidx7, align 8, !dbg !100
  %name = getelementptr inbounds %struct.client, %struct.client* %3, i32 0, i32 2, !dbg !101
  %arrayidx8 = getelementptr inbounds [32 x i8], [32 x i8]* %name, i64 0, i64 0, !dbg !100
  store i8 0, i8* %arrayidx8, align 4, !dbg !102
  ret void, !dbg !103
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CloseConnection(i32 %handle) #0 !dbg !104 {
entry:
  %buf = alloca [512 x i8], align 16
  call void @llvm.dbg.value(metadata i32 %handle, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [512 x i8]* %buf, metadata !107, metadata !DIExpression()), !dbg !111
  %rem = srem i32 %handle, 64, !dbg !112
  %sh_prom = zext i32 %rem to i64, !dbg !112
  %shl = shl i64 1, %sh_prom, !dbg !112
  %neg = xor i64 %shl, -1, !dbg !112
  %div = sdiv i32 %handle, 64, !dbg !112
  %idxprom = sext i32 %div to i64, !dbg !112
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom, !dbg !112
  %0 = load i64, i64* %arrayidx, align 8, !dbg !112
  %and = and i64 %0, %neg, !dbg !112
  store i64 %and, i64* %arrayidx, align 8, !dbg !112
  %idxprom1 = sext i32 %handle to i64, !dbg !113
  %arrayidx2 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom1, !dbg !113
  %1 = load %struct.client*, %struct.client** %arrayidx2, align 8, !dbg !113
  %name = getelementptr inbounds %struct.client, %struct.client* %1, i32 0, i32 2, !dbg !115
  %arrayidx3 = getelementptr inbounds [32 x i8], [32 x i8]* %name, i64 0, i64 0, !dbg !113
  %2 = load i8, i8* %arrayidx3, align 4, !dbg !113
  %tobool = icmp ne i8 %2, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !117
  %idxprom4 = sext i32 %handle to i64, !dbg !119
  %arrayidx5 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom4, !dbg !119
  %3 = load %struct.client*, %struct.client** %arrayidx5, align 8, !dbg !119
  %name6 = getelementptr inbounds %struct.client, %struct.client* %3, i32 0, i32 2, !dbg !120
  %arraydecay7 = getelementptr inbounds [32 x i8], [32 x i8]* %name6, i64 0, i64 0, !dbg !119
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i8* %arraydecay7) #7, !dbg !121
  call void @llvm.dbg.value(metadata i32 0, metadata !122, metadata !DIExpression()), !dbg !106
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.then
  %j.0 = phi i32 [ 0, %if.then ], [ %inc, %for.inc ], !dbg !125
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !122, metadata !DIExpression()), !dbg !106
  %cmp = icmp slt i32 %j.0, 1024, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %cmp8 = icmp ne i32 %handle, %j.0, !dbg !129
  br i1 %cmp8, label %land.lhs.true, label %if.end26, !dbg !132

land.lhs.true:                                    ; preds = %for.body
  %4 = load i32, i32* @tsocket, align 4, !dbg !133
  %cmp9 = icmp ne i32 %j.0, %4, !dbg !134
  br i1 %cmp9, label %land.lhs.true10, label %if.end26, !dbg !135

land.lhs.true10:                                  ; preds = %land.lhs.true
  %div11 = sdiv i32 %j.0, 64, !dbg !136
  %idxprom12 = sext i32 %div11 to i64, !dbg !136
  %arrayidx13 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom12, !dbg !136
  %5 = load i64, i64* %arrayidx13, align 8, !dbg !136
  %rem14 = srem i32 %j.0, 64, !dbg !136
  %sh_prom15 = zext i32 %rem14 to i64, !dbg !136
  %shl16 = shl i64 1, %sh_prom15, !dbg !136
  %and17 = and i64 %5, %shl16, !dbg !136
  %cmp18 = icmp ne i64 %and17, 0, !dbg !136
  br i1 %cmp18, label %if.then19, label %if.end26, !dbg !137

if.then19:                                        ; preds = %land.lhs.true10
  %arraydecay20 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !138
  %arraydecay21 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !141
  %call22 = call i64 @strlen(i8* %arraydecay21), !dbg !142
  %call23 = call i32 (i32, i8*, i64, ...) bitcast (i32 (...)* @write to i32 (i32, i8*, i64, ...)*)(i32 %j.0, i8* %arraydecay20, i64 %call22), !dbg !143
  %cmp24 = icmp slt i32 %call23, 0, !dbg !144
  br i1 %cmp24, label %if.then25, label %if.end, !dbg !145

if.then25:                                        ; preds = %if.then19
  call void @CloseConnection(i32 %j.0), !dbg !146
  br label %if.end, !dbg !148

if.end:                                           ; preds = %if.then25, %if.then19
  br label %if.end26, !dbg !149

if.end26:                                         ; preds = %if.end, %land.lhs.true10, %land.lhs.true, %for.body
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %if.end26
  %inc = add nsw i32 %j.0, 1, !dbg !151
  call void @llvm.dbg.value(metadata i32 %inc, metadata !122, metadata !DIExpression()), !dbg !106
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  br label %if.end28, !dbg !155

if.else:                                          ; preds = %entry
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 %handle), !dbg !156
  br label %if.end28

if.end28:                                         ; preds = %if.else, %for.end
  %idxprom29 = sext i32 %handle to i64, !dbg !158
  %arrayidx30 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom29, !dbg !158
  %6 = load %struct.client*, %struct.client** %arrayidx30, align 8, !dbg !158
  %tobool31 = icmp ne %struct.client* %6, null, !dbg !158
  br i1 %tobool31, label %if.then32, label %if.end35, !dbg !160

if.then32:                                        ; preds = %if.end28
  %idxprom33 = sext i32 %handle to i64, !dbg !161
  %arrayidx34 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom33, !dbg !161
  %7 = load %struct.client*, %struct.client** %arrayidx34, align 8, !dbg !161
  %8 = bitcast %struct.client* %7 to i8*, !dbg !161
  call void @free(i8* %8) #7, !dbg !163
  br label %if.end35, !dbg !164

if.end35:                                         ; preds = %if.then32, %if.end28
  %call36 = call i32 (i32, ...) bitcast (i32 (...)* @close to i32 (i32, ...)*)(i32 %handle), !dbg !165
  ret void, !dbg !166
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
define dso_local void @strip(i8* %buf) #0 !dbg !167 {
entry:
  call void @llvm.dbg.value(metadata i8* %buf, metadata !171, metadata !DIExpression()), !dbg !172
  %call = call i8* @strchr(i8* %buf, i32 10), !dbg !173
  call void @llvm.dbg.value(metadata i8* %call, metadata !174, metadata !DIExpression()), !dbg !172
  %tobool = icmp ne i8* %call, null, !dbg !175
  br i1 %tobool, label %if.then, label %if.end, !dbg !177

if.then:                                          ; preds = %entry
  store i8 0, i8* %call, align 1, !dbg !178
  br label %if.end, !dbg !180

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i8* @strchr(i8* %buf, i32 13), !dbg !181
  call void @llvm.dbg.value(metadata i8* %call1, metadata !174, metadata !DIExpression()), !dbg !172
  %tobool2 = icmp ne i8* %call1, null, !dbg !182
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !184

if.then3:                                         ; preds = %if.end
  store i8 0, i8* %call1, align 1, !dbg !185
  br label %if.end4, !dbg !187

if.end4:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !188
}

declare dso_local i8* @strchr(i8*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @RelayText(i32 %handle) #0 !dbg !189 {
entry:
  %output = alloca [8000 x i8], align 16
  call void @llvm.dbg.value(metadata i32 %handle, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.value(metadata i32 0, metadata !194, metadata !DIExpression()), !dbg !193
  %idxprom = sext i32 %handle to i64, !dbg !195
  %arrayidx = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom, !dbg !195
  %0 = load %struct.client*, %struct.client** %arrayidx, align 8, !dbg !195
  %buffer = getelementptr inbounds %struct.client, %struct.client* %0, i32 0, i32 0, !dbg !196
  %arraydecay = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer, i64 0, i64 0, !dbg !195
  call void @llvm.dbg.value(metadata i8* %arraydecay, metadata !197, metadata !DIExpression()), !dbg !193
  %idxprom1 = sext i32 %handle to i64, !dbg !198
  %arrayidx2 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom1, !dbg !198
  %1 = load %struct.client*, %struct.client** %arrayidx2, align 8, !dbg !198
  %pos = getelementptr inbounds %struct.client, %struct.client* %1, i32 0, i32 1, !dbg !200
  %2 = load i32, i32* %pos, align 4, !dbg !200
  %cmp = icmp eq i32 %2, 4000, !dbg !201
  br i1 %cmp, label %if.then, label %if.else10, !dbg !202

if.then:                                          ; preds = %entry
  %arrayidx3 = getelementptr inbounds i8, i8* %arraydecay, i64 3999, !dbg !203
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !203
  %conv = sext i8 %3 to i32, !dbg !203
  %cmp4 = icmp ne i32 %conv, 10, !dbg !206
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !207

if.then6:                                         ; preds = %if.then
  %arrayidx7 = getelementptr inbounds i8, i8* %arraydecay, i64 4000, !dbg !208
  store i8 0, i8* %arrayidx7, align 1, !dbg !209
  br label %if.end, !dbg !208

if.else:                                          ; preds = %if.then
  %arrayidx8 = getelementptr inbounds i8, i8* %arraydecay, i64 4000, !dbg !210
  store i8 10, i8* %arrayidx8, align 1, !dbg !212
  %arrayidx9 = getelementptr inbounds i8, i8* %arraydecay, i64 4001, !dbg !213
  store i8 0, i8* %arrayidx9, align 1, !dbg !214
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  br label %if.end16, !dbg !215

if.else10:                                        ; preds = %entry
  %idxprom11 = sext i32 %handle to i64, !dbg !216
  %arrayidx12 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom11, !dbg !216
  %4 = load %struct.client*, %struct.client** %arrayidx12, align 8, !dbg !216
  %pos13 = getelementptr inbounds %struct.client, %struct.client* %4, i32 0, i32 1, !dbg !218
  %5 = load i32, i32* %pos13, align 4, !dbg !218
  %idxprom14 = sext i32 %5 to i64, !dbg !219
  %arrayidx15 = getelementptr inbounds i8, i8* %arraydecay, i64 %idxprom14, !dbg !219
  store i8 0, i8* %arrayidx15, align 1, !dbg !220
  br label %if.end16

if.end16:                                         ; preds = %if.else10, %if.end
  %call = call i8* @strchr(i8* %arraydecay, i32 10), !dbg !221
  call void @llvm.dbg.value(metadata i8* %call, metadata !222, metadata !DIExpression()), !dbg !193
  br label %while.cond, !dbg !223

while.cond:                                       ; preds = %if.end75, %if.end16
  %ret.0 = phi i32 [ 0, %if.end16 ], [ 1, %if.end75 ], !dbg !193
  %end.0 = phi i8* [ %call, %if.end16 ], [ %call76, %if.end75 ], !dbg !193
  %begin.0 = phi i8* [ %arraydecay, %if.end16 ], [ %add.ptr, %if.end75 ], !dbg !193
  call void @llvm.dbg.value(metadata i8* %begin.0, metadata !197, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.value(metadata i8* %end.0, metadata !222, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.value(metadata i32 %ret.0, metadata !194, metadata !DIExpression()), !dbg !193
  %cmp17 = icmp ne i8* %end.0, null, !dbg !224
  br i1 %cmp17, label %while.body, label %while.end, !dbg !223

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata [8000 x i8]* %output, metadata !225, metadata !DIExpression()), !dbg !230
  %arrayidx19 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !231
  store i8 0, i8* %arrayidx19, align 16, !dbg !232
  %idxprom20 = sext i32 %handle to i64, !dbg !233
  %arrayidx21 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom20, !dbg !233
  %6 = load %struct.client*, %struct.client** %arrayidx21, align 8, !dbg !233
  %name = getelementptr inbounds %struct.client, %struct.client* %6, i32 0, i32 2, !dbg !235
  %arrayidx22 = getelementptr inbounds [32 x i8], [32 x i8]* %name, i64 0, i64 0, !dbg !233
  %7 = load i8, i8* %arrayidx22, align 4, !dbg !233
  %tobool = icmp ne i8 %7, 0, !dbg !233
  br i1 %tobool, label %if.else43, label %if.then23, !dbg !236

if.then23:                                        ; preds = %while.body
  %idxprom24 = sext i32 %handle to i64, !dbg !237
  %arrayidx25 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom24, !dbg !237
  %8 = load %struct.client*, %struct.client** %arrayidx25, align 8, !dbg !237
  %name26 = getelementptr inbounds %struct.client, %struct.client* %8, i32 0, i32 2, !dbg !239
  %arraydecay27 = getelementptr inbounds [32 x i8], [32 x i8]* %name26, i64 0, i64 0, !dbg !237
  %call28 = call i8* @strncpy(i8* %arraydecay27, i8* %begin.0, i64 31), !dbg !240
  %idxprom29 = sext i32 %handle to i64, !dbg !241
  %arrayidx30 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom29, !dbg !241
  %9 = load %struct.client*, %struct.client** %arrayidx30, align 8, !dbg !241
  %name31 = getelementptr inbounds %struct.client, %struct.client* %9, i32 0, i32 2, !dbg !242
  %arrayidx32 = getelementptr inbounds [32 x i8], [32 x i8]* %name31, i64 0, i64 31, !dbg !241
  store i8 0, i8* %arrayidx32, align 1, !dbg !243
  %idxprom33 = sext i32 %handle to i64, !dbg !244
  %arrayidx34 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom33, !dbg !244
  %10 = load %struct.client*, %struct.client** %arrayidx34, align 8, !dbg !244
  %name35 = getelementptr inbounds %struct.client, %struct.client* %10, i32 0, i32 2, !dbg !245
  %arraydecay36 = getelementptr inbounds [32 x i8], [32 x i8]* %name35, i64 0, i64 0, !dbg !244
  call void @strip(i8* %arraydecay36), !dbg !246
  %arraydecay37 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !247
  %idxprom38 = sext i32 %handle to i64, !dbg !248
  %arrayidx39 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom38, !dbg !248
  %11 = load %struct.client*, %struct.client** %arrayidx39, align 8, !dbg !248
  %name40 = getelementptr inbounds %struct.client, %struct.client* %11, i32 0, i32 2, !dbg !249
  %arraydecay41 = getelementptr inbounds [32 x i8], [32 x i8]* %name40, i64 0, i64 0, !dbg !248
  %call42 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay37, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay41) #7, !dbg !250
  call void @llvm.dbg.value(metadata i32 1, metadata !194, metadata !DIExpression()), !dbg !193
  br label %if.end50, !dbg !251

if.else43:                                        ; preds = %while.body
  %arraydecay44 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !252
  %idxprom45 = sext i32 %handle to i64, !dbg !254
  %arrayidx46 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom45, !dbg !254
  %12 = load %struct.client*, %struct.client** %arrayidx46, align 8, !dbg !254
  %name47 = getelementptr inbounds %struct.client, %struct.client* %12, i32 0, i32 2, !dbg !255
  %arraydecay48 = getelementptr inbounds [32 x i8], [32 x i8]* %name47, i64 0, i64 0, !dbg !254
  %sub.ptr.lhs.cast = ptrtoint i8* %end.0 to i64, !dbg !256
  %sub.ptr.rhs.cast = ptrtoint i8* %begin.0 to i64, !dbg !256
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !256
  %call49 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay44, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i8* %arraydecay48, i64 %sub.ptr.sub, i8* %begin.0) #7, !dbg !257
  call void @llvm.dbg.value(metadata i32 1, metadata !194, metadata !DIExpression()), !dbg !193
  br label %if.end50

if.end50:                                         ; preds = %if.else43, %if.then23
  call void @llvm.dbg.value(metadata i32 1, metadata !194, metadata !DIExpression()), !dbg !193
  %arrayidx51 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !258
  %13 = load i8, i8* %arrayidx51, align 16, !dbg !258
  %tobool52 = icmp ne i8 %13, 0, !dbg !258
  br i1 %tobool52, label %if.then53, label %if.end75, !dbg !260

if.then53:                                        ; preds = %if.end50
  call void @llvm.dbg.value(metadata i32 0, metadata !261, metadata !DIExpression()), !dbg !263
  br label %for.cond, !dbg !264

for.cond:                                         ; preds = %for.inc, %if.then53
  %j.0 = phi i32 [ 0, %if.then53 ], [ %inc, %for.inc ], !dbg !266
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !261, metadata !DIExpression()), !dbg !263
  %cmp54 = icmp slt i32 %j.0, 1024, !dbg !267
  br i1 %cmp54, label %for.body, label %for.end, !dbg !269

for.body:                                         ; preds = %for.cond
  %cmp56 = icmp ne i32 %handle, %j.0, !dbg !270
  br i1 %cmp56, label %land.lhs.true, label %if.end74, !dbg !273

land.lhs.true:                                    ; preds = %for.body
  %14 = load i32, i32* @tsocket, align 4, !dbg !274
  %cmp58 = icmp ne i32 %j.0, %14, !dbg !275
  br i1 %cmp58, label %land.lhs.true60, label %if.end74, !dbg !276

land.lhs.true60:                                  ; preds = %land.lhs.true
  %div = sdiv i32 %j.0, 64, !dbg !277
  %idxprom61 = sext i32 %div to i64, !dbg !277
  %arrayidx62 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom61, !dbg !277
  %15 = load i64, i64* %arrayidx62, align 8, !dbg !277
  %rem = srem i32 %j.0, 64, !dbg !277
  %sh_prom = zext i32 %rem to i64, !dbg !277
  %shl = shl i64 1, %sh_prom, !dbg !277
  %and = and i64 %15, %shl, !dbg !277
  %cmp63 = icmp ne i64 %and, 0, !dbg !277
  br i1 %cmp63, label %if.then65, label %if.end74, !dbg !278

if.then65:                                        ; preds = %land.lhs.true60
  %arraydecay66 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !279
  %arraydecay67 = getelementptr inbounds [8000 x i8], [8000 x i8]* %output, i64 0, i64 0, !dbg !282
  %call68 = call i64 @strlen(i8* %arraydecay67), !dbg !283
  %call69 = call i32 (i32, i8*, i64, ...) bitcast (i32 (...)* @write to i32 (i32, i8*, i64, ...)*)(i32 %j.0, i8* %arraydecay66, i64 %call68), !dbg !284
  %cmp70 = icmp slt i32 %call69, 0, !dbg !285
  br i1 %cmp70, label %if.then72, label %if.end73, !dbg !286

if.then72:                                        ; preds = %if.then65
  call void @CloseConnection(i32 %j.0), !dbg !287
  br label %if.end73, !dbg !289

if.end73:                                         ; preds = %if.then72, %if.then65
  br label %if.end74, !dbg !290

if.end74:                                         ; preds = %if.end73, %land.lhs.true60, %land.lhs.true, %for.body
  br label %for.inc, !dbg !291

for.inc:                                          ; preds = %if.end74
  %inc = add nsw i32 %j.0, 1, !dbg !292
  call void @llvm.dbg.value(metadata i32 %inc, metadata !261, metadata !DIExpression()), !dbg !263
  br label %for.cond, !dbg !293, !llvm.loop !294

for.end:                                          ; preds = %for.cond
  br label %if.end75, !dbg !296

if.end75:                                         ; preds = %for.end, %if.end50
  %add.ptr = getelementptr inbounds i8, i8* %end.0, i64 1, !dbg !297
  call void @llvm.dbg.value(metadata i8* %add.ptr, metadata !197, metadata !DIExpression()), !dbg !193
  %call76 = call i8* @strchr(i8* %add.ptr, i32 10), !dbg !298
  call void @llvm.dbg.value(metadata i8* %call76, metadata !222, metadata !DIExpression()), !dbg !193
  br label %while.cond, !dbg !223, !llvm.loop !299

while.end:                                        ; preds = %while.cond
  %idxprom77 = sext i32 %handle to i64, !dbg !301
  %arrayidx78 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom77, !dbg !301
  %16 = load %struct.client*, %struct.client** %arrayidx78, align 8, !dbg !301
  %buffer79 = getelementptr inbounds %struct.client, %struct.client* %16, i32 0, i32 0, !dbg !302
  %arraydecay80 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer79, i64 0, i64 0, !dbg !301
  %call81 = call i8* @strcpy(i8* %arraydecay80, i8* %begin.0), !dbg !303
  %idxprom82 = sext i32 %handle to i64, !dbg !304
  %arrayidx83 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom82, !dbg !304
  %17 = load %struct.client*, %struct.client** %arrayidx83, align 8, !dbg !304
  %buffer84 = getelementptr inbounds %struct.client, %struct.client* %17, i32 0, i32 0, !dbg !305
  %arraydecay85 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer84, i64 0, i64 0, !dbg !304
  %sub.ptr.lhs.cast86 = ptrtoint i8* %begin.0 to i64, !dbg !306
  %sub.ptr.rhs.cast87 = ptrtoint i8* %arraydecay85 to i64, !dbg !306
  %sub.ptr.sub88 = sub i64 %sub.ptr.lhs.cast86, %sub.ptr.rhs.cast87, !dbg !306
  %idxprom89 = sext i32 %handle to i64, !dbg !307
  %arrayidx90 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom89, !dbg !307
  %18 = load %struct.client*, %struct.client** %arrayidx90, align 8, !dbg !307
  %pos91 = getelementptr inbounds %struct.client, %struct.client* %18, i32 0, i32 1, !dbg !308
  %19 = load i32, i32* %pos91, align 4, !dbg !309
  %conv92 = sext i32 %19 to i64, !dbg !309
  %sub = sub nsw i64 %conv92, %sub.ptr.sub88, !dbg !309
  %conv93 = trunc i64 %sub to i32, !dbg !309
  store i32 %conv93, i32* %pos91, align 4, !dbg !309
  ret i32 %ret.0, !dbg !310
}

declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @ClientText(i32 %handle, i8* %buf, i32 %buf_len) #0 !dbg !311 {
entry:
  call void @llvm.dbg.value(metadata i32 %handle, metadata !314, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata i8* %buf, metadata !316, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata i32 %buf_len, metadata !317, metadata !DIExpression()), !dbg !315
  %idxprom = sext i32 %handle to i64, !dbg !318
  %arrayidx = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom, !dbg !318
  %0 = load %struct.client*, %struct.client** %arrayidx, align 8, !dbg !318
  %tobool = icmp ne %struct.client* %0, null, !dbg !318
  br i1 %tobool, label %if.end, label %if.then, !dbg !320

if.then:                                          ; preds = %entry
  br label %while.end24, !dbg !321

if.end:                                           ; preds = %entry
  %idxprom1 = sext i32 %handle to i64, !dbg !322
  %arrayidx2 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom1, !dbg !322
  %1 = load %struct.client*, %struct.client** %arrayidx2, align 8, !dbg !322
  %pos = getelementptr inbounds %struct.client, %struct.client* %1, i32 0, i32 1, !dbg !323
  %2 = load i32, i32* %pos, align 4, !dbg !323
  call void @llvm.dbg.value(metadata i32 %2, metadata !324, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata i32 0, metadata !325, metadata !DIExpression()), !dbg !315
  br label %for.cond, !dbg !326

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !328
  %j.0 = phi i32 [ %2, %if.end ], [ %inc16, %for.inc ], !dbg !315
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !324, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !325, metadata !DIExpression()), !dbg !315
  %cmp = icmp slt i32 %i.0, %buf_len, !dbg !329
  br i1 %cmp, label %for.body, label %for.end, !dbg !331

for.body:                                         ; preds = %for.cond
  %idxprom3 = sext i32 %i.0 to i64, !dbg !332
  %arrayidx4 = getelementptr inbounds i8, i8* %buf, i64 %idxprom3, !dbg !332
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !332
  %idxprom5 = sext i32 %handle to i64, !dbg !334
  %arrayidx6 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom5, !dbg !334
  %4 = load %struct.client*, %struct.client** %arrayidx6, align 8, !dbg !334
  %buffer = getelementptr inbounds %struct.client, %struct.client* %4, i32 0, i32 0, !dbg !335
  %idxprom7 = sext i32 %j.0 to i64, !dbg !334
  %arrayidx8 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buffer, i64 0, i64 %idxprom7, !dbg !334
  store i8 %3, i8* %arrayidx8, align 1, !dbg !336
  %cmp9 = icmp eq i32 %j.0, 4000, !dbg !337
  br i1 %cmp9, label %if.then10, label %if.end15, !dbg !339

if.then10:                                        ; preds = %for.body
  br label %while.cond, !dbg !340

while.cond:                                       ; preds = %while.body, %if.then10
  %call = call i32 @RelayText(i32 %handle), !dbg !342
  %tobool11 = icmp ne i32 %call, 0, !dbg !340
  br i1 %tobool11, label %while.body, label %while.end, !dbg !340

while.body:                                       ; preds = %while.cond
  br label %while.cond, !dbg !340, !llvm.loop !343

while.end:                                        ; preds = %while.cond
  %idxprom12 = sext i32 %handle to i64, !dbg !345
  %arrayidx13 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom12, !dbg !345
  %5 = load %struct.client*, %struct.client** %arrayidx13, align 8, !dbg !345
  %pos14 = getelementptr inbounds %struct.client, %struct.client* %5, i32 0, i32 1, !dbg !346
  %6 = load i32, i32* %pos14, align 4, !dbg !346
  call void @llvm.dbg.value(metadata i32 %6, metadata !324, metadata !DIExpression()), !dbg !315
  br label %if.end15, !dbg !347

if.end15:                                         ; preds = %while.end, %for.body
  %j.1 = phi i32 [ %6, %while.end ], [ %j.0, %for.body ], !dbg !315
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !324, metadata !DIExpression()), !dbg !315
  br label %for.inc, !dbg !348

for.inc:                                          ; preds = %if.end15
  %inc = add nsw i32 %i.0, 1, !dbg !349
  call void @llvm.dbg.value(metadata i32 %inc, metadata !325, metadata !DIExpression()), !dbg !315
  %inc16 = add nsw i32 %j.1, 1, !dbg !350
  call void @llvm.dbg.value(metadata i32 %inc16, metadata !324, metadata !DIExpression()), !dbg !315
  br label %for.cond, !dbg !351, !llvm.loop !352

for.end:                                          ; preds = %for.cond
  %idxprom17 = sext i32 %handle to i64, !dbg !354
  %arrayidx18 = getelementptr inbounds [1024 x %struct.client*], [1024 x %struct.client*]* @connections, i64 0, i64 %idxprom17, !dbg !354
  %7 = load %struct.client*, %struct.client** %arrayidx18, align 8, !dbg !354
  %pos19 = getelementptr inbounds %struct.client, %struct.client* %7, i32 0, i32 1, !dbg !355
  store i32 %j.0, i32* %pos19, align 4, !dbg !356
  br label %while.cond20, !dbg !357

while.cond20:                                     ; preds = %while.body23, %for.end
  %call21 = call i32 @RelayText(i32 %handle), !dbg !358
  %tobool22 = icmp ne i32 %call21, 0, !dbg !357
  br i1 %tobool22, label %while.body23, label %while.end24.loopexit, !dbg !357

while.body23:                                     ; preds = %while.cond20
  br label %while.cond20, !dbg !357, !llvm.loop !359

while.end24.loopexit:                             ; preds = %while.cond20
  br label %while.end24, !dbg !361

while.end24:                                      ; preds = %while.end24.loopexit, %if.then
  ret void, !dbg !361
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ChatLoop() #0 !dbg !362 {
entry:
  %cliinfo = alloca %struct.sockaddr_in, align 4
  %addrlen = alloca i32, align 4
  %buf = alloca [512 x i8], align 16
  call void @llvm.dbg.declare(metadata !88, metadata !365, metadata !DIExpression()), !dbg !366
  br label %do.body, !dbg !367

do.body:                                          ; preds = %entry
  %0 = call { i64, i64* } asm sideeffect "cld; rep; stosq", "={cx},={di},{ax},0,1,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 0, i64 16, i64* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0, i64 0)) #7, !dbg !368, !srcloc !370
  %asmresult = extractvalue { i64, i64* } %0, 0, !dbg !368
  %asmresult1 = extractvalue { i64, i64* } %0, 1, !dbg !368
  %1 = trunc i64 %asmresult to i32, !dbg !368
  call void @llvm.dbg.value(metadata i32 %1, metadata !371, metadata !DIExpression()), !dbg !372
  %2 = ptrtoint i64* %asmresult1 to i64, !dbg !368
  %3 = trunc i64 %2 to i32, !dbg !368
  call void @llvm.dbg.value(metadata i32 %3, metadata !373, metadata !DIExpression()), !dbg !372
  br label %do.end, !dbg !368

do.end:                                           ; preds = %do.body
  %4 = load i32, i32* @tsocket, align 4, !dbg !374
  %rem = srem i32 %4, 64, !dbg !374
  %sh_prom = zext i32 %rem to i64, !dbg !374
  %shl = shl i64 1, %sh_prom, !dbg !374
  %5 = load i32, i32* @tsocket, align 4, !dbg !374
  %div = sdiv i32 %5, 64, !dbg !374
  %idxprom = sext i32 %div to i64, !dbg !374
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom, !dbg !374
  %6 = load i64, i64* %arrayidx, align 8, !dbg !374
  %or = or i64 %6, %shl, !dbg !374
  store i64 %or, i64* %arrayidx, align 8, !dbg !374
  %7 = load i64, i64* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0, i64 0), align 8, !dbg !375
  %or2 = or i64 %7, 1, !dbg !375
  store i64 %or2, i64* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0, i64 0), align 8, !dbg !375
  br label %while.body, !dbg !376

while.body:                                       ; preds = %for.end, %do.end
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 bitcast (%struct.fd_set* @current to i8*), i8* align 8 bitcast (%struct.fd_set* @status to i8*), i64 128, i1 false), !dbg !377
  %call = call i32 @select(i32 1024, %struct.fd_set* @current, %struct.fd_set* null, %struct.fd_set* null, %struct.timeval* null), !dbg !379
  %cmp = icmp eq i32 %call, -1, !dbg !381
  br i1 %cmp, label %if.then, label %if.end, !dbg !382

if.then:                                          ; preds = %while.body
  call void @perror(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0)), !dbg !383
  ret i32 0, !dbg !385

if.end:                                           ; preds = %while.body
  call void @llvm.dbg.value(metadata i32 0, metadata !386, metadata !DIExpression()), !dbg !387
  br label %for.cond, !dbg !388

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !390
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !386, metadata !DIExpression()), !dbg !387
  %cmp3 = icmp slt i32 %i.0, 1024, !dbg !391
  br i1 %cmp3, label %for.body, label %for.end, !dbg !393

for.body:                                         ; preds = %for.cond
  %div4 = sdiv i32 %i.0, 64, !dbg !394
  %idxprom5 = sext i32 %div4 to i64, !dbg !394
  %arrayidx6 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @current, i32 0, i32 0), i64 0, i64 %idxprom5, !dbg !394
  %8 = load i64, i64* %arrayidx6, align 8, !dbg !394
  %rem7 = srem i32 %i.0, 64, !dbg !394
  %sh_prom8 = zext i32 %rem7 to i64, !dbg !394
  %shl9 = shl i64 1, %sh_prom8, !dbg !394
  %and = and i64 %8, %shl9, !dbg !394
  %cmp10 = icmp ne i64 %and, 0, !dbg !394
  br i1 %cmp10, label %if.then11, label %if.end47, !dbg !397

if.then11:                                        ; preds = %for.body
  %9 = load i32, i32* @tsocket, align 4, !dbg !398
  %cmp12 = icmp eq i32 %i.0, %9, !dbg !401
  br i1 %cmp12, label %if.then13, label %if.else38, !dbg !402

if.then13:                                        ; preds = %if.then11
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %cliinfo, metadata !403, metadata !DIExpression()), !dbg !405
  call void @llvm.dbg.declare(metadata i32* %addrlen, metadata !406, metadata !DIExpression()), !dbg !410
  store i32 16, i32* %addrlen, align 4, !dbg !410
  %10 = load i32, i32* @tsocket, align 4, !dbg !411
  %11 = bitcast %struct.sockaddr_in* %cliinfo to %struct.sockaddr*, !dbg !412
  %call14 = call i32 @accept(i32 %10, %struct.sockaddr* %11, i32* %addrlen), !dbg !413
  call void @llvm.dbg.value(metadata i32 %call14, metadata !414, metadata !DIExpression()), !dbg !415
  %cmp15 = icmp eq i32 %call14, -1, !dbg !416
  br i1 %cmp15, label %if.then16, label %if.else, !dbg !418

if.then16:                                        ; preds = %if.then13
  call void @perror(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.5, i64 0, i64 0)), !dbg !419
  br label %if.end37, !dbg !421

if.else:                                          ; preds = %if.then13
  %cmp17 = icmp sgt i32 %call14, 1024, !dbg !422
  br i1 %cmp17, label %if.then18, label %if.else21, !dbg !424

if.then18:                                        ; preds = %if.else
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i64 0, i64 0)), !dbg !425
  %call20 = call i32 (i32, ...) bitcast (i32 (...)* @close to i32 (i32, ...)*)(i32 %call14), !dbg !427
  br label %if.end36, !dbg !428

if.else21:                                        ; preds = %if.else
  %call22 = call i32 (i32, i8*, i32, ...) bitcast (i32 (...)* @write to i32 (i32, i8*, i32, ...)*)(i32 %call14, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i64 0, i64 0), i32 12), !dbg !429
  %cmp23 = icmp sge i32 %call22, 0, !dbg !432
  br i1 %cmp23, label %if.then24, label %if.end35, !dbg !433

if.then24:                                        ; preds = %if.else21
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %cliinfo, i32 0, i32 2, !dbg !434
  %coerce.dive = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !436
  %12 = load i32, i32* %coerce.dive, align 4, !dbg !436
  %call25 = call i32 (i32, ...) bitcast (i32 (...)* @inet_ntoa to i32 (i32, ...)*)(i32 %12), !dbg !436
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %cliinfo, i32 0, i32 1, !dbg !437
  %13 = load i16, i16* %sin_port, align 2, !dbg !437
  %call26 = call zeroext i16 @ntohs(i16 zeroext %13) #8, !dbg !438
  %conv = zext i16 %call26 to i32, !dbg !438
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.8, i64 0, i64 0), i32 %call14, i32 %call25, i32 %conv), !dbg !439
  %rem28 = srem i32 %call14, 64, !dbg !440
  %sh_prom29 = zext i32 %rem28 to i64, !dbg !440
  %shl30 = shl i64 1, %sh_prom29, !dbg !440
  %div31 = sdiv i32 %call14, 64, !dbg !440
  %idxprom32 = sext i32 %div31 to i64, !dbg !440
  %arrayidx33 = getelementptr inbounds [16 x i64], [16 x i64]* getelementptr inbounds (%struct.fd_set, %struct.fd_set* @status, i32 0, i32 0), i64 0, i64 %idxprom32, !dbg !440
  %14 = load i64, i64* %arrayidx33, align 8, !dbg !440
  %or34 = or i64 %14, %shl30, !dbg !440
  store i64 %or34, i64* %arrayidx33, align 8, !dbg !440
  call void @AddConnection(i32 %call14), !dbg !441
  br label %if.end35, !dbg !442

if.end35:                                         ; preds = %if.then24, %if.else21
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then18
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then16
  br label %if.end46, !dbg !443

if.else38:                                        ; preds = %if.then11
  call void @llvm.dbg.declare(metadata [512 x i8]* %buf, metadata !444, metadata !DIExpression()), !dbg !446
  %arraydecay = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !447
  %call39 = call i32 (i32, i8*, i32, ...) bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %i.0, i8* %arraydecay, i32 500), !dbg !448
  call void @llvm.dbg.value(metadata i32 %call39, metadata !449, metadata !DIExpression()), !dbg !450
  %cmp40 = icmp sle i32 %call39, 0, !dbg !451
  br i1 %cmp40, label %if.then42, label %if.else43, !dbg !453

if.then42:                                        ; preds = %if.else38
  call void @CloseConnection(i32 %i.0), !dbg !454
  br label %if.end45, !dbg !456

if.else43:                                        ; preds = %if.else38
  %arraydecay44 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0, !dbg !457
  call void @ClientText(i32 %i.0, i8* %arraydecay44, i32 %call39), !dbg !459
  br label %if.end45

if.end45:                                         ; preds = %if.else43, %if.then42
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.end37
  br label %if.end47, !dbg !460

if.end47:                                         ; preds = %if.end46, %for.body
  br label %for.inc, !dbg !461

for.inc:                                          ; preds = %if.end47
  %inc = add nsw i32 %i.0, 1, !dbg !462
  call void @llvm.dbg.value(metadata i32 %inc, metadata !386, metadata !DIExpression()), !dbg !387
  br label %for.cond, !dbg !463, !llvm.loop !464

for.end:                                          ; preds = %for.cond
  br label %while.body, !dbg !376, !llvm.loop !466
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
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !468 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !472, metadata !DIExpression()), !dbg !473
  call void @llvm.dbg.value(metadata i8** %argv, metadata !474, metadata !DIExpression()), !dbg !473
  %call = call i32 @socket(i32 2, i32 1, i32 0) #7, !dbg !475
  store i32 %call, i32* @tsocket, align 4, !dbg !476
  store i16 2, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 0), align 4, !dbg !477
  %call1 = call zeroext i16 @htons(i16 zeroext 7070) #8, !dbg !478
  store i16 %call1, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 1), align 2, !dbg !479
  %cmp = icmp sgt i32 %argc, 1, !dbg !480
  br i1 %cmp, label %if.then, label %if.end, !dbg !482

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !483
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !483
  %call2 = call i32 @atoi(i8* %0) #9, !dbg !485
  %conv = trunc i32 %call2 to i16, !dbg !485
  %call3 = call zeroext i16 @htons(i16 zeroext %conv) #8, !dbg !486
  store i16 %call3, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 1), align 2, !dbg !487
  br label %if.end, !dbg !488

if.end:                                           ; preds = %if.then, %entry
  %call4 = call i32 @htonl(i32 0) #8, !dbg !489
  store i32 %call4, i32* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 2, i32 0), align 4, !dbg !490
  %1 = load i32, i32* @tsocket, align 4, !dbg !491
  %2 = load i16, i16* getelementptr inbounds (%struct.sockaddr_in, %struct.sockaddr_in* @tsockinfo, i32 0, i32 1), align 2, !dbg !492
  %call5 = call zeroext i16 @ntohs(i16 zeroext %2) #8, !dbg !493
  %conv6 = zext i16 %call5 to i32, !dbg !493
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.9, i64 0, i64 0), i32 %1, i32 %conv6), !dbg !494
  %3 = load i32, i32* @tsocket, align 4, !dbg !495
  %call8 = call i32 @bind(i32 %3, %struct.sockaddr* bitcast (%struct.sockaddr_in* @tsockinfo to %struct.sockaddr*), i32 16) #7, !dbg !497
  %cmp9 = icmp eq i32 %call8, -1, !dbg !498
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !499

if.then11:                                        ; preds = %if.end
  call void @perror(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0)), !dbg !500
  br label %return, !dbg !502

if.end12:                                         ; preds = %if.end
  %4 = load i32, i32* @tsocket, align 4, !dbg !503
  %call13 = call i32 @listen(i32 %4, i32 10) #7, !dbg !505
  %cmp14 = icmp eq i32 %call13, -1, !dbg !506
  br i1 %cmp14, label %if.then16, label %if.end17, !dbg !507

if.then16:                                        ; preds = %if.end12
  call void @perror(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i64 0, i64 0)), !dbg !508
  br label %if.end17, !dbg !510

if.end17:                                         ; preds = %if.then16, %if.end12
  %call18 = call i32 @ChatLoop(), !dbg !511
  br label %return, !dbg !512

return:                                           ; preds = %if.end17, %if.then11
  %retval.0 = phi i32 [ -1, %if.then11 ], [ 0, %if.end17 ], !dbg !473
  ret i32 %retval.0, !dbg !513
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

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!90 = !DILocation(line: 0, scope: !85)
!91 = !DILocation(line: 22, column: 27, scope: !85)
!92 = !DILocation(line: 22, column: 5, scope: !85)
!93 = !DILocation(line: 22, column: 25, scope: !85)
!94 = !DILocation(line: 23, column: 5, scope: !85)
!95 = !DILocation(line: 23, column: 26, scope: !85)
!96 = !DILocation(line: 23, column: 36, scope: !85)
!97 = !DILocation(line: 24, column: 5, scope: !85)
!98 = !DILocation(line: 24, column: 26, scope: !85)
!99 = !DILocation(line: 24, column: 30, scope: !85)
!100 = !DILocation(line: 25, column: 5, scope: !85)
!101 = !DILocation(line: 25, column: 26, scope: !85)
!102 = !DILocation(line: 25, column: 34, scope: !85)
!103 = !DILocation(line: 26, column: 1, scope: !85)
!104 = distinct !DISubprogram(name: "CloseConnection", scope: !3, file: !3, line: 28, type: !86, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!105 = !DILocalVariable(name: "handle", arg: 1, scope: !104, file: !3, line: 28, type: !22)
!106 = !DILocation(line: 0, scope: !104)
!107 = !DILocalVariable(name: "buf", scope: !104, file: !3, line: 30, type: !108)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 4096, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 512)
!111 = !DILocation(line: 30, column: 10, scope: !104)
!112 = !DILocation(line: 33, column: 5, scope: !104)
!113 = !DILocation(line: 35, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !3, line: 35, column: 9)
!115 = !DILocation(line: 35, column: 30, scope: !114)
!116 = !DILocation(line: 35, column: 9, scope: !104)
!117 = !DILocation(line: 37, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !3, line: 36, column: 5)
!119 = !DILocation(line: 37, column: 48, scope: !118)
!120 = !DILocation(line: 37, column: 69, scope: !118)
!121 = !DILocation(line: 37, column: 9, scope: !118)
!122 = !DILocalVariable(name: "j", scope: !104, file: !3, line: 31, type: !22)
!123 = !DILocation(line: 39, column: 14, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !3, line: 39, column: 9)
!125 = !DILocation(line: 0, scope: !124)
!126 = !DILocation(line: 39, column: 23, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 39, column: 9)
!128 = !DILocation(line: 39, column: 9, scope: !124)
!129 = !DILocation(line: 41, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !131, file: !3, line: 41, column: 17)
!131 = distinct !DILexicalBlock(scope: !127, file: !3, line: 40, column: 9)
!132 = !DILocation(line: 41, column: 29, scope: !130)
!133 = !DILocation(line: 41, column: 37, scope: !130)
!134 = !DILocation(line: 41, column: 34, scope: !130)
!135 = !DILocation(line: 41, column: 45, scope: !130)
!136 = !DILocation(line: 41, column: 48, scope: !130)
!137 = !DILocation(line: 41, column: 17, scope: !131)
!138 = !DILocation(line: 43, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !140, file: !3, line: 43, column: 21)
!140 = distinct !DILexicalBlock(scope: !130, file: !3, line: 42, column: 13)
!141 = !DILocation(line: 43, column: 42, scope: !139)
!142 = !DILocation(line: 43, column: 35, scope: !139)
!143 = !DILocation(line: 43, column: 21, scope: !139)
!144 = !DILocation(line: 43, column: 48, scope: !139)
!145 = !DILocation(line: 43, column: 21, scope: !140)
!146 = !DILocation(line: 45, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !139, file: !3, line: 44, column: 17)
!148 = !DILocation(line: 46, column: 17, scope: !147)
!149 = !DILocation(line: 47, column: 13, scope: !140)
!150 = !DILocation(line: 48, column: 9, scope: !131)
!151 = !DILocation(line: 39, column: 38, scope: !127)
!152 = !DILocation(line: 39, column: 9, scope: !127)
!153 = distinct !{!153, !128, !154}
!154 = !DILocation(line: 48, column: 9, scope: !124)
!155 = !DILocation(line: 49, column: 5, scope: !118)
!156 = !DILocation(line: 51, column: 9, scope: !157)
!157 = distinct !DILexicalBlock(scope: !114, file: !3, line: 50, column: 5)
!158 = !DILocation(line: 53, column: 9, scope: !159)
!159 = distinct !DILexicalBlock(scope: !104, file: !3, line: 53, column: 9)
!160 = !DILocation(line: 53, column: 9, scope: !104)
!161 = !DILocation(line: 55, column: 14, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !3, line: 54, column: 5)
!163 = !DILocation(line: 55, column: 9, scope: !162)
!164 = !DILocation(line: 56, column: 5, scope: !162)
!165 = !DILocation(line: 57, column: 5, scope: !104)
!166 = !DILocation(line: 58, column: 1, scope: !104)
!167 = distinct !DISubprogram(name: "strip", scope: !3, file: !3, line: 60, type: !168, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!168 = !DISubroutineType(types: !169)
!169 = !{null, !170}
!170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!171 = !DILocalVariable(name: "buf", arg: 1, scope: !167, file: !3, line: 60, type: !170)
!172 = !DILocation(line: 0, scope: !167)
!173 = !DILocation(line: 64, column: 9, scope: !167)
!174 = !DILocalVariable(name: "x", scope: !167, file: !3, line: 62, type: !170)
!175 = !DILocation(line: 65, column: 9, scope: !176)
!176 = distinct !DILexicalBlock(scope: !167, file: !3, line: 65, column: 9)
!177 = !DILocation(line: 65, column: 9, scope: !167)
!178 = !DILocation(line: 65, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !3, line: 65, column: 12)
!180 = !DILocation(line: 65, column: 23, scope: !179)
!181 = !DILocation(line: 66, column: 9, scope: !167)
!182 = !DILocation(line: 67, column: 9, scope: !183)
!183 = distinct !DILexicalBlock(scope: !167, file: !3, line: 67, column: 9)
!184 = !DILocation(line: 67, column: 9, scope: !167)
!185 = !DILocation(line: 67, column: 16, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !3, line: 67, column: 12)
!187 = !DILocation(line: 67, column: 23, scope: !186)
!188 = !DILocation(line: 68, column: 1, scope: !167)
!189 = distinct !DISubprogram(name: "RelayText", scope: !3, file: !3, line: 70, type: !190, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!190 = !DISubroutineType(types: !191)
!191 = !{!22, !22}
!192 = !DILocalVariable(name: "handle", arg: 1, scope: !189, file: !3, line: 70, type: !22)
!193 = !DILocation(line: 0, scope: !189)
!194 = !DILocalVariable(name: "ret", scope: !189, file: !3, line: 73, type: !22)
!195 = !DILocation(line: 74, column: 13, scope: !189)
!196 = !DILocation(line: 74, column: 34, scope: !189)
!197 = !DILocalVariable(name: "begin", scope: !189, file: !3, line: 72, type: !170)
!198 = !DILocation(line: 75, column: 9, scope: !199)
!199 = distinct !DILexicalBlock(scope: !189, file: !3, line: 75, column: 9)
!200 = !DILocation(line: 75, column: 30, scope: !199)
!201 = !DILocation(line: 75, column: 34, scope: !199)
!202 = !DILocation(line: 75, column: 9, scope: !189)
!203 = !DILocation(line: 77, column: 13, scope: !204)
!204 = distinct !DILexicalBlock(scope: !205, file: !3, line: 77, column: 13)
!205 = distinct !DILexicalBlock(scope: !199, file: !3, line: 76, column: 5)
!206 = !DILocation(line: 77, column: 25, scope: !204)
!207 = !DILocation(line: 77, column: 13, scope: !205)
!208 = !DILocation(line: 78, column: 13, scope: !204)
!209 = !DILocation(line: 78, column: 25, scope: !204)
!210 = !DILocation(line: 80, column: 13, scope: !211)
!211 = distinct !DILexicalBlock(scope: !204, file: !3, line: 79, column: 14)
!212 = !DILocation(line: 80, column: 25, scope: !211)
!213 = !DILocation(line: 81, column: 13, scope: !211)
!214 = !DILocation(line: 81, column: 25, scope: !211)
!215 = !DILocation(line: 83, column: 5, scope: !205)
!216 = !DILocation(line: 84, column: 15, scope: !217)
!217 = distinct !DILexicalBlock(scope: !199, file: !3, line: 83, column: 12)
!218 = !DILocation(line: 84, column: 36, scope: !217)
!219 = !DILocation(line: 84, column: 9, scope: !217)
!220 = !DILocation(line: 84, column: 41, scope: !217)
!221 = !DILocation(line: 87, column: 11, scope: !189)
!222 = !DILocalVariable(name: "end", scope: !189, file: !3, line: 72, type: !170)
!223 = !DILocation(line: 88, column: 5, scope: !189)
!224 = !DILocation(line: 88, column: 16, scope: !189)
!225 = !DILocalVariable(name: "output", scope: !226, file: !3, line: 90, type: !227)
!226 = distinct !DILexicalBlock(scope: !189, file: !3, line: 89, column: 5)
!227 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 64000, elements: !228)
!228 = !{!229}
!229 = !DISubrange(count: 8000)
!230 = !DILocation(line: 90, column: 14, scope: !226)
!231 = !DILocation(line: 91, column: 9, scope: !226)
!232 = !DILocation(line: 91, column: 19, scope: !226)
!233 = !DILocation(line: 92, column: 14, scope: !234)
!234 = distinct !DILexicalBlock(scope: !226, file: !3, line: 92, column: 13)
!235 = !DILocation(line: 92, column: 35, scope: !234)
!236 = !DILocation(line: 92, column: 13, scope: !226)
!237 = !DILocation(line: 94, column: 21, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !3, line: 93, column: 9)
!239 = !DILocation(line: 94, column: 42, scope: !238)
!240 = !DILocation(line: 94, column: 13, scope: !238)
!241 = !DILocation(line: 95, column: 13, scope: !238)
!242 = !DILocation(line: 95, column: 34, scope: !238)
!243 = !DILocation(line: 95, column: 43, scope: !238)
!244 = !DILocation(line: 97, column: 19, scope: !238)
!245 = !DILocation(line: 97, column: 40, scope: !238)
!246 = !DILocation(line: 97, column: 13, scope: !238)
!247 = !DILocation(line: 98, column: 21, scope: !238)
!248 = !DILocation(line: 98, column: 52, scope: !238)
!249 = !DILocation(line: 98, column: 73, scope: !238)
!250 = !DILocation(line: 98, column: 13, scope: !238)
!251 = !DILocation(line: 100, column: 9, scope: !238)
!252 = !DILocation(line: 102, column: 21, scope: !253)
!253 = distinct !DILexicalBlock(scope: !234, file: !3, line: 101, column: 9)
!254 = !DILocation(line: 102, column: 45, scope: !253)
!255 = !DILocation(line: 102, column: 66, scope: !253)
!256 = !DILocation(line: 103, column: 24, scope: !253)
!257 = !DILocation(line: 102, column: 13, scope: !253)
!258 = !DILocation(line: 107, column: 13, scope: !259)
!259 = distinct !DILexicalBlock(scope: !226, file: !3, line: 107, column: 13)
!260 = !DILocation(line: 107, column: 13, scope: !226)
!261 = !DILocalVariable(name: "j", scope: !262, file: !3, line: 109, type: !22)
!262 = distinct !DILexicalBlock(scope: !259, file: !3, line: 108, column: 9)
!263 = !DILocation(line: 0, scope: !262)
!264 = !DILocation(line: 110, column: 18, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !3, line: 110, column: 13)
!266 = !DILocation(line: 0, scope: !265)
!267 = !DILocation(line: 110, column: 27, scope: !268)
!268 = distinct !DILexicalBlock(scope: !265, file: !3, line: 110, column: 13)
!269 = !DILocation(line: 110, column: 13, scope: !265)
!270 = !DILocation(line: 112, column: 28, scope: !271)
!271 = distinct !DILexicalBlock(scope: !272, file: !3, line: 112, column: 21)
!272 = distinct !DILexicalBlock(scope: !268, file: !3, line: 111, column: 13)
!273 = !DILocation(line: 112, column: 33, scope: !271)
!274 = !DILocation(line: 112, column: 41, scope: !271)
!275 = !DILocation(line: 112, column: 38, scope: !271)
!276 = !DILocation(line: 112, column: 49, scope: !271)
!277 = !DILocation(line: 112, column: 52, scope: !271)
!278 = !DILocation(line: 112, column: 21, scope: !272)
!279 = !DILocation(line: 114, column: 34, scope: !280)
!280 = distinct !DILexicalBlock(scope: !281, file: !3, line: 114, column: 25)
!281 = distinct !DILexicalBlock(scope: !271, file: !3, line: 113, column: 17)
!282 = !DILocation(line: 114, column: 49, scope: !280)
!283 = !DILocation(line: 114, column: 42, scope: !280)
!284 = !DILocation(line: 114, column: 25, scope: !280)
!285 = !DILocation(line: 114, column: 58, scope: !280)
!286 = !DILocation(line: 114, column: 25, scope: !281)
!287 = !DILocation(line: 116, column: 25, scope: !288)
!288 = distinct !DILexicalBlock(scope: !280, file: !3, line: 115, column: 21)
!289 = !DILocation(line: 117, column: 21, scope: !288)
!290 = !DILocation(line: 118, column: 17, scope: !281)
!291 = !DILocation(line: 119, column: 13, scope: !272)
!292 = !DILocation(line: 110, column: 42, scope: !268)
!293 = !DILocation(line: 110, column: 13, scope: !268)
!294 = distinct !{!294, !269, !295}
!295 = !DILocation(line: 119, column: 13, scope: !265)
!296 = !DILocation(line: 120, column: 9, scope: !262)
!297 = !DILocation(line: 121, column: 20, scope: !226)
!298 = !DILocation(line: 122, column: 15, scope: !226)
!299 = distinct !{!299, !223, !300}
!300 = !DILocation(line: 123, column: 5, scope: !189)
!301 = !DILocation(line: 125, column: 12, scope: !189)
!302 = !DILocation(line: 125, column: 33, scope: !189)
!303 = !DILocation(line: 125, column: 5, scope: !189)
!304 = !DILocation(line: 126, column: 41, scope: !189)
!305 = !DILocation(line: 126, column: 62, scope: !189)
!306 = !DILocation(line: 126, column: 39, scope: !189)
!307 = !DILocation(line: 126, column: 5, scope: !189)
!308 = !DILocation(line: 126, column: 26, scope: !189)
!309 = !DILocation(line: 126, column: 30, scope: !189)
!310 = !DILocation(line: 127, column: 5, scope: !189)
!311 = distinct !DISubprogram(name: "ClientText", scope: !3, file: !3, line: 130, type: !312, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!312 = !DISubroutineType(types: !313)
!313 = !{null, !22, !170, !22}
!314 = !DILocalVariable(name: "handle", arg: 1, scope: !311, file: !3, line: 130, type: !22)
!315 = !DILocation(line: 0, scope: !311)
!316 = !DILocalVariable(name: "buf", arg: 2, scope: !311, file: !3, line: 130, type: !170)
!317 = !DILocalVariable(name: "buf_len", arg: 3, scope: !311, file: !3, line: 130, type: !22)
!318 = !DILocation(line: 133, column: 10, scope: !319)
!319 = distinct !DILexicalBlock(scope: !311, file: !3, line: 133, column: 9)
!320 = !DILocation(line: 133, column: 9, scope: !311)
!321 = !DILocation(line: 134, column: 9, scope: !319)
!322 = !DILocation(line: 135, column: 9, scope: !311)
!323 = !DILocation(line: 135, column: 30, scope: !311)
!324 = !DILocalVariable(name: "j", scope: !311, file: !3, line: 132, type: !22)
!325 = !DILocalVariable(name: "i", scope: !311, file: !3, line: 132, type: !22)
!326 = !DILocation(line: 137, column: 10, scope: !327)
!327 = distinct !DILexicalBlock(scope: !311, file: !3, line: 137, column: 5)
!328 = !DILocation(line: 0, scope: !327)
!329 = !DILocation(line: 137, column: 19, scope: !330)
!330 = distinct !DILexicalBlock(scope: !327, file: !3, line: 137, column: 5)
!331 = !DILocation(line: 137, column: 5, scope: !327)
!332 = !DILocation(line: 139, column: 42, scope: !333)
!333 = distinct !DILexicalBlock(scope: !330, file: !3, line: 138, column: 5)
!334 = !DILocation(line: 139, column: 9, scope: !333)
!335 = !DILocation(line: 139, column: 30, scope: !333)
!336 = !DILocation(line: 139, column: 40, scope: !333)
!337 = !DILocation(line: 141, column: 15, scope: !338)
!338 = distinct !DILexicalBlock(scope: !333, file: !3, line: 141, column: 13)
!339 = !DILocation(line: 141, column: 13, scope: !333)
!340 = !DILocation(line: 143, column: 13, scope: !341)
!341 = distinct !DILexicalBlock(scope: !338, file: !3, line: 142, column: 9)
!342 = !DILocation(line: 143, column: 20, scope: !341)
!343 = distinct !{!343, !340, !344}
!344 = !DILocation(line: 143, column: 38, scope: !341)
!345 = !DILocation(line: 144, column: 17, scope: !341)
!346 = !DILocation(line: 144, column: 38, scope: !341)
!347 = !DILocation(line: 145, column: 9, scope: !341)
!348 = !DILocation(line: 146, column: 5, scope: !333)
!349 = !DILocation(line: 137, column: 30, scope: !330)
!350 = !DILocation(line: 137, column: 35, scope: !330)
!351 = !DILocation(line: 137, column: 5, scope: !330)
!352 = distinct !{!352, !331, !353}
!353 = !DILocation(line: 146, column: 5, scope: !327)
!354 = !DILocation(line: 147, column: 5, scope: !311)
!355 = !DILocation(line: 147, column: 26, scope: !311)
!356 = !DILocation(line: 147, column: 30, scope: !311)
!357 = !DILocation(line: 149, column: 5, scope: !311)
!358 = !DILocation(line: 149, column: 12, scope: !311)
!359 = distinct !{!359, !357, !360}
!360 = !DILocation(line: 149, column: 30, scope: !311)
!361 = !DILocation(line: 150, column: 1, scope: !311)
!362 = distinct !DISubprogram(name: "ChatLoop", scope: !3, file: !3, line: 153, type: !363, scopeLine: 154, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!363 = !DISubroutineType(types: !364)
!364 = !{!22}
!365 = !DILocalVariable(name: "j", scope: !362, file: !3, line: 155, type: !22)
!366 = !DILocation(line: 155, column: 12, scope: !362)
!367 = !DILocation(line: 156, column: 5, scope: !362)
!368 = !DILocation(line: 156, column: 5, scope: !369)
!369 = distinct !DILexicalBlock(scope: !362, file: !3, line: 156, column: 5)
!370 = !{i32 -2147138770}
!371 = !DILocalVariable(name: "__d0", scope: !369, file: !3, line: 156, type: !22)
!372 = !DILocation(line: 0, scope: !369)
!373 = !DILocalVariable(name: "__d1", scope: !369, file: !3, line: 156, type: !22)
!374 = !DILocation(line: 158, column: 5, scope: !362)
!375 = !DILocation(line: 159, column: 5, scope: !362)
!376 = !DILocation(line: 161, column: 5, scope: !362)
!377 = !DILocation(line: 163, column: 19, scope: !378)
!378 = distinct !DILexicalBlock(scope: !362, file: !3, line: 162, column: 5)
!379 = !DILocation(line: 164, column: 13, scope: !380)
!380 = distinct !DILexicalBlock(scope: !378, file: !3, line: 164, column: 13)
!381 = !DILocation(line: 164, column: 59, scope: !380)
!382 = !DILocation(line: 164, column: 13, scope: !378)
!383 = !DILocation(line: 166, column: 13, scope: !384)
!384 = distinct !DILexicalBlock(scope: !380, file: !3, line: 165, column: 9)
!385 = !DILocation(line: 167, column: 13, scope: !384)
!386 = !DILocalVariable(name: "i", scope: !362, file: !3, line: 155, type: !22)
!387 = !DILocation(line: 0, scope: !362)
!388 = !DILocation(line: 169, column: 14, scope: !389)
!389 = distinct !DILexicalBlock(scope: !378, file: !3, line: 169, column: 9)
!390 = !DILocation(line: 0, scope: !389)
!391 = !DILocation(line: 169, column: 23, scope: !392)
!392 = distinct !DILexicalBlock(scope: !389, file: !3, line: 169, column: 9)
!393 = !DILocation(line: 169, column: 9, scope: !389)
!394 = !DILocation(line: 171, column: 17, scope: !395)
!395 = distinct !DILexicalBlock(scope: !396, file: !3, line: 171, column: 17)
!396 = distinct !DILexicalBlock(scope: !392, file: !3, line: 170, column: 9)
!397 = !DILocation(line: 171, column: 17, scope: !396)
!398 = !DILocation(line: 173, column: 26, scope: !399)
!399 = distinct !DILexicalBlock(scope: !400, file: !3, line: 173, column: 21)
!400 = distinct !DILexicalBlock(scope: !395, file: !3, line: 172, column: 13)
!401 = !DILocation(line: 173, column: 23, scope: !399)
!402 = !DILocation(line: 173, column: 21, scope: !400)
!403 = !DILocalVariable(name: "cliinfo", scope: !404, file: !3, line: 175, type: !35)
!404 = distinct !DILexicalBlock(scope: !399, file: !3, line: 174, column: 17)
!405 = !DILocation(line: 175, column: 40, scope: !404)
!406 = !DILocalVariable(name: "addrlen", scope: !404, file: !3, line: 176, type: !407)
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "socklen_t", file: !408, line: 33, baseType: !409)
!408 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "__socklen_t", file: !29, line: 209, baseType: !7)
!410 = !DILocation(line: 176, column: 31, scope: !404)
!411 = !DILocation(line: 178, column: 37, scope: !404)
!412 = !DILocation(line: 178, column: 46, scope: !404)
!413 = !DILocation(line: 178, column: 30, scope: !404)
!414 = !DILocalVariable(name: "handle", scope: !404, file: !3, line: 177, type: !22)
!415 = !DILocation(line: 0, scope: !404)
!416 = !DILocation(line: 179, column: 32, scope: !417)
!417 = distinct !DILexicalBlock(scope: !404, file: !3, line: 179, column: 25)
!418 = !DILocation(line: 179, column: 25, scope: !404)
!419 = !DILocation(line: 181, column: 25, scope: !420)
!420 = distinct !DILexicalBlock(scope: !417, file: !3, line: 180, column: 21)
!421 = !DILocation(line: 182, column: 21, scope: !420)
!422 = !DILocation(line: 182, column: 39, scope: !423)
!423 = distinct !DILexicalBlock(scope: !417, file: !3, line: 182, column: 32)
!424 = !DILocation(line: 182, column: 32, scope: !417)
!425 = !DILocation(line: 184, column: 25, scope: !426)
!426 = distinct !DILexicalBlock(scope: !423, file: !3, line: 183, column: 21)
!427 = !DILocation(line: 185, column: 25, scope: !426)
!428 = !DILocation(line: 186, column: 21, scope: !426)
!429 = !DILocation(line: 189, column: 29, scope: !430)
!430 = distinct !DILexicalBlock(scope: !431, file: !3, line: 189, column: 29)
!431 = distinct !DILexicalBlock(scope: !423, file: !3, line: 188, column: 21)
!432 = !DILocation(line: 189, column: 63, scope: !430)
!433 = !DILocation(line: 189, column: 29, scope: !431)
!434 = !DILocation(line: 193, column: 52, scope: !435)
!435 = distinct !DILexicalBlock(scope: !430, file: !3, line: 190, column: 25)
!436 = !DILocation(line: 193, column: 33, scope: !435)
!437 = !DILocation(line: 194, column: 47, scope: !435)
!438 = !DILocation(line: 194, column: 33, scope: !435)
!439 = !DILocation(line: 191, column: 29, scope: !435)
!440 = !DILocation(line: 195, column: 29, scope: !435)
!441 = !DILocation(line: 197, column: 29, scope: !435)
!442 = !DILocation(line: 198, column: 25, scope: !435)
!443 = !DILocation(line: 200, column: 17, scope: !404)
!444 = !DILocalVariable(name: "buf", scope: !445, file: !3, line: 203, type: !108)
!445 = distinct !DILexicalBlock(scope: !399, file: !3, line: 202, column: 17)
!446 = !DILocation(line: 203, column: 26, scope: !445)
!447 = !DILocation(line: 206, column: 33, scope: !445)
!448 = !DILocation(line: 206, column: 25, scope: !445)
!449 = !DILocalVariable(name: "b", scope: !445, file: !3, line: 204, type: !22)
!450 = !DILocation(line: 0, scope: !445)
!451 = !DILocation(line: 207, column: 27, scope: !452)
!452 = distinct !DILexicalBlock(scope: !445, file: !3, line: 207, column: 25)
!453 = !DILocation(line: 207, column: 25, scope: !445)
!454 = !DILocation(line: 209, column: 25, scope: !455)
!455 = distinct !DILexicalBlock(scope: !452, file: !3, line: 208, column: 21)
!456 = !DILocation(line: 210, column: 21, scope: !455)
!457 = !DILocation(line: 213, column: 39, scope: !458)
!458 = distinct !DILexicalBlock(scope: !452, file: !3, line: 212, column: 21)
!459 = !DILocation(line: 213, column: 25, scope: !458)
!460 = !DILocation(line: 216, column: 13, scope: !400)
!461 = !DILocation(line: 217, column: 9, scope: !396)
!462 = !DILocation(line: 169, column: 37, scope: !392)
!463 = !DILocation(line: 169, column: 9, scope: !392)
!464 = distinct !{!464, !393, !465}
!465 = !DILocation(line: 217, column: 9, scope: !389)
!466 = distinct !{!466, !376, !467}
!467 = !DILocation(line: 218, column: 5, scope: !362)
!468 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 221, type: !469, scopeLine: 222, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !88)
!469 = !DISubroutineType(types: !470)
!470 = !{!22, !22, !471}
!471 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64)
!472 = !DILocalVariable(name: "argc", arg: 1, scope: !468, file: !3, line: 221, type: !22)
!473 = !DILocation(line: 0, scope: !468)
!474 = !DILocalVariable(name: "argv", arg: 2, scope: !468, file: !3, line: 221, type: !471)
!475 = !DILocation(line: 223, column: 15, scope: !468)
!476 = !DILocation(line: 223, column: 13, scope: !468)
!477 = !DILocation(line: 225, column: 26, scope: !468)
!478 = !DILocation(line: 226, column: 26, scope: !468)
!479 = !DILocation(line: 226, column: 24, scope: !468)
!480 = !DILocation(line: 227, column: 14, scope: !481)
!481 = distinct !DILexicalBlock(scope: !468, file: !3, line: 227, column: 9)
!482 = !DILocation(line: 227, column: 9, scope: !468)
!483 = !DILocation(line: 229, column: 41, scope: !484)
!484 = distinct !DILexicalBlock(scope: !481, file: !3, line: 228, column: 5)
!485 = !DILocation(line: 229, column: 36, scope: !484)
!486 = !DILocation(line: 229, column: 30, scope: !484)
!487 = !DILocation(line: 229, column: 28, scope: !484)
!488 = !DILocation(line: 230, column: 5, scope: !484)
!489 = !DILocation(line: 231, column: 33, scope: !468)
!490 = !DILocation(line: 231, column: 31, scope: !468)
!491 = !DILocation(line: 232, column: 40, scope: !468)
!492 = !DILocation(line: 232, column: 65, scope: !468)
!493 = !DILocation(line: 232, column: 49, scope: !468)
!494 = !DILocation(line: 232, column: 5, scope: !468)
!495 = !DILocation(line: 234, column: 14, scope: !496)
!496 = distinct !DILexicalBlock(scope: !468, file: !3, line: 234, column: 9)
!497 = !DILocation(line: 234, column: 9, scope: !496)
!498 = !DILocation(line: 234, column: 54, scope: !496)
!499 = !DILocation(line: 234, column: 9, scope: !468)
!500 = !DILocation(line: 236, column: 9, scope: !501)
!501 = distinct !DILexicalBlock(scope: !496, file: !3, line: 235, column: 5)
!502 = !DILocation(line: 237, column: 9, scope: !501)
!503 = !DILocation(line: 240, column: 16, scope: !504)
!504 = distinct !DILexicalBlock(scope: !468, file: !3, line: 240, column: 9)
!505 = !DILocation(line: 240, column: 9, scope: !504)
!506 = !DILocation(line: 240, column: 29, scope: !504)
!507 = !DILocation(line: 240, column: 9, scope: !468)
!508 = !DILocation(line: 242, column: 9, scope: !509)
!509 = distinct !DILexicalBlock(scope: !504, file: !3, line: 241, column: 5)
!510 = !DILocation(line: 243, column: 5, scope: !509)
!511 = !DILocation(line: 245, column: 5, scope: !468)
!512 = !DILocation(line: 247, column: 5, scope: !468)
!513 = !DILocation(line: 248, column: 1, scope: !468)
