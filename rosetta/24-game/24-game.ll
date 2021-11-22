; ModuleID = '24-game.c'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !180, !cf.info !181

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @pool_ptr, align 4, !dbg !182
  %inc = add nsw i32 %1, 1, !dbg !182
  store i32 %inc, i32* @pool_ptr, align 4, !dbg !182
  %idx.ext = sext i32 %1 to i64, !dbg !183
  %add.ptr = getelementptr inbounds %struct.expr_t, %struct.expr_t* getelementptr inbounds ([8 x %struct.expr_t], [8 x %struct.expr_t]* @pool, i64 0, i64 0), i64 %idx.ext, !dbg !183
  store %struct.expr_t* %add.ptr, %struct.expr_t** %retval, align 8, !dbg !184
  br label %return, !dbg !184

if.end:                                           ; preds = %entry
  store %struct.expr_t* null, %struct.expr_t** %retval, align 8, !dbg !185
  br label %return, !dbg !185

return:                                           ; preds = %if.end, %if.then
  %2 = load %struct.expr_t*, %struct.expr_t** %retval, align 8, !dbg !186
  ret %struct.expr_t* %2, !dbg !186
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @next_tok() #0 !dbg !187 {
entry:
  br label %while.cond, !dbg !190

while.cond:                                       ; preds = %while.body, %entry
  %call = call i16** @__ctype_b_loc() #9, !dbg !191
  %0 = load i16*, i16** %call, align 8, !dbg !191
  %1 = load i32, i32* @pos, align 4, !dbg !191
  %idxprom = sext i32 %1 to i64, !dbg !191
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom, !dbg !191
  %2 = load i8, i8* %arrayidx, align 1, !dbg !191
  %conv = sext i8 %2 to i32, !dbg !191
  %idxprom1 = sext i32 %conv to i64, !dbg !191
  %arrayidx2 = getelementptr inbounds i16, i16* %0, i64 %idxprom1, !dbg !191
  %3 = load i16, i16* %arrayidx2, align 2, !dbg !191
  %conv3 = zext i16 %3 to i32, !dbg !191
  %and = and i32 %conv3, 8192, !dbg !191
  %tobool = icmp ne i32 %and, 0, !dbg !190
  br i1 %tobool, label %while.body, label %while.end, !dbg !190

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* @pos, align 4, !dbg !192
  %inc = add nsw i32 %4, 1, !dbg !192
  store i32 %inc, i32* @pos, align 4, !dbg !192
  br label %while.cond, !dbg !190, !llvm.loop !193

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* @pos, align 4, !dbg !194
  %idxprom4 = sext i32 %5 to i64, !dbg !195
  %arrayidx5 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom4, !dbg !195
  %6 = load i8, i8* %arrayidx5, align 1, !dbg !195
  %conv6 = sext i8 %6 to i32, !dbg !195
  ret i32 %conv6, !dbg !196
}

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @take() #0 !dbg !197 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @pos, align 4, !dbg !198
  %idxprom = sext i32 %0 to i64, !dbg !200
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom, !dbg !200
  %1 = load i8, i8* %arrayidx, align 1, !dbg !200
  %conv = sext i8 %1 to i32, !dbg !200
  %cmp = icmp ne i32 %conv, 0, !dbg !201
  br i1 %cmp, label %if.then, label %if.end, !dbg !202, !cf.info !181

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @pos, align 4, !dbg !203
  %inc = add nsw i32 %2, 1, !dbg !203
  store i32 %inc, i32* @pos, align 4, !dbg !203
  store i32 %inc, i32* %retval, align 4, !dbg !204
  br label %return, !dbg !204

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !205
  br label %return, !dbg !205

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !206
  ret i32 %3, !dbg !206
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_expr() #0 !dbg !207 {
entry:
  %c = alloca i32, align 4
  %l = alloca %struct.expr_t*, align 8
  %r = alloca %struct.expr_t*, align 8
  %ret = alloca %struct.expr_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %c, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata %struct.expr_t** %l, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata %struct.expr_t** %r, metadata !212, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata %struct.expr_t** %ret, metadata !214, metadata !DIExpression()), !dbg !215
  %call = call %struct.expr_t* @get_term(), !dbg !216
  store %struct.expr_t* %call, %struct.expr_t** %ret, align 8, !dbg !218
  %tobool = icmp ne %struct.expr_t* %call, null, !dbg !218
  br i1 %tobool, label %if.end, label %if.then, !dbg !219, !cf.info !181

if.then:                                          ; preds = %entry
  call void @bail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0)), !dbg !220
  br label %if.end, !dbg !220

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !221

while.cond:                                       ; preds = %if.end10, %if.end
  %call1 = call i32 @next_tok(), !dbg !222
  store i32 %call1, i32* %c, align 4, !dbg !223
  %cmp = icmp eq i32 %call1, 43, !dbg !224
  br i1 %cmp, label %lor.end, label %lor.rhs, !dbg !225

lor.rhs:                                          ; preds = %while.cond
  %0 = load i32, i32* %c, align 4, !dbg !226
  %cmp2 = icmp eq i32 %0, 45, !dbg !227
  br label %lor.end, !dbg !225

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %1 = phi i1 [ true, %while.cond ], [ %cmp2, %lor.rhs ]
  br i1 %1, label %while.body, label %while.end, !dbg !221

while.body:                                       ; preds = %lor.end
  %call3 = call i32 @take(), !dbg !228
  %tobool4 = icmp ne i32 %call3, 0, !dbg !228
  br i1 %tobool4, label %if.end6, label %if.then5, !dbg !231, !cf.info !181

if.then5:                                         ; preds = %while.body
  call void @bail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0)), !dbg !232
  br label %if.end6, !dbg !232

if.end6:                                          ; preds = %if.then5, %while.body
  %call7 = call %struct.expr_t* @get_term(), !dbg !233
  store %struct.expr_t* %call7, %struct.expr_t** %r, align 8, !dbg !235
  %tobool8 = icmp ne %struct.expr_t* %call7, null, !dbg !235
  br i1 %tobool8, label %if.end10, label %if.then9, !dbg !236, !cf.info !181

if.then9:                                         ; preds = %if.end6
  call void @bail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0)), !dbg !237
  br label %if.end10, !dbg !237

if.end10:                                         ; preds = %if.then9, %if.end6
  %2 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !238
  store %struct.expr_t* %2, %struct.expr_t** %l, align 8, !dbg !239
  %call11 = call %struct.expr_t* @new_expr(), !dbg !240
  store %struct.expr_t* %call11, %struct.expr_t** %ret, align 8, !dbg !241
  %3 = load i32, i32* %c, align 4, !dbg !242
  %cmp12 = icmp eq i32 %3, 43, !dbg !243
  %4 = zext i1 %cmp12 to i64, !dbg !244
  %cond = select i1 %cmp12, i32 2, i32 3, !dbg !244
  %5 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !245
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %5, i32 0, i32 0, !dbg !246
  store i32 %cond, i32* %op, align 8, !dbg !247
  %6 = load %struct.expr_t*, %struct.expr_t** %l, align 8, !dbg !248
  %7 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !249
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %7, i32 0, i32 3, !dbg !250
  store %struct.expr_t* %6, %struct.expr_t** %left, align 8, !dbg !251
  %8 = load %struct.expr_t*, %struct.expr_t** %r, align 8, !dbg !252
  %9 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !253
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %9, i32 0, i32 4, !dbg !254
  store %struct.expr_t* %8, %struct.expr_t** %right, align 8, !dbg !255
  br label %while.cond, !dbg !221, !llvm.loop !256

while.end:                                        ; preds = %lor.end
  %10 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !258
  ret %struct.expr_t* %10, !dbg !259
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_term() #0 !dbg !260 {
entry:
  %c = alloca i32, align 4
  %l = alloca %struct.expr_t*, align 8
  %r = alloca %struct.expr_t*, align 8
  %ret = alloca %struct.expr_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %c, metadata !261, metadata !DIExpression()), !dbg !262
  call void @llvm.dbg.declare(metadata %struct.expr_t** %l, metadata !263, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.declare(metadata %struct.expr_t** %r, metadata !265, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata %struct.expr_t** %ret, metadata !267, metadata !DIExpression()), !dbg !268
  %call = call %struct.expr_t* @get_fact(), !dbg !269
  store %struct.expr_t* %call, %struct.expr_t** %ret, align 8, !dbg !270
  br label %while.cond, !dbg !271

while.cond:                                       ; preds = %if.end, %entry
  %call1 = call i32 @next_tok(), !dbg !272
  store i32 %call1, i32* %c, align 4, !dbg !273
  %cmp = icmp eq i32 %call1, 42, !dbg !274
  br i1 %cmp, label %lor.end, label %lor.rhs, !dbg !275

lor.rhs:                                          ; preds = %while.cond
  %0 = load i32, i32* %c, align 4, !dbg !276
  %cmp2 = icmp eq i32 %0, 47, !dbg !277
  br label %lor.end, !dbg !275

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %1 = phi i1 [ true, %while.cond ], [ %cmp2, %lor.rhs ]
  br i1 %1, label %while.body, label %while.end, !dbg !271

while.body:                                       ; preds = %lor.end
  %call3 = call i32 @take(), !dbg !278
  %tobool = icmp ne i32 %call3, 0, !dbg !278
  br i1 %tobool, label %if.end, label %if.then, !dbg !281, !cf.info !181

if.then:                                          ; preds = %while.body
  call void @bail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0)), !dbg !282
  br label %if.end, !dbg !282

if.end:                                           ; preds = %if.then, %while.body
  %call4 = call %struct.expr_t* @get_fact(), !dbg !283
  store %struct.expr_t* %call4, %struct.expr_t** %r, align 8, !dbg !284
  %2 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !285
  store %struct.expr_t* %2, %struct.expr_t** %l, align 8, !dbg !286
  %call5 = call %struct.expr_t* @new_expr(), !dbg !287
  store %struct.expr_t* %call5, %struct.expr_t** %ret, align 8, !dbg !288
  %3 = load i32, i32* %c, align 4, !dbg !289
  %cmp6 = icmp eq i32 %3, 42, !dbg !290
  %4 = zext i1 %cmp6 to i64, !dbg !291
  %cond = select i1 %cmp6, i32 4, i32 5, !dbg !291
  %5 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !292
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %5, i32 0, i32 0, !dbg !293
  store i32 %cond, i32* %op, align 8, !dbg !294
  %6 = load %struct.expr_t*, %struct.expr_t** %l, align 8, !dbg !295
  %7 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !296
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %7, i32 0, i32 3, !dbg !297
  store %struct.expr_t* %6, %struct.expr_t** %left, align 8, !dbg !298
  %8 = load %struct.expr_t*, %struct.expr_t** %r, align 8, !dbg !299
  %9 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !300
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %9, i32 0, i32 4, !dbg !301
  store %struct.expr_t* %8, %struct.expr_t** %right, align 8, !dbg !302
  br label %while.cond, !dbg !271, !llvm.loop !303

while.end:                                        ; preds = %lor.end
  %10 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !305
  ret %struct.expr_t* %10, !dbg !306
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_digit() #0 !dbg !307 {
entry:
  %retval = alloca %struct.expr_t*, align 8
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %ret = alloca %struct.expr_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !308, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.declare(metadata i32* %c, metadata !310, metadata !DIExpression()), !dbg !311
  %call = call i32 @next_tok(), !dbg !312
  store i32 %call, i32* %c, align 4, !dbg !311
  call void @llvm.dbg.declare(metadata %struct.expr_t** %ret, metadata !313, metadata !DIExpression()), !dbg !314
  %0 = load i32, i32* %c, align 4, !dbg !315
  %cmp = icmp sge i32 %0, 48, !dbg !317
  br i1 %cmp, label %land.lhs.true, label %if.end15, !dbg !318, !cf.info !181

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %c, align 4, !dbg !319
  %cmp1 = icmp sle i32 %1, 57, !dbg !320
  br i1 %cmp1, label %if.then, label %if.end15, !dbg !321, !cf.info !181

if.then:                                          ; preds = %land.lhs.true
  %call2 = call i32 @take(), !dbg !322
  %call3 = call %struct.expr_t* @new_expr(), !dbg !324
  store %struct.expr_t* %call3, %struct.expr_t** %ret, align 8, !dbg !325
  %2 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !326
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %2, i32 0, i32 0, !dbg !327
  store i32 1, i32* %op, align 8, !dbg !328
  %3 = load i32, i32* %c, align 4, !dbg !329
  %sub = sub nsw i32 %3, 48, !dbg !330
  %4 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !331
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %4, i32 0, i32 1, !dbg !332
  store i32 %sub, i32* %val, align 4, !dbg !333
  store i32 0, i32* %i, align 4, !dbg !334
  br label %for.cond, !dbg !336

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !337
  %cmp4 = icmp slt i32 %5, 4, !dbg !339
  br i1 %cmp4, label %for.body, label %for.end, !dbg !340

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !341
  %idxprom = sext i32 %6 to i64, !dbg !343
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !343
  %val5 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 1, !dbg !344
  %7 = load i32, i32* %val5, align 4, !dbg !344
  %8 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !345
  %val6 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %8, i32 0, i32 1, !dbg !346
  %9 = load i32, i32* %val6, align 4, !dbg !346
  %cmp7 = icmp eq i32 %7, %9, !dbg !347
  br i1 %cmp7, label %land.lhs.true8, label %if.end, !dbg !348, !cf.info !181

land.lhs.true8:                                   ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !349
  %idxprom9 = sext i32 %10 to i64, !dbg !350
  %arrayidx10 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom9, !dbg !350
  %used = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx10, i32 0, i32 2, !dbg !351
  %11 = load i32, i32* %used, align 8, !dbg !351
  %tobool = icmp ne i32 %11, 0, !dbg !350
  br i1 %tobool, label %if.end, label %if.then11, !dbg !352, !cf.info !181

if.then11:                                        ; preds = %land.lhs.true8
  %12 = load i32, i32* %i, align 4, !dbg !353
  %idxprom12 = sext i32 %12 to i64, !dbg !355
  %arrayidx13 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom12, !dbg !355
  %used14 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx13, i32 0, i32 2, !dbg !356
  store i32 1, i32* %used14, align 8, !dbg !357
  %13 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !358
  store %struct.expr_t* %13, %struct.expr_t** %retval, align 8, !dbg !359
  br label %return, !dbg !359

if.end:                                           ; preds = %land.lhs.true8, %for.body
  br label %for.inc, !dbg !351

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %i, align 4, !dbg !360
  %inc = add nsw i32 %14, 1, !dbg !360
  store i32 %inc, i32* %i, align 4, !dbg !360
  br label %for.cond, !dbg !361, !llvm.loop !362

for.end:                                          ; preds = %for.cond
  call void @bail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0)), !dbg !364
  br label %if.end15, !dbg !365

if.end15:                                         ; preds = %for.end, %land.lhs.true, %entry
  store %struct.expr_t* null, %struct.expr_t** %retval, align 8, !dbg !366
  br label %return, !dbg !366

return:                                           ; preds = %if.end15, %if.then11
  %15 = load %struct.expr_t*, %struct.expr_t** %retval, align 8, !dbg !367
  ret %struct.expr_t* %15, !dbg !367
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @get_fact() #0 !dbg !368 {
entry:
  %retval = alloca %struct.expr_t*, align 8
  %c = alloca i32, align 4
  %l = alloca %struct.expr_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %c, metadata !369, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.declare(metadata %struct.expr_t** %l, metadata !371, metadata !DIExpression()), !dbg !372
  %call = call %struct.expr_t* @get_digit(), !dbg !373
  store %struct.expr_t* %call, %struct.expr_t** %l, align 8, !dbg !372
  %0 = load %struct.expr_t*, %struct.expr_t** %l, align 8, !dbg !374
  %tobool = icmp ne %struct.expr_t* %0, null, !dbg !374
  br i1 %tobool, label %if.then, label %if.end, !dbg !376, !cf.info !181

if.then:                                          ; preds = %entry
  %1 = load %struct.expr_t*, %struct.expr_t** %l, align 8, !dbg !377
  store %struct.expr_t* %1, %struct.expr_t** %retval, align 8, !dbg !378
  br label %return, !dbg !378

if.end:                                           ; preds = %entry
  %call1 = call i32 @next_tok(), !dbg !379
  store i32 %call1, i32* %c, align 4, !dbg !381
  %cmp = icmp eq i32 %call1, 40, !dbg !382
  br i1 %cmp, label %if.then2, label %if.end10, !dbg !383, !cf.info !181

if.then2:                                         ; preds = %if.end
  %call3 = call i32 @take(), !dbg !384
  %call4 = call %struct.expr_t* @get_expr(), !dbg !386
  store %struct.expr_t* %call4, %struct.expr_t** %l, align 8, !dbg !387
  %call5 = call i32 @next_tok(), !dbg !388
  %cmp6 = icmp ne i32 %call5, 41, !dbg !390
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !391, !cf.info !181

if.then7:                                         ; preds = %if.then2
  call void @bail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !392
  br label %if.end8, !dbg !392

if.end8:                                          ; preds = %if.then7, %if.then2
  %call9 = call i32 @take(), !dbg !393
  %2 = load %struct.expr_t*, %struct.expr_t** %l, align 8, !dbg !394
  store %struct.expr_t* %2, %struct.expr_t** %retval, align 8, !dbg !395
  br label %return, !dbg !395

if.end10:                                         ; preds = %if.end
  store %struct.expr_t* null, %struct.expr_t** %retval, align 8, !dbg !396
  br label %return, !dbg !396

return:                                           ; preds = %if.end10, %if.end8, %if.then
  %3 = load %struct.expr_t*, %struct.expr_t** %retval, align 8, !dbg !397
  ret %struct.expr_t* %3, !dbg !397
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.expr_t* @parse() #0 !dbg !398 {
entry:
  %i = alloca i32, align 4
  %ret = alloca %struct.expr_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !399, metadata !DIExpression()), !dbg !400
  call void @llvm.dbg.declare(metadata %struct.expr_t** %ret, metadata !401, metadata !DIExpression()), !dbg !402
  %call = call %struct.expr_t* @get_expr(), !dbg !403
  store %struct.expr_t* %call, %struct.expr_t** %ret, align 8, !dbg !402
  %call1 = call i32 @next_tok(), !dbg !404
  %cmp = icmp ne i32 %call1, 0, !dbg !406
  br i1 %cmp, label %if.then, label %if.end, !dbg !407, !cf.info !181

if.then:                                          ; preds = %entry
  call void @bail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !408
  br label %if.end, !dbg !408

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4, !dbg !409
  br label %for.cond, !dbg !411

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i32, i32* %i, align 4, !dbg !412
  %cmp2 = icmp slt i32 %0, 4, !dbg !414
  br i1 %cmp2, label %for.body, label %for.end, !dbg !415

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !416
  %idxprom = sext i32 %1 to i64, !dbg !418
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !418
  %used = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 2, !dbg !419
  %2 = load i32, i32* %used, align 8, !dbg !419
  %tobool = icmp ne i32 %2, 0, !dbg !418
  br i1 %tobool, label %if.end4, label %if.then3, !dbg !420, !cf.info !181

if.then3:                                         ; preds = %for.body
  call void @bail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0)), !dbg !421
  br label %if.end4, !dbg !421

if.end4:                                          ; preds = %if.then3, %for.body
  br label %for.inc, !dbg !419

for.inc:                                          ; preds = %if.end4
  %3 = load i32, i32* %i, align 4, !dbg !422
  %inc = add nsw i32 %3, 1, !dbg !422
  store i32 %inc, i32* %i, align 4, !dbg !422
  br label %for.cond, !dbg !423, !llvm.loop !424

for.end:                                          ; preds = %for.cond
  %4 = load %struct.expr_t*, %struct.expr_t** %ret, align 8, !dbg !426
  ret %struct.expr_t* %4, !dbg !427
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gcd(i32 %m, i32 %n) #0 !dbg !428 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !431, metadata !DIExpression()), !dbg !432
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !433, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.declare(metadata i32* %t, metadata !435, metadata !DIExpression()), !dbg !436
  br label %while.cond, !dbg !437

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %m.addr, align 4, !dbg !438
  %tobool = icmp ne i32 %0, 0, !dbg !437
  br i1 %tobool, label %while.body, label %while.end, !dbg !437

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %m.addr, align 4, !dbg !439
  store i32 %1, i32* %t, align 4, !dbg !441
  %2 = load i32, i32* %n.addr, align 4, !dbg !442
  %3 = load i32, i32* %m.addr, align 4, !dbg !443
  %rem = srem i32 %2, %3, !dbg !444
  store i32 %rem, i32* %m.addr, align 4, !dbg !445
  %4 = load i32, i32* %t, align 4, !dbg !446
  store i32 %4, i32* %n.addr, align 4, !dbg !447
  br label %while.cond, !dbg !437, !llvm.loop !448

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* %n.addr, align 4, !dbg !450
  ret i32 %5, !dbg !451
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_tree(%struct.expr_t* %e, %struct.frac_t* %res) #0 !dbg !452 {
entry:
  %e.addr = alloca %struct.expr_t*, align 8
  %res.addr = alloca %struct.frac_t*, align 8
  %l = alloca %struct.frac_t, align 4
  %r = alloca %struct.frac_t, align 4
  %t = alloca i32, align 4
  store %struct.expr_t* %e, %struct.expr_t** %e.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.expr_t** %e.addr, metadata !461, metadata !DIExpression()), !dbg !462
  store %struct.frac_t* %res, %struct.frac_t** %res.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.frac_t** %res.addr, metadata !463, metadata !DIExpression()), !dbg !464
  call void @llvm.dbg.declare(metadata %struct.frac_t* %l, metadata !465, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.declare(metadata %struct.frac_t* %r, metadata !468, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.declare(metadata i32* %t, metadata !470, metadata !DIExpression()), !dbg !471
  %0 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !472
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %0, i32 0, i32 0, !dbg !474
  %1 = load i32, i32* %op, align 8, !dbg !474
  %cmp = icmp eq i32 %1, 1, !dbg !475
  br i1 %cmp, label %if.then, label %if.end, !dbg !476, !cf.info !181

if.then:                                          ; preds = %entry
  %2 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !477
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %2, i32 0, i32 1, !dbg !479
  %3 = load i32, i32* %val, align 4, !dbg !479
  %4 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !480
  %num = getelementptr inbounds %struct.frac_t, %struct.frac_t* %4, i32 0, i32 1, !dbg !481
  store i32 %3, i32* %num, align 4, !dbg !482
  %5 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !483
  %denom = getelementptr inbounds %struct.frac_t, %struct.frac_t* %5, i32 0, i32 0, !dbg !484
  store i32 1, i32* %denom, align 4, !dbg !485
  br label %if.end48, !dbg !486

if.end:                                           ; preds = %entry
  %6 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !487
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %6, i32 0, i32 3, !dbg !488
  %7 = load %struct.expr_t*, %struct.expr_t** %left, align 8, !dbg !488
  call void @eval_tree(%struct.expr_t* %7, %struct.frac_t* %l), !dbg !489
  %8 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !490
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %8, i32 0, i32 4, !dbg !491
  %9 = load %struct.expr_t*, %struct.expr_t** %right, align 8, !dbg !491
  call void @eval_tree(%struct.expr_t* %9, %struct.frac_t* %r), !dbg !492
  %10 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !493
  %op1 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %10, i32 0, i32 0, !dbg !494
  %11 = load i32, i32* %op1, align 8, !dbg !494
  switch i32 %11, label %sw.epilog [
    i32 2, label %sw.bb
    i32 3, label %sw.bb12
    i32 4, label %sw.bb24
    i32 5, label %sw.bb33
  ], !dbg !495

sw.bb:                                            ; preds = %if.end
  %num2 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !496
  %12 = load i32, i32* %num2, align 4, !dbg !496
  %denom3 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !498
  %13 = load i32, i32* %denom3, align 4, !dbg !498
  %mul = mul nsw i32 %12, %13, !dbg !499
  %denom4 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !500
  %14 = load i32, i32* %denom4, align 4, !dbg !500
  %num5 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !501
  %15 = load i32, i32* %num5, align 4, !dbg !501
  %mul6 = mul nsw i32 %14, %15, !dbg !502
  %add = add nsw i32 %mul, %mul6, !dbg !503
  %16 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !504
  %num7 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %16, i32 0, i32 1, !dbg !505
  store i32 %add, i32* %num7, align 4, !dbg !506
  %denom8 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !507
  %17 = load i32, i32* %denom8, align 4, !dbg !507
  %denom9 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !508
  %18 = load i32, i32* %denom9, align 4, !dbg !508
  %mul10 = mul nsw i32 %17, %18, !dbg !509
  %19 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !510
  %denom11 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %19, i32 0, i32 0, !dbg !511
  store i32 %mul10, i32* %denom11, align 4, !dbg !512
  br label %sw.epilog, !dbg !513

sw.bb12:                                          ; preds = %if.end
  %num13 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !514
  %20 = load i32, i32* %num13, align 4, !dbg !514
  %denom14 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !515
  %21 = load i32, i32* %denom14, align 4, !dbg !515
  %mul15 = mul nsw i32 %20, %21, !dbg !516
  %denom16 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !517
  %22 = load i32, i32* %denom16, align 4, !dbg !517
  %num17 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !518
  %23 = load i32, i32* %num17, align 4, !dbg !518
  %mul18 = mul nsw i32 %22, %23, !dbg !519
  %sub = sub nsw i32 %mul15, %mul18, !dbg !520
  %24 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !521
  %num19 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %24, i32 0, i32 1, !dbg !522
  store i32 %sub, i32* %num19, align 4, !dbg !523
  %denom20 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !524
  %25 = load i32, i32* %denom20, align 4, !dbg !524
  %denom21 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !525
  %26 = load i32, i32* %denom21, align 4, !dbg !525
  %mul22 = mul nsw i32 %25, %26, !dbg !526
  %27 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !527
  %denom23 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %27, i32 0, i32 0, !dbg !528
  store i32 %mul22, i32* %denom23, align 4, !dbg !529
  br label %sw.epilog, !dbg !530

sw.bb24:                                          ; preds = %if.end
  %num25 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !531
  %28 = load i32, i32* %num25, align 4, !dbg !531
  %num26 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !532
  %29 = load i32, i32* %num26, align 4, !dbg !532
  %mul27 = mul nsw i32 %28, %29, !dbg !533
  %30 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !534
  %num28 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %30, i32 0, i32 1, !dbg !535
  store i32 %mul27, i32* %num28, align 4, !dbg !536
  %denom29 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !537
  %31 = load i32, i32* %denom29, align 4, !dbg !537
  %denom30 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !538
  %32 = load i32, i32* %denom30, align 4, !dbg !538
  %mul31 = mul nsw i32 %31, %32, !dbg !539
  %33 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !540
  %denom32 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %33, i32 0, i32 0, !dbg !541
  store i32 %mul31, i32* %denom32, align 4, !dbg !542
  br label %sw.epilog, !dbg !543

sw.bb33:                                          ; preds = %if.end
  %num34 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 1, !dbg !544
  %34 = load i32, i32* %num34, align 4, !dbg !544
  %denom35 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 0, !dbg !545
  %35 = load i32, i32* %denom35, align 4, !dbg !545
  %mul36 = mul nsw i32 %34, %35, !dbg !546
  %36 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !547
  %num37 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %36, i32 0, i32 1, !dbg !548
  store i32 %mul36, i32* %num37, align 4, !dbg !549
  %denom38 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %l, i32 0, i32 0, !dbg !550
  %37 = load i32, i32* %denom38, align 4, !dbg !550
  %num39 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %r, i32 0, i32 1, !dbg !551
  %38 = load i32, i32* %num39, align 4, !dbg !551
  %mul40 = mul nsw i32 %37, %38, !dbg !552
  %39 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !553
  %denom41 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %39, i32 0, i32 0, !dbg !554
  store i32 %mul40, i32* %denom41, align 4, !dbg !555
  br label %sw.epilog, !dbg !556

sw.epilog:                                        ; preds = %if.end, %sw.bb33, %sw.bb24, %sw.bb12, %sw.bb
  %40 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !557
  %denom42 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %40, i32 0, i32 0, !dbg !559
  %41 = load i32, i32* %denom42, align 4, !dbg !559
  %42 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !560
  %num43 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %42, i32 0, i32 1, !dbg !561
  %43 = load i32, i32* %num43, align 4, !dbg !561
  %call = call i32 @gcd(i32 %41, i32 %43), !dbg !562
  store i32 %call, i32* %t, align 4, !dbg !563
  %tobool = icmp ne i32 %call, 0, !dbg !563
  br i1 %tobool, label %if.then44, label %if.end48, !dbg !564, !cf.info !181

if.then44:                                        ; preds = %sw.epilog
  %44 = load i32, i32* %t, align 4, !dbg !565
  %45 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !567
  %denom45 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %45, i32 0, i32 0, !dbg !568
  %46 = load i32, i32* %denom45, align 4, !dbg !569
  %div = sdiv i32 %46, %44, !dbg !569
  store i32 %div, i32* %denom45, align 4, !dbg !569
  %47 = load i32, i32* %t, align 4, !dbg !570
  %48 = load %struct.frac_t*, %struct.frac_t** %res.addr, align 8, !dbg !571
  %num46 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %48, i32 0, i32 1, !dbg !572
  %49 = load i32, i32* %num46, align 4, !dbg !573
  %div47 = sdiv i32 %49, %47, !dbg !573
  store i32 %div47, i32* %num46, align 4, !dbg !573
  br label %if.end48, !dbg !574

if.end48:                                         ; preds = %if.then, %if.then44, %sw.epilog
  ret void, !dbg !575
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @get_input() #0 !dbg !576 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !577, metadata !DIExpression()), !dbg !578
  br label %reinput, !dbg !579

reinput:                                          ; preds = %if.then44, %if.then, %entry
  call void @llvm.dbg.label(metadata !580), !dbg !581
  call void @reset(), !dbg !582
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i64 0, i64 0)), !dbg !583
  store i32 0, i32* %i, align 4, !dbg !584
  br label %for.cond, !dbg !586

for.cond:                                         ; preds = %for.inc, %reinput
  %0 = load i32, i32* %i, align 4, !dbg !587
  %cmp = icmp slt i32 %0, 4, !dbg !589
  br i1 %cmp, label %for.body, label %for.end, !dbg !590

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !591
  %idxprom = sext i32 %1 to i64, !dbg !592
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* @digits, i64 0, i64 %idxprom, !dbg !592
  %val = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx, i32 0, i32 1, !dbg !593
  %2 = load i32, i32* %val, align 4, !dbg !593
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0), i32 %2), !dbg !594
  br label %for.inc, !dbg !594

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !595
  %inc = add nsw i32 %3, 1, !dbg !595
  store i32 %inc, i32* %i, align 4, !dbg !595
  br label %for.cond, !dbg !596, !llvm.loop !597

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.8, i64 0, i64 0)), !dbg !599
  br label %while.body, !dbg !600

while.body:                                       ; preds = %for.end
  store i32 0, i32* %i, align 4, !dbg !601
  br label %for.cond3, !dbg !604

for.cond3:                                        ; preds = %for.inc8, %while.body
  %4 = load i32, i32* %i, align 4, !dbg !605
  %cmp4 = icmp slt i32 %4, 64, !dbg !607
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !608

for.body5:                                        ; preds = %for.cond3
  %5 = load i32, i32* %i, align 4, !dbg !609
  %idxprom6 = sext i32 %5 to i64, !dbg !610
  %arrayidx7 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom6, !dbg !610
  store i8 10, i8* %arrayidx7, align 1, !dbg !611
  br label %for.inc8, !dbg !610

for.inc8:                                         ; preds = %for.body5
  %6 = load i32, i32* %i, align 4, !dbg !612
  %inc9 = add nsw i32 %6, 1, !dbg !612
  store i32 %inc9, i32* %i, align 4, !dbg !612
  br label %for.cond3, !dbg !613, !llvm.loop !614

for.end10:                                        ; preds = %for.cond3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !616
  %call11 = call i8* @fgets(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), i32 64, %struct._IO_FILE* %7), !dbg !617
  %8 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), align 16, !dbg !618
  %conv = sext i8 %8 to i32, !dbg !618
  %cmp12 = icmp eq i32 %conv, 0, !dbg !620
  br i1 %cmp12, label %if.then, label %if.end, !dbg !621, !cf.info !181

if.then:                                          ; preds = %for.end10
  br label %reinput, !dbg !622

if.end:                                           ; preds = %for.end10
  %9 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 63), align 1, !dbg !623
  %conv14 = sext i8 %9 to i32, !dbg !623
  %cmp15 = icmp ne i32 %conv14, 10, !dbg !625
  br i1 %cmp15, label %if.then17, label %if.end18, !dbg !626, !cf.info !181

if.then17:                                        ; preds = %if.end
  call void @bail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i64 0, i64 0)), !dbg !627
  br label %if.end18, !dbg !627

if.end18:                                         ; preds = %if.then17, %if.end
  store i32 0, i32* %i, align 4, !dbg !628
  br label %for.cond19, !dbg !630

for.cond19:                                       ; preds = %for.inc32, %if.end18
  %10 = load i32, i32* %i, align 4, !dbg !631
  %cmp20 = icmp slt i32 %10, 64, !dbg !633
  br i1 %cmp20, label %for.body22, label %for.end34, !dbg !634

for.body22:                                       ; preds = %for.cond19
  %11 = load i32, i32* %i, align 4, !dbg !635
  %idxprom23 = sext i32 %11 to i64, !dbg !637
  %arrayidx24 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom23, !dbg !637
  %12 = load i8, i8* %arrayidx24, align 1, !dbg !637
  %conv25 = sext i8 %12 to i32, !dbg !637
  %cmp26 = icmp eq i32 %conv25, 10, !dbg !638
  br i1 %cmp26, label %if.then28, label %if.end31, !dbg !639, !cf.info !181

if.then28:                                        ; preds = %for.body22
  %13 = load i32, i32* %i, align 4, !dbg !640
  %idxprom29 = sext i32 %13 to i64, !dbg !641
  %arrayidx30 = getelementptr inbounds [64 x i8], [64 x i8]* @str, i64 0, i64 %idxprom29, !dbg !641
  store i8 0, i8* %arrayidx30, align 1, !dbg !642
  br label %if.end31, !dbg !641

if.end31:                                         ; preds = %if.then28, %for.body22
  br label %for.inc32, !dbg !643

for.inc32:                                        ; preds = %if.end31
  %14 = load i32, i32* %i, align 4, !dbg !644
  %inc33 = add nsw i32 %14, 1, !dbg !644
  store i32 %inc33, i32* %i, align 4, !dbg !644
  br label %for.cond19, !dbg !645, !llvm.loop !646

for.end34:                                        ; preds = %for.cond19
  %15 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), align 16, !dbg !648
  %conv35 = sext i8 %15 to i32, !dbg !648
  %cmp36 = icmp eq i32 %conv35, 113, !dbg !650
  br i1 %cmp36, label %if.then38, label %if.end40, !dbg !651, !cf.info !181

if.then38:                                        ; preds = %for.end34
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i64 0, i64 0)), !dbg !652
  call void @exit(i32 0) #8, !dbg !654
  unreachable, !dbg !654

if.end40:                                         ; preds = %for.end34
  %16 = load i8, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0), align 16, !dbg !655
  %conv41 = sext i8 %16 to i32, !dbg !655
  %cmp42 = icmp eq i32 %conv41, 110, !dbg !657
  br i1 %cmp42, label %if.then44, label %if.end45, !dbg !658, !cf.info !181

if.then44:                                        ; preds = %if.end40
  call void @gen_digits(), !dbg !659
  br label %reinput, !dbg !661

if.end45:                                         ; preds = %if.end40
  ret void, !dbg !662
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare dso_local i32 @printf(i8*, ...) #5

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !663 {
entry:
  %retval = alloca i32, align 4
  %f = alloca %struct.frac_t, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.frac_t* %f, metadata !664, metadata !DIExpression()), !dbg !665
  %call = call i64 @time(i64* null) #7, !dbg !666
  %conv = trunc i64 %call to i32, !dbg !666
  call void @srand(i32 %conv) #7, !dbg !667
  call void @gen_digits(), !dbg !668
  br label %while.body, !dbg !669

while.body:                                       ; preds = %entry, %if.then, %if.end26
  call void @get_input(), !dbg !670
  %call1 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ctx, i64 0, i64 0)) #10, !dbg !672
  %0 = load i8*, i8** @msg, align 8, !dbg !673
  %tobool = icmp ne i8* %0, null, !dbg !673
  br i1 %tobool, label %if.then, label %if.end, !dbg !675, !cf.info !181

if.then:                                          ; preds = %while.body
  %1 = load i8*, i8** @msg, align 8, !dbg !676
  %2 = load i32, i32* @pos, align 4, !dbg !678
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i64 0, i64 0), i8* %1, i32 %2, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @str, i64 0, i64 0)), !dbg !679
  br label %while.body, !dbg !680, !llvm.loop !681

if.end:                                           ; preds = %while.body
  %call3 = call %struct.expr_t* @parse(), !dbg !683
  call void @eval_tree(%struct.expr_t* %call3, %struct.frac_t* %f), !dbg !684
  %denom = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !685
  %3 = load i32, i32* %denom, align 4, !dbg !685
  %cmp = icmp eq i32 %3, 0, !dbg !687
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !688, !cf.info !181

if.then5:                                         ; preds = %if.end
  call void @bail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i64 0, i64 0)), !dbg !689
  br label %if.end6, !dbg !689

if.end6:                                          ; preds = %if.then5, %if.end
  %denom7 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !690
  %4 = load i32, i32* %denom7, align 4, !dbg !690
  %cmp8 = icmp eq i32 %4, 1, !dbg !692
  br i1 %cmp8, label %land.lhs.true, label %if.else, !dbg !693, !cf.info !181

land.lhs.true:                                    ; preds = %if.end6
  %num = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 1, !dbg !694
  %5 = load i32, i32* %num, align 4, !dbg !694
  %cmp10 = icmp eq i32 %5, 24, !dbg !695
  br i1 %cmp10, label %if.then12, label %if.else, !dbg !696, !cf.info !181

if.then12:                                        ; preds = %land.lhs.true
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.13, i64 0, i64 0)), !dbg !697
  br label %if.end26, !dbg !697

if.else:                                          ; preds = %land.lhs.true, %if.end6
  %denom14 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !698
  %6 = load i32, i32* %denom14, align 4, !dbg !698
  %cmp15 = icmp eq i32 %6, 1, !dbg !701
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !702, !cf.info !181

if.then17:                                        ; preds = %if.else
  %num18 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 1, !dbg !703
  %7 = load i32, i32* %num18, align 4, !dbg !703
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.14, i64 0, i64 0), i32 %7), !dbg !704
  br label %if.end24, !dbg !704

if.else20:                                        ; preds = %if.else
  %num21 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 1, !dbg !705
  %8 = load i32, i32* %num21, align 4, !dbg !705
  %denom22 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %f, i32 0, i32 0, !dbg !706
  %9 = load i32, i32* %denom22, align 4, !dbg !706
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.15, i64 0, i64 0), i32 %8, i32 %9), !dbg !707
  br label %if.end24

if.end24:                                         ; preds = %if.else20, %if.then17
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.16, i64 0, i64 0)), !dbg !708
  br label %if.end26

if.end26:                                         ; preds = %if.end24, %if.then12
  br label %while.body, !dbg !669, !llvm.loop !681
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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !29, globals: !32, splitDebugInlining: false, nameTableKind: None)
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
!93 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!181 = !{!"if"}
!182 = !DILocation(line: 59, column: 25, scope: !178)
!183 = !DILocation(line: 59, column: 15, scope: !178)
!184 = !DILocation(line: 59, column: 3, scope: !178)
!185 = !DILocation(line: 60, column: 2, scope: !174)
!186 = !DILocation(line: 61, column: 1, scope: !174)
!187 = distinct !DISubprogram(name: "next_tok", scope: !3, file: !3, line: 64, type: !188, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!188 = !DISubroutineType(types: !189)
!189 = !{!30}
!190 = !DILocation(line: 66, column: 2, scope: !187)
!191 = !DILocation(line: 66, column: 9, scope: !187)
!192 = !DILocation(line: 66, column: 31, scope: !187)
!193 = distinct !{!193, !190, !192}
!194 = !DILocation(line: 67, column: 13, scope: !187)
!195 = !DILocation(line: 67, column: 9, scope: !187)
!196 = !DILocation(line: 67, column: 2, scope: !187)
!197 = distinct !DISubprogram(name: "take", scope: !3, file: !3, line: 71, type: !188, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!198 = !DILocation(line: 73, column: 10, scope: !199)
!199 = distinct !DILexicalBlock(scope: !197, file: !3, line: 73, column: 6)
!200 = !DILocation(line: 73, column: 6, scope: !199)
!201 = !DILocation(line: 73, column: 15, scope: !199)
!202 = !DILocation(line: 73, column: 6, scope: !197)
!203 = !DILocation(line: 73, column: 31, scope: !199)
!204 = !DILocation(line: 73, column: 24, scope: !199)
!205 = !DILocation(line: 74, column: 2, scope: !197)
!206 = !DILocation(line: 75, column: 1, scope: !197)
!207 = distinct !DISubprogram(name: "get_expr", scope: !3, file: !3, line: 88, type: !175, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!208 = !DILocalVariable(name: "c", scope: !207, file: !3, line: 90, type: !30)
!209 = !DILocation(line: 90, column: 6, scope: !207)
!210 = !DILocalVariable(name: "l", scope: !207, file: !3, line: 91, type: !82)
!211 = !DILocation(line: 91, column: 7, scope: !207)
!212 = !DILocalVariable(name: "r", scope: !207, file: !3, line: 91, type: !82)
!213 = !DILocation(line: 91, column: 10, scope: !207)
!214 = !DILocalVariable(name: "ret", scope: !207, file: !3, line: 91, type: !82)
!215 = !DILocation(line: 91, column: 13, scope: !207)
!216 = !DILocation(line: 92, column: 14, scope: !217)
!217 = distinct !DILexicalBlock(scope: !207, file: !3, line: 92, column: 6)
!218 = !DILocation(line: 92, column: 12, scope: !217)
!219 = !DILocation(line: 92, column: 6, scope: !207)
!220 = !DILocation(line: 92, column: 27, scope: !217)
!221 = !DILocation(line: 93, column: 2, scope: !207)
!222 = !DILocation(line: 93, column: 14, scope: !207)
!223 = !DILocation(line: 93, column: 12, scope: !207)
!224 = !DILocation(line: 93, column: 26, scope: !207)
!225 = !DILocation(line: 93, column: 33, scope: !207)
!226 = !DILocation(line: 93, column: 36, scope: !207)
!227 = !DILocation(line: 93, column: 38, scope: !207)
!228 = !DILocation(line: 94, column: 8, scope: !229)
!229 = distinct !DILexicalBlock(scope: !230, file: !3, line: 94, column: 7)
!230 = distinct !DILexicalBlock(scope: !207, file: !3, line: 93, column: 46)
!231 = !DILocation(line: 94, column: 7, scope: !230)
!232 = !DILocation(line: 94, column: 16, scope: !229)
!233 = !DILocation(line: 95, column: 13, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !3, line: 95, column: 7)
!235 = !DILocation(line: 95, column: 11, scope: !234)
!236 = !DILocation(line: 95, column: 7, scope: !230)
!237 = !DILocation(line: 95, column: 26, scope: !234)
!238 = !DILocation(line: 97, column: 7, scope: !230)
!239 = !DILocation(line: 97, column: 5, scope: !230)
!240 = !DILocation(line: 98, column: 9, scope: !230)
!241 = !DILocation(line: 98, column: 7, scope: !230)
!242 = !DILocation(line: 99, column: 14, scope: !230)
!243 = !DILocation(line: 99, column: 16, scope: !230)
!244 = !DILocation(line: 99, column: 13, scope: !230)
!245 = !DILocation(line: 99, column: 3, scope: !230)
!246 = !DILocation(line: 99, column: 8, scope: !230)
!247 = !DILocation(line: 99, column: 11, scope: !230)
!248 = !DILocation(line: 100, column: 15, scope: !230)
!249 = !DILocation(line: 100, column: 3, scope: !230)
!250 = !DILocation(line: 100, column: 8, scope: !230)
!251 = !DILocation(line: 100, column: 13, scope: !230)
!252 = !DILocation(line: 101, column: 16, scope: !230)
!253 = !DILocation(line: 101, column: 3, scope: !230)
!254 = !DILocation(line: 101, column: 8, scope: !230)
!255 = !DILocation(line: 101, column: 14, scope: !230)
!256 = distinct !{!256, !221, !257}
!257 = !DILocation(line: 102, column: 2, scope: !207)
!258 = !DILocation(line: 103, column: 9, scope: !207)
!259 = !DILocation(line: 103, column: 2, scope: !207)
!260 = distinct !DISubprogram(name: "get_term", scope: !3, file: !3, line: 106, type: !175, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!261 = !DILocalVariable(name: "c", scope: !260, file: !3, line: 108, type: !30)
!262 = !DILocation(line: 108, column: 6, scope: !260)
!263 = !DILocalVariable(name: "l", scope: !260, file: !3, line: 109, type: !82)
!264 = !DILocation(line: 109, column: 7, scope: !260)
!265 = !DILocalVariable(name: "r", scope: !260, file: !3, line: 109, type: !82)
!266 = !DILocation(line: 109, column: 10, scope: !260)
!267 = !DILocalVariable(name: "ret", scope: !260, file: !3, line: 109, type: !82)
!268 = !DILocation(line: 109, column: 13, scope: !260)
!269 = !DILocation(line: 110, column: 8, scope: !260)
!270 = !DILocation(line: 110, column: 6, scope: !260)
!271 = !DILocation(line: 111, column: 2, scope: !260)
!272 = !DILocation(line: 111, column: 13, scope: !260)
!273 = !DILocation(line: 111, column: 11, scope: !260)
!274 = !DILocation(line: 111, column: 25, scope: !260)
!275 = !DILocation(line: 111, column: 32, scope: !260)
!276 = !DILocation(line: 111, column: 35, scope: !260)
!277 = !DILocation(line: 111, column: 37, scope: !260)
!278 = !DILocation(line: 112, column: 8, scope: !279)
!279 = distinct !DILexicalBlock(scope: !280, file: !3, line: 112, column: 7)
!280 = distinct !DILexicalBlock(scope: !260, file: !3, line: 111, column: 45)
!281 = !DILocation(line: 112, column: 7, scope: !280)
!282 = !DILocation(line: 112, column: 16, scope: !279)
!283 = !DILocation(line: 114, column: 7, scope: !280)
!284 = !DILocation(line: 114, column: 5, scope: !280)
!285 = !DILocation(line: 115, column: 7, scope: !280)
!286 = !DILocation(line: 115, column: 5, scope: !280)
!287 = !DILocation(line: 116, column: 9, scope: !280)
!288 = !DILocation(line: 116, column: 7, scope: !280)
!289 = !DILocation(line: 117, column: 14, scope: !280)
!290 = !DILocation(line: 117, column: 16, scope: !280)
!291 = !DILocation(line: 117, column: 13, scope: !280)
!292 = !DILocation(line: 117, column: 3, scope: !280)
!293 = !DILocation(line: 117, column: 8, scope: !280)
!294 = !DILocation(line: 117, column: 11, scope: !280)
!295 = !DILocation(line: 118, column: 15, scope: !280)
!296 = !DILocation(line: 118, column: 3, scope: !280)
!297 = !DILocation(line: 118, column: 8, scope: !280)
!298 = !DILocation(line: 118, column: 13, scope: !280)
!299 = !DILocation(line: 119, column: 16, scope: !280)
!300 = !DILocation(line: 119, column: 3, scope: !280)
!301 = !DILocation(line: 119, column: 8, scope: !280)
!302 = !DILocation(line: 119, column: 14, scope: !280)
!303 = distinct !{!303, !271, !304}
!304 = !DILocation(line: 120, column: 2, scope: !260)
!305 = !DILocation(line: 121, column: 9, scope: !260)
!306 = !DILocation(line: 121, column: 2, scope: !260)
!307 = distinct !DISubprogram(name: "get_digit", scope: !3, file: !3, line: 124, type: !175, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!308 = !DILocalVariable(name: "i", scope: !307, file: !3, line: 126, type: !30)
!309 = !DILocation(line: 126, column: 6, scope: !307)
!310 = !DILocalVariable(name: "c", scope: !307, file: !3, line: 126, type: !30)
!311 = !DILocation(line: 126, column: 9, scope: !307)
!312 = !DILocation(line: 126, column: 13, scope: !307)
!313 = !DILocalVariable(name: "ret", scope: !307, file: !3, line: 127, type: !82)
!314 = !DILocation(line: 127, column: 7, scope: !307)
!315 = !DILocation(line: 128, column: 6, scope: !316)
!316 = distinct !DILexicalBlock(scope: !307, file: !3, line: 128, column: 6)
!317 = !DILocation(line: 128, column: 8, scope: !316)
!318 = !DILocation(line: 128, column: 15, scope: !316)
!319 = !DILocation(line: 128, column: 18, scope: !316)
!320 = !DILocation(line: 128, column: 20, scope: !316)
!321 = !DILocation(line: 128, column: 6, scope: !307)
!322 = !DILocation(line: 129, column: 3, scope: !323)
!323 = distinct !DILexicalBlock(scope: !316, file: !3, line: 128, column: 28)
!324 = !DILocation(line: 130, column: 9, scope: !323)
!325 = !DILocation(line: 130, column: 7, scope: !323)
!326 = !DILocation(line: 131, column: 3, scope: !323)
!327 = !DILocation(line: 131, column: 8, scope: !323)
!328 = !DILocation(line: 131, column: 11, scope: !323)
!329 = !DILocation(line: 132, column: 14, scope: !323)
!330 = !DILocation(line: 132, column: 16, scope: !323)
!331 = !DILocation(line: 132, column: 3, scope: !323)
!332 = !DILocation(line: 132, column: 8, scope: !323)
!333 = !DILocation(line: 132, column: 12, scope: !323)
!334 = !DILocation(line: 133, column: 10, scope: !335)
!335 = distinct !DILexicalBlock(scope: !323, file: !3, line: 133, column: 3)
!336 = !DILocation(line: 133, column: 8, scope: !335)
!337 = !DILocation(line: 133, column: 15, scope: !338)
!338 = distinct !DILexicalBlock(scope: !335, file: !3, line: 133, column: 3)
!339 = !DILocation(line: 133, column: 17, scope: !338)
!340 = !DILocation(line: 133, column: 3, scope: !335)
!341 = !DILocation(line: 134, column: 15, scope: !342)
!342 = distinct !DILexicalBlock(scope: !338, file: !3, line: 134, column: 8)
!343 = !DILocation(line: 134, column: 8, scope: !342)
!344 = !DILocation(line: 134, column: 18, scope: !342)
!345 = !DILocation(line: 134, column: 25, scope: !342)
!346 = !DILocation(line: 134, column: 30, scope: !342)
!347 = !DILocation(line: 134, column: 22, scope: !342)
!348 = !DILocation(line: 134, column: 34, scope: !342)
!349 = !DILocation(line: 134, column: 45, scope: !342)
!350 = !DILocation(line: 134, column: 38, scope: !342)
!351 = !DILocation(line: 134, column: 48, scope: !342)
!352 = !DILocation(line: 134, column: 8, scope: !338)
!353 = !DILocation(line: 135, column: 12, scope: !354)
!354 = distinct !DILexicalBlock(scope: !342, file: !3, line: 134, column: 54)
!355 = !DILocation(line: 135, column: 5, scope: !354)
!356 = !DILocation(line: 135, column: 15, scope: !354)
!357 = !DILocation(line: 135, column: 20, scope: !354)
!358 = !DILocation(line: 136, column: 12, scope: !354)
!359 = !DILocation(line: 136, column: 5, scope: !354)
!360 = !DILocation(line: 133, column: 30, scope: !338)
!361 = !DILocation(line: 133, column: 3, scope: !338)
!362 = distinct !{!362, !340, !363}
!363 = !DILocation(line: 137, column: 4, scope: !335)
!364 = !DILocation(line: 138, column: 3, scope: !323)
!365 = !DILocation(line: 139, column: 2, scope: !323)
!366 = !DILocation(line: 140, column: 2, scope: !307)
!367 = !DILocation(line: 141, column: 1, scope: !307)
!368 = distinct !DISubprogram(name: "get_fact", scope: !3, file: !3, line: 143, type: !175, scopeLine: 144, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!369 = !DILocalVariable(name: "c", scope: !368, file: !3, line: 145, type: !30)
!370 = !DILocation(line: 145, column: 6, scope: !368)
!371 = !DILocalVariable(name: "l", scope: !368, file: !3, line: 146, type: !82)
!372 = !DILocation(line: 146, column: 7, scope: !368)
!373 = !DILocation(line: 146, column: 11, scope: !368)
!374 = !DILocation(line: 147, column: 6, scope: !375)
!375 = distinct !DILexicalBlock(scope: !368, file: !3, line: 147, column: 6)
!376 = !DILocation(line: 147, column: 6, scope: !368)
!377 = !DILocation(line: 147, column: 16, scope: !375)
!378 = !DILocation(line: 147, column: 9, scope: !375)
!379 = !DILocation(line: 148, column: 11, scope: !380)
!380 = distinct !DILexicalBlock(scope: !368, file: !3, line: 148, column: 6)
!381 = !DILocation(line: 148, column: 9, scope: !380)
!382 = !DILocation(line: 148, column: 23, scope: !380)
!383 = !DILocation(line: 148, column: 6, scope: !368)
!384 = !DILocation(line: 149, column: 3, scope: !385)
!385 = distinct !DILexicalBlock(scope: !380, file: !3, line: 148, column: 31)
!386 = !DILocation(line: 150, column: 7, scope: !385)
!387 = !DILocation(line: 150, column: 5, scope: !385)
!388 = !DILocation(line: 151, column: 7, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !3, line: 151, column: 7)
!390 = !DILocation(line: 151, column: 18, scope: !389)
!391 = !DILocation(line: 151, column: 7, scope: !385)
!392 = !DILocation(line: 151, column: 26, scope: !389)
!393 = !DILocation(line: 152, column: 3, scope: !385)
!394 = !DILocation(line: 153, column: 10, scope: !385)
!395 = !DILocation(line: 153, column: 3, scope: !385)
!396 = !DILocation(line: 155, column: 2, scope: !368)
!397 = !DILocation(line: 156, column: 1, scope: !368)
!398 = distinct !DISubprogram(name: "parse", scope: !3, file: !3, line: 158, type: !175, scopeLine: 159, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!399 = !DILocalVariable(name: "i", scope: !398, file: !3, line: 160, type: !30)
!400 = !DILocation(line: 160, column: 6, scope: !398)
!401 = !DILocalVariable(name: "ret", scope: !398, file: !3, line: 161, type: !82)
!402 = !DILocation(line: 161, column: 7, scope: !398)
!403 = !DILocation(line: 161, column: 13, scope: !398)
!404 = !DILocation(line: 162, column: 6, scope: !405)
!405 = distinct !DILexicalBlock(scope: !398, file: !3, line: 162, column: 6)
!406 = !DILocation(line: 162, column: 17, scope: !405)
!407 = !DILocation(line: 162, column: 6, scope: !398)
!408 = !DILocation(line: 163, column: 3, scope: !405)
!409 = !DILocation(line: 164, column: 9, scope: !410)
!410 = distinct !DILexicalBlock(scope: !398, file: !3, line: 164, column: 2)
!411 = !DILocation(line: 164, column: 7, scope: !410)
!412 = !DILocation(line: 164, column: 14, scope: !413)
!413 = distinct !DILexicalBlock(scope: !410, file: !3, line: 164, column: 2)
!414 = !DILocation(line: 164, column: 16, scope: !413)
!415 = !DILocation(line: 164, column: 2, scope: !410)
!416 = !DILocation(line: 165, column: 15, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !3, line: 165, column: 7)
!418 = !DILocation(line: 165, column: 8, scope: !417)
!419 = !DILocation(line: 165, column: 18, scope: !417)
!420 = !DILocation(line: 165, column: 7, scope: !413)
!421 = !DILocation(line: 166, column: 4, scope: !417)
!422 = !DILocation(line: 164, column: 29, scope: !413)
!423 = !DILocation(line: 164, column: 2, scope: !413)
!424 = distinct !{!424, !415, !425}
!425 = !DILocation(line: 166, column: 34, scope: !410)
!426 = !DILocation(line: 167, column: 9, scope: !398)
!427 = !DILocation(line: 167, column: 2, scope: !398)
!428 = distinct !DISubprogram(name: "gcd", scope: !3, file: !3, line: 173, type: !429, scopeLine: 174, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!429 = !DISubroutineType(types: !430)
!430 = !{!30, !30, !30}
!431 = !DILocalVariable(name: "m", arg: 1, scope: !428, file: !3, line: 173, type: !30)
!432 = !DILocation(line: 173, column: 13, scope: !428)
!433 = !DILocalVariable(name: "n", arg: 2, scope: !428, file: !3, line: 173, type: !30)
!434 = !DILocation(line: 173, column: 20, scope: !428)
!435 = !DILocalVariable(name: "t", scope: !428, file: !3, line: 175, type: !30)
!436 = !DILocation(line: 175, column: 6, scope: !428)
!437 = !DILocation(line: 176, column: 2, scope: !428)
!438 = !DILocation(line: 176, column: 9, scope: !428)
!439 = !DILocation(line: 177, column: 7, scope: !440)
!440 = distinct !DILexicalBlock(scope: !428, file: !3, line: 176, column: 12)
!441 = !DILocation(line: 177, column: 5, scope: !440)
!442 = !DILocation(line: 177, column: 14, scope: !440)
!443 = !DILocation(line: 177, column: 18, scope: !440)
!444 = !DILocation(line: 177, column: 16, scope: !440)
!445 = !DILocation(line: 177, column: 12, scope: !440)
!446 = !DILocation(line: 177, column: 25, scope: !440)
!447 = !DILocation(line: 177, column: 23, scope: !440)
!448 = distinct !{!448, !437, !449}
!449 = !DILocation(line: 178, column: 2, scope: !428)
!450 = !DILocation(line: 179, column: 9, scope: !428)
!451 = !DILocation(line: 179, column: 2, scope: !428)
!452 = distinct !DISubprogram(name: "eval_tree", scope: !3, file: !3, line: 183, type: !453, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!453 = !DISubroutineType(types: !454)
!454 = !{null, !82, !455}
!455 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac", file: !3, line: 170, baseType: !456)
!456 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !457, size: 64)
!457 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "frac_t", file: !3, line: 171, size: 64, elements: !458)
!458 = !{!459, !460}
!459 = !DIDerivedType(tag: DW_TAG_member, name: "denom", scope: !457, file: !3, line: 171, baseType: !30, size: 32)
!460 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !457, file: !3, line: 171, baseType: !30, size: 32, offset: 32)
!461 = !DILocalVariable(name: "e", arg: 1, scope: !452, file: !3, line: 183, type: !82)
!462 = !DILocation(line: 183, column: 21, scope: !452)
!463 = !DILocalVariable(name: "res", arg: 2, scope: !452, file: !3, line: 183, type: !455)
!464 = !DILocation(line: 183, column: 29, scope: !452)
!465 = !DILocalVariable(name: "l", scope: !452, file: !3, line: 185, type: !466)
!466 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac_t", file: !3, line: 170, baseType: !457)
!467 = !DILocation(line: 185, column: 9, scope: !452)
!468 = !DILocalVariable(name: "r", scope: !452, file: !3, line: 185, type: !466)
!469 = !DILocation(line: 185, column: 12, scope: !452)
!470 = !DILocalVariable(name: "t", scope: !452, file: !3, line: 186, type: !30)
!471 = !DILocation(line: 186, column: 6, scope: !452)
!472 = !DILocation(line: 187, column: 6, scope: !473)
!473 = distinct !DILexicalBlock(scope: !452, file: !3, line: 187, column: 6)
!474 = !DILocation(line: 187, column: 9, scope: !473)
!475 = !DILocation(line: 187, column: 12, scope: !473)
!476 = !DILocation(line: 187, column: 6, scope: !452)
!477 = !DILocation(line: 188, column: 14, scope: !478)
!478 = distinct !DILexicalBlock(scope: !473, file: !3, line: 187, column: 23)
!479 = !DILocation(line: 188, column: 17, scope: !478)
!480 = !DILocation(line: 188, column: 3, scope: !478)
!481 = !DILocation(line: 188, column: 8, scope: !478)
!482 = !DILocation(line: 188, column: 12, scope: !478)
!483 = !DILocation(line: 189, column: 3, scope: !478)
!484 = !DILocation(line: 189, column: 8, scope: !478)
!485 = !DILocation(line: 189, column: 14, scope: !478)
!486 = !DILocation(line: 190, column: 3, scope: !478)
!487 = !DILocation(line: 193, column: 12, scope: !452)
!488 = !DILocation(line: 193, column: 15, scope: !452)
!489 = !DILocation(line: 193, column: 2, scope: !452)
!490 = !DILocation(line: 194, column: 12, scope: !452)
!491 = !DILocation(line: 194, column: 15, scope: !452)
!492 = !DILocation(line: 194, column: 2, scope: !452)
!493 = !DILocation(line: 196, column: 9, scope: !452)
!494 = !DILocation(line: 196, column: 12, scope: !452)
!495 = !DILocation(line: 196, column: 2, scope: !452)
!496 = !DILocation(line: 198, column: 16, scope: !497)
!497 = distinct !DILexicalBlock(scope: !452, file: !3, line: 196, column: 16)
!498 = !DILocation(line: 198, column: 24, scope: !497)
!499 = !DILocation(line: 198, column: 20, scope: !497)
!500 = !DILocation(line: 198, column: 34, scope: !497)
!501 = !DILocation(line: 198, column: 44, scope: !497)
!502 = !DILocation(line: 198, column: 40, scope: !497)
!503 = !DILocation(line: 198, column: 30, scope: !497)
!504 = !DILocation(line: 198, column: 3, scope: !497)
!505 = !DILocation(line: 198, column: 8, scope: !497)
!506 = !DILocation(line: 198, column: 12, scope: !497)
!507 = !DILocation(line: 199, column: 18, scope: !497)
!508 = !DILocation(line: 199, column: 28, scope: !497)
!509 = !DILocation(line: 199, column: 24, scope: !497)
!510 = !DILocation(line: 199, column: 3, scope: !497)
!511 = !DILocation(line: 199, column: 8, scope: !497)
!512 = !DILocation(line: 199, column: 14, scope: !497)
!513 = !DILocation(line: 200, column: 3, scope: !497)
!514 = !DILocation(line: 202, column: 16, scope: !497)
!515 = !DILocation(line: 202, column: 24, scope: !497)
!516 = !DILocation(line: 202, column: 20, scope: !497)
!517 = !DILocation(line: 202, column: 34, scope: !497)
!518 = !DILocation(line: 202, column: 44, scope: !497)
!519 = !DILocation(line: 202, column: 40, scope: !497)
!520 = !DILocation(line: 202, column: 30, scope: !497)
!521 = !DILocation(line: 202, column: 3, scope: !497)
!522 = !DILocation(line: 202, column: 8, scope: !497)
!523 = !DILocation(line: 202, column: 12, scope: !497)
!524 = !DILocation(line: 203, column: 18, scope: !497)
!525 = !DILocation(line: 203, column: 28, scope: !497)
!526 = !DILocation(line: 203, column: 24, scope: !497)
!527 = !DILocation(line: 203, column: 3, scope: !497)
!528 = !DILocation(line: 203, column: 8, scope: !497)
!529 = !DILocation(line: 203, column: 14, scope: !497)
!530 = !DILocation(line: 204, column: 3, scope: !497)
!531 = !DILocation(line: 206, column: 16, scope: !497)
!532 = !DILocation(line: 206, column: 24, scope: !497)
!533 = !DILocation(line: 206, column: 20, scope: !497)
!534 = !DILocation(line: 206, column: 3, scope: !497)
!535 = !DILocation(line: 206, column: 8, scope: !497)
!536 = !DILocation(line: 206, column: 12, scope: !497)
!537 = !DILocation(line: 207, column: 18, scope: !497)
!538 = !DILocation(line: 207, column: 28, scope: !497)
!539 = !DILocation(line: 207, column: 24, scope: !497)
!540 = !DILocation(line: 207, column: 3, scope: !497)
!541 = !DILocation(line: 207, column: 8, scope: !497)
!542 = !DILocation(line: 207, column: 14, scope: !497)
!543 = !DILocation(line: 208, column: 3, scope: !497)
!544 = !DILocation(line: 210, column: 16, scope: !497)
!545 = !DILocation(line: 210, column: 24, scope: !497)
!546 = !DILocation(line: 210, column: 20, scope: !497)
!547 = !DILocation(line: 210, column: 3, scope: !497)
!548 = !DILocation(line: 210, column: 8, scope: !497)
!549 = !DILocation(line: 210, column: 12, scope: !497)
!550 = !DILocation(line: 211, column: 18, scope: !497)
!551 = !DILocation(line: 211, column: 28, scope: !497)
!552 = !DILocation(line: 211, column: 24, scope: !497)
!553 = !DILocation(line: 211, column: 3, scope: !497)
!554 = !DILocation(line: 211, column: 8, scope: !497)
!555 = !DILocation(line: 211, column: 14, scope: !497)
!556 = !DILocation(line: 212, column: 3, scope: !497)
!557 = !DILocation(line: 214, column: 15, scope: !558)
!558 = distinct !DILexicalBlock(scope: !452, file: !3, line: 214, column: 6)
!559 = !DILocation(line: 214, column: 20, scope: !558)
!560 = !DILocation(line: 214, column: 27, scope: !558)
!561 = !DILocation(line: 214, column: 32, scope: !558)
!562 = !DILocation(line: 214, column: 11, scope: !558)
!563 = !DILocation(line: 214, column: 9, scope: !558)
!564 = !DILocation(line: 214, column: 6, scope: !452)
!565 = !DILocation(line: 215, column: 17, scope: !566)
!566 = distinct !DILexicalBlock(scope: !558, file: !3, line: 214, column: 39)
!567 = !DILocation(line: 215, column: 3, scope: !566)
!568 = !DILocation(line: 215, column: 8, scope: !566)
!569 = !DILocation(line: 215, column: 14, scope: !566)
!570 = !DILocation(line: 216, column: 15, scope: !566)
!571 = !DILocation(line: 216, column: 3, scope: !566)
!572 = !DILocation(line: 216, column: 8, scope: !566)
!573 = !DILocation(line: 216, column: 12, scope: !566)
!574 = !DILocation(line: 217, column: 2, scope: !566)
!575 = !DILocation(line: 218, column: 1, scope: !452)
!576 = distinct !DISubprogram(name: "get_input", scope: !3, file: !3, line: 220, type: !95, scopeLine: 221, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!577 = !DILocalVariable(name: "i", scope: !576, file: !3, line: 222, type: !30)
!578 = !DILocation(line: 222, column: 6, scope: !576)
!579 = !DILocation(line: 222, column: 2, scope: !576)
!580 = !DILabel(scope: !576, name: "reinput", file: !3, line: 223)
!581 = !DILocation(line: 223, column: 1, scope: !576)
!582 = !DILocation(line: 224, column: 2, scope: !576)
!583 = !DILocation(line: 225, column: 2, scope: !576)
!584 = !DILocation(line: 226, column: 9, scope: !585)
!585 = distinct !DILexicalBlock(scope: !576, file: !3, line: 226, column: 2)
!586 = !DILocation(line: 226, column: 7, scope: !585)
!587 = !DILocation(line: 226, column: 14, scope: !588)
!588 = distinct !DILexicalBlock(scope: !585, file: !3, line: 226, column: 2)
!589 = !DILocation(line: 226, column: 16, scope: !588)
!590 = !DILocation(line: 226, column: 2, scope: !585)
!591 = !DILocation(line: 227, column: 24, scope: !588)
!592 = !DILocation(line: 227, column: 17, scope: !588)
!593 = !DILocation(line: 227, column: 27, scope: !588)
!594 = !DILocation(line: 227, column: 3, scope: !588)
!595 = !DILocation(line: 226, column: 29, scope: !588)
!596 = !DILocation(line: 226, column: 2, scope: !588)
!597 = distinct !{!597, !590, !598}
!598 = !DILocation(line: 227, column: 30, scope: !585)
!599 = !DILocation(line: 228, column: 2, scope: !576)
!600 = !DILocation(line: 231, column: 2, scope: !576)
!601 = !DILocation(line: 232, column: 10, scope: !602)
!602 = distinct !DILexicalBlock(scope: !603, file: !3, line: 232, column: 3)
!603 = distinct !DILexicalBlock(scope: !576, file: !3, line: 231, column: 12)
!604 = !DILocation(line: 232, column: 8, scope: !602)
!605 = !DILocation(line: 232, column: 15, scope: !606)
!606 = distinct !DILexicalBlock(scope: !602, file: !3, line: 232, column: 3)
!607 = !DILocation(line: 232, column: 17, scope: !606)
!608 = !DILocation(line: 232, column: 3, scope: !602)
!609 = !DILocation(line: 232, column: 39, scope: !606)
!610 = !DILocation(line: 232, column: 35, scope: !606)
!611 = !DILocation(line: 232, column: 42, scope: !606)
!612 = !DILocation(line: 232, column: 31, scope: !606)
!613 = !DILocation(line: 232, column: 3, scope: !606)
!614 = distinct !{!614, !608, !615}
!615 = !DILocation(line: 232, column: 44, scope: !602)
!616 = !DILocation(line: 233, column: 25, scope: !603)
!617 = !DILocation(line: 233, column: 3, scope: !603)
!618 = !DILocation(line: 234, column: 7, scope: !619)
!619 = distinct !DILexicalBlock(scope: !603, file: !3, line: 234, column: 7)
!620 = !DILocation(line: 234, column: 12, scope: !619)
!621 = !DILocation(line: 234, column: 7, scope: !603)
!622 = !DILocation(line: 234, column: 21, scope: !619)
!623 = !DILocation(line: 235, column: 7, scope: !624)
!624 = distinct !DILexicalBlock(scope: !603, file: !3, line: 235, column: 7)
!625 = !DILocation(line: 235, column: 26, scope: !624)
!626 = !DILocation(line: 235, column: 7, scope: !603)
!627 = !DILocation(line: 236, column: 4, scope: !624)
!628 = !DILocation(line: 238, column: 10, scope: !629)
!629 = distinct !DILexicalBlock(scope: !603, file: !3, line: 238, column: 3)
!630 = !DILocation(line: 238, column: 8, scope: !629)
!631 = !DILocation(line: 238, column: 15, scope: !632)
!632 = distinct !DILexicalBlock(scope: !629, file: !3, line: 238, column: 3)
!633 = !DILocation(line: 238, column: 17, scope: !632)
!634 = !DILocation(line: 238, column: 3, scope: !629)
!635 = !DILocation(line: 239, column: 12, scope: !636)
!636 = distinct !DILexicalBlock(scope: !632, file: !3, line: 239, column: 8)
!637 = !DILocation(line: 239, column: 8, scope: !636)
!638 = !DILocation(line: 239, column: 15, scope: !636)
!639 = !DILocation(line: 239, column: 8, scope: !632)
!640 = !DILocation(line: 239, column: 28, scope: !636)
!641 = !DILocation(line: 239, column: 24, scope: !636)
!642 = !DILocation(line: 239, column: 31, scope: !636)
!643 = !DILocation(line: 239, column: 18, scope: !636)
!644 = !DILocation(line: 238, column: 31, scope: !632)
!645 = !DILocation(line: 238, column: 3, scope: !632)
!646 = distinct !{!646, !634, !647}
!647 = !DILocation(line: 239, column: 33, scope: !629)
!648 = !DILocation(line: 240, column: 7, scope: !649)
!649 = distinct !DILexicalBlock(scope: !603, file: !3, line: 240, column: 7)
!650 = !DILocation(line: 240, column: 14, scope: !649)
!651 = !DILocation(line: 240, column: 7, scope: !603)
!652 = !DILocation(line: 241, column: 4, scope: !653)
!653 = distinct !DILexicalBlock(scope: !649, file: !3, line: 240, column: 22)
!654 = !DILocation(line: 242, column: 4, scope: !653)
!655 = !DILocation(line: 244, column: 7, scope: !656)
!656 = distinct !DILexicalBlock(scope: !603, file: !3, line: 244, column: 7)
!657 = !DILocation(line: 244, column: 14, scope: !656)
!658 = !DILocation(line: 244, column: 7, scope: !603)
!659 = !DILocation(line: 245, column: 4, scope: !660)
!660 = distinct !DILexicalBlock(scope: !656, file: !3, line: 244, column: 22)
!661 = !DILocation(line: 246, column: 4, scope: !660)
!662 = !DILocation(line: 248, column: 3, scope: !603)
!663 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 252, type: !188, scopeLine: 253, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !97)
!664 = !DILocalVariable(name: "f", scope: !663, file: !3, line: 254, type: !466)
!665 = !DILocation(line: 254, column: 9, scope: !663)
!666 = !DILocation(line: 255, column: 8, scope: !663)
!667 = !DILocation(line: 255, column: 2, scope: !663)
!668 = !DILocation(line: 257, column: 2, scope: !663)
!669 = !DILocation(line: 258, column: 2, scope: !663)
!670 = !DILocation(line: 259, column: 3, scope: !671)
!671 = distinct !DILexicalBlock(scope: !663, file: !3, line: 258, column: 11)
!672 = !DILocation(line: 260, column: 3, scope: !671)
!673 = !DILocation(line: 261, column: 7, scope: !674)
!674 = distinct !DILexicalBlock(scope: !671, file: !3, line: 261, column: 7)
!675 = !DILocation(line: 261, column: 7, scope: !671)
!676 = !DILocation(line: 263, column: 29, scope: !677)
!677 = distinct !DILexicalBlock(scope: !674, file: !3, line: 261, column: 12)
!678 = !DILocation(line: 263, column: 34, scope: !677)
!679 = !DILocation(line: 263, column: 4, scope: !677)
!680 = !DILocation(line: 264, column: 4, scope: !677)
!681 = distinct !{!681, !669, !682}
!682 = !DILocation(line: 279, column: 2, scope: !663)
!683 = !DILocation(line: 267, column: 13, scope: !671)
!684 = !DILocation(line: 267, column: 3, scope: !671)
!685 = !DILocation(line: 269, column: 9, scope: !686)
!686 = distinct !DILexicalBlock(scope: !671, file: !3, line: 269, column: 7)
!687 = !DILocation(line: 269, column: 15, scope: !686)
!688 = !DILocation(line: 269, column: 7, scope: !671)
!689 = !DILocation(line: 269, column: 21, scope: !686)
!690 = !DILocation(line: 270, column: 9, scope: !691)
!691 = distinct !DILexicalBlock(scope: !671, file: !3, line: 270, column: 7)
!692 = !DILocation(line: 270, column: 15, scope: !691)
!693 = !DILocation(line: 270, column: 20, scope: !691)
!694 = !DILocation(line: 270, column: 25, scope: !691)
!695 = !DILocation(line: 270, column: 29, scope: !691)
!696 = !DILocation(line: 270, column: 7, scope: !671)
!697 = !DILocation(line: 271, column: 4, scope: !691)
!698 = !DILocation(line: 273, column: 10, scope: !699)
!699 = distinct !DILexicalBlock(scope: !700, file: !3, line: 273, column: 8)
!700 = distinct !DILexicalBlock(scope: !691, file: !3, line: 272, column: 8)
!701 = !DILocation(line: 273, column: 16, scope: !699)
!702 = !DILocation(line: 273, column: 8, scope: !700)
!703 = !DILocation(line: 274, column: 31, scope: !699)
!704 = !DILocation(line: 274, column: 5, scope: !699)
!705 = !DILocation(line: 276, column: 34, scope: !699)
!706 = !DILocation(line: 276, column: 41, scope: !699)
!707 = !DILocation(line: 276, column: 5, scope: !699)
!708 = !DILocation(line: 277, column: 4, scope: !700)
