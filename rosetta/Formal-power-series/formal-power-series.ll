; ModuleID = 'formal-power-series.c'
source_filename = "formal-power-series.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.fps_t = type { i32, %struct.fps_t*, %struct.fps_t*, double }

@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [21 x i8] c"Unknown operator %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"Sin:\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c" %g\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"\0ACos:\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"\0ATan:\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"\0AExp:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fps_t* @fps_new() #0 !dbg !17 {
entry:
  %x = alloca %struct.fps_t*, align 8
  call void @llvm.dbg.declare(metadata %struct.fps_t** %x, metadata !31, metadata !DIExpression()), !dbg !32
  %call = call noalias i8* @malloc(i64 32) #5, !dbg !33
  %0 = bitcast i8* %call to %struct.fps_t*, !dbg !33
  store %struct.fps_t* %0, %struct.fps_t** %x, align 8, !dbg !32
  %1 = load %struct.fps_t*, %struct.fps_t** %x, align 8, !dbg !34
  %a0 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %1, i32 0, i32 3, !dbg !35
  store double 0.000000e+00, double* %a0, align 8, !dbg !36
  %2 = load %struct.fps_t*, %struct.fps_t** %x, align 8, !dbg !37
  %s2 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %2, i32 0, i32 2, !dbg !38
  store %struct.fps_t* null, %struct.fps_t** %s2, align 8, !dbg !39
  %3 = load %struct.fps_t*, %struct.fps_t** %x, align 8, !dbg !40
  %s1 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %3, i32 0, i32 1, !dbg !41
  store %struct.fps_t* null, %struct.fps_t** %s1, align 8, !dbg !42
  %4 = load %struct.fps_t*, %struct.fps_t** %x, align 8, !dbg !43
  %type = getelementptr inbounds %struct.fps_t, %struct.fps_t* %4, i32 0, i32 0, !dbg !44
  store i32 0, i32* %type, align 8, !dbg !45
  %5 = load %struct.fps_t*, %struct.fps_t** %x, align 8, !dbg !46
  ret %struct.fps_t* %5, !dbg !47
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @fps_redefine(%struct.fps_t* %x, i32 %op, %struct.fps_t* %y, %struct.fps_t* %z) #0 !dbg !48 {
entry:
  %x.addr = alloca %struct.fps_t*, align 8
  %op.addr = alloca i32, align 4
  %y.addr = alloca %struct.fps_t*, align 8
  %z.addr = alloca %struct.fps_t*, align 8
  store %struct.fps_t* %x, %struct.fps_t** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.fps_t** %x.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 %op, i32* %op.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %op.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store %struct.fps_t* %y, %struct.fps_t** %y.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.fps_t** %y.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store %struct.fps_t* %z, %struct.fps_t** %z.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.fps_t** %z.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* %op.addr, align 4, !dbg !59
  %1 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !60
  %type = getelementptr inbounds %struct.fps_t, %struct.fps_t* %1, i32 0, i32 0, !dbg !61
  store i32 %0, i32* %type, align 8, !dbg !62
  %2 = load %struct.fps_t*, %struct.fps_t** %y.addr, align 8, !dbg !63
  %3 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !64
  %s1 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %3, i32 0, i32 1, !dbg !65
  store %struct.fps_t* %2, %struct.fps_t** %s1, align 8, !dbg !66
  %4 = load %struct.fps_t*, %struct.fps_t** %z.addr, align 8, !dbg !67
  %5 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !68
  %s2 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %5, i32 0, i32 2, !dbg !69
  store %struct.fps_t* %4, %struct.fps_t** %s2, align 8, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fps_t* @_binary(%struct.fps_t* %x, %struct.fps_t* %y, i32 %op) #0 !dbg !72 {
entry:
  %x.addr = alloca %struct.fps_t*, align 8
  %y.addr = alloca %struct.fps_t*, align 8
  %op.addr = alloca i32, align 4
  %s = alloca %struct.fps_t*, align 8
  store %struct.fps_t* %x, %struct.fps_t** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.fps_t** %x.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store %struct.fps_t* %y, %struct.fps_t** %y.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.fps_t** %y.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 %op, i32* %op.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %op.addr, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata %struct.fps_t** %s, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call %struct.fps_t* @fps_new(), !dbg !83
  store %struct.fps_t* %call, %struct.fps_t** %s, align 8, !dbg !82
  %0 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !84
  %1 = load %struct.fps_t*, %struct.fps_t** %s, align 8, !dbg !85
  %s1 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %1, i32 0, i32 1, !dbg !86
  store %struct.fps_t* %0, %struct.fps_t** %s1, align 8, !dbg !87
  %2 = load %struct.fps_t*, %struct.fps_t** %y.addr, align 8, !dbg !88
  %3 = load %struct.fps_t*, %struct.fps_t** %s, align 8, !dbg !89
  %s2 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %3, i32 0, i32 2, !dbg !90
  store %struct.fps_t* %2, %struct.fps_t** %s2, align 8, !dbg !91
  %4 = load i32, i32* %op.addr, align 4, !dbg !92
  %5 = load %struct.fps_t*, %struct.fps_t** %s, align 8, !dbg !93
  %type = getelementptr inbounds %struct.fps_t, %struct.fps_t* %5, i32 0, i32 0, !dbg !94
  store i32 %4, i32* %type, align 8, !dbg !95
  %6 = load %struct.fps_t*, %struct.fps_t** %s, align 8, !dbg !96
  ret %struct.fps_t* %6, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fps_t* @_unary(%struct.fps_t* %x, i32 %op) #0 !dbg !98 {
entry:
  %x.addr = alloca %struct.fps_t*, align 8
  %op.addr = alloca i32, align 4
  %s = alloca %struct.fps_t*, align 8
  store %struct.fps_t* %x, %struct.fps_t** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.fps_t** %x.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i32 %op, i32* %op.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %op.addr, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata %struct.fps_t** %s, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call %struct.fps_t* @fps_new(), !dbg !107
  store %struct.fps_t* %call, %struct.fps_t** %s, align 8, !dbg !106
  %0 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !108
  %1 = load %struct.fps_t*, %struct.fps_t** %s, align 8, !dbg !109
  %s1 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %1, i32 0, i32 1, !dbg !110
  store %struct.fps_t* %0, %struct.fps_t** %s1, align 8, !dbg !111
  %2 = load i32, i32* %op.addr, align 4, !dbg !112
  %3 = load %struct.fps_t*, %struct.fps_t** %s, align 8, !dbg !113
  %type = getelementptr inbounds %struct.fps_t, %struct.fps_t* %3, i32 0, i32 0, !dbg !114
  store i32 %2, i32* %type, align 8, !dbg !115
  %4 = load %struct.fps_t*, %struct.fps_t** %s, align 8, !dbg !116
  ret %struct.fps_t* %4, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @term(%struct.fps_t* %x, i32 %n) #0 !dbg !118 {
entry:
  %retval = alloca double, align 8
  %x.addr = alloca %struct.fps_t*, align 8
  %n.addr = alloca i32, align 4
  %ret = alloca double, align 8
  %i = alloca i32, align 4
  store %struct.fps_t* %x, %struct.fps_t** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.fps_t** %x.addr, metadata !121, metadata !DIExpression()), !dbg !122
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata double* %ret, metadata !125, metadata !DIExpression()), !dbg !126
  store double 0.000000e+00, double* %ret, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i32* %i, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !129
  %type = getelementptr inbounds %struct.fps_t, %struct.fps_t* %0, i32 0, i32 0, !dbg !130
  %1 = load i32, i32* %type, align 8, !dbg !130
  switch i32 %1, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb3
    i32 3, label %sw.bb8
    i32 4, label %sw.bb16
    i32 5, label %sw.bb35
    i32 6, label %sw.bb40
  ], !dbg !131

sw.bb:                                            ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !132
  %cmp = icmp sgt i32 %2, 0, !dbg !134
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !132

cond.true:                                        ; preds = %sw.bb
  br label %cond.end, !dbg !132

cond.false:                                       ; preds = %sw.bb
  %3 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !135
  %a0 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %3, i32 0, i32 3, !dbg !136
  %4 = load double, double* %a0, align 8, !dbg !136
  br label %cond.end, !dbg !132

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ 0.000000e+00, %cond.true ], [ %4, %cond.false ], !dbg !132
  store double %cond, double* %retval, align 8, !dbg !137
  br label %return, !dbg !137

sw.bb1:                                           ; preds = %entry
  %5 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !138
  %s1 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %5, i32 0, i32 1, !dbg !139
  %6 = load %struct.fps_t*, %struct.fps_t** %s1, align 8, !dbg !139
  %7 = load i32, i32* %n.addr, align 4, !dbg !140
  %call = call double @term(%struct.fps_t* %6, i32 %7), !dbg !141
  %8 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !142
  %s2 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %8, i32 0, i32 2, !dbg !143
  %9 = load %struct.fps_t*, %struct.fps_t** %s2, align 8, !dbg !143
  %10 = load i32, i32* %n.addr, align 4, !dbg !144
  %call2 = call double @term(%struct.fps_t* %9, i32 %10), !dbg !145
  %add = fadd double %call, %call2, !dbg !146
  store double %add, double* %ret, align 8, !dbg !147
  br label %sw.epilog, !dbg !148

sw.bb3:                                           ; preds = %entry
  %11 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !149
  %s14 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %11, i32 0, i32 1, !dbg !150
  %12 = load %struct.fps_t*, %struct.fps_t** %s14, align 8, !dbg !150
  %13 = load i32, i32* %n.addr, align 4, !dbg !151
  %call5 = call double @term(%struct.fps_t* %12, i32 %13), !dbg !152
  %14 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !153
  %s26 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %14, i32 0, i32 2, !dbg !154
  %15 = load %struct.fps_t*, %struct.fps_t** %s26, align 8, !dbg !154
  %16 = load i32, i32* %n.addr, align 4, !dbg !155
  %call7 = call double @term(%struct.fps_t* %15, i32 %16), !dbg !156
  %sub = fsub double %call5, %call7, !dbg !157
  store double %sub, double* %ret, align 8, !dbg !158
  br label %sw.epilog, !dbg !159

sw.bb8:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %sw.bb8
  %17 = load i32, i32* %i, align 4, !dbg !163
  %18 = load i32, i32* %n.addr, align 4, !dbg !165
  %cmp9 = icmp sle i32 %17, %18, !dbg !166
  br i1 %cmp9, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %19 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !168
  %s110 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %19, i32 0, i32 1, !dbg !169
  %20 = load %struct.fps_t*, %struct.fps_t** %s110, align 8, !dbg !169
  %21 = load i32, i32* %i, align 4, !dbg !170
  %call11 = call double @term(%struct.fps_t* %20, i32 %21), !dbg !171
  %22 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !172
  %s212 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %22, i32 0, i32 2, !dbg !173
  %23 = load %struct.fps_t*, %struct.fps_t** %s212, align 8, !dbg !173
  %24 = load i32, i32* %n.addr, align 4, !dbg !174
  %25 = load i32, i32* %i, align 4, !dbg !175
  %sub13 = sub nsw i32 %24, %25, !dbg !176
  %call14 = call double @term(%struct.fps_t* %23, i32 %sub13), !dbg !177
  %mul = fmul double %call11, %call14, !dbg !178
  %26 = load double, double* %ret, align 8, !dbg !179
  %add15 = fadd double %26, %mul, !dbg !179
  store double %add15, double* %ret, align 8, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %27 = load i32, i32* %i, align 4, !dbg !181
  %inc = add nsw i32 %27, 1, !dbg !181
  store i32 %inc, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  br label %sw.epilog, !dbg !185

sw.bb16:                                          ; preds = %entry
  %28 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !186
  %s217 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %28, i32 0, i32 2, !dbg !188
  %29 = load %struct.fps_t*, %struct.fps_t** %s217, align 8, !dbg !188
  %call18 = call double @term(%struct.fps_t* %29, i32 0), !dbg !189
  %tobool = fcmp une double %call18, 0.000000e+00, !dbg !189
  br i1 %tobool, label %if.end, label %if.then, !dbg !190, !cf.info !191

if.then:                                          ; preds = %sw.bb16
  store double 0x7FF8000000000000, double* %retval, align 8, !dbg !192
  br label %return, !dbg !192

if.end:                                           ; preds = %sw.bb16
  %30 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !193
  %s119 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %30, i32 0, i32 1, !dbg !194
  %31 = load %struct.fps_t*, %struct.fps_t** %s119, align 8, !dbg !194
  %32 = load i32, i32* %n.addr, align 4, !dbg !195
  %call20 = call double @term(%struct.fps_t* %31, i32 %32), !dbg !196
  store double %call20, double* %ret, align 8, !dbg !197
  store i32 1, i32* %i, align 4, !dbg !198
  br label %for.cond21, !dbg !200

for.cond21:                                       ; preds = %for.inc32, %if.end
  %33 = load i32, i32* %i, align 4, !dbg !201
  %34 = load i32, i32* %n.addr, align 4, !dbg !203
  %cmp22 = icmp sle i32 %33, %34, !dbg !204
  br i1 %cmp22, label %for.body23, label %for.end34, !dbg !205

for.body23:                                       ; preds = %for.cond21
  %35 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !206
  %s224 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %35, i32 0, i32 2, !dbg !207
  %36 = load %struct.fps_t*, %struct.fps_t** %s224, align 8, !dbg !207
  %37 = load i32, i32* %i, align 4, !dbg !208
  %call25 = call double @term(%struct.fps_t* %36, i32 %37), !dbg !209
  %38 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !210
  %39 = load i32, i32* %n.addr, align 4, !dbg !211
  %40 = load i32, i32* %i, align 4, !dbg !212
  %sub26 = sub nsw i32 %39, %40, !dbg !213
  %call27 = call double @term(%struct.fps_t* %38, i32 %sub26), !dbg !214
  %mul28 = fmul double %call25, %call27, !dbg !215
  %41 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !216
  %s229 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %41, i32 0, i32 2, !dbg !217
  %42 = load %struct.fps_t*, %struct.fps_t** %s229, align 8, !dbg !217
  %call30 = call double @term(%struct.fps_t* %42, i32 0), !dbg !218
  %div = fdiv double %mul28, %call30, !dbg !219
  %43 = load double, double* %ret, align 8, !dbg !220
  %sub31 = fsub double %43, %div, !dbg !220
  store double %sub31, double* %ret, align 8, !dbg !220
  br label %for.inc32, !dbg !221

for.inc32:                                        ; preds = %for.body23
  %44 = load i32, i32* %i, align 4, !dbg !222
  %inc33 = add nsw i32 %44, 1, !dbg !222
  store i32 %inc33, i32* %i, align 4, !dbg !222
  br label %for.cond21, !dbg !223, !llvm.loop !224

for.end34:                                        ; preds = %for.cond21
  br label %sw.epilog, !dbg !226

sw.bb35:                                          ; preds = %entry
  %45 = load i32, i32* %n.addr, align 4, !dbg !227
  %conv = sitofp i32 %45 to double, !dbg !227
  %46 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !228
  %s136 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %46, i32 0, i32 1, !dbg !229
  %47 = load %struct.fps_t*, %struct.fps_t** %s136, align 8, !dbg !229
  %48 = load i32, i32* %n.addr, align 4, !dbg !230
  %add37 = add nsw i32 %48, 1, !dbg !231
  %call38 = call double @term(%struct.fps_t* %47, i32 %add37), !dbg !232
  %mul39 = fmul double %conv, %call38, !dbg !233
  store double %mul39, double* %ret, align 8, !dbg !234
  br label %sw.epilog, !dbg !235

sw.bb40:                                          ; preds = %entry
  %49 = load i32, i32* %n.addr, align 4, !dbg !236
  %tobool41 = icmp ne i32 %49, 0, !dbg !236
  br i1 %tobool41, label %if.end44, label %if.then42, !dbg !238, !cf.info !191

if.then42:                                        ; preds = %sw.bb40
  %50 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !239
  %a043 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %50, i32 0, i32 3, !dbg !240
  %51 = load double, double* %a043, align 8, !dbg !240
  store double %51, double* %retval, align 8, !dbg !241
  br label %return, !dbg !241

if.end44:                                         ; preds = %sw.bb40
  %52 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !242
  %s145 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %52, i32 0, i32 1, !dbg !243
  %53 = load %struct.fps_t*, %struct.fps_t** %s145, align 8, !dbg !243
  %54 = load i32, i32* %n.addr, align 4, !dbg !244
  %sub46 = sub nsw i32 %54, 1, !dbg !245
  %call47 = call double @term(%struct.fps_t* %53, i32 %sub46), !dbg !246
  %55 = load i32, i32* %n.addr, align 4, !dbg !247
  %conv48 = sitofp i32 %55 to double, !dbg !247
  %div49 = fdiv double %call47, %conv48, !dbg !248
  store double %div49, double* %ret, align 8, !dbg !249
  br label %sw.epilog, !dbg !250

sw.default:                                       ; preds = %entry
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !251
  %57 = load %struct.fps_t*, %struct.fps_t** %x.addr, align 8, !dbg !252
  %type50 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %57, i32 0, i32 0, !dbg !253
  %58 = load i32, i32* %type50, align 8, !dbg !253
  %call51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i32 %58), !dbg !254
  call void @exit(i32 1) #6, !dbg !255
  unreachable, !dbg !255

sw.epilog:                                        ; preds = %if.end44, %sw.bb35, %for.end34, %for.end, %sw.bb3, %sw.bb1
  %59 = load double, double* %ret, align 8, !dbg !256
  store double %59, double* %retval, align 8, !dbg !257
  br label %return, !dbg !257

return:                                           ; preds = %sw.epilog, %if.then42, %if.then, %cond.end
  %60 = load double, double* %retval, align 8, !dbg !258
  ret double %60, !dbg !258
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fps_t* @fps_const(double %a0) #0 !dbg !259 {
entry:
  %a0.addr = alloca double, align 8
  %x = alloca %struct.fps_t*, align 8
  store double %a0, double* %a0.addr, align 8
  call void @llvm.dbg.declare(metadata double* %a0.addr, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata %struct.fps_t** %x, metadata !264, metadata !DIExpression()), !dbg !265
  %call = call %struct.fps_t* @fps_new(), !dbg !266
  store %struct.fps_t* %call, %struct.fps_t** %x, align 8, !dbg !265
  %0 = load %struct.fps_t*, %struct.fps_t** %x, align 8, !dbg !267
  %type = getelementptr inbounds %struct.fps_t, %struct.fps_t* %0, i32 0, i32 0, !dbg !268
  store i32 0, i32* %type, align 8, !dbg !269
  %1 = load double, double* %a0.addr, align 8, !dbg !270
  %2 = load %struct.fps_t*, %struct.fps_t** %x, align 8, !dbg !271
  %a01 = getelementptr inbounds %struct.fps_t, %struct.fps_t* %2, i32 0, i32 3, !dbg !272
  store double %1, double* %a01, align 8, !dbg !273
  %3 = load %struct.fps_t*, %struct.fps_t** %x, align 8, !dbg !274
  ret %struct.fps_t* %3, !dbg !275
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !276 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %one = alloca %struct.fps_t*, align 8
  %fcos = alloca %struct.fps_t*, align 8
  %fsin = alloca %struct.fps_t*, align 8
  %ftan = alloca %struct.fps_t*, align 8
  %fexp = alloca %struct.fps_t*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !279, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.declare(metadata %struct.fps_t** %one, metadata !281, metadata !DIExpression()), !dbg !282
  %call = call %struct.fps_t* @fps_const(double 1.000000e+00), !dbg !283
  store %struct.fps_t* %call, %struct.fps_t** %one, align 8, !dbg !282
  call void @llvm.dbg.declare(metadata %struct.fps_t** %fcos, metadata !284, metadata !DIExpression()), !dbg !285
  %call1 = call %struct.fps_t* @fps_new(), !dbg !286
  store %struct.fps_t* %call1, %struct.fps_t** %fcos, align 8, !dbg !285
  call void @llvm.dbg.declare(metadata %struct.fps_t** %fsin, metadata !287, metadata !DIExpression()), !dbg !288
  %0 = load %struct.fps_t*, %struct.fps_t** %fcos, align 8, !dbg !289
  %call2 = call %struct.fps_t* @_unary(%struct.fps_t* %0, i32 6), !dbg !289
  store %struct.fps_t* %call2, %struct.fps_t** %fsin, align 8, !dbg !288
  call void @llvm.dbg.declare(metadata %struct.fps_t** %ftan, metadata !290, metadata !DIExpression()), !dbg !291
  %1 = load %struct.fps_t*, %struct.fps_t** %fsin, align 8, !dbg !292
  %2 = load %struct.fps_t*, %struct.fps_t** %fcos, align 8, !dbg !292
  %call3 = call %struct.fps_t* @_binary(%struct.fps_t* %1, %struct.fps_t* %2, i32 4), !dbg !292
  store %struct.fps_t* %call3, %struct.fps_t** %ftan, align 8, !dbg !291
  %3 = load %struct.fps_t*, %struct.fps_t** %fcos, align 8, !dbg !293
  %4 = load %struct.fps_t*, %struct.fps_t** %one, align 8, !dbg !294
  %5 = load %struct.fps_t*, %struct.fps_t** %fsin, align 8, !dbg !295
  %call4 = call %struct.fps_t* @_unary(%struct.fps_t* %5, i32 6), !dbg !295
  call void @fps_redefine(%struct.fps_t* %3, i32 2, %struct.fps_t* %4, %struct.fps_t* %call4), !dbg !296
  call void @llvm.dbg.declare(metadata %struct.fps_t** %fexp, metadata !297, metadata !DIExpression()), !dbg !298
  %call5 = call %struct.fps_t* @fps_const(double 1.000000e+00), !dbg !299
  store %struct.fps_t* %call5, %struct.fps_t** %fexp, align 8, !dbg !298
  %6 = load %struct.fps_t*, %struct.fps_t** %fexp, align 8, !dbg !300
  %7 = load %struct.fps_t*, %struct.fps_t** %fexp, align 8, !dbg !301
  call void @fps_redefine(%struct.fps_t* %6, i32 6, %struct.fps_t* %7, %struct.fps_t* null), !dbg !302
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !303
  store i32 0, i32* %i, align 4, !dbg !304
  br label %for.cond, !dbg !306

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %i, align 4, !dbg !307
  %cmp = icmp slt i32 %8, 10, !dbg !309
  br i1 %cmp, label %for.body, label %for.end, !dbg !310

for.body:                                         ; preds = %for.cond
  %9 = load %struct.fps_t*, %struct.fps_t** %fsin, align 8, !dbg !311
  %10 = load i32, i32* %i, align 4, !dbg !312
  %call7 = call double @term(%struct.fps_t* %9, i32 %10), !dbg !313
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double %call7), !dbg !314
  br label %for.inc, !dbg !314

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !315
  %inc = add nsw i32 %11, 1, !dbg !315
  store i32 %inc, i32* %i, align 4, !dbg !315
  br label %for.cond, !dbg !316, !llvm.loop !317

for.end:                                          ; preds = %for.cond
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)), !dbg !319
  store i32 0, i32* %i, align 4, !dbg !320
  br label %for.cond10, !dbg !322

for.cond10:                                       ; preds = %for.inc15, %for.end
  %12 = load i32, i32* %i, align 4, !dbg !323
  %cmp11 = icmp slt i32 %12, 10, !dbg !325
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !326

for.body12:                                       ; preds = %for.cond10
  %13 = load %struct.fps_t*, %struct.fps_t** %fcos, align 8, !dbg !327
  %14 = load i32, i32* %i, align 4, !dbg !328
  %call13 = call double @term(%struct.fps_t* %13, i32 %14), !dbg !329
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double %call13), !dbg !330
  br label %for.inc15, !dbg !330

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !331
  %inc16 = add nsw i32 %15, 1, !dbg !331
  store i32 %inc16, i32* %i, align 4, !dbg !331
  br label %for.cond10, !dbg !332, !llvm.loop !333

for.end17:                                        ; preds = %for.cond10
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0)), !dbg !335
  store i32 0, i32* %i, align 4, !dbg !336
  br label %for.cond19, !dbg !338

for.cond19:                                       ; preds = %for.inc24, %for.end17
  %16 = load i32, i32* %i, align 4, !dbg !339
  %cmp20 = icmp slt i32 %16, 10, !dbg !341
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !342

for.body21:                                       ; preds = %for.cond19
  %17 = load %struct.fps_t*, %struct.fps_t** %ftan, align 8, !dbg !343
  %18 = load i32, i32* %i, align 4, !dbg !344
  %call22 = call double @term(%struct.fps_t* %17, i32 %18), !dbg !345
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double %call22), !dbg !346
  br label %for.inc24, !dbg !346

for.inc24:                                        ; preds = %for.body21
  %19 = load i32, i32* %i, align 4, !dbg !347
  %inc25 = add nsw i32 %19, 1, !dbg !347
  store i32 %inc25, i32* %i, align 4, !dbg !347
  br label %for.cond19, !dbg !348, !llvm.loop !349

for.end26:                                        ; preds = %for.cond19
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0)), !dbg !351
  store i32 0, i32* %i, align 4, !dbg !352
  br label %for.cond28, !dbg !354

for.cond28:                                       ; preds = %for.inc33, %for.end26
  %20 = load i32, i32* %i, align 4, !dbg !355
  %cmp29 = icmp slt i32 %20, 10, !dbg !357
  br i1 %cmp29, label %for.body30, label %for.end35, !dbg !358

for.body30:                                       ; preds = %for.cond28
  %21 = load %struct.fps_t*, %struct.fps_t** %fexp, align 8, !dbg !359
  %22 = load i32, i32* %i, align 4, !dbg !360
  %call31 = call double @term(%struct.fps_t* %21, i32 %22), !dbg !361
  %call32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double %call31), !dbg !362
  br label %for.inc33, !dbg !362

for.inc33:                                        ; preds = %for.body30
  %23 = load i32, i32* %i, align 4, !dbg !363
  %inc34 = add nsw i32 %23, 1, !dbg !363
  store i32 %inc34, i32* %i, align 4, !dbg !363
  br label %for.cond28, !dbg !364, !llvm.loop !365

for.end35:                                        ; preds = %for.cond28
  ret i32 0, !dbg !367
}

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "formal-power-series.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Formal-power-series")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "fps_type", file: !1, line: 5, baseType: !4, size: 32, elements: !5)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !7, !8, !9, !10, !11, !12}
!6 = !DIEnumerator(name: "FPS_CONST", value: 0, isUnsigned: true)
!7 = !DIEnumerator(name: "FPS_ADD", value: 1, isUnsigned: true)
!8 = !DIEnumerator(name: "FPS_SUB", value: 2, isUnsigned: true)
!9 = !DIEnumerator(name: "FPS_MUL", value: 3, isUnsigned: true)
!10 = !DIEnumerator(name: "FPS_DIV", value: 4, isUnsigned: true)
!11 = !DIEnumerator(name: "FPS_DERIV", value: 5, isUnsigned: true)
!12 = !DIEnumerator(name: "FPS_INT", value: 6, isUnsigned: true)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!17 = distinct !DISubprogram(name: "fps_new", scope: !1, file: !1, line: 22, type: !18, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "fps", file: !1, line: 15, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fps_t", file: !1, line: 16, size: 256, elements: !23)
!23 = !{!24, !26, !27, !28}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !22, file: !1, line: 17, baseType: !25, size: 32)
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "s1", scope: !22, file: !1, line: 18, baseType: !20, size: 64, offset: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "s2", scope: !22, file: !1, line: 18, baseType: !20, size: 64, offset: 128)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "a0", scope: !22, file: !1, line: 19, baseType: !29, size: 64, offset: 192)
!29 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!30 = !{}
!31 = !DILocalVariable(name: "x", scope: !17, file: !1, line: 24, type: !20)
!32 = !DILocation(line: 24, column: 13, scope: !17)
!33 = !DILocation(line: 24, column: 17, scope: !17)
!34 = !DILocation(line: 25, column: 9, scope: !17)
!35 = !DILocation(line: 25, column: 12, scope: !17)
!36 = !DILocation(line: 25, column: 15, scope: !17)
!37 = !DILocation(line: 26, column: 17, scope: !17)
!38 = !DILocation(line: 26, column: 20, scope: !17)
!39 = !DILocation(line: 26, column: 23, scope: !17)
!40 = !DILocation(line: 26, column: 9, scope: !17)
!41 = !DILocation(line: 26, column: 12, scope: !17)
!42 = !DILocation(line: 26, column: 15, scope: !17)
!43 = !DILocation(line: 27, column: 9, scope: !17)
!44 = !DILocation(line: 27, column: 12, scope: !17)
!45 = !DILocation(line: 27, column: 17, scope: !17)
!46 = !DILocation(line: 28, column: 16, scope: !17)
!47 = !DILocation(line: 28, column: 9, scope: !17)
!48 = distinct !DISubprogram(name: "fps_redefine", scope: !1, file: !1, line: 35, type: !49, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!49 = !DISubroutineType(types: !50)
!50 = !{null, !20, !25, !20, !20}
!51 = !DILocalVariable(name: "x", arg: 1, scope: !48, file: !1, line: 35, type: !20)
!52 = !DILocation(line: 35, column: 23, scope: !48)
!53 = !DILocalVariable(name: "op", arg: 2, scope: !48, file: !1, line: 35, type: !25)
!54 = !DILocation(line: 35, column: 30, scope: !48)
!55 = !DILocalVariable(name: "y", arg: 3, scope: !48, file: !1, line: 35, type: !20)
!56 = !DILocation(line: 35, column: 38, scope: !48)
!57 = !DILocalVariable(name: "z", arg: 4, scope: !48, file: !1, line: 35, type: !20)
!58 = !DILocation(line: 35, column: 45, scope: !48)
!59 = !DILocation(line: 37, column: 19, scope: !48)
!60 = !DILocation(line: 37, column: 9, scope: !48)
!61 = !DILocation(line: 37, column: 12, scope: !48)
!62 = !DILocation(line: 37, column: 17, scope: !48)
!63 = !DILocation(line: 38, column: 17, scope: !48)
!64 = !DILocation(line: 38, column: 9, scope: !48)
!65 = !DILocation(line: 38, column: 12, scope: !48)
!66 = !DILocation(line: 38, column: 15, scope: !48)
!67 = !DILocation(line: 39, column: 17, scope: !48)
!68 = !DILocation(line: 39, column: 9, scope: !48)
!69 = !DILocation(line: 39, column: 12, scope: !48)
!70 = !DILocation(line: 39, column: 15, scope: !48)
!71 = !DILocation(line: 40, column: 1, scope: !48)
!72 = distinct !DISubprogram(name: "_binary", scope: !1, file: !1, line: 42, type: !73, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!73 = !DISubroutineType(types: !74)
!74 = !{!20, !20, !20, !25}
!75 = !DILocalVariable(name: "x", arg: 1, scope: !72, file: !1, line: 42, type: !20)
!76 = !DILocation(line: 42, column: 17, scope: !72)
!77 = !DILocalVariable(name: "y", arg: 2, scope: !72, file: !1, line: 42, type: !20)
!78 = !DILocation(line: 42, column: 24, scope: !72)
!79 = !DILocalVariable(name: "op", arg: 3, scope: !72, file: !1, line: 42, type: !25)
!80 = !DILocation(line: 42, column: 31, scope: !72)
!81 = !DILocalVariable(name: "s", scope: !72, file: !1, line: 44, type: !20)
!82 = !DILocation(line: 44, column: 13, scope: !72)
!83 = !DILocation(line: 44, column: 17, scope: !72)
!84 = !DILocation(line: 45, column: 17, scope: !72)
!85 = !DILocation(line: 45, column: 9, scope: !72)
!86 = !DILocation(line: 45, column: 12, scope: !72)
!87 = !DILocation(line: 45, column: 15, scope: !72)
!88 = !DILocation(line: 46, column: 17, scope: !72)
!89 = !DILocation(line: 46, column: 9, scope: !72)
!90 = !DILocation(line: 46, column: 12, scope: !72)
!91 = !DILocation(line: 46, column: 15, scope: !72)
!92 = !DILocation(line: 47, column: 19, scope: !72)
!93 = !DILocation(line: 47, column: 9, scope: !72)
!94 = !DILocation(line: 47, column: 12, scope: !72)
!95 = !DILocation(line: 47, column: 17, scope: !72)
!96 = !DILocation(line: 48, column: 16, scope: !72)
!97 = !DILocation(line: 48, column: 9, scope: !72)
!98 = distinct !DISubprogram(name: "_unary", scope: !1, file: !1, line: 51, type: !99, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!99 = !DISubroutineType(types: !100)
!100 = !{!20, !20, !25}
!101 = !DILocalVariable(name: "x", arg: 1, scope: !98, file: !1, line: 51, type: !20)
!102 = !DILocation(line: 51, column: 16, scope: !98)
!103 = !DILocalVariable(name: "op", arg: 2, scope: !98, file: !1, line: 51, type: !25)
!104 = !DILocation(line: 51, column: 23, scope: !98)
!105 = !DILocalVariable(name: "s", scope: !98, file: !1, line: 53, type: !20)
!106 = !DILocation(line: 53, column: 13, scope: !98)
!107 = !DILocation(line: 53, column: 17, scope: !98)
!108 = !DILocation(line: 54, column: 17, scope: !98)
!109 = !DILocation(line: 54, column: 9, scope: !98)
!110 = !DILocation(line: 54, column: 12, scope: !98)
!111 = !DILocation(line: 54, column: 15, scope: !98)
!112 = !DILocation(line: 55, column: 19, scope: !98)
!113 = !DILocation(line: 55, column: 9, scope: !98)
!114 = !DILocation(line: 55, column: 12, scope: !98)
!115 = !DILocation(line: 55, column: 17, scope: !98)
!116 = !DILocation(line: 56, column: 16, scope: !98)
!117 = !DILocation(line: 56, column: 9, scope: !98)
!118 = distinct !DISubprogram(name: "term", scope: !1, file: !1, line: 60, type: !119, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!119 = !DISubroutineType(types: !120)
!120 = !{!29, !20, !25}
!121 = !DILocalVariable(name: "x", arg: 1, scope: !118, file: !1, line: 60, type: !20)
!122 = !DILocation(line: 60, column: 17, scope: !118)
!123 = !DILocalVariable(name: "n", arg: 2, scope: !118, file: !1, line: 60, type: !25)
!124 = !DILocation(line: 60, column: 24, scope: !118)
!125 = !DILocalVariable(name: "ret", scope: !118, file: !1, line: 62, type: !29)
!126 = !DILocation(line: 62, column: 16, scope: !118)
!127 = !DILocalVariable(name: "i", scope: !118, file: !1, line: 63, type: !25)
!128 = !DILocation(line: 63, column: 13, scope: !118)
!129 = !DILocation(line: 65, column: 17, scope: !118)
!130 = !DILocation(line: 65, column: 20, scope: !118)
!131 = !DILocation(line: 65, column: 9, scope: !118)
!132 = !DILocation(line: 66, column: 32, scope: !133)
!133 = distinct !DILexicalBlock(scope: !118, file: !1, line: 65, column: 26)
!134 = !DILocation(line: 66, column: 34, scope: !133)
!135 = !DILocation(line: 66, column: 44, scope: !133)
!136 = !DILocation(line: 66, column: 47, scope: !133)
!137 = !DILocation(line: 66, column: 25, scope: !133)
!138 = !DILocation(line: 68, column: 28, scope: !133)
!139 = !DILocation(line: 68, column: 31, scope: !133)
!140 = !DILocation(line: 68, column: 35, scope: !133)
!141 = !DILocation(line: 68, column: 23, scope: !133)
!142 = !DILocation(line: 68, column: 45, scope: !133)
!143 = !DILocation(line: 68, column: 48, scope: !133)
!144 = !DILocation(line: 68, column: 52, scope: !133)
!145 = !DILocation(line: 68, column: 40, scope: !133)
!146 = !DILocation(line: 68, column: 38, scope: !133)
!147 = !DILocation(line: 68, column: 21, scope: !133)
!148 = !DILocation(line: 68, column: 56, scope: !133)
!149 = !DILocation(line: 71, column: 28, scope: !133)
!150 = !DILocation(line: 71, column: 31, scope: !133)
!151 = !DILocation(line: 71, column: 35, scope: !133)
!152 = !DILocation(line: 71, column: 23, scope: !133)
!153 = !DILocation(line: 71, column: 45, scope: !133)
!154 = !DILocation(line: 71, column: 48, scope: !133)
!155 = !DILocation(line: 71, column: 52, scope: !133)
!156 = !DILocation(line: 71, column: 40, scope: !133)
!157 = !DILocation(line: 71, column: 38, scope: !133)
!158 = !DILocation(line: 71, column: 21, scope: !133)
!159 = !DILocation(line: 71, column: 56, scope: !133)
!160 = !DILocation(line: 74, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !133, file: !1, line: 74, column: 17)
!162 = !DILocation(line: 74, column: 22, scope: !161)
!163 = !DILocation(line: 74, column: 29, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !1, line: 74, column: 17)
!165 = !DILocation(line: 74, column: 34, scope: !164)
!166 = !DILocation(line: 74, column: 31, scope: !164)
!167 = !DILocation(line: 74, column: 17, scope: !161)
!168 = !DILocation(line: 75, column: 37, scope: !164)
!169 = !DILocation(line: 75, column: 40, scope: !164)
!170 = !DILocation(line: 75, column: 44, scope: !164)
!171 = !DILocation(line: 75, column: 32, scope: !164)
!172 = !DILocation(line: 75, column: 54, scope: !164)
!173 = !DILocation(line: 75, column: 57, scope: !164)
!174 = !DILocation(line: 75, column: 61, scope: !164)
!175 = !DILocation(line: 75, column: 65, scope: !164)
!176 = !DILocation(line: 75, column: 63, scope: !164)
!177 = !DILocation(line: 75, column: 49, scope: !164)
!178 = !DILocation(line: 75, column: 47, scope: !164)
!179 = !DILocation(line: 75, column: 29, scope: !164)
!180 = !DILocation(line: 75, column: 25, scope: !164)
!181 = !DILocation(line: 74, column: 38, scope: !164)
!182 = !DILocation(line: 74, column: 17, scope: !164)
!183 = distinct !{!183, !167, !184}
!184 = !DILocation(line: 75, column: 66, scope: !161)
!185 = !DILocation(line: 76, column: 17, scope: !133)
!186 = !DILocation(line: 79, column: 28, scope: !187)
!187 = distinct !DILexicalBlock(scope: !133, file: !1, line: 79, column: 21)
!188 = !DILocation(line: 79, column: 31, scope: !187)
!189 = !DILocation(line: 79, column: 23, scope: !187)
!190 = !DILocation(line: 79, column: 21, scope: !133)
!191 = !{!"if"}
!192 = !DILocation(line: 79, column: 39, scope: !187)
!193 = !DILocation(line: 81, column: 28, scope: !133)
!194 = !DILocation(line: 81, column: 31, scope: !133)
!195 = !DILocation(line: 81, column: 35, scope: !133)
!196 = !DILocation(line: 81, column: 23, scope: !133)
!197 = !DILocation(line: 81, column: 21, scope: !133)
!198 = !DILocation(line: 82, column: 24, scope: !199)
!199 = distinct !DILexicalBlock(scope: !133, file: !1, line: 82, column: 17)
!200 = !DILocation(line: 82, column: 22, scope: !199)
!201 = !DILocation(line: 82, column: 29, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !1, line: 82, column: 17)
!203 = !DILocation(line: 82, column: 34, scope: !202)
!204 = !DILocation(line: 82, column: 31, scope: !202)
!205 = !DILocation(line: 82, column: 17, scope: !199)
!206 = !DILocation(line: 83, column: 37, scope: !202)
!207 = !DILocation(line: 83, column: 40, scope: !202)
!208 = !DILocation(line: 83, column: 44, scope: !202)
!209 = !DILocation(line: 83, column: 32, scope: !202)
!210 = !DILocation(line: 83, column: 54, scope: !202)
!211 = !DILocation(line: 83, column: 57, scope: !202)
!212 = !DILocation(line: 83, column: 61, scope: !202)
!213 = !DILocation(line: 83, column: 59, scope: !202)
!214 = !DILocation(line: 83, column: 49, scope: !202)
!215 = !DILocation(line: 83, column: 47, scope: !202)
!216 = !DILocation(line: 83, column: 71, scope: !202)
!217 = !DILocation(line: 83, column: 74, scope: !202)
!218 = !DILocation(line: 83, column: 66, scope: !202)
!219 = !DILocation(line: 83, column: 64, scope: !202)
!220 = !DILocation(line: 83, column: 29, scope: !202)
!221 = !DILocation(line: 83, column: 25, scope: !202)
!222 = !DILocation(line: 82, column: 38, scope: !202)
!223 = !DILocation(line: 82, column: 17, scope: !202)
!224 = distinct !{!224, !205, !225}
!225 = !DILocation(line: 83, column: 79, scope: !199)
!226 = !DILocation(line: 84, column: 17, scope: !133)
!227 = !DILocation(line: 87, column: 23, scope: !133)
!228 = !DILocation(line: 87, column: 32, scope: !133)
!229 = !DILocation(line: 87, column: 35, scope: !133)
!230 = !DILocation(line: 87, column: 39, scope: !133)
!231 = !DILocation(line: 87, column: 41, scope: !133)
!232 = !DILocation(line: 87, column: 27, scope: !133)
!233 = !DILocation(line: 87, column: 25, scope: !133)
!234 = !DILocation(line: 87, column: 21, scope: !133)
!235 = !DILocation(line: 88, column: 17, scope: !133)
!236 = !DILocation(line: 91, column: 22, scope: !237)
!237 = distinct !DILexicalBlock(scope: !133, file: !1, line: 91, column: 21)
!238 = !DILocation(line: 91, column: 21, scope: !133)
!239 = !DILocation(line: 91, column: 32, scope: !237)
!240 = !DILocation(line: 91, column: 35, scope: !237)
!241 = !DILocation(line: 91, column: 25, scope: !237)
!242 = !DILocation(line: 92, column: 28, scope: !133)
!243 = !DILocation(line: 92, column: 31, scope: !133)
!244 = !DILocation(line: 92, column: 35, scope: !133)
!245 = !DILocation(line: 92, column: 37, scope: !133)
!246 = !DILocation(line: 92, column: 23, scope: !133)
!247 = !DILocation(line: 92, column: 44, scope: !133)
!248 = !DILocation(line: 92, column: 42, scope: !133)
!249 = !DILocation(line: 92, column: 21, scope: !133)
!250 = !DILocation(line: 93, column: 17, scope: !133)
!251 = !DILocation(line: 96, column: 25, scope: !133)
!252 = !DILocation(line: 96, column: 58, scope: !133)
!253 = !DILocation(line: 96, column: 61, scope: !133)
!254 = !DILocation(line: 96, column: 17, scope: !133)
!255 = !DILocation(line: 97, column: 17, scope: !133)
!256 = !DILocation(line: 100, column: 16, scope: !118)
!257 = !DILocation(line: 100, column: 9, scope: !118)
!258 = !DILocation(line: 101, column: 1, scope: !118)
!259 = distinct !DISubprogram(name: "fps_const", scope: !1, file: !1, line: 110, type: !260, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!260 = !DISubroutineType(types: !261)
!261 = !{!20, !29}
!262 = !DILocalVariable(name: "a0", arg: 1, scope: !259, file: !1, line: 110, type: !29)
!263 = !DILocation(line: 110, column: 22, scope: !259)
!264 = !DILocalVariable(name: "x", scope: !259, file: !1, line: 112, type: !20)
!265 = !DILocation(line: 112, column: 13, scope: !259)
!266 = !DILocation(line: 112, column: 17, scope: !259)
!267 = !DILocation(line: 113, column: 9, scope: !259)
!268 = !DILocation(line: 113, column: 12, scope: !259)
!269 = !DILocation(line: 113, column: 17, scope: !259)
!270 = !DILocation(line: 114, column: 17, scope: !259)
!271 = !DILocation(line: 114, column: 9, scope: !259)
!272 = !DILocation(line: 114, column: 12, scope: !259)
!273 = !DILocation(line: 114, column: 15, scope: !259)
!274 = !DILocation(line: 115, column: 16, scope: !259)
!275 = !DILocation(line: 115, column: 9, scope: !259)
!276 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 118, type: !277, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !30)
!277 = !DISubroutineType(types: !278)
!278 = !{!25}
!279 = !DILocalVariable(name: "i", scope: !276, file: !1, line: 120, type: !25)
!280 = !DILocation(line: 120, column: 13, scope: !276)
!281 = !DILocalVariable(name: "one", scope: !276, file: !1, line: 121, type: !20)
!282 = !DILocation(line: 121, column: 13, scope: !276)
!283 = !DILocation(line: 121, column: 19, scope: !276)
!284 = !DILocalVariable(name: "fcos", scope: !276, file: !1, line: 122, type: !20)
!285 = !DILocation(line: 122, column: 13, scope: !276)
!286 = !DILocation(line: 122, column: 20, scope: !276)
!287 = !DILocalVariable(name: "fsin", scope: !276, file: !1, line: 123, type: !20)
!288 = !DILocation(line: 123, column: 13, scope: !276)
!289 = !DILocation(line: 123, column: 20, scope: !276)
!290 = !DILocalVariable(name: "ftan", scope: !276, file: !1, line: 124, type: !20)
!291 = !DILocation(line: 124, column: 13, scope: !276)
!292 = !DILocation(line: 124, column: 20, scope: !276)
!293 = !DILocation(line: 130, column: 22, scope: !276)
!294 = !DILocation(line: 130, column: 37, scope: !276)
!295 = !DILocation(line: 130, column: 42, scope: !276)
!296 = !DILocation(line: 130, column: 9, scope: !276)
!297 = !DILocalVariable(name: "fexp", scope: !276, file: !1, line: 132, type: !20)
!298 = !DILocation(line: 132, column: 13, scope: !276)
!299 = !DILocation(line: 132, column: 20, scope: !276)
!300 = !DILocation(line: 134, column: 22, scope: !276)
!301 = !DILocation(line: 134, column: 37, scope: !276)
!302 = !DILocation(line: 134, column: 9, scope: !276)
!303 = !DILocation(line: 136, column: 9, scope: !276)
!304 = !DILocation(line: 136, column: 34, scope: !305)
!305 = distinct !DILexicalBlock(scope: !276, file: !1, line: 136, column: 27)
!306 = !DILocation(line: 136, column: 32, scope: !305)
!307 = !DILocation(line: 136, column: 39, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !1, line: 136, column: 27)
!309 = !DILocation(line: 136, column: 41, scope: !308)
!310 = !DILocation(line: 136, column: 27, scope: !305)
!311 = !DILocation(line: 136, column: 71, scope: !308)
!312 = !DILocation(line: 136, column: 77, scope: !308)
!313 = !DILocation(line: 136, column: 66, scope: !308)
!314 = !DILocation(line: 136, column: 52, scope: !308)
!315 = !DILocation(line: 136, column: 48, scope: !308)
!316 = !DILocation(line: 136, column: 27, scope: !308)
!317 = distinct !{!317, !310, !318}
!318 = !DILocation(line: 136, column: 79, scope: !305)
!319 = !DILocation(line: 137, column: 9, scope: !276)
!320 = !DILocation(line: 137, column: 34, scope: !321)
!321 = distinct !DILexicalBlock(scope: !276, file: !1, line: 137, column: 27)
!322 = !DILocation(line: 137, column: 32, scope: !321)
!323 = !DILocation(line: 137, column: 39, scope: !324)
!324 = distinct !DILexicalBlock(scope: !321, file: !1, line: 137, column: 27)
!325 = !DILocation(line: 137, column: 41, scope: !324)
!326 = !DILocation(line: 137, column: 27, scope: !321)
!327 = !DILocation(line: 137, column: 71, scope: !324)
!328 = !DILocation(line: 137, column: 77, scope: !324)
!329 = !DILocation(line: 137, column: 66, scope: !324)
!330 = !DILocation(line: 137, column: 52, scope: !324)
!331 = !DILocation(line: 137, column: 48, scope: !324)
!332 = !DILocation(line: 137, column: 27, scope: !324)
!333 = distinct !{!333, !326, !334}
!334 = !DILocation(line: 137, column: 79, scope: !321)
!335 = !DILocation(line: 138, column: 9, scope: !276)
!336 = !DILocation(line: 138, column: 34, scope: !337)
!337 = distinct !DILexicalBlock(scope: !276, file: !1, line: 138, column: 27)
!338 = !DILocation(line: 138, column: 32, scope: !337)
!339 = !DILocation(line: 138, column: 39, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !1, line: 138, column: 27)
!341 = !DILocation(line: 138, column: 41, scope: !340)
!342 = !DILocation(line: 138, column: 27, scope: !337)
!343 = !DILocation(line: 138, column: 71, scope: !340)
!344 = !DILocation(line: 138, column: 77, scope: !340)
!345 = !DILocation(line: 138, column: 66, scope: !340)
!346 = !DILocation(line: 138, column: 52, scope: !340)
!347 = !DILocation(line: 138, column: 48, scope: !340)
!348 = !DILocation(line: 138, column: 27, scope: !340)
!349 = distinct !{!349, !342, !350}
!350 = !DILocation(line: 138, column: 79, scope: !337)
!351 = !DILocation(line: 139, column: 9, scope: !276)
!352 = !DILocation(line: 139, column: 34, scope: !353)
!353 = distinct !DILexicalBlock(scope: !276, file: !1, line: 139, column: 27)
!354 = !DILocation(line: 139, column: 32, scope: !353)
!355 = !DILocation(line: 139, column: 39, scope: !356)
!356 = distinct !DILexicalBlock(scope: !353, file: !1, line: 139, column: 27)
!357 = !DILocation(line: 139, column: 41, scope: !356)
!358 = !DILocation(line: 139, column: 27, scope: !353)
!359 = !DILocation(line: 139, column: 71, scope: !356)
!360 = !DILocation(line: 139, column: 77, scope: !356)
!361 = !DILocation(line: 139, column: 66, scope: !356)
!362 = !DILocation(line: 139, column: 52, scope: !356)
!363 = !DILocation(line: 139, column: 48, scope: !356)
!364 = !DILocation(line: 139, column: 27, scope: !356)
!365 = distinct !{!365, !358, !366}
!366 = !DILocation(line: 139, column: 79, scope: !353)
!367 = !DILocation(line: 141, column: 9, scope: !276)
