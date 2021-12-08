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
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 0, i32* %i, align 4, !dbg !100
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !103
  %cmp = icmp slt i32 %0, 4, !dbg !105
  br i1 %cmp, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand() #7, !dbg !107
  %rem = srem i32 %call, 9, !dbg !108
  %add = add nsw i32 1, %rem, !dbg !109
  %1 = load i32, i32* %i, align 4, !dbg !110
  %idxprom = sext i32 %1 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !111
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 1, !dbg !112
  store i32 %add, i32* %val, align 4, !dbg !113
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !114
  %inc = add nsw i32 %2, 1, !dbg !114
  store i32 %inc, i32* %i, align 4, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  ret void, !dbg !118
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @reset() #0 !dbg !119 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !120, metadata !DIExpression()), !dbg !121
  store i8* null, i8** @msg, align 8, !dbg !122
  store i32 0, i32* @pos, align 4, !dbg !123
  store i32 0, i32* @pool_ptr, align 4, !dbg !124
  store i32 0, i32* %i, align 4, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !128
  %cmp = icmp slt i32 %0, 8, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !132
  %idxprom = sext i32 %1 to i64, !dbg !134
  %arrayidx = getelementptr inbounds [8 x %struct.expr_t], [8 x %struct.expr_t]* @pool, i64 0, i64 %idxprom, !dbg !134
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 0, !dbg !135
  store i32 0, i32* %op, align 16, !dbg !136
  %2 = load i32, i32* %i, align 4, !dbg !137
  %idxprom1 = sext i32 %2 to i64, !dbg !138
  %arrayidx2 = getelementptr inbounds [8 x %struct.expr_t], [8 x %struct.expr_t]* @pool, i64 0, i64 %idxprom1, !dbg !138
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx2, i32 0, i32 4, !dbg !139
  store %struct.expr_t* null, %struct.expr_t** %right, align 8, !dbg !140
  %3 = load i32, i32* %i, align 4, !dbg !141
  %idxprom3 = sext i32 %3 to i64, !dbg !142
  %arrayidx4 = getelementptr inbounds [8 x %struct.expr_t], [8 x %struct.expr_t]* @pool, i64 0, i64 %idxprom3, !dbg !142
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx4, i32 0, i32 3, !dbg !143
  store %struct.expr_t* null, %struct.expr_t** %left, align 16, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !146
  %inc = add nsw i32 %4, 1, !dbg !146
  store i32 %inc, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !150
  br label %for.cond5, !dbg !152

for.cond5:                                        ; preds = %for.inc10, %for.end
  %5 = load i32, i32* %i, align 4, !dbg !153
  %cmp6 = icmp slt i32 %5, 4, !dbg !155
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !156

for.body7:                                        ; preds = %for.cond5
  %6 = load i32, i32* %i, align 4, !dbg !157
  %idxprom8 = sext i32 %6 to i64, !dbg !158
  %arrayidx9 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom8, !dbg !158
  %used = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx9, i32 0, i32 2, !dbg !159
  store i32 0, i32* %used, align 8, !dbg !160
  br label %for.inc10, !dbg !158

for.inc10:                                        ; preds = %for.body7
  %7 = load i32, i32* %i, align 4, !dbg !161
  %inc11 = add nsw i32 %7, 1, !dbg !161
  store i32 %inc11, i32* %i, align 4, !dbg !161
  br label %for.cond5, !dbg !162, !llvm.loop !163

for.end12:                                        ; preds = %for.cond5
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @bail(i8* %s) #0 !dbg !166 {
entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !169, metadata !DIExpression()), !dbg !170
  %0 = load i8*, i8** %s.addr, align 8, !dbg !171
  store i8* %0, i8** @msg, align 8, !dbg !172
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ctx, i64 0, i64 0), i32 1) #8, !dbg !173
  unreachable, !dbg !173
}

; Function Attrs: noreturn nounwind
declare dso_local void @longjmp(%struct.__jmp_buf_tag*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @new_expr() #0 !dbg !174 {
entry:
  %retval = alloca %struct.expr_t*, align 8
  %0 = load i32, i32* @pool_ptr, align 4, !dbg !177
  %cmp = icmp slt i32 %0, 8, !dbg !179
  br i1 %cmp, label %if.then, label %if.end, !dbg !180

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @pool_ptr, align 4, !dbg !181
  %inc = add nsw i32 %1, 1, !dbg !181
  store i32 %inc, i32* @pool_ptr, align 4, !dbg !181
  %idx.ext = sext i32 %1 to i64, !dbg !182
  %add.ptr = getelementptr inbounds %struct.expr_t, %struct.expr_t* getelementptr inbounds ([8 x %struct.expr_t], [8 x %struct.expr_t]* @pool, i64 0, i64 0), i64 %idx.ext, !dbg !182
  store %struct.expr_t* %add.ptr, %struct.expr_t** %retval, align 8, !dbg !183
  br label %return, !dbg !183

if.end:                                           ; preds = %entry
  store %struct.expr_t* null, %struct.expr_t** %retval, align 8, !dbg !184
  br label %return, !dbg !184

return:                                           ; preds = %if.end, %if.then
  %2 = load %struct.expr_t*, %struct.expr_t** %retval, align 8, !dbg !185
  ret %struct.expr_t* %2, !dbg !185
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @next_tok() #0 !dbg !186 {
entry:
  br label %while.cond, !dbg !189

while.cond:                                       ; preds = %while.body, %entry
  %call = call i16** @__ctype_b_loc() #9, !dbg !190
  %0 = load i16*, i16** %call, align 8, !dbg !190
  %1 = load i32, i32* @pos, align 4, !dbg !190
  %idxprom = sext i32 %1 to i64, !dbg !190
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom, !dbg !190
  %2 = load i8, i8* %arrayidx, align 1, !dbg !190
  %conv = sext i8 %2 to i32, !dbg !190
  %idxprom1 = sext i32 %conv to i64, !dbg !190
  %arrayidx2 = getelementptr inbounds i16, i16* %0, i64 %idxprom1, !dbg !190
  %3 = load i16, i16* %arrayidx2, align 2, !dbg !190
  %conv3 = zext i16 %3 to i32, !dbg !190
  %and = and i32 %conv3, 8192, !dbg !190
  %tobool = icmp ne i32 %and, 0, !dbg !189
  br i1 %tobool, label %while.body, label %while.end, !dbg !189

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* @pos, align 4, !dbg !191
  %inc = add nsw i32 %4, 1, !dbg !191
  store i32 %inc, i32* @pos, align 4, !dbg !191
  br label %while.cond, !dbg !189, !llvm.loop !192

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* @pos, align 4, !dbg !193
  %idxprom4 = sext i32 %5 to i64, !dbg !194
  %arrayidx5 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom4, !dbg !194
  %6 = load i8, i8* %arrayidx5, align 1, !dbg !194
  %conv6 = sext i8 %6 to i32, !dbg !194
  ret i32 %conv6, !dbg !195
}

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @take() #0 !dbg !196 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @pos, align 4, !dbg !197
  %idxprom = sext i32 %0 to i64, !dbg !199
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom, !dbg !199
  %1 = load i8, i8* %arrayidx, align 1, !dbg !199
  %conv = sext i8 %1 to i32, !dbg !199
  %cmp = icmp ne i32 %conv, 0, !dbg !200
  br i1 %cmp, label %if.then, label %if.end, !dbg !201

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @pos, align 4, !dbg !202
  %inc = add nsw i32 %2, 1, !dbg !202
  store i32 %inc, i32* @pos, align 4, !dbg !202
  store i32 %inc, i32* %retval, align 4, !dbg !203
  br label %return, !dbg !203

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !204
  br label %return, !dbg !204

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !205
  ret i32 %3, !dbg !205
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_expr() #0 !dbg !206 {
entry:
  %c = alloca i32, align 4
  %l = alloca %struct.expr_t*, align 8
  %r = alloca %struct.expr_t*, align 8
  %ret = alloca %struct.expr_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %c, metadata !207, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata %struct.expr_t** %l, metadata !209, metadata !DIExpression()), !dbg !210
  call void @llvm.dbg.declare(metadata %struct.expr_t** %r, metadata !211, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.declare(metadata %struct.expr_t** %ret, metadata !213, metadata !DIExpression()), !dbg !214
  %call = call %struct.expr_t* @get_term(), !dbg !215
  store %struct.expr_t* %call, %struct.expr_t** %ret, align 8, !dbg !217
  %tobool = icmp ne %struct.expr_t* %call, null, !dbg !217
  br i1 %tobool, label %if.end, label %if.then, !dbg !218

if.then:                                          ; preds = %entry
  call void @bail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0)), !dbg !219
  br label %if.end, !dbg !219

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !220

while.cond:                                       ; preds = %if.end10, %if.end
  %call1 = call i32 @next_tok(), !dbg !221
  store i32 %call1, i32* %c, align 4, !dbg !222
  %cmp = icmp eq i32 %call1, 43, !dbg !223
  br i1 %cmp, label %lor.end, label %lor.rhs, !dbg !224

lor.rhs:                                          ; preds = %while.cond
  %0 = load i32, i32* %c, align 4, !dbg !225
  %cmp2 = icmp eq i32 %0, 45, !dbg !226
  br label %lor.end, !dbg !224

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %1 = phi i1 [ true, %while.cond ], [ %cmp2, %lor.rhs ]
  br i1 %1, label %while.body, label %while.end, !dbg !220

while.body:                                       ; preds = %lor.end
  %call3 = call i32 @take(), !dbg !227
  %tobool4 = icmp ne i32 %call3, 0, !dbg !227
  br i1 %tobool4, label %if.end6, label %if.then5, !dbg !230

if.then5:                                         ; preds = %while.body
  call void @bail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0)), !dbg !231
  br label %if.end6, !dbg !231

if.end6:                                          ; preds = %if.then5, %while.body
  %call7 = call %struct.expr_t* @get_term(), !dbg !232
  store %struct.expr_t* %call7, %struct.expr_t** %r, align 8, !dbg !234
  %tobool8 = icmp ne %struct.expr_t* %call7, null, !dbg !234
  br i1 %tobool8, label %if.end10, label %if.then9, !dbg !235

if.then9:                                         ; preds = %if.end6
  call void @bail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0)), !dbg !236
  br label %if.end10, !dbg !236

if.end10:                                         ; preds = %if.then9, %if.end6
  %2 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !237
  store %struct.expr_t* %2, %struct.expr_t** %l, align 8, !dbg !238
  %call11 = call %struct.expr_t* @new_expr(), !dbg !239
  store %struct.expr_t* %call11, %struct.expr_t** %ret, align 8, !dbg !240
  %3 = load i32, i32* %c, align 4, !dbg !241
  %cmp12 = icmp eq i32 %3, 43, !dbg !242
  %4 = zext i1 %cmp12 to i64, !dbg !243
  %cond = select i1 %cmp12, i32 2, i32 3, !dbg !243
  %5 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !244
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %5, i32 0, i32 0, !dbg !245
  store i32 %cond, i32* %op, align 8, !dbg !246
  %6 = load %struct.expr_t*, %struct.expr_t** %l, align 8, !dbg !247
  %7 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !248
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %7, i32 0, i32 3, !dbg !249
  store %struct.expr_t* %6, %struct.expr_t** %left, align 8, !dbg !250
  %8 = load %struct.expr_t*, %struct.expr_t** %r, align 8, !dbg !251
  %9 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !252
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %9, i32 0, i32 4, !dbg !253
  store %struct.expr_t* %8, %struct.expr_t** %right, align 8, !dbg !254
  br label %while.cond, !dbg !220, !llvm.loop !255

while.end:                                        ; preds = %lor.end
  %10 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !257
  ret %struct.expr_t* %10, !dbg !258
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_term() #0 !dbg !259 {
entry:
  %c = alloca i32, align 4
  %l = alloca %struct.expr_t*, align 8
  %r = alloca %struct.expr_t*, align 8
  %ret = alloca %struct.expr_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %c, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata %struct.expr_t** %l, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata %struct.expr_t** %r, metadata !264, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.declare(metadata %struct.expr_t** %ret, metadata !266, metadata !DIExpression()), !dbg !267
  %call = call %struct.expr_t* @get_fact(), !dbg !268
  store %struct.expr_t* %call, %struct.expr_t** %ret, align 8, !dbg !269
  br label %while.cond, !dbg !270

while.cond:                                       ; preds = %if.end, %entry
  %call1 = call i32 @next_tok(), !dbg !271
  store i32 %call1, i32* %c, align 4, !dbg !272
  %cmp = icmp eq i32 %call1, 42, !dbg !273
  br i1 %cmp, label %lor.end, label %lor.rhs, !dbg !274

lor.rhs:                                          ; preds = %while.cond
  %0 = load i32, i32* %c, align 4, !dbg !275
  %cmp2 = icmp eq i32 %0, 47, !dbg !276
  br label %lor.end, !dbg !274

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %1 = phi i1 [ true, %while.cond ], [ %cmp2, %lor.rhs ]
  br i1 %1, label %while.body, label %while.end, !dbg !270

while.body:                                       ; preds = %lor.end
  %call3 = call i32 @take(), !dbg !277
  %tobool = icmp ne i32 %call3, 0, !dbg !277
  br i1 %tobool, label %if.end, label %if.then, !dbg !280

if.then:                                          ; preds = %while.body
  call void @bail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0)), !dbg !281
  br label %if.end, !dbg !281

if.end:                                           ; preds = %if.then, %while.body
  %call4 = call %struct.expr_t* @get_fact(), !dbg !282
  store %struct.expr_t* %call4, %struct.expr_t** %r, align 8, !dbg !283
  %2 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !284
  store %struct.expr_t* %2, %struct.expr_t** %l, align 8, !dbg !285
  %call5 = call %struct.expr_t* @new_expr(), !dbg !286
  store %struct.expr_t* %call5, %struct.expr_t** %ret, align 8, !dbg !287
  %3 = load i32, i32* %c, align 4, !dbg !288
  %cmp6 = icmp eq i32 %3, 42, !dbg !289
  %4 = zext i1 %cmp6 to i64, !dbg !290
  %cond = select i1 %cmp6, i32 4, i32 5, !dbg !290
  %5 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !291
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %5, i32 0, i32 0, !dbg !292
  store i32 %cond, i32* %op, align 8, !dbg !293
  %6 = load %struct.expr_t*, %struct.expr_t** %l, align 8, !dbg !294
  %7 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !295
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %7, i32 0, i32 3, !dbg !296
  store %struct.expr_t* %6, %struct.expr_t** %left, align 8, !dbg !297
  %8 = load %struct.expr_t*, %struct.expr_t** %r, align 8, !dbg !298
  %9 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !299
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %9, i32 0, i32 4, !dbg !300
  store %struct.expr_t* %8, %struct.expr_t** %right, align 8, !dbg !301
  br label %while.cond, !dbg !270, !llvm.loop !302

while.end:                                        ; preds = %lor.end
  %10 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !304
  ret %struct.expr_t* %10, !dbg !305
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_digit() #0 !dbg !306 {
entry:
  %retval = alloca %struct.expr_t*, align 8
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %ret = alloca %struct.expr_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !307, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.declare(metadata i32* %c, metadata !309, metadata !DIExpression()), !dbg !310
  %call = call i32 @next_tok(), !dbg !311
  store i32 %call, i32* %c, align 4, !dbg !310
  call void @llvm.dbg.declare(metadata %struct.expr_t** %ret, metadata !312, metadata !DIExpression()), !dbg !313
  %0 = load i32, i32* %c, align 4, !dbg !314
  %cmp = icmp sge i32 %0, 48, !dbg !316
  br i1 %cmp, label %land.lhs.true, label %if.end15, !dbg !317

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %c, align 4, !dbg !318
  %cmp1 = icmp sle i32 %1, 57, !dbg !319
  br i1 %cmp1, label %if.then, label %if.end15, !dbg !320

if.then:                                          ; preds = %land.lhs.true
  %call2 = call i32 @take(), !dbg !321
  %call3 = call %struct.expr_t* @new_expr(), !dbg !323
  store %struct.expr_t* %call3, %struct.expr_t** %ret, align 8, !dbg !324
  %2 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !325
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %2, i32 0, i32 0, !dbg !326
  store i32 1, i32* %op, align 8, !dbg !327
  %3 = load i32, i32* %c, align 4, !dbg !328
  %sub = sub nsw i32 %3, 48, !dbg !329
  %4 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !330
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %4, i32 0, i32 1, !dbg !331
  store i32 %sub, i32* %val, align 4, !dbg !332
  store i32 0, i32* %i, align 4, !dbg !333
  br label %for.cond, !dbg !335

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !336
  %cmp4 = icmp slt i32 %5, 4, !dbg !338
  br i1 %cmp4, label %for.body, label %for.end, !dbg !339

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !340
  %idxprom = sext i32 %6 to i64, !dbg !342
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !342
  %val5 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 1, !dbg !343
  %7 = load i32, i32* %val5, align 4, !dbg !343
  %8 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !344
  %val6 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %8, i32 0, i32 1, !dbg !345
  %9 = load i32, i32* %val6, align 4, !dbg !345
  %cmp7 = icmp eq i32 %7, %9, !dbg !346
  br i1 %cmp7, label %land.lhs.true8, label %if.end, !dbg !347

land.lhs.true8:                                   ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !348
  %idxprom9 = sext i32 %10 to i64, !dbg !349
  %arrayidx10 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom9, !dbg !349
  %used = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx10, i32 0, i32 2, !dbg !350
  %11 = load i32, i32* %used, align 8, !dbg !350
  %tobool = icmp ne i32 %11, 0, !dbg !349
  br i1 %tobool, label %if.end, label %if.then11, !dbg !351

if.then11:                                        ; preds = %land.lhs.true8
  %12 = load i32, i32* %i, align 4, !dbg !352
  %idxprom12 = sext i32 %12 to i64, !dbg !354
  %arrayidx13 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom12, !dbg !354
  %used14 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx13, i32 0, i32 2, !dbg !355
  store i32 1, i32* %used14, align 8, !dbg !356
  %13 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !357
  store %struct.expr_t* %13, %struct.expr_t** %retval, align 8, !dbg !358
  br label %return, !dbg !358

if.end:                                           ; preds = %land.lhs.true8, %for.body
  br label %for.inc, !dbg !350

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %i, align 4, !dbg !359
  %inc = add nsw i32 %14, 1, !dbg !359
  store i32 %inc, i32* %i, align 4, !dbg !359
  br label %for.cond, !dbg !360, !llvm.loop !361

for.end:                                          ; preds = %for.cond
  call void @bail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0)), !dbg !363
  br label %if.end15, !dbg !364

if.end15:                                         ; preds = %for.end, %land.lhs.true, %entry
  store %struct.expr_t* null, %struct.expr_t** %retval, align 8, !dbg !365
  br label %return, !dbg !365

return:                                           ; preds = %if.end15, %if.then11
  %15 = load %struct.expr_t*, %struct.expr_t** %retval, align 8, !dbg !366
  ret %struct.expr_t* %15, !dbg !366
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_fact() #0 !dbg !367 {
entry:
  %retval = alloca %struct.expr_t*, align 8
  %c = alloca i32, align 4
  %l = alloca %struct.expr_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %c, metadata !368, metadata !DIExpression()), !dbg !369
  call void @llvm.dbg.declare(metadata %struct.expr_t** %l, metadata !370, metadata !DIExpression()), !dbg !371
  %call = call %struct.expr_t* @get_digit(), !dbg !372
  store %struct.expr_t* %call, %struct.expr_t** %l, align 8, !dbg !371
  %0 = load %struct.expr_t*, %struct.expr_t** %l, align 8, !dbg !373
  %tobool = icmp ne %struct.expr_t* %0, null, !dbg !373
  br i1 %tobool, label %if.then, label %if.end, !dbg !375

if.then:                                          ; preds = %entry
  %1 = load %struct.expr_t*, %struct.expr_t** %l, align 8, !dbg !376
  store %struct.expr_t* %1, %struct.expr_t** %retval, align 8, !dbg !377
  br label %return, !dbg !377

if.end:                                           ; preds = %entry
  %call1 = call i32 @next_tok(), !dbg !378
  store i32 %call1, i32* %c, align 4, !dbg !380
  %cmp = icmp eq i32 %call1, 40, !dbg !381
  br i1 %cmp, label %if.then2, label %if.end10, !dbg !382

if.then2:                                         ; preds = %if.end
  %call3 = call i32 @take(), !dbg !383
  %call4 = call %struct.expr_t* @get_expr(), !dbg !385
  store %struct.expr_t* %call4, %struct.expr_t** %l, align 8, !dbg !386
  %call5 = call i32 @next_tok(), !dbg !387
  %cmp6 = icmp ne i32 %call5, 41, !dbg !389
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !390

if.then7:                                         ; preds = %if.then2
  call void @bail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !391
  br label %if.end8, !dbg !391

if.end8:                                          ; preds = %if.then7, %if.then2
  %call9 = call i32 @take(), !dbg !392
  %2 = load %struct.expr_t*, %struct.expr_t** %l, align 8, !dbg !393
  store %struct.expr_t* %2, %struct.expr_t** %retval, align 8, !dbg !394
  br label %return, !dbg !394

if.end10:                                         ; preds = %if.end
  store %struct.expr_t* null, %struct.expr_t** %retval, align 8, !dbg !395
  br label %return, !dbg !395

return:                                           ; preds = %if.end10, %if.end8, %if.then
  %3 = load %struct.expr_t*, %struct.expr_t** %retval, align 8, !dbg !396
  ret %struct.expr_t* %3, !dbg !396
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @parse() #0 !dbg !397 {
entry:
  %i = alloca i32, align 4
  %ret = alloca %struct.expr_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !398, metadata !DIExpression()), !dbg !399
  call void @llvm.dbg.declare(metadata %struct.expr_t** %ret, metadata !400, metadata !DIExpression()), !dbg !401
  %call = call %struct.expr_t* @get_expr(), !dbg !402
  store %struct.expr_t* %call, %struct.expr_t** %ret, align 8, !dbg !401
  %call1 = call i32 @next_tok(), !dbg !403
  %cmp = icmp ne i32 %call1, 0, !dbg !405
  br i1 %cmp, label %if.then, label %if.end, !dbg !406

if.then:                                          ; preds = %entry
  call void @bail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !407
  br label %if.end, !dbg !407

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4, !dbg !408
  br label %for.cond, !dbg !410

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i32, i32* %i, align 4, !dbg !411
  %cmp2 = icmp slt i32 %0, 4, !dbg !413
  br i1 %cmp2, label %for.body, label %for.end, !dbg !414

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !415
  %idxprom = sext i32 %1 to i64, !dbg !417
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !417
  %used = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 2, !dbg !418
  %2 = load i32, i32* %used, align 8, !dbg !418
  %tobool = icmp ne i32 %2, 0, !dbg !417
  br i1 %tobool, label %if.end4, label %if.then3, !dbg !419

if.then3:                                         ; preds = %for.body
  call void @bail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0)), !dbg !420
  br label %if.end4, !dbg !420

if.end4:                                          ; preds = %if.then3, %for.body
  br label %for.inc, !dbg !418

for.inc:                                          ; preds = %if.end4
  %3 = load i32, i32* %i, align 4, !dbg !421
  %inc = add nsw i32 %3, 1, !dbg !421
  store i32 %inc, i32* %i, align 4, !dbg !421
  br label %for.cond, !dbg !422, !llvm.loop !423

for.end:                                          ; preds = %for.cond
  %4 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !425
  ret %struct.expr_t* %4, !dbg !426
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gcd(i32 %m, i32 %n) #0 !dbg !427 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !430, metadata !DIExpression()), !dbg !431
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !432, metadata !DIExpression()), !dbg !433
  call void @llvm.dbg.declare(metadata i32* %t, metadata !434, metadata !DIExpression()), !dbg !435
  br label %while.cond, !dbg !436

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %m.addr, align 4, !dbg !437
  %tobool = icmp ne i32 %0, 0, !dbg !436
  br i1 %tobool, label %while.body, label %while.end, !dbg !436

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %m.addr, align 4, !dbg !438
  store i32 %1, i32* %t, align 4, !dbg !440
  %2 = load i32, i32* %n.addr, align 4, !dbg !441
  %3 = load i32, i32* %m.addr, align 4, !dbg !442
  %rem = srem i32 %2, %3, !dbg !443
  store i32 %rem, i32* %m.addr, align 4, !dbg !444
  %4 = load i32, i32* %t, align 4, !dbg !445
  store i32 %4, i32* %n.addr, align 4, !dbg !446
  br label %while.cond, !dbg !436, !llvm.loop !447

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* %n.addr, align 4, !dbg !449
  ret i32 %5, !dbg !450
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_tree(%struct.expr_t* %e, %struct.frac_t* %res) #0 !dbg !451 {
entry:
  %e.addr = alloca %struct.expr_t*, align 8
  %res.addr = alloca %struct.frac_t*, align 8
  %l = alloca %struct.frac_t, align 4
  %r = alloca %struct.frac_t, align 4
  %t = alloca i32, align 4
  store %struct.expr_t* %e, %struct.expr_t** %e.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.expr_t** %e.addr, metadata !460, metadata !DIExpression()), !dbg !461
  store %struct.frac_t* %res, %struct.frac_t** %res.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.frac_t** %res.addr, metadata !462, metadata !DIExpression()), !dbg !463
  call void @llvm.dbg.declare(metadata %struct.frac_t* %l, metadata !464, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.declare(metadata %struct.frac_t* %r, metadata !467, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.declare(metadata i32* %t, metadata !469, metadata !DIExpression()), !dbg !470
  %0 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !471
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %0, i32 0, i32 0, !dbg !473
  %1 = load i32, i32* %op, align 8, !dbg !473
  %cmp = icmp eq i32 %1, 1, !dbg !474
  br i1 %cmp, label %if.then, label %if.end, !dbg !475

if.then:                                          ; preds = %entry
  %2 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !476
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %2, i32 0, i32 1, !dbg !478
  %3 = load i32, i32* %val, align 4, !dbg !478
  %4 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !479
  %num = getelementptr inbounds %struct.frac_t, %struct.frac_t* %4, i32 0, i32 1, !dbg !480
  store i32 %3, i32* %num, align 4, !dbg !481
  %5 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !482
  %denom = getelementptr inbounds %struct.frac_t, %struct.frac_t* %5, i32 0, i32 0, !dbg !483
  store i32 1, i32* %denom, align 4, !dbg !484
  br label %if.end48, !dbg !485

if.end:                                           ; preds = %entry
  %6 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !486
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %6, i32 0, i32 3, !dbg !487
  %7 = load %struct.expr_t*, %struct.expr_t** %left, align 8, !dbg !487
  call void @eval_tree(%struct.expr_t* %7, %struct.frac_t* %l), !dbg !488
  %8 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !489
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %8, i32 0, i32 4, !dbg !490
  %9 = load %struct.expr_t*, %struct.expr_t** %right, align 8, !dbg !490
  call void @eval_tree(%struct.expr_t* %9, %struct.frac_t* %r), !dbg !491
  %10 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !492
  %op1 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %10, i32 0, i32 0, !dbg !493
  %11 = load i32, i32* %op1, align 8, !dbg !493
  switch i32 %11, label %sw.epilog [
    i32 2, label %sw.bb
    i32 3, label %sw.bb12
    i32 4, label %sw.bb24
    i32 5, label %sw.bb33
  ], !dbg !494

sw.bb:                                            ; preds = %if.end
  %num2 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !495
  %12 = load i32, i32* %num2, align 4, !dbg !495
  %denom3 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !497
  %13 = load i32, i32* %denom3, align 4, !dbg !497
  %mul = mul nsw i32 %12, %13, !dbg !498
  %denom4 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !499
  %14 = load i32, i32* %denom4, align 4, !dbg !499
  %num5 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !500
  %15 = load i32, i32* %num5, align 4, !dbg !500
  %mul6 = mul nsw i32 %14, %15, !dbg !501
  %add = add nsw i32 %mul, %mul6, !dbg !502
  %16 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !503
  %num7 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %16, i32 0, i32 1, !dbg !504
  store i32 %add, i32* %num7, align 4, !dbg !505
  %denom8 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !506
  %17 = load i32, i32* %denom8, align 4, !dbg !506
  %denom9 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !507
  %18 = load i32, i32* %denom9, align 4, !dbg !507
  %mul10 = mul nsw i32 %17, %18, !dbg !508
  %19 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !509
  %denom11 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %19, i32 0, i32 0, !dbg !510
  store i32 %mul10, i32* %denom11, align 4, !dbg !511
  br label %sw.epilog, !dbg !512

sw.bb12:                                          ; preds = %if.end
  %num13 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !513
  %20 = load i32, i32* %num13, align 4, !dbg !513
  %denom14 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !514
  %21 = load i32, i32* %denom14, align 4, !dbg !514
  %mul15 = mul nsw i32 %20, %21, !dbg !515
  %denom16 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !516
  %22 = load i32, i32* %denom16, align 4, !dbg !516
  %num17 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !517
  %23 = load i32, i32* %num17, align 4, !dbg !517
  %mul18 = mul nsw i32 %22, %23, !dbg !518
  %sub = sub nsw i32 %mul15, %mul18, !dbg !519
  %24 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !520
  %num19 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %24, i32 0, i32 1, !dbg !521
  store i32 %sub, i32* %num19, align 4, !dbg !522
  %denom20 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !523
  %25 = load i32, i32* %denom20, align 4, !dbg !523
  %denom21 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !524
  %26 = load i32, i32* %denom21, align 4, !dbg !524
  %mul22 = mul nsw i32 %25, %26, !dbg !525
  %27 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !526
  %denom23 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %27, i32 0, i32 0, !dbg !527
  store i32 %mul22, i32* %denom23, align 4, !dbg !528
  br label %sw.epilog, !dbg !529

sw.bb24:                                          ; preds = %if.end
  %num25 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !530
  %28 = load i32, i32* %num25, align 4, !dbg !530
  %num26 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !531
  %29 = load i32, i32* %num26, align 4, !dbg !531
  %mul27 = mul nsw i32 %28, %29, !dbg !532
  %30 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !533
  %num28 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %30, i32 0, i32 1, !dbg !534
  store i32 %mul27, i32* %num28, align 4, !dbg !535
  %denom29 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !536
  %31 = load i32, i32* %denom29, align 4, !dbg !536
  %denom30 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !537
  %32 = load i32, i32* %denom30, align 4, !dbg !537
  %mul31 = mul nsw i32 %31, %32, !dbg !538
  %33 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !539
  %denom32 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %33, i32 0, i32 0, !dbg !540
  store i32 %mul31, i32* %denom32, align 4, !dbg !541
  br label %sw.epilog, !dbg !542

sw.bb33:                                          ; preds = %if.end
  %num34 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !543
  %34 = load i32, i32* %num34, align 4, !dbg !543
  %denom35 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !544
  %35 = load i32, i32* %denom35, align 4, !dbg !544
  %mul36 = mul nsw i32 %34, %35, !dbg !545
  %36 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !546
  %num37 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %36, i32 0, i32 1, !dbg !547
  store i32 %mul36, i32* %num37, align 4, !dbg !548
  %denom38 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !549
  %37 = load i32, i32* %denom38, align 4, !dbg !549
  %num39 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !550
  %38 = load i32, i32* %num39, align 4, !dbg !550
  %mul40 = mul nsw i32 %37, %38, !dbg !551
  %39 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !552
  %denom41 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %39, i32 0, i32 0, !dbg !553
  store i32 %mul40, i32* %denom41, align 4, !dbg !554
  br label %sw.epilog, !dbg !555

sw.epilog:                                        ; preds = %sw.bb33, %sw.bb24, %sw.bb12, %sw.bb, %if.end
  %40 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !556
  %denom42 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %40, i32 0, i32 0, !dbg !558
  %41 = load i32, i32* %denom42, align 4, !dbg !558
  %42 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !559
  %num43 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %42, i32 0, i32 1, !dbg !560
  %43 = load i32, i32* %num43, align 4, !dbg !560
  %call = call i32 @gcd(i32 %41, i32 %43), !dbg !561
  store i32 %call, i32* %t, align 4, !dbg !562
  %tobool = icmp ne i32 %call, 0, !dbg !562
  br i1 %tobool, label %if.then44, label %if.end48, !dbg !563

if.then44:                                        ; preds = %sw.epilog
  %44 = load i32, i32* %t, align 4, !dbg !564
  %45 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !566
  %denom45 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %45, i32 0, i32 0, !dbg !567
  %46 = load i32, i32* %denom45, align 4, !dbg !568
  %div = sdiv i32 %46, %44, !dbg !568
  store i32 %div, i32* %denom45, align 4, !dbg !568
  %47 = load i32, i32* %t, align 4, !dbg !569
  %48 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !570
  %num46 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %48, i32 0, i32 1, !dbg !571
  %49 = load i32, i32* %num46, align 4, !dbg !572
  %div47 = sdiv i32 %49, %47, !dbg !572
  store i32 %div47, i32* %num46, align 4, !dbg !572
  br label %if.end48, !dbg !573

if.end48:                                         ; preds = %if.then44, %sw.epilog, %if.then
  ret void, !dbg !574
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @get_input() #0 !dbg !575 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !576, metadata !DIExpression()), !dbg !577
  br label %reinput, !dbg !578

reinput:                                          ; preds = %reinput.backedge, %entry
  call void @llvm.dbg.label(metadata !579), !dbg !580
  call void @reset(), !dbg !581
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i64 0, i64 0)), !dbg !582
  store i32 0, i32* %i, align 4, !dbg !583
  br label %for.cond, !dbg !585

for.cond:                                         ; preds = %for.inc, %reinput
  %0 = load i32, i32* %i, align 4, !dbg !586
  %cmp = icmp slt i32 %0, 4, !dbg !588
  br i1 %cmp, label %for.body, label %for.end, !dbg !589

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !590
  %idxprom = sext i32 %1 to i64, !dbg !591
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !591
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 1, !dbg !592
  %2 = load i32, i32* %val, align 4, !dbg !592
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0), i32 %2), !dbg !593
  br label %for.inc, !dbg !593

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !594
  %inc = add nsw i32 %3, 1, !dbg !594
  store i32 %inc, i32* %i, align 4, !dbg !594
  br label %for.cond, !dbg !595, !llvm.loop !596

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.8, i64 0, i64 0)), !dbg !598
  br label %while.body, !dbg !599

while.body:                                       ; preds = %for.end
  store i32 0, i32* %i, align 4, !dbg !600
  br label %for.cond3, !dbg !603

for.cond3:                                        ; preds = %for.inc8, %while.body
  %4 = load i32, i32* %i, align 4, !dbg !604
  %cmp4 = icmp slt i32 %4, 64, !dbg !606
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !607

for.body5:                                        ; preds = %for.cond3
  %5 = load i32, i32* %i, align 4, !dbg !608
  %idxprom6 = sext i32 %5 to i64, !dbg !609
  %arrayidx7 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom6, !dbg !609
  store i8 10, i8* %arrayidx7, align 1, !dbg !610
  br label %for.inc8, !dbg !609

for.inc8:                                         ; preds = %for.body5
  %6 = load i32, i32* %i, align 4, !dbg !611
  %inc9 = add nsw i32 %6, 1, !dbg !611
  store i32 %inc9, i32* %i, align 4, !dbg !611
  br label %for.cond3, !dbg !612, !llvm.loop !613

for.end10:                                        ; preds = %for.cond3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !615
  %call11 = call i8* @fgets(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), i32 64, %struct._IO_FILE* %7), !dbg !616
  %8 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), align 16, !dbg !617
  %conv = sext i8 %8 to i32, !dbg !617
  %cmp12 = icmp eq i32 %conv, 0, !dbg !619
  br i1 %cmp12, label %if.then, label %if.end, !dbg !620

if.then:                                          ; preds = %for.end10
  br label %reinput.backedge, !dbg !621

reinput.backedge:                                 ; preds = %if.then, %if.then44
  br label %reinput, !dbg !580

if.end:                                           ; preds = %for.end10
  %9 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 63), align 1, !dbg !622
  %conv14 = sext i8 %9 to i32, !dbg !622
  %cmp15 = icmp ne i32 %conv14, 10, !dbg !624
  br i1 %cmp15, label %if.then17, label %if.end18, !dbg !625

if.then17:                                        ; preds = %if.end
  call void @bail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i64 0, i64 0)), !dbg !626
  br label %if.end18, !dbg !626

if.end18:                                         ; preds = %if.then17, %if.end
  store i32 0, i32* %i, align 4, !dbg !627
  br label %for.cond19, !dbg !629

for.cond19:                                       ; preds = %for.inc32, %if.end18
  %10 = load i32, i32* %i, align 4, !dbg !630
  %cmp20 = icmp slt i32 %10, 64, !dbg !632
  br i1 %cmp20, label %for.body22, label %for.end34, !dbg !633

for.body22:                                       ; preds = %for.cond19
  %11 = load i32, i32* %i, align 4, !dbg !634
  %idxprom23 = sext i32 %11 to i64, !dbg !636
  %arrayidx24 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom23, !dbg !636
  %12 = load i8, i8* %arrayidx24, align 1, !dbg !636
  %conv25 = sext i8 %12 to i32, !dbg !636
  %cmp26 = icmp eq i32 %conv25, 10, !dbg !637
  br i1 %cmp26, label %if.then28, label %if.end31, !dbg !638

if.then28:                                        ; preds = %for.body22
  %13 = load i32, i32* %i, align 4, !dbg !639
  %idxprom29 = sext i32 %13 to i64, !dbg !640
  %arrayidx30 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom29, !dbg !640
  store i8 0, i8* %arrayidx30, align 1, !dbg !641
  br label %if.end31, !dbg !640

if.end31:                                         ; preds = %if.then28, %for.body22
  br label %for.inc32, !dbg !642

for.inc32:                                        ; preds = %if.end31
  %14 = load i32, i32* %i, align 4, !dbg !643
  %inc33 = add nsw i32 %14, 1, !dbg !643
  store i32 %inc33, i32* %i, align 4, !dbg !643
  br label %for.cond19, !dbg !644, !llvm.loop !645

for.end34:                                        ; preds = %for.cond19
  %15 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), align 16, !dbg !647
  %conv35 = sext i8 %15 to i32, !dbg !647
  %cmp36 = icmp eq i32 %conv35, 113, !dbg !649
  br i1 %cmp36, label %if.then38, label %if.end40, !dbg !650

if.then38:                                        ; preds = %for.end34
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i64 0, i64 0)), !dbg !651
  call void @exit(i32 0) #8, !dbg !653
  unreachable, !dbg !653

if.end40:                                         ; preds = %for.end34
  %16 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), align 16, !dbg !654
  %conv41 = sext i8 %16 to i32, !dbg !654
  %cmp42 = icmp eq i32 %conv41, 110, !dbg !656
  br i1 %cmp42, label %if.then44, label %if.end45, !dbg !657

if.then44:                                        ; preds = %if.end40
  call void @gen_digits(), !dbg !658
  br label %reinput.backedge, !dbg !660

if.end45:                                         ; preds = %if.end40
  ret void, !dbg !661
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare dso_local i32 @printf(i8*, ...) #5

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !662 {
entry:
  %retval = alloca i32, align 4
  %f = alloca %struct.frac_t, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.frac_t* %f, metadata !663, metadata !DIExpression()), !dbg !664
  %call = call i64 @time(i64* null) #7, !dbg !665
  %conv = trunc i64 %call to i32, !dbg !665
  call void @srand(i32 %conv) #7, !dbg !666
  call void @gen_digits(), !dbg !667
  br label %while.body, !dbg !668

while.body:                                       ; preds = %while.body.backedge, %entry
  call void @get_input(), !dbg !669
  %call1 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ctx, i64 0, i64 0)) #10, !dbg !671
  %0 = load i8*, i8** @msg, align 8, !dbg !672
  %tobool = icmp ne i8* %0, null, !dbg !672
  br i1 %tobool, label %if.then, label %if.end, !dbg !674

if.then:                                          ; preds = %while.body
  %1 = load i8*, i8** @msg, align 8, !dbg !675
  %2 = load i32, i32* @pos, align 4, !dbg !677
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i64 0, i64 0), i8* %1, i32 %2, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0)), !dbg !678
  br label %while.body.backedge, !dbg !679

while.body.backedge:                              ; preds = %if.then, %if.end26
  br label %while.body, !dbg !669, !llvm.loop !680

if.end:                                           ; preds = %while.body
  %call3 = call %struct.expr_t* @parse(), !dbg !682
  call void @eval_tree(%struct.expr_t* %call3, %struct.frac_t* %f), !dbg !683
  %denom = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !684
  %3 = load i32, i32* %denom, align 4, !dbg !684
  %cmp = icmp eq i32 %3, 0, !dbg !686
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !687

if.then5:                                         ; preds = %if.end
  call void @bail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i64 0, i64 0)), !dbg !688
  br label %if.end6, !dbg !688

if.end6:                                          ; preds = %if.then5, %if.end
  %denom7 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !689
  %4 = load i32, i32* %denom7, align 4, !dbg !689
  %cmp8 = icmp eq i32 %4, 1, !dbg !691
  br i1 %cmp8, label %land.lhs.true, label %if.else, !dbg !692

land.lhs.true:                                    ; preds = %if.end6
  %num = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 1, !dbg !693
  %5 = load i32, i32* %num, align 4, !dbg !693
  %cmp10 = icmp eq i32 %5, 24, !dbg !694
  br i1 %cmp10, label %if.then12, label %if.else, !dbg !695

if.then12:                                        ; preds = %land.lhs.true
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.13, i64 0, i64 0)), !dbg !696
  br label %if.end26, !dbg !696

if.else:                                          ; preds = %land.lhs.true, %if.end6
  %denom14 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !697
  %6 = load i32, i32* %denom14, align 4, !dbg !697
  %cmp15 = icmp eq i32 %6, 1, !dbg !700
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !701

if.then17:                                        ; preds = %if.else
  %num18 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 1, !dbg !702
  %7 = load i32, i32* %num18, align 4, !dbg !702
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.14, i64 0, i64 0), i32 %7), !dbg !703
  br label %if.end24, !dbg !703

if.else20:                                        ; preds = %if.else
  %num21 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 1, !dbg !704
  %8 = load i32, i32* %num21, align 4, !dbg !704
  %denom22 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !705
  %9 = load i32, i32* %denom22, align 4, !dbg !705
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.15, i64 0, i64 0), i32 %8, i32 %9), !dbg !706
  br label %if.end24

if.end24:                                         ; preds = %if.else20, %if.then17
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.16, i64 0, i64 0)), !dbg !707
  br label %if.end26

if.end26:                                         ; preds = %if.end24, %if.then12
  br label %while.body.backedge, !dbg !668
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind returns_twice
declare dso_local i32 @_setjmp(%struct.__jmp_buf_tag*) #6

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
!99 = !DILocation(line: 23, column: 6, scope: !94)
!100 = !DILocation(line: 24, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !3, line: 24, column: 2)
!102 = !DILocation(line: 24, column: 7, scope: !101)
!103 = !DILocation(line: 24, column: 14, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !3, line: 24, column: 2)
!105 = !DILocation(line: 24, column: 16, scope: !104)
!106 = !DILocation(line: 24, column: 2, scope: !101)
!107 = !DILocation(line: 25, column: 23, scope: !104)
!108 = !DILocation(line: 25, column: 30, scope: !104)
!109 = !DILocation(line: 25, column: 21, scope: !104)
!110 = !DILocation(line: 25, column: 10, scope: !104)
!111 = !DILocation(line: 25, column: 3, scope: !104)
!112 = !DILocation(line: 25, column: 13, scope: !104)
!113 = !DILocation(line: 25, column: 17, scope: !104)
!114 = !DILocation(line: 24, column: 29, scope: !104)
!115 = !DILocation(line: 24, column: 2, scope: !104)
!116 = distinct !{!116, !106, !117}
!117 = !DILocation(line: 25, column: 32, scope: !101)
!118 = !DILocation(line: 26, column: 1, scope: !94)
!119 = distinct !DISubprogram(name: "reset", scope: !3, file: !3, line: 36, type: !95, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!120 = !DILocalVariable(name: "i", scope: !119, file: !3, line: 38, type: !30)
!121 = !DILocation(line: 38, column: 6, scope: !119)
!122 = !DILocation(line: 39, column: 6, scope: !119)
!123 = !DILocation(line: 40, column: 17, scope: !119)
!124 = !DILocation(line: 40, column: 11, scope: !119)
!125 = !DILocation(line: 41, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !3, line: 41, column: 2)
!127 = !DILocation(line: 41, column: 7, scope: !126)
!128 = !DILocation(line: 41, column: 14, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !3, line: 41, column: 2)
!130 = !DILocation(line: 41, column: 16, scope: !129)
!131 = !DILocation(line: 41, column: 2, scope: !126)
!132 = !DILocation(line: 42, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !3, line: 41, column: 34)
!134 = !DILocation(line: 42, column: 3, scope: !133)
!135 = !DILocation(line: 42, column: 11, scope: !133)
!136 = !DILocation(line: 42, column: 14, scope: !133)
!137 = !DILocation(line: 43, column: 23, scope: !133)
!138 = !DILocation(line: 43, column: 18, scope: !133)
!139 = !DILocation(line: 43, column: 26, scope: !133)
!140 = !DILocation(line: 43, column: 32, scope: !133)
!141 = !DILocation(line: 43, column: 8, scope: !133)
!142 = !DILocation(line: 43, column: 3, scope: !133)
!143 = !DILocation(line: 43, column: 11, scope: !133)
!144 = !DILocation(line: 43, column: 16, scope: !133)
!145 = !DILocation(line: 44, column: 2, scope: !133)
!146 = !DILocation(line: 41, column: 30, scope: !129)
!147 = !DILocation(line: 41, column: 2, scope: !129)
!148 = distinct !{!148, !131, !149}
!149 = !DILocation(line: 44, column: 2, scope: !126)
!150 = !DILocation(line: 45, column: 9, scope: !151)
!151 = distinct !DILexicalBlock(scope: !119, file: !3, line: 45, column: 2)
!152 = !DILocation(line: 45, column: 7, scope: !151)
!153 = !DILocation(line: 45, column: 14, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !3, line: 45, column: 2)
!155 = !DILocation(line: 45, column: 16, scope: !154)
!156 = !DILocation(line: 45, column: 2, scope: !151)
!157 = !DILocation(line: 46, column: 10, scope: !154)
!158 = !DILocation(line: 46, column: 3, scope: !154)
!159 = !DILocation(line: 46, column: 13, scope: !154)
!160 = !DILocation(line: 46, column: 18, scope: !154)
!161 = !DILocation(line: 45, column: 29, scope: !154)
!162 = !DILocation(line: 45, column: 2, scope: !154)
!163 = distinct !{!163, !156, !164}
!164 = !DILocation(line: 46, column: 20, scope: !151)
!165 = !DILocation(line: 47, column: 1, scope: !119)
!166 = distinct !DISubprogram(name: "bail", scope: !3, file: !3, line: 50, type: !167, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!167 = !DISubroutineType(types: !168)
!168 = !{null, !62}
!169 = !DILocalVariable(name: "s", arg: 1, scope: !166, file: !3, line: 50, type: !62)
!170 = !DILocation(line: 50, column: 23, scope: !166)
!171 = !DILocation(line: 52, column: 8, scope: !166)
!172 = !DILocation(line: 52, column: 6, scope: !166)
!173 = !DILocation(line: 53, column: 2, scope: !166)
!174 = distinct !DISubprogram(name: "new_expr", scope: !3, file: !3, line: 56, type: !175, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!175 = !DISubroutineType(types: !176)
!176 = !{!82}
!177 = !DILocation(line: 58, column: 6, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !3, line: 58, column: 6)
!179 = !DILocation(line: 58, column: 15, scope: !178)
!180 = !DILocation(line: 58, column: 6, scope: !174)
!181 = !DILocation(line: 59, column: 25, scope: !178)
!182 = !DILocation(line: 59, column: 15, scope: !178)
!183 = !DILocation(line: 59, column: 3, scope: !178)
!184 = !DILocation(line: 60, column: 2, scope: !174)
!185 = !DILocation(line: 61, column: 1, scope: !174)
!186 = distinct !DISubprogram(name: "next_tok", scope: !3, file: !3, line: 64, type: !187, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!187 = !DISubroutineType(types: !188)
!188 = !{!30}
!189 = !DILocation(line: 66, column: 2, scope: !186)
!190 = !DILocation(line: 66, column: 9, scope: !186)
!191 = !DILocation(line: 66, column: 31, scope: !186)
!192 = distinct !{!192, !189, !191}
!193 = !DILocation(line: 67, column: 13, scope: !186)
!194 = !DILocation(line: 67, column: 9, scope: !186)
!195 = !DILocation(line: 67, column: 2, scope: !186)
!196 = distinct !DISubprogram(name: "take", scope: !3, file: !3, line: 71, type: !187, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!197 = !DILocation(line: 73, column: 10, scope: !198)
!198 = distinct !DILexicalBlock(scope: !196, file: !3, line: 73, column: 6)
!199 = !DILocation(line: 73, column: 6, scope: !198)
!200 = !DILocation(line: 73, column: 15, scope: !198)
!201 = !DILocation(line: 73, column: 6, scope: !196)
!202 = !DILocation(line: 73, column: 31, scope: !198)
!203 = !DILocation(line: 73, column: 24, scope: !198)
!204 = !DILocation(line: 74, column: 2, scope: !196)
!205 = !DILocation(line: 75, column: 1, scope: !196)
!206 = distinct !DISubprogram(name: "get_expr", scope: !3, file: !3, line: 88, type: !175, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!207 = !DILocalVariable(name: "c", scope: !206, file: !3, line: 90, type: !30)
!208 = !DILocation(line: 90, column: 6, scope: !206)
!209 = !DILocalVariable(name: "l", scope: !206, file: !3, line: 91, type: !82)
!210 = !DILocation(line: 91, column: 7, scope: !206)
!211 = !DILocalVariable(name: "r", scope: !206, file: !3, line: 91, type: !82)
!212 = !DILocation(line: 91, column: 10, scope: !206)
!213 = !DILocalVariable(name: "ret", scope: !206, file: !3, line: 91, type: !82)
!214 = !DILocation(line: 91, column: 13, scope: !206)
!215 = !DILocation(line: 92, column: 14, scope: !216)
!216 = distinct !DILexicalBlock(scope: !206, file: !3, line: 92, column: 6)
!217 = !DILocation(line: 92, column: 12, scope: !216)
!218 = !DILocation(line: 92, column: 6, scope: !206)
!219 = !DILocation(line: 92, column: 27, scope: !216)
!220 = !DILocation(line: 93, column: 2, scope: !206)
!221 = !DILocation(line: 93, column: 14, scope: !206)
!222 = !DILocation(line: 93, column: 12, scope: !206)
!223 = !DILocation(line: 93, column: 26, scope: !206)
!224 = !DILocation(line: 93, column: 33, scope: !206)
!225 = !DILocation(line: 93, column: 36, scope: !206)
!226 = !DILocation(line: 93, column: 38, scope: !206)
!227 = !DILocation(line: 94, column: 8, scope: !228)
!228 = distinct !DILexicalBlock(scope: !229, file: !3, line: 94, column: 7)
!229 = distinct !DILexicalBlock(scope: !206, file: !3, line: 93, column: 46)
!230 = !DILocation(line: 94, column: 7, scope: !229)
!231 = !DILocation(line: 94, column: 16, scope: !228)
!232 = !DILocation(line: 95, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !3, line: 95, column: 7)
!234 = !DILocation(line: 95, column: 11, scope: !233)
!235 = !DILocation(line: 95, column: 7, scope: !229)
!236 = !DILocation(line: 95, column: 26, scope: !233)
!237 = !DILocation(line: 97, column: 7, scope: !229)
!238 = !DILocation(line: 97, column: 5, scope: !229)
!239 = !DILocation(line: 98, column: 9, scope: !229)
!240 = !DILocation(line: 98, column: 7, scope: !229)
!241 = !DILocation(line: 99, column: 14, scope: !229)
!242 = !DILocation(line: 99, column: 16, scope: !229)
!243 = !DILocation(line: 99, column: 13, scope: !229)
!244 = !DILocation(line: 99, column: 3, scope: !229)
!245 = !DILocation(line: 99, column: 8, scope: !229)
!246 = !DILocation(line: 99, column: 11, scope: !229)
!247 = !DILocation(line: 100, column: 15, scope: !229)
!248 = !DILocation(line: 100, column: 3, scope: !229)
!249 = !DILocation(line: 100, column: 8, scope: !229)
!250 = !DILocation(line: 100, column: 13, scope: !229)
!251 = !DILocation(line: 101, column: 16, scope: !229)
!252 = !DILocation(line: 101, column: 3, scope: !229)
!253 = !DILocation(line: 101, column: 8, scope: !229)
!254 = !DILocation(line: 101, column: 14, scope: !229)
!255 = distinct !{!255, !220, !256}
!256 = !DILocation(line: 102, column: 2, scope: !206)
!257 = !DILocation(line: 103, column: 9, scope: !206)
!258 = !DILocation(line: 103, column: 2, scope: !206)
!259 = distinct !DISubprogram(name: "get_term", scope: !3, file: !3, line: 106, type: !175, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!260 = !DILocalVariable(name: "c", scope: !259, file: !3, line: 108, type: !30)
!261 = !DILocation(line: 108, column: 6, scope: !259)
!262 = !DILocalVariable(name: "l", scope: !259, file: !3, line: 109, type: !82)
!263 = !DILocation(line: 109, column: 7, scope: !259)
!264 = !DILocalVariable(name: "r", scope: !259, file: !3, line: 109, type: !82)
!265 = !DILocation(line: 109, column: 10, scope: !259)
!266 = !DILocalVariable(name: "ret", scope: !259, file: !3, line: 109, type: !82)
!267 = !DILocation(line: 109, column: 13, scope: !259)
!268 = !DILocation(line: 110, column: 8, scope: !259)
!269 = !DILocation(line: 110, column: 6, scope: !259)
!270 = !DILocation(line: 111, column: 2, scope: !259)
!271 = !DILocation(line: 111, column: 13, scope: !259)
!272 = !DILocation(line: 111, column: 11, scope: !259)
!273 = !DILocation(line: 111, column: 25, scope: !259)
!274 = !DILocation(line: 111, column: 32, scope: !259)
!275 = !DILocation(line: 111, column: 35, scope: !259)
!276 = !DILocation(line: 111, column: 37, scope: !259)
!277 = !DILocation(line: 112, column: 8, scope: !278)
!278 = distinct !DILexicalBlock(scope: !279, file: !3, line: 112, column: 7)
!279 = distinct !DILexicalBlock(scope: !259, file: !3, line: 111, column: 45)
!280 = !DILocation(line: 112, column: 7, scope: !279)
!281 = !DILocation(line: 112, column: 16, scope: !278)
!282 = !DILocation(line: 114, column: 7, scope: !279)
!283 = !DILocation(line: 114, column: 5, scope: !279)
!284 = !DILocation(line: 115, column: 7, scope: !279)
!285 = !DILocation(line: 115, column: 5, scope: !279)
!286 = !DILocation(line: 116, column: 9, scope: !279)
!287 = !DILocation(line: 116, column: 7, scope: !279)
!288 = !DILocation(line: 117, column: 14, scope: !279)
!289 = !DILocation(line: 117, column: 16, scope: !279)
!290 = !DILocation(line: 117, column: 13, scope: !279)
!291 = !DILocation(line: 117, column: 3, scope: !279)
!292 = !DILocation(line: 117, column: 8, scope: !279)
!293 = !DILocation(line: 117, column: 11, scope: !279)
!294 = !DILocation(line: 118, column: 15, scope: !279)
!295 = !DILocation(line: 118, column: 3, scope: !279)
!296 = !DILocation(line: 118, column: 8, scope: !279)
!297 = !DILocation(line: 118, column: 13, scope: !279)
!298 = !DILocation(line: 119, column: 16, scope: !279)
!299 = !DILocation(line: 119, column: 3, scope: !279)
!300 = !DILocation(line: 119, column: 8, scope: !279)
!301 = !DILocation(line: 119, column: 14, scope: !279)
!302 = distinct !{!302, !270, !303}
!303 = !DILocation(line: 120, column: 2, scope: !259)
!304 = !DILocation(line: 121, column: 9, scope: !259)
!305 = !DILocation(line: 121, column: 2, scope: !259)
!306 = distinct !DISubprogram(name: "get_digit", scope: !3, file: !3, line: 124, type: !175, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!307 = !DILocalVariable(name: "i", scope: !306, file: !3, line: 126, type: !30)
!308 = !DILocation(line: 126, column: 6, scope: !306)
!309 = !DILocalVariable(name: "c", scope: !306, file: !3, line: 126, type: !30)
!310 = !DILocation(line: 126, column: 9, scope: !306)
!311 = !DILocation(line: 126, column: 13, scope: !306)
!312 = !DILocalVariable(name: "ret", scope: !306, file: !3, line: 127, type: !82)
!313 = !DILocation(line: 127, column: 7, scope: !306)
!314 = !DILocation(line: 128, column: 6, scope: !315)
!315 = distinct !DILexicalBlock(scope: !306, file: !3, line: 128, column: 6)
!316 = !DILocation(line: 128, column: 8, scope: !315)
!317 = !DILocation(line: 128, column: 15, scope: !315)
!318 = !DILocation(line: 128, column: 18, scope: !315)
!319 = !DILocation(line: 128, column: 20, scope: !315)
!320 = !DILocation(line: 128, column: 6, scope: !306)
!321 = !DILocation(line: 129, column: 3, scope: !322)
!322 = distinct !DILexicalBlock(scope: !315, file: !3, line: 128, column: 28)
!323 = !DILocation(line: 130, column: 9, scope: !322)
!324 = !DILocation(line: 130, column: 7, scope: !322)
!325 = !DILocation(line: 131, column: 3, scope: !322)
!326 = !DILocation(line: 131, column: 8, scope: !322)
!327 = !DILocation(line: 131, column: 11, scope: !322)
!328 = !DILocation(line: 132, column: 14, scope: !322)
!329 = !DILocation(line: 132, column: 16, scope: !322)
!330 = !DILocation(line: 132, column: 3, scope: !322)
!331 = !DILocation(line: 132, column: 8, scope: !322)
!332 = !DILocation(line: 132, column: 12, scope: !322)
!333 = !DILocation(line: 133, column: 10, scope: !334)
!334 = distinct !DILexicalBlock(scope: !322, file: !3, line: 133, column: 3)
!335 = !DILocation(line: 133, column: 8, scope: !334)
!336 = !DILocation(line: 133, column: 15, scope: !337)
!337 = distinct !DILexicalBlock(scope: !334, file: !3, line: 133, column: 3)
!338 = !DILocation(line: 133, column: 17, scope: !337)
!339 = !DILocation(line: 133, column: 3, scope: !334)
!340 = !DILocation(line: 134, column: 15, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !3, line: 134, column: 8)
!342 = !DILocation(line: 134, column: 8, scope: !341)
!343 = !DILocation(line: 134, column: 18, scope: !341)
!344 = !DILocation(line: 134, column: 25, scope: !341)
!345 = !DILocation(line: 134, column: 30, scope: !341)
!346 = !DILocation(line: 134, column: 22, scope: !341)
!347 = !DILocation(line: 134, column: 34, scope: !341)
!348 = !DILocation(line: 134, column: 45, scope: !341)
!349 = !DILocation(line: 134, column: 38, scope: !341)
!350 = !DILocation(line: 134, column: 48, scope: !341)
!351 = !DILocation(line: 134, column: 8, scope: !337)
!352 = !DILocation(line: 135, column: 12, scope: !353)
!353 = distinct !DILexicalBlock(scope: !341, file: !3, line: 134, column: 54)
!354 = !DILocation(line: 135, column: 5, scope: !353)
!355 = !DILocation(line: 135, column: 15, scope: !353)
!356 = !DILocation(line: 135, column: 20, scope: !353)
!357 = !DILocation(line: 136, column: 12, scope: !353)
!358 = !DILocation(line: 136, column: 5, scope: !353)
!359 = !DILocation(line: 133, column: 30, scope: !337)
!360 = !DILocation(line: 133, column: 3, scope: !337)
!361 = distinct !{!361, !339, !362}
!362 = !DILocation(line: 137, column: 4, scope: !334)
!363 = !DILocation(line: 138, column: 3, scope: !322)
!364 = !DILocation(line: 139, column: 2, scope: !322)
!365 = !DILocation(line: 140, column: 2, scope: !306)
!366 = !DILocation(line: 141, column: 1, scope: !306)
!367 = distinct !DISubprogram(name: "get_fact", scope: !3, file: !3, line: 143, type: !175, scopeLine: 144, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!368 = !DILocalVariable(name: "c", scope: !367, file: !3, line: 145, type: !30)
!369 = !DILocation(line: 145, column: 6, scope: !367)
!370 = !DILocalVariable(name: "l", scope: !367, file: !3, line: 146, type: !82)
!371 = !DILocation(line: 146, column: 7, scope: !367)
!372 = !DILocation(line: 146, column: 11, scope: !367)
!373 = !DILocation(line: 147, column: 6, scope: !374)
!374 = distinct !DILexicalBlock(scope: !367, file: !3, line: 147, column: 6)
!375 = !DILocation(line: 147, column: 6, scope: !367)
!376 = !DILocation(line: 147, column: 16, scope: !374)
!377 = !DILocation(line: 147, column: 9, scope: !374)
!378 = !DILocation(line: 148, column: 11, scope: !379)
!379 = distinct !DILexicalBlock(scope: !367, file: !3, line: 148, column: 6)
!380 = !DILocation(line: 148, column: 9, scope: !379)
!381 = !DILocation(line: 148, column: 23, scope: !379)
!382 = !DILocation(line: 148, column: 6, scope: !367)
!383 = !DILocation(line: 149, column: 3, scope: !384)
!384 = distinct !DILexicalBlock(scope: !379, file: !3, line: 148, column: 31)
!385 = !DILocation(line: 150, column: 7, scope: !384)
!386 = !DILocation(line: 150, column: 5, scope: !384)
!387 = !DILocation(line: 151, column: 7, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !3, line: 151, column: 7)
!389 = !DILocation(line: 151, column: 18, scope: !388)
!390 = !DILocation(line: 151, column: 7, scope: !384)
!391 = !DILocation(line: 151, column: 26, scope: !388)
!392 = !DILocation(line: 152, column: 3, scope: !384)
!393 = !DILocation(line: 153, column: 10, scope: !384)
!394 = !DILocation(line: 153, column: 3, scope: !384)
!395 = !DILocation(line: 155, column: 2, scope: !367)
!396 = !DILocation(line: 156, column: 1, scope: !367)
!397 = distinct !DISubprogram(name: "parse", scope: !3, file: !3, line: 158, type: !175, scopeLine: 159, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!398 = !DILocalVariable(name: "i", scope: !397, file: !3, line: 160, type: !30)
!399 = !DILocation(line: 160, column: 6, scope: !397)
!400 = !DILocalVariable(name: "ret", scope: !397, file: !3, line: 161, type: !82)
!401 = !DILocation(line: 161, column: 7, scope: !397)
!402 = !DILocation(line: 161, column: 13, scope: !397)
!403 = !DILocation(line: 162, column: 6, scope: !404)
!404 = distinct !DILexicalBlock(scope: !397, file: !3, line: 162, column: 6)
!405 = !DILocation(line: 162, column: 17, scope: !404)
!406 = !DILocation(line: 162, column: 6, scope: !397)
!407 = !DILocation(line: 163, column: 3, scope: !404)
!408 = !DILocation(line: 164, column: 9, scope: !409)
!409 = distinct !DILexicalBlock(scope: !397, file: !3, line: 164, column: 2)
!410 = !DILocation(line: 164, column: 7, scope: !409)
!411 = !DILocation(line: 164, column: 14, scope: !412)
!412 = distinct !DILexicalBlock(scope: !409, file: !3, line: 164, column: 2)
!413 = !DILocation(line: 164, column: 16, scope: !412)
!414 = !DILocation(line: 164, column: 2, scope: !409)
!415 = !DILocation(line: 165, column: 15, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !3, line: 165, column: 7)
!417 = !DILocation(line: 165, column: 8, scope: !416)
!418 = !DILocation(line: 165, column: 18, scope: !416)
!419 = !DILocation(line: 165, column: 7, scope: !412)
!420 = !DILocation(line: 166, column: 4, scope: !416)
!421 = !DILocation(line: 164, column: 29, scope: !412)
!422 = !DILocation(line: 164, column: 2, scope: !412)
!423 = distinct !{!423, !414, !424}
!424 = !DILocation(line: 166, column: 34, scope: !409)
!425 = !DILocation(line: 167, column: 9, scope: !397)
!426 = !DILocation(line: 167, column: 2, scope: !397)
!427 = distinct !DISubprogram(name: "gcd", scope: !3, file: !3, line: 173, type: !428, scopeLine: 174, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!428 = !DISubroutineType(types: !429)
!429 = !{!30, !30, !30}
!430 = !DILocalVariable(name: "m", arg: 1, scope: !427, file: !3, line: 173, type: !30)
!431 = !DILocation(line: 173, column: 13, scope: !427)
!432 = !DILocalVariable(name: "n", arg: 2, scope: !427, file: !3, line: 173, type: !30)
!433 = !DILocation(line: 173, column: 20, scope: !427)
!434 = !DILocalVariable(name: "t", scope: !427, file: !3, line: 175, type: !30)
!435 = !DILocation(line: 175, column: 6, scope: !427)
!436 = !DILocation(line: 176, column: 2, scope: !427)
!437 = !DILocation(line: 176, column: 9, scope: !427)
!438 = !DILocation(line: 177, column: 7, scope: !439)
!439 = distinct !DILexicalBlock(scope: !427, file: !3, line: 176, column: 12)
!440 = !DILocation(line: 177, column: 5, scope: !439)
!441 = !DILocation(line: 177, column: 14, scope: !439)
!442 = !DILocation(line: 177, column: 18, scope: !439)
!443 = !DILocation(line: 177, column: 16, scope: !439)
!444 = !DILocation(line: 177, column: 12, scope: !439)
!445 = !DILocation(line: 177, column: 25, scope: !439)
!446 = !DILocation(line: 177, column: 23, scope: !439)
!447 = distinct !{!447, !436, !448}
!448 = !DILocation(line: 178, column: 2, scope: !427)
!449 = !DILocation(line: 179, column: 9, scope: !427)
!450 = !DILocation(line: 179, column: 2, scope: !427)
!451 = distinct !DISubprogram(name: "eval_tree", scope: !3, file: !3, line: 183, type: !452, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!452 = !DISubroutineType(types: !453)
!453 = !{null, !82, !454}
!454 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac", file: !3, line: 170, baseType: !455)
!455 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !456, size: 64)
!456 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "frac_t", file: !3, line: 171, size: 64, elements: !457)
!457 = !{!458, !459}
!458 = !DIDerivedType(tag: DW_TAG_member, name: "denom", scope: !456, file: !3, line: 171, baseType: !30, size: 32)
!459 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !456, file: !3, line: 171, baseType: !30, size: 32, offset: 32)
!460 = !DILocalVariable(name: "e", arg: 1, scope: !451, file: !3, line: 183, type: !82)
!461 = !DILocation(line: 183, column: 21, scope: !451)
!462 = !DILocalVariable(name: "res", arg: 2, scope: !451, file: !3, line: 183, type: !454)
!463 = !DILocation(line: 183, column: 29, scope: !451)
!464 = !DILocalVariable(name: "l", scope: !451, file: !3, line: 185, type: !465)
!465 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac_t", file: !3, line: 170, baseType: !456)
!466 = !DILocation(line: 185, column: 9, scope: !451)
!467 = !DILocalVariable(name: "r", scope: !451, file: !3, line: 185, type: !465)
!468 = !DILocation(line: 185, column: 12, scope: !451)
!469 = !DILocalVariable(name: "t", scope: !451, file: !3, line: 186, type: !30)
!470 = !DILocation(line: 186, column: 6, scope: !451)
!471 = !DILocation(line: 187, column: 6, scope: !472)
!472 = distinct !DILexicalBlock(scope: !451, file: !3, line: 187, column: 6)
!473 = !DILocation(line: 187, column: 9, scope: !472)
!474 = !DILocation(line: 187, column: 12, scope: !472)
!475 = !DILocation(line: 187, column: 6, scope: !451)
!476 = !DILocation(line: 188, column: 14, scope: !477)
!477 = distinct !DILexicalBlock(scope: !472, file: !3, line: 187, column: 23)
!478 = !DILocation(line: 188, column: 17, scope: !477)
!479 = !DILocation(line: 188, column: 3, scope: !477)
!480 = !DILocation(line: 188, column: 8, scope: !477)
!481 = !DILocation(line: 188, column: 12, scope: !477)
!482 = !DILocation(line: 189, column: 3, scope: !477)
!483 = !DILocation(line: 189, column: 8, scope: !477)
!484 = !DILocation(line: 189, column: 14, scope: !477)
!485 = !DILocation(line: 190, column: 3, scope: !477)
!486 = !DILocation(line: 193, column: 12, scope: !451)
!487 = !DILocation(line: 193, column: 15, scope: !451)
!488 = !DILocation(line: 193, column: 2, scope: !451)
!489 = !DILocation(line: 194, column: 12, scope: !451)
!490 = !DILocation(line: 194, column: 15, scope: !451)
!491 = !DILocation(line: 194, column: 2, scope: !451)
!492 = !DILocation(line: 196, column: 9, scope: !451)
!493 = !DILocation(line: 196, column: 12, scope: !451)
!494 = !DILocation(line: 196, column: 2, scope: !451)
!495 = !DILocation(line: 198, column: 16, scope: !496)
!496 = distinct !DILexicalBlock(scope: !451, file: !3, line: 196, column: 16)
!497 = !DILocation(line: 198, column: 24, scope: !496)
!498 = !DILocation(line: 198, column: 20, scope: !496)
!499 = !DILocation(line: 198, column: 34, scope: !496)
!500 = !DILocation(line: 198, column: 44, scope: !496)
!501 = !DILocation(line: 198, column: 40, scope: !496)
!502 = !DILocation(line: 198, column: 30, scope: !496)
!503 = !DILocation(line: 198, column: 3, scope: !496)
!504 = !DILocation(line: 198, column: 8, scope: !496)
!505 = !DILocation(line: 198, column: 12, scope: !496)
!506 = !DILocation(line: 199, column: 18, scope: !496)
!507 = !DILocation(line: 199, column: 28, scope: !496)
!508 = !DILocation(line: 199, column: 24, scope: !496)
!509 = !DILocation(line: 199, column: 3, scope: !496)
!510 = !DILocation(line: 199, column: 8, scope: !496)
!511 = !DILocation(line: 199, column: 14, scope: !496)
!512 = !DILocation(line: 200, column: 3, scope: !496)
!513 = !DILocation(line: 202, column: 16, scope: !496)
!514 = !DILocation(line: 202, column: 24, scope: !496)
!515 = !DILocation(line: 202, column: 20, scope: !496)
!516 = !DILocation(line: 202, column: 34, scope: !496)
!517 = !DILocation(line: 202, column: 44, scope: !496)
!518 = !DILocation(line: 202, column: 40, scope: !496)
!519 = !DILocation(line: 202, column: 30, scope: !496)
!520 = !DILocation(line: 202, column: 3, scope: !496)
!521 = !DILocation(line: 202, column: 8, scope: !496)
!522 = !DILocation(line: 202, column: 12, scope: !496)
!523 = !DILocation(line: 203, column: 18, scope: !496)
!524 = !DILocation(line: 203, column: 28, scope: !496)
!525 = !DILocation(line: 203, column: 24, scope: !496)
!526 = !DILocation(line: 203, column: 3, scope: !496)
!527 = !DILocation(line: 203, column: 8, scope: !496)
!528 = !DILocation(line: 203, column: 14, scope: !496)
!529 = !DILocation(line: 204, column: 3, scope: !496)
!530 = !DILocation(line: 206, column: 16, scope: !496)
!531 = !DILocation(line: 206, column: 24, scope: !496)
!532 = !DILocation(line: 206, column: 20, scope: !496)
!533 = !DILocation(line: 206, column: 3, scope: !496)
!534 = !DILocation(line: 206, column: 8, scope: !496)
!535 = !DILocation(line: 206, column: 12, scope: !496)
!536 = !DILocation(line: 207, column: 18, scope: !496)
!537 = !DILocation(line: 207, column: 28, scope: !496)
!538 = !DILocation(line: 207, column: 24, scope: !496)
!539 = !DILocation(line: 207, column: 3, scope: !496)
!540 = !DILocation(line: 207, column: 8, scope: !496)
!541 = !DILocation(line: 207, column: 14, scope: !496)
!542 = !DILocation(line: 208, column: 3, scope: !496)
!543 = !DILocation(line: 210, column: 16, scope: !496)
!544 = !DILocation(line: 210, column: 24, scope: !496)
!545 = !DILocation(line: 210, column: 20, scope: !496)
!546 = !DILocation(line: 210, column: 3, scope: !496)
!547 = !DILocation(line: 210, column: 8, scope: !496)
!548 = !DILocation(line: 210, column: 12, scope: !496)
!549 = !DILocation(line: 211, column: 18, scope: !496)
!550 = !DILocation(line: 211, column: 28, scope: !496)
!551 = !DILocation(line: 211, column: 24, scope: !496)
!552 = !DILocation(line: 211, column: 3, scope: !496)
!553 = !DILocation(line: 211, column: 8, scope: !496)
!554 = !DILocation(line: 211, column: 14, scope: !496)
!555 = !DILocation(line: 212, column: 3, scope: !496)
!556 = !DILocation(line: 214, column: 15, scope: !557)
!557 = distinct !DILexicalBlock(scope: !451, file: !3, line: 214, column: 6)
!558 = !DILocation(line: 214, column: 20, scope: !557)
!559 = !DILocation(line: 214, column: 27, scope: !557)
!560 = !DILocation(line: 214, column: 32, scope: !557)
!561 = !DILocation(line: 214, column: 11, scope: !557)
!562 = !DILocation(line: 214, column: 9, scope: !557)
!563 = !DILocation(line: 214, column: 6, scope: !451)
!564 = !DILocation(line: 215, column: 17, scope: !565)
!565 = distinct !DILexicalBlock(scope: !557, file: !3, line: 214, column: 39)
!566 = !DILocation(line: 215, column: 3, scope: !565)
!567 = !DILocation(line: 215, column: 8, scope: !565)
!568 = !DILocation(line: 215, column: 14, scope: !565)
!569 = !DILocation(line: 216, column: 15, scope: !565)
!570 = !DILocation(line: 216, column: 3, scope: !565)
!571 = !DILocation(line: 216, column: 8, scope: !565)
!572 = !DILocation(line: 216, column: 12, scope: !565)
!573 = !DILocation(line: 217, column: 2, scope: !565)
!574 = !DILocation(line: 218, column: 1, scope: !451)
!575 = distinct !DISubprogram(name: "get_input", scope: !3, file: !3, line: 220, type: !95, scopeLine: 221, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!576 = !DILocalVariable(name: "i", scope: !575, file: !3, line: 222, type: !30)
!577 = !DILocation(line: 222, column: 6, scope: !575)
!578 = !DILocation(line: 222, column: 2, scope: !575)
!579 = !DILabel(scope: !575, name: "reinput", file: !3, line: 223)
!580 = !DILocation(line: 223, column: 1, scope: !575)
!581 = !DILocation(line: 224, column: 2, scope: !575)
!582 = !DILocation(line: 225, column: 2, scope: !575)
!583 = !DILocation(line: 226, column: 9, scope: !584)
!584 = distinct !DILexicalBlock(scope: !575, file: !3, line: 226, column: 2)
!585 = !DILocation(line: 226, column: 7, scope: !584)
!586 = !DILocation(line: 226, column: 14, scope: !587)
!587 = distinct !DILexicalBlock(scope: !584, file: !3, line: 226, column: 2)
!588 = !DILocation(line: 226, column: 16, scope: !587)
!589 = !DILocation(line: 226, column: 2, scope: !584)
!590 = !DILocation(line: 227, column: 24, scope: !587)
!591 = !DILocation(line: 227, column: 17, scope: !587)
!592 = !DILocation(line: 227, column: 27, scope: !587)
!593 = !DILocation(line: 227, column: 3, scope: !587)
!594 = !DILocation(line: 226, column: 29, scope: !587)
!595 = !DILocation(line: 226, column: 2, scope: !587)
!596 = distinct !{!596, !589, !597}
!597 = !DILocation(line: 227, column: 30, scope: !584)
!598 = !DILocation(line: 228, column: 2, scope: !575)
!599 = !DILocation(line: 231, column: 2, scope: !575)
!600 = !DILocation(line: 232, column: 10, scope: !601)
!601 = distinct !DILexicalBlock(scope: !602, file: !3, line: 232, column: 3)
!602 = distinct !DILexicalBlock(scope: !575, file: !3, line: 231, column: 12)
!603 = !DILocation(line: 232, column: 8, scope: !601)
!604 = !DILocation(line: 232, column: 15, scope: !605)
!605 = distinct !DILexicalBlock(scope: !601, file: !3, line: 232, column: 3)
!606 = !DILocation(line: 232, column: 17, scope: !605)
!607 = !DILocation(line: 232, column: 3, scope: !601)
!608 = !DILocation(line: 232, column: 39, scope: !605)
!609 = !DILocation(line: 232, column: 35, scope: !605)
!610 = !DILocation(line: 232, column: 42, scope: !605)
!611 = !DILocation(line: 232, column: 31, scope: !605)
!612 = !DILocation(line: 232, column: 3, scope: !605)
!613 = distinct !{!613, !607, !614}
!614 = !DILocation(line: 232, column: 44, scope: !601)
!615 = !DILocation(line: 233, column: 25, scope: !602)
!616 = !DILocation(line: 233, column: 3, scope: !602)
!617 = !DILocation(line: 234, column: 7, scope: !618)
!618 = distinct !DILexicalBlock(scope: !602, file: !3, line: 234, column: 7)
!619 = !DILocation(line: 234, column: 12, scope: !618)
!620 = !DILocation(line: 234, column: 7, scope: !602)
!621 = !DILocation(line: 234, column: 21, scope: !618)
!622 = !DILocation(line: 235, column: 7, scope: !623)
!623 = distinct !DILexicalBlock(scope: !602, file: !3, line: 235, column: 7)
!624 = !DILocation(line: 235, column: 26, scope: !623)
!625 = !DILocation(line: 235, column: 7, scope: !602)
!626 = !DILocation(line: 236, column: 4, scope: !623)
!627 = !DILocation(line: 238, column: 10, scope: !628)
!628 = distinct !DILexicalBlock(scope: !602, file: !3, line: 238, column: 3)
!629 = !DILocation(line: 238, column: 8, scope: !628)
!630 = !DILocation(line: 238, column: 15, scope: !631)
!631 = distinct !DILexicalBlock(scope: !628, file: !3, line: 238, column: 3)
!632 = !DILocation(line: 238, column: 17, scope: !631)
!633 = !DILocation(line: 238, column: 3, scope: !628)
!634 = !DILocation(line: 239, column: 12, scope: !635)
!635 = distinct !DILexicalBlock(scope: !631, file: !3, line: 239, column: 8)
!636 = !DILocation(line: 239, column: 8, scope: !635)
!637 = !DILocation(line: 239, column: 15, scope: !635)
!638 = !DILocation(line: 239, column: 8, scope: !631)
!639 = !DILocation(line: 239, column: 28, scope: !635)
!640 = !DILocation(line: 239, column: 24, scope: !635)
!641 = !DILocation(line: 239, column: 31, scope: !635)
!642 = !DILocation(line: 239, column: 18, scope: !635)
!643 = !DILocation(line: 238, column: 31, scope: !631)
!644 = !DILocation(line: 238, column: 3, scope: !631)
!645 = distinct !{!645, !633, !646}
!646 = !DILocation(line: 239, column: 33, scope: !628)
!647 = !DILocation(line: 240, column: 7, scope: !648)
!648 = distinct !DILexicalBlock(scope: !602, file: !3, line: 240, column: 7)
!649 = !DILocation(line: 240, column: 14, scope: !648)
!650 = !DILocation(line: 240, column: 7, scope: !602)
!651 = !DILocation(line: 241, column: 4, scope: !652)
!652 = distinct !DILexicalBlock(scope: !648, file: !3, line: 240, column: 22)
!653 = !DILocation(line: 242, column: 4, scope: !652)
!654 = !DILocation(line: 244, column: 7, scope: !655)
!655 = distinct !DILexicalBlock(scope: !602, file: !3, line: 244, column: 7)
!656 = !DILocation(line: 244, column: 14, scope: !655)
!657 = !DILocation(line: 244, column: 7, scope: !602)
!658 = !DILocation(line: 245, column: 4, scope: !659)
!659 = distinct !DILexicalBlock(scope: !655, file: !3, line: 244, column: 22)
!660 = !DILocation(line: 246, column: 4, scope: !659)
!661 = !DILocation(line: 248, column: 3, scope: !602)
!662 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 252, type: !187, scopeLine: 253, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!663 = !DILocalVariable(name: "f", scope: !662, file: !3, line: 254, type: !465)
!664 = !DILocation(line: 254, column: 9, scope: !662)
!665 = !DILocation(line: 255, column: 8, scope: !662)
!666 = !DILocation(line: 255, column: 2, scope: !662)
!667 = !DILocation(line: 257, column: 2, scope: !662)
!668 = !DILocation(line: 258, column: 2, scope: !662)
!669 = !DILocation(line: 259, column: 3, scope: !670)
!670 = distinct !DILexicalBlock(scope: !662, file: !3, line: 258, column: 11)
!671 = !DILocation(line: 260, column: 3, scope: !670)
!672 = !DILocation(line: 261, column: 7, scope: !673)
!673 = distinct !DILexicalBlock(scope: !670, file: !3, line: 261, column: 7)
!674 = !DILocation(line: 261, column: 7, scope: !670)
!675 = !DILocation(line: 263, column: 29, scope: !676)
!676 = distinct !DILexicalBlock(scope: !673, file: !3, line: 261, column: 12)
!677 = !DILocation(line: 263, column: 34, scope: !676)
!678 = !DILocation(line: 263, column: 4, scope: !676)
!679 = !DILocation(line: 264, column: 4, scope: !676)
!680 = distinct !{!680, !668, !681}
!681 = !DILocation(line: 279, column: 2, scope: !662)
!682 = !DILocation(line: 267, column: 13, scope: !670)
!683 = !DILocation(line: 267, column: 3, scope: !670)
!684 = !DILocation(line: 269, column: 9, scope: !685)
!685 = distinct !DILexicalBlock(scope: !670, file: !3, line: 269, column: 7)
!686 = !DILocation(line: 269, column: 15, scope: !685)
!687 = !DILocation(line: 269, column: 7, scope: !670)
!688 = !DILocation(line: 269, column: 21, scope: !685)
!689 = !DILocation(line: 270, column: 9, scope: !690)
!690 = distinct !DILexicalBlock(scope: !670, file: !3, line: 270, column: 7)
!691 = !DILocation(line: 270, column: 15, scope: !690)
!692 = !DILocation(line: 270, column: 20, scope: !690)
!693 = !DILocation(line: 270, column: 25, scope: !690)
!694 = !DILocation(line: 270, column: 29, scope: !690)
!695 = !DILocation(line: 270, column: 7, scope: !670)
!696 = !DILocation(line: 271, column: 4, scope: !690)
!697 = !DILocation(line: 273, column: 10, scope: !698)
!698 = distinct !DILexicalBlock(scope: !699, file: !3, line: 273, column: 8)
!699 = distinct !DILexicalBlock(scope: !690, file: !3, line: 272, column: 8)
!700 = !DILocation(line: 273, column: 16, scope: !698)
!701 = !DILocation(line: 273, column: 8, scope: !699)
!702 = !DILocation(line: 274, column: 31, scope: !698)
!703 = !DILocation(line: 274, column: 5, scope: !698)
!704 = !DILocation(line: 276, column: 34, scope: !698)
!705 = !DILocation(line: 276, column: 41, scope: !698)
!706 = !DILocation(line: 276, column: 5, scope: !698)
!707 = !DILocation(line: 277, column: 4, scope: !699)
