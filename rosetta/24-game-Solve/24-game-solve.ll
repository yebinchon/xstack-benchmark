; ModuleID = '24-game-solve.ll'
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

sw.epilog:                                        ; preds = %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %entry
  %4 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !58
  %op6 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %4, i32 0, i32 0, !dbg !60
  %5 = load i32, i32* %op6, align 8, !dbg !60
  %6 = load i32, i32* %prec.addr, align 4, !dbg !61
  %cmp = icmp eq i32 %5, %6, !dbg !62
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !63

land.lhs.true:                                    ; preds = %sw.epilog
  %7 = load i32, i32* %is_right.addr, align 4, !dbg !64
  %tobool = icmp ne i32 %7, 0, !dbg !64
  br i1 %tobool, label %if.then, label %lor.lhs.false, !dbg !65

lor.lhs.false:                                    ; preds = %land.lhs.true, %sw.epilog
  %8 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !66
  %op7 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %8, i32 0, i32 0, !dbg !67
  %9 = load i32, i32* %op7, align 8, !dbg !67
  %10 = load i32, i32* %prec.addr, align 4, !dbg !68
  %cmp8 = icmp ult i32 %9, %10, !dbg !69
  br i1 %cmp8, label %if.then, label %if.end, !dbg !70

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !71
  br label %if.end, !dbg !71

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %11 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !72
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %11, i32 0, i32 1, !dbg !73
  %12 = load %struct.expr_t*, %struct.expr_t** %left, align 8, !dbg !73
  %13 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !74
  %op10 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %13, i32 0, i32 0, !dbg !75
  %14 = load i32, i32* %op10, align 8, !dbg !75
  call void @show_expr(%struct.expr_t* %12, i32 %14, i32 0), !dbg !76
  %15 = load i8*, i8** %op, align 8, !dbg !77
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0), i8* %15), !dbg !78
  %16 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !79
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %16, i32 0, i32 2, !dbg !80
  %17 = load %struct.expr_t*, %struct.expr_t** %right, align 8, !dbg !80
  %18 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !81
  %op12 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %18, i32 0, i32 0, !dbg !82
  %19 = load i32, i32* %op12, align 8, !dbg !82
  call void @show_expr(%struct.expr_t* %17, i32 %19, i32 1), !dbg !83
  %20 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !84
  %op13 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %20, i32 0, i32 0, !dbg !86
  %21 = load i32, i32* %op13, align 8, !dbg !86
  %22 = load i32, i32* %prec.addr, align 4, !dbg !87
  %cmp14 = icmp eq i32 %21, %22, !dbg !88
  br i1 %cmp14, label %land.lhs.true15, label %lor.lhs.false17, !dbg !89

land.lhs.true15:                                  ; preds = %if.end
  %23 = load i32, i32* %is_right.addr, align 4, !dbg !90
  %tobool16 = icmp ne i32 %23, 0, !dbg !90
  br i1 %tobool16, label %if.then20, label %lor.lhs.false17, !dbg !91

lor.lhs.false17:                                  ; preds = %land.lhs.true15, %if.end
  %24 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !92
  %op18 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %24, i32 0, i32 0, !dbg !93
  %25 = load i32, i32* %op18, align 8, !dbg !93
  %26 = load i32, i32* %prec.addr, align 4, !dbg !94
  %cmp19 = icmp ult i32 %25, %26, !dbg !95
  br i1 %cmp19, label %if.then20, label %if.end22, !dbg !96

if.then20:                                        ; preds = %lor.lhs.false17, %land.lhs.true15
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)), !dbg !97
  br label %if.end22, !dbg !97

if.end22:                                         ; preds = %if.then20, %lor.lhs.false17, %sw.bb
  ret void, !dbg !98
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_expr(%struct.expr_t* %e, %struct.frac_t* %f) #0 !dbg !99 {
entry:
  %e.addr = alloca %struct.expr_t*, align 8
  %f.addr = alloca %struct.frac_t*, align 8
  %left = alloca %struct.frac_t, align 4
  %right = alloca %struct.frac_t, align 4
  store %struct.expr_t* %e, %struct.expr_t** %e.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.expr_t** %e.addr, metadata !108, metadata !DIExpression()), !dbg !109
  store %struct.frac_t* %f, %struct.frac_t** %f.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.frac_t** %f.addr, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata %struct.frac_t* %left, metadata !112, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata %struct.frac_t* %right, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !117
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %0, i32 0, i32 0, !dbg !119
  %1 = load i32, i32* %op, align 8, !dbg !119
  %cmp = icmp eq i32 %1, 0, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %2 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !122
  %value = getelementptr inbounds %struct.expr_t, %struct.expr_t* %2, i32 0, i32 3, !dbg !124
  %3 = load i32, i32* %value, align 8, !dbg !124
  %4 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !125
  %num = getelementptr inbounds %struct.frac_t, %struct.frac_t* %4, i32 0, i32 0, !dbg !126
  store i32 %3, i32* %num, align 4, !dbg !127
  %5 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !128
  %denom = getelementptr inbounds %struct.frac_t, %struct.frac_t* %5, i32 0, i32 1, !dbg !129
  store i32 1, i32* %denom, align 4, !dbg !130
  br label %return, !dbg !131

if.end:                                           ; preds = %entry
  %6 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !132
  %left1 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %6, i32 0, i32 1, !dbg !133
  %7 = load %struct.expr_t*, %struct.expr_t** %left1, align 8, !dbg !133
  call void @eval_expr(%struct.expr_t* %7, %struct.frac_t* %left), !dbg !134
  %8 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !135
  %right2 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %8, i32 0, i32 2, !dbg !136
  %9 = load %struct.expr_t*, %struct.expr_t** %right2, align 8, !dbg !136
  call void @eval_expr(%struct.expr_t* %9, %struct.frac_t* %right), !dbg !137
  %10 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !138
  %op3 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %10, i32 0, i32 0, !dbg !139
  %11 = load i32, i32* %op3, align 8, !dbg !139
  switch i32 %11, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb14
    i32 3, label %sw.bb26
    i32 4, label %sw.bb35
  ], !dbg !140

sw.bb:                                            ; preds = %if.end
  %num4 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 0, !dbg !141
  %12 = load i32, i32* %num4, align 4, !dbg !141
  %denom5 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !143
  %13 = load i32, i32* %denom5, align 4, !dbg !143
  %mul = mul nsw i32 %12, %13, !dbg !144
  %denom6 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !145
  %14 = load i32, i32* %denom6, align 4, !dbg !145
  %num7 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 0, !dbg !146
  %15 = load i32, i32* %num7, align 4, !dbg !146
  %mul8 = mul nsw i32 %14, %15, !dbg !147
  %add = add nsw i32 %mul, %mul8, !dbg !148
  %16 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !149
  %num9 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %16, i32 0, i32 0, !dbg !150
  store i32 %add, i32* %num9, align 4, !dbg !151
  %denom10 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !152
  %17 = load i32, i32* %denom10, align 4, !dbg !152
  %denom11 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !153
  %18 = load i32, i32* %denom11, align 4, !dbg !153
  %mul12 = mul nsw i32 %17, %18, !dbg !154
  %19 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !155
  %denom13 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %19, i32 0, i32 1, !dbg !156
  store i32 %mul12, i32* %denom13, align 4, !dbg !157
  br label %return, !dbg !158

sw.bb14:                                          ; preds = %if.end
  %num15 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 0, !dbg !159
  %20 = load i32, i32* %num15, align 4, !dbg !159
  %denom16 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !160
  %21 = load i32, i32* %denom16, align 4, !dbg !160
  %mul17 = mul nsw i32 %20, %21, !dbg !161
  %denom18 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !162
  %22 = load i32, i32* %denom18, align 4, !dbg !162
  %num19 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 0, !dbg !163
  %23 = load i32, i32* %num19, align 4, !dbg !163
  %mul20 = mul nsw i32 %22, %23, !dbg !164
  %sub = sub nsw i32 %mul17, %mul20, !dbg !165
  %24 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !166
  %num21 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %24, i32 0, i32 0, !dbg !167
  store i32 %sub, i32* %num21, align 4, !dbg !168
  %denom22 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !169
  %25 = load i32, i32* %denom22, align 4, !dbg !169
  %denom23 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !170
  %26 = load i32, i32* %denom23, align 4, !dbg !170
  %mul24 = mul nsw i32 %25, %26, !dbg !171
  %27 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !172
  %denom25 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %27, i32 0, i32 1, !dbg !173
  store i32 %mul24, i32* %denom25, align 4, !dbg !174
  br label %return, !dbg !175

sw.bb26:                                          ; preds = %if.end
  %num27 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 0, !dbg !176
  %28 = load i32, i32* %num27, align 4, !dbg !176
  %num28 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 0, !dbg !177
  %29 = load i32, i32* %num28, align 4, !dbg !177
  %mul29 = mul nsw i32 %28, %29, !dbg !178
  %30 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !179
  %num30 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %30, i32 0, i32 0, !dbg !180
  store i32 %mul29, i32* %num30, align 4, !dbg !181
  %denom31 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !182
  %31 = load i32, i32* %denom31, align 4, !dbg !182
  %denom32 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !183
  %32 = load i32, i32* %denom32, align 4, !dbg !183
  %mul33 = mul nsw i32 %31, %32, !dbg !184
  %33 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !185
  %denom34 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %33, i32 0, i32 1, !dbg !186
  store i32 %mul33, i32* %denom34, align 4, !dbg !187
  br label %return, !dbg !188

sw.bb35:                                          ; preds = %if.end
  %num36 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 0, !dbg !189
  %34 = load i32, i32* %num36, align 4, !dbg !189
  %denom37 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 1, !dbg !190
  %35 = load i32, i32* %denom37, align 4, !dbg !190
  %mul38 = mul nsw i32 %34, %35, !dbg !191
  %36 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !192
  %num39 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %36, i32 0, i32 0, !dbg !193
  store i32 %mul38, i32* %num39, align 4, !dbg !194
  %denom40 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %left, i32 0, i32 1, !dbg !195
  %37 = load i32, i32* %denom40, align 4, !dbg !195
  %num41 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %right, i32 0, i32 0, !dbg !196
  %38 = load i32, i32* %num41, align 4, !dbg !196
  %mul42 = mul nsw i32 %37, %38, !dbg !197
  %39 = load %struct.frac_t*, %struct.frac_t** %f.addr, align 8, !dbg !198
  %denom43 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %39, i32 0, i32 1, !dbg !199
  store i32 %mul42, i32* %denom43, align 4, !dbg !200
  br label %return, !dbg !201

sw.default:                                       ; preds = %if.end
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !202
  %41 = load %struct.expr_t*, %struct.expr_t** %e.addr, align 8, !dbg !203
  %op44 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %41, i32 0, i32 0, !dbg !204
  %42 = load i32, i32* %op44, align 8, !dbg !204
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i64 0, i64 0), i32 %42), !dbg !205
  br label %return, !dbg !206

return:                                           ; preds = %sw.default, %sw.bb35, %sw.bb26, %sw.bb14, %sw.bb, %if.then
  ret void, !dbg !207
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @solve(%struct.expr_t** %ex_in, i32 %len) #0 !dbg !208 {
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
  call void @llvm.dbg.declare(metadata %struct.expr_t*** %ex_in.addr, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !214, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata i32* %i, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i32* %j, metadata !218, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata %struct.expr_t* %node, metadata !220, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata [4 x %struct.expr_t*]* %ex, metadata !223, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata %struct.frac_t* %final, metadata !228, metadata !DIExpression()), !dbg !229
  %0 = load i32, i32* %len.addr, align 4, !dbg !230
  %cmp = icmp eq i32 %0, 1, !dbg !232
  br i1 %cmp, label %if.then, label %if.end5, !dbg !233

if.then:                                          ; preds = %entry
  %1 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !234
  %arrayidx = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %1, i64 0, !dbg !234
  %2 = load %struct.expr_t*, %struct.expr_t** %arrayidx, align 8, !dbg !234
  call void @eval_expr(%struct.expr_t* %2, %struct.frac_t* %final), !dbg !236
  %num = getelementptr inbounds %struct.frac_t, %struct.frac_t* %final, i32 0, i32 0, !dbg !237
  %3 = load i32, i32* %num, align 4, !dbg !237
  %denom = getelementptr inbounds %struct.frac_t, %struct.frac_t* %final, i32 0, i32 1, !dbg !239
  %4 = load i32, i32* %denom, align 4, !dbg !239
  %mul = mul nsw i32 %4, 24, !dbg !240
  %cmp1 = icmp eq i32 %3, %mul, !dbg !241
  br i1 %cmp1, label %land.lhs.true, label %if.end, !dbg !242

land.lhs.true:                                    ; preds = %if.then
  %denom2 = getelementptr inbounds %struct.frac_t, %struct.frac_t* %final, i32 0, i32 1, !dbg !243
  %5 = load i32, i32* %denom2, align 4, !dbg !243
  %tobool = icmp ne i32 %5, 0, !dbg !244
  br i1 %tobool, label %if.then3, label %if.end, !dbg !245

if.then3:                                         ; preds = %land.lhs.true
  %6 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !246
  %arrayidx4 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %6, i64 0, !dbg !246
  %7 = load %struct.expr_t*, %struct.expr_t** %arrayidx4, align 8, !dbg !246
  call void @show_expr(%struct.expr_t* %7, i32 0, i32 0), !dbg !248
  store i32 1, i32* %retval, align 4, !dbg !249
  br label %return, !dbg !249

if.end:                                           ; preds = %land.lhs.true, %if.then
  store i32 0, i32* %retval, align 4, !dbg !250
  br label %return, !dbg !250

if.end5:                                          ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !251
  br label %for.cond, !dbg !253

for.cond:                                         ; preds = %for.inc67, %if.end5
  %8 = load i32, i32* %i, align 4, !dbg !254
  %9 = load i32, i32* %len.addr, align 4, !dbg !256
  %sub = sub nsw i32 %9, 1, !dbg !257
  %cmp6 = icmp slt i32 %8, %sub, !dbg !258
  br i1 %cmp6, label %for.body, label %for.end69, !dbg !259

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !260
  %add = add nsw i32 %10, 1, !dbg !263
  store i32 %add, i32* %j, align 4, !dbg !264
  br label %for.cond7, !dbg !265

for.cond7:                                        ; preds = %for.inc, %for.body
  %11 = load i32, i32* %j, align 4, !dbg !266
  %12 = load i32, i32* %len.addr, align 4, !dbg !268
  %cmp8 = icmp slt i32 %11, %12, !dbg !269
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !270

for.body9:                                        ; preds = %for.cond7
  %13 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !271
  %14 = load i32, i32* %j, align 4, !dbg !272
  %idxprom = sext i32 %14 to i64, !dbg !271
  %arrayidx10 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %13, i64 %idxprom, !dbg !271
  %15 = load %struct.expr_t*, %struct.expr_t** %arrayidx10, align 8, !dbg !271
  %16 = load i32, i32* %j, align 4, !dbg !273
  %sub11 = sub nsw i32 %16, 1, !dbg !274
  %idxprom12 = sext i32 %sub11 to i64, !dbg !275
  %arrayidx13 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 %idxprom12, !dbg !275
  store %struct.expr_t* %15, %struct.expr_t** %arrayidx13, align 8, !dbg !276
  br label %for.inc, !dbg !275

for.inc:                                          ; preds = %for.body9
  %17 = load i32, i32* %j, align 4, !dbg !277
  %inc = add nsw i32 %17, 1, !dbg !277
  store i32 %inc, i32* %j, align 4, !dbg !277
  br label %for.cond7, !dbg !278, !llvm.loop !279

for.end:                                          ; preds = %for.cond7
  %18 = load i32, i32* %i, align 4, !dbg !281
  %idxprom14 = sext i32 %18 to i64, !dbg !282
  %arrayidx15 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 %idxprom14, !dbg !282
  store %struct.expr_t* %node, %struct.expr_t** %arrayidx15, align 8, !dbg !283
  %19 = load i32, i32* %i, align 4, !dbg !284
  %add16 = add nsw i32 %19, 1, !dbg !286
  store i32 %add16, i32* %j, align 4, !dbg !287
  br label %for.cond17, !dbg !288

for.cond17:                                       ; preds = %for.inc60, %for.end
  %20 = load i32, i32* %j, align 4, !dbg !289
  %21 = load i32, i32* %len.addr, align 4, !dbg !291
  %cmp18 = icmp slt i32 %20, %21, !dbg !292
  br i1 %cmp18, label %for.body19, label %for.end62, !dbg !293

for.body19:                                       ; preds = %for.cond17
  %22 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !294
  %23 = load i32, i32* %i, align 4, !dbg !296
  %idxprom20 = sext i32 %23 to i64, !dbg !294
  %arrayidx21 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %22, i64 %idxprom20, !dbg !294
  %24 = load %struct.expr_t*, %struct.expr_t** %arrayidx21, align 8, !dbg !294
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 1, !dbg !297
  store %struct.expr_t* %24, %struct.expr_t** %left, align 8, !dbg !298
  %25 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !299
  %26 = load i32, i32* %j, align 4, !dbg !300
  %idxprom22 = sext i32 %26 to i64, !dbg !299
  %arrayidx23 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %25, i64 %idxprom22, !dbg !299
  %27 = load %struct.expr_t*, %struct.expr_t** %arrayidx23, align 8, !dbg !299
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 2, !dbg !301
  store %struct.expr_t* %27, %struct.expr_t** %right, align 8, !dbg !302
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 0, !dbg !303
  store i32 1, i32* %op, align 8, !dbg !305
  br label %for.cond24, !dbg !306

for.cond24:                                       ; preds = %for.inc32, %for.body19
  %op25 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 0, !dbg !307
  %28 = load i32, i32* %op25, align 8, !dbg !307
  %cmp26 = icmp ule i32 %28, 4, !dbg !309
  br i1 %cmp26, label %for.body27, label %for.end35, !dbg !310

for.body27:                                       ; preds = %for.cond24
  %arraydecay = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 0, !dbg !311
  %29 = load i32, i32* %len.addr, align 4, !dbg !313
  %sub28 = sub nsw i32 %29, 1, !dbg !314
  %call = call i32 @solve(%struct.expr_t** %arraydecay, i32 %sub28), !dbg !315
  %tobool29 = icmp ne i32 %call, 0, !dbg !315
  br i1 %tobool29, label %if.then30, label %if.end31, !dbg !316

if.then30:                                        ; preds = %for.body27
  store i32 1, i32* %retval, align 4, !dbg !317
  br label %return, !dbg !317

if.end31:                                         ; preds = %for.body27
  br label %for.inc32, !dbg !318

for.inc32:                                        ; preds = %if.end31
  %op33 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 0, !dbg !319
  %30 = load i32, i32* %op33, align 8, !dbg !320
  %inc34 = add i32 %30, 1, !dbg !320
  store i32 %inc34, i32* %op33, align 8, !dbg !320
  br label %for.cond24, !dbg !321, !llvm.loop !322

for.end35:                                        ; preds = %for.cond24
  %31 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !324
  %32 = load i32, i32* %j, align 4, !dbg !325
  %idxprom36 = sext i32 %32 to i64, !dbg !324
  %arrayidx37 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %31, i64 %idxprom36, !dbg !324
  %33 = load %struct.expr_t*, %struct.expr_t** %arrayidx37, align 8, !dbg !324
  %left38 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 1, !dbg !326
  store %struct.expr_t* %33, %struct.expr_t** %left38, align 8, !dbg !327
  %34 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !328
  %35 = load i32, i32* %i, align 4, !dbg !329
  %idxprom39 = sext i32 %35 to i64, !dbg !328
  %arrayidx40 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %34, i64 %idxprom39, !dbg !328
  %36 = load %struct.expr_t*, %struct.expr_t** %arrayidx40, align 8, !dbg !328
  %right41 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 2, !dbg !330
  store %struct.expr_t* %36, %struct.expr_t** %right41, align 8, !dbg !331
  %op42 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 0, !dbg !332
  store i32 2, i32* %op42, align 8, !dbg !333
  %arraydecay43 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 0, !dbg !334
  %37 = load i32, i32* %len.addr, align 4, !dbg !336
  %sub44 = sub nsw i32 %37, 1, !dbg !337
  %call45 = call i32 @solve(%struct.expr_t** %arraydecay43, i32 %sub44), !dbg !338
  %tobool46 = icmp ne i32 %call45, 0, !dbg !338
  br i1 %tobool46, label %if.then47, label %if.end48, !dbg !339

if.then47:                                        ; preds = %for.end35
  store i32 1, i32* %retval, align 4, !dbg !340
  br label %return, !dbg !340

if.end48:                                         ; preds = %for.end35
  %op49 = getelementptr inbounds %struct.expr_t, %struct.expr_t* %node, i32 0, i32 0, !dbg !341
  store i32 4, i32* %op49, align 8, !dbg !342
  %arraydecay50 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 0, !dbg !343
  %38 = load i32, i32* %len.addr, align 4, !dbg !345
  %sub51 = sub nsw i32 %38, 1, !dbg !346
  %call52 = call i32 @solve(%struct.expr_t** %arraydecay50, i32 %sub51), !dbg !347
  %tobool53 = icmp ne i32 %call52, 0, !dbg !347
  br i1 %tobool53, label %if.then54, label %if.end55, !dbg !348

if.then54:                                        ; preds = %if.end48
  store i32 1, i32* %retval, align 4, !dbg !349
  br label %return, !dbg !349

if.end55:                                         ; preds = %if.end48
  %39 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !350
  %40 = load i32, i32* %j, align 4, !dbg !351
  %idxprom56 = sext i32 %40 to i64, !dbg !350
  %arrayidx57 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %39, i64 %idxprom56, !dbg !350
  %41 = load %struct.expr_t*, %struct.expr_t** %arrayidx57, align 8, !dbg !350
  %42 = load i32, i32* %j, align 4, !dbg !352
  %idxprom58 = sext i32 %42 to i64, !dbg !353
  %arrayidx59 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 %idxprom58, !dbg !353
  store %struct.expr_t* %41, %struct.expr_t** %arrayidx59, align 8, !dbg !354
  br label %for.inc60, !dbg !355

for.inc60:                                        ; preds = %if.end55
  %43 = load i32, i32* %j, align 4, !dbg !356
  %inc61 = add nsw i32 %43, 1, !dbg !356
  store i32 %inc61, i32* %j, align 4, !dbg !356
  br label %for.cond17, !dbg !357, !llvm.loop !358

for.end62:                                        ; preds = %for.cond17
  %44 = load %struct.expr_t**, %struct.expr_t*** %ex_in.addr, align 8, !dbg !360
  %45 = load i32, i32* %i, align 4, !dbg !361
  %idxprom63 = sext i32 %45 to i64, !dbg !360
  %arrayidx64 = getelementptr inbounds %struct.expr_t*, %struct.expr_t** %44, i64 %idxprom63, !dbg !360
  %46 = load %struct.expr_t*, %struct.expr_t** %arrayidx64, align 8, !dbg !360
  %47 = load i32, i32* %i, align 4, !dbg !362
  %idxprom65 = sext i32 %47 to i64, !dbg !363
  %arrayidx66 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %ex, i64 0, i64 %idxprom65, !dbg !363
  store %struct.expr_t* %46, %struct.expr_t** %arrayidx66, align 8, !dbg !364
  br label %for.inc67, !dbg !365

for.inc67:                                        ; preds = %for.end62
  %48 = load i32, i32* %i, align 4, !dbg !366
  %inc68 = add nsw i32 %48, 1, !dbg !366
  store i32 %inc68, i32* %i, align 4, !dbg !366
  br label %for.cond, !dbg !367, !llvm.loop !368

for.end69:                                        ; preds = %for.cond
  store i32 0, i32* %retval, align 4, !dbg !370
  br label %return, !dbg !370

return:                                           ; preds = %for.end69, %if.then54, %if.then47, %if.then30, %if.end, %if.then3
  %49 = load i32, i32* %retval, align 4, !dbg !371
  ret i32 %49, !dbg !371
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @solve24(i32* %n) #0 !dbg !372 {
entry:
  %n.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %ex = alloca [4 x %struct.expr_t], align 16
  %e = alloca [4 x %struct.expr_t*], align 16
  store i32* %n, i32** %n.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %n.addr, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.declare(metadata i32* %i, metadata !378, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.declare(metadata [4 x %struct.expr_t]* %ex, metadata !380, metadata !DIExpression()), !dbg !382
  call void @llvm.dbg.declare(metadata [4 x %struct.expr_t*]* %e, metadata !383, metadata !DIExpression()), !dbg !384
  store i32 0, i32* %i, align 4, !dbg !385
  br label %for.cond, !dbg !387

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !388
  %cmp = icmp slt i32 %0, 4, !dbg !390
  br i1 %cmp, label %for.body, label %for.end, !dbg !391

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* %ex, i64 0, i64 0, !dbg !392
  %1 = load i32, i32* %i, align 4, !dbg !394
  %idx.ext = sext i32 %1 to i64, !dbg !395
  %add.ptr = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arraydecay, i64 %idx.ext, !dbg !395
  %2 = load i32, i32* %i, align 4, !dbg !396
  %idxprom = sext i32 %2 to i64, !dbg !397
  %arrayidx = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %e, i64 0, i64 %idxprom, !dbg !397
  store %struct.expr_t* %add.ptr, %struct.expr_t** %arrayidx, align 8, !dbg !398
  %3 = load i32, i32* %i, align 4, !dbg !399
  %idxprom1 = sext i32 %3 to i64, !dbg !400
  %arrayidx2 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* %ex, i64 0, i64 %idxprom1, !dbg !400
  %op = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx2, i32 0, i32 0, !dbg !401
  store i32 0, i32* %op, align 16, !dbg !402
  %4 = load i32, i32* %i, align 4, !dbg !403
  %idxprom3 = sext i32 %4 to i64, !dbg !404
  %arrayidx4 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* %ex, i64 0, i64 %idxprom3, !dbg !404
  %right = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx4, i32 0, i32 2, !dbg !405
  store %struct.expr_t* null, %struct.expr_t** %right, align 16, !dbg !406
  %5 = load i32, i32* %i, align 4, !dbg !407
  %idxprom5 = sext i32 %5 to i64, !dbg !408
  %arrayidx6 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* %ex, i64 0, i64 %idxprom5, !dbg !408
  %left = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx6, i32 0, i32 1, !dbg !409
  store %struct.expr_t* null, %struct.expr_t** %left, align 8, !dbg !410
  %6 = load i32*, i32** %n.addr, align 8, !dbg !411
  %7 = load i32, i32* %i, align 4, !dbg !412
  %idxprom7 = sext i32 %7 to i64, !dbg !411
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 %idxprom7, !dbg !411
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !411
  %9 = load i32, i32* %i, align 4, !dbg !413
  %idxprom9 = sext i32 %9 to i64, !dbg !414
  %arrayidx10 = getelementptr inbounds [4 x %struct.expr_t], [4 x %struct.expr_t]* %ex, i64 0, i64 %idxprom9, !dbg !414
  %value = getelementptr inbounds %struct.expr_t, %struct.expr_t* %arrayidx10, i32 0, i32 3, !dbg !415
  store i32 %8, i32* %value, align 8, !dbg !416
  br label %for.inc, !dbg !417

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !418
  %inc = add nsw i32 %10, 1, !dbg !418
  store i32 %inc, i32* %i, align 4, !dbg !418
  br label %for.cond, !dbg !419, !llvm.loop !420

for.end:                                          ; preds = %for.cond
  %arraydecay11 = getelementptr inbounds [4 x %struct.expr_t*], [4 x %struct.expr_t*]* %e, i64 0, i64 0, !dbg !422
  %call = call i32 @solve(%struct.expr_t** %arraydecay11, i32 4), !dbg !423
  ret i32 %call, !dbg !424
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !425 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca [5 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !428, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.declare(metadata i32* %j, metadata !430, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.declare(metadata [5 x i32]* %n, metadata !432, metadata !DIExpression()), !dbg !436
  %0 = bitcast [5 x i32]* %n to i8*, !dbg !436
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([5 x i32]* @__const.main.n to i8*), i64 20, i1 false), !dbg !436
  %call = call i64 @time(i64* null) #5, !dbg !437
  %conv = trunc i64 %call to i32, !dbg !437
  call void @srand(i32 %conv) #5, !dbg !438
  store i32 0, i32* %j, align 4, !dbg !439
  br label %for.cond, !dbg !441

for.cond:                                         ; preds = %for.inc15, %entry
  %1 = load i32, i32* %j, align 4, !dbg !442
  %cmp = icmp slt i32 %1, 10, !dbg !444
  br i1 %cmp, label %for.body, label %for.end17, !dbg !445

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !446
  br label %for.cond2, !dbg !449

for.cond2:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %i, align 4, !dbg !450
  %cmp3 = icmp slt i32 %2, 4, !dbg !452
  br i1 %cmp3, label %for.body5, label %for.end, !dbg !453

for.body5:                                        ; preds = %for.cond2
  %call6 = call i32 @rand() #5, !dbg !454
  %conv7 = sitofp i32 %call6 to double, !dbg !456
  %mul = fmul double %conv7, 9.000000e+00, !dbg !457
  %div = fdiv double %mul, 0x41DFFFFFFFC00000, !dbg !458
  %add = fadd double 1.000000e+00, %div, !dbg !459
  %conv8 = fptosi double %add to i32, !dbg !460
  %3 = load i32, i32* %i, align 4, !dbg !461
  %idxprom = sext i32 %3 to i64, !dbg !462
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %n, i64 0, i64 %idxprom, !dbg !462
  store i32 %conv8, i32* %arrayidx, align 4, !dbg !463
  %4 = load i32, i32* %i, align 4, !dbg !464
  %idxprom9 = sext i32 %4 to i64, !dbg !465
  %arrayidx10 = getelementptr inbounds [5 x i32], [5 x i32]* %n, i64 0, i64 %idxprom9, !dbg !465
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !465
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %5), !dbg !466
  br label %for.inc, !dbg !467

for.inc:                                          ; preds = %for.body5
  %6 = load i32, i32* %i, align 4, !dbg !468
  %inc = add nsw i32 %6, 1, !dbg !468
  store i32 %inc, i32* %i, align 4, !dbg !468
  br label %for.cond2, !dbg !469, !llvm.loop !470

for.end:                                          ; preds = %for.cond2
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i64 0, i64 0)), !dbg !472
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %n, i64 0, i64 0, !dbg !473
  %call13 = call i32 @solve24(i32* %arraydecay), !dbg !474
  %tobool = icmp ne i32 %call13, 0, !dbg !474
  %7 = zext i1 %tobool to i64, !dbg !474
  %cond = select i1 %tobool, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i64 0, i64 0), !dbg !474
  %call14 = call i32 (i8*, ...) @printf(i8* %cond), !dbg !475
  br label %for.inc15, !dbg !476

for.inc15:                                        ; preds = %for.end
  %8 = load i32, i32* %j, align 4, !dbg !477
  %inc16 = add nsw i32 %8, 1, !dbg !477
  store i32 %inc16, i32* %j, align 4, !dbg !477
  br label %for.cond, !dbg !478, !llvm.loop !479

for.end17:                                        ; preds = %for.cond
  ret i32 0, !dbg !481
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !11, splitDebugInlining: false, nameTableKind: None)
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
!16 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!64 = !DILocation(line: 31, column: 31, scope: !59)
!65 = !DILocation(line: 31, column: 41, scope: !59)
!66 = !DILocation(line: 31, column: 44, scope: !59)
!67 = !DILocation(line: 31, column: 47, scope: !59)
!68 = !DILocation(line: 31, column: 52, scope: !59)
!69 = !DILocation(line: 31, column: 50, scope: !59)
!70 = !DILocation(line: 31, column: 13, scope: !17)
!71 = !DILocation(line: 31, column: 58, scope: !59)
!72 = !DILocation(line: 32, column: 19, scope: !17)
!73 = !DILocation(line: 32, column: 22, scope: !17)
!74 = !DILocation(line: 32, column: 28, scope: !17)
!75 = !DILocation(line: 32, column: 31, scope: !17)
!76 = !DILocation(line: 32, column: 9, scope: !17)
!77 = !DILocation(line: 33, column: 22, scope: !17)
!78 = !DILocation(line: 33, column: 9, scope: !17)
!79 = !DILocation(line: 34, column: 19, scope: !17)
!80 = !DILocation(line: 34, column: 22, scope: !17)
!81 = !DILocation(line: 34, column: 29, scope: !17)
!82 = !DILocation(line: 34, column: 32, scope: !17)
!83 = !DILocation(line: 34, column: 9, scope: !17)
!84 = !DILocation(line: 35, column: 14, scope: !85)
!85 = distinct !DILexicalBlock(scope: !17, file: !1, line: 35, column: 13)
!86 = !DILocation(line: 35, column: 17, scope: !85)
!87 = !DILocation(line: 35, column: 23, scope: !85)
!88 = !DILocation(line: 35, column: 20, scope: !85)
!89 = !DILocation(line: 35, column: 28, scope: !85)
!90 = !DILocation(line: 35, column: 31, scope: !85)
!91 = !DILocation(line: 35, column: 41, scope: !85)
!92 = !DILocation(line: 35, column: 44, scope: !85)
!93 = !DILocation(line: 35, column: 47, scope: !85)
!94 = !DILocation(line: 35, column: 52, scope: !85)
!95 = !DILocation(line: 35, column: 50, scope: !85)
!96 = !DILocation(line: 35, column: 13, scope: !17)
!97 = !DILocation(line: 35, column: 58, scope: !85)
!98 = !DILocation(line: 36, column: 1, scope: !17)
!99 = distinct !DISubprogram(name: "eval_expr", scope: !1, file: !1, line: 38, type: !100, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!100 = !DISubroutineType(types: !101)
!101 = !{null, !20, !102}
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac", file: !1, line: 9, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 9, size: 64, elements: !105)
!105 = !{!106, !107}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !104, file: !1, line: 9, baseType: !29, size: 32)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "denom", scope: !104, file: !1, line: 9, baseType: !29, size: 32, offset: 32)
!108 = !DILocalVariable(name: "e", arg: 1, scope: !99, file: !1, line: 38, type: !20)
!109 = !DILocation(line: 38, column: 21, scope: !99)
!110 = !DILocalVariable(name: "f", arg: 2, scope: !99, file: !1, line: 38, type: !102)
!111 = !DILocation(line: 38, column: 29, scope: !99)
!112 = !DILocalVariable(name: "left", scope: !99, file: !1, line: 40, type: !113)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac_t", file: !1, line: 9, baseType: !104)
!114 = !DILocation(line: 40, column: 16, scope: !99)
!115 = !DILocalVariable(name: "right", scope: !99, file: !1, line: 40, type: !113)
!116 = !DILocation(line: 40, column: 22, scope: !99)
!117 = !DILocation(line: 41, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !99, file: !1, line: 41, column: 13)
!119 = !DILocation(line: 41, column: 16, scope: !118)
!120 = !DILocation(line: 41, column: 19, scope: !118)
!121 = !DILocation(line: 41, column: 13, scope: !99)
!122 = !DILocation(line: 42, column: 26, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !1, line: 41, column: 29)
!124 = !DILocation(line: 42, column: 29, scope: !123)
!125 = !DILocation(line: 42, column: 17, scope: !123)
!126 = !DILocation(line: 42, column: 20, scope: !123)
!127 = !DILocation(line: 42, column: 24, scope: !123)
!128 = !DILocation(line: 43, column: 17, scope: !123)
!129 = !DILocation(line: 43, column: 20, scope: !123)
!130 = !DILocation(line: 43, column: 26, scope: !123)
!131 = !DILocation(line: 44, column: 17, scope: !123)
!132 = !DILocation(line: 46, column: 19, scope: !99)
!133 = !DILocation(line: 46, column: 22, scope: !99)
!134 = !DILocation(line: 46, column: 9, scope: !99)
!135 = !DILocation(line: 47, column: 19, scope: !99)
!136 = !DILocation(line: 47, column: 22, scope: !99)
!137 = !DILocation(line: 47, column: 9, scope: !99)
!138 = !DILocation(line: 48, column: 17, scope: !99)
!139 = !DILocation(line: 48, column: 20, scope: !99)
!140 = !DILocation(line: 48, column: 9, scope: !99)
!141 = !DILocation(line: 50, column: 31, scope: !142)
!142 = distinct !DILexicalBlock(scope: !99, file: !1, line: 48, column: 24)
!143 = !DILocation(line: 50, column: 43, scope: !142)
!144 = !DILocation(line: 50, column: 35, scope: !142)
!145 = !DILocation(line: 50, column: 56, scope: !142)
!146 = !DILocation(line: 50, column: 70, scope: !142)
!147 = !DILocation(line: 50, column: 62, scope: !142)
!148 = !DILocation(line: 50, column: 49, scope: !142)
!149 = !DILocation(line: 50, column: 17, scope: !142)
!150 = !DILocation(line: 50, column: 20, scope: !142)
!151 = !DILocation(line: 50, column: 24, scope: !142)
!152 = !DILocation(line: 51, column: 33, scope: !142)
!153 = !DILocation(line: 51, column: 47, scope: !142)
!154 = !DILocation(line: 51, column: 39, scope: !142)
!155 = !DILocation(line: 51, column: 17, scope: !142)
!156 = !DILocation(line: 51, column: 20, scope: !142)
!157 = !DILocation(line: 51, column: 26, scope: !142)
!158 = !DILocation(line: 52, column: 17, scope: !142)
!159 = !DILocation(line: 54, column: 31, scope: !142)
!160 = !DILocation(line: 54, column: 43, scope: !142)
!161 = !DILocation(line: 54, column: 35, scope: !142)
!162 = !DILocation(line: 54, column: 56, scope: !142)
!163 = !DILocation(line: 54, column: 70, scope: !142)
!164 = !DILocation(line: 54, column: 62, scope: !142)
!165 = !DILocation(line: 54, column: 49, scope: !142)
!166 = !DILocation(line: 54, column: 17, scope: !142)
!167 = !DILocation(line: 54, column: 20, scope: !142)
!168 = !DILocation(line: 54, column: 24, scope: !142)
!169 = !DILocation(line: 55, column: 33, scope: !142)
!170 = !DILocation(line: 55, column: 47, scope: !142)
!171 = !DILocation(line: 55, column: 39, scope: !142)
!172 = !DILocation(line: 55, column: 17, scope: !142)
!173 = !DILocation(line: 55, column: 20, scope: !142)
!174 = !DILocation(line: 55, column: 26, scope: !142)
!175 = !DILocation(line: 56, column: 17, scope: !142)
!176 = !DILocation(line: 58, column: 31, scope: !142)
!177 = !DILocation(line: 58, column: 43, scope: !142)
!178 = !DILocation(line: 58, column: 35, scope: !142)
!179 = !DILocation(line: 58, column: 17, scope: !142)
!180 = !DILocation(line: 58, column: 20, scope: !142)
!181 = !DILocation(line: 58, column: 24, scope: !142)
!182 = !DILocation(line: 59, column: 33, scope: !142)
!183 = !DILocation(line: 59, column: 47, scope: !142)
!184 = !DILocation(line: 59, column: 39, scope: !142)
!185 = !DILocation(line: 59, column: 17, scope: !142)
!186 = !DILocation(line: 59, column: 20, scope: !142)
!187 = !DILocation(line: 59, column: 26, scope: !142)
!188 = !DILocation(line: 60, column: 17, scope: !142)
!189 = !DILocation(line: 62, column: 31, scope: !142)
!190 = !DILocation(line: 62, column: 43, scope: !142)
!191 = !DILocation(line: 62, column: 35, scope: !142)
!192 = !DILocation(line: 62, column: 17, scope: !142)
!193 = !DILocation(line: 62, column: 20, scope: !142)
!194 = !DILocation(line: 62, column: 24, scope: !142)
!195 = !DILocation(line: 63, column: 33, scope: !142)
!196 = !DILocation(line: 63, column: 47, scope: !142)
!197 = !DILocation(line: 63, column: 39, scope: !142)
!198 = !DILocation(line: 63, column: 17, scope: !142)
!199 = !DILocation(line: 63, column: 20, scope: !142)
!200 = !DILocation(line: 63, column: 26, scope: !142)
!201 = !DILocation(line: 64, column: 17, scope: !142)
!202 = !DILocation(line: 66, column: 25, scope: !142)
!203 = !DILocation(line: 66, column: 53, scope: !142)
!204 = !DILocation(line: 66, column: 56, scope: !142)
!205 = !DILocation(line: 66, column: 17, scope: !142)
!206 = !DILocation(line: 67, column: 17, scope: !142)
!207 = !DILocation(line: 69, column: 1, scope: !99)
!208 = distinct !DISubprogram(name: "solve", scope: !1, file: !1, line: 70, type: !209, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!209 = !DISubroutineType(types: !210)
!210 = !{!29, !211, !29}
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!212 = !DILocalVariable(name: "ex_in", arg: 1, scope: !208, file: !1, line: 70, type: !211)
!213 = !DILocation(line: 70, column: 16, scope: !208)
!214 = !DILocalVariable(name: "len", arg: 2, scope: !208, file: !1, line: 70, type: !29)
!215 = !DILocation(line: 70, column: 29, scope: !208)
!216 = !DILocalVariable(name: "i", scope: !208, file: !1, line: 72, type: !29)
!217 = !DILocation(line: 72, column: 13, scope: !208)
!218 = !DILocalVariable(name: "j", scope: !208, file: !1, line: 72, type: !29)
!219 = !DILocation(line: 72, column: 16, scope: !208)
!220 = !DILocalVariable(name: "node", scope: !208, file: !1, line: 73, type: !221)
!221 = !DIDerivedType(tag: DW_TAG_typedef, name: "expr_t", file: !1, line: 17, baseType: !22)
!222 = !DILocation(line: 73, column: 16, scope: !208)
!223 = !DILocalVariable(name: "ex", scope: !208, file: !1, line: 74, type: !224)
!224 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 256, elements: !225)
!225 = !{!226}
!226 = !DISubrange(count: 4)
!227 = !DILocation(line: 74, column: 14, scope: !208)
!228 = !DILocalVariable(name: "final", scope: !208, file: !1, line: 75, type: !113)
!229 = !DILocation(line: 75, column: 16, scope: !208)
!230 = !DILocation(line: 77, column: 13, scope: !231)
!231 = distinct !DILexicalBlock(scope: !208, file: !1, line: 77, column: 13)
!232 = !DILocation(line: 77, column: 17, scope: !231)
!233 = !DILocation(line: 77, column: 13, scope: !208)
!234 = !DILocation(line: 78, column: 27, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !1, line: 77, column: 23)
!236 = !DILocation(line: 78, column: 17, scope: !235)
!237 = !DILocation(line: 79, column: 27, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !1, line: 79, column: 21)
!239 = !DILocation(line: 79, column: 40, scope: !238)
!240 = !DILocation(line: 79, column: 46, scope: !238)
!241 = !DILocation(line: 79, column: 31, scope: !238)
!242 = !DILocation(line: 79, column: 59, scope: !238)
!243 = !DILocation(line: 79, column: 68, scope: !238)
!244 = !DILocation(line: 79, column: 62, scope: !238)
!245 = !DILocation(line: 79, column: 21, scope: !235)
!246 = !DILocation(line: 80, column: 35, scope: !247)
!247 = distinct !DILexicalBlock(scope: !238, file: !1, line: 79, column: 75)
!248 = !DILocation(line: 80, column: 25, scope: !247)
!249 = !DILocation(line: 81, column: 25, scope: !247)
!250 = !DILocation(line: 83, column: 17, scope: !235)
!251 = !DILocation(line: 86, column: 16, scope: !252)
!252 = distinct !DILexicalBlock(scope: !208, file: !1, line: 86, column: 9)
!253 = !DILocation(line: 86, column: 14, scope: !252)
!254 = !DILocation(line: 86, column: 21, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !1, line: 86, column: 9)
!256 = !DILocation(line: 86, column: 25, scope: !255)
!257 = !DILocation(line: 86, column: 29, scope: !255)
!258 = !DILocation(line: 86, column: 23, scope: !255)
!259 = !DILocation(line: 86, column: 9, scope: !252)
!260 = !DILocation(line: 87, column: 26, scope: !261)
!261 = distinct !DILexicalBlock(scope: !262, file: !1, line: 87, column: 17)
!262 = distinct !DILexicalBlock(scope: !255, file: !1, line: 86, column: 39)
!263 = !DILocation(line: 87, column: 28, scope: !261)
!264 = !DILocation(line: 87, column: 24, scope: !261)
!265 = !DILocation(line: 87, column: 22, scope: !261)
!266 = !DILocation(line: 87, column: 33, scope: !267)
!267 = distinct !DILexicalBlock(scope: !261, file: !1, line: 87, column: 17)
!268 = !DILocation(line: 87, column: 37, scope: !267)
!269 = !DILocation(line: 87, column: 35, scope: !267)
!270 = !DILocation(line: 87, column: 17, scope: !261)
!271 = !DILocation(line: 88, column: 37, scope: !267)
!272 = !DILocation(line: 88, column: 43, scope: !267)
!273 = !DILocation(line: 88, column: 28, scope: !267)
!274 = !DILocation(line: 88, column: 30, scope: !267)
!275 = !DILocation(line: 88, column: 25, scope: !267)
!276 = !DILocation(line: 88, column: 35, scope: !267)
!277 = !DILocation(line: 87, column: 43, scope: !267)
!278 = !DILocation(line: 87, column: 17, scope: !267)
!279 = distinct !{!279, !270, !280}
!280 = !DILocation(line: 88, column: 44, scope: !261)
!281 = !DILocation(line: 89, column: 20, scope: !262)
!282 = !DILocation(line: 89, column: 17, scope: !262)
!283 = !DILocation(line: 89, column: 23, scope: !262)
!284 = !DILocation(line: 90, column: 26, scope: !285)
!285 = distinct !DILexicalBlock(scope: !262, file: !1, line: 90, column: 17)
!286 = !DILocation(line: 90, column: 28, scope: !285)
!287 = !DILocation(line: 90, column: 24, scope: !285)
!288 = !DILocation(line: 90, column: 22, scope: !285)
!289 = !DILocation(line: 90, column: 33, scope: !290)
!290 = distinct !DILexicalBlock(scope: !285, file: !1, line: 90, column: 17)
!291 = !DILocation(line: 90, column: 37, scope: !290)
!292 = !DILocation(line: 90, column: 35, scope: !290)
!293 = !DILocation(line: 90, column: 17, scope: !285)
!294 = !DILocation(line: 91, column: 37, scope: !295)
!295 = distinct !DILexicalBlock(scope: !290, file: !1, line: 90, column: 47)
!296 = !DILocation(line: 91, column: 43, scope: !295)
!297 = !DILocation(line: 91, column: 30, scope: !295)
!298 = !DILocation(line: 91, column: 35, scope: !295)
!299 = !DILocation(line: 92, column: 38, scope: !295)
!300 = !DILocation(line: 92, column: 44, scope: !295)
!301 = !DILocation(line: 92, column: 30, scope: !295)
!302 = !DILocation(line: 92, column: 36, scope: !295)
!303 = !DILocation(line: 93, column: 35, scope: !304)
!304 = distinct !DILexicalBlock(scope: !295, file: !1, line: 93, column: 25)
!305 = !DILocation(line: 93, column: 38, scope: !304)
!306 = !DILocation(line: 93, column: 30, scope: !304)
!307 = !DILocation(line: 93, column: 52, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !1, line: 93, column: 25)
!309 = !DILocation(line: 93, column: 55, scope: !308)
!310 = !DILocation(line: 93, column: 25, scope: !304)
!311 = !DILocation(line: 94, column: 43, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !1, line: 94, column: 37)
!313 = !DILocation(line: 94, column: 47, scope: !312)
!314 = !DILocation(line: 94, column: 51, scope: !312)
!315 = !DILocation(line: 94, column: 37, scope: !312)
!316 = !DILocation(line: 94, column: 37, scope: !308)
!317 = !DILocation(line: 95, column: 41, scope: !312)
!318 = !DILocation(line: 94, column: 54, scope: !312)
!319 = !DILocation(line: 93, column: 70, scope: !308)
!320 = !DILocation(line: 93, column: 72, scope: !308)
!321 = !DILocation(line: 93, column: 25, scope: !308)
!322 = distinct !{!322, !310, !323}
!323 = !DILocation(line: 95, column: 48, scope: !304)
!324 = !DILocation(line: 97, column: 37, scope: !295)
!325 = !DILocation(line: 97, column: 43, scope: !295)
!326 = !DILocation(line: 97, column: 30, scope: !295)
!327 = !DILocation(line: 97, column: 35, scope: !295)
!328 = !DILocation(line: 98, column: 38, scope: !295)
!329 = !DILocation(line: 98, column: 44, scope: !295)
!330 = !DILocation(line: 98, column: 30, scope: !295)
!331 = !DILocation(line: 98, column: 36, scope: !295)
!332 = !DILocation(line: 99, column: 30, scope: !295)
!333 = !DILocation(line: 99, column: 33, scope: !295)
!334 = !DILocation(line: 100, column: 35, scope: !335)
!335 = distinct !DILexicalBlock(scope: !295, file: !1, line: 100, column: 29)
!336 = !DILocation(line: 100, column: 39, scope: !335)
!337 = !DILocation(line: 100, column: 43, scope: !335)
!338 = !DILocation(line: 100, column: 29, scope: !335)
!339 = !DILocation(line: 100, column: 29, scope: !295)
!340 = !DILocation(line: 100, column: 49, scope: !335)
!341 = !DILocation(line: 101, column: 30, scope: !295)
!342 = !DILocation(line: 101, column: 33, scope: !295)
!343 = !DILocation(line: 102, column: 35, scope: !344)
!344 = distinct !DILexicalBlock(scope: !295, file: !1, line: 102, column: 29)
!345 = !DILocation(line: 102, column: 39, scope: !344)
!346 = !DILocation(line: 102, column: 43, scope: !344)
!347 = !DILocation(line: 102, column: 29, scope: !344)
!348 = !DILocation(line: 102, column: 29, scope: !295)
!349 = !DILocation(line: 102, column: 49, scope: !344)
!350 = !DILocation(line: 104, column: 33, scope: !295)
!351 = !DILocation(line: 104, column: 39, scope: !295)
!352 = !DILocation(line: 104, column: 28, scope: !295)
!353 = !DILocation(line: 104, column: 25, scope: !295)
!354 = !DILocation(line: 104, column: 31, scope: !295)
!355 = !DILocation(line: 105, column: 17, scope: !295)
!356 = !DILocation(line: 90, column: 43, scope: !290)
!357 = !DILocation(line: 90, column: 17, scope: !290)
!358 = distinct !{!358, !293, !359}
!359 = !DILocation(line: 105, column: 17, scope: !285)
!360 = !DILocation(line: 106, column: 25, scope: !262)
!361 = !DILocation(line: 106, column: 31, scope: !262)
!362 = !DILocation(line: 106, column: 20, scope: !262)
!363 = !DILocation(line: 106, column: 17, scope: !262)
!364 = !DILocation(line: 106, column: 23, scope: !262)
!365 = !DILocation(line: 107, column: 9, scope: !262)
!366 = !DILocation(line: 86, column: 35, scope: !255)
!367 = !DILocation(line: 86, column: 9, scope: !255)
!368 = distinct !{!368, !259, !369}
!369 = !DILocation(line: 107, column: 9, scope: !252)
!370 = !DILocation(line: 109, column: 9, scope: !208)
!371 = !DILocation(line: 110, column: 1, scope: !208)
!372 = distinct !DISubprogram(name: "solve24", scope: !1, file: !1, line: 112, type: !373, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!373 = !DISubroutineType(types: !374)
!374 = !{!29, !375}
!375 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!376 = !DILocalVariable(name: "n", arg: 1, scope: !372, file: !1, line: 112, type: !375)
!377 = !DILocation(line: 112, column: 17, scope: !372)
!378 = !DILocalVariable(name: "i", scope: !372, file: !1, line: 114, type: !29)
!379 = !DILocation(line: 114, column: 13, scope: !372)
!380 = !DILocalVariable(name: "ex", scope: !372, file: !1, line: 115, type: !381)
!381 = !DICompositeType(tag: DW_TAG_array_type, baseType: !221, size: 1024, elements: !225)
!382 = !DILocation(line: 115, column: 16, scope: !372)
!383 = !DILocalVariable(name: "e", scope: !372, file: !1, line: 116, type: !224)
!384 = !DILocation(line: 116, column: 16, scope: !372)
!385 = !DILocation(line: 117, column: 16, scope: !386)
!386 = distinct !DILexicalBlock(scope: !372, file: !1, line: 117, column: 9)
!387 = !DILocation(line: 117, column: 14, scope: !386)
!388 = !DILocation(line: 117, column: 21, scope: !389)
!389 = distinct !DILexicalBlock(scope: !386, file: !1, line: 117, column: 9)
!390 = !DILocation(line: 117, column: 23, scope: !389)
!391 = !DILocation(line: 117, column: 9, scope: !386)
!392 = !DILocation(line: 118, column: 24, scope: !393)
!393 = distinct !DILexicalBlock(scope: !389, file: !1, line: 117, column: 39)
!394 = !DILocation(line: 118, column: 29, scope: !393)
!395 = !DILocation(line: 118, column: 27, scope: !393)
!396 = !DILocation(line: 118, column: 19, scope: !393)
!397 = !DILocation(line: 118, column: 17, scope: !393)
!398 = !DILocation(line: 118, column: 22, scope: !393)
!399 = !DILocation(line: 119, column: 20, scope: !393)
!400 = !DILocation(line: 119, column: 17, scope: !393)
!401 = !DILocation(line: 119, column: 23, scope: !393)
!402 = !DILocation(line: 119, column: 26, scope: !393)
!403 = !DILocation(line: 120, column: 33, scope: !393)
!404 = !DILocation(line: 120, column: 30, scope: !393)
!405 = !DILocation(line: 120, column: 36, scope: !393)
!406 = !DILocation(line: 120, column: 42, scope: !393)
!407 = !DILocation(line: 120, column: 20, scope: !393)
!408 = !DILocation(line: 120, column: 17, scope: !393)
!409 = !DILocation(line: 120, column: 23, scope: !393)
!410 = !DILocation(line: 120, column: 28, scope: !393)
!411 = !DILocation(line: 121, column: 31, scope: !393)
!412 = !DILocation(line: 121, column: 33, scope: !393)
!413 = !DILocation(line: 121, column: 20, scope: !393)
!414 = !DILocation(line: 121, column: 17, scope: !393)
!415 = !DILocation(line: 121, column: 23, scope: !393)
!416 = !DILocation(line: 121, column: 29, scope: !393)
!417 = !DILocation(line: 122, column: 9, scope: !393)
!418 = !DILocation(line: 117, column: 35, scope: !389)
!419 = !DILocation(line: 117, column: 9, scope: !389)
!420 = distinct !{!420, !391, !421}
!421 = !DILocation(line: 122, column: 9, scope: !386)
!422 = !DILocation(line: 123, column: 22, scope: !372)
!423 = !DILocation(line: 123, column: 16, scope: !372)
!424 = !DILocation(line: 123, column: 9, scope: !372)
!425 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 126, type: !426, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!426 = !DISubroutineType(types: !427)
!427 = !{!29}
!428 = !DILocalVariable(name: "i", scope: !425, file: !1, line: 128, type: !29)
!429 = !DILocation(line: 128, column: 13, scope: !425)
!430 = !DILocalVariable(name: "j", scope: !425, file: !1, line: 128, type: !29)
!431 = !DILocation(line: 128, column: 16, scope: !425)
!432 = !DILocalVariable(name: "n", scope: !425, file: !1, line: 128, type: !433)
!433 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 160, elements: !434)
!434 = !{!435}
!435 = !DISubrange(count: 5)
!436 = !DILocation(line: 128, column: 19, scope: !425)
!437 = !DILocation(line: 129, column: 15, scope: !425)
!438 = !DILocation(line: 129, column: 9, scope: !425)
!439 = !DILocation(line: 131, column: 16, scope: !440)
!440 = distinct !DILexicalBlock(scope: !425, file: !1, line: 131, column: 9)
!441 = !DILocation(line: 131, column: 14, scope: !440)
!442 = !DILocation(line: 131, column: 21, scope: !443)
!443 = distinct !DILexicalBlock(scope: !440, file: !1, line: 131, column: 9)
!444 = !DILocation(line: 131, column: 23, scope: !443)
!445 = !DILocation(line: 131, column: 9, scope: !440)
!446 = !DILocation(line: 132, column: 24, scope: !447)
!447 = distinct !DILexicalBlock(scope: !448, file: !1, line: 132, column: 17)
!448 = distinct !DILexicalBlock(scope: !443, file: !1, line: 131, column: 34)
!449 = !DILocation(line: 132, column: 22, scope: !447)
!450 = !DILocation(line: 132, column: 29, scope: !451)
!451 = distinct !DILexicalBlock(scope: !447, file: !1, line: 132, column: 17)
!452 = !DILocation(line: 132, column: 31, scope: !451)
!453 = !DILocation(line: 132, column: 17, scope: !447)
!454 = !DILocation(line: 133, column: 45, scope: !455)
!455 = distinct !DILexicalBlock(scope: !451, file: !1, line: 132, column: 47)
!456 = !DILocation(line: 133, column: 36, scope: !455)
!457 = !DILocation(line: 133, column: 52, scope: !455)
!458 = !DILocation(line: 133, column: 64, scope: !455)
!459 = !DILocation(line: 133, column: 34, scope: !455)
!460 = !DILocation(line: 133, column: 32, scope: !455)
!461 = !DILocation(line: 133, column: 27, scope: !455)
!462 = !DILocation(line: 133, column: 25, scope: !455)
!463 = !DILocation(line: 133, column: 30, scope: !455)
!464 = !DILocation(line: 134, column: 41, scope: !455)
!465 = !DILocation(line: 134, column: 39, scope: !455)
!466 = !DILocation(line: 134, column: 25, scope: !455)
!467 = !DILocation(line: 135, column: 17, scope: !455)
!468 = !DILocation(line: 132, column: 43, scope: !451)
!469 = !DILocation(line: 132, column: 17, scope: !451)
!470 = distinct !{!470, !453, !471}
!471 = !DILocation(line: 135, column: 17, scope: !447)
!472 = !DILocation(line: 136, column: 17, scope: !448)
!473 = !DILocation(line: 137, column: 32, scope: !448)
!474 = !DILocation(line: 137, column: 24, scope: !448)
!475 = !DILocation(line: 137, column: 17, scope: !448)
!476 = !DILocation(line: 138, column: 9, scope: !448)
!477 = !DILocation(line: 131, column: 30, scope: !443)
!478 = !DILocation(line: 131, column: 9, scope: !443)
!479 = distinct !{!479, !445, !480}
!480 = !DILocation(line: 138, column: 9, scope: !440)
!481 = !DILocation(line: 140, column: 9, scope: !425)
