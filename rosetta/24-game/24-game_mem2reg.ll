; ModuleID = '24-game.ll'
source_filename = "24-game.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.expr_t = type { i32, i32, i32, %struct.expr_t*, %struct.expr_t* }
%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.frac_t = type { i32, i32 }

@digits = common dso_local global [4 x %struct.expr_t] zeroinitializer, align 16, !dbg !0
@msg = common dso_local global i8* null, align 8, !dbg !60
@pos = common dso_local global i32 0, align 4, !dbg !70
@pool_ptr = common dso_local global i32 0, align 4, !dbg !85
@pool = common dso_local global [8 x %struct.expr_t] zeroinitializer, align 16, !dbg !72
@ctx = common dso_local global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16, !dbg !33
@str = common dso_local global [64 x i8] zeroinitializer, align 16, !dbg !65
@.str = private unnamed_addr constant [14 x i8] c"Expected term\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"Unexpected end of input\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"Invalid digit\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Unbalanced parens\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Trailing garbage\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"Not all digits are used\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"\0AAvailable digits are:\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.8 = private unnamed_addr constant [94 x i8] c". Type an expression and I'll check it for you, or make new numbers.\0AYour choice? [Expr/n/q] \00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str.9 = private unnamed_addr constant [16 x i8] c"string too long\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"Bye\0A\00", align 1
@.str.11 = private unnamed_addr constant [14 x i8] c"%s at '%.*s'\0A\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"Divide by zero\00", align 1
@.str.13 = private unnamed_addr constant [25 x i8] c"You got 24.  Very good.\0A\00", align 1
@.str.14 = private unnamed_addr constant [14 x i8] c"Eval to: %d, \00", align 1
@.str.15 = private unnamed_addr constant [17 x i8] c"Eval to: %d/%d, \00", align 1
@.str.16 = private unnamed_addr constant [22 x i8] c"no good.  Try again.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @gen_digits() #0 !dbg !94 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !98, metadata !DIExpression()), !dbg !99
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !102
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !98, metadata !DIExpression()), !dbg !99
  %cmp = icmp slt i32 %i.0, 4, !dbg !103
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand() #7, !dbg !106
  %rem = srem i32 %call, 9, !dbg !107
  %add = add nsw i32 1, %rem, !dbg !108
  %idxprom = sext i32 %i.0 to i64, !dbg !109
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !109
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 1, !dbg !110
  store i32 %add, i32* %val, align 4, !dbg !111
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !112
  call void @llvm.dbg.value(metadata i32 %inc, metadata !98, metadata !DIExpression()), !dbg !99
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  ret void, !dbg !116
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @reset() #0 !dbg !117 {
entry:
  store i8* null, i8** @msg, align 8, !dbg !118
  store i32 0, i32* @pos, align 4, !dbg !119
  store i32 0, i32* @pool_ptr, align 4, !dbg !120
  call void @llvm.dbg.value(metadata i32 0, metadata !121, metadata !DIExpression()), !dbg !122
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !125
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !121, metadata !DIExpression()), !dbg !122
  %cmp = icmp slt i32 %i.0, 8, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !129
  %arrayidx = getelementptr inbounds [8 x %struct.expr_t], [8 x %struct.expr_t]* @pool, i64 0, i64 %idxprom, !dbg !129
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 0, !dbg !131
  store i32 0, i32* %op, align 16, !dbg !132
  %idxprom1 = sext i32 %i.0 to i64, !dbg !133
  %arrayidx2 = getelementptr inbounds [8 x %struct.expr_t], [8 x %struct.expr_t]* @pool, i64 0, i64 %idxprom1, !dbg !133
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx2, i32 0, i32 4, !dbg !134
  store %struct.expr_t* null, %struct.expr_t** %right, align 8, !dbg !135
  %idxprom3 = sext i32 %i.0 to i64, !dbg !136
  %arrayidx4 = getelementptr inbounds [8 x %struct.expr_t], [8 x %struct.expr_t]* @pool, i64 0, i64 %idxprom3, !dbg !136
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx4, i32 0, i32 3, !dbg !137
  store %struct.expr_t* null, %struct.expr_t** %left, align 16, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !140
  call void @llvm.dbg.value(metadata i32 %inc, metadata !121, metadata !DIExpression()), !dbg !122
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !121, metadata !DIExpression()), !dbg !122
  br label %for.cond5, !dbg !144

for.cond5:                                        ; preds = %for.inc10, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc11, %for.inc10 ], !dbg !146
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !121, metadata !DIExpression()), !dbg !122
  %cmp6 = icmp slt i32 %i.1, 4, !dbg !147
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !149

for.body7:                                        ; preds = %for.cond5
  %idxprom8 = sext i32 %i.1 to i64, !dbg !150
  %arrayidx9 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom8, !dbg !150
  %used = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx9, i32 0, i32 2, !dbg !151
  store i32 0, i32* %used, align 8, !dbg !152
  br label %for.inc10, !dbg !150

for.inc10:                                        ; preds = %for.body7
  %inc11 = add nsw i32 %i.1, 1, !dbg !153
  call void @llvm.dbg.value(metadata i32 %inc11, metadata !121, metadata !DIExpression()), !dbg !122
  br label %for.cond5, !dbg !154, !llvm.loop !155

for.end12:                                        ; preds = %for.cond5
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @bail(i8* %s) #0 !dbg !158 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !161, metadata !DIExpression()), !dbg !162
  store i8* %s, i8** @msg, align 8, !dbg !163
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ctx, i64 0, i64 0), i32 1) #8, !dbg !164
  unreachable, !dbg !164
}

; Function Attrs: noreturn nounwind
declare dso_local void @longjmp(%struct.__jmp_buf_tag*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @new_expr() #0 !dbg !165 {
entry:
  %0 = load i32, i32* @pool_ptr, align 4, !dbg !168
  %cmp = icmp slt i32 %0, 8, !dbg !170
  br i1 %cmp, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @pool_ptr, align 4, !dbg !172
  %inc = add nsw i32 %1, 1, !dbg !172
  store i32 %inc, i32* @pool_ptr, align 4, !dbg !172
  %idx.ext = sext i32 %1 to i64, !dbg !173
  %add.ptr = getelementptr inbounds %struct.expr_t, %struct.expr_t* getelementptr inbounds ([8 x %struct.expr_t], [8 x %struct.expr_t]* @pool, i64 0, i64 0), i64 %idx.ext, !dbg !173
  br label %return, !dbg !174

if.end:                                           ; preds = %entry
  br label %return, !dbg !175

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi %struct.expr_t* [ %add.ptr, %if.then ], [ null, %if.end ], !dbg !176
  ret %struct.expr_t* %retval.0, !dbg !177
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @next_tok() #0 !dbg !178 {
entry:
  br label %while.cond, !dbg !181

while.cond:                                       ; preds = %while.body, %entry
  %call = call i16** @__ctype_b_loc() #9, !dbg !182
  %0 = load i16*, i16** %call, align 8, !dbg !182
  %1 = load i32, i32* @pos, align 4, !dbg !182
  %idxprom = sext i32 %1 to i64, !dbg !182
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom, !dbg !182
  %2 = load i8, i8* %arrayidx, align 1, !dbg !182
  %conv = sext i8 %2 to i32, !dbg !182
  %idxprom1 = sext i32 %conv to i64, !dbg !182
  %arrayidx2 = getelementptr inbounds i16, i16* %0, i64 %idxprom1, !dbg !182
  %3 = load i16, i16* %arrayidx2, align 2, !dbg !182
  %conv3 = zext i16 %3 to i32, !dbg !182
  %and = and i32 %conv3, 8192, !dbg !182
  %tobool = icmp ne i32 %and, 0, !dbg !181
  br i1 %tobool, label %while.body, label %while.end, !dbg !181

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* @pos, align 4, !dbg !183
  %inc = add nsw i32 %4, 1, !dbg !183
  store i32 %inc, i32* @pos, align 4, !dbg !183
  br label %while.cond, !dbg !181, !llvm.loop !184

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* @pos, align 4, !dbg !185
  %idxprom4 = sext i32 %5 to i64, !dbg !186
  %arrayidx5 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom4, !dbg !186
  %6 = load i8, i8* %arrayidx5, align 1, !dbg !186
  %conv6 = sext i8 %6 to i32, !dbg !186
  ret i32 %conv6, !dbg !187
}

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @take() #0 !dbg !188 {
entry:
  %0 = load i32, i32* @pos, align 4, !dbg !189
  %idxprom = sext i32 %0 to i64, !dbg !191
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom, !dbg !191
  %1 = load i8, i8* %arrayidx, align 1, !dbg !191
  %conv = sext i8 %1 to i32, !dbg !191
  %cmp = icmp ne i32 %conv, 0, !dbg !192
  br i1 %cmp, label %if.then, label %if.end, !dbg !193

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @pos, align 4, !dbg !194
  %inc = add nsw i32 %2, 1, !dbg !194
  store i32 %inc, i32* @pos, align 4, !dbg !194
  br label %return, !dbg !195

if.end:                                           ; preds = %entry
  br label %return, !dbg !196

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ %inc, %if.then ], [ 0, %if.end ], !dbg !197
  ret i32 %retval.0, !dbg !198
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_expr() #0 !dbg !199 {
entry:
  %call = call %struct.expr_t* @get_term(), !dbg !200
  call void @llvm.dbg.value(metadata %struct.expr_t* %call, metadata !202, metadata !DIExpression()), !dbg !203
  %tobool = icmp ne %struct.expr_t* %call, null, !dbg !204
  br i1 %tobool, label %if.end, label %if.then, !dbg !205

if.then:                                          ; preds = %entry
  call void @bail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0)), !dbg !206
  br label %if.end, !dbg !206

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !207

while.cond:                                       ; preds = %if.end10, %if.end
  %ret.0 = phi %struct.expr_t* [ %call, %if.end ], [ %call11, %if.end10 ], !dbg !203
  call void @llvm.dbg.value(metadata %struct.expr_t* %ret.0, metadata !202, metadata !DIExpression()), !dbg !203
  %call1 = call i32 @next_tok(), !dbg !208
  call void @llvm.dbg.value(metadata i32 %call1, metadata !209, metadata !DIExpression()), !dbg !203
  %cmp = icmp eq i32 %call1, 43, !dbg !210
  br i1 %cmp, label %lor.end, label %lor.rhs, !dbg !211

lor.rhs:                                          ; preds = %while.cond
  %cmp2 = icmp eq i32 %call1, 45, !dbg !212
  br label %lor.end, !dbg !211

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %0 = phi i1 [ true, %while.cond ], [ %cmp2, %lor.rhs ]
  br i1 %0, label %while.body, label %while.end, !dbg !207

while.body:                                       ; preds = %lor.end
  %call3 = call i32 @take(), !dbg !213
  %tobool4 = icmp ne i32 %call3, 0, !dbg !213
  br i1 %tobool4, label %if.end6, label %if.then5, !dbg !216

if.then5:                                         ; preds = %while.body
  call void @bail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0)), !dbg !217
  br label %if.end6, !dbg !217

if.end6:                                          ; preds = %if.then5, %while.body
  %call7 = call %struct.expr_t* @get_term(), !dbg !218
  call void @llvm.dbg.value(metadata %struct.expr_t* %call7, metadata !220, metadata !DIExpression()), !dbg !203
  %tobool8 = icmp ne %struct.expr_t* %call7, null, !dbg !221
  br i1 %tobool8, label %if.end10, label %if.then9, !dbg !222

if.then9:                                         ; preds = %if.end6
  call void @bail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0)), !dbg !223
  br label %if.end10, !dbg !223

if.end10:                                         ; preds = %if.then9, %if.end6
  call void @llvm.dbg.value(metadata %struct.expr_t* %ret.0, metadata !224, metadata !DIExpression()), !dbg !203
  %call11 = call %struct.expr_t* @new_expr(), !dbg !225
  call void @llvm.dbg.value(metadata %struct.expr_t* %call11, metadata !202, metadata !DIExpression()), !dbg !203
  %cmp12 = icmp eq i32 %call1, 43, !dbg !226
  %1 = zext i1 %cmp12 to i64, !dbg !227
  %cond = select i1 %cmp12, i32 2, i32 3, !dbg !227
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %call11, i32 0, i32 0, !dbg !228
  store i32 %cond, i32* %op, align 8, !dbg !229
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %call11, i32 0, i32 3, !dbg !230
  store %struct.expr_t* %ret.0, %struct.expr_t** %left, align 8, !dbg !231
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %call11, i32 0, i32 4, !dbg !232
  store %struct.expr_t* %call7, %struct.expr_t** %right, align 8, !dbg !233
  br label %while.cond, !dbg !207, !llvm.loop !234

while.end:                                        ; preds = %lor.end
  ret %struct.expr_t* %ret.0, !dbg !236
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_term() #0 !dbg !237 {
entry:
  %call = call %struct.expr_t* @get_fact(), !dbg !238
  call void @llvm.dbg.value(metadata %struct.expr_t* %call, metadata !239, metadata !DIExpression()), !dbg !240
  br label %while.cond, !dbg !241

while.cond:                                       ; preds = %if.end, %entry
  %ret.0 = phi %struct.expr_t* [ %call, %entry ], [ %call5, %if.end ], !dbg !240
  call void @llvm.dbg.value(metadata %struct.expr_t* %ret.0, metadata !239, metadata !DIExpression()), !dbg !240
  %call1 = call i32 @next_tok(), !dbg !242
  call void @llvm.dbg.value(metadata i32 %call1, metadata !243, metadata !DIExpression()), !dbg !240
  %cmp = icmp eq i32 %call1, 42, !dbg !244
  br i1 %cmp, label %lor.end, label %lor.rhs, !dbg !245

lor.rhs:                                          ; preds = %while.cond
  %cmp2 = icmp eq i32 %call1, 47, !dbg !246
  br label %lor.end, !dbg !245

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %0 = phi i1 [ true, %while.cond ], [ %cmp2, %lor.rhs ]
  br i1 %0, label %while.body, label %while.end, !dbg !241

while.body:                                       ; preds = %lor.end
  %call3 = call i32 @take(), !dbg !247
  %tobool = icmp ne i32 %call3, 0, !dbg !247
  br i1 %tobool, label %if.end, label %if.then, !dbg !250

if.then:                                          ; preds = %while.body
  call void @bail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0)), !dbg !251
  br label %if.end, !dbg !251

if.end:                                           ; preds = %if.then, %while.body
  %call4 = call %struct.expr_t* @get_fact(), !dbg !252
  call void @llvm.dbg.value(metadata %struct.expr_t* %call4, metadata !253, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.value(metadata %struct.expr_t* %ret.0, metadata !254, metadata !DIExpression()), !dbg !240
  %call5 = call %struct.expr_t* @new_expr(), !dbg !255
  call void @llvm.dbg.value(metadata %struct.expr_t* %call5, metadata !239, metadata !DIExpression()), !dbg !240
  %cmp6 = icmp eq i32 %call1, 42, !dbg !256
  %1 = zext i1 %cmp6 to i64, !dbg !257
  %cond = select i1 %cmp6, i32 4, i32 5, !dbg !257
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %call5, i32 0, i32 0, !dbg !258
  store i32 %cond, i32* %op, align 8, !dbg !259
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %call5, i32 0, i32 3, !dbg !260
  store %struct.expr_t* %ret.0, %struct.expr_t** %left, align 8, !dbg !261
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %call5, i32 0, i32 4, !dbg !262
  store %struct.expr_t* %call4, %struct.expr_t** %right, align 8, !dbg !263
  br label %while.cond, !dbg !241, !llvm.loop !264

while.end:                                        ; preds = %lor.end
  ret %struct.expr_t* %ret.0, !dbg !266
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_digit() #0 !dbg !267 {
entry:
  %call = call i32 @next_tok(), !dbg !268
  call void @llvm.dbg.value(metadata i32 %call, metadata !269, metadata !DIExpression()), !dbg !270
  %cmp = icmp sge i32 %call, 48, !dbg !271
  br i1 %cmp, label %land.lhs.true, label %if.end15, !dbg !273

land.lhs.true:                                    ; preds = %entry
  %cmp1 = icmp sle i32 %call, 57, !dbg !274
  br i1 %cmp1, label %if.then, label %if.end15, !dbg !275

if.then:                                          ; preds = %land.lhs.true
  %call2 = call i32 @take(), !dbg !276
  %call3 = call %struct.expr_t* @new_expr(), !dbg !278
  call void @llvm.dbg.value(metadata %struct.expr_t* %call3, metadata !279, metadata !DIExpression()), !dbg !270
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %call3, i32 0, i32 0, !dbg !280
  store i32 1, i32* %op, align 8, !dbg !281
  %sub = sub nsw i32 %call, 48, !dbg !282
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %call3, i32 0, i32 1, !dbg !283
  store i32 %sub, i32* %val, align 4, !dbg !284
  call void @llvm.dbg.value(metadata i32 0, metadata !285, metadata !DIExpression()), !dbg !270
  br label %for.cond, !dbg !286

for.cond:                                         ; preds = %for.inc, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %inc, %for.inc ], !dbg !288
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !285, metadata !DIExpression()), !dbg !270
  %cmp4 = icmp slt i32 %i.0, 4, !dbg !289
  br i1 %cmp4, label %for.body, label %for.end, !dbg !291

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !292
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !292
  %val5 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 1, !dbg !294
  %0 = load i32, i32* %val5, align 4, !dbg !294
  %val6 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %call3, i32 0, i32 1, !dbg !295
  %1 = load i32, i32* %val6, align 4, !dbg !295
  %cmp7 = icmp eq i32 %0, %1, !dbg !296
  br i1 %cmp7, label %land.lhs.true8, label %if.end, !dbg !297

land.lhs.true8:                                   ; preds = %for.body
  %idxprom9 = sext i32 %i.0 to i64, !dbg !298
  %arrayidx10 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom9, !dbg !298
  %used = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx10, i32 0, i32 2, !dbg !299
  %2 = load i32, i32* %used, align 8, !dbg !299
  %tobool = icmp ne i32 %2, 0, !dbg !298
  br i1 %tobool, label %if.end, label %if.then11, !dbg !300

if.then11:                                        ; preds = %land.lhs.true8
  %idxprom12 = sext i32 %i.0 to i64, !dbg !301
  %arrayidx13 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom12, !dbg !301
  %used14 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx13, i32 0, i32 2, !dbg !303
  store i32 1, i32* %used14, align 8, !dbg !304
  br label %return, !dbg !305

if.end:                                           ; preds = %land.lhs.true8, %for.body
  br label %for.inc, !dbg !299

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !306
  call void @llvm.dbg.value(metadata i32 %inc, metadata !285, metadata !DIExpression()), !dbg !270
  br label %for.cond, !dbg !307, !llvm.loop !308

for.end:                                          ; preds = %for.cond
  call void @bail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0)), !dbg !310
  br label %if.end15, !dbg !311

if.end15:                                         ; preds = %for.end, %land.lhs.true, %entry
  br label %return, !dbg !312

return:                                           ; preds = %if.end15, %if.then11
  %retval.0 = phi %struct.expr_t* [ %call3, %if.then11 ], [ null, %if.end15 ], !dbg !270
  ret %struct.expr_t* %retval.0, !dbg !313
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_fact() #0 !dbg !314 {
entry:
  %call = call %struct.expr_t* @get_digit(), !dbg !315
  call void @llvm.dbg.value(metadata %struct.expr_t* %call, metadata !316, metadata !DIExpression()), !dbg !317
  %tobool = icmp ne %struct.expr_t* %call, null, !dbg !318
  br i1 %tobool, label %if.then, label %if.end, !dbg !320

if.then:                                          ; preds = %entry
  br label %return, !dbg !321

if.end:                                           ; preds = %entry
  %call1 = call i32 @next_tok(), !dbg !322
  call void @llvm.dbg.value(metadata i32 %call1, metadata !324, metadata !DIExpression()), !dbg !317
  %cmp = icmp eq i32 %call1, 40, !dbg !325
  br i1 %cmp, label %if.then2, label %if.end10, !dbg !326

if.then2:                                         ; preds = %if.end
  %call3 = call i32 @take(), !dbg !327
  %call4 = call %struct.expr_t* @get_expr(), !dbg !329
  call void @llvm.dbg.value(metadata %struct.expr_t* %call4, metadata !316, metadata !DIExpression()), !dbg !317
  %call5 = call i32 @next_tok(), !dbg !330
  %cmp6 = icmp ne i32 %call5, 41, !dbg !332
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !333

if.then7:                                         ; preds = %if.then2
  call void @bail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !334
  br label %if.end8, !dbg !334

if.end8:                                          ; preds = %if.then7, %if.then2
  %call9 = call i32 @take(), !dbg !335
  br label %return, !dbg !336

if.end10:                                         ; preds = %if.end
  br label %return, !dbg !337

return:                                           ; preds = %if.end10, %if.end8, %if.then
  %retval.0 = phi %struct.expr_t* [ %call, %if.then ], [ %call4, %if.end8 ], [ null, %if.end10 ], !dbg !317
  ret %struct.expr_t* %retval.0, !dbg !338
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @parse() #0 !dbg !339 {
entry:
  %call = call %struct.expr_t* @get_expr(), !dbg !340
  call void @llvm.dbg.value(metadata %struct.expr_t* %call, metadata !341, metadata !DIExpression()), !dbg !342
  %call1 = call i32 @next_tok(), !dbg !343
  %cmp = icmp ne i32 %call1, 0, !dbg !345
  br i1 %cmp, label %if.then, label %if.end, !dbg !346

if.then:                                          ; preds = %entry
  call void @bail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !347
  br label %if.end, !dbg !347

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !348, metadata !DIExpression()), !dbg !342
  br label %for.cond, !dbg !349

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !351
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !348, metadata !DIExpression()), !dbg !342
  %cmp2 = icmp slt i32 %i.0, 4, !dbg !352
  br i1 %cmp2, label %for.body, label %for.end, !dbg !354

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !355
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !355
  %used = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 2, !dbg !357
  %0 = load i32, i32* %used, align 8, !dbg !357
  %tobool = icmp ne i32 %0, 0, !dbg !355
  br i1 %tobool, label %if.end4, label %if.then3, !dbg !358

if.then3:                                         ; preds = %for.body
  call void @bail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0)), !dbg !359
  br label %if.end4, !dbg !359

if.end4:                                          ; preds = %if.then3, %for.body
  br label %for.inc, !dbg !357

for.inc:                                          ; preds = %if.end4
  %inc = add nsw i32 %i.0, 1, !dbg !360
  call void @llvm.dbg.value(metadata i32 %inc, metadata !348, metadata !DIExpression()), !dbg !342
  br label %for.cond, !dbg !361, !llvm.loop !362

for.end:                                          ; preds = %for.cond
  ret %struct.expr_t* %call, !dbg !364
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gcd(i32 %m, i32 %n) #0 !dbg !365 {
entry:
  call void @llvm.dbg.value(metadata i32 %m, metadata !368, metadata !DIExpression()), !dbg !369
  call void @llvm.dbg.value(metadata i32 %n, metadata !370, metadata !DIExpression()), !dbg !369
  br label %while.cond, !dbg !371

while.cond:                                       ; preds = %while.body, %entry
  %n.addr.0 = phi i32 [ %n, %entry ], [ %m.addr.0, %while.body ]
  %m.addr.0 = phi i32 [ %m, %entry ], [ %rem, %while.body ]
  call void @llvm.dbg.value(metadata i32 %m.addr.0, metadata !368, metadata !DIExpression()), !dbg !369
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !370, metadata !DIExpression()), !dbg !369
  %tobool = icmp ne i32 %m.addr.0, 0, !dbg !371
  br i1 %tobool, label %while.body, label %while.end, !dbg !371

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.value(metadata i32 %m.addr.0, metadata !372, metadata !DIExpression()), !dbg !369
  %rem = srem i32 %n.addr.0, %m.addr.0, !dbg !373
  call void @llvm.dbg.value(metadata i32 %rem, metadata !368, metadata !DIExpression()), !dbg !369
  call void @llvm.dbg.value(metadata i32 %m.addr.0, metadata !370, metadata !DIExpression()), !dbg !369
  br label %while.cond, !dbg !371, !llvm.loop !375

while.end:                                        ; preds = %while.cond
  ret i32 %n.addr.0, !dbg !377
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_tree(%struct.expr_t* %e, %struct.frac_t* %res) #0 !dbg !378 {
entry:
  %l = alloca %struct.frac_t, align 4
  %r = alloca %struct.frac_t, align 4
  call void @llvm.dbg.value(metadata %struct.expr_t* %e, metadata !387, metadata !DIExpression()), !dbg !388
  call void @llvm.dbg.value(metadata %struct.frac_t* %res, metadata !389, metadata !DIExpression()), !dbg !388
  call void @llvm.dbg.declare(metadata %struct.frac_t* %l, metadata !390, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.declare(metadata %struct.frac_t* %r, metadata !393, metadata !DIExpression()), !dbg !394
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %e, i32 0, i32 0, !dbg !395
  %0 = load i32, i32* %op, align 8, !dbg !395
  %cmp = icmp eq i32 %0, 1, !dbg !397
  br i1 %cmp, label %if.then, label %if.end, !dbg !398

if.then:                                          ; preds = %entry
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %e, i32 0, i32 1, !dbg !399
  %1 = load i32, i32* %val, align 4, !dbg !399
  %num = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 1, !dbg !401
  store i32 %1, i32* %num, align 4, !dbg !402
  %denom = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 0, !dbg !403
  store i32 1, i32* %denom, align 4, !dbg !404
  br label %if.end48, !dbg !405

if.end:                                           ; preds = %entry
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %e, i32 0, i32 3, !dbg !406
  %2 = load %struct.expr_t*, %struct.expr_t** %left, align 8, !dbg !406
  call void @eval_tree(%struct.expr_t* %2, %struct.frac_t* %l), !dbg !407
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %e, i32 0, i32 4, !dbg !408
  %3 = load %struct.expr_t*, %struct.expr_t** %right, align 8, !dbg !408
  call void @eval_tree(%struct.expr_t* %3, %struct.frac_t* %r), !dbg !409
  %op1 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %e, i32 0, i32 0, !dbg !410
  %4 = load i32, i32* %op1, align 8, !dbg !410
  switch i32 %4, label %sw.epilog [
    i32 2, label %sw.bb
    i32 3, label %sw.bb12
    i32 4, label %sw.bb24
    i32 5, label %sw.bb33
  ], !dbg !411

sw.bb:                                            ; preds = %if.end
  %num2 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !412
  %5 = load i32, i32* %num2, align 4, !dbg !412
  %denom3 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !414
  %6 = load i32, i32* %denom3, align 4, !dbg !414
  %mul = mul nsw i32 %5, %6, !dbg !415
  %denom4 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !416
  %7 = load i32, i32* %denom4, align 4, !dbg !416
  %num5 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !417
  %8 = load i32, i32* %num5, align 4, !dbg !417
  %mul6 = mul nsw i32 %7, %8, !dbg !418
  %add = add nsw i32 %mul, %mul6, !dbg !419
  %num7 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 1, !dbg !420
  store i32 %add, i32* %num7, align 4, !dbg !421
  %denom8 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !422
  %9 = load i32, i32* %denom8, align 4, !dbg !422
  %denom9 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !423
  %10 = load i32, i32* %denom9, align 4, !dbg !423
  %mul10 = mul nsw i32 %9, %10, !dbg !424
  %denom11 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 0, !dbg !425
  store i32 %mul10, i32* %denom11, align 4, !dbg !426
  br label %sw.epilog, !dbg !427

sw.bb12:                                          ; preds = %if.end
  %num13 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !428
  %11 = load i32, i32* %num13, align 4, !dbg !428
  %denom14 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !429
  %12 = load i32, i32* %denom14, align 4, !dbg !429
  %mul15 = mul nsw i32 %11, %12, !dbg !430
  %denom16 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !431
  %13 = load i32, i32* %denom16, align 4, !dbg !431
  %num17 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !432
  %14 = load i32, i32* %num17, align 4, !dbg !432
  %mul18 = mul nsw i32 %13, %14, !dbg !433
  %sub = sub nsw i32 %mul15, %mul18, !dbg !434
  %num19 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 1, !dbg !435
  store i32 %sub, i32* %num19, align 4, !dbg !436
  %denom20 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !437
  %15 = load i32, i32* %denom20, align 4, !dbg !437
  %denom21 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !438
  %16 = load i32, i32* %denom21, align 4, !dbg !438
  %mul22 = mul nsw i32 %15, %16, !dbg !439
  %denom23 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 0, !dbg !440
  store i32 %mul22, i32* %denom23, align 4, !dbg !441
  br label %sw.epilog, !dbg !442

sw.bb24:                                          ; preds = %if.end
  %num25 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !443
  %17 = load i32, i32* %num25, align 4, !dbg !443
  %num26 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !444
  %18 = load i32, i32* %num26, align 4, !dbg !444
  %mul27 = mul nsw i32 %17, %18, !dbg !445
  %num28 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 1, !dbg !446
  store i32 %mul27, i32* %num28, align 4, !dbg !447
  %denom29 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !448
  %19 = load i32, i32* %denom29, align 4, !dbg !448
  %denom30 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !449
  %20 = load i32, i32* %denom30, align 4, !dbg !449
  %mul31 = mul nsw i32 %19, %20, !dbg !450
  %denom32 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 0, !dbg !451
  store i32 %mul31, i32* %denom32, align 4, !dbg !452
  br label %sw.epilog, !dbg !453

sw.bb33:                                          ; preds = %if.end
  %num34 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !454
  %21 = load i32, i32* %num34, align 4, !dbg !454
  %denom35 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !455
  %22 = load i32, i32* %denom35, align 4, !dbg !455
  %mul36 = mul nsw i32 %21, %22, !dbg !456
  %num37 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 1, !dbg !457
  store i32 %mul36, i32* %num37, align 4, !dbg !458
  %denom38 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !459
  %23 = load i32, i32* %denom38, align 4, !dbg !459
  %num39 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !460
  %24 = load i32, i32* %num39, align 4, !dbg !460
  %mul40 = mul nsw i32 %23, %24, !dbg !461
  %denom41 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 0, !dbg !462
  store i32 %mul40, i32* %denom41, align 4, !dbg !463
  br label %sw.epilog, !dbg !464

sw.epilog:                                        ; preds = %sw.bb33, %sw.bb24, %sw.bb12, %sw.bb, %if.end
  %denom42 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 0, !dbg !465
  %25 = load i32, i32* %denom42, align 4, !dbg !465
  %num43 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 1, !dbg !467
  %26 = load i32, i32* %num43, align 4, !dbg !467
  %call = call i32 @gcd(i32 %25, i32 %26), !dbg !468
  call void @llvm.dbg.value(metadata i32 %call, metadata !469, metadata !DIExpression()), !dbg !388
  %tobool = icmp ne i32 %call, 0, !dbg !470
  br i1 %tobool, label %if.then44, label %if.end48, !dbg !471

if.then44:                                        ; preds = %sw.epilog
  %denom45 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 0, !dbg !472
  %27 = load i32, i32* %denom45, align 4, !dbg !474
  %div = sdiv i32 %27, %call, !dbg !474
  store i32 %div, i32* %denom45, align 4, !dbg !474
  %num46 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %res, i32 0, i32 1, !dbg !475
  %28 = load i32, i32* %num46, align 4, !dbg !476
  %div47 = sdiv i32 %28, %call, !dbg !476
  store i32 %div47, i32* %num46, align 4, !dbg !476
  br label %if.end48, !dbg !477

if.end48:                                         ; preds = %if.then44, %sw.epilog, %if.then
  ret void, !dbg !478
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @get_input() #0 !dbg !479 {
entry:
  br label %reinput, !dbg !480

reinput:                                          ; preds = %reinput.backedge, %entry
  call void @llvm.dbg.label(metadata !481), !dbg !482
  call void @reset(), !dbg !483
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i64 0, i64 0)), !dbg !484
  call void @llvm.dbg.value(metadata i32 0, metadata !485, metadata !DIExpression()), !dbg !486
  br label %for.cond, !dbg !487

for.cond:                                         ; preds = %for.inc, %reinput
  %i.0 = phi i32 [ 0, %reinput ], [ %inc, %for.inc ], !dbg !489
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !485, metadata !DIExpression()), !dbg !486
  %cmp = icmp slt i32 %i.0, 4, !dbg !490
  br i1 %cmp, label %for.body, label %for.end, !dbg !492

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !493
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !493
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 1, !dbg !494
  %0 = load i32, i32* %val, align 4, !dbg !494
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0), i32 %0), !dbg !495
  br label %for.inc, !dbg !495

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !496
  call void @llvm.dbg.value(metadata i32 %inc, metadata !485, metadata !DIExpression()), !dbg !486
  br label %for.cond, !dbg !497, !llvm.loop !498

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.8, i64 0, i64 0)), !dbg !500
  br label %while.body, !dbg !501

while.body:                                       ; preds = %for.end
  call void @llvm.dbg.value(metadata i32 0, metadata !485, metadata !DIExpression()), !dbg !486
  br label %for.cond3, !dbg !502

for.cond3:                                        ; preds = %for.inc8, %while.body
  %i.1 = phi i32 [ 0, %while.body ], [ %inc9, %for.inc8 ], !dbg !505
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !485, metadata !DIExpression()), !dbg !486
  %cmp4 = icmp slt i32 %i.1, 64, !dbg !506
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !508

for.body5:                                        ; preds = %for.cond3
  %idxprom6 = sext i32 %i.1 to i64, !dbg !509
  %arrayidx7 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom6, !dbg !509
  store i8 10, i8* %arrayidx7, align 1, !dbg !510
  br label %for.inc8, !dbg !509

for.inc8:                                         ; preds = %for.body5
  %inc9 = add nsw i32 %i.1, 1, !dbg !511
  call void @llvm.dbg.value(metadata i32 %inc9, metadata !485, metadata !DIExpression()), !dbg !486
  br label %for.cond3, !dbg !512, !llvm.loop !513

for.end10:                                        ; preds = %for.cond3
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !515
  %call11 = call i8* @fgets(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), i32 64, %struct._IO_FILE* %1), !dbg !516
  %2 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), align 16, !dbg !517
  %conv = sext i8 %2 to i32, !dbg !517
  %cmp12 = icmp eq i32 %conv, 0, !dbg !519
  br i1 %cmp12, label %if.then, label %if.end, !dbg !520

if.then:                                          ; preds = %for.end10
  br label %reinput.backedge, !dbg !521

reinput.backedge:                                 ; preds = %if.then44, %if.then
  br label %reinput, !dbg !482

if.end:                                           ; preds = %for.end10
  %3 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 63), align 1, !dbg !522
  %conv14 = sext i8 %3 to i32, !dbg !522
  %cmp15 = icmp ne i32 %conv14, 10, !dbg !524
  br i1 %cmp15, label %if.then17, label %if.end18, !dbg !525

if.then17:                                        ; preds = %if.end
  call void @bail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i64 0, i64 0)), !dbg !526
  br label %if.end18, !dbg !526

if.end18:                                         ; preds = %if.then17, %if.end
  call void @llvm.dbg.value(metadata i32 0, metadata !485, metadata !DIExpression()), !dbg !486
  br label %for.cond19, !dbg !527

for.cond19:                                       ; preds = %for.inc32, %if.end18
  %i.2 = phi i32 [ 0, %if.end18 ], [ %inc33, %for.inc32 ], !dbg !529
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !485, metadata !DIExpression()), !dbg !486
  %cmp20 = icmp slt i32 %i.2, 64, !dbg !530
  br i1 %cmp20, label %for.body22, label %for.end34, !dbg !532

for.body22:                                       ; preds = %for.cond19
  %idxprom23 = sext i32 %i.2 to i64, !dbg !533
  %arrayidx24 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom23, !dbg !533
  %4 = load i8, i8* %arrayidx24, align 1, !dbg !533
  %conv25 = sext i8 %4 to i32, !dbg !533
  %cmp26 = icmp eq i32 %conv25, 10, !dbg !535
  br i1 %cmp26, label %if.then28, label %if.end31, !dbg !536

if.then28:                                        ; preds = %for.body22
  %idxprom29 = sext i32 %i.2 to i64, !dbg !537
  %arrayidx30 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom29, !dbg !537
  store i8 0, i8* %arrayidx30, align 1, !dbg !538
  br label %if.end31, !dbg !537

if.end31:                                         ; preds = %if.then28, %for.body22
  br label %for.inc32, !dbg !539

for.inc32:                                        ; preds = %if.end31
  %inc33 = add nsw i32 %i.2, 1, !dbg !540
  call void @llvm.dbg.value(metadata i32 %inc33, metadata !485, metadata !DIExpression()), !dbg !486
  br label %for.cond19, !dbg !541, !llvm.loop !542

for.end34:                                        ; preds = %for.cond19
  %5 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), align 16, !dbg !544
  %conv35 = sext i8 %5 to i32, !dbg !544
  %cmp36 = icmp eq i32 %conv35, 113, !dbg !546
  br i1 %cmp36, label %if.then38, label %if.end40, !dbg !547

if.then38:                                        ; preds = %for.end34
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i64 0, i64 0)), !dbg !548
  call void @exit(i32 0) #8, !dbg !550
  unreachable, !dbg !550

if.end40:                                         ; preds = %for.end34
  %6 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), align 16, !dbg !551
  %conv41 = sext i8 %6 to i32, !dbg !551
  %cmp42 = icmp eq i32 %conv41, 110, !dbg !553
  br i1 %cmp42, label %if.then44, label %if.end45, !dbg !554

if.then44:                                        ; preds = %if.end40
  call void @gen_digits(), !dbg !555
  br label %reinput.backedge, !dbg !557

if.end45:                                         ; preds = %if.end40
  ret void, !dbg !558
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare dso_local i32 @printf(i8*, ...) #5

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !559 {
entry:
  %f = alloca %struct.frac_t, align 4
  call void @llvm.dbg.declare(metadata %struct.frac_t* %f, metadata !560, metadata !DIExpression()), !dbg !561
  %call = call i64 @time(i64* null) #7, !dbg !562
  %conv = trunc i64 %call to i32, !dbg !562
  call void @srand(i32 %conv) #7, !dbg !563
  call void @gen_digits(), !dbg !564
  br label %while.body, !dbg !565

while.body:                                       ; preds = %while.body.backedge, %entry
  call void @get_input(), !dbg !566
  %call1 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ctx, i64 0, i64 0)) #10, !dbg !568
  %0 = load i8*, i8** @msg, align 8, !dbg !569
  %tobool = icmp ne i8* %0, null, !dbg !569
  br i1 %tobool, label %if.then, label %if.end, !dbg !571

if.then:                                          ; preds = %while.body
  %1 = load i8*, i8** @msg, align 8, !dbg !572
  %2 = load i32, i32* @pos, align 4, !dbg !574
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i64 0, i64 0), i8* %1, i32 %2, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0)), !dbg !575
  br label %while.body.backedge, !dbg !576

while.body.backedge:                              ; preds = %if.end26, %if.then
  br label %while.body, !dbg !566, !llvm.loop !577

if.end:                                           ; preds = %while.body
  %call3 = call %struct.expr_t* @parse(), !dbg !579
  call void @eval_tree(%struct.expr_t* %call3, %struct.frac_t* %f), !dbg !580
  %denom = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !581
  %3 = load i32, i32* %denom, align 4, !dbg !581
  %cmp = icmp eq i32 %3, 0, !dbg !583
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !584

if.then5:                                         ; preds = %if.end
  call void @bail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i64 0, i64 0)), !dbg !585
  br label %if.end6, !dbg !585

if.end6:                                          ; preds = %if.then5, %if.end
  %denom7 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !586
  %4 = load i32, i32* %denom7, align 4, !dbg !586
  %cmp8 = icmp eq i32 %4, 1, !dbg !588
  br i1 %cmp8, label %land.lhs.true, label %if.else, !dbg !589

land.lhs.true:                                    ; preds = %if.end6
  %num = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 1, !dbg !590
  %5 = load i32, i32* %num, align 4, !dbg !590
  %cmp10 = icmp eq i32 %5, 24, !dbg !591
  br i1 %cmp10, label %if.then12, label %if.else, !dbg !592

if.then12:                                        ; preds = %land.lhs.true
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.13, i64 0, i64 0)), !dbg !593
  br label %if.end26, !dbg !593

if.else:                                          ; preds = %land.lhs.true, %if.end6
  %denom14 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !594
  %6 = load i32, i32* %denom14, align 4, !dbg !594
  %cmp15 = icmp eq i32 %6, 1, !dbg !597
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !598

if.then17:                                        ; preds = %if.else
  %num18 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 1, !dbg !599
  %7 = load i32, i32* %num18, align 4, !dbg !599
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.14, i64 0, i64 0), i32 %7), !dbg !600
  br label %if.end24, !dbg !600

if.else20:                                        ; preds = %if.else
  %num21 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 1, !dbg !601
  %8 = load i32, i32* %num21, align 4, !dbg !601
  %denom22 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !602
  %9 = load i32, i32* %denom22, align 4, !dbg !602
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.15, i64 0, i64 0), i32 %8, i32 %9), !dbg !603
  br label %if.end24

if.end24:                                         ; preds = %if.else20, %if.then17
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.16, i64 0, i64 0)), !dbg !604
  br label %if.end26

if.end26:                                         ; preds = %if.end24, %if.then12
  br label %while.body.backedge, !dbg !565
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind returns_twice
declare dso_local i32 @_setjmp(%struct.__jmp_buf_tag*) #6

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readnone }
attributes #10 = { nounwind returns_twice }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!90, !91, !92}
!llvm.ident = !{!93}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "digits", scope: !2, file: !3, line: 19, type: !87, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !29, globals: !32, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "24-game.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/24-game")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 10, baseType: !6, size: 32, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10, !11, !12, !13}
!8 = !DIEnumerator(name: "OP_NONE", value: 0, isUnsigned: true)
!9 = !DIEnumerator(name: "OP_NUM", value: 1, isUnsigned: true)
!10 = !DIEnumerator(name: "OP_ADD", value: 2, isUnsigned: true)
!11 = !DIEnumerator(name: "OP_SUB", value: 3, isUnsigned: true)
!12 = !DIEnumerator(name: "OP_MUL", value: 4, isUnsigned: true)
!13 = !DIEnumerator(name: "OP_DIV", value: 5, isUnsigned: true)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 46, baseType: !6, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28}
!17 = !DIEnumerator(name: "_ISupper", value: 256, isUnsigned: true)
!18 = !DIEnumerator(name: "_ISlower", value: 512, isUnsigned: true)
!19 = !DIEnumerator(name: "_ISalpha", value: 1024, isUnsigned: true)
!20 = !DIEnumerator(name: "_ISdigit", value: 2048, isUnsigned: true)
!21 = !DIEnumerator(name: "_ISxdigit", value: 4096, isUnsigned: true)
!22 = !DIEnumerator(name: "_ISspace", value: 8192, isUnsigned: true)
!23 = !DIEnumerator(name: "_ISprint", value: 16384, isUnsigned: true)
!24 = !DIEnumerator(name: "_ISgraph", value: 32768, isUnsigned: true)
!25 = !DIEnumerator(name: "_ISblank", value: 1, isUnsigned: true)
!26 = !DIEnumerator(name: "_IScntrl", value: 2, isUnsigned: true)
!27 = !DIEnumerator(name: "_ISpunct", value: 4, isUnsigned: true)
!28 = !DIEnumerator(name: "_ISalnum", value: 8, isUnsigned: true)
!29 = !{!30, !31}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!32 = !{!33, !60, !0, !65, !70, !72, !85}
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "ctx", scope: !2, file: !3, line: 7, type: !35, isLocal: false, isDefinition: true)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "jmp_buf", file: !36, line: 45, baseType: !37)
!36 = !DIFile(filename: "/usr/include/setjmp.h", directory: "")
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 1600, elements: !58)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__jmp_buf_tag", file: !36, line: 33, size: 1600, elements: !39)
!39 = !{!40, !47, !48}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "__jmpbuf", scope: !38, file: !36, line: 39, baseType: !41, size: 512)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__jmp_buf", file: !42, line: 31, baseType: !43)
!42 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/setjmp.h", directory: "")
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 512, elements: !45)
!44 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!45 = !{!46}
!46 = !DISubrange(count: 8)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "__mask_was_saved", scope: !38, file: !36, line: 40, baseType: !30, size: 32, offset: 512)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "__saved_mask", scope: !38, file: !36, line: 41, baseType: !49, size: 1024, offset: 576)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sigset_t", file: !50, line: 8, baseType: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h", directory: "")
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !50, line: 5, size: 1024, elements: !52)
!52 = !{!53}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "__val", scope: !51, file: !50, line: 7, baseType: !54, size: 1024)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 1024, elements: !56)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !{!57}
!57 = !DISubrange(count: 16)
!58 = !{!59}
!59 = !DISubrange(count: 1)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(name: "msg", scope: !2, file: !3, line: 8, type: !62, isLocal: false, isDefinition: true)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "str", scope: !2, file: !3, line: 29, type: !67, isLocal: false, isDefinition: true)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 512, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 64)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "pos", scope: !2, file: !3, line: 30, type: !30, isLocal: false, isDefinition: true)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "pool", scope: !2, file: !3, line: 33, type: !74, isLocal: false, isDefinition: true)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !75, size: 2048, elements: !45)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "expr_t", file: !3, line: 12, baseType: !76)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "expr_t", file: !3, line: 13, size: 256, elements: !77)
!77 = !{!78, !79, !80, !81, !84}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "op", scope: !76, file: !3, line: 14, baseType: !30, size: 32)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !76, file: !3, line: 14, baseType: !30, size: 32, offset: 32)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "used", scope: !76, file: !3, line: 14, baseType: !30, size: 32, offset: 64)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "left", scope: !76, file: !3, line: 15, baseType: !82, size: 64, offset: 128)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "expr", file: !3, line: 12, baseType: !83)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "right", scope: !76, file: !3, line: 15, baseType: !82, size: 64, offset: 192)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(name: "pool_ptr", scope: !2, file: !3, line: 34, type: !30, isLocal: false, isDefinition: true)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !75, size: 1024, elements: !88)
!88 = !{!89}
!89 = !DISubrange(count: 4)
!90 = !{i32 7, !"Dwarf Version", i32 4}
!91 = !{i32 2, !"Debug Info Version", i32 3}
!92 = !{i32 1, !"wchar_size", i32 4}
!93 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!94 = distinct !DISubprogram(name: "gen_digits", scope: !3, file: !3, line: 21, type: !95, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!95 = !DISubroutineType(types: !96)
!96 = !{null}
!97 = !{}
!98 = !DILocalVariable(name: "i", scope: !94, file: !3, line: 23, type: !30)
!99 = !DILocation(line: 0, scope: !94)
!100 = !DILocation(line: 24, column: 7, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !3, line: 24, column: 2)
!102 = !DILocation(line: 0, scope: !101)
!103 = !DILocation(line: 24, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !3, line: 24, column: 2)
!105 = !DILocation(line: 24, column: 2, scope: !101)
!106 = !DILocation(line: 25, column: 23, scope: !104)
!107 = !DILocation(line: 25, column: 30, scope: !104)
!108 = !DILocation(line: 25, column: 21, scope: !104)
!109 = !DILocation(line: 25, column: 3, scope: !104)
!110 = !DILocation(line: 25, column: 13, scope: !104)
!111 = !DILocation(line: 25, column: 17, scope: !104)
!112 = !DILocation(line: 24, column: 29, scope: !104)
!113 = !DILocation(line: 24, column: 2, scope: !104)
!114 = distinct !{!114, !105, !115}
!115 = !DILocation(line: 25, column: 32, scope: !101)
!116 = !DILocation(line: 26, column: 1, scope: !94)
!117 = distinct !DISubprogram(name: "reset", scope: !3, file: !3, line: 36, type: !95, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!118 = !DILocation(line: 39, column: 6, scope: !117)
!119 = !DILocation(line: 40, column: 17, scope: !117)
!120 = !DILocation(line: 40, column: 11, scope: !117)
!121 = !DILocalVariable(name: "i", scope: !117, file: !3, line: 38, type: !30)
!122 = !DILocation(line: 0, scope: !117)
!123 = !DILocation(line: 41, column: 7, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !3, line: 41, column: 2)
!125 = !DILocation(line: 0, scope: !124)
!126 = !DILocation(line: 41, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 41, column: 2)
!128 = !DILocation(line: 41, column: 2, scope: !124)
!129 = !DILocation(line: 42, column: 3, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !3, line: 41, column: 34)
!131 = !DILocation(line: 42, column: 11, scope: !130)
!132 = !DILocation(line: 42, column: 14, scope: !130)
!133 = !DILocation(line: 43, column: 18, scope: !130)
!134 = !DILocation(line: 43, column: 26, scope: !130)
!135 = !DILocation(line: 43, column: 32, scope: !130)
!136 = !DILocation(line: 43, column: 3, scope: !130)
!137 = !DILocation(line: 43, column: 11, scope: !130)
!138 = !DILocation(line: 43, column: 16, scope: !130)
!139 = !DILocation(line: 44, column: 2, scope: !130)
!140 = !DILocation(line: 41, column: 30, scope: !127)
!141 = !DILocation(line: 41, column: 2, scope: !127)
!142 = distinct !{!142, !128, !143}
!143 = !DILocation(line: 44, column: 2, scope: !124)
!144 = !DILocation(line: 45, column: 7, scope: !145)
!145 = distinct !DILexicalBlock(scope: !117, file: !3, line: 45, column: 2)
!146 = !DILocation(line: 0, scope: !145)
!147 = !DILocation(line: 45, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !3, line: 45, column: 2)
!149 = !DILocation(line: 45, column: 2, scope: !145)
!150 = !DILocation(line: 46, column: 3, scope: !148)
!151 = !DILocation(line: 46, column: 13, scope: !148)
!152 = !DILocation(line: 46, column: 18, scope: !148)
!153 = !DILocation(line: 45, column: 29, scope: !148)
!154 = !DILocation(line: 45, column: 2, scope: !148)
!155 = distinct !{!155, !149, !156}
!156 = !DILocation(line: 46, column: 20, scope: !145)
!157 = !DILocation(line: 47, column: 1, scope: !117)
!158 = distinct !DISubprogram(name: "bail", scope: !3, file: !3, line: 50, type: !159, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!159 = !DISubroutineType(types: !160)
!160 = !{null, !62}
!161 = !DILocalVariable(name: "s", arg: 1, scope: !158, file: !3, line: 50, type: !62)
!162 = !DILocation(line: 0, scope: !158)
!163 = !DILocation(line: 52, column: 6, scope: !158)
!164 = !DILocation(line: 53, column: 2, scope: !158)
!165 = distinct !DISubprogram(name: "new_expr", scope: !3, file: !3, line: 56, type: !166, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!166 = !DISubroutineType(types: !167)
!167 = !{!82}
!168 = !DILocation(line: 58, column: 6, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !3, line: 58, column: 6)
!170 = !DILocation(line: 58, column: 15, scope: !169)
!171 = !DILocation(line: 58, column: 6, scope: !165)
!172 = !DILocation(line: 59, column: 25, scope: !169)
!173 = !DILocation(line: 59, column: 15, scope: !169)
!174 = !DILocation(line: 59, column: 3, scope: !169)
!175 = !DILocation(line: 60, column: 2, scope: !165)
!176 = !DILocation(line: 0, scope: !165)
!177 = !DILocation(line: 61, column: 1, scope: !165)
!178 = distinct !DISubprogram(name: "next_tok", scope: !3, file: !3, line: 64, type: !179, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!179 = !DISubroutineType(types: !180)
!180 = !{!30}
!181 = !DILocation(line: 66, column: 2, scope: !178)
!182 = !DILocation(line: 66, column: 9, scope: !178)
!183 = !DILocation(line: 66, column: 31, scope: !178)
!184 = distinct !{!184, !181, !183}
!185 = !DILocation(line: 67, column: 13, scope: !178)
!186 = !DILocation(line: 67, column: 9, scope: !178)
!187 = !DILocation(line: 67, column: 2, scope: !178)
!188 = distinct !DISubprogram(name: "take", scope: !3, file: !3, line: 71, type: !179, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!189 = !DILocation(line: 73, column: 10, scope: !190)
!190 = distinct !DILexicalBlock(scope: !188, file: !3, line: 73, column: 6)
!191 = !DILocation(line: 73, column: 6, scope: !190)
!192 = !DILocation(line: 73, column: 15, scope: !190)
!193 = !DILocation(line: 73, column: 6, scope: !188)
!194 = !DILocation(line: 73, column: 31, scope: !190)
!195 = !DILocation(line: 73, column: 24, scope: !190)
!196 = !DILocation(line: 74, column: 2, scope: !188)
!197 = !DILocation(line: 0, scope: !188)
!198 = !DILocation(line: 75, column: 1, scope: !188)
!199 = distinct !DISubprogram(name: "get_expr", scope: !3, file: !3, line: 88, type: !166, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!200 = !DILocation(line: 92, column: 14, scope: !201)
!201 = distinct !DILexicalBlock(scope: !199, file: !3, line: 92, column: 6)
!202 = !DILocalVariable(name: "ret", scope: !199, file: !3, line: 91, type: !82)
!203 = !DILocation(line: 0, scope: !199)
!204 = !DILocation(line: 92, column: 12, scope: !201)
!205 = !DILocation(line: 92, column: 6, scope: !199)
!206 = !DILocation(line: 92, column: 27, scope: !201)
!207 = !DILocation(line: 93, column: 2, scope: !199)
!208 = !DILocation(line: 93, column: 14, scope: !199)
!209 = !DILocalVariable(name: "c", scope: !199, file: !3, line: 90, type: !30)
!210 = !DILocation(line: 93, column: 26, scope: !199)
!211 = !DILocation(line: 93, column: 33, scope: !199)
!212 = !DILocation(line: 93, column: 38, scope: !199)
!213 = !DILocation(line: 94, column: 8, scope: !214)
!214 = distinct !DILexicalBlock(scope: !215, file: !3, line: 94, column: 7)
!215 = distinct !DILexicalBlock(scope: !199, file: !3, line: 93, column: 46)
!216 = !DILocation(line: 94, column: 7, scope: !215)
!217 = !DILocation(line: 94, column: 16, scope: !214)
!218 = !DILocation(line: 95, column: 13, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !3, line: 95, column: 7)
!220 = !DILocalVariable(name: "r", scope: !199, file: !3, line: 91, type: !82)
!221 = !DILocation(line: 95, column: 11, scope: !219)
!222 = !DILocation(line: 95, column: 7, scope: !215)
!223 = !DILocation(line: 95, column: 26, scope: !219)
!224 = !DILocalVariable(name: "l", scope: !199, file: !3, line: 91, type: !82)
!225 = !DILocation(line: 98, column: 9, scope: !215)
!226 = !DILocation(line: 99, column: 16, scope: !215)
!227 = !DILocation(line: 99, column: 13, scope: !215)
!228 = !DILocation(line: 99, column: 8, scope: !215)
!229 = !DILocation(line: 99, column: 11, scope: !215)
!230 = !DILocation(line: 100, column: 8, scope: !215)
!231 = !DILocation(line: 100, column: 13, scope: !215)
!232 = !DILocation(line: 101, column: 8, scope: !215)
!233 = !DILocation(line: 101, column: 14, scope: !215)
!234 = distinct !{!234, !207, !235}
!235 = !DILocation(line: 102, column: 2, scope: !199)
!236 = !DILocation(line: 103, column: 2, scope: !199)
!237 = distinct !DISubprogram(name: "get_term", scope: !3, file: !3, line: 106, type: !166, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!238 = !DILocation(line: 110, column: 8, scope: !237)
!239 = !DILocalVariable(name: "ret", scope: !237, file: !3, line: 109, type: !82)
!240 = !DILocation(line: 0, scope: !237)
!241 = !DILocation(line: 111, column: 2, scope: !237)
!242 = !DILocation(line: 111, column: 13, scope: !237)
!243 = !DILocalVariable(name: "c", scope: !237, file: !3, line: 108, type: !30)
!244 = !DILocation(line: 111, column: 25, scope: !237)
!245 = !DILocation(line: 111, column: 32, scope: !237)
!246 = !DILocation(line: 111, column: 37, scope: !237)
!247 = !DILocation(line: 112, column: 8, scope: !248)
!248 = distinct !DILexicalBlock(scope: !249, file: !3, line: 112, column: 7)
!249 = distinct !DILexicalBlock(scope: !237, file: !3, line: 111, column: 45)
!250 = !DILocation(line: 112, column: 7, scope: !249)
!251 = !DILocation(line: 112, column: 16, scope: !248)
!252 = !DILocation(line: 114, column: 7, scope: !249)
!253 = !DILocalVariable(name: "r", scope: !237, file: !3, line: 109, type: !82)
!254 = !DILocalVariable(name: "l", scope: !237, file: !3, line: 109, type: !82)
!255 = !DILocation(line: 116, column: 9, scope: !249)
!256 = !DILocation(line: 117, column: 16, scope: !249)
!257 = !DILocation(line: 117, column: 13, scope: !249)
!258 = !DILocation(line: 117, column: 8, scope: !249)
!259 = !DILocation(line: 117, column: 11, scope: !249)
!260 = !DILocation(line: 118, column: 8, scope: !249)
!261 = !DILocation(line: 118, column: 13, scope: !249)
!262 = !DILocation(line: 119, column: 8, scope: !249)
!263 = !DILocation(line: 119, column: 14, scope: !249)
!264 = distinct !{!264, !241, !265}
!265 = !DILocation(line: 120, column: 2, scope: !237)
!266 = !DILocation(line: 121, column: 2, scope: !237)
!267 = distinct !DISubprogram(name: "get_digit", scope: !3, file: !3, line: 124, type: !166, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!268 = !DILocation(line: 126, column: 13, scope: !267)
!269 = !DILocalVariable(name: "c", scope: !267, file: !3, line: 126, type: !30)
!270 = !DILocation(line: 0, scope: !267)
!271 = !DILocation(line: 128, column: 8, scope: !272)
!272 = distinct !DILexicalBlock(scope: !267, file: !3, line: 128, column: 6)
!273 = !DILocation(line: 128, column: 15, scope: !272)
!274 = !DILocation(line: 128, column: 20, scope: !272)
!275 = !DILocation(line: 128, column: 6, scope: !267)
!276 = !DILocation(line: 129, column: 3, scope: !277)
!277 = distinct !DILexicalBlock(scope: !272, file: !3, line: 128, column: 28)
!278 = !DILocation(line: 130, column: 9, scope: !277)
!279 = !DILocalVariable(name: "ret", scope: !267, file: !3, line: 127, type: !82)
!280 = !DILocation(line: 131, column: 8, scope: !277)
!281 = !DILocation(line: 131, column: 11, scope: !277)
!282 = !DILocation(line: 132, column: 16, scope: !277)
!283 = !DILocation(line: 132, column: 8, scope: !277)
!284 = !DILocation(line: 132, column: 12, scope: !277)
!285 = !DILocalVariable(name: "i", scope: !267, file: !3, line: 126, type: !30)
!286 = !DILocation(line: 133, column: 8, scope: !287)
!287 = distinct !DILexicalBlock(scope: !277, file: !3, line: 133, column: 3)
!288 = !DILocation(line: 0, scope: !287)
!289 = !DILocation(line: 133, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !3, line: 133, column: 3)
!291 = !DILocation(line: 133, column: 3, scope: !287)
!292 = !DILocation(line: 134, column: 8, scope: !293)
!293 = distinct !DILexicalBlock(scope: !290, file: !3, line: 134, column: 8)
!294 = !DILocation(line: 134, column: 18, scope: !293)
!295 = !DILocation(line: 134, column: 30, scope: !293)
!296 = !DILocation(line: 134, column: 22, scope: !293)
!297 = !DILocation(line: 134, column: 34, scope: !293)
!298 = !DILocation(line: 134, column: 38, scope: !293)
!299 = !DILocation(line: 134, column: 48, scope: !293)
!300 = !DILocation(line: 134, column: 8, scope: !290)
!301 = !DILocation(line: 135, column: 5, scope: !302)
!302 = distinct !DILexicalBlock(scope: !293, file: !3, line: 134, column: 54)
!303 = !DILocation(line: 135, column: 15, scope: !302)
!304 = !DILocation(line: 135, column: 20, scope: !302)
!305 = !DILocation(line: 136, column: 5, scope: !302)
!306 = !DILocation(line: 133, column: 30, scope: !290)
!307 = !DILocation(line: 133, column: 3, scope: !290)
!308 = distinct !{!308, !291, !309}
!309 = !DILocation(line: 137, column: 4, scope: !287)
!310 = !DILocation(line: 138, column: 3, scope: !277)
!311 = !DILocation(line: 139, column: 2, scope: !277)
!312 = !DILocation(line: 140, column: 2, scope: !267)
!313 = !DILocation(line: 141, column: 1, scope: !267)
!314 = distinct !DISubprogram(name: "get_fact", scope: !3, file: !3, line: 143, type: !166, scopeLine: 144, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!315 = !DILocation(line: 146, column: 11, scope: !314)
!316 = !DILocalVariable(name: "l", scope: !314, file: !3, line: 146, type: !82)
!317 = !DILocation(line: 0, scope: !314)
!318 = !DILocation(line: 147, column: 6, scope: !319)
!319 = distinct !DILexicalBlock(scope: !314, file: !3, line: 147, column: 6)
!320 = !DILocation(line: 147, column: 6, scope: !314)
!321 = !DILocation(line: 147, column: 9, scope: !319)
!322 = !DILocation(line: 148, column: 11, scope: !323)
!323 = distinct !DILexicalBlock(scope: !314, file: !3, line: 148, column: 6)
!324 = !DILocalVariable(name: "c", scope: !314, file: !3, line: 145, type: !30)
!325 = !DILocation(line: 148, column: 23, scope: !323)
!326 = !DILocation(line: 148, column: 6, scope: !314)
!327 = !DILocation(line: 149, column: 3, scope: !328)
!328 = distinct !DILexicalBlock(scope: !323, file: !3, line: 148, column: 31)
!329 = !DILocation(line: 150, column: 7, scope: !328)
!330 = !DILocation(line: 151, column: 7, scope: !331)
!331 = distinct !DILexicalBlock(scope: !328, file: !3, line: 151, column: 7)
!332 = !DILocation(line: 151, column: 18, scope: !331)
!333 = !DILocation(line: 151, column: 7, scope: !328)
!334 = !DILocation(line: 151, column: 26, scope: !331)
!335 = !DILocation(line: 152, column: 3, scope: !328)
!336 = !DILocation(line: 153, column: 3, scope: !328)
!337 = !DILocation(line: 155, column: 2, scope: !314)
!338 = !DILocation(line: 156, column: 1, scope: !314)
!339 = distinct !DISubprogram(name: "parse", scope: !3, file: !3, line: 158, type: !166, scopeLine: 159, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!340 = !DILocation(line: 161, column: 13, scope: !339)
!341 = !DILocalVariable(name: "ret", scope: !339, file: !3, line: 161, type: !82)
!342 = !DILocation(line: 0, scope: !339)
!343 = !DILocation(line: 162, column: 6, scope: !344)
!344 = distinct !DILexicalBlock(scope: !339, file: !3, line: 162, column: 6)
!345 = !DILocation(line: 162, column: 17, scope: !344)
!346 = !DILocation(line: 162, column: 6, scope: !339)
!347 = !DILocation(line: 163, column: 3, scope: !344)
!348 = !DILocalVariable(name: "i", scope: !339, file: !3, line: 160, type: !30)
!349 = !DILocation(line: 164, column: 7, scope: !350)
!350 = distinct !DILexicalBlock(scope: !339, file: !3, line: 164, column: 2)
!351 = !DILocation(line: 0, scope: !350)
!352 = !DILocation(line: 164, column: 16, scope: !353)
!353 = distinct !DILexicalBlock(scope: !350, file: !3, line: 164, column: 2)
!354 = !DILocation(line: 164, column: 2, scope: !350)
!355 = !DILocation(line: 165, column: 8, scope: !356)
!356 = distinct !DILexicalBlock(scope: !353, file: !3, line: 165, column: 7)
!357 = !DILocation(line: 165, column: 18, scope: !356)
!358 = !DILocation(line: 165, column: 7, scope: !353)
!359 = !DILocation(line: 166, column: 4, scope: !356)
!360 = !DILocation(line: 164, column: 29, scope: !353)
!361 = !DILocation(line: 164, column: 2, scope: !353)
!362 = distinct !{!362, !354, !363}
!363 = !DILocation(line: 166, column: 34, scope: !350)
!364 = !DILocation(line: 167, column: 2, scope: !339)
!365 = distinct !DISubprogram(name: "gcd", scope: !3, file: !3, line: 173, type: !366, scopeLine: 174, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!366 = !DISubroutineType(types: !367)
!367 = !{!30, !30, !30}
!368 = !DILocalVariable(name: "m", arg: 1, scope: !365, file: !3, line: 173, type: !30)
!369 = !DILocation(line: 0, scope: !365)
!370 = !DILocalVariable(name: "n", arg: 2, scope: !365, file: !3, line: 173, type: !30)
!371 = !DILocation(line: 176, column: 2, scope: !365)
!372 = !DILocalVariable(name: "t", scope: !365, file: !3, line: 175, type: !30)
!373 = !DILocation(line: 177, column: 16, scope: !374)
!374 = distinct !DILexicalBlock(scope: !365, file: !3, line: 176, column: 12)
!375 = distinct !{!375, !371, !376}
!376 = !DILocation(line: 178, column: 2, scope: !365)
!377 = !DILocation(line: 179, column: 2, scope: !365)
!378 = distinct !DISubprogram(name: "eval_tree", scope: !3, file: !3, line: 183, type: !379, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!379 = !DISubroutineType(types: !380)
!380 = !{null, !82, !381}
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac", file: !3, line: 170, baseType: !382)
!382 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !383, size: 64)
!383 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "frac_t", file: !3, line: 171, size: 64, elements: !384)
!384 = !{!385, !386}
!385 = !DIDerivedType(tag: DW_TAG_member, name: "denom", scope: !383, file: !3, line: 171, baseType: !30, size: 32)
!386 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !383, file: !3, line: 171, baseType: !30, size: 32, offset: 32)
!387 = !DILocalVariable(name: "e", arg: 1, scope: !378, file: !3, line: 183, type: !82)
!388 = !DILocation(line: 0, scope: !378)
!389 = !DILocalVariable(name: "res", arg: 2, scope: !378, file: !3, line: 183, type: !381)
!390 = !DILocalVariable(name: "l", scope: !378, file: !3, line: 185, type: !391)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac_t", file: !3, line: 170, baseType: !383)
!392 = !DILocation(line: 185, column: 9, scope: !378)
!393 = !DILocalVariable(name: "r", scope: !378, file: !3, line: 185, type: !391)
!394 = !DILocation(line: 185, column: 12, scope: !378)
!395 = !DILocation(line: 187, column: 9, scope: !396)
!396 = distinct !DILexicalBlock(scope: !378, file: !3, line: 187, column: 6)
!397 = !DILocation(line: 187, column: 12, scope: !396)
!398 = !DILocation(line: 187, column: 6, scope: !378)
!399 = !DILocation(line: 188, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !3, line: 187, column: 23)
!401 = !DILocation(line: 188, column: 8, scope: !400)
!402 = !DILocation(line: 188, column: 12, scope: !400)
!403 = !DILocation(line: 189, column: 8, scope: !400)
!404 = !DILocation(line: 189, column: 14, scope: !400)
!405 = !DILocation(line: 190, column: 3, scope: !400)
!406 = !DILocation(line: 193, column: 15, scope: !378)
!407 = !DILocation(line: 193, column: 2, scope: !378)
!408 = !DILocation(line: 194, column: 15, scope: !378)
!409 = !DILocation(line: 194, column: 2, scope: !378)
!410 = !DILocation(line: 196, column: 12, scope: !378)
!411 = !DILocation(line: 196, column: 2, scope: !378)
!412 = !DILocation(line: 198, column: 16, scope: !413)
!413 = distinct !DILexicalBlock(scope: !378, file: !3, line: 196, column: 16)
!414 = !DILocation(line: 198, column: 24, scope: !413)
!415 = !DILocation(line: 198, column: 20, scope: !413)
!416 = !DILocation(line: 198, column: 34, scope: !413)
!417 = !DILocation(line: 198, column: 44, scope: !413)
!418 = !DILocation(line: 198, column: 40, scope: !413)
!419 = !DILocation(line: 198, column: 30, scope: !413)
!420 = !DILocation(line: 198, column: 8, scope: !413)
!421 = !DILocation(line: 198, column: 12, scope: !413)
!422 = !DILocation(line: 199, column: 18, scope: !413)
!423 = !DILocation(line: 199, column: 28, scope: !413)
!424 = !DILocation(line: 199, column: 24, scope: !413)
!425 = !DILocation(line: 199, column: 8, scope: !413)
!426 = !DILocation(line: 199, column: 14, scope: !413)
!427 = !DILocation(line: 200, column: 3, scope: !413)
!428 = !DILocation(line: 202, column: 16, scope: !413)
!429 = !DILocation(line: 202, column: 24, scope: !413)
!430 = !DILocation(line: 202, column: 20, scope: !413)
!431 = !DILocation(line: 202, column: 34, scope: !413)
!432 = !DILocation(line: 202, column: 44, scope: !413)
!433 = !DILocation(line: 202, column: 40, scope: !413)
!434 = !DILocation(line: 202, column: 30, scope: !413)
!435 = !DILocation(line: 202, column: 8, scope: !413)
!436 = !DILocation(line: 202, column: 12, scope: !413)
!437 = !DILocation(line: 203, column: 18, scope: !413)
!438 = !DILocation(line: 203, column: 28, scope: !413)
!439 = !DILocation(line: 203, column: 24, scope: !413)
!440 = !DILocation(line: 203, column: 8, scope: !413)
!441 = !DILocation(line: 203, column: 14, scope: !413)
!442 = !DILocation(line: 204, column: 3, scope: !413)
!443 = !DILocation(line: 206, column: 16, scope: !413)
!444 = !DILocation(line: 206, column: 24, scope: !413)
!445 = !DILocation(line: 206, column: 20, scope: !413)
!446 = !DILocation(line: 206, column: 8, scope: !413)
!447 = !DILocation(line: 206, column: 12, scope: !413)
!448 = !DILocation(line: 207, column: 18, scope: !413)
!449 = !DILocation(line: 207, column: 28, scope: !413)
!450 = !DILocation(line: 207, column: 24, scope: !413)
!451 = !DILocation(line: 207, column: 8, scope: !413)
!452 = !DILocation(line: 207, column: 14, scope: !413)
!453 = !DILocation(line: 208, column: 3, scope: !413)
!454 = !DILocation(line: 210, column: 16, scope: !413)
!455 = !DILocation(line: 210, column: 24, scope: !413)
!456 = !DILocation(line: 210, column: 20, scope: !413)
!457 = !DILocation(line: 210, column: 8, scope: !413)
!458 = !DILocation(line: 210, column: 12, scope: !413)
!459 = !DILocation(line: 211, column: 18, scope: !413)
!460 = !DILocation(line: 211, column: 28, scope: !413)
!461 = !DILocation(line: 211, column: 24, scope: !413)
!462 = !DILocation(line: 211, column: 8, scope: !413)
!463 = !DILocation(line: 211, column: 14, scope: !413)
!464 = !DILocation(line: 212, column: 3, scope: !413)
!465 = !DILocation(line: 214, column: 20, scope: !466)
!466 = distinct !DILexicalBlock(scope: !378, file: !3, line: 214, column: 6)
!467 = !DILocation(line: 214, column: 32, scope: !466)
!468 = !DILocation(line: 214, column: 11, scope: !466)
!469 = !DILocalVariable(name: "t", scope: !378, file: !3, line: 186, type: !30)
!470 = !DILocation(line: 214, column: 9, scope: !466)
!471 = !DILocation(line: 214, column: 6, scope: !378)
!472 = !DILocation(line: 215, column: 8, scope: !473)
!473 = distinct !DILexicalBlock(scope: !466, file: !3, line: 214, column: 39)
!474 = !DILocation(line: 215, column: 14, scope: !473)
!475 = !DILocation(line: 216, column: 8, scope: !473)
!476 = !DILocation(line: 216, column: 12, scope: !473)
!477 = !DILocation(line: 217, column: 2, scope: !473)
!478 = !DILocation(line: 218, column: 1, scope: !378)
!479 = distinct !DISubprogram(name: "get_input", scope: !3, file: !3, line: 220, type: !95, scopeLine: 221, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!480 = !DILocation(line: 222, column: 2, scope: !479)
!481 = !DILabel(scope: !479, name: "reinput", file: !3, line: 223)
!482 = !DILocation(line: 223, column: 1, scope: !479)
!483 = !DILocation(line: 224, column: 2, scope: !479)
!484 = !DILocation(line: 225, column: 2, scope: !479)
!485 = !DILocalVariable(name: "i", scope: !479, file: !3, line: 222, type: !30)
!486 = !DILocation(line: 0, scope: !479)
!487 = !DILocation(line: 226, column: 7, scope: !488)
!488 = distinct !DILexicalBlock(scope: !479, file: !3, line: 226, column: 2)
!489 = !DILocation(line: 0, scope: !488)
!490 = !DILocation(line: 226, column: 16, scope: !491)
!491 = distinct !DILexicalBlock(scope: !488, file: !3, line: 226, column: 2)
!492 = !DILocation(line: 226, column: 2, scope: !488)
!493 = !DILocation(line: 227, column: 17, scope: !491)
!494 = !DILocation(line: 227, column: 27, scope: !491)
!495 = !DILocation(line: 227, column: 3, scope: !491)
!496 = !DILocation(line: 226, column: 29, scope: !491)
!497 = !DILocation(line: 226, column: 2, scope: !491)
!498 = distinct !{!498, !492, !499}
!499 = !DILocation(line: 227, column: 30, scope: !488)
!500 = !DILocation(line: 228, column: 2, scope: !479)
!501 = !DILocation(line: 231, column: 2, scope: !479)
!502 = !DILocation(line: 232, column: 8, scope: !503)
!503 = distinct !DILexicalBlock(scope: !504, file: !3, line: 232, column: 3)
!504 = distinct !DILexicalBlock(scope: !479, file: !3, line: 231, column: 12)
!505 = !DILocation(line: 0, scope: !503)
!506 = !DILocation(line: 232, column: 17, scope: !507)
!507 = distinct !DILexicalBlock(scope: !503, file: !3, line: 232, column: 3)
!508 = !DILocation(line: 232, column: 3, scope: !503)
!509 = !DILocation(line: 232, column: 35, scope: !507)
!510 = !DILocation(line: 232, column: 42, scope: !507)
!511 = !DILocation(line: 232, column: 31, scope: !507)
!512 = !DILocation(line: 232, column: 3, scope: !507)
!513 = distinct !{!513, !508, !514}
!514 = !DILocation(line: 232, column: 44, scope: !503)
!515 = !DILocation(line: 233, column: 25, scope: !504)
!516 = !DILocation(line: 233, column: 3, scope: !504)
!517 = !DILocation(line: 234, column: 7, scope: !518)
!518 = distinct !DILexicalBlock(scope: !504, file: !3, line: 234, column: 7)
!519 = !DILocation(line: 234, column: 12, scope: !518)
!520 = !DILocation(line: 234, column: 7, scope: !504)
!521 = !DILocation(line: 234, column: 21, scope: !518)
!522 = !DILocation(line: 235, column: 7, scope: !523)
!523 = distinct !DILexicalBlock(scope: !504, file: !3, line: 235, column: 7)
!524 = !DILocation(line: 235, column: 26, scope: !523)
!525 = !DILocation(line: 235, column: 7, scope: !504)
!526 = !DILocation(line: 236, column: 4, scope: !523)
!527 = !DILocation(line: 238, column: 8, scope: !528)
!528 = distinct !DILexicalBlock(scope: !504, file: !3, line: 238, column: 3)
!529 = !DILocation(line: 0, scope: !528)
!530 = !DILocation(line: 238, column: 17, scope: !531)
!531 = distinct !DILexicalBlock(scope: !528, file: !3, line: 238, column: 3)
!532 = !DILocation(line: 238, column: 3, scope: !528)
!533 = !DILocation(line: 239, column: 8, scope: !534)
!534 = distinct !DILexicalBlock(scope: !531, file: !3, line: 239, column: 8)
!535 = !DILocation(line: 239, column: 15, scope: !534)
!536 = !DILocation(line: 239, column: 8, scope: !531)
!537 = !DILocation(line: 239, column: 24, scope: !534)
!538 = !DILocation(line: 239, column: 31, scope: !534)
!539 = !DILocation(line: 239, column: 18, scope: !534)
!540 = !DILocation(line: 238, column: 31, scope: !531)
!541 = !DILocation(line: 238, column: 3, scope: !531)
!542 = distinct !{!542, !532, !543}
!543 = !DILocation(line: 239, column: 33, scope: !528)
!544 = !DILocation(line: 240, column: 7, scope: !545)
!545 = distinct !DILexicalBlock(scope: !504, file: !3, line: 240, column: 7)
!546 = !DILocation(line: 240, column: 14, scope: !545)
!547 = !DILocation(line: 240, column: 7, scope: !504)
!548 = !DILocation(line: 241, column: 4, scope: !549)
!549 = distinct !DILexicalBlock(scope: !545, file: !3, line: 240, column: 22)
!550 = !DILocation(line: 242, column: 4, scope: !549)
!551 = !DILocation(line: 244, column: 7, scope: !552)
!552 = distinct !DILexicalBlock(scope: !504, file: !3, line: 244, column: 7)
!553 = !DILocation(line: 244, column: 14, scope: !552)
!554 = !DILocation(line: 244, column: 7, scope: !504)
!555 = !DILocation(line: 245, column: 4, scope: !556)
!556 = distinct !DILexicalBlock(scope: !552, file: !3, line: 244, column: 22)
!557 = !DILocation(line: 246, column: 4, scope: !556)
!558 = !DILocation(line: 248, column: 3, scope: !504)
!559 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 252, type: !179, scopeLine: 253, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!560 = !DILocalVariable(name: "f", scope: !559, file: !3, line: 254, type: !391)
!561 = !DILocation(line: 254, column: 9, scope: !559)
!562 = !DILocation(line: 255, column: 8, scope: !559)
!563 = !DILocation(line: 255, column: 2, scope: !559)
!564 = !DILocation(line: 257, column: 2, scope: !559)
!565 = !DILocation(line: 258, column: 2, scope: !559)
!566 = !DILocation(line: 259, column: 3, scope: !567)
!567 = distinct !DILexicalBlock(scope: !559, file: !3, line: 258, column: 11)
!568 = !DILocation(line: 260, column: 3, scope: !567)
!569 = !DILocation(line: 261, column: 7, scope: !570)
!570 = distinct !DILexicalBlock(scope: !567, file: !3, line: 261, column: 7)
!571 = !DILocation(line: 261, column: 7, scope: !567)
!572 = !DILocation(line: 263, column: 29, scope: !573)
!573 = distinct !DILexicalBlock(scope: !570, file: !3, line: 261, column: 12)
!574 = !DILocation(line: 263, column: 34, scope: !573)
!575 = !DILocation(line: 263, column: 4, scope: !573)
!576 = !DILocation(line: 264, column: 4, scope: !573)
!577 = distinct !{!577, !565, !578}
!578 = !DILocation(line: 279, column: 2, scope: !559)
!579 = !DILocation(line: 267, column: 13, scope: !567)
!580 = !DILocation(line: 267, column: 3, scope: !567)
!581 = !DILocation(line: 269, column: 9, scope: !582)
!582 = distinct !DILexicalBlock(scope: !567, file: !3, line: 269, column: 7)
!583 = !DILocation(line: 269, column: 15, scope: !582)
!584 = !DILocation(line: 269, column: 7, scope: !567)
!585 = !DILocation(line: 269, column: 21, scope: !582)
!586 = !DILocation(line: 270, column: 9, scope: !587)
!587 = distinct !DILexicalBlock(scope: !567, file: !3, line: 270, column: 7)
!588 = !DILocation(line: 270, column: 15, scope: !587)
!589 = !DILocation(line: 270, column: 20, scope: !587)
!590 = !DILocation(line: 270, column: 25, scope: !587)
!591 = !DILocation(line: 270, column: 29, scope: !587)
!592 = !DILocation(line: 270, column: 7, scope: !567)
!593 = !DILocation(line: 271, column: 4, scope: !587)
!594 = !DILocation(line: 273, column: 10, scope: !595)
!595 = distinct !DILexicalBlock(scope: !596, file: !3, line: 273, column: 8)
!596 = distinct !DILexicalBlock(scope: !587, file: !3, line: 272, column: 8)
!597 = !DILocation(line: 273, column: 16, scope: !595)
!598 = !DILocation(line: 273, column: 8, scope: !596)
!599 = !DILocation(line: 274, column: 31, scope: !595)
!600 = !DILocation(line: 274, column: 5, scope: !595)
!601 = !DILocation(line: 276, column: 34, scope: !595)
!602 = !DILocation(line: 276, column: 41, scope: !595)
!603 = !DILocation(line: 276, column: 5, scope: !595)
!604 = !DILocation(line: 277, column: 4, scope: !596)
