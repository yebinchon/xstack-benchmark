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
  %dev_A = alloca double*, align 8
  %dev_x1 = alloca double*, align 8
  %dev_x2 = alloca double*, align 8
  %dev_y_1 = alloca double*, align 8
  %dev_y_2 = alloca double*, align 8
  %threadsPerBlock = alloca i16, align 2
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp31 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp31.coerce = alloca { i64, i32 }, align 4
  %agg.tmp36 = alloca %struct.dim3, align 4
  %agg.tmp38 = alloca %struct.dim3, align 4
  %agg.tmp36.coerce = alloca { i64, i32 }, align 4
  %agg.tmp38.coerce = alloca { i64, i32 }, align 4
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
  call void @llvm.dbg.declare(metadata double** %dev_A, metadata !754, metadata !DIExpression()), !dbg !755
  call void @llvm.dbg.declare(metadata double** %dev_x1, metadata !756, metadata !DIExpression()), !dbg !757
  call void @llvm.dbg.declare(metadata double** %dev_x2, metadata !758, metadata !DIExpression()), !dbg !759
  call void @llvm.dbg.declare(metadata double** %dev_y_1, metadata !760, metadata !DIExpression()), !dbg !761
  call void @llvm.dbg.declare(metadata double** %dev_y_2, metadata !762, metadata !DIExpression()), !dbg !763
  %0 = load i32, i32* %n.addr, align 4, !dbg !764
  %1 = load i32, i32* %n.addr, align 4, !dbg !765
  %mul = mul nsw i32 %0, %1, !dbg !766
  %conv = sext i32 %mul to i64, !dbg !764
  %mul1 = mul i64 %conv, 8, !dbg !767
  %call = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_A, i64 %mul1), !dbg !768
  %2 = load i32, i32* %n.addr, align 4, !dbg !769
  %conv2 = sext i32 %2 to i64, !dbg !769
  %mul3 = mul i64 %conv2, 8, !dbg !770
  %call4 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_x1, i64 %mul3), !dbg !771
  %3 = load i32, i32* %n.addr, align 4, !dbg !772
  %conv5 = sext i32 %3 to i64, !dbg !772
  %mul6 = mul i64 %conv5, 8, !dbg !773
  %call7 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_x2, i64 %mul6), !dbg !774
  %4 = load i32, i32* %n.addr, align 4, !dbg !775
  %conv8 = sext i32 %4 to i64, !dbg !775
  %mul9 = mul i64 %conv8, 8, !dbg !776
  %call10 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_y_1, i64 %mul9), !dbg !777
  %5 = load i32, i32* %n.addr, align 4, !dbg !778
  %conv11 = sext i32 %5 to i64, !dbg !778
  %mul12 = mul i64 %conv11, 8, !dbg !779
  %call13 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_y_2, i64 %mul12), !dbg !780
  %6 = load double*, double** %dev_A, align 8, !dbg !781
  %7 = bitcast double* %6 to i8*, !dbg !781
  %8 = load double*, double** %A.addr, align 8, !dbg !782
  %9 = bitcast double* %8 to i8*, !dbg !782
  %10 = load i32, i32* %n.addr, align 4, !dbg !783
  %11 = load i32, i32* %n.addr, align 4, !dbg !784
  %mul14 = mul nsw i32 %10, %11, !dbg !785
  %conv15 = sext i32 %mul14 to i64, !dbg !783
  %mul16 = mul i64 %conv15, 8, !dbg !786
  %call17 = call i32 @cudaMemcpy(i8* %7, i8* %9, i64 %mul16, i32 1), !dbg !787
  %12 = load double*, double** %dev_x1, align 8, !dbg !788
  %13 = bitcast double* %12 to i8*, !dbg !788
  %14 = load double*, double** %x1.addr, align 8, !dbg !789
  %15 = bitcast double* %14 to i8*, !dbg !789
  %16 = load i32, i32* %n.addr, align 4, !dbg !790
  %conv18 = sext i32 %16 to i64, !dbg !790
  %mul19 = mul i64 %conv18, 8, !dbg !791
  %call20 = call i32 @cudaMemcpy(i8* %13, i8* %15, i64 %mul19, i32 1), !dbg !792
  %17 = load double*, double** %dev_x2, align 8, !dbg !793
  %18 = bitcast double* %17 to i8*, !dbg !793
  %19 = load double*, double** %x2.addr, align 8, !dbg !794
  %20 = bitcast double* %19 to i8*, !dbg !794
  %21 = load i32, i32* %n.addr, align 4, !dbg !795
  %conv21 = sext i32 %21 to i64, !dbg !795
  %mul22 = mul i64 %conv21, 8, !dbg !796
  %call23 = call i32 @cudaMemcpy(i8* %18, i8* %20, i64 %mul22, i32 1), !dbg !797
  %22 = load double*, double** %dev_y_1, align 8, !dbg !798
  %23 = bitcast double* %22 to i8*, !dbg !798
  %24 = load double*, double** %y_1.addr, align 8, !dbg !799
  %25 = bitcast double* %24 to i8*, !dbg !799
  %26 = load i32, i32* %n.addr, align 4, !dbg !800
  %conv24 = sext i32 %26 to i64, !dbg !800
  %mul25 = mul i64 %conv24, 8, !dbg !801
  %call26 = call i32 @cudaMemcpy(i8* %23, i8* %25, i64 %mul25, i32 1), !dbg !802
  %27 = load double*, double** %dev_y_2, align 8, !dbg !803
  %28 = bitcast double* %27 to i8*, !dbg !803
  %29 = load double*, double** %y_2.addr, align 8, !dbg !804
  %30 = bitcast double* %29 to i8*, !dbg !804
  %31 = load i32, i32* %n.addr, align 4, !dbg !805
  %conv27 = sext i32 %31 to i64, !dbg !805
  %mul28 = mul i64 %conv27, 8, !dbg !806
  %call29 = call i32 @cudaMemcpy(i8* %28, i8* %30, i64 %mul28, i32 1), !dbg !807
  call void @llvm.dbg.declare(metadata i16* %threadsPerBlock, metadata !808, metadata !DIExpression()), !dbg !809
  store i16 256, i16* %threadsPerBlock, align 2, !dbg !809
  %32 = load i16, i16* %threadsPerBlock, align 2, !dbg !810
  %conv30 = sext i16 %32 to i32, !dbg !810
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 %conv30, i32 1, i32 1), !dbg !810
  %33 = load i32, i32* %n.addr, align 4, !dbg !811
  %conv32 = trunc i32 %33 to i16, !dbg !811
  %34 = load i16, i16* %threadsPerBlock, align 2, !dbg !812
  %call33 = call signext i16 @_Z10num_blocksss(i16 signext %conv32, i16 signext %34), !dbg !813
  %conv34 = sext i16 %call33 to i32, !dbg !813
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp31, i32 %conv34, i32 1, i32 1), !dbg !813
  %35 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !814
  %36 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !814
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %35, i8* align 4 %36, i64 12, i1 false), !dbg !814
  %37 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !814
  %38 = load i64, i64* %37, align 4, !dbg !814
  %39 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !814
  %40 = load i32, i32* %39, align 4, !dbg !814
  %41 = bitcast { i64, i32 }* %agg.tmp31.coerce to i8*, !dbg !814
  %42 = bitcast %struct.dim3* %agg.tmp31 to i8*, !dbg !814
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %41, i8* align 4 %42, i64 12, i1 false), !dbg !814
  %43 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp31.coerce, i32 0, i32 0, !dbg !814
  %44 = load i64, i64* %43, align 4, !dbg !814
  %45 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp31.coerce, i32 0, i32 1, !dbg !814
  %46 = load i32, i32* %45, align 4, !dbg !814
  %call35 = call i32 @cudaConfigureCall(i64 %38, i32 %40, i64 %44, i32 %46, i64 0, %struct.CUstream_st* null), !dbg !814
  %tobool = icmp ne i32 %call35, 0, !dbg !814
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !815

kcall.configok:                                   ; preds = %entry
  %47 = load i32, i32* %n.addr, align 4, !dbg !816
  %48 = load double*, double** %dev_x1, align 8, !dbg !817
  %49 = load double*, double** %dev_x2, align 8, !dbg !818
  %50 = load double*, double** %dev_y_1, align 8, !dbg !819
  %51 = load double*, double** %dev_y_2, align 8, !dbg !820
  %52 = load double*, double** %dev_A, align 8, !dbg !821
  call void @_Z9kernel_x1iPdS_S_S_S_(i32 %47, double* %48, double* %49, double* %50, double* %51, double* %52), !dbg !815
  br label %kcall.end, !dbg !815

kcall.end:                                        ; preds = %kcall.configok, %entry
  %53 = load i16, i16* %threadsPerBlock, align 2, !dbg !822
  %conv37 = sext i16 %53 to i32, !dbg !822
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp36, i32 %conv37, i32 1, i32 1), !dbg !822
  %54 = load i32, i32* %n.addr, align 4, !dbg !823
  %conv39 = trunc i32 %54 to i16, !dbg !823
  %55 = load i16, i16* %threadsPerBlock, align 2, !dbg !824
  %call40 = call signext i16 @_Z10num_blocksss(i16 signext %conv39, i16 signext %55), !dbg !825
  %conv41 = sext i16 %call40 to i32, !dbg !825
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp38, i32 %conv41, i32 1, i32 1), !dbg !825
  %56 = bitcast { i64, i32 }* %agg.tmp36.coerce to i8*, !dbg !826
  %57 = bitcast %struct.dim3* %agg.tmp36 to i8*, !dbg !826
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %56, i8* align 4 %57, i64 12, i1 false), !dbg !826
  %58 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp36.coerce, i32 0, i32 0, !dbg !826
  %59 = load i64, i64* %58, align 4, !dbg !826
  %60 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp36.coerce, i32 0, i32 1, !dbg !826
  %61 = load i32, i32* %60, align 4, !dbg !826
  %62 = bitcast { i64, i32 }* %agg.tmp38.coerce to i8*, !dbg !826
  %63 = bitcast %struct.dim3* %agg.tmp38 to i8*, !dbg !826
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %62, i8* align 4 %63, i64 12, i1 false), !dbg !826
  %64 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp38.coerce, i32 0, i32 0, !dbg !826
  %65 = load i64, i64* %64, align 4, !dbg !826
  %66 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp38.coerce, i32 0, i32 1, !dbg !826
  %67 = load i32, i32* %66, align 4, !dbg !826
  %call42 = call i32 @cudaConfigureCall(i64 %59, i32 %61, i64 %65, i32 %67, i64 0, %struct.CUstream_st* null), !dbg !826
  %tobool43 = icmp ne i32 %call42, 0, !dbg !826
  br i1 %tobool43, label %kcall.end45, label %kcall.configok44, !dbg !827

kcall.configok44:                                 ; preds = %kcall.end
  %68 = load i32, i32* %n.addr, align 4, !dbg !828
  %69 = load double*, double** %dev_x1, align 8, !dbg !829
  %70 = load double*, double** %dev_x2, align 8, !dbg !830
  %71 = load double*, double** %dev_y_1, align 8, !dbg !831
  %72 = load double*, double** %dev_y_2, align 8, !dbg !832
  %73 = load double*, double** %dev_A, align 8, !dbg !833
  call void @_Z9kernel_x2iPdS_S_S_S_(i32 %68, double* %69, double* %70, double* %71, double* %72, double* %73), !dbg !827
  br label %kcall.end45, !dbg !827

kcall.end45:                                      ; preds = %kcall.configok44, %kcall.end
  %74 = load double*, double** %x1.addr, align 8, !dbg !834
  %75 = bitcast double* %74 to i8*, !dbg !834
  %76 = load double*, double** %dev_x1, align 8, !dbg !835
  %77 = bitcast double* %76 to i8*, !dbg !835
  %78 = load i32, i32* %n.addr, align 4, !dbg !836
  %conv46 = sext i32 %78 to i64, !dbg !836
  %mul47 = mul i64 %conv46, 8, !dbg !837
  %call48 = call i32 @cudaMemcpy(i8* %75, i8* %77, i64 %mul47, i32 2), !dbg !838
  %79 = load double*, double** %x2.addr, align 8, !dbg !839
  %80 = bitcast double* %79 to i8*, !dbg !839
  %81 = load double*, double** %dev_x2, align 8, !dbg !840
  %82 = bitcast double* %81 to i8*, !dbg !840
  %83 = load i32, i32* %n.addr, align 4, !dbg !841
  %conv49 = sext i32 %83 to i64, !dbg !841
  %mul50 = mul i64 %conv49, 8, !dbg !842
  %call51 = call i32 @cudaMemcpy(i8* %80, i8* %82, i64 %mul50, i32 2), !dbg !843
  %84 = load double*, double** %dev_A, align 8, !dbg !844
  %85 = bitcast double* %84 to i8*, !dbg !844
  %call52 = call i32 @cudaFree(i8* %85), !dbg !845
  %86 = load double*, double** %dev_x1, align 8, !dbg !846
  %87 = bitcast double* %86 to i8*, !dbg !846
  %call53 = call i32 @cudaFree(i8* %87), !dbg !847
  %88 = load double*, double** %dev_x2, align 8, !dbg !848
  %89 = bitcast double* %88 to i8*, !dbg !848
  %call54 = call i32 @cudaFree(i8* %89), !dbg !849
  %90 = load double*, double** %dev_y_1, align 8, !dbg !850
  %91 = bitcast double* %90 to i8*, !dbg !850
  %call55 = call i32 @cudaFree(i8* %91), !dbg !851
  %92 = load double*, double** %dev_y_2, align 8, !dbg !852
  %93 = bitcast double* %92 to i8*, !dbg !852
  %call56 = call i32 @cudaFree(i8* %93), !dbg !853
  ret void, !dbg !854
}

; Function Attrs: noinline uwtable
define internal i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %devPtr, i64 %size) #0 !dbg !855 {
entry:
  %devPtr.addr = alloca double**, align 8
  %size.addr = alloca i64, align 8
  store double** %devPtr, double*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %devPtr.addr, metadata !863, metadata !DIExpression()), !dbg !864
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !865, metadata !DIExpression()), !dbg !866
  %0 = load double**, double*** %devPtr.addr, align 8, !dbg !867
  %1 = bitcast double** %0 to i8*, !dbg !867
  %2 = bitcast i8* %1 to i8**, !dbg !868
  %3 = load i64, i64* %size.addr, align 8, !dbg !869
  %call = call i32 @cudaMalloc(i8** %2, i64 %3), !dbg !870
  ret i32 %call, !dbg !871
}

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #3

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #3

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #2 comdat align 2 !dbg !872 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !895, metadata !DIExpression()), !dbg !897
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !898, metadata !DIExpression()), !dbg !899
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !900, metadata !DIExpression()), !dbg !901
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !902, metadata !DIExpression()), !dbg !903
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !904
  %0 = load i32, i32* %vx.addr, align 4, !dbg !905
  store i32 %0, i32* %x, align 4, !dbg !904
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !906
  %1 = load i32, i32* %vy.addr, align 4, !dbg !907
  store i32 %1, i32* %y, align 4, !dbg !906
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !908
  %2 = load i32, i32* %vz.addr, align 4, !dbg !909
  store i32 %2, i32* %z, align 4, !dbg !908
  ret void, !dbg !910
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local i32 @cudaFree(i8*) #3

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #5 !dbg !911 {
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
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !914, metadata !DIExpression()), !dbg !915
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !916, metadata !DIExpression()), !dbg !917
  call void @llvm.dbg.declare(metadata i32* %dump_code, metadata !918, metadata !DIExpression()), !dbg !919
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !920
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !920
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !920
  %call = call i32 @atoi(i8* %1) #8, !dbg !921
  store i32 %call, i32* %dump_code, align 4, !dbg !919
  call void @llvm.dbg.declare(metadata i32* %n, metadata !922, metadata !DIExpression()), !dbg !923
  store i32 15000, i32* %n, align 4, !dbg !923
  call void @llvm.dbg.declare(metadata double** %A, metadata !924, metadata !DIExpression()), !dbg !925
  %call1 = call noalias i8* @malloc(i64 1800000000) #9, !dbg !926
  %2 = bitcast i8* %call1 to double*, !dbg !927
  store double* %2, double** %A, align 8, !dbg !925
  call void @llvm.dbg.declare(metadata double** %x1, metadata !928, metadata !DIExpression()), !dbg !929
  %3 = load i32, i32* %n, align 4, !dbg !930
  %conv = sext i32 %3 to i64, !dbg !930
  %mul = mul i64 8, %conv, !dbg !931
  %call2 = call noalias i8* @malloc(i64 %mul) #9, !dbg !932
  %4 = bitcast i8* %call2 to double*, !dbg !933
  store double* %4, double** %x1, align 8, !dbg !929
  call void @llvm.dbg.declare(metadata double** %x2, metadata !934, metadata !DIExpression()), !dbg !935
  %5 = load i32, i32* %n, align 4, !dbg !936
  %conv3 = sext i32 %5 to i64, !dbg !936
  %mul4 = mul i64 8, %conv3, !dbg !937
  %call5 = call noalias i8* @malloc(i64 %mul4) #9, !dbg !938
  %6 = bitcast i8* %call5 to double*, !dbg !939
  store double* %6, double** %x2, align 8, !dbg !935
  call void @llvm.dbg.declare(metadata double** %y_1, metadata !940, metadata !DIExpression()), !dbg !941
  %7 = load i32, i32* %n, align 4, !dbg !942
  %conv6 = sext i32 %7 to i64, !dbg !942
  %mul7 = mul i64 8, %conv6, !dbg !943
  %call8 = call noalias i8* @malloc(i64 %mul7) #9, !dbg !944
  %8 = bitcast i8* %call8 to double*, !dbg !945
  store double* %8, double** %y_1, align 8, !dbg !941
  call void @llvm.dbg.declare(metadata double** %y_2, metadata !946, metadata !DIExpression()), !dbg !947
  %9 = load i32, i32* %n, align 4, !dbg !948
  %conv9 = sext i32 %9 to i64, !dbg !948
  %mul10 = mul i64 8, %conv9, !dbg !949
  %call11 = call noalias i8* @malloc(i64 %mul10) #9, !dbg !950
  %10 = bitcast i8* %call11 to double*, !dbg !951
  store double* %10, double** %y_2, align 8, !dbg !947
  %11 = load i32, i32* %n, align 4, !dbg !952
  %12 = load double*, double** %x1, align 8, !dbg !953
  %13 = load double*, double** %x2, align 8, !dbg !954
  %14 = load double*, double** %y_1, align 8, !dbg !955
  %15 = load double*, double** %y_2, align 8, !dbg !956
  %16 = load double*, double** %A, align 8, !dbg !957
  call void @_ZL10init_arrayiPdS_S_S_S_(i32 %11, double* %12, double* %13, double* %14, double* %15, double* %16), !dbg !958
  %17 = load i32, i32* %n, align 4, !dbg !959
  %18 = load double*, double** %x1, align 8, !dbg !960
  %19 = load double*, double** %x2, align 8, !dbg !961
  %20 = load double*, double** %y_1, align 8, !dbg !962
  %21 = load double*, double** %y_2, align 8, !dbg !963
  %22 = load double*, double** %A, align 8, !dbg !964
  call void @_Z6kerneliPdS_S_S_S_(i32 %17, double* %18, double* %19, double* %20, double* %21, double* %22), !dbg !965
  %call12 = call i32 @cudaDeviceSynchronize(), !dbg !966
  %23 = load i32, i32* %dump_code, align 4, !dbg !967
  %cmp = icmp eq i32 %23, 1, !dbg !969
  br i1 %cmp, label %if.then, label %if.end, !dbg !970

if.then:                                          ; preds = %entry
  %24 = load i32, i32* %n, align 4, !dbg !971
  %25 = load double*, double** %x1, align 8, !dbg !972
  %26 = load double*, double** %x2, align 8, !dbg !973
  call void @_ZL11print_arrayiPdS_(i32 %24, double* %25, double* %26), !dbg !974
  br label %if.end, !dbg !974

if.end:                                           ; preds = %if.then, %entry
  %27 = load double*, double** %A, align 8, !dbg !975
  %28 = bitcast double* %27 to i8*, !dbg !975
  call void @free(i8* %28) #9, !dbg !976
  %29 = load double*, double** %x1, align 8, !dbg !977
  %30 = bitcast double* %29 to i8*, !dbg !977
  call void @free(i8* %30) #9, !dbg !978
  %31 = load double*, double** %x2, align 8, !dbg !979
  %32 = bitcast double* %31 to i8*, !dbg !979
  call void @free(i8* %32) #9, !dbg !980
  %33 = load double*, double** %y_1, align 8, !dbg !981
  %34 = bitcast double* %33 to i8*, !dbg !981
  call void @free(i8* %34) #9, !dbg !982
  %35 = load double*, double** %y_2, align 8, !dbg !983
  %36 = bitcast double* %35 to i8*, !dbg !983
  call void @free(i8* %36) #9, !dbg !984
  ret i32 0, !dbg !985
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #6

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #7

; Function Attrs: noinline nounwind uwtable
define internal void @_ZL10init_arrayiPdS_S_S_S_(i32 %n, double* %x1, double* %x2, double* %y_1, double* %y_2, double* %A) #2 !dbg !986 {
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
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !987, metadata !DIExpression()), !dbg !988
  store double* %x1, double** %x1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x1.addr, metadata !989, metadata !DIExpression()), !dbg !990
  store double* %x2, double** %x2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x2.addr, metadata !991, metadata !DIExpression()), !dbg !992
  store double* %y_1, double** %y_1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y_1.addr, metadata !993, metadata !DIExpression()), !dbg !994
  store double* %y_2, double** %y_2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y_2.addr, metadata !995, metadata !DIExpression()), !dbg !996
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !997, metadata !DIExpression()), !dbg !998
  call void @llvm.dbg.declare(metadata i32* %i, metadata !999, metadata !DIExpression()), !dbg !1000
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1001, metadata !DIExpression()), !dbg !1002
  store i32 0, i32* %i, align 4, !dbg !1003
  br label %for.cond, !dbg !1005

for.cond:                                         ; preds = %for.inc30, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1006
  %1 = load i32, i32* %n.addr, align 4, !dbg !1008
  %cmp = icmp slt i32 %0, %1, !dbg !1009
  br i1 %cmp, label %for.body, label %for.end32, !dbg !1010

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !1011
  %conv = sitofp i32 %2 to double, !dbg !1011
  %3 = load i32, i32* %n.addr, align 4, !dbg !1013
  %conv1 = sitofp i32 %3 to double, !dbg !1013
  %div = fdiv double %conv, %conv1, !dbg !1014
  %4 = load double*, double** %x1.addr, align 8, !dbg !1015
  %5 = load i32, i32* %i, align 4, !dbg !1016
  %idxprom = sext i32 %5 to i64, !dbg !1015
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom, !dbg !1015
  store double %div, double* %arrayidx, align 8, !dbg !1017
  %6 = load i32, i32* %i, align 4, !dbg !1018
  %conv2 = sitofp i32 %6 to double, !dbg !1018
  %add = fadd contract double %conv2, 1.000000e+00, !dbg !1019
  %7 = load i32, i32* %n.addr, align 4, !dbg !1020
  %conv3 = sitofp i32 %7 to double, !dbg !1020
  %div4 = fdiv double %add, %conv3, !dbg !1021
  %8 = load double*, double** %x2.addr, align 8, !dbg !1022
  %9 = load i32, i32* %i, align 4, !dbg !1023
  %idxprom5 = sext i32 %9 to i64, !dbg !1022
  %arrayidx6 = getelementptr inbounds double, double* %8, i64 %idxprom5, !dbg !1022
  store double %div4, double* %arrayidx6, align 8, !dbg !1024
  %10 = load i32, i32* %i, align 4, !dbg !1025
  %conv7 = sitofp i32 %10 to double, !dbg !1025
  %add8 = fadd contract double %conv7, 3.000000e+00, !dbg !1026
  %11 = load i32, i32* %n.addr, align 4, !dbg !1027
  %conv9 = sitofp i32 %11 to double, !dbg !1027
  %div10 = fdiv double %add8, %conv9, !dbg !1028
  %12 = load double*, double** %y_1.addr, align 8, !dbg !1029
  %13 = load i32, i32* %i, align 4, !dbg !1030
  %idxprom11 = sext i32 %13 to i64, !dbg !1029
  %arrayidx12 = getelementptr inbounds double, double* %12, i64 %idxprom11, !dbg !1029
  store double %div10, double* %arrayidx12, align 8, !dbg !1031
  %14 = load i32, i32* %i, align 4, !dbg !1032
  %conv13 = sitofp i32 %14 to double, !dbg !1032
  %add14 = fadd contract double %conv13, 4.000000e+00, !dbg !1033
  %15 = load i32, i32* %n.addr, align 4, !dbg !1034
  %conv15 = sitofp i32 %15 to double, !dbg !1034
  %div16 = fdiv double %add14, %conv15, !dbg !1035
  %16 = load double*, double** %y_2.addr, align 8, !dbg !1036
  %17 = load i32, i32* %i, align 4, !dbg !1037
  %idxprom17 = sext i32 %17 to i64, !dbg !1036
  %arrayidx18 = getelementptr inbounds double, double* %16, i64 %idxprom17, !dbg !1036
  store double %div16, double* %arrayidx18, align 8, !dbg !1038
  store i32 0, i32* %j, align 4, !dbg !1039
  br label %for.cond19, !dbg !1041

for.cond19:                                       ; preds = %for.inc, %for.body
  %18 = load i32, i32* %j, align 4, !dbg !1042
  %19 = load i32, i32* %n.addr, align 4, !dbg !1044
  %cmp20 = icmp slt i32 %18, %19, !dbg !1045
  br i1 %cmp20, label %for.body21, label %for.end, !dbg !1046

for.body21:                                       ; preds = %for.cond19
  %20 = load i32, i32* %i, align 4, !dbg !1047
  %conv22 = sitofp i32 %20 to double, !dbg !1047
  %21 = load i32, i32* %j, align 4, !dbg !1048
  %conv23 = sitofp i32 %21 to double, !dbg !1048
  %mul = fmul contract double %conv22, %conv23, !dbg !1049
  %22 = load i32, i32* %n.addr, align 4, !dbg !1050
  %conv24 = sitofp i32 %22 to double, !dbg !1050
  %div25 = fdiv double %mul, %conv24, !dbg !1051
  %23 = load double*, double** %A.addr, align 8, !dbg !1052
  %24 = load i32, i32* %i, align 4, !dbg !1053
  %25 = load i32, i32* %n.addr, align 4, !dbg !1054
  %mul26 = mul nsw i32 %24, %25, !dbg !1055
  %26 = load i32, i32* %j, align 4, !dbg !1056
  %add27 = add nsw i32 %mul26, %26, !dbg !1057
  %idxprom28 = sext i32 %add27 to i64, !dbg !1052
  %arrayidx29 = getelementptr inbounds double, double* %23, i64 %idxprom28, !dbg !1052
  store double %div25, double* %arrayidx29, align 8, !dbg !1058
  br label %for.inc, !dbg !1052

for.inc:                                          ; preds = %for.body21
  %27 = load i32, i32* %j, align 4, !dbg !1059
  %inc = add nsw i32 %27, 1, !dbg !1059
  store i32 %inc, i32* %j, align 4, !dbg !1059
  br label %for.cond19, !dbg !1060, !llvm.loop !1061

for.end:                                          ; preds = %for.cond19
  br label %for.inc30, !dbg !1063

for.inc30:                                        ; preds = %for.end
  %28 = load i32, i32* %i, align 4, !dbg !1064
  %inc31 = add nsw i32 %28, 1, !dbg !1064
  store i32 %inc31, i32* %i, align 4, !dbg !1064
  br label %for.cond, !dbg !1065, !llvm.loop !1066

for.end32:                                        ; preds = %for.cond
  ret void, !dbg !1068
}

declare dso_local i32 @cudaDeviceSynchronize() #3

; Function Attrs: noinline uwtable
define internal void @_ZL11print_arrayiPdS_(i32 %n, double* %x1, double* %x2) #0 !dbg !1069 {
entry:
  %n.addr = alloca i32, align 4
  %x1.addr = alloca double*, align 8
  %x2.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !1072, metadata !DIExpression()), !dbg !1073
  store double* %x1, double** %x1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x1.addr, metadata !1074, metadata !DIExpression()), !dbg !1075
  store double* %x2, double** %x2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x2.addr, metadata !1076, metadata !DIExpression()), !dbg !1077
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1078, metadata !DIExpression()), !dbg !1079
  store i32 0, i32* %i, align 4, !dbg !1080
  br label %for.cond, !dbg !1082

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1083
  %1 = load i32, i32* %n.addr, align 4, !dbg !1085
  %cmp = icmp slt i32 %0, %1, !dbg !1086
  br i1 %cmp, label %for.body, label %for.end, !dbg !1087

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1088
  %3 = load double*, double** %x1.addr, align 8, !dbg !1090
  %4 = load i32, i32* %i, align 4, !dbg !1091
  %idxprom = sext i32 %4 to i64, !dbg !1090
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom, !dbg !1090
  %5 = load double, double* %arrayidx, align 8, !dbg !1090
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %5), !dbg !1092
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1093
  %7 = load double*, double** %x2.addr, align 8, !dbg !1094
  %8 = load i32, i32* %i, align 4, !dbg !1095
  %idxprom1 = sext i32 %8 to i64, !dbg !1094
  %arrayidx2 = getelementptr inbounds double, double* %7, i64 %idxprom1, !dbg !1094
  %9 = load double, double* %arrayidx2, align 8, !dbg !1094
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %9), !dbg !1096
  %10 = load i32, i32* %i, align 4, !dbg !1097
  %rem = srem i32 %10, 20, !dbg !1099
  %cmp4 = icmp eq i32 %rem, 0, !dbg !1100
  br i1 %cmp4, label %if.then, label %if.end, !dbg !1101

if.then:                                          ; preds = %for.body
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1102
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1103
  br label %if.end, !dbg !1103

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !1104

for.inc:                                          ; preds = %if.end
  %12 = load i32, i32* %i, align 4, !dbg !1105
  %inc = add nsw i32 %12, 1, !dbg !1105
  store i32 %inc, i32* %i, align 4, !dbg !1105
  br label %for.cond, !dbg !1106, !llvm.loop !1107

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1109
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
!4 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !5, producer: "clang version 9.0.0 (git@github.com:SusanTan/llvm-project.git a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !6, retainedTypes: !98, imports: !103, nameTableKind: None)
!5 = !DIFile(filename: "mvt.cu", directory: "/u/NAS_SCRATCH/yc0769/xstack-benchmark/polybench-cuda/mvt")
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
!98 = !{!99, !100, !101, !102}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
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
!250 = !{!101, !251}
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
!304 = !{!101, !101}
!305 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cmath", directory: "")
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !307, file: !305, line: 102)
!307 = !DISubprogram(name: "asin", scope: !302, file: !302, line: 55, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !309, file: !305, line: 121)
!309 = !DISubprogram(name: "atan", scope: !302, file: !302, line: 57, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !311, file: !305, line: 140)
!311 = !DISubprogram(name: "atan2", scope: !302, file: !302, line: 59, type: !312, flags: DIFlagPrototyped, spFlags: 0)
!312 = !DISubroutineType(types: !313)
!313 = !{!101, !101, !101}
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
!331 = !{!101, !101, !174}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !333, file: !305, line: 315)
!333 = !DISubprogram(name: "ldexp", scope: !302, file: !302, line: 101, type: !334, flags: DIFlagPrototyped, spFlags: 0)
!334 = !DISubroutineType(types: !335)
!335 = !{!101, !101, !110}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !337, file: !305, line: 334)
!337 = !DISubprogram(name: "log", scope: !302, file: !302, line: 104, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !339, file: !305, line: 353)
!339 = !DISubprogram(name: "log10", scope: !302, file: !302, line: 107, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !341, file: !305, line: 372)
!341 = !DISubprogram(name: "modf", scope: !302, file: !302, line: 110, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DISubroutineType(types: !343)
!343 = !{!101, !101, !100}
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
!388 = !{!99, !389, !389, !391, !391, !394}
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
!401 = !{!99, !391, !391}
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
!413 = !{null, !99}
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
!428 = !{!99, !391}
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
!448 = !{null, !99, !391, !391, !394}
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !450, file: !359, line: 163)
!450 = !DISubprogram(name: "rand", scope: !298, file: !298, line: 453, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!451 = !DISubroutineType(types: !452)
!452 = !{!110}
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !454, file: !359, line: 164)
!454 = !DISubprogram(name: "realloc", scope: !298, file: !298, line: 550, type: !455, flags: DIFlagPrototyped, spFlags: 0)
!455 = !DISubroutineType(types: !456)
!456 = !{!99, !99, !391}
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !458, file: !359, line: 165)
!458 = !DISubprogram(name: "srand", scope: !298, file: !298, line: 455, type: !459, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DISubroutineType(types: !460)
!460 = !{null, !9}
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !105, entity: !462, file: !359, line: 166)
!462 = !DISubprogram(name: "strtod", scope: !298, file: !298, line: 117, type: !463, flags: DIFlagPrototyped, spFlags: 0)
!463 = !DISubroutineType(types: !464)
!464 = !{!101, !440, !465}
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
!692 = distinct !DISubprogram(name: "kernel_x1", linkageName: "_Z9kernel_x1iPdS_S_S_S_", scope: !5, file: !5, line: 62, type: !693, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !110, !100, !100, !100, !100, !100}
!695 = !{}
!696 = !DILocalVariable(name: "n", arg: 1, scope: !692, file: !5, line: 62, type: !110)
!697 = !DILocation(line: 62, column: 31, scope: !692)
!698 = !DILocalVariable(name: "x1", arg: 2, scope: !692, file: !5, line: 63, type: !100)
!699 = !DILocation(line: 63, column: 35, scope: !692)
!700 = !DILocalVariable(name: "x2", arg: 3, scope: !692, file: !5, line: 64, type: !100)
!701 = !DILocation(line: 64, column: 35, scope: !692)
!702 = !DILocalVariable(name: "y_1", arg: 4, scope: !692, file: !5, line: 65, type: !100)
!703 = !DILocation(line: 65, column: 35, scope: !692)
!704 = !DILocalVariable(name: "y_2", arg: 5, scope: !692, file: !5, line: 66, type: !100)
!705 = !DILocation(line: 66, column: 35, scope: !692)
!706 = !DILocalVariable(name: "A", arg: 6, scope: !692, file: !5, line: 67, type: !100)
!707 = !DILocation(line: 67, column: 35, scope: !692)
!708 = !DILocation(line: 67, column: 38, scope: !692)
!709 = !DILocation(line: 74, column: 1, scope: !692)
!710 = distinct !DISubprogram(name: "kernel_x2", linkageName: "_Z9kernel_x2iPdS_S_S_S_", scope: !5, file: !5, line: 77, type: !693, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!711 = !DILocalVariable(name: "n", arg: 1, scope: !710, file: !5, line: 77, type: !110)
!712 = !DILocation(line: 77, column: 31, scope: !710)
!713 = !DILocalVariable(name: "x1", arg: 2, scope: !710, file: !5, line: 78, type: !100)
!714 = !DILocation(line: 78, column: 35, scope: !710)
!715 = !DILocalVariable(name: "x2", arg: 3, scope: !710, file: !5, line: 79, type: !100)
!716 = !DILocation(line: 79, column: 35, scope: !710)
!717 = !DILocalVariable(name: "y_1", arg: 4, scope: !710, file: !5, line: 80, type: !100)
!718 = !DILocation(line: 80, column: 35, scope: !710)
!719 = !DILocalVariable(name: "y_2", arg: 5, scope: !710, file: !5, line: 81, type: !100)
!720 = !DILocation(line: 81, column: 35, scope: !710)
!721 = !DILocalVariable(name: "A", arg: 6, scope: !710, file: !5, line: 82, type: !100)
!722 = !DILocation(line: 82, column: 35, scope: !710)
!723 = !DILocation(line: 82, column: 38, scope: !710)
!724 = !DILocation(line: 89, column: 1, scope: !710)
!725 = distinct !DISubprogram(name: "num_blocks", linkageName: "_Z10num_blocksss", scope: !5, file: !5, line: 92, type: !726, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!726 = !DISubroutineType(types: !727)
!727 = !{!728, !728, !728}
!728 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!729 = !DILocalVariable(name: "num", arg: 1, scope: !725, file: !5, line: 92, type: !728)
!730 = !DILocation(line: 92, column: 24, scope: !725)
!731 = !DILocalVariable(name: "factor", arg: 2, scope: !725, file: !5, line: 92, type: !728)
!732 = !DILocation(line: 92, column: 35, scope: !725)
!733 = !DILocation(line: 93, column: 11, scope: !725)
!734 = !DILocation(line: 93, column: 17, scope: !725)
!735 = !DILocation(line: 93, column: 15, scope: !725)
!736 = !DILocation(line: 93, column: 24, scope: !725)
!737 = !DILocation(line: 93, column: 31, scope: !725)
!738 = !DILocation(line: 93, column: 29, scope: !725)
!739 = !DILocation(line: 93, column: 10, scope: !725)
!740 = !DILocation(line: 93, column: 3, scope: !725)
!741 = distinct !DISubprogram(name: "kernel", linkageName: "_Z6kerneliPdS_S_S_S_", scope: !5, file: !5, line: 96, type: !693, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!742 = !DILocalVariable(name: "n", arg: 1, scope: !741, file: !5, line: 96, type: !110)
!743 = !DILocation(line: 96, column: 17, scope: !741)
!744 = !DILocalVariable(name: "x1", arg: 2, scope: !741, file: !5, line: 97, type: !100)
!745 = !DILocation(line: 97, column: 21, scope: !741)
!746 = !DILocalVariable(name: "x2", arg: 3, scope: !741, file: !5, line: 98, type: !100)
!747 = !DILocation(line: 98, column: 21, scope: !741)
!748 = !DILocalVariable(name: "y_1", arg: 4, scope: !741, file: !5, line: 99, type: !100)
!749 = !DILocation(line: 99, column: 21, scope: !741)
!750 = !DILocalVariable(name: "y_2", arg: 5, scope: !741, file: !5, line: 100, type: !100)
!751 = !DILocation(line: 100, column: 21, scope: !741)
!752 = !DILocalVariable(name: "A", arg: 6, scope: !741, file: !5, line: 101, type: !100)
!753 = !DILocation(line: 101, column: 21, scope: !741)
!754 = !DILocalVariable(name: "dev_A", scope: !741, file: !5, line: 102, type: !100)
!755 = !DILocation(line: 102, column: 11, scope: !741)
!756 = !DILocalVariable(name: "dev_x1", scope: !741, file: !5, line: 103, type: !100)
!757 = !DILocation(line: 103, column: 11, scope: !741)
!758 = !DILocalVariable(name: "dev_x2", scope: !741, file: !5, line: 104, type: !100)
!759 = !DILocation(line: 104, column: 11, scope: !741)
!760 = !DILocalVariable(name: "dev_y_1", scope: !741, file: !5, line: 105, type: !100)
!761 = !DILocation(line: 105, column: 11, scope: !741)
!762 = !DILocalVariable(name: "dev_y_2", scope: !741, file: !5, line: 106, type: !100)
!763 = !DILocation(line: 106, column: 11, scope: !741)
!764 = !DILocation(line: 108, column: 22, scope: !741)
!765 = !DILocation(line: 108, column: 24, scope: !741)
!766 = !DILocation(line: 108, column: 23, scope: !741)
!767 = !DILocation(line: 108, column: 25, scope: !741)
!768 = !DILocation(line: 108, column: 3, scope: !741)
!769 = !DILocation(line: 109, column: 23, scope: !741)
!770 = !DILocation(line: 109, column: 24, scope: !741)
!771 = !DILocation(line: 109, column: 3, scope: !741)
!772 = !DILocation(line: 110, column: 23, scope: !741)
!773 = !DILocation(line: 110, column: 24, scope: !741)
!774 = !DILocation(line: 110, column: 3, scope: !741)
!775 = !DILocation(line: 111, column: 24, scope: !741)
!776 = !DILocation(line: 111, column: 25, scope: !741)
!777 = !DILocation(line: 111, column: 3, scope: !741)
!778 = !DILocation(line: 112, column: 24, scope: !741)
!779 = !DILocation(line: 112, column: 25, scope: !741)
!780 = !DILocation(line: 112, column: 3, scope: !741)
!781 = !DILocation(line: 114, column: 14, scope: !741)
!782 = !DILocation(line: 114, column: 21, scope: !741)
!783 = !DILocation(line: 114, column: 24, scope: !741)
!784 = !DILocation(line: 114, column: 28, scope: !741)
!785 = !DILocation(line: 114, column: 26, scope: !741)
!786 = !DILocation(line: 114, column: 30, scope: !741)
!787 = !DILocation(line: 114, column: 3, scope: !741)
!788 = !DILocation(line: 115, column: 14, scope: !741)
!789 = !DILocation(line: 115, column: 22, scope: !741)
!790 = !DILocation(line: 115, column: 26, scope: !741)
!791 = !DILocation(line: 115, column: 28, scope: !741)
!792 = !DILocation(line: 115, column: 3, scope: !741)
!793 = !DILocation(line: 116, column: 14, scope: !741)
!794 = !DILocation(line: 116, column: 22, scope: !741)
!795 = !DILocation(line: 116, column: 26, scope: !741)
!796 = !DILocation(line: 116, column: 28, scope: !741)
!797 = !DILocation(line: 116, column: 3, scope: !741)
!798 = !DILocation(line: 117, column: 14, scope: !741)
!799 = !DILocation(line: 117, column: 23, scope: !741)
!800 = !DILocation(line: 117, column: 28, scope: !741)
!801 = !DILocation(line: 117, column: 30, scope: !741)
!802 = !DILocation(line: 117, column: 3, scope: !741)
!803 = !DILocation(line: 118, column: 14, scope: !741)
!804 = !DILocation(line: 118, column: 23, scope: !741)
!805 = !DILocation(line: 118, column: 28, scope: !741)
!806 = !DILocation(line: 118, column: 30, scope: !741)
!807 = !DILocation(line: 118, column: 3, scope: !741)
!808 = !DILocalVariable(name: "threadsPerBlock", scope: !741, file: !5, line: 119, type: !728)
!809 = !DILocation(line: 119, column: 9, scope: !741)
!810 = !DILocation(line: 121, column: 15, scope: !741)
!811 = !DILocation(line: 121, column: 43, scope: !741)
!812 = !DILocation(line: 121, column: 46, scope: !741)
!813 = !DILocation(line: 121, column: 32, scope: !741)
!814 = !DILocation(line: 121, column: 12, scope: !741)
!815 = !DILocation(line: 121, column: 3, scope: !741)
!816 = !DILocation(line: 121, column: 66, scope: !741)
!817 = !DILocation(line: 121, column: 69, scope: !741)
!818 = !DILocation(line: 121, column: 77, scope: !741)
!819 = !DILocation(line: 121, column: 85, scope: !741)
!820 = !DILocation(line: 121, column: 94, scope: !741)
!821 = !DILocation(line: 121, column: 103, scope: !741)
!822 = !DILocation(line: 122, column: 15, scope: !741)
!823 = !DILocation(line: 122, column: 43, scope: !741)
!824 = !DILocation(line: 122, column: 46, scope: !741)
!825 = !DILocation(line: 122, column: 32, scope: !741)
!826 = !DILocation(line: 122, column: 12, scope: !741)
!827 = !DILocation(line: 122, column: 3, scope: !741)
!828 = !DILocation(line: 122, column: 66, scope: !741)
!829 = !DILocation(line: 122, column: 69, scope: !741)
!830 = !DILocation(line: 122, column: 77, scope: !741)
!831 = !DILocation(line: 122, column: 85, scope: !741)
!832 = !DILocation(line: 122, column: 94, scope: !741)
!833 = !DILocation(line: 122, column: 103, scope: !741)
!834 = !DILocation(line: 123, column: 14, scope: !741)
!835 = !DILocation(line: 123, column: 18, scope: !741)
!836 = !DILocation(line: 123, column: 26, scope: !741)
!837 = !DILocation(line: 123, column: 28, scope: !741)
!838 = !DILocation(line: 123, column: 3, scope: !741)
!839 = !DILocation(line: 124, column: 14, scope: !741)
!840 = !DILocation(line: 124, column: 18, scope: !741)
!841 = !DILocation(line: 124, column: 26, scope: !741)
!842 = !DILocation(line: 124, column: 28, scope: !741)
!843 = !DILocation(line: 124, column: 3, scope: !741)
!844 = !DILocation(line: 125, column: 19, scope: !741)
!845 = !DILocation(line: 125, column: 3, scope: !741)
!846 = !DILocation(line: 126, column: 19, scope: !741)
!847 = !DILocation(line: 126, column: 3, scope: !741)
!848 = !DILocation(line: 127, column: 19, scope: !741)
!849 = !DILocation(line: 127, column: 3, scope: !741)
!850 = !DILocation(line: 128, column: 19, scope: !741)
!851 = !DILocation(line: 128, column: 3, scope: !741)
!852 = !DILocation(line: 129, column: 19, scope: !741)
!853 = !DILocation(line: 129, column: 3, scope: !741)
!854 = !DILocation(line: 130, column: 1, scope: !741)
!855 = distinct !DISubprogram(name: "cudaMalloc<double>", linkageName: "_ZL10cudaMallocIdE9cudaErrorPPT_m", scope: !856, file: !856, line: 490, type: !857, scopeLine: 494, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, templateParams: !861, retainedNodes: !695)
!856 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "")
!857 = !DISubroutineType(types: !858)
!858 = !{!859, !860, !391}
!859 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !8, line: 1419, baseType: !16)
!860 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!861 = !{!862}
!862 = !DITemplateTypeParameter(name: "T", type: !101)
!863 = !DILocalVariable(name: "devPtr", arg: 1, scope: !855, file: !856, line: 491, type: !860)
!864 = !DILocation(line: 491, column: 12, scope: !855)
!865 = !DILocalVariable(name: "size", arg: 2, scope: !855, file: !856, line: 492, type: !391)
!866 = !DILocation(line: 492, column: 12, scope: !855)
!867 = !DILocation(line: 495, column: 38, scope: !855)
!868 = !DILocation(line: 495, column: 23, scope: !855)
!869 = !DILocation(line: 495, column: 46, scope: !855)
!870 = !DILocation(line: 495, column: 10, scope: !855)
!871 = !DILocation(line: 495, column: 3, scope: !855)
!872 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !874, file: !873, line: 421, type: !880, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, declaration: !879, retainedNodes: !695)
!873 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!874 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !873, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !875, identifier: "_ZTS4dim3")
!875 = !{!876, !877, !878, !879, !883, !892}
!876 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !874, file: !873, line: 419, baseType: !9, size: 32)
!877 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !874, file: !873, line: 419, baseType: !9, size: 32, offset: 32)
!878 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !874, file: !873, line: 419, baseType: !9, size: 32, offset: 64)
!879 = !DISubprogram(name: "dim3", scope: !874, file: !873, line: 421, type: !880, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!880 = !DISubroutineType(types: !881)
!881 = !{null, !882, !9, !9, !9}
!882 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !874, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!883 = !DISubprogram(name: "dim3", scope: !874, file: !873, line: 422, type: !884, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!884 = !DISubroutineType(types: !885)
!885 = !{null, !882, !886}
!886 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !873, line: 383, baseType: !887)
!887 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !873, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !888, identifier: "_ZTS5uint3")
!888 = !{!889, !890, !891}
!889 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !887, file: !873, line: 192, baseType: !9, size: 32)
!890 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !887, file: !873, line: 192, baseType: !9, size: 32, offset: 32)
!891 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !887, file: !873, line: 192, baseType: !9, size: 32, offset: 64)
!892 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !874, file: !873, line: 423, type: !893, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DISubroutineType(types: !894)
!894 = !{!886, !882}
!895 = !DILocalVariable(name: "this", arg: 1, scope: !872, type: !896, flags: DIFlagArtificial | DIFlagObjectPointer)
!896 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !874, size: 64)
!897 = !DILocation(line: 0, scope: !872)
!898 = !DILocalVariable(name: "vx", arg: 2, scope: !872, file: !873, line: 421, type: !9)
!899 = !DILocation(line: 421, column: 43, scope: !872)
!900 = !DILocalVariable(name: "vy", arg: 3, scope: !872, file: !873, line: 421, type: !9)
!901 = !DILocation(line: 421, column: 64, scope: !872)
!902 = !DILocalVariable(name: "vz", arg: 4, scope: !872, file: !873, line: 421, type: !9)
!903 = !DILocation(line: 421, column: 85, scope: !872)
!904 = !DILocation(line: 421, column: 95, scope: !872)
!905 = !DILocation(line: 421, column: 97, scope: !872)
!906 = !DILocation(line: 421, column: 102, scope: !872)
!907 = !DILocation(line: 421, column: 104, scope: !872)
!908 = !DILocation(line: 421, column: 109, scope: !872)
!909 = !DILocation(line: 421, column: 111, scope: !872)
!910 = !DILocation(line: 421, column: 116, scope: !872)
!911 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 132, type: !912, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!912 = !DISubroutineType(types: !913)
!913 = !{!110, !110, !466}
!914 = !DILocalVariable(name: "argc", arg: 1, scope: !911, file: !5, line: 132, type: !110)
!915 = !DILocation(line: 132, column: 14, scope: !911)
!916 = !DILocalVariable(name: "argv", arg: 2, scope: !911, file: !5, line: 132, type: !466)
!917 = !DILocation(line: 132, column: 27, scope: !911)
!918 = !DILocalVariable(name: "dump_code", scope: !911, file: !5, line: 135, type: !110)
!919 = !DILocation(line: 135, column: 7, scope: !911)
!920 = !DILocation(line: 135, column: 24, scope: !911)
!921 = !DILocation(line: 135, column: 19, scope: !911)
!922 = !DILocalVariable(name: "n", scope: !911, file: !5, line: 136, type: !110)
!923 = !DILocation(line: 136, column: 7, scope: !911)
!924 = !DILocalVariable(name: "A", scope: !911, file: !5, line: 139, type: !100)
!925 = !DILocation(line: 139, column: 11, scope: !911)
!926 = !DILocation(line: 139, column: 24, scope: !911)
!927 = !DILocation(line: 139, column: 15, scope: !911)
!928 = !DILocalVariable(name: "x1", scope: !911, file: !5, line: 140, type: !100)
!929 = !DILocation(line: 140, column: 11, scope: !911)
!930 = !DILocation(line: 140, column: 47, scope: !911)
!931 = !DILocation(line: 140, column: 46, scope: !911)
!932 = !DILocation(line: 140, column: 25, scope: !911)
!933 = !DILocation(line: 140, column: 16, scope: !911)
!934 = !DILocalVariable(name: "x2", scope: !911, file: !5, line: 141, type: !100)
!935 = !DILocation(line: 141, column: 11, scope: !911)
!936 = !DILocation(line: 141, column: 47, scope: !911)
!937 = !DILocation(line: 141, column: 46, scope: !911)
!938 = !DILocation(line: 141, column: 25, scope: !911)
!939 = !DILocation(line: 141, column: 16, scope: !911)
!940 = !DILocalVariable(name: "y_1", scope: !911, file: !5, line: 142, type: !100)
!941 = !DILocation(line: 142, column: 11, scope: !911)
!942 = !DILocation(line: 142, column: 48, scope: !911)
!943 = !DILocation(line: 142, column: 47, scope: !911)
!944 = !DILocation(line: 142, column: 26, scope: !911)
!945 = !DILocation(line: 142, column: 17, scope: !911)
!946 = !DILocalVariable(name: "y_2", scope: !911, file: !5, line: 143, type: !100)
!947 = !DILocation(line: 143, column: 11, scope: !911)
!948 = !DILocation(line: 143, column: 48, scope: !911)
!949 = !DILocation(line: 143, column: 47, scope: !911)
!950 = !DILocation(line: 143, column: 26, scope: !911)
!951 = !DILocation(line: 143, column: 17, scope: !911)
!952 = !DILocation(line: 146, column: 15, scope: !911)
!953 = !DILocation(line: 147, column: 8, scope: !911)
!954 = !DILocation(line: 148, column: 8, scope: !911)
!955 = !DILocation(line: 149, column: 8, scope: !911)
!956 = !DILocation(line: 150, column: 8, scope: !911)
!957 = !DILocation(line: 151, column: 8, scope: !911)
!958 = !DILocation(line: 146, column: 3, scope: !911)
!959 = !DILocation(line: 156, column: 10, scope: !911)
!960 = !DILocation(line: 156, column: 13, scope: !911)
!961 = !DILocation(line: 156, column: 17, scope: !911)
!962 = !DILocation(line: 156, column: 21, scope: !911)
!963 = !DILocation(line: 156, column: 26, scope: !911)
!964 = !DILocation(line: 156, column: 31, scope: !911)
!965 = !DILocation(line: 156, column: 3, scope: !911)
!966 = !DILocation(line: 159, column: 3, scope: !911)
!967 = !DILocation(line: 163, column: 6, scope: !968)
!968 = distinct !DILexicalBlock(scope: !911, file: !5, line: 163, column: 6)
!969 = !DILocation(line: 163, column: 16, scope: !968)
!970 = !DILocation(line: 163, column: 6, scope: !911)
!971 = !DILocation(line: 163, column: 34, scope: !968)
!972 = !DILocation(line: 163, column: 37, scope: !968)
!973 = !DILocation(line: 163, column: 41, scope: !968)
!974 = !DILocation(line: 163, column: 22, scope: !968)
!975 = !DILocation(line: 166, column: 15, scope: !911)
!976 = !DILocation(line: 166, column: 3, scope: !911)
!977 = !DILocation(line: 167, column: 15, scope: !911)
!978 = !DILocation(line: 167, column: 3, scope: !911)
!979 = !DILocation(line: 168, column: 15, scope: !911)
!980 = !DILocation(line: 168, column: 3, scope: !911)
!981 = !DILocation(line: 169, column: 15, scope: !911)
!982 = !DILocation(line: 169, column: 3, scope: !911)
!983 = !DILocation(line: 170, column: 15, scope: !911)
!984 = !DILocation(line: 170, column: 3, scope: !911)
!985 = !DILocation(line: 173, column: 3, scope: !911)
!986 = distinct !DISubprogram(name: "init_array", linkageName: "_ZL10init_arrayiPdS_S_S_S_", scope: !5, file: !5, line: 23, type: !693, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!987 = !DILocalVariable(name: "n", arg: 1, scope: !986, file: !5, line: 23, type: !110)
!988 = !DILocation(line: 23, column: 21, scope: !986)
!989 = !DILocalVariable(name: "x1", arg: 2, scope: !986, file: !5, line: 24, type: !100)
!990 = !DILocation(line: 24, column: 11, scope: !986)
!991 = !DILocalVariable(name: "x2", arg: 3, scope: !986, file: !5, line: 25, type: !100)
!992 = !DILocation(line: 25, column: 11, scope: !986)
!993 = !DILocalVariable(name: "y_1", arg: 4, scope: !986, file: !5, line: 26, type: !100)
!994 = !DILocation(line: 26, column: 11, scope: !986)
!995 = !DILocalVariable(name: "y_2", arg: 5, scope: !986, file: !5, line: 27, type: !100)
!996 = !DILocation(line: 27, column: 11, scope: !986)
!997 = !DILocalVariable(name: "A", arg: 6, scope: !986, file: !5, line: 28, type: !100)
!998 = !DILocation(line: 28, column: 11, scope: !986)
!999 = !DILocalVariable(name: "i", scope: !986, file: !5, line: 30, type: !110)
!1000 = !DILocation(line: 30, column: 7, scope: !986)
!1001 = !DILocalVariable(name: "j", scope: !986, file: !5, line: 30, type: !110)
!1002 = !DILocation(line: 30, column: 10, scope: !986)
!1003 = !DILocation(line: 32, column: 10, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !986, file: !5, line: 32, column: 3)
!1005 = !DILocation(line: 32, column: 8, scope: !1004)
!1006 = !DILocation(line: 32, column: 15, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !1004, file: !5, line: 32, column: 3)
!1008 = !DILocation(line: 32, column: 19, scope: !1007)
!1009 = !DILocation(line: 32, column: 17, scope: !1007)
!1010 = !DILocation(line: 32, column: 3, scope: !1004)
!1011 = !DILocation(line: 34, column: 25, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1007, file: !5, line: 33, column: 5)
!1013 = !DILocation(line: 34, column: 30, scope: !1012)
!1014 = !DILocation(line: 34, column: 28, scope: !1012)
!1015 = !DILocation(line: 34, column: 7, scope: !1012)
!1016 = !DILocation(line: 34, column: 10, scope: !1012)
!1017 = !DILocation(line: 34, column: 13, scope: !1012)
!1018 = !DILocation(line: 35, column: 25, scope: !1012)
!1019 = !DILocation(line: 35, column: 27, scope: !1012)
!1020 = !DILocation(line: 35, column: 34, scope: !1012)
!1021 = !DILocation(line: 35, column: 32, scope: !1012)
!1022 = !DILocation(line: 35, column: 7, scope: !1012)
!1023 = !DILocation(line: 35, column: 10, scope: !1012)
!1024 = !DILocation(line: 35, column: 13, scope: !1012)
!1025 = !DILocation(line: 36, column: 26, scope: !1012)
!1026 = !DILocation(line: 36, column: 28, scope: !1012)
!1027 = !DILocation(line: 36, column: 35, scope: !1012)
!1028 = !DILocation(line: 36, column: 33, scope: !1012)
!1029 = !DILocation(line: 36, column: 7, scope: !1012)
!1030 = !DILocation(line: 36, column: 11, scope: !1012)
!1031 = !DILocation(line: 36, column: 14, scope: !1012)
!1032 = !DILocation(line: 37, column: 26, scope: !1012)
!1033 = !DILocation(line: 37, column: 28, scope: !1012)
!1034 = !DILocation(line: 37, column: 35, scope: !1012)
!1035 = !DILocation(line: 37, column: 33, scope: !1012)
!1036 = !DILocation(line: 37, column: 7, scope: !1012)
!1037 = !DILocation(line: 37, column: 11, scope: !1012)
!1038 = !DILocation(line: 37, column: 14, scope: !1012)
!1039 = !DILocation(line: 38, column: 14, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1012, file: !5, line: 38, column: 7)
!1041 = !DILocation(line: 38, column: 12, scope: !1040)
!1042 = !DILocation(line: 38, column: 19, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1040, file: !5, line: 38, column: 7)
!1044 = !DILocation(line: 38, column: 23, scope: !1043)
!1045 = !DILocation(line: 38, column: 21, scope: !1043)
!1046 = !DILocation(line: 38, column: 7, scope: !1040)
!1047 = !DILocation(line: 39, column: 29, scope: !1043)
!1048 = !DILocation(line: 39, column: 31, scope: !1043)
!1049 = !DILocation(line: 39, column: 30, scope: !1043)
!1050 = !DILocation(line: 39, column: 36, scope: !1043)
!1051 = !DILocation(line: 39, column: 34, scope: !1043)
!1052 = !DILocation(line: 39, column: 8, scope: !1043)
!1053 = !DILocation(line: 39, column: 10, scope: !1043)
!1054 = !DILocation(line: 39, column: 12, scope: !1043)
!1055 = !DILocation(line: 39, column: 11, scope: !1043)
!1056 = !DILocation(line: 39, column: 14, scope: !1043)
!1057 = !DILocation(line: 39, column: 13, scope: !1043)
!1058 = !DILocation(line: 39, column: 17, scope: !1043)
!1059 = !DILocation(line: 38, column: 27, scope: !1043)
!1060 = !DILocation(line: 38, column: 7, scope: !1043)
!1061 = distinct !{!1061, !1046, !1062}
!1062 = !DILocation(line: 39, column: 36, scope: !1040)
!1063 = !DILocation(line: 40, column: 5, scope: !1012)
!1064 = !DILocation(line: 32, column: 23, scope: !1007)
!1065 = !DILocation(line: 32, column: 3, scope: !1007)
!1066 = distinct !{!1066, !1010, !1067}
!1067 = !DILocation(line: 40, column: 5, scope: !1004)
!1068 = !DILocation(line: 41, column: 1, scope: !986)
!1069 = distinct !DISubprogram(name: "print_array", linkageName: "_ZL11print_arrayiPdS_", scope: !5, file: !5, line: 47, type: !1070, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1070 = !DISubroutineType(types: !1071)
!1071 = !{null, !110, !100, !100}
!1072 = !DILocalVariable(name: "n", arg: 1, scope: !1069, file: !5, line: 47, type: !110)
!1073 = !DILocation(line: 47, column: 22, scope: !1069)
!1074 = !DILocalVariable(name: "x1", arg: 2, scope: !1069, file: !5, line: 48, type: !100)
!1075 = !DILocation(line: 48, column: 12, scope: !1069)
!1076 = !DILocalVariable(name: "x2", arg: 3, scope: !1069, file: !5, line: 49, type: !100)
!1077 = !DILocation(line: 49, column: 12, scope: !1069)
!1078 = !DILocalVariable(name: "i", scope: !1069, file: !5, line: 52, type: !110)
!1079 = !DILocation(line: 52, column: 7, scope: !1069)
!1080 = !DILocation(line: 54, column: 10, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1069, file: !5, line: 54, column: 3)
!1082 = !DILocation(line: 54, column: 8, scope: !1081)
!1083 = !DILocation(line: 54, column: 15, scope: !1084)
!1084 = distinct !DILexicalBlock(scope: !1081, file: !5, line: 54, column: 3)
!1085 = !DILocation(line: 54, column: 19, scope: !1084)
!1086 = !DILocation(line: 54, column: 17, scope: !1084)
!1087 = !DILocation(line: 54, column: 3, scope: !1081)
!1088 = !DILocation(line: 55, column: 14, scope: !1089)
!1089 = distinct !DILexicalBlock(scope: !1084, file: !5, line: 54, column: 27)
!1090 = !DILocation(line: 55, column: 32, scope: !1089)
!1091 = !DILocation(line: 55, column: 35, scope: !1089)
!1092 = !DILocation(line: 55, column: 5, scope: !1089)
!1093 = !DILocation(line: 56, column: 14, scope: !1089)
!1094 = !DILocation(line: 56, column: 32, scope: !1089)
!1095 = !DILocation(line: 56, column: 35, scope: !1089)
!1096 = !DILocation(line: 56, column: 5, scope: !1089)
!1097 = !DILocation(line: 57, column: 9, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1089, file: !5, line: 57, column: 9)
!1099 = !DILocation(line: 57, column: 11, scope: !1098)
!1100 = !DILocation(line: 57, column: 16, scope: !1098)
!1101 = !DILocation(line: 57, column: 9, scope: !1089)
!1102 = !DILocation(line: 57, column: 31, scope: !1098)
!1103 = !DILocation(line: 57, column: 22, scope: !1098)
!1104 = !DILocation(line: 58, column: 3, scope: !1089)
!1105 = !DILocation(line: 54, column: 23, scope: !1084)
!1106 = !DILocation(line: 54, column: 3, scope: !1084)
!1107 = distinct !{!1107, !1087, !1108}
!1108 = !DILocation(line: 58, column: 3, scope: !1081)
!1109 = !DILocation(line: 59, column: 1, scope: !1069)
