; ModuleID = 'best-shuffle-1.ll'
source_filename = "best-shuffle-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"len == strlen(result)\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"best-shuffle-1.c\00", align 1
@__PRETTY_FUNCTION__.best_shuffle = private unnamed_addr constant [40 x i8] c"void best_shuffle(const char *, char *)\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"fmax > 0 && fmax <= len\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"grp > 0 && grp <= len\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"lng > 0 && lng <= len\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"len == strlen(txt2)\00", align 1
@__PRETTY_FUNCTION__.display = private unnamed_addr constant [41 x i8] c"void display(const char *, const char *)\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"%s, %s, (%u)\0A\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"abracadabra\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"seesaw\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"elk\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"grrrrrr\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"up\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.13 = private unnamed_addr constant [9 x i8] c"aabbbbaa\00", align 1
@.str.14 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"xxxxx\00", align 1
@__const.main.data = private unnamed_addr constant [9 x i8*] [i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0)], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @best_shuffle(i8* %txt, i8* %result) #0 !dbg !10 {
entry:
  %counts = alloca [255 x i64], align 16
  call void @llvm.dbg.value(metadata i8* %txt, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i8* %result, metadata !19, metadata !DIExpression()), !dbg !18
  %call = call i64 @strlen(i8* %txt) #8, !dbg !20
  call void @llvm.dbg.value(metadata i64 %call, metadata !21, metadata !DIExpression()), !dbg !18
  %cmp = icmp eq i64 %call, 0, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  br label %return, !dbg !29

if.end:                                           ; preds = %entry
  %call1 = call i64 @strlen(i8* %result) #8, !dbg !30
  %cmp2 = icmp eq i64 %call, %call1, !dbg !30
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !33

if.then3:                                         ; preds = %if.end
  br label %if.end4, !dbg !33

if.else:                                          ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 16, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__PRETTY_FUNCTION__.best_shuffle, i64 0, i64 0)) #9, !dbg !30
  unreachable, !dbg !30

if.end4:                                          ; preds = %if.then3
  call void @llvm.dbg.declare(metadata [255 x i64]* %counts, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [255 x i64], [255 x i64]* %counts, i64 0, i64 0, !dbg !39
  %0 = bitcast i64* %arraydecay to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 1020, i1 false), !dbg !39
  call void @llvm.dbg.value(metadata i64 0, metadata !40, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i64 0, metadata !41, metadata !DIExpression()), !dbg !43
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.end4
  %i.0 = phi i64 [ 0, %if.end4 ], [ %inc13, %for.inc ], !dbg !43
  %fmax.0 = phi i64 [ 0, %if.end4 ], [ %fmax.1, %for.inc ], !dbg !18
  call void @llvm.dbg.value(metadata i64 %fmax.0, metadata !40, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !41, metadata !DIExpression()), !dbg !43
  %cmp5 = icmp ult i64 %i.0, %call, !dbg !45
  br i1 %cmp5, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i8, i8* %txt, i64 %i.0, !dbg !48
  %1 = load i8, i8* %arrayidx, align 1, !dbg !48
  %idxprom = zext i8 %1 to i64, !dbg !50
  %arrayidx6 = getelementptr inbounds [255 x i64], [255 x i64]* %counts, i64 0, i64 %idxprom, !dbg !50
  %2 = load i64, i64* %arrayidx6, align 8, !dbg !51
  %inc = add i64 %2, 1, !dbg !51
  store i64 %inc, i64* %arrayidx6, align 8, !dbg !51
  %arrayidx7 = getelementptr inbounds i8, i8* %txt, i64 %i.0, !dbg !52
  %3 = load i8, i8* %arrayidx7, align 1, !dbg !52
  %idxprom8 = zext i8 %3 to i64, !dbg !53
  %arrayidx9 = getelementptr inbounds [255 x i64], [255 x i64]* %counts, i64 0, i64 %idxprom8, !dbg !53
  %4 = load i64, i64* %arrayidx9, align 8, !dbg !53
  call void @llvm.dbg.value(metadata i64 %4, metadata !54, metadata !DIExpression()), !dbg !55
  %cmp10 = icmp ult i64 %fmax.0, %4, !dbg !56
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !58

if.then11:                                        ; preds = %for.body
  call void @llvm.dbg.value(metadata i64 %4, metadata !40, metadata !DIExpression()), !dbg !18
  br label %if.end12, !dbg !59

if.end12:                                         ; preds = %if.then11, %for.body
  %fmax.1 = phi i64 [ %4, %if.then11 ], [ %fmax.0, %for.body ], !dbg !18
  call void @llvm.dbg.value(metadata i64 %fmax.1, metadata !40, metadata !DIExpression()), !dbg !18
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %if.end12
  %inc13 = add i64 %i.0, 1, !dbg !61
  call void @llvm.dbg.value(metadata i64 %inc13, metadata !41, metadata !DIExpression()), !dbg !43
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %cmp14 = icmp ugt i64 %fmax.0, 0, !dbg !65
  br i1 %cmp14, label %land.lhs.true, label %if.else17, !dbg !65

land.lhs.true:                                    ; preds = %for.end
  %cmp15 = icmp ule i64 %fmax.0, %call, !dbg !65
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !68

if.then16:                                        ; preds = %land.lhs.true
  br label %if.end18, !dbg !68

if.else17:                                        ; preds = %land.lhs.true, %for.end
  call void @__assert_fail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 29, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__PRETTY_FUNCTION__.best_shuffle, i64 0, i64 0)) #9, !dbg !65
  unreachable, !dbg !65

if.end18:                                         ; preds = %if.then16
  %mul = mul i64 %call, 8, !dbg !69
  %call19 = call noalias i8* @malloc(i64 %mul) #7, !dbg !70
  %5 = bitcast i8* %call19 to i64*, !dbg !70
  call void @llvm.dbg.value(metadata i64* %5, metadata !71, metadata !DIExpression()), !dbg !18
  %cmp20 = icmp eq i64* %5, null, !dbg !73
  br i1 %cmp20, label %if.then21, label %if.end22, !dbg !75

if.then21:                                        ; preds = %if.end18
  call void @exit(i32 1) #9, !dbg !76
  unreachable, !dbg !76

if.end22:                                         ; preds = %if.end18
  call void @llvm.dbg.value(metadata i64 0, metadata !77, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i64 0, metadata !80, metadata !DIExpression()), !dbg !79
  br label %for.cond24, !dbg !81

for.cond24:                                       ; preds = %for.inc43, %if.end22
  %i23.0 = phi i64 [ 0, %if.end22 ], [ %i23.3, %for.inc43 ], !dbg !82
  %ch.0 = phi i64 [ 0, %if.end22 ], [ %inc44, %for.inc43 ], !dbg !79
  call void @llvm.dbg.value(metadata i64 %ch.0, metadata !77, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i64 %i23.0, metadata !80, metadata !DIExpression()), !dbg !79
  %cmp25 = icmp ult i64 %ch.0, 255, !dbg !83
  br i1 %cmp25, label %for.body26, label %for.end45, !dbg !85

for.body26:                                       ; preds = %for.cond24
  %arrayidx27 = getelementptr inbounds [255 x i64], [255 x i64]* %counts, i64 0, i64 %ch.0, !dbg !86
  %6 = load i64, i64* %arrayidx27, align 8, !dbg !86
  %tobool = icmp ne i64 %6, 0, !dbg !86
  br i1 %tobool, label %if.then28, label %if.end42, !dbg !88

if.then28:                                        ; preds = %for.body26
  call void @llvm.dbg.value(metadata i64 0, metadata !89, metadata !DIExpression()), !dbg !91
  br label %for.cond29, !dbg !92

for.cond29:                                       ; preds = %for.inc39, %if.then28
  %j.0 = phi i64 [ 0, %if.then28 ], [ %inc40, %for.inc39 ], !dbg !91
  %i23.1 = phi i64 [ %i23.0, %if.then28 ], [ %i23.2, %for.inc39 ], !dbg !79
  call void @llvm.dbg.value(metadata i64 %i23.1, metadata !80, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i64 %j.0, metadata !89, metadata !DIExpression()), !dbg !91
  %cmp30 = icmp ult i64 %j.0, %call, !dbg !93
  br i1 %cmp30, label %for.body31, label %for.end41, !dbg !95

for.body31:                                       ; preds = %for.cond29
  %arrayidx32 = getelementptr inbounds i8, i8* %txt, i64 %j.0, !dbg !96
  %7 = load i8, i8* %arrayidx32, align 1, !dbg !96
  %conv = zext i8 %7 to i64, !dbg !98
  %cmp33 = icmp eq i64 %ch.0, %conv, !dbg !99
  br i1 %cmp33, label %if.then35, label %if.end38, !dbg !100

if.then35:                                        ; preds = %for.body31
  %arrayidx36 = getelementptr inbounds i64, i64* %5, i64 %i23.1, !dbg !101
  store i64 %j.0, i64* %arrayidx36, align 8, !dbg !103
  %inc37 = add i64 %i23.1, 1, !dbg !104
  call void @llvm.dbg.value(metadata i64 %inc37, metadata !80, metadata !DIExpression()), !dbg !79
  br label %if.end38, !dbg !105

if.end38:                                         ; preds = %if.then35, %for.body31
  %i23.2 = phi i64 [ %inc37, %if.then35 ], [ %i23.1, %for.body31 ], !dbg !79
  call void @llvm.dbg.value(metadata i64 %i23.2, metadata !80, metadata !DIExpression()), !dbg !79
  br label %for.inc39, !dbg !106

for.inc39:                                        ; preds = %if.end38
  %inc40 = add i64 %j.0, 1, !dbg !107
  call void @llvm.dbg.value(metadata i64 %inc40, metadata !89, metadata !DIExpression()), !dbg !91
  br label %for.cond29, !dbg !108, !llvm.loop !109

for.end41:                                        ; preds = %for.cond29
  br label %if.end42, !dbg !110

if.end42:                                         ; preds = %for.end41, %for.body26
  %i23.3 = phi i64 [ %i23.1, %for.end41 ], [ %i23.0, %for.body26 ], !dbg !82
  call void @llvm.dbg.value(metadata i64 %i23.3, metadata !80, metadata !DIExpression()), !dbg !79
  br label %for.inc43, !dbg !111

for.inc43:                                        ; preds = %if.end42
  %inc44 = add i64 %ch.0, 1, !dbg !112
  call void @llvm.dbg.value(metadata i64 %inc44, metadata !77, metadata !DIExpression()), !dbg !79
  br label %for.cond24, !dbg !113, !llvm.loop !114

for.end45:                                        ; preds = %for.cond24
  %mul46 = mul i64 %call, 8, !dbg !116
  %call47 = call noalias i8* @malloc(i64 %mul46) #7, !dbg !117
  %8 = bitcast i8* %call47 to i64*, !dbg !117
  call void @llvm.dbg.value(metadata i64* %8, metadata !118, metadata !DIExpression()), !dbg !18
  %cmp48 = icmp eq i64* %8, null, !dbg !119
  br i1 %cmp48, label %if.then50, label %if.end51, !dbg !121

if.then50:                                        ; preds = %for.end45
  call void @exit(i32 1) #9, !dbg !122
  unreachable, !dbg !122

if.end51:                                         ; preds = %for.end45
  call void @llvm.dbg.value(metadata i64 0, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i64 0, metadata !126, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i64 0, metadata !127, metadata !DIExpression()), !dbg !125
  br label %for.cond53, !dbg !128

for.cond53:                                       ; preds = %for.inc64, %if.end51
  %i52.0 = phi i64 [ 0, %if.end51 ], [ %inc65, %for.inc64 ], !dbg !125
  %n.0 = phi i64 [ 0, %if.end51 ], [ %n.1, %for.inc64 ], !dbg !125
  %m.0 = phi i64 [ 0, %if.end51 ], [ %m.1, %for.inc64 ], !dbg !125
  call void @llvm.dbg.value(metadata i64 %m.0, metadata !127, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i64 %n.0, metadata !126, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i64 %i52.0, metadata !123, metadata !DIExpression()), !dbg !125
  %cmp54 = icmp ult i64 %i52.0, %call, !dbg !129
  br i1 %cmp54, label %for.body56, label %for.end66, !dbg !131

for.body56:                                       ; preds = %for.cond53
  %arrayidx57 = getelementptr inbounds i64, i64* %5, i64 %n.0, !dbg !132
  %9 = load i64, i64* %arrayidx57, align 8, !dbg !132
  %arrayidx58 = getelementptr inbounds i64, i64* %8, i64 %i52.0, !dbg !134
  store i64 %9, i64* %arrayidx58, align 8, !dbg !135
  %add = add i64 %n.0, %fmax.0, !dbg !136
  call void @llvm.dbg.value(metadata i64 %add, metadata !126, metadata !DIExpression()), !dbg !125
  %cmp59 = icmp uge i64 %add, %call, !dbg !137
  br i1 %cmp59, label %if.then61, label %if.end63, !dbg !139

if.then61:                                        ; preds = %for.body56
  %inc62 = add i64 %m.0, 1, !dbg !140
  call void @llvm.dbg.value(metadata i64 %inc62, metadata !127, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i64 %inc62, metadata !126, metadata !DIExpression()), !dbg !125
  br label %if.end63, !dbg !142

if.end63:                                         ; preds = %if.then61, %for.body56
  %n.1 = phi i64 [ %inc62, %if.then61 ], [ %add, %for.body56 ], !dbg !143
  %m.1 = phi i64 [ %inc62, %if.then61 ], [ %m.0, %for.body56 ], !dbg !125
  call void @llvm.dbg.value(metadata i64 %m.1, metadata !127, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i64 %n.1, metadata !126, metadata !DIExpression()), !dbg !125
  br label %for.inc64, !dbg !144

for.inc64:                                        ; preds = %if.end63
  %inc65 = add i64 %i52.0, 1, !dbg !145
  call void @llvm.dbg.value(metadata i64 %inc65, metadata !123, metadata !DIExpression()), !dbg !125
  br label %for.cond53, !dbg !146, !llvm.loop !147

for.end66:                                        ; preds = %for.cond53
  %sub = sub i64 %call, 1, !dbg !149
  %div = udiv i64 %sub, %fmax.0, !dbg !150
  %add67 = add i64 1, %div, !dbg !151
  call void @llvm.dbg.value(metadata i64 %add67, metadata !152, metadata !DIExpression()), !dbg !18
  %cmp68 = icmp ugt i64 %add67, 0, !dbg !153
  br i1 %cmp68, label %land.lhs.true70, label %if.else74, !dbg !153

land.lhs.true70:                                  ; preds = %for.end66
  %cmp71 = icmp ule i64 %add67, %call, !dbg !153
  br i1 %cmp71, label %if.then73, label %if.else74, !dbg !156

if.then73:                                        ; preds = %land.lhs.true70
  br label %if.end75, !dbg !156

if.else74:                                        ; preds = %land.lhs.true70, %for.end66
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 58, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__PRETTY_FUNCTION__.best_shuffle, i64 0, i64 0)) #9, !dbg !153
  unreachable, !dbg !153

if.end75:                                         ; preds = %if.then73
  %sub76 = sub i64 %call, 1, !dbg !157
  %rem = urem i64 %sub76, %fmax.0, !dbg !158
  %add77 = add i64 1, %rem, !dbg !159
  call void @llvm.dbg.value(metadata i64 %add77, metadata !160, metadata !DIExpression()), !dbg !18
  %cmp78 = icmp ugt i64 %add77, 0, !dbg !161
  br i1 %cmp78, label %land.lhs.true80, label %if.else84, !dbg !161

land.lhs.true80:                                  ; preds = %if.end75
  %cmp81 = icmp ule i64 %add77, %call, !dbg !161
  br i1 %cmp81, label %if.then83, label %if.else84, !dbg !164

if.then83:                                        ; preds = %land.lhs.true80
  br label %if.end85, !dbg !164

if.else84:                                        ; preds = %land.lhs.true80, %if.end75
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 62, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__PRETTY_FUNCTION__.best_shuffle, i64 0, i64 0)) #9, !dbg !161
  unreachable, !dbg !161

if.end85:                                         ; preds = %if.then83
  call void @llvm.dbg.value(metadata i64 0, metadata !165, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.value(metadata i64 0, metadata !168, metadata !DIExpression()), !dbg !167
  br label %for.cond88, !dbg !169

for.cond88:                                       ; preds = %for.inc113, %if.end85
  %i86.0 = phi i64 [ 0, %if.end85 ], [ %inc114, %for.inc113 ], !dbg !167
  %j87.0 = phi i64 [ 0, %if.end85 ], [ %add112, %for.inc113 ], !dbg !167
  call void @llvm.dbg.value(metadata i64 %j87.0, metadata !168, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.value(metadata i64 %i86.0, metadata !165, metadata !DIExpression()), !dbg !167
  %cmp89 = icmp ult i64 %i86.0, %fmax.0, !dbg !170
  br i1 %cmp89, label %for.body91, label %for.end115, !dbg !172

for.body91:                                       ; preds = %for.cond88
  %arrayidx92 = getelementptr inbounds i64, i64* %8, i64 %j87.0, !dbg !173
  %10 = load i64, i64* %arrayidx92, align 8, !dbg !173
  call void @llvm.dbg.value(metadata i64 %10, metadata !175, metadata !DIExpression()), !dbg !176
  %cmp93 = icmp ult i64 %i86.0, %add77, !dbg !177
  %11 = zext i1 %cmp93 to i64, !dbg !178
  %cond = select i1 %cmp93, i32 0, i32 1, !dbg !178
  %conv95 = sext i32 %cond to i64, !dbg !179
  %sub96 = sub i64 %add67, %conv95, !dbg !180
  call void @llvm.dbg.value(metadata i64 %sub96, metadata !181, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.value(metadata i64 1, metadata !182, metadata !DIExpression()), !dbg !184
  br label %for.cond97, !dbg !185

for.cond97:                                       ; preds = %for.inc106, %for.body91
  %k.0 = phi i64 [ 1, %for.body91 ], [ %inc107, %for.inc106 ], !dbg !184
  call void @llvm.dbg.value(metadata i64 %k.0, metadata !182, metadata !DIExpression()), !dbg !184
  %cmp98 = icmp ult i64 %k.0, %sub96, !dbg !186
  br i1 %cmp98, label %for.body100, label %for.end108, !dbg !188

for.body100:                                      ; preds = %for.cond97
  %add101 = add i64 %j87.0, %k.0, !dbg !189
  %arrayidx102 = getelementptr inbounds i64, i64* %8, i64 %add101, !dbg !190
  %12 = load i64, i64* %arrayidx102, align 8, !dbg !190
  %add103 = add i64 %j87.0, %k.0, !dbg !191
  %sub104 = sub i64 %add103, 1, !dbg !192
  %arrayidx105 = getelementptr inbounds i64, i64* %5, i64 %sub104, !dbg !193
  store i64 %12, i64* %arrayidx105, align 8, !dbg !194
  br label %for.inc106, !dbg !193

for.inc106:                                       ; preds = %for.body100
  %inc107 = add i64 %k.0, 1, !dbg !195
  call void @llvm.dbg.value(metadata i64 %inc107, metadata !182, metadata !DIExpression()), !dbg !184
  br label %for.cond97, !dbg !196, !llvm.loop !197

for.end108:                                       ; preds = %for.cond97
  %add109 = add i64 %j87.0, %sub96, !dbg !199
  %sub110 = sub i64 %add109, 1, !dbg !200
  %arrayidx111 = getelementptr inbounds i64, i64* %5, i64 %sub110, !dbg !201
  store i64 %10, i64* %arrayidx111, align 8, !dbg !202
  %add112 = add i64 %j87.0, %sub96, !dbg !203
  call void @llvm.dbg.value(metadata i64 %add112, metadata !168, metadata !DIExpression()), !dbg !167
  br label %for.inc113, !dbg !204

for.inc113:                                       ; preds = %for.end108
  %inc114 = add i64 %i86.0, 1, !dbg !205
  call void @llvm.dbg.value(metadata i64 %inc114, metadata !165, metadata !DIExpression()), !dbg !167
  br label %for.cond88, !dbg !206, !llvm.loop !207

for.end115:                                       ; preds = %for.cond88
  %arrayidx116 = getelementptr inbounds i8, i8* %result, i64 %call, !dbg !209
  store i8 0, i8* %arrayidx116, align 1, !dbg !210
  call void @llvm.dbg.value(metadata i64 0, metadata !211, metadata !DIExpression()), !dbg !213
  br label %for.cond118, !dbg !214

for.cond118:                                      ; preds = %for.inc126, %for.end115
  %i117.0 = phi i64 [ 0, %for.end115 ], [ %inc127, %for.inc126 ], !dbg !213
  call void @llvm.dbg.value(metadata i64 %i117.0, metadata !211, metadata !DIExpression()), !dbg !213
  %cmp119 = icmp ult i64 %i117.0, %call, !dbg !215
  br i1 %cmp119, label %for.body121, label %for.end128, !dbg !217

for.body121:                                      ; preds = %for.cond118
  %arrayidx122 = getelementptr inbounds i64, i64* %5, i64 %i117.0, !dbg !218
  %13 = load i64, i64* %arrayidx122, align 8, !dbg !218
  %arrayidx123 = getelementptr inbounds i8, i8* %txt, i64 %13, !dbg !219
  %14 = load i8, i8* %arrayidx123, align 1, !dbg !219
  %arrayidx124 = getelementptr inbounds i64, i64* %8, i64 %i117.0, !dbg !220
  %15 = load i64, i64* %arrayidx124, align 8, !dbg !220
  %arrayidx125 = getelementptr inbounds i8, i8* %result, i64 %15, !dbg !221
  store i8 %14, i8* %arrayidx125, align 1, !dbg !222
  br label %for.inc126, !dbg !221

for.inc126:                                       ; preds = %for.body121
  %inc127 = add i64 %i117.0, 1, !dbg !223
  call void @llvm.dbg.value(metadata i64 %inc127, metadata !211, metadata !DIExpression()), !dbg !213
  br label %for.cond118, !dbg !224, !llvm.loop !225

for.end128:                                       ; preds = %for.cond118
  %16 = bitcast i64* %5 to i8*, !dbg !227
  call void @free(i8* %16) #7, !dbg !228
  %17 = bitcast i64* %8 to i8*, !dbg !229
  call void @free(i8* %17) #7, !dbg !230
  br label %return, !dbg !231

return:                                           ; preds = %for.end128, %if.then
  ret void, !dbg !231
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @display(i8* %txt1, i8* %txt2) #0 !dbg !232 {
entry:
  call void @llvm.dbg.value(metadata i8* %txt1, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.value(metadata i8* %txt2, metadata !237, metadata !DIExpression()), !dbg !236
  %call = call i64 @strlen(i8* %txt1) #8, !dbg !238
  call void @llvm.dbg.value(metadata i64 %call, metadata !239, metadata !DIExpression()), !dbg !236
  %call1 = call i64 @strlen(i8* %txt2) #8, !dbg !240
  %cmp = icmp eq i64 %call, %call1, !dbg !240
  br i1 %cmp, label %if.then, label %if.else, !dbg !243

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !243

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 85, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.display, i64 0, i64 0)) #9, !dbg !240
  unreachable, !dbg !240

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.value(metadata i32 0, metadata !244, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.value(metadata i64 0, metadata !246, metadata !DIExpression()), !dbg !248
  br label %for.cond, !dbg !249

for.cond:                                         ; preds = %for.inc, %if.end
  %score.0 = phi i32 [ 0, %if.end ], [ %score.1, %for.inc ], !dbg !236
  %i.0 = phi i64 [ 0, %if.end ], [ %inc9, %for.inc ], !dbg !248
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !246, metadata !DIExpression()), !dbg !248
  call void @llvm.dbg.value(metadata i32 %score.0, metadata !244, metadata !DIExpression()), !dbg !236
  %cmp2 = icmp ult i64 %i.0, %call, !dbg !250
  br i1 %cmp2, label %for.body, label %for.end, !dbg !252

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i8, i8* %txt1, i64 %i.0, !dbg !253
  %0 = load i8, i8* %arrayidx, align 1, !dbg !253
  %conv = sext i8 %0 to i32, !dbg !253
  %arrayidx3 = getelementptr inbounds i8, i8* %txt2, i64 %i.0, !dbg !255
  %1 = load i8, i8* %arrayidx3, align 1, !dbg !255
  %conv4 = sext i8 %1 to i32, !dbg !255
  %cmp5 = icmp eq i32 %conv, %conv4, !dbg !256
  br i1 %cmp5, label %if.then7, label %if.end8, !dbg !257

if.then7:                                         ; preds = %for.body
  %inc = add nsw i32 %score.0, 1, !dbg !258
  call void @llvm.dbg.value(metadata i32 %inc, metadata !244, metadata !DIExpression()), !dbg !236
  br label %if.end8, !dbg !259

if.end8:                                          ; preds = %if.then7, %for.body
  %score.1 = phi i32 [ %inc, %if.then7 ], [ %score.0, %for.body ], !dbg !236
  call void @llvm.dbg.value(metadata i32 %score.1, metadata !244, metadata !DIExpression()), !dbg !236
  br label %for.inc, !dbg !260

for.inc:                                          ; preds = %if.end8
  %inc9 = add i64 %i.0, 1, !dbg !261
  call void @llvm.dbg.value(metadata i64 %inc9, metadata !246, metadata !DIExpression()), !dbg !248
  br label %for.cond, !dbg !262, !llvm.loop !263

for.end:                                          ; preds = %for.cond
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i8* %txt1, i8* %txt2, i32 %score.0), !dbg !265
  ret void, !dbg !266
}

declare dso_local i32 @printf(i8*, ...) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !267 {
entry:
  %data = alloca [9 x i8*], align 16
  call void @llvm.dbg.declare(metadata [9 x i8*]* %data, metadata !270, metadata !DIExpression()), !dbg !274
  %0 = bitcast [9 x i8*]* %data to i8*, !dbg !274
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([9 x i8*]* @__const.main.data to i8*), i64 72, i1 false), !dbg !274
  call void @llvm.dbg.value(metadata i64 9, metadata !275, metadata !DIExpression()), !dbg !276
  call void @llvm.dbg.value(metadata i64 0, metadata !277, metadata !DIExpression()), !dbg !279
  br label %for.cond, !dbg !280

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %inc, %for.inc ], !dbg !279
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !277, metadata !DIExpression()), !dbg !279
  %cmp = icmp ult i64 %i.0, 9, !dbg !281
  br i1 %cmp, label %for.body, label %for.end, !dbg !283

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [9 x i8*], [9 x i8*]* %data, i64 0, i64 %i.0, !dbg !284
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !284
  %call = call i64 @strlen(i8* %1) #8, !dbg !286
  %add = add i64 %call, 1, !dbg !287
  call void @llvm.dbg.value(metadata i64 %add, metadata !288, metadata !DIExpression()), !dbg !289
  %2 = call i8* @llvm.stacksave(), !dbg !290
  %vla = alloca i8, i64 %add, align 16, !dbg !290
  call void @llvm.dbg.value(metadata i64 %add, metadata !291, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata i8* %vla, metadata !292, metadata !DIExpression()), !dbg !296
  call void @llvm.memset.p0i8.i64(i8* align 16 %vla, i8 -1, i64 %add, i1 false), !dbg !297
  %sub = sub i64 %add, 1, !dbg !298
  %arrayidx1 = getelementptr inbounds i8, i8* %vla, i64 %sub, !dbg !299
  store i8 0, i8* %arrayidx1, align 1, !dbg !300
  %arrayidx2 = getelementptr inbounds [9 x i8*], [9 x i8*]* %data, i64 0, i64 %i.0, !dbg !301
  %3 = load i8*, i8** %arrayidx2, align 8, !dbg !301
  call void @best_shuffle(i8* %3, i8* %vla), !dbg !302
  %arrayidx3 = getelementptr inbounds [9 x i8*], [9 x i8*]* %data, i64 0, i64 %i.0, !dbg !303
  %4 = load i8*, i8** %arrayidx3, align 8, !dbg !303
  call void @display(i8* %4, i8* %vla), !dbg !304
  call void @llvm.stackrestore(i8* %2), !dbg !305
  br label %for.inc, !dbg !306

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1, !dbg !307
  call void @llvm.dbg.value(metadata i64 %inc, metadata !277, metadata !DIExpression()), !dbg !279
  br label %for.cond, !dbg !308, !llvm.loop !309

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !311
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #7

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #7

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "best-shuffle-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Best-shuffle")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = distinct !DISubprogram(name: "best_shuffle", scope: !1, file: !1, line: 9, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !16}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!17 = !DILocalVariable(name: "txt", arg: 1, scope: !10, file: !1, line: 9, type: !13)
!18 = !DILocation(line: 0, scope: !10)
!19 = !DILocalVariable(name: "result", arg: 2, scope: !10, file: !1, line: 9, type: !16)
!20 = !DILocation(line: 10, column: 24, scope: !10)
!21 = !DILocalVariable(name: "len", scope: !10, file: !1, line: 10, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !24, line: 46, baseType: !25)
!24 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!25 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!26 = !DILocation(line: 11, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !10, file: !1, line: 11, column: 9)
!28 = !DILocation(line: 11, column: 9, scope: !10)
!29 = !DILocation(line: 12, column: 9, scope: !27)
!30 = !DILocation(line: 16, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 16, column: 5)
!32 = distinct !DILexicalBlock(scope: !10, file: !1, line: 16, column: 5)
!33 = !DILocation(line: 16, column: 5, scope: !32)
!34 = !DILocalVariable(name: "counts", scope: !10, file: !1, line: 20, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 16320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 255)
!38 = !DILocation(line: 20, column: 12, scope: !10)
!39 = !DILocation(line: 21, column: 5, scope: !10)
!40 = !DILocalVariable(name: "fmax", scope: !10, file: !1, line: 22, type: !23)
!41 = !DILocalVariable(name: "i", scope: !42, file: !1, line: 23, type: !23)
!42 = distinct !DILexicalBlock(scope: !10, file: !1, line: 23, column: 5)
!43 = !DILocation(line: 0, scope: !42)
!44 = !DILocation(line: 23, column: 10, scope: !42)
!45 = !DILocation(line: 23, column: 26, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 23, column: 5)
!47 = !DILocation(line: 23, column: 5, scope: !42)
!48 = !DILocation(line: 24, column: 31, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !1, line: 23, column: 38)
!50 = !DILocation(line: 24, column: 9, scope: !49)
!51 = !DILocation(line: 24, column: 38, scope: !49)
!52 = !DILocation(line: 25, column: 51, scope: !49)
!53 = !DILocation(line: 25, column: 29, scope: !49)
!54 = !DILocalVariable(name: "fnew", scope: !49, file: !1, line: 25, type: !22)
!55 = !DILocation(line: 0, scope: !49)
!56 = !DILocation(line: 26, column: 18, scope: !57)
!57 = distinct !DILexicalBlock(scope: !49, file: !1, line: 26, column: 13)
!58 = !DILocation(line: 26, column: 13, scope: !49)
!59 = !DILocation(line: 27, column: 14, scope: !57)
!60 = !DILocation(line: 28, column: 5, scope: !49)
!61 = !DILocation(line: 23, column: 34, scope: !46)
!62 = !DILocation(line: 23, column: 5, scope: !46)
!63 = distinct !{!63, !47, !64}
!64 = !DILocation(line: 28, column: 5, scope: !42)
!65 = !DILocation(line: 29, column: 5, scope: !66)
!66 = distinct !DILexicalBlock(scope: !67, file: !1, line: 29, column: 5)
!67 = distinct !DILexicalBlock(scope: !10, file: !1, line: 29, column: 5)
!68 = !DILocation(line: 29, column: 5, scope: !67)
!69 = !DILocation(line: 32, column: 31, scope: !10)
!70 = !DILocation(line: 32, column: 20, scope: !10)
!71 = !DILocalVariable(name: "ndx1", scope: !10, file: !1, line: 32, type: !72)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!73 = !DILocation(line: 33, column: 14, scope: !74)
!74 = distinct !DILexicalBlock(scope: !10, file: !1, line: 33, column: 9)
!75 = !DILocation(line: 33, column: 9, scope: !10)
!76 = !DILocation(line: 34, column: 9, scope: !74)
!77 = !DILocalVariable(name: "ch", scope: !78, file: !1, line: 35, type: !23)
!78 = distinct !DILexicalBlock(scope: !10, file: !1, line: 35, column: 5)
!79 = !DILocation(line: 0, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !78, file: !1, line: 35, type: !23)
!81 = !DILocation(line: 35, column: 10, scope: !78)
!82 = !DILocation(line: 35, column: 25, scope: !78)
!83 = !DILocation(line: 35, column: 35, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !1, line: 35, column: 5)
!85 = !DILocation(line: 35, column: 5, scope: !78)
!86 = !DILocation(line: 36, column: 12, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !1, line: 36, column: 12)
!88 = !DILocation(line: 36, column: 12, scope: !84)
!89 = !DILocalVariable(name: "j", scope: !90, file: !1, line: 37, type: !23)
!90 = distinct !DILexicalBlock(scope: !87, file: !1, line: 37, column: 13)
!91 = !DILocation(line: 0, scope: !90)
!92 = !DILocation(line: 37, column: 18, scope: !90)
!93 = !DILocation(line: 37, column: 34, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !1, line: 37, column: 13)
!95 = !DILocation(line: 37, column: 13, scope: !90)
!96 = !DILocation(line: 38, column: 42, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !1, line: 38, column: 21)
!98 = !DILocation(line: 38, column: 27, scope: !97)
!99 = !DILocation(line: 38, column: 24, scope: !97)
!100 = !DILocation(line: 38, column: 21, scope: !94)
!101 = !DILocation(line: 39, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !1, line: 38, column: 50)
!103 = !DILocation(line: 39, column: 29, scope: !102)
!104 = !DILocation(line: 40, column: 22, scope: !102)
!105 = !DILocation(line: 41, column: 17, scope: !102)
!106 = !DILocation(line: 38, column: 47, scope: !97)
!107 = !DILocation(line: 37, column: 42, scope: !94)
!108 = !DILocation(line: 37, column: 13, scope: !94)
!109 = distinct !{!109, !95, !110}
!110 = !DILocation(line: 41, column: 17, scope: !90)
!111 = !DILocation(line: 36, column: 21, scope: !87)
!112 = !DILocation(line: 35, column: 50, scope: !84)
!113 = !DILocation(line: 35, column: 5, scope: !84)
!114 = distinct !{!114, !85, !115}
!115 = !DILocation(line: 41, column: 17, scope: !78)
!116 = !DILocation(line: 44, column: 31, scope: !10)
!117 = !DILocation(line: 44, column: 20, scope: !10)
!118 = !DILocalVariable(name: "ndx2", scope: !10, file: !1, line: 44, type: !72)
!119 = !DILocation(line: 45, column: 14, scope: !120)
!120 = distinct !DILexicalBlock(scope: !10, file: !1, line: 45, column: 9)
!121 = !DILocation(line: 45, column: 9, scope: !10)
!122 = !DILocation(line: 46, column: 9, scope: !120)
!123 = !DILocalVariable(name: "i", scope: !124, file: !1, line: 47, type: !23)
!124 = distinct !DILexicalBlock(scope: !10, file: !1, line: 47, column: 5)
!125 = !DILocation(line: 0, scope: !124)
!126 = !DILocalVariable(name: "n", scope: !124, file: !1, line: 47, type: !23)
!127 = !DILocalVariable(name: "m", scope: !124, file: !1, line: 47, type: !23)
!128 = !DILocation(line: 47, column: 10, scope: !124)
!129 = !DILocation(line: 47, column: 40, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !1, line: 47, column: 5)
!131 = !DILocation(line: 47, column: 5, scope: !124)
!132 = !DILocation(line: 48, column: 19, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !1, line: 47, column: 52)
!134 = !DILocation(line: 48, column: 9, scope: !133)
!135 = !DILocation(line: 48, column: 17, scope: !133)
!136 = !DILocation(line: 49, column: 11, scope: !133)
!137 = !DILocation(line: 50, column: 15, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !1, line: 50, column: 13)
!139 = !DILocation(line: 50, column: 13, scope: !133)
!140 = !DILocation(line: 51, column: 14, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !1, line: 50, column: 23)
!142 = !DILocation(line: 53, column: 9, scope: !141)
!143 = !DILocation(line: 0, scope: !133)
!144 = !DILocation(line: 54, column: 5, scope: !133)
!145 = !DILocation(line: 47, column: 48, scope: !130)
!146 = !DILocation(line: 47, column: 5, scope: !130)
!147 = distinct !{!147, !131, !148}
!148 = !DILocation(line: 54, column: 5, scope: !124)
!149 = !DILocation(line: 57, column: 33, scope: !10)
!150 = !DILocation(line: 57, column: 38, scope: !10)
!151 = !DILocation(line: 57, column: 26, scope: !10)
!152 = !DILocalVariable(name: "grp", scope: !10, file: !1, line: 57, type: !22)
!153 = !DILocation(line: 58, column: 5, scope: !154)
!154 = distinct !DILexicalBlock(scope: !155, file: !1, line: 58, column: 5)
!155 = distinct !DILexicalBlock(scope: !10, file: !1, line: 58, column: 5)
!156 = !DILocation(line: 58, column: 5, scope: !155)
!157 = !DILocation(line: 61, column: 33, scope: !10)
!158 = !DILocation(line: 61, column: 38, scope: !10)
!159 = !DILocation(line: 61, column: 26, scope: !10)
!160 = !DILocalVariable(name: "lng", scope: !10, file: !1, line: 61, type: !22)
!161 = !DILocation(line: 62, column: 5, scope: !162)
!162 = distinct !DILexicalBlock(scope: !163, file: !1, line: 62, column: 5)
!163 = distinct !DILexicalBlock(scope: !10, file: !1, line: 62, column: 5)
!164 = !DILocation(line: 62, column: 5, scope: !163)
!165 = !DILocalVariable(name: "i", scope: !166, file: !1, line: 65, type: !23)
!166 = distinct !DILexicalBlock(scope: !10, file: !1, line: 65, column: 5)
!167 = !DILocation(line: 0, scope: !166)
!168 = !DILocalVariable(name: "j", scope: !166, file: !1, line: 65, type: !23)
!169 = !DILocation(line: 65, column: 10, scope: !166)
!170 = !DILocation(line: 65, column: 33, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !1, line: 65, column: 5)
!172 = !DILocation(line: 65, column: 5, scope: !166)
!173 = !DILocation(line: 66, column: 30, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !1, line: 65, column: 46)
!175 = !DILocalVariable(name: "first", scope: !174, file: !1, line: 66, type: !22)
!176 = !DILocation(line: 0, scope: !174)
!177 = !DILocation(line: 67, column: 38, scope: !174)
!178 = !DILocation(line: 67, column: 36, scope: !174)
!179 = !DILocation(line: 67, column: 35, scope: !174)
!180 = !DILocation(line: 67, column: 33, scope: !174)
!181 = !DILocalVariable(name: "glen", scope: !174, file: !1, line: 67, type: !22)
!182 = !DILocalVariable(name: "k", scope: !183, file: !1, line: 68, type: !23)
!183 = distinct !DILexicalBlock(scope: !174, file: !1, line: 68, column: 9)
!184 = !DILocation(line: 0, scope: !183)
!185 = !DILocation(line: 68, column: 14, scope: !183)
!186 = !DILocation(line: 68, column: 30, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !1, line: 68, column: 9)
!188 = !DILocation(line: 68, column: 9, scope: !183)
!189 = !DILocation(line: 69, column: 38, scope: !187)
!190 = !DILocation(line: 69, column: 31, scope: !187)
!191 = !DILocation(line: 69, column: 20, scope: !187)
!192 = !DILocation(line: 69, column: 24, scope: !187)
!193 = !DILocation(line: 69, column: 13, scope: !187)
!194 = !DILocation(line: 69, column: 29, scope: !187)
!195 = !DILocation(line: 68, column: 39, scope: !187)
!196 = !DILocation(line: 68, column: 9, scope: !187)
!197 = distinct !{!197, !188, !198}
!198 = !DILocation(line: 69, column: 41, scope: !183)
!199 = !DILocation(line: 70, column: 16, scope: !174)
!200 = !DILocation(line: 70, column: 23, scope: !174)
!201 = !DILocation(line: 70, column: 9, scope: !174)
!202 = !DILocation(line: 70, column: 28, scope: !174)
!203 = !DILocation(line: 71, column: 11, scope: !174)
!204 = !DILocation(line: 72, column: 5, scope: !174)
!205 = !DILocation(line: 65, column: 42, scope: !171)
!206 = !DILocation(line: 65, column: 5, scope: !171)
!207 = distinct !{!207, !172, !208}
!208 = !DILocation(line: 72, column: 5, scope: !166)
!209 = !DILocation(line: 75, column: 5, scope: !10)
!210 = !DILocation(line: 75, column: 17, scope: !10)
!211 = !DILocalVariable(name: "i", scope: !212, file: !1, line: 76, type: !23)
!212 = distinct !DILexicalBlock(scope: !10, file: !1, line: 76, column: 5)
!213 = !DILocation(line: 0, scope: !212)
!214 = !DILocation(line: 76, column: 10, scope: !212)
!215 = !DILocation(line: 76, column: 26, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !1, line: 76, column: 5)
!217 = !DILocation(line: 76, column: 5, scope: !212)
!218 = !DILocation(line: 77, column: 31, scope: !216)
!219 = !DILocation(line: 77, column: 27, scope: !216)
!220 = !DILocation(line: 77, column: 16, scope: !216)
!221 = !DILocation(line: 77, column: 9, scope: !216)
!222 = !DILocation(line: 77, column: 25, scope: !216)
!223 = !DILocation(line: 76, column: 34, scope: !216)
!224 = !DILocation(line: 76, column: 5, scope: !216)
!225 = distinct !{!225, !217, !226}
!226 = !DILocation(line: 77, column: 38, scope: !212)
!227 = !DILocation(line: 79, column: 10, scope: !10)
!228 = !DILocation(line: 79, column: 5, scope: !10)
!229 = !DILocation(line: 80, column: 10, scope: !10)
!230 = !DILocation(line: 80, column: 5, scope: !10)
!231 = !DILocation(line: 81, column: 1, scope: !10)
!232 = distinct !DISubprogram(name: "display", scope: !1, file: !1, line: 83, type: !233, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!233 = !DISubroutineType(types: !234)
!234 = !{null, !13, !13}
!235 = !DILocalVariable(name: "txt1", arg: 1, scope: !232, file: !1, line: 83, type: !13)
!236 = !DILocation(line: 0, scope: !232)
!237 = !DILocalVariable(name: "txt2", arg: 2, scope: !232, file: !1, line: 83, type: !13)
!238 = !DILocation(line: 84, column: 24, scope: !232)
!239 = !DILocalVariable(name: "len", scope: !232, file: !1, line: 84, type: !22)
!240 = !DILocation(line: 85, column: 5, scope: !241)
!241 = distinct !DILexicalBlock(scope: !242, file: !1, line: 85, column: 5)
!242 = distinct !DILexicalBlock(scope: !232, file: !1, line: 85, column: 5)
!243 = !DILocation(line: 85, column: 5, scope: !242)
!244 = !DILocalVariable(name: "score", scope: !232, file: !1, line: 86, type: !245)
!245 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!246 = !DILocalVariable(name: "i", scope: !247, file: !1, line: 87, type: !23)
!247 = distinct !DILexicalBlock(scope: !232, file: !1, line: 87, column: 5)
!248 = !DILocation(line: 0, scope: !247)
!249 = !DILocation(line: 87, column: 10, scope: !247)
!250 = !DILocation(line: 87, column: 26, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !1, line: 87, column: 5)
!252 = !DILocation(line: 87, column: 5, scope: !247)
!253 = !DILocation(line: 88, column: 13, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !1, line: 88, column: 13)
!255 = !DILocation(line: 88, column: 24, scope: !254)
!256 = !DILocation(line: 88, column: 21, scope: !254)
!257 = !DILocation(line: 88, column: 13, scope: !251)
!258 = !DILocation(line: 89, column: 18, scope: !254)
!259 = !DILocation(line: 89, column: 13, scope: !254)
!260 = !DILocation(line: 88, column: 30, scope: !254)
!261 = !DILocation(line: 87, column: 34, scope: !251)
!262 = !DILocation(line: 87, column: 5, scope: !251)
!263 = distinct !{!263, !252, !264}
!264 = !DILocation(line: 89, column: 18, scope: !247)
!265 = !DILocation(line: 90, column: 11, scope: !232)
!266 = !DILocation(line: 91, column: 1, scope: !232)
!267 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 93, type: !268, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!268 = !DISubroutineType(types: !269)
!269 = !{!245}
!270 = !DILocalVariable(name: "data", scope: !267, file: !1, line: 94, type: !271)
!271 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 576, elements: !272)
!272 = !{!273}
!273 = !DISubrange(count: 9)
!274 = !DILocation(line: 94, column: 17, scope: !267)
!275 = !DILocalVariable(name: "data_len", scope: !267, file: !1, line: 96, type: !22)
!276 = !DILocation(line: 0, scope: !267)
!277 = !DILocalVariable(name: "i", scope: !278, file: !1, line: 97, type: !23)
!278 = distinct !DILexicalBlock(scope: !267, file: !1, line: 97, column: 5)
!279 = !DILocation(line: 0, scope: !278)
!280 = !DILocation(line: 97, column: 10, scope: !278)
!281 = !DILocation(line: 97, column: 26, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !1, line: 97, column: 5)
!283 = !DILocation(line: 97, column: 5, scope: !278)
!284 = !DILocation(line: 98, column: 40, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !1, line: 97, column: 43)
!286 = !DILocation(line: 98, column: 33, scope: !285)
!287 = !DILocation(line: 98, column: 49, scope: !285)
!288 = !DILocalVariable(name: "shuf_len", scope: !285, file: !1, line: 98, type: !22)
!289 = !DILocation(line: 0, scope: !285)
!290 = !DILocation(line: 99, column: 9, scope: !285)
!291 = !DILocalVariable(name: "__vla_expr0", scope: !285, type: !25, flags: DIFlagArtificial)
!292 = !DILocalVariable(name: "shuf", scope: !285, file: !1, line: 99, type: !293)
!293 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, elements: !294)
!294 = !{!295}
!295 = !DISubrange(count: !291)
!296 = !DILocation(line: 99, column: 14, scope: !285)
!297 = !DILocation(line: 102, column: 9, scope: !285)
!298 = !DILocation(line: 103, column: 23, scope: !285)
!299 = !DILocation(line: 103, column: 9, scope: !285)
!300 = !DILocation(line: 103, column: 28, scope: !285)
!301 = !DILocation(line: 106, column: 22, scope: !285)
!302 = !DILocation(line: 106, column: 9, scope: !285)
!303 = !DILocation(line: 107, column: 17, scope: !285)
!304 = !DILocation(line: 107, column: 9, scope: !285)
!305 = !DILocation(line: 108, column: 5, scope: !282)
!306 = !DILocation(line: 108, column: 5, scope: !285)
!307 = !DILocation(line: 97, column: 39, scope: !282)
!308 = !DILocation(line: 97, column: 5, scope: !282)
!309 = distinct !{!309, !283, !310}
!310 = !DILocation(line: 108, column: 5, scope: !278)
!311 = !DILocation(line: 110, column: 5, scope: !267)
