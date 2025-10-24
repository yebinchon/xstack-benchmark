; ModuleID = 'mvt.cu'
source_filename = "mvt.cu"
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
@.str = private unnamed_addr constant [7 x i8] c"%0.2lf\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline uwtable
define dso_local void @_Z9kernel_x1iPdS_S_S_S_(i32 %n, double* %x1, double* %x2, double* %y_1, double* %y_2, double* %A) #0 !dbg !692 {
entry:
  %n.addr = alloca i32, align 4
  %x1.addr = alloca double*, align 8
  %x2.addr = alloca double*, align 8
  %y_1.addr = alloca double*, align 8
  %y_2.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !696, metadata !DIExpression()), !dbg !697
  store double* %x1, double** %x1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x1.addr, metadata !698, metadata !DIExpression()), !dbg !699
  store double* %x2, double** %x2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x2.addr, metadata !700, metadata !DIExpression()), !dbg !701
  store double* %y_1, double** %y_1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y_1.addr, metadata !702, metadata !DIExpression()), !dbg !703
  store double* %y_2, double** %y_2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y_2.addr, metadata !704, metadata !DIExpression()), !dbg !705
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !706, metadata !DIExpression()), !dbg !707
  %0 = bitcast i32* %n.addr to i8*, !dbg !708
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !708
  %2 = icmp eq i32 %1, 0, !dbg !708
  br i1 %2, label %setup.next, label %setup.end, !dbg !708

setup.next:                                       ; preds = %entry
  %3 = bitcast double** %x1.addr to i8*, !dbg !708
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !708
  %5 = icmp eq i32 %4, 0, !dbg !708
  br i1 %5, label %setup.next1, label %setup.end, !dbg !708

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast double** %x2.addr to i8*, !dbg !708
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !708
  %8 = icmp eq i32 %7, 0, !dbg !708
  br i1 %8, label %setup.next2, label %setup.end, !dbg !708

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %y_1.addr to i8*, !dbg !708
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !708
  %11 = icmp eq i32 %10, 0, !dbg !708
  br i1 %11, label %setup.next3, label %setup.end, !dbg !708

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %y_2.addr to i8*, !dbg !708
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !708
  %14 = icmp eq i32 %13, 0, !dbg !708
  br i1 %14, label %setup.next4, label %setup.end, !dbg !708

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %A.addr to i8*, !dbg !708
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !708
  %17 = icmp eq i32 %16, 0, !dbg !708
  br i1 %17, label %setup.next5, label %setup.end, !dbg !708

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (i32, double*, double*, double*, double*, double*)* @_Z9kernel_x1iPdS_S_S_S_ to i8*)), !dbg !708
  br label %setup.end, !dbg !708

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !709
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline uwtable
define dso_local void @_Z9kernel_x2iPdS_S_S_S_(i32 %n, double* %x1, double* %x2, double* %y_1, double* %y_2, double* %A) #0 !dbg !710 {
entry:
  %n.addr = alloca i32, align 4
  %x1.addr = alloca double*, align 8
  %x2.addr = alloca double*, align 8
  %y_1.addr = alloca double*, align 8
  %y_2.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !711, metadata !DIExpression()), !dbg !712
  store double* %x1, double** %x1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x1.addr, metadata !713, metadata !DIExpression()), !dbg !714
  store double* %x2, double** %x2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x2.addr, metadata !715, metadata !DIExpression()), !dbg !716
  store double* %y_1, double** %y_1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y_1.addr, metadata !717, metadata !DIExpression()), !dbg !718
  store double* %y_2, double** %y_2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y_2.addr, metadata !719, metadata !DIExpression()), !dbg !720
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !721, metadata !DIExpression()), !dbg !722
  %0 = bitcast i32* %n.addr to i8*, !dbg !723
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !723
  %2 = icmp eq i32 %1, 0, !dbg !723
  br i1 %2, label %setup.next, label %setup.end, !dbg !723

setup.next:                                       ; preds = %entry
  %3 = bitcast double** %x1.addr to i8*, !dbg !723
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !723
  %5 = icmp eq i32 %4, 0, !dbg !723
  br i1 %5, label %setup.next1, label %setup.end, !dbg !723

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast double** %x2.addr to i8*, !dbg !723
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !723
  %8 = icmp eq i32 %7, 0, !dbg !723
  br i1 %8, label %setup.next2, label %setup.end, !dbg !723

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %y_1.addr to i8*, !dbg !723
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !723
  %11 = icmp eq i32 %10, 0, !dbg !723
  br i1 %11, label %setup.next3, label %setup.end, !dbg !723

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %y_2.addr to i8*, !dbg !723
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !723
  %14 = icmp eq i32 %13, 0, !dbg !723
  br i1 %14, label %setup.next4, label %setup.end, !dbg !723

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %A.addr to i8*, !dbg !723
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !723
  %17 = icmp eq i32 %16, 0, !dbg !723
  br i1 %17, label %setup.next5, label %setup.end, !dbg !723

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (i32, double*, double*, double*, double*, double*)* @_Z9kernel_x2iPdS_S_S_S_ to i8*)), !dbg !723
  br label %setup.end, !dbg !723

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !724
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @_Z10num_blocksss(i16 signext %num, i16 signext %factor) #2 !dbg !725 {
entry:
  %num.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %num, i16* %num.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %num.addr, metadata !729, metadata !DIExpression()), !dbg !730
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !731, metadata !DIExpression()), !dbg !732
  %0 = load i16, i16* %num.addr, align 2, !dbg !733
  %conv = sext i16 %0 to i32, !dbg !733
  %1 = load i16, i16* %factor.addr, align 2, !dbg !734
  %conv1 = sext i16 %1 to i32, !dbg !734
  %add = add nsw i32 %conv, %conv1, !dbg !735
  %sub = sub nsw i32 %add, 1, !dbg !736
  %2 = load i16, i16* %factor.addr, align 2, !dbg !737
  %conv2 = sext i16 %2 to i32, !dbg !737
  %div = sdiv i32 %sub, %conv2, !dbg !738
  %conv3 = trunc i32 %div to i16, !dbg !739
  ret i16 %conv3, !dbg !740
}

; Function Attrs: noinline uwtable
define dso_local void @_Z6kerneliPdS_S_S_S_(i32 %n, double* %x1, double* %x2, double* %y_1, double* %y_2, double* %A) #0 !dbg !741 {
entry:
  %n.addr = alloca i32, align 4
  %x1.addr = alloca double*, align 8
  %x2.addr = alloca double*, align 8
  %y_1.addr = alloca double*, align 8
  %y_2.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %threadsPerBlock = alloca i16, align 2
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp1 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp1.coerce = alloca { i64, i32 }, align 4
  %agg.tmp5 = alloca %struct.dim3, align 4
  %agg.tmp7 = alloca %struct.dim3, align 4
  %agg.tmp5.coerce = alloca { i64, i32 }, align 4
  %agg.tmp7.coerce = alloca { i64, i32 }, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !742, metadata !DIExpression()), !dbg !743
  store double* %x1, double** %x1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x1.addr, metadata !744, metadata !DIExpression()), !dbg !745
  store double* %x2, double** %x2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x2.addr, metadata !746, metadata !DIExpression()), !dbg !747
  store double* %y_1, double** %y_1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y_1.addr, metadata !748, metadata !DIExpression()), !dbg !749
  store double* %y_2, double** %y_2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y_2.addr, metadata !750, metadata !DIExpression()), !dbg !751
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !752, metadata !DIExpression()), !dbg !753
  call void @llvm.dbg.declare(metadata i16* %threadsPerBlock, metadata !754, metadata !DIExpression()), !dbg !755
  store i16 256, i16* %threadsPerBlock, align 2, !dbg !755
  %0 = load i16, i16* %threadsPerBlock, align 2, !dbg !756
  %conv = sext i16 %0 to i32, !dbg !756
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 %conv, i32 1, i32 1), !dbg !756
  %1 = load i32, i32* %n.addr, align 4, !dbg !757
  %conv2 = trunc i32 %1 to i16, !dbg !757
  %2 = load i16, i16* %threadsPerBlock, align 2, !dbg !758
  %call = call signext i16 @_Z10num_blocksss(i16 signext %conv2, i16 signext %2), !dbg !759
  %conv3 = sext i16 %call to i32, !dbg !759
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp1, i32 %conv3, i32 1, i32 1), !dbg !759
  %3 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !760
  %4 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !760
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 4 %4, i64 12, i1 false), !dbg !760
  %5 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !760
  %6 = load i64, i64* %5, align 4, !dbg !760
  %7 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !760
  %8 = load i32, i32* %7, align 4, !dbg !760
  %9 = bitcast { i64, i32 }* %agg.tmp1.coerce to i8*, !dbg !760
  %10 = bitcast %struct.dim3* %agg.tmp1 to i8*, !dbg !760
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 4 %10, i64 12, i1 false), !dbg !760
  %11 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp1.coerce, i32 0, i32 0, !dbg !760
  %12 = load i64, i64* %11, align 4, !dbg !760
  %13 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp1.coerce, i32 0, i32 1, !dbg !760
  %14 = load i32, i32* %13, align 4, !dbg !760
  %call4 = call i32 @cudaConfigureCall(i64 %6, i32 %8, i64 %12, i32 %14, i64 0, %struct.CUstream_st* null), !dbg !760
  %tobool = icmp ne i32 %call4, 0, !dbg !760
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !761

kcall.configok:                                   ; preds = %entry
  %15 = load i32, i32* %n.addr, align 4, !dbg !762
  %16 = load double*, double** %x1.addr, align 8, !dbg !763
  %17 = load double*, double** %x2.addr, align 8, !dbg !764
  %18 = load double*, double** %y_1.addr, align 8, !dbg !765
  %19 = load double*, double** %y_2.addr, align 8, !dbg !766
  %20 = load double*, double** %A.addr, align 8, !dbg !767
  call void @_Z9kernel_x1iPdS_S_S_S_(i32 %15, double* %16, double* %17, double* %18, double* %19, double* %20), !dbg !761
  br label %kcall.end, !dbg !761

kcall.end:                                        ; preds = %kcall.configok, %entry
  %21 = load i16, i16* %threadsPerBlock, align 2, !dbg !768
  %conv6 = sext i16 %21 to i32, !dbg !768
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp5, i32 %conv6, i32 1, i32 1), !dbg !768
  %22 = load i32, i32* %n.addr, align 4, !dbg !769
  %conv8 = trunc i32 %22 to i16, !dbg !769
  %23 = load i16, i16* %threadsPerBlock, align 2, !dbg !770
  %call9 = call signext i16 @_Z10num_blocksss(i16 signext %conv8, i16 signext %23), !dbg !771
  %conv10 = sext i16 %call9 to i32, !dbg !771
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp7, i32 %conv10, i32 1, i32 1), !dbg !771
  %24 = bitcast { i64, i32 }* %agg.tmp5.coerce to i8*, !dbg !772
  %25 = bitcast %struct.dim3* %agg.tmp5 to i8*, !dbg !772
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %24, i8* align 4 %25, i64 12, i1 false), !dbg !772
  %26 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 0, !dbg !772
  %27 = load i64, i64* %26, align 4, !dbg !772
  %28 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 1, !dbg !772
  %29 = load i32, i32* %28, align 4, !dbg !772
  %30 = bitcast { i64, i32 }* %agg.tmp7.coerce to i8*, !dbg !772
  %31 = bitcast %struct.dim3* %agg.tmp7 to i8*, !dbg !772
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %30, i8* align 4 %31, i64 12, i1 false), !dbg !772
  %32 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp7.coerce, i32 0, i32 0, !dbg !772
  %33 = load i64, i64* %32, align 4, !dbg !772
  %34 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp7.coerce, i32 0, i32 1, !dbg !772
  %35 = load i32, i32* %34, align 4, !dbg !772
  %call11 = call i32 @cudaConfigureCall(i64 %27, i32 %29, i64 %33, i32 %35, i64 0, %struct.CUstream_st* null), !dbg !772
  %tobool12 = icmp ne i32 %call11, 0, !dbg !772
  br i1 %tobool12, label %kcall.end14, label %kcall.configok13, !dbg !773

kcall.configok13:                                 ; preds = %kcall.end
  %36 = load i32, i32* %n.addr, align 4, !dbg !774
  %37 = load double*, double** %x1.addr, align 8, !dbg !775
  %38 = load double*, double** %x2.addr, align 8, !dbg !776
  %39 = load double*, double** %y_1.addr, align 8, !dbg !777
  %40 = load double*, double** %y_2.addr, align 8, !dbg !778
  %41 = load double*, double** %A.addr, align 8, !dbg !779
  call void @_Z9kernel_x2iPdS_S_S_S_(i32 %36, double* %37, double* %38, double* %39, double* %40, double* %41), !dbg !773
  br label %kcall.end14, !dbg !773

kcall.end14:                                      ; preds = %kcall.configok13, %kcall.end
  ret void, !dbg !780
}

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #3

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #2 comdat align 2 !dbg !781 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !804, metadata !DIExpression()), !dbg !806
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !807, metadata !DIExpression()), !dbg !808
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !809, metadata !DIExpression()), !dbg !810
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !811, metadata !DIExpression()), !dbg !812
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !813
  %0 = load i32, i32* %vx.addr, align 4, !dbg !814
  store i32 %0, i32* %x, align 4, !dbg !813
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !815
  %1 = load i32, i32* %vy.addr, align 4, !dbg !816
  store i32 %1, i32* %y, align 4, !dbg !815
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !817
  %2 = load i32, i32* %vz.addr, align 4, !dbg !818
  store i32 %2, i32* %z, align 4, !dbg !817
  ret void, !dbg !819
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #5 !dbg !820 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %dump_code = alloca i32, align 4
  %n = alloca i32, align 4
  %A = alloca double*, align 8
  %x1 = alloca double*, align 8
  %x2 = alloca double*, align 8
  %y_1 = alloca double*, align 8
  %y_2 = alloca double*, align 8
  %dev_A = alloca double*, align 8
  %dev_x1 = alloca double*, align 8
  %dev_x2 = alloca double*, align 8
  %dev_y_1 = alloca double*, align 8
  %dev_y_2 = alloca double*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !823, metadata !DIExpression()), !dbg !824
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !825, metadata !DIExpression()), !dbg !826
  call void @llvm.dbg.declare(metadata i32* %dump_code, metadata !827, metadata !DIExpression()), !dbg !828
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !829
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !829
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !829
  %call = call i32 @atoi(i8* %1) #8, !dbg !830
  store i32 %call, i32* %dump_code, align 4, !dbg !828
  call void @llvm.dbg.declare(metadata i32* %n, metadata !831, metadata !DIExpression()), !dbg !832
  store i32 15000, i32* %n, align 4, !dbg !832
  call void @llvm.dbg.declare(metadata double** %A, metadata !833, metadata !DIExpression()), !dbg !834
  %call1 = call noalias i8* @malloc(i64 1800000000) #9, !dbg !835
  %2 = bitcast i8* %call1 to double*, !dbg !836
  store double* %2, double** %A, align 8, !dbg !834
  call void @llvm.dbg.declare(metadata double** %x1, metadata !837, metadata !DIExpression()), !dbg !838
  %3 = load i32, i32* %n, align 4, !dbg !839
  %conv = sext i32 %3 to i64, !dbg !839
  %mul = mul i64 8, %conv, !dbg !840
  %call2 = call noalias i8* @malloc(i64 %mul) #9, !dbg !841
  %4 = bitcast i8* %call2 to double*, !dbg !842
  store double* %4, double** %x1, align 8, !dbg !838
  call void @llvm.dbg.declare(metadata double** %x2, metadata !843, metadata !DIExpression()), !dbg !844
  %5 = load i32, i32* %n, align 4, !dbg !845
  %conv3 = sext i32 %5 to i64, !dbg !845
  %mul4 = mul i64 8, %conv3, !dbg !846
  %call5 = call noalias i8* @malloc(i64 %mul4) #9, !dbg !847
  %6 = bitcast i8* %call5 to double*, !dbg !848
  store double* %6, double** %x2, align 8, !dbg !844
  call void @llvm.dbg.declare(metadata double** %y_1, metadata !849, metadata !DIExpression()), !dbg !850
  %7 = load i32, i32* %n, align 4, !dbg !851
  %conv6 = sext i32 %7 to i64, !dbg !851
  %mul7 = mul i64 8, %conv6, !dbg !852
  %call8 = call noalias i8* @malloc(i64 %mul7) #9, !dbg !853
  %8 = bitcast i8* %call8 to double*, !dbg !854
  store double* %8, double** %y_1, align 8, !dbg !850
  call void @llvm.dbg.declare(metadata double** %y_2, metadata !855, metadata !DIExpression()), !dbg !856
  %9 = load i32, i32* %n, align 4, !dbg !857
  %conv9 = sext i32 %9 to i64, !dbg !857
  %mul10 = mul i64 8, %conv9, !dbg !858
  %call11 = call noalias i8* @malloc(i64 %mul10) #9, !dbg !859
  %10 = bitcast i8* %call11 to double*, !dbg !860
  store double* %10, double** %y_2, align 8, !dbg !856
  %11 = load i32, i32* %n, align 4, !dbg !861
  %12 = load double*, double** %x1, align 8, !dbg !862
  %13 = load double*, double** %x2, align 8, !dbg !863
  %14 = load double*, double** %y_1, align 8, !dbg !864
  %15 = load double*, double** %y_2, align 8, !dbg !865
  %16 = load double*, double** %A, align 8, !dbg !866
  call void @_ZL10init_arrayiPdS_S_S_S_(i32 %11, double* %12, double* %13, double* %14, double* %15, double* %16), !dbg !867
  call void @llvm.dbg.declare(metadata double** %dev_A, metadata !868, metadata !DIExpression()), !dbg !869
  call void @llvm.dbg.declare(metadata double** %dev_x1, metadata !870, metadata !DIExpression()), !dbg !871
  call void @llvm.dbg.declare(metadata double** %dev_x2, metadata !872, metadata !DIExpression()), !dbg !873
  call void @llvm.dbg.declare(metadata double** %dev_y_1, metadata !874, metadata !DIExpression()), !dbg !875
  call void @llvm.dbg.declare(metadata double** %dev_y_2, metadata !876, metadata !DIExpression()), !dbg !877
  %17 = load i32, i32* %n, align 4, !dbg !878
  %18 = load i32, i32* %n, align 4, !dbg !879
  %mul12 = mul nsw i32 %17, %18, !dbg !880
  %conv13 = sext i32 %mul12 to i64, !dbg !878
  %mul14 = mul i64 %conv13, 8, !dbg !881
  %call15 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_A, i64 %mul14), !dbg !882
  %19 = load i32, i32* %n, align 4, !dbg !883
  %conv16 = sext i32 %19 to i64, !dbg !883
  %mul17 = mul i64 %conv16, 8, !dbg !884
  %call18 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_x1, i64 %mul17), !dbg !885
  %20 = load i32, i32* %n, align 4, !dbg !886
  %conv19 = sext i32 %20 to i64, !dbg !886
  %mul20 = mul i64 %conv19, 8, !dbg !887
  %call21 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_x2, i64 %mul20), !dbg !888
  %21 = load i32, i32* %n, align 4, !dbg !889
  %conv22 = sext i32 %21 to i64, !dbg !889
  %mul23 = mul i64 %conv22, 8, !dbg !890
  %call24 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_y_1, i64 %mul23), !dbg !891
  %22 = load i32, i32* %n, align 4, !dbg !892
  %conv25 = sext i32 %22 to i64, !dbg !892
  %mul26 = mul i64 %conv25, 8, !dbg !893
  %call27 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_y_2, i64 %mul26), !dbg !894
  %23 = load double*, double** %dev_A, align 8, !dbg !895
  %24 = bitcast double* %23 to i8*, !dbg !895
  %25 = load double*, double** %A, align 8, !dbg !896
  %26 = bitcast double* %25 to i8*, !dbg !896
  %27 = load i32, i32* %n, align 4, !dbg !897
  %28 = load i32, i32* %n, align 4, !dbg !898
  %mul28 = mul nsw i32 %27, %28, !dbg !899
  %conv29 = sext i32 %mul28 to i64, !dbg !897
  %mul30 = mul i64 %conv29, 8, !dbg !900
  %call31 = call i32 @cudaMemcpy(i8* %24, i8* %26, i64 %mul30, i32 1), !dbg !901
  %29 = load double*, double** %dev_x1, align 8, !dbg !902
  %30 = bitcast double* %29 to i8*, !dbg !902
  %31 = load double*, double** %x1, align 8, !dbg !903
  %32 = bitcast double* %31 to i8*, !dbg !903
  %33 = load i32, i32* %n, align 4, !dbg !904
  %conv32 = sext i32 %33 to i64, !dbg !904
  %mul33 = mul i64 %conv32, 8, !dbg !905
  %call34 = call i32 @cudaMemcpy(i8* %30, i8* %32, i64 %mul33, i32 1), !dbg !906
  %34 = load double*, double** %dev_x2, align 8, !dbg !907
  %35 = bitcast double* %34 to i8*, !dbg !907
  %36 = load double*, double** %x2, align 8, !dbg !908
  %37 = bitcast double* %36 to i8*, !dbg !908
  %38 = load i32, i32* %n, align 4, !dbg !909
  %conv35 = sext i32 %38 to i64, !dbg !909
  %mul36 = mul i64 %conv35, 8, !dbg !910
  %call37 = call i32 @cudaMemcpy(i8* %35, i8* %37, i64 %mul36, i32 1), !dbg !911
  %39 = load double*, double** %dev_y_1, align 8, !dbg !912
  %40 = bitcast double* %39 to i8*, !dbg !912
  %41 = load double*, double** %y_1, align 8, !dbg !913
  %42 = bitcast double* %41 to i8*, !dbg !913
  %43 = load i32, i32* %n, align 4, !dbg !914
  %conv38 = sext i32 %43 to i64, !dbg !914
  %mul39 = mul i64 %conv38, 8, !dbg !915
  %call40 = call i32 @cudaMemcpy(i8* %40, i8* %42, i64 %mul39, i32 1), !dbg !916
  %44 = load double*, double** %dev_y_2, align 8, !dbg !917
  %45 = bitcast double* %44 to i8*, !dbg !917
  %46 = load double*, double** %y_2, align 8, !dbg !918
  %47 = bitcast double* %46 to i8*, !dbg !918
  %48 = load i32, i32* %n, align 4, !dbg !919
  %conv41 = sext i32 %48 to i64, !dbg !919
  %mul42 = mul i64 %conv41, 8, !dbg !920
  %call43 = call i32 @cudaMemcpy(i8* %45, i8* %47, i64 %mul42, i32 1), !dbg !921
  %49 = load i32, i32* %n, align 4, !dbg !922
  %50 = load double*, double** %dev_x1, align 8, !dbg !923
  %51 = load double*, double** %dev_x2, align 8, !dbg !924
  %52 = load double*, double** %dev_y_1, align 8, !dbg !925
  %53 = load double*, double** %dev_y_2, align 8, !dbg !926
  %54 = load double*, double** %dev_A, align 8, !dbg !927
  call void @_Z6kerneliPdS_S_S_S_(i32 %49, double* %50, double* %51, double* %52, double* %53, double* %54), !dbg !928
  %55 = load double*, double** %x1, align 8, !dbg !929
  %56 = bitcast double* %55 to i8*, !dbg !929
  %57 = load double*, double** %dev_x1, align 8, !dbg !930
  %58 = bitcast double* %57 to i8*, !dbg !930
  %59 = load i32, i32* %n, align 4, !dbg !931
  %conv44 = sext i32 %59 to i64, !dbg !931
  %mul45 = mul i64 %conv44, 8, !dbg !932
  %call46 = call i32 @cudaMemcpy(i8* %56, i8* %58, i64 %mul45, i32 2), !dbg !933
  %60 = load double*, double** %x2, align 8, !dbg !934
  %61 = bitcast double* %60 to i8*, !dbg !934
  %62 = load double*, double** %dev_x2, align 8, !dbg !935
  %63 = bitcast double* %62 to i8*, !dbg !935
  %64 = load i32, i32* %n, align 4, !dbg !936
  %conv47 = sext i32 %64 to i64, !dbg !936
  %mul48 = mul i64 %conv47, 8, !dbg !937
  %call49 = call i32 @cudaMemcpy(i8* %61, i8* %63, i64 %mul48, i32 2), !dbg !938
  %65 = load i32, i32* %dump_code, align 4, !dbg !939
  %cmp = icmp eq i32 %65, 1, !dbg !941
  br i1 %cmp, label %if.then, label %if.end, !dbg !942

if.then:                                          ; preds = %entry
  %66 = load i32, i32* %n, align 4, !dbg !943
  %67 = load double*, double** %x1, align 8, !dbg !944
  %68 = load double*, double** %x2, align 8, !dbg !945
  call void @_ZL11print_arrayiPdS_(i32 %66, double* %67, double* %68), !dbg !946
  br label %if.end, !dbg !946

if.end:                                           ; preds = %if.then, %entry
  %69 = load double*, double** %A, align 8, !dbg !947
  %70 = bitcast double* %69 to i8*, !dbg !947
  call void @free(i8* %70) #9, !dbg !948
  %71 = load double*, double** %x1, align 8, !dbg !949
  %72 = bitcast double* %71 to i8*, !dbg !949
  call void @free(i8* %72) #9, !dbg !950
  %73 = load double*, double** %x2, align 8, !dbg !951
  %74 = bitcast double* %73 to i8*, !dbg !951
  call void @free(i8* %74) #9, !dbg !952
  %75 = load double*, double** %y_1, align 8, !dbg !953
  %76 = bitcast double* %75 to i8*, !dbg !953
  call void @free(i8* %76) #9, !dbg !954
  %77 = load double*, double** %y_2, align 8, !dbg !955
  %78 = bitcast double* %77 to i8*, !dbg !955
  call void @free(i8* %78) #9, !dbg !956
  ret i32 0, !dbg !957
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #6

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #7

; Function Attrs: noinline nounwind uwtable
define internal void @_ZL10init_arrayiPdS_S_S_S_(i32 %n, double* %x1, double* %x2, double* %y_1, double* %y_2, double* %A) #2 !dbg !958 {
entry:
  %n.addr = alloca i32, align 4
  %x1.addr = alloca double*, align 8
  %x2.addr = alloca double*, align 8
  %y_1.addr = alloca double*, align 8
  %y_2.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !959, metadata !DIExpression()), !dbg !960
  store double* %x1, double** %x1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x1.addr, metadata !961, metadata !DIExpression()), !dbg !962
  store double* %x2, double** %x2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x2.addr, metadata !963, metadata !DIExpression()), !dbg !964
  store double* %y_1, double** %y_1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y_1.addr, metadata !965, metadata !DIExpression()), !dbg !966
  store double* %y_2, double** %y_2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y_2.addr, metadata !967, metadata !DIExpression()), !dbg !968
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !969, metadata !DIExpression()), !dbg !970
  call void @llvm.dbg.declare(metadata i32* %i, metadata !971, metadata !DIExpression()), !dbg !972
  call void @llvm.dbg.declare(metadata i32* %j, metadata !973, metadata !DIExpression()), !dbg !974
  store i32 0, i32* %i, align 4, !dbg !975
  br label %for.cond, !dbg !977

for.cond:                                         ; preds = %for.inc30, %entry
  %0 = load i32, i32* %i, align 4, !dbg !978
  %1 = load i32, i32* %n.addr, align 4, !dbg !980
  %cmp = icmp slt i32 %0, %1, !dbg !981
  br i1 %cmp, label %for.body, label %for.end32, !dbg !982

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !983
  %conv = sitofp i32 %2 to double, !dbg !983
  %3 = load i32, i32* %n.addr, align 4, !dbg !985
  %conv1 = sitofp i32 %3 to double, !dbg !985
  %div = fdiv double %conv, %conv1, !dbg !986
  %4 = load double*, double** %x1.addr, align 8, !dbg !987
  %5 = load i32, i32* %i, align 4, !dbg !988
  %idxprom = sext i32 %5 to i64, !dbg !987
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom, !dbg !987
  store double %div, double* %arrayidx, align 8, !dbg !989
  %6 = load i32, i32* %i, align 4, !dbg !990
  %conv2 = sitofp i32 %6 to double, !dbg !990
  %add = fadd contract double %conv2, 1.000000e+00, !dbg !991
  %7 = load i32, i32* %n.addr, align 4, !dbg !992
  %conv3 = sitofp i32 %7 to double, !dbg !992
  %div4 = fdiv double %add, %conv3, !dbg !993
  %8 = load double*, double** %x2.addr, align 8, !dbg !994
  %9 = load i32, i32* %i, align 4, !dbg !995
  %idxprom5 = sext i32 %9 to i64, !dbg !994
  %arrayidx6 = getelementptr inbounds double, double* %8, i64 %idxprom5, !dbg !994
  store double %div4, double* %arrayidx6, align 8, !dbg !996
  %10 = load i32, i32* %i, align 4, !dbg !997
  %conv7 = sitofp i32 %10 to double, !dbg !997
  %add8 = fadd contract double %conv7, 3.000000e+00, !dbg !998
  %11 = load i32, i32* %n.addr, align 4, !dbg !999
  %conv9 = sitofp i32 %11 to double, !dbg !999
  %div10 = fdiv double %add8, %conv9, !dbg !1000
  %12 = load double*, double** %y_1.addr, align 8, !dbg !1001
  %13 = load i32, i32* %i, align 4, !dbg !1002
  %idxprom11 = sext i32 %13 to i64, !dbg !1001
  %arrayidx12 = getelementptr inbounds double, double* %12, i64 %idxprom11, !dbg !1001
  store double %div10, double* %arrayidx12, align 8, !dbg !1003
  %14 = load i32, i32* %i, align 4, !dbg !1004
  %conv13 = sitofp i32 %14 to double, !dbg !1004
  %add14 = fadd contract double %conv13, 4.000000e+00, !dbg !1005
  %15 = load i32, i32* %n.addr, align 4, !dbg !1006
  %conv15 = sitofp i32 %15 to double, !dbg !1006
  %div16 = fdiv double %add14, %conv15, !dbg !1007
  %16 = load double*, double** %y_2.addr, align 8, !dbg !1008
  %17 = load i32, i32* %i, align 4, !dbg !1009
  %idxprom17 = sext i32 %17 to i64, !dbg !1008
  %arrayidx18 = getelementptr inbounds double, double* %16, i64 %idxprom17, !dbg !1008
  store double %div16, double* %arrayidx18, align 8, !dbg !1010
  store i32 0, i32* %j, align 4, !dbg !1011
  br label %for.cond19, !dbg !1013

for.cond19:                                       ; preds = %for.inc, %for.body
  %18 = load i32, i32* %j, align 4, !dbg !1014
  %19 = load i32, i32* %n.addr, align 4, !dbg !1016
  %cmp20 = icmp slt i32 %18, %19, !dbg !1017
  br i1 %cmp20, label %for.body21, label %for.end, !dbg !1018

for.body21:                                       ; preds = %for.cond19
  %20 = load i32, i32* %i, align 4, !dbg !1019
  %conv22 = sitofp i32 %20 to double, !dbg !1019
  %21 = load i32, i32* %j, align 4, !dbg !1020
  %conv23 = sitofp i32 %21 to double, !dbg !1020
  %mul = fmul contract double %conv22, %conv23, !dbg !1021
  %22 = load i32, i32* %n.addr, align 4, !dbg !1022
  %conv24 = sitofp i32 %22 to double, !dbg !1022
  %div25 = fdiv double %mul, %conv24, !dbg !1023
  %23 = load double*, double** %A.addr, align 8, !dbg !1024
  %24 = load i32, i32* %i, align 4, !dbg !1025
  %25 = load i32, i32* %n.addr, align 4, !dbg !1026
  %mul26 = mul nsw i32 %24, %25, !dbg !1027
  %26 = load i32, i32* %j, align 4, !dbg !1028
  %add27 = add nsw i32 %mul26, %26, !dbg !1029
  %idxprom28 = sext i32 %add27 to i64, !dbg !1024
  %arrayidx29 = getelementptr inbounds double, double* %23, i64 %idxprom28, !dbg !1024
  store double %div25, double* %arrayidx29, align 8, !dbg !1030
  br label %for.inc, !dbg !1024

for.inc:                                          ; preds = %for.body21
  %27 = load i32, i32* %j, align 4, !dbg !1031
  %inc = add nsw i32 %27, 1, !dbg !1031
  store i32 %inc, i32* %j, align 4, !dbg !1031
  br label %for.cond19, !dbg !1032, !llvm.loop !1033

for.end:                                          ; preds = %for.cond19
  br label %for.inc30, !dbg !1035

for.inc30:                                        ; preds = %for.end
  %28 = load i32, i32* %i, align 4, !dbg !1036
  %inc31 = add nsw i32 %28, 1, !dbg !1036
  store i32 %inc31, i32* %i, align 4, !dbg !1036
  br label %for.cond, !dbg !1037, !llvm.loop !1038

for.end32:                                        ; preds = %for.cond
  ret void, !dbg !1040
}

; Function Attrs: noinline uwtable
define internal i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %devPtr, i64 %size) #0 !dbg !1041 {
entry:
  %devPtr.addr = alloca double**, align 8
  %size.addr = alloca i64, align 8
  store double** %devPtr, double*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %devPtr.addr, metadata !1049, metadata !DIExpression()), !dbg !1050
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !1051, metadata !DIExpression()), !dbg !1052
  %0 = load double**, double*** %devPtr.addr, align 8, !dbg !1053
  %1 = bitcast double** %0 to i8*, !dbg !1053
  %2 = bitcast i8* %1 to i8**, !dbg !1054
  %3 = load i64, i64* %size.addr, align 8, !dbg !1055
  %call = call i32 @cudaMalloc(i8** %2, i64 %3), !dbg !1056
  ret i32 %call, !dbg !1057
}

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #3

; Function Attrs: noinline uwtable
define internal void @_ZL11print_arrayiPdS_(i32 %n, double* %x1, double* %x2) #0 !dbg !1058 {
entry:
  %n.addr = alloca i32, align 4
  %x1.addr = alloca double*, align 8
  %x2.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !1061, metadata !DIExpression()), !dbg !1062
  store double* %x1, double** %x1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x1.addr, metadata !1063, metadata !DIExpression()), !dbg !1064
  store double* %x2, double** %x2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x2.addr, metadata !1065, metadata !DIExpression()), !dbg !1066
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1067, metadata !DIExpression()), !dbg !1068
  store i32 0, i32* %i, align 4, !dbg !1069
  br label %for.cond, !dbg !1071

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1072
  %1 = load i32, i32* %n.addr, align 4, !dbg !1074
  %cmp = icmp slt i32 %0, %1, !dbg !1075
  br i1 %cmp, label %for.body, label %for.end, !dbg !1076

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1077
  %3 = load double*, double** %x1.addr, align 8, !dbg !1079
  %4 = load i32, i32* %i, align 4, !dbg !1080
  %idxprom = sext i32 %4 to i64, !dbg !1079
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom, !dbg !1079
  %5 = load double, double* %arrayidx, align 8, !dbg !1079
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %5), !dbg !1081
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1082
  %7 = load double*, double** %x2.addr, align 8, !dbg !1083
  %8 = load i32, i32* %i, align 4, !dbg !1084
  %idxprom1 = sext i32 %8 to i64, !dbg !1083
  %arrayidx2 = getelementptr inbounds double, double* %7, i64 %idxprom1, !dbg !1083
  %9 = load double, double* %arrayidx2, align 8, !dbg !1083
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %9), !dbg !1085
  %10 = load i32, i32* %i, align 4, !dbg !1086
  %rem = srem i32 %10, 20, !dbg !1088
  %cmp4 = icmp eq i32 %rem, 0, !dbg !1089
  br i1 %cmp4, label %if.then, label %if.end, !dbg !1090

if.then:                                          ; preds = %for.body
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1091
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1092
  br label %if.end, !dbg !1092

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !1093

for.inc:                                          ; preds = %if.end
  %12 = load i32, i32* %i, align 4, !dbg !1094
  %inc = add nsw i32 %12, 1, !dbg !1094
  store i32 %inc, i32* %i, align 4, !dbg !1094
  br label %for.cond, !dbg !1095, !llvm.loop !1096

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1098
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #7

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

declare dso_local i32 @cudaMalloc(i8**, i64) #3

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readonly }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.dbg.cu = !{!4}
!llvm.ident = !{!691}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 7, i32 0]}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !5, producer: "clang version 9.0.0 (https://github.com/yebinchon/llvm-project/ a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !6, retainedTypes: !98, imports: !103, nameTableKind: None)
!5 = !DIFile(filename: "mvt.cu", directory: "/scratch/ah7226/xstack-benchmark/polybench-lilac/mvt")
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
!107 = !DIFile(filename: "llvm-install-tulip/lib/clang/9.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/scratch/ah7226")
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
!297 = !DISubprogram(name: "abs", scope: !298, file: !298, line: 848, type: !108, flags: DIFlagPrototyped, spFlags: 0)
!298 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!299 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/std_abs.h", directory: "")
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !301, file: !305, line: 83)
!301 = !DISubprogram(name: "acos", scope: !302, file: !302, line: 53, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!303 = !DISubroutineType(types: !304)
!304 = !{!100, !100}
!305 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cmath", directory: "")
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
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !298, line: 63, baseType: !358)
!358 = !DICompositeType(tag: DW_TAG_structure_type, file: !298, line: 59, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!359 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cstdlib", directory: "")
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !361, file: !359, line: 128)
!361 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !298, line: 71, baseType: !362)
!362 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !298, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !363, identifier: "_ZTS6ldiv_t")
!363 = !{!364, !365}
!364 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !362, file: !298, line: 69, baseType: !208, size: 64)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !362, file: !298, line: 70, baseType: !208, size: 64, offset: 64)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !367, file: !359, line: 130)
!367 = !DISubprogram(name: "abort", scope: !298, file: !298, line: 598, type: !368, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!368 = !DISubroutineType(types: !369)
!369 = !{null}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !371, file: !359, line: 134)
!371 = !DISubprogram(name: "atexit", scope: !298, file: !298, line: 602, type: !372, flags: DIFlagPrototyped, spFlags: 0)
!372 = !DISubroutineType(types: !373)
!373 = !{!110, !374}
!374 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !368, size: 64)
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !376, file: !359, line: 140)
!376 = !DISubprogram(name: "atof", scope: !298, file: !298, line: 102, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !378, file: !359, line: 141)
!378 = !DISubprogram(name: "atoi", scope: !298, file: !298, line: 105, type: !379, flags: DIFlagPrototyped, spFlags: 0)
!379 = !DISubroutineType(types: !380)
!380 = !{!110, !251}
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !382, file: !359, line: 142)
!382 = !DISubprogram(name: "atol", scope: !298, file: !298, line: 108, type: !383, flags: DIFlagPrototyped, spFlags: 0)
!383 = !DISubroutineType(types: !384)
!384 = !{!208, !251}
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !386, file: !359, line: 143)
!386 = !DISubprogram(name: "bsearch", scope: !298, file: !298, line: 828, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!387 = !DISubroutineType(types: !388)
!388 = !{!101, !389, !389, !391, !391, !394}
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !390, size: 64)
!390 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !392, line: 46, baseType: !393)
!392 = !DIFile(filename: "llvm-install-tulip/lib/clang/9.0.0/include/stddef.h", directory: "/scratch/ah7226")
!393 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!394 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !298, line: 816, baseType: !395)
!395 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !396, size: 64)
!396 = !DISubroutineType(types: !397)
!397 = !{!110, !389, !389}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !399, file: !359, line: 144)
!399 = !DISubprogram(name: "calloc", scope: !298, file: !298, line: 543, type: !400, flags: DIFlagPrototyped, spFlags: 0)
!400 = !DISubroutineType(types: !401)
!401 = !{!101, !391, !391}
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !403, file: !359, line: 145)
!403 = !DISubprogram(name: "div", scope: !298, file: !298, line: 860, type: !404, flags: DIFlagPrototyped, spFlags: 0)
!404 = !DISubroutineType(types: !405)
!405 = !{!357, !110, !110}
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !407, file: !359, line: 146)
!407 = !DISubprogram(name: "exit", scope: !298, file: !298, line: 624, type: !408, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!408 = !DISubroutineType(types: !409)
!409 = !{null, !110}
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !411, file: !359, line: 147)
!411 = !DISubprogram(name: "free", scope: !298, file: !298, line: 555, type: !412, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DISubroutineType(types: !413)
!413 = !{null, !101}
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !415, file: !359, line: 148)
!415 = !DISubprogram(name: "getenv", scope: !298, file: !298, line: 641, type: !416, flags: DIFlagPrototyped, spFlags: 0)
!416 = !DISubroutineType(types: !417)
!417 = !{!418, !251}
!418 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !253, size: 64)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !420, file: !359, line: 149)
!420 = !DISubprogram(name: "labs", scope: !298, file: !298, line: 849, type: !206, flags: DIFlagPrototyped, spFlags: 0)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !422, file: !359, line: 150)
!422 = !DISubprogram(name: "ldiv", scope: !298, file: !298, line: 862, type: !423, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DISubroutineType(types: !424)
!424 = !{!361, !208, !208}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !426, file: !359, line: 151)
!426 = !DISubprogram(name: "malloc", scope: !298, file: !298, line: 540, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!427 = !DISubroutineType(types: !428)
!428 = !{!101, !391}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !430, file: !359, line: 153)
!430 = !DISubprogram(name: "mblen", scope: !298, file: !298, line: 930, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!431 = !DISubroutineType(types: !432)
!432 = !{!110, !251, !391}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !434, file: !359, line: 154)
!434 = !DISubprogram(name: "mbstowcs", scope: !298, file: !298, line: 941, type: !435, flags: DIFlagPrototyped, spFlags: 0)
!435 = !DISubroutineType(types: !436)
!436 = !{!391, !437, !440, !391}
!437 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !438)
!438 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !439, size: 64)
!439 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!440 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !251)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !442, file: !359, line: 155)
!442 = !DISubprogram(name: "mbtowc", scope: !298, file: !298, line: 933, type: !443, flags: DIFlagPrototyped, spFlags: 0)
!443 = !DISubroutineType(types: !444)
!444 = !{!110, !437, !440, !391}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !446, file: !359, line: 157)
!446 = !DISubprogram(name: "qsort", scope: !298, file: !298, line: 838, type: !447, flags: DIFlagPrototyped, spFlags: 0)
!447 = !DISubroutineType(types: !448)
!448 = !{null, !101, !391, !391, !394}
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !450, file: !359, line: 163)
!450 = !DISubprogram(name: "rand", scope: !298, file: !298, line: 454, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!451 = !DISubroutineType(types: !452)
!452 = !{!110}
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !454, file: !359, line: 164)
!454 = !DISubprogram(name: "realloc", scope: !298, file: !298, line: 551, type: !455, flags: DIFlagPrototyped, spFlags: 0)
!455 = !DISubroutineType(types: !456)
!456 = !{!101, !101, !391}
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !458, file: !359, line: 165)
!458 = !DISubprogram(name: "srand", scope: !298, file: !298, line: 456, type: !459, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DISubroutineType(types: !460)
!460 = !{null, !9}
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !462, file: !359, line: 166)
!462 = !DISubprogram(name: "strtod", scope: !298, file: !298, line: 118, type: !463, flags: DIFlagPrototyped, spFlags: 0)
!463 = !DISubroutineType(types: !464)
!464 = !{!100, !440, !465}
!465 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !466)
!466 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !418, size: 64)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !468, file: !359, line: 167)
!468 = !DISubprogram(name: "strtol", scope: !298, file: !298, line: 177, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!469 = !DISubroutineType(types: !470)
!470 = !{!208, !440, !465, !110}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !472, file: !359, line: 168)
!472 = !DISubprogram(name: "strtoul", scope: !298, file: !298, line: 181, type: !473, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DISubroutineType(types: !474)
!474 = !{!393, !440, !465, !110}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !476, file: !359, line: 169)
!476 = !DISubprogram(name: "system", scope: !298, file: !298, line: 791, type: !379, flags: DIFlagPrototyped, spFlags: 0)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !478, file: !359, line: 171)
!478 = !DISubprogram(name: "wcstombs", scope: !298, file: !298, line: 945, type: !479, flags: DIFlagPrototyped, spFlags: 0)
!479 = !DISubroutineType(types: !480)
!480 = !{!391, !481, !482, !391}
!481 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !418)
!482 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !483)
!483 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !484, size: 64)
!484 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !439)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !486, file: !359, line: 172)
!486 = !DISubprogram(name: "wctomb", scope: !298, file: !298, line: 937, type: !487, flags: DIFlagPrototyped, spFlags: 0)
!487 = !DISubroutineType(types: !488)
!488 = !{!110, !418, !439}
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !491, file: !359, line: 200)
!490 = !DINamespace(name: "__gnu_cxx", scope: null)
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !298, line: 81, baseType: !492)
!492 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !298, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !493, identifier: "_ZTS7lldiv_t")
!493 = !{!494, !495}
!494 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !492, file: !298, line: 79, baseType: !219, size: 64)
!495 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !492, file: !298, line: 80, baseType: !219, size: 64, offset: 64)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !497, file: !359, line: 206)
!497 = !DISubprogram(name: "_Exit", scope: !298, file: !298, line: 636, type: !408, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !499, file: !359, line: 210)
!499 = !DISubprogram(name: "llabs", scope: !298, file: !298, line: 852, type: !217, flags: DIFlagPrototyped, spFlags: 0)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !501, file: !359, line: 216)
!501 = !DISubprogram(name: "lldiv", scope: !298, file: !298, line: 866, type: !502, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DISubroutineType(types: !503)
!503 = !{!491, !219, !219}
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !505, file: !359, line: 227)
!505 = !DISubprogram(name: "atoll", scope: !298, file: !298, line: 113, type: !506, flags: DIFlagPrototyped, spFlags: 0)
!506 = !DISubroutineType(types: !507)
!507 = !{!219, !251}
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !509, file: !359, line: 228)
!509 = !DISubprogram(name: "strtoll", scope: !298, file: !298, line: 201, type: !510, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DISubroutineType(types: !511)
!511 = !{!219, !440, !465, !110}
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !513, file: !359, line: 229)
!513 = !DISubprogram(name: "strtoull", scope: !298, file: !298, line: 206, type: !514, flags: DIFlagPrototyped, spFlags: 0)
!514 = !DISubroutineType(types: !515)
!515 = !{!516, !440, !465, !110}
!516 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !518, file: !359, line: 231)
!518 = !DISubprogram(name: "strtof", scope: !298, file: !298, line: 124, type: !519, flags: DIFlagPrototyped, spFlags: 0)
!519 = !DISubroutineType(types: !520)
!520 = !{!115, !440, !465}
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !490, entity: !522, file: !359, line: 232)
!522 = !DISubprogram(name: "strtold", scope: !298, file: !298, line: 127, type: !523, flags: DIFlagPrototyped, spFlags: 0)
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
!538 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/stdlib.h", directory: "")
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
!574 = !DIFile(filename: "llvm-install-tulip/lib/clang/9.0.0/include/__clang_cuda_cmath.h", directory: "/scratch/ah7226")
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
!685 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/math.h", directory: "")
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !4, entity: !687, file: !685, line: 54)
!687 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !105, file: !305, line: 380, type: !688, flags: DIFlagPrototyped, spFlags: 0)
!688 = !DISubroutineType(types: !689)
!689 = !{!525, !525, !690}
!690 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !525, size: 64)
!691 = !{!"clang version 9.0.0 (https://github.com/yebinchon/llvm-project/ a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)"}
!692 = distinct !DISubprogram(name: "kernel_x1", linkageName: "_Z9kernel_x1iPdS_S_S_S_", scope: !5, file: !5, line: 63, type: !693, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !110, !99, !99, !99, !99, !99}
!695 = !{}
!696 = !DILocalVariable(name: "n", arg: 1, scope: !692, file: !5, line: 63, type: !110)
!697 = !DILocation(line: 63, column: 31, scope: !692)
!698 = !DILocalVariable(name: "x1", arg: 2, scope: !692, file: !5, line: 64, type: !99)
!699 = !DILocation(line: 64, column: 35, scope: !692)
!700 = !DILocalVariable(name: "x2", arg: 3, scope: !692, file: !5, line: 65, type: !99)
!701 = !DILocation(line: 65, column: 35, scope: !692)
!702 = !DILocalVariable(name: "y_1", arg: 4, scope: !692, file: !5, line: 66, type: !99)
!703 = !DILocation(line: 66, column: 35, scope: !692)
!704 = !DILocalVariable(name: "y_2", arg: 5, scope: !692, file: !5, line: 67, type: !99)
!705 = !DILocation(line: 67, column: 35, scope: !692)
!706 = !DILocalVariable(name: "A", arg: 6, scope: !692, file: !5, line: 68, type: !99)
!707 = !DILocation(line: 68, column: 35, scope: !692)
!708 = !DILocation(line: 68, column: 38, scope: !692)
!709 = !DILocation(line: 75, column: 1, scope: !692)
!710 = distinct !DISubprogram(name: "kernel_x2", linkageName: "_Z9kernel_x2iPdS_S_S_S_", scope: !5, file: !5, line: 78, type: !693, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!711 = !DILocalVariable(name: "n", arg: 1, scope: !710, file: !5, line: 78, type: !110)
!712 = !DILocation(line: 78, column: 31, scope: !710)
!713 = !DILocalVariable(name: "x1", arg: 2, scope: !710, file: !5, line: 79, type: !99)
!714 = !DILocation(line: 79, column: 35, scope: !710)
!715 = !DILocalVariable(name: "x2", arg: 3, scope: !710, file: !5, line: 80, type: !99)
!716 = !DILocation(line: 80, column: 35, scope: !710)
!717 = !DILocalVariable(name: "y_1", arg: 4, scope: !710, file: !5, line: 81, type: !99)
!718 = !DILocation(line: 81, column: 35, scope: !710)
!719 = !DILocalVariable(name: "y_2", arg: 5, scope: !710, file: !5, line: 82, type: !99)
!720 = !DILocation(line: 82, column: 35, scope: !710)
!721 = !DILocalVariable(name: "A", arg: 6, scope: !710, file: !5, line: 83, type: !99)
!722 = !DILocation(line: 83, column: 35, scope: !710)
!723 = !DILocation(line: 83, column: 38, scope: !710)
!724 = !DILocation(line: 90, column: 1, scope: !710)
!725 = distinct !DISubprogram(name: "num_blocks", linkageName: "_Z10num_blocksss", scope: !5, file: !5, line: 93, type: !726, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!726 = !DISubroutineType(types: !727)
!727 = !{!728, !728, !728}
!728 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!729 = !DILocalVariable(name: "num", arg: 1, scope: !725, file: !5, line: 93, type: !728)
!730 = !DILocation(line: 93, column: 24, scope: !725)
!731 = !DILocalVariable(name: "factor", arg: 2, scope: !725, file: !5, line: 93, type: !728)
!732 = !DILocation(line: 93, column: 35, scope: !725)
!733 = !DILocation(line: 94, column: 11, scope: !725)
!734 = !DILocation(line: 94, column: 17, scope: !725)
!735 = !DILocation(line: 94, column: 15, scope: !725)
!736 = !DILocation(line: 94, column: 24, scope: !725)
!737 = !DILocation(line: 94, column: 31, scope: !725)
!738 = !DILocation(line: 94, column: 29, scope: !725)
!739 = !DILocation(line: 94, column: 10, scope: !725)
!740 = !DILocation(line: 94, column: 3, scope: !725)
!741 = distinct !DISubprogram(name: "kernel", linkageName: "_Z6kerneliPdS_S_S_S_", scope: !5, file: !5, line: 97, type: !693, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!742 = !DILocalVariable(name: "n", arg: 1, scope: !741, file: !5, line: 97, type: !110)
!743 = !DILocation(line: 97, column: 17, scope: !741)
!744 = !DILocalVariable(name: "x1", arg: 2, scope: !741, file: !5, line: 98, type: !99)
!745 = !DILocation(line: 98, column: 21, scope: !741)
!746 = !DILocalVariable(name: "x2", arg: 3, scope: !741, file: !5, line: 99, type: !99)
!747 = !DILocation(line: 99, column: 21, scope: !741)
!748 = !DILocalVariable(name: "y_1", arg: 4, scope: !741, file: !5, line: 100, type: !99)
!749 = !DILocation(line: 100, column: 21, scope: !741)
!750 = !DILocalVariable(name: "y_2", arg: 5, scope: !741, file: !5, line: 101, type: !99)
!751 = !DILocation(line: 101, column: 21, scope: !741)
!752 = !DILocalVariable(name: "A", arg: 6, scope: !741, file: !5, line: 102, type: !99)
!753 = !DILocation(line: 102, column: 21, scope: !741)
!754 = !DILocalVariable(name: "threadsPerBlock", scope: !741, file: !5, line: 103, type: !728)
!755 = !DILocation(line: 103, column: 9, scope: !741)
!756 = !DILocation(line: 105, column: 15, scope: !741)
!757 = !DILocation(line: 105, column: 43, scope: !741)
!758 = !DILocation(line: 105, column: 46, scope: !741)
!759 = !DILocation(line: 105, column: 32, scope: !741)
!760 = !DILocation(line: 105, column: 12, scope: !741)
!761 = !DILocation(line: 105, column: 3, scope: !741)
!762 = !DILocation(line: 105, column: 66, scope: !741)
!763 = !DILocation(line: 105, column: 69, scope: !741)
!764 = !DILocation(line: 105, column: 73, scope: !741)
!765 = !DILocation(line: 105, column: 77, scope: !741)
!766 = !DILocation(line: 105, column: 82, scope: !741)
!767 = !DILocation(line: 105, column: 87, scope: !741)
!768 = !DILocation(line: 106, column: 15, scope: !741)
!769 = !DILocation(line: 106, column: 43, scope: !741)
!770 = !DILocation(line: 106, column: 46, scope: !741)
!771 = !DILocation(line: 106, column: 32, scope: !741)
!772 = !DILocation(line: 106, column: 12, scope: !741)
!773 = !DILocation(line: 106, column: 3, scope: !741)
!774 = !DILocation(line: 106, column: 66, scope: !741)
!775 = !DILocation(line: 106, column: 69, scope: !741)
!776 = !DILocation(line: 106, column: 73, scope: !741)
!777 = !DILocation(line: 106, column: 77, scope: !741)
!778 = !DILocation(line: 106, column: 82, scope: !741)
!779 = !DILocation(line: 106, column: 87, scope: !741)
!780 = !DILocation(line: 108, column: 1, scope: !741)
!781 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !783, file: !782, line: 421, type: !789, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, declaration: !788, retainedNodes: !695)
!782 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!783 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !782, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !784, identifier: "_ZTS4dim3")
!784 = !{!785, !786, !787, !788, !792, !801}
!785 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !783, file: !782, line: 419, baseType: !9, size: 32)
!786 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !783, file: !782, line: 419, baseType: !9, size: 32, offset: 32)
!787 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !783, file: !782, line: 419, baseType: !9, size: 32, offset: 64)
!788 = !DISubprogram(name: "dim3", scope: !783, file: !782, line: 421, type: !789, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!789 = !DISubroutineType(types: !790)
!790 = !{null, !791, !9, !9, !9}
!791 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !783, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!792 = !DISubprogram(name: "dim3", scope: !783, file: !782, line: 422, type: !793, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!793 = !DISubroutineType(types: !794)
!794 = !{null, !791, !795}
!795 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !782, line: 383, baseType: !796)
!796 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !782, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !797, identifier: "_ZTS5uint3")
!797 = !{!798, !799, !800}
!798 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !796, file: !782, line: 192, baseType: !9, size: 32)
!799 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !796, file: !782, line: 192, baseType: !9, size: 32, offset: 32)
!800 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !796, file: !782, line: 192, baseType: !9, size: 32, offset: 64)
!801 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !783, file: !782, line: 423, type: !802, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!802 = !DISubroutineType(types: !803)
!803 = !{!795, !791}
!804 = !DILocalVariable(name: "this", arg: 1, scope: !781, type: !805, flags: DIFlagArtificial | DIFlagObjectPointer)
!805 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !783, size: 64)
!806 = !DILocation(line: 0, scope: !781)
!807 = !DILocalVariable(name: "vx", arg: 2, scope: !781, file: !782, line: 421, type: !9)
!808 = !DILocation(line: 421, column: 43, scope: !781)
!809 = !DILocalVariable(name: "vy", arg: 3, scope: !781, file: !782, line: 421, type: !9)
!810 = !DILocation(line: 421, column: 64, scope: !781)
!811 = !DILocalVariable(name: "vz", arg: 4, scope: !781, file: !782, line: 421, type: !9)
!812 = !DILocation(line: 421, column: 85, scope: !781)
!813 = !DILocation(line: 421, column: 95, scope: !781)
!814 = !DILocation(line: 421, column: 97, scope: !781)
!815 = !DILocation(line: 421, column: 102, scope: !781)
!816 = !DILocation(line: 421, column: 104, scope: !781)
!817 = !DILocation(line: 421, column: 109, scope: !781)
!818 = !DILocation(line: 421, column: 111, scope: !781)
!819 = !DILocation(line: 421, column: 116, scope: !781)
!820 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 110, type: !821, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!821 = !DISubroutineType(types: !822)
!822 = !{!110, !110, !466}
!823 = !DILocalVariable(name: "argc", arg: 1, scope: !820, file: !5, line: 110, type: !110)
!824 = !DILocation(line: 110, column: 14, scope: !820)
!825 = !DILocalVariable(name: "argv", arg: 2, scope: !820, file: !5, line: 110, type: !466)
!826 = !DILocation(line: 110, column: 27, scope: !820)
!827 = !DILocalVariable(name: "dump_code", scope: !820, file: !5, line: 113, type: !110)
!828 = !DILocation(line: 113, column: 7, scope: !820)
!829 = !DILocation(line: 113, column: 24, scope: !820)
!830 = !DILocation(line: 113, column: 19, scope: !820)
!831 = !DILocalVariable(name: "n", scope: !820, file: !5, line: 114, type: !110)
!832 = !DILocation(line: 114, column: 7, scope: !820)
!833 = !DILocalVariable(name: "A", scope: !820, file: !5, line: 117, type: !99)
!834 = !DILocation(line: 117, column: 11, scope: !820)
!835 = !DILocation(line: 117, column: 24, scope: !820)
!836 = !DILocation(line: 117, column: 15, scope: !820)
!837 = !DILocalVariable(name: "x1", scope: !820, file: !5, line: 118, type: !99)
!838 = !DILocation(line: 118, column: 11, scope: !820)
!839 = !DILocation(line: 118, column: 47, scope: !820)
!840 = !DILocation(line: 118, column: 46, scope: !820)
!841 = !DILocation(line: 118, column: 25, scope: !820)
!842 = !DILocation(line: 118, column: 16, scope: !820)
!843 = !DILocalVariable(name: "x2", scope: !820, file: !5, line: 119, type: !99)
!844 = !DILocation(line: 119, column: 11, scope: !820)
!845 = !DILocation(line: 119, column: 47, scope: !820)
!846 = !DILocation(line: 119, column: 46, scope: !820)
!847 = !DILocation(line: 119, column: 25, scope: !820)
!848 = !DILocation(line: 119, column: 16, scope: !820)
!849 = !DILocalVariable(name: "y_1", scope: !820, file: !5, line: 120, type: !99)
!850 = !DILocation(line: 120, column: 11, scope: !820)
!851 = !DILocation(line: 120, column: 48, scope: !820)
!852 = !DILocation(line: 120, column: 47, scope: !820)
!853 = !DILocation(line: 120, column: 26, scope: !820)
!854 = !DILocation(line: 120, column: 17, scope: !820)
!855 = !DILocalVariable(name: "y_2", scope: !820, file: !5, line: 121, type: !99)
!856 = !DILocation(line: 121, column: 11, scope: !820)
!857 = !DILocation(line: 121, column: 48, scope: !820)
!858 = !DILocation(line: 121, column: 47, scope: !820)
!859 = !DILocation(line: 121, column: 26, scope: !820)
!860 = !DILocation(line: 121, column: 17, scope: !820)
!861 = !DILocation(line: 124, column: 15, scope: !820)
!862 = !DILocation(line: 125, column: 8, scope: !820)
!863 = !DILocation(line: 126, column: 8, scope: !820)
!864 = !DILocation(line: 127, column: 8, scope: !820)
!865 = !DILocation(line: 128, column: 8, scope: !820)
!866 = !DILocation(line: 129, column: 8, scope: !820)
!867 = !DILocation(line: 124, column: 3, scope: !820)
!868 = !DILocalVariable(name: "dev_A", scope: !820, file: !5, line: 132, type: !99)
!869 = !DILocation(line: 132, column: 11, scope: !820)
!870 = !DILocalVariable(name: "dev_x1", scope: !820, file: !5, line: 133, type: !99)
!871 = !DILocation(line: 133, column: 11, scope: !820)
!872 = !DILocalVariable(name: "dev_x2", scope: !820, file: !5, line: 134, type: !99)
!873 = !DILocation(line: 134, column: 11, scope: !820)
!874 = !DILocalVariable(name: "dev_y_1", scope: !820, file: !5, line: 135, type: !99)
!875 = !DILocation(line: 135, column: 11, scope: !820)
!876 = !DILocalVariable(name: "dev_y_2", scope: !820, file: !5, line: 136, type: !99)
!877 = !DILocation(line: 136, column: 11, scope: !820)
!878 = !DILocation(line: 138, column: 22, scope: !820)
!879 = !DILocation(line: 138, column: 24, scope: !820)
!880 = !DILocation(line: 138, column: 23, scope: !820)
!881 = !DILocation(line: 138, column: 25, scope: !820)
!882 = !DILocation(line: 138, column: 3, scope: !820)
!883 = !DILocation(line: 139, column: 23, scope: !820)
!884 = !DILocation(line: 139, column: 24, scope: !820)
!885 = !DILocation(line: 139, column: 3, scope: !820)
!886 = !DILocation(line: 140, column: 23, scope: !820)
!887 = !DILocation(line: 140, column: 24, scope: !820)
!888 = !DILocation(line: 140, column: 3, scope: !820)
!889 = !DILocation(line: 141, column: 24, scope: !820)
!890 = !DILocation(line: 141, column: 25, scope: !820)
!891 = !DILocation(line: 141, column: 3, scope: !820)
!892 = !DILocation(line: 142, column: 24, scope: !820)
!893 = !DILocation(line: 142, column: 25, scope: !820)
!894 = !DILocation(line: 142, column: 3, scope: !820)
!895 = !DILocation(line: 144, column: 14, scope: !820)
!896 = !DILocation(line: 144, column: 21, scope: !820)
!897 = !DILocation(line: 144, column: 24, scope: !820)
!898 = !DILocation(line: 144, column: 28, scope: !820)
!899 = !DILocation(line: 144, column: 26, scope: !820)
!900 = !DILocation(line: 144, column: 30, scope: !820)
!901 = !DILocation(line: 144, column: 3, scope: !820)
!902 = !DILocation(line: 145, column: 14, scope: !820)
!903 = !DILocation(line: 145, column: 22, scope: !820)
!904 = !DILocation(line: 145, column: 26, scope: !820)
!905 = !DILocation(line: 145, column: 28, scope: !820)
!906 = !DILocation(line: 145, column: 3, scope: !820)
!907 = !DILocation(line: 146, column: 14, scope: !820)
!908 = !DILocation(line: 146, column: 22, scope: !820)
!909 = !DILocation(line: 146, column: 26, scope: !820)
!910 = !DILocation(line: 146, column: 28, scope: !820)
!911 = !DILocation(line: 146, column: 3, scope: !820)
!912 = !DILocation(line: 147, column: 14, scope: !820)
!913 = !DILocation(line: 147, column: 23, scope: !820)
!914 = !DILocation(line: 147, column: 28, scope: !820)
!915 = !DILocation(line: 147, column: 30, scope: !820)
!916 = !DILocation(line: 147, column: 3, scope: !820)
!917 = !DILocation(line: 148, column: 14, scope: !820)
!918 = !DILocation(line: 148, column: 23, scope: !820)
!919 = !DILocation(line: 148, column: 28, scope: !820)
!920 = !DILocation(line: 148, column: 30, scope: !820)
!921 = !DILocation(line: 148, column: 3, scope: !820)
!922 = !DILocation(line: 151, column: 10, scope: !820)
!923 = !DILocation(line: 151, column: 13, scope: !820)
!924 = !DILocation(line: 151, column: 21, scope: !820)
!925 = !DILocation(line: 151, column: 29, scope: !820)
!926 = !DILocation(line: 151, column: 38, scope: !820)
!927 = !DILocation(line: 151, column: 47, scope: !820)
!928 = !DILocation(line: 151, column: 3, scope: !820)
!929 = !DILocation(line: 153, column: 14, scope: !820)
!930 = !DILocation(line: 153, column: 18, scope: !820)
!931 = !DILocation(line: 153, column: 26, scope: !820)
!932 = !DILocation(line: 153, column: 28, scope: !820)
!933 = !DILocation(line: 153, column: 3, scope: !820)
!934 = !DILocation(line: 154, column: 14, scope: !820)
!935 = !DILocation(line: 154, column: 18, scope: !820)
!936 = !DILocation(line: 154, column: 26, scope: !820)
!937 = !DILocation(line: 154, column: 28, scope: !820)
!938 = !DILocation(line: 154, column: 3, scope: !820)
!939 = !DILocation(line: 159, column: 6, scope: !940)
!940 = distinct !DILexicalBlock(scope: !820, file: !5, line: 159, column: 6)
!941 = !DILocation(line: 159, column: 16, scope: !940)
!942 = !DILocation(line: 159, column: 6, scope: !820)
!943 = !DILocation(line: 159, column: 34, scope: !940)
!944 = !DILocation(line: 159, column: 37, scope: !940)
!945 = !DILocation(line: 159, column: 41, scope: !940)
!946 = !DILocation(line: 159, column: 22, scope: !940)
!947 = !DILocation(line: 162, column: 15, scope: !820)
!948 = !DILocation(line: 162, column: 3, scope: !820)
!949 = !DILocation(line: 163, column: 15, scope: !820)
!950 = !DILocation(line: 163, column: 3, scope: !820)
!951 = !DILocation(line: 164, column: 15, scope: !820)
!952 = !DILocation(line: 164, column: 3, scope: !820)
!953 = !DILocation(line: 165, column: 15, scope: !820)
!954 = !DILocation(line: 165, column: 3, scope: !820)
!955 = !DILocation(line: 166, column: 15, scope: !820)
!956 = !DILocation(line: 166, column: 3, scope: !820)
!957 = !DILocation(line: 168, column: 3, scope: !820)
!958 = distinct !DISubprogram(name: "init_array", linkageName: "_ZL10init_arrayiPdS_S_S_S_", scope: !5, file: !5, line: 24, type: !693, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!959 = !DILocalVariable(name: "n", arg: 1, scope: !958, file: !5, line: 24, type: !110)
!960 = !DILocation(line: 24, column: 21, scope: !958)
!961 = !DILocalVariable(name: "x1", arg: 2, scope: !958, file: !5, line: 25, type: !99)
!962 = !DILocation(line: 25, column: 11, scope: !958)
!963 = !DILocalVariable(name: "x2", arg: 3, scope: !958, file: !5, line: 26, type: !99)
!964 = !DILocation(line: 26, column: 11, scope: !958)
!965 = !DILocalVariable(name: "y_1", arg: 4, scope: !958, file: !5, line: 27, type: !99)
!966 = !DILocation(line: 27, column: 11, scope: !958)
!967 = !DILocalVariable(name: "y_2", arg: 5, scope: !958, file: !5, line: 28, type: !99)
!968 = !DILocation(line: 28, column: 11, scope: !958)
!969 = !DILocalVariable(name: "A", arg: 6, scope: !958, file: !5, line: 29, type: !99)
!970 = !DILocation(line: 29, column: 11, scope: !958)
!971 = !DILocalVariable(name: "i", scope: !958, file: !5, line: 31, type: !110)
!972 = !DILocation(line: 31, column: 7, scope: !958)
!973 = !DILocalVariable(name: "j", scope: !958, file: !5, line: 31, type: !110)
!974 = !DILocation(line: 31, column: 10, scope: !958)
!975 = !DILocation(line: 33, column: 10, scope: !976)
!976 = distinct !DILexicalBlock(scope: !958, file: !5, line: 33, column: 3)
!977 = !DILocation(line: 33, column: 8, scope: !976)
!978 = !DILocation(line: 33, column: 15, scope: !979)
!979 = distinct !DILexicalBlock(scope: !976, file: !5, line: 33, column: 3)
!980 = !DILocation(line: 33, column: 19, scope: !979)
!981 = !DILocation(line: 33, column: 17, scope: !979)
!982 = !DILocation(line: 33, column: 3, scope: !976)
!983 = !DILocation(line: 35, column: 25, scope: !984)
!984 = distinct !DILexicalBlock(scope: !979, file: !5, line: 34, column: 5)
!985 = !DILocation(line: 35, column: 30, scope: !984)
!986 = !DILocation(line: 35, column: 28, scope: !984)
!987 = !DILocation(line: 35, column: 7, scope: !984)
!988 = !DILocation(line: 35, column: 10, scope: !984)
!989 = !DILocation(line: 35, column: 13, scope: !984)
!990 = !DILocation(line: 36, column: 25, scope: !984)
!991 = !DILocation(line: 36, column: 27, scope: !984)
!992 = !DILocation(line: 36, column: 34, scope: !984)
!993 = !DILocation(line: 36, column: 32, scope: !984)
!994 = !DILocation(line: 36, column: 7, scope: !984)
!995 = !DILocation(line: 36, column: 10, scope: !984)
!996 = !DILocation(line: 36, column: 13, scope: !984)
!997 = !DILocation(line: 37, column: 26, scope: !984)
!998 = !DILocation(line: 37, column: 28, scope: !984)
!999 = !DILocation(line: 37, column: 35, scope: !984)
!1000 = !DILocation(line: 37, column: 33, scope: !984)
!1001 = !DILocation(line: 37, column: 7, scope: !984)
!1002 = !DILocation(line: 37, column: 11, scope: !984)
!1003 = !DILocation(line: 37, column: 14, scope: !984)
!1004 = !DILocation(line: 38, column: 26, scope: !984)
!1005 = !DILocation(line: 38, column: 28, scope: !984)
!1006 = !DILocation(line: 38, column: 35, scope: !984)
!1007 = !DILocation(line: 38, column: 33, scope: !984)
!1008 = !DILocation(line: 38, column: 7, scope: !984)
!1009 = !DILocation(line: 38, column: 11, scope: !984)
!1010 = !DILocation(line: 38, column: 14, scope: !984)
!1011 = !DILocation(line: 39, column: 14, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !984, file: !5, line: 39, column: 7)
!1013 = !DILocation(line: 39, column: 12, scope: !1012)
!1014 = !DILocation(line: 39, column: 19, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1012, file: !5, line: 39, column: 7)
!1016 = !DILocation(line: 39, column: 23, scope: !1015)
!1017 = !DILocation(line: 39, column: 21, scope: !1015)
!1018 = !DILocation(line: 39, column: 7, scope: !1012)
!1019 = !DILocation(line: 40, column: 29, scope: !1015)
!1020 = !DILocation(line: 40, column: 31, scope: !1015)
!1021 = !DILocation(line: 40, column: 30, scope: !1015)
!1022 = !DILocation(line: 40, column: 36, scope: !1015)
!1023 = !DILocation(line: 40, column: 34, scope: !1015)
!1024 = !DILocation(line: 40, column: 8, scope: !1015)
!1025 = !DILocation(line: 40, column: 10, scope: !1015)
!1026 = !DILocation(line: 40, column: 12, scope: !1015)
!1027 = !DILocation(line: 40, column: 11, scope: !1015)
!1028 = !DILocation(line: 40, column: 14, scope: !1015)
!1029 = !DILocation(line: 40, column: 13, scope: !1015)
!1030 = !DILocation(line: 40, column: 17, scope: !1015)
!1031 = !DILocation(line: 39, column: 27, scope: !1015)
!1032 = !DILocation(line: 39, column: 7, scope: !1015)
!1033 = distinct !{!1033, !1018, !1034}
!1034 = !DILocation(line: 40, column: 36, scope: !1012)
!1035 = !DILocation(line: 41, column: 5, scope: !984)
!1036 = !DILocation(line: 33, column: 23, scope: !979)
!1037 = !DILocation(line: 33, column: 3, scope: !979)
!1038 = distinct !{!1038, !982, !1039}
!1039 = !DILocation(line: 41, column: 5, scope: !976)
!1040 = !DILocation(line: 42, column: 1, scope: !958)
!1041 = distinct !DISubprogram(name: "cudaMalloc<double>", linkageName: "_ZL10cudaMallocIdE9cudaErrorPPT_m", scope: !1042, file: !1042, line: 490, type: !1043, scopeLine: 494, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, templateParams: !1047, retainedNodes: !695)
!1042 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "")
!1043 = !DISubroutineType(types: !1044)
!1044 = !{!1045, !1046, !391}
!1045 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !8, line: 1419, baseType: !16)
!1046 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!1047 = !{!1048}
!1048 = !DITemplateTypeParameter(name: "T", type: !100)
!1049 = !DILocalVariable(name: "devPtr", arg: 1, scope: !1041, file: !1042, line: 491, type: !1046)
!1050 = !DILocation(line: 491, column: 12, scope: !1041)
!1051 = !DILocalVariable(name: "size", arg: 2, scope: !1041, file: !1042, line: 492, type: !391)
!1052 = !DILocation(line: 492, column: 12, scope: !1041)
!1053 = !DILocation(line: 495, column: 38, scope: !1041)
!1054 = !DILocation(line: 495, column: 23, scope: !1041)
!1055 = !DILocation(line: 495, column: 46, scope: !1041)
!1056 = !DILocation(line: 495, column: 10, scope: !1041)
!1057 = !DILocation(line: 495, column: 3, scope: !1041)
!1058 = distinct !DISubprogram(name: "print_array", linkageName: "_ZL11print_arrayiPdS_", scope: !5, file: !5, line: 48, type: !1059, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1059 = !DISubroutineType(types: !1060)
!1060 = !{null, !110, !99, !99}
!1061 = !DILocalVariable(name: "n", arg: 1, scope: !1058, file: !5, line: 48, type: !110)
!1062 = !DILocation(line: 48, column: 22, scope: !1058)
!1063 = !DILocalVariable(name: "x1", arg: 2, scope: !1058, file: !5, line: 49, type: !99)
!1064 = !DILocation(line: 49, column: 12, scope: !1058)
!1065 = !DILocalVariable(name: "x2", arg: 3, scope: !1058, file: !5, line: 50, type: !99)
!1066 = !DILocation(line: 50, column: 12, scope: !1058)
!1067 = !DILocalVariable(name: "i", scope: !1058, file: !5, line: 53, type: !110)
!1068 = !DILocation(line: 53, column: 7, scope: !1058)
!1069 = !DILocation(line: 55, column: 10, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1058, file: !5, line: 55, column: 3)
!1071 = !DILocation(line: 55, column: 8, scope: !1070)
!1072 = !DILocation(line: 55, column: 15, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1070, file: !5, line: 55, column: 3)
!1074 = !DILocation(line: 55, column: 19, scope: !1073)
!1075 = !DILocation(line: 55, column: 17, scope: !1073)
!1076 = !DILocation(line: 55, column: 3, scope: !1070)
!1077 = !DILocation(line: 56, column: 14, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1073, file: !5, line: 55, column: 27)
!1079 = !DILocation(line: 56, column: 32, scope: !1078)
!1080 = !DILocation(line: 56, column: 35, scope: !1078)
!1081 = !DILocation(line: 56, column: 5, scope: !1078)
!1082 = !DILocation(line: 57, column: 14, scope: !1078)
!1083 = !DILocation(line: 57, column: 32, scope: !1078)
!1084 = !DILocation(line: 57, column: 35, scope: !1078)
!1085 = !DILocation(line: 57, column: 5, scope: !1078)
!1086 = !DILocation(line: 58, column: 9, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1078, file: !5, line: 58, column: 9)
!1088 = !DILocation(line: 58, column: 11, scope: !1087)
!1089 = !DILocation(line: 58, column: 16, scope: !1087)
!1090 = !DILocation(line: 58, column: 9, scope: !1078)
!1091 = !DILocation(line: 58, column: 31, scope: !1087)
!1092 = !DILocation(line: 58, column: 22, scope: !1087)
!1093 = !DILocation(line: 59, column: 3, scope: !1078)
!1094 = !DILocation(line: 55, column: 23, scope: !1073)
!1095 = !DILocation(line: 55, column: 3, scope: !1073)
!1096 = distinct !{!1096, !1076, !1097}
!1097 = !DILocation(line: 59, column: 3, scope: !1070)
!1098 = !DILocation(line: 60, column: 1, scope: !1058)
