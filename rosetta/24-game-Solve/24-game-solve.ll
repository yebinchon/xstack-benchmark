; ModuleID = '24-game-solve.c'
source_filename = "24-game-solve.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.expr_t = type { i32, %struct.expr_t*, %struct.expr_t*, i32 }
%struct.frac_t = type { i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" + \00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c" - \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" x \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c" / \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c")\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.8 = private unnamed_addr constant [16 x i8] c"Unknown op: %d\0A\00", align 1
@__const.main.n = private unnamed_addr constant [5 x i32] [i32 3, i32 3, i32 8, i32 8, i32 9], align 16
@.str.9 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c":  \00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"No solution\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @show_expr(%struct.expr_t* %e, i32 %prec, i32 %is_right) #0 !dbg !17 {
entry:
  %e.addr = alloca %struct.expr_t*, align 8
  %prec.addr = alloca i32, align 4
  %is_right.addr = alloca i32, align 4
  %op = alloca i8*, align 8
  store %struct.expr_t* %e, %struct.expr_t** %e.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.expr_t** %e.addr, metadata !31, metadata !DIExpression()), !dbg !32
  store i32 %prec, i32* %prec.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %prec.addr, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 %is_right, i32* %is_right.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %is_right.addr, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i8** %op, metadata !37, metadata !DIExpression()), !dbg !41
  %0 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !42
  %op1 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %0, i32 0, i32 0, !dbg !43
  %1 = load i32, i32* %op1, align 8, !dbg !43
  switch i32 %1, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb3
    i32 3, label %sw.bb4
    i32 4, label %sw.bb5
  ], !dbg !44

sw.bb:                                            ; preds = %entry
  %2 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !45
  %value = getelementptr inbounds %struct.expr_t, %struct.expr_t* %2, i32 0, i32 3, !dbg !47
  %3 = load i32, i32* %value, align 8, !dbg !47
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %3), !dbg !48
  br label %if.end22, !dbg !49

sw.bb2:                                           ; preds = %entry
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8** %op, align 8, !dbg !50
  br label %sw.epilog, !dbg !51

sw.bb3:                                           ; preds = %entry
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8** %op, align 8, !dbg !52
  br label %sw.epilog, !dbg !53

sw.bb4:                                           ; preds = %entry
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i8** %op, align 8, !dbg !54
  br label %sw.epilog, !dbg !55

sw.bb5:                                           ; preds = %entry
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i8** %op, align 8, !dbg !56
  br label %sw.epilog, !dbg !57

sw.epilog:                                        ; preds = %entry, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2
  %4 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !58
  %op6 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %4, i32 0, i32 0, !dbg !60
  %5 = load i32, i32* %op6, align 8, !dbg !60
  %6 = load i32, i32* %prec.addr, align 4, !dbg !61
  %cmp = icmp eq i32 %5, %6, !dbg !62
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !63, !cf.info !64

land.lhs.true:                                    ; preds = %sw.epilog
  %7 = load i32, i32* %is_right.addr, align 4, !dbg !65
  %tobool = icmp ne i32 %7, 0, !dbg !65
  br i1 %tobool, label %if.then, label %lor.lhs.false, !dbg !66, !cf.info !64

lor.lhs.false:                                    ; preds = %land.lhs.true, %sw.epilog
  %8 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !67
  %op7 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %8, i32 0, i32 0, !dbg !68
  %9 = load i32, i32* %op7, align 8, !dbg !68
  %10 = load i32, i32* %prec.addr, align 4, !dbg !69
  %cmp8 = icmp ult i32 %9, %10, !dbg !70
  br i1 %cmp8, label %if.then, label %if.end, !dbg !71, !cf.info !64

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !72
  br label %if.end, !dbg !72

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %11 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !73
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %11, i32 0, i32 1, !dbg !74
  %12 = load %struct.expr_t*, %struct.expr_t** %left, align 8, !dbg !74
  %13 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !75
  %op10 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %13, i32 0, i32 0, !dbg !76
  %14 = load i32, i32* %op10, align 8, !dbg !76
  call void @show_expr(%struct.expr_t* %12, i32 %14, i32 0), !dbg !77
  %15 = load i8*, i8** %op, align 8, !dbg !78
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0), i8* %15), !dbg !79
  %16 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !80
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %16, i32 0, i32 2, !dbg !81
  %17 = load %struct.expr_t*, %struct.expr_t** %right, align 8, !dbg !81
  %18 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !82
  %op12 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %18, i32 0, i32 0, !dbg !83
  %19 = load i32, i32* %op12, align 8, !dbg !83
  call void @show_expr(%struct.expr_t* %17, i32 %19, i32 1), !dbg !84
  %20 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !85
  %op13 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %20, i32 0, i32 0, !dbg !87
  %21 = load i32, i32* %op13, align 8, !dbg !87
  %22 = load i32, i32* %prec.addr, align 4, !dbg !88
  %cmp14 = icmp eq i32 %21, %22, !dbg !89
  br i1 %cmp14, label %land.lhs.true15, label %lor.lhs.false17, !dbg !90, !cf.info !64

land.lhs.true15:                                  ; preds = %if.end
  %23 = load i32, i32* %is_right.addr, align 4, !dbg !91
  %tobool16 = icmp ne i32 %23, 0, !dbg !91
  br i1 %tobool16, label %if.then20, label %lor.lhs.false17, !dbg !92, !cf.info !64

lor.lhs.false17:                                  ; preds = %land.lhs.true15, %if.end
  %24 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !93
  %op18 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %24, i32 0, i32 0, !dbg !94
  %25 = load i32, i32* %op18, align 8, !dbg !94
  %26 = load i32, i32* %prec.addr, align 4, !dbg !95
  %cmp19 = icmp ult i32 %25, %26, !dbg !96
  br i1 %cmp19, label %if.then20, label %if.end22, !dbg !97, !cf.info !64

if.then20:                                        ; preds = %lor.lhs.false17, %land.lhs.true15
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)), !dbg !98
  br label %if.end22, !dbg !98

if.end22:                                         ; preds = %sw.bb, %if.then20, %lor.lhs.false17
  ret void, !dbg !99
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_expr(%struct.expr_t* %e, %struct.frac_t* %f) #0 !dbg !100 {
entry:
  %e.addr = alloca %struct.expr_t*, align 8
  %f.addr = alloca %struct.frac_t*, align 8
  %left = alloca %struct.frac_t, align 4
  %right = alloca %struct.frac_t, align 4
  store %struct.expr_t* %e, %struct.expr_t** %e.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.expr_t** %e.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store %struct.frac_t* %f, %struct.frac_t** %f.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.frac_t** %f.addr, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata %struct.frac_t* %left, metadata !113, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata %struct.frac_t* %right, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !118
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %0, i32 0, i32 0, !dbg !120
  %1 = load i32, i32* %op, align 8, !dbg !120
  %cmp = icmp eq i32 %1, 0, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122, !cf.info !64

if.then:                                          ; preds = %entry
  %2 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !123
  %value = getelementptr inbounds %struct.expr_t, %struct.expr_t* %2, i32 0, i32 3, !dbg !125
  %3 = load i32, i32* %value, align 8, !dbg !125
  %4 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !126
  %num = getelementptr inbounds %struct.frac_t, %struct.frac_t* %4, i32 0, i32 0, !dbg !127
  store i32 %3, i32* %num, align 4, !dbg !128
  %5 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !129
  %denom = getelementptr inbounds %struct.frac_t, %struct.frac_t* %5, i32 0, i32 1, !dbg !130
  store i32 1, i32* %denom, align 4, !dbg !131
  br label %return, !dbg !132

if.end:                                           ; preds = %entry
  %6 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !133
  %left1 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %6, i32 0, i32 1, !dbg !134
  %7 = load %struct.expr_t*, %struct.expr_t** %left1, align 8, !dbg !134
  call void @eval_expr(%struct.expr_t* %7, %struct.frac_t* %left), !dbg !135
  %8 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !136
  %right2 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %8, i32 0, i32 2, !dbg !137
  %9 = load %struct.expr_t*, %struct.expr_t** %right2, align 8, !dbg !137
  call void @eval_expr(%struct.expr_t* %9, %struct.frac_t* %right), !dbg !138
  %10 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !139
  %op3 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %10, i32 0, i32 0, !dbg !140
  %11 = load i32, i32* %op3, align 8, !dbg !140
  switch i32 %11, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb14
    i32 3, label %sw.bb26
    i32 4, label %sw.bb35
  ], !dbg !141

sw.bb:                                            ; preds = %if.end
  %num4 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 0, !dbg !142
  %12 = load i32, i32* %num4, align 4, !dbg !142
  %denom5 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !144
  %13 = load i32, i32* %denom5, align 4, !dbg !144
  %mul = mul nsw i32 %12, %13, !dbg !145
  %denom6 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !146
  %14 = load i32, i32* %denom6, align 4, !dbg !146
  %num7 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 0, !dbg !147
  %15 = load i32, i32* %num7, align 4, !dbg !147
  %mul8 = mul nsw i32 %14, %15, !dbg !148
  %add = add nsw i32 %mul, %mul8, !dbg !149
  %16 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !150
  %num9 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %16, i32 0, i32 0, !dbg !151
  store i32 %add, i32* %num9, align 4, !dbg !152
  %denom10 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !153
  %17 = load i32, i32* %denom10, align 4, !dbg !153
  %denom11 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !154
  %18 = load i32, i32* %denom11, align 4, !dbg !154
  %mul12 = mul nsw i32 %17, %18, !dbg !155
  %19 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !156
  %denom13 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %19, i32 0, i32 1, !dbg !157
  store i32 %mul12, i32* %denom13, align 4, !dbg !158
  br label %return, !dbg !159

sw.bb14:                                          ; preds = %if.end
  %num15 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 0, !dbg !160
  %20 = load i32, i32* %num15, align 4, !dbg !160
  %denom16 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !161
  %21 = load i32, i32* %denom16, align 4, !dbg !161
  %mul17 = mul nsw i32 %20, %21, !dbg !162
  %denom18 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !163
  %22 = load i32, i32* %denom18, align 4, !dbg !163
  %num19 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 0, !dbg !164
  %23 = load i32, i32* %num19, align 4, !dbg !164
  %mul20 = mul nsw i32 %22, %23, !dbg !165
  %sub = sub nsw i32 %mul17, %mul20, !dbg !166
  %24 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !167
  %num21 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %24, i32 0, i32 0, !dbg !168
  store i32 %sub, i32* %num21, align 4, !dbg !169
  %denom22 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !170
  %25 = load i32, i32* %denom22, align 4, !dbg !170
  %denom23 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !171
  %26 = load i32, i32* %denom23, align 4, !dbg !171
  %mul24 = mul nsw i32 %25, %26, !dbg !172
  %27 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !173
  %denom25 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %27, i32 0, i32 1, !dbg !174
  store i32 %mul24, i32* %denom25, align 4, !dbg !175
  br label %return, !dbg !176

sw.bb26:                                          ; preds = %if.end
  %num27 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 0, !dbg !177
  %28 = load i32, i32* %num27, align 4, !dbg !177
  %num28 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 0, !dbg !178
  %29 = load i32, i32* %num28, align 4, !dbg !178
  %mul29 = mul nsw i32 %28, %29, !dbg !179
  %30 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !180
  %num30 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %30, i32 0, i32 0, !dbg !181
  store i32 %mul29, i32* %num30, align 4, !dbg !182
  %denom31 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !183
  %31 = load i32, i32* %denom31, align 4, !dbg !183
  %denom32 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !184
  %32 = load i32, i32* %denom32, align 4, !dbg !184
  %mul33 = mul nsw i32 %31, %32, !dbg !185
  %33 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !186
  %denom34 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %33, i32 0, i32 1, !dbg !187
  store i32 %mul33, i32* %denom34, align 4, !dbg !188
  br label %return, !dbg !189

sw.bb35:                                          ; preds = %if.end
  %num36 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 0, !dbg !190
  %34 = load i32, i32* %num36, align 4, !dbg !190
  %denom37 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !191
  %35 = load i32, i32* %denom37, align 4, !dbg !191
  %mul38 = mul nsw i32 %34, %35, !dbg !192
  %36 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !193
  %num39 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %36, i32 0, i32 0, !dbg !194
  store i32 %mul38, i32* %num39, align 4, !dbg !195
  %denom40 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !196
  %37 = load i32, i32* %denom40, align 4, !dbg !196
  %num41 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 0, !dbg !197
  %38 = load i32, i32* %num41, align 4, !dbg !197
  %mul42 = mul nsw i32 %37, %38, !dbg !198
  %39 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !199
  %denom43 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %39, i32 0, i32 1, !dbg !200
  store i32 %mul42, i32* %denom43, align 4, !dbg !201
  br label %return, !dbg !202

sw.default:                                       ; preds = %if.end
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !203
  %41 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !204
  %op44 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %41, i32 0, i32 0, !dbg !205
  %42 = load i32, i32* %op44, align 8, !dbg !205
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i64 0, i64 0), i32 %42), !dbg !206
  br label %return, !dbg !207

return:                                           ; preds = %sw.default, %sw.bb35, %sw.bb26, %sw.bb14, %sw.bb, %if.then
  ret void, !dbg !208
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @solve(%struct.expr_t** %ex_in, i32 %len) #0 !dbg !209 {
entry:
  %retval = alloca i32, align 4
  %ex_in.addr = alloca %struct.expr_t**, align 8
  %len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %node = alloca %struct.expr_t, align 8
  %ex = alloca [4 x %struct.expr_t*], align 16
  %final = alloca %struct.frac_t, align 4
  store %struct.expr_t** %ex_in, %struct.expr_t*** %ex_in.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.expr_t*** %ex_in.addr, metadata !213, metadata !DIExpression()), !dbg !214
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !215, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata i32* %i, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata i32* %j, metadata !219, metadata !DIExpression()), !dbg !220
  call void @llvm.dbg.declare(metadata %struct.expr_t* %node, metadata !221, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata [4 x %struct.expr_t*]* %ex, metadata !224, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata %struct.frac_t* %final, metadata !229, metadata !DIExpression()), !dbg !230
  %0 = load i32, i32* %len.addr, align 4, !dbg !231
  %cmp = icmp eq i32 %0, 1, !dbg !233
  br i1 %cmp, label %if.then, label %if.end5, !dbg !234, !cf.info !64

if.then:                                          ; preds = %entry
  %1 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !235
  %arrayidx = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %1, i64 0, !dbg !235
  %2 = load %struct.expr_t*, %struct.expr_t** %arrayidx, align 8, !dbg !235
  call void @eval_expr(%struct.expr_t* %2, %struct.frac_t* %final), !dbg !237
  %num = getelementptr inbounds %struct.frac_t, %struct.frac_t* %final, i32 0, i32 0, !dbg !238
  %3 = load i32, i32* %num, align 4, !dbg !238
  %denom = getelementptr inbounds %struct.frac_t, %struct.frac_t* %final, i32 0, i32 1, !dbg !240
  %4 = load i32, i32* %denom, align 4, !dbg !240
  %mul = mul nsw i32 %4, 24, !dbg !241
  %cmp1 = icmp eq i32 %3, %mul, !dbg !242
  br i1 %cmp1, label %land.lhs.true, label %if.end, !dbg !243, !cf.info !64

land.lhs.true:                                    ; preds = %if.then
  %denom2 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %final, i32 0, i32 1, !dbg !244
  %5 = load i32, i32* %denom2, align 4, !dbg !244
  %tobool = icmp ne i32 %5, 0, !dbg !245
  br i1 %tobool, label %if.then3, label %if.end, !dbg !246, !cf.info !64

if.then3:                                         ; preds = %land.lhs.true
  %6 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !247
  %arrayidx4 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %6, i64 0, !dbg !247
  %7 = load %struct.expr_t*, %struct.expr_t** %arrayidx4, align 8, !dbg !247
  call void @show_expr(%struct.expr_t* %7, i32 0, i32 0), !dbg !249
  store i32 1, i32* %retval, align 4, !dbg !250
  br label %return, !dbg !250

if.end:                                           ; preds = %land.lhs.true, %if.then
  store i32 0, i32* %retval, align 4, !dbg !251
  br label %return, !dbg !251

if.end5:                                          ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !252
  br label %for.cond, !dbg !254

for.cond:                                         ; preds = %for.inc67, %if.end5
  %8 = load i32, i32* %i, align 4, !dbg !255
  %9 = load i32, i32* %len.addr, align 4, !dbg !257
  %sub = sub nsw i32 %9, 1, !dbg !258
  %cmp6 = icmp slt i32 %8, %sub, !dbg !259
  br i1 %cmp6, label %for.body, label %for.end69, !dbg !260

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !261
  %add = add nsw i32 %10, 1, !dbg !264
  store i32 %add, i32* %j, align 4, !dbg !265
  br label %for.cond7, !dbg !266

for.cond7:                                        ; preds = %for.inc, %for.body
  %11 = load i32, i32* %j, align 4, !dbg !267
  %12 = load i32, i32* %len.addr, align 4, !dbg !269
  %cmp8 = icmp slt i32 %11, %12, !dbg !270
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !271

for.body9:                                        ; preds = %for.cond7
  %13 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !272
  %14 = load i32, i32* %j, align 4, !dbg !273
  %idxprom = sext i32 %14 to i64, !dbg !272
  %arrayidx10 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %13, i64 %idxprom, !dbg !272
  %15 = load %struct.expr_t*, %struct.expr_t** %arrayidx10, align 8, !dbg !272
  %16 = load i32, i32* %j, align 4, !dbg !274
  %sub11 = sub nsw i32 %16, 1, !dbg !275
  %idxprom12 = sext i32 %sub11 to i64, !dbg !276
  %arrayidx13 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 %idxprom12, !dbg !276
  store %struct.expr_t* %15, %struct.expr_t** %arrayidx13, align 8, !dbg !277
  br label %for.inc, !dbg !276

for.inc:                                          ; preds = %for.body9
  %17 = load i32, i32* %j, align 4, !dbg !278
  %inc = add nsw i32 %17, 1, !dbg !278
  store i32 %inc, i32* %j, align 4, !dbg !278
  br label %for.cond7, !dbg !279, !llvm.loop !280

for.end:                                          ; preds = %for.cond7
  %18 = load i32, i32* %i, align 4, !dbg !282
  %idxprom14 = sext i32 %18 to i64, !dbg !283
  %arrayidx15 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 %idxprom14, !dbg !283
  store %struct.expr_t* %node, %struct.expr_t** %arrayidx15, align 8, !dbg !284
  %19 = load i32, i32* %i, align 4, !dbg !285
  %add16 = add nsw i32 %19, 1, !dbg !287
  store i32 %add16, i32* %j, align 4, !dbg !288
  br label %for.cond17, !dbg !289

for.cond17:                                       ; preds = %for.inc60, %for.end
  %20 = load i32, i32* %j, align 4, !dbg !290
  %21 = load i32, i32* %len.addr, align 4, !dbg !292
  %cmp18 = icmp slt i32 %20, %21, !dbg !293
  br i1 %cmp18, label %for.body19, label %for.end62, !dbg !294

for.body19:                                       ; preds = %for.cond17
  %22 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !295
  %23 = load i32, i32* %i, align 4, !dbg !297
  %idxprom20 = sext i32 %23 to i64, !dbg !295
  %arrayidx21 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %22, i64 %idxprom20, !dbg !295
  %24 = load %struct.expr_t*, %struct.expr_t** %arrayidx21, align 8, !dbg !295
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 1, !dbg !298
  store %struct.expr_t* %24, %struct.expr_t** %left, align 8, !dbg !299
  %25 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !300
  %26 = load i32, i32* %j, align 4, !dbg !301
  %idxprom22 = sext i32 %26 to i64, !dbg !300
  %arrayidx23 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %25, i64 %idxprom22, !dbg !300
  %27 = load %struct.expr_t*, %struct.expr_t** %arrayidx23, align 8, !dbg !300
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 2, !dbg !302
  store %struct.expr_t* %27, %struct.expr_t** %right, align 8, !dbg !303
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 0, !dbg !304
  store i32 1, i32* %op, align 8, !dbg !306
  br label %for.cond24, !dbg !307

for.cond24:                                       ; preds = %for.inc32, %for.body19
  %op25 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 0, !dbg !308
  %28 = load i32, i32* %op25, align 8, !dbg !308
  %cmp26 = icmp ule i32 %28, 4, !dbg !310
  br i1 %cmp26, label %for.body27, label %for.end35, !dbg !311

for.body27:                                       ; preds = %for.cond24
  %arraydecay = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 0, !dbg !312
  %29 = load i32, i32* %len.addr, align 4, !dbg !314
  %sub28 = sub nsw i32 %29, 1, !dbg !315
  %call = call i32 @solve(%struct.expr_t** %arraydecay, i32 %sub28), !dbg !316
  %tobool29 = icmp ne i32 %call, 0, !dbg !316
  br i1 %tobool29, label %if.then30, label %if.end31, !dbg !317, !cf.info !64

if.then30:                                        ; preds = %for.body27
  store i32 1, i32* %retval, align 4, !dbg !318
  br label %return, !dbg !318

if.end31:                                         ; preds = %for.body27
  br label %for.inc32, !dbg !319

for.inc32:                                        ; preds = %if.end31
  %op33 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 0, !dbg !320
  %30 = load i32, i32* %op33, align 8, !dbg !321
  %inc34 = add i32 %30, 1, !dbg !321
  store i32 %inc34, i32* %op33, align 8, !dbg !321
  br label %for.cond24, !dbg !322, !llvm.loop !323

for.end35:                                        ; preds = %for.cond24
  %31 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !325
  %32 = load i32, i32* %j, align 4, !dbg !326
  %idxprom36 = sext i32 %32 to i64, !dbg !325
  %arrayidx37 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %31, i64 %idxprom36, !dbg !325
  %33 = load %struct.expr_t*, %struct.expr_t** %arrayidx37, align 8, !dbg !325
  %left38 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 1, !dbg !327
  store %struct.expr_t* %33, %struct.expr_t** %left38, align 8, !dbg !328
  %34 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !329
  %35 = load i32, i32* %i, align 4, !dbg !330
  %idxprom39 = sext i32 %35 to i64, !dbg !329
  %arrayidx40 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %34, i64 %idxprom39, !dbg !329
  %36 = load %struct.expr_t*, %struct.expr_t** %arrayidx40, align 8, !dbg !329
  %right41 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 2, !dbg !331
  store %struct.expr_t* %36, %struct.expr_t** %right41, align 8, !dbg !332
  %op42 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 0, !dbg !333
  store i32 2, i32* %op42, align 8, !dbg !334
  %arraydecay43 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 0, !dbg !335
  %37 = load i32, i32* %len.addr, align 4, !dbg !337
  %sub44 = sub nsw i32 %37, 1, !dbg !338
  %call45 = call i32 @solve(%struct.expr_t** %arraydecay43, i32 %sub44), !dbg !339
  %tobool46 = icmp ne i32 %call45, 0, !dbg !339
  br i1 %tobool46, label %if.then47, label %if.end48, !dbg !340, !cf.info !64

if.then47:                                        ; preds = %for.end35
  store i32 1, i32* %retval, align 4, !dbg !341
  br label %return, !dbg !341

if.end48:                                         ; preds = %for.end35
  %op49 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 0, !dbg !342
  store i32 4, i32* %op49, align 8, !dbg !343
  %arraydecay50 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 0, !dbg !344
  %38 = load i32, i32* %len.addr, align 4, !dbg !346
  %sub51 = sub nsw i32 %38, 1, !dbg !347
  %call52 = call i32 @solve(%struct.expr_t** %arraydecay50, i32 %sub51), !dbg !348
  %tobool53 = icmp ne i32 %call52, 0, !dbg !348
  br i1 %tobool53, label %if.then54, label %if.end55, !dbg !349, !cf.info !64

if.then54:                                        ; preds = %if.end48
  store i32 1, i32* %retval, align 4, !dbg !350
  br label %return, !dbg !350

if.end55:                                         ; preds = %if.end48
  %39 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !351
  %40 = load i32, i32* %j, align 4, !dbg !352
  %idxprom56 = sext i32 %40 to i64, !dbg !351
  %arrayidx57 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %39, i64 %idxprom56, !dbg !351
  %41 = load %struct.expr_t*, %struct.expr_t** %arrayidx57, align 8, !dbg !351
  %42 = load i32, i32* %j, align 4, !dbg !353
  %idxprom58 = sext i32 %42 to i64, !dbg !354
  %arrayidx59 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 %idxprom58, !dbg !354
  store %struct.expr_t* %41, %struct.expr_t** %arrayidx59, align 8, !dbg !355
  br label %for.inc60, !dbg !356

for.inc60:                                        ; preds = %if.end55
  %43 = load i32, i32* %j, align 4, !dbg !357
  %inc61 = add nsw i32 %43, 1, !dbg !357
  store i32 %inc61, i32* %j, align 4, !dbg !357
  br label %for.cond17, !dbg !358, !llvm.loop !359

for.end62:                                        ; preds = %for.cond17
  %44 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !361
  %45 = load i32, i32* %i, align 4, !dbg !362
  %idxprom63 = sext i32 %45 to i64, !dbg !361
  %arrayidx64 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %44, i64 %idxprom63, !dbg !361
  %46 = load %struct.expr_t*, %struct.expr_t** %arrayidx64, align 8, !dbg !361
  %47 = load i32, i32* %i, align 4, !dbg !363
  %idxprom65 = sext i32 %47 to i64, !dbg !364
  %arrayidx66 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 %idxprom65, !dbg !364
  store %struct.expr_t* %46, %struct.expr_t** %arrayidx66, align 8, !dbg !365
  br label %for.inc67, !dbg !366

for.inc67:                                        ; preds = %for.end62
  %48 = load i32, i32* %i, align 4, !dbg !367
  %inc68 = add nsw i32 %48, 1, !dbg !367
  store i32 %inc68, i32* %i, align 4, !dbg !367
  br label %for.cond, !dbg !368, !llvm.loop !369

for.end69:                                        ; preds = %for.cond
  store i32 0, i32* %retval, align 4, !dbg !371
  br label %return, !dbg !371

return:                                           ; preds = %for.end69, %if.then54, %if.then47, %if.then30, %if.end, %if.then3
  %49 = load i32, i32* %retval, align 4, !dbg !372
  ret i32 %49, !dbg !372
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @solve24(i32* %n) #0 !dbg !373 {
entry:
  %n.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %ex = alloca [4 x %struct.expr_t], align 16
  %e = alloca [4 x %struct.expr_t*], align 16
  store i32* %n, i32** %n.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %n.addr, metadata !377, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.declare(metadata i32* %i, metadata !379, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.declare(metadata [4 x %struct.expr_t]* %ex, metadata !381, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.declare(metadata [4 x %struct.expr_t*]* %e, metadata !384, metadata !DIExpression()), !dbg !385
  store i32 0, i32* %i, align 4, !dbg !386
  br label %for.cond, !dbg !388

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !389
  %cmp = icmp slt i32 %0, 4, !dbg !391
  br i1 %cmp, label %for.body, label %for.end, !dbg !392

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* %ex, i64 0, i64 0, !dbg !393
  %1 = load i32, i32* %i, align 4, !dbg !395
  %idx.ext = sext i32 %1 to i64, !dbg !396
  %add.ptr = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arraydecay, i64 %idx.ext, !dbg !396
  %2 = load i32, i32* %i, align 4, !dbg !397
  %idxprom = sext i32 %2 to i64, !dbg !398
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %e, i64 0, i64 %idxprom, !dbg !398
  store %struct.expr_t* %add.ptr, %struct.expr_t** %arrayidx, align 8, !dbg !399
  %3 = load i32, i32* %i, align 4, !dbg !400
  %idxprom1 = sext i32 %3 to i64, !dbg !401
  %arrayidx2 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* %ex, i64 0, i64 %idxprom1, !dbg !401
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx2, i32 0, i32 0, !dbg !402
  store i32 0, i32* %op, align 16, !dbg !403
  %4 = load i32, i32* %i, align 4, !dbg !404
  %idxprom3 = sext i32 %4 to i64, !dbg !405
  %arrayidx4 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* %ex, i64 0, i64 %idxprom3, !dbg !405
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx4, i32 0, i32 2, !dbg !406
  store %struct.expr_t* null, %struct.expr_t** %right, align 16, !dbg !407
  %5 = load i32, i32* %i, align 4, !dbg !408
  %idxprom5 = sext i32 %5 to i64, !dbg !409
  %arrayidx6 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* %ex, i64 0, i64 %idxprom5, !dbg !409
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx6, i32 0, i32 1, !dbg !410
  store %struct.expr_t* null, %struct.expr_t** %left, align 8, !dbg !411
  %6 = load i32*, i32** %n.addr, align 8, !dbg !412
  %7 = load i32, i32* %i, align 4, !dbg !413
  %idxprom7 = sext i32 %7 to i64, !dbg !412
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 %idxprom7, !dbg !412
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !412
  %9 = load i32, i32* %i, align 4, !dbg !414
  %idxprom9 = sext i32 %9 to i64, !dbg !415
  %arrayidx10 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* %ex, i64 0, i64 %idxprom9, !dbg !415
  %value = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx10, i32 0, i32 3, !dbg !416
  store i32 %8, i32* %value, align 8, !dbg !417
  br label %for.inc, !dbg !418

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !419
  %inc = add nsw i32 %10, 1, !dbg !419
  store i32 %inc, i32* %i, align 4, !dbg !419
  br label %for.cond, !dbg !420, !llvm.loop !421

for.end:                                          ; preds = %for.cond
  %arraydecay11 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %e, i64 0, i64 0, !dbg !423
  %call = call i32 @solve(%struct.expr_t** %arraydecay11, i32 4), !dbg !424
  ret i32 %call, !dbg !425
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !426 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca [5 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !429, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.declare(metadata i32* %j, metadata !431, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.declare(metadata [5 x i32]* %n, metadata !433, metadata !DIExpression()), !dbg !437
  %0 = bitcast [5 x i32]* %n to i8*, !dbg !437
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([5 x i32]* @__const.main.n to i8*), i64 20, i1 false), !dbg !437
  %call = call i64 @time(i64* null) #5, !dbg !438
  %conv = trunc i64 %call to i32, !dbg !438
  call void @srand(i32 %conv) #5, !dbg !439
  store i32 0, i32* %j, align 4, !dbg !440
  br label %for.cond, !dbg !442

for.cond:                                         ; preds = %for.inc15, %entry
  %1 = load i32, i32* %j, align 4, !dbg !443
  %cmp = icmp slt i32 %1, 10, !dbg !445
  br i1 %cmp, label %for.body, label %for.end17, !dbg !446

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !447
  br label %for.cond2, !dbg !450

for.cond2:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %i, align 4, !dbg !451
  %cmp3 = icmp slt i32 %2, 4, !dbg !453
  br i1 %cmp3, label %for.body5, label %for.end, !dbg !454

for.body5:                                        ; preds = %for.cond2
  %call6 = call i32 @rand() #5, !dbg !455
  %conv7 = sitofp i32 %call6 to double, !dbg !457
  %mul = fmul double %conv7, 9.000000e+00, !dbg !458
  %div = fdiv double %mul, 0x41DFFFFFFFC00000, !dbg !459
  %add = fadd double 1.000000e+00, %div, !dbg !460
  %conv8 = fptosi double %add to i32, !dbg !461
  %3 = load i32, i32* %i, align 4, !dbg !462
  %idxprom = sext i32 %3 to i64, !dbg !463
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %n, i64 0, i64 %idxprom, !dbg !463
  store i32 %conv8, i32* %arrayidx, align 4, !dbg !464
  %4 = load i32, i32* %i, align 4, !dbg !465
  %idxprom9 = sext i32 %4 to i64, !dbg !466
  %arrayidx10 = getelementptr inbounds [5 x i32], [5 x i32]* %n, i64 0, i64 %idxprom9, !dbg !466
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !466
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %5), !dbg !467
  br label %for.inc, !dbg !468

for.inc:                                          ; preds = %for.body5
  %6 = load i32, i32* %i, align 4, !dbg !469
  %inc = add nsw i32 %6, 1, !dbg !469
  store i32 %inc, i32* %i, align 4, !dbg !469
  br label %for.cond2, !dbg !470, !llvm.loop !471

for.end:                                          ; preds = %for.cond2
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i64 0, i64 0)), !dbg !473
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %n, i64 0, i64 0, !dbg !474
  %call13 = call i32 @solve24(i32* %arraydecay), !dbg !475
  %tobool = icmp ne i32 %call13, 0, !dbg !475
  %7 = zext i1 %tobool to i64, !dbg !475
  %cond = select i1 %tobool, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i64 0, i64 0), !dbg !475
  %call14 = call i32 (i8*, ...) @printf(i8* %cond), !dbg !476
  br label %for.inc15, !dbg !477

for.inc15:                                        ; preds = %for.end
  %8 = load i32, i32* %j, align 4, !dbg !478
  %inc16 = add nsw i32 %8, 1, !dbg !478
  store i32 %inc16, i32* %j, align 4, !dbg !478
  br label %for.cond, !dbg !479, !llvm.loop !480

for.end17:                                        ; preds = %for.cond
  ret i32 0, !dbg !482
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: nounwind
declare dso_local i32 @rand() #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !11, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "24-game-solve.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/24-game-Solve")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !1, line: 10, baseType: !4, size: 32, elements: !5)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "C_NUM", value: 0, isUnsigned: true)
!7 = !DIEnumerator(name: "C_ADD", value: 1, isUnsigned: true)
!8 = !DIEnumerator(name: "C_SUB", value: 2, isUnsigned: true)
!9 = !DIEnumerator(name: "C_MUL", value: 3, isUnsigned: true)
!10 = !DIEnumerator(name: "C_DIV", value: 4, isUnsigned: true)
!11 = !{!12}
!12 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!17 = distinct !DISubprogram(name: "show_expr", scope: !1, file: !1, line: 19, type: !18, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !20, !25, !29}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "expr", file: !1, line: 12, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "expr_t", file: !1, line: 13, size: 256, elements: !23)
!23 = !{!24, !26, !27, !28}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "op", scope: !22, file: !1, line: 14, baseType: !25, size: 32)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "op_type", file: !1, line: 10, baseType: !3)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "left", scope: !22, file: !1, line: 15, baseType: !20, size: 64, offset: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "right", scope: !22, file: !1, line: 15, baseType: !20, size: 64, offset: 128)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !22, file: !1, line: 16, baseType: !29, size: 32, offset: 192)
!29 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!30 = !{}
!31 = !DILocalVariable(name: "e", arg: 1, scope: !17, file: !1, line: 19, type: !20)
!32 = !DILocation(line: 19, column: 21, scope: !17)
!33 = !DILocalVariable(name: "prec", arg: 2, scope: !17, file: !1, line: 19, type: !25)
!34 = !DILocation(line: 19, column: 32, scope: !17)
!35 = !DILocalVariable(name: "is_right", arg: 3, scope: !17, file: !1, line: 19, type: !29)
!36 = !DILocation(line: 19, column: 42, scope: !17)
!37 = !DILocalVariable(name: "op", scope: !17, file: !1, line: 21, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !40)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocation(line: 21, column: 22, scope: !17)
!42 = !DILocation(line: 22, column: 16, scope: !17)
!43 = !DILocation(line: 22, column: 19, scope: !17)
!44 = !DILocation(line: 22, column: 9, scope: !17)
!45 = !DILocation(line: 23, column: 38, scope: !46)
!46 = distinct !DILexicalBlock(scope: !17, file: !1, line: 22, column: 23)
!47 = !DILocation(line: 23, column: 41, scope: !46)
!48 = !DILocation(line: 23, column: 25, scope: !46)
!49 = !DILocation(line: 24, column: 25, scope: !46)
!50 = !DILocation(line: 25, column: 28, scope: !46)
!51 = !DILocation(line: 25, column: 37, scope: !46)
!52 = !DILocation(line: 26, column: 28, scope: !46)
!53 = !DILocation(line: 26, column: 37, scope: !46)
!54 = !DILocation(line: 27, column: 28, scope: !46)
!55 = !DILocation(line: 27, column: 37, scope: !46)
!56 = !DILocation(line: 28, column: 28, scope: !46)
!57 = !DILocation(line: 28, column: 37, scope: !46)
!58 = !DILocation(line: 31, column: 14, scope: !59)
!59 = distinct !DILexicalBlock(scope: !17, file: !1, line: 31, column: 13)
!60 = !DILocation(line: 31, column: 17, scope: !59)
!61 = !DILocation(line: 31, column: 23, scope: !59)
!62 = !DILocation(line: 31, column: 20, scope: !59)
!63 = !DILocation(line: 31, column: 28, scope: !59)
!64 = !{!"if"}
!65 = !DILocation(line: 31, column: 31, scope: !59)
!66 = !DILocation(line: 31, column: 41, scope: !59)
!67 = !DILocation(line: 31, column: 44, scope: !59)
!68 = !DILocation(line: 31, column: 47, scope: !59)
!69 = !DILocation(line: 31, column: 52, scope: !59)
!70 = !DILocation(line: 31, column: 50, scope: !59)
!71 = !DILocation(line: 31, column: 13, scope: !17)
!72 = !DILocation(line: 31, column: 58, scope: !59)
!73 = !DILocation(line: 32, column: 19, scope: !17)
!74 = !DILocation(line: 32, column: 22, scope: !17)
!75 = !DILocation(line: 32, column: 28, scope: !17)
!76 = !DILocation(line: 32, column: 31, scope: !17)
!77 = !DILocation(line: 32, column: 9, scope: !17)
!78 = !DILocation(line: 33, column: 22, scope: !17)
!79 = !DILocation(line: 33, column: 9, scope: !17)
!80 = !DILocation(line: 34, column: 19, scope: !17)
!81 = !DILocation(line: 34, column: 22, scope: !17)
!82 = !DILocation(line: 34, column: 29, scope: !17)
!83 = !DILocation(line: 34, column: 32, scope: !17)
!84 = !DILocation(line: 34, column: 9, scope: !17)
!85 = !DILocation(line: 35, column: 14, scope: !86)
!86 = distinct !DILexicalBlock(scope: !17, file: !1, line: 35, column: 13)
!87 = !DILocation(line: 35, column: 17, scope: !86)
!88 = !DILocation(line: 35, column: 23, scope: !86)
!89 = !DILocation(line: 35, column: 20, scope: !86)
!90 = !DILocation(line: 35, column: 28, scope: !86)
!91 = !DILocation(line: 35, column: 31, scope: !86)
!92 = !DILocation(line: 35, column: 41, scope: !86)
!93 = !DILocation(line: 35, column: 44, scope: !86)
!94 = !DILocation(line: 35, column: 47, scope: !86)
!95 = !DILocation(line: 35, column: 52, scope: !86)
!96 = !DILocation(line: 35, column: 50, scope: !86)
!97 = !DILocation(line: 35, column: 13, scope: !17)
!98 = !DILocation(line: 35, column: 58, scope: !86)
!99 = !DILocation(line: 36, column: 1, scope: !17)
!100 = distinct !DISubprogram(name: "eval_expr", scope: !1, file: !1, line: 38, type: !101, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!101 = !DISubroutineType(types: !102)
!102 = !{null, !20, !103}
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac", file: !1, line: 9, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 9, size: 64, elements: !106)
!106 = !{!107, !108}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !105, file: !1, line: 9, baseType: !29, size: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "denom", scope: !105, file: !1, line: 9, baseType: !29, size: 32, offset: 32)
!109 = !DILocalVariable(name: "e", arg: 1, scope: !100, file: !1, line: 38, type: !20)
!110 = !DILocation(line: 38, column: 21, scope: !100)
!111 = !DILocalVariable(name: "f", arg: 2, scope: !100, file: !1, line: 38, type: !103)
!112 = !DILocation(line: 38, column: 29, scope: !100)
!113 = !DILocalVariable(name: "left", scope: !100, file: !1, line: 40, type: !114)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac_t", file: !1, line: 9, baseType: !105)
!115 = !DILocation(line: 40, column: 16, scope: !100)
!116 = !DILocalVariable(name: "right", scope: !100, file: !1, line: 40, type: !114)
!117 = !DILocation(line: 40, column: 22, scope: !100)
!118 = !DILocation(line: 41, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !100, file: !1, line: 41, column: 13)
!120 = !DILocation(line: 41, column: 16, scope: !119)
!121 = !DILocation(line: 41, column: 19, scope: !119)
!122 = !DILocation(line: 41, column: 13, scope: !100)
!123 = !DILocation(line: 42, column: 26, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !1, line: 41, column: 29)
!125 = !DILocation(line: 42, column: 29, scope: !124)
!126 = !DILocation(line: 42, column: 17, scope: !124)
!127 = !DILocation(line: 42, column: 20, scope: !124)
!128 = !DILocation(line: 42, column: 24, scope: !124)
!129 = !DILocation(line: 43, column: 17, scope: !124)
!130 = !DILocation(line: 43, column: 20, scope: !124)
!131 = !DILocation(line: 43, column: 26, scope: !124)
!132 = !DILocation(line: 44, column: 17, scope: !124)
!133 = !DILocation(line: 46, column: 19, scope: !100)
!134 = !DILocation(line: 46, column: 22, scope: !100)
!135 = !DILocation(line: 46, column: 9, scope: !100)
!136 = !DILocation(line: 47, column: 19, scope: !100)
!137 = !DILocation(line: 47, column: 22, scope: !100)
!138 = !DILocation(line: 47, column: 9, scope: !100)
!139 = !DILocation(line: 48, column: 17, scope: !100)
!140 = !DILocation(line: 48, column: 20, scope: !100)
!141 = !DILocation(line: 48, column: 9, scope: !100)
!142 = !DILocation(line: 50, column: 31, scope: !143)
!143 = distinct !DILexicalBlock(scope: !100, file: !1, line: 48, column: 24)
!144 = !DILocation(line: 50, column: 43, scope: !143)
!145 = !DILocation(line: 50, column: 35, scope: !143)
!146 = !DILocation(line: 50, column: 56, scope: !143)
!147 = !DILocation(line: 50, column: 70, scope: !143)
!148 = !DILocation(line: 50, column: 62, scope: !143)
!149 = !DILocation(line: 50, column: 49, scope: !143)
!150 = !DILocation(line: 50, column: 17, scope: !143)
!151 = !DILocation(line: 50, column: 20, scope: !143)
!152 = !DILocation(line: 50, column: 24, scope: !143)
!153 = !DILocation(line: 51, column: 33, scope: !143)
!154 = !DILocation(line: 51, column: 47, scope: !143)
!155 = !DILocation(line: 51, column: 39, scope: !143)
!156 = !DILocation(line: 51, column: 17, scope: !143)
!157 = !DILocation(line: 51, column: 20, scope: !143)
!158 = !DILocation(line: 51, column: 26, scope: !143)
!159 = !DILocation(line: 52, column: 17, scope: !143)
!160 = !DILocation(line: 54, column: 31, scope: !143)
!161 = !DILocation(line: 54, column: 43, scope: !143)
!162 = !DILocation(line: 54, column: 35, scope: !143)
!163 = !DILocation(line: 54, column: 56, scope: !143)
!164 = !DILocation(line: 54, column: 70, scope: !143)
!165 = !DILocation(line: 54, column: 62, scope: !143)
!166 = !DILocation(line: 54, column: 49, scope: !143)
!167 = !DILocation(line: 54, column: 17, scope: !143)
!168 = !DILocation(line: 54, column: 20, scope: !143)
!169 = !DILocation(line: 54, column: 24, scope: !143)
!170 = !DILocation(line: 55, column: 33, scope: !143)
!171 = !DILocation(line: 55, column: 47, scope: !143)
!172 = !DILocation(line: 55, column: 39, scope: !143)
!173 = !DILocation(line: 55, column: 17, scope: !143)
!174 = !DILocation(line: 55, column: 20, scope: !143)
!175 = !DILocation(line: 55, column: 26, scope: !143)
!176 = !DILocation(line: 56, column: 17, scope: !143)
!177 = !DILocation(line: 58, column: 31, scope: !143)
!178 = !DILocation(line: 58, column: 43, scope: !143)
!179 = !DILocation(line: 58, column: 35, scope: !143)
!180 = !DILocation(line: 58, column: 17, scope: !143)
!181 = !DILocation(line: 58, column: 20, scope: !143)
!182 = !DILocation(line: 58, column: 24, scope: !143)
!183 = !DILocation(line: 59, column: 33, scope: !143)
!184 = !DILocation(line: 59, column: 47, scope: !143)
!185 = !DILocation(line: 59, column: 39, scope: !143)
!186 = !DILocation(line: 59, column: 17, scope: !143)
!187 = !DILocation(line: 59, column: 20, scope: !143)
!188 = !DILocation(line: 59, column: 26, scope: !143)
!189 = !DILocation(line: 60, column: 17, scope: !143)
!190 = !DILocation(line: 62, column: 31, scope: !143)
!191 = !DILocation(line: 62, column: 43, scope: !143)
!192 = !DILocation(line: 62, column: 35, scope: !143)
!193 = !DILocation(line: 62, column: 17, scope: !143)
!194 = !DILocation(line: 62, column: 20, scope: !143)
!195 = !DILocation(line: 62, column: 24, scope: !143)
!196 = !DILocation(line: 63, column: 33, scope: !143)
!197 = !DILocation(line: 63, column: 47, scope: !143)
!198 = !DILocation(line: 63, column: 39, scope: !143)
!199 = !DILocation(line: 63, column: 17, scope: !143)
!200 = !DILocation(line: 63, column: 20, scope: !143)
!201 = !DILocation(line: 63, column: 26, scope: !143)
!202 = !DILocation(line: 64, column: 17, scope: !143)
!203 = !DILocation(line: 66, column: 25, scope: !143)
!204 = !DILocation(line: 66, column: 53, scope: !143)
!205 = !DILocation(line: 66, column: 56, scope: !143)
!206 = !DILocation(line: 66, column: 17, scope: !143)
!207 = !DILocation(line: 67, column: 17, scope: !143)
!208 = !DILocation(line: 69, column: 1, scope: !100)
!209 = distinct !DISubprogram(name: "solve", scope: !1, file: !1, line: 70, type: !210, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!210 = !DISubroutineType(types: !211)
!211 = !{!29, !212, !29}
!212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!213 = !DILocalVariable(name: "ex_in", arg: 1, scope: !209, file: !1, line: 70, type: !212)
!214 = !DILocation(line: 70, column: 16, scope: !209)
!215 = !DILocalVariable(name: "len", arg: 2, scope: !209, file: !1, line: 70, type: !29)
!216 = !DILocation(line: 70, column: 29, scope: !209)
!217 = !DILocalVariable(name: "i", scope: !209, file: !1, line: 72, type: !29)
!218 = !DILocation(line: 72, column: 13, scope: !209)
!219 = !DILocalVariable(name: "j", scope: !209, file: !1, line: 72, type: !29)
!220 = !DILocation(line: 72, column: 16, scope: !209)
!221 = !DILocalVariable(name: "node", scope: !209, file: !1, line: 73, type: !222)
!222 = !DIDerivedType(tag: DW_TAG_typedef, name: "expr_t", file: !1, line: 17, baseType: !22)
!223 = !DILocation(line: 73, column: 16, scope: !209)
!224 = !DILocalVariable(name: "ex", scope: !209, file: !1, line: 74, type: !225)
!225 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 256, elements: !226)
!226 = !{!227}
!227 = !DISubrange(count: 4)
!228 = !DILocation(line: 74, column: 14, scope: !209)
!229 = !DILocalVariable(name: "final", scope: !209, file: !1, line: 75, type: !114)
!230 = !DILocation(line: 75, column: 16, scope: !209)
!231 = !DILocation(line: 77, column: 13, scope: !232)
!232 = distinct !DILexicalBlock(scope: !209, file: !1, line: 77, column: 13)
!233 = !DILocation(line: 77, column: 17, scope: !232)
!234 = !DILocation(line: 77, column: 13, scope: !209)
!235 = !DILocation(line: 78, column: 27, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !1, line: 77, column: 23)
!237 = !DILocation(line: 78, column: 17, scope: !236)
!238 = !DILocation(line: 79, column: 27, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !1, line: 79, column: 21)
!240 = !DILocation(line: 79, column: 40, scope: !239)
!241 = !DILocation(line: 79, column: 46, scope: !239)
!242 = !DILocation(line: 79, column: 31, scope: !239)
!243 = !DILocation(line: 79, column: 59, scope: !239)
!244 = !DILocation(line: 79, column: 68, scope: !239)
!245 = !DILocation(line: 79, column: 62, scope: !239)
!246 = !DILocation(line: 79, column: 21, scope: !236)
!247 = !DILocation(line: 80, column: 35, scope: !248)
!248 = distinct !DILexicalBlock(scope: !239, file: !1, line: 79, column: 75)
!249 = !DILocation(line: 80, column: 25, scope: !248)
!250 = !DILocation(line: 81, column: 25, scope: !248)
!251 = !DILocation(line: 83, column: 17, scope: !236)
!252 = !DILocation(line: 86, column: 16, scope: !253)
!253 = distinct !DILexicalBlock(scope: !209, file: !1, line: 86, column: 9)
!254 = !DILocation(line: 86, column: 14, scope: !253)
!255 = !DILocation(line: 86, column: 21, scope: !256)
!256 = distinct !DILexicalBlock(scope: !253, file: !1, line: 86, column: 9)
!257 = !DILocation(line: 86, column: 25, scope: !256)
!258 = !DILocation(line: 86, column: 29, scope: !256)
!259 = !DILocation(line: 86, column: 23, scope: !256)
!260 = !DILocation(line: 86, column: 9, scope: !253)
!261 = !DILocation(line: 87, column: 26, scope: !262)
!262 = distinct !DILexicalBlock(scope: !263, file: !1, line: 87, column: 17)
!263 = distinct !DILexicalBlock(scope: !256, file: !1, line: 86, column: 39)
!264 = !DILocation(line: 87, column: 28, scope: !262)
!265 = !DILocation(line: 87, column: 24, scope: !262)
!266 = !DILocation(line: 87, column: 22, scope: !262)
!267 = !DILocation(line: 87, column: 33, scope: !268)
!268 = distinct !DILexicalBlock(scope: !262, file: !1, line: 87, column: 17)
!269 = !DILocation(line: 87, column: 37, scope: !268)
!270 = !DILocation(line: 87, column: 35, scope: !268)
!271 = !DILocation(line: 87, column: 17, scope: !262)
!272 = !DILocation(line: 88, column: 37, scope: !268)
!273 = !DILocation(line: 88, column: 43, scope: !268)
!274 = !DILocation(line: 88, column: 28, scope: !268)
!275 = !DILocation(line: 88, column: 30, scope: !268)
!276 = !DILocation(line: 88, column: 25, scope: !268)
!277 = !DILocation(line: 88, column: 35, scope: !268)
!278 = !DILocation(line: 87, column: 43, scope: !268)
!279 = !DILocation(line: 87, column: 17, scope: !268)
!280 = distinct !{!280, !271, !281}
!281 = !DILocation(line: 88, column: 44, scope: !262)
!282 = !DILocation(line: 89, column: 20, scope: !263)
!283 = !DILocation(line: 89, column: 17, scope: !263)
!284 = !DILocation(line: 89, column: 23, scope: !263)
!285 = !DILocation(line: 90, column: 26, scope: !286)
!286 = distinct !DILexicalBlock(scope: !263, file: !1, line: 90, column: 17)
!287 = !DILocation(line: 90, column: 28, scope: !286)
!288 = !DILocation(line: 90, column: 24, scope: !286)
!289 = !DILocation(line: 90, column: 22, scope: !286)
!290 = !DILocation(line: 90, column: 33, scope: !291)
!291 = distinct !DILexicalBlock(scope: !286, file: !1, line: 90, column: 17)
!292 = !DILocation(line: 90, column: 37, scope: !291)
!293 = !DILocation(line: 90, column: 35, scope: !291)
!294 = !DILocation(line: 90, column: 17, scope: !286)
!295 = !DILocation(line: 91, column: 37, scope: !296)
!296 = distinct !DILexicalBlock(scope: !291, file: !1, line: 90, column: 47)
!297 = !DILocation(line: 91, column: 43, scope: !296)
!298 = !DILocation(line: 91, column: 30, scope: !296)
!299 = !DILocation(line: 91, column: 35, scope: !296)
!300 = !DILocation(line: 92, column: 38, scope: !296)
!301 = !DILocation(line: 92, column: 44, scope: !296)
!302 = !DILocation(line: 92, column: 30, scope: !296)
!303 = !DILocation(line: 92, column: 36, scope: !296)
!304 = !DILocation(line: 93, column: 35, scope: !305)
!305 = distinct !DILexicalBlock(scope: !296, file: !1, line: 93, column: 25)
!306 = !DILocation(line: 93, column: 38, scope: !305)
!307 = !DILocation(line: 93, column: 30, scope: !305)
!308 = !DILocation(line: 93, column: 52, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !1, line: 93, column: 25)
!310 = !DILocation(line: 93, column: 55, scope: !309)
!311 = !DILocation(line: 93, column: 25, scope: !305)
!312 = !DILocation(line: 94, column: 43, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !1, line: 94, column: 37)
!314 = !DILocation(line: 94, column: 47, scope: !313)
!315 = !DILocation(line: 94, column: 51, scope: !313)
!316 = !DILocation(line: 94, column: 37, scope: !313)
!317 = !DILocation(line: 94, column: 37, scope: !309)
!318 = !DILocation(line: 95, column: 41, scope: !313)
!319 = !DILocation(line: 94, column: 54, scope: !313)
!320 = !DILocation(line: 93, column: 70, scope: !309)
!321 = !DILocation(line: 93, column: 72, scope: !309)
!322 = !DILocation(line: 93, column: 25, scope: !309)
!323 = distinct !{!323, !311, !324}
!324 = !DILocation(line: 95, column: 48, scope: !305)
!325 = !DILocation(line: 97, column: 37, scope: !296)
!326 = !DILocation(line: 97, column: 43, scope: !296)
!327 = !DILocation(line: 97, column: 30, scope: !296)
!328 = !DILocation(line: 97, column: 35, scope: !296)
!329 = !DILocation(line: 98, column: 38, scope: !296)
!330 = !DILocation(line: 98, column: 44, scope: !296)
!331 = !DILocation(line: 98, column: 30, scope: !296)
!332 = !DILocation(line: 98, column: 36, scope: !296)
!333 = !DILocation(line: 99, column: 30, scope: !296)
!334 = !DILocation(line: 99, column: 33, scope: !296)
!335 = !DILocation(line: 100, column: 35, scope: !336)
!336 = distinct !DILexicalBlock(scope: !296, file: !1, line: 100, column: 29)
!337 = !DILocation(line: 100, column: 39, scope: !336)
!338 = !DILocation(line: 100, column: 43, scope: !336)
!339 = !DILocation(line: 100, column: 29, scope: !336)
!340 = !DILocation(line: 100, column: 29, scope: !296)
!341 = !DILocation(line: 100, column: 49, scope: !336)
!342 = !DILocation(line: 101, column: 30, scope: !296)
!343 = !DILocation(line: 101, column: 33, scope: !296)
!344 = !DILocation(line: 102, column: 35, scope: !345)
!345 = distinct !DILexicalBlock(scope: !296, file: !1, line: 102, column: 29)
!346 = !DILocation(line: 102, column: 39, scope: !345)
!347 = !DILocation(line: 102, column: 43, scope: !345)
!348 = !DILocation(line: 102, column: 29, scope: !345)
!349 = !DILocation(line: 102, column: 29, scope: !296)
!350 = !DILocation(line: 102, column: 49, scope: !345)
!351 = !DILocation(line: 104, column: 33, scope: !296)
!352 = !DILocation(line: 104, column: 39, scope: !296)
!353 = !DILocation(line: 104, column: 28, scope: !296)
!354 = !DILocation(line: 104, column: 25, scope: !296)
!355 = !DILocation(line: 104, column: 31, scope: !296)
!356 = !DILocation(line: 105, column: 17, scope: !296)
!357 = !DILocation(line: 90, column: 43, scope: !291)
!358 = !DILocation(line: 90, column: 17, scope: !291)
!359 = distinct !{!359, !294, !360}
!360 = !DILocation(line: 105, column: 17, scope: !286)
!361 = !DILocation(line: 106, column: 25, scope: !263)
!362 = !DILocation(line: 106, column: 31, scope: !263)
!363 = !DILocation(line: 106, column: 20, scope: !263)
!364 = !DILocation(line: 106, column: 17, scope: !263)
!365 = !DILocation(line: 106, column: 23, scope: !263)
!366 = !DILocation(line: 107, column: 9, scope: !263)
!367 = !DILocation(line: 86, column: 35, scope: !256)
!368 = !DILocation(line: 86, column: 9, scope: !256)
!369 = distinct !{!369, !260, !370}
!370 = !DILocation(line: 107, column: 9, scope: !253)
!371 = !DILocation(line: 109, column: 9, scope: !209)
!372 = !DILocation(line: 110, column: 1, scope: !209)
!373 = distinct !DISubprogram(name: "solve24", scope: !1, file: !1, line: 112, type: !374, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!374 = !DISubroutineType(types: !375)
!375 = !{!29, !376}
!376 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!377 = !DILocalVariable(name: "n", arg: 1, scope: !373, file: !1, line: 112, type: !376)
!378 = !DILocation(line: 112, column: 17, scope: !373)
!379 = !DILocalVariable(name: "i", scope: !373, file: !1, line: 114, type: !29)
!380 = !DILocation(line: 114, column: 13, scope: !373)
!381 = !DILocalVariable(name: "ex", scope: !373, file: !1, line: 115, type: !382)
!382 = !DICompositeType(tag: DW_TAG_array_type, baseType: !222, size: 1024, elements: !226)
!383 = !DILocation(line: 115, column: 16, scope: !373)
!384 = !DILocalVariable(name: "e", scope: !373, file: !1, line: 116, type: !225)
!385 = !DILocation(line: 116, column: 16, scope: !373)
!386 = !DILocation(line: 117, column: 16, scope: !387)
!387 = distinct !DILexicalBlock(scope: !373, file: !1, line: 117, column: 9)
!388 = !DILocation(line: 117, column: 14, scope: !387)
!389 = !DILocation(line: 117, column: 21, scope: !390)
!390 = distinct !DILexicalBlock(scope: !387, file: !1, line: 117, column: 9)
!391 = !DILocation(line: 117, column: 23, scope: !390)
!392 = !DILocation(line: 117, column: 9, scope: !387)
!393 = !DILocation(line: 118, column: 24, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !1, line: 117, column: 39)
!395 = !DILocation(line: 118, column: 29, scope: !394)
!396 = !DILocation(line: 118, column: 27, scope: !394)
!397 = !DILocation(line: 118, column: 19, scope: !394)
!398 = !DILocation(line: 118, column: 17, scope: !394)
!399 = !DILocation(line: 118, column: 22, scope: !394)
!400 = !DILocation(line: 119, column: 20, scope: !394)
!401 = !DILocation(line: 119, column: 17, scope: !394)
!402 = !DILocation(line: 119, column: 23, scope: !394)
!403 = !DILocation(line: 119, column: 26, scope: !394)
!404 = !DILocation(line: 120, column: 33, scope: !394)
!405 = !DILocation(line: 120, column: 30, scope: !394)
!406 = !DILocation(line: 120, column: 36, scope: !394)
!407 = !DILocation(line: 120, column: 42, scope: !394)
!408 = !DILocation(line: 120, column: 20, scope: !394)
!409 = !DILocation(line: 120, column: 17, scope: !394)
!410 = !DILocation(line: 120, column: 23, scope: !394)
!411 = !DILocation(line: 120, column: 28, scope: !394)
!412 = !DILocation(line: 121, column: 31, scope: !394)
!413 = !DILocation(line: 121, column: 33, scope: !394)
!414 = !DILocation(line: 121, column: 20, scope: !394)
!415 = !DILocation(line: 121, column: 17, scope: !394)
!416 = !DILocation(line: 121, column: 23, scope: !394)
!417 = !DILocation(line: 121, column: 29, scope: !394)
!418 = !DILocation(line: 122, column: 9, scope: !394)
!419 = !DILocation(line: 117, column: 35, scope: !390)
!420 = !DILocation(line: 117, column: 9, scope: !390)
!421 = distinct !{!421, !392, !422}
!422 = !DILocation(line: 122, column: 9, scope: !387)
!423 = !DILocation(line: 123, column: 22, scope: !373)
!424 = !DILocation(line: 123, column: 16, scope: !373)
!425 = !DILocation(line: 123, column: 9, scope: !373)
!426 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 126, type: !427, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!427 = !DISubroutineType(types: !428)
!428 = !{!29}
!429 = !DILocalVariable(name: "i", scope: !426, file: !1, line: 128, type: !29)
!430 = !DILocation(line: 128, column: 13, scope: !426)
!431 = !DILocalVariable(name: "j", scope: !426, file: !1, line: 128, type: !29)
!432 = !DILocation(line: 128, column: 16, scope: !426)
!433 = !DILocalVariable(name: "n", scope: !426, file: !1, line: 128, type: !434)
!434 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 160, elements: !435)
!435 = !{!436}
!436 = !DISubrange(count: 5)
!437 = !DILocation(line: 128, column: 19, scope: !426)
!438 = !DILocation(line: 129, column: 15, scope: !426)
!439 = !DILocation(line: 129, column: 9, scope: !426)
!440 = !DILocation(line: 131, column: 16, scope: !441)
!441 = distinct !DILexicalBlock(scope: !426, file: !1, line: 131, column: 9)
!442 = !DILocation(line: 131, column: 14, scope: !441)
!443 = !DILocation(line: 131, column: 21, scope: !444)
!444 = distinct !DILexicalBlock(scope: !441, file: !1, line: 131, column: 9)
!445 = !DILocation(line: 131, column: 23, scope: !444)
!446 = !DILocation(line: 131, column: 9, scope: !441)
!447 = !DILocation(line: 132, column: 24, scope: !448)
!448 = distinct !DILexicalBlock(scope: !449, file: !1, line: 132, column: 17)
!449 = distinct !DILexicalBlock(scope: !444, file: !1, line: 131, column: 34)
!450 = !DILocation(line: 132, column: 22, scope: !448)
!451 = !DILocation(line: 132, column: 29, scope: !452)
!452 = distinct !DILexicalBlock(scope: !448, file: !1, line: 132, column: 17)
!453 = !DILocation(line: 132, column: 31, scope: !452)
!454 = !DILocation(line: 132, column: 17, scope: !448)
!455 = !DILocation(line: 133, column: 45, scope: !456)
!456 = distinct !DILexicalBlock(scope: !452, file: !1, line: 132, column: 47)
!457 = !DILocation(line: 133, column: 36, scope: !456)
!458 = !DILocation(line: 133, column: 52, scope: !456)
!459 = !DILocation(line: 133, column: 64, scope: !456)
!460 = !DILocation(line: 133, column: 34, scope: !456)
!461 = !DILocation(line: 133, column: 32, scope: !456)
!462 = !DILocation(line: 133, column: 27, scope: !456)
!463 = !DILocation(line: 133, column: 25, scope: !456)
!464 = !DILocation(line: 133, column: 30, scope: !456)
!465 = !DILocation(line: 134, column: 41, scope: !456)
!466 = !DILocation(line: 134, column: 39, scope: !456)
!467 = !DILocation(line: 134, column: 25, scope: !456)
!468 = !DILocation(line: 135, column: 17, scope: !456)
!469 = !DILocation(line: 132, column: 43, scope: !452)
!470 = !DILocation(line: 132, column: 17, scope: !452)
!471 = distinct !{!471, !454, !472}
!472 = !DILocation(line: 135, column: 17, scope: !448)
!473 = !DILocation(line: 136, column: 17, scope: !449)
!474 = !DILocation(line: 137, column: 32, scope: !449)
!475 = !DILocation(line: 137, column: 24, scope: !449)
!476 = !DILocation(line: 137, column: 17, scope: !449)
!477 = !DILocation(line: 138, column: 9, scope: !449)
!478 = !DILocation(line: 131, column: 30, scope: !444)
!479 = !DILocation(line: 131, column: 9, scope: !444)
!480 = distinct !{!480, !446, !481}
!481 = !DILocation(line: 138, column: 9, scope: !441)
!482 = !DILocation(line: 140, column: 9, scope: !426)
