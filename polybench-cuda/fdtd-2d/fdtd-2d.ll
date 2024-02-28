; ModuleID = 'fdtd-2d.cu'
source_filename = "fdtd-2d.cu"
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
define dso_local void @_Z12kernel_splatiiiPdS_S_S_i(i32 %tmax, i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz, double* %fict, i32 %t) #0 !dbg !692 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %fict.addr = alloca double*, align 8
  %t.addr = alloca i32, align 4
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !696, metadata !DIExpression()), !dbg !697
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !698, metadata !DIExpression()), !dbg !699
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !700, metadata !DIExpression()), !dbg !701
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !702, metadata !DIExpression()), !dbg !703
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !704, metadata !DIExpression()), !dbg !705
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !706, metadata !DIExpression()), !dbg !707
  store double* %fict, double** %fict.addr, align 8
  call void @llvm.dbg.declare(metadata double** %fict.addr, metadata !708, metadata !DIExpression()), !dbg !709
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !710, metadata !DIExpression()), !dbg !711
  %0 = bitcast i32* %tmax.addr to i8*, !dbg !712
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !712
  %2 = icmp eq i32 %1, 0, !dbg !712
  br i1 %2, label %setup.next, label %setup.end, !dbg !712

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %nx.addr to i8*, !dbg !712
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !712
  %5 = icmp eq i32 %4, 0, !dbg !712
  br i1 %5, label %setup.next1, label %setup.end, !dbg !712

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %ny.addr to i8*, !dbg !712
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 8), !dbg !712
  %8 = icmp eq i32 %7, 0, !dbg !712
  br i1 %8, label %setup.next2, label %setup.end, !dbg !712

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %ex.addr to i8*, !dbg !712
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 16), !dbg !712
  %11 = icmp eq i32 %10, 0, !dbg !712
  br i1 %11, label %setup.next3, label %setup.end, !dbg !712

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %ey.addr to i8*, !dbg !712
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 24), !dbg !712
  %14 = icmp eq i32 %13, 0, !dbg !712
  br i1 %14, label %setup.next4, label %setup.end, !dbg !712

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %hz.addr to i8*, !dbg !712
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 32), !dbg !712
  %17 = icmp eq i32 %16, 0, !dbg !712
  br i1 %17, label %setup.next5, label %setup.end, !dbg !712

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %fict.addr to i8*, !dbg !712
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 40), !dbg !712
  %20 = icmp eq i32 %19, 0, !dbg !712
  br i1 %20, label %setup.next6, label %setup.end, !dbg !712

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %t.addr to i8*, !dbg !712
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 4, i64 48), !dbg !712
  %23 = icmp eq i32 %22, 0, !dbg !712
  br i1 %23, label %setup.next7, label %setup.end, !dbg !712

setup.next7:                                      ; preds = %setup.next6
  %24 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i32, double*, double*, double*, double*, i32)* @_Z12kernel_splatiiiPdS_S_S_i to i8*)), !dbg !712
  br label %setup.end, !dbg !712

setup.end:                                        ; preds = %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !713
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline uwtable
define dso_local void @_Z9kernel_eyiiiPdS_S_S_i(i32 %tmax, i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz, double* %fict, i32 %t) #0 !dbg !714 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %fict.addr = alloca double*, align 8
  %t.addr = alloca i32, align 4
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !715, metadata !DIExpression()), !dbg !716
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !717, metadata !DIExpression()), !dbg !718
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !719, metadata !DIExpression()), !dbg !720
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !721, metadata !DIExpression()), !dbg !722
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !723, metadata !DIExpression()), !dbg !724
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !725, metadata !DIExpression()), !dbg !726
  store double* %fict, double** %fict.addr, align 8
  call void @llvm.dbg.declare(metadata double** %fict.addr, metadata !727, metadata !DIExpression()), !dbg !728
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !729, metadata !DIExpression()), !dbg !730
  %0 = bitcast i32* %tmax.addr to i8*, !dbg !731
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !731
  %2 = icmp eq i32 %1, 0, !dbg !731
  br i1 %2, label %setup.next, label %setup.end, !dbg !731

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %nx.addr to i8*, !dbg !731
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !731
  %5 = icmp eq i32 %4, 0, !dbg !731
  br i1 %5, label %setup.next1, label %setup.end, !dbg !731

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %ny.addr to i8*, !dbg !731
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 8), !dbg !731
  %8 = icmp eq i32 %7, 0, !dbg !731
  br i1 %8, label %setup.next2, label %setup.end, !dbg !731

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %ex.addr to i8*, !dbg !731
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 16), !dbg !731
  %11 = icmp eq i32 %10, 0, !dbg !731
  br i1 %11, label %setup.next3, label %setup.end, !dbg !731

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %ey.addr to i8*, !dbg !731
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 24), !dbg !731
  %14 = icmp eq i32 %13, 0, !dbg !731
  br i1 %14, label %setup.next4, label %setup.end, !dbg !731

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %hz.addr to i8*, !dbg !731
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 32), !dbg !731
  %17 = icmp eq i32 %16, 0, !dbg !731
  br i1 %17, label %setup.next5, label %setup.end, !dbg !731

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %fict.addr to i8*, !dbg !731
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 40), !dbg !731
  %20 = icmp eq i32 %19, 0, !dbg !731
  br i1 %20, label %setup.next6, label %setup.end, !dbg !731

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %t.addr to i8*, !dbg !731
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 4, i64 48), !dbg !731
  %23 = icmp eq i32 %22, 0, !dbg !731
  br i1 %23, label %setup.next7, label %setup.end, !dbg !731

setup.next7:                                      ; preds = %setup.next6
  %24 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i32, double*, double*, double*, double*, i32)* @_Z9kernel_eyiiiPdS_S_S_i to i8*)), !dbg !731
  br label %setup.end, !dbg !731

setup.end:                                        ; preds = %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !732
}

; Function Attrs: noinline uwtable
define dso_local void @_Z9kernel_exiiiPdS_S_S_i(i32 %tmax, i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz, double* %fict, i32 %t) #0 !dbg !733 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %fict.addr = alloca double*, align 8
  %t.addr = alloca i32, align 4
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !734, metadata !DIExpression()), !dbg !735
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !736, metadata !DIExpression()), !dbg !737
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !738, metadata !DIExpression()), !dbg !739
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !740, metadata !DIExpression()), !dbg !741
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !742, metadata !DIExpression()), !dbg !743
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !744, metadata !DIExpression()), !dbg !745
  store double* %fict, double** %fict.addr, align 8
  call void @llvm.dbg.declare(metadata double** %fict.addr, metadata !746, metadata !DIExpression()), !dbg !747
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !748, metadata !DIExpression()), !dbg !749
  %0 = bitcast i32* %tmax.addr to i8*, !dbg !750
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !750
  %2 = icmp eq i32 %1, 0, !dbg !750
  br i1 %2, label %setup.next, label %setup.end, !dbg !750

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %nx.addr to i8*, !dbg !750
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !750
  %5 = icmp eq i32 %4, 0, !dbg !750
  br i1 %5, label %setup.next1, label %setup.end, !dbg !750

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %ny.addr to i8*, !dbg !750
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 8), !dbg !750
  %8 = icmp eq i32 %7, 0, !dbg !750
  br i1 %8, label %setup.next2, label %setup.end, !dbg !750

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %ex.addr to i8*, !dbg !750
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 16), !dbg !750
  %11 = icmp eq i32 %10, 0, !dbg !750
  br i1 %11, label %setup.next3, label %setup.end, !dbg !750

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %ey.addr to i8*, !dbg !750
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 24), !dbg !750
  %14 = icmp eq i32 %13, 0, !dbg !750
  br i1 %14, label %setup.next4, label %setup.end, !dbg !750

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %hz.addr to i8*, !dbg !750
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 32), !dbg !750
  %17 = icmp eq i32 %16, 0, !dbg !750
  br i1 %17, label %setup.next5, label %setup.end, !dbg !750

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %fict.addr to i8*, !dbg !750
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 40), !dbg !750
  %20 = icmp eq i32 %19, 0, !dbg !750
  br i1 %20, label %setup.next6, label %setup.end, !dbg !750

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %t.addr to i8*, !dbg !750
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 4, i64 48), !dbg !750
  %23 = icmp eq i32 %22, 0, !dbg !750
  br i1 %23, label %setup.next7, label %setup.end, !dbg !750

setup.next7:                                      ; preds = %setup.next6
  %24 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i32, double*, double*, double*, double*, i32)* @_Z9kernel_exiiiPdS_S_S_i to i8*)), !dbg !750
  br label %setup.end, !dbg !750

setup.end:                                        ; preds = %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !751
}

; Function Attrs: noinline uwtable
define dso_local void @_Z9kernel_hziiiPdS_S_S_i(i32 %tmax, i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz, double* %fict, i32 %t) #0 !dbg !752 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %fict.addr = alloca double*, align 8
  %t.addr = alloca i32, align 4
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !753, metadata !DIExpression()), !dbg !754
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !755, metadata !DIExpression()), !dbg !756
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !757, metadata !DIExpression()), !dbg !758
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !759, metadata !DIExpression()), !dbg !760
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !761, metadata !DIExpression()), !dbg !762
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !763, metadata !DIExpression()), !dbg !764
  store double* %fict, double** %fict.addr, align 8
  call void @llvm.dbg.declare(metadata double** %fict.addr, metadata !765, metadata !DIExpression()), !dbg !766
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !767, metadata !DIExpression()), !dbg !768
  %0 = bitcast i32* %tmax.addr to i8*, !dbg !769
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !769
  %2 = icmp eq i32 %1, 0, !dbg !769
  br i1 %2, label %setup.next, label %setup.end, !dbg !769

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %nx.addr to i8*, !dbg !769
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !769
  %5 = icmp eq i32 %4, 0, !dbg !769
  br i1 %5, label %setup.next1, label %setup.end, !dbg !769

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %ny.addr to i8*, !dbg !769
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 8), !dbg !769
  %8 = icmp eq i32 %7, 0, !dbg !769
  br i1 %8, label %setup.next2, label %setup.end, !dbg !769

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %ex.addr to i8*, !dbg !769
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 16), !dbg !769
  %11 = icmp eq i32 %10, 0, !dbg !769
  br i1 %11, label %setup.next3, label %setup.end, !dbg !769

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %ey.addr to i8*, !dbg !769
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 24), !dbg !769
  %14 = icmp eq i32 %13, 0, !dbg !769
  br i1 %14, label %setup.next4, label %setup.end, !dbg !769

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %hz.addr to i8*, !dbg !769
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 32), !dbg !769
  %17 = icmp eq i32 %16, 0, !dbg !769
  br i1 %17, label %setup.next5, label %setup.end, !dbg !769

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %fict.addr to i8*, !dbg !769
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 40), !dbg !769
  %20 = icmp eq i32 %19, 0, !dbg !769
  br i1 %20, label %setup.next6, label %setup.end, !dbg !769

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %t.addr to i8*, !dbg !769
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 4, i64 48), !dbg !769
  %23 = icmp eq i32 %22, 0, !dbg !769
  br i1 %23, label %setup.next7, label %setup.end, !dbg !769

setup.next7:                                      ; preds = %setup.next6
  %24 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i32, double*, double*, double*, double*, i32)* @_Z9kernel_hziiiPdS_S_S_i to i8*)), !dbg !769
  br label %setup.end, !dbg !769

setup.end:                                        ; preds = %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !770
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !771 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %tmax = alloca i32, align 4
  %nx = alloca i32, align 4
  %ny = alloca i32, align 4
  %dump_code = alloca i32, align 4
  %ex = alloca double*, align 8
  %ey = alloca double*, align 8
  %hz = alloca double*, align 8
  %_fict_ = alloca double*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !774, metadata !DIExpression()), !dbg !775
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !776, metadata !DIExpression()), !dbg !777
  call void @llvm.dbg.declare(metadata i32* %tmax, metadata !778, metadata !DIExpression()), !dbg !779
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !780
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !780
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !780
  %call = call i32 @atoi(i8* %1) #8, !dbg !781
  store i32 %call, i32* %tmax, align 4, !dbg !779
  call void @llvm.dbg.declare(metadata i32* %nx, metadata !782, metadata !DIExpression()), !dbg !783
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !784
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 3, !dbg !784
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !784
  %call2 = call i32 @atoi(i8* %3) #8, !dbg !785
  store i32 %call2, i32* %nx, align 4, !dbg !783
  call void @llvm.dbg.declare(metadata i32* %ny, metadata !786, metadata !DIExpression()), !dbg !787
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !788
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i64 4, !dbg !788
  %5 = load i8*, i8** %arrayidx3, align 8, !dbg !788
  %call4 = call i32 @atoi(i8* %5) #8, !dbg !789
  store i32 %call4, i32* %ny, align 4, !dbg !787
  call void @llvm.dbg.declare(metadata i32* %dump_code, metadata !790, metadata !DIExpression()), !dbg !791
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !792
  %arrayidx5 = getelementptr inbounds i8*, i8** %6, i64 1, !dbg !792
  %7 = load i8*, i8** %arrayidx5, align 8, !dbg !792
  %call6 = call i32 @atoi(i8* %7) #8, !dbg !793
  store i32 %call6, i32* %dump_code, align 4, !dbg !791
  call void @llvm.dbg.declare(metadata double** %ex, metadata !794, metadata !DIExpression()), !dbg !795
  %8 = load i32, i32* %nx, align 4, !dbg !796
  %9 = load i32, i32* %ny, align 4, !dbg !797
  %mul = mul nsw i32 %8, %9, !dbg !798
  %conv = sext i32 %mul to i64, !dbg !796
  %mul7 = mul i64 %conv, 8, !dbg !799
  %call8 = call noalias i8* @malloc(i64 %mul7) #9, !dbg !800
  %10 = bitcast i8* %call8 to double*, !dbg !801
  store double* %10, double** %ex, align 8, !dbg !795
  call void @llvm.dbg.declare(metadata double** %ey, metadata !802, metadata !DIExpression()), !dbg !803
  %11 = load i32, i32* %nx, align 4, !dbg !804
  %12 = load i32, i32* %ny, align 4, !dbg !805
  %mul9 = mul nsw i32 %11, %12, !dbg !806
  %conv10 = sext i32 %mul9 to i64, !dbg !804
  %mul11 = mul i64 %conv10, 8, !dbg !807
  %call12 = call noalias i8* @malloc(i64 %mul11) #9, !dbg !808
  %13 = bitcast i8* %call12 to double*, !dbg !809
  store double* %13, double** %ey, align 8, !dbg !803
  call void @llvm.dbg.declare(metadata double** %hz, metadata !810, metadata !DIExpression()), !dbg !811
  %14 = load i32, i32* %nx, align 4, !dbg !812
  %15 = load i32, i32* %ny, align 4, !dbg !813
  %mul13 = mul nsw i32 %14, %15, !dbg !814
  %conv14 = sext i32 %mul13 to i64, !dbg !812
  %mul15 = mul i64 %conv14, 8, !dbg !815
  %call16 = call noalias i8* @malloc(i64 %mul15) #9, !dbg !816
  %16 = bitcast i8* %call16 to double*, !dbg !817
  store double* %16, double** %hz, align 8, !dbg !811
  call void @llvm.dbg.declare(metadata double** %_fict_, metadata !818, metadata !DIExpression()), !dbg !819
  %17 = load i32, i32* %ny, align 4, !dbg !820
  %conv17 = sext i32 %17 to i64, !dbg !820
  %mul18 = mul i64 %conv17, 8, !dbg !821
  %call19 = call noalias i8* @malloc(i64 %mul18) #9, !dbg !822
  %18 = bitcast i8* %call19 to double*, !dbg !823
  store double* %18, double** %_fict_, align 8, !dbg !819
  %19 = load i32, i32* %nx, align 4, !dbg !824
  %20 = load i32, i32* %ny, align 4, !dbg !825
  %21 = load double*, double** %ex, align 8, !dbg !826
  %22 = load double*, double** %ey, align 8, !dbg !827
  %23 = load double*, double** %hz, align 8, !dbg !828
  %24 = load double*, double** %_fict_, align 8, !dbg !829
  call void @_ZL10init_arrayiiPdS_S_S_(i32 %19, i32 %20, double* %21, double* %22, double* %23, double* %24), !dbg !830
  %25 = load i32, i32* %tmax, align 4, !dbg !831
  %26 = load i32, i32* %nx, align 4, !dbg !832
  %27 = load i32, i32* %ny, align 4, !dbg !833
  %28 = load double*, double** %ex, align 8, !dbg !834
  %29 = load double*, double** %ey, align 8, !dbg !835
  %30 = load double*, double** %hz, align 8, !dbg !836
  %31 = load double*, double** %_fict_, align 8, !dbg !837
  call void @_ZL6kerneliiiPdS_S_S_(i32 %25, i32 %26, i32 %27, double* %28, double* %29, double* %30, double* %31), !dbg !838
  %32 = load i32, i32* %dump_code, align 4, !dbg !839
  %cmp = icmp eq i32 %32, 1, !dbg !841
  br i1 %cmp, label %if.then, label %if.end, !dbg !842

if.then:                                          ; preds = %entry
  %33 = load i32, i32* %nx, align 4, !dbg !843
  %34 = load i32, i32* %ny, align 4, !dbg !844
  %35 = load double*, double** %ex, align 8, !dbg !845
  %36 = load double*, double** %ey, align 8, !dbg !846
  %37 = load double*, double** %hz, align 8, !dbg !847
  call void @_ZL11print_arrayiiPdS_S_(i32 %33, i32 %34, double* %35, double* %36, double* %37), !dbg !848
  br label %if.end, !dbg !848

if.end:                                           ; preds = %if.then, %entry
  %38 = load double*, double** %ex, align 8, !dbg !849
  %39 = bitcast double* %38 to i8*, !dbg !849
  call void @free(i8* %39) #9, !dbg !850
  %40 = load double*, double** %ey, align 8, !dbg !851
  %41 = bitcast double* %40 to i8*, !dbg !851
  call void @free(i8* %41) #9, !dbg !852
  %42 = load double*, double** %hz, align 8, !dbg !853
  %43 = bitcast double* %42 to i8*, !dbg !853
  call void @free(i8* %43) #9, !dbg !854
  %44 = load double*, double** %_fict_, align 8, !dbg !855
  %45 = bitcast double* %44 to i8*, !dbg !855
  call void @free(i8* %45) #9, !dbg !856
  ret i32 0, !dbg !857
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: noinline nounwind uwtable
define internal void @_ZL10init_arrayiiPdS_S_S_(i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz, double* %_fict_) #5 !dbg !858 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %_fict_.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !861, metadata !DIExpression()), !dbg !862
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !863, metadata !DIExpression()), !dbg !864
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !865, metadata !DIExpression()), !dbg !866
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !867, metadata !DIExpression()), !dbg !868
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !869, metadata !DIExpression()), !dbg !870
  store double* %_fict_, double** %_fict_.addr, align 8
  call void @llvm.dbg.declare(metadata double** %_fict_.addr, metadata !871, metadata !DIExpression()), !dbg !872
  call void @llvm.dbg.declare(metadata i32* %i, metadata !873, metadata !DIExpression()), !dbg !874
  call void @llvm.dbg.declare(metadata i32* %j, metadata !875, metadata !DIExpression()), !dbg !876
  store i32 0, i32* %i, align 4, !dbg !877
  br label %for.cond, !dbg !879

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !880
  %1 = load i32, i32* %ny.addr, align 4, !dbg !882
  %cmp = icmp slt i32 %0, %1, !dbg !883
  br i1 %cmp, label %for.body, label %for.end, !dbg !884

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !885
  %conv = sitofp i32 %2 to double, !dbg !885
  %3 = load double*, double** %_fict_.addr, align 8, !dbg !886
  %4 = load i32, i32* %i, align 4, !dbg !887
  %idxprom = sext i32 %4 to i64, !dbg !886
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom, !dbg !886
  store double %conv, double* %arrayidx, align 8, !dbg !888
  br label %for.inc, !dbg !886

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !889
  %inc = add nsw i32 %5, 1, !dbg !889
  store i32 %inc, i32* %i, align 4, !dbg !889
  br label %for.cond, !dbg !890, !llvm.loop !891

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !893
  br label %for.cond1, !dbg !895

for.cond1:                                        ; preds = %for.inc37, %for.end
  %6 = load i32, i32* %i, align 4, !dbg !896
  %7 = load i32, i32* %nx.addr, align 4, !dbg !898
  %cmp2 = icmp slt i32 %6, %7, !dbg !899
  br i1 %cmp2, label %for.body3, label %for.end39, !dbg !900

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4, !dbg !901
  br label %for.cond4, !dbg !903

for.cond4:                                        ; preds = %for.inc34, %for.body3
  %8 = load i32, i32* %j, align 4, !dbg !904
  %9 = load i32, i32* %ny.addr, align 4, !dbg !906
  %cmp5 = icmp slt i32 %8, %9, !dbg !907
  br i1 %cmp5, label %for.body6, label %for.end36, !dbg !908

for.body6:                                        ; preds = %for.cond4
  %10 = load i32, i32* %i, align 4, !dbg !909
  %conv7 = sitofp i32 %10 to double, !dbg !909
  %11 = load i32, i32* %j, align 4, !dbg !911
  %add = add nsw i32 %11, 1, !dbg !912
  %conv8 = sitofp i32 %add to double, !dbg !913
  %mul = fmul contract double %conv7, %conv8, !dbg !914
  %12 = load i32, i32* %nx.addr, align 4, !dbg !915
  %conv9 = sitofp i32 %12 to double, !dbg !915
  %div = fdiv double %mul, %conv9, !dbg !916
  %13 = load double*, double** %ex.addr, align 8, !dbg !917
  %14 = load i32, i32* %i, align 4, !dbg !918
  %15 = load i32, i32* %ny.addr, align 4, !dbg !919
  %mul10 = mul nsw i32 %14, %15, !dbg !920
  %16 = load i32, i32* %j, align 4, !dbg !921
  %add11 = add nsw i32 %mul10, %16, !dbg !922
  %idxprom12 = sext i32 %add11 to i64, !dbg !917
  %arrayidx13 = getelementptr inbounds double, double* %13, i64 %idxprom12, !dbg !917
  store double %div, double* %arrayidx13, align 8, !dbg !923
  %17 = load i32, i32* %i, align 4, !dbg !924
  %conv14 = sitofp i32 %17 to double, !dbg !924
  %18 = load i32, i32* %j, align 4, !dbg !925
  %add15 = add nsw i32 %18, 2, !dbg !926
  %conv16 = sitofp i32 %add15 to double, !dbg !927
  %mul17 = fmul contract double %conv14, %conv16, !dbg !928
  %19 = load i32, i32* %ny.addr, align 4, !dbg !929
  %conv18 = sitofp i32 %19 to double, !dbg !929
  %div19 = fdiv double %mul17, %conv18, !dbg !930
  %20 = load double*, double** %ey.addr, align 8, !dbg !931
  %21 = load i32, i32* %i, align 4, !dbg !932
  %22 = load i32, i32* %ny.addr, align 4, !dbg !933
  %mul20 = mul nsw i32 %21, %22, !dbg !934
  %23 = load i32, i32* %j, align 4, !dbg !935
  %add21 = add nsw i32 %mul20, %23, !dbg !936
  %idxprom22 = sext i32 %add21 to i64, !dbg !931
  %arrayidx23 = getelementptr inbounds double, double* %20, i64 %idxprom22, !dbg !931
  store double %div19, double* %arrayidx23, align 8, !dbg !937
  %24 = load i32, i32* %i, align 4, !dbg !938
  %conv24 = sitofp i32 %24 to double, !dbg !938
  %25 = load i32, i32* %j, align 4, !dbg !939
  %add25 = add nsw i32 %25, 3, !dbg !940
  %conv26 = sitofp i32 %add25 to double, !dbg !941
  %mul27 = fmul contract double %conv24, %conv26, !dbg !942
  %26 = load i32, i32* %nx.addr, align 4, !dbg !943
  %conv28 = sitofp i32 %26 to double, !dbg !943
  %div29 = fdiv double %mul27, %conv28, !dbg !944
  %27 = load double*, double** %hz.addr, align 8, !dbg !945
  %28 = load i32, i32* %i, align 4, !dbg !946
  %29 = load i32, i32* %ny.addr, align 4, !dbg !947
  %mul30 = mul nsw i32 %28, %29, !dbg !948
  %30 = load i32, i32* %j, align 4, !dbg !949
  %add31 = add nsw i32 %mul30, %30, !dbg !950
  %idxprom32 = sext i32 %add31 to i64, !dbg !945
  %arrayidx33 = getelementptr inbounds double, double* %27, i64 %idxprom32, !dbg !945
  store double %div29, double* %arrayidx33, align 8, !dbg !951
  br label %for.inc34, !dbg !952

for.inc34:                                        ; preds = %for.body6
  %31 = load i32, i32* %j, align 4, !dbg !953
  %inc35 = add nsw i32 %31, 1, !dbg !953
  store i32 %inc35, i32* %j, align 4, !dbg !953
  br label %for.cond4, !dbg !954, !llvm.loop !955

for.end36:                                        ; preds = %for.cond4
  br label %for.inc37, !dbg !956

for.inc37:                                        ; preds = %for.end36
  %32 = load i32, i32* %i, align 4, !dbg !957
  %inc38 = add nsw i32 %32, 1, !dbg !957
  store i32 %inc38, i32* %i, align 4, !dbg !957
  br label %for.cond1, !dbg !958, !llvm.loop !959

for.end39:                                        ; preds = %for.cond1
  ret void, !dbg !961
}

; Function Attrs: noinline uwtable
define internal void @_ZL6kerneliiiPdS_S_S_(i32 %tmax, i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz, double* %fict) #0 !dbg !962 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %fict.addr = alloca double*, align 8
  %threadsPerBlock = alloca i32, align 4
  %dev_ex = alloca double*, align 8
  %dev_ey = alloca double*, align 8
  %dev_hz = alloca double*, align 8
  %dev_fict = alloca double*, align 8
  %t = alloca i32, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp28 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp28.coerce = alloca { i64, i32 }, align 4
  %block = alloca %struct.dim3, align 4
  %grid = alloca %struct.dim3, align 4
  %agg.tmp33 = alloca %struct.dim3, align 4
  %agg.tmp34 = alloca %struct.dim3, align 4
  %agg.tmp33.coerce = alloca { i64, i32 }, align 4
  %agg.tmp34.coerce = alloca { i64, i32 }, align 4
  %block39 = alloca %struct.dim3, align 4
  %grid40 = alloca %struct.dim3, align 4
  %agg.tmp46 = alloca %struct.dim3, align 4
  %agg.tmp47 = alloca %struct.dim3, align 4
  %agg.tmp46.coerce = alloca { i64, i32 }, align 4
  %agg.tmp47.coerce = alloca { i64, i32 }, align 4
  %block52 = alloca %struct.dim3, align 4
  %grid53 = alloca %struct.dim3, align 4
  %agg.tmp60 = alloca %struct.dim3, align 4
  %agg.tmp61 = alloca %struct.dim3, align 4
  %agg.tmp60.coerce = alloca { i64, i32 }, align 4
  %agg.tmp61.coerce = alloca { i64, i32 }, align 4
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !965, metadata !DIExpression()), !dbg !966
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !967, metadata !DIExpression()), !dbg !968
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !969, metadata !DIExpression()), !dbg !970
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !971, metadata !DIExpression()), !dbg !972
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !973, metadata !DIExpression()), !dbg !974
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !975, metadata !DIExpression()), !dbg !976
  store double* %fict, double** %fict.addr, align 8
  call void @llvm.dbg.declare(metadata double** %fict.addr, metadata !977, metadata !DIExpression()), !dbg !978
  call void @llvm.dbg.declare(metadata i32* %threadsPerBlock, metadata !979, metadata !DIExpression()), !dbg !981
  store i32 256, i32* %threadsPerBlock, align 4, !dbg !981
  call void @llvm.dbg.declare(metadata double** %dev_ex, metadata !982, metadata !DIExpression()), !dbg !983
  call void @llvm.dbg.declare(metadata double** %dev_ey, metadata !984, metadata !DIExpression()), !dbg !985
  call void @llvm.dbg.declare(metadata double** %dev_hz, metadata !986, metadata !DIExpression()), !dbg !987
  call void @llvm.dbg.declare(metadata double** %dev_fict, metadata !988, metadata !DIExpression()), !dbg !989
  %0 = load i32, i32* %nx.addr, align 4, !dbg !990
  %1 = load i32, i32* %ny.addr, align 4, !dbg !991
  %mul = mul nsw i32 %0, %1, !dbg !992
  %conv = sext i32 %mul to i64, !dbg !990
  %mul1 = mul i64 %conv, 8, !dbg !993
  %call = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_ex, i64 %mul1), !dbg !994
  %2 = load i32, i32* %nx.addr, align 4, !dbg !995
  %3 = load i32, i32* %ny.addr, align 4, !dbg !996
  %mul2 = mul nsw i32 %2, %3, !dbg !997
  %conv3 = sext i32 %mul2 to i64, !dbg !995
  %mul4 = mul i64 %conv3, 8, !dbg !998
  %call5 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_ey, i64 %mul4), !dbg !999
  %4 = load i32, i32* %nx.addr, align 4, !dbg !1000
  %5 = load i32, i32* %ny.addr, align 4, !dbg !1001
  %mul6 = mul nsw i32 %4, %5, !dbg !1002
  %conv7 = sext i32 %mul6 to i64, !dbg !1000
  %mul8 = mul i64 %conv7, 8, !dbg !1003
  %call9 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_hz, i64 %mul8), !dbg !1004
  %6 = load i32, i32* %ny.addr, align 4, !dbg !1005
  %conv10 = sext i32 %6 to i64, !dbg !1005
  %mul11 = mul i64 %conv10, 8, !dbg !1006
  %call12 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_fict, i64 %mul11), !dbg !1007
  %7 = load double*, double** %dev_ex, align 8, !dbg !1008
  %8 = bitcast double* %7 to i8*, !dbg !1008
  %9 = load double*, double** %ex.addr, align 8, !dbg !1009
  %10 = bitcast double* %9 to i8*, !dbg !1009
  %11 = load i32, i32* %nx.addr, align 4, !dbg !1010
  %12 = load i32, i32* %ny.addr, align 4, !dbg !1011
  %mul13 = mul nsw i32 %11, %12, !dbg !1012
  %conv14 = sext i32 %mul13 to i64, !dbg !1010
  %mul15 = mul i64 %conv14, 8, !dbg !1013
  %call16 = call i32 @cudaMemcpy(i8* %8, i8* %10, i64 %mul15, i32 1), !dbg !1014
  %13 = load double*, double** %dev_ey, align 8, !dbg !1015
  %14 = bitcast double* %13 to i8*, !dbg !1015
  %15 = load double*, double** %ey.addr, align 8, !dbg !1016
  %16 = bitcast double* %15 to i8*, !dbg !1016
  %17 = load i32, i32* %nx.addr, align 4, !dbg !1017
  %18 = load i32, i32* %ny.addr, align 4, !dbg !1018
  %mul17 = mul nsw i32 %17, %18, !dbg !1019
  %conv18 = sext i32 %mul17 to i64, !dbg !1017
  %mul19 = mul i64 %conv18, 8, !dbg !1020
  %call20 = call i32 @cudaMemcpy(i8* %14, i8* %16, i64 %mul19, i32 1), !dbg !1021
  %19 = load double*, double** %dev_hz, align 8, !dbg !1022
  %20 = bitcast double* %19 to i8*, !dbg !1022
  %21 = load double*, double** %hz.addr, align 8, !dbg !1023
  %22 = bitcast double* %21 to i8*, !dbg !1023
  %23 = load i32, i32* %nx.addr, align 4, !dbg !1024
  %24 = load i32, i32* %ny.addr, align 4, !dbg !1025
  %mul21 = mul nsw i32 %23, %24, !dbg !1026
  %conv22 = sext i32 %mul21 to i64, !dbg !1024
  %mul23 = mul i64 %conv22, 8, !dbg !1027
  %call24 = call i32 @cudaMemcpy(i8* %20, i8* %22, i64 %mul23, i32 1), !dbg !1028
  %25 = load double*, double** %dev_fict, align 8, !dbg !1029
  %26 = bitcast double* %25 to i8*, !dbg !1029
  %27 = load double*, double** %fict.addr, align 8, !dbg !1030
  %28 = bitcast double* %27 to i8*, !dbg !1030
  %29 = load i32, i32* %ny.addr, align 4, !dbg !1031
  %conv25 = sext i32 %29 to i64, !dbg !1031
  %mul26 = mul i64 %conv25, 8, !dbg !1032
  %call27 = call i32 @cudaMemcpy(i8* %26, i8* %28, i64 %mul26, i32 1), !dbg !1033
  call void @llvm.dbg.declare(metadata i32* %t, metadata !1034, metadata !DIExpression()), !dbg !1036
  store i32 0, i32* %t, align 4, !dbg !1036
  br label %for.cond, !dbg !1037

for.cond:                                         ; preds = %for.inc, %entry
  %30 = load i32, i32* %t, align 4, !dbg !1038
  %31 = load i32, i32* %tmax.addr, align 4, !dbg !1040
  %cmp = icmp slt i32 %30, %31, !dbg !1041
  br i1 %cmp, label %for.body, label %for.end, !dbg !1042

for.body:                                         ; preds = %for.cond
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 256, i32 1, i32 1), !dbg !1043
  %32 = load i32, i32* %ny.addr, align 4, !dbg !1045
  %call29 = call i32 @_ZL10num_blocksii(i32 %32, i32 256), !dbg !1046
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp28, i32 %call29, i32 1, i32 1), !dbg !1046
  %33 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1047
  %34 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1047
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %33, i8* align 4 %34, i64 12, i1 false), !dbg !1047
  %35 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1047
  %36 = load i64, i64* %35, align 4, !dbg !1047
  %37 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1047
  %38 = load i32, i32* %37, align 4, !dbg !1047
  %39 = bitcast { i64, i32 }* %agg.tmp28.coerce to i8*, !dbg !1047
  %40 = bitcast %struct.dim3* %agg.tmp28 to i8*, !dbg !1047
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %39, i8* align 4 %40, i64 12, i1 false), !dbg !1047
  %41 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp28.coerce, i32 0, i32 0, !dbg !1047
  %42 = load i64, i64* %41, align 4, !dbg !1047
  %43 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp28.coerce, i32 0, i32 1, !dbg !1047
  %44 = load i32, i32* %43, align 4, !dbg !1047
  %call30 = call i32 @cudaConfigureCall(i64 %36, i32 %38, i64 %42, i32 %44, i64 0, %struct.CUstream_st* null), !dbg !1047
  %tobool = icmp ne i32 %call30, 0, !dbg !1047
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !1048

kcall.configok:                                   ; preds = %for.body
  %45 = load i32, i32* %tmax.addr, align 4, !dbg !1049
  %46 = load i32, i32* %nx.addr, align 4, !dbg !1050
  %47 = load i32, i32* %ny.addr, align 4, !dbg !1051
  %48 = load double*, double** %dev_ex, align 8, !dbg !1052
  %49 = load double*, double** %dev_ey, align 8, !dbg !1053
  %50 = load double*, double** %dev_hz, align 8, !dbg !1054
  %51 = load double*, double** %dev_fict, align 8, !dbg !1055
  %52 = load i32, i32* %t, align 4, !dbg !1056
  call void @_Z12kernel_splatiiiPdS_S_S_i(i32 %45, i32 %46, i32 %47, double* %48, double* %49, double* %50, double* %51, i32 %52), !dbg !1048
  br label %kcall.end, !dbg !1048

kcall.end:                                        ; preds = %kcall.configok, %for.body
  call void @llvm.dbg.declare(metadata %struct.dim3* %block, metadata !1057, metadata !DIExpression()), !dbg !1082
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %block, i32 8, i32 32, i32 1), !dbg !1082
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid, metadata !1083, metadata !DIExpression()), !dbg !1084
  %53 = load i32, i32* %nx.addr, align 4, !dbg !1085
  %sub = sub nsw i32 %53, 1, !dbg !1086
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 0, !dbg !1087
  %54 = load i32, i32* %x, align 4, !dbg !1087
  %call31 = call i32 @_ZL10num_blocksii(i32 %sub, i32 %54), !dbg !1088
  %55 = load i32, i32* %ny.addr, align 4, !dbg !1089
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 1, !dbg !1090
  %56 = load i32, i32* %y, align 4, !dbg !1090
  %call32 = call i32 @_ZL10num_blocksii(i32 %55, i32 %56), !dbg !1091
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid, i32 %call31, i32 %call32, i32 1), !dbg !1084
  %57 = bitcast %struct.dim3* %agg.tmp33 to i8*, !dbg !1092
  %58 = bitcast %struct.dim3* %grid to i8*, !dbg !1092
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %57, i8* align 4 %58, i64 12, i1 false), !dbg !1092
  %59 = bitcast %struct.dim3* %agg.tmp34 to i8*, !dbg !1093
  %60 = bitcast %struct.dim3* %block to i8*, !dbg !1093
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %59, i8* align 4 %60, i64 12, i1 false), !dbg !1093
  %61 = bitcast { i64, i32 }* %agg.tmp33.coerce to i8*, !dbg !1094
  %62 = bitcast %struct.dim3* %agg.tmp33 to i8*, !dbg !1094
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %61, i8* align 4 %62, i64 12, i1 false), !dbg !1094
  %63 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp33.coerce, i32 0, i32 0, !dbg !1094
  %64 = load i64, i64* %63, align 4, !dbg !1094
  %65 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp33.coerce, i32 0, i32 1, !dbg !1094
  %66 = load i32, i32* %65, align 4, !dbg !1094
  %67 = bitcast { i64, i32 }* %agg.tmp34.coerce to i8*, !dbg !1094
  %68 = bitcast %struct.dim3* %agg.tmp34 to i8*, !dbg !1094
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %67, i8* align 4 %68, i64 12, i1 false), !dbg !1094
  %69 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp34.coerce, i32 0, i32 0, !dbg !1094
  %70 = load i64, i64* %69, align 4, !dbg !1094
  %71 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp34.coerce, i32 0, i32 1, !dbg !1094
  %72 = load i32, i32* %71, align 4, !dbg !1094
  %call35 = call i32 @cudaConfigureCall(i64 %64, i32 %66, i64 %70, i32 %72, i64 0, %struct.CUstream_st* null), !dbg !1094
  %tobool36 = icmp ne i32 %call35, 0, !dbg !1094
  br i1 %tobool36, label %kcall.end38, label %kcall.configok37, !dbg !1095

kcall.configok37:                                 ; preds = %kcall.end
  %73 = load i32, i32* %tmax.addr, align 4, !dbg !1096
  %74 = load i32, i32* %nx.addr, align 4, !dbg !1097
  %75 = load i32, i32* %ny.addr, align 4, !dbg !1098
  %76 = load double*, double** %dev_ex, align 8, !dbg !1099
  %77 = load double*, double** %dev_ey, align 8, !dbg !1100
  %78 = load double*, double** %dev_hz, align 8, !dbg !1101
  %79 = load double*, double** %dev_fict, align 8, !dbg !1102
  %80 = load i32, i32* %t, align 4, !dbg !1103
  call void @_Z9kernel_eyiiiPdS_S_S_i(i32 %73, i32 %74, i32 %75, double* %76, double* %77, double* %78, double* %79, i32 %80), !dbg !1095
  br label %kcall.end38, !dbg !1095

kcall.end38:                                      ; preds = %kcall.configok37, %kcall.end
  call void @llvm.dbg.declare(metadata %struct.dim3* %block39, metadata !1104, metadata !DIExpression()), !dbg !1106
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %block39, i32 8, i32 32, i32 1), !dbg !1106
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid40, metadata !1107, metadata !DIExpression()), !dbg !1108
  %81 = load i32, i32* %nx.addr, align 4, !dbg !1109
  %x41 = getelementptr inbounds %struct.dim3, %struct.dim3* %block39, i32 0, i32 0, !dbg !1110
  %82 = load i32, i32* %x41, align 4, !dbg !1110
  %call42 = call i32 @_ZL10num_blocksii(i32 %81, i32 %82), !dbg !1111
  %83 = load i32, i32* %ny.addr, align 4, !dbg !1112
  %sub43 = sub nsw i32 %83, 1, !dbg !1113
  %y44 = getelementptr inbounds %struct.dim3, %struct.dim3* %block39, i32 0, i32 1, !dbg !1114
  %84 = load i32, i32* %y44, align 4, !dbg !1114
  %call45 = call i32 @_ZL10num_blocksii(i32 %sub43, i32 %84), !dbg !1115
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid40, i32 %call42, i32 %call45, i32 1), !dbg !1108
  %85 = bitcast %struct.dim3* %agg.tmp46 to i8*, !dbg !1116
  %86 = bitcast %struct.dim3* %grid40 to i8*, !dbg !1116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %85, i8* align 4 %86, i64 12, i1 false), !dbg !1116
  %87 = bitcast %struct.dim3* %agg.tmp47 to i8*, !dbg !1117
  %88 = bitcast %struct.dim3* %block39 to i8*, !dbg !1117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %87, i8* align 4 %88, i64 12, i1 false), !dbg !1117
  %89 = bitcast { i64, i32 }* %agg.tmp46.coerce to i8*, !dbg !1118
  %90 = bitcast %struct.dim3* %agg.tmp46 to i8*, !dbg !1118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %89, i8* align 4 %90, i64 12, i1 false), !dbg !1118
  %91 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp46.coerce, i32 0, i32 0, !dbg !1118
  %92 = load i64, i64* %91, align 4, !dbg !1118
  %93 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp46.coerce, i32 0, i32 1, !dbg !1118
  %94 = load i32, i32* %93, align 4, !dbg !1118
  %95 = bitcast { i64, i32 }* %agg.tmp47.coerce to i8*, !dbg !1118
  %96 = bitcast %struct.dim3* %agg.tmp47 to i8*, !dbg !1118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %95, i8* align 4 %96, i64 12, i1 false), !dbg !1118
  %97 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp47.coerce, i32 0, i32 0, !dbg !1118
  %98 = load i64, i64* %97, align 4, !dbg !1118
  %99 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp47.coerce, i32 0, i32 1, !dbg !1118
  %100 = load i32, i32* %99, align 4, !dbg !1118
  %call48 = call i32 @cudaConfigureCall(i64 %92, i32 %94, i64 %98, i32 %100, i64 0, %struct.CUstream_st* null), !dbg !1118
  %tobool49 = icmp ne i32 %call48, 0, !dbg !1118
  br i1 %tobool49, label %kcall.end51, label %kcall.configok50, !dbg !1119

kcall.configok50:                                 ; preds = %kcall.end38
  %101 = load i32, i32* %tmax.addr, align 4, !dbg !1120
  %102 = load i32, i32* %nx.addr, align 4, !dbg !1121
  %103 = load i32, i32* %ny.addr, align 4, !dbg !1122
  %104 = load double*, double** %dev_ex, align 8, !dbg !1123
  %105 = load double*, double** %dev_ey, align 8, !dbg !1124
  %106 = load double*, double** %dev_hz, align 8, !dbg !1125
  %107 = load double*, double** %dev_fict, align 8, !dbg !1126
  %108 = load i32, i32* %t, align 4, !dbg !1127
  call void @_Z9kernel_exiiiPdS_S_S_i(i32 %101, i32 %102, i32 %103, double* %104, double* %105, double* %106, double* %107, i32 %108), !dbg !1119
  br label %kcall.end51, !dbg !1119

kcall.end51:                                      ; preds = %kcall.configok50, %kcall.end38
  call void @llvm.dbg.declare(metadata %struct.dim3* %block52, metadata !1128, metadata !DIExpression()), !dbg !1130
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %block52, i32 8, i32 32, i32 1), !dbg !1130
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid53, metadata !1131, metadata !DIExpression()), !dbg !1132
  %109 = load i32, i32* %nx.addr, align 4, !dbg !1133
  %sub54 = sub nsw i32 %109, 1, !dbg !1134
  %x55 = getelementptr inbounds %struct.dim3, %struct.dim3* %block52, i32 0, i32 0, !dbg !1135
  %110 = load i32, i32* %x55, align 4, !dbg !1135
  %call56 = call i32 @_ZL10num_blocksii(i32 %sub54, i32 %110), !dbg !1136
  %111 = load i32, i32* %ny.addr, align 4, !dbg !1137
  %sub57 = sub nsw i32 %111, 1, !dbg !1138
  %y58 = getelementptr inbounds %struct.dim3, %struct.dim3* %block52, i32 0, i32 1, !dbg !1139
  %112 = load i32, i32* %y58, align 4, !dbg !1139
  %call59 = call i32 @_ZL10num_blocksii(i32 %sub57, i32 %112), !dbg !1140
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid53, i32 %call56, i32 %call59, i32 1), !dbg !1132
  %113 = bitcast %struct.dim3* %agg.tmp60 to i8*, !dbg !1141
  %114 = bitcast %struct.dim3* %grid53 to i8*, !dbg !1141
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %113, i8* align 4 %114, i64 12, i1 false), !dbg !1141
  %115 = bitcast %struct.dim3* %agg.tmp61 to i8*, !dbg !1142
  %116 = bitcast %struct.dim3* %block52 to i8*, !dbg !1142
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %115, i8* align 4 %116, i64 12, i1 false), !dbg !1142
  %117 = bitcast { i64, i32 }* %agg.tmp60.coerce to i8*, !dbg !1143
  %118 = bitcast %struct.dim3* %agg.tmp60 to i8*, !dbg !1143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %117, i8* align 4 %118, i64 12, i1 false), !dbg !1143
  %119 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp60.coerce, i32 0, i32 0, !dbg !1143
  %120 = load i64, i64* %119, align 4, !dbg !1143
  %121 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp60.coerce, i32 0, i32 1, !dbg !1143
  %122 = load i32, i32* %121, align 4, !dbg !1143
  %123 = bitcast { i64, i32 }* %agg.tmp61.coerce to i8*, !dbg !1143
  %124 = bitcast %struct.dim3* %agg.tmp61 to i8*, !dbg !1143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %123, i8* align 4 %124, i64 12, i1 false), !dbg !1143
  %125 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp61.coerce, i32 0, i32 0, !dbg !1143
  %126 = load i64, i64* %125, align 4, !dbg !1143
  %127 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp61.coerce, i32 0, i32 1, !dbg !1143
  %128 = load i32, i32* %127, align 4, !dbg !1143
  %call62 = call i32 @cudaConfigureCall(i64 %120, i32 %122, i64 %126, i32 %128, i64 0, %struct.CUstream_st* null), !dbg !1143
  %tobool63 = icmp ne i32 %call62, 0, !dbg !1143
  br i1 %tobool63, label %kcall.end65, label %kcall.configok64, !dbg !1144

kcall.configok64:                                 ; preds = %kcall.end51
  %129 = load i32, i32* %tmax.addr, align 4, !dbg !1145
  %130 = load i32, i32* %nx.addr, align 4, !dbg !1146
  %131 = load i32, i32* %ny.addr, align 4, !dbg !1147
  %132 = load double*, double** %dev_ex, align 8, !dbg !1148
  %133 = load double*, double** %dev_ey, align 8, !dbg !1149
  %134 = load double*, double** %dev_hz, align 8, !dbg !1150
  %135 = load double*, double** %dev_fict, align 8, !dbg !1151
  %136 = load i32, i32* %t, align 4, !dbg !1152
  call void @_Z9kernel_hziiiPdS_S_S_i(i32 %129, i32 %130, i32 %131, double* %132, double* %133, double* %134, double* %135, i32 %136), !dbg !1144
  br label %kcall.end65, !dbg !1144

kcall.end65:                                      ; preds = %kcall.configok64, %kcall.end51
  br label %for.inc, !dbg !1153

for.inc:                                          ; preds = %kcall.end65
  %137 = load i32, i32* %t, align 4, !dbg !1154
  %inc = add nsw i32 %137, 1, !dbg !1154
  store i32 %inc, i32* %t, align 4, !dbg !1154
  br label %for.cond, !dbg !1155, !llvm.loop !1156

for.end:                                          ; preds = %for.cond
  %138 = load double*, double** %ex.addr, align 8, !dbg !1158
  %139 = bitcast double* %138 to i8*, !dbg !1158
  %140 = load double*, double** %dev_ex, align 8, !dbg !1159
  %141 = bitcast double* %140 to i8*, !dbg !1159
  %142 = load i32, i32* %nx.addr, align 4, !dbg !1160
  %143 = load i32, i32* %ny.addr, align 4, !dbg !1161
  %mul66 = mul nsw i32 %142, %143, !dbg !1162
  %conv67 = sext i32 %mul66 to i64, !dbg !1160
  %mul68 = mul i64 %conv67, 8, !dbg !1163
  %call69 = call i32 @cudaMemcpy(i8* %139, i8* %141, i64 %mul68, i32 2), !dbg !1164
  %144 = load double*, double** %ey.addr, align 8, !dbg !1165
  %145 = bitcast double* %144 to i8*, !dbg !1165
  %146 = load double*, double** %dev_ey, align 8, !dbg !1166
  %147 = bitcast double* %146 to i8*, !dbg !1166
  %148 = load i32, i32* %nx.addr, align 4, !dbg !1167
  %149 = load i32, i32* %ny.addr, align 4, !dbg !1168
  %mul70 = mul nsw i32 %148, %149, !dbg !1169
  %conv71 = sext i32 %mul70 to i64, !dbg !1167
  %mul72 = mul i64 %conv71, 8, !dbg !1170
  %call73 = call i32 @cudaMemcpy(i8* %145, i8* %147, i64 %mul72, i32 2), !dbg !1171
  %150 = load double*, double** %hz.addr, align 8, !dbg !1172
  %151 = bitcast double* %150 to i8*, !dbg !1172
  %152 = load double*, double** %dev_hz, align 8, !dbg !1173
  %153 = bitcast double* %152 to i8*, !dbg !1173
  %154 = load i32, i32* %nx.addr, align 4, !dbg !1174
  %155 = load i32, i32* %ny.addr, align 4, !dbg !1175
  %mul74 = mul nsw i32 %154, %155, !dbg !1176
  %conv75 = sext i32 %mul74 to i64, !dbg !1174
  %mul76 = mul i64 %conv75, 8, !dbg !1177
  %call77 = call i32 @cudaMemcpy(i8* %151, i8* %153, i64 %mul76, i32 2), !dbg !1178
  ret void, !dbg !1179
}

; Function Attrs: noinline uwtable
define internal void @_ZL11print_arrayiiPdS_S_(i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz) #0 !dbg !1180 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !1183, metadata !DIExpression()), !dbg !1184
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !1185, metadata !DIExpression()), !dbg !1186
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !1187, metadata !DIExpression()), !dbg !1188
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !1189, metadata !DIExpression()), !dbg !1190
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !1191, metadata !DIExpression()), !dbg !1192
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1193, metadata !DIExpression()), !dbg !1194
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1195, metadata !DIExpression()), !dbg !1196
  store i32 0, i32* %i, align 4, !dbg !1197
  br label %for.cond, !dbg !1199

for.cond:                                         ; preds = %for.inc18, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1200
  %1 = load i32, i32* %nx.addr, align 4, !dbg !1202
  %cmp = icmp slt i32 %0, %1, !dbg !1203
  br i1 %cmp, label %for.body, label %for.end20, !dbg !1204

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !1205
  br label %for.cond1, !dbg !1207

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !1208
  %3 = load i32, i32* %ny.addr, align 4, !dbg !1210
  %cmp2 = icmp slt i32 %2, %3, !dbg !1211
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1212

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1213
  %5 = load double*, double** %ex.addr, align 8, !dbg !1215
  %6 = load i32, i32* %i, align 4, !dbg !1216
  %7 = load i32, i32* %ny.addr, align 4, !dbg !1217
  %mul = mul nsw i32 %6, %7, !dbg !1218
  %8 = load i32, i32* %j, align 4, !dbg !1219
  %add = add nsw i32 %mul, %8, !dbg !1220
  %idxprom = sext i32 %add to i64, !dbg !1215
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom, !dbg !1215
  %9 = load double, double* %arrayidx, align 8, !dbg !1215
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %9), !dbg !1221
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1222
  %11 = load double*, double** %ey.addr, align 8, !dbg !1223
  %12 = load i32, i32* %i, align 4, !dbg !1224
  %13 = load i32, i32* %ny.addr, align 4, !dbg !1225
  %mul4 = mul nsw i32 %12, %13, !dbg !1226
  %14 = load i32, i32* %j, align 4, !dbg !1227
  %add5 = add nsw i32 %mul4, %14, !dbg !1228
  %idxprom6 = sext i32 %add5 to i64, !dbg !1223
  %arrayidx7 = getelementptr inbounds double, double* %11, i64 %idxprom6, !dbg !1223
  %15 = load double, double* %arrayidx7, align 8, !dbg !1223
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %15), !dbg !1229
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1230
  %17 = load double*, double** %hz.addr, align 8, !dbg !1231
  %18 = load i32, i32* %i, align 4, !dbg !1232
  %19 = load i32, i32* %ny.addr, align 4, !dbg !1233
  %mul9 = mul nsw i32 %18, %19, !dbg !1234
  %20 = load i32, i32* %j, align 4, !dbg !1235
  %add10 = add nsw i32 %mul9, %20, !dbg !1236
  %idxprom11 = sext i32 %add10 to i64, !dbg !1231
  %arrayidx12 = getelementptr inbounds double, double* %17, i64 %idxprom11, !dbg !1231
  %21 = load double, double* %arrayidx12, align 8, !dbg !1231
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %21), !dbg !1237
  %22 = load i32, i32* %i, align 4, !dbg !1238
  %23 = load i32, i32* %nx.addr, align 4, !dbg !1240
  %mul14 = mul nsw i32 %22, %23, !dbg !1241
  %24 = load i32, i32* %j, align 4, !dbg !1242
  %add15 = add nsw i32 %mul14, %24, !dbg !1243
  %rem = srem i32 %add15, 20, !dbg !1244
  %cmp16 = icmp eq i32 %rem, 0, !dbg !1245
  br i1 %cmp16, label %if.then, label %if.end, !dbg !1246

if.then:                                          ; preds = %for.body3
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1247
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1248
  br label %if.end, !dbg !1248

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !1249

for.inc:                                          ; preds = %if.end
  %26 = load i32, i32* %j, align 4, !dbg !1250
  %inc = add nsw i32 %26, 1, !dbg !1250
  store i32 %inc, i32* %j, align 4, !dbg !1250
  br label %for.cond1, !dbg !1251, !llvm.loop !1252

for.end:                                          ; preds = %for.cond1
  br label %for.inc18, !dbg !1253

for.inc18:                                        ; preds = %for.end
  %27 = load i32, i32* %i, align 4, !dbg !1254
  %inc19 = add nsw i32 %27, 1, !dbg !1254
  store i32 %inc19, i32* %i, align 4, !dbg !1254
  br label %for.cond, !dbg !1255, !llvm.loop !1256

for.end20:                                        ; preds = %for.cond
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1258
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1259
  ret void, !dbg !1260
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline uwtable
define internal i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %devPtr, i64 %size) #0 !dbg !1261 {
entry:
  %devPtr.addr = alloca double**, align 8
  %size.addr = alloca i64, align 8
  store double** %devPtr, double*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %devPtr.addr, metadata !1269, metadata !DIExpression()), !dbg !1270
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !1271, metadata !DIExpression()), !dbg !1272
  %0 = load double**, double*** %devPtr.addr, align 8, !dbg !1273
  %1 = bitcast double** %0 to i8*, !dbg !1273
  %2 = bitcast i8* %1 to i8**, !dbg !1274
  %3 = load i64, i64* %size.addr, align 8, !dbg !1275
  %call = call i32 @cudaMalloc(i8** %2, i64 %3), !dbg !1276
  ret i32 %call, !dbg !1277
}

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #6

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #6

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #5 comdat align 2 !dbg !1278 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1279, metadata !DIExpression()), !dbg !1281
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1282, metadata !DIExpression()), !dbg !1283
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1284, metadata !DIExpression()), !dbg !1285
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1286, metadata !DIExpression()), !dbg !1287
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1288
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1289
  store i32 %0, i32* %x, align 4, !dbg !1288
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1290
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1291
  store i32 %1, i32* %y, align 4, !dbg !1290
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1292
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1293
  store i32 %2, i32* %z, align 4, !dbg !1292
  ret void, !dbg !1294
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_ZL10num_blocksii(i32 %num, i32 %factor) #5 !dbg !1295 {
entry:
  %num.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1298, metadata !DIExpression()), !dbg !1299
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1300, metadata !DIExpression()), !dbg !1301
  %0 = load i32, i32* %num.addr, align 4, !dbg !1302
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1303
  %add = add nsw i32 %0, %1, !dbg !1304
  %sub = sub nsw i32 %add, 1, !dbg !1305
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1306
  %div = sdiv i32 %sub, %2, !dbg !1307
  ret i32 %div, !dbg !1308
}

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
!5 = !DIFile(filename: "fdtd-2d.cu", directory: "/u/NAS_SCRATCH/yc0769/xstack-benchmark/polybench-cuda/fdtd-2d")
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
!692 = distinct !DISubprogram(name: "kernel_splat", linkageName: "_Z12kernel_splatiiiPdS_S_S_i", scope: !5, file: !5, line: 23, type: !693, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !110, !110, !110, !99, !99, !99, !99, !110}
!695 = !{}
!696 = !DILocalVariable(name: "tmax", arg: 1, scope: !692, file: !5, line: 23, type: !110)
!697 = !DILocation(line: 23, column: 34, scope: !692)
!698 = !DILocalVariable(name: "nx", arg: 2, scope: !692, file: !5, line: 24, type: !110)
!699 = !DILocation(line: 24, column: 34, scope: !692)
!700 = !DILocalVariable(name: "ny", arg: 3, scope: !692, file: !5, line: 25, type: !110)
!701 = !DILocation(line: 25, column: 34, scope: !692)
!702 = !DILocalVariable(name: "ex", arg: 4, scope: !692, file: !5, line: 26, type: !99)
!703 = !DILocation(line: 26, column: 38, scope: !692)
!704 = !DILocalVariable(name: "ey", arg: 5, scope: !692, file: !5, line: 26, type: !99)
!705 = !DILocation(line: 26, column: 50, scope: !692)
!706 = !DILocalVariable(name: "hz", arg: 6, scope: !692, file: !5, line: 26, type: !99)
!707 = !DILocation(line: 26, column: 62, scope: !692)
!708 = !DILocalVariable(name: "fict", arg: 7, scope: !692, file: !5, line: 26, type: !99)
!709 = !DILocation(line: 26, column: 73, scope: !692)
!710 = !DILocalVariable(name: "t", arg: 8, scope: !692, file: !5, line: 26, type: !110)
!711 = !DILocation(line: 26, column: 85, scope: !692)
!712 = !DILocation(line: 26, column: 88, scope: !692)
!713 = !DILocation(line: 31, column: 1, scope: !692)
!714 = distinct !DISubprogram(name: "kernel_ey", linkageName: "_Z9kernel_eyiiiPdS_S_S_i", scope: !5, file: !5, line: 34, type: !693, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!715 = !DILocalVariable(name: "tmax", arg: 1, scope: !714, file: !5, line: 34, type: !110)
!716 = !DILocation(line: 34, column: 31, scope: !714)
!717 = !DILocalVariable(name: "nx", arg: 2, scope: !714, file: !5, line: 35, type: !110)
!718 = !DILocation(line: 35, column: 31, scope: !714)
!719 = !DILocalVariable(name: "ny", arg: 3, scope: !714, file: !5, line: 36, type: !110)
!720 = !DILocation(line: 36, column: 31, scope: !714)
!721 = !DILocalVariable(name: "ex", arg: 4, scope: !714, file: !5, line: 37, type: !99)
!722 = !DILocation(line: 37, column: 35, scope: !714)
!723 = !DILocalVariable(name: "ey", arg: 5, scope: !714, file: !5, line: 37, type: !99)
!724 = !DILocation(line: 37, column: 47, scope: !714)
!725 = !DILocalVariable(name: "hz", arg: 6, scope: !714, file: !5, line: 37, type: !99)
!726 = !DILocation(line: 37, column: 59, scope: !714)
!727 = !DILocalVariable(name: "fict", arg: 7, scope: !714, file: !5, line: 37, type: !99)
!728 = !DILocation(line: 37, column: 70, scope: !714)
!729 = !DILocalVariable(name: "t", arg: 8, scope: !714, file: !5, line: 37, type: !110)
!730 = !DILocation(line: 37, column: 82, scope: !714)
!731 = !DILocation(line: 37, column: 85, scope: !714)
!732 = !DILocation(line: 43, column: 1, scope: !714)
!733 = distinct !DISubprogram(name: "kernel_ex", linkageName: "_Z9kernel_exiiiPdS_S_S_i", scope: !5, file: !5, line: 47, type: !693, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!734 = !DILocalVariable(name: "tmax", arg: 1, scope: !733, file: !5, line: 47, type: !110)
!735 = !DILocation(line: 47, column: 31, scope: !733)
!736 = !DILocalVariable(name: "nx", arg: 2, scope: !733, file: !5, line: 48, type: !110)
!737 = !DILocation(line: 48, column: 31, scope: !733)
!738 = !DILocalVariable(name: "ny", arg: 3, scope: !733, file: !5, line: 49, type: !110)
!739 = !DILocation(line: 49, column: 31, scope: !733)
!740 = !DILocalVariable(name: "ex", arg: 4, scope: !733, file: !5, line: 50, type: !99)
!741 = !DILocation(line: 50, column: 35, scope: !733)
!742 = !DILocalVariable(name: "ey", arg: 5, scope: !733, file: !5, line: 50, type: !99)
!743 = !DILocation(line: 50, column: 47, scope: !733)
!744 = !DILocalVariable(name: "hz", arg: 6, scope: !733, file: !5, line: 50, type: !99)
!745 = !DILocation(line: 50, column: 59, scope: !733)
!746 = !DILocalVariable(name: "fict", arg: 7, scope: !733, file: !5, line: 50, type: !99)
!747 = !DILocation(line: 50, column: 70, scope: !733)
!748 = !DILocalVariable(name: "t", arg: 8, scope: !733, file: !5, line: 50, type: !110)
!749 = !DILocation(line: 50, column: 82, scope: !733)
!750 = !DILocation(line: 50, column: 85, scope: !733)
!751 = !DILocation(line: 56, column: 1, scope: !733)
!752 = distinct !DISubprogram(name: "kernel_hz", linkageName: "_Z9kernel_hziiiPdS_S_S_i", scope: !5, file: !5, line: 60, type: !693, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!753 = !DILocalVariable(name: "tmax", arg: 1, scope: !752, file: !5, line: 60, type: !110)
!754 = !DILocation(line: 60, column: 31, scope: !752)
!755 = !DILocalVariable(name: "nx", arg: 2, scope: !752, file: !5, line: 61, type: !110)
!756 = !DILocation(line: 61, column: 31, scope: !752)
!757 = !DILocalVariable(name: "ny", arg: 3, scope: !752, file: !5, line: 62, type: !110)
!758 = !DILocation(line: 62, column: 31, scope: !752)
!759 = !DILocalVariable(name: "ex", arg: 4, scope: !752, file: !5, line: 63, type: !99)
!760 = !DILocation(line: 63, column: 35, scope: !752)
!761 = !DILocalVariable(name: "ey", arg: 5, scope: !752, file: !5, line: 63, type: !99)
!762 = !DILocation(line: 63, column: 47, scope: !752)
!763 = !DILocalVariable(name: "hz", arg: 6, scope: !752, file: !5, line: 63, type: !99)
!764 = !DILocation(line: 63, column: 59, scope: !752)
!765 = !DILocalVariable(name: "fict", arg: 7, scope: !752, file: !5, line: 63, type: !99)
!766 = !DILocation(line: 63, column: 70, scope: !752)
!767 = !DILocalVariable(name: "t", arg: 8, scope: !752, file: !5, line: 63, type: !110)
!768 = !DILocation(line: 63, column: 82, scope: !752)
!769 = !DILocation(line: 63, column: 85, scope: !752)
!770 = !DILocation(line: 69, column: 1, scope: !752)
!771 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 195, type: !772, scopeLine: 196, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!772 = !DISubroutineType(types: !773)
!773 = !{!110, !110, !466}
!774 = !DILocalVariable(name: "argc", arg: 1, scope: !771, file: !5, line: 195, type: !110)
!775 = !DILocation(line: 195, column: 14, scope: !771)
!776 = !DILocalVariable(name: "argv", arg: 2, scope: !771, file: !5, line: 195, type: !466)
!777 = !DILocation(line: 195, column: 27, scope: !771)
!778 = !DILocalVariable(name: "tmax", scope: !771, file: !5, line: 198, type: !110)
!779 = !DILocation(line: 198, column: 7, scope: !771)
!780 = !DILocation(line: 198, column: 19, scope: !771)
!781 = !DILocation(line: 198, column: 14, scope: !771)
!782 = !DILocalVariable(name: "nx", scope: !771, file: !5, line: 199, type: !110)
!783 = !DILocation(line: 199, column: 7, scope: !771)
!784 = !DILocation(line: 199, column: 17, scope: !771)
!785 = !DILocation(line: 199, column: 12, scope: !771)
!786 = !DILocalVariable(name: "ny", scope: !771, file: !5, line: 200, type: !110)
!787 = !DILocation(line: 200, column: 7, scope: !771)
!788 = !DILocation(line: 200, column: 17, scope: !771)
!789 = !DILocation(line: 200, column: 12, scope: !771)
!790 = !DILocalVariable(name: "dump_code", scope: !771, file: !5, line: 201, type: !110)
!791 = !DILocation(line: 201, column: 7, scope: !771)
!792 = !DILocation(line: 201, column: 24, scope: !771)
!793 = !DILocation(line: 201, column: 19, scope: !771)
!794 = !DILocalVariable(name: "ex", scope: !771, file: !5, line: 204, type: !99)
!795 = !DILocation(line: 204, column: 11, scope: !771)
!796 = !DILocation(line: 204, column: 32, scope: !771)
!797 = !DILocation(line: 204, column: 35, scope: !771)
!798 = !DILocation(line: 204, column: 34, scope: !771)
!799 = !DILocation(line: 204, column: 37, scope: !771)
!800 = !DILocation(line: 204, column: 25, scope: !771)
!801 = !DILocation(line: 204, column: 16, scope: !771)
!802 = !DILocalVariable(name: "ey", scope: !771, file: !5, line: 205, type: !99)
!803 = !DILocation(line: 205, column: 11, scope: !771)
!804 = !DILocation(line: 205, column: 32, scope: !771)
!805 = !DILocation(line: 205, column: 35, scope: !771)
!806 = !DILocation(line: 205, column: 34, scope: !771)
!807 = !DILocation(line: 205, column: 37, scope: !771)
!808 = !DILocation(line: 205, column: 25, scope: !771)
!809 = !DILocation(line: 205, column: 16, scope: !771)
!810 = !DILocalVariable(name: "hz", scope: !771, file: !5, line: 206, type: !99)
!811 = !DILocation(line: 206, column: 11, scope: !771)
!812 = !DILocation(line: 206, column: 32, scope: !771)
!813 = !DILocation(line: 206, column: 35, scope: !771)
!814 = !DILocation(line: 206, column: 34, scope: !771)
!815 = !DILocation(line: 206, column: 37, scope: !771)
!816 = !DILocation(line: 206, column: 25, scope: !771)
!817 = !DILocation(line: 206, column: 16, scope: !771)
!818 = !DILocalVariable(name: "_fict_", scope: !771, file: !5, line: 207, type: !99)
!819 = !DILocation(line: 207, column: 11, scope: !771)
!820 = !DILocation(line: 207, column: 36, scope: !771)
!821 = !DILocation(line: 207, column: 38, scope: !771)
!822 = !DILocation(line: 207, column: 29, scope: !771)
!823 = !DILocation(line: 207, column: 20, scope: !771)
!824 = !DILocation(line: 210, column: 15, scope: !771)
!825 = !DILocation(line: 210, column: 19, scope: !771)
!826 = !DILocation(line: 211, column: 8, scope: !771)
!827 = !DILocation(line: 212, column: 8, scope: !771)
!828 = !DILocation(line: 213, column: 8, scope: !771)
!829 = !DILocation(line: 214, column: 8, scope: !771)
!830 = !DILocation(line: 210, column: 3, scope: !771)
!831 = !DILocation(line: 216, column: 10, scope: !771)
!832 = !DILocation(line: 216, column: 16, scope: !771)
!833 = !DILocation(line: 216, column: 20, scope: !771)
!834 = !DILocation(line: 216, column: 24, scope: !771)
!835 = !DILocation(line: 216, column: 28, scope: !771)
!836 = !DILocation(line: 216, column: 32, scope: !771)
!837 = !DILocation(line: 216, column: 36, scope: !771)
!838 = !DILocation(line: 216, column: 3, scope: !771)
!839 = !DILocation(line: 221, column: 6, scope: !840)
!840 = distinct !DILexicalBlock(scope: !771, file: !5, line: 221, column: 6)
!841 = !DILocation(line: 221, column: 16, scope: !840)
!842 = !DILocation(line: 221, column: 6, scope: !771)
!843 = !DILocation(line: 221, column: 34, scope: !840)
!844 = !DILocation(line: 221, column: 38, scope: !840)
!845 = !DILocation(line: 221, column: 42, scope: !840)
!846 = !DILocation(line: 221, column: 46, scope: !840)
!847 = !DILocation(line: 221, column: 50, scope: !840)
!848 = !DILocation(line: 221, column: 22, scope: !840)
!849 = !DILocation(line: 224, column: 15, scope: !771)
!850 = !DILocation(line: 224, column: 3, scope: !771)
!851 = !DILocation(line: 225, column: 15, scope: !771)
!852 = !DILocation(line: 225, column: 3, scope: !771)
!853 = !DILocation(line: 226, column: 15, scope: !771)
!854 = !DILocation(line: 226, column: 3, scope: !771)
!855 = !DILocation(line: 227, column: 15, scope: !771)
!856 = !DILocation(line: 227, column: 3, scope: !771)
!857 = !DILocation(line: 229, column: 3, scope: !771)
!858 = distinct !DISubprogram(name: "init_array", linkageName: "_ZL10init_arrayiiPdS_S_S_", scope: !5, file: !5, line: 121, type: !859, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!859 = !DISubroutineType(types: !860)
!860 = !{null, !110, !110, !99, !99, !99, !99}
!861 = !DILocalVariable(name: "nx", arg: 1, scope: !858, file: !5, line: 121, type: !110)
!862 = !DILocation(line: 121, column: 22, scope: !858)
!863 = !DILocalVariable(name: "ny", arg: 2, scope: !858, file: !5, line: 122, type: !110)
!864 = !DILocation(line: 122, column: 8, scope: !858)
!865 = !DILocalVariable(name: "ex", arg: 3, scope: !858, file: !5, line: 123, type: !99)
!866 = !DILocation(line: 123, column: 12, scope: !858)
!867 = !DILocalVariable(name: "ey", arg: 4, scope: !858, file: !5, line: 124, type: !99)
!868 = !DILocation(line: 124, column: 12, scope: !858)
!869 = !DILocalVariable(name: "hz", arg: 5, scope: !858, file: !5, line: 125, type: !99)
!870 = !DILocation(line: 125, column: 12, scope: !858)
!871 = !DILocalVariable(name: "_fict_", arg: 6, scope: !858, file: !5, line: 126, type: !99)
!872 = !DILocation(line: 126, column: 12, scope: !858)
!873 = !DILocalVariable(name: "i", scope: !858, file: !5, line: 128, type: !110)
!874 = !DILocation(line: 128, column: 7, scope: !858)
!875 = !DILocalVariable(name: "j", scope: !858, file: !5, line: 128, type: !110)
!876 = !DILocation(line: 128, column: 10, scope: !858)
!877 = !DILocation(line: 130, column: 10, scope: !878)
!878 = distinct !DILexicalBlock(scope: !858, file: !5, line: 130, column: 3)
!879 = !DILocation(line: 130, column: 8, scope: !878)
!880 = !DILocation(line: 130, column: 15, scope: !881)
!881 = distinct !DILexicalBlock(scope: !878, file: !5, line: 130, column: 3)
!882 = !DILocation(line: 130, column: 19, scope: !881)
!883 = !DILocation(line: 130, column: 17, scope: !881)
!884 = !DILocation(line: 130, column: 3, scope: !878)
!885 = !DILocation(line: 131, column: 26, scope: !881)
!886 = !DILocation(line: 131, column: 5, scope: !881)
!887 = !DILocation(line: 131, column: 12, scope: !881)
!888 = !DILocation(line: 131, column: 15, scope: !881)
!889 = !DILocation(line: 130, column: 24, scope: !881)
!890 = !DILocation(line: 130, column: 3, scope: !881)
!891 = distinct !{!891, !884, !892}
!892 = !DILocation(line: 131, column: 26, scope: !878)
!893 = !DILocation(line: 132, column: 10, scope: !894)
!894 = distinct !DILexicalBlock(scope: !858, file: !5, line: 132, column: 3)
!895 = !DILocation(line: 132, column: 8, scope: !894)
!896 = !DILocation(line: 132, column: 15, scope: !897)
!897 = distinct !DILexicalBlock(scope: !894, file: !5, line: 132, column: 3)
!898 = !DILocation(line: 132, column: 19, scope: !897)
!899 = !DILocation(line: 132, column: 17, scope: !897)
!900 = !DILocation(line: 132, column: 3, scope: !894)
!901 = !DILocation(line: 133, column: 12, scope: !902)
!902 = distinct !DILexicalBlock(scope: !897, file: !5, line: 133, column: 5)
!903 = !DILocation(line: 133, column: 10, scope: !902)
!904 = !DILocation(line: 133, column: 17, scope: !905)
!905 = distinct !DILexicalBlock(scope: !902, file: !5, line: 133, column: 5)
!906 = !DILocation(line: 133, column: 21, scope: !905)
!907 = !DILocation(line: 133, column: 19, scope: !905)
!908 = !DILocation(line: 133, column: 5, scope: !902)
!909 = !DILocation(line: 135, column: 29, scope: !910)
!910 = distinct !DILexicalBlock(scope: !905, file: !5, line: 134, column: 5)
!911 = !DILocation(line: 135, column: 32, scope: !910)
!912 = !DILocation(line: 135, column: 33, scope: !910)
!913 = !DILocation(line: 135, column: 31, scope: !910)
!914 = !DILocation(line: 135, column: 30, scope: !910)
!915 = !DILocation(line: 135, column: 40, scope: !910)
!916 = !DILocation(line: 135, column: 38, scope: !910)
!917 = !DILocation(line: 135, column: 6, scope: !910)
!918 = !DILocation(line: 135, column: 9, scope: !910)
!919 = !DILocation(line: 135, column: 11, scope: !910)
!920 = !DILocation(line: 135, column: 10, scope: !910)
!921 = !DILocation(line: 135, column: 14, scope: !910)
!922 = !DILocation(line: 135, column: 13, scope: !910)
!923 = !DILocation(line: 135, column: 17, scope: !910)
!924 = !DILocation(line: 136, column: 29, scope: !910)
!925 = !DILocation(line: 136, column: 32, scope: !910)
!926 = !DILocation(line: 136, column: 33, scope: !910)
!927 = !DILocation(line: 136, column: 31, scope: !910)
!928 = !DILocation(line: 136, column: 30, scope: !910)
!929 = !DILocation(line: 136, column: 40, scope: !910)
!930 = !DILocation(line: 136, column: 38, scope: !910)
!931 = !DILocation(line: 136, column: 6, scope: !910)
!932 = !DILocation(line: 136, column: 9, scope: !910)
!933 = !DILocation(line: 136, column: 11, scope: !910)
!934 = !DILocation(line: 136, column: 10, scope: !910)
!935 = !DILocation(line: 136, column: 14, scope: !910)
!936 = !DILocation(line: 136, column: 13, scope: !910)
!937 = !DILocation(line: 136, column: 17, scope: !910)
!938 = !DILocation(line: 137, column: 29, scope: !910)
!939 = !DILocation(line: 137, column: 32, scope: !910)
!940 = !DILocation(line: 137, column: 33, scope: !910)
!941 = !DILocation(line: 137, column: 31, scope: !910)
!942 = !DILocation(line: 137, column: 30, scope: !910)
!943 = !DILocation(line: 137, column: 40, scope: !910)
!944 = !DILocation(line: 137, column: 38, scope: !910)
!945 = !DILocation(line: 137, column: 6, scope: !910)
!946 = !DILocation(line: 137, column: 9, scope: !910)
!947 = !DILocation(line: 137, column: 11, scope: !910)
!948 = !DILocation(line: 137, column: 10, scope: !910)
!949 = !DILocation(line: 137, column: 14, scope: !910)
!950 = !DILocation(line: 137, column: 13, scope: !910)
!951 = !DILocation(line: 137, column: 17, scope: !910)
!952 = !DILocation(line: 138, column: 7, scope: !910)
!953 = !DILocation(line: 133, column: 26, scope: !905)
!954 = !DILocation(line: 133, column: 5, scope: !905)
!955 = distinct !{!955, !908, !956}
!956 = !DILocation(line: 138, column: 7, scope: !902)
!957 = !DILocation(line: 132, column: 24, scope: !897)
!958 = !DILocation(line: 132, column: 3, scope: !897)
!959 = distinct !{!959, !900, !960}
!960 = !DILocation(line: 138, column: 7, scope: !894)
!961 = !DILocation(line: 139, column: 1, scope: !858)
!962 = distinct !DISubprogram(name: "kernel", linkageName: "_ZL6kerneliiiPdS_S_S_", scope: !5, file: !5, line: 73, type: !963, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!963 = !DISubroutineType(types: !964)
!964 = !{null, !110, !110, !110, !99, !99, !99, !99}
!965 = !DILocalVariable(name: "tmax", arg: 1, scope: !962, file: !5, line: 73, type: !110)
!966 = !DILocation(line: 73, column: 24, scope: !962)
!967 = !DILocalVariable(name: "nx", arg: 2, scope: !962, file: !5, line: 74, type: !110)
!968 = !DILocation(line: 74, column: 24, scope: !962)
!969 = !DILocalVariable(name: "ny", arg: 3, scope: !962, file: !5, line: 75, type: !110)
!970 = !DILocation(line: 75, column: 24, scope: !962)
!971 = !DILocalVariable(name: "ex", arg: 4, scope: !962, file: !5, line: 76, type: !99)
!972 = !DILocation(line: 76, column: 28, scope: !962)
!973 = !DILocalVariable(name: "ey", arg: 5, scope: !962, file: !5, line: 76, type: !99)
!974 = !DILocation(line: 76, column: 40, scope: !962)
!975 = !DILocalVariable(name: "hz", arg: 6, scope: !962, file: !5, line: 76, type: !99)
!976 = !DILocation(line: 76, column: 52, scope: !962)
!977 = !DILocalVariable(name: "fict", arg: 7, scope: !962, file: !5, line: 76, type: !99)
!978 = !DILocation(line: 76, column: 64, scope: !962)
!979 = !DILocalVariable(name: "threadsPerBlock", scope: !962, file: !5, line: 77, type: !980)
!980 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!981 = !DILocation(line: 77, column: 18, scope: !962)
!982 = !DILocalVariable(name: "dev_ex", scope: !962, file: !5, line: 80, type: !99)
!983 = !DILocation(line: 80, column: 11, scope: !962)
!984 = !DILocalVariable(name: "dev_ey", scope: !962, file: !5, line: 81, type: !99)
!985 = !DILocation(line: 81, column: 11, scope: !962)
!986 = !DILocalVariable(name: "dev_hz", scope: !962, file: !5, line: 82, type: !99)
!987 = !DILocation(line: 82, column: 11, scope: !962)
!988 = !DILocalVariable(name: "dev_fict", scope: !962, file: !5, line: 83, type: !99)
!989 = !DILocation(line: 83, column: 11, scope: !962)
!990 = !DILocation(line: 84, column: 23, scope: !962)
!991 = !DILocation(line: 84, column: 26, scope: !962)
!992 = !DILocation(line: 84, column: 25, scope: !962)
!993 = !DILocation(line: 84, column: 28, scope: !962)
!994 = !DILocation(line: 84, column: 3, scope: !962)
!995 = !DILocation(line: 85, column: 23, scope: !962)
!996 = !DILocation(line: 85, column: 26, scope: !962)
!997 = !DILocation(line: 85, column: 25, scope: !962)
!998 = !DILocation(line: 85, column: 28, scope: !962)
!999 = !DILocation(line: 85, column: 3, scope: !962)
!1000 = !DILocation(line: 86, column: 23, scope: !962)
!1001 = !DILocation(line: 86, column: 26, scope: !962)
!1002 = !DILocation(line: 86, column: 25, scope: !962)
!1003 = !DILocation(line: 86, column: 28, scope: !962)
!1004 = !DILocation(line: 86, column: 3, scope: !962)
!1005 = !DILocation(line: 87, column: 25, scope: !962)
!1006 = !DILocation(line: 87, column: 27, scope: !962)
!1007 = !DILocation(line: 87, column: 3, scope: !962)
!1008 = !DILocation(line: 88, column: 14, scope: !962)
!1009 = !DILocation(line: 88, column: 22, scope: !962)
!1010 = !DILocation(line: 88, column: 26, scope: !962)
!1011 = !DILocation(line: 88, column: 29, scope: !962)
!1012 = !DILocation(line: 88, column: 28, scope: !962)
!1013 = !DILocation(line: 88, column: 31, scope: !962)
!1014 = !DILocation(line: 88, column: 3, scope: !962)
!1015 = !DILocation(line: 89, column: 14, scope: !962)
!1016 = !DILocation(line: 89, column: 22, scope: !962)
!1017 = !DILocation(line: 89, column: 26, scope: !962)
!1018 = !DILocation(line: 89, column: 29, scope: !962)
!1019 = !DILocation(line: 89, column: 28, scope: !962)
!1020 = !DILocation(line: 89, column: 31, scope: !962)
!1021 = !DILocation(line: 89, column: 3, scope: !962)
!1022 = !DILocation(line: 90, column: 14, scope: !962)
!1023 = !DILocation(line: 90, column: 22, scope: !962)
!1024 = !DILocation(line: 90, column: 26, scope: !962)
!1025 = !DILocation(line: 90, column: 29, scope: !962)
!1026 = !DILocation(line: 90, column: 28, scope: !962)
!1027 = !DILocation(line: 90, column: 31, scope: !962)
!1028 = !DILocation(line: 90, column: 3, scope: !962)
!1029 = !DILocation(line: 91, column: 14, scope: !962)
!1030 = !DILocation(line: 91, column: 24, scope: !962)
!1031 = !DILocation(line: 91, column: 30, scope: !962)
!1032 = !DILocation(line: 91, column: 32, scope: !962)
!1033 = !DILocation(line: 91, column: 3, scope: !962)
!1034 = !DILocalVariable(name: "t", scope: !1035, file: !5, line: 92, type: !110)
!1035 = distinct !DILexicalBlock(scope: !962, file: !5, line: 92, column: 3)
!1036 = !DILocation(line: 92, column: 12, scope: !1035)
!1037 = !DILocation(line: 92, column: 8, scope: !1035)
!1038 = !DILocation(line: 92, column: 19, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1035, file: !5, line: 92, column: 3)
!1040 = !DILocation(line: 92, column: 23, scope: !1039)
!1041 = !DILocation(line: 92, column: 21, scope: !1039)
!1042 = !DILocation(line: 92, column: 3, scope: !1035)
!1043 = !DILocation(line: 93, column: 20, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1039, file: !5, line: 92, column: 34)
!1045 = !DILocation(line: 93, column: 48, scope: !1044)
!1046 = !DILocation(line: 93, column: 37, scope: !1044)
!1047 = !DILocation(line: 93, column: 17, scope: !1044)
!1048 = !DILocation(line: 93, column: 5, scope: !1044)
!1049 = !DILocation(line: 93, column: 72, scope: !1044)
!1050 = !DILocation(line: 93, column: 78, scope: !1044)
!1051 = !DILocation(line: 93, column: 82, scope: !1044)
!1052 = !DILocation(line: 93, column: 86, scope: !1044)
!1053 = !DILocation(line: 93, column: 94, scope: !1044)
!1054 = !DILocation(line: 93, column: 102, scope: !1044)
!1055 = !DILocation(line: 93, column: 110, scope: !1044)
!1056 = !DILocation(line: 93, column: 120, scope: !1044)
!1057 = !DILocalVariable(name: "block", scope: !1058, file: !5, line: 96, type: !1059)
!1058 = distinct !DILexicalBlock(scope: !1044, file: !5, line: 95, column: 5)
!1059 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1060, line: 427, baseType: !1061)
!1060 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!1061 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1060, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !1062, identifier: "_ZTS4dim3")
!1062 = !{!1063, !1064, !1065, !1066, !1070, !1079}
!1063 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1061, file: !1060, line: 419, baseType: !9, size: 32)
!1064 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1061, file: !1060, line: 419, baseType: !9, size: 32, offset: 32)
!1065 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1061, file: !1060, line: 419, baseType: !9, size: 32, offset: 64)
!1066 = !DISubprogram(name: "dim3", scope: !1061, file: !1060, line: 421, type: !1067, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{null, !1069, !9, !9, !9}
!1069 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1061, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1070 = !DISubprogram(name: "dim3", scope: !1061, file: !1060, line: 422, type: !1071, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!1071 = !DISubroutineType(types: !1072)
!1072 = !{null, !1069, !1073}
!1073 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1060, line: 383, baseType: !1074)
!1074 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1060, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !1075, identifier: "_ZTS5uint3")
!1075 = !{!1076, !1077, !1078}
!1076 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1074, file: !1060, line: 192, baseType: !9, size: 32)
!1077 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1074, file: !1060, line: 192, baseType: !9, size: 32, offset: 32)
!1078 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1074, file: !1060, line: 192, baseType: !9, size: 32, offset: 64)
!1079 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1061, file: !1060, line: 423, type: !1080, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!1073, !1069}
!1082 = !DILocation(line: 96, column: 12, scope: !1058)
!1083 = !DILocalVariable(name: "grid", scope: !1058, file: !5, line: 97, type: !1059)
!1084 = !DILocation(line: 97, column: 12, scope: !1058)
!1085 = !DILocation(line: 97, column: 28, scope: !1058)
!1086 = !DILocation(line: 97, column: 31, scope: !1058)
!1087 = !DILocation(line: 97, column: 42, scope: !1058)
!1088 = !DILocation(line: 97, column: 17, scope: !1058)
!1089 = !DILocation(line: 97, column: 57, scope: !1058)
!1090 = !DILocation(line: 97, column: 67, scope: !1058)
!1091 = !DILocation(line: 97, column: 46, scope: !1058)
!1092 = !DILocation(line: 98, column: 19, scope: !1058)
!1093 = !DILocation(line: 98, column: 25, scope: !1058)
!1094 = !DILocation(line: 98, column: 16, scope: !1058)
!1095 = !DILocation(line: 98, column: 7, scope: !1058)
!1096 = !DILocation(line: 98, column: 34, scope: !1058)
!1097 = !DILocation(line: 98, column: 40, scope: !1058)
!1098 = !DILocation(line: 98, column: 44, scope: !1058)
!1099 = !DILocation(line: 98, column: 48, scope: !1058)
!1100 = !DILocation(line: 98, column: 56, scope: !1058)
!1101 = !DILocation(line: 98, column: 64, scope: !1058)
!1102 = !DILocation(line: 98, column: 72, scope: !1058)
!1103 = !DILocation(line: 98, column: 82, scope: !1058)
!1104 = !DILocalVariable(name: "block", scope: !1105, file: !5, line: 103, type: !1059)
!1105 = distinct !DILexicalBlock(scope: !1044, file: !5, line: 102, column: 5)
!1106 = !DILocation(line: 103, column: 12, scope: !1105)
!1107 = !DILocalVariable(name: "grid", scope: !1105, file: !5, line: 104, type: !1059)
!1108 = !DILocation(line: 104, column: 12, scope: !1105)
!1109 = !DILocation(line: 104, column: 28, scope: !1105)
!1110 = !DILocation(line: 104, column: 38, scope: !1105)
!1111 = !DILocation(line: 104, column: 17, scope: !1105)
!1112 = !DILocation(line: 104, column: 53, scope: !1105)
!1113 = !DILocation(line: 104, column: 56, scope: !1105)
!1114 = !DILocation(line: 104, column: 67, scope: !1105)
!1115 = !DILocation(line: 104, column: 42, scope: !1105)
!1116 = !DILocation(line: 105, column: 19, scope: !1105)
!1117 = !DILocation(line: 105, column: 25, scope: !1105)
!1118 = !DILocation(line: 105, column: 16, scope: !1105)
!1119 = !DILocation(line: 105, column: 7, scope: !1105)
!1120 = !DILocation(line: 105, column: 34, scope: !1105)
!1121 = !DILocation(line: 105, column: 40, scope: !1105)
!1122 = !DILocation(line: 105, column: 44, scope: !1105)
!1123 = !DILocation(line: 105, column: 48, scope: !1105)
!1124 = !DILocation(line: 105, column: 56, scope: !1105)
!1125 = !DILocation(line: 105, column: 64, scope: !1105)
!1126 = !DILocation(line: 105, column: 72, scope: !1105)
!1127 = !DILocation(line: 105, column: 82, scope: !1105)
!1128 = !DILocalVariable(name: "block", scope: !1129, file: !5, line: 109, type: !1059)
!1129 = distinct !DILexicalBlock(scope: !1044, file: !5, line: 108, column: 5)
!1130 = !DILocation(line: 109, column: 12, scope: !1129)
!1131 = !DILocalVariable(name: "grid", scope: !1129, file: !5, line: 110, type: !1059)
!1132 = !DILocation(line: 110, column: 12, scope: !1129)
!1133 = !DILocation(line: 110, column: 28, scope: !1129)
!1134 = !DILocation(line: 110, column: 31, scope: !1129)
!1135 = !DILocation(line: 110, column: 42, scope: !1129)
!1136 = !DILocation(line: 110, column: 17, scope: !1129)
!1137 = !DILocation(line: 110, column: 57, scope: !1129)
!1138 = !DILocation(line: 110, column: 60, scope: !1129)
!1139 = !DILocation(line: 110, column: 71, scope: !1129)
!1140 = !DILocation(line: 110, column: 46, scope: !1129)
!1141 = !DILocation(line: 111, column: 19, scope: !1129)
!1142 = !DILocation(line: 111, column: 25, scope: !1129)
!1143 = !DILocation(line: 111, column: 16, scope: !1129)
!1144 = !DILocation(line: 111, column: 7, scope: !1129)
!1145 = !DILocation(line: 111, column: 34, scope: !1129)
!1146 = !DILocation(line: 111, column: 40, scope: !1129)
!1147 = !DILocation(line: 111, column: 44, scope: !1129)
!1148 = !DILocation(line: 111, column: 48, scope: !1129)
!1149 = !DILocation(line: 111, column: 56, scope: !1129)
!1150 = !DILocation(line: 111, column: 64, scope: !1129)
!1151 = !DILocation(line: 111, column: 72, scope: !1129)
!1152 = !DILocation(line: 111, column: 82, scope: !1129)
!1153 = !DILocation(line: 113, column: 3, scope: !1044)
!1154 = !DILocation(line: 92, column: 30, scope: !1039)
!1155 = !DILocation(line: 92, column: 3, scope: !1039)
!1156 = distinct !{!1156, !1042, !1157}
!1157 = !DILocation(line: 113, column: 3, scope: !1035)
!1158 = !DILocation(line: 114, column: 14, scope: !962)
!1159 = !DILocation(line: 114, column: 18, scope: !962)
!1160 = !DILocation(line: 114, column: 26, scope: !962)
!1161 = !DILocation(line: 114, column: 29, scope: !962)
!1162 = !DILocation(line: 114, column: 28, scope: !962)
!1163 = !DILocation(line: 114, column: 31, scope: !962)
!1164 = !DILocation(line: 114, column: 3, scope: !962)
!1165 = !DILocation(line: 115, column: 14, scope: !962)
!1166 = !DILocation(line: 115, column: 18, scope: !962)
!1167 = !DILocation(line: 115, column: 26, scope: !962)
!1168 = !DILocation(line: 115, column: 29, scope: !962)
!1169 = !DILocation(line: 115, column: 28, scope: !962)
!1170 = !DILocation(line: 115, column: 31, scope: !962)
!1171 = !DILocation(line: 115, column: 3, scope: !962)
!1172 = !DILocation(line: 116, column: 14, scope: !962)
!1173 = !DILocation(line: 116, column: 18, scope: !962)
!1174 = !DILocation(line: 116, column: 26, scope: !962)
!1175 = !DILocation(line: 116, column: 29, scope: !962)
!1176 = !DILocation(line: 116, column: 28, scope: !962)
!1177 = !DILocation(line: 116, column: 31, scope: !962)
!1178 = !DILocation(line: 116, column: 3, scope: !962)
!1179 = !DILocation(line: 117, column: 1, scope: !962)
!1180 = distinct !DISubprogram(name: "print_array", linkageName: "_ZL11print_arrayiiPdS_S_", scope: !5, file: !5, line: 145, type: !1181, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1181 = !DISubroutineType(types: !1182)
!1182 = !{null, !110, !110, !99, !99, !99}
!1183 = !DILocalVariable(name: "nx", arg: 1, scope: !1180, file: !5, line: 145, type: !110)
!1184 = !DILocation(line: 145, column: 22, scope: !1180)
!1185 = !DILocalVariable(name: "ny", arg: 2, scope: !1180, file: !5, line: 146, type: !110)
!1186 = !DILocation(line: 146, column: 8, scope: !1180)
!1187 = !DILocalVariable(name: "ex", arg: 3, scope: !1180, file: !5, line: 147, type: !99)
!1188 = !DILocation(line: 147, column: 12, scope: !1180)
!1189 = !DILocalVariable(name: "ey", arg: 4, scope: !1180, file: !5, line: 148, type: !99)
!1190 = !DILocation(line: 148, column: 12, scope: !1180)
!1191 = !DILocalVariable(name: "hz", arg: 5, scope: !1180, file: !5, line: 149, type: !99)
!1192 = !DILocation(line: 149, column: 12, scope: !1180)
!1193 = !DILocalVariable(name: "i", scope: !1180, file: !5, line: 151, type: !110)
!1194 = !DILocation(line: 151, column: 7, scope: !1180)
!1195 = !DILocalVariable(name: "j", scope: !1180, file: !5, line: 151, type: !110)
!1196 = !DILocation(line: 151, column: 10, scope: !1180)
!1197 = !DILocation(line: 153, column: 10, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1180, file: !5, line: 153, column: 3)
!1199 = !DILocation(line: 153, column: 8, scope: !1198)
!1200 = !DILocation(line: 153, column: 15, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1198, file: !5, line: 153, column: 3)
!1202 = !DILocation(line: 153, column: 19, scope: !1201)
!1203 = !DILocation(line: 153, column: 17, scope: !1201)
!1204 = !DILocation(line: 153, column: 3, scope: !1198)
!1205 = !DILocation(line: 154, column: 12, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1201, file: !5, line: 154, column: 5)
!1207 = !DILocation(line: 154, column: 10, scope: !1206)
!1208 = !DILocation(line: 154, column: 17, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1206, file: !5, line: 154, column: 5)
!1210 = !DILocation(line: 154, column: 21, scope: !1209)
!1211 = !DILocation(line: 154, column: 19, scope: !1209)
!1212 = !DILocation(line: 154, column: 5, scope: !1206)
!1213 = !DILocation(line: 155, column: 15, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1209, file: !5, line: 154, column: 30)
!1215 = !DILocation(line: 155, column: 34, scope: !1214)
!1216 = !DILocation(line: 155, column: 37, scope: !1214)
!1217 = !DILocation(line: 155, column: 39, scope: !1214)
!1218 = !DILocation(line: 155, column: 38, scope: !1214)
!1219 = !DILocation(line: 155, column: 42, scope: !1214)
!1220 = !DILocation(line: 155, column: 41, scope: !1214)
!1221 = !DILocation(line: 155, column: 7, scope: !1214)
!1222 = !DILocation(line: 156, column: 15, scope: !1214)
!1223 = !DILocation(line: 156, column: 34, scope: !1214)
!1224 = !DILocation(line: 156, column: 37, scope: !1214)
!1225 = !DILocation(line: 156, column: 39, scope: !1214)
!1226 = !DILocation(line: 156, column: 38, scope: !1214)
!1227 = !DILocation(line: 156, column: 42, scope: !1214)
!1228 = !DILocation(line: 156, column: 41, scope: !1214)
!1229 = !DILocation(line: 156, column: 7, scope: !1214)
!1230 = !DILocation(line: 157, column: 15, scope: !1214)
!1231 = !DILocation(line: 157, column: 34, scope: !1214)
!1232 = !DILocation(line: 157, column: 37, scope: !1214)
!1233 = !DILocation(line: 157, column: 39, scope: !1214)
!1234 = !DILocation(line: 157, column: 38, scope: !1214)
!1235 = !DILocation(line: 157, column: 42, scope: !1214)
!1236 = !DILocation(line: 157, column: 41, scope: !1214)
!1237 = !DILocation(line: 157, column: 7, scope: !1214)
!1238 = !DILocation(line: 158, column: 12, scope: !1239)
!1239 = distinct !DILexicalBlock(scope: !1214, file: !5, line: 158, column: 11)
!1240 = !DILocation(line: 158, column: 16, scope: !1239)
!1241 = !DILocation(line: 158, column: 14, scope: !1239)
!1242 = !DILocation(line: 158, column: 21, scope: !1239)
!1243 = !DILocation(line: 158, column: 19, scope: !1239)
!1244 = !DILocation(line: 158, column: 24, scope: !1239)
!1245 = !DILocation(line: 158, column: 29, scope: !1239)
!1246 = !DILocation(line: 158, column: 11, scope: !1214)
!1247 = !DILocation(line: 158, column: 43, scope: !1239)
!1248 = !DILocation(line: 158, column: 35, scope: !1239)
!1249 = !DILocation(line: 159, column: 5, scope: !1214)
!1250 = !DILocation(line: 154, column: 26, scope: !1209)
!1251 = !DILocation(line: 154, column: 5, scope: !1209)
!1252 = distinct !{!1252, !1212, !1253}
!1253 = !DILocation(line: 159, column: 5, scope: !1206)
!1254 = !DILocation(line: 153, column: 24, scope: !1201)
!1255 = !DILocation(line: 153, column: 3, scope: !1201)
!1256 = distinct !{!1256, !1204, !1257}
!1257 = !DILocation(line: 159, column: 5, scope: !1198)
!1258 = !DILocation(line: 160, column: 11, scope: !1180)
!1259 = !DILocation(line: 160, column: 3, scope: !1180)
!1260 = !DILocation(line: 161, column: 1, scope: !1180)
!1261 = distinct !DISubprogram(name: "cudaMalloc<double>", linkageName: "_ZL10cudaMallocIdE9cudaErrorPPT_m", scope: !1262, file: !1262, line: 490, type: !1263, scopeLine: 494, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, templateParams: !1267, retainedNodes: !695)
!1262 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "")
!1263 = !DISubroutineType(types: !1264)
!1264 = !{!1265, !1266, !391}
!1265 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !8, line: 1419, baseType: !16)
!1266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!1267 = !{!1268}
!1268 = !DITemplateTypeParameter(name: "T", type: !100)
!1269 = !DILocalVariable(name: "devPtr", arg: 1, scope: !1261, file: !1262, line: 491, type: !1266)
!1270 = !DILocation(line: 491, column: 12, scope: !1261)
!1271 = !DILocalVariable(name: "size", arg: 2, scope: !1261, file: !1262, line: 492, type: !391)
!1272 = !DILocation(line: 492, column: 12, scope: !1261)
!1273 = !DILocation(line: 495, column: 38, scope: !1261)
!1274 = !DILocation(line: 495, column: 23, scope: !1261)
!1275 = !DILocation(line: 495, column: 46, scope: !1261)
!1276 = !DILocation(line: 495, column: 10, scope: !1261)
!1277 = !DILocation(line: 495, column: 3, scope: !1261)
!1278 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1061, file: !1060, line: 421, type: !1067, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, declaration: !1066, retainedNodes: !695)
!1279 = !DILocalVariable(name: "this", arg: 1, scope: !1278, type: !1280, flags: DIFlagArtificial | DIFlagObjectPointer)
!1280 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1061, size: 64)
!1281 = !DILocation(line: 0, scope: !1278)
!1282 = !DILocalVariable(name: "vx", arg: 2, scope: !1278, file: !1060, line: 421, type: !9)
!1283 = !DILocation(line: 421, column: 43, scope: !1278)
!1284 = !DILocalVariable(name: "vy", arg: 3, scope: !1278, file: !1060, line: 421, type: !9)
!1285 = !DILocation(line: 421, column: 64, scope: !1278)
!1286 = !DILocalVariable(name: "vz", arg: 4, scope: !1278, file: !1060, line: 421, type: !9)
!1287 = !DILocation(line: 421, column: 85, scope: !1278)
!1288 = !DILocation(line: 421, column: 95, scope: !1278)
!1289 = !DILocation(line: 421, column: 97, scope: !1278)
!1290 = !DILocation(line: 421, column: 102, scope: !1278)
!1291 = !DILocation(line: 421, column: 104, scope: !1278)
!1292 = !DILocation(line: 421, column: 109, scope: !1278)
!1293 = !DILocation(line: 421, column: 111, scope: !1278)
!1294 = !DILocation(line: 421, column: 116, scope: !1278)
!1295 = distinct !DISubprogram(name: "num_blocks", linkageName: "_ZL10num_blocksii", scope: !5, file: !5, line: 18, type: !1296, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1296 = !DISubroutineType(types: !1297)
!1297 = !{!9, !110, !110}
!1298 = !DILocalVariable(name: "num", arg: 1, scope: !1295, file: !5, line: 18, type: !110)
!1299 = !DILocation(line: 18, column: 32, scope: !1295)
!1300 = !DILocalVariable(name: "factor", arg: 2, scope: !1295, file: !5, line: 18, type: !110)
!1301 = !DILocation(line: 18, column: 41, scope: !1295)
!1302 = !DILocation(line: 19, column: 11, scope: !1295)
!1303 = !DILocation(line: 19, column: 17, scope: !1295)
!1304 = !DILocation(line: 19, column: 15, scope: !1295)
!1305 = !DILocation(line: 19, column: 24, scope: !1295)
!1306 = !DILocation(line: 19, column: 31, scope: !1295)
!1307 = !DILocation(line: 19, column: 29, scope: !1295)
!1308 = !DILocation(line: 19, column: 3, scope: !1295)
