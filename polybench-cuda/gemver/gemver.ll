; ModuleID = 'gemver.cu'
source_filename = "gemver.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline uwtable
define dso_local void @_Z8kernel_AiddPdS_S_S_S_S_S_S_S_(i32 %n, double %alpha, double %beta, double* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 !dbg !692 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %A.addr = alloca double*, align 8
  %u1.addr = alloca double*, align 8
  %v1.addr = alloca double*, align 8
  %u2.addr = alloca double*, align 8
  %v2.addr = alloca double*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !696, metadata !DIExpression()), !dbg !697
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !698, metadata !DIExpression()), !dbg !699
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !700, metadata !DIExpression()), !dbg !701
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !702, metadata !DIExpression()), !dbg !703
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !704, metadata !DIExpression()), !dbg !705
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !706, metadata !DIExpression()), !dbg !707
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !708, metadata !DIExpression()), !dbg !709
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !710, metadata !DIExpression()), !dbg !711
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !712, metadata !DIExpression()), !dbg !713
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !714, metadata !DIExpression()), !dbg !715
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !716, metadata !DIExpression()), !dbg !717
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !718, metadata !DIExpression()), !dbg !719
  %0 = bitcast i32* %n.addr to i8*, !dbg !720
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !720
  %2 = icmp eq i32 %1, 0, !dbg !720
  br i1 %2, label %setup.next, label %setup.end, !dbg !720

setup.next:                                       ; preds = %entry
  %3 = bitcast double* %alpha.addr to i8*, !dbg !720
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !720
  %5 = icmp eq i32 %4, 0, !dbg !720
  br i1 %5, label %setup.next1, label %setup.end, !dbg !720

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast double* %beta.addr to i8*, !dbg !720
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !720
  %8 = icmp eq i32 %7, 0, !dbg !720
  br i1 %8, label %setup.next2, label %setup.end, !dbg !720

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %A.addr to i8*, !dbg !720
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !720
  %11 = icmp eq i32 %10, 0, !dbg !720
  br i1 %11, label %setup.next3, label %setup.end, !dbg !720

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %u1.addr to i8*, !dbg !720
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !720
  %14 = icmp eq i32 %13, 0, !dbg !720
  br i1 %14, label %setup.next4, label %setup.end, !dbg !720

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %v1.addr to i8*, !dbg !720
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !720
  %17 = icmp eq i32 %16, 0, !dbg !720
  br i1 %17, label %setup.next5, label %setup.end, !dbg !720

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %u2.addr to i8*, !dbg !720
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 48), !dbg !720
  %20 = icmp eq i32 %19, 0, !dbg !720
  br i1 %20, label %setup.next6, label %setup.end, !dbg !720

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast double** %v2.addr to i8*, !dbg !720
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 56), !dbg !720
  %23 = icmp eq i32 %22, 0, !dbg !720
  br i1 %23, label %setup.next7, label %setup.end, !dbg !720

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast double** %w.addr to i8*, !dbg !720
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 8, i64 64), !dbg !720
  %26 = icmp eq i32 %25, 0, !dbg !720
  br i1 %26, label %setup.next8, label %setup.end, !dbg !720

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast double** %x.addr to i8*, !dbg !720
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 8, i64 72), !dbg !720
  %29 = icmp eq i32 %28, 0, !dbg !720
  br i1 %29, label %setup.next9, label %setup.end, !dbg !720

setup.next9:                                      ; preds = %setup.next8
  %30 = bitcast double** %y.addr to i8*, !dbg !720
  %31 = call i32 @cudaSetupArgument(i8* %30, i64 8, i64 80), !dbg !720
  %32 = icmp eq i32 %31, 0, !dbg !720
  br i1 %32, label %setup.next10, label %setup.end, !dbg !720

setup.next10:                                     ; preds = %setup.next9
  %33 = bitcast double** %z.addr to i8*, !dbg !720
  %34 = call i32 @cudaSetupArgument(i8* %33, i64 8, i64 88), !dbg !720
  %35 = icmp eq i32 %34, 0, !dbg !720
  br i1 %35, label %setup.next11, label %setup.end, !dbg !720

setup.next11:                                     ; preds = %setup.next10
  %36 = call i32 @cudaLaunch(i8* bitcast (void (i32, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*)* @_Z8kernel_AiddPdS_S_S_S_S_S_S_S_ to i8*)), !dbg !720
  br label %setup.end, !dbg !720

setup.end:                                        ; preds = %setup.next11, %setup.next10, %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !721
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline uwtable
define dso_local void @_Z8kernel_xiddPdS_S_S_S_S_S_S_S_(i32 %n, double %alpha, double %beta, double* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 !dbg !722 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %A.addr = alloca double*, align 8
  %u1.addr = alloca double*, align 8
  %v1.addr = alloca double*, align 8
  %u2.addr = alloca double*, align 8
  %v2.addr = alloca double*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !723, metadata !DIExpression()), !dbg !724
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !725, metadata !DIExpression()), !dbg !726
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !727, metadata !DIExpression()), !dbg !728
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !729, metadata !DIExpression()), !dbg !730
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !731, metadata !DIExpression()), !dbg !732
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !733, metadata !DIExpression()), !dbg !734
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !735, metadata !DIExpression()), !dbg !736
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !737, metadata !DIExpression()), !dbg !738
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !739, metadata !DIExpression()), !dbg !740
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !741, metadata !DIExpression()), !dbg !742
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !743, metadata !DIExpression()), !dbg !744
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !745, metadata !DIExpression()), !dbg !746
  %0 = bitcast i32* %n.addr to i8*, !dbg !747
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !747
  %2 = icmp eq i32 %1, 0, !dbg !747
  br i1 %2, label %setup.next, label %setup.end, !dbg !747

setup.next:                                       ; preds = %entry
  %3 = bitcast double* %alpha.addr to i8*, !dbg !747
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !747
  %5 = icmp eq i32 %4, 0, !dbg !747
  br i1 %5, label %setup.next1, label %setup.end, !dbg !747

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast double* %beta.addr to i8*, !dbg !747
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !747
  %8 = icmp eq i32 %7, 0, !dbg !747
  br i1 %8, label %setup.next2, label %setup.end, !dbg !747

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %A.addr to i8*, !dbg !747
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !747
  %11 = icmp eq i32 %10, 0, !dbg !747
  br i1 %11, label %setup.next3, label %setup.end, !dbg !747

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %u1.addr to i8*, !dbg !747
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !747
  %14 = icmp eq i32 %13, 0, !dbg !747
  br i1 %14, label %setup.next4, label %setup.end, !dbg !747

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %v1.addr to i8*, !dbg !747
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !747
  %17 = icmp eq i32 %16, 0, !dbg !747
  br i1 %17, label %setup.next5, label %setup.end, !dbg !747

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %u2.addr to i8*, !dbg !747
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 48), !dbg !747
  %20 = icmp eq i32 %19, 0, !dbg !747
  br i1 %20, label %setup.next6, label %setup.end, !dbg !747

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast double** %v2.addr to i8*, !dbg !747
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 56), !dbg !747
  %23 = icmp eq i32 %22, 0, !dbg !747
  br i1 %23, label %setup.next7, label %setup.end, !dbg !747

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast double** %w.addr to i8*, !dbg !747
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 8, i64 64), !dbg !747
  %26 = icmp eq i32 %25, 0, !dbg !747
  br i1 %26, label %setup.next8, label %setup.end, !dbg !747

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast double** %x.addr to i8*, !dbg !747
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 8, i64 72), !dbg !747
  %29 = icmp eq i32 %28, 0, !dbg !747
  br i1 %29, label %setup.next9, label %setup.end, !dbg !747

setup.next9:                                      ; preds = %setup.next8
  %30 = bitcast double** %y.addr to i8*, !dbg !747
  %31 = call i32 @cudaSetupArgument(i8* %30, i64 8, i64 80), !dbg !747
  %32 = icmp eq i32 %31, 0, !dbg !747
  br i1 %32, label %setup.next10, label %setup.end, !dbg !747

setup.next10:                                     ; preds = %setup.next9
  %33 = bitcast double** %z.addr to i8*, !dbg !747
  %34 = call i32 @cudaSetupArgument(i8* %33, i64 8, i64 88), !dbg !747
  %35 = icmp eq i32 %34, 0, !dbg !747
  br i1 %35, label %setup.next11, label %setup.end, !dbg !747

setup.next11:                                     ; preds = %setup.next10
  %36 = call i32 @cudaLaunch(i8* bitcast (void (i32, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*)* @_Z8kernel_xiddPdS_S_S_S_S_S_S_S_ to i8*)), !dbg !747
  br label %setup.end, !dbg !747

setup.end:                                        ; preds = %setup.next11, %setup.next10, %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !748
}

; Function Attrs: noinline uwtable
define dso_local void @_Z8kernel_yiddPdS_S_S_S_S_S_S_S_(i32 %n, double %alpha, double %beta, double* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 !dbg !749 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %A.addr = alloca double*, align 8
  %u1.addr = alloca double*, align 8
  %v1.addr = alloca double*, align 8
  %u2.addr = alloca double*, align 8
  %v2.addr = alloca double*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !750, metadata !DIExpression()), !dbg !751
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !752, metadata !DIExpression()), !dbg !753
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !754, metadata !DIExpression()), !dbg !755
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !756, metadata !DIExpression()), !dbg !757
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !758, metadata !DIExpression()), !dbg !759
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !760, metadata !DIExpression()), !dbg !761
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !762, metadata !DIExpression()), !dbg !763
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !764, metadata !DIExpression()), !dbg !765
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !766, metadata !DIExpression()), !dbg !767
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !768, metadata !DIExpression()), !dbg !769
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !770, metadata !DIExpression()), !dbg !771
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !772, metadata !DIExpression()), !dbg !773
  %0 = bitcast i32* %n.addr to i8*, !dbg !774
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !774
  %2 = icmp eq i32 %1, 0, !dbg !774
  br i1 %2, label %setup.next, label %setup.end, !dbg !774

setup.next:                                       ; preds = %entry
  %3 = bitcast double* %alpha.addr to i8*, !dbg !774
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !774
  %5 = icmp eq i32 %4, 0, !dbg !774
  br i1 %5, label %setup.next1, label %setup.end, !dbg !774

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast double* %beta.addr to i8*, !dbg !774
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !774
  %8 = icmp eq i32 %7, 0, !dbg !774
  br i1 %8, label %setup.next2, label %setup.end, !dbg !774

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %A.addr to i8*, !dbg !774
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !774
  %11 = icmp eq i32 %10, 0, !dbg !774
  br i1 %11, label %setup.next3, label %setup.end, !dbg !774

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %u1.addr to i8*, !dbg !774
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !774
  %14 = icmp eq i32 %13, 0, !dbg !774
  br i1 %14, label %setup.next4, label %setup.end, !dbg !774

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %v1.addr to i8*, !dbg !774
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !774
  %17 = icmp eq i32 %16, 0, !dbg !774
  br i1 %17, label %setup.next5, label %setup.end, !dbg !774

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %u2.addr to i8*, !dbg !774
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 48), !dbg !774
  %20 = icmp eq i32 %19, 0, !dbg !774
  br i1 %20, label %setup.next6, label %setup.end, !dbg !774

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast double** %v2.addr to i8*, !dbg !774
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 56), !dbg !774
  %23 = icmp eq i32 %22, 0, !dbg !774
  br i1 %23, label %setup.next7, label %setup.end, !dbg !774

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast double** %w.addr to i8*, !dbg !774
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 8, i64 64), !dbg !774
  %26 = icmp eq i32 %25, 0, !dbg !774
  br i1 %26, label %setup.next8, label %setup.end, !dbg !774

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast double** %x.addr to i8*, !dbg !774
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 8, i64 72), !dbg !774
  %29 = icmp eq i32 %28, 0, !dbg !774
  br i1 %29, label %setup.next9, label %setup.end, !dbg !774

setup.next9:                                      ; preds = %setup.next8
  %30 = bitcast double** %y.addr to i8*, !dbg !774
  %31 = call i32 @cudaSetupArgument(i8* %30, i64 8, i64 80), !dbg !774
  %32 = icmp eq i32 %31, 0, !dbg !774
  br i1 %32, label %setup.next10, label %setup.end, !dbg !774

setup.next10:                                     ; preds = %setup.next9
  %33 = bitcast double** %z.addr to i8*, !dbg !774
  %34 = call i32 @cudaSetupArgument(i8* %33, i64 8, i64 88), !dbg !774
  %35 = icmp eq i32 %34, 0, !dbg !774
  br i1 %35, label %setup.next11, label %setup.end, !dbg !774

setup.next11:                                     ; preds = %setup.next10
  %36 = call i32 @cudaLaunch(i8* bitcast (void (i32, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*)* @_Z8kernel_yiddPdS_S_S_S_S_S_S_S_ to i8*)), !dbg !774
  br label %setup.end, !dbg !774

setup.end:                                        ; preds = %setup.next11, %setup.next10, %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !775
}

; Function Attrs: noinline uwtable
define dso_local void @_Z8kernel_widdPdS_S_S_S_S_S_S_S_(i32 %n, double %alpha, double %beta, double* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 !dbg !776 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %A.addr = alloca double*, align 8
  %u1.addr = alloca double*, align 8
  %v1.addr = alloca double*, align 8
  %u2.addr = alloca double*, align 8
  %v2.addr = alloca double*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !777, metadata !DIExpression()), !dbg !778
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !779, metadata !DIExpression()), !dbg !780
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !781, metadata !DIExpression()), !dbg !782
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !783, metadata !DIExpression()), !dbg !784
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !785, metadata !DIExpression()), !dbg !786
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !787, metadata !DIExpression()), !dbg !788
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !789, metadata !DIExpression()), !dbg !790
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !791, metadata !DIExpression()), !dbg !792
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !793, metadata !DIExpression()), !dbg !794
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !795, metadata !DIExpression()), !dbg !796
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !797, metadata !DIExpression()), !dbg !798
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !799, metadata !DIExpression()), !dbg !800
  %0 = bitcast i32* %n.addr to i8*, !dbg !801
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !801
  %2 = icmp eq i32 %1, 0, !dbg !801
  br i1 %2, label %setup.next, label %setup.end, !dbg !801

setup.next:                                       ; preds = %entry
  %3 = bitcast double* %alpha.addr to i8*, !dbg !801
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !801
  %5 = icmp eq i32 %4, 0, !dbg !801
  br i1 %5, label %setup.next1, label %setup.end, !dbg !801

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast double* %beta.addr to i8*, !dbg !801
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !801
  %8 = icmp eq i32 %7, 0, !dbg !801
  br i1 %8, label %setup.next2, label %setup.end, !dbg !801

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %A.addr to i8*, !dbg !801
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !801
  %11 = icmp eq i32 %10, 0, !dbg !801
  br i1 %11, label %setup.next3, label %setup.end, !dbg !801

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %u1.addr to i8*, !dbg !801
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !801
  %14 = icmp eq i32 %13, 0, !dbg !801
  br i1 %14, label %setup.next4, label %setup.end, !dbg !801

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %v1.addr to i8*, !dbg !801
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !801
  %17 = icmp eq i32 %16, 0, !dbg !801
  br i1 %17, label %setup.next5, label %setup.end, !dbg !801

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %u2.addr to i8*, !dbg !801
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 48), !dbg !801
  %20 = icmp eq i32 %19, 0, !dbg !801
  br i1 %20, label %setup.next6, label %setup.end, !dbg !801

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast double** %v2.addr to i8*, !dbg !801
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 56), !dbg !801
  %23 = icmp eq i32 %22, 0, !dbg !801
  br i1 %23, label %setup.next7, label %setup.end, !dbg !801

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast double** %w.addr to i8*, !dbg !801
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 8, i64 64), !dbg !801
  %26 = icmp eq i32 %25, 0, !dbg !801
  br i1 %26, label %setup.next8, label %setup.end, !dbg !801

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast double** %x.addr to i8*, !dbg !801
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 8, i64 72), !dbg !801
  %29 = icmp eq i32 %28, 0, !dbg !801
  br i1 %29, label %setup.next9, label %setup.end, !dbg !801

setup.next9:                                      ; preds = %setup.next8
  %30 = bitcast double** %y.addr to i8*, !dbg !801
  %31 = call i32 @cudaSetupArgument(i8* %30, i64 8, i64 80), !dbg !801
  %32 = icmp eq i32 %31, 0, !dbg !801
  br i1 %32, label %setup.next10, label %setup.end, !dbg !801

setup.next10:                                     ; preds = %setup.next9
  %33 = bitcast double** %z.addr to i8*, !dbg !801
  %34 = call i32 @cudaSetupArgument(i8* %33, i64 8, i64 88), !dbg !801
  %35 = icmp eq i32 %34, 0, !dbg !801
  br i1 %35, label %setup.next11, label %setup.end, !dbg !801

setup.next11:                                     ; preds = %setup.next10
  %36 = call i32 @cudaLaunch(i8* bitcast (void (i32, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*)* @_Z8kernel_widdPdS_S_S_S_S_S_S_S_ to i8*)), !dbg !801
  br label %setup.end, !dbg !801

setup.end:                                        ; preds = %setup.next11, %setup.next10, %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !802
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !803 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %dump_code = alloca i32, align 4
  %alpha = alloca double*, align 8
  %beta = alloca double*, align 8
  %A = alloca double*, align 8
  %u1 = alloca double*, align 8
  %v1 = alloca double*, align 8
  %u2 = alloca double*, align 8
  %v2 = alloca double*, align 8
  %w = alloca double*, align 8
  %x = alloca double*, align 8
  %y = alloca double*, align 8
  %z = alloca double*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !806, metadata !DIExpression()), !dbg !807
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !808, metadata !DIExpression()), !dbg !809
  call void @llvm.dbg.declare(metadata i32* %n, metadata !810, metadata !DIExpression()), !dbg !811
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !812
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !812
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !812
  %call = call i32 @atoi(i8* %1) #8, !dbg !813
  store i32 %call, i32* %n, align 4, !dbg !811
  call void @llvm.dbg.declare(metadata i32* %dump_code, metadata !814, metadata !DIExpression()), !dbg !815
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !816
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 1, !dbg !816
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !816
  %call2 = call i32 @atoi(i8* %3) #8, !dbg !817
  store i32 %call2, i32* %dump_code, align 4, !dbg !815
  call void @llvm.dbg.declare(metadata double** %alpha, metadata !818, metadata !DIExpression()), !dbg !819
  %call3 = call noalias i8* @malloc(i64 8) #9, !dbg !820
  %4 = bitcast i8* %call3 to double*, !dbg !821
  store double* %4, double** %alpha, align 8, !dbg !819
  call void @llvm.dbg.declare(metadata double** %beta, metadata !822, metadata !DIExpression()), !dbg !823
  %call4 = call noalias i8* @malloc(i64 8) #9, !dbg !824
  %5 = bitcast i8* %call4 to double*, !dbg !825
  store double* %5, double** %beta, align 8, !dbg !823
  call void @llvm.dbg.declare(metadata double** %A, metadata !826, metadata !DIExpression()), !dbg !827
  %6 = load i32, i32* %n, align 4, !dbg !828
  %7 = load i32, i32* %n, align 4, !dbg !829
  %mul = mul nsw i32 %6, %7, !dbg !830
  %conv = sext i32 %mul to i64, !dbg !828
  %mul5 = mul i64 %conv, 8, !dbg !831
  %call6 = call noalias i8* @malloc(i64 %mul5) #9, !dbg !832
  %8 = bitcast i8* %call6 to double*, !dbg !833
  store double* %8, double** %A, align 8, !dbg !827
  call void @llvm.dbg.declare(metadata double** %u1, metadata !834, metadata !DIExpression()), !dbg !835
  %9 = load i32, i32* %n, align 4, !dbg !836
  %conv7 = sext i32 %9 to i64, !dbg !836
  %mul8 = mul i64 %conv7, 8, !dbg !837
  %call9 = call noalias i8* @malloc(i64 %mul8) #9, !dbg !838
  %10 = bitcast i8* %call9 to double*, !dbg !839
  store double* %10, double** %u1, align 8, !dbg !835
  call void @llvm.dbg.declare(metadata double** %v1, metadata !840, metadata !DIExpression()), !dbg !841
  %11 = load i32, i32* %n, align 4, !dbg !842
  %conv10 = sext i32 %11 to i64, !dbg !842
  %mul11 = mul i64 %conv10, 8, !dbg !843
  %call12 = call noalias i8* @malloc(i64 %mul11) #9, !dbg !844
  %12 = bitcast i8* %call12 to double*, !dbg !845
  store double* %12, double** %v1, align 8, !dbg !841
  call void @llvm.dbg.declare(metadata double** %u2, metadata !846, metadata !DIExpression()), !dbg !847
  %13 = load i32, i32* %n, align 4, !dbg !848
  %conv13 = sext i32 %13 to i64, !dbg !848
  %mul14 = mul i64 %conv13, 8, !dbg !849
  %call15 = call noalias i8* @malloc(i64 %mul14) #9, !dbg !850
  %14 = bitcast i8* %call15 to double*, !dbg !851
  store double* %14, double** %u2, align 8, !dbg !847
  call void @llvm.dbg.declare(metadata double** %v2, metadata !852, metadata !DIExpression()), !dbg !853
  %15 = load i32, i32* %n, align 4, !dbg !854
  %conv16 = sext i32 %15 to i64, !dbg !854
  %mul17 = mul i64 %conv16, 8, !dbg !855
  %call18 = call noalias i8* @malloc(i64 %mul17) #9, !dbg !856
  %16 = bitcast i8* %call18 to double*, !dbg !857
  store double* %16, double** %v2, align 8, !dbg !853
  call void @llvm.dbg.declare(metadata double** %w, metadata !858, metadata !DIExpression()), !dbg !859
  %17 = load i32, i32* %n, align 4, !dbg !860
  %conv19 = sext i32 %17 to i64, !dbg !860
  %mul20 = mul i64 %conv19, 8, !dbg !861
  %call21 = call noalias i8* @malloc(i64 %mul20) #9, !dbg !862
  %18 = bitcast i8* %call21 to double*, !dbg !863
  store double* %18, double** %w, align 8, !dbg !859
  call void @llvm.dbg.declare(metadata double** %x, metadata !864, metadata !DIExpression()), !dbg !865
  %19 = load i32, i32* %n, align 4, !dbg !866
  %conv22 = sext i32 %19 to i64, !dbg !866
  %mul23 = mul i64 %conv22, 8, !dbg !867
  %call24 = call noalias i8* @malloc(i64 %mul23) #9, !dbg !868
  %20 = bitcast i8* %call24 to double*, !dbg !869
  store double* %20, double** %x, align 8, !dbg !865
  call void @llvm.dbg.declare(metadata double** %y, metadata !870, metadata !DIExpression()), !dbg !871
  %21 = load i32, i32* %n, align 4, !dbg !872
  %conv25 = sext i32 %21 to i64, !dbg !872
  %mul26 = mul i64 %conv25, 8, !dbg !873
  %call27 = call noalias i8* @malloc(i64 %mul26) #9, !dbg !874
  %22 = bitcast i8* %call27 to double*, !dbg !875
  store double* %22, double** %y, align 8, !dbg !871
  call void @llvm.dbg.declare(metadata double** %z, metadata !876, metadata !DIExpression()), !dbg !877
  %23 = load i32, i32* %n, align 4, !dbg !878
  %conv28 = sext i32 %23 to i64, !dbg !878
  %mul29 = mul i64 %conv28, 8, !dbg !879
  %call30 = call noalias i8* @malloc(i64 %mul29) #9, !dbg !880
  %24 = bitcast i8* %call30 to double*, !dbg !881
  store double* %24, double** %z, align 8, !dbg !877
  %25 = load i32, i32* %n, align 4, !dbg !882
  %26 = load double*, double** %alpha, align 8, !dbg !883
  %27 = load double*, double** %beta, align 8, !dbg !884
  %28 = load double*, double** %A, align 8, !dbg !885
  %29 = load double*, double** %u1, align 8, !dbg !886
  %30 = load double*, double** %v1, align 8, !dbg !887
  %31 = load double*, double** %u2, align 8, !dbg !888
  %32 = load double*, double** %v2, align 8, !dbg !889
  %33 = load double*, double** %w, align 8, !dbg !890
  %34 = load double*, double** %x, align 8, !dbg !891
  %35 = load double*, double** %y, align 8, !dbg !892
  %36 = load double*, double** %z, align 8, !dbg !893
  call void @_ZL10init_arrayiPdS_S_S_S_S_S_S_S_S_S_(i32 %25, double* %26, double* %27, double* %28, double* %29, double* %30, double* %31, double* %32, double* %33, double* %34, double* %35, double* %36), !dbg !894
  %37 = load i32, i32* %n, align 4, !dbg !895
  %38 = load double*, double** %alpha, align 8, !dbg !896
  %39 = load double*, double** %beta, align 8, !dbg !897
  %40 = load double*, double** %A, align 8, !dbg !898
  %41 = load double*, double** %u1, align 8, !dbg !899
  %42 = load double*, double** %v1, align 8, !dbg !900
  %43 = load double*, double** %u2, align 8, !dbg !901
  %44 = load double*, double** %v2, align 8, !dbg !902
  %45 = load double*, double** %w, align 8, !dbg !903
  %46 = load double*, double** %x, align 8, !dbg !904
  %47 = load double*, double** %y, align 8, !dbg !905
  %48 = load double*, double** %z, align 8, !dbg !906
  call void @_ZL6kerneliPdS_S_S_S_S_S_S_S_S_S_(i32 %37, double* %38, double* %39, double* %40, double* %41, double* %42, double* %43, double* %44, double* %45, double* %46, double* %47, double* %48), !dbg !907
  %49 = load i32, i32* %dump_code, align 4, !dbg !908
  %cmp = icmp eq i32 %49, 1, !dbg !910
  br i1 %cmp, label %if.then, label %if.end, !dbg !911

if.then:                                          ; preds = %entry
  %50 = load i32, i32* %n, align 4, !dbg !912
  %51 = load double*, double** %w, align 8, !dbg !913
  call void @_ZL11print_arrayiPd(i32 %50, double* %51), !dbg !914
  br label %if.end, !dbg !914

if.end:                                           ; preds = %if.then, %entry
  %52 = load double*, double** %A, align 8, !dbg !915
  %53 = bitcast double* %52 to i8*, !dbg !915
  call void @free(i8* %53) #9, !dbg !916
  %54 = load double*, double** %u1, align 8, !dbg !917
  %55 = bitcast double* %54 to i8*, !dbg !917
  call void @free(i8* %55) #9, !dbg !918
  %56 = load double*, double** %v1, align 8, !dbg !919
  %57 = bitcast double* %56 to i8*, !dbg !919
  call void @free(i8* %57) #9, !dbg !920
  %58 = load double*, double** %u2, align 8, !dbg !921
  %59 = bitcast double* %58 to i8*, !dbg !921
  call void @free(i8* %59) #9, !dbg !922
  %60 = load double*, double** %v2, align 8, !dbg !923
  %61 = bitcast double* %60 to i8*, !dbg !923
  call void @free(i8* %61) #9, !dbg !924
  %62 = load double*, double** %w, align 8, !dbg !925
  %63 = bitcast double* %62 to i8*, !dbg !925
  call void @free(i8* %63) #9, !dbg !926
  %64 = load double*, double** %x, align 8, !dbg !927
  %65 = bitcast double* %64 to i8*, !dbg !927
  call void @free(i8* %65) #9, !dbg !928
  %66 = load double*, double** %y, align 8, !dbg !929
  %67 = bitcast double* %66 to i8*, !dbg !929
  call void @free(i8* %67) #9, !dbg !930
  %68 = load double*, double** %z, align 8, !dbg !931
  %69 = bitcast double* %68 to i8*, !dbg !931
  call void @free(i8* %69) #9, !dbg !932
  ret i32 0, !dbg !933
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: noinline nounwind uwtable
define internal void @_ZL10init_arrayiPdS_S_S_S_S_S_S_S_S_S_(i32 %n, double* %alpha, double* %beta, double* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #5 !dbg !934 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %u1.addr = alloca double*, align 8
  %v1.addr = alloca double*, align 8
  %u2.addr = alloca double*, align 8
  %v2.addr = alloca double*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !937, metadata !DIExpression()), !dbg !938
  store double* %alpha, double** %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double** %alpha.addr, metadata !939, metadata !DIExpression()), !dbg !940
  store double* %beta, double** %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double** %beta.addr, metadata !941, metadata !DIExpression()), !dbg !942
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !943, metadata !DIExpression()), !dbg !944
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !945, metadata !DIExpression()), !dbg !946
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !947, metadata !DIExpression()), !dbg !948
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !949, metadata !DIExpression()), !dbg !950
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !951, metadata !DIExpression()), !dbg !952
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !953, metadata !DIExpression()), !dbg !954
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !955, metadata !DIExpression()), !dbg !956
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !957, metadata !DIExpression()), !dbg !958
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !959, metadata !DIExpression()), !dbg !960
  call void @llvm.dbg.declare(metadata i32* %i, metadata !961, metadata !DIExpression()), !dbg !962
  call void @llvm.dbg.declare(metadata i32* %j, metadata !963, metadata !DIExpression()), !dbg !964
  %0 = load double*, double** %alpha.addr, align 8, !dbg !965
  store double 4.353200e+04, double* %0, align 8, !dbg !966
  %1 = load double*, double** %beta.addr, align 8, !dbg !967
  store double 1.231300e+04, double* %1, align 8, !dbg !968
  store i32 0, i32* %i, align 4, !dbg !969
  br label %for.cond, !dbg !971

for.cond:                                         ; preds = %for.inc44, %entry
  %2 = load i32, i32* %i, align 4, !dbg !972
  %3 = load i32, i32* %n.addr, align 4, !dbg !974
  %cmp = icmp slt i32 %2, %3, !dbg !975
  br i1 %cmp, label %for.body, label %for.end46, !dbg !976

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !977
  %conv = sitofp i32 %4 to double, !dbg !977
  %5 = load double*, double** %u1.addr, align 8, !dbg !979
  %6 = load i32, i32* %i, align 4, !dbg !980
  %idxprom = sext i32 %6 to i64, !dbg !979
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom, !dbg !979
  store double %conv, double* %arrayidx, align 8, !dbg !981
  %7 = load i32, i32* %i, align 4, !dbg !982
  %add = add nsw i32 %7, 1, !dbg !983
  %8 = load i32, i32* %n.addr, align 4, !dbg !984
  %div = sdiv i32 %add, %8, !dbg !985
  %conv1 = sitofp i32 %div to double, !dbg !986
  %div2 = fdiv double %conv1, 2.000000e+00, !dbg !987
  %9 = load double*, double** %u2.addr, align 8, !dbg !988
  %10 = load i32, i32* %i, align 4, !dbg !989
  %idxprom3 = sext i32 %10 to i64, !dbg !988
  %arrayidx4 = getelementptr inbounds double, double* %9, i64 %idxprom3, !dbg !988
  store double %div2, double* %arrayidx4, align 8, !dbg !990
  %11 = load i32, i32* %i, align 4, !dbg !991
  %add5 = add nsw i32 %11, 1, !dbg !992
  %12 = load i32, i32* %n.addr, align 4, !dbg !993
  %div6 = sdiv i32 %add5, %12, !dbg !994
  %conv7 = sitofp i32 %div6 to double, !dbg !995
  %div8 = fdiv double %conv7, 4.000000e+00, !dbg !996
  %13 = load double*, double** %v1.addr, align 8, !dbg !997
  %14 = load i32, i32* %i, align 4, !dbg !998
  %idxprom9 = sext i32 %14 to i64, !dbg !997
  %arrayidx10 = getelementptr inbounds double, double* %13, i64 %idxprom9, !dbg !997
  store double %div8, double* %arrayidx10, align 8, !dbg !999
  %15 = load i32, i32* %i, align 4, !dbg !1000
  %add11 = add nsw i32 %15, 1, !dbg !1001
  %16 = load i32, i32* %n.addr, align 4, !dbg !1002
  %div12 = sdiv i32 %add11, %16, !dbg !1003
  %conv13 = sitofp i32 %div12 to double, !dbg !1004
  %div14 = fdiv double %conv13, 6.000000e+00, !dbg !1005
  %17 = load double*, double** %v2.addr, align 8, !dbg !1006
  %18 = load i32, i32* %i, align 4, !dbg !1007
  %idxprom15 = sext i32 %18 to i64, !dbg !1006
  %arrayidx16 = getelementptr inbounds double, double* %17, i64 %idxprom15, !dbg !1006
  store double %div14, double* %arrayidx16, align 8, !dbg !1008
  %19 = load i32, i32* %i, align 4, !dbg !1009
  %add17 = add nsw i32 %19, 1, !dbg !1010
  %20 = load i32, i32* %n.addr, align 4, !dbg !1011
  %div18 = sdiv i32 %add17, %20, !dbg !1012
  %conv19 = sitofp i32 %div18 to double, !dbg !1013
  %div20 = fdiv double %conv19, 8.000000e+00, !dbg !1014
  %21 = load double*, double** %y.addr, align 8, !dbg !1015
  %22 = load i32, i32* %i, align 4, !dbg !1016
  %idxprom21 = sext i32 %22 to i64, !dbg !1015
  %arrayidx22 = getelementptr inbounds double, double* %21, i64 %idxprom21, !dbg !1015
  store double %div20, double* %arrayidx22, align 8, !dbg !1017
  %23 = load i32, i32* %i, align 4, !dbg !1018
  %add23 = add nsw i32 %23, 1, !dbg !1019
  %24 = load i32, i32* %n.addr, align 4, !dbg !1020
  %div24 = sdiv i32 %add23, %24, !dbg !1021
  %conv25 = sitofp i32 %div24 to double, !dbg !1022
  %div26 = fdiv double %conv25, 9.000000e+00, !dbg !1023
  %25 = load double*, double** %z.addr, align 8, !dbg !1024
  %26 = load i32, i32* %i, align 4, !dbg !1025
  %idxprom27 = sext i32 %26 to i64, !dbg !1024
  %arrayidx28 = getelementptr inbounds double, double* %25, i64 %idxprom27, !dbg !1024
  store double %div26, double* %arrayidx28, align 8, !dbg !1026
  %27 = load double*, double** %x.addr, align 8, !dbg !1027
  %28 = load i32, i32* %i, align 4, !dbg !1028
  %idxprom29 = sext i32 %28 to i64, !dbg !1027
  %arrayidx30 = getelementptr inbounds double, double* %27, i64 %idxprom29, !dbg !1027
  store double 0.000000e+00, double* %arrayidx30, align 8, !dbg !1029
  %29 = load double*, double** %w.addr, align 8, !dbg !1030
  %30 = load i32, i32* %i, align 4, !dbg !1031
  %idxprom31 = sext i32 %30 to i64, !dbg !1030
  %arrayidx32 = getelementptr inbounds double, double* %29, i64 %idxprom31, !dbg !1030
  store double 0.000000e+00, double* %arrayidx32, align 8, !dbg !1032
  store i32 0, i32* %j, align 4, !dbg !1033
  br label %for.cond33, !dbg !1035

for.cond33:                                       ; preds = %for.inc, %for.body
  %31 = load i32, i32* %j, align 4, !dbg !1036
  %32 = load i32, i32* %n.addr, align 4, !dbg !1038
  %cmp34 = icmp slt i32 %31, %32, !dbg !1039
  br i1 %cmp34, label %for.body35, label %for.end, !dbg !1040

for.body35:                                       ; preds = %for.cond33
  %33 = load i32, i32* %i, align 4, !dbg !1041
  %conv36 = sitofp i32 %33 to double, !dbg !1041
  %34 = load i32, i32* %j, align 4, !dbg !1042
  %conv37 = sitofp i32 %34 to double, !dbg !1042
  %mul = fmul contract double %conv36, %conv37, !dbg !1043
  %35 = load i32, i32* %n.addr, align 4, !dbg !1044
  %conv38 = sitofp i32 %35 to double, !dbg !1044
  %div39 = fdiv double %mul, %conv38, !dbg !1045
  %36 = load double*, double** %A.addr, align 8, !dbg !1046
  %37 = load i32, i32* %i, align 4, !dbg !1047
  %38 = load i32, i32* %n.addr, align 4, !dbg !1048
  %mul40 = mul nsw i32 %37, %38, !dbg !1049
  %39 = load i32, i32* %j, align 4, !dbg !1050
  %add41 = add nsw i32 %mul40, %39, !dbg !1051
  %idxprom42 = sext i32 %add41 to i64, !dbg !1046
  %arrayidx43 = getelementptr inbounds double, double* %36, i64 %idxprom42, !dbg !1046
  store double %div39, double* %arrayidx43, align 8, !dbg !1052
  br label %for.inc, !dbg !1046

for.inc:                                          ; preds = %for.body35
  %40 = load i32, i32* %j, align 4, !dbg !1053
  %inc = add nsw i32 %40, 1, !dbg !1053
  store i32 %inc, i32* %j, align 4, !dbg !1053
  br label %for.cond33, !dbg !1054, !llvm.loop !1055

for.end:                                          ; preds = %for.cond33
  br label %for.inc44, !dbg !1057

for.inc44:                                        ; preds = %for.end
  %41 = load i32, i32* %i, align 4, !dbg !1058
  %inc45 = add nsw i32 %41, 1, !dbg !1058
  store i32 %inc45, i32* %i, align 4, !dbg !1058
  br label %for.cond, !dbg !1059, !llvm.loop !1060

for.end46:                                        ; preds = %for.cond
  ret void, !dbg !1062
}

; Function Attrs: noinline uwtable
define internal void @_ZL6kerneliPdS_S_S_S_S_S_S_S_S_S_(i32 %n, double* %alpha, double* %beta, double* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 !dbg !1063 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %u1.addr = alloca double*, align 8
  %v1.addr = alloca double*, align 8
  %u2.addr = alloca double*, align 8
  %v2.addr = alloca double*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  %dev_A = alloca double*, align 8
  %dev_u1 = alloca double*, align 8
  %dev_v1 = alloca double*, align 8
  %dev_u2 = alloca double*, align 8
  %dev_v2 = alloca double*, align 8
  %dev_w = alloca double*, align 8
  %dev_x = alloca double*, align 8
  %dev_y = alloca double*, align 8
  %dev_z = alloca double*, align 8
  %dev_alpha = alloca double*, align 8
  %dev_beta = alloca double*, align 8
  %threadsPerBlock = alloca i32, align 4
  %block = alloca %struct.dim3, align 4
  %grid = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp62 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp62.coerce = alloca { i64, i32 }, align 4
  %agg.tmp64 = alloca %struct.dim3, align 4
  %agg.tmp66 = alloca %struct.dim3, align 4
  %agg.tmp64.coerce = alloca { i64, i32 }, align 4
  %agg.tmp66.coerce = alloca { i64, i32 }, align 4
  %agg.tmp71 = alloca %struct.dim3, align 4
  %agg.tmp73 = alloca %struct.dim3, align 4
  %agg.tmp71.coerce = alloca { i64, i32 }, align 4
  %agg.tmp73.coerce = alloca { i64, i32 }, align 4
  %agg.tmp78 = alloca %struct.dim3, align 4
  %agg.tmp80 = alloca %struct.dim3, align 4
  %agg.tmp78.coerce = alloca { i64, i32 }, align 4
  %agg.tmp80.coerce = alloca { i64, i32 }, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !1064, metadata !DIExpression()), !dbg !1065
  store double* %alpha, double** %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double** %alpha.addr, metadata !1066, metadata !DIExpression()), !dbg !1067
  store double* %beta, double** %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double** %beta.addr, metadata !1068, metadata !DIExpression()), !dbg !1069
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !1070, metadata !DIExpression()), !dbg !1071
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !1072, metadata !DIExpression()), !dbg !1073
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !1074, metadata !DIExpression()), !dbg !1075
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !1076, metadata !DIExpression()), !dbg !1077
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !1078, metadata !DIExpression()), !dbg !1079
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !1080, metadata !DIExpression()), !dbg !1081
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !1082, metadata !DIExpression()), !dbg !1083
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !1084, metadata !DIExpression()), !dbg !1085
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !1086, metadata !DIExpression()), !dbg !1087
  call void @llvm.dbg.declare(metadata double** %dev_A, metadata !1088, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.declare(metadata double** %dev_u1, metadata !1090, metadata !DIExpression()), !dbg !1091
  call void @llvm.dbg.declare(metadata double** %dev_v1, metadata !1092, metadata !DIExpression()), !dbg !1093
  call void @llvm.dbg.declare(metadata double** %dev_u2, metadata !1094, metadata !DIExpression()), !dbg !1095
  call void @llvm.dbg.declare(metadata double** %dev_v2, metadata !1096, metadata !DIExpression()), !dbg !1097
  call void @llvm.dbg.declare(metadata double** %dev_w, metadata !1098, metadata !DIExpression()), !dbg !1099
  call void @llvm.dbg.declare(metadata double** %dev_x, metadata !1100, metadata !DIExpression()), !dbg !1101
  call void @llvm.dbg.declare(metadata double** %dev_y, metadata !1102, metadata !DIExpression()), !dbg !1103
  call void @llvm.dbg.declare(metadata double** %dev_z, metadata !1104, metadata !DIExpression()), !dbg !1105
  call void @llvm.dbg.declare(metadata double** %dev_alpha, metadata !1106, metadata !DIExpression()), !dbg !1107
  call void @llvm.dbg.declare(metadata double** %dev_beta, metadata !1108, metadata !DIExpression()), !dbg !1109
  %0 = load i32, i32* %n.addr, align 4, !dbg !1110
  %1 = load i32, i32* %n.addr, align 4, !dbg !1111
  %mul = mul nsw i32 %0, %1, !dbg !1112
  %conv = sext i32 %mul to i64, !dbg !1110
  %mul1 = mul i64 %conv, 8, !dbg !1113
  %call = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_A, i64 %mul1), !dbg !1114
  %2 = load i32, i32* %n.addr, align 4, !dbg !1115
  %conv2 = sext i32 %2 to i64, !dbg !1115
  %mul3 = mul i64 %conv2, 8, !dbg !1116
  %call4 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_u1, i64 %mul3), !dbg !1117
  %3 = load i32, i32* %n.addr, align 4, !dbg !1118
  %conv5 = sext i32 %3 to i64, !dbg !1118
  %mul6 = mul i64 %conv5, 8, !dbg !1119
  %call7 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_v1, i64 %mul6), !dbg !1120
  %4 = load i32, i32* %n.addr, align 4, !dbg !1121
  %conv8 = sext i32 %4 to i64, !dbg !1121
  %mul9 = mul i64 %conv8, 8, !dbg !1122
  %call10 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_u2, i64 %mul9), !dbg !1123
  %5 = load i32, i32* %n.addr, align 4, !dbg !1124
  %conv11 = sext i32 %5 to i64, !dbg !1124
  %mul12 = mul i64 %conv11, 8, !dbg !1125
  %call13 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_v2, i64 %mul12), !dbg !1126
  %6 = load i32, i32* %n.addr, align 4, !dbg !1127
  %conv14 = sext i32 %6 to i64, !dbg !1127
  %mul15 = mul i64 %conv14, 8, !dbg !1128
  %call16 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_w, i64 %mul15), !dbg !1129
  %7 = load i32, i32* %n.addr, align 4, !dbg !1130
  %conv17 = sext i32 %7 to i64, !dbg !1130
  %mul18 = mul i64 %conv17, 8, !dbg !1131
  %call19 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_x, i64 %mul18), !dbg !1132
  %8 = load i32, i32* %n.addr, align 4, !dbg !1133
  %conv20 = sext i32 %8 to i64, !dbg !1133
  %mul21 = mul i64 %conv20, 8, !dbg !1134
  %call22 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_y, i64 %mul21), !dbg !1135
  %9 = load i32, i32* %n.addr, align 4, !dbg !1136
  %conv23 = sext i32 %9 to i64, !dbg !1136
  %mul24 = mul i64 %conv23, 8, !dbg !1137
  %call25 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_z, i64 %mul24), !dbg !1138
  %call26 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_alpha, i64 8), !dbg !1139
  %call27 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_beta, i64 8), !dbg !1140
  %10 = load double*, double** %dev_A, align 8, !dbg !1141
  %11 = bitcast double* %10 to i8*, !dbg !1141
  %12 = load double*, double** %A.addr, align 8, !dbg !1142
  %13 = bitcast double* %12 to i8*, !dbg !1142
  %14 = load i32, i32* %n.addr, align 4, !dbg !1143
  %15 = load i32, i32* %n.addr, align 4, !dbg !1144
  %mul28 = mul nsw i32 %14, %15, !dbg !1145
  %conv29 = sext i32 %mul28 to i64, !dbg !1143
  %mul30 = mul i64 %conv29, 8, !dbg !1146
  %call31 = call i32 @cudaMemcpy(i8* %11, i8* %13, i64 %mul30, i32 1), !dbg !1147
  %16 = load double*, double** %dev_u1, align 8, !dbg !1148
  %17 = bitcast double* %16 to i8*, !dbg !1148
  %18 = load double*, double** %u1.addr, align 8, !dbg !1149
  %19 = bitcast double* %18 to i8*, !dbg !1149
  %20 = load i32, i32* %n.addr, align 4, !dbg !1150
  %conv32 = sext i32 %20 to i64, !dbg !1150
  %mul33 = mul i64 %conv32, 8, !dbg !1151
  %call34 = call i32 @cudaMemcpy(i8* %17, i8* %19, i64 %mul33, i32 1), !dbg !1152
  %21 = load double*, double** %dev_v1, align 8, !dbg !1153
  %22 = bitcast double* %21 to i8*, !dbg !1153
  %23 = load double*, double** %v1.addr, align 8, !dbg !1154
  %24 = bitcast double* %23 to i8*, !dbg !1154
  %25 = load i32, i32* %n.addr, align 4, !dbg !1155
  %conv35 = sext i32 %25 to i64, !dbg !1155
  %mul36 = mul i64 %conv35, 8, !dbg !1156
  %call37 = call i32 @cudaMemcpy(i8* %22, i8* %24, i64 %mul36, i32 1), !dbg !1157
  %26 = load double*, double** %dev_u2, align 8, !dbg !1158
  %27 = bitcast double* %26 to i8*, !dbg !1158
  %28 = load double*, double** %u2.addr, align 8, !dbg !1159
  %29 = bitcast double* %28 to i8*, !dbg !1159
  %30 = load i32, i32* %n.addr, align 4, !dbg !1160
  %conv38 = sext i32 %30 to i64, !dbg !1160
  %mul39 = mul i64 %conv38, 8, !dbg !1161
  %call40 = call i32 @cudaMemcpy(i8* %27, i8* %29, i64 %mul39, i32 1), !dbg !1162
  %31 = load double*, double** %dev_v2, align 8, !dbg !1163
  %32 = bitcast double* %31 to i8*, !dbg !1163
  %33 = load double*, double** %v2.addr, align 8, !dbg !1164
  %34 = bitcast double* %33 to i8*, !dbg !1164
  %35 = load i32, i32* %n.addr, align 4, !dbg !1165
  %conv41 = sext i32 %35 to i64, !dbg !1165
  %mul42 = mul i64 %conv41, 8, !dbg !1166
  %call43 = call i32 @cudaMemcpy(i8* %32, i8* %34, i64 %mul42, i32 1), !dbg !1167
  %36 = load double*, double** %dev_w, align 8, !dbg !1168
  %37 = bitcast double* %36 to i8*, !dbg !1168
  %38 = load double*, double** %w.addr, align 8, !dbg !1169
  %39 = bitcast double* %38 to i8*, !dbg !1169
  %40 = load i32, i32* %n.addr, align 4, !dbg !1170
  %conv44 = sext i32 %40 to i64, !dbg !1170
  %mul45 = mul i64 %conv44, 8, !dbg !1171
  %call46 = call i32 @cudaMemcpy(i8* %37, i8* %39, i64 %mul45, i32 1), !dbg !1172
  %41 = load double*, double** %dev_x, align 8, !dbg !1173
  %42 = bitcast double* %41 to i8*, !dbg !1173
  %43 = load double*, double** %x.addr, align 8, !dbg !1174
  %44 = bitcast double* %43 to i8*, !dbg !1174
  %45 = load i32, i32* %n.addr, align 4, !dbg !1175
  %conv47 = sext i32 %45 to i64, !dbg !1175
  %mul48 = mul i64 %conv47, 8, !dbg !1176
  %call49 = call i32 @cudaMemcpy(i8* %42, i8* %44, i64 %mul48, i32 1), !dbg !1177
  %46 = load double*, double** %dev_y, align 8, !dbg !1178
  %47 = bitcast double* %46 to i8*, !dbg !1178
  %48 = load double*, double** %y.addr, align 8, !dbg !1179
  %49 = bitcast double* %48 to i8*, !dbg !1179
  %50 = load i32, i32* %n.addr, align 4, !dbg !1180
  %conv50 = sext i32 %50 to i64, !dbg !1180
  %mul51 = mul i64 %conv50, 8, !dbg !1181
  %call52 = call i32 @cudaMemcpy(i8* %47, i8* %49, i64 %mul51, i32 1), !dbg !1182
  %51 = load double*, double** %dev_z, align 8, !dbg !1183
  %52 = bitcast double* %51 to i8*, !dbg !1183
  %53 = load double*, double** %z.addr, align 8, !dbg !1184
  %54 = bitcast double* %53 to i8*, !dbg !1184
  %55 = load i32, i32* %n.addr, align 4, !dbg !1185
  %conv53 = sext i32 %55 to i64, !dbg !1185
  %mul54 = mul i64 %conv53, 8, !dbg !1186
  %call55 = call i32 @cudaMemcpy(i8* %52, i8* %54, i64 %mul54, i32 1), !dbg !1187
  %56 = load double*, double** %dev_alpha, align 8, !dbg !1188
  %57 = bitcast double* %56 to i8*, !dbg !1188
  %58 = load double*, double** %alpha.addr, align 8, !dbg !1189
  %59 = bitcast double* %58 to i8*, !dbg !1189
  %call56 = call i32 @cudaMemcpy(i8* %57, i8* %59, i64 8, i32 1), !dbg !1190
  %60 = load double*, double** %dev_beta, align 8, !dbg !1191
  %61 = bitcast double* %60 to i8*, !dbg !1191
  %62 = load double*, double** %beta.addr, align 8, !dbg !1192
  %63 = bitcast double* %62 to i8*, !dbg !1192
  %call57 = call i32 @cudaMemcpy(i8* %61, i8* %63, i64 8, i32 1), !dbg !1193
  call void @llvm.dbg.declare(metadata i32* %threadsPerBlock, metadata !1194, metadata !DIExpression()), !dbg !1196
  store i32 256, i32* %threadsPerBlock, align 4, !dbg !1196
  call void @llvm.dbg.declare(metadata %struct.dim3* %block, metadata !1197, metadata !DIExpression()), !dbg !1222
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %block, i32 8, i32 32, i32 1), !dbg !1222
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid, metadata !1223, metadata !DIExpression()), !dbg !1224
  %64 = load i32, i32* %n.addr, align 4, !dbg !1225
  %x58 = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 0, !dbg !1226
  %65 = load i32, i32* %x58, align 4, !dbg !1226
  %call59 = call i32 @_ZL10num_blocksii(i32 %64, i32 %65), !dbg !1227
  %66 = load i32, i32* %n.addr, align 4, !dbg !1228
  %y60 = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 1, !dbg !1229
  %67 = load i32, i32* %y60, align 4, !dbg !1229
  %call61 = call i32 @_ZL10num_blocksii(i32 %66, i32 %67), !dbg !1230
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid, i32 %call59, i32 %call61, i32 1), !dbg !1224
  %68 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1231
  %69 = bitcast %struct.dim3* %grid to i8*, !dbg !1231
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %68, i8* align 4 %69, i64 12, i1 false), !dbg !1231
  %70 = bitcast %struct.dim3* %agg.tmp62 to i8*, !dbg !1232
  %71 = bitcast %struct.dim3* %block to i8*, !dbg !1232
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %70, i8* align 4 %71, i64 12, i1 false), !dbg !1232
  %72 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1233
  %73 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1233
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %72, i8* align 4 %73, i64 12, i1 false), !dbg !1233
  %74 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1233
  %75 = load i64, i64* %74, align 4, !dbg !1233
  %76 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1233
  %77 = load i32, i32* %76, align 4, !dbg !1233
  %78 = bitcast { i64, i32 }* %agg.tmp62.coerce to i8*, !dbg !1233
  %79 = bitcast %struct.dim3* %agg.tmp62 to i8*, !dbg !1233
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %78, i8* align 4 %79, i64 12, i1 false), !dbg !1233
  %80 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp62.coerce, i32 0, i32 0, !dbg !1233
  %81 = load i64, i64* %80, align 4, !dbg !1233
  %82 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp62.coerce, i32 0, i32 1, !dbg !1233
  %83 = load i32, i32* %82, align 4, !dbg !1233
  %call63 = call i32 @cudaConfigureCall(i64 %75, i32 %77, i64 %81, i32 %83, i64 0, %struct.CUstream_st* null), !dbg !1233
  %tobool = icmp ne i32 %call63, 0, !dbg !1233
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !1234

kcall.configok:                                   ; preds = %entry
  %84 = load i32, i32* %n.addr, align 4, !dbg !1235
  %85 = load double*, double** %dev_alpha, align 8, !dbg !1236
  %86 = load double, double* %85, align 8, !dbg !1237
  %87 = load double*, double** %dev_beta, align 8, !dbg !1238
  %88 = load double, double* %87, align 8, !dbg !1239
  %89 = load double*, double** %dev_A, align 8, !dbg !1240
  %90 = load double*, double** %dev_u1, align 8, !dbg !1241
  %91 = load double*, double** %dev_v1, align 8, !dbg !1242
  %92 = load double*, double** %dev_u2, align 8, !dbg !1243
  %93 = load double*, double** %dev_v2, align 8, !dbg !1244
  %94 = load double*, double** %dev_w, align 8, !dbg !1245
  %95 = load double*, double** %dev_x, align 8, !dbg !1246
  %96 = load double*, double** %dev_y, align 8, !dbg !1247
  %97 = load double*, double** %dev_z, align 8, !dbg !1248
  call void @_Z8kernel_AiddPdS_S_S_S_S_S_S_S_(i32 %84, double %86, double %88, double* %89, double* %90, double* %91, double* %92, double* %93, double* %94, double* %95, double* %96, double* %97), !dbg !1234
  br label %kcall.end, !dbg !1234

kcall.end:                                        ; preds = %kcall.configok, %entry
  %98 = load i32, i32* %n.addr, align 4, !dbg !1249
  %call65 = call i32 @_ZL10num_blocksii(i32 %98, i32 256), !dbg !1250
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp64, i32 %call65, i32 1, i32 1), !dbg !1250
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp66, i32 256, i32 1, i32 1), !dbg !1251
  %99 = bitcast { i64, i32 }* %agg.tmp64.coerce to i8*, !dbg !1252
  %100 = bitcast %struct.dim3* %agg.tmp64 to i8*, !dbg !1252
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %99, i8* align 4 %100, i64 12, i1 false), !dbg !1252
  %101 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp64.coerce, i32 0, i32 0, !dbg !1252
  %102 = load i64, i64* %101, align 4, !dbg !1252
  %103 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp64.coerce, i32 0, i32 1, !dbg !1252
  %104 = load i32, i32* %103, align 4, !dbg !1252
  %105 = bitcast { i64, i32 }* %agg.tmp66.coerce to i8*, !dbg !1252
  %106 = bitcast %struct.dim3* %agg.tmp66 to i8*, !dbg !1252
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %105, i8* align 4 %106, i64 12, i1 false), !dbg !1252
  %107 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp66.coerce, i32 0, i32 0, !dbg !1252
  %108 = load i64, i64* %107, align 4, !dbg !1252
  %109 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp66.coerce, i32 0, i32 1, !dbg !1252
  %110 = load i32, i32* %109, align 4, !dbg !1252
  %call67 = call i32 @cudaConfigureCall(i64 %102, i32 %104, i64 %108, i32 %110, i64 0, %struct.CUstream_st* null), !dbg !1252
  %tobool68 = icmp ne i32 %call67, 0, !dbg !1252
  br i1 %tobool68, label %kcall.end70, label %kcall.configok69, !dbg !1253

kcall.configok69:                                 ; preds = %kcall.end
  %111 = load i32, i32* %n.addr, align 4, !dbg !1254
  %112 = load double*, double** %dev_alpha, align 8, !dbg !1255
  %113 = load double, double* %112, align 8, !dbg !1256
  %114 = load double*, double** %dev_beta, align 8, !dbg !1257
  %115 = load double, double* %114, align 8, !dbg !1258
  %116 = load double*, double** %dev_A, align 8, !dbg !1259
  %117 = load double*, double** %dev_u1, align 8, !dbg !1260
  %118 = load double*, double** %dev_v1, align 8, !dbg !1261
  %119 = load double*, double** %dev_u2, align 8, !dbg !1262
  %120 = load double*, double** %dev_v2, align 8, !dbg !1263
  %121 = load double*, double** %dev_w, align 8, !dbg !1264
  %122 = load double*, double** %dev_x, align 8, !dbg !1265
  %123 = load double*, double** %dev_y, align 8, !dbg !1266
  %124 = load double*, double** %dev_z, align 8, !dbg !1267
  call void @_Z8kernel_xiddPdS_S_S_S_S_S_S_S_(i32 %111, double %113, double %115, double* %116, double* %117, double* %118, double* %119, double* %120, double* %121, double* %122, double* %123, double* %124), !dbg !1253
  br label %kcall.end70, !dbg !1253

kcall.end70:                                      ; preds = %kcall.configok69, %kcall.end
  %125 = load i32, i32* %n.addr, align 4, !dbg !1268
  %call72 = call i32 @_ZL10num_blocksii(i32 %125, i32 256), !dbg !1269
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp71, i32 %call72, i32 1, i32 1), !dbg !1269
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp73, i32 256, i32 1, i32 1), !dbg !1270
  %126 = bitcast { i64, i32 }* %agg.tmp71.coerce to i8*, !dbg !1271
  %127 = bitcast %struct.dim3* %agg.tmp71 to i8*, !dbg !1271
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %126, i8* align 4 %127, i64 12, i1 false), !dbg !1271
  %128 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp71.coerce, i32 0, i32 0, !dbg !1271
  %129 = load i64, i64* %128, align 4, !dbg !1271
  %130 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp71.coerce, i32 0, i32 1, !dbg !1271
  %131 = load i32, i32* %130, align 4, !dbg !1271
  %132 = bitcast { i64, i32 }* %agg.tmp73.coerce to i8*, !dbg !1271
  %133 = bitcast %struct.dim3* %agg.tmp73 to i8*, !dbg !1271
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %132, i8* align 4 %133, i64 12, i1 false), !dbg !1271
  %134 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp73.coerce, i32 0, i32 0, !dbg !1271
  %135 = load i64, i64* %134, align 4, !dbg !1271
  %136 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp73.coerce, i32 0, i32 1, !dbg !1271
  %137 = load i32, i32* %136, align 4, !dbg !1271
  %call74 = call i32 @cudaConfigureCall(i64 %129, i32 %131, i64 %135, i32 %137, i64 0, %struct.CUstream_st* null), !dbg !1271
  %tobool75 = icmp ne i32 %call74, 0, !dbg !1271
  br i1 %tobool75, label %kcall.end77, label %kcall.configok76, !dbg !1272

kcall.configok76:                                 ; preds = %kcall.end70
  %138 = load i32, i32* %n.addr, align 4, !dbg !1273
  %139 = load double*, double** %dev_alpha, align 8, !dbg !1274
  %140 = load double, double* %139, align 8, !dbg !1275
  %141 = load double*, double** %dev_beta, align 8, !dbg !1276
  %142 = load double, double* %141, align 8, !dbg !1277
  %143 = load double*, double** %dev_A, align 8, !dbg !1278
  %144 = load double*, double** %dev_u1, align 8, !dbg !1279
  %145 = load double*, double** %dev_v1, align 8, !dbg !1280
  %146 = load double*, double** %dev_u2, align 8, !dbg !1281
  %147 = load double*, double** %dev_v2, align 8, !dbg !1282
  %148 = load double*, double** %dev_w, align 8, !dbg !1283
  %149 = load double*, double** %dev_x, align 8, !dbg !1284
  %150 = load double*, double** %dev_y, align 8, !dbg !1285
  %151 = load double*, double** %dev_z, align 8, !dbg !1286
  call void @_Z8kernel_yiddPdS_S_S_S_S_S_S_S_(i32 %138, double %140, double %142, double* %143, double* %144, double* %145, double* %146, double* %147, double* %148, double* %149, double* %150, double* %151), !dbg !1272
  br label %kcall.end77, !dbg !1272

kcall.end77:                                      ; preds = %kcall.configok76, %kcall.end70
  %152 = load i32, i32* %n.addr, align 4, !dbg !1287
  %call79 = call i32 @_ZL10num_blocksii(i32 %152, i32 256), !dbg !1288
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp78, i32 %call79, i32 1, i32 1), !dbg !1288
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp80, i32 256, i32 1, i32 1), !dbg !1289
  %153 = bitcast { i64, i32 }* %agg.tmp78.coerce to i8*, !dbg !1290
  %154 = bitcast %struct.dim3* %agg.tmp78 to i8*, !dbg !1290
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %153, i8* align 4 %154, i64 12, i1 false), !dbg !1290
  %155 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp78.coerce, i32 0, i32 0, !dbg !1290
  %156 = load i64, i64* %155, align 4, !dbg !1290
  %157 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp78.coerce, i32 0, i32 1, !dbg !1290
  %158 = load i32, i32* %157, align 4, !dbg !1290
  %159 = bitcast { i64, i32 }* %agg.tmp80.coerce to i8*, !dbg !1290
  %160 = bitcast %struct.dim3* %agg.tmp80 to i8*, !dbg !1290
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %159, i8* align 4 %160, i64 12, i1 false), !dbg !1290
  %161 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp80.coerce, i32 0, i32 0, !dbg !1290
  %162 = load i64, i64* %161, align 4, !dbg !1290
  %163 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp80.coerce, i32 0, i32 1, !dbg !1290
  %164 = load i32, i32* %163, align 4, !dbg !1290
  %call81 = call i32 @cudaConfigureCall(i64 %156, i32 %158, i64 %162, i32 %164, i64 0, %struct.CUstream_st* null), !dbg !1290
  %tobool82 = icmp ne i32 %call81, 0, !dbg !1290
  br i1 %tobool82, label %kcall.end84, label %kcall.configok83, !dbg !1291

kcall.configok83:                                 ; preds = %kcall.end77
  %165 = load i32, i32* %n.addr, align 4, !dbg !1292
  %166 = load double*, double** %dev_alpha, align 8, !dbg !1293
  %167 = load double, double* %166, align 8, !dbg !1294
  %168 = load double*, double** %dev_beta, align 8, !dbg !1295
  %169 = load double, double* %168, align 8, !dbg !1296
  %170 = load double*, double** %dev_A, align 8, !dbg !1297
  %171 = load double*, double** %dev_u1, align 8, !dbg !1298
  %172 = load double*, double** %dev_v1, align 8, !dbg !1299
  %173 = load double*, double** %dev_u2, align 8, !dbg !1300
  %174 = load double*, double** %dev_v2, align 8, !dbg !1301
  %175 = load double*, double** %dev_w, align 8, !dbg !1302
  %176 = load double*, double** %dev_x, align 8, !dbg !1303
  %177 = load double*, double** %dev_y, align 8, !dbg !1304
  %178 = load double*, double** %dev_z, align 8, !dbg !1305
  call void @_Z8kernel_widdPdS_S_S_S_S_S_S_S_(i32 %165, double %167, double %169, double* %170, double* %171, double* %172, double* %173, double* %174, double* %175, double* %176, double* %177, double* %178), !dbg !1291
  br label %kcall.end84, !dbg !1291

kcall.end84:                                      ; preds = %kcall.configok83, %kcall.end77
  %179 = load double*, double** %w.addr, align 8, !dbg !1306
  %180 = bitcast double* %179 to i8*, !dbg !1306
  %181 = load double*, double** %dev_w, align 8, !dbg !1307
  %182 = bitcast double* %181 to i8*, !dbg !1307
  %183 = load i32, i32* %n.addr, align 4, !dbg !1308
  %conv85 = sext i32 %183 to i64, !dbg !1308
  %mul86 = mul i64 %conv85, 8, !dbg !1309
  %call87 = call i32 @cudaMemcpy(i8* %180, i8* %182, i64 %mul86, i32 2), !dbg !1310
  ret void, !dbg !1311
}

; Function Attrs: noinline uwtable
define internal void @_ZL11print_arrayiPd(i32 %n, double* %w) #0 !dbg !1312 {
entry:
  %n.addr = alloca i32, align 4
  %w.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !1315, metadata !DIExpression()), !dbg !1316
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !1317, metadata !DIExpression()), !dbg !1318
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1319, metadata !DIExpression()), !dbg !1320
  store i32 0, i32* %i, align 4, !dbg !1321
  br label %for.cond, !dbg !1323

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1324
  %1 = load i32, i32* %n.addr, align 4, !dbg !1326
  %cmp = icmp slt i32 %0, %1, !dbg !1327
  br i1 %cmp, label %for.body, label %for.end, !dbg !1328

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1329
  %3 = load double*, double** %w.addr, align 8, !dbg !1331
  %4 = load i32, i32* %i, align 4, !dbg !1332
  %idxprom = sext i32 %4 to i64, !dbg !1331
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom, !dbg !1331
  %5 = load double, double* %arrayidx, align 8, !dbg !1331
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %5), !dbg !1333
  %6 = load i32, i32* %i, align 4, !dbg !1334
  %rem = srem i32 %6, 20, !dbg !1336
  %cmp1 = icmp eq i32 %rem, 0, !dbg !1337
  br i1 %cmp1, label %if.then, label %if.end, !dbg !1338

if.then:                                          ; preds = %for.body
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1339
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1340
  br label %if.end, !dbg !1340

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !1341

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %i, align 4, !dbg !1342
  %inc = add nsw i32 %8, 1, !dbg !1342
  store i32 %inc, i32* %i, align 4, !dbg !1342
  br label %for.cond, !dbg !1343, !llvm.loop !1344

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1346
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline uwtable
define internal i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %devPtr, i64 %size) #0 !dbg !1347 {
entry:
  %devPtr.addr = alloca double**, align 8
  %size.addr = alloca i64, align 8
  store double** %devPtr, double*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %devPtr.addr, metadata !1355, metadata !DIExpression()), !dbg !1356
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !1357, metadata !DIExpression()), !dbg !1358
  %0 = load double**, double*** %devPtr.addr, align 8, !dbg !1359
  %1 = bitcast double** %0 to i8*, !dbg !1359
  %2 = bitcast i8* %1 to i8**, !dbg !1360
  %3 = load i64, i64* %size.addr, align 8, !dbg !1361
  %call = call i32 @cudaMalloc(i8** %2, i64 %3), !dbg !1362
  ret i32 %call, !dbg !1363
}

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #6

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #5 comdat align 2 !dbg !1364 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1365, metadata !DIExpression()), !dbg !1367
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1368, metadata !DIExpression()), !dbg !1369
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1370, metadata !DIExpression()), !dbg !1371
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1372, metadata !DIExpression()), !dbg !1373
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1374
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1375
  store i32 %0, i32* %x, align 4, !dbg !1374
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1376
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1377
  store i32 %1, i32* %y, align 4, !dbg !1376
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1378
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1379
  store i32 %2, i32* %z, align 4, !dbg !1378
  ret void, !dbg !1380
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_ZL10num_blocksii(i32 %num, i32 %factor) #5 !dbg !1381 {
entry:
  %num.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1384, metadata !DIExpression()), !dbg !1385
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1386, metadata !DIExpression()), !dbg !1387
  %0 = load i32, i32* %num.addr, align 4, !dbg !1388
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1389
  %add = add nsw i32 %0, %1, !dbg !1390
  %sub = sub nsw i32 %add, 1, !dbg !1391
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1392
  %div = sdiv i32 %sub, %2, !dbg !1393
  ret i32 %div, !dbg !1394
}

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #7

declare dso_local i32 @cudaMalloc(i8**, i64) #6

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #6

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.dbg.cu = !{!4}
!llvm.ident = !{!691}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 7, i32 0]}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !5, producer: "clang version 9.0.0 (git@github.com:SusanTan/llvm-project.git a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !6, retainedTypes: !98, imports: !103, nameTableKind: None)
!5 = !DIFile(filename: "gemver.cu", directory: "/u/NAS_SCRATCH/yc0769/xstack-benchmark/polybench-cuda/gemver")
!6 = !{!7, !16}
!7 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !8, line: 796, baseType: !9, size: 32, elements: !10, identifier: "_ZTS14cudaMemcpyKind")
!8 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "")
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!11, !12, !13, !14, !15}
!11 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0, isUnsigned: true)
!12 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1, isUnsigned: true)
!13 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2, isUnsigned: true)
!14 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!15 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4, isUnsigned: true)
!16 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !8, line: 150, baseType: !9, size: 32, elements: !17, identifier: "_ZTS9cudaError")
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97}
!18 = !DIEnumerator(name: "cudaSuccess", value: 0, isUnsigned: true)
!19 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1, isUnsigned: true)
!20 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2, isUnsigned: true)
!21 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3, isUnsigned: true)
!22 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4, isUnsigned: true)
!23 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5, isUnsigned: true)
!24 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6, isUnsigned: true)
!25 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7, isUnsigned: true)
!26 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8, isUnsigned: true)
!27 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9, isUnsigned: true)
!28 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10, isUnsigned: true)
!29 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11, isUnsigned: true)
!30 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12, isUnsigned: true)
!31 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13, isUnsigned: true)
!32 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14, isUnsigned: true)
!33 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15, isUnsigned: true)
!34 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16, isUnsigned: true)
!35 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!36 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18, isUnsigned: true)
!37 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19, isUnsigned: true)
!38 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20, isUnsigned: true)
!39 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!40 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22, isUnsigned: true)
!41 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23, isUnsigned: true)
!42 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24, isUnsigned: true)
!43 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25, isUnsigned: true)
!44 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26, isUnsigned: true)
!45 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27, isUnsigned: true)
!46 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28, isUnsigned: true)
!47 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29, isUnsigned: true)
!48 = !DIEnumerator(name: "cudaErrorUnknown", value: 30, isUnsigned: true)
!49 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31, isUnsigned: true)
!50 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32, isUnsigned: true)
!51 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33, isUnsigned: true)
!52 = !DIEnumerator(name: "cudaErrorNotReady", value: 34, isUnsigned: true)
!53 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35, isUnsigned: true)
!54 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36, isUnsigned: true)
!55 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37, isUnsigned: true)
!56 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38, isUnsigned: true)
!57 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39, isUnsigned: true)
!58 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40, isUnsigned: true)
!59 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41, isUnsigned: true)
!60 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42, isUnsigned: true)
!61 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43, isUnsigned: true)
!62 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44, isUnsigned: true)
!63 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45, isUnsigned: true)
!64 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46, isUnsigned: true)
!65 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47, isUnsigned: true)
!66 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48, isUnsigned: true)
!67 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49, isUnsigned: true)
!68 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50, isUnsigned: true)
!69 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51, isUnsigned: true)
!70 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54, isUnsigned: true)
!71 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55, isUnsigned: true)
!72 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56, isUnsigned: true)
!73 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57, isUnsigned: true)
!74 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58, isUnsigned: true)
!75 = !DIEnumerator(name: "cudaErrorAssert", value: 59, isUnsigned: true)
!76 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60, isUnsigned: true)
!77 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61, isUnsigned: true)
!78 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62, isUnsigned: true)
!79 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63, isUnsigned: true)
!80 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64, isUnsigned: true)
!81 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65, isUnsigned: true)
!82 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66, isUnsigned: true)
!83 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67, isUnsigned: true)
!84 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68, isUnsigned: true)
!85 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69, isUnsigned: true)
!86 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70, isUnsigned: true)
!87 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71, isUnsigned: true)
!88 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72, isUnsigned: true)
!89 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73, isUnsigned: true)
!90 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74, isUnsigned: true)
!91 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75, isUnsigned: true)
!92 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76, isUnsigned: true)
!93 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77, isUnsigned: true)
!94 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78, isUnsigned: true)
!95 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79, isUnsigned: true)
!96 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127, isUnsigned: true)
!97 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000, isUnsigned: true)
!98 = !{!99, !101, !100, !102}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!103 = !{!104, !111, !116, !118, !120, !122, !124, !128, !130, !132, !134, !136, !138, !140, !142, !144, !146, !148, !150, !152, !154, !156, !160, !162, !164, !166, !170, !175, !177, !179, !184, !188, !190, !192, !194, !196, !198, !200, !202, !204, !209, !213, !215, !220, !224, !226, !228, !230, !232, !234, !238, !240, !242, !247, !254, !258, !260, !262, !264, !266, !270, !272, !274, !278, !280, !282, !284, !286, !288, !290, !292, !294, !296, !300, !306, !308, !310, !314, !316, !318, !320, !322, !324, !326, !328, !332, !336, !338, !340, !344, !346, !348, !350, !352, !354, !356, !360, !366, !370, !375, !377, !381, !385, !398, !402, !406, !410, !414, !419, !421, !425, !429, !433, !441, !445, !449, !453, !457, !461, !467, !471, !475, !477, !485, !489, !496, !498, !500, !504, !508, !512, !517, !521, !526, !527, !528, !529, !531, !532, !533, !534, !535, !536, !537, !539, !540, !541, !542, !543, !547, !548, !549, !550, !551, !552, !553, !554, !555, !556, !557, !558, !559, !560, !561, !562, !563, !564, !565, !566, !567, !568, !569, !570, !571, !575, !577, !579, !581, !583, !585, !587, !589, !592, !594, !596, !598, !600, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652, !654, !656, !658, !660, !662, !664, !666, !668, !670, !672, !674, !676, !678, !680, !682, !684, !686}
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !106, file: !107, line: 223)
!105 = !DINamespace(name: "std", scope: null)
!106 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !107, file: !107, line: 53, type: !108, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!107 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/u/NAS_SCRATCH/yc0769")
!108 = !DISubroutineType(types: !109)
!109 = !{!110, !110}
!110 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !112, file: !107, line: 224)
!112 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !107, file: !107, line: 55, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!113 = !DISubroutineType(types: !114)
!114 = !{!115, !115}
!115 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !117, file: !107, line: 225)
!117 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !107, file: !107, line: 57, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !119, file: !107, line: 226)
!119 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !107, file: !107, line: 59, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !121, file: !107, line: 227)
!121 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !107, file: !107, line: 61, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !123, file: !107, line: 228)
!123 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !107, file: !107, line: 65, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !125, file: !107, line: 229)
!125 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !107, file: !107, line: 63, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!126 = !DISubroutineType(types: !127)
!127 = !{!115, !115, !115}
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !129, file: !107, line: 230)
!129 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !107, file: !107, line: 67, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !131, file: !107, line: 231)
!131 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !107, file: !107, line: 69, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !133, file: !107, line: 232)
!133 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !107, file: !107, line: 71, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !135, file: !107, line: 233)
!135 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !107, file: !107, line: 73, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !137, file: !107, line: 234)
!137 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !107, file: !107, line: 75, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !139, file: !107, line: 235)
!139 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !107, file: !107, line: 77, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !141, file: !107, line: 236)
!141 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !107, file: !107, line: 81, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !143, file: !107, line: 237)
!143 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !107, file: !107, line: 79, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !145, file: !107, line: 238)
!145 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !107, file: !107, line: 85, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !147, file: !107, line: 239)
!147 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !107, file: !107, line: 83, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !149, file: !107, line: 240)
!149 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !107, file: !107, line: 87, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !151, file: !107, line: 241)
!151 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !107, file: !107, line: 89, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !153, file: !107, line: 242)
!153 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !107, file: !107, line: 91, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !155, file: !107, line: 243)
!155 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !107, file: !107, line: 93, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !157, file: !107, line: 244)
!157 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !107, file: !107, line: 95, type: !158, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!158 = !DISubroutineType(types: !159)
!159 = !{!115, !115, !115, !115}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !161, file: !107, line: 245)
!161 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !107, file: !107, line: 97, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !163, file: !107, line: 246)
!163 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !107, file: !107, line: 99, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !165, file: !107, line: 247)
!165 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !107, file: !107, line: 101, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !167, file: !107, line: 248)
!167 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !107, file: !107, line: 103, type: !168, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!168 = !DISubroutineType(types: !169)
!169 = !{!110, !115}
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !171, file: !107, line: 249)
!171 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !107, file: !107, line: 105, type: !172, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!172 = !DISubroutineType(types: !173)
!173 = !{!115, !115, !174}
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !176, file: !107, line: 250)
!176 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !107, file: !107, line: 107, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !178, file: !107, line: 251)
!178 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !107, file: !107, line: 109, type: !168, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !180, file: !107, line: 252)
!180 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !107, file: !107, line: 114, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!181 = !DISubroutineType(types: !182)
!182 = !{!183, !115}
!183 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !185, file: !107, line: 253)
!185 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !107, file: !107, line: 118, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!186 = !DISubroutineType(types: !187)
!187 = !{!183, !115, !115}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !189, file: !107, line: 254)
!189 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !107, file: !107, line: 117, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !191, file: !107, line: 255)
!191 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !107, file: !107, line: 123, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !193, file: !107, line: 256)
!193 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !107, file: !107, line: 127, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !195, file: !107, line: 257)
!195 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !107, file: !107, line: 126, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !197, file: !107, line: 258)
!197 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !107, file: !107, line: 129, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !199, file: !107, line: 259)
!199 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !107, file: !107, line: 134, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !201, file: !107, line: 260)
!201 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !107, file: !107, line: 136, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !203, file: !107, line: 261)
!203 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !107, file: !107, line: 138, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !205, file: !107, line: 262)
!205 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !107, file: !107, line: 139, type: !206, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!206 = !DISubroutineType(types: !207)
!207 = !{!208, !208}
!208 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !210, file: !107, line: 263)
!210 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !107, file: !107, line: 141, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!211 = !DISubroutineType(types: !212)
!212 = !{!115, !115, !110}
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !214, file: !107, line: 264)
!214 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !107, file: !107, line: 143, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !216, file: !107, line: 265)
!216 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !107, file: !107, line: 144, type: !217, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!217 = !DISubroutineType(types: !218)
!218 = !{!219, !219}
!219 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !221, file: !107, line: 266)
!221 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !107, file: !107, line: 146, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!222 = !DISubroutineType(types: !223)
!223 = !{!219, !115}
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !225, file: !107, line: 267)
!225 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !107, file: !107, line: 159, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !227, file: !107, line: 268)
!227 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !107, file: !107, line: 148, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !229, file: !107, line: 269)
!229 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !107, file: !107, line: 150, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !231, file: !107, line: 270)
!231 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !107, file: !107, line: 152, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !233, file: !107, line: 271)
!233 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !107, file: !107, line: 154, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !235, file: !107, line: 272)
!235 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !107, file: !107, line: 161, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!236 = !DISubroutineType(types: !237)
!237 = !{!208, !115}
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !239, file: !107, line: 273)
!239 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !107, file: !107, line: 163, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !241, file: !107, line: 274)
!241 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !107, file: !107, line: 164, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !243, file: !107, line: 275)
!243 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !107, file: !107, line: 166, type: !244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!244 = !DISubroutineType(types: !245)
!245 = !{!115, !115, !246}
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !248, file: !107, line: 276)
!248 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !107, file: !107, line: 167, type: !249, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!249 = !DISubroutineType(types: !250)
!250 = !{!100, !251}
!251 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !252, size: 64)
!252 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !253)
!253 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !255, file: !107, line: 277)
!255 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !107, file: !107, line: 168, type: !256, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!256 = !DISubroutineType(types: !257)
!257 = !{!115, !251}
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !259, file: !107, line: 278)
!259 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !107, file: !107, line: 170, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !261, file: !107, line: 279)
!261 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !107, file: !107, line: 172, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !263, file: !107, line: 280)
!263 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !107, file: !107, line: 176, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !265, file: !107, line: 281)
!265 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !107, file: !107, line: 178, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !267, file: !107, line: 282)
!267 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !107, file: !107, line: 180, type: !268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!268 = !DISubroutineType(types: !269)
!269 = !{!115, !115, !115, !174}
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !271, file: !107, line: 283)
!271 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !107, file: !107, line: 182, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !273, file: !107, line: 284)
!273 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !107, file: !107, line: 184, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !275, file: !107, line: 285)
!275 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !107, file: !107, line: 186, type: !276, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!276 = !DISubroutineType(types: !277)
!277 = !{!115, !115, !208}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !279, file: !107, line: 286)
!279 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !107, file: !107, line: 188, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !281, file: !107, line: 287)
!281 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !107, file: !107, line: 190, type: !181, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !283, file: !107, line: 288)
!283 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !107, file: !107, line: 192, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !285, file: !107, line: 289)
!285 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !107, file: !107, line: 194, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !287, file: !107, line: 290)
!287 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !107, file: !107, line: 196, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !289, file: !107, line: 291)
!289 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !107, file: !107, line: 198, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !291, file: !107, line: 292)
!291 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !107, file: !107, line: 200, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !293, file: !107, line: 293)
!293 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !107, file: !107, line: 202, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !295, file: !107, line: 294)
!295 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !107, file: !107, line: 204, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !297, file: !299, line: 52)
!297 = !DISubprogram(name: "abs", scope: !298, file: !298, line: 840, type: !108, flags: DIFlagPrototyped, spFlags: 0)
!298 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!299 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/std_abs.h", directory: "")
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !301, file: !305, line: 83)
!301 = !DISubprogram(name: "acos", scope: !302, file: !302, line: 53, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!303 = !DISubroutineType(types: !304)
!304 = !{!100, !100}
!305 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cmath", directory: "")
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !307, file: !305, line: 102)
!307 = !DISubprogram(name: "asin", scope: !302, file: !302, line: 55, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !309, file: !305, line: 121)
!309 = !DISubprogram(name: "atan", scope: !302, file: !302, line: 57, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !311, file: !305, line: 140)
!311 = !DISubprogram(name: "atan2", scope: !302, file: !302, line: 59, type: !312, flags: DIFlagPrototyped, spFlags: 0)
!312 = !DISubroutineType(types: !313)
!313 = !{!100, !100, !100}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !315, file: !305, line: 161)
!315 = !DISubprogram(name: "ceil", scope: !302, file: !302, line: 159, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !317, file: !305, line: 180)
!317 = !DISubprogram(name: "cos", scope: !302, file: !302, line: 62, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !319, file: !305, line: 199)
!319 = !DISubprogram(name: "cosh", scope: !302, file: !302, line: 71, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !321, file: !305, line: 218)
!321 = !DISubprogram(name: "exp", scope: !302, file: !302, line: 95, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !323, file: !305, line: 237)
!323 = !DISubprogram(name: "fabs", scope: !302, file: !302, line: 162, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !325, file: !305, line: 256)
!325 = !DISubprogram(name: "floor", scope: !302, file: !302, line: 165, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !327, file: !305, line: 275)
!327 = !DISubprogram(name: "fmod", scope: !302, file: !302, line: 168, type: !312, flags: DIFlagPrototyped, spFlags: 0)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !329, file: !305, line: 296)
!329 = !DISubprogram(name: "frexp", scope: !302, file: !302, line: 98, type: !330, flags: DIFlagPrototyped, spFlags: 0)
!330 = !DISubroutineType(types: !331)
!331 = !{!100, !100, !174}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !333, file: !305, line: 315)
!333 = !DISubprogram(name: "ldexp", scope: !302, file: !302, line: 101, type: !334, flags: DIFlagPrototyped, spFlags: 0)
!334 = !DISubroutineType(types: !335)
!335 = !{!100, !100, !110}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !337, file: !305, line: 334)
!337 = !DISubprogram(name: "log", scope: !302, file: !302, line: 104, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !339, file: !305, line: 353)
!339 = !DISubprogram(name: "log10", scope: !302, file: !302, line: 107, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !341, file: !305, line: 372)
!341 = !DISubprogram(name: "modf", scope: !302, file: !302, line: 110, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DISubroutineType(types: !343)
!343 = !{!100, !100, !99}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !345, file: !305, line: 384)
!345 = !DISubprogram(name: "pow", scope: !302, file: !302, line: 140, type: !312, flags: DIFlagPrototyped, spFlags: 0)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !347, file: !305, line: 421)
!347 = !DISubprogram(name: "sin", scope: !302, file: !302, line: 64, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !349, file: !305, line: 440)
!349 = !DISubprogram(name: "sinh", scope: !302, file: !302, line: 73, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !351, file: !305, line: 459)
!351 = !DISubprogram(name: "sqrt", scope: !302, file: !302, line: 143, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !353, file: !305, line: 478)
!353 = !DISubprogram(name: "tan", scope: !302, file: !302, line: 66, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !355, file: !305, line: 497)
!355 = !DISubprogram(name: "tanh", scope: !302, file: !302, line: 75, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !357, file: !359, line: 127)
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !298, line: 62, baseType: !358)
!358 = !DICompositeType(tag: DW_TAG_structure_type, file: !298, line: 58, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!359 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdlib", directory: "")
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !361, file: !359, line: 128)
!361 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !298, line: 70, baseType: !362)
!362 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !298, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !363, identifier: "_ZTS6ldiv_t")
!363 = !{!364, !365}
!364 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !362, file: !298, line: 68, baseType: !208, size: 64)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !362, file: !298, line: 69, baseType: !208, size: 64, offset: 64)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !367, file: !359, line: 130)
!367 = !DISubprogram(name: "abort", scope: !298, file: !298, line: 591, type: !368, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!368 = !DISubroutineType(types: !369)
!369 = !{null}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !371, file: !359, line: 134)
!371 = !DISubprogram(name: "atexit", scope: !298, file: !298, line: 595, type: !372, flags: DIFlagPrototyped, spFlags: 0)
!372 = !DISubroutineType(types: !373)
!373 = !{!110, !374}
!374 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !368, size: 64)
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !376, file: !359, line: 140)
!376 = !DISubprogram(name: "atof", scope: !298, file: !298, line: 101, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !378, file: !359, line: 141)
!378 = !DISubprogram(name: "atoi", scope: !298, file: !298, line: 104, type: !379, flags: DIFlagPrototyped, spFlags: 0)
!379 = !DISubroutineType(types: !380)
!380 = !{!110, !251}
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !382, file: !359, line: 142)
!382 = !DISubprogram(name: "atol", scope: !298, file: !298, line: 107, type: !383, flags: DIFlagPrototyped, spFlags: 0)
!383 = !DISubroutineType(types: !384)
!384 = !{!208, !251}
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !386, file: !359, line: 143)
!386 = !DISubprogram(name: "bsearch", scope: !298, file: !298, line: 820, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!387 = !DISubroutineType(types: !388)
!388 = !{!101, !389, !389, !391, !391, !394}
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !390, size: 64)
!390 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !392, line: 46, baseType: !393)
!392 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/stddef.h", directory: "/u/NAS_SCRATCH/yc0769")
!393 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!394 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !298, line: 808, baseType: !395)
!395 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !396, size: 64)
!396 = !DISubroutineType(types: !397)
!397 = !{!110, !389, !389}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !399, file: !359, line: 144)
!399 = !DISubprogram(name: "calloc", scope: !298, file: !298, line: 542, type: !400, flags: DIFlagPrototyped, spFlags: 0)
!400 = !DISubroutineType(types: !401)
!401 = !{!101, !391, !391}
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !403, file: !359, line: 145)
!403 = !DISubprogram(name: "div", scope: !298, file: !298, line: 852, type: !404, flags: DIFlagPrototyped, spFlags: 0)
!404 = !DISubroutineType(types: !405)
!405 = !{!357, !110, !110}
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !407, file: !359, line: 146)
!407 = !DISubprogram(name: "exit", scope: !298, file: !298, line: 617, type: !408, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!408 = !DISubroutineType(types: !409)
!409 = !{null, !110}
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !411, file: !359, line: 147)
!411 = !DISubprogram(name: "free", scope: !298, file: !298, line: 565, type: !412, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DISubroutineType(types: !413)
!413 = !{null, !101}
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !415, file: !359, line: 148)
!415 = !DISubprogram(name: "getenv", scope: !298, file: !298, line: 634, type: !416, flags: DIFlagPrototyped, spFlags: 0)
!416 = !DISubroutineType(types: !417)
!417 = !{!418, !251}
!418 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !253, size: 64)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !420, file: !359, line: 149)
!420 = !DISubprogram(name: "labs", scope: !298, file: !298, line: 841, type: !206, flags: DIFlagPrototyped, spFlags: 0)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !422, file: !359, line: 150)
!422 = !DISubprogram(name: "ldiv", scope: !298, file: !298, line: 854, type: !423, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DISubroutineType(types: !424)
!424 = !{!361, !208, !208}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !426, file: !359, line: 151)
!426 = !DISubprogram(name: "malloc", scope: !298, file: !298, line: 539, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!427 = !DISubroutineType(types: !428)
!428 = !{!101, !391}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !430, file: !359, line: 153)
!430 = !DISubprogram(name: "mblen", scope: !298, file: !298, line: 922, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!431 = !DISubroutineType(types: !432)
!432 = !{!110, !251, !391}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !434, file: !359, line: 154)
!434 = !DISubprogram(name: "mbstowcs", scope: !298, file: !298, line: 933, type: !435, flags: DIFlagPrototyped, spFlags: 0)
!435 = !DISubroutineType(types: !436)
!436 = !{!391, !437, !440, !391}
!437 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !438)
!438 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !439, size: 64)
!439 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!440 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !251)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !442, file: !359, line: 155)
!442 = !DISubprogram(name: "mbtowc", scope: !298, file: !298, line: 925, type: !443, flags: DIFlagPrototyped, spFlags: 0)
!443 = !DISubroutineType(types: !444)
!444 = !{!110, !437, !440, !391}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !446, file: !359, line: 157)
!446 = !DISubprogram(name: "qsort", scope: !298, file: !298, line: 830, type: !447, flags: DIFlagPrototyped, spFlags: 0)
!447 = !DISubroutineType(types: !448)
!448 = !{null, !101, !391, !391, !394}
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !450, file: !359, line: 163)
!450 = !DISubprogram(name: "rand", scope: !298, file: !298, line: 453, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!451 = !DISubroutineType(types: !452)
!452 = !{!110}
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !454, file: !359, line: 164)
!454 = !DISubprogram(name: "realloc", scope: !298, file: !298, line: 550, type: !455, flags: DIFlagPrototyped, spFlags: 0)
!455 = !DISubroutineType(types: !456)
!456 = !{!101, !101, !391}
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !458, file: !359, line: 165)
!458 = !DISubprogram(name: "srand", scope: !298, file: !298, line: 455, type: !459, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DISubroutineType(types: !460)
!460 = !{null, !9}
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !462, file: !359, line: 166)
!462 = !DISubprogram(name: "strtod", scope: !298, file: !298, line: 117, type: !463, flags: DIFlagPrototyped, spFlags: 0)
!463 = !DISubroutineType(types: !464)
!464 = !{!100, !440, !465}
!465 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !466)
!466 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !418, size: 64)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !468, file: !359, line: 167)
!468 = !DISubprogram(name: "strtol", scope: !298, file: !298, line: 176, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!469 = !DISubroutineType(types: !470)
!470 = !{!208, !440, !465, !110}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !472, file: !359, line: 168)
!472 = !DISubprogram(name: "strtoul", scope: !298, file: !298, line: 180, type: !473, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DISubroutineType(types: !474)
!474 = !{!393, !440, !465, !110}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !476, file: !359, line: 169)
!476 = !DISubprogram(name: "system", scope: !298, file: !298, line: 784, type: !379, flags: DIFlagPrototyped, spFlags: 0)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !478, file: !359, line: 171)
!478 = !DISubprogram(name: "wcstombs", scope: !298, file: !298, line: 936, type: !479, flags: DIFlagPrototyped, spFlags: 0)
!479 = !DISubroutineType(types: !480)
!480 = !{!391, !481, !482, !391}
!481 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !418)
!482 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !483)
!483 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !484, size: 64)
!484 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !439)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !486, file: !359, line: 172)
!486 = !DISubprogram(name: "wctomb", scope: !298, file: !298, line: 929, type: !487, flags: DIFlagPrototyped, spFlags: 0)
!487 = !DISubroutineType(types: !488)
!488 = !{!110, !418, !439}
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !491, file: !359, line: 200)
!490 = !DINamespace(name: "__gnu_cxx", scope: null)
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !298, line: 80, baseType: !492)
!492 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !298, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !493, identifier: "_ZTS7lldiv_t")
!493 = !{!494, !495}
!494 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !492, file: !298, line: 78, baseType: !219, size: 64)
!495 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !492, file: !298, line: 79, baseType: !219, size: 64, offset: 64)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !497, file: !359, line: 206)
!497 = !DISubprogram(name: "_Exit", scope: !298, file: !298, line: 629, type: !408, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !499, file: !359, line: 210)
!499 = !DISubprogram(name: "llabs", scope: !298, file: !298, line: 844, type: !217, flags: DIFlagPrototyped, spFlags: 0)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !501, file: !359, line: 216)
!501 = !DISubprogram(name: "lldiv", scope: !298, file: !298, line: 858, type: !502, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DISubroutineType(types: !503)
!503 = !{!491, !219, !219}
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !505, file: !359, line: 227)
!505 = !DISubprogram(name: "atoll", scope: !298, file: !298, line: 112, type: !506, flags: DIFlagPrototyped, spFlags: 0)
!506 = !DISubroutineType(types: !507)
!507 = !{!219, !251}
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !509, file: !359, line: 228)
!509 = !DISubprogram(name: "strtoll", scope: !298, file: !298, line: 200, type: !510, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DISubroutineType(types: !511)
!511 = !{!219, !440, !465, !110}
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !513, file: !359, line: 229)
!513 = !DISubprogram(name: "strtoull", scope: !298, file: !298, line: 205, type: !514, flags: DIFlagPrototyped, spFlags: 0)
!514 = !DISubroutineType(types: !515)
!515 = !{!516, !440, !465, !110}
!516 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !518, file: !359, line: 231)
!518 = !DISubprogram(name: "strtof", scope: !298, file: !298, line: 123, type: !519, flags: DIFlagPrototyped, spFlags: 0)
!519 = !DISubroutineType(types: !520)
!520 = !{!115, !440, !465}
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !522, file: !359, line: 232)
!522 = !DISubprogram(name: "strtold", scope: !298, file: !298, line: 126, type: !523, flags: DIFlagPrototyped, spFlags: 0)
!523 = !DISubroutineType(types: !524)
!524 = !{!525, !440, !465}
!525 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !491, file: !359, line: 240)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !497, file: !359, line: 242)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !499, file: !359, line: 244)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !530, file: !359, line: 245)
!530 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !490, file: !359, line: 213, type: !502, flags: DIFlagPrototyped, spFlags: 0)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !501, file: !359, line: 246)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !505, file: !359, line: 248)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !518, file: !359, line: 249)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !509, file: !359, line: 250)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !513, file: !359, line: 251)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !522, file: !359, line: 252)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !367, file: !538, line: 38)
!538 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/stdlib.h", directory: "")
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !371, file: !538, line: 39)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !407, file: !538, line: 40)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !357, file: !538, line: 51)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !361, file: !538, line: 52)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !544, file: !538, line: 54)
!544 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !105, file: !299, line: 79, type: !545, flags: DIFlagPrototyped, spFlags: 0)
!545 = !DISubroutineType(types: !546)
!546 = !{!525, !525}
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !376, file: !538, line: 55)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !378, file: !538, line: 56)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !382, file: !538, line: 57)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !386, file: !538, line: 58)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !399, file: !538, line: 59)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !530, file: !538, line: 60)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !411, file: !538, line: 61)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !415, file: !538, line: 62)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !420, file: !538, line: 63)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !422, file: !538, line: 64)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !426, file: !538, line: 65)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !430, file: !538, line: 67)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !434, file: !538, line: 68)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !442, file: !538, line: 69)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !446, file: !538, line: 71)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !450, file: !538, line: 72)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !454, file: !538, line: 73)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !458, file: !538, line: 74)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !462, file: !538, line: 75)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !468, file: !538, line: 76)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !472, file: !538, line: 77)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !476, file: !538, line: 78)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !478, file: !538, line: 80)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !486, file: !538, line: 81)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !572, file: !574, line: 414)
!572 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !573, file: !573, line: 1126, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!573 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "")
!574 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/__clang_cuda_cmath.h", directory: "/u/NAS_SCRATCH/yc0769")
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !576, file: !574, line: 415)
!576 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !573, file: !573, line: 1154, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !578, file: !574, line: 416)
!578 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !573, file: !573, line: 1121, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !580, file: !574, line: 417)
!580 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !573, file: !573, line: 1159, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !582, file: !574, line: 418)
!582 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !573, file: !573, line: 1111, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !584, file: !574, line: 419)
!584 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !573, file: !573, line: 1116, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !586, file: !574, line: 420)
!586 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !573, file: !573, line: 1164, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !588, file: !574, line: 421)
!588 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !573, file: !573, line: 1199, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !590, file: !574, line: 422)
!590 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !591, file: !591, line: 647, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!591 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "")
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !593, file: !574, line: 423)
!593 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !573, file: !573, line: 973, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !595, file: !574, line: 424)
!595 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !573, file: !573, line: 1027, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !597, file: !574, line: 425)
!597 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !573, file: !573, line: 1096, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !599, file: !574, line: 426)
!599 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !573, file: !573, line: 1259, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !601, file: !574, line: 427)
!601 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !573, file: !573, line: 1249, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !603, file: !574, line: 428)
!603 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !591, file: !591, line: 637, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !605, file: !574, line: 429)
!605 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !573, file: !573, line: 1078, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !607, file: !574, line: 430)
!607 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !573, file: !573, line: 1169, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !609, file: !574, line: 431)
!609 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !591, file: !591, line: 582, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !611, file: !574, line: 432)
!611 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !573, file: !573, line: 1385, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !613, file: !574, line: 433)
!613 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !591, file: !591, line: 572, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !615, file: !574, line: 434)
!615 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !573, file: !573, line: 1337, type: !158, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !617, file: !574, line: 435)
!617 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !591, file: !591, line: 602, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !619, file: !574, line: 436)
!619 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !591, file: !591, line: 597, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !621, file: !574, line: 437)
!621 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !573, file: !573, line: 1322, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !623, file: !574, line: 438)
!623 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !573, file: !573, line: 1312, type: !172, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !625, file: !574, line: 439)
!625 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !573, file: !573, line: 1174, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !627, file: !574, line: 440)
!627 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !573, file: !573, line: 1390, type: !168, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !629, file: !574, line: 441)
!629 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !573, file: !573, line: 1289, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !631, file: !574, line: 442)
!631 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !573, file: !573, line: 1284, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !633, file: !574, line: 443)
!633 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !573, file: !573, line: 933, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !635, file: !574, line: 444)
!635 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !573, file: !573, line: 1371, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !637, file: !574, line: 445)
!637 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !573, file: !573, line: 1140, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !639, file: !574, line: 446)
!639 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !573, file: !573, line: 1149, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !641, file: !574, line: 447)
!641 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !573, file: !573, line: 1069, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !643, file: !574, line: 448)
!643 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !573, file: !573, line: 1395, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !645, file: !574, line: 449)
!645 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !573, file: !573, line: 1131, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !647, file: !574, line: 450)
!647 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !573, file: !573, line: 924, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !649, file: !574, line: 451)
!649 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !573, file: !573, line: 1376, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !651, file: !574, line: 452)
!651 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !573, file: !573, line: 1317, type: !244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !653, file: !574, line: 453)
!653 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !573, file: !573, line: 938, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !655, file: !574, line: 454)
!655 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !573, file: !573, line: 1002, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !657, file: !574, line: 455)
!657 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !573, file: !573, line: 1352, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !659, file: !574, line: 456)
!659 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !573, file: !573, line: 1327, type: !126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !661, file: !574, line: 457)
!661 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !573, file: !573, line: 1332, type: !268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !663, file: !574, line: 458)
!663 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !573, file: !573, line: 919, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !665, file: !574, line: 459)
!665 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !573, file: !573, line: 1366, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !667, file: !574, line: 462)
!667 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !573, file: !573, line: 1299, type: !276, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !669, file: !574, line: 464)
!669 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !573, file: !573, line: 1294, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !671, file: !574, line: 465)
!671 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !573, file: !573, line: 1018, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !673, file: !574, line: 466)
!673 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !573, file: !573, line: 1101, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !675, file: !574, line: 467)
!675 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !591, file: !591, line: 887, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !677, file: !574, line: 468)
!677 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !573, file: !573, line: 1060, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !679, file: !574, line: 469)
!679 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !573, file: !573, line: 1106, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !681, file: !574, line: 470)
!681 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !573, file: !573, line: 1361, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !683, file: !574, line: 471)
!683 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !591, file: !591, line: 642, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !544, file: !685, line: 38)
!685 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/math.h", directory: "")
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !687, file: !685, line: 54)
!687 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !105, file: !305, line: 380, type: !688, flags: DIFlagPrototyped, spFlags: 0)
!688 = !DISubroutineType(types: !689)
!689 = !{!525, !525, !690}
!690 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !525, size: 64)
!691 = !{!"clang version 9.0.0 (git@github.com:SusanTan/llvm-project.git a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)"}
!692 = distinct !DISubprogram(name: "kernel_A", linkageName: "_Z8kernel_AiddPdS_S_S_S_S_S_S_S_", scope: !5, file: !5, line: 21, type: !693, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !110, !100, !100, !99, !99, !99, !99, !99, !99, !99, !99, !99}
!695 = !{}
!696 = !DILocalVariable(name: "n", arg: 1, scope: !692, file: !5, line: 21, type: !110)
!697 = !DILocation(line: 21, column: 30, scope: !692)
!698 = !DILocalVariable(name: "alpha", arg: 2, scope: !692, file: !5, line: 21, type: !100)
!699 = !DILocation(line: 21, column: 40, scope: !692)
!700 = !DILocalVariable(name: "beta", arg: 3, scope: !692, file: !5, line: 21, type: !100)
!701 = !DILocation(line: 21, column: 54, scope: !692)
!702 = !DILocalVariable(name: "A", arg: 4, scope: !692, file: !5, line: 22, type: !99)
!703 = !DILocation(line: 22, column: 34, scope: !692)
!704 = !DILocalVariable(name: "u1", arg: 5, scope: !692, file: !5, line: 22, type: !99)
!705 = !DILocation(line: 22, column: 45, scope: !692)
!706 = !DILocalVariable(name: "v1", arg: 6, scope: !692, file: !5, line: 22, type: !99)
!707 = !DILocation(line: 22, column: 57, scope: !692)
!708 = !DILocalVariable(name: "u2", arg: 7, scope: !692, file: !5, line: 22, type: !99)
!709 = !DILocation(line: 22, column: 69, scope: !692)
!710 = !DILocalVariable(name: "v2", arg: 8, scope: !692, file: !5, line: 22, type: !99)
!711 = !DILocation(line: 22, column: 81, scope: !692)
!712 = !DILocalVariable(name: "w", arg: 9, scope: !692, file: !5, line: 22, type: !99)
!713 = !DILocation(line: 22, column: 93, scope: !692)
!714 = !DILocalVariable(name: "x", arg: 10, scope: !692, file: !5, line: 22, type: !99)
!715 = !DILocation(line: 22, column: 104, scope: !692)
!716 = !DILocalVariable(name: "y", arg: 11, scope: !692, file: !5, line: 22, type: !99)
!717 = !DILocation(line: 22, column: 115, scope: !692)
!718 = !DILocalVariable(name: "z", arg: 12, scope: !692, file: !5, line: 22, type: !99)
!719 = !DILocation(line: 22, column: 126, scope: !692)
!720 = !DILocation(line: 22, column: 129, scope: !692)
!721 = !DILocation(line: 28, column: 1, scope: !692)
!722 = distinct !DISubprogram(name: "kernel_x", linkageName: "_Z8kernel_xiddPdS_S_S_S_S_S_S_S_", scope: !5, file: !5, line: 31, type: !693, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!723 = !DILocalVariable(name: "n", arg: 1, scope: !722, file: !5, line: 31, type: !110)
!724 = !DILocation(line: 31, column: 30, scope: !722)
!725 = !DILocalVariable(name: "alpha", arg: 2, scope: !722, file: !5, line: 31, type: !100)
!726 = !DILocation(line: 31, column: 40, scope: !722)
!727 = !DILocalVariable(name: "beta", arg: 3, scope: !722, file: !5, line: 31, type: !100)
!728 = !DILocation(line: 31, column: 54, scope: !722)
!729 = !DILocalVariable(name: "A", arg: 4, scope: !722, file: !5, line: 32, type: !99)
!730 = !DILocation(line: 32, column: 34, scope: !722)
!731 = !DILocalVariable(name: "u1", arg: 5, scope: !722, file: !5, line: 32, type: !99)
!732 = !DILocation(line: 32, column: 45, scope: !722)
!733 = !DILocalVariable(name: "v1", arg: 6, scope: !722, file: !5, line: 32, type: !99)
!734 = !DILocation(line: 32, column: 57, scope: !722)
!735 = !DILocalVariable(name: "u2", arg: 7, scope: !722, file: !5, line: 32, type: !99)
!736 = !DILocation(line: 32, column: 69, scope: !722)
!737 = !DILocalVariable(name: "v2", arg: 8, scope: !722, file: !5, line: 32, type: !99)
!738 = !DILocation(line: 32, column: 81, scope: !722)
!739 = !DILocalVariable(name: "w", arg: 9, scope: !722, file: !5, line: 32, type: !99)
!740 = !DILocation(line: 32, column: 93, scope: !722)
!741 = !DILocalVariable(name: "x", arg: 10, scope: !722, file: !5, line: 32, type: !99)
!742 = !DILocation(line: 32, column: 104, scope: !722)
!743 = !DILocalVariable(name: "y", arg: 11, scope: !722, file: !5, line: 32, type: !99)
!744 = !DILocation(line: 32, column: 115, scope: !722)
!745 = !DILocalVariable(name: "z", arg: 12, scope: !722, file: !5, line: 32, type: !99)
!746 = !DILocation(line: 32, column: 126, scope: !722)
!747 = !DILocation(line: 32, column: 129, scope: !722)
!748 = !DILocation(line: 40, column: 1, scope: !722)
!749 = distinct !DISubprogram(name: "kernel_y", linkageName: "_Z8kernel_yiddPdS_S_S_S_S_S_S_S_", scope: !5, file: !5, line: 43, type: !693, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!750 = !DILocalVariable(name: "n", arg: 1, scope: !749, file: !5, line: 43, type: !110)
!751 = !DILocation(line: 43, column: 30, scope: !749)
!752 = !DILocalVariable(name: "alpha", arg: 2, scope: !749, file: !5, line: 43, type: !100)
!753 = !DILocation(line: 43, column: 40, scope: !749)
!754 = !DILocalVariable(name: "beta", arg: 3, scope: !749, file: !5, line: 43, type: !100)
!755 = !DILocation(line: 43, column: 54, scope: !749)
!756 = !DILocalVariable(name: "A", arg: 4, scope: !749, file: !5, line: 44, type: !99)
!757 = !DILocation(line: 44, column: 34, scope: !749)
!758 = !DILocalVariable(name: "u1", arg: 5, scope: !749, file: !5, line: 44, type: !99)
!759 = !DILocation(line: 44, column: 45, scope: !749)
!760 = !DILocalVariable(name: "v1", arg: 6, scope: !749, file: !5, line: 44, type: !99)
!761 = !DILocation(line: 44, column: 57, scope: !749)
!762 = !DILocalVariable(name: "u2", arg: 7, scope: !749, file: !5, line: 44, type: !99)
!763 = !DILocation(line: 44, column: 69, scope: !749)
!764 = !DILocalVariable(name: "v2", arg: 8, scope: !749, file: !5, line: 44, type: !99)
!765 = !DILocation(line: 44, column: 81, scope: !749)
!766 = !DILocalVariable(name: "w", arg: 9, scope: !749, file: !5, line: 44, type: !99)
!767 = !DILocation(line: 44, column: 93, scope: !749)
!768 = !DILocalVariable(name: "x", arg: 10, scope: !749, file: !5, line: 44, type: !99)
!769 = !DILocation(line: 44, column: 104, scope: !749)
!770 = !DILocalVariable(name: "y", arg: 11, scope: !749, file: !5, line: 44, type: !99)
!771 = !DILocation(line: 44, column: 115, scope: !749)
!772 = !DILocalVariable(name: "z", arg: 12, scope: !749, file: !5, line: 44, type: !99)
!773 = !DILocation(line: 44, column: 126, scope: !749)
!774 = !DILocation(line: 44, column: 129, scope: !749)
!775 = !DILocation(line: 50, column: 1, scope: !749)
!776 = distinct !DISubprogram(name: "kernel_w", linkageName: "_Z8kernel_widdPdS_S_S_S_S_S_S_S_", scope: !5, file: !5, line: 52, type: !693, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!777 = !DILocalVariable(name: "n", arg: 1, scope: !776, file: !5, line: 52, type: !110)
!778 = !DILocation(line: 52, column: 30, scope: !776)
!779 = !DILocalVariable(name: "alpha", arg: 2, scope: !776, file: !5, line: 52, type: !100)
!780 = !DILocation(line: 52, column: 40, scope: !776)
!781 = !DILocalVariable(name: "beta", arg: 3, scope: !776, file: !5, line: 52, type: !100)
!782 = !DILocation(line: 52, column: 54, scope: !776)
!783 = !DILocalVariable(name: "A", arg: 4, scope: !776, file: !5, line: 53, type: !99)
!784 = !DILocation(line: 53, column: 34, scope: !776)
!785 = !DILocalVariable(name: "u1", arg: 5, scope: !776, file: !5, line: 53, type: !99)
!786 = !DILocation(line: 53, column: 45, scope: !776)
!787 = !DILocalVariable(name: "v1", arg: 6, scope: !776, file: !5, line: 53, type: !99)
!788 = !DILocation(line: 53, column: 57, scope: !776)
!789 = !DILocalVariable(name: "u2", arg: 7, scope: !776, file: !5, line: 53, type: !99)
!790 = !DILocation(line: 53, column: 69, scope: !776)
!791 = !DILocalVariable(name: "v2", arg: 8, scope: !776, file: !5, line: 53, type: !99)
!792 = !DILocation(line: 53, column: 81, scope: !776)
!793 = !DILocalVariable(name: "w", arg: 9, scope: !776, file: !5, line: 53, type: !99)
!794 = !DILocation(line: 53, column: 93, scope: !776)
!795 = !DILocalVariable(name: "x", arg: 10, scope: !776, file: !5, line: 53, type: !99)
!796 = !DILocation(line: 53, column: 104, scope: !776)
!797 = !DILocalVariable(name: "y", arg: 11, scope: !776, file: !5, line: 53, type: !99)
!798 = !DILocation(line: 53, column: 115, scope: !776)
!799 = !DILocalVariable(name: "z", arg: 12, scope: !776, file: !5, line: 53, type: !99)
!800 = !DILocation(line: 53, column: 126, scope: !776)
!801 = !DILocation(line: 53, column: 129, scope: !776)
!802 = !DILocation(line: 61, column: 1, scope: !776)
!803 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 169, type: !804, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!804 = !DISubroutineType(types: !805)
!805 = !{!110, !110, !466}
!806 = !DILocalVariable(name: "argc", arg: 1, scope: !803, file: !5, line: 169, type: !110)
!807 = !DILocation(line: 169, column: 14, scope: !803)
!808 = !DILocalVariable(name: "argv", arg: 2, scope: !803, file: !5, line: 169, type: !466)
!809 = !DILocation(line: 169, column: 27, scope: !803)
!810 = !DILocalVariable(name: "n", scope: !803, file: !5, line: 172, type: !110)
!811 = !DILocation(line: 172, column: 7, scope: !803)
!812 = !DILocation(line: 172, column: 16, scope: !803)
!813 = !DILocation(line: 172, column: 11, scope: !803)
!814 = !DILocalVariable(name: "dump_code", scope: !803, file: !5, line: 173, type: !110)
!815 = !DILocation(line: 173, column: 7, scope: !803)
!816 = !DILocation(line: 173, column: 24, scope: !803)
!817 = !DILocation(line: 173, column: 19, scope: !803)
!818 = !DILocalVariable(name: "alpha", scope: !803, file: !5, line: 176, type: !99)
!819 = !DILocation(line: 176, column: 11, scope: !803)
!820 = !DILocation(line: 176, column: 28, scope: !803)
!821 = !DILocation(line: 176, column: 19, scope: !803)
!822 = !DILocalVariable(name: "beta", scope: !803, file: !5, line: 177, type: !99)
!823 = !DILocation(line: 177, column: 11, scope: !803)
!824 = !DILocation(line: 177, column: 27, scope: !803)
!825 = !DILocation(line: 177, column: 18, scope: !803)
!826 = !DILocalVariable(name: "A", scope: !803, file: !5, line: 178, type: !99)
!827 = !DILocation(line: 178, column: 11, scope: !803)
!828 = !DILocation(line: 178, column: 31, scope: !803)
!829 = !DILocation(line: 178, column: 33, scope: !803)
!830 = !DILocation(line: 178, column: 32, scope: !803)
!831 = !DILocation(line: 178, column: 34, scope: !803)
!832 = !DILocation(line: 178, column: 24, scope: !803)
!833 = !DILocation(line: 178, column: 15, scope: !803)
!834 = !DILocalVariable(name: "u1", scope: !803, file: !5, line: 179, type: !99)
!835 = !DILocation(line: 179, column: 11, scope: !803)
!836 = !DILocation(line: 179, column: 32, scope: !803)
!837 = !DILocation(line: 179, column: 33, scope: !803)
!838 = !DILocation(line: 179, column: 25, scope: !803)
!839 = !DILocation(line: 179, column: 16, scope: !803)
!840 = !DILocalVariable(name: "v1", scope: !803, file: !5, line: 180, type: !99)
!841 = !DILocation(line: 180, column: 11, scope: !803)
!842 = !DILocation(line: 180, column: 32, scope: !803)
!843 = !DILocation(line: 180, column: 33, scope: !803)
!844 = !DILocation(line: 180, column: 25, scope: !803)
!845 = !DILocation(line: 180, column: 16, scope: !803)
!846 = !DILocalVariable(name: "u2", scope: !803, file: !5, line: 181, type: !99)
!847 = !DILocation(line: 181, column: 11, scope: !803)
!848 = !DILocation(line: 181, column: 32, scope: !803)
!849 = !DILocation(line: 181, column: 33, scope: !803)
!850 = !DILocation(line: 181, column: 25, scope: !803)
!851 = !DILocation(line: 181, column: 16, scope: !803)
!852 = !DILocalVariable(name: "v2", scope: !803, file: !5, line: 182, type: !99)
!853 = !DILocation(line: 182, column: 11, scope: !803)
!854 = !DILocation(line: 182, column: 32, scope: !803)
!855 = !DILocation(line: 182, column: 33, scope: !803)
!856 = !DILocation(line: 182, column: 25, scope: !803)
!857 = !DILocation(line: 182, column: 16, scope: !803)
!858 = !DILocalVariable(name: "w", scope: !803, file: !5, line: 183, type: !99)
!859 = !DILocation(line: 183, column: 11, scope: !803)
!860 = !DILocation(line: 183, column: 31, scope: !803)
!861 = !DILocation(line: 183, column: 32, scope: !803)
!862 = !DILocation(line: 183, column: 24, scope: !803)
!863 = !DILocation(line: 183, column: 15, scope: !803)
!864 = !DILocalVariable(name: "x", scope: !803, file: !5, line: 184, type: !99)
!865 = !DILocation(line: 184, column: 11, scope: !803)
!866 = !DILocation(line: 184, column: 31, scope: !803)
!867 = !DILocation(line: 184, column: 32, scope: !803)
!868 = !DILocation(line: 184, column: 24, scope: !803)
!869 = !DILocation(line: 184, column: 15, scope: !803)
!870 = !DILocalVariable(name: "y", scope: !803, file: !5, line: 185, type: !99)
!871 = !DILocation(line: 185, column: 11, scope: !803)
!872 = !DILocation(line: 185, column: 31, scope: !803)
!873 = !DILocation(line: 185, column: 32, scope: !803)
!874 = !DILocation(line: 185, column: 24, scope: !803)
!875 = !DILocation(line: 185, column: 15, scope: !803)
!876 = !DILocalVariable(name: "z", scope: !803, file: !5, line: 186, type: !99)
!877 = !DILocation(line: 186, column: 11, scope: !803)
!878 = !DILocation(line: 186, column: 31, scope: !803)
!879 = !DILocation(line: 186, column: 32, scope: !803)
!880 = !DILocation(line: 186, column: 24, scope: !803)
!881 = !DILocation(line: 186, column: 15, scope: !803)
!882 = !DILocation(line: 191, column: 15, scope: !803)
!883 = !DILocation(line: 191, column: 18, scope: !803)
!884 = !DILocation(line: 191, column: 25, scope: !803)
!885 = !DILocation(line: 192, column: 8, scope: !803)
!886 = !DILocation(line: 193, column: 8, scope: !803)
!887 = !DILocation(line: 194, column: 8, scope: !803)
!888 = !DILocation(line: 195, column: 8, scope: !803)
!889 = !DILocation(line: 196, column: 8, scope: !803)
!890 = !DILocation(line: 197, column: 8, scope: !803)
!891 = !DILocation(line: 198, column: 8, scope: !803)
!892 = !DILocation(line: 199, column: 8, scope: !803)
!893 = !DILocation(line: 200, column: 8, scope: !803)
!894 = !DILocation(line: 191, column: 3, scope: !803)
!895 = !DILocation(line: 205, column: 10, scope: !803)
!896 = !DILocation(line: 205, column: 13, scope: !803)
!897 = !DILocation(line: 205, column: 20, scope: !803)
!898 = !DILocation(line: 205, column: 26, scope: !803)
!899 = !DILocation(line: 205, column: 29, scope: !803)
!900 = !DILocation(line: 205, column: 33, scope: !803)
!901 = !DILocation(line: 205, column: 37, scope: !803)
!902 = !DILocation(line: 205, column: 41, scope: !803)
!903 = !DILocation(line: 205, column: 45, scope: !803)
!904 = !DILocation(line: 205, column: 48, scope: !803)
!905 = !DILocation(line: 205, column: 51, scope: !803)
!906 = !DILocation(line: 205, column: 54, scope: !803)
!907 = !DILocation(line: 205, column: 3, scope: !803)
!908 = !DILocation(line: 209, column: 6, scope: !909)
!909 = distinct !DILexicalBlock(scope: !803, file: !5, line: 209, column: 6)
!910 = !DILocation(line: 209, column: 16, scope: !909)
!911 = !DILocation(line: 209, column: 6, scope: !803)
!912 = !DILocation(line: 209, column: 34, scope: !909)
!913 = !DILocation(line: 209, column: 37, scope: !909)
!914 = !DILocation(line: 209, column: 22, scope: !909)
!915 = !DILocation(line: 212, column: 15, scope: !803)
!916 = !DILocation(line: 212, column: 3, scope: !803)
!917 = !DILocation(line: 213, column: 15, scope: !803)
!918 = !DILocation(line: 213, column: 3, scope: !803)
!919 = !DILocation(line: 214, column: 15, scope: !803)
!920 = !DILocation(line: 214, column: 3, scope: !803)
!921 = !DILocation(line: 215, column: 15, scope: !803)
!922 = !DILocation(line: 215, column: 3, scope: !803)
!923 = !DILocation(line: 216, column: 15, scope: !803)
!924 = !DILocation(line: 216, column: 3, scope: !803)
!925 = !DILocation(line: 217, column: 15, scope: !803)
!926 = !DILocation(line: 217, column: 3, scope: !803)
!927 = !DILocation(line: 218, column: 15, scope: !803)
!928 = !DILocation(line: 218, column: 3, scope: !803)
!929 = !DILocation(line: 219, column: 15, scope: !803)
!930 = !DILocation(line: 219, column: 3, scope: !803)
!931 = !DILocation(line: 220, column: 15, scope: !803)
!932 = !DILocation(line: 220, column: 3, scope: !803)
!933 = !DILocation(line: 222, column: 3, scope: !803)
!934 = distinct !DISubprogram(name: "init_array", linkageName: "_ZL10init_arrayiPdS_S_S_S_S_S_S_S_S_S_", scope: !5, file: !5, line: 120, type: !935, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!935 = !DISubroutineType(types: !936)
!936 = !{null, !110, !99, !99, !99, !99, !99, !99, !99, !99, !99, !99, !99}
!937 = !DILocalVariable(name: "n", arg: 1, scope: !934, file: !5, line: 120, type: !110)
!938 = !DILocation(line: 120, column: 22, scope: !934)
!939 = !DILocalVariable(name: "alpha", arg: 2, scope: !934, file: !5, line: 121, type: !99)
!940 = !DILocation(line: 121, column: 12, scope: !934)
!941 = !DILocalVariable(name: "beta", arg: 3, scope: !934, file: !5, line: 122, type: !99)
!942 = !DILocation(line: 122, column: 12, scope: !934)
!943 = !DILocalVariable(name: "A", arg: 4, scope: !934, file: !5, line: 123, type: !99)
!944 = !DILocation(line: 123, column: 12, scope: !934)
!945 = !DILocalVariable(name: "u1", arg: 5, scope: !934, file: !5, line: 124, type: !99)
!946 = !DILocation(line: 124, column: 12, scope: !934)
!947 = !DILocalVariable(name: "v1", arg: 6, scope: !934, file: !5, line: 125, type: !99)
!948 = !DILocation(line: 125, column: 12, scope: !934)
!949 = !DILocalVariable(name: "u2", arg: 7, scope: !934, file: !5, line: 126, type: !99)
!950 = !DILocation(line: 126, column: 12, scope: !934)
!951 = !DILocalVariable(name: "v2", arg: 8, scope: !934, file: !5, line: 127, type: !99)
!952 = !DILocation(line: 127, column: 12, scope: !934)
!953 = !DILocalVariable(name: "w", arg: 9, scope: !934, file: !5, line: 128, type: !99)
!954 = !DILocation(line: 128, column: 12, scope: !934)
!955 = !DILocalVariable(name: "x", arg: 10, scope: !934, file: !5, line: 129, type: !99)
!956 = !DILocation(line: 129, column: 12, scope: !934)
!957 = !DILocalVariable(name: "y", arg: 11, scope: !934, file: !5, line: 130, type: !99)
!958 = !DILocation(line: 130, column: 12, scope: !934)
!959 = !DILocalVariable(name: "z", arg: 12, scope: !934, file: !5, line: 131, type: !99)
!960 = !DILocation(line: 131, column: 12, scope: !934)
!961 = !DILocalVariable(name: "i", scope: !934, file: !5, line: 133, type: !110)
!962 = !DILocation(line: 133, column: 7, scope: !934)
!963 = !DILocalVariable(name: "j", scope: !934, file: !5, line: 133, type: !110)
!964 = !DILocation(line: 133, column: 10, scope: !934)
!965 = !DILocation(line: 135, column: 4, scope: !934)
!966 = !DILocation(line: 135, column: 10, scope: !934)
!967 = !DILocation(line: 136, column: 4, scope: !934)
!968 = !DILocation(line: 136, column: 9, scope: !934)
!969 = !DILocation(line: 138, column: 10, scope: !970)
!970 = distinct !DILexicalBlock(scope: !934, file: !5, line: 138, column: 3)
!971 = !DILocation(line: 138, column: 8, scope: !970)
!972 = !DILocation(line: 138, column: 15, scope: !973)
!973 = distinct !DILexicalBlock(scope: !970, file: !5, line: 138, column: 3)
!974 = !DILocation(line: 138, column: 19, scope: !973)
!975 = !DILocation(line: 138, column: 17, scope: !973)
!976 = !DILocation(line: 138, column: 3, scope: !970)
!977 = !DILocation(line: 140, column: 15, scope: !978)
!978 = distinct !DILexicalBlock(scope: !973, file: !5, line: 139, column: 5)
!979 = !DILocation(line: 140, column: 7, scope: !978)
!980 = !DILocation(line: 140, column: 10, scope: !978)
!981 = !DILocation(line: 140, column: 13, scope: !978)
!982 = !DILocation(line: 141, column: 16, scope: !978)
!983 = !DILocation(line: 141, column: 17, scope: !978)
!984 = !DILocation(line: 141, column: 21, scope: !978)
!985 = !DILocation(line: 141, column: 20, scope: !978)
!986 = !DILocation(line: 141, column: 15, scope: !978)
!987 = !DILocation(line: 141, column: 22, scope: !978)
!988 = !DILocation(line: 141, column: 7, scope: !978)
!989 = !DILocation(line: 141, column: 10, scope: !978)
!990 = !DILocation(line: 141, column: 13, scope: !978)
!991 = !DILocation(line: 142, column: 16, scope: !978)
!992 = !DILocation(line: 142, column: 17, scope: !978)
!993 = !DILocation(line: 142, column: 21, scope: !978)
!994 = !DILocation(line: 142, column: 20, scope: !978)
!995 = !DILocation(line: 142, column: 15, scope: !978)
!996 = !DILocation(line: 142, column: 22, scope: !978)
!997 = !DILocation(line: 142, column: 7, scope: !978)
!998 = !DILocation(line: 142, column: 10, scope: !978)
!999 = !DILocation(line: 142, column: 13, scope: !978)
!1000 = !DILocation(line: 143, column: 16, scope: !978)
!1001 = !DILocation(line: 143, column: 17, scope: !978)
!1002 = !DILocation(line: 143, column: 21, scope: !978)
!1003 = !DILocation(line: 143, column: 20, scope: !978)
!1004 = !DILocation(line: 143, column: 15, scope: !978)
!1005 = !DILocation(line: 143, column: 22, scope: !978)
!1006 = !DILocation(line: 143, column: 7, scope: !978)
!1007 = !DILocation(line: 143, column: 10, scope: !978)
!1008 = !DILocation(line: 143, column: 13, scope: !978)
!1009 = !DILocation(line: 144, column: 15, scope: !978)
!1010 = !DILocation(line: 144, column: 16, scope: !978)
!1011 = !DILocation(line: 144, column: 20, scope: !978)
!1012 = !DILocation(line: 144, column: 19, scope: !978)
!1013 = !DILocation(line: 144, column: 14, scope: !978)
!1014 = !DILocation(line: 144, column: 21, scope: !978)
!1015 = !DILocation(line: 144, column: 7, scope: !978)
!1016 = !DILocation(line: 144, column: 9, scope: !978)
!1017 = !DILocation(line: 144, column: 12, scope: !978)
!1018 = !DILocation(line: 145, column: 15, scope: !978)
!1019 = !DILocation(line: 145, column: 16, scope: !978)
!1020 = !DILocation(line: 145, column: 20, scope: !978)
!1021 = !DILocation(line: 145, column: 19, scope: !978)
!1022 = !DILocation(line: 145, column: 14, scope: !978)
!1023 = !DILocation(line: 145, column: 21, scope: !978)
!1024 = !DILocation(line: 145, column: 7, scope: !978)
!1025 = !DILocation(line: 145, column: 9, scope: !978)
!1026 = !DILocation(line: 145, column: 12, scope: !978)
!1027 = !DILocation(line: 146, column: 7, scope: !978)
!1028 = !DILocation(line: 146, column: 9, scope: !978)
!1029 = !DILocation(line: 146, column: 12, scope: !978)
!1030 = !DILocation(line: 147, column: 7, scope: !978)
!1031 = !DILocation(line: 147, column: 9, scope: !978)
!1032 = !DILocation(line: 147, column: 12, scope: !978)
!1033 = !DILocation(line: 148, column: 14, scope: !1034)
!1034 = distinct !DILexicalBlock(scope: !978, file: !5, line: 148, column: 7)
!1035 = !DILocation(line: 148, column: 12, scope: !1034)
!1036 = !DILocation(line: 148, column: 19, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1034, file: !5, line: 148, column: 7)
!1038 = !DILocation(line: 148, column: 23, scope: !1037)
!1039 = !DILocation(line: 148, column: 21, scope: !1037)
!1040 = !DILocation(line: 148, column: 7, scope: !1034)
!1041 = !DILocation(line: 149, column: 29, scope: !1037)
!1042 = !DILocation(line: 149, column: 31, scope: !1037)
!1043 = !DILocation(line: 149, column: 30, scope: !1037)
!1044 = !DILocation(line: 149, column: 36, scope: !1037)
!1045 = !DILocation(line: 149, column: 34, scope: !1037)
!1046 = !DILocation(line: 149, column: 8, scope: !1037)
!1047 = !DILocation(line: 149, column: 10, scope: !1037)
!1048 = !DILocation(line: 149, column: 12, scope: !1037)
!1049 = !DILocation(line: 149, column: 11, scope: !1037)
!1050 = !DILocation(line: 149, column: 14, scope: !1037)
!1051 = !DILocation(line: 149, column: 13, scope: !1037)
!1052 = !DILocation(line: 149, column: 17, scope: !1037)
!1053 = !DILocation(line: 148, column: 27, scope: !1037)
!1054 = !DILocation(line: 148, column: 7, scope: !1037)
!1055 = distinct !{!1055, !1040, !1056}
!1056 = !DILocation(line: 149, column: 36, scope: !1034)
!1057 = !DILocation(line: 150, column: 5, scope: !978)
!1058 = !DILocation(line: 138, column: 23, scope: !973)
!1059 = !DILocation(line: 138, column: 3, scope: !973)
!1060 = distinct !{!1060, !976, !1061}
!1061 = !DILocation(line: 150, column: 5, scope: !970)
!1062 = !DILocation(line: 151, column: 1, scope: !934)
!1063 = distinct !DISubprogram(name: "kernel", linkageName: "_ZL6kerneliPdS_S_S_S_S_S_S_S_S_S_", scope: !5, file: !5, line: 65, type: !935, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1064 = !DILocalVariable(name: "n", arg: 1, scope: !1063, file: !5, line: 65, type: !110)
!1065 = !DILocation(line: 65, column: 24, scope: !1063)
!1066 = !DILocalVariable(name: "alpha", arg: 2, scope: !1063, file: !5, line: 65, type: !99)
!1067 = !DILocation(line: 65, column: 35, scope: !1063)
!1068 = !DILocalVariable(name: "beta", arg: 3, scope: !1063, file: !5, line: 65, type: !99)
!1069 = !DILocation(line: 65, column: 50, scope: !1063)
!1070 = !DILocalVariable(name: "A", arg: 4, scope: !1063, file: !5, line: 66, type: !99)
!1071 = !DILocation(line: 66, column: 28, scope: !1063)
!1072 = !DILocalVariable(name: "u1", arg: 5, scope: !1063, file: !5, line: 66, type: !99)
!1073 = !DILocation(line: 66, column: 39, scope: !1063)
!1074 = !DILocalVariable(name: "v1", arg: 6, scope: !1063, file: !5, line: 66, type: !99)
!1075 = !DILocation(line: 66, column: 51, scope: !1063)
!1076 = !DILocalVariable(name: "u2", arg: 7, scope: !1063, file: !5, line: 66, type: !99)
!1077 = !DILocation(line: 66, column: 63, scope: !1063)
!1078 = !DILocalVariable(name: "v2", arg: 8, scope: !1063, file: !5, line: 66, type: !99)
!1079 = !DILocation(line: 66, column: 75, scope: !1063)
!1080 = !DILocalVariable(name: "w", arg: 9, scope: !1063, file: !5, line: 66, type: !99)
!1081 = !DILocation(line: 66, column: 87, scope: !1063)
!1082 = !DILocalVariable(name: "x", arg: 10, scope: !1063, file: !5, line: 66, type: !99)
!1083 = !DILocation(line: 66, column: 98, scope: !1063)
!1084 = !DILocalVariable(name: "y", arg: 11, scope: !1063, file: !5, line: 66, type: !99)
!1085 = !DILocation(line: 66, column: 109, scope: !1063)
!1086 = !DILocalVariable(name: "z", arg: 12, scope: !1063, file: !5, line: 66, type: !99)
!1087 = !DILocation(line: 66, column: 120, scope: !1063)
!1088 = !DILocalVariable(name: "dev_A", scope: !1063, file: !5, line: 67, type: !99)
!1089 = !DILocation(line: 67, column: 11, scope: !1063)
!1090 = !DILocalVariable(name: "dev_u1", scope: !1063, file: !5, line: 68, type: !99)
!1091 = !DILocation(line: 68, column: 11, scope: !1063)
!1092 = !DILocalVariable(name: "dev_v1", scope: !1063, file: !5, line: 69, type: !99)
!1093 = !DILocation(line: 69, column: 11, scope: !1063)
!1094 = !DILocalVariable(name: "dev_u2", scope: !1063, file: !5, line: 70, type: !99)
!1095 = !DILocation(line: 70, column: 11, scope: !1063)
!1096 = !DILocalVariable(name: "dev_v2", scope: !1063, file: !5, line: 71, type: !99)
!1097 = !DILocation(line: 71, column: 11, scope: !1063)
!1098 = !DILocalVariable(name: "dev_w", scope: !1063, file: !5, line: 72, type: !99)
!1099 = !DILocation(line: 72, column: 11, scope: !1063)
!1100 = !DILocalVariable(name: "dev_x", scope: !1063, file: !5, line: 73, type: !99)
!1101 = !DILocation(line: 73, column: 11, scope: !1063)
!1102 = !DILocalVariable(name: "dev_y", scope: !1063, file: !5, line: 74, type: !99)
!1103 = !DILocation(line: 74, column: 11, scope: !1063)
!1104 = !DILocalVariable(name: "dev_z", scope: !1063, file: !5, line: 75, type: !99)
!1105 = !DILocation(line: 75, column: 11, scope: !1063)
!1106 = !DILocalVariable(name: "dev_alpha", scope: !1063, file: !5, line: 76, type: !99)
!1107 = !DILocation(line: 76, column: 11, scope: !1063)
!1108 = !DILocalVariable(name: "dev_beta", scope: !1063, file: !5, line: 77, type: !99)
!1109 = !DILocation(line: 77, column: 11, scope: !1063)
!1110 = !DILocation(line: 78, column: 22, scope: !1063)
!1111 = !DILocation(line: 78, column: 24, scope: !1063)
!1112 = !DILocation(line: 78, column: 23, scope: !1063)
!1113 = !DILocation(line: 78, column: 25, scope: !1063)
!1114 = !DILocation(line: 78, column: 3, scope: !1063)
!1115 = !DILocation(line: 79, column: 23, scope: !1063)
!1116 = !DILocation(line: 79, column: 24, scope: !1063)
!1117 = !DILocation(line: 79, column: 3, scope: !1063)
!1118 = !DILocation(line: 80, column: 23, scope: !1063)
!1119 = !DILocation(line: 80, column: 24, scope: !1063)
!1120 = !DILocation(line: 80, column: 3, scope: !1063)
!1121 = !DILocation(line: 81, column: 23, scope: !1063)
!1122 = !DILocation(line: 81, column: 24, scope: !1063)
!1123 = !DILocation(line: 81, column: 3, scope: !1063)
!1124 = !DILocation(line: 82, column: 23, scope: !1063)
!1125 = !DILocation(line: 82, column: 24, scope: !1063)
!1126 = !DILocation(line: 82, column: 3, scope: !1063)
!1127 = !DILocation(line: 83, column: 22, scope: !1063)
!1128 = !DILocation(line: 83, column: 23, scope: !1063)
!1129 = !DILocation(line: 83, column: 3, scope: !1063)
!1130 = !DILocation(line: 84, column: 22, scope: !1063)
!1131 = !DILocation(line: 84, column: 23, scope: !1063)
!1132 = !DILocation(line: 84, column: 3, scope: !1063)
!1133 = !DILocation(line: 85, column: 22, scope: !1063)
!1134 = !DILocation(line: 85, column: 23, scope: !1063)
!1135 = !DILocation(line: 85, column: 3, scope: !1063)
!1136 = !DILocation(line: 86, column: 22, scope: !1063)
!1137 = !DILocation(line: 86, column: 23, scope: !1063)
!1138 = !DILocation(line: 86, column: 3, scope: !1063)
!1139 = !DILocation(line: 87, column: 3, scope: !1063)
!1140 = !DILocation(line: 88, column: 3, scope: !1063)
!1141 = !DILocation(line: 89, column: 14, scope: !1063)
!1142 = !DILocation(line: 89, column: 21, scope: !1063)
!1143 = !DILocation(line: 89, column: 24, scope: !1063)
!1144 = !DILocation(line: 89, column: 26, scope: !1063)
!1145 = !DILocation(line: 89, column: 25, scope: !1063)
!1146 = !DILocation(line: 89, column: 27, scope: !1063)
!1147 = !DILocation(line: 89, column: 3, scope: !1063)
!1148 = !DILocation(line: 90, column: 14, scope: !1063)
!1149 = !DILocation(line: 90, column: 22, scope: !1063)
!1150 = !DILocation(line: 90, column: 26, scope: !1063)
!1151 = !DILocation(line: 90, column: 27, scope: !1063)
!1152 = !DILocation(line: 90, column: 3, scope: !1063)
!1153 = !DILocation(line: 91, column: 14, scope: !1063)
!1154 = !DILocation(line: 91, column: 22, scope: !1063)
!1155 = !DILocation(line: 91, column: 26, scope: !1063)
!1156 = !DILocation(line: 91, column: 27, scope: !1063)
!1157 = !DILocation(line: 91, column: 3, scope: !1063)
!1158 = !DILocation(line: 92, column: 14, scope: !1063)
!1159 = !DILocation(line: 92, column: 22, scope: !1063)
!1160 = !DILocation(line: 92, column: 26, scope: !1063)
!1161 = !DILocation(line: 92, column: 27, scope: !1063)
!1162 = !DILocation(line: 92, column: 3, scope: !1063)
!1163 = !DILocation(line: 93, column: 14, scope: !1063)
!1164 = !DILocation(line: 93, column: 22, scope: !1063)
!1165 = !DILocation(line: 93, column: 26, scope: !1063)
!1166 = !DILocation(line: 93, column: 27, scope: !1063)
!1167 = !DILocation(line: 93, column: 3, scope: !1063)
!1168 = !DILocation(line: 94, column: 14, scope: !1063)
!1169 = !DILocation(line: 94, column: 21, scope: !1063)
!1170 = !DILocation(line: 94, column: 24, scope: !1063)
!1171 = !DILocation(line: 94, column: 25, scope: !1063)
!1172 = !DILocation(line: 94, column: 3, scope: !1063)
!1173 = !DILocation(line: 95, column: 14, scope: !1063)
!1174 = !DILocation(line: 95, column: 21, scope: !1063)
!1175 = !DILocation(line: 95, column: 24, scope: !1063)
!1176 = !DILocation(line: 95, column: 25, scope: !1063)
!1177 = !DILocation(line: 95, column: 3, scope: !1063)
!1178 = !DILocation(line: 96, column: 14, scope: !1063)
!1179 = !DILocation(line: 96, column: 21, scope: !1063)
!1180 = !DILocation(line: 96, column: 24, scope: !1063)
!1181 = !DILocation(line: 96, column: 25, scope: !1063)
!1182 = !DILocation(line: 96, column: 3, scope: !1063)
!1183 = !DILocation(line: 97, column: 14, scope: !1063)
!1184 = !DILocation(line: 97, column: 21, scope: !1063)
!1185 = !DILocation(line: 97, column: 24, scope: !1063)
!1186 = !DILocation(line: 97, column: 25, scope: !1063)
!1187 = !DILocation(line: 97, column: 3, scope: !1063)
!1188 = !DILocation(line: 98, column: 14, scope: !1063)
!1189 = !DILocation(line: 98, column: 25, scope: !1063)
!1190 = !DILocation(line: 98, column: 3, scope: !1063)
!1191 = !DILocation(line: 99, column: 14, scope: !1063)
!1192 = !DILocation(line: 99, column: 24, scope: !1063)
!1193 = !DILocation(line: 99, column: 3, scope: !1063)
!1194 = !DILocalVariable(name: "threadsPerBlock", scope: !1063, file: !5, line: 100, type: !1195)
!1195 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!1196 = !DILocation(line: 100, column: 18, scope: !1063)
!1197 = !DILocalVariable(name: "block", scope: !1198, file: !5, line: 104, type: !1199)
!1198 = distinct !DILexicalBlock(scope: !1063, file: !5, line: 103, column: 3)
!1199 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1200, line: 427, baseType: !1201)
!1200 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!1201 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1200, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !1202, identifier: "_ZTS4dim3")
!1202 = !{!1203, !1204, !1205, !1206, !1210, !1219}
!1203 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1201, file: !1200, line: 419, baseType: !9, size: 32)
!1204 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1201, file: !1200, line: 419, baseType: !9, size: 32, offset: 32)
!1205 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1201, file: !1200, line: 419, baseType: !9, size: 32, offset: 64)
!1206 = !DISubprogram(name: "dim3", scope: !1201, file: !1200, line: 421, type: !1207, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!1207 = !DISubroutineType(types: !1208)
!1208 = !{null, !1209, !9, !9, !9}
!1209 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1201, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1210 = !DISubprogram(name: "dim3", scope: !1201, file: !1200, line: 422, type: !1211, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!1211 = !DISubroutineType(types: !1212)
!1212 = !{null, !1209, !1213}
!1213 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1200, line: 383, baseType: !1214)
!1214 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1200, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !1215, identifier: "_ZTS5uint3")
!1215 = !{!1216, !1217, !1218}
!1216 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1214, file: !1200, line: 192, baseType: !9, size: 32)
!1217 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1214, file: !1200, line: 192, baseType: !9, size: 32, offset: 32)
!1218 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1214, file: !1200, line: 192, baseType: !9, size: 32, offset: 64)
!1219 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1201, file: !1200, line: 423, type: !1220, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!1220 = !DISubroutineType(types: !1221)
!1221 = !{!1213, !1209}
!1222 = !DILocation(line: 104, column: 10, scope: !1198)
!1223 = !DILocalVariable(name: "grid", scope: !1198, file: !5, line: 105, type: !1199)
!1224 = !DILocation(line: 105, column: 10, scope: !1198)
!1225 = !DILocation(line: 105, column: 26, scope: !1198)
!1226 = !DILocation(line: 105, column: 35, scope: !1198)
!1227 = !DILocation(line: 105, column: 15, scope: !1198)
!1228 = !DILocation(line: 105, column: 50, scope: !1198)
!1229 = !DILocation(line: 105, column: 59, scope: !1198)
!1230 = !DILocation(line: 105, column: 39, scope: !1198)
!1231 = !DILocation(line: 106, column: 16, scope: !1198)
!1232 = !DILocation(line: 106, column: 22, scope: !1198)
!1233 = !DILocation(line: 106, column: 13, scope: !1198)
!1234 = !DILocation(line: 106, column: 5, scope: !1198)
!1235 = !DILocation(line: 106, column: 31, scope: !1198)
!1236 = !DILocation(line: 106, column: 35, scope: !1198)
!1237 = !DILocation(line: 106, column: 34, scope: !1198)
!1238 = !DILocation(line: 106, column: 47, scope: !1198)
!1239 = !DILocation(line: 106, column: 46, scope: !1198)
!1240 = !DILocation(line: 106, column: 57, scope: !1198)
!1241 = !DILocation(line: 106, column: 64, scope: !1198)
!1242 = !DILocation(line: 106, column: 72, scope: !1198)
!1243 = !DILocation(line: 106, column: 80, scope: !1198)
!1244 = !DILocation(line: 106, column: 88, scope: !1198)
!1245 = !DILocation(line: 106, column: 96, scope: !1198)
!1246 = !DILocation(line: 106, column: 103, scope: !1198)
!1247 = !DILocation(line: 106, column: 110, scope: !1198)
!1248 = !DILocation(line: 106, column: 117, scope: !1198)
!1249 = !DILocation(line: 110, column: 25, scope: !1063)
!1250 = !DILocation(line: 110, column: 14, scope: !1063)
!1251 = !DILocation(line: 110, column: 46, scope: !1063)
!1252 = !DILocation(line: 110, column: 11, scope: !1063)
!1253 = !DILocation(line: 110, column: 3, scope: !1063)
!1254 = !DILocation(line: 110, column: 65, scope: !1063)
!1255 = !DILocation(line: 110, column: 69, scope: !1063)
!1256 = !DILocation(line: 110, column: 68, scope: !1063)
!1257 = !DILocation(line: 110, column: 81, scope: !1063)
!1258 = !DILocation(line: 110, column: 80, scope: !1063)
!1259 = !DILocation(line: 110, column: 91, scope: !1063)
!1260 = !DILocation(line: 110, column: 98, scope: !1063)
!1261 = !DILocation(line: 110, column: 106, scope: !1063)
!1262 = !DILocation(line: 110, column: 114, scope: !1063)
!1263 = !DILocation(line: 110, column: 122, scope: !1063)
!1264 = !DILocation(line: 110, column: 130, scope: !1063)
!1265 = !DILocation(line: 110, column: 137, scope: !1063)
!1266 = !DILocation(line: 110, column: 144, scope: !1063)
!1267 = !DILocation(line: 110, column: 151, scope: !1063)
!1268 = !DILocation(line: 111, column: 25, scope: !1063)
!1269 = !DILocation(line: 111, column: 14, scope: !1063)
!1270 = !DILocation(line: 111, column: 46, scope: !1063)
!1271 = !DILocation(line: 111, column: 11, scope: !1063)
!1272 = !DILocation(line: 111, column: 3, scope: !1063)
!1273 = !DILocation(line: 111, column: 65, scope: !1063)
!1274 = !DILocation(line: 111, column: 69, scope: !1063)
!1275 = !DILocation(line: 111, column: 68, scope: !1063)
!1276 = !DILocation(line: 111, column: 81, scope: !1063)
!1277 = !DILocation(line: 111, column: 80, scope: !1063)
!1278 = !DILocation(line: 111, column: 91, scope: !1063)
!1279 = !DILocation(line: 111, column: 98, scope: !1063)
!1280 = !DILocation(line: 111, column: 106, scope: !1063)
!1281 = !DILocation(line: 111, column: 114, scope: !1063)
!1282 = !DILocation(line: 111, column: 122, scope: !1063)
!1283 = !DILocation(line: 111, column: 130, scope: !1063)
!1284 = !DILocation(line: 111, column: 137, scope: !1063)
!1285 = !DILocation(line: 111, column: 144, scope: !1063)
!1286 = !DILocation(line: 111, column: 151, scope: !1063)
!1287 = !DILocation(line: 112, column: 25, scope: !1063)
!1288 = !DILocation(line: 112, column: 14, scope: !1063)
!1289 = !DILocation(line: 112, column: 46, scope: !1063)
!1290 = !DILocation(line: 112, column: 11, scope: !1063)
!1291 = !DILocation(line: 112, column: 3, scope: !1063)
!1292 = !DILocation(line: 112, column: 65, scope: !1063)
!1293 = !DILocation(line: 112, column: 69, scope: !1063)
!1294 = !DILocation(line: 112, column: 68, scope: !1063)
!1295 = !DILocation(line: 112, column: 81, scope: !1063)
!1296 = !DILocation(line: 112, column: 80, scope: !1063)
!1297 = !DILocation(line: 112, column: 91, scope: !1063)
!1298 = !DILocation(line: 112, column: 98, scope: !1063)
!1299 = !DILocation(line: 112, column: 106, scope: !1063)
!1300 = !DILocation(line: 112, column: 114, scope: !1063)
!1301 = !DILocation(line: 112, column: 122, scope: !1063)
!1302 = !DILocation(line: 112, column: 130, scope: !1063)
!1303 = !DILocation(line: 112, column: 137, scope: !1063)
!1304 = !DILocation(line: 112, column: 144, scope: !1063)
!1305 = !DILocation(line: 112, column: 151, scope: !1063)
!1306 = !DILocation(line: 113, column: 14, scope: !1063)
!1307 = !DILocation(line: 113, column: 17, scope: !1063)
!1308 = !DILocation(line: 113, column: 24, scope: !1063)
!1309 = !DILocation(line: 113, column: 25, scope: !1063)
!1310 = !DILocation(line: 113, column: 3, scope: !1063)
!1311 = !DILocation(line: 114, column: 1, scope: !1063)
!1312 = distinct !DISubprogram(name: "print_array", linkageName: "_ZL11print_arrayiPd", scope: !5, file: !5, line: 157, type: !1313, scopeLine: 159, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1313 = !DISubroutineType(types: !1314)
!1314 = !{null, !110, !99}
!1315 = !DILocalVariable(name: "n", arg: 1, scope: !1312, file: !5, line: 157, type: !110)
!1316 = !DILocation(line: 157, column: 22, scope: !1312)
!1317 = !DILocalVariable(name: "w", arg: 2, scope: !1312, file: !5, line: 158, type: !99)
!1318 = !DILocation(line: 158, column: 12, scope: !1312)
!1319 = !DILocalVariable(name: "i", scope: !1312, file: !5, line: 160, type: !110)
!1320 = !DILocation(line: 160, column: 7, scope: !1312)
!1321 = !DILocation(line: 162, column: 10, scope: !1322)
!1322 = distinct !DILexicalBlock(scope: !1312, file: !5, line: 162, column: 3)
!1323 = !DILocation(line: 162, column: 8, scope: !1322)
!1324 = !DILocation(line: 162, column: 15, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1322, file: !5, line: 162, column: 3)
!1326 = !DILocation(line: 162, column: 19, scope: !1325)
!1327 = !DILocation(line: 162, column: 17, scope: !1325)
!1328 = !DILocation(line: 162, column: 3, scope: !1322)
!1329 = !DILocation(line: 163, column: 14, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1325, file: !5, line: 162, column: 27)
!1331 = !DILocation(line: 163, column: 33, scope: !1330)
!1332 = !DILocation(line: 163, column: 35, scope: !1330)
!1333 = !DILocation(line: 163, column: 5, scope: !1330)
!1334 = !DILocation(line: 164, column: 9, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1330, file: !5, line: 164, column: 9)
!1336 = !DILocation(line: 164, column: 11, scope: !1335)
!1337 = !DILocation(line: 164, column: 16, scope: !1335)
!1338 = !DILocation(line: 164, column: 9, scope: !1330)
!1339 = !DILocation(line: 164, column: 31, scope: !1335)
!1340 = !DILocation(line: 164, column: 22, scope: !1335)
!1341 = !DILocation(line: 165, column: 3, scope: !1330)
!1342 = !DILocation(line: 162, column: 23, scope: !1325)
!1343 = !DILocation(line: 162, column: 3, scope: !1325)
!1344 = distinct !{!1344, !1328, !1345}
!1345 = !DILocation(line: 165, column: 3, scope: !1322)
!1346 = !DILocation(line: 166, column: 1, scope: !1312)
!1347 = distinct !DISubprogram(name: "cudaMalloc<double>", linkageName: "_ZL10cudaMallocIdE9cudaErrorPPT_m", scope: !1348, file: !1348, line: 490, type: !1349, scopeLine: 494, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, templateParams: !1353, retainedNodes: !695)
!1348 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "")
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!1351, !1352, !391}
!1351 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !8, line: 1419, baseType: !16)
!1352 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!1353 = !{!1354}
!1354 = !DITemplateTypeParameter(name: "T", type: !100)
!1355 = !DILocalVariable(name: "devPtr", arg: 1, scope: !1347, file: !1348, line: 491, type: !1352)
!1356 = !DILocation(line: 491, column: 12, scope: !1347)
!1357 = !DILocalVariable(name: "size", arg: 2, scope: !1347, file: !1348, line: 492, type: !391)
!1358 = !DILocation(line: 492, column: 12, scope: !1347)
!1359 = !DILocation(line: 495, column: 38, scope: !1347)
!1360 = !DILocation(line: 495, column: 23, scope: !1347)
!1361 = !DILocation(line: 495, column: 46, scope: !1347)
!1362 = !DILocation(line: 495, column: 10, scope: !1347)
!1363 = !DILocation(line: 495, column: 3, scope: !1347)
!1364 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1201, file: !1200, line: 421, type: !1207, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, declaration: !1206, retainedNodes: !695)
!1365 = !DILocalVariable(name: "this", arg: 1, scope: !1364, type: !1366, flags: DIFlagArtificial | DIFlagObjectPointer)
!1366 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1201, size: 64)
!1367 = !DILocation(line: 0, scope: !1364)
!1368 = !DILocalVariable(name: "vx", arg: 2, scope: !1364, file: !1200, line: 421, type: !9)
!1369 = !DILocation(line: 421, column: 43, scope: !1364)
!1370 = !DILocalVariable(name: "vy", arg: 3, scope: !1364, file: !1200, line: 421, type: !9)
!1371 = !DILocation(line: 421, column: 64, scope: !1364)
!1372 = !DILocalVariable(name: "vz", arg: 4, scope: !1364, file: !1200, line: 421, type: !9)
!1373 = !DILocation(line: 421, column: 85, scope: !1364)
!1374 = !DILocation(line: 421, column: 95, scope: !1364)
!1375 = !DILocation(line: 421, column: 97, scope: !1364)
!1376 = !DILocation(line: 421, column: 102, scope: !1364)
!1377 = !DILocation(line: 421, column: 104, scope: !1364)
!1378 = !DILocation(line: 421, column: 109, scope: !1364)
!1379 = !DILocation(line: 421, column: 111, scope: !1364)
!1380 = !DILocation(line: 421, column: 116, scope: !1364)
!1381 = distinct !DISubprogram(name: "num_blocks", linkageName: "_ZL10num_blocksii", scope: !5, file: !5, line: 15, type: !1382, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1382 = !DISubroutineType(types: !1383)
!1383 = !{!9, !110, !110}
!1384 = !DILocalVariable(name: "num", arg: 1, scope: !1381, file: !5, line: 15, type: !110)
!1385 = !DILocation(line: 15, column: 32, scope: !1381)
!1386 = !DILocalVariable(name: "factor", arg: 2, scope: !1381, file: !5, line: 15, type: !110)
!1387 = !DILocation(line: 15, column: 41, scope: !1381)
!1388 = !DILocation(line: 16, column: 11, scope: !1381)
!1389 = !DILocation(line: 16, column: 17, scope: !1381)
!1390 = !DILocation(line: 16, column: 15, scope: !1381)
!1391 = !DILocation(line: 16, column: 24, scope: !1381)
!1392 = !DILocation(line: 16, column: 31, scope: !1381)
!1393 = !DILocation(line: 16, column: 29, scope: !1381)
!1394 = !DILocation(line: 16, column: 3, scope: !1381)
