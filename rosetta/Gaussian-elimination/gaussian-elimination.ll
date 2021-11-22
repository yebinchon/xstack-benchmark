; ModuleID = 'gaussian-elimination.c'
source_filename = "gaussian-elimination.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.a = private unnamed_addr constant [36 x double] [double 1.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 1.000000e+00, double 6.300000e-01, double 3.900000e-01, double 2.500000e-01, double 1.600000e-01, double 1.000000e-01, double 1.000000e+00, double 1.260000e+00, double 1.580000e+00, double 1.980000e+00, double 2.490000e+00, double 3.130000e+00, double 1.000000e+00, double 1.880000e+00, double 3.550000e+00, double 6.700000e+00, double 1.262000e+01, double 2.380000e+01, double 1.000000e+00, double 2.510000e+00, double 6.320000e+00, double 1.588000e+01, double 3.990000e+01, double 1.002800e+02, double 1.000000e+00, double 3.140000e+00, double 0x4023BD70A3D70A3D, double 3.101000e+01, double 0x40585A3D70A3D70A, double 3.060200e+02], align 16
@.str = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @swap_row(double* %a, double* %b, i32 %r1, i32 %r2, i32 %n) #0 !dbg !7 {
entry:
  %a.addr = alloca double*, align 8
  %b.addr = alloca double*, align 8
  %r1.addr = alloca i32, align 4
  %r2.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %tmp = alloca double, align 8
  %p1 = alloca double*, align 8
  %p2 = alloca double*, align 8
  %i = alloca i32, align 4
  store double* %a, double** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double** %a.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store double* %b, double** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double** %b.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %r1, i32* %r1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %r1.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 %r2, i32* %r2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %r2.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata double* %tmp, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata double** %p1, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata double** %p2, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* %r1.addr, align 4, !dbg !31
  %1 = load i32, i32* %r2.addr, align 4, !dbg !33
  %cmp = icmp eq i32 %0, %1, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35, !cf.info !36

if.then:                                          ; preds = %entry
  br label %return, !dbg !37

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !41
  %3 = load i32, i32* %n.addr, align 4, !dbg !43
  %cmp1 = icmp slt i32 %2, %3, !dbg !44
  br i1 %cmp1, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %4 = load double*, double** %a.addr, align 8, !dbg !46
  %5 = load i32, i32* %r1.addr, align 4, !dbg !46
  %6 = load i32, i32* %n.addr, align 4, !dbg !46
  %mul = mul nsw i32 %5, %6, !dbg !46
  %7 = load i32, i32* %i, align 4, !dbg !46
  %add = add nsw i32 %mul, %7, !dbg !46
  %idx.ext = sext i32 %add to i64, !dbg !46
  %add.ptr = getelementptr inbounds double, double* %4, i64 %idx.ext, !dbg !46
  store double* %add.ptr, double** %p1, align 8, !dbg !48
  %8 = load double*, double** %a.addr, align 8, !dbg !49
  %9 = load i32, i32* %r2.addr, align 4, !dbg !49
  %10 = load i32, i32* %n.addr, align 4, !dbg !49
  %mul2 = mul nsw i32 %9, %10, !dbg !49
  %11 = load i32, i32* %i, align 4, !dbg !49
  %add3 = add nsw i32 %mul2, %11, !dbg !49
  %idx.ext4 = sext i32 %add3 to i64, !dbg !49
  %add.ptr5 = getelementptr inbounds double, double* %8, i64 %idx.ext4, !dbg !49
  store double* %add.ptr5, double** %p2, align 8, !dbg !50
  %12 = load double*, double** %p1, align 8, !dbg !51
  %13 = load double, double* %12, align 8, !dbg !52
  store double %13, double* %tmp, align 8, !dbg !53
  %14 = load double*, double** %p2, align 8, !dbg !54
  %15 = load double, double* %14, align 8, !dbg !55
  %16 = load double*, double** %p1, align 8, !dbg !56
  store double %15, double* %16, align 8, !dbg !57
  %17 = load double, double* %tmp, align 8, !dbg !58
  %18 = load double*, double** %p2, align 8, !dbg !59
  store double %17, double* %18, align 8, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !62
  %inc = add nsw i32 %19, 1, !dbg !62
  store i32 %inc, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %20 = load double*, double** %b.addr, align 8, !dbg !66
  %21 = load i32, i32* %r1.addr, align 4, !dbg !67
  %idxprom = sext i32 %21 to i64, !dbg !66
  %arrayidx = getelementptr inbounds double, double* %20, i64 %idxprom, !dbg !66
  %22 = load double, double* %arrayidx, align 8, !dbg !66
  store double %22, double* %tmp, align 8, !dbg !68
  %23 = load double*, double** %b.addr, align 8, !dbg !69
  %24 = load i32, i32* %r2.addr, align 4, !dbg !70
  %idxprom6 = sext i32 %24 to i64, !dbg !69
  %arrayidx7 = getelementptr inbounds double, double* %23, i64 %idxprom6, !dbg !69
  %25 = load double, double* %arrayidx7, align 8, !dbg !69
  %26 = load double*, double** %b.addr, align 8, !dbg !71
  %27 = load i32, i32* %r1.addr, align 4, !dbg !72
  %idxprom8 = sext i32 %27 to i64, !dbg !71
  %arrayidx9 = getelementptr inbounds double, double* %26, i64 %idxprom8, !dbg !71
  store double %25, double* %arrayidx9, align 8, !dbg !73
  %28 = load double, double* %tmp, align 8, !dbg !74
  %29 = load double*, double** %b.addr, align 8, !dbg !75
  %30 = load i32, i32* %r2.addr, align 4, !dbg !76
  %idxprom10 = sext i32 %30 to i64, !dbg !75
  %arrayidx11 = getelementptr inbounds double, double* %29, i64 %idxprom10, !dbg !75
  store double %28, double* %arrayidx11, align 8, !dbg !77
  br label %return, !dbg !78

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !78
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @gauss_eliminate(double* %a, double* %b, double* %x, i32 %n) #0 !dbg !79 {
entry:
  %a.addr = alloca double*, align 8
  %b.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %col = alloca i32, align 4
  %row = alloca i32, align 4
  %max_row = alloca i32, align 4
  %dia = alloca i32, align 4
  %max = alloca double, align 8
  %tmp = alloca double, align 8
  store double* %a, double** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double** %a.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store double* %b, double** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double** %b.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32* %i, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32* %j, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i32* %col, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32* %row, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32* %max_row, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %dia, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata double* %max, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata double* %tmp, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 0, i32* %dia, align 4, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc49, %entry
  %0 = load i32, i32* %dia, align 4, !dbg !109
  %1 = load i32, i32* %n.addr, align 4, !dbg !111
  %cmp = icmp slt i32 %0, %1, !dbg !112
  br i1 %cmp, label %for.body, label %for.end51, !dbg !113

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %dia, align 4, !dbg !114
  store i32 %2, i32* %max_row, align 4, !dbg !116
  %3 = load double*, double** %a.addr, align 8, !dbg !117
  %4 = load i32, i32* %dia, align 4, !dbg !117
  %5 = load i32, i32* %n.addr, align 4, !dbg !117
  %mul = mul nsw i32 %4, %5, !dbg !117
  %6 = load i32, i32* %dia, align 4, !dbg !117
  %add = add nsw i32 %mul, %6, !dbg !117
  %idx.ext = sext i32 %add to i64, !dbg !117
  %add.ptr = getelementptr inbounds double, double* %3, i64 %idx.ext, !dbg !117
  %7 = load double, double* %add.ptr, align 8, !dbg !117
  store double %7, double* %max, align 8, !dbg !118
  %8 = load i32, i32* %dia, align 4, !dbg !119
  %add1 = add nsw i32 %8, 1, !dbg !121
  store i32 %add1, i32* %row, align 4, !dbg !122
  br label %for.cond2, !dbg !123

for.cond2:                                        ; preds = %for.inc, %for.body
  %9 = load i32, i32* %row, align 4, !dbg !124
  %10 = load i32, i32* %n.addr, align 4, !dbg !126
  %cmp3 = icmp slt i32 %9, %10, !dbg !127
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !128

for.body4:                                        ; preds = %for.cond2
  %11 = load double*, double** %a.addr, align 8, !dbg !129
  %12 = load i32, i32* %row, align 4, !dbg !129
  %13 = load i32, i32* %n.addr, align 4, !dbg !129
  %mul5 = mul nsw i32 %12, %13, !dbg !129
  %14 = load i32, i32* %dia, align 4, !dbg !129
  %add6 = add nsw i32 %mul5, %14, !dbg !129
  %idx.ext7 = sext i32 %add6 to i64, !dbg !129
  %add.ptr8 = getelementptr inbounds double, double* %11, i64 %idx.ext7, !dbg !129
  %15 = load double, double* %add.ptr8, align 8, !dbg !129
  %16 = call double @llvm.fabs.f64(double %15), !dbg !131
  store double %16, double* %tmp, align 8, !dbg !132
  %17 = load double, double* %max, align 8, !dbg !133
  %cmp9 = fcmp ogt double %16, %17, !dbg !134
  br i1 %cmp9, label %if.then, label %if.end, !dbg !135, !cf.info !36

if.then:                                          ; preds = %for.body4
  %18 = load i32, i32* %row, align 4, !dbg !136
  store i32 %18, i32* %max_row, align 4, !dbg !137
  %19 = load double, double* %tmp, align 8, !dbg !138
  store double %19, double* %max, align 8, !dbg !139
  br label %if.end, !dbg !140

if.end:                                           ; preds = %if.then, %for.body4
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %if.end
  %20 = load i32, i32* %row, align 4, !dbg !141
  %inc = add nsw i32 %20, 1, !dbg !141
  store i32 %inc, i32* %row, align 4, !dbg !141
  br label %for.cond2, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond2
  %21 = load double*, double** %a.addr, align 8, !dbg !145
  %22 = load double*, double** %b.addr, align 8, !dbg !146
  %23 = load i32, i32* %dia, align 4, !dbg !147
  %24 = load i32, i32* %max_row, align 4, !dbg !148
  %25 = load i32, i32* %n.addr, align 4, !dbg !149
  call void @swap_row(double* %21, double* %22, i32 %23, i32 %24, i32 %25), !dbg !150
  %26 = load i32, i32* %dia, align 4, !dbg !151
  %add10 = add nsw i32 %26, 1, !dbg !153
  store i32 %add10, i32* %row, align 4, !dbg !154
  br label %for.cond11, !dbg !155

for.cond11:                                       ; preds = %for.inc46, %for.end
  %27 = load i32, i32* %row, align 4, !dbg !156
  %28 = load i32, i32* %n.addr, align 4, !dbg !158
  %cmp12 = icmp slt i32 %27, %28, !dbg !159
  br i1 %cmp12, label %for.body13, label %for.end48, !dbg !160

for.body13:                                       ; preds = %for.cond11
  %29 = load double*, double** %a.addr, align 8, !dbg !161
  %30 = load i32, i32* %row, align 4, !dbg !161
  %31 = load i32, i32* %n.addr, align 4, !dbg !161
  %mul14 = mul nsw i32 %30, %31, !dbg !161
  %32 = load i32, i32* %dia, align 4, !dbg !161
  %add15 = add nsw i32 %mul14, %32, !dbg !161
  %idx.ext16 = sext i32 %add15 to i64, !dbg !161
  %add.ptr17 = getelementptr inbounds double, double* %29, i64 %idx.ext16, !dbg !161
  %33 = load double, double* %add.ptr17, align 8, !dbg !161
  %34 = load double*, double** %a.addr, align 8, !dbg !163
  %35 = load i32, i32* %dia, align 4, !dbg !163
  %36 = load i32, i32* %n.addr, align 4, !dbg !163
  %mul18 = mul nsw i32 %35, %36, !dbg !163
  %37 = load i32, i32* %dia, align 4, !dbg !163
  %add19 = add nsw i32 %mul18, %37, !dbg !163
  %idx.ext20 = sext i32 %add19 to i64, !dbg !163
  %add.ptr21 = getelementptr inbounds double, double* %34, i64 %idx.ext20, !dbg !163
  %38 = load double, double* %add.ptr21, align 8, !dbg !163
  %div = fdiv double %33, %38, !dbg !164
  store double %div, double* %tmp, align 8, !dbg !165
  %39 = load i32, i32* %dia, align 4, !dbg !166
  %add22 = add nsw i32 %39, 1, !dbg !168
  store i32 %add22, i32* %col, align 4, !dbg !169
  br label %for.cond23, !dbg !170

for.cond23:                                       ; preds = %for.inc35, %for.body13
  %40 = load i32, i32* %col, align 4, !dbg !171
  %41 = load i32, i32* %n.addr, align 4, !dbg !173
  %cmp24 = icmp slt i32 %40, %41, !dbg !174
  br i1 %cmp24, label %for.body25, label %for.end37, !dbg !175

for.body25:                                       ; preds = %for.cond23
  %42 = load double, double* %tmp, align 8, !dbg !176
  %43 = load double*, double** %a.addr, align 8, !dbg !177
  %44 = load i32, i32* %dia, align 4, !dbg !177
  %45 = load i32, i32* %n.addr, align 4, !dbg !177
  %mul26 = mul nsw i32 %44, %45, !dbg !177
  %46 = load i32, i32* %col, align 4, !dbg !177
  %add27 = add nsw i32 %mul26, %46, !dbg !177
  %idx.ext28 = sext i32 %add27 to i64, !dbg !177
  %add.ptr29 = getelementptr inbounds double, double* %43, i64 %idx.ext28, !dbg !177
  %47 = load double, double* %add.ptr29, align 8, !dbg !177
  %mul30 = fmul double %42, %47, !dbg !178
  %48 = load double*, double** %a.addr, align 8, !dbg !179
  %49 = load i32, i32* %row, align 4, !dbg !179
  %50 = load i32, i32* %n.addr, align 4, !dbg !179
  %mul31 = mul nsw i32 %49, %50, !dbg !179
  %51 = load i32, i32* %col, align 4, !dbg !179
  %add32 = add nsw i32 %mul31, %51, !dbg !179
  %idx.ext33 = sext i32 %add32 to i64, !dbg !179
  %add.ptr34 = getelementptr inbounds double, double* %48, i64 %idx.ext33, !dbg !179
  %52 = load double, double* %add.ptr34, align 8, !dbg !180
  %sub = fsub double %52, %mul30, !dbg !180
  store double %sub, double* %add.ptr34, align 8, !dbg !180
  br label %for.inc35, !dbg !179

for.inc35:                                        ; preds = %for.body25
  %53 = load i32, i32* %col, align 4, !dbg !181
  %inc36 = add nsw i32 %53, 1, !dbg !181
  store i32 %inc36, i32* %col, align 4, !dbg !181
  br label %for.cond23, !dbg !182, !llvm.loop !183

for.end37:                                        ; preds = %for.cond23
  %54 = load double*, double** %a.addr, align 8, !dbg !185
  %55 = load i32, i32* %row, align 4, !dbg !185
  %56 = load i32, i32* %n.addr, align 4, !dbg !185
  %mul38 = mul nsw i32 %55, %56, !dbg !185
  %57 = load i32, i32* %dia, align 4, !dbg !185
  %add39 = add nsw i32 %mul38, %57, !dbg !185
  %idx.ext40 = sext i32 %add39 to i64, !dbg !185
  %add.ptr41 = getelementptr inbounds double, double* %54, i64 %idx.ext40, !dbg !185
  store double 0.000000e+00, double* %add.ptr41, align 8, !dbg !186
  %58 = load double, double* %tmp, align 8, !dbg !187
  %59 = load double*, double** %b.addr, align 8, !dbg !188
  %60 = load i32, i32* %dia, align 4, !dbg !189
  %idxprom = sext i32 %60 to i64, !dbg !188
  %arrayidx = getelementptr inbounds double, double* %59, i64 %idxprom, !dbg !188
  %61 = load double, double* %arrayidx, align 8, !dbg !188
  %mul42 = fmul double %58, %61, !dbg !190
  %62 = load double*, double** %b.addr, align 8, !dbg !191
  %63 = load i32, i32* %row, align 4, !dbg !192
  %idxprom43 = sext i32 %63 to i64, !dbg !191
  %arrayidx44 = getelementptr inbounds double, double* %62, i64 %idxprom43, !dbg !191
  %64 = load double, double* %arrayidx44, align 8, !dbg !193
  %sub45 = fsub double %64, %mul42, !dbg !193
  store double %sub45, double* %arrayidx44, align 8, !dbg !193
  br label %for.inc46, !dbg !194

for.inc46:                                        ; preds = %for.end37
  %65 = load i32, i32* %row, align 4, !dbg !195
  %inc47 = add nsw i32 %65, 1, !dbg !195
  store i32 %inc47, i32* %row, align 4, !dbg !195
  br label %for.cond11, !dbg !196, !llvm.loop !197

for.end48:                                        ; preds = %for.cond11
  br label %for.inc49, !dbg !199

for.inc49:                                        ; preds = %for.end48
  %66 = load i32, i32* %dia, align 4, !dbg !200
  %inc50 = add nsw i32 %66, 1, !dbg !200
  store i32 %inc50, i32* %dia, align 4, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end51:                                        ; preds = %for.cond
  %67 = load i32, i32* %n.addr, align 4, !dbg !204
  %sub52 = sub nsw i32 %67, 1, !dbg !206
  store i32 %sub52, i32* %row, align 4, !dbg !207
  br label %for.cond53, !dbg !208

for.cond53:                                       ; preds = %for.inc79, %for.end51
  %68 = load i32, i32* %row, align 4, !dbg !209
  %cmp54 = icmp sge i32 %68, 0, !dbg !211
  br i1 %cmp54, label %for.body55, label %for.end81, !dbg !212

for.body55:                                       ; preds = %for.cond53
  %69 = load double*, double** %b.addr, align 8, !dbg !213
  %70 = load i32, i32* %row, align 4, !dbg !215
  %idxprom56 = sext i32 %70 to i64, !dbg !213
  %arrayidx57 = getelementptr inbounds double, double* %69, i64 %idxprom56, !dbg !213
  %71 = load double, double* %arrayidx57, align 8, !dbg !213
  store double %71, double* %tmp, align 8, !dbg !216
  %72 = load i32, i32* %n.addr, align 4, !dbg !217
  %sub58 = sub nsw i32 %72, 1, !dbg !219
  store i32 %sub58, i32* %j, align 4, !dbg !220
  br label %for.cond59, !dbg !221

for.cond59:                                       ; preds = %for.inc70, %for.body55
  %73 = load i32, i32* %j, align 4, !dbg !222
  %74 = load i32, i32* %row, align 4, !dbg !224
  %cmp60 = icmp sgt i32 %73, %74, !dbg !225
  br i1 %cmp60, label %for.body61, label %for.end71, !dbg !226

for.body61:                                       ; preds = %for.cond59
  %75 = load double*, double** %x.addr, align 8, !dbg !227
  %76 = load i32, i32* %j, align 4, !dbg !228
  %idxprom62 = sext i32 %76 to i64, !dbg !227
  %arrayidx63 = getelementptr inbounds double, double* %75, i64 %idxprom62, !dbg !227
  %77 = load double, double* %arrayidx63, align 8, !dbg !227
  %78 = load double*, double** %a.addr, align 8, !dbg !229
  %79 = load i32, i32* %row, align 4, !dbg !229
  %80 = load i32, i32* %n.addr, align 4, !dbg !229
  %mul64 = mul nsw i32 %79, %80, !dbg !229
  %81 = load i32, i32* %j, align 4, !dbg !229
  %add65 = add nsw i32 %mul64, %81, !dbg !229
  %idx.ext66 = sext i32 %add65 to i64, !dbg !229
  %add.ptr67 = getelementptr inbounds double, double* %78, i64 %idx.ext66, !dbg !229
  %82 = load double, double* %add.ptr67, align 8, !dbg !229
  %mul68 = fmul double %77, %82, !dbg !230
  %83 = load double, double* %tmp, align 8, !dbg !231
  %sub69 = fsub double %83, %mul68, !dbg !231
  store double %sub69, double* %tmp, align 8, !dbg !231
  br label %for.inc70, !dbg !232

for.inc70:                                        ; preds = %for.body61
  %84 = load i32, i32* %j, align 4, !dbg !233
  %dec = add nsw i32 %84, -1, !dbg !233
  store i32 %dec, i32* %j, align 4, !dbg !233
  br label %for.cond59, !dbg !234, !llvm.loop !235

for.end71:                                        ; preds = %for.cond59
  %85 = load double, double* %tmp, align 8, !dbg !237
  %86 = load double*, double** %a.addr, align 8, !dbg !238
  %87 = load i32, i32* %row, align 4, !dbg !238
  %88 = load i32, i32* %n.addr, align 4, !dbg !238
  %mul72 = mul nsw i32 %87, %88, !dbg !238
  %89 = load i32, i32* %row, align 4, !dbg !238
  %add73 = add nsw i32 %mul72, %89, !dbg !238
  %idx.ext74 = sext i32 %add73 to i64, !dbg !238
  %add.ptr75 = getelementptr inbounds double, double* %86, i64 %idx.ext74, !dbg !238
  %90 = load double, double* %add.ptr75, align 8, !dbg !238
  %div76 = fdiv double %85, %90, !dbg !239
  %91 = load double*, double** %x.addr, align 8, !dbg !240
  %92 = load i32, i32* %row, align 4, !dbg !241
  %idxprom77 = sext i32 %92 to i64, !dbg !240
  %arrayidx78 = getelementptr inbounds double, double* %91, i64 %idxprom77, !dbg !240
  store double %div76, double* %arrayidx78, align 8, !dbg !242
  br label %for.inc79, !dbg !243

for.inc79:                                        ; preds = %for.end71
  %93 = load i32, i32* %row, align 4, !dbg !244
  %dec80 = add nsw i32 %93, -1, !dbg !244
  store i32 %dec80, i32* %row, align 4, !dbg !244
  br label %for.cond53, !dbg !245, !llvm.loop !246

for.end81:                                        ; preds = %for.cond53
  ret void, !dbg !248
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !249 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [36 x double], align 16
  %b = alloca [6 x double], align 16
  %x = alloca [6 x double], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [36 x double]* %a, metadata !252, metadata !DIExpression()), !dbg !256
  %0 = bitcast [36 x double]* %a to i8*, !dbg !256
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([36 x double]* @__const.main.a to i8*), i64 288, i1 false), !dbg !256
  call void @llvm.dbg.declare(metadata [6 x double]* %b, metadata !257, metadata !DIExpression()), !dbg !261
  %1 = bitcast [6 x double]* %b to i8*, !dbg !261
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 48, i1 false), !dbg !261
  %2 = bitcast i8* %1 to [6 x double]*, !dbg !261
  %3 = getelementptr inbounds [6 x double], [6 x double]* %2, i32 0, i32 0, !dbg !261
  store double -1.000000e-02, double* %3, align 16, !dbg !261
  %4 = getelementptr inbounds [6 x double], [6 x double]* %2, i32 0, i32 1, !dbg !261
  store double 6.100000e-01, double* %4, align 8, !dbg !261
  %5 = getelementptr inbounds [6 x double], [6 x double]* %2, i32 0, i32 2, !dbg !261
  store double 9.100000e-01, double* %5, align 16, !dbg !261
  %6 = getelementptr inbounds [6 x double], [6 x double]* %2, i32 0, i32 3, !dbg !261
  store double 0x3FEFAE147AE147AE, double* %6, align 8, !dbg !261
  %7 = getelementptr inbounds [6 x double], [6 x double]* %2, i32 0, i32 4, !dbg !261
  store double 6.000000e-01, double* %7, align 16, !dbg !261
  %8 = getelementptr inbounds [6 x double], [6 x double]* %2, i32 0, i32 5, !dbg !261
  store double 2.000000e-02, double* %8, align 8, !dbg !261
  call void @llvm.dbg.declare(metadata [6 x double]* %x, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata i32* %i, metadata !264, metadata !DIExpression()), !dbg !265
  %arraydecay = getelementptr inbounds [36 x double], [36 x double]* %a, i64 0, i64 0, !dbg !266
  %arraydecay1 = getelementptr inbounds [6 x double], [6 x double]* %b, i64 0, i64 0, !dbg !267
  %arraydecay2 = getelementptr inbounds [6 x double], [6 x double]* %x, i64 0, i64 0, !dbg !268
  call void @gauss_eliminate(double* %arraydecay, double* %arraydecay1, double* %arraydecay2, i32 6), !dbg !269
  store i32 0, i32* %i, align 4, !dbg !270
  br label %for.cond, !dbg !272

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i32, i32* %i, align 4, !dbg !273
  %cmp = icmp slt i32 %9, 6, !dbg !275
  br i1 %cmp, label %for.body, label %for.end, !dbg !276

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !277
  %idxprom = sext i32 %10 to i64, !dbg !278
  %arrayidx = getelementptr inbounds [6 x double], [6 x double]* %x, i64 0, i64 %idxprom, !dbg !278
  %11 = load double, double* %arrayidx, align 8, !dbg !278
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %11), !dbg !279
  br label %for.inc, !dbg !279

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !280
  %inc = add nsw i32 %12, 1, !dbg !280
  store i32 %inc, i32* %i, align 4, !dbg !280
  br label %for.cond, !dbg !281, !llvm.loop !282

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !284
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "gaussian-elimination.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Gaussian-elimination")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "swap_row", scope: !1, file: !1, line: 7, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !12, !12, !12}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 7, type: !10)
!14 = !DILocation(line: 7, column: 23, scope: !7)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocation(line: 7, column: 34, scope: !7)
!17 = !DILocalVariable(name: "r1", arg: 3, scope: !7, file: !1, line: 7, type: !12)
!18 = !DILocation(line: 7, column: 41, scope: !7)
!19 = !DILocalVariable(name: "r2", arg: 4, scope: !7, file: !1, line: 7, type: !12)
!20 = !DILocation(line: 7, column: 49, scope: !7)
!21 = !DILocalVariable(name: "n", arg: 5, scope: !7, file: !1, line: 7, type: !12)
!22 = !DILocation(line: 7, column: 57, scope: !7)
!23 = !DILocalVariable(name: "tmp", scope: !7, file: !1, line: 9, type: !11)
!24 = !DILocation(line: 9, column: 9, scope: !7)
!25 = !DILocalVariable(name: "p1", scope: !7, file: !1, line: 9, type: !10)
!26 = !DILocation(line: 9, column: 15, scope: !7)
!27 = !DILocalVariable(name: "p2", scope: !7, file: !1, line: 9, type: !10)
!28 = !DILocation(line: 9, column: 20, scope: !7)
!29 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 10, type: !12)
!30 = !DILocation(line: 10, column: 6, scope: !7)
!31 = !DILocation(line: 12, column: 6, scope: !32)
!32 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 6)
!33 = !DILocation(line: 12, column: 12, scope: !32)
!34 = !DILocation(line: 12, column: 9, scope: !32)
!35 = !DILocation(line: 12, column: 6, scope: !7)
!36 = !{!"if"}
!37 = !DILocation(line: 12, column: 16, scope: !32)
!38 = !DILocation(line: 13, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 2)
!40 = !DILocation(line: 13, column: 7, scope: !39)
!41 = !DILocation(line: 13, column: 14, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !1, line: 13, column: 2)
!43 = !DILocation(line: 13, column: 18, scope: !42)
!44 = !DILocation(line: 13, column: 16, scope: !42)
!45 = !DILocation(line: 13, column: 2, scope: !39)
!46 = !DILocation(line: 14, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !1, line: 13, column: 26)
!48 = !DILocation(line: 14, column: 6, scope: !47)
!49 = !DILocation(line: 15, column: 8, scope: !47)
!50 = !DILocation(line: 15, column: 6, scope: !47)
!51 = !DILocation(line: 16, column: 10, scope: !47)
!52 = !DILocation(line: 16, column: 9, scope: !47)
!53 = !DILocation(line: 16, column: 7, scope: !47)
!54 = !DILocation(line: 16, column: 21, scope: !47)
!55 = !DILocation(line: 16, column: 20, scope: !47)
!56 = !DILocation(line: 16, column: 15, scope: !47)
!57 = !DILocation(line: 16, column: 18, scope: !47)
!58 = !DILocation(line: 16, column: 31, scope: !47)
!59 = !DILocation(line: 16, column: 26, scope: !47)
!60 = !DILocation(line: 16, column: 29, scope: !47)
!61 = !DILocation(line: 17, column: 2, scope: !47)
!62 = !DILocation(line: 13, column: 22, scope: !42)
!63 = !DILocation(line: 13, column: 2, scope: !42)
!64 = distinct !{!64, !45, !65}
!65 = !DILocation(line: 17, column: 2, scope: !39)
!66 = !DILocation(line: 18, column: 8, scope: !7)
!67 = !DILocation(line: 18, column: 10, scope: !7)
!68 = !DILocation(line: 18, column: 6, scope: !7)
!69 = !DILocation(line: 18, column: 23, scope: !7)
!70 = !DILocation(line: 18, column: 25, scope: !7)
!71 = !DILocation(line: 18, column: 15, scope: !7)
!72 = !DILocation(line: 18, column: 17, scope: !7)
!73 = !DILocation(line: 18, column: 21, scope: !7)
!74 = !DILocation(line: 18, column: 38, scope: !7)
!75 = !DILocation(line: 18, column: 30, scope: !7)
!76 = !DILocation(line: 18, column: 32, scope: !7)
!77 = !DILocation(line: 18, column: 36, scope: !7)
!78 = !DILocation(line: 19, column: 1, scope: !7)
!79 = distinct !DISubprogram(name: "gauss_eliminate", scope: !1, file: !1, line: 21, type: !80, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{null, !10, !10, !10, !12}
!82 = !DILocalVariable(name: "a", arg: 1, scope: !79, file: !1, line: 21, type: !10)
!83 = !DILocation(line: 21, column: 30, scope: !79)
!84 = !DILocalVariable(name: "b", arg: 2, scope: !79, file: !1, line: 21, type: !10)
!85 = !DILocation(line: 21, column: 41, scope: !79)
!86 = !DILocalVariable(name: "x", arg: 3, scope: !79, file: !1, line: 21, type: !10)
!87 = !DILocation(line: 21, column: 52, scope: !79)
!88 = !DILocalVariable(name: "n", arg: 4, scope: !79, file: !1, line: 21, type: !12)
!89 = !DILocation(line: 21, column: 59, scope: !79)
!90 = !DILocalVariable(name: "i", scope: !79, file: !1, line: 24, type: !12)
!91 = !DILocation(line: 24, column: 6, scope: !79)
!92 = !DILocalVariable(name: "j", scope: !79, file: !1, line: 24, type: !12)
!93 = !DILocation(line: 24, column: 9, scope: !79)
!94 = !DILocalVariable(name: "col", scope: !79, file: !1, line: 24, type: !12)
!95 = !DILocation(line: 24, column: 12, scope: !79)
!96 = !DILocalVariable(name: "row", scope: !79, file: !1, line: 24, type: !12)
!97 = !DILocation(line: 24, column: 17, scope: !79)
!98 = !DILocalVariable(name: "max_row", scope: !79, file: !1, line: 24, type: !12)
!99 = !DILocation(line: 24, column: 22, scope: !79)
!100 = !DILocalVariable(name: "dia", scope: !79, file: !1, line: 24, type: !12)
!101 = !DILocation(line: 24, column: 30, scope: !79)
!102 = !DILocalVariable(name: "max", scope: !79, file: !1, line: 25, type: !11)
!103 = !DILocation(line: 25, column: 9, scope: !79)
!104 = !DILocalVariable(name: "tmp", scope: !79, file: !1, line: 25, type: !11)
!105 = !DILocation(line: 25, column: 14, scope: !79)
!106 = !DILocation(line: 27, column: 11, scope: !107)
!107 = distinct !DILexicalBlock(scope: !79, file: !1, line: 27, column: 2)
!108 = !DILocation(line: 27, column: 7, scope: !107)
!109 = !DILocation(line: 27, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !1, line: 27, column: 2)
!111 = !DILocation(line: 27, column: 22, scope: !110)
!112 = !DILocation(line: 27, column: 20, scope: !110)
!113 = !DILocation(line: 27, column: 2, scope: !107)
!114 = !DILocation(line: 28, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !1, line: 27, column: 32)
!116 = !DILocation(line: 28, column: 11, scope: !115)
!117 = !DILocation(line: 28, column: 24, scope: !115)
!118 = !DILocation(line: 28, column: 22, scope: !115)
!119 = !DILocation(line: 30, column: 14, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !1, line: 30, column: 3)
!121 = !DILocation(line: 30, column: 18, scope: !120)
!122 = !DILocation(line: 30, column: 12, scope: !120)
!123 = !DILocation(line: 30, column: 8, scope: !120)
!124 = !DILocation(line: 30, column: 23, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !1, line: 30, column: 3)
!126 = !DILocation(line: 30, column: 29, scope: !125)
!127 = !DILocation(line: 30, column: 27, scope: !125)
!128 = !DILocation(line: 30, column: 3, scope: !120)
!129 = !DILocation(line: 31, column: 20, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !1, line: 31, column: 8)
!131 = !DILocation(line: 31, column: 15, scope: !130)
!132 = !DILocation(line: 31, column: 13, scope: !130)
!133 = !DILocation(line: 31, column: 36, scope: !130)
!134 = !DILocation(line: 31, column: 34, scope: !130)
!135 = !DILocation(line: 31, column: 8, scope: !125)
!136 = !DILocation(line: 32, column: 15, scope: !130)
!137 = !DILocation(line: 32, column: 13, scope: !130)
!138 = !DILocation(line: 32, column: 26, scope: !130)
!139 = !DILocation(line: 32, column: 24, scope: !130)
!140 = !DILocation(line: 32, column: 5, scope: !130)
!141 = !DILocation(line: 30, column: 35, scope: !125)
!142 = !DILocation(line: 30, column: 3, scope: !125)
!143 = distinct !{!143, !128, !144}
!144 = !DILocation(line: 32, column: 26, scope: !120)
!145 = !DILocation(line: 34, column: 12, scope: !115)
!146 = !DILocation(line: 34, column: 15, scope: !115)
!147 = !DILocation(line: 34, column: 18, scope: !115)
!148 = !DILocation(line: 34, column: 23, scope: !115)
!149 = !DILocation(line: 34, column: 32, scope: !115)
!150 = !DILocation(line: 34, column: 3, scope: !115)
!151 = !DILocation(line: 36, column: 14, scope: !152)
!152 = distinct !DILexicalBlock(scope: !115, file: !1, line: 36, column: 3)
!153 = !DILocation(line: 36, column: 18, scope: !152)
!154 = !DILocation(line: 36, column: 12, scope: !152)
!155 = !DILocation(line: 36, column: 8, scope: !152)
!156 = !DILocation(line: 36, column: 23, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !1, line: 36, column: 3)
!158 = !DILocation(line: 36, column: 29, scope: !157)
!159 = !DILocation(line: 36, column: 27, scope: !157)
!160 = !DILocation(line: 36, column: 3, scope: !152)
!161 = !DILocation(line: 37, column: 10, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !1, line: 36, column: 39)
!163 = !DILocation(line: 37, column: 24, scope: !162)
!164 = !DILocation(line: 37, column: 22, scope: !162)
!165 = !DILocation(line: 37, column: 8, scope: !162)
!166 = !DILocation(line: 38, column: 15, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !1, line: 38, column: 4)
!168 = !DILocation(line: 38, column: 18, scope: !167)
!169 = !DILocation(line: 38, column: 13, scope: !167)
!170 = !DILocation(line: 38, column: 9, scope: !167)
!171 = !DILocation(line: 38, column: 22, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !1, line: 38, column: 4)
!173 = !DILocation(line: 38, column: 28, scope: !172)
!174 = !DILocation(line: 38, column: 26, scope: !172)
!175 = !DILocation(line: 38, column: 4, scope: !167)
!176 = !DILocation(line: 39, column: 20, scope: !172)
!177 = !DILocation(line: 39, column: 26, scope: !172)
!178 = !DILocation(line: 39, column: 24, scope: !172)
!179 = !DILocation(line: 39, column: 5, scope: !172)
!180 = !DILocation(line: 39, column: 17, scope: !172)
!181 = !DILocation(line: 38, column: 34, scope: !172)
!182 = !DILocation(line: 38, column: 4, scope: !172)
!183 = distinct !{!183, !175, !184}
!184 = !DILocation(line: 39, column: 26, scope: !167)
!185 = !DILocation(line: 40, column: 4, scope: !162)
!186 = !DILocation(line: 40, column: 16, scope: !162)
!187 = !DILocation(line: 41, column: 14, scope: !162)
!188 = !DILocation(line: 41, column: 20, scope: !162)
!189 = !DILocation(line: 41, column: 22, scope: !162)
!190 = !DILocation(line: 41, column: 18, scope: !162)
!191 = !DILocation(line: 41, column: 4, scope: !162)
!192 = !DILocation(line: 41, column: 6, scope: !162)
!193 = !DILocation(line: 41, column: 11, scope: !162)
!194 = !DILocation(line: 42, column: 3, scope: !162)
!195 = !DILocation(line: 36, column: 35, scope: !157)
!196 = !DILocation(line: 36, column: 3, scope: !157)
!197 = distinct !{!197, !160, !198}
!198 = !DILocation(line: 42, column: 3, scope: !152)
!199 = !DILocation(line: 43, column: 2, scope: !115)
!200 = !DILocation(line: 27, column: 28, scope: !110)
!201 = !DILocation(line: 27, column: 2, scope: !110)
!202 = distinct !{!202, !113, !203}
!203 = !DILocation(line: 43, column: 2, scope: !107)
!204 = !DILocation(line: 44, column: 13, scope: !205)
!205 = distinct !DILexicalBlock(scope: !79, file: !1, line: 44, column: 2)
!206 = !DILocation(line: 44, column: 15, scope: !205)
!207 = !DILocation(line: 44, column: 11, scope: !205)
!208 = !DILocation(line: 44, column: 7, scope: !205)
!209 = !DILocation(line: 44, column: 20, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !1, line: 44, column: 2)
!211 = !DILocation(line: 44, column: 24, scope: !210)
!212 = !DILocation(line: 44, column: 2, scope: !205)
!213 = !DILocation(line: 45, column: 9, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !1, line: 44, column: 37)
!215 = !DILocation(line: 45, column: 11, scope: !214)
!216 = !DILocation(line: 45, column: 7, scope: !214)
!217 = !DILocation(line: 46, column: 12, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !1, line: 46, column: 3)
!219 = !DILocation(line: 46, column: 14, scope: !218)
!220 = !DILocation(line: 46, column: 10, scope: !218)
!221 = !DILocation(line: 46, column: 8, scope: !218)
!222 = !DILocation(line: 46, column: 19, scope: !223)
!223 = distinct !DILexicalBlock(scope: !218, file: !1, line: 46, column: 3)
!224 = !DILocation(line: 46, column: 23, scope: !223)
!225 = !DILocation(line: 46, column: 21, scope: !223)
!226 = !DILocation(line: 46, column: 3, scope: !218)
!227 = !DILocation(line: 47, column: 11, scope: !223)
!228 = !DILocation(line: 47, column: 13, scope: !223)
!229 = !DILocation(line: 47, column: 18, scope: !223)
!230 = !DILocation(line: 47, column: 16, scope: !223)
!231 = !DILocation(line: 47, column: 8, scope: !223)
!232 = !DILocation(line: 47, column: 4, scope: !223)
!233 = !DILocation(line: 46, column: 29, scope: !223)
!234 = !DILocation(line: 46, column: 3, scope: !223)
!235 = distinct !{!235, !226, !236}
!236 = !DILocation(line: 47, column: 18, scope: !218)
!237 = !DILocation(line: 48, column: 12, scope: !214)
!238 = !DILocation(line: 48, column: 18, scope: !214)
!239 = !DILocation(line: 48, column: 16, scope: !214)
!240 = !DILocation(line: 48, column: 3, scope: !214)
!241 = !DILocation(line: 48, column: 5, scope: !214)
!242 = !DILocation(line: 48, column: 10, scope: !214)
!243 = !DILocation(line: 49, column: 2, scope: !214)
!244 = !DILocation(line: 44, column: 33, scope: !210)
!245 = !DILocation(line: 44, column: 2, scope: !210)
!246 = distinct !{!246, !212, !247}
!247 = !DILocation(line: 49, column: 2, scope: !205)
!248 = !DILocation(line: 51, column: 1, scope: !79)
!249 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 53, type: !250, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!250 = !DISubroutineType(types: !251)
!251 = !{!12}
!252 = !DILocalVariable(name: "a", scope: !249, file: !1, line: 55, type: !253)
!253 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 2304, elements: !254)
!254 = !{!255}
!255 = !DISubrange(count: 36)
!256 = !DILocation(line: 55, column: 9, scope: !249)
!257 = !DILocalVariable(name: "b", scope: !249, file: !1, line: 63, type: !258)
!258 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 384, elements: !259)
!259 = !{!260}
!260 = !DISubrange(count: 6)
!261 = !DILocation(line: 63, column: 9, scope: !249)
!262 = !DILocalVariable(name: "x", scope: !249, file: !1, line: 64, type: !258)
!263 = !DILocation(line: 64, column: 9, scope: !249)
!264 = !DILocalVariable(name: "i", scope: !249, file: !1, line: 65, type: !12)
!265 = !DILocation(line: 65, column: 6, scope: !249)
!266 = !DILocation(line: 67, column: 18, scope: !249)
!267 = !DILocation(line: 67, column: 21, scope: !249)
!268 = !DILocation(line: 67, column: 24, scope: !249)
!269 = !DILocation(line: 67, column: 2, scope: !249)
!270 = !DILocation(line: 69, column: 9, scope: !271)
!271 = distinct !DILexicalBlock(scope: !249, file: !1, line: 69, column: 2)
!272 = !DILocation(line: 69, column: 7, scope: !271)
!273 = !DILocation(line: 69, column: 14, scope: !274)
!274 = distinct !DILexicalBlock(scope: !271, file: !1, line: 69, column: 2)
!275 = !DILocation(line: 69, column: 16, scope: !274)
!276 = !DILocation(line: 69, column: 2, scope: !271)
!277 = !DILocation(line: 70, column: 20, scope: !274)
!278 = !DILocation(line: 70, column: 18, scope: !274)
!279 = !DILocation(line: 70, column: 3, scope: !274)
!280 = !DILocation(line: 69, column: 22, scope: !274)
!281 = !DILocation(line: 69, column: 2, scope: !274)
!282 = distinct !{!282, !276, !283}
!283 = !DILocation(line: 70, column: 22, scope: !271)
!284 = !DILocation(line: 72, column: 2, scope: !249)
