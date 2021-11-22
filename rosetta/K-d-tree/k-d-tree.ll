; ModuleID = 'k-d-tree.c'
source_filename = "k-d-tree.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.kd_node_t = type { [3 x double], %struct.kd_node_t*, %struct.kd_node_t* }

@visited = common dso_local global i32 0, align 4, !dbg !0
@__const.main.wp = private unnamed_addr constant [6 x %struct.kd_node_t] [%struct.kd_node_t { [3 x double] [double 2.000000e+00, double 3.000000e+00, double 0.000000e+00], %struct.kd_node_t* null, %struct.kd_node_t* null }, %struct.kd_node_t { [3 x double] [double 5.000000e+00, double 4.000000e+00, double 0.000000e+00], %struct.kd_node_t* null, %struct.kd_node_t* null }, %struct.kd_node_t { [3 x double] [double 9.000000e+00, double 6.000000e+00, double 0.000000e+00], %struct.kd_node_t* null, %struct.kd_node_t* null }, %struct.kd_node_t { [3 x double] [double 4.000000e+00, double 7.000000e+00, double 0.000000e+00], %struct.kd_node_t* null, %struct.kd_node_t* null }, %struct.kd_node_t { [3 x double] [double 8.000000e+00, double 1.000000e+00, double 0.000000e+00], %struct.kd_node_t* null, %struct.kd_node_t* null }, %struct.kd_node_t { [3 x double] [double 7.000000e+00, double 2.000000e+00, double 0.000000e+00], %struct.kd_node_t* null, %struct.kd_node_t* null }], align 16
@.str = private unnamed_addr constant [73 x i8] c">> WP tree\0Asearching for (%g, %g)\0Afound (%g, %g) dist %g\0Aseen %d nodes\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [85 x i8] c">> Million tree\0Asearching for (%g, %g, %g)\0Afound (%g, %g, %g) dist %g\0Aseen %d nodes\0A\00", align 1
@.str.2 = private unnamed_addr constant [74 x i8] c"\0A>> Million tree\0Avisited %d nodes for %d random findings (%f per lookup)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.kd_node_t* @find_median(%struct.kd_node_t* %start, %struct.kd_node_t* %end, i32 %idx) #0 !dbg !22 {
entry:
  %retval = alloca %struct.kd_node_t*, align 8
  %start.addr = alloca %struct.kd_node_t*, align 8
  %end.addr = alloca %struct.kd_node_t*, align 8
  %idx.addr = alloca i32, align 4
  %p = alloca %struct.kd_node_t*, align 8
  %store = alloca %struct.kd_node_t*, align 8
  %md = alloca %struct.kd_node_t*, align 8
  %pivot = alloca double, align 8
  store %struct.kd_node_t* %start, %struct.kd_node_t** %start.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %start.addr, metadata !25, metadata !DIExpression()), !dbg !26
  store %struct.kd_node_t* %end, %struct.kd_node_t** %end.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %end.addr, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 %idx, i32* %idx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %idx.addr, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load %struct.kd_node_t*, %struct.kd_node_t** %end.addr, align 8, !dbg !31
  %1 = load %struct.kd_node_t*, %struct.kd_node_t** %start.addr, align 8, !dbg !33
  %cmp = icmp ule %struct.kd_node_t* %0, %1, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35, !cf.info !36

if.then:                                          ; preds = %entry
  store %struct.kd_node_t* null, %struct.kd_node_t** %retval, align 8, !dbg !37
  br label %return, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load %struct.kd_node_t*, %struct.kd_node_t** %end.addr, align 8, !dbg !38
  %3 = load %struct.kd_node_t*, %struct.kd_node_t** %start.addr, align 8, !dbg !40
  %add.ptr = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %3, i64 1, !dbg !41
  %cmp1 = icmp eq %struct.kd_node_t* %2, %add.ptr, !dbg !42
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !43, !cf.info !36

if.then2:                                         ; preds = %if.end
  %4 = load %struct.kd_node_t*, %struct.kd_node_t** %start.addr, align 8, !dbg !44
  store %struct.kd_node_t* %4, %struct.kd_node_t** %retval, align 8, !dbg !45
  br label %return, !dbg !45

if.end3:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %p, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %store, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %md, metadata !50, metadata !DIExpression()), !dbg !51
  %5 = load %struct.kd_node_t*, %struct.kd_node_t** %start.addr, align 8, !dbg !52
  %6 = load %struct.kd_node_t*, %struct.kd_node_t** %end.addr, align 8, !dbg !53
  %7 = load %struct.kd_node_t*, %struct.kd_node_t** %start.addr, align 8, !dbg !54
  %sub.ptr.lhs.cast = ptrtoint %struct.kd_node_t* %6 to i64, !dbg !55
  %sub.ptr.rhs.cast = ptrtoint %struct.kd_node_t* %7 to i64, !dbg !55
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !55
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 40, !dbg !55
  %div = sdiv i64 %sub.ptr.div, 2, !dbg !56
  %add.ptr4 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %5, i64 %div, !dbg !57
  store %struct.kd_node_t* %add.ptr4, %struct.kd_node_t** %md, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata double* %pivot, metadata !58, metadata !DIExpression()), !dbg !59
  br label %while.body, !dbg !60

while.body:                                       ; preds = %if.end3, %if.end29
  %8 = load %struct.kd_node_t*, %struct.kd_node_t** %md, align 8, !dbg !61
  %x = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %8, i32 0, i32 0, !dbg !63
  %9 = load i32, i32* %idx.addr, align 4, !dbg !64
  %idxprom = sext i32 %9 to i64, !dbg !61
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %x, i64 0, i64 %idxprom, !dbg !61
  %10 = load double, double* %arrayidx, align 8, !dbg !61
  store double %10, double* %pivot, align 8, !dbg !65
  %11 = load %struct.kd_node_t*, %struct.kd_node_t** %md, align 8, !dbg !66
  %12 = load %struct.kd_node_t*, %struct.kd_node_t** %end.addr, align 8, !dbg !67
  %add.ptr5 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %12, i64 -1, !dbg !68
  call void @swap(%struct.kd_node_t* %11, %struct.kd_node_t* %add.ptr5), !dbg !69
  %13 = load %struct.kd_node_t*, %struct.kd_node_t** %start.addr, align 8, !dbg !70
  store %struct.kd_node_t* %13, %struct.kd_node_t** %p, align 8, !dbg !72
  store %struct.kd_node_t* %13, %struct.kd_node_t** %store, align 8, !dbg !73
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %while.body
  %14 = load %struct.kd_node_t*, %struct.kd_node_t** %p, align 8, !dbg !75
  %15 = load %struct.kd_node_t*, %struct.kd_node_t** %end.addr, align 8, !dbg !77
  %cmp6 = icmp ult %struct.kd_node_t* %14, %15, !dbg !78
  br i1 %cmp6, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %16 = load %struct.kd_node_t*, %struct.kd_node_t** %p, align 8, !dbg !80
  %x7 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %16, i32 0, i32 0, !dbg !83
  %17 = load i32, i32* %idx.addr, align 4, !dbg !84
  %idxprom8 = sext i32 %17 to i64, !dbg !80
  %arrayidx9 = getelementptr inbounds [3 x double], [3 x double]* %x7, i64 0, i64 %idxprom8, !dbg !80
  %18 = load double, double* %arrayidx9, align 8, !dbg !80
  %19 = load double, double* %pivot, align 8, !dbg !85
  %cmp10 = fcmp olt double %18, %19, !dbg !86
  br i1 %cmp10, label %if.then11, label %if.end15, !dbg !87, !cf.info !36

if.then11:                                        ; preds = %for.body
  %20 = load %struct.kd_node_t*, %struct.kd_node_t** %p, align 8, !dbg !88
  %21 = load %struct.kd_node_t*, %struct.kd_node_t** %store, align 8, !dbg !91
  %cmp12 = icmp ne %struct.kd_node_t* %20, %21, !dbg !92
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !93, !cf.info !36

if.then13:                                        ; preds = %if.then11
  %22 = load %struct.kd_node_t*, %struct.kd_node_t** %p, align 8, !dbg !94
  %23 = load %struct.kd_node_t*, %struct.kd_node_t** %store, align 8, !dbg !95
  call void @swap(%struct.kd_node_t* %22, %struct.kd_node_t* %23), !dbg !96
  br label %if.end14, !dbg !96

if.end14:                                         ; preds = %if.then13, %if.then11
  %24 = load %struct.kd_node_t*, %struct.kd_node_t** %store, align 8, !dbg !97
  %incdec.ptr = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %24, i32 1, !dbg !97
  store %struct.kd_node_t* %incdec.ptr, %struct.kd_node_t** %store, align 8, !dbg !97
  br label %if.end15, !dbg !98

if.end15:                                         ; preds = %if.end14, %for.body
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %if.end15
  %25 = load %struct.kd_node_t*, %struct.kd_node_t** %p, align 8, !dbg !100
  %incdec.ptr16 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %25, i32 1, !dbg !100
  store %struct.kd_node_t* %incdec.ptr16, %struct.kd_node_t** %p, align 8, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  %26 = load %struct.kd_node_t*, %struct.kd_node_t** %store, align 8, !dbg !104
  %27 = load %struct.kd_node_t*, %struct.kd_node_t** %end.addr, align 8, !dbg !105
  %add.ptr17 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %27, i64 -1, !dbg !106
  call void @swap(%struct.kd_node_t* %26, %struct.kd_node_t* %add.ptr17), !dbg !107
  %28 = load %struct.kd_node_t*, %struct.kd_node_t** %store, align 8, !dbg !108
  %x18 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %28, i32 0, i32 0, !dbg !110
  %29 = load i32, i32* %idx.addr, align 4, !dbg !111
  %idxprom19 = sext i32 %29 to i64, !dbg !108
  %arrayidx20 = getelementptr inbounds [3 x double], [3 x double]* %x18, i64 0, i64 %idxprom19, !dbg !108
  %30 = load double, double* %arrayidx20, align 8, !dbg !108
  %31 = load %struct.kd_node_t*, %struct.kd_node_t** %md, align 8, !dbg !112
  %x21 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %31, i32 0, i32 0, !dbg !113
  %32 = load i32, i32* %idx.addr, align 4, !dbg !114
  %idxprom22 = sext i32 %32 to i64, !dbg !112
  %arrayidx23 = getelementptr inbounds [3 x double], [3 x double]* %x21, i64 0, i64 %idxprom22, !dbg !112
  %33 = load double, double* %arrayidx23, align 8, !dbg !112
  %cmp24 = fcmp oeq double %30, %33, !dbg !115
  br i1 %cmp24, label %if.then25, label %if.end26, !dbg !116, !cf.info !36

if.then25:                                        ; preds = %for.end
  %34 = load %struct.kd_node_t*, %struct.kd_node_t** %md, align 8, !dbg !117
  store %struct.kd_node_t* %34, %struct.kd_node_t** %retval, align 8, !dbg !118
  br label %return, !dbg !118

if.end26:                                         ; preds = %for.end
  %35 = load %struct.kd_node_t*, %struct.kd_node_t** %store, align 8, !dbg !119
  %36 = load %struct.kd_node_t*, %struct.kd_node_t** %md, align 8, !dbg !121
  %cmp27 = icmp ugt %struct.kd_node_t* %35, %36, !dbg !122
  br i1 %cmp27, label %if.then28, label %if.else, !dbg !123, !cf.info !36

if.then28:                                        ; preds = %if.end26
  %37 = load %struct.kd_node_t*, %struct.kd_node_t** %store, align 8, !dbg !124
  store %struct.kd_node_t* %37, %struct.kd_node_t** %end.addr, align 8, !dbg !125
  br label %if.end29, !dbg !126

if.else:                                          ; preds = %if.end26
  %38 = load %struct.kd_node_t*, %struct.kd_node_t** %store, align 8, !dbg !127
  store %struct.kd_node_t* %38, %struct.kd_node_t** %start.addr, align 8, !dbg !128
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then28
  br label %while.body, !dbg !60, !llvm.loop !129

return:                                           ; preds = %if.then25, %if.then2, %if.then
  %39 = load %struct.kd_node_t*, %struct.kd_node_t** %retval, align 8, !dbg !131
  ret %struct.kd_node_t* %39, !dbg !131
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @swap(%struct.kd_node_t*, %struct.kd_node_t*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.kd_node_t* @make_tree(%struct.kd_node_t* %t, i32 %len, i32 %i, i32 %dim) #0 !dbg !132 {
entry:
  %retval = alloca %struct.kd_node_t*, align 8
  %t.addr = alloca %struct.kd_node_t*, align 8
  %len.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %dim.addr = alloca i32, align 4
  %n = alloca %struct.kd_node_t*, align 8
  store %struct.kd_node_t* %t, %struct.kd_node_t** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %t.addr, metadata !135, metadata !DIExpression()), !dbg !136
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !137, metadata !DIExpression()), !dbg !138
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !139, metadata !DIExpression()), !dbg !140
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %n, metadata !143, metadata !DIExpression()), !dbg !144
  %0 = load i32, i32* %len.addr, align 4, !dbg !145
  %tobool = icmp ne i32 %0, 0, !dbg !145
  br i1 %tobool, label %if.end, label %if.then, !dbg !147, !cf.info !36

if.then:                                          ; preds = %entry
  store %struct.kd_node_t* null, %struct.kd_node_t** %retval, align 8, !dbg !148
  br label %return, !dbg !148

if.end:                                           ; preds = %entry
  %1 = load %struct.kd_node_t*, %struct.kd_node_t** %t.addr, align 8, !dbg !149
  %2 = load %struct.kd_node_t*, %struct.kd_node_t** %t.addr, align 8, !dbg !151
  %3 = load i32, i32* %len.addr, align 4, !dbg !152
  %idx.ext = sext i32 %3 to i64, !dbg !153
  %add.ptr = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %2, i64 %idx.ext, !dbg !153
  %4 = load i32, i32* %i.addr, align 4, !dbg !154
  %call = call %struct.kd_node_t* @find_median(%struct.kd_node_t* %1, %struct.kd_node_t* %add.ptr, i32 %4), !dbg !155
  store %struct.kd_node_t* %call, %struct.kd_node_t** %n, align 8, !dbg !156
  %tobool1 = icmp ne %struct.kd_node_t* %call, null, !dbg !156
  br i1 %tobool1, label %if.then2, label %if.end14, !dbg !157, !cf.info !36

if.then2:                                         ; preds = %if.end
  %5 = load i32, i32* %i.addr, align 4, !dbg !158
  %add = add nsw i32 %5, 1, !dbg !160
  %6 = load i32, i32* %dim.addr, align 4, !dbg !161
  %rem = srem i32 %add, %6, !dbg !162
  store i32 %rem, i32* %i.addr, align 4, !dbg !163
  %7 = load %struct.kd_node_t*, %struct.kd_node_t** %t.addr, align 8, !dbg !164
  %8 = load %struct.kd_node_t*, %struct.kd_node_t** %n, align 8, !dbg !165
  %9 = load %struct.kd_node_t*, %struct.kd_node_t** %t.addr, align 8, !dbg !166
  %sub.ptr.lhs.cast = ptrtoint %struct.kd_node_t* %8 to i64, !dbg !167
  %sub.ptr.rhs.cast = ptrtoint %struct.kd_node_t* %9 to i64, !dbg !167
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !167
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 40, !dbg !167
  %conv = trunc i64 %sub.ptr.div to i32, !dbg !165
  %10 = load i32, i32* %i.addr, align 4, !dbg !168
  %11 = load i32, i32* %dim.addr, align 4, !dbg !169
  %call3 = call %struct.kd_node_t* @make_tree(%struct.kd_node_t* %7, i32 %conv, i32 %10, i32 %11), !dbg !170
  %12 = load %struct.kd_node_t*, %struct.kd_node_t** %n, align 8, !dbg !171
  %left = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %12, i32 0, i32 1, !dbg !172
  store %struct.kd_node_t* %call3, %struct.kd_node_t** %left, align 8, !dbg !173
  %13 = load %struct.kd_node_t*, %struct.kd_node_t** %n, align 8, !dbg !174
  %add.ptr4 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %13, i64 1, !dbg !175
  %14 = load %struct.kd_node_t*, %struct.kd_node_t** %t.addr, align 8, !dbg !176
  %15 = load i32, i32* %len.addr, align 4, !dbg !177
  %idx.ext5 = sext i32 %15 to i64, !dbg !178
  %add.ptr6 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %14, i64 %idx.ext5, !dbg !178
  %16 = load %struct.kd_node_t*, %struct.kd_node_t** %n, align 8, !dbg !179
  %add.ptr7 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %16, i64 1, !dbg !180
  %sub.ptr.lhs.cast8 = ptrtoint %struct.kd_node_t* %add.ptr6 to i64, !dbg !181
  %sub.ptr.rhs.cast9 = ptrtoint %struct.kd_node_t* %add.ptr7 to i64, !dbg !181
  %sub.ptr.sub10 = sub i64 %sub.ptr.lhs.cast8, %sub.ptr.rhs.cast9, !dbg !181
  %sub.ptr.div11 = sdiv exact i64 %sub.ptr.sub10, 40, !dbg !181
  %conv12 = trunc i64 %sub.ptr.div11 to i32, !dbg !176
  %17 = load i32, i32* %i.addr, align 4, !dbg !182
  %18 = load i32, i32* %dim.addr, align 4, !dbg !183
  %call13 = call %struct.kd_node_t* @make_tree(%struct.kd_node_t* %add.ptr4, i32 %conv12, i32 %17, i32 %18), !dbg !184
  %19 = load %struct.kd_node_t*, %struct.kd_node_t** %n, align 8, !dbg !185
  %right = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %19, i32 0, i32 2, !dbg !186
  store %struct.kd_node_t* %call13, %struct.kd_node_t** %right, align 8, !dbg !187
  br label %if.end14, !dbg !188

if.end14:                                         ; preds = %if.then2, %if.end
  %20 = load %struct.kd_node_t*, %struct.kd_node_t** %n, align 8, !dbg !189
  store %struct.kd_node_t* %20, %struct.kd_node_t** %retval, align 8, !dbg !190
  br label %return, !dbg !190

return:                                           ; preds = %if.end14, %if.then
  %21 = load %struct.kd_node_t*, %struct.kd_node_t** %retval, align 8, !dbg !191
  ret %struct.kd_node_t* %21, !dbg !191
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @nearest(%struct.kd_node_t* %root, %struct.kd_node_t* %nd, i32 %i, i32 %dim, %struct.kd_node_t** %best, double* %best_dist) #0 !dbg !192 {
entry:
  %root.addr = alloca %struct.kd_node_t*, align 8
  %nd.addr = alloca %struct.kd_node_t*, align 8
  %i.addr = alloca i32, align 4
  %dim.addr = alloca i32, align 4
  %best.addr = alloca %struct.kd_node_t**, align 8
  %best_dist.addr = alloca double*, align 8
  %d = alloca double, align 8
  %dx = alloca double, align 8
  %dx2 = alloca double, align 8
  store %struct.kd_node_t* %root, %struct.kd_node_t** %root.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %root.addr, metadata !197, metadata !DIExpression()), !dbg !198
  store %struct.kd_node_t* %nd, %struct.kd_node_t** %nd.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %nd.addr, metadata !199, metadata !DIExpression()), !dbg !200
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !201, metadata !DIExpression()), !dbg !202
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !203, metadata !DIExpression()), !dbg !204
  store %struct.kd_node_t** %best, %struct.kd_node_t*** %best.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.kd_node_t*** %best.addr, metadata !205, metadata !DIExpression()), !dbg !206
  store double* %best_dist, double** %best_dist.addr, align 8
  call void @llvm.dbg.declare(metadata double** %best_dist.addr, metadata !207, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata double* %d, metadata !209, metadata !DIExpression()), !dbg !210
  call void @llvm.dbg.declare(metadata double* %dx, metadata !211, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.declare(metadata double* %dx2, metadata !213, metadata !DIExpression()), !dbg !214
  %0 = load %struct.kd_node_t*, %struct.kd_node_t** %root.addr, align 8, !dbg !215
  %tobool = icmp ne %struct.kd_node_t* %0, null, !dbg !215
  br i1 %tobool, label %if.end, label %if.then, !dbg !217, !cf.info !36

if.then:                                          ; preds = %entry
  br label %return, !dbg !218

if.end:                                           ; preds = %entry
  %1 = load %struct.kd_node_t*, %struct.kd_node_t** %root.addr, align 8, !dbg !219
  %2 = load %struct.kd_node_t*, %struct.kd_node_t** %nd.addr, align 8, !dbg !220
  %3 = load i32, i32* %dim.addr, align 4, !dbg !221
  %call = call double @dist(%struct.kd_node_t* %1, %struct.kd_node_t* %2, i32 %3), !dbg !222
  store double %call, double* %d, align 8, !dbg !223
  %4 = load %struct.kd_node_t*, %struct.kd_node_t** %root.addr, align 8, !dbg !224
  %x = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %4, i32 0, i32 0, !dbg !225
  %5 = load i32, i32* %i.addr, align 4, !dbg !226
  %idxprom = sext i32 %5 to i64, !dbg !224
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %x, i64 0, i64 %idxprom, !dbg !224
  %6 = load double, double* %arrayidx, align 8, !dbg !224
  %7 = load %struct.kd_node_t*, %struct.kd_node_t** %nd.addr, align 8, !dbg !227
  %x1 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %7, i32 0, i32 0, !dbg !228
  %8 = load i32, i32* %i.addr, align 4, !dbg !229
  %idxprom2 = sext i32 %8 to i64, !dbg !227
  %arrayidx3 = getelementptr inbounds [3 x double], [3 x double]* %x1, i64 0, i64 %idxprom2, !dbg !227
  %9 = load double, double* %arrayidx3, align 8, !dbg !227
  %sub = fsub double %6, %9, !dbg !230
  store double %sub, double* %dx, align 8, !dbg !231
  %10 = load double, double* %dx, align 8, !dbg !232
  %11 = load double, double* %dx, align 8, !dbg !233
  %mul = fmul double %10, %11, !dbg !234
  store double %mul, double* %dx2, align 8, !dbg !235
  %12 = load i32, i32* @visited, align 4, !dbg !236
  %inc = add nsw i32 %12, 1, !dbg !236
  store i32 %inc, i32* @visited, align 4, !dbg !236
  %13 = load %struct.kd_node_t**, %struct.kd_node_t*** %best.addr, align 8, !dbg !237
  %14 = load %struct.kd_node_t*, %struct.kd_node_t** %13, align 8, !dbg !239
  %tobool4 = icmp ne %struct.kd_node_t* %14, null, !dbg !239
  br i1 %tobool4, label %lor.lhs.false, label %if.then5, !dbg !240, !cf.info !36

lor.lhs.false:                                    ; preds = %if.end
  %15 = load double, double* %d, align 8, !dbg !241
  %16 = load double*, double** %best_dist.addr, align 8, !dbg !242
  %17 = load double, double* %16, align 8, !dbg !243
  %cmp = fcmp olt double %15, %17, !dbg !244
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !245, !cf.info !36

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %18 = load double, double* %d, align 8, !dbg !246
  %19 = load double*, double** %best_dist.addr, align 8, !dbg !248
  store double %18, double* %19, align 8, !dbg !249
  %20 = load %struct.kd_node_t*, %struct.kd_node_t** %root.addr, align 8, !dbg !250
  %21 = load %struct.kd_node_t**, %struct.kd_node_t*** %best.addr, align 8, !dbg !251
  store %struct.kd_node_t* %20, %struct.kd_node_t** %21, align 8, !dbg !252
  br label %if.end6, !dbg !253

if.end6:                                          ; preds = %if.then5, %lor.lhs.false
  %22 = load double*, double** %best_dist.addr, align 8, !dbg !254
  %23 = load double, double* %22, align 8, !dbg !256
  %tobool7 = fcmp une double %23, 0.000000e+00, !dbg !256
  br i1 %tobool7, label %if.end9, label %if.then8, !dbg !257, !cf.info !36

if.then8:                                         ; preds = %if.end6
  br label %return, !dbg !258

if.end9:                                          ; preds = %if.end6
  %24 = load i32, i32* %i.addr, align 4, !dbg !259
  %inc10 = add nsw i32 %24, 1, !dbg !259
  store i32 %inc10, i32* %i.addr, align 4, !dbg !259
  %25 = load i32, i32* %dim.addr, align 4, !dbg !261
  %cmp11 = icmp sge i32 %inc10, %25, !dbg !262
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !263, !cf.info !36

if.then12:                                        ; preds = %if.end9
  store i32 0, i32* %i.addr, align 4, !dbg !264
  br label %if.end13, !dbg !265

if.end13:                                         ; preds = %if.then12, %if.end9
  %26 = load double, double* %dx, align 8, !dbg !266
  %cmp14 = fcmp ogt double %26, 0.000000e+00, !dbg !267
  br i1 %cmp14, label %cond.true, label %cond.false, !dbg !266

cond.true:                                        ; preds = %if.end13
  %27 = load %struct.kd_node_t*, %struct.kd_node_t** %root.addr, align 8, !dbg !268
  %left = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %27, i32 0, i32 1, !dbg !269
  %28 = load %struct.kd_node_t*, %struct.kd_node_t** %left, align 8, !dbg !269
  br label %cond.end, !dbg !266

cond.false:                                       ; preds = %if.end13
  %29 = load %struct.kd_node_t*, %struct.kd_node_t** %root.addr, align 8, !dbg !270
  %right = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %29, i32 0, i32 2, !dbg !271
  %30 = load %struct.kd_node_t*, %struct.kd_node_t** %right, align 8, !dbg !271
  br label %cond.end, !dbg !266

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.kd_node_t* [ %28, %cond.true ], [ %30, %cond.false ], !dbg !266
  %31 = load %struct.kd_node_t*, %struct.kd_node_t** %nd.addr, align 8, !dbg !272
  %32 = load i32, i32* %i.addr, align 4, !dbg !273
  %33 = load i32, i32* %dim.addr, align 4, !dbg !274
  %34 = load %struct.kd_node_t**, %struct.kd_node_t*** %best.addr, align 8, !dbg !275
  %35 = load double*, double** %best_dist.addr, align 8, !dbg !276
  call void @nearest(%struct.kd_node_t* %cond, %struct.kd_node_t* %31, i32 %32, i32 %33, %struct.kd_node_t** %34, double* %35), !dbg !277
  %36 = load double, double* %dx2, align 8, !dbg !278
  %37 = load double*, double** %best_dist.addr, align 8, !dbg !280
  %38 = load double, double* %37, align 8, !dbg !281
  %cmp15 = fcmp oge double %36, %38, !dbg !282
  br i1 %cmp15, label %if.then16, label %if.end17, !dbg !283, !cf.info !36

if.then16:                                        ; preds = %cond.end
  br label %return, !dbg !284

if.end17:                                         ; preds = %cond.end
  %39 = load double, double* %dx, align 8, !dbg !285
  %cmp18 = fcmp ogt double %39, 0.000000e+00, !dbg !286
  br i1 %cmp18, label %cond.true19, label %cond.false21, !dbg !285

cond.true19:                                      ; preds = %if.end17
  %40 = load %struct.kd_node_t*, %struct.kd_node_t** %root.addr, align 8, !dbg !287
  %right20 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %40, i32 0, i32 2, !dbg !288
  %41 = load %struct.kd_node_t*, %struct.kd_node_t** %right20, align 8, !dbg !288
  br label %cond.end23, !dbg !285

cond.false21:                                     ; preds = %if.end17
  %42 = load %struct.kd_node_t*, %struct.kd_node_t** %root.addr, align 8, !dbg !289
  %left22 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %42, i32 0, i32 1, !dbg !290
  %43 = load %struct.kd_node_t*, %struct.kd_node_t** %left22, align 8, !dbg !290
  br label %cond.end23, !dbg !285

cond.end23:                                       ; preds = %cond.false21, %cond.true19
  %cond24 = phi %struct.kd_node_t* [ %41, %cond.true19 ], [ %43, %cond.false21 ], !dbg !285
  %44 = load %struct.kd_node_t*, %struct.kd_node_t** %nd.addr, align 8, !dbg !291
  %45 = load i32, i32* %i.addr, align 4, !dbg !292
  %46 = load i32, i32* %dim.addr, align 4, !dbg !293
  %47 = load %struct.kd_node_t**, %struct.kd_node_t*** %best.addr, align 8, !dbg !294
  %48 = load double*, double** %best_dist.addr, align 8, !dbg !295
  call void @nearest(%struct.kd_node_t* %cond24, %struct.kd_node_t* %44, i32 %45, i32 %46, %struct.kd_node_t** %47, double* %48), !dbg !296
  br label %return, !dbg !297

return:                                           ; preds = %cond.end23, %if.then16, %if.then8, %if.then
  ret void, !dbg !297
}

declare dso_local double @dist(%struct.kd_node_t*, %struct.kd_node_t*, i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !298 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %wp = alloca [6 x %struct.kd_node_t], align 16
  %testNode = alloca %struct.kd_node_t, align 8
  %root = alloca %struct.kd_node_t*, align 8
  %found = alloca %struct.kd_node_t*, align 8
  %million = alloca %struct.kd_node_t*, align 8
  %best_dist = alloca double, align 8
  %sum = alloca i32, align 4
  %test_runs = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !301, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.declare(metadata [6 x %struct.kd_node_t]* %wp, metadata !303, metadata !DIExpression()), !dbg !307
  %0 = bitcast [6 x %struct.kd_node_t]* %wp to i8*, !dbg !307
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([6 x %struct.kd_node_t]* @__const.main.wp to i8*), i64 240, i1 false), !dbg !307
  call void @llvm.dbg.declare(metadata %struct.kd_node_t* %testNode, metadata !308, metadata !DIExpression()), !dbg !309
  %1 = bitcast %struct.kd_node_t* %testNode to i8*, !dbg !309
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 40, i1 false), !dbg !309
  %2 = bitcast i8* %1 to %struct.kd_node_t*, !dbg !309
  %3 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %2, i32 0, i32 0, !dbg !309
  %4 = getelementptr inbounds [3 x double], [3 x double]* %3, i32 0, i32 0, !dbg !309
  store double 9.000000e+00, double* %4, align 8, !dbg !309
  %5 = getelementptr inbounds [3 x double], [3 x double]* %3, i32 0, i32 1, !dbg !309
  store double 2.000000e+00, double* %5, align 8, !dbg !309
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %root, metadata !310, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %found, metadata !312, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.declare(metadata %struct.kd_node_t** %million, metadata !314, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.declare(metadata double* %best_dist, metadata !316, metadata !DIExpression()), !dbg !317
  %arraydecay = getelementptr inbounds [6 x %struct.kd_node_t], [6 x %struct.kd_node_t]* %wp, i64 0, i64 0, !dbg !318
  %call = call %struct.kd_node_t* @make_tree(%struct.kd_node_t* %arraydecay, i32 6, i32 0, i32 2), !dbg !319
  store %struct.kd_node_t* %call, %struct.kd_node_t** %root, align 8, !dbg !320
  store i32 0, i32* @visited, align 4, !dbg !321
  store %struct.kd_node_t* null, %struct.kd_node_t** %found, align 8, !dbg !322
  %6 = load %struct.kd_node_t*, %struct.kd_node_t** %root, align 8, !dbg !323
  call void @nearest(%struct.kd_node_t* %6, %struct.kd_node_t* %testNode, i32 0, i32 2, %struct.kd_node_t** %found, double* %best_dist), !dbg !324
  %x = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !325
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %x, i64 0, i64 0, !dbg !326
  %7 = load double, double* %arrayidx, align 8, !dbg !326
  %x1 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !327
  %arrayidx2 = getelementptr inbounds [3 x double], [3 x double]* %x1, i64 0, i64 1, !dbg !328
  %8 = load double, double* %arrayidx2, align 8, !dbg !328
  %9 = load %struct.kd_node_t*, %struct.kd_node_t** %found, align 8, !dbg !329
  %x3 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %9, i32 0, i32 0, !dbg !330
  %arrayidx4 = getelementptr inbounds [3 x double], [3 x double]* %x3, i64 0, i64 0, !dbg !329
  %10 = load double, double* %arrayidx4, align 8, !dbg !329
  %11 = load %struct.kd_node_t*, %struct.kd_node_t** %found, align 8, !dbg !331
  %x5 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %11, i32 0, i32 0, !dbg !332
  %arrayidx6 = getelementptr inbounds [3 x double], [3 x double]* %x5, i64 0, i64 1, !dbg !331
  %12 = load double, double* %arrayidx6, align 8, !dbg !331
  %13 = load double, double* %best_dist, align 8, !dbg !333
  %call7 = call double @sqrt(double %13) #5, !dbg !334
  %14 = load i32, i32* @visited, align 4, !dbg !335
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str, i64 0, i64 0), double %7, double %8, double %10, double %12, double %call7, i32 %14), !dbg !336
  %call9 = call noalias i8* @calloc(i64 1000000, i64 40) #5, !dbg !337
  %15 = bitcast i8* %call9 to %struct.kd_node_t*, !dbg !338
  store %struct.kd_node_t* %15, %struct.kd_node_t** %million, align 8, !dbg !339
  %call10 = call i64 @time(i64* null) #5, !dbg !340
  %conv = trunc i64 %call10 to i32, !dbg !340
  call void @srand(i32 %conv) #5, !dbg !341
  store i32 0, i32* %i, align 4, !dbg !342
  br label %for.cond, !dbg !344

for.cond:                                         ; preds = %for.inc, %entry
  %16 = load i32, i32* %i, align 4, !dbg !345
  %cmp = icmp slt i32 %16, 1000000, !dbg !347
  br i1 %cmp, label %for.body, label %for.end, !dbg !348

for.body:                                         ; preds = %for.cond
  %call12 = call i32 @rand() #5, !dbg !349
  %conv13 = sitofp i32 %call12 to double, !dbg !349
  %div = fdiv double %conv13, 0x41DFFFFFFFC00000, !dbg !349
  %17 = load %struct.kd_node_t*, %struct.kd_node_t** %million, align 8, !dbg !349
  %18 = load i32, i32* %i, align 4, !dbg !349
  %idxprom = sext i32 %18 to i64, !dbg !349
  %arrayidx14 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %17, i64 %idxprom, !dbg !349
  %x15 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %arrayidx14, i32 0, i32 0, !dbg !349
  %arrayidx16 = getelementptr inbounds [3 x double], [3 x double]* %x15, i64 0, i64 0, !dbg !349
  store double %div, double* %arrayidx16, align 8, !dbg !349
  %call17 = call i32 @rand() #5, !dbg !349
  %conv18 = sitofp i32 %call17 to double, !dbg !349
  %div19 = fdiv double %conv18, 0x41DFFFFFFFC00000, !dbg !349
  %19 = load %struct.kd_node_t*, %struct.kd_node_t** %million, align 8, !dbg !349
  %20 = load i32, i32* %i, align 4, !dbg !349
  %idxprom20 = sext i32 %20 to i64, !dbg !349
  %arrayidx21 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %19, i64 %idxprom20, !dbg !349
  %x22 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %arrayidx21, i32 0, i32 0, !dbg !349
  %arrayidx23 = getelementptr inbounds [3 x double], [3 x double]* %x22, i64 0, i64 1, !dbg !349
  store double %div19, double* %arrayidx23, align 8, !dbg !349
  %call24 = call i32 @rand() #5, !dbg !349
  %conv25 = sitofp i32 %call24 to double, !dbg !349
  %div26 = fdiv double %conv25, 0x41DFFFFFFFC00000, !dbg !349
  %21 = load %struct.kd_node_t*, %struct.kd_node_t** %million, align 8, !dbg !349
  %22 = load i32, i32* %i, align 4, !dbg !349
  %idxprom27 = sext i32 %22 to i64, !dbg !349
  %arrayidx28 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %21, i64 %idxprom27, !dbg !349
  %x29 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %arrayidx28, i32 0, i32 0, !dbg !349
  %arrayidx30 = getelementptr inbounds [3 x double], [3 x double]* %x29, i64 0, i64 2, !dbg !349
  store double %div26, double* %arrayidx30, align 8, !dbg !349
  br label %for.inc, !dbg !349

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %i, align 4, !dbg !351
  %inc = add nsw i32 %23, 1, !dbg !351
  store i32 %inc, i32* %i, align 4, !dbg !351
  br label %for.cond, !dbg !352, !llvm.loop !353

for.end:                                          ; preds = %for.cond
  %24 = load %struct.kd_node_t*, %struct.kd_node_t** %million, align 8, !dbg !355
  %call31 = call %struct.kd_node_t* @make_tree(%struct.kd_node_t* %24, i32 1000000, i32 0, i32 3), !dbg !356
  store %struct.kd_node_t* %call31, %struct.kd_node_t** %root, align 8, !dbg !357
  %call32 = call i32 @rand() #5, !dbg !358
  %conv33 = sitofp i32 %call32 to double, !dbg !358
  %div34 = fdiv double %conv33, 0x41DFFFFFFFC00000, !dbg !358
  %x35 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !358
  %arrayidx36 = getelementptr inbounds [3 x double], [3 x double]* %x35, i64 0, i64 0, !dbg !358
  store double %div34, double* %arrayidx36, align 8, !dbg !358
  %call37 = call i32 @rand() #5, !dbg !358
  %conv38 = sitofp i32 %call37 to double, !dbg !358
  %div39 = fdiv double %conv38, 0x41DFFFFFFFC00000, !dbg !358
  %x40 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !358
  %arrayidx41 = getelementptr inbounds [3 x double], [3 x double]* %x40, i64 0, i64 1, !dbg !358
  store double %div39, double* %arrayidx41, align 8, !dbg !358
  %call42 = call i32 @rand() #5, !dbg !358
  %conv43 = sitofp i32 %call42 to double, !dbg !358
  %div44 = fdiv double %conv43, 0x41DFFFFFFFC00000, !dbg !358
  %x45 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !358
  %arrayidx46 = getelementptr inbounds [3 x double], [3 x double]* %x45, i64 0, i64 2, !dbg !358
  store double %div44, double* %arrayidx46, align 8, !dbg !358
  store i32 0, i32* @visited, align 4, !dbg !360
  store %struct.kd_node_t* null, %struct.kd_node_t** %found, align 8, !dbg !361
  %25 = load %struct.kd_node_t*, %struct.kd_node_t** %root, align 8, !dbg !362
  call void @nearest(%struct.kd_node_t* %25, %struct.kd_node_t* %testNode, i32 0, i32 3, %struct.kd_node_t** %found, double* %best_dist), !dbg !363
  %x47 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !364
  %arrayidx48 = getelementptr inbounds [3 x double], [3 x double]* %x47, i64 0, i64 0, !dbg !365
  %26 = load double, double* %arrayidx48, align 8, !dbg !365
  %x49 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !366
  %arrayidx50 = getelementptr inbounds [3 x double], [3 x double]* %x49, i64 0, i64 1, !dbg !367
  %27 = load double, double* %arrayidx50, align 8, !dbg !367
  %x51 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !368
  %arrayidx52 = getelementptr inbounds [3 x double], [3 x double]* %x51, i64 0, i64 2, !dbg !369
  %28 = load double, double* %arrayidx52, align 8, !dbg !369
  %29 = load %struct.kd_node_t*, %struct.kd_node_t** %found, align 8, !dbg !370
  %x53 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %29, i32 0, i32 0, !dbg !371
  %arrayidx54 = getelementptr inbounds [3 x double], [3 x double]* %x53, i64 0, i64 0, !dbg !370
  %30 = load double, double* %arrayidx54, align 8, !dbg !370
  %31 = load %struct.kd_node_t*, %struct.kd_node_t** %found, align 8, !dbg !372
  %x55 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %31, i32 0, i32 0, !dbg !373
  %arrayidx56 = getelementptr inbounds [3 x double], [3 x double]* %x55, i64 0, i64 1, !dbg !372
  %32 = load double, double* %arrayidx56, align 8, !dbg !372
  %33 = load %struct.kd_node_t*, %struct.kd_node_t** %found, align 8, !dbg !374
  %x57 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %33, i32 0, i32 0, !dbg !375
  %arrayidx58 = getelementptr inbounds [3 x double], [3 x double]* %x57, i64 0, i64 2, !dbg !374
  %34 = load double, double* %arrayidx58, align 8, !dbg !374
  %35 = load double, double* %best_dist, align 8, !dbg !376
  %call59 = call double @sqrt(double %35) #5, !dbg !377
  %36 = load i32, i32* @visited, align 4, !dbg !378
  %call60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.1, i64 0, i64 0), double %26, double %27, double %28, double %30, double %32, double %34, double %call59, i32 %36), !dbg !379
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !380, metadata !DIExpression()), !dbg !381
  store i32 0, i32* %sum, align 4, !dbg !381
  call void @llvm.dbg.declare(metadata i32* %test_runs, metadata !382, metadata !DIExpression()), !dbg !383
  store i32 100000, i32* %test_runs, align 4, !dbg !383
  store i32 0, i32* %i, align 4, !dbg !384
  br label %for.cond61, !dbg !386

for.cond61:                                       ; preds = %for.inc80, %for.end
  %37 = load i32, i32* %i, align 4, !dbg !387
  %38 = load i32, i32* %test_runs, align 4, !dbg !389
  %cmp62 = icmp slt i32 %37, %38, !dbg !390
  br i1 %cmp62, label %for.body64, label %for.end82, !dbg !391

for.body64:                                       ; preds = %for.cond61
  store %struct.kd_node_t* null, %struct.kd_node_t** %found, align 8, !dbg !392
  store i32 0, i32* @visited, align 4, !dbg !394
  %call65 = call i32 @rand() #5, !dbg !395
  %conv66 = sitofp i32 %call65 to double, !dbg !395
  %div67 = fdiv double %conv66, 0x41DFFFFFFFC00000, !dbg !395
  %x68 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !395
  %arrayidx69 = getelementptr inbounds [3 x double], [3 x double]* %x68, i64 0, i64 0, !dbg !395
  store double %div67, double* %arrayidx69, align 8, !dbg !395
  %call70 = call i32 @rand() #5, !dbg !395
  %conv71 = sitofp i32 %call70 to double, !dbg !395
  %div72 = fdiv double %conv71, 0x41DFFFFFFFC00000, !dbg !395
  %x73 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !395
  %arrayidx74 = getelementptr inbounds [3 x double], [3 x double]* %x73, i64 0, i64 1, !dbg !395
  store double %div72, double* %arrayidx74, align 8, !dbg !395
  %call75 = call i32 @rand() #5, !dbg !395
  %conv76 = sitofp i32 %call75 to double, !dbg !395
  %div77 = fdiv double %conv76, 0x41DFFFFFFFC00000, !dbg !395
  %x78 = getelementptr inbounds %struct.kd_node_t, %struct.kd_node_t* %testNode, i32 0, i32 0, !dbg !395
  %arrayidx79 = getelementptr inbounds [3 x double], [3 x double]* %x78, i64 0, i64 2, !dbg !395
  store double %div77, double* %arrayidx79, align 8, !dbg !395
  %39 = load %struct.kd_node_t*, %struct.kd_node_t** %root, align 8, !dbg !397
  call void @nearest(%struct.kd_node_t* %39, %struct.kd_node_t* %testNode, i32 0, i32 3, %struct.kd_node_t** %found, double* %best_dist), !dbg !398
  %40 = load i32, i32* @visited, align 4, !dbg !399
  %41 = load i32, i32* %sum, align 4, !dbg !400
  %add = add nsw i32 %41, %40, !dbg !400
  store i32 %add, i32* %sum, align 4, !dbg !400
  br label %for.inc80, !dbg !401

for.inc80:                                        ; preds = %for.body64
  %42 = load i32, i32* %i, align 4, !dbg !402
  %inc81 = add nsw i32 %42, 1, !dbg !402
  store i32 %inc81, i32* %i, align 4, !dbg !402
  br label %for.cond61, !dbg !403, !llvm.loop !404

for.end82:                                        ; preds = %for.cond61
  %43 = load i32, i32* %sum, align 4, !dbg !406
  %44 = load i32, i32* %test_runs, align 4, !dbg !407
  %45 = load i32, i32* %sum, align 4, !dbg !408
  %conv83 = sitofp i32 %45 to double, !dbg !408
  %46 = load i32, i32* %test_runs, align 4, !dbg !409
  %conv84 = sitofp i32 %46 to double, !dbg !410
  %div85 = fdiv double %conv83, %conv84, !dbg !411
  %call86 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.2, i64 0, i64 0), i32 %43, i32 %44, double %div85), !dbg !412
  ret i32 0, !dbg !413
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #4

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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "visited", scope: !2, file: !3, line: 79, type: !17, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "k-d-tree.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/K-d-tree")
!4 = !{}
!5 = !{!6, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "kd_node_t", file: !3, line: 8, size: 320, elements: !8)
!8 = !{!9, !14, !15}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !7, file: !3, line: 9, baseType: !10, size: 192)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 192, elements: !12)
!11 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!12 = !{!13}
!13 = !DISubrange(count: 3)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "left", scope: !7, file: !3, line: 10, baseType: !6, size: 64, offset: 192)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "right", scope: !7, file: !3, line: 10, baseType: !6, size: 64, offset: 256)
!16 = !{!0}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!22 = distinct !DISubprogram(name: "find_median", scope: !3, file: !3, line: 33, type: !23, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{!6, !6, !6, !17}
!25 = !DILocalVariable(name: "start", arg: 1, scope: !22, file: !3, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 31, scope: !22)
!27 = !DILocalVariable(name: "end", arg: 2, scope: !22, file: !3, line: 33, type: !6)
!28 = !DILocation(line: 33, column: 56, scope: !22)
!29 = !DILocalVariable(name: "idx", arg: 3, scope: !22, file: !3, line: 33, type: !17)
!30 = !DILocation(line: 33, column: 65, scope: !22)
!31 = !DILocation(line: 35, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !3, line: 35, column: 9)
!33 = !DILocation(line: 35, column: 16, scope: !32)
!34 = !DILocation(line: 35, column: 13, scope: !32)
!35 = !DILocation(line: 35, column: 9, scope: !22)
!36 = !{!"if"}
!37 = !DILocation(line: 35, column: 23, scope: !32)
!38 = !DILocation(line: 36, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !22, file: !3, line: 36, column: 9)
!40 = !DILocation(line: 36, column: 16, scope: !39)
!41 = !DILocation(line: 36, column: 22, scope: !39)
!42 = !DILocation(line: 36, column: 13, scope: !39)
!43 = !DILocation(line: 36, column: 9, scope: !22)
!44 = !DILocation(line: 37, column: 16, scope: !39)
!45 = !DILocation(line: 37, column: 9, scope: !39)
!46 = !DILocalVariable(name: "p", scope: !22, file: !3, line: 39, type: !6)
!47 = !DILocation(line: 39, column: 23, scope: !22)
!48 = !DILocalVariable(name: "store", scope: !22, file: !3, line: 39, type: !6)
!49 = !DILocation(line: 39, column: 27, scope: !22)
!50 = !DILocalVariable(name: "md", scope: !22, file: !3, line: 39, type: !6)
!51 = !DILocation(line: 39, column: 35, scope: !22)
!52 = !DILocation(line: 39, column: 40, scope: !22)
!53 = !DILocation(line: 39, column: 49, scope: !22)
!54 = !DILocation(line: 39, column: 55, scope: !22)
!55 = !DILocation(line: 39, column: 53, scope: !22)
!56 = !DILocation(line: 39, column: 62, scope: !22)
!57 = !DILocation(line: 39, column: 46, scope: !22)
!58 = !DILocalVariable(name: "pivot", scope: !22, file: !3, line: 40, type: !11)
!59 = !DILocation(line: 40, column: 12, scope: !22)
!60 = !DILocation(line: 41, column: 5, scope: !22)
!61 = !DILocation(line: 42, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !22, file: !3, line: 41, column: 15)
!63 = !DILocation(line: 42, column: 21, scope: !62)
!64 = !DILocation(line: 42, column: 23, scope: !62)
!65 = !DILocation(line: 42, column: 15, scope: !62)
!66 = !DILocation(line: 44, column: 14, scope: !62)
!67 = !DILocation(line: 44, column: 18, scope: !62)
!68 = !DILocation(line: 44, column: 22, scope: !62)
!69 = !DILocation(line: 44, column: 9, scope: !62)
!70 = !DILocation(line: 45, column: 26, scope: !71)
!71 = distinct !DILexicalBlock(scope: !62, file: !3, line: 45, column: 9)
!72 = !DILocation(line: 45, column: 24, scope: !71)
!73 = !DILocation(line: 45, column: 20, scope: !71)
!74 = !DILocation(line: 45, column: 14, scope: !71)
!75 = !DILocation(line: 45, column: 33, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !3, line: 45, column: 9)
!77 = !DILocation(line: 45, column: 37, scope: !76)
!78 = !DILocation(line: 45, column: 35, scope: !76)
!79 = !DILocation(line: 45, column: 9, scope: !71)
!80 = !DILocation(line: 46, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !3, line: 46, column: 17)
!82 = distinct !DILexicalBlock(scope: !76, file: !3, line: 45, column: 47)
!83 = !DILocation(line: 46, column: 20, scope: !81)
!84 = !DILocation(line: 46, column: 22, scope: !81)
!85 = !DILocation(line: 46, column: 29, scope: !81)
!86 = !DILocation(line: 46, column: 27, scope: !81)
!87 = !DILocation(line: 46, column: 17, scope: !82)
!88 = !DILocation(line: 47, column: 21, scope: !89)
!89 = distinct !DILexicalBlock(scope: !90, file: !3, line: 47, column: 21)
!90 = distinct !DILexicalBlock(scope: !81, file: !3, line: 46, column: 36)
!91 = !DILocation(line: 47, column: 26, scope: !89)
!92 = !DILocation(line: 47, column: 23, scope: !89)
!93 = !DILocation(line: 47, column: 21, scope: !90)
!94 = !DILocation(line: 48, column: 26, scope: !89)
!95 = !DILocation(line: 48, column: 29, scope: !89)
!96 = !DILocation(line: 48, column: 21, scope: !89)
!97 = !DILocation(line: 49, column: 22, scope: !90)
!98 = !DILocation(line: 50, column: 13, scope: !90)
!99 = !DILocation(line: 51, column: 9, scope: !82)
!100 = !DILocation(line: 45, column: 43, scope: !76)
!101 = !DILocation(line: 45, column: 9, scope: !76)
!102 = distinct !{!102, !79, !103}
!103 = !DILocation(line: 51, column: 9, scope: !71)
!104 = !DILocation(line: 52, column: 14, scope: !62)
!105 = !DILocation(line: 52, column: 21, scope: !62)
!106 = !DILocation(line: 52, column: 25, scope: !62)
!107 = !DILocation(line: 52, column: 9, scope: !62)
!108 = !DILocation(line: 55, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !62, file: !3, line: 55, column: 13)
!110 = !DILocation(line: 55, column: 20, scope: !109)
!111 = !DILocation(line: 55, column: 22, scope: !109)
!112 = !DILocation(line: 55, column: 30, scope: !109)
!113 = !DILocation(line: 55, column: 34, scope: !109)
!114 = !DILocation(line: 55, column: 36, scope: !109)
!115 = !DILocation(line: 55, column: 27, scope: !109)
!116 = !DILocation(line: 55, column: 13, scope: !62)
!117 = !DILocation(line: 56, column: 20, scope: !109)
!118 = !DILocation(line: 56, column: 13, scope: !109)
!119 = !DILocation(line: 58, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !62, file: !3, line: 58, column: 13)
!121 = !DILocation(line: 58, column: 21, scope: !120)
!122 = !DILocation(line: 58, column: 19, scope: !120)
!123 = !DILocation(line: 58, column: 13, scope: !62)
!124 = !DILocation(line: 58, column: 31, scope: !120)
!125 = !DILocation(line: 58, column: 29, scope: !120)
!126 = !DILocation(line: 58, column: 25, scope: !120)
!127 = !DILocation(line: 59, column: 29, scope: !120)
!128 = !DILocation(line: 59, column: 27, scope: !120)
!129 = distinct !{!129, !60, !130}
!130 = !DILocation(line: 60, column: 5, scope: !22)
!131 = !DILocation(line: 61, column: 1, scope: !22)
!132 = distinct !DISubprogram(name: "make_tree", scope: !3, file: !3, line: 64, type: !133, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DISubroutineType(types: !134)
!134 = !{!6, !6, !17, !17, !17}
!135 = !DILocalVariable(name: "t", arg: 1, scope: !132, file: !3, line: 64, type: !6)
!136 = !DILocation(line: 64, column: 29, scope: !132)
!137 = !DILocalVariable(name: "len", arg: 2, scope: !132, file: !3, line: 64, type: !17)
!138 = !DILocation(line: 64, column: 36, scope: !132)
!139 = !DILocalVariable(name: "i", arg: 3, scope: !132, file: !3, line: 64, type: !17)
!140 = !DILocation(line: 64, column: 45, scope: !132)
!141 = !DILocalVariable(name: "dim", arg: 4, scope: !132, file: !3, line: 64, type: !17)
!142 = !DILocation(line: 64, column: 52, scope: !132)
!143 = !DILocalVariable(name: "n", scope: !132, file: !3, line: 66, type: !6)
!144 = !DILocation(line: 66, column: 23, scope: !132)
!145 = !DILocation(line: 68, column: 10, scope: !146)
!146 = distinct !DILexicalBlock(scope: !132, file: !3, line: 68, column: 9)
!147 = !DILocation(line: 68, column: 9, scope: !132)
!148 = !DILocation(line: 68, column: 15, scope: !146)
!149 = !DILocation(line: 70, column: 26, scope: !150)
!150 = distinct !DILexicalBlock(scope: !132, file: !3, line: 70, column: 9)
!151 = !DILocation(line: 70, column: 29, scope: !150)
!152 = !DILocation(line: 70, column: 33, scope: !150)
!153 = !DILocation(line: 70, column: 31, scope: !150)
!154 = !DILocation(line: 70, column: 38, scope: !150)
!155 = !DILocation(line: 70, column: 14, scope: !150)
!156 = !DILocation(line: 70, column: 12, scope: !150)
!157 = !DILocation(line: 70, column: 9, scope: !132)
!158 = !DILocation(line: 71, column: 14, scope: !159)
!159 = distinct !DILexicalBlock(scope: !150, file: !3, line: 70, column: 43)
!160 = !DILocation(line: 71, column: 16, scope: !159)
!161 = !DILocation(line: 71, column: 23, scope: !159)
!162 = !DILocation(line: 71, column: 21, scope: !159)
!163 = !DILocation(line: 71, column: 11, scope: !159)
!164 = !DILocation(line: 72, column: 30, scope: !159)
!165 = !DILocation(line: 72, column: 33, scope: !159)
!166 = !DILocation(line: 72, column: 37, scope: !159)
!167 = !DILocation(line: 72, column: 35, scope: !159)
!168 = !DILocation(line: 72, column: 40, scope: !159)
!169 = !DILocation(line: 72, column: 43, scope: !159)
!170 = !DILocation(line: 72, column: 20, scope: !159)
!171 = !DILocation(line: 72, column: 9, scope: !159)
!172 = !DILocation(line: 72, column: 12, scope: !159)
!173 = !DILocation(line: 72, column: 18, scope: !159)
!174 = !DILocation(line: 73, column: 30, scope: !159)
!175 = !DILocation(line: 73, column: 32, scope: !159)
!176 = !DILocation(line: 73, column: 37, scope: !159)
!177 = !DILocation(line: 73, column: 41, scope: !159)
!178 = !DILocation(line: 73, column: 39, scope: !159)
!179 = !DILocation(line: 73, column: 48, scope: !159)
!180 = !DILocation(line: 73, column: 50, scope: !159)
!181 = !DILocation(line: 73, column: 45, scope: !159)
!182 = !DILocation(line: 73, column: 56, scope: !159)
!183 = !DILocation(line: 73, column: 59, scope: !159)
!184 = !DILocation(line: 73, column: 20, scope: !159)
!185 = !DILocation(line: 73, column: 9, scope: !159)
!186 = !DILocation(line: 73, column: 12, scope: !159)
!187 = !DILocation(line: 73, column: 18, scope: !159)
!188 = !DILocation(line: 74, column: 5, scope: !159)
!189 = !DILocation(line: 75, column: 12, scope: !132)
!190 = !DILocation(line: 75, column: 5, scope: !132)
!191 = !DILocation(line: 76, column: 1, scope: !132)
!192 = distinct !DISubprogram(name: "nearest", scope: !3, file: !3, line: 81, type: !193, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!193 = !DISubroutineType(types: !194)
!194 = !{null, !6, !6, !17, !17, !195, !196}
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!197 = !DILocalVariable(name: "root", arg: 1, scope: !192, file: !3, line: 81, type: !6)
!198 = !DILocation(line: 81, column: 32, scope: !192)
!199 = !DILocalVariable(name: "nd", arg: 2, scope: !192, file: !3, line: 81, type: !6)
!200 = !DILocation(line: 81, column: 56, scope: !192)
!201 = !DILocalVariable(name: "i", arg: 3, scope: !192, file: !3, line: 81, type: !17)
!202 = !DILocation(line: 81, column: 64, scope: !192)
!203 = !DILocalVariable(name: "dim", arg: 4, scope: !192, file: !3, line: 81, type: !17)
!204 = !DILocation(line: 81, column: 71, scope: !192)
!205 = !DILocalVariable(name: "best", arg: 5, scope: !192, file: !3, line: 82, type: !195)
!206 = !DILocation(line: 82, column: 28, scope: !192)
!207 = !DILocalVariable(name: "best_dist", arg: 6, scope: !192, file: !3, line: 82, type: !196)
!208 = !DILocation(line: 82, column: 42, scope: !192)
!209 = !DILocalVariable(name: "d", scope: !192, file: !3, line: 84, type: !11)
!210 = !DILocation(line: 84, column: 12, scope: !192)
!211 = !DILocalVariable(name: "dx", scope: !192, file: !3, line: 84, type: !11)
!212 = !DILocation(line: 84, column: 15, scope: !192)
!213 = !DILocalVariable(name: "dx2", scope: !192, file: !3, line: 84, type: !11)
!214 = !DILocation(line: 84, column: 19, scope: !192)
!215 = !DILocation(line: 86, column: 10, scope: !216)
!216 = distinct !DILexicalBlock(scope: !192, file: !3, line: 86, column: 9)
!217 = !DILocation(line: 86, column: 9, scope: !192)
!218 = !DILocation(line: 86, column: 16, scope: !216)
!219 = !DILocation(line: 87, column: 14, scope: !192)
!220 = !DILocation(line: 87, column: 20, scope: !192)
!221 = !DILocation(line: 87, column: 24, scope: !192)
!222 = !DILocation(line: 87, column: 9, scope: !192)
!223 = !DILocation(line: 87, column: 7, scope: !192)
!224 = !DILocation(line: 88, column: 10, scope: !192)
!225 = !DILocation(line: 88, column: 16, scope: !192)
!226 = !DILocation(line: 88, column: 18, scope: !192)
!227 = !DILocation(line: 88, column: 23, scope: !192)
!228 = !DILocation(line: 88, column: 27, scope: !192)
!229 = !DILocation(line: 88, column: 29, scope: !192)
!230 = !DILocation(line: 88, column: 21, scope: !192)
!231 = !DILocation(line: 88, column: 8, scope: !192)
!232 = !DILocation(line: 89, column: 11, scope: !192)
!233 = !DILocation(line: 89, column: 16, scope: !192)
!234 = !DILocation(line: 89, column: 14, scope: !192)
!235 = !DILocation(line: 89, column: 9, scope: !192)
!236 = !DILocation(line: 91, column: 13, scope: !192)
!237 = !DILocation(line: 93, column: 11, scope: !238)
!238 = distinct !DILexicalBlock(scope: !192, file: !3, line: 93, column: 9)
!239 = !DILocation(line: 93, column: 10, scope: !238)
!240 = !DILocation(line: 93, column: 16, scope: !238)
!241 = !DILocation(line: 93, column: 19, scope: !238)
!242 = !DILocation(line: 93, column: 24, scope: !238)
!243 = !DILocation(line: 93, column: 23, scope: !238)
!244 = !DILocation(line: 93, column: 21, scope: !238)
!245 = !DILocation(line: 93, column: 9, scope: !192)
!246 = !DILocation(line: 94, column: 22, scope: !247)
!247 = distinct !DILexicalBlock(scope: !238, file: !3, line: 93, column: 35)
!248 = !DILocation(line: 94, column: 10, scope: !247)
!249 = !DILocation(line: 94, column: 20, scope: !247)
!250 = !DILocation(line: 95, column: 17, scope: !247)
!251 = !DILocation(line: 95, column: 10, scope: !247)
!252 = !DILocation(line: 95, column: 15, scope: !247)
!253 = !DILocation(line: 96, column: 5, scope: !247)
!254 = !DILocation(line: 99, column: 11, scope: !255)
!255 = distinct !DILexicalBlock(scope: !192, file: !3, line: 99, column: 9)
!256 = !DILocation(line: 99, column: 10, scope: !255)
!257 = !DILocation(line: 99, column: 9, scope: !192)
!258 = !DILocation(line: 99, column: 22, scope: !255)
!259 = !DILocation(line: 101, column: 9, scope: !260)
!260 = distinct !DILexicalBlock(scope: !192, file: !3, line: 101, column: 9)
!261 = !DILocation(line: 101, column: 16, scope: !260)
!262 = !DILocation(line: 101, column: 13, scope: !260)
!263 = !DILocation(line: 101, column: 9, scope: !192)
!264 = !DILocation(line: 101, column: 23, scope: !260)
!265 = !DILocation(line: 101, column: 21, scope: !260)
!266 = !DILocation(line: 103, column: 13, scope: !192)
!267 = !DILocation(line: 103, column: 16, scope: !192)
!268 = !DILocation(line: 103, column: 22, scope: !192)
!269 = !DILocation(line: 103, column: 28, scope: !192)
!270 = !DILocation(line: 103, column: 35, scope: !192)
!271 = !DILocation(line: 103, column: 41, scope: !192)
!272 = !DILocation(line: 103, column: 48, scope: !192)
!273 = !DILocation(line: 103, column: 52, scope: !192)
!274 = !DILocation(line: 103, column: 55, scope: !192)
!275 = !DILocation(line: 103, column: 60, scope: !192)
!276 = !DILocation(line: 103, column: 66, scope: !192)
!277 = !DILocation(line: 103, column: 5, scope: !192)
!278 = !DILocation(line: 104, column: 9, scope: !279)
!279 = distinct !DILexicalBlock(scope: !192, file: !3, line: 104, column: 9)
!280 = !DILocation(line: 104, column: 17, scope: !279)
!281 = !DILocation(line: 104, column: 16, scope: !279)
!282 = !DILocation(line: 104, column: 13, scope: !279)
!283 = !DILocation(line: 104, column: 9, scope: !192)
!284 = !DILocation(line: 104, column: 28, scope: !279)
!285 = !DILocation(line: 105, column: 13, scope: !192)
!286 = !DILocation(line: 105, column: 16, scope: !192)
!287 = !DILocation(line: 105, column: 22, scope: !192)
!288 = !DILocation(line: 105, column: 28, scope: !192)
!289 = !DILocation(line: 105, column: 36, scope: !192)
!290 = !DILocation(line: 105, column: 42, scope: !192)
!291 = !DILocation(line: 105, column: 48, scope: !192)
!292 = !DILocation(line: 105, column: 52, scope: !192)
!293 = !DILocation(line: 105, column: 55, scope: !192)
!294 = !DILocation(line: 105, column: 60, scope: !192)
!295 = !DILocation(line: 105, column: 66, scope: !192)
!296 = !DILocation(line: 105, column: 5, scope: !192)
!297 = !DILocation(line: 106, column: 1, scope: !192)
!298 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 111, type: !299, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!299 = !DISubroutineType(types: !300)
!300 = !{!17}
!301 = !DILocalVariable(name: "i", scope: !298, file: !3, line: 113, type: !17)
!302 = !DILocation(line: 113, column: 9, scope: !298)
!303 = !DILocalVariable(name: "wp", scope: !298, file: !3, line: 114, type: !304)
!304 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1920, elements: !305)
!305 = !{!306}
!306 = !DISubrange(count: 6)
!307 = !DILocation(line: 114, column: 22, scope: !298)
!308 = !DILocalVariable(name: "testNode", scope: !298, file: !3, line: 117, type: !7)
!309 = !DILocation(line: 117, column: 22, scope: !298)
!310 = !DILocalVariable(name: "root", scope: !298, file: !3, line: 118, type: !6)
!311 = !DILocation(line: 118, column: 23, scope: !298)
!312 = !DILocalVariable(name: "found", scope: !298, file: !3, line: 118, type: !6)
!313 = !DILocation(line: 118, column: 30, scope: !298)
!314 = !DILocalVariable(name: "million", scope: !298, file: !3, line: 118, type: !6)
!315 = !DILocation(line: 118, column: 38, scope: !298)
!316 = !DILocalVariable(name: "best_dist", scope: !298, file: !3, line: 119, type: !11)
!317 = !DILocation(line: 119, column: 12, scope: !298)
!318 = !DILocation(line: 121, column: 22, scope: !298)
!319 = !DILocation(line: 121, column: 12, scope: !298)
!320 = !DILocation(line: 121, column: 10, scope: !298)
!321 = !DILocation(line: 123, column: 13, scope: !298)
!322 = !DILocation(line: 124, column: 11, scope: !298)
!323 = !DILocation(line: 125, column: 13, scope: !298)
!324 = !DILocation(line: 125, column: 5, scope: !298)
!325 = !DILocation(line: 129, column: 22, scope: !298)
!326 = !DILocation(line: 129, column: 13, scope: !298)
!327 = !DILocation(line: 129, column: 37, scope: !298)
!328 = !DILocation(line: 129, column: 28, scope: !298)
!329 = !DILocation(line: 130, column: 13, scope: !298)
!330 = !DILocation(line: 130, column: 20, scope: !298)
!331 = !DILocation(line: 130, column: 26, scope: !298)
!332 = !DILocation(line: 130, column: 33, scope: !298)
!333 = !DILocation(line: 130, column: 44, scope: !298)
!334 = !DILocation(line: 130, column: 39, scope: !298)
!335 = !DILocation(line: 130, column: 56, scope: !298)
!336 = !DILocation(line: 127, column: 5, scope: !298)
!337 = !DILocation(line: 132, column: 34, scope: !298)
!338 = !DILocation(line: 132, column: 14, scope: !298)
!339 = !DILocation(line: 132, column: 13, scope: !298)
!340 = !DILocation(line: 133, column: 11, scope: !298)
!341 = !DILocation(line: 133, column: 5, scope: !298)
!342 = !DILocation(line: 134, column: 12, scope: !343)
!343 = distinct !DILexicalBlock(scope: !298, file: !3, line: 134, column: 5)
!344 = !DILocation(line: 134, column: 10, scope: !343)
!345 = !DILocation(line: 134, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !343, file: !3, line: 134, column: 5)
!347 = !DILocation(line: 134, column: 19, scope: !346)
!348 = !DILocation(line: 134, column: 5, scope: !343)
!349 = !DILocation(line: 134, column: 29, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !3, line: 134, column: 29)
!351 = !DILocation(line: 134, column: 25, scope: !346)
!352 = !DILocation(line: 134, column: 5, scope: !346)
!353 = distinct !{!353, !348, !354}
!354 = !DILocation(line: 134, column: 29, scope: !343)
!355 = !DILocation(line: 136, column: 22, scope: !298)
!356 = !DILocation(line: 136, column: 12, scope: !298)
!357 = !DILocation(line: 136, column: 10, scope: !298)
!358 = !DILocation(line: 137, column: 5, scope: !359)
!359 = distinct !DILexicalBlock(scope: !298, file: !3, line: 137, column: 5)
!360 = !DILocation(line: 139, column: 13, scope: !298)
!361 = !DILocation(line: 140, column: 11, scope: !298)
!362 = !DILocation(line: 141, column: 13, scope: !298)
!363 = !DILocation(line: 141, column: 5, scope: !298)
!364 = !DILocation(line: 145, column: 22, scope: !298)
!365 = !DILocation(line: 145, column: 13, scope: !298)
!366 = !DILocation(line: 145, column: 37, scope: !298)
!367 = !DILocation(line: 145, column: 28, scope: !298)
!368 = !DILocation(line: 145, column: 52, scope: !298)
!369 = !DILocation(line: 145, column: 43, scope: !298)
!370 = !DILocation(line: 146, column: 13, scope: !298)
!371 = !DILocation(line: 146, column: 20, scope: !298)
!372 = !DILocation(line: 146, column: 26, scope: !298)
!373 = !DILocation(line: 146, column: 33, scope: !298)
!374 = !DILocation(line: 146, column: 39, scope: !298)
!375 = !DILocation(line: 146, column: 46, scope: !298)
!376 = !DILocation(line: 147, column: 18, scope: !298)
!377 = !DILocation(line: 147, column: 13, scope: !298)
!378 = !DILocation(line: 147, column: 30, scope: !298)
!379 = !DILocation(line: 143, column: 5, scope: !298)
!380 = !DILocalVariable(name: "sum", scope: !298, file: !3, line: 158, type: !17)
!381 = !DILocation(line: 158, column: 9, scope: !298)
!382 = !DILocalVariable(name: "test_runs", scope: !298, file: !3, line: 158, type: !17)
!383 = !DILocation(line: 158, column: 18, scope: !298)
!384 = !DILocation(line: 159, column: 12, scope: !385)
!385 = distinct !DILexicalBlock(scope: !298, file: !3, line: 159, column: 5)
!386 = !DILocation(line: 159, column: 10, scope: !385)
!387 = !DILocation(line: 159, column: 17, scope: !388)
!388 = distinct !DILexicalBlock(scope: !385, file: !3, line: 159, column: 5)
!389 = !DILocation(line: 159, column: 21, scope: !388)
!390 = !DILocation(line: 159, column: 19, scope: !388)
!391 = !DILocation(line: 159, column: 5, scope: !385)
!392 = !DILocation(line: 160, column: 15, scope: !393)
!393 = distinct !DILexicalBlock(scope: !388, file: !3, line: 159, column: 37)
!394 = !DILocation(line: 161, column: 17, scope: !393)
!395 = !DILocation(line: 162, column: 9, scope: !396)
!396 = distinct !DILexicalBlock(scope: !393, file: !3, line: 162, column: 9)
!397 = !DILocation(line: 163, column: 17, scope: !393)
!398 = !DILocation(line: 163, column: 9, scope: !393)
!399 = !DILocation(line: 164, column: 16, scope: !393)
!400 = !DILocation(line: 164, column: 13, scope: !393)
!401 = !DILocation(line: 165, column: 5, scope: !393)
!402 = !DILocation(line: 159, column: 33, scope: !388)
!403 = !DILocation(line: 159, column: 5, scope: !388)
!404 = distinct !{!404, !391, !405}
!405 = !DILocation(line: 165, column: 5, scope: !385)
!406 = !DILocation(line: 168, column: 13, scope: !298)
!407 = !DILocation(line: 168, column: 18, scope: !298)
!408 = !DILocation(line: 168, column: 29, scope: !298)
!409 = !DILocation(line: 168, column: 41, scope: !298)
!410 = !DILocation(line: 168, column: 33, scope: !298)
!411 = !DILocation(line: 168, column: 32, scope: !298)
!412 = !DILocation(line: 166, column: 5, scope: !298)
!413 = !DILocation(line: 172, column: 5, scope: !298)
