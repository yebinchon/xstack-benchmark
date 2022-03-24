; ModuleID = 'gramschmidt.c'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i32 262144, i32 8) #6
  %call1 = tail call i8* @polybench_alloc_data(i32 262144, i32 8) #6
  %call2 = tail call i8* @polybench_alloc_data(i32 262144, i32 8) #6
  %arraydecay = bitcast i8* %call to [512 x double]*
  %arraydecay4 = bitcast i8* %call2 to [512 x double]*
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc17.i, %entry
  %indvars.iv12.i = phi i64 [ 0, %entry ], [ %indvars.iv.next13.i, %for.inc17.i ]
  %0 = trunc i64 %indvars.iv12.i to i32
  %conv.i = sitofp i32 %0 to double
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv9.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next10.i.1, %for.body3.i ]
  %1 = trunc i64 %indvars.iv9.i to i32
  %conv4.i = sitofp i32 %1 to double
  %mul.i = fmul double %conv.i, %conv4.i
  %div.i = fmul double %mul.i, 0x3F60000000000000
  %arrayidx7.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv12.i, i64 %indvars.iv9.i
  store double %div.i, double* %arrayidx7.i, align 8, !tbaa !2
  %indvars.iv.next10.i = or i64 %indvars.iv9.i, 1
  %2 = trunc i64 %indvars.iv.next10.i to i32
  %conv9.i = sitofp i32 %2 to double
  %mul10.i = fmul double %conv.i, %conv9.i
  %div12.i = fmul double %mul10.i, 0x3F60000000000000
  %arrayidx16.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 %indvars.iv12.i, i64 %indvars.iv9.i
  store double %div12.i, double* %arrayidx16.i, align 8, !tbaa !2
  %3 = trunc i64 %indvars.iv.next10.i to i32
  %conv4.i.1 = sitofp i32 %3 to double
  %mul.i.1 = fmul double %conv.i, %conv4.i.1
  %div.i.1 = fmul double %mul.i.1, 0x3F60000000000000
  %arrayidx7.i.1 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv12.i, i64 %indvars.iv.next10.i
  store double %div.i.1, double* %arrayidx7.i.1, align 8, !tbaa !2
  %indvars.iv.next10.i.1 = add nuw nsw i64 %indvars.iv9.i, 2
  %4 = trunc i64 %indvars.iv.next10.i.1 to i32
  %conv9.i.1 = sitofp i32 %4 to double
  %mul10.i.1 = fmul double %conv.i, %conv9.i.1
  %div12.i.1 = fmul double %mul10.i.1, 0x3F60000000000000
  %arrayidx16.i.1 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 %indvars.iv12.i, i64 %indvars.iv.next10.i
  store double %div12.i.1, double* %arrayidx16.i.1, align 8, !tbaa !2
  %exitcond11.i.1 = icmp eq i64 %indvars.iv.next10.i.1, 512
  br i1 %exitcond11.i.1, label %for.inc17.i, label %for.body3.i

for.inc17.i:                                      ; preds = %for.body3.i
  %indvars.iv.next13.i = add nuw nsw i64 %indvars.iv12.i, 1
  %exitcond14.i = icmp eq i64 %indvars.iv.next13.i, 512
  br i1 %exitcond14.i, label %for.cond24.preheader.i.preheader, label %for.cond1.preheader.i

for.cond24.preheader.i.preheader:                 ; preds = %for.inc17.i
  %arraydecay3 = bitcast i8* %call1 to [512 x double]*
  br label %for.cond24.preheader.i

for.cond24.preheader.i:                           ; preds = %for.cond24.preheader.i.preheader, %for.inc41.i
  %indvars.iv6.i = phi i64 [ %indvars.iv.next7.i, %for.inc41.i ], [ 0, %for.cond24.preheader.i.preheader ]
  %5 = trunc i64 %indvars.iv6.i to i32
  %conv28.i = sitofp i32 %5 to double
  br label %for.body27.i

for.body27.i:                                     ; preds = %for.body27.i, %for.cond24.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond24.preheader.i ], [ %indvars.iv.next.i.1, %for.body27.i ]
  %6 = trunc i64 %indvars.iv.i to i32
  %7 = add nuw nsw i32 %6, 2
  %conv30.i = sitofp i32 %7 to double
  %mul31.i = fmul double %conv28.i, %conv30.i
  %div33.i = fmul double %mul31.i, 0x3F60000000000000
  %arrayidx37.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay3, i64 %indvars.iv6.i, i64 %indvars.iv.i
  store double %div33.i, double* %arrayidx37.i, align 8, !tbaa !2
  %indvars.iv.next.i = or i64 %indvars.iv.i, 1
  %8 = trunc i64 %indvars.iv.next.i to i32
  %9 = add nuw nsw i32 %8, 2
  %conv30.i.1 = sitofp i32 %9 to double
  %mul31.i.1 = fmul double %conv28.i, %conv30.i.1
  %div33.i.1 = fmul double %mul31.i.1, 0x3F60000000000000
  %arrayidx37.i.1 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay3, i64 %indvars.iv6.i, i64 %indvars.iv.next.i
  store double %div33.i.1, double* %arrayidx37.i.1, align 8, !tbaa !2
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.i.1 = icmp eq i64 %indvars.iv.next.i.1, 512
  br i1 %exitcond.i.1, label %for.inc41.i, label %for.body27.i

for.inc41.i:                                      ; preds = %for.body27.i
  %indvars.iv.next7.i = add nuw nsw i64 %indvars.iv6.i, 1
  %exitcond8.i = icmp eq i64 %indvars.iv.next7.i, 512
  br i1 %exitcond8.i, label %for.cond1.preheader.i33.preheader, label %for.cond24.preheader.i

for.cond1.preheader.i33.preheader:                ; preds = %for.inc41.i
  %polly.access.cast.call1 = bitcast i8* %call1 to double*
  %polly.access.cast.call = bitcast i8* %call to double*
  %polly.access.call76 = getelementptr i8, i8* %call, i64 2097152
  %polly.access.cast.call2 = bitcast i8* %call2 to double*
  %scevgep = getelementptr i8, i8* %call1, i64 8
  %scevgep192 = getelementptr i8, i8* %call, i64 4096
  %scevgep196 = getelementptr i8, i8* %call2, i64 4096
  %scevgep222 = getelementptr i8, i8* %call, i64 8
  %scevgep272 = getelementptr i8, i8* %call, i64 4104
  br label %for.cond1.preheader.i33

for.cond.loopexit.i:                              ; preds = %for.inc83.i, %polly.stmt.for.end31.i, %for.end31.i
  %indvar.next.i.merge = phi i64 [ %68, %polly.stmt.for.end31.i ], [ %indvar.next.i, %for.end31.i ], [ %indvar.next.i, %for.inc83.i ]
  %indvars.iv.next19.i = add nuw nsw i64 %indvars.iv18.i, 1
  %exitcond24.i = icmp eq i64 %indvar.next.i.merge, 512
  br i1 %exitcond24.i, label %kernel_gramschmidt.exit, label %for.cond1.preheader.i33

for.cond1.preheader.i33:                          ; preds = %for.cond1.preheader.i33.preheader, %for.cond.loopexit.i
  %indvar.i = phi i64 [ %indvar.next.i.merge, %for.cond.loopexit.i ], [ 0, %for.cond1.preheader.i33.preheader ]
  %indvars.iv18.i = phi i64 [ %indvars.iv.next19.i, %for.cond.loopexit.i ], [ 1, %for.cond1.preheader.i33.preheader ]
  br label %for.body3.i38

for.body3.i38:                                    ; preds = %for.body3.i38, %for.cond1.preheader.i33
  %indvars.iv.i34 = phi i64 [ 0, %for.cond1.preheader.i33 ], [ %indvars.iv.next.i36.3, %for.body3.i38 ]
  %nrm.02.i = phi double [ 0.000000e+00, %for.cond1.preheader.i33 ], [ %add.i.3, %for.body3.i38 ]
  %arrayidx5.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv.i34, i64 %indvar.i
  %10 = load double, double* %arrayidx5.i, align 8, !tbaa !2
  %mul.i35 = fmul double %10, %10
  %add.i = fadd double %nrm.02.i, %mul.i35
  %indvars.iv.next.i36 = or i64 %indvars.iv.i34, 1
  %arrayidx5.i.1 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv.next.i36, i64 %indvar.i
  %11 = load double, double* %arrayidx5.i.1, align 8, !tbaa !2
  %mul.i35.1 = fmul double %11, %11
  %add.i.1 = fadd double %add.i, %mul.i35.1
  %indvars.iv.next.i36.1 = or i64 %indvars.iv.i34, 2
  %arrayidx5.i.2 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv.next.i36.1, i64 %indvar.i
  %12 = load double, double* %arrayidx5.i.2, align 8, !tbaa !2
  %mul.i35.2 = fmul double %12, %12
  %add.i.2 = fadd double %add.i.1, %mul.i35.2
  %indvars.iv.next.i36.2 = or i64 %indvars.iv.i34, 3
  %arrayidx5.i.3 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv.next.i36.2, i64 %indvar.i
  %13 = load double, double* %arrayidx5.i.3, align 8, !tbaa !2
  %mul.i35.3 = fmul double %13, %13
  %add.i.3 = fadd double %add.i.2, %mul.i35.3
  %indvars.iv.next.i36.3 = add nuw nsw i64 %indvars.iv.i34, 4
  %exitcond.i37.3 = icmp eq i64 %indvars.iv.next.i36.3, 512
  br i1 %exitcond.i37.3, label %for.end.i, label %for.body3.i38

for.end.i:                                        ; preds = %for.body3.i38
  %call.i = tail call double @sqrt(double %add.i.3) #6
  %arrayidx13.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay3, i64 %indvar.i, i64 %indvar.i
  store double %call.i, double* %arrayidx13.i, align 8, !tbaa !2
  %arrayidx20.i54 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 0, i64 %indvar.i
  %14 = load double, double* %arrayidx20.i54, align 8, !tbaa !2
  %div.i4055 = fdiv double %14, %call.i
  %arrayidx28.i56 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 0, i64 %indvar.i
  store double %div.i4055, double* %arrayidx28.i56, align 8, !tbaa !2
  %polly.access.mul.call1 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %indvar.i, i64 512)
  %polly.access.mul.call1.obit = extractvalue { i64, i1 } %polly.access.mul.call1, 1
  %polly.access.mul.call1.res = extractvalue { i64, i1 } %polly.access.mul.call1, 0
  %polly.access.add.call1 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call1.res, i64 512)
  %polly.access.add.call1.obit = extractvalue { i64, i1 } %polly.access.add.call1, 1
  %polly.overflow.state63 = or i1 %polly.access.mul.call1.obit, %polly.access.add.call1.obit
  %polly.access.add.call1.res = extractvalue { i64, i1 } %polly.access.add.call1, 0
  %polly.access.call1 = getelementptr double, double* %polly.access.cast.call1, i64 %polly.access.add.call1.res
  %15 = icmp sgt i64 %indvar.i, 510
  %polly.access.mul.call = select i1 %15, i64 512, i64 0
  %16 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %indvar.i, i64 1)
  %.obit = extractvalue { i64, i1 } %16, 1
  %polly.overflow.state65 = or i1 %.obit, %polly.overflow.state63
  %.res = extractvalue { i64, i1 } %16, 0
  %17 = icmp slt i64 %.res, 511
  %18 = select i1 %17, i64 %.res, i64 511
  %polly.access.add.call = add nsw i64 %18, %polly.access.mul.call
  %polly.access.call = getelementptr double, double* %polly.access.cast.call, i64 %polly.access.add.call
  %19 = icmp ule double* %polly.access.call1, %polly.access.call
  %polly.access.add.call182 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call1.res, i64 %indvar.i)
  %polly.access.add.call1.obit83 = extractvalue { i64, i1 } %polly.access.add.call182, 1
  %polly.overflow.state84 = or i1 %polly.access.add.call1.obit83, %polly.overflow.state65
  %polly.access.add.call1.res85 = extractvalue { i64, i1 } %polly.access.add.call182, 0
  %polly.access.call186 = getelementptr double, double* %polly.access.cast.call1, i64 %polly.access.add.call1.res85
  %20 = bitcast double* %polly.access.call186 to i8*
  %21 = icmp ule i8* %polly.access.call76, %20
  %22 = or i1 %19, %21
  %polly.access.add.call2 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res, i64 261632)
  %polly.access.add.call2.obit = extractvalue { i64, i1 } %polly.access.add.call2, 1
  %polly.overflow.state91 = or i1 %polly.access.add.call2.obit, %polly.overflow.state84
  %polly.access.add.call2.res = extractvalue { i64, i1 } %polly.access.add.call2, 0
  %polly.access.call2 = getelementptr double, double* %polly.access.cast.call2, i64 %polly.access.add.call2.res
  %23 = icmp ule double* %polly.access.call2, %polly.access.call
  %polly.access.add.call2120 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call, i64 %indvar.i)
  %polly.access.add.call2.obit121 = extractvalue { i64, i1 } %polly.access.add.call2120, 1
  %polly.access.add.call2.res123 = extractvalue { i64, i1 } %polly.access.add.call2120, 0
  %polly.access.call2124 = getelementptr double, double* %polly.access.cast.call2, i64 %polly.access.add.call2.res123
  %24 = bitcast double* %polly.access.call2124 to i8*
  %25 = icmp ule i8* %polly.access.call76, %24
  %26 = or i1 %23, %25
  %27 = and i1 %22, %26
  %polly.overflow.state131 = or i1 %polly.access.add.call2.obit121, %polly.overflow.state91
  %polly.overflow.state145 = or i1 %polly.access.mul.call1.obit, %polly.overflow.state131
  %28 = icmp ule double* %polly.access.call2, %polly.access.call186
  %polly.overflow.state155 = or i1 %polly.access.add.call1.obit, %polly.overflow.state145
  %29 = icmp ule double* %polly.access.call1, %polly.access.call2124
  %30 = or i1 %28, %29
  %31 = and i1 %30, %27
  %polly.rtc.overflown = xor i1 %polly.overflow.state155, true
  %polly.rtc.result = and i1 %31, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.start, label %for.body16.for.body16_crit_edge.i

for.body16.for.body16_crit_edge.i:                ; preds = %for.end.i, %for.body16.for.body16_crit_edge.i.1
  %indvars.iv.next10.i4157 = phi i64 [ %indvars.iv.next10.i41.1, %for.body16.for.body16_crit_edge.i.1 ], [ 1, %for.end.i ]
  %.pre.i = load double, double* %arrayidx13.i, align 8, !tbaa !2
  %arrayidx20.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv.next10.i4157, i64 %indvar.i
  %32 = load double, double* %arrayidx20.i, align 8, !tbaa !2
  %div.i40 = fdiv double %32, %.pre.i
  %arrayidx28.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 %indvars.iv.next10.i4157, i64 %indvar.i
  store double %div.i40, double* %arrayidx28.i, align 8, !tbaa !2
  %indvars.iv.next10.i41 = add nuw nsw i64 %indvars.iv.next10.i4157, 1
  %exitcond11.i42 = icmp eq i64 %indvars.iv.next10.i41, 512
  br i1 %exitcond11.i42, label %for.end31.i, label %for.body16.for.body16_crit_edge.i.1

for.end31.i:                                      ; preds = %for.body16.for.body16_crit_edge.i
  %indvar.next.i = add nuw nsw i64 %indvar.i, 1
  %cmp346.i = icmp ult i64 %indvar.i, 511
  br i1 %cmp346.i, label %for.body35.i, label %for.cond.loopexit.i

for.body35.i:                                     ; preds = %for.end31.i, %for.inc83.i
  %indvars.iv20.i = phi i64 [ %indvars.iv.next21.i, %for.inc83.i ], [ %indvars.iv18.i, %for.end31.i ]
  %arrayidx39.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay3, i64 %indvar.i, i64 %indvars.iv20.i
  store double 0.000000e+00, double* %arrayidx39.i, align 8, !tbaa !2
  br label %for.body42.i

for.body42.i:                                     ; preds = %for.body42.i, %for.body35.i
  %33 = phi double [ 0.000000e+00, %for.body35.i ], [ %add56.i.1, %for.body42.i ]
  %indvars.iv12.i43 = phi i64 [ 0, %for.body35.i ], [ %indvars.iv.next13.i44.1, %for.body42.i ]
  %arrayidx46.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 %indvars.iv12.i43, i64 %indvar.i
  %34 = load double, double* %arrayidx46.i, align 8, !tbaa !2
  %arrayidx50.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv12.i43, i64 %indvars.iv20.i
  %35 = load double, double* %arrayidx50.i, align 8, !tbaa !2
  %mul51.i = fmul double %34, %35
  %add56.i = fadd double %33, %mul51.i
  store double %add56.i, double* %arrayidx39.i, align 8, !tbaa !2
  %indvars.iv.next13.i44 = or i64 %indvars.iv12.i43, 1
  %arrayidx46.i.1 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 %indvars.iv.next13.i44, i64 %indvar.i
  %36 = load double, double* %arrayidx46.i.1, align 8, !tbaa !2
  %arrayidx50.i.1 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv.next13.i44, i64 %indvars.iv20.i
  %37 = load double, double* %arrayidx50.i.1, align 8, !tbaa !2
  %mul51.i.1 = fmul double %36, %37
  %add56.i.1 = fadd double %add56.i, %mul51.i.1
  store double %add56.i.1, double* %arrayidx39.i, align 8, !tbaa !2
  %indvars.iv.next13.i44.1 = add nuw nsw i64 %indvars.iv12.i43, 2
  %exitcond14.i45.1 = icmp eq i64 %indvars.iv.next13.i44.1, 512
  br i1 %exitcond14.i45.1, label %for.body62.i.preheader, label %for.body42.i

for.body62.i.preheader:                           ; preds = %for.body42.i
  %arrayidx66.i58 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 0, i64 %indvars.iv20.i
  %38 = load double, double* %arrayidx66.i58, align 8, !tbaa !2
  %39 = load double, double* %arrayidx28.i56, align 8, !tbaa !2
  %mul75.i60 = fmul double %add56.i.1, %39
  %sub.i61 = fsub double %38, %mul75.i60
  store double %sub.i61, double* %arrayidx66.i58, align 8, !tbaa !2
  br label %for.body62.for.body62_crit_edge.i

for.body62.for.body62_crit_edge.i:                ; preds = %for.body62.for.body62_crit_edge.i.1, %for.body62.i.preheader
  %indvars.iv.next16.i62 = phi i64 [ 1, %for.body62.i.preheader ], [ %indvars.iv.next16.i.1, %for.body62.for.body62_crit_edge.i.1 ]
  %.pre25.i = load double, double* %arrayidx39.i, align 8, !tbaa !2
  %arrayidx66.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv.next16.i62, i64 %indvars.iv20.i
  %40 = load double, double* %arrayidx66.i, align 8, !tbaa !2
  %arrayidx70.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 %indvars.iv.next16.i62, i64 %indvar.i
  %41 = load double, double* %arrayidx70.i, align 8, !tbaa !2
  %mul75.i = fmul double %.pre25.i, %41
  %sub.i = fsub double %40, %mul75.i
  store double %sub.i, double* %arrayidx66.i, align 8, !tbaa !2
  %indvars.iv.next16.i = add nuw nsw i64 %indvars.iv.next16.i62, 1
  %exitcond17.i = icmp eq i64 %indvars.iv.next16.i, 512
  br i1 %exitcond17.i, label %for.inc83.i, label %for.body62.for.body62_crit_edge.i.1

for.inc83.i:                                      ; preds = %for.body62.for.body62_crit_edge.i
  %indvars.iv.next21.i = add nuw nsw i64 %indvars.iv20.i, 1
  %exitcond22.i = icmp eq i64 %indvars.iv.next21.i, 512
  br i1 %exitcond22.i, label %for.cond.loopexit.i, label %for.body35.i

kernel_gramschmidt.exit:                          ; preds = %for.cond.loopexit.i
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %kernel_gramschmidt.exit
  %42 = load i8*, i8** %argv, align 8, !tbaa !6
  %strcmpload = load i8, i8* %42, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %for.cond1.preheader.i46, label %if.end

for.cond1.preheader.i46:                          ; preds = %land.lhs.true, %for.inc8.i
  %indvars.iv34.i = phi i64 [ %indvars.iv.next35.i, %for.inc8.i ], [ 0, %land.lhs.true ]
  %43 = trunc i64 %indvars.iv34.i to i32
  %rem.i = urem i32 %43, 20
  %cmp6.i = icmp eq i32 %rem.i, 0
  br i1 %cmp6.i, label %for.body3.i49.us, label %for.body3.i49

for.body3.i49.us:                                 ; preds = %for.cond1.preheader.i46, %for.body3.i49.us
  %indvars.iv31.i.us = phi i64 [ %indvars.iv.next32.i.us, %for.body3.i49.us ], [ 0, %for.cond1.preheader.i46 ]
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %arrayidx5.i47.us = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv34.i, i64 %indvars.iv31.i.us
  %45 = load double, double* %arrayidx5.i47.us, align 8, !tbaa !2
  %call.i48.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %45) #7
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %fputc15.i.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %46) #7
  %indvars.iv.next32.i.us = add nuw nsw i64 %indvars.iv31.i.us, 1
  %exitcond33.i.us = icmp eq i64 %indvars.iv.next32.i.us, 512
  br i1 %exitcond33.i.us, label %for.inc8.i, label %for.body3.i49.us

for.body3.i49:                                    ; preds = %for.cond1.preheader.i46, %for.body3.i49
  %indvars.iv31.i = phi i64 [ %indvars.iv.next32.i, %for.body3.i49 ], [ 0, %for.cond1.preheader.i46 ]
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %arrayidx5.i47 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv34.i, i64 %indvars.iv31.i
  %48 = load double, double* %arrayidx5.i47, align 8, !tbaa !2
  %call.i48 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %48) #7
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1
  %exitcond33.i = icmp eq i64 %indvars.iv.next32.i, 512
  br i1 %exitcond33.i, label %for.inc8.i, label %for.body3.i49

for.inc8.i:                                       ; preds = %for.body3.i49, %for.body3.i49.us
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond36.i = icmp eq i64 %indvars.iv.next35.i, 512
  br i1 %exitcond36.i, label %for.end10.i, label %for.cond1.preheader.i46

for.end10.i:                                      ; preds = %for.inc8.i
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %49) #7
  br label %for.cond15.preheader.i

for.cond15.preheader.i:                           ; preds = %for.inc31.i, %for.end10.i
  %indvars.iv28.i = phi i64 [ 0, %for.end10.i ], [ %indvars.iv.next29.i, %for.inc31.i ]
  %50 = trunc i64 %indvars.iv28.i to i32
  %rem23.i = urem i32 %50, 20
  %cmp24.i = icmp eq i32 %rem23.i, 0
  br i1 %cmp24.i, label %for.body17.i.us, label %for.body17.i

for.body17.i.us:                                  ; preds = %for.cond15.preheader.i, %for.body17.i.us
  %indvars.iv25.i.us = phi i64 [ %indvars.iv.next26.i.us, %for.body17.i.us ], [ 0, %for.cond15.preheader.i ]
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %arrayidx21.i.us = getelementptr inbounds [512 x double], [512 x double]* %arraydecay3, i64 %indvars.iv28.i, i64 %indvars.iv25.i.us
  %52 = load double, double* %arrayidx21.i.us, align 8, !tbaa !2
  %call22.i.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %52) #7
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %fputc12.i.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %53) #7
  %indvars.iv.next26.i.us = add nuw nsw i64 %indvars.iv25.i.us, 1
  %exitcond27.i.us = icmp eq i64 %indvars.iv.next26.i.us, 512
  br i1 %exitcond27.i.us, label %for.inc31.i, label %for.body17.i.us

for.body17.i:                                     ; preds = %for.cond15.preheader.i, %for.body17.i
  %indvars.iv25.i = phi i64 [ %indvars.iv.next26.i, %for.body17.i ], [ 0, %for.cond15.preheader.i ]
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %arrayidx21.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay3, i64 %indvars.iv28.i, i64 %indvars.iv25.i
  %55 = load double, double* %arrayidx21.i, align 8, !tbaa !2
  %call22.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %55) #7
  %indvars.iv.next26.i = add nuw nsw i64 %indvars.iv25.i, 1
  %exitcond27.i = icmp eq i64 %indvars.iv.next26.i, 512
  br i1 %exitcond27.i, label %for.inc31.i, label %for.body17.i

for.inc31.i:                                      ; preds = %for.body17.i, %for.body17.i.us
  %indvars.iv.next29.i = add nuw nsw i64 %indvars.iv28.i, 1
  %exitcond30.i = icmp eq i64 %indvars.iv.next29.i, 512
  br i1 %exitcond30.i, label %for.end33.i, label %for.cond15.preheader.i

for.end33.i:                                      ; preds = %for.inc31.i
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %56) #7
  br label %for.cond38.preheader.i

for.cond38.preheader.i:                           ; preds = %for.inc54.i, %for.end33.i
  %indvars.iv22.i = phi i64 [ 0, %for.end33.i ], [ %indvars.iv.next23.i, %for.inc54.i ]
  %57 = trunc i64 %indvars.iv22.i to i32
  %rem46.i = urem i32 %57, 20
  %cmp47.i = icmp eq i32 %rem46.i, 0
  br i1 %cmp47.i, label %for.body40.i.us, label %for.body40.i

for.body40.i.us:                                  ; preds = %for.cond38.preheader.i, %for.body40.i.us
  %indvars.iv.i50.us = phi i64 [ %indvars.iv.next.i51.us, %for.body40.i.us ], [ 0, %for.cond38.preheader.i ]
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %arrayidx44.i.us = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 %indvars.iv22.i, i64 %indvars.iv.i50.us
  %59 = load double, double* %arrayidx44.i.us, align 8, !tbaa !2
  %call45.i.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %59) #7
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %fputc9.i.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %60) #7
  %indvars.iv.next.i51.us = add nuw nsw i64 %indvars.iv.i50.us, 1
  %exitcond.i52.us = icmp eq i64 %indvars.iv.next.i51.us, 512
  br i1 %exitcond.i52.us, label %for.inc54.i, label %for.body40.i.us

for.body40.i:                                     ; preds = %for.cond38.preheader.i, %for.body40.i
  %indvars.iv.i50 = phi i64 [ %indvars.iv.next.i51, %for.body40.i ], [ 0, %for.cond38.preheader.i ]
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %arrayidx44.i = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 %indvars.iv22.i, i64 %indvars.iv.i50
  %62 = load double, double* %arrayidx44.i, align 8, !tbaa !2
  %call45.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %62) #7
  %indvars.iv.next.i51 = add nuw nsw i64 %indvars.iv.i50, 1
  %exitcond.i52 = icmp eq i64 %indvars.iv.next.i51, 512
  br i1 %exitcond.i52, label %for.inc54.i, label %for.body40.i

for.inc54.i:                                      ; preds = %for.body40.i, %for.body40.i.us
  %indvars.iv.next23.i = add nuw nsw i64 %indvars.iv22.i, 1
  %exitcond24.i53 = icmp eq i64 %indvars.iv.next23.i, 512
  br i1 %exitcond24.i53, label %print_array.exit, label %for.cond38.preheader.i

print_array.exit:                                 ; preds = %for.inc54.i
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %fputc6.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %63) #7
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %print_array.exit, %kernel_gramschmidt.exit
  %call12 = tail call i32 (i8*, ...) bitcast (i32 (...)* @free to i32 (i8*, ...)*)(i8* %call) #6
  %call13 = tail call i32 (i8*, ...) bitcast (i32 (...)* @free to i32 (i8*, ...)*)(i8* %call1) #6
  %call14 = tail call i32 (i8*, ...) bitcast (i32 (...)* @free to i32 (i8*, ...)*)(i8* nonnull %call2) #6
  ret i32 0

polly.start:                                      ; preds = %for.end.i
  %64 = sub i64 510, %indvar.i
  %polly.loop_guard = icmp sgt i64 %64, -1
  %65 = mul i64 %indvar.i, 4104
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %polly.start.polly.loop_preheader185_crit_edge

polly.start.polly.loop_preheader185_crit_edge:    ; preds = %polly.start
  %.pre = shl i64 %indvar.i, 3
  br label %polly.loop_preheader185

polly.loop_exit186:                               ; preds = %polly.loop_header184
  br i1 %polly.loop_guard, label %polly.loop_preheader202, label %polly.loop_exit203

polly.loop_exit203:                               ; preds = %polly.stmt.for.body62.i.preheader, %polly.loop_exit186
  %66 = add nsw i64 %indvar.i, 33
  %pexp.p_div_q = lshr i64 %66, 5
  %67 = sub nsw i64 16, %pexp.p_div_q
  %polly.loop_guard244 = icmp ult i64 %66, 544
  br i1 %polly.loop_guard244, label %polly.loop_preheader242, label %polly.stmt.for.end31.i

polly.stmt.for.end31.i:                           ; preds = %polly.loop_exit250, %polly.loop_exit203
  %68 = add nuw i64 %indvar.i, 1
  br label %for.cond.loopexit.i

polly.loop_preheader:                             ; preds = %polly.start
  %scevgep168 = getelementptr i8, i8* %scevgep, i64 %65
  %69 = shl i64 %indvar.i, 3
  %70 = sub i64 4088, %69
  call void @llvm.memset.p0i8.i64(i8* align 8 %scevgep168, i8 0, i64 %70, i1 false)
  call void @llvm.memset.p0i8.i64(i8* align 8 %scevgep168, i8 0, i64 %70, i1 false)
  br label %polly.loop_preheader185

polly.loop_header184:                             ; preds = %polly.loop_header184.1, %polly.loop_preheader185
  %polly.indvar187 = phi i64 [ 0, %polly.loop_preheader185 ], [ %polly.indvar_next188.1, %polly.loop_header184.1 ]
  %71 = shl nuw nsw i64 %polly.indvar187, 12
  %scevgep194 = getelementptr i8, i8* %scevgep193, i64 %71
  %scevgep194195 = bitcast i8* %scevgep194 to double*
  %_p_scalar_ = load double, double* %scevgep194195, align 8, !alias.scope !8, !noalias !10
  %p_div.i40 = fdiv double %_p_scalar_, %.pre.i_p_scalar_.pre
  %scevgep198 = getelementptr i8, i8* %scevgep197, i64 %71
  %scevgep198199 = bitcast i8* %scevgep198 to double*
  store double %p_div.i40, double* %scevgep198199, align 8, !alias.scope !12, !noalias !13
  %polly.indvar_next188 = or i64 %polly.indvar187, 1
  %exitcond = icmp eq i64 %polly.indvar_next188, 511
  br i1 %exitcond, label %polly.loop_exit186, label %polly.loop_header184.1

polly.loop_preheader185:                          ; preds = %polly.start.polly.loop_preheader185_crit_edge, %polly.loop_preheader
  %.pre-phi = phi i64 [ %.pre, %polly.start.polly.loop_preheader185_crit_edge ], [ %69, %polly.loop_preheader ]
  %scevgep190 = getelementptr i8, i8* %call1, i64 %65
  %scevgep190191 = bitcast i8* %scevgep190 to double*
  %scevgep193 = getelementptr i8, i8* %scevgep192, i64 %.pre-phi
  %scevgep197 = getelementptr i8, i8* %scevgep196, i64 %.pre-phi
  %.pre.i_p_scalar_.pre = load double, double* %scevgep190191, align 8, !alias.scope !11, !noalias !14
  br label %polly.loop_header184

polly.loop_header201:                             ; preds = %polly.stmt.for.body62.i.preheader, %polly.loop_preheader202
  %polly.indvar205 = phi i64 [ 0, %polly.loop_preheader202 ], [ %polly.indvar_next206, %polly.stmt.for.body62.i.preheader ]
  %72 = shl nuw nsw i64 %polly.indvar205, 3
  %scevgep224 = getelementptr i8, i8* %scevgep223, i64 %72
  %polly.access.add.call1216 = add i64 %74, %polly.indvar205
  %polly.access.call1217 = getelementptr double, double* %polly.access.cast.call1, i64 %polly.access.add.call1216
  %polly.access.call1217.promoted = load double, double* %polly.access.call1217, align 8, !alias.scope !11, !noalias !14
  br label %polly.loop_header208

polly.stmt.for.body62.i.preheader:                ; preds = %polly.loop_header208
  store double %p_add56.i.3, double* %polly.access.call1217, align 8, !alias.scope !11, !noalias !14
  %scevgep234235 = bitcast i8* %scevgep224 to double*
  %_p_scalar_236 = load double, double* %scevgep234235, align 8, !alias.scope !8, !noalias !10
  %p_mul75.i60 = fmul double %p_add56.i.3, %_p_scalar_239
  %p_sub.i61 = fsub double %_p_scalar_236, %p_mul75.i60
  store double %p_sub.i61, double* %scevgep234235, align 8, !alias.scope !8, !noalias !10
  %polly.indvar_next206 = add nuw i64 %polly.indvar205, 1
  %exitcond291 = icmp eq i64 %polly.indvar_next206, %75
  br i1 %exitcond291, label %polly.loop_exit203, label %polly.loop_header201

polly.loop_preheader202:                          ; preds = %polly.loop_exit186
  %scevgep218 = getelementptr i8, i8* %call2, i64 %.pre-phi
  %scevgep223 = getelementptr i8, i8* %scevgep222, i64 %.pre-phi
  %scevgep237238 = bitcast i8* %scevgep218 to double*
  %polly.access.mul.call1215 = shl i64 %indvar.i, 9
  %73 = add i64 %indvar.i, 1
  %74 = add i64 %73, %polly.access.mul.call1215
  %_p_scalar_239 = load double, double* %scevgep237238, align 8, !alias.scope !12, !noalias !13
  %75 = sub i64 511, %indvar.i
  br label %polly.loop_header201

polly.loop_header208:                             ; preds = %polly.loop_header208, %polly.loop_header201
  %p_add56.i282 = phi double [ %polly.access.call1217.promoted, %polly.loop_header201 ], [ %p_add56.i.3, %polly.loop_header208 ]
  %polly.indvar211 = phi i64 [ 0, %polly.loop_header201 ], [ %polly.indvar_next212.3, %polly.loop_header208 ]
  %76 = shl nuw nsw i64 %polly.indvar211, 12
  %scevgep219 = getelementptr i8, i8* %scevgep218, i64 %76
  %scevgep219220 = bitcast i8* %scevgep219 to double*
  %_p_scalar_221 = load double, double* %scevgep219220, align 8, !alias.scope !12, !noalias !13
  %scevgep225 = getelementptr i8, i8* %scevgep224, i64 %76
  %scevgep225226 = bitcast i8* %scevgep225 to double*
  %_p_scalar_227 = load double, double* %scevgep225226, align 8, !alias.scope !8, !noalias !10
  %p_mul51.i = fmul double %_p_scalar_221, %_p_scalar_227
  %p_add56.i = fadd double %p_add56.i282, %p_mul51.i
  %polly.indvar_next212 = shl i64 %polly.indvar211, 12
  %77 = or i64 %polly.indvar_next212, 4096
  %scevgep219.1 = getelementptr i8, i8* %scevgep218, i64 %77
  %scevgep219220.1 = bitcast i8* %scevgep219.1 to double*
  %_p_scalar_221.1 = load double, double* %scevgep219220.1, align 8, !alias.scope !12, !noalias !13
  %scevgep225.1 = getelementptr i8, i8* %scevgep224, i64 %77
  %scevgep225226.1 = bitcast i8* %scevgep225.1 to double*
  %_p_scalar_227.1 = load double, double* %scevgep225226.1, align 8, !alias.scope !8, !noalias !10
  %p_mul51.i.1 = fmul double %_p_scalar_221.1, %_p_scalar_227.1
  %p_add56.i.1 = fadd double %p_add56.i, %p_mul51.i.1
  %polly.indvar_next212.1 = shl i64 %polly.indvar211, 12
  %78 = or i64 %polly.indvar_next212.1, 8192
  %scevgep219.2 = getelementptr i8, i8* %scevgep218, i64 %78
  %scevgep219220.2 = bitcast i8* %scevgep219.2 to double*
  %_p_scalar_221.2 = load double, double* %scevgep219220.2, align 8, !alias.scope !12, !noalias !13
  %scevgep225.2 = getelementptr i8, i8* %scevgep224, i64 %78
  %scevgep225226.2 = bitcast i8* %scevgep225.2 to double*
  %_p_scalar_227.2 = load double, double* %scevgep225226.2, align 8, !alias.scope !8, !noalias !10
  %p_mul51.i.2 = fmul double %_p_scalar_221.2, %_p_scalar_227.2
  %p_add56.i.2 = fadd double %p_add56.i.1, %p_mul51.i.2
  %polly.indvar_next212.2 = shl i64 %polly.indvar211, 12
  %79 = or i64 %polly.indvar_next212.2, 12288
  %scevgep219.3 = getelementptr i8, i8* %scevgep218, i64 %79
  %scevgep219220.3 = bitcast i8* %scevgep219.3 to double*
  %_p_scalar_221.3 = load double, double* %scevgep219220.3, align 8, !alias.scope !12, !noalias !13
  %scevgep225.3 = getelementptr i8, i8* %scevgep224, i64 %79
  %scevgep225226.3 = bitcast i8* %scevgep225.3 to double*
  %_p_scalar_227.3 = load double, double* %scevgep225226.3, align 8, !alias.scope !8, !noalias !10
  %p_mul51.i.3 = fmul double %_p_scalar_221.3, %_p_scalar_227.3
  %p_add56.i.3 = fadd double %p_add56.i.2, %p_mul51.i.3
  %polly.indvar_next212.3 = add nuw nsw i64 %polly.indvar211, 4
  %exitcond290.3 = icmp eq i64 %polly.indvar_next212.3, 512
  br i1 %exitcond290.3, label %polly.stmt.for.body62.i.preheader, label %polly.loop_header208

polly.loop_header241:                             ; preds = %polly.loop_exit250, %polly.loop_preheader242
  %polly.indvar245 = phi i64 [ 0, %polly.loop_preheader242 ], [ %polly.indvar_next246, %polly.loop_exit250 ]
  %80 = shl nsw i64 %polly.indvar245, 5
  %81 = add i64 %80, %indvar.i
  %82 = sub i64 0, %81
  %83 = icmp slt i64 %82, -479
  %84 = select i1 %83, i64 %82, i64 -479
  %85 = add nsw i64 %84, 510
  %polly.loop_guard258 = icmp sgt i64 %84, -511
  br i1 %polly.loop_guard258, label %polly.loop_header248.us, label %polly.loop_exit250

polly.loop_header248.us:                          ; preds = %polly.loop_header241, %polly.loop_exit257.loopexit.us
  %polly.indvar251.us = phi i64 [ %polly.indvar_next252.us, %polly.loop_exit257.loopexit.us ], [ 0, %polly.loop_header241 ]
  %86 = mul nsw i64 %polly.indvar251.us, -32
  %87 = icmp slt i64 %86, -479
  %smin = select i1 %87, i64 %86, i64 -479
  %88 = add nsw i64 %smin, 511
  %89 = shl i64 %polly.indvar251.us, 5
  %xtraiter = and i64 %88, 1
  %unroll_iter = sub nsw i64 %88, %xtraiter
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br label %polly.loop_header255.us

polly.loop_header255.us:                          ; preds = %polly.loop_header248.us, %polly.loop_exit264.us
  %polly.indvar259.us = phi i64 [ %polly.indvar_next260.us, %polly.loop_exit264.us ], [ 0, %polly.loop_header248.us ]
  %90 = add nuw nsw i64 %polly.indvar259.us, %80
  %91 = shl i64 %90, 3
  %scevgep270.us = getelementptr i8, i8* %scevgep269, i64 %91
  %scevgep270271.us = bitcast i8* %scevgep270.us to double*
  %.pre25.i_p_scalar_.us = load double, double* %scevgep270271.us, align 8, !alias.scope !11, !noalias !14
  br label %polly.loop_header262.us

polly.loop_header262.us:                          ; preds = %polly.loop_header262.us, %polly.loop_header255.us
  %polly.indvar265.us = phi i64 [ 0, %polly.loop_header255.us ], [ %polly.indvar_next266.us.1, %polly.loop_header262.us ]
  %niter = phi i64 [ %unroll_iter, %polly.loop_header255.us ], [ %niter.nsub.1, %polly.loop_header262.us ]
  %92 = add nuw nsw i64 %polly.indvar265.us, %89
  %93 = shl i64 %92, 12
  %94 = add nuw nsw i64 %93, %91
  %scevgep274.us = getelementptr i8, i8* %scevgep273, i64 %94
  %scevgep274275.us = bitcast i8* %scevgep274.us to double*
  %_p_scalar_276.us = load double, double* %scevgep274275.us, align 8, !alias.scope !8, !noalias !10
  %scevgep279.us = getelementptr i8, i8* %scevgep197, i64 %93
  %scevgep279280.us = bitcast i8* %scevgep279.us to double*
  %_p_scalar_281.us = load double, double* %scevgep279280.us, align 8, !alias.scope !12, !noalias !13
  %p_mul75.i.us = fmul double %.pre25.i_p_scalar_.us, %_p_scalar_281.us
  %p_sub.i.us = fsub double %_p_scalar_276.us, %p_mul75.i.us
  store double %p_sub.i.us, double* %scevgep274275.us, align 8, !alias.scope !8, !noalias !10
  %polly.indvar_next266.us = or i64 %polly.indvar265.us, 1
  %95 = add nuw nsw i64 %polly.indvar_next266.us, %89
  %96 = shl i64 %95, 12
  %97 = add nuw nsw i64 %96, %91
  %scevgep274.us.1 = getelementptr i8, i8* %scevgep273, i64 %97
  %scevgep274275.us.1 = bitcast i8* %scevgep274.us.1 to double*
  %_p_scalar_276.us.1 = load double, double* %scevgep274275.us.1, align 8, !alias.scope !8, !noalias !10
  %scevgep279.us.1 = getelementptr i8, i8* %scevgep197, i64 %96
  %scevgep279280.us.1 = bitcast i8* %scevgep279.us.1 to double*
  %_p_scalar_281.us.1 = load double, double* %scevgep279280.us.1, align 8, !alias.scope !12, !noalias !13
  %p_mul75.i.us.1 = fmul double %.pre25.i_p_scalar_.us, %_p_scalar_281.us.1
  %p_sub.i.us.1 = fsub double %_p_scalar_276.us.1, %p_mul75.i.us.1
  store double %p_sub.i.us.1, double* %scevgep274275.us.1, align 8, !alias.scope !8, !noalias !10
  %polly.indvar_next266.us.1 = add nuw nsw i64 %polly.indvar265.us, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %polly.loop_exit264.us.unr-lcssa, label %polly.loop_header262.us

polly.loop_exit264.us.unr-lcssa:                  ; preds = %polly.loop_header262.us
  br i1 %lcmp.mod, label %polly.loop_exit264.us, label %polly.loop_header262.us.epil

polly.loop_header262.us.epil:                     ; preds = %polly.loop_exit264.us.unr-lcssa
  %98 = add nuw nsw i64 %polly.indvar_next266.us.1, %89
  %99 = shl i64 %98, 12
  %100 = add nuw nsw i64 %99, %91
  %scevgep274.us.epil = getelementptr i8, i8* %scevgep273, i64 %100
  %scevgep274275.us.epil = bitcast i8* %scevgep274.us.epil to double*
  %_p_scalar_276.us.epil = load double, double* %scevgep274275.us.epil, align 8, !alias.scope !8, !noalias !10
  %scevgep279.us.epil = getelementptr i8, i8* %scevgep197, i64 %99
  %scevgep279280.us.epil = bitcast i8* %scevgep279.us.epil to double*
  %_p_scalar_281.us.epil = load double, double* %scevgep279280.us.epil, align 8, !alias.scope !12, !noalias !13
  %p_mul75.i.us.epil = fmul double %.pre25.i_p_scalar_.us, %_p_scalar_281.us.epil
  %p_sub.i.us.epil = fsub double %_p_scalar_276.us.epil, %p_mul75.i.us.epil
  store double %p_sub.i.us.epil, double* %scevgep274275.us.epil, align 8, !alias.scope !8, !noalias !10
  br label %polly.loop_exit264.us

polly.loop_exit264.us:                            ; preds = %polly.loop_exit264.us.unr-lcssa, %polly.loop_header262.us.epil
  %polly.indvar_next260.us = add nuw nsw i64 %polly.indvar259.us, 1
  %polly.loop_cond261.us = icmp slt i64 %polly.indvar259.us, %85
  br i1 %polly.loop_cond261.us, label %polly.loop_header255.us, label %polly.loop_exit257.loopexit.us

polly.loop_exit257.loopexit.us:                   ; preds = %polly.loop_exit264.us
  %polly.indvar_next252.us = add nuw nsw i64 %polly.indvar251.us, 1
  %exitcond292 = icmp eq i64 %polly.indvar_next252.us, 16
  br i1 %exitcond292, label %polly.loop_exit250, label %polly.loop_header248.us

polly.loop_exit250:                               ; preds = %polly.loop_exit257.loopexit.us, %polly.loop_header241
  %polly.indvar_next246 = add nuw nsw i64 %polly.indvar245, 1
  %polly.loop_cond247 = icmp slt i64 %polly.indvar245, %67
  br i1 %polly.loop_cond247, label %polly.loop_header241, label %polly.stmt.for.end31.i

polly.loop_preheader242:                          ; preds = %polly.loop_exit203
  %scevgep269 = getelementptr i8, i8* %scevgep, i64 %65
  %scevgep273 = getelementptr i8, i8* %scevgep272, i64 %.pre-phi
  br label %polly.loop_header241

for.body16.for.body16_crit_edge.i.1:              ; preds = %for.body16.for.body16_crit_edge.i
  %.pre.i.1 = load double, double* %arrayidx13.i, align 8, !tbaa !2
  %arrayidx20.i.1 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv.next10.i41, i64 %indvar.i
  %101 = load double, double* %arrayidx20.i.1, align 8, !tbaa !2
  %div.i40.1 = fdiv double %101, %.pre.i.1
  %arrayidx28.i.1 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 %indvars.iv.next10.i41, i64 %indvar.i
  store double %div.i40.1, double* %arrayidx28.i.1, align 8, !tbaa !2
  %indvars.iv.next10.i41.1 = add nuw nsw i64 %indvars.iv.next10.i4157, 2
  br label %for.body16.for.body16_crit_edge.i

for.body62.for.body62_crit_edge.i.1:              ; preds = %for.body62.for.body62_crit_edge.i
  %.pre25.i.1 = load double, double* %arrayidx39.i, align 8, !tbaa !2
  %arrayidx66.i.1 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay, i64 %indvars.iv.next16.i, i64 %indvars.iv20.i
  %102 = load double, double* %arrayidx66.i.1, align 8, !tbaa !2
  %arrayidx70.i.1 = getelementptr inbounds [512 x double], [512 x double]* %arraydecay4, i64 %indvars.iv.next16.i, i64 %indvar.i
  %103 = load double, double* %arrayidx70.i.1, align 8, !tbaa !2
  %mul75.i.1 = fmul double %.pre25.i.1, %103
  %sub.i.1 = fsub double %102, %mul75.i.1
  store double %sub.i.1, double* %arrayidx66.i.1, align 8, !tbaa !2
  %indvars.iv.next16.i.1 = add nuw nsw i64 %indvars.iv.next16.i62, 2
  br label %for.body62.for.body62_crit_edge.i

polly.loop_header184.1:                           ; preds = %polly.loop_header184
  %104 = shl nuw nsw i64 %polly.indvar_next188, 12
  %scevgep194.1 = getelementptr i8, i8* %scevgep193, i64 %104
  %scevgep194195.1 = bitcast i8* %scevgep194.1 to double*
  %_p_scalar_.1 = load double, double* %scevgep194195.1, align 8, !alias.scope !8, !noalias !10
  %p_div.i40.1 = fdiv double %_p_scalar_.1, %.pre.i_p_scalar_.pre
  %scevgep198.1 = getelementptr i8, i8* %scevgep197, i64 %104
  %scevgep198199.1 = bitcast i8* %scevgep198.1 to double*
  store double %p_div.i40.1, double* %scevgep198199.1, align 8, !alias.scope !12, !noalias !13
  %polly.indvar_next188.1 = add nuw nsw i64 %polly.indvar187, 2
  br label %polly.loop_header184
}

declare dso_local i8* @polybench_alloc_data(i32, i32) local_unnamed_addr #1

declare dso_local i32 @free(...) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { cold nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 (git@github.com:SusanTan/llvm-project.git fcc6352b59353e5ddb5bfbd85a3919893d4595c9)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = distinct !{!8, !9, !"polly.alias.scope.MemRef1"}
!9 = distinct !{!9, !"polly.alias.scope.domain"}
!10 = !{!11, !12}
!11 = distinct !{!11, !9, !"polly.alias.scope.MemRef0"}
!12 = distinct !{!12, !9, !"polly.alias.scope.MemRef2"}
!13 = !{!11, !8}
!14 = !{!8, !12}
