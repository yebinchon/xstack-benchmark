; ModuleID = 'ludcmp.c'
source_filename = "ludcmp.c"
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
  %call = tail call i8* @polybench_alloc_data(i32 1050625, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i32 1025, i32 8) #4
  %0 = bitcast i8* %call1 to i64*
  %polly.access.cast.call1124 = bitcast i8* %call1 to double*
  %call2 = tail call i8* @polybench_alloc_data(i32 1025, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i32 1025, i32 8) #4
  %1 = bitcast i8* %call3 to i64*
  %arraydecay = bitcast i8* %call to [1025 x double]*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  %polly.access.call3 = getelementptr i8, i8* %call3, i64 8200
  %polly.access.cast.call = bitcast i8* %call to double*
  %2 = icmp ule i8* %polly.access.call3, %call
  %polly.access.call57 = getelementptr i8, i8* %call, i64 8405000
  %3 = icmp ule i8* %polly.access.call57, %call3
  %4 = or i1 %3, %2
  %polly.access.call1 = getelementptr i8, i8* %call1, i64 8200
  %5 = icmp ule i8* %polly.access.call1, %call
  %6 = icmp ule i8* %polly.access.call57, %call1
  %7 = or i1 %6, %5
  %8 = and i1 %7, %4
  %polly.access.call2 = getelementptr i8, i8* %call2, i64 8200
  %9 = icmp ule i8* %polly.access.call2, %call
  %10 = icmp ule i8* %polly.access.call57, %call2
  %11 = or i1 %10, %9
  %12 = and i1 %11, %8
  %13 = icmp ule i8* %polly.access.call1, %call3
  %14 = icmp ule i8* %polly.access.call3, %call1
  %15 = or i1 %13, %14
  %16 = and i1 %15, %12
  %17 = icmp ule i8* %polly.access.call2, %call3
  %18 = icmp ule i8* %polly.access.call3, %call2
  %19 = or i1 %17, %18
  %20 = and i1 %19, %16
  %21 = icmp ule i8* %polly.access.call2, %call1
  %22 = icmp ule i8* %polly.access.call1, %call2
  %23 = or i1 %22, %21
  %24 = and i1 %23, %20
  br i1 %24, label %polly.loop_header, label %for.body.i

for.cond.loopexit.i:                              ; preds = %for.body17.i
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 1025
  br i1 %exitcond5.i, label %init_array.exit, label %for.body.i

for.body.i:                                       ; preds = %entry, %for.cond.loopexit.i
  %indvars.iv3.i = phi i64 [ %indvars.iv.next4.i, %for.cond.loopexit.i ], [ 0, %entry ]
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1
  %25 = trunc i64 %indvars.iv.next4.i to i32
  %conv.i = sitofp i32 %25 to double
  %arrayidx.i = getelementptr inbounds double, double* %arraydecay5, i64 %indvars.iv3.i
  store double %conv.i, double* %arrayidx.i, align 8, !tbaa !2
  %div.i = lshr i32 %25, 10
  %conv2.i = sitofp i32 %div.i to double
  %div3.i = fmul double %conv2.i, 5.000000e-01
  %add4.i = fadd double %div3.i, 1.000000e+00
  %arrayidx6.i = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv3.i
  store double %add4.i, double* %arrayidx6.i, align 8, !tbaa !2
  %add11.i = fadd double %div3.i, 4.200000e+01
  %arrayidx13.i = getelementptr inbounds double, double* %polly.access.cast.call1124, i64 %indvars.iv3.i
  store double %add11.i, double* %arrayidx13.i, align 8, !tbaa !2
  br label %for.body17.i

for.body17.i:                                     ; preds = %for.body17.i.1, %for.body.i
  %indvars.iv.i = phi i64 [ 0, %for.body.i ], [ %indvars.iv.next.i.1, %for.body17.i.1 ]
  %indvars.iv.next.i = or i64 %indvars.iv.i, 1
  %26 = trunc i64 %indvars.iv.next.i to i32
  %conv21.i = sitofp i32 %26 to double
  %mul.i = fmul double %conv.i, %conv21.i
  %div23.i = fmul double %mul.i, 0x3F50000000000000
  %arrayidx27.i = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %indvars.iv.i
  store double %div23.i, double* %arrayidx27.i, align 8, !tbaa !2
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1025
  br i1 %exitcond.i, label %for.cond.loopexit.i, label %for.body17.i.1

init_array.exit:                                  ; preds = %for.cond.loopexit.i
  store double 1.000000e+00, double* %polly.access.cast.call1124, align 8, !tbaa !2
  br label %for.body3.lr.ph.i

for.cond.loopexit.i33:                            ; preds = %for.end54.i
  %indvars.iv.next36.i = add nuw nsw i64 %indvars.iv35.i, 1
  %exitcond51.i = icmp eq i64 %indvars.iv.next50.i, 1024
  br i1 %exitcond51.i, label %for.end65.i, label %for.body3.lr.ph.i

for.body3.lr.ph.i:                                ; preds = %for.cond.loopexit.i33, %init_array.exit
  %indvars.iv49.i = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next50.i, %for.cond.loopexit.i33 ]
  %indvars.iv35.i = phi i64 [ 1, %init_array.exit ], [ %indvars.iv.next36.i, %for.cond.loopexit.i33 ]
  %27 = add nuw i64 %indvars.iv49.i, 1
  %cmp88.i = icmp eq i64 %indvars.iv49.i, 0
  %arrayidx21.i = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv49.i, i64 %indvars.iv49.i
  %xtraiter376 = and i64 %indvars.iv49.i, 1
  br i1 %cmp88.i, label %for.body3.i.us.preheader, label %for.body3.i.preheader

for.body3.i.preheader:                            ; preds = %for.body3.lr.ph.i
  %28 = icmp eq i64 %indvars.iv49.i, 1
  %unroll_iter374 = sub nsw i64 %indvars.iv49.i, %xtraiter376
  %lcmp.mod373 = icmp eq i64 %xtraiter376, 0
  br label %for.body3.i

for.body3.i.us.preheader:                         ; preds = %for.body3.lr.ph.i
  %lcmp.mod377 = icmp eq i64 %xtraiter376, 0
  br i1 %lcmp.mod377, label %for.body3.i.us.prol.loopexit, label %for.body3.i.us.prol

for.body3.i.us.prol:                              ; preds = %for.body3.i.us.preheader
  %arrayidx6.i34.us.prol = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv35.i, i64 0
  %29 = load double, double* %arrayidx6.i34.us.prol, align 8, !tbaa !2
  %30 = load double, double* %arrayidx21.i, align 8, !tbaa !2
  %div.i37.us.prol = fdiv double %29, %30
  store double %div.i37.us.prol, double* %arrayidx6.i34.us.prol, align 8, !tbaa !2
  %indvars.iv.next38.i.us.prol = add nuw nsw i64 %indvars.iv35.i, 1
  br label %for.body3.i.us.prol.loopexit

for.body3.i.us.prol.loopexit:                     ; preds = %for.body3.i.us.prol, %for.body3.i.us.preheader
  %indvars.iv37.i.us.unr.ph = phi i64 [ %indvars.iv.next38.i.us.prol, %for.body3.i.us.prol ], [ %indvars.iv35.i, %for.body3.i.us.preheader ]
  %31 = icmp eq i64 %indvars.iv49.i, 1023
  br i1 %31, label %for.body32.i.preheader, label %for.body3.i.us

for.body3.i.us:                                   ; preds = %for.body3.i.us.prol.loopexit, %for.body3.i.us
  %indvars.iv37.i.us = phi i64 [ %indvars.iv.next38.i.us.1, %for.body3.i.us ], [ %indvars.iv37.i.us.unr.ph, %for.body3.i.us.prol.loopexit ]
  %arrayidx6.i34.us = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv37.i.us, i64 0
  %32 = load double, double* %arrayidx6.i34.us, align 8, !tbaa !2
  %33 = load double, double* %arrayidx21.i, align 8, !tbaa !2
  %div.i37.us = fdiv double %32, %33
  store double %div.i37.us, double* %arrayidx6.i34.us, align 8, !tbaa !2
  %indvars.iv.next38.i.us = add nuw nsw i64 %indvars.iv37.i.us, 1
  %arrayidx6.i34.us.1 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv.next38.i.us, i64 0
  %34 = load double, double* %arrayidx6.i34.us.1, align 8, !tbaa !2
  %35 = load double, double* %arrayidx21.i, align 8, !tbaa !2
  %div.i37.us.1 = fdiv double %34, %35
  store double %div.i37.us.1, double* %arrayidx6.i34.us.1, align 8, !tbaa !2
  %indvars.iv.next38.i.us.1 = add nuw nsw i64 %indvars.iv37.i.us, 2
  %exitcond39.i.us.1 = icmp eq i64 %indvars.iv.next38.i.us.1, 1025
  br i1 %exitcond39.i.us.1, label %for.body32.i.preheader, label %for.body3.i.us

for.body3.i:                                      ; preds = %for.body3.i.preheader, %for.end.i
  %indvars.iv37.i = phi i64 [ %indvars.iv.next38.i, %for.end.i ], [ %indvars.iv35.i, %for.body3.i.preheader ]
  %arrayidx6.i34 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv37.i, i64 %indvars.iv49.i
  %36 = load double, double* %arrayidx6.i34, align 8, !tbaa !2
  br i1 %28, label %for.end.i.unr-lcssa, label %for.body9.i

for.body9.i:                                      ; preds = %for.body3.i, %for.body9.i
  %indvars.iv32.i = phi i64 [ %indvars.iv.next33.i.1, %for.body9.i ], [ 0, %for.body3.i ]
  %w.010.i = phi double [ %sub.i.1, %for.body9.i ], [ %36, %for.body3.i ]
  %niter375 = phi i64 [ %niter375.nsub.1, %for.body9.i ], [ %unroll_iter374, %for.body3.i ]
  %arrayidx13.i35 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv37.i, i64 %indvars.iv32.i
  %37 = load double, double* %arrayidx13.i35, align 8, !tbaa !2
  %arrayidx17.i = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv32.i, i64 %indvars.iv49.i
  %38 = load double, double* %arrayidx17.i, align 8, !tbaa !2
  %mul.i36 = fmul double %37, %38
  %sub.i = fsub double %w.010.i, %mul.i36
  %indvars.iv.next33.i = or i64 %indvars.iv32.i, 1
  %arrayidx13.i35.1 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv37.i, i64 %indvars.iv.next33.i
  %39 = load double, double* %arrayidx13.i35.1, align 8, !tbaa !2
  %arrayidx17.i.1 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv.next33.i, i64 %indvars.iv49.i
  %40 = load double, double* %arrayidx17.i.1, align 8, !tbaa !2
  %mul.i36.1 = fmul double %39, %40
  %sub.i.1 = fsub double %sub.i, %mul.i36.1
  %indvars.iv.next33.i.1 = add nuw nsw i64 %indvars.iv32.i, 2
  %niter375.nsub.1 = add i64 %niter375, -2
  %niter375.ncmp.1 = icmp eq i64 %niter375.nsub.1, 0
  br i1 %niter375.ncmp.1, label %for.end.i.unr-lcssa, label %for.body9.i

for.end.i.unr-lcssa:                              ; preds = %for.body9.i, %for.body3.i
  %sub.i.lcssa.ph = phi double [ undef, %for.body3.i ], [ %sub.i.1, %for.body9.i ]
  %indvars.iv32.i.unr = phi i64 [ 0, %for.body3.i ], [ %indvars.iv.next33.i.1, %for.body9.i ]
  %w.010.i.unr = phi double [ %36, %for.body3.i ], [ %sub.i.1, %for.body9.i ]
  br i1 %lcmp.mod373, label %for.end.i, label %for.end.i.epilog-lcssa

for.end.i.epilog-lcssa:                           ; preds = %for.end.i.unr-lcssa
  %arrayidx13.i35.epil = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv37.i, i64 %indvars.iv32.i.unr
  %41 = load double, double* %arrayidx13.i35.epil, align 8, !tbaa !2
  %arrayidx17.i.epil = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv32.i.unr, i64 %indvars.iv49.i
  %42 = load double, double* %arrayidx17.i.epil, align 8, !tbaa !2
  %mul.i36.epil = fmul double %41, %42
  %sub.i.epil = fsub double %w.010.i.unr, %mul.i36.epil
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.unr-lcssa, %for.end.i.epilog-lcssa
  %sub.i.lcssa = phi double [ %sub.i.lcssa.ph, %for.end.i.unr-lcssa ], [ %sub.i.epil, %for.end.i.epilog-lcssa ]
  %43 = load double, double* %arrayidx21.i, align 8, !tbaa !2
  %div.i37 = fdiv double %sub.i.lcssa, %43
  store double %div.i37, double* %arrayidx6.i34, align 8, !tbaa !2
  %indvars.iv.next38.i = add nuw nsw i64 %indvars.iv37.i, 1
  %exitcond39.i = icmp eq i64 %indvars.iv.next38.i, 1025
  br i1 %exitcond39.i, label %for.body32.i.preheader, label %for.body3.i

for.body32.i.preheader:                           ; preds = %for.end.i, %for.body3.i.us.prol.loopexit, %for.body3.i.us
  %indvars.iv.next50.i = add nuw nsw i64 %indvars.iv49.i, 1
  %xtraiter378 = and i64 %27, 1
  %44 = icmp eq i64 %indvars.iv49.i, 0
  %unroll_iter380 = sub nuw i64 %27, %xtraiter378
  %lcmp.mod379 = icmp eq i64 %xtraiter378, 0
  br label %for.body32.i

for.body32.i:                                     ; preds = %for.body32.i.preheader, %for.end54.i
  %indvars.iv46.i = phi i64 [ %indvars.iv.next47.i, %for.end54.i ], [ %indvars.iv35.i, %for.body32.i.preheader ]
  %arrayidx37.i = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv.next50.i, i64 %indvars.iv46.i
  %45 = load double, double* %arrayidx37.i, align 8, !tbaa !2
  br i1 %44, label %for.end54.i.unr-lcssa, label %for.body40.i

for.body40.i:                                     ; preds = %for.body32.i, %for.body40.i
  %indvars.iv40.i = phi i64 [ %indvars.iv.next41.i.1, %for.body40.i ], [ 0, %for.body32.i ]
  %w.115.i = phi double [ %sub51.i.1, %for.body40.i ], [ %45, %for.body32.i ]
  %niter381 = phi i64 [ %niter381.nsub.1, %for.body40.i ], [ %unroll_iter380, %for.body32.i ]
  %arrayidx45.i = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv.next50.i, i64 %indvars.iv40.i
  %46 = load double, double* %arrayidx45.i, align 8, !tbaa !2
  %arrayidx49.i = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv40.i, i64 %indvars.iv46.i
  %47 = load double, double* %arrayidx49.i, align 8, !tbaa !2
  %mul50.i = fmul double %46, %47
  %sub51.i = fsub double %w.115.i, %mul50.i
  %indvars.iv.next41.i = or i64 %indvars.iv40.i, 1
  %arrayidx45.i.1 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv.next50.i, i64 %indvars.iv.next41.i
  %48 = load double, double* %arrayidx45.i.1, align 8, !tbaa !2
  %arrayidx49.i.1 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv.next41.i, i64 %indvars.iv46.i
  %49 = load double, double* %arrayidx49.i.1, align 8, !tbaa !2
  %mul50.i.1 = fmul double %48, %49
  %sub51.i.1 = fsub double %sub51.i, %mul50.i.1
  %indvars.iv.next41.i.1 = add nuw nsw i64 %indvars.iv40.i, 2
  %niter381.nsub.1 = add i64 %niter381, -2
  %niter381.ncmp.1 = icmp eq i64 %niter381.nsub.1, 0
  br i1 %niter381.ncmp.1, label %for.end54.i.unr-lcssa, label %for.body40.i

for.end54.i.unr-lcssa:                            ; preds = %for.body40.i, %for.body32.i
  %sub51.i.lcssa.ph = phi double [ undef, %for.body32.i ], [ %sub51.i.1, %for.body40.i ]
  %indvars.iv40.i.unr = phi i64 [ 0, %for.body32.i ], [ %indvars.iv.next41.i.1, %for.body40.i ]
  %w.115.i.unr = phi double [ %45, %for.body32.i ], [ %sub51.i.1, %for.body40.i ]
  br i1 %lcmp.mod379, label %for.end54.i, label %for.end54.i.epilog-lcssa

for.end54.i.epilog-lcssa:                         ; preds = %for.end54.i.unr-lcssa
  %arrayidx45.i.epil = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv.next50.i, i64 %indvars.iv40.i.unr
  %50 = load double, double* %arrayidx45.i.epil, align 8, !tbaa !2
  %arrayidx49.i.epil = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv40.i.unr, i64 %indvars.iv46.i
  %51 = load double, double* %arrayidx49.i.epil, align 8, !tbaa !2
  %mul50.i.epil = fmul double %50, %51
  %sub51.i.epil = fsub double %w.115.i.unr, %mul50.i.epil
  br label %for.end54.i

for.end54.i:                                      ; preds = %for.end54.i.unr-lcssa, %for.end54.i.epilog-lcssa
  %sub51.i.lcssa = phi double [ %sub51.i.lcssa.ph, %for.end54.i.unr-lcssa ], [ %sub51.i.epil, %for.end54.i.epilog-lcssa ]
  store double %sub51.i.lcssa, double* %arrayidx37.i, align 8, !tbaa !2
  %indvars.iv.next47.i = add nuw nsw i64 %indvars.iv46.i, 1
  %exitcond48.i = icmp eq i64 %indvars.iv.next47.i, 1025
  br i1 %exitcond48.i, label %for.cond.loopexit.i33, label %for.body32.i

for.end65.i:                                      ; preds = %for.cond.loopexit.i33
  %52 = load i64, i64* %0, align 8, !tbaa !2
  store i64 %52, i64* %1, align 8, !tbaa !2
  br label %for.body70.i

for.body70.i:                                     ; preds = %for.end86.i, %for.end65.i
  %indvar = phi i64 [ %indvar.next, %for.end86.i ], [ 0, %for.end65.i ]
  %indvars.iv29.i = phi i64 [ %indvars.iv.next30.i, %for.end86.i ], [ 1, %for.end65.i ]
  %53 = add i64 %indvar, 1
  %arrayidx72.i = getelementptr inbounds double, double* %polly.access.cast.call1124, i64 %indvars.iv29.i
  %54 = load double, double* %arrayidx72.i, align 8, !tbaa !2
  %xtraiter367 = and i64 %53, 3
  %55 = icmp ult i64 %indvar, 3
  br i1 %55, label %for.end86.i.unr-lcssa, label %for.body70.i.new

for.body70.i.new:                                 ; preds = %for.body70.i
  %unroll_iter370 = sub i64 %53, %xtraiter367
  br label %for.body75.i

for.body75.i:                                     ; preds = %for.body75.i, %for.body70.i.new
  %indvars.iv26.i = phi i64 [ 0, %for.body70.i.new ], [ %indvars.iv.next27.i.3, %for.body75.i ]
  %w.26.i = phi double [ %54, %for.body70.i.new ], [ %sub83.i.3, %for.body75.i ]
  %niter371 = phi i64 [ %unroll_iter370, %for.body70.i.new ], [ %niter371.nsub.3, %for.body75.i ]
  %arrayidx79.i = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %indvars.iv26.i
  %56 = load double, double* %arrayidx79.i, align 8, !tbaa !2
  %arrayidx81.i = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv26.i
  %57 = load double, double* %arrayidx81.i, align 8, !tbaa !2
  %mul82.i = fmul double %56, %57
  %sub83.i = fsub double %w.26.i, %mul82.i
  %indvars.iv.next27.i = or i64 %indvars.iv26.i, 1
  %arrayidx79.i.1 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %indvars.iv.next27.i
  %58 = load double, double* %arrayidx79.i.1, align 8, !tbaa !2
  %arrayidx81.i.1 = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv.next27.i
  %59 = load double, double* %arrayidx81.i.1, align 8, !tbaa !2
  %mul82.i.1 = fmul double %58, %59
  %sub83.i.1 = fsub double %sub83.i, %mul82.i.1
  %indvars.iv.next27.i.1 = or i64 %indvars.iv26.i, 2
  %arrayidx79.i.2 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %indvars.iv.next27.i.1
  %60 = load double, double* %arrayidx79.i.2, align 8, !tbaa !2
  %arrayidx81.i.2 = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv.next27.i.1
  %61 = load double, double* %arrayidx81.i.2, align 8, !tbaa !2
  %mul82.i.2 = fmul double %60, %61
  %sub83.i.2 = fsub double %sub83.i.1, %mul82.i.2
  %indvars.iv.next27.i.2 = or i64 %indvars.iv26.i, 3
  %arrayidx79.i.3 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %indvars.iv.next27.i.2
  %62 = load double, double* %arrayidx79.i.3, align 8, !tbaa !2
  %arrayidx81.i.3 = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv.next27.i.2
  %63 = load double, double* %arrayidx81.i.3, align 8, !tbaa !2
  %mul82.i.3 = fmul double %62, %63
  %sub83.i.3 = fsub double %sub83.i.2, %mul82.i.3
  %indvars.iv.next27.i.3 = add nuw nsw i64 %indvars.iv26.i, 4
  %niter371.nsub.3 = add i64 %niter371, -4
  %niter371.ncmp.3 = icmp eq i64 %niter371.nsub.3, 0
  br i1 %niter371.ncmp.3, label %for.end86.i.unr-lcssa, label %for.body75.i

for.end86.i.unr-lcssa:                            ; preds = %for.body75.i, %for.body70.i
  %sub83.i.lcssa.ph = phi double [ undef, %for.body70.i ], [ %sub83.i.3, %for.body75.i ]
  %indvars.iv26.i.unr = phi i64 [ 0, %for.body70.i ], [ %indvars.iv.next27.i.3, %for.body75.i ]
  %w.26.i.unr = phi double [ %54, %for.body70.i ], [ %sub83.i.3, %for.body75.i ]
  %lcmp.mod368 = icmp eq i64 %xtraiter367, 0
  br i1 %lcmp.mod368, label %for.end86.i, label %for.body75.i.epil

for.body75.i.epil:                                ; preds = %for.end86.i.unr-lcssa, %for.body75.i.epil
  %indvars.iv26.i.epil = phi i64 [ %indvars.iv.next27.i.epil, %for.body75.i.epil ], [ %indvars.iv26.i.unr, %for.end86.i.unr-lcssa ]
  %w.26.i.epil = phi double [ %sub83.i.epil, %for.body75.i.epil ], [ %w.26.i.unr, %for.end86.i.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %for.body75.i.epil ], [ %xtraiter367, %for.end86.i.unr-lcssa ]
  %arrayidx79.i.epil = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %indvars.iv26.i.epil
  %64 = load double, double* %arrayidx79.i.epil, align 8, !tbaa !2
  %arrayidx81.i.epil = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv26.i.epil
  %65 = load double, double* %arrayidx81.i.epil, align 8, !tbaa !2
  %mul82.i.epil = fmul double %64, %65
  %sub83.i.epil = fsub double %w.26.i.epil, %mul82.i.epil
  %indvars.iv.next27.i.epil = add nuw nsw i64 %indvars.iv26.i.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %for.end86.i, label %for.body75.i.epil, !llvm.loop !6

for.end86.i:                                      ; preds = %for.body75.i.epil, %for.end86.i.unr-lcssa
  %sub83.i.lcssa = phi double [ %sub83.i.lcssa.ph, %for.end86.i.unr-lcssa ], [ %sub83.i.epil, %for.body75.i.epil ]
  %arrayidx88.i = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv29.i
  store double %sub83.i.lcssa, double* %arrayidx88.i, align 8, !tbaa !2
  %indvars.iv.next30.i = add nuw nsw i64 %indvars.iv29.i, 1
  %exitcond31.i = icmp eq i64 %indvars.iv.next30.i, 1025
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond31.i, label %for.end91.i, label %for.body70.i

for.end91.i:                                      ; preds = %for.end86.i
  %arrayidx93.i = getelementptr inbounds i8, i8* %call3, i64 8192
  %66 = bitcast i8* %arrayidx93.i to double*
  %67 = load double, double* %66, align 8, !tbaa !2
  %arrayidx97.i = getelementptr inbounds i8, i8* %call, i64 8404992
  %68 = bitcast i8* %arrayidx97.i to double*
  %69 = load double, double* %68, align 8, !tbaa !2
  %div98.i = fdiv double %67, %69
  %arrayidx100.i = getelementptr inbounds i8, i8* %call2, i64 8192
  %70 = bitcast i8* %arrayidx100.i to double*
  store double %div98.i, double* %70, align 8, !tbaa !2
  br label %for.body112.preheader.i

for.body112.preheader.i:                          ; preds = %for.end125.i, %for.end91.i
  %indvars.iv22.i = phi i64 [ 0, %for.end91.i ], [ %indvars.iv.next23.i, %for.end125.i ]
  %indvars.iv.i38 = phi i64 [ 1024, %for.end91.i ], [ %indvars.iv.next.i40, %for.end125.i ]
  %71 = add nuw i64 %indvars.iv22.i, 1
  %72 = sub nuw nsw i64 1023, %indvars.iv22.i
  %arrayidx108.i = getelementptr inbounds double, double* %arraydecay6, i64 %72
  %73 = load double, double* %arrayidx108.i, align 8, !tbaa !2
  %xtraiter365 = and i64 %71, 3
  %lcmp.mod366 = icmp eq i64 %xtraiter365, 0
  br i1 %lcmp.mod366, label %for.body112.i.prol.loopexit, label %for.body112.i.prol

for.body112.i.prol:                               ; preds = %for.body112.preheader.i, %for.body112.i.prol
  %indvars.iv20.i.prol = phi i64 [ %indvars.iv.next21.i.prol, %for.body112.i.prol ], [ %indvars.iv.i38, %for.body112.preheader.i ]
  %w.33.i.prol = phi double [ %sub122.i.prol, %for.body112.i.prol ], [ %73, %for.body112.preheader.i ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body112.i.prol ], [ %xtraiter365, %for.body112.preheader.i ]
  %arrayidx118.i.prol = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %72, i64 %indvars.iv20.i.prol
  %74 = load double, double* %arrayidx118.i.prol, align 8, !tbaa !2
  %arrayidx120.i.prol = getelementptr inbounds double, double* %arraydecay5, i64 %indvars.iv20.i.prol
  %75 = load double, double* %arrayidx120.i.prol, align 8, !tbaa !2
  %mul121.i.prol = fmul double %74, %75
  %sub122.i.prol = fsub double %w.33.i.prol, %mul121.i.prol
  %indvars.iv.next21.i.prol = add nuw nsw i64 %indvars.iv20.i.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body112.i.prol.loopexit, label %for.body112.i.prol, !llvm.loop !8

for.body112.i.prol.loopexit:                      ; preds = %for.body112.i.prol, %for.body112.preheader.i
  %sub122.i.lcssa.unr = phi double [ undef, %for.body112.preheader.i ], [ %sub122.i.prol, %for.body112.i.prol ]
  %indvars.iv20.i.unr = phi i64 [ %indvars.iv.i38, %for.body112.preheader.i ], [ %indvars.iv.next21.i.prol, %for.body112.i.prol ]
  %w.33.i.unr = phi double [ %73, %for.body112.preheader.i ], [ %sub122.i.prol, %for.body112.i.prol ]
  %76 = icmp ult i64 %indvars.iv22.i, 3
  br i1 %76, label %for.end125.i, label %for.body112.i

for.body112.i:                                    ; preds = %for.body112.i.prol.loopexit, %for.body112.i
  %indvars.iv20.i = phi i64 [ %indvars.iv.next21.i.3, %for.body112.i ], [ %indvars.iv20.i.unr, %for.body112.i.prol.loopexit ]
  %w.33.i = phi double [ %sub122.i.3, %for.body112.i ], [ %w.33.i.unr, %for.body112.i.prol.loopexit ]
  %arrayidx118.i = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %72, i64 %indvars.iv20.i
  %77 = load double, double* %arrayidx118.i, align 8, !tbaa !2
  %arrayidx120.i = getelementptr inbounds double, double* %arraydecay5, i64 %indvars.iv20.i
  %78 = load double, double* %arrayidx120.i, align 8, !tbaa !2
  %mul121.i = fmul double %77, %78
  %sub122.i = fsub double %w.33.i, %mul121.i
  %indvars.iv.next21.i = add nuw nsw i64 %indvars.iv20.i, 1
  %arrayidx118.i.1 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %72, i64 %indvars.iv.next21.i
  %79 = load double, double* %arrayidx118.i.1, align 8, !tbaa !2
  %arrayidx120.i.1 = getelementptr inbounds double, double* %arraydecay5, i64 %indvars.iv.next21.i
  %80 = load double, double* %arrayidx120.i.1, align 8, !tbaa !2
  %mul121.i.1 = fmul double %79, %80
  %sub122.i.1 = fsub double %sub122.i, %mul121.i.1
  %indvars.iv.next21.i.1 = add nuw nsw i64 %indvars.iv20.i, 2
  %arrayidx118.i.2 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %72, i64 %indvars.iv.next21.i.1
  %81 = load double, double* %arrayidx118.i.2, align 8, !tbaa !2
  %arrayidx120.i.2 = getelementptr inbounds double, double* %arraydecay5, i64 %indvars.iv.next21.i.1
  %82 = load double, double* %arrayidx120.i.2, align 8, !tbaa !2
  %mul121.i.2 = fmul double %81, %82
  %sub122.i.2 = fsub double %sub122.i.1, %mul121.i.2
  %indvars.iv.next21.i.2 = add nuw nsw i64 %indvars.iv20.i, 3
  %arrayidx118.i.3 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %72, i64 %indvars.iv.next21.i.2
  %83 = load double, double* %arrayidx118.i.3, align 8, !tbaa !2
  %arrayidx120.i.3 = getelementptr inbounds double, double* %arraydecay5, i64 %indvars.iv.next21.i.2
  %84 = load double, double* %arrayidx120.i.3, align 8, !tbaa !2
  %mul121.i.3 = fmul double %83, %84
  %sub122.i.3 = fsub double %sub122.i.2, %mul121.i.3
  %indvars.iv.next21.i.3 = add nuw nsw i64 %indvars.iv20.i, 4
  %exitcond.i39.3 = icmp eq i64 %indvars.iv.next21.i.3, 1025
  br i1 %exitcond.i39.3, label %for.end125.i, label %for.body112.i

for.end125.i:                                     ; preds = %for.body112.i, %for.body112.i.prol.loopexit
  %sub122.i.lcssa = phi double [ %sub122.i.lcssa.unr, %for.body112.i.prol.loopexit ], [ %sub122.i.3, %for.body112.i ]
  %arrayidx133.i = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %72, i64 %72
  %85 = load double, double* %arrayidx133.i, align 8, !tbaa !2
  %div134.i = fdiv double %sub122.i.lcssa, %85
  %arrayidx138.i = getelementptr inbounds double, double* %arraydecay5, i64 %72
  store double %div134.i, double* %arrayidx138.i, align 8, !tbaa !2
  %indvars.iv.next23.i = add nuw nsw i64 %indvars.iv22.i, 1
  %indvars.iv.next.i40 = add nsw i64 %indvars.iv.i38, -1
  %exitcond25.i = icmp eq i64 %indvars.iv.next23.i, 1024
  br i1 %exitcond25.i, label %kernel_ludcmp.exit, label %for.body112.preheader.i

kernel_ludcmp.exit:                               ; preds = %for.end125.i, %polly.stmt.for.end125.i
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %kernel_ludcmp.exit
  %86 = load i8*, i8** %argv, align 8, !tbaa !9
  %strcmpload = load i8, i8* %86, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %for.body.i43, label %if.end

for.body.i43:                                     ; preds = %land.lhs.true, %for.inc.i
  %indvars.iv.i41 = phi i64 [ %indvars.iv.next.i44, %for.inc.i ], [ 0, %land.lhs.true ]
  %i.02.i = phi i32 [ %inc.i, %for.inc.i ], [ 0, %land.lhs.true ]
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %arrayidx.i42 = getelementptr inbounds double, double* %arraydecay5, i64 %indvars.iv.i41
  %88 = load double, double* %arrayidx.i42, align 8, !tbaa !2
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %87, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %88) #5
  %rem.lhs.trunc.i = trunc i32 %i.02.i to i16
  %rem1.i = urem i16 %rem.lhs.trunc.i, 20
  %cmp1.i = icmp eq i16 %rem1.i, 0
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body.i43
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %89) #5
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i43
  %indvars.iv.next.i44 = add nuw nsw i64 %indvars.iv.i41, 1
  %inc.i = add nuw nsw i32 %i.02.i, 1
  %exitcond.i45 = icmp eq i64 %indvars.iv.next.i44, 1025
  br i1 %exitcond.i45, label %if.end, label %for.body.i43

if.end:                                           ; preds = %for.inc.i, %land.lhs.true, %kernel_ludcmp.exit
  %call13 = tail call i32 (i8*, ...) bitcast (i32 (...)* @free to i32 (i8*, ...)*)(i8* %call) #4
  %call14 = tail call i32 (i8*, ...) bitcast (i32 (...)* @free to i32 (i8*, ...)*)(i8* %call1) #4
  %call15 = tail call i32 (i8*, ...) bitcast (i32 (...)* @free to i32 (i8*, ...)*)(i8* nonnull %call2) #4
  %call16 = tail call i32 (i8*, ...) bitcast (i32 (...)* @free to i32 (i8*, ...)*)(i8* %call3) #4
  ret i32 0

polly.stmt.init_array.exit:                       ; preds = %polly.loop_exit136
  store double 1.000000e+00, double* %polly.access.cast.call1124, align 8, !alias.scope !11, !noalias !13
  %scevgep166 = getelementptr i8, i8* %call, i64 8200
  %scevgep211 = getelementptr i8, i8* %call, i64 8
  br label %polly.loop_header144

polly.stmt.for.end65.i:                           ; preds = %polly.loop_exit192
  %_p_scalar_221 = load i64, i64* %0, align 8, !alias.scope !11, !noalias !13
  store i64 %_p_scalar_221, i64* %1, align 8, !alias.scope !15, !noalias !17
  %scevgep228 = getelementptr i8, i8* %call1, i64 8
  br label %polly.loop_header222

polly.stmt.for.end91.i:                           ; preds = %polly.loop_exit236
  %scevgep252 = getelementptr i8, i8* %call3, i64 8192
  %scevgep252253 = bitcast i8* %scevgep252 to double*
  %_p_scalar_254 = load double, double* %scevgep252253, align 8, !alias.scope !15, !noalias !17
  %scevgep255 = getelementptr i8, i8* %call, i64 8404992
  %scevgep255256 = bitcast i8* %scevgep255 to double*
  %_p_scalar_257 = load double, double* %scevgep255256, align 8, !alias.scope !16, !noalias !18
  %p_div98.i = fdiv double %_p_scalar_254, %_p_scalar_257
  %scevgep258 = getelementptr i8, i8* %call2, i64 8192
  %scevgep258259 = bitcast i8* %scevgep258 to double*
  store double %p_div98.i, double* %scevgep258259, align 8, !alias.scope !14, !noalias !19
  %scevgep266 = getelementptr i8, i8* %call3, i64 8184
  %scevgep280 = getelementptr i8, i8* %call, i64 8396792
  %scevgep294 = getelementptr i8, i8* %call, i64 8396784
  %scevgep298 = getelementptr i8, i8* %call2, i64 8184
  br label %polly.loop_header260

polly.loop_header:                                ; preds = %entry, %polly.loop_exit136
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit136 ], [ 0, %entry ]
  %90 = trunc i64 %polly.indvar to i32
  %91 = add nuw nsw i32 %90, 1
  %p_conv.i = sitofp i32 %91 to double
  %92 = shl nuw nsw i64 %polly.indvar, 3
  %scevgep = getelementptr i8, i8* %call2, i64 %92
  %scevgep128 = bitcast i8* %scevgep to double*
  store double %p_conv.i, double* %scevgep128, align 8, !alias.scope !14, !noalias !19
  %93 = lshr i32 %91, 10
  %p_conv2.i = sitofp i32 %93 to double
  %p_div3.i = fmul double %p_conv2.i, 5.000000e-01
  %p_add4.i = fadd double %p_div3.i, 1.000000e+00
  %scevgep130 = getelementptr i8, i8* %call3, i64 %92
  %scevgep130131 = bitcast i8* %scevgep130 to double*
  store double %p_add4.i, double* %scevgep130131, align 8, !alias.scope !15, !noalias !17
  %p_add11.i = fadd double %p_div3.i, 4.200000e+01
  %scevgep132 = getelementptr i8, i8* %call1, i64 %92
  %scevgep132133 = bitcast i8* %scevgep132 to double*
  store double %p_add11.i, double* %scevgep132133, align 8, !alias.scope !11, !noalias !13
  %94 = mul nuw nsw i64 %polly.indvar, 8200
  %scevgep141 = getelementptr i8, i8* %call, i64 %94
  br label %polly.loop_header134

polly.loop_exit136:                               ; preds = %polly.loop_header134
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond334 = icmp eq i64 %polly.indvar_next, 1025
  br i1 %exitcond334, label %polly.stmt.init_array.exit, label %polly.loop_header

polly.loop_header134:                             ; preds = %polly.loop_header134.1, %polly.loop_header
  %polly.indvar137 = phi i64 [ 0, %polly.loop_header ], [ %polly.indvar_next138.1, %polly.loop_header134.1 ]
  %95 = trunc i64 %polly.indvar137 to i32
  %96 = or i32 %95, 1
  %p_conv21.i = sitofp i32 %96 to double
  %p_mul.i = fmul double %p_conv.i, %p_conv21.i
  %p_div23.i = fmul double %p_mul.i, 0x3F50000000000000
  %97 = shl nuw nsw i64 %polly.indvar137, 3
  %scevgep142 = getelementptr i8, i8* %scevgep141, i64 %97
  %scevgep142143 = bitcast i8* %scevgep142 to double*
  store double %p_div23.i, double* %scevgep142143, align 8, !alias.scope !16, !noalias !18
  %polly.indvar_next138 = or i64 %polly.indvar137, 1
  %exitcond333 = icmp eq i64 %polly.indvar_next138, 1025
  br i1 %exitcond333, label %polly.loop_exit136, label %polly.loop_header134.1

polly.loop_header144:                             ; preds = %polly.loop_exit192, %polly.stmt.init_array.exit
  %indvars.iv324 = phi i64 [ %indvars.iv.next325, %polly.loop_exit192 ], [ 1024, %polly.stmt.init_array.exit ]
  %polly.indvar147 = phi i64 [ %104, %polly.loop_exit192 ], [ 0, %polly.stmt.init_array.exit ]
  %98 = add nuw i64 %polly.indvar147, 1
  %99 = sub nsw i64 1024, %polly.indvar147
  %100 = mul nuw nsw i64 %polly.indvar147, 8200
  %scevgep167 = getelementptr i8, i8* %scevgep166, i64 %100
  %101 = shl nuw nsw i64 %polly.indvar147, 3
  %scevgep171 = getelementptr i8, i8* %call, i64 %101
  %102 = mul nuw nsw i64 %polly.indvar147, 8208
  %scevgep183 = getelementptr i8, i8* %call, i64 %102
  %scevgep183184 = bitcast i8* %scevgep183 to double*
  %scevgep187 = getelementptr i8, i8* %scevgep166, i64 %102
  %polly.loop_guard = icmp eq i64 %polly.indvar147, 0
  %polly.access.mul.call163 = add nuw nsw i64 %polly.indvar147, 1025
  br i1 %polly.loop_guard, label %polly.loop_header150.us.preheader, label %polly.loop_header150.preheader

polly.loop_header150.preheader:                   ; preds = %polly.loop_header144
  %xtraiter353 = and i64 %polly.indvar147, 1
  %103 = icmp eq i64 %polly.indvar147, 1
  %unroll_iter355 = sub nsw i64 %polly.indvar147, %xtraiter353
  %lcmp.mod354 = icmp eq i64 %xtraiter353, 0
  br label %polly.loop_header150

polly.loop_header150.us.preheader:                ; preds = %polly.loop_header144
  %_p_scalar_185.us.pre = load double, double* %scevgep183184, align 8, !alias.scope !16, !noalias !18
  %xtraiter357 = and i64 %99, 1
  %unroll_iter359 = sub i64 %99, %xtraiter357
  br label %polly.loop_header150.us

polly.loop_header150.us:                          ; preds = %polly.loop_header150.us, %polly.loop_header150.us.preheader
  %polly.indvar153.us = phi i64 [ 0, %polly.loop_header150.us.preheader ], [ %polly.indvar_next154.us.1, %polly.loop_header150.us ]
  %niter360 = phi i64 [ %unroll_iter359, %polly.loop_header150.us.preheader ], [ %niter360.nsub.1, %polly.loop_header150.us ]
  %.pre306.us = mul nuw nsw i64 %polly.indvar153.us, 1025
  %.pre309.us = add nuw nsw i64 %polly.access.mul.call163, %.pre306.us
  %.pre310.us = mul nuw nsw i64 %polly.indvar153.us, 8200
  %polly.access.call182.us = getelementptr double, double* %polly.access.cast.call, i64 %.pre309.us
  %polly.access.call182.reload.us = load double, double* %polly.access.call182.us, align 8, !alias.scope !16, !noalias !18
  %p_div.i37.us = fdiv double %polly.access.call182.reload.us, %_p_scalar_185.us.pre
  %scevgep188.us = getelementptr i8, i8* %scevgep187, i64 %.pre310.us
  %scevgep188189.us = bitcast i8* %scevgep188.us to double*
  store double %p_div.i37.us, double* %scevgep188189.us, align 8, !alias.scope !16, !noalias !18
  %polly.indvar_next154.us = or i64 %polly.indvar153.us, 1
  %.pre306.us.1 = mul nuw nsw i64 %polly.indvar_next154.us, 1025
  %.pre309.us.1 = add nuw nsw i64 %polly.access.mul.call163, %.pre306.us.1
  %.pre310.us.1 = mul nuw nsw i64 %polly.indvar_next154.us, 8200
  %polly.access.call182.us.1 = getelementptr double, double* %polly.access.cast.call, i64 %.pre309.us.1
  %polly.access.call182.reload.us.1 = load double, double* %polly.access.call182.us.1, align 8, !alias.scope !16, !noalias !18
  %p_div.i37.us.1 = fdiv double %polly.access.call182.reload.us.1, %_p_scalar_185.us.pre
  %scevgep188.us.1 = getelementptr i8, i8* %scevgep187, i64 %.pre310.us.1
  %scevgep188189.us.1 = bitcast i8* %scevgep188.us.1 to double*
  store double %p_div.i37.us.1, double* %scevgep188189.us.1, align 8, !alias.scope !16, !noalias !18
  %polly.indvar_next154.us.1 = add nuw nsw i64 %polly.indvar153.us, 2
  %niter360.nsub.1 = add i64 %niter360, -2
  %niter360.ncmp.1 = icmp eq i64 %niter360.nsub.1, 0
  br i1 %niter360.ncmp.1, label %polly.loop_exit152.loopexit.unr-lcssa, label %polly.loop_header150.us

polly.loop_exit152.loopexit.unr-lcssa:            ; preds = %polly.loop_header150.us
  %lcmp.mod358 = icmp eq i64 %xtraiter357, 0
  br i1 %lcmp.mod358, label %polly.loop_exit152, label %polly.loop_header150.us.epil

polly.loop_header150.us.epil:                     ; preds = %polly.loop_exit152.loopexit.unr-lcssa
  %.pre306.us.epil = mul nuw nsw i64 %polly.indvar_next154.us.1, 1025
  %.pre309.us.epil = add nuw nsw i64 %polly.access.mul.call163, %.pre306.us.epil
  %.pre310.us.epil = mul nuw nsw i64 %polly.indvar_next154.us.1, 8200
  %polly.access.call182.us.epil = getelementptr double, double* %polly.access.cast.call, i64 %.pre309.us.epil
  %polly.access.call182.reload.us.epil = load double, double* %polly.access.call182.us.epil, align 8, !alias.scope !16, !noalias !18
  %p_div.i37.us.epil = fdiv double %polly.access.call182.reload.us.epil, %_p_scalar_185.us.pre
  %scevgep188.us.epil = getelementptr i8, i8* %scevgep187, i64 %.pre310.us.epil
  %scevgep188189.us.epil = bitcast i8* %scevgep188.us.epil to double*
  store double %p_div.i37.us.epil, double* %scevgep188189.us.epil, align 8, !alias.scope !16, !noalias !18
  br label %polly.loop_exit152

polly.loop_exit152:                               ; preds = %polly.stmt.for.end.i, %polly.loop_header150.us.epil, %polly.loop_exit152.loopexit.unr-lcssa
  %scevgep212 = getelementptr i8, i8* %scevgep211, i64 %101
  %104 = add nuw nsw i64 %polly.indvar147, 1
  %105 = mul nuw nsw i64 %104, 1026
  %xtraiter361 = and i64 %98, 1
  %106 = icmp eq i64 %polly.indvar147, 0
  %unroll_iter363 = sub nuw i64 %98, %xtraiter361
  %lcmp.mod362 = icmp eq i64 %xtraiter361, 0
  br label %polly.loop_header190

polly.loop_exit192:                               ; preds = %polly.loop_exit198
  %indvars.iv.next325 = add nsw i64 %indvars.iv324, -1
  %exitcond332 = icmp eq i64 %104, 1024
  br i1 %exitcond332, label %polly.stmt.for.end65.i, label %polly.loop_header144

polly.loop_header150:                             ; preds = %polly.loop_header150.preheader, %polly.stmt.for.end.i
  %polly.indvar153 = phi i64 [ %polly.indvar_next154, %polly.stmt.for.end.i ], [ 0, %polly.loop_header150.preheader ]
  %107 = mul nuw nsw i64 %polly.indvar153, 8200
  %scevgep168 = getelementptr i8, i8* %scevgep167, i64 %107
  %108 = add nuw nsw i64 %polly.indvar153, %polly.indvar147
  %109 = mul nuw nsw i64 %108, 1025
  %polly.access.add.call164 = add nuw nsw i64 %polly.access.mul.call163, %109
  %polly.access.call165 = getelementptr double, double* %polly.access.cast.call, i64 %polly.access.add.call164
  %polly.access.call165.reload.pre = load double, double* %polly.access.call165, align 8, !alias.scope !16, !noalias !18
  br i1 %103, label %polly.stmt.for.end.i.unr-lcssa, label %polly.loop_header156

polly.stmt.for.end.i.unr-lcssa:                   ; preds = %polly.loop_header156, %polly.loop_header150
  %p_sub.i.lcssa.ph = phi double [ undef, %polly.loop_header150 ], [ %p_sub.i.1, %polly.loop_header156 ]
  %polly.access.call165.reload.unr = phi double [ %polly.access.call165.reload.pre, %polly.loop_header150 ], [ %p_sub.i.1, %polly.loop_header156 ]
  %polly.indvar159.unr = phi i64 [ 0, %polly.loop_header150 ], [ %polly.indvar_next160.1, %polly.loop_header156 ]
  br i1 %lcmp.mod354, label %polly.stmt.for.end.i, label %polly.loop_header156.epil

polly.loop_header156.epil:                        ; preds = %polly.stmt.for.end.i.unr-lcssa
  %110 = shl nuw nsw i64 %polly.indvar159.unr, 3
  %scevgep169.epil = getelementptr i8, i8* %scevgep168, i64 %110
  %scevgep169170.epil = bitcast i8* %scevgep169.epil to double*
  %_p_scalar_.epil = load double, double* %scevgep169170.epil, align 8, !alias.scope !16, !noalias !18
  %111 = mul nuw nsw i64 %polly.indvar159.unr, 8200
  %scevgep172.epil = getelementptr i8, i8* %scevgep171, i64 %111
  %scevgep172173.epil = bitcast i8* %scevgep172.epil to double*
  %_p_scalar_174.epil = load double, double* %scevgep172173.epil, align 8, !alias.scope !16, !noalias !18
  %p_mul.i36.epil = fmul double %_p_scalar_.epil, %_p_scalar_174.epil
  %p_sub.i.epil = fsub double %polly.access.call165.reload.unr, %p_mul.i36.epil
  store double %p_sub.i.epil, double* %polly.access.call165, align 8, !alias.scope !16, !noalias !18
  br label %polly.stmt.for.end.i

polly.stmt.for.end.i:                             ; preds = %polly.stmt.for.end.i.unr-lcssa, %polly.loop_header156.epil
  %p_sub.i.lcssa = phi double [ %p_sub.i.lcssa.ph, %polly.stmt.for.end.i.unr-lcssa ], [ %p_sub.i.epil, %polly.loop_header156.epil ]
  %_p_scalar_185 = load double, double* %scevgep183184, align 8, !alias.scope !16, !noalias !18
  %p_div.i37 = fdiv double %p_sub.i.lcssa, %_p_scalar_185
  %scevgep188 = getelementptr i8, i8* %scevgep187, i64 %107
  %scevgep188189 = bitcast i8* %scevgep188 to double*
  store double %p_div.i37, double* %scevgep188189, align 8, !alias.scope !16, !noalias !18
  %polly.indvar_next154 = add nuw nsw i64 %polly.indvar153, 1
  %exitcond326 = icmp eq i64 %polly.indvar_next154, %indvars.iv324
  br i1 %exitcond326, label %polly.loop_exit152, label %polly.loop_header150

polly.loop_header156:                             ; preds = %polly.loop_header150, %polly.loop_header156
  %polly.access.call165.reload = phi double [ %p_sub.i.1, %polly.loop_header156 ], [ %polly.access.call165.reload.pre, %polly.loop_header150 ]
  %polly.indvar159 = phi i64 [ %polly.indvar_next160.1, %polly.loop_header156 ], [ 0, %polly.loop_header150 ]
  %niter356 = phi i64 [ %niter356.nsub.1, %polly.loop_header156 ], [ %unroll_iter355, %polly.loop_header150 ]
  %112 = shl nuw nsw i64 %polly.indvar159, 3
  %scevgep169 = getelementptr i8, i8* %scevgep168, i64 %112
  %scevgep169170 = bitcast i8* %scevgep169 to double*
  %_p_scalar_ = load double, double* %scevgep169170, align 8, !alias.scope !16, !noalias !18
  %113 = mul nuw nsw i64 %polly.indvar159, 8200
  %scevgep172 = getelementptr i8, i8* %scevgep171, i64 %113
  %scevgep172173 = bitcast i8* %scevgep172 to double*
  %_p_scalar_174 = load double, double* %scevgep172173, align 8, !alias.scope !16, !noalias !18
  %p_mul.i36 = fmul double %_p_scalar_, %_p_scalar_174
  %p_sub.i = fsub double %polly.access.call165.reload, %p_mul.i36
  store double %p_sub.i, double* %polly.access.call165, align 8, !alias.scope !16, !noalias !18
  %polly.indvar_next160 = or i64 %polly.indvar159, 1
  %114 = shl nuw nsw i64 %polly.indvar_next160, 3
  %scevgep169.1 = getelementptr i8, i8* %scevgep168, i64 %114
  %scevgep169170.1 = bitcast i8* %scevgep169.1 to double*
  %_p_scalar_.1 = load double, double* %scevgep169170.1, align 8, !alias.scope !16, !noalias !18
  %115 = mul nuw nsw i64 %polly.indvar_next160, 8200
  %scevgep172.1 = getelementptr i8, i8* %scevgep171, i64 %115
  %scevgep172173.1 = bitcast i8* %scevgep172.1 to double*
  %_p_scalar_174.1 = load double, double* %scevgep172173.1, align 8, !alias.scope !16, !noalias !18
  %p_mul.i36.1 = fmul double %_p_scalar_.1, %_p_scalar_174.1
  %p_sub.i.1 = fsub double %p_sub.i, %p_mul.i36.1
  store double %p_sub.i.1, double* %polly.access.call165, align 8, !alias.scope !16, !noalias !18
  %polly.indvar_next160.1 = add nuw nsw i64 %polly.indvar159, 2
  %niter356.nsub.1 = add i64 %niter356, -2
  %niter356.ncmp.1 = icmp eq i64 %niter356.nsub.1, 0
  br i1 %niter356.ncmp.1, label %polly.stmt.for.end.i.unr-lcssa, label %polly.loop_header156

polly.loop_header190:                             ; preds = %polly.loop_exit198, %polly.loop_exit152
  %polly.indvar193 = phi i64 [ 0, %polly.loop_exit152 ], [ %polly.indvar_next194, %polly.loop_exit198 ]
  %116 = shl nuw nsw i64 %polly.indvar193, 3
  %scevgep213 = getelementptr i8, i8* %scevgep212, i64 %116
  %polly.access.add.call204 = add nuw nsw i64 %105, %polly.indvar193
  %polly.access.call205 = getelementptr double, double* %polly.access.cast.call, i64 %polly.access.add.call204
  %polly.access.call205.reload.pre = load double, double* %polly.access.call205, align 8, !alias.scope !16, !noalias !18
  br i1 %106, label %polly.loop_exit198.unr-lcssa, label %polly.loop_header196

polly.loop_exit198.unr-lcssa:                     ; preds = %polly.loop_header196, %polly.loop_header190
  %polly.access.call205.reload.unr = phi double [ %polly.access.call205.reload.pre, %polly.loop_header190 ], [ %p_sub51.i.1, %polly.loop_header196 ]
  %polly.indvar199.unr = phi i64 [ 0, %polly.loop_header190 ], [ %polly.indvar_next200.1, %polly.loop_header196 ]
  br i1 %lcmp.mod362, label %polly.loop_exit198, label %polly.loop_header196.epil

polly.loop_header196.epil:                        ; preds = %polly.loop_exit198.unr-lcssa
  %117 = shl nuw nsw i64 %polly.indvar199.unr, 3
  %scevgep208.epil = getelementptr i8, i8* %scevgep167, i64 %117
  %scevgep208209.epil = bitcast i8* %scevgep208.epil to double*
  %_p_scalar_210.epil = load double, double* %scevgep208209.epil, align 8, !alias.scope !16, !noalias !18
  %118 = mul nuw nsw i64 %polly.indvar199.unr, 8200
  %scevgep214.epil = getelementptr i8, i8* %scevgep213, i64 %118
  %scevgep214215.epil = bitcast i8* %scevgep214.epil to double*
  %_p_scalar_216.epil = load double, double* %scevgep214215.epil, align 8, !alias.scope !16, !noalias !18
  %p_mul50.i.epil = fmul double %_p_scalar_210.epil, %_p_scalar_216.epil
  %p_sub51.i.epil = fsub double %polly.access.call205.reload.unr, %p_mul50.i.epil
  store double %p_sub51.i.epil, double* %polly.access.call205, align 8, !alias.scope !16, !noalias !18
  br label %polly.loop_exit198

polly.loop_exit198:                               ; preds = %polly.loop_exit198.unr-lcssa, %polly.loop_header196.epil
  %polly.indvar_next194 = add nuw nsw i64 %polly.indvar193, 1
  %exitcond331 = icmp eq i64 %polly.indvar_next194, %indvars.iv324
  br i1 %exitcond331, label %polly.loop_exit192, label %polly.loop_header190

polly.loop_header196:                             ; preds = %polly.loop_header190, %polly.loop_header196
  %polly.access.call205.reload = phi double [ %p_sub51.i.1, %polly.loop_header196 ], [ %polly.access.call205.reload.pre, %polly.loop_header190 ]
  %polly.indvar199 = phi i64 [ %polly.indvar_next200.1, %polly.loop_header196 ], [ 0, %polly.loop_header190 ]
  %niter364 = phi i64 [ %niter364.nsub.1, %polly.loop_header196 ], [ %unroll_iter363, %polly.loop_header190 ]
  %119 = shl nuw nsw i64 %polly.indvar199, 3
  %scevgep208 = getelementptr i8, i8* %scevgep167, i64 %119
  %scevgep208209 = bitcast i8* %scevgep208 to double*
  %_p_scalar_210 = load double, double* %scevgep208209, align 8, !alias.scope !16, !noalias !18
  %120 = mul nuw nsw i64 %polly.indvar199, 8200
  %scevgep214 = getelementptr i8, i8* %scevgep213, i64 %120
  %scevgep214215 = bitcast i8* %scevgep214 to double*
  %_p_scalar_216 = load double, double* %scevgep214215, align 8, !alias.scope !16, !noalias !18
  %p_mul50.i = fmul double %_p_scalar_210, %_p_scalar_216
  %p_sub51.i = fsub double %polly.access.call205.reload, %p_mul50.i
  store double %p_sub51.i, double* %polly.access.call205, align 8, !alias.scope !16, !noalias !18
  %polly.indvar_next200 = or i64 %polly.indvar199, 1
  %121 = shl nuw nsw i64 %polly.indvar_next200, 3
  %scevgep208.1 = getelementptr i8, i8* %scevgep167, i64 %121
  %scevgep208209.1 = bitcast i8* %scevgep208.1 to double*
  %_p_scalar_210.1 = load double, double* %scevgep208209.1, align 8, !alias.scope !16, !noalias !18
  %122 = mul nuw nsw i64 %polly.indvar_next200, 8200
  %scevgep214.1 = getelementptr i8, i8* %scevgep213, i64 %122
  %scevgep214215.1 = bitcast i8* %scevgep214.1 to double*
  %_p_scalar_216.1 = load double, double* %scevgep214215.1, align 8, !alias.scope !16, !noalias !18
  %p_mul50.i.1 = fmul double %_p_scalar_210.1, %_p_scalar_216.1
  %p_sub51.i.1 = fsub double %p_sub51.i, %p_mul50.i.1
  store double %p_sub51.i.1, double* %polly.access.call205, align 8, !alias.scope !16, !noalias !18
  %polly.indvar_next200.1 = add nuw nsw i64 %polly.indvar199, 2
  %niter364.nsub.1 = add i64 %niter364, -2
  %niter364.ncmp.1 = icmp eq i64 %niter364.nsub.1, 0
  br i1 %niter364.ncmp.1, label %polly.loop_exit198.unr-lcssa, label %polly.loop_header196

polly.loop_header222:                             ; preds = %polly.loop_exit236, %polly.stmt.for.end65.i
  %polly.indvar225 = phi i64 [ %126, %polly.loop_exit236 ], [ 0, %polly.stmt.for.end65.i ]
  %123 = add nuw i64 %polly.indvar225, 1
  %124 = shl nuw nsw i64 %polly.indvar225, 3
  %scevgep229 = getelementptr i8, i8* %scevgep228, i64 %124
  %125 = bitcast i8* %scevgep229 to i64*
  %_p_scalar_231301 = load i64, i64* %125, align 8, !alias.scope !11, !noalias !13
  %126 = add nuw nsw i64 %polly.indvar225, 1
  %polly.access.call3233 = getelementptr double, double* %arraydecay6, i64 %126
  %127 = bitcast double* %polly.access.call3233 to i64*
  store i64 %_p_scalar_231301, i64* %127, align 8, !alias.scope !15, !noalias !17
  %128 = mul nuw nsw i64 %polly.indvar225, 8200
  %scevgep243 = getelementptr i8, i8* %scevgep166, i64 %128
  %129 = bitcast i64 %_p_scalar_231301 to double
  %xtraiter349 = and i64 %123, 1
  %130 = icmp eq i64 %polly.indvar225, 0
  br i1 %130, label %polly.loop_exit236.unr-lcssa, label %polly.loop_header222.new

polly.loop_header222.new:                         ; preds = %polly.loop_header222
  %unroll_iter351 = sub nuw i64 %123, %xtraiter349
  br label %polly.loop_header234

polly.loop_exit236.unr-lcssa:                     ; preds = %polly.loop_header234, %polly.loop_header222
  %polly.access.call3241.reload.unr = phi double [ %129, %polly.loop_header222 ], [ %p_sub83.i.1, %polly.loop_header234 ]
  %polly.indvar237.unr = phi i64 [ 0, %polly.loop_header222 ], [ %polly.indvar_next238.1, %polly.loop_header234 ]
  %lcmp.mod350 = icmp eq i64 %xtraiter349, 0
  br i1 %lcmp.mod350, label %polly.loop_exit236, label %polly.loop_header234.epil

polly.loop_header234.epil:                        ; preds = %polly.loop_exit236.unr-lcssa
  %131 = shl nuw nsw i64 %polly.indvar237.unr, 3
  %scevgep244.epil = getelementptr i8, i8* %scevgep243, i64 %131
  %scevgep244245.epil = bitcast i8* %scevgep244.epil to double*
  %_p_scalar_246.epil = load double, double* %scevgep244245.epil, align 8, !alias.scope !16, !noalias !18
  %scevgep247.epil = getelementptr i8, i8* %call3, i64 %131
  %scevgep247248.epil = bitcast i8* %scevgep247.epil to double*
  %_p_scalar_249.epil = load double, double* %scevgep247248.epil, align 8, !alias.scope !15, !noalias !17
  %p_mul82.i.epil = fmul double %_p_scalar_246.epil, %_p_scalar_249.epil
  %p_sub83.i.epil = fsub double %polly.access.call3241.reload.unr, %p_mul82.i.epil
  store double %p_sub83.i.epil, double* %polly.access.call3233, align 8, !alias.scope !15, !noalias !17
  br label %polly.loop_exit236

polly.loop_exit236:                               ; preds = %polly.loop_exit236.unr-lcssa, %polly.loop_header234.epil
  %exitcond321 = icmp eq i64 %126, 1024
  br i1 %exitcond321, label %polly.stmt.for.end91.i, label %polly.loop_header222

polly.loop_header234:                             ; preds = %polly.loop_header234, %polly.loop_header222.new
  %polly.access.call3241.reload = phi double [ %129, %polly.loop_header222.new ], [ %p_sub83.i.1, %polly.loop_header234 ]
  %polly.indvar237 = phi i64 [ 0, %polly.loop_header222.new ], [ %polly.indvar_next238.1, %polly.loop_header234 ]
  %niter352 = phi i64 [ %unroll_iter351, %polly.loop_header222.new ], [ %niter352.nsub.1, %polly.loop_header234 ]
  %132 = shl nuw nsw i64 %polly.indvar237, 3
  %scevgep244 = getelementptr i8, i8* %scevgep243, i64 %132
  %scevgep244245 = bitcast i8* %scevgep244 to double*
  %_p_scalar_246 = load double, double* %scevgep244245, align 8, !alias.scope !16, !noalias !18
  %scevgep247 = getelementptr i8, i8* %call3, i64 %132
  %scevgep247248 = bitcast i8* %scevgep247 to double*
  %_p_scalar_249 = load double, double* %scevgep247248, align 8, !alias.scope !15, !noalias !17
  %p_mul82.i = fmul double %_p_scalar_246, %_p_scalar_249
  %p_sub83.i = fsub double %polly.access.call3241.reload, %p_mul82.i
  store double %p_sub83.i, double* %polly.access.call3233, align 8, !alias.scope !15, !noalias !17
  %polly.indvar_next238 = shl i64 %polly.indvar237, 3
  %133 = or i64 %polly.indvar_next238, 8
  %scevgep244.1 = getelementptr i8, i8* %scevgep243, i64 %133
  %scevgep244245.1 = bitcast i8* %scevgep244.1 to double*
  %_p_scalar_246.1 = load double, double* %scevgep244245.1, align 8, !alias.scope !16, !noalias !18
  %scevgep247.1 = getelementptr i8, i8* %call3, i64 %133
  %scevgep247248.1 = bitcast i8* %scevgep247.1 to double*
  %_p_scalar_249.1 = load double, double* %scevgep247248.1, align 8, !alias.scope !15, !noalias !17
  %p_mul82.i.1 = fmul double %_p_scalar_246.1, %_p_scalar_249.1
  %p_sub83.i.1 = fsub double %p_sub83.i, %p_mul82.i.1
  store double %p_sub83.i.1, double* %polly.access.call3233, align 8, !alias.scope !15, !noalias !17
  %polly.indvar_next238.1 = add nuw nsw i64 %polly.indvar237, 2
  %niter352.nsub.1 = add i64 %niter352, -2
  %niter352.ncmp.1 = icmp eq i64 %niter352.nsub.1, 0
  br i1 %niter352.ncmp.1, label %polly.loop_exit236.unr-lcssa, label %polly.loop_header234

polly.loop_header260:                             ; preds = %polly.stmt.for.end125.i, %polly.stmt.for.end91.i
  %polly.indvar263 = phi i64 [ %polly.indvar_next264, %polly.stmt.for.end125.i ], [ 0, %polly.stmt.for.end91.i ]
  %134 = add nuw i64 %polly.indvar263, 1
  %135 = mul nsw i64 %polly.indvar263, -8
  %scevgep267 = getelementptr i8, i8* %scevgep266, i64 %135
  %136 = bitcast i8* %scevgep267 to i64*
  %_p_scalar_269302 = load i64, i64* %136, align 8, !alias.scope !15, !noalias !17
  %137 = sub nuw nsw i64 1023, %polly.indvar263
  %polly.access.call2271 = getelementptr double, double* %arraydecay5, i64 %137
  %138 = bitcast double* %polly.access.call2271 to i64*
  store i64 %_p_scalar_269302, i64* %138, align 8, !alias.scope !14, !noalias !19
  %139 = mul nsw i64 %polly.indvar263, -8208
  %scevgep281 = getelementptr i8, i8* %scevgep280, i64 %139
  %scevgep286 = getelementptr i8, i8* %scevgep258, i64 %135
  %140 = bitcast i64 %_p_scalar_269302 to double
  %xtraiter = and i64 %134, 1
  %141 = icmp eq i64 %polly.indvar263, 0
  br i1 %141, label %polly.stmt.for.end125.i.unr-lcssa, label %polly.loop_header260.new

polly.loop_header260.new:                         ; preds = %polly.loop_header260
  %unroll_iter = sub nuw i64 %134, %xtraiter
  br label %polly.loop_header272

polly.stmt.for.end125.i.unr-lcssa:                ; preds = %polly.loop_header272, %polly.loop_header260
  %p_sub122.i.lcssa.ph = phi double [ undef, %polly.loop_header260 ], [ %p_sub122.i.1, %polly.loop_header272 ]
  %polly.access.call2279.reload.unr = phi double [ %140, %polly.loop_header260 ], [ %p_sub122.i.1, %polly.loop_header272 ]
  %polly.indvar275.unr = phi i64 [ 0, %polly.loop_header260 ], [ %polly.indvar_next276.1, %polly.loop_header272 ]
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %polly.stmt.for.end125.i, label %polly.loop_header272.epil

polly.loop_header272.epil:                        ; preds = %polly.stmt.for.end125.i.unr-lcssa
  %142 = shl nuw nsw i64 %polly.indvar275.unr, 3
  %scevgep282.epil = getelementptr i8, i8* %scevgep281, i64 %142
  %scevgep282283.epil = bitcast i8* %scevgep282.epil to double*
  %_p_scalar_284.epil = load double, double* %scevgep282283.epil, align 8, !alias.scope !16, !noalias !18
  %scevgep287.epil = getelementptr i8, i8* %scevgep286, i64 %142
  %scevgep287288.epil = bitcast i8* %scevgep287.epil to double*
  %_p_scalar_289.epil = load double, double* %scevgep287288.epil, align 8, !alias.scope !14, !noalias !19
  %p_mul121.i.epil = fmul double %_p_scalar_284.epil, %_p_scalar_289.epil
  %p_sub122.i.epil = fsub double %polly.access.call2279.reload.unr, %p_mul121.i.epil
  store double %p_sub122.i.epil, double* %polly.access.call2271, align 8, !alias.scope !14, !noalias !19
  br label %polly.stmt.for.end125.i

polly.stmt.for.end125.i:                          ; preds = %polly.stmt.for.end125.i.unr-lcssa, %polly.loop_header272.epil
  %p_sub122.i.lcssa = phi double [ %p_sub122.i.lcssa.ph, %polly.stmt.for.end125.i.unr-lcssa ], [ %p_sub122.i.epil, %polly.loop_header272.epil ]
  %scevgep295 = getelementptr i8, i8* %scevgep294, i64 %139
  %scevgep295296 = bitcast i8* %scevgep295 to double*
  %_p_scalar_297 = load double, double* %scevgep295296, align 8, !alias.scope !16, !noalias !18
  %p_div134.i = fdiv double %p_sub122.i.lcssa, %_p_scalar_297
  %scevgep299 = getelementptr i8, i8* %scevgep298, i64 %135
  %scevgep299300 = bitcast i8* %scevgep299 to double*
  store double %p_div134.i, double* %scevgep299300, align 8, !alias.scope !14, !noalias !19
  %polly.indvar_next264 = add nuw nsw i64 %polly.indvar263, 1
  %exitcond317 = icmp eq i64 %polly.indvar_next264, 1024
  br i1 %exitcond317, label %kernel_ludcmp.exit, label %polly.loop_header260

polly.loop_header272:                             ; preds = %polly.loop_header272, %polly.loop_header260.new
  %polly.access.call2279.reload = phi double [ %140, %polly.loop_header260.new ], [ %p_sub122.i.1, %polly.loop_header272 ]
  %polly.indvar275 = phi i64 [ 0, %polly.loop_header260.new ], [ %polly.indvar_next276.1, %polly.loop_header272 ]
  %niter = phi i64 [ %unroll_iter, %polly.loop_header260.new ], [ %niter.nsub.1, %polly.loop_header272 ]
  %143 = shl nuw nsw i64 %polly.indvar275, 3
  %scevgep282 = getelementptr i8, i8* %scevgep281, i64 %143
  %scevgep282283 = bitcast i8* %scevgep282 to double*
  %_p_scalar_284 = load double, double* %scevgep282283, align 8, !alias.scope !16, !noalias !18
  %scevgep287 = getelementptr i8, i8* %scevgep286, i64 %143
  %scevgep287288 = bitcast i8* %scevgep287 to double*
  %_p_scalar_289 = load double, double* %scevgep287288, align 8, !alias.scope !14, !noalias !19
  %p_mul121.i = fmul double %_p_scalar_284, %_p_scalar_289
  %p_sub122.i = fsub double %polly.access.call2279.reload, %p_mul121.i
  store double %p_sub122.i, double* %polly.access.call2271, align 8, !alias.scope !14, !noalias !19
  %polly.indvar_next276 = shl i64 %polly.indvar275, 3
  %144 = or i64 %polly.indvar_next276, 8
  %scevgep282.1 = getelementptr i8, i8* %scevgep281, i64 %144
  %scevgep282283.1 = bitcast i8* %scevgep282.1 to double*
  %_p_scalar_284.1 = load double, double* %scevgep282283.1, align 8, !alias.scope !16, !noalias !18
  %scevgep287.1 = getelementptr i8, i8* %scevgep286, i64 %144
  %scevgep287288.1 = bitcast i8* %scevgep287.1 to double*
  %_p_scalar_289.1 = load double, double* %scevgep287288.1, align 8, !alias.scope !14, !noalias !19
  %p_mul121.i.1 = fmul double %_p_scalar_284.1, %_p_scalar_289.1
  %p_sub122.i.1 = fsub double %p_sub122.i, %p_mul121.i.1
  store double %p_sub122.i.1, double* %polly.access.call2271, align 8, !alias.scope !14, !noalias !19
  %polly.indvar_next276.1 = add nuw nsw i64 %polly.indvar275, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %polly.stmt.for.end125.i.unr-lcssa, label %polly.loop_header272

polly.loop_header134.1:                           ; preds = %polly.loop_header134
  %145 = trunc i64 %polly.indvar_next138 to i32
  %146 = add nuw nsw i32 %145, 1
  %p_conv21.i.1 = sitofp i32 %146 to double
  %p_mul.i.1 = fmul double %p_conv.i, %p_conv21.i.1
  %p_div23.i.1 = fmul double %p_mul.i.1, 0x3F50000000000000
  %147 = shl nuw nsw i64 %polly.indvar_next138, 3
  %scevgep142.1 = getelementptr i8, i8* %scevgep141, i64 %147
  %scevgep142143.1 = bitcast i8* %scevgep142.1 to double*
  store double %p_div23.i.1, double* %scevgep142143.1, align 8, !alias.scope !16, !noalias !18
  %polly.indvar_next138.1 = add nuw nsw i64 %polly.indvar137, 2
  br label %polly.loop_header134

for.body17.i.1:                                   ; preds = %for.body17.i
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %148 = trunc i64 %indvars.iv.next.i.1 to i32
  %conv21.i.1 = sitofp i32 %148 to double
  %mul.i.1 = fmul double %conv.i, %conv21.i.1
  %div23.i.1 = fmul double %mul.i.1, 0x3F50000000000000
  %arrayidx27.i.1 = getelementptr inbounds [1025 x double], [1025 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %indvars.iv.next.i
  store double %div23.i.1, double* %arrayidx27.i.1, align 8, !tbaa !2
  br label %for.body17.i
}

declare dso_local i8* @polybench_alloc_data(i32, i32) local_unnamed_addr #1

declare dso_local i32 @free(...) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 (git@github.com:SusanTan/llvm-project.git fcc6352b59353e5ddb5bfbd85a3919893d4595c9)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !7}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !4, i64 0}
!11 = distinct !{!11, !12, !"polly.alias.scope.MemRef3"}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = !{!14, !15, !16}
!14 = distinct !{!14, !12, !"polly.alias.scope.MemRef0"}
!15 = distinct !{!15, !12, !"polly.alias.scope.MemRef2"}
!16 = distinct !{!16, !12, !"polly.alias.scope.MemRef4"}
!17 = !{!14, !11, !16}
!18 = !{!14, !15, !11}
!19 = !{!15, !11, !16}
