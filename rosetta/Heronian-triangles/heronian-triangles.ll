; ModuleID = 'heronian-triangles.c'
source_filename = "heronian-triangles.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.elem = type { %struct.triangle, %struct.elem* }
%struct.triangle = type { i32, i32, i32, i32, double }

@.str = private unnamed_addr constant [27 x i8] c"\0ADimensions\09Perimeter\09Area\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"\0A%d x %d x %d\09%d\09\09%d\00", align 1
@.str.2 = private unnamed_addr constant [78 x i8] c"Usage : %s <Max side, max triangles to print and area, -1 for area to ignore>\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Triangles found : %d\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"\0APrinting first %s triangles.\00", align 1
@.str.5 = private unnamed_addr constant [47 x i8] c"\0APrinting triangles with area %s square units.\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @addAndOrderList(%struct.elem** %a, %struct.triangle* byval(%struct.triangle) align 8 %t) #0 !dbg !27 {
entry:
  %a.addr = alloca %struct.elem**, align 8
  %iter = alloca %struct.elem*, align 8
  %temp = alloca %struct.elem*, align 8
  %flag = alloca i32, align 4
  store %struct.elem** %a, %struct.elem*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.elem*** %a.addr, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata %struct.triangle* %t, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata %struct.elem** %iter, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata %struct.elem** %temp, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 0, i32* %flag, align 4, !dbg !40
  %0 = load %struct.elem**, %struct.elem*** %a.addr, align 8, !dbg !41
  %1 = load %struct.elem*, %struct.elem** %0, align 8, !dbg !43
  %cmp = icmp eq %struct.elem* %1, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.else, !dbg !45, !cf.info !46

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 32) #6, !dbg !47
  %2 = bitcast i8* %call to %struct.elem*, !dbg !49
  %3 = load %struct.elem**, %struct.elem*** %a.addr, align 8, !dbg !50
  store %struct.elem* %2, %struct.elem** %3, align 8, !dbg !51
  %4 = load %struct.elem**, %struct.elem*** %a.addr, align 8, !dbg !52
  %5 = load %struct.elem*, %struct.elem** %4, align 8, !dbg !53
  %t1 = getelementptr inbounds %struct.elem, %struct.elem* %5, i32 0, i32 0, !dbg !54
  %6 = bitcast %struct.triangle* %t1 to i8*, !dbg !55
  %7 = bitcast %struct.triangle* %t to i8*, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 8 %7, i64 24, i1 false), !dbg !55
  %8 = load %struct.elem**, %struct.elem*** %a.addr, align 8, !dbg !56
  %9 = load %struct.elem*, %struct.elem** %8, align 8, !dbg !57
  %next = getelementptr inbounds %struct.elem, %struct.elem* %9, i32 0, i32 1, !dbg !58
  store %struct.elem* null, %struct.elem** %next, align 8, !dbg !59
  br label %if.end63, !dbg !60

if.else:                                          ; preds = %entry
  %call2 = call noalias i8* @malloc(i64 32) #6, !dbg !61
  %10 = bitcast i8* %call2 to %struct.elem*, !dbg !63
  store %struct.elem* %10, %struct.elem** %temp, align 8, !dbg !64
  %11 = load %struct.elem**, %struct.elem*** %a.addr, align 8, !dbg !65
  %12 = load %struct.elem*, %struct.elem** %11, align 8, !dbg !66
  store %struct.elem* %12, %struct.elem** %iter, align 8, !dbg !67
  br label %while.cond, !dbg !68

while.cond:                                       ; preds = %if.end, %if.else
  %13 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !69
  %next3 = getelementptr inbounds %struct.elem, %struct.elem* %13, i32 0, i32 1, !dbg !70
  %14 = load %struct.elem*, %struct.elem** %next3, align 8, !dbg !70
  %cmp4 = icmp ne %struct.elem* %14, null, !dbg !71
  br i1 %cmp4, label %while.body, label %while.end, !dbg !68

while.body:                                       ; preds = %while.cond
  %15 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !72
  %t5 = getelementptr inbounds %struct.elem, %struct.elem* %15, i32 0, i32 0, !dbg !75
  %area = getelementptr inbounds %struct.triangle, %struct.triangle* %t5, i32 0, i32 4, !dbg !76
  %16 = load double, double* %area, align 8, !dbg !76
  %area6 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 4, !dbg !77
  %17 = load double, double* %area6, align 8, !dbg !77
  %cmp7 = fcmp olt double %16, %17, !dbg !78
  br i1 %cmp7, label %land.lhs.true30, label %lor.lhs.false, !dbg !79, !cf.info !46

lor.lhs.false:                                    ; preds = %while.body
  %18 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !80
  %t8 = getelementptr inbounds %struct.elem, %struct.elem* %18, i32 0, i32 0, !dbg !81
  %area9 = getelementptr inbounds %struct.triangle, %struct.triangle* %t8, i32 0, i32 4, !dbg !82
  %19 = load double, double* %area9, align 8, !dbg !82
  %area10 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 4, !dbg !83
  %20 = load double, double* %area10, align 8, !dbg !83
  %cmp11 = fcmp oeq double %19, %20, !dbg !84
  br i1 %cmp11, label %land.lhs.true, label %lor.lhs.false15, !dbg !85, !cf.info !46

land.lhs.true:                                    ; preds = %lor.lhs.false
  %21 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !86
  %t12 = getelementptr inbounds %struct.elem, %struct.elem* %21, i32 0, i32 0, !dbg !87
  %perimeter = getelementptr inbounds %struct.triangle, %struct.triangle* %t12, i32 0, i32 3, !dbg !88
  %22 = load i32, i32* %perimeter, align 4, !dbg !88
  %perimeter13 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 3, !dbg !89
  %23 = load i32, i32* %perimeter13, align 4, !dbg !89
  %cmp14 = icmp slt i32 %22, %23, !dbg !90
  br i1 %cmp14, label %land.lhs.true30, label %lor.lhs.false15, !dbg !91, !cf.info !46

lor.lhs.false15:                                  ; preds = %land.lhs.true, %lor.lhs.false
  %24 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !92
  %t16 = getelementptr inbounds %struct.elem, %struct.elem* %24, i32 0, i32 0, !dbg !93
  %area17 = getelementptr inbounds %struct.triangle, %struct.triangle* %t16, i32 0, i32 4, !dbg !94
  %25 = load double, double* %area17, align 8, !dbg !94
  %area18 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 4, !dbg !95
  %26 = load double, double* %area18, align 8, !dbg !95
  %cmp19 = fcmp oeq double %25, %26, !dbg !96
  br i1 %cmp19, label %land.lhs.true20, label %if.end, !dbg !97, !cf.info !46

land.lhs.true20:                                  ; preds = %lor.lhs.false15
  %27 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !98
  %t21 = getelementptr inbounds %struct.elem, %struct.elem* %27, i32 0, i32 0, !dbg !99
  %perimeter22 = getelementptr inbounds %struct.triangle, %struct.triangle* %t21, i32 0, i32 3, !dbg !100
  %28 = load i32, i32* %perimeter22, align 4, !dbg !100
  %perimeter23 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 3, !dbg !101
  %29 = load i32, i32* %perimeter23, align 4, !dbg !101
  %cmp24 = icmp eq i32 %28, %29, !dbg !102
  br i1 %cmp24, label %land.lhs.true25, label %if.end, !dbg !103, !cf.info !46

land.lhs.true25:                                  ; preds = %land.lhs.true20
  %30 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !104
  %t26 = getelementptr inbounds %struct.elem, %struct.elem* %30, i32 0, i32 0, !dbg !105
  %a27 = getelementptr inbounds %struct.triangle, %struct.triangle* %t26, i32 0, i32 0, !dbg !106
  %31 = load i32, i32* %a27, align 8, !dbg !106
  %a28 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 0, !dbg !107
  %32 = load i32, i32* %a28, align 8, !dbg !107
  %cmp29 = icmp sle i32 %31, %32, !dbg !108
  br i1 %cmp29, label %land.lhs.true30, label %if.end, !dbg !109, !cf.info !46

land.lhs.true30:                                  ; preds = %land.lhs.true25, %land.lhs.true, %while.body
  %33 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !110
  %next31 = getelementptr inbounds %struct.elem, %struct.elem* %33, i32 0, i32 1, !dbg !111
  %34 = load %struct.elem*, %struct.elem** %next31, align 8, !dbg !111
  %cmp32 = icmp eq %struct.elem* %34, null, !dbg !112
  br i1 %cmp32, label %if.then51, label %lor.lhs.false33, !dbg !113, !cf.info !46

lor.lhs.false33:                                  ; preds = %land.lhs.true30
  %area34 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 4, !dbg !114
  %35 = load double, double* %area34, align 8, !dbg !114
  %36 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !115
  %next35 = getelementptr inbounds %struct.elem, %struct.elem* %36, i32 0, i32 1, !dbg !116
  %37 = load %struct.elem*, %struct.elem** %next35, align 8, !dbg !116
  %t36 = getelementptr inbounds %struct.elem, %struct.elem* %37, i32 0, i32 0, !dbg !117
  %area37 = getelementptr inbounds %struct.triangle, %struct.triangle* %t36, i32 0, i32 4, !dbg !118
  %38 = load double, double* %area37, align 8, !dbg !118
  %cmp38 = fcmp olt double %35, %38, !dbg !119
  br i1 %cmp38, label %if.then51, label %lor.lhs.false39, !dbg !120, !cf.info !46

lor.lhs.false39:                                  ; preds = %lor.lhs.false33
  %perimeter40 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 3, !dbg !121
  %39 = load i32, i32* %perimeter40, align 4, !dbg !121
  %40 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !122
  %next41 = getelementptr inbounds %struct.elem, %struct.elem* %40, i32 0, i32 1, !dbg !123
  %41 = load %struct.elem*, %struct.elem** %next41, align 8, !dbg !123
  %t42 = getelementptr inbounds %struct.elem, %struct.elem* %41, i32 0, i32 0, !dbg !124
  %perimeter43 = getelementptr inbounds %struct.triangle, %struct.triangle* %t42, i32 0, i32 3, !dbg !125
  %42 = load i32, i32* %perimeter43, align 4, !dbg !125
  %cmp44 = icmp slt i32 %39, %42, !dbg !126
  br i1 %cmp44, label %if.then51, label %lor.lhs.false45, !dbg !127, !cf.info !46

lor.lhs.false45:                                  ; preds = %lor.lhs.false39
  %a46 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 0, !dbg !128
  %43 = load i32, i32* %a46, align 8, !dbg !128
  %44 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !129
  %next47 = getelementptr inbounds %struct.elem, %struct.elem* %44, i32 0, i32 1, !dbg !130
  %45 = load %struct.elem*, %struct.elem** %next47, align 8, !dbg !130
  %t48 = getelementptr inbounds %struct.elem, %struct.elem* %45, i32 0, i32 0, !dbg !131
  %a49 = getelementptr inbounds %struct.triangle, %struct.triangle* %t48, i32 0, i32 0, !dbg !132
  %46 = load i32, i32* %a49, align 8, !dbg !132
  %cmp50 = icmp slt i32 %43, %46, !dbg !133
  br i1 %cmp50, label %if.then51, label %if.end, !dbg !134, !cf.info !46

if.then51:                                        ; preds = %lor.lhs.false45, %lor.lhs.false39, %lor.lhs.false33, %land.lhs.true30
  %47 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !135
  %t52 = getelementptr inbounds %struct.elem, %struct.elem* %47, i32 0, i32 0, !dbg !137
  %48 = bitcast %struct.triangle* %t52 to i8*, !dbg !138
  %49 = bitcast %struct.triangle* %t to i8*, !dbg !138
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %48, i8* align 8 %49, i64 24, i1 false), !dbg !138
  %50 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !139
  %next53 = getelementptr inbounds %struct.elem, %struct.elem* %50, i32 0, i32 1, !dbg !140
  %51 = load %struct.elem*, %struct.elem** %next53, align 8, !dbg !140
  %52 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !141
  %next54 = getelementptr inbounds %struct.elem, %struct.elem* %52, i32 0, i32 1, !dbg !142
  store %struct.elem* %51, %struct.elem** %next54, align 8, !dbg !143
  %53 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !144
  %54 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !145
  %next55 = getelementptr inbounds %struct.elem, %struct.elem* %54, i32 0, i32 1, !dbg !146
  store %struct.elem* %53, %struct.elem** %next55, align 8, !dbg !147
  store i32 1, i32* %flag, align 4, !dbg !148
  br label %while.end, !dbg !149

if.end:                                           ; preds = %lor.lhs.false45, %land.lhs.true25, %land.lhs.true20, %lor.lhs.false15
  %55 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !150
  %next56 = getelementptr inbounds %struct.elem, %struct.elem* %55, i32 0, i32 1, !dbg !151
  %56 = load %struct.elem*, %struct.elem** %next56, align 8, !dbg !151
  store %struct.elem* %56, %struct.elem** %iter, align 8, !dbg !152
  br label %while.cond, !dbg !68, !llvm.loop !153

while.end:                                        ; preds = %if.then51, %while.cond
  %57 = load i32, i32* %flag, align 4, !dbg !155
  %cmp57 = icmp ne i32 %57, 1, !dbg !157
  br i1 %cmp57, label %if.then58, label %if.end62, !dbg !158, !cf.info !46

if.then58:                                        ; preds = %while.end
  %58 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !159
  %t59 = getelementptr inbounds %struct.elem, %struct.elem* %58, i32 0, i32 0, !dbg !161
  %59 = bitcast %struct.triangle* %t59 to i8*, !dbg !162
  %60 = bitcast %struct.triangle* %t to i8*, !dbg !162
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %59, i8* align 8 %60, i64 24, i1 false), !dbg !162
  %61 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !163
  %next60 = getelementptr inbounds %struct.elem, %struct.elem* %61, i32 0, i32 1, !dbg !164
  store %struct.elem* null, %struct.elem** %next60, align 8, !dbg !165
  %62 = load %struct.elem*, %struct.elem** %temp, align 8, !dbg !166
  %63 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !167
  %next61 = getelementptr inbounds %struct.elem, %struct.elem* %63, i32 0, i32 1, !dbg !168
  store %struct.elem* %62, %struct.elem** %next61, align 8, !dbg !169
  br label %if.end62, !dbg !170

if.end62:                                         ; preds = %if.then58, %while.end
  br label %if.end63

if.end63:                                         ; preds = %if.end62, %if.then
  ret void, !dbg !171
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gcd(i32 %a, i32 %b) #0 !dbg !172 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !175, metadata !DIExpression()), !dbg !176
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !177, metadata !DIExpression()), !dbg !178
  %0 = load i32, i32* %b.addr, align 4, !dbg !179
  %cmp = icmp ne i32 %0, 0, !dbg !181
  br i1 %cmp, label %if.then, label %if.end, !dbg !182, !cf.info !46

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %b.addr, align 4, !dbg !183
  %2 = load i32, i32* %a.addr, align 4, !dbg !184
  %3 = load i32, i32* %b.addr, align 4, !dbg !185
  %rem = srem i32 %2, %3, !dbg !186
  %call = call i32 @gcd(i32 %1, i32 %rem), !dbg !187
  store i32 %call, i32* %retval, align 4, !dbg !188
  br label %return, !dbg !188

if.end:                                           ; preds = %entry
  %4 = load i32, i32* %a.addr, align 4, !dbg !189
  store i32 %4, i32* %retval, align 4, !dbg !190
  br label %return, !dbg !190

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !191
  ret i32 %5, !dbg !191
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @calculateArea(%struct.triangle* %t) #0 !dbg !192 {
entry:
  %t.addr = alloca %struct.triangle*, align 8
  store %struct.triangle* %t, %struct.triangle** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.triangle** %t.addr, metadata !196, metadata !DIExpression()), !dbg !197
  %0 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !198
  %a = getelementptr inbounds %struct.triangle, %struct.triangle* %0, i32 0, i32 0, !dbg !199
  %1 = load i32, i32* %a, align 8, !dbg !199
  %2 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !200
  %b = getelementptr inbounds %struct.triangle, %struct.triangle* %2, i32 0, i32 1, !dbg !201
  %3 = load i32, i32* %b, align 4, !dbg !201
  %add = add nsw i32 %1, %3, !dbg !202
  %4 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !203
  %c = getelementptr inbounds %struct.triangle, %struct.triangle* %4, i32 0, i32 2, !dbg !204
  %5 = load i32, i32* %c, align 8, !dbg !204
  %add1 = add nsw i32 %add, %5, !dbg !205
  %6 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !206
  %perimeter = getelementptr inbounds %struct.triangle, %struct.triangle* %6, i32 0, i32 3, !dbg !207
  store i32 %add1, i32* %perimeter, align 4, !dbg !208
  %7 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !209
  %perimeter2 = getelementptr inbounds %struct.triangle, %struct.triangle* %7, i32 0, i32 3, !dbg !210
  %8 = load i32, i32* %perimeter2, align 4, !dbg !210
  %conv = sitofp i32 %8 to double, !dbg !211
  %mul = fmul double 5.000000e-01, %conv, !dbg !212
  %9 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !213
  %perimeter3 = getelementptr inbounds %struct.triangle, %struct.triangle* %9, i32 0, i32 3, !dbg !214
  %10 = load i32, i32* %perimeter3, align 4, !dbg !214
  %conv4 = sitofp i32 %10 to double, !dbg !215
  %mul5 = fmul double 5.000000e-01, %conv4, !dbg !216
  %11 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !217
  %a6 = getelementptr inbounds %struct.triangle, %struct.triangle* %11, i32 0, i32 0, !dbg !218
  %12 = load i32, i32* %a6, align 8, !dbg !218
  %conv7 = sitofp i32 %12 to double, !dbg !219
  %sub = fsub double %mul5, %conv7, !dbg !220
  %mul8 = fmul double %mul, %sub, !dbg !221
  %13 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !222
  %perimeter9 = getelementptr inbounds %struct.triangle, %struct.triangle* %13, i32 0, i32 3, !dbg !223
  %14 = load i32, i32* %perimeter9, align 4, !dbg !223
  %conv10 = sitofp i32 %14 to double, !dbg !224
  %mul11 = fmul double 5.000000e-01, %conv10, !dbg !225
  %15 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !226
  %b12 = getelementptr inbounds %struct.triangle, %struct.triangle* %15, i32 0, i32 1, !dbg !227
  %16 = load i32, i32* %b12, align 4, !dbg !227
  %conv13 = sitofp i32 %16 to double, !dbg !228
  %sub14 = fsub double %mul11, %conv13, !dbg !229
  %mul15 = fmul double %mul8, %sub14, !dbg !230
  %17 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !231
  %perimeter16 = getelementptr inbounds %struct.triangle, %struct.triangle* %17, i32 0, i32 3, !dbg !232
  %18 = load i32, i32* %perimeter16, align 4, !dbg !232
  %conv17 = sitofp i32 %18 to double, !dbg !233
  %mul18 = fmul double 5.000000e-01, %conv17, !dbg !234
  %19 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !235
  %c19 = getelementptr inbounds %struct.triangle, %struct.triangle* %19, i32 0, i32 2, !dbg !236
  %20 = load i32, i32* %c19, align 8, !dbg !236
  %conv20 = sitofp i32 %20 to double, !dbg !237
  %sub21 = fsub double %mul18, %conv20, !dbg !238
  %mul22 = fmul double %mul15, %sub21, !dbg !239
  %call = call double @sqrt(double %mul22) #6, !dbg !240
  %21 = load %struct.triangle*, %struct.triangle** %t.addr, align 8, !dbg !241
  %area = getelementptr inbounds %struct.triangle, %struct.triangle* %21, i32 0, i32 4, !dbg !242
  store double %call, double* %area, align 8, !dbg !243
  ret void, !dbg !244
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.elem* @generateTriangleList(i32 %maxSide, i32* %count) #0 !dbg !245 {
entry:
  %maxSide.addr = alloca i32, align 4
  %count.addr = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %t = alloca %struct.triangle, align 8
  %herons = alloca %struct.elem*, align 8
  %.compoundliteral = alloca %struct.triangle, align 8
  store i32 %maxSide, i32* %maxSide.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %maxSide.addr, metadata !249, metadata !DIExpression()), !dbg !250
  store i32* %count, i32** %count.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %count.addr, metadata !251, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata i32* %a, metadata !253, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata i32* %b, metadata !255, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.declare(metadata i32* %c, metadata !257, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.declare(metadata %struct.triangle* %t, metadata !259, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.declare(metadata %struct.elem** %herons, metadata !261, metadata !DIExpression()), !dbg !262
  store %struct.elem* null, %struct.elem** %herons, align 8, !dbg !262
  %0 = load i32*, i32** %count.addr, align 8, !dbg !263
  store i32 0, i32* %0, align 4, !dbg !264
  store i32 1, i32* %a, align 4, !dbg !265
  br label %for.cond, !dbg !267

for.cond:                                         ; preds = %for.inc24, %entry
  %1 = load i32, i32* %a, align 4, !dbg !268
  %2 = load i32, i32* %maxSide.addr, align 4, !dbg !270
  %cmp = icmp sle i32 %1, %2, !dbg !271
  br i1 %cmp, label %for.body, label %for.end26, !dbg !272

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %b, align 4, !dbg !273
  br label %for.cond1, !dbg !276

for.cond1:                                        ; preds = %for.inc21, %for.body
  %3 = load i32, i32* %b, align 4, !dbg !277
  %4 = load i32, i32* %a, align 4, !dbg !279
  %cmp2 = icmp sle i32 %3, %4, !dbg !280
  br i1 %cmp2, label %for.body3, label %for.end23, !dbg !281

for.body3:                                        ; preds = %for.cond1
  store i32 1, i32* %c, align 4, !dbg !282
  br label %for.cond4, !dbg !285

for.cond4:                                        ; preds = %for.inc, %for.body3
  %5 = load i32, i32* %c, align 4, !dbg !286
  %6 = load i32, i32* %b, align 4, !dbg !288
  %cmp5 = icmp sle i32 %5, %6, !dbg !289
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !290

for.body6:                                        ; preds = %for.cond4
  %7 = load i32, i32* %c, align 4, !dbg !291
  %8 = load i32, i32* %b, align 4, !dbg !294
  %add = add nsw i32 %7, %8, !dbg !295
  %9 = load i32, i32* %a, align 4, !dbg !296
  %cmp7 = icmp sgt i32 %add, %9, !dbg !297
  br i1 %cmp7, label %land.lhs.true, label %if.end19, !dbg !298, !cf.info !46

land.lhs.true:                                    ; preds = %for.body6
  %10 = load i32, i32* %a, align 4, !dbg !299
  %11 = load i32, i32* %b, align 4, !dbg !300
  %call = call i32 @gcd(i32 %10, i32 %11), !dbg !301
  %12 = load i32, i32* %c, align 4, !dbg !302
  %call8 = call i32 @gcd(i32 %call, i32 %12), !dbg !303
  %cmp9 = icmp eq i32 %call8, 1, !dbg !304
  br i1 %cmp9, label %if.then, label %if.end19, !dbg !305, !cf.info !46

if.then:                                          ; preds = %land.lhs.true
  %a10 = getelementptr inbounds %struct.triangle, %struct.triangle* %.compoundliteral, i32 0, i32 0, !dbg !306
  %13 = load i32, i32* %a, align 4, !dbg !308
  store i32 %13, i32* %a10, align 8, !dbg !306
  %b11 = getelementptr inbounds %struct.triangle, %struct.triangle* %.compoundliteral, i32 0, i32 1, !dbg !306
  %14 = load i32, i32* %b, align 4, !dbg !309
  store i32 %14, i32* %b11, align 4, !dbg !306
  %c12 = getelementptr inbounds %struct.triangle, %struct.triangle* %.compoundliteral, i32 0, i32 2, !dbg !306
  %15 = load i32, i32* %c, align 4, !dbg !310
  store i32 %15, i32* %c12, align 8, !dbg !306
  %perimeter = getelementptr inbounds %struct.triangle, %struct.triangle* %.compoundliteral, i32 0, i32 3, !dbg !306
  store i32 0, i32* %perimeter, align 4, !dbg !306
  %area = getelementptr inbounds %struct.triangle, %struct.triangle* %.compoundliteral, i32 0, i32 4, !dbg !306
  store double 0.000000e+00, double* %area, align 8, !dbg !306
  %16 = bitcast %struct.triangle* %t to i8*, !dbg !311
  %17 = bitcast %struct.triangle* %.compoundliteral to i8*, !dbg !311
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %16, i8* align 8 %17, i64 24, i1 false), !dbg !311
  call void @calculateArea(%struct.triangle* %t), !dbg !312
  %area13 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 4, !dbg !313
  %18 = load double, double* %area13, align 8, !dbg !313
  %area14 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 4, !dbg !315
  %19 = load double, double* %area14, align 8, !dbg !315
  %conv = fptosi double %19 to i32, !dbg !316
  %conv15 = sitofp i32 %conv to double, !dbg !316
  %div = fdiv double %18, %conv15, !dbg !317
  %cmp16 = fcmp oeq double %div, 1.000000e+00, !dbg !318
  br i1 %cmp16, label %if.then18, label %if.end, !dbg !319, !cf.info !46

if.then18:                                        ; preds = %if.then
  call void @addAndOrderList(%struct.elem** %herons, %struct.triangle* byval(%struct.triangle) align 8 %t), !dbg !320
  %20 = load i32*, i32** %count.addr, align 8, !dbg !322
  %21 = load i32, i32* %20, align 4, !dbg !323
  %inc = add nsw i32 %21, 1, !dbg !323
  store i32 %inc, i32* %20, align 4, !dbg !323
  br label %if.end, !dbg !324

if.end:                                           ; preds = %if.then18, %if.then
  br label %if.end19, !dbg !325

if.end19:                                         ; preds = %if.end, %land.lhs.true, %for.body6
  br label %for.inc, !dbg !326

for.inc:                                          ; preds = %if.end19
  %22 = load i32, i32* %c, align 4, !dbg !327
  %inc20 = add nsw i32 %22, 1, !dbg !327
  store i32 %inc20, i32* %c, align 4, !dbg !327
  br label %for.cond4, !dbg !328, !llvm.loop !329

for.end:                                          ; preds = %for.cond4
  br label %for.inc21, !dbg !331

for.inc21:                                        ; preds = %for.end
  %23 = load i32, i32* %b, align 4, !dbg !332
  %inc22 = add nsw i32 %23, 1, !dbg !332
  store i32 %inc22, i32* %b, align 4, !dbg !332
  br label %for.cond1, !dbg !333, !llvm.loop !334

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24, !dbg !336

for.inc24:                                        ; preds = %for.end23
  %24 = load i32, i32* %a, align 4, !dbg !337
  %inc25 = add nsw i32 %24, 1, !dbg !337
  store i32 %inc25, i32* %a, align 4, !dbg !337
  br label %for.cond, !dbg !338, !llvm.loop !339

for.end26:                                        ; preds = %for.cond
  %25 = load %struct.elem*, %struct.elem** %herons, align 8, !dbg !341
  ret %struct.elem* %25, !dbg !342
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printList(%struct.elem* %a, i32 %limit, i32 %area) #0 !dbg !343 {
entry:
  %a.addr = alloca %struct.elem*, align 8
  %limit.addr = alloca i32, align 4
  %area.addr = alloca i32, align 4
  %iter = alloca %struct.elem*, align 8
  %count = alloca i32, align 4
  store %struct.elem* %a, %struct.elem** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.elem** %a.addr, metadata !346, metadata !DIExpression()), !dbg !347
  store i32 %limit, i32* %limit.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %limit.addr, metadata !348, metadata !DIExpression()), !dbg !349
  store i32 %area, i32* %area.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %area.addr, metadata !350, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.declare(metadata %struct.elem** %iter, metadata !352, metadata !DIExpression()), !dbg !353
  %0 = load %struct.elem*, %struct.elem** %a.addr, align 8, !dbg !354
  store %struct.elem* %0, %struct.elem** %iter, align 8, !dbg !353
  call void @llvm.dbg.declare(metadata i32* %count, metadata !355, metadata !DIExpression()), !dbg !356
  store i32 1, i32* %count, align 4, !dbg !356
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0)), !dbg !357
  br label %while.cond, !dbg !358

while.cond:                                       ; preds = %if.end, %entry
  %1 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !359
  %cmp = icmp ne %struct.elem* %1, null, !dbg !360
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !361

land.rhs:                                         ; preds = %while.cond
  %2 = load i32, i32* %count, align 4, !dbg !362
  %3 = load i32, i32* %limit.addr, align 4, !dbg !363
  %add = add nsw i32 %3, 1, !dbg !364
  %cmp1 = icmp ne i32 %2, %add, !dbg !365
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %cmp1, %land.rhs ], !dbg !366
  br i1 %4, label %while.body, label %while.end, !dbg !358

while.body:                                       ; preds = %land.end
  %5 = load i32, i32* %area.addr, align 4, !dbg !367
  %cmp2 = icmp eq i32 %5, -1, !dbg !370
  br i1 %cmp2, label %if.then, label %lor.lhs.false, !dbg !371, !cf.info !46

lor.lhs.false:                                    ; preds = %while.body
  %6 = load i32, i32* %area.addr, align 4, !dbg !372
  %conv = sitofp i32 %6 to double, !dbg !372
  %7 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !373
  %t = getelementptr inbounds %struct.elem, %struct.elem* %7, i32 0, i32 0, !dbg !374
  %area3 = getelementptr inbounds %struct.triangle, %struct.triangle* %t, i32 0, i32 4, !dbg !375
  %8 = load double, double* %area3, align 8, !dbg !375
  %cmp4 = fcmp oeq double %conv, %8, !dbg !376
  br i1 %cmp4, label %if.then, label %if.end, !dbg !377, !cf.info !46

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %9 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !378
  %t6 = getelementptr inbounds %struct.elem, %struct.elem* %9, i32 0, i32 0, !dbg !380
  %a7 = getelementptr inbounds %struct.triangle, %struct.triangle* %t6, i32 0, i32 0, !dbg !381
  %10 = load i32, i32* %a7, align 8, !dbg !381
  %11 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !382
  %t8 = getelementptr inbounds %struct.elem, %struct.elem* %11, i32 0, i32 0, !dbg !383
  %b = getelementptr inbounds %struct.triangle, %struct.triangle* %t8, i32 0, i32 1, !dbg !384
  %12 = load i32, i32* %b, align 4, !dbg !384
  %13 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !385
  %t9 = getelementptr inbounds %struct.elem, %struct.elem* %13, i32 0, i32 0, !dbg !386
  %c = getelementptr inbounds %struct.triangle, %struct.triangle* %t9, i32 0, i32 2, !dbg !387
  %14 = load i32, i32* %c, align 8, !dbg !387
  %15 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !388
  %t10 = getelementptr inbounds %struct.elem, %struct.elem* %15, i32 0, i32 0, !dbg !389
  %perimeter = getelementptr inbounds %struct.triangle, %struct.triangle* %t10, i32 0, i32 3, !dbg !390
  %16 = load i32, i32* %perimeter, align 4, !dbg !390
  %17 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !391
  %t11 = getelementptr inbounds %struct.elem, %struct.elem* %17, i32 0, i32 0, !dbg !392
  %area12 = getelementptr inbounds %struct.triangle, %struct.triangle* %t11, i32 0, i32 4, !dbg !393
  %18 = load double, double* %area12, align 8, !dbg !393
  %conv13 = fptosi double %18 to i32, !dbg !394
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), i32 %10, i32 %12, i32 %14, i32 %16, i32 %conv13), !dbg !395
  %19 = load i32, i32* %count, align 4, !dbg !396
  %inc = add nsw i32 %19, 1, !dbg !396
  store i32 %inc, i32* %count, align 4, !dbg !396
  br label %if.end, !dbg !397

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %20 = load %struct.elem*, %struct.elem** %iter, align 8, !dbg !398
  %next = getelementptr inbounds %struct.elem, %struct.elem* %20, i32 0, i32 1, !dbg !399
  %21 = load %struct.elem*, %struct.elem** %next, align 8, !dbg !399
  store %struct.elem* %21, %struct.elem** %iter, align 8, !dbg !400
  br label %while.cond, !dbg !358, !llvm.loop !401

while.end:                                        ; preds = %land.end
  ret void, !dbg !403
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argC, i8** %argV) #0 !dbg !404 {
entry:
  %retval = alloca i32, align 4
  %argC.addr = alloca i32, align 4
  %argV.addr = alloca i8**, align 8
  %count = alloca i32, align 4
  %herons = alloca %struct.elem*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argC, i32* %argC.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argC.addr, metadata !410, metadata !DIExpression()), !dbg !411
  store i8** %argV, i8*** %argV.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argV.addr, metadata !412, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.declare(metadata i32* %count, metadata !414, metadata !DIExpression()), !dbg !415
  call void @llvm.dbg.declare(metadata %struct.elem** %herons, metadata !416, metadata !DIExpression()), !dbg !417
  store %struct.elem* null, %struct.elem** %herons, align 8, !dbg !417
  %0 = load i32, i32* %argC.addr, align 4, !dbg !418
  %cmp = icmp ne i32 %0, 4, !dbg !420
  br i1 %cmp, label %if.then, label %if.else, !dbg !421, !cf.info !46

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argV.addr, align 8, !dbg !422
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !422
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !422
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.2, i64 0, i64 0), i8* %2), !dbg !423
  br label %if.end, !dbg !423

if.else:                                          ; preds = %entry
  %3 = load i8**, i8*** %argV.addr, align 8, !dbg !424
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !424
  %4 = load i8*, i8** %arrayidx1, align 8, !dbg !424
  %call2 = call i32 @atoi(i8* %4) #7, !dbg !426
  %call3 = call %struct.elem* @generateTriangleList(i32 %call2, i32* %count), !dbg !427
  store %struct.elem* %call3, %struct.elem** %herons, align 8, !dbg !428
  %5 = load i32, i32* %count, align 4, !dbg !429
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i64 0, i64 0), i32 %5), !dbg !430
  %6 = load i8**, i8*** %argV.addr, align 8, !dbg !431
  %arrayidx5 = getelementptr inbounds i8*, i8** %6, i64 3, !dbg !431
  %7 = load i8*, i8** %arrayidx5, align 8, !dbg !431
  %call6 = call i32 @atoi(i8* %7) #7, !dbg !432
  %cmp7 = icmp eq i32 %call6, -1, !dbg !433
  br i1 %cmp7, label %cond.true, label %cond.false, !dbg !434

cond.true:                                        ; preds = %if.else
  %8 = load i8**, i8*** %argV.addr, align 8, !dbg !435
  %arrayidx8 = getelementptr inbounds i8*, i8** %8, i64 2, !dbg !435
  %9 = load i8*, i8** %arrayidx8, align 8, !dbg !435
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i64 0, i64 0), i8* %9), !dbg !436
  br label %cond.end, !dbg !434

cond.false:                                       ; preds = %if.else
  %10 = load i8**, i8*** %argV.addr, align 8, !dbg !437
  %arrayidx10 = getelementptr inbounds i8*, i8** %10, i64 3, !dbg !437
  %11 = load i8*, i8** %arrayidx10, align 8, !dbg !437
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.5, i64 0, i64 0), i8* %11), !dbg !438
  br label %cond.end, !dbg !434

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call9, %cond.true ], [ %call11, %cond.false ], !dbg !434
  %12 = load %struct.elem*, %struct.elem** %herons, align 8, !dbg !439
  %13 = load i8**, i8*** %argV.addr, align 8, !dbg !440
  %arrayidx12 = getelementptr inbounds i8*, i8** %13, i64 2, !dbg !440
  %14 = load i8*, i8** %arrayidx12, align 8, !dbg !440
  %call13 = call i32 @atoi(i8* %14) #7, !dbg !441
  %15 = load i8**, i8*** %argV.addr, align 8, !dbg !442
  %arrayidx14 = getelementptr inbounds i8*, i8** %15, i64 3, !dbg !442
  %16 = load i8*, i8** %arrayidx14, align 8, !dbg !442
  %call15 = call i32 @atoi(i8* %16) #7, !dbg !443
  call void @printList(%struct.elem* %12, i32 %call13, i32 %call15), !dbg !444
  %17 = load %struct.elem*, %struct.elem** %herons, align 8, !dbg !445
  %18 = bitcast %struct.elem* %17 to i8*, !dbg !445
  call void @free(i8* %18) #6, !dbg !446
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then
  ret i32 0, !dbg !447
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24, !25}
!llvm.ident = !{!26}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "heronian-triangles.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Heronian-triangles")
!2 = !{}
!3 = !{!4, !5, !15}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "list", file: !1, line: 16, baseType: !6)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "cell", file: !1, line: 14, baseType: !8)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "elem", file: !1, line: 11, size: 256, elements: !9)
!9 = !{!10, !21}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "t", scope: !8, file: !1, line: 12, baseType: !11, size: 192)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "triangle", file: !1, line: 9, baseType: !12)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 5, size: 192, elements: !13)
!13 = !{!14, !16, !17, !18, !19}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !12, file: !1, line: 6, baseType: !15, size: 32)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !12, file: !1, line: 6, baseType: !15, size: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !12, file: !1, line: 6, baseType: !15, size: 32, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "perimeter", scope: !12, file: !1, line: 7, baseType: !15, size: 32, offset: 96)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "area", scope: !12, file: !1, line: 8, baseType: !20, size: 64, offset: 128)
!20 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !8, file: !1, line: 13, baseType: !22, size: 64, offset: 192)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!23 = !{i32 7, !"Dwarf Version", i32 4}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!27 = distinct !DISubprogram(name: "addAndOrderList", scope: !1, file: !1, line: 18, type: !28, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !30, !11}
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!31 = !DILocalVariable(name: "a", arg: 1, scope: !27, file: !1, line: 18, type: !30)
!32 = !DILocation(line: 18, column: 28, scope: !27)
!33 = !DILocalVariable(name: "t", arg: 2, scope: !27, file: !1, line: 18, type: !11)
!34 = !DILocation(line: 18, column: 39, scope: !27)
!35 = !DILocalVariable(name: "iter", scope: !27, file: !1, line: 19, type: !5)
!36 = !DILocation(line: 19, column: 7, scope: !27)
!37 = !DILocalVariable(name: "temp", scope: !27, file: !1, line: 19, type: !5)
!38 = !DILocation(line: 19, column: 12, scope: !27)
!39 = !DILocalVariable(name: "flag", scope: !27, file: !1, line: 20, type: !15)
!40 = !DILocation(line: 20, column: 6, scope: !27)
!41 = !DILocation(line: 22, column: 6, scope: !42)
!42 = distinct !DILexicalBlock(scope: !27, file: !1, line: 22, column: 5)
!43 = !DILocation(line: 22, column: 5, scope: !42)
!44 = !DILocation(line: 22, column: 7, scope: !42)
!45 = !DILocation(line: 22, column: 5, scope: !27)
!46 = !{!"if"}
!47 = !DILocation(line: 23, column: 14, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !1, line: 22, column: 14)
!49 = !DILocation(line: 23, column: 8, scope: !48)
!50 = !DILocation(line: 23, column: 4, scope: !48)
!51 = !DILocation(line: 23, column: 6, scope: !48)
!52 = !DILocation(line: 24, column: 5, scope: !48)
!53 = !DILocation(line: 24, column: 4, scope: !48)
!54 = !DILocation(line: 24, column: 9, scope: !48)
!55 = !DILocation(line: 24, column: 13, scope: !48)
!56 = !DILocation(line: 25, column: 5, scope: !48)
!57 = !DILocation(line: 25, column: 4, scope: !48)
!58 = !DILocation(line: 25, column: 9, scope: !48)
!59 = !DILocation(line: 25, column: 14, scope: !48)
!60 = !DILocation(line: 26, column: 2, scope: !48)
!61 = !DILocation(line: 29, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !42, file: !1, line: 28, column: 6)
!63 = !DILocation(line: 29, column: 10, scope: !62)
!64 = !DILocation(line: 29, column: 8, scope: !62)
!65 = !DILocation(line: 31, column: 12, scope: !62)
!66 = !DILocation(line: 31, column: 11, scope: !62)
!67 = !DILocation(line: 31, column: 9, scope: !62)
!68 = !DILocation(line: 32, column: 4, scope: !62)
!69 = !DILocation(line: 32, column: 10, scope: !62)
!70 = !DILocation(line: 32, column: 16, scope: !62)
!71 = !DILocation(line: 32, column: 20, scope: !62)
!72 = !DILocation(line: 33, column: 10, scope: !73)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 33, column: 8)
!74 = distinct !DILexicalBlock(scope: !62, file: !1, line: 32, column: 27)
!75 = !DILocation(line: 33, column: 16, scope: !73)
!76 = !DILocation(line: 33, column: 18, scope: !73)
!77 = !DILocation(line: 33, column: 25, scope: !73)
!78 = !DILocation(line: 33, column: 22, scope: !73)
!79 = !DILocation(line: 33, column: 30, scope: !73)
!80 = !DILocation(line: 33, column: 33, scope: !73)
!81 = !DILocation(line: 33, column: 39, scope: !73)
!82 = !DILocation(line: 33, column: 41, scope: !73)
!83 = !DILocation(line: 33, column: 49, scope: !73)
!84 = !DILocation(line: 33, column: 45, scope: !73)
!85 = !DILocation(line: 33, column: 54, scope: !73)
!86 = !DILocation(line: 33, column: 57, scope: !73)
!87 = !DILocation(line: 33, column: 63, scope: !73)
!88 = !DILocation(line: 33, column: 65, scope: !73)
!89 = !DILocation(line: 33, column: 77, scope: !73)
!90 = !DILocation(line: 33, column: 74, scope: !73)
!91 = !DILocation(line: 33, column: 87, scope: !73)
!92 = !DILocation(line: 33, column: 90, scope: !73)
!93 = !DILocation(line: 33, column: 96, scope: !73)
!94 = !DILocation(line: 33, column: 98, scope: !73)
!95 = !DILocation(line: 33, column: 106, scope: !73)
!96 = !DILocation(line: 33, column: 102, scope: !73)
!97 = !DILocation(line: 33, column: 111, scope: !73)
!98 = !DILocation(line: 33, column: 114, scope: !73)
!99 = !DILocation(line: 33, column: 120, scope: !73)
!100 = !DILocation(line: 33, column: 122, scope: !73)
!101 = !DILocation(line: 33, column: 135, scope: !73)
!102 = !DILocation(line: 33, column: 131, scope: !73)
!103 = !DILocation(line: 33, column: 145, scope: !73)
!104 = !DILocation(line: 33, column: 148, scope: !73)
!105 = !DILocation(line: 33, column: 154, scope: !73)
!106 = !DILocation(line: 33, column: 156, scope: !73)
!107 = !DILocation(line: 33, column: 161, scope: !73)
!108 = !DILocation(line: 33, column: 157, scope: !73)
!109 = !DILocation(line: 34, column: 5, scope: !73)
!110 = !DILocation(line: 35, column: 6, scope: !73)
!111 = !DILocation(line: 35, column: 12, scope: !73)
!112 = !DILocation(line: 35, column: 16, scope: !73)
!113 = !DILocation(line: 35, column: 22, scope: !73)
!114 = !DILocation(line: 35, column: 27, scope: !73)
!115 = !DILocation(line: 35, column: 32, scope: !73)
!116 = !DILocation(line: 35, column: 38, scope: !73)
!117 = !DILocation(line: 35, column: 44, scope: !73)
!118 = !DILocation(line: 35, column: 46, scope: !73)
!119 = !DILocation(line: 35, column: 31, scope: !73)
!120 = !DILocation(line: 35, column: 51, scope: !73)
!121 = !DILocation(line: 35, column: 56, scope: !73)
!122 = !DILocation(line: 35, column: 66, scope: !73)
!123 = !DILocation(line: 35, column: 72, scope: !73)
!124 = !DILocation(line: 35, column: 78, scope: !73)
!125 = !DILocation(line: 35, column: 80, scope: !73)
!126 = !DILocation(line: 35, column: 65, scope: !73)
!127 = !DILocation(line: 35, column: 90, scope: !73)
!128 = !DILocation(line: 35, column: 95, scope: !73)
!129 = !DILocation(line: 35, column: 97, scope: !73)
!130 = !DILocation(line: 35, column: 103, scope: !73)
!131 = !DILocation(line: 35, column: 109, scope: !73)
!132 = !DILocation(line: 35, column: 111, scope: !73)
!133 = !DILocation(line: 35, column: 96, scope: !73)
!134 = !DILocation(line: 33, column: 8, scope: !74)
!135 = !DILocation(line: 36, column: 6, scope: !136)
!136 = distinct !DILexicalBlock(scope: !73, file: !1, line: 35, column: 115)
!137 = !DILocation(line: 36, column: 12, scope: !136)
!138 = !DILocation(line: 36, column: 16, scope: !136)
!139 = !DILocation(line: 37, column: 19, scope: !136)
!140 = !DILocation(line: 37, column: 25, scope: !136)
!141 = !DILocation(line: 37, column: 6, scope: !136)
!142 = !DILocation(line: 37, column: 12, scope: !136)
!143 = !DILocation(line: 37, column: 17, scope: !136)
!144 = !DILocation(line: 38, column: 19, scope: !136)
!145 = !DILocation(line: 38, column: 6, scope: !136)
!146 = !DILocation(line: 38, column: 12, scope: !136)
!147 = !DILocation(line: 38, column: 17, scope: !136)
!148 = !DILocation(line: 39, column: 11, scope: !136)
!149 = !DILocation(line: 40, column: 6, scope: !136)
!150 = !DILocation(line: 43, column: 12, scope: !74)
!151 = !DILocation(line: 43, column: 18, scope: !74)
!152 = !DILocation(line: 43, column: 10, scope: !74)
!153 = distinct !{!153, !68, !154}
!154 = !DILocation(line: 44, column: 4, scope: !62)
!155 = !DILocation(line: 46, column: 7, scope: !156)
!156 = distinct !DILexicalBlock(scope: !62, file: !1, line: 46, column: 7)
!157 = !DILocation(line: 46, column: 11, scope: !156)
!158 = !DILocation(line: 46, column: 7, scope: !62)
!159 = !DILocation(line: 47, column: 5, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !1, line: 46, column: 15)
!161 = !DILocation(line: 47, column: 11, scope: !160)
!162 = !DILocation(line: 47, column: 15, scope: !160)
!163 = !DILocation(line: 48, column: 5, scope: !160)
!164 = !DILocation(line: 48, column: 11, scope: !160)
!165 = !DILocation(line: 48, column: 16, scope: !160)
!166 = !DILocation(line: 49, column: 18, scope: !160)
!167 = !DILocation(line: 49, column: 5, scope: !160)
!168 = !DILocation(line: 49, column: 11, scope: !160)
!169 = !DILocation(line: 49, column: 16, scope: !160)
!170 = !DILocation(line: 50, column: 4, scope: !160)
!171 = !DILocation(line: 52, column: 1, scope: !27)
!172 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 54, type: !173, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!173 = !DISubroutineType(types: !174)
!174 = !{!15, !15, !15}
!175 = !DILocalVariable(name: "a", arg: 1, scope: !172, file: !1, line: 54, type: !15)
!176 = !DILocation(line: 54, column: 13, scope: !172)
!177 = !DILocalVariable(name: "b", arg: 2, scope: !172, file: !1, line: 54, type: !15)
!178 = !DILocation(line: 54, column: 19, scope: !172)
!179 = !DILocation(line: 55, column: 5, scope: !180)
!180 = distinct !DILexicalBlock(scope: !172, file: !1, line: 55, column: 5)
!181 = !DILocation(line: 55, column: 6, scope: !180)
!182 = !DILocation(line: 55, column: 5, scope: !172)
!183 = !DILocation(line: 56, column: 14, scope: !180)
!184 = !DILocation(line: 56, column: 16, scope: !180)
!185 = !DILocation(line: 56, column: 18, scope: !180)
!186 = !DILocation(line: 56, column: 17, scope: !180)
!187 = !DILocation(line: 56, column: 10, scope: !180)
!188 = !DILocation(line: 56, column: 3, scope: !180)
!189 = !DILocation(line: 57, column: 9, scope: !172)
!190 = !DILocation(line: 57, column: 2, scope: !172)
!191 = !DILocation(line: 58, column: 1, scope: !172)
!192 = distinct !DISubprogram(name: "calculateArea", scope: !1, file: !1, line: 60, type: !193, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!193 = !DISubroutineType(types: !194)
!194 = !{null, !195}
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!196 = !DILocalVariable(name: "t", arg: 1, scope: !192, file: !1, line: 60, type: !195)
!197 = !DILocation(line: 60, column: 30, scope: !192)
!198 = !DILocation(line: 61, column: 21, scope: !192)
!199 = !DILocation(line: 61, column: 24, scope: !192)
!200 = !DILocation(line: 61, column: 30, scope: !192)
!201 = !DILocation(line: 61, column: 33, scope: !192)
!202 = !DILocation(line: 61, column: 26, scope: !192)
!203 = !DILocation(line: 61, column: 39, scope: !192)
!204 = !DILocation(line: 61, column: 42, scope: !192)
!205 = !DILocation(line: 61, column: 35, scope: !192)
!206 = !DILocation(line: 61, column: 4, scope: !192)
!207 = !DILocation(line: 61, column: 7, scope: !192)
!208 = !DILocation(line: 61, column: 17, scope: !192)
!209 = !DILocation(line: 62, column: 25, scope: !192)
!210 = !DILocation(line: 62, column: 28, scope: !192)
!211 = !DILocation(line: 62, column: 23, scope: !192)
!212 = !DILocation(line: 62, column: 22, scope: !192)
!213 = !DILocation(line: 62, column: 45, scope: !192)
!214 = !DILocation(line: 62, column: 48, scope: !192)
!215 = !DILocation(line: 62, column: 43, scope: !192)
!216 = !DILocation(line: 62, column: 42, scope: !192)
!217 = !DILocation(line: 62, column: 62, scope: !192)
!218 = !DILocation(line: 62, column: 65, scope: !192)
!219 = !DILocation(line: 62, column: 60, scope: !192)
!220 = !DILocation(line: 62, column: 58, scope: !192)
!221 = !DILocation(line: 62, column: 37, scope: !192)
!222 = !DILocation(line: 62, column: 75, scope: !192)
!223 = !DILocation(line: 62, column: 78, scope: !192)
!224 = !DILocation(line: 62, column: 73, scope: !192)
!225 = !DILocation(line: 62, column: 72, scope: !192)
!226 = !DILocation(line: 62, column: 92, scope: !192)
!227 = !DILocation(line: 62, column: 95, scope: !192)
!228 = !DILocation(line: 62, column: 90, scope: !192)
!229 = !DILocation(line: 62, column: 88, scope: !192)
!230 = !DILocation(line: 62, column: 67, scope: !192)
!231 = !DILocation(line: 62, column: 105, scope: !192)
!232 = !DILocation(line: 62, column: 108, scope: !192)
!233 = !DILocation(line: 62, column: 103, scope: !192)
!234 = !DILocation(line: 62, column: 102, scope: !192)
!235 = !DILocation(line: 62, column: 122, scope: !192)
!236 = !DILocation(line: 62, column: 125, scope: !192)
!237 = !DILocation(line: 62, column: 120, scope: !192)
!238 = !DILocation(line: 62, column: 118, scope: !192)
!239 = !DILocation(line: 62, column: 97, scope: !192)
!240 = !DILocation(line: 62, column: 14, scope: !192)
!241 = !DILocation(line: 62, column: 4, scope: !192)
!242 = !DILocation(line: 62, column: 7, scope: !192)
!243 = !DILocation(line: 62, column: 12, scope: !192)
!244 = !DILocation(line: 63, column: 1, scope: !192)
!245 = distinct !DISubprogram(name: "generateTriangleList", scope: !1, file: !1, line: 65, type: !246, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!246 = !DISubroutineType(types: !247)
!247 = !{!5, !15, !248}
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!249 = !DILocalVariable(name: "maxSide", arg: 1, scope: !245, file: !1, line: 65, type: !15)
!250 = !DILocation(line: 65, column: 31, scope: !245)
!251 = !DILocalVariable(name: "count", arg: 2, scope: !245, file: !1, line: 65, type: !248)
!252 = !DILocation(line: 65, column: 44, scope: !245)
!253 = !DILocalVariable(name: "a", scope: !245, file: !1, line: 66, type: !15)
!254 = !DILocation(line: 66, column: 6, scope: !245)
!255 = !DILocalVariable(name: "b", scope: !245, file: !1, line: 66, type: !15)
!256 = !DILocation(line: 66, column: 8, scope: !245)
!257 = !DILocalVariable(name: "c", scope: !245, file: !1, line: 66, type: !15)
!258 = !DILocation(line: 66, column: 10, scope: !245)
!259 = !DILocalVariable(name: "t", scope: !245, file: !1, line: 67, type: !11)
!260 = !DILocation(line: 67, column: 11, scope: !245)
!261 = !DILocalVariable(name: "herons", scope: !245, file: !1, line: 68, type: !5)
!262 = !DILocation(line: 68, column: 7, scope: !245)
!263 = !DILocation(line: 70, column: 3, scope: !245)
!264 = !DILocation(line: 70, column: 9, scope: !245)
!265 = !DILocation(line: 72, column: 7, scope: !266)
!266 = distinct !DILexicalBlock(scope: !245, file: !1, line: 72, column: 2)
!267 = !DILocation(line: 72, column: 6, scope: !266)
!268 = !DILocation(line: 72, column: 10, scope: !269)
!269 = distinct !DILexicalBlock(scope: !266, file: !1, line: 72, column: 2)
!270 = !DILocation(line: 72, column: 13, scope: !269)
!271 = !DILocation(line: 72, column: 11, scope: !269)
!272 = !DILocation(line: 72, column: 2, scope: !266)
!273 = !DILocation(line: 73, column: 8, scope: !274)
!274 = distinct !DILexicalBlock(scope: !275, file: !1, line: 73, column: 3)
!275 = distinct !DILexicalBlock(scope: !269, file: !1, line: 72, column: 25)
!276 = !DILocation(line: 73, column: 7, scope: !274)
!277 = !DILocation(line: 73, column: 11, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !1, line: 73, column: 3)
!279 = !DILocation(line: 73, column: 14, scope: !278)
!280 = !DILocation(line: 73, column: 12, scope: !278)
!281 = !DILocation(line: 73, column: 3, scope: !274)
!282 = !DILocation(line: 74, column: 9, scope: !283)
!283 = distinct !DILexicalBlock(scope: !284, file: !1, line: 74, column: 4)
!284 = distinct !DILexicalBlock(scope: !278, file: !1, line: 73, column: 20)
!285 = !DILocation(line: 74, column: 8, scope: !283)
!286 = !DILocation(line: 74, column: 12, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !1, line: 74, column: 4)
!288 = !DILocation(line: 74, column: 15, scope: !287)
!289 = !DILocation(line: 74, column: 13, scope: !287)
!290 = !DILocation(line: 74, column: 4, scope: !283)
!291 = !DILocation(line: 75, column: 8, scope: !292)
!292 = distinct !DILexicalBlock(scope: !293, file: !1, line: 75, column: 8)
!293 = distinct !DILexicalBlock(scope: !287, file: !1, line: 74, column: 21)
!294 = !DILocation(line: 75, column: 10, scope: !292)
!295 = !DILocation(line: 75, column: 9, scope: !292)
!296 = !DILocation(line: 75, column: 14, scope: !292)
!297 = !DILocation(line: 75, column: 12, scope: !292)
!298 = !DILocation(line: 75, column: 16, scope: !292)
!299 = !DILocation(line: 75, column: 27, scope: !292)
!300 = !DILocation(line: 75, column: 29, scope: !292)
!301 = !DILocation(line: 75, column: 23, scope: !292)
!302 = !DILocation(line: 75, column: 32, scope: !292)
!303 = !DILocation(line: 75, column: 19, scope: !292)
!304 = !DILocation(line: 75, column: 34, scope: !292)
!305 = !DILocation(line: 75, column: 8, scope: !293)
!306 = !DILocation(line: 76, column: 20, scope: !307)
!307 = distinct !DILexicalBlock(scope: !292, file: !1, line: 75, column: 38)
!308 = !DILocation(line: 76, column: 21, scope: !307)
!309 = !DILocation(line: 76, column: 23, scope: !307)
!310 = !DILocation(line: 76, column: 25, scope: !307)
!311 = !DILocation(line: 76, column: 10, scope: !307)
!312 = !DILocation(line: 77, column: 6, scope: !307)
!313 = !DILocation(line: 78, column: 11, scope: !314)
!314 = distinct !DILexicalBlock(scope: !307, file: !1, line: 78, column: 9)
!315 = !DILocation(line: 78, column: 23, scope: !314)
!316 = !DILocation(line: 78, column: 16, scope: !314)
!317 = !DILocation(line: 78, column: 15, scope: !314)
!318 = !DILocation(line: 78, column: 28, scope: !314)
!319 = !DILocation(line: 78, column: 9, scope: !307)
!320 = !DILocation(line: 79, column: 7, scope: !321)
!321 = distinct !DILexicalBlock(scope: !314, file: !1, line: 78, column: 33)
!322 = !DILocation(line: 80, column: 9, scope: !321)
!323 = !DILocation(line: 80, column: 15, scope: !321)
!324 = !DILocation(line: 81, column: 6, scope: !321)
!325 = !DILocation(line: 82, column: 5, scope: !307)
!326 = !DILocation(line: 83, column: 4, scope: !293)
!327 = !DILocation(line: 74, column: 18, scope: !287)
!328 = !DILocation(line: 74, column: 4, scope: !287)
!329 = distinct !{!329, !290, !330}
!330 = !DILocation(line: 83, column: 4, scope: !283)
!331 = !DILocation(line: 84, column: 3, scope: !284)
!332 = !DILocation(line: 73, column: 17, scope: !278)
!333 = !DILocation(line: 73, column: 3, scope: !278)
!334 = distinct !{!334, !281, !335}
!335 = !DILocation(line: 84, column: 3, scope: !274)
!336 = !DILocation(line: 85, column: 2, scope: !275)
!337 = !DILocation(line: 72, column: 22, scope: !269)
!338 = !DILocation(line: 72, column: 2, scope: !269)
!339 = distinct !{!339, !272, !340}
!340 = !DILocation(line: 85, column: 2, scope: !266)
!341 = !DILocation(line: 87, column: 9, scope: !245)
!342 = !DILocation(line: 87, column: 2, scope: !245)
!343 = distinct !DISubprogram(name: "printList", scope: !1, file: !1, line: 90, type: !344, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!344 = !DISubroutineType(types: !345)
!345 = !{null, !5, !15, !15}
!346 = !DILocalVariable(name: "a", arg: 1, scope: !343, file: !1, line: 90, type: !5)
!347 = !DILocation(line: 90, column: 21, scope: !343)
!348 = !DILocalVariable(name: "limit", arg: 2, scope: !343, file: !1, line: 90, type: !15)
!349 = !DILocation(line: 90, column: 27, scope: !343)
!350 = !DILocalVariable(name: "area", arg: 3, scope: !343, file: !1, line: 90, type: !15)
!351 = !DILocation(line: 90, column: 37, scope: !343)
!352 = !DILocalVariable(name: "iter", scope: !343, file: !1, line: 91, type: !5)
!353 = !DILocation(line: 91, column: 7, scope: !343)
!354 = !DILocation(line: 91, column: 14, scope: !343)
!355 = !DILocalVariable(name: "count", scope: !343, file: !1, line: 92, type: !15)
!356 = !DILocation(line: 92, column: 6, scope: !343)
!357 = !DILocation(line: 94, column: 2, scope: !343)
!358 = !DILocation(line: 96, column: 2, scope: !343)
!359 = !DILocation(line: 96, column: 8, scope: !343)
!360 = !DILocation(line: 96, column: 12, scope: !343)
!361 = !DILocation(line: 96, column: 19, scope: !343)
!362 = !DILocation(line: 96, column: 22, scope: !343)
!363 = !DILocation(line: 96, column: 29, scope: !343)
!364 = !DILocation(line: 96, column: 34, scope: !343)
!365 = !DILocation(line: 96, column: 27, scope: !343)
!366 = !DILocation(line: 0, scope: !343)
!367 = !DILocation(line: 97, column: 6, scope: !368)
!368 = distinct !DILexicalBlock(scope: !369, file: !1, line: 97, column: 6)
!369 = distinct !DILexicalBlock(scope: !343, file: !1, line: 96, column: 37)
!370 = !DILocation(line: 97, column: 10, scope: !368)
!371 = !DILocation(line: 97, column: 15, scope: !368)
!372 = !DILocation(line: 97, column: 18, scope: !368)
!373 = !DILocation(line: 97, column: 24, scope: !368)
!374 = !DILocation(line: 97, column: 30, scope: !368)
!375 = !DILocation(line: 97, column: 32, scope: !368)
!376 = !DILocation(line: 97, column: 22, scope: !368)
!377 = !DILocation(line: 97, column: 6, scope: !369)
!378 = !DILocation(line: 98, column: 38, scope: !379)
!379 = distinct !DILexicalBlock(scope: !368, file: !1, line: 97, column: 38)
!380 = !DILocation(line: 98, column: 44, scope: !379)
!381 = !DILocation(line: 98, column: 46, scope: !379)
!382 = !DILocation(line: 98, column: 48, scope: !379)
!383 = !DILocation(line: 98, column: 54, scope: !379)
!384 = !DILocation(line: 98, column: 56, scope: !379)
!385 = !DILocation(line: 98, column: 58, scope: !379)
!386 = !DILocation(line: 98, column: 64, scope: !379)
!387 = !DILocation(line: 98, column: 66, scope: !379)
!388 = !DILocation(line: 98, column: 68, scope: !379)
!389 = !DILocation(line: 98, column: 74, scope: !379)
!390 = !DILocation(line: 98, column: 76, scope: !379)
!391 = !DILocation(line: 98, column: 91, scope: !379)
!392 = !DILocation(line: 98, column: 97, scope: !379)
!393 = !DILocation(line: 98, column: 99, scope: !379)
!394 = !DILocation(line: 98, column: 86, scope: !379)
!395 = !DILocation(line: 98, column: 4, scope: !379)
!396 = !DILocation(line: 99, column: 9, scope: !379)
!397 = !DILocation(line: 100, column: 3, scope: !379)
!398 = !DILocation(line: 101, column: 10, scope: !369)
!399 = !DILocation(line: 101, column: 16, scope: !369)
!400 = !DILocation(line: 101, column: 8, scope: !369)
!401 = distinct !{!401, !358, !402}
!402 = !DILocation(line: 102, column: 2, scope: !343)
!403 = !DILocation(line: 103, column: 1, scope: !343)
!404 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 105, type: !405, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!405 = !DISubroutineType(types: !406)
!406 = !{!15, !15, !407}
!407 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !408, size: 64)
!408 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !409, size: 64)
!409 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!410 = !DILocalVariable(name: "argC", arg: 1, scope: !404, file: !1, line: 105, type: !15)
!411 = !DILocation(line: 105, column: 14, scope: !404)
!412 = !DILocalVariable(name: "argV", arg: 2, scope: !404, file: !1, line: 105, type: !407)
!413 = !DILocation(line: 105, column: 25, scope: !404)
!414 = !DILocalVariable(name: "count", scope: !404, file: !1, line: 107, type: !15)
!415 = !DILocation(line: 107, column: 6, scope: !404)
!416 = !DILocalVariable(name: "herons", scope: !404, file: !1, line: 108, type: !5)
!417 = !DILocation(line: 108, column: 7, scope: !404)
!418 = !DILocation(line: 110, column: 5, scope: !419)
!419 = distinct !DILexicalBlock(scope: !404, file: !1, line: 110, column: 5)
!420 = !DILocation(line: 110, column: 9, scope: !419)
!421 = !DILocation(line: 110, column: 5, scope: !404)
!422 = !DILocation(line: 111, column: 90, scope: !419)
!423 = !DILocation(line: 111, column: 3, scope: !419)
!424 = !DILocation(line: 113, column: 38, scope: !425)
!425 = distinct !DILexicalBlock(scope: !419, file: !1, line: 112, column: 6)
!426 = !DILocation(line: 113, column: 33, scope: !425)
!427 = !DILocation(line: 113, column: 12, scope: !425)
!428 = !DILocation(line: 113, column: 10, scope: !425)
!429 = !DILocation(line: 114, column: 33, scope: !425)
!430 = !DILocation(line: 114, column: 3, scope: !425)
!431 = !DILocation(line: 115, column: 9, scope: !425)
!432 = !DILocation(line: 115, column: 4, scope: !425)
!433 = !DILocation(line: 115, column: 17, scope: !425)
!434 = !DILocation(line: 115, column: 3, scope: !425)
!435 = !DILocation(line: 115, column: 63, scope: !425)
!436 = !DILocation(line: 115, column: 23, scope: !425)
!437 = !DILocation(line: 115, column: 129, scope: !425)
!438 = !DILocation(line: 115, column: 72, scope: !425)
!439 = !DILocation(line: 116, column: 13, scope: !425)
!440 = !DILocation(line: 116, column: 25, scope: !425)
!441 = !DILocation(line: 116, column: 20, scope: !425)
!442 = !DILocation(line: 116, column: 39, scope: !425)
!443 = !DILocation(line: 116, column: 34, scope: !425)
!444 = !DILocation(line: 116, column: 3, scope: !425)
!445 = !DILocation(line: 117, column: 8, scope: !425)
!446 = !DILocation(line: 117, column: 3, scope: !425)
!447 = !DILocation(line: 119, column: 2, scope: !404)
