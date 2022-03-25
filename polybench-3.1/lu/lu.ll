; ModuleID = 'lu.c'
source_filename = "lu.c"
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
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4
  br label %polly.loop_header

land.lhs.true:                                    ; preds = %polly.exiting
  %0 = load i8*, i8** %argv, align 8, !tbaa !2
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %for.cond1.preheader.i19, label %if.end

for.cond1.preheader.i19:                          ; preds = %land.lhs.true, %for.inc8.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i ], [ 0, %land.lhs.true ]
  %1 = shl i64 %indvars.iv7.i, 10
  br label %for.body3.i22

for.body3.i22:                                    ; preds = %for.inc.i, %for.cond1.preheader.i19
  %indvars.iv.i20 = phi i64 [ 0, %for.cond1.preheader.i19 ], [ %indvars.iv.next.i23, %for.inc.i ]
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !2
  %arrayidx5.i21 = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay, i64 %indvars.iv7.i, i64 %indvars.iv.i20
  %3 = load double, double* %arrayidx5.i21, align 8, !tbaa !6
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %3) #5
  %4 = add nuw nsw i64 %indvars.iv.i20, %1
  %5 = trunc i64 %4 to i32
  %rem.i = urem i32 %5, 20
  %cmp6.i = icmp eq i32 %rem.i, 0
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body3.i22
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !2
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i22
  %indvars.iv.next.i23 = add nuw nsw i64 %indvars.iv.i20, 1
  %exitcond.i24 = icmp eq i64 %indvars.iv.next.i23, 1024
  br i1 %exitcond.i24, label %for.inc8.i, label %for.body3.i22

for.inc8.i:                                       ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1024
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i19

print_array.exit:                                 ; preds = %for.inc8.i
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !2
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %print_array.exit, %polly.exiting
  %call4 = tail call i32 (i8*, ...) bitcast (i32 (...)* @free to i32 (i8*, ...)*)(i8* %call) #4
  ret i32 0

polly.exiting:                                    ; preds = %polly.loop_exit65
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

polly.loop_header:                                ; preds = %polly.loop_exit27, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit27 ]
  %8 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_header25

polly.loop_exit27:                                ; preds = %polly.loop_exit33
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond139 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond139, label %polly.loop_preheader45, label %polly.loop_header

polly.loop_header25:                              ; preds = %polly.loop_exit33, %polly.loop_header
  %polly.indvar28 = phi i64 [ 0, %polly.loop_header ], [ %polly.indvar_next29, %polly.loop_exit33 ]
  %9 = shl nsw i64 %polly.indvar28, 5
  %10 = trunc i64 %9 to i32
  %11 = or i32 %10, 1
  %p_conv5.i = sitofp i32 %11 to double
  %12 = shl i64 %polly.indvar28, 8
  %13 = or i64 %9, 1
  %14 = trunc i64 %13 to i32
  %15 = add nuw nsw i32 %14, 1
  %p_conv5.i.1 = sitofp i32 %15 to double
  %16 = shl i64 %13, 3
  %17 = or i64 %9, 2
  %18 = trunc i64 %17 to i32
  %19 = or i32 %18, 1
  %p_conv5.i.2 = sitofp i32 %19 to double
  %20 = shl i64 %17, 3
  %21 = or i64 %9, 3
  %22 = trunc i64 %21 to i32
  %23 = add nuw nsw i32 %22, 1
  %p_conv5.i.3 = sitofp i32 %23 to double
  %24 = shl i64 %21, 3
  %25 = or i64 %9, 4
  %26 = trunc i64 %25 to i32
  %27 = or i32 %26, 1
  %p_conv5.i.4 = sitofp i32 %27 to double
  %28 = shl i64 %25, 3
  %29 = or i64 %9, 5
  %30 = trunc i64 %29 to i32
  %31 = add nuw nsw i32 %30, 1
  %p_conv5.i.5 = sitofp i32 %31 to double
  %32 = shl i64 %29, 3
  %33 = or i64 %9, 6
  %34 = trunc i64 %33 to i32
  %35 = or i32 %34, 1
  %p_conv5.i.6 = sitofp i32 %35 to double
  %36 = shl i64 %33, 3
  %37 = or i64 %9, 7
  %38 = trunc i64 %37 to i32
  %39 = add nuw nsw i32 %38, 1
  %p_conv5.i.7 = sitofp i32 %39 to double
  %40 = shl i64 %37, 3
  %41 = or i64 %9, 8
  %42 = trunc i64 %41 to i32
  %43 = or i32 %42, 1
  %p_conv5.i.8 = sitofp i32 %43 to double
  %44 = shl i64 %41, 3
  %45 = or i64 %9, 9
  %46 = trunc i64 %45 to i32
  %47 = add nuw nsw i32 %46, 1
  %p_conv5.i.9 = sitofp i32 %47 to double
  %48 = shl i64 %45, 3
  %49 = or i64 %9, 10
  %50 = trunc i64 %49 to i32
  %51 = or i32 %50, 1
  %p_conv5.i.10 = sitofp i32 %51 to double
  %52 = shl i64 %49, 3
  %53 = or i64 %9, 11
  %54 = trunc i64 %53 to i32
  %55 = add nuw nsw i32 %54, 1
  %p_conv5.i.11 = sitofp i32 %55 to double
  %56 = shl i64 %53, 3
  %57 = or i64 %9, 12
  %58 = trunc i64 %57 to i32
  %59 = or i32 %58, 1
  %p_conv5.i.12 = sitofp i32 %59 to double
  %60 = shl i64 %57, 3
  %61 = or i64 %9, 13
  %62 = trunc i64 %61 to i32
  %63 = add nuw nsw i32 %62, 1
  %p_conv5.i.13 = sitofp i32 %63 to double
  %64 = shl i64 %61, 3
  %65 = or i64 %9, 14
  %66 = trunc i64 %65 to i32
  %67 = or i32 %66, 1
  %p_conv5.i.14 = sitofp i32 %67 to double
  %68 = shl i64 %65, 3
  %69 = or i64 %9, 15
  %70 = trunc i64 %69 to i32
  %71 = add nuw nsw i32 %70, 1
  %p_conv5.i.15 = sitofp i32 %71 to double
  %72 = shl i64 %69, 3
  %73 = or i64 %9, 16
  %74 = trunc i64 %73 to i32
  %75 = or i32 %74, 1
  %p_conv5.i.16 = sitofp i32 %75 to double
  %76 = shl i64 %73, 3
  %77 = or i64 %9, 17
  %78 = trunc i64 %77 to i32
  %79 = add nuw nsw i32 %78, 1
  %p_conv5.i.17 = sitofp i32 %79 to double
  %80 = shl i64 %77, 3
  %81 = or i64 %9, 18
  %82 = trunc i64 %81 to i32
  %83 = or i32 %82, 1
  %p_conv5.i.18 = sitofp i32 %83 to double
  %84 = shl i64 %81, 3
  %85 = or i64 %9, 19
  %86 = trunc i64 %85 to i32
  %87 = add nuw nsw i32 %86, 1
  %p_conv5.i.19 = sitofp i32 %87 to double
  %88 = shl i64 %85, 3
  %89 = or i64 %9, 20
  %90 = trunc i64 %89 to i32
  %91 = or i32 %90, 1
  %p_conv5.i.20 = sitofp i32 %91 to double
  %92 = shl i64 %89, 3
  %93 = or i64 %9, 21
  %94 = trunc i64 %93 to i32
  %95 = add nuw nsw i32 %94, 1
  %p_conv5.i.21 = sitofp i32 %95 to double
  %96 = shl i64 %93, 3
  %97 = or i64 %9, 22
  %98 = trunc i64 %97 to i32
  %99 = or i32 %98, 1
  %p_conv5.i.22 = sitofp i32 %99 to double
  %100 = shl i64 %97, 3
  %101 = or i64 %9, 23
  %102 = trunc i64 %101 to i32
  %103 = add nuw nsw i32 %102, 1
  %p_conv5.i.23 = sitofp i32 %103 to double
  %104 = shl i64 %101, 3
  %105 = or i64 %9, 24
  %106 = trunc i64 %105 to i32
  %107 = or i32 %106, 1
  %p_conv5.i.24 = sitofp i32 %107 to double
  %108 = shl i64 %105, 3
  %109 = or i64 %9, 25
  %110 = trunc i64 %109 to i32
  %111 = add nuw nsw i32 %110, 1
  %p_conv5.i.25 = sitofp i32 %111 to double
  %112 = shl i64 %109, 3
  %113 = or i64 %9, 26
  %114 = trunc i64 %113 to i32
  %115 = or i32 %114, 1
  %p_conv5.i.26 = sitofp i32 %115 to double
  %116 = shl i64 %113, 3
  %117 = or i64 %9, 27
  %118 = trunc i64 %117 to i32
  %119 = add nuw nsw i32 %118, 1
  %p_conv5.i.27 = sitofp i32 %119 to double
  %120 = shl i64 %117, 3
  %121 = or i64 %9, 28
  %122 = trunc i64 %121 to i32
  %123 = or i32 %122, 1
  %p_conv5.i.28 = sitofp i32 %123 to double
  %124 = shl i64 %121, 3
  %125 = or i64 %9, 29
  %126 = trunc i64 %125 to i32
  %127 = add nuw nsw i32 %126, 1
  %p_conv5.i.29 = sitofp i32 %127 to double
  %128 = shl i64 %125, 3
  %129 = or i64 %9, 30
  %130 = trunc i64 %129 to i32
  %131 = or i32 %130, 1
  %p_conv5.i.30 = sitofp i32 %131 to double
  %132 = shl i64 %129, 3
  %133 = or i64 %9, 31
  %134 = trunc i64 %133 to i32
  %135 = add i32 %134, 1
  %p_conv5.i.31 = sitofp i32 %135 to double
  %136 = shl i64 %133, 3
  br label %polly.loop_header31

polly.loop_exit33:                                ; preds = %polly.loop_header31
  %polly.indvar_next29 = add nuw nsw i64 %polly.indvar28, 1
  %exitcond138 = icmp eq i64 %polly.indvar_next29, 32
  br i1 %exitcond138, label %polly.loop_exit27, label %polly.loop_header25

polly.loop_header31:                              ; preds = %polly.loop_header31, %polly.loop_header25
  %polly.indvar34 = phi i64 [ 0, %polly.loop_header25 ], [ %polly.indvar_next35, %polly.loop_header31 ]
  %137 = add nuw nsw i64 %polly.indvar34, %8
  %138 = trunc i64 %137 to i32
  %139 = add i32 %138, 1
  %p_conv.i = sitofp i32 %139 to double
  %140 = shl i64 %137, 13
  %p_mul.i = fmul double %p_conv.i, %p_conv5.i
  %p_div.i = fmul double %p_mul.i, 0x3F50000000000000
  %141 = add nuw nsw i64 %12, %140
  %scevgep = getelementptr i8, i8* %call, i64 %141
  %scevgep43 = bitcast i8* %scevgep to double*
  store double %p_div.i, double* %scevgep43, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.1 = fmul double %p_conv.i, %p_conv5.i.1
  %p_div.i.1 = fmul double %p_mul.i.1, 0x3F50000000000000
  %142 = add nuw nsw i64 %16, %140
  %scevgep.1 = getelementptr i8, i8* %call, i64 %142
  %scevgep43.1 = bitcast i8* %scevgep.1 to double*
  store double %p_div.i.1, double* %scevgep43.1, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.2 = fmul double %p_conv.i, %p_conv5.i.2
  %p_div.i.2 = fmul double %p_mul.i.2, 0x3F50000000000000
  %143 = add nuw nsw i64 %20, %140
  %scevgep.2 = getelementptr i8, i8* %call, i64 %143
  %scevgep43.2 = bitcast i8* %scevgep.2 to double*
  store double %p_div.i.2, double* %scevgep43.2, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.3 = fmul double %p_conv.i, %p_conv5.i.3
  %p_div.i.3 = fmul double %p_mul.i.3, 0x3F50000000000000
  %144 = add nuw nsw i64 %24, %140
  %scevgep.3 = getelementptr i8, i8* %call, i64 %144
  %scevgep43.3 = bitcast i8* %scevgep.3 to double*
  store double %p_div.i.3, double* %scevgep43.3, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.4 = fmul double %p_conv.i, %p_conv5.i.4
  %p_div.i.4 = fmul double %p_mul.i.4, 0x3F50000000000000
  %145 = add nuw nsw i64 %28, %140
  %scevgep.4 = getelementptr i8, i8* %call, i64 %145
  %scevgep43.4 = bitcast i8* %scevgep.4 to double*
  store double %p_div.i.4, double* %scevgep43.4, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.5 = fmul double %p_conv.i, %p_conv5.i.5
  %p_div.i.5 = fmul double %p_mul.i.5, 0x3F50000000000000
  %146 = add nuw nsw i64 %32, %140
  %scevgep.5 = getelementptr i8, i8* %call, i64 %146
  %scevgep43.5 = bitcast i8* %scevgep.5 to double*
  store double %p_div.i.5, double* %scevgep43.5, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.6 = fmul double %p_conv.i, %p_conv5.i.6
  %p_div.i.6 = fmul double %p_mul.i.6, 0x3F50000000000000
  %147 = add nuw nsw i64 %36, %140
  %scevgep.6 = getelementptr i8, i8* %call, i64 %147
  %scevgep43.6 = bitcast i8* %scevgep.6 to double*
  store double %p_div.i.6, double* %scevgep43.6, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.7 = fmul double %p_conv.i, %p_conv5.i.7
  %p_div.i.7 = fmul double %p_mul.i.7, 0x3F50000000000000
  %148 = add nuw nsw i64 %40, %140
  %scevgep.7 = getelementptr i8, i8* %call, i64 %148
  %scevgep43.7 = bitcast i8* %scevgep.7 to double*
  store double %p_div.i.7, double* %scevgep43.7, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.8 = fmul double %p_conv.i, %p_conv5.i.8
  %p_div.i.8 = fmul double %p_mul.i.8, 0x3F50000000000000
  %149 = add nuw nsw i64 %44, %140
  %scevgep.8 = getelementptr i8, i8* %call, i64 %149
  %scevgep43.8 = bitcast i8* %scevgep.8 to double*
  store double %p_div.i.8, double* %scevgep43.8, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.9 = fmul double %p_conv.i, %p_conv5.i.9
  %p_div.i.9 = fmul double %p_mul.i.9, 0x3F50000000000000
  %150 = add nuw nsw i64 %48, %140
  %scevgep.9 = getelementptr i8, i8* %call, i64 %150
  %scevgep43.9 = bitcast i8* %scevgep.9 to double*
  store double %p_div.i.9, double* %scevgep43.9, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.10 = fmul double %p_conv.i, %p_conv5.i.10
  %p_div.i.10 = fmul double %p_mul.i.10, 0x3F50000000000000
  %151 = add nuw nsw i64 %52, %140
  %scevgep.10 = getelementptr i8, i8* %call, i64 %151
  %scevgep43.10 = bitcast i8* %scevgep.10 to double*
  store double %p_div.i.10, double* %scevgep43.10, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.11 = fmul double %p_conv.i, %p_conv5.i.11
  %p_div.i.11 = fmul double %p_mul.i.11, 0x3F50000000000000
  %152 = add nuw nsw i64 %56, %140
  %scevgep.11 = getelementptr i8, i8* %call, i64 %152
  %scevgep43.11 = bitcast i8* %scevgep.11 to double*
  store double %p_div.i.11, double* %scevgep43.11, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.12 = fmul double %p_conv.i, %p_conv5.i.12
  %p_div.i.12 = fmul double %p_mul.i.12, 0x3F50000000000000
  %153 = add nuw nsw i64 %60, %140
  %scevgep.12 = getelementptr i8, i8* %call, i64 %153
  %scevgep43.12 = bitcast i8* %scevgep.12 to double*
  store double %p_div.i.12, double* %scevgep43.12, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.13 = fmul double %p_conv.i, %p_conv5.i.13
  %p_div.i.13 = fmul double %p_mul.i.13, 0x3F50000000000000
  %154 = add nuw nsw i64 %64, %140
  %scevgep.13 = getelementptr i8, i8* %call, i64 %154
  %scevgep43.13 = bitcast i8* %scevgep.13 to double*
  store double %p_div.i.13, double* %scevgep43.13, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.14 = fmul double %p_conv.i, %p_conv5.i.14
  %p_div.i.14 = fmul double %p_mul.i.14, 0x3F50000000000000
  %155 = add nuw nsw i64 %68, %140
  %scevgep.14 = getelementptr i8, i8* %call, i64 %155
  %scevgep43.14 = bitcast i8* %scevgep.14 to double*
  store double %p_div.i.14, double* %scevgep43.14, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.15 = fmul double %p_conv.i, %p_conv5.i.15
  %p_div.i.15 = fmul double %p_mul.i.15, 0x3F50000000000000
  %156 = add nuw nsw i64 %72, %140
  %scevgep.15 = getelementptr i8, i8* %call, i64 %156
  %scevgep43.15 = bitcast i8* %scevgep.15 to double*
  store double %p_div.i.15, double* %scevgep43.15, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.16 = fmul double %p_conv.i, %p_conv5.i.16
  %p_div.i.16 = fmul double %p_mul.i.16, 0x3F50000000000000
  %157 = add nuw nsw i64 %76, %140
  %scevgep.16 = getelementptr i8, i8* %call, i64 %157
  %scevgep43.16 = bitcast i8* %scevgep.16 to double*
  store double %p_div.i.16, double* %scevgep43.16, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.17 = fmul double %p_conv.i, %p_conv5.i.17
  %p_div.i.17 = fmul double %p_mul.i.17, 0x3F50000000000000
  %158 = add nuw nsw i64 %80, %140
  %scevgep.17 = getelementptr i8, i8* %call, i64 %158
  %scevgep43.17 = bitcast i8* %scevgep.17 to double*
  store double %p_div.i.17, double* %scevgep43.17, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.18 = fmul double %p_conv.i, %p_conv5.i.18
  %p_div.i.18 = fmul double %p_mul.i.18, 0x3F50000000000000
  %159 = add nuw nsw i64 %84, %140
  %scevgep.18 = getelementptr i8, i8* %call, i64 %159
  %scevgep43.18 = bitcast i8* %scevgep.18 to double*
  store double %p_div.i.18, double* %scevgep43.18, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.19 = fmul double %p_conv.i, %p_conv5.i.19
  %p_div.i.19 = fmul double %p_mul.i.19, 0x3F50000000000000
  %160 = add nuw nsw i64 %88, %140
  %scevgep.19 = getelementptr i8, i8* %call, i64 %160
  %scevgep43.19 = bitcast i8* %scevgep.19 to double*
  store double %p_div.i.19, double* %scevgep43.19, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.20 = fmul double %p_conv.i, %p_conv5.i.20
  %p_div.i.20 = fmul double %p_mul.i.20, 0x3F50000000000000
  %161 = add nuw nsw i64 %92, %140
  %scevgep.20 = getelementptr i8, i8* %call, i64 %161
  %scevgep43.20 = bitcast i8* %scevgep.20 to double*
  store double %p_div.i.20, double* %scevgep43.20, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.21 = fmul double %p_conv.i, %p_conv5.i.21
  %p_div.i.21 = fmul double %p_mul.i.21, 0x3F50000000000000
  %162 = add nuw nsw i64 %96, %140
  %scevgep.21 = getelementptr i8, i8* %call, i64 %162
  %scevgep43.21 = bitcast i8* %scevgep.21 to double*
  store double %p_div.i.21, double* %scevgep43.21, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.22 = fmul double %p_conv.i, %p_conv5.i.22
  %p_div.i.22 = fmul double %p_mul.i.22, 0x3F50000000000000
  %163 = add nuw nsw i64 %100, %140
  %scevgep.22 = getelementptr i8, i8* %call, i64 %163
  %scevgep43.22 = bitcast i8* %scevgep.22 to double*
  store double %p_div.i.22, double* %scevgep43.22, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.23 = fmul double %p_conv.i, %p_conv5.i.23
  %p_div.i.23 = fmul double %p_mul.i.23, 0x3F50000000000000
  %164 = add nuw nsw i64 %104, %140
  %scevgep.23 = getelementptr i8, i8* %call, i64 %164
  %scevgep43.23 = bitcast i8* %scevgep.23 to double*
  store double %p_div.i.23, double* %scevgep43.23, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.24 = fmul double %p_conv.i, %p_conv5.i.24
  %p_div.i.24 = fmul double %p_mul.i.24, 0x3F50000000000000
  %165 = add nuw nsw i64 %108, %140
  %scevgep.24 = getelementptr i8, i8* %call, i64 %165
  %scevgep43.24 = bitcast i8* %scevgep.24 to double*
  store double %p_div.i.24, double* %scevgep43.24, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.25 = fmul double %p_conv.i, %p_conv5.i.25
  %p_div.i.25 = fmul double %p_mul.i.25, 0x3F50000000000000
  %166 = add nuw nsw i64 %112, %140
  %scevgep.25 = getelementptr i8, i8* %call, i64 %166
  %scevgep43.25 = bitcast i8* %scevgep.25 to double*
  store double %p_div.i.25, double* %scevgep43.25, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.26 = fmul double %p_conv.i, %p_conv5.i.26
  %p_div.i.26 = fmul double %p_mul.i.26, 0x3F50000000000000
  %167 = add nuw nsw i64 %116, %140
  %scevgep.26 = getelementptr i8, i8* %call, i64 %167
  %scevgep43.26 = bitcast i8* %scevgep.26 to double*
  store double %p_div.i.26, double* %scevgep43.26, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.27 = fmul double %p_conv.i, %p_conv5.i.27
  %p_div.i.27 = fmul double %p_mul.i.27, 0x3F50000000000000
  %168 = add nuw nsw i64 %120, %140
  %scevgep.27 = getelementptr i8, i8* %call, i64 %168
  %scevgep43.27 = bitcast i8* %scevgep.27 to double*
  store double %p_div.i.27, double* %scevgep43.27, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.28 = fmul double %p_conv.i, %p_conv5.i.28
  %p_div.i.28 = fmul double %p_mul.i.28, 0x3F50000000000000
  %169 = add nuw nsw i64 %124, %140
  %scevgep.28 = getelementptr i8, i8* %call, i64 %169
  %scevgep43.28 = bitcast i8* %scevgep.28 to double*
  store double %p_div.i.28, double* %scevgep43.28, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.29 = fmul double %p_conv.i, %p_conv5.i.29
  %p_div.i.29 = fmul double %p_mul.i.29, 0x3F50000000000000
  %170 = add nuw nsw i64 %128, %140
  %scevgep.29 = getelementptr i8, i8* %call, i64 %170
  %scevgep43.29 = bitcast i8* %scevgep.29 to double*
  store double %p_div.i.29, double* %scevgep43.29, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.30 = fmul double %p_conv.i, %p_conv5.i.30
  %p_div.i.30 = fmul double %p_mul.i.30, 0x3F50000000000000
  %171 = add nuw nsw i64 %132, %140
  %scevgep.30 = getelementptr i8, i8* %call, i64 %171
  %scevgep43.30 = bitcast i8* %scevgep.30 to double*
  store double %p_div.i.30, double* %scevgep43.30, align 8, !alias.scope !8, !noalias !10
  %p_mul.i.31 = fmul double %p_conv.i, %p_conv5.i.31
  %p_div.i.31 = fmul double %p_mul.i.31, 0x3F50000000000000
  %172 = add nuw nsw i64 %136, %140
  %scevgep.31 = getelementptr i8, i8* %call, i64 %172
  %scevgep43.31 = bitcast i8* %scevgep.31 to double*
  store double %p_div.i.31, double* %scevgep43.31, align 8, !alias.scope !8, !noalias !10
  %polly.indvar_next35 = add nuw nsw i64 %polly.indvar34, 1
  %exitcond137 = icmp eq i64 %polly.indvar_next35, 32
  br i1 %exitcond137, label %polly.loop_exit33, label %polly.loop_header31

polly.loop_header44:                              ; preds = %polly.loop_exit65, %polly.loop_preheader45
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %polly.loop_exit65 ], [ 33, %polly.loop_preheader45 ]
  %polly.indvar47 = phi i64 [ %polly.indvar_next48, %polly.loop_exit65 ], [ 0, %polly.loop_preheader45 ]
  %173 = sub nsw i64 1023, %polly.indvar47
  %174 = lshr i64 %indvars.iv131, 5
  %175 = sub nsw i64 33, %174
  %176 = mul nuw nsw i64 %polly.indvar47, 8200
  %scevgep57 = getelementptr i8, i8* %scevgep56, i64 %176
  %scevgep60 = getelementptr i8, i8* %call, i64 %176
  %scevgep6061 = bitcast i8* %scevgep60 to double*
  %_p_scalar_62.pre = load double, double* %scevgep6061, align 8, !alias.scope !8, !noalias !10
  %xtraiter = and i64 %173, 1
  %177 = icmp eq i64 %polly.indvar47, 1022
  br i1 %177, label %polly.loop_exit52.unr-lcssa, label %polly.loop_header44.new

polly.loop_header44.new:                          ; preds = %polly.loop_header44
  %unroll_iter = sub i64 %173, %xtraiter
  br label %polly.loop_header50

polly.loop_exit52.unr-lcssa:                      ; preds = %polly.loop_header50, %polly.loop_header44
  %polly.indvar53.unr = phi i64 [ 0, %polly.loop_header44 ], [ %polly.indvar_next54.1, %polly.loop_header50 ]
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %polly.loop_exit52, label %polly.loop_header50.epil

polly.loop_header50.epil:                         ; preds = %polly.loop_exit52.unr-lcssa
  %178 = shl nuw nsw i64 %polly.indvar53.unr, 3
  %scevgep58.epil = getelementptr i8, i8* %scevgep57, i64 %178
  %scevgep5859.epil = bitcast i8* %scevgep58.epil to double*
  %_p_scalar_.epil = load double, double* %scevgep5859.epil, align 8, !alias.scope !8, !noalias !10
  %p_div.i15.epil = fdiv double %_p_scalar_.epil, %_p_scalar_62.pre
  store double %p_div.i15.epil, double* %scevgep5859.epil, align 8, !alias.scope !8, !noalias !10
  br label %polly.loop_exit52

polly.loop_exit52:                                ; preds = %polly.loop_exit52.unr-lcssa, %polly.loop_header50.epil
  %179 = sub nsw i64 0, %polly.indvar47
  %scevgep91 = getelementptr i8, i8* %scevgep90, i64 %176
  %scevgep96 = getelementptr i8, i8* %scevgep95, i64 %176
  br label %polly.loop_header63

polly.loop_exit65:                                ; preds = %polly.loop_exit72
  %polly.indvar_next48 = add nuw nsw i64 %polly.indvar47, 1
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond135 = icmp eq i64 %polly.indvar_next48, 1023
  br i1 %exitcond135, label %polly.exiting, label %polly.loop_header44

polly.loop_preheader45:                           ; preds = %polly.loop_exit27
  %arraydecay = bitcast i8* %call to [1024 x double]*
  %scevgep56 = getelementptr i8, i8* %call, i64 8
  %scevgep90 = getelementptr i8, i8* %call, i64 8200
  %scevgep95 = getelementptr i8, i8* %call, i64 8192
  br label %polly.loop_header44

polly.loop_header50:                              ; preds = %polly.loop_header50, %polly.loop_header44.new
  %polly.indvar53 = phi i64 [ 0, %polly.loop_header44.new ], [ %polly.indvar_next54.1, %polly.loop_header50 ]
  %niter = phi i64 [ %unroll_iter, %polly.loop_header44.new ], [ %niter.nsub.1, %polly.loop_header50 ]
  %180 = shl nuw nsw i64 %polly.indvar53, 3
  %scevgep58 = getelementptr i8, i8* %scevgep57, i64 %180
  %scevgep5859 = bitcast i8* %scevgep58 to double*
  %_p_scalar_ = load double, double* %scevgep5859, align 8, !alias.scope !8, !noalias !10
  %p_div.i15 = fdiv double %_p_scalar_, %_p_scalar_62.pre
  store double %p_div.i15, double* %scevgep5859, align 8, !alias.scope !8, !noalias !10
  %polly.indvar_next54 = shl i64 %polly.indvar53, 3
  %181 = or i64 %polly.indvar_next54, 8
  %scevgep58.1 = getelementptr i8, i8* %scevgep57, i64 %181
  %scevgep5859.1 = bitcast i8* %scevgep58.1 to double*
  %_p_scalar_.1 = load double, double* %scevgep5859.1, align 8, !alias.scope !8, !noalias !10
  %p_div.i15.1 = fdiv double %_p_scalar_.1, %_p_scalar_62.pre
  store double %p_div.i15.1, double* %scevgep5859.1, align 8, !alias.scope !8, !noalias !10
  %polly.indvar_next54.1 = add nuw nsw i64 %polly.indvar53, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %polly.loop_exit52.unr-lcssa, label %polly.loop_header50

polly.loop_header63:                              ; preds = %polly.loop_exit72, %polly.loop_exit52
  %polly.indvar66 = phi i64 [ 0, %polly.loop_exit52 ], [ %polly.indvar_next67, %polly.loop_exit72 ]
  %182 = shl nsw i64 %polly.indvar66, 5
  %183 = sub nsw i64 %179, %182
  %184 = icmp slt i64 %183, -991
  %185 = select i1 %184, i64 %183, i64 -991
  %186 = add nsw i64 %185, 1022
  %polly.loop_guard = icmp sgt i64 %185, -1023
  br i1 %polly.loop_guard, label %polly.loop_header70.us, label %polly.loop_exit72

polly.loop_header70.us:                           ; preds = %polly.loop_header63, %polly.loop_exit78.loopexit.us
  %polly.indvar73.us = phi i64 [ %polly.indvar_next74.us, %polly.loop_exit78.loopexit.us ], [ 0, %polly.loop_header63 ]
  %187 = shl nsw i64 %polly.indvar73.us, 5
  %188 = sub nsw i64 %179, %187
  %189 = icmp slt i64 %188, -991
  %190 = select i1 %189, i64 %188, i64 -991
  %191 = add nsw i64 %190, 1022
  %polly.loop_guard86.us = icmp sgt i64 %190, -1023
  br i1 %polly.loop_guard86.us, label %polly.loop_header76.us.us, label %polly.loop_exit78.loopexit.us

polly.loop_exit78.loopexit.us:                    ; preds = %polly.loop_exit85.loopexit.us.us, %polly.loop_header70.us
  %polly.indvar_next74.us = add nuw nsw i64 %polly.indvar73.us, 1
  %exitcond133 = icmp eq i64 %polly.indvar_next74.us, %175
  br i1 %exitcond133, label %polly.loop_exit72, label %polly.loop_header70.us

polly.loop_header76.us.us:                        ; preds = %polly.loop_header70.us, %polly.loop_exit85.loopexit.us.us
  %polly.indvar79.us.us = phi i64 [ %polly.indvar_next80.us.us, %polly.loop_exit85.loopexit.us.us ], [ 0, %polly.loop_header70.us ]
  %192 = add nuw nsw i64 %polly.indvar79.us.us, %182
  %193 = shl i64 %192, 13
  %scevgep97.us.us = getelementptr i8, i8* %scevgep96, i64 %193
  %scevgep9798.us.us = bitcast i8* %scevgep97.us.us to double*
  br label %polly.loop_header83.us.us

polly.loop_exit85.loopexit.us.us:                 ; preds = %polly.loop_header83.us.us
  %polly.indvar_next80.us.us = add nuw nsw i64 %polly.indvar79.us.us, 1
  %polly.loop_cond81.us.us = icmp slt i64 %polly.indvar79.us.us, %186
  br i1 %polly.loop_cond81.us.us, label %polly.loop_header76.us.us, label %polly.loop_exit78.loopexit.us

polly.loop_header83.us.us:                        ; preds = %polly.loop_header83.us.us, %polly.loop_header76.us.us
  %polly.indvar87.us.us = phi i64 [ %polly.indvar_next88.us.us, %polly.loop_header83.us.us ], [ 0, %polly.loop_header76.us.us ]
  %194 = add nuw nsw i64 %polly.indvar87.us.us, %187
  %195 = shl i64 %194, 3
  %196 = add nuw nsw i64 %195, %193
  %scevgep92.us.us = getelementptr i8, i8* %scevgep91, i64 %196
  %scevgep9293.us.us = bitcast i8* %scevgep92.us.us to double*
  %_p_scalar_94.us.us = load double, double* %scevgep9293.us.us, align 8, !alias.scope !8, !noalias !10
  %_p_scalar_99.us.us = load double, double* %scevgep9798.us.us, align 8, !alias.scope !8, !noalias !10
  %scevgep102.us.us = getelementptr i8, i8* %scevgep57, i64 %195
  %scevgep102103.us.us = bitcast i8* %scevgep102.us.us to double*
  %_p_scalar_104.us.us = load double, double* %scevgep102103.us.us, align 8, !alias.scope !8, !noalias !10
  %p_mul.i18.us.us = fmul double %_p_scalar_99.us.us, %_p_scalar_104.us.us
  %p_sub.i.us.us = fsub double %_p_scalar_94.us.us, %p_mul.i18.us.us
  store double %p_sub.i.us.us, double* %scevgep9293.us.us, align 8, !alias.scope !8, !noalias !10
  %polly.indvar_next88.us.us = add nuw nsw i64 %polly.indvar87.us.us, 1
  %polly.loop_cond89.us.us = icmp slt i64 %polly.indvar87.us.us, %191
  br i1 %polly.loop_cond89.us.us, label %polly.loop_header83.us.us, label %polly.loop_exit85.loopexit.us.us

polly.loop_exit72:                                ; preds = %polly.loop_exit78.loopexit.us, %polly.loop_header63
  %polly.indvar_next67 = add nuw nsw i64 %polly.indvar66, 1
  %exitcond134 = icmp eq i64 %polly.indvar_next67, %175
  br i1 %exitcond134, label %polly.loop_exit65, label %polly.loop_header63
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
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"double", !4, i64 0}
!8 = distinct !{!8, !9, !"polly.alias.scope.MemRef1"}
!9 = distinct !{!9, !"polly.alias.scope.domain"}
!10 = !{}
