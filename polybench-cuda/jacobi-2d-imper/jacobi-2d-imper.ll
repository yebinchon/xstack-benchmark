; ModuleID = 'jacobi-2d-imper.cu'
source_filename = "jacobi-2d-imper.cu"
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
define dso_local void @_Z14kernel_stenciliPdS_(i32 %n, double* %A, double* %B) #0 !dbg !692 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !696, metadata !DIExpression()), !dbg !697
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !698, metadata !DIExpression()), !dbg !699
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !700, metadata !DIExpression()), !dbg !701
  %0 = bitcast i32* %n.addr to i8*, !dbg !702
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !702
  %2 = icmp eq i32 %1, 0, !dbg !702
  br i1 %2, label %setup.next, label %setup.end, !dbg !702

setup.next:                                       ; preds = %entry
  %3 = bitcast double** %A.addr to i8*, !dbg !702
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !702
  %5 = icmp eq i32 %4, 0, !dbg !702
  br i1 %5, label %setup.next1, label %setup.end, !dbg !702

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast double** %B.addr to i8*, !dbg !702
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !702
  %8 = icmp eq i32 %7, 0, !dbg !702
  br i1 %8, label %setup.next2, label %setup.end, !dbg !702

setup.next2:                                      ; preds = %setup.next1
  %9 = call i32 @cudaLaunch(i8* bitcast (void (i32, double*, double*)* @_Z14kernel_stenciliPdS_ to i8*)), !dbg !702
  br label %setup.end, !dbg !702

setup.end:                                        ; preds = %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !703
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !704 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %dump_code = alloca i32, align 4
  %n = alloca i32, align 4
  %tsteps = alloca i32, align 4
  %A = alloca double*, align 8
  %B = alloca double*, align 8
  %dev_A = alloca double*, align 8
  %dev_B = alloca double*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !707, metadata !DIExpression()), !dbg !708
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !709, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.declare(metadata i32* %dump_code, metadata !711, metadata !DIExpression()), !dbg !712
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !713
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !713
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !713
  %call = call i32 @atoi(i8* %1) #8, !dbg !714
  store i32 %call, i32* %dump_code, align 4, !dbg !712
  call void @llvm.dbg.declare(metadata i32* %n, metadata !715, metadata !DIExpression()), !dbg !716
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !717
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !717
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !717
  %call2 = call i32 @atoi(i8* %3) #8, !dbg !718
  store i32 %call2, i32* %n, align 4, !dbg !716
  call void @llvm.dbg.declare(metadata i32* %tsteps, metadata !719, metadata !DIExpression()), !dbg !720
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !721
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i64 3, !dbg !721
  %5 = load i8*, i8** %arrayidx3, align 8, !dbg !721
  %call4 = call i32 @atoi(i8* %5) #8, !dbg !722
  store i32 %call4, i32* %tsteps, align 4, !dbg !720
  call void @llvm.dbg.declare(metadata double** %A, metadata !723, metadata !DIExpression()), !dbg !724
  %6 = load i32, i32* %n, align 4, !dbg !725
  %7 = load i32, i32* %n, align 4, !dbg !726
  %mul = mul nsw i32 %6, %7, !dbg !727
  %conv = sext i32 %mul to i64, !dbg !725
  %mul5 = mul i64 %conv, 8, !dbg !728
  %call6 = call noalias i8* @malloc(i64 %mul5) #9, !dbg !729
  %8 = bitcast i8* %call6 to double*, !dbg !730
  store double* %8, double** %A, align 8, !dbg !724
  call void @llvm.dbg.declare(metadata double** %B, metadata !731, metadata !DIExpression()), !dbg !732
  %9 = load i32, i32* %n, align 4, !dbg !733
  %10 = load i32, i32* %n, align 4, !dbg !734
  %mul7 = mul nsw i32 %9, %10, !dbg !735
  %conv8 = sext i32 %mul7 to i64, !dbg !733
  %mul9 = mul i64 %conv8, 8, !dbg !736
  %call10 = call noalias i8* @malloc(i64 %mul9) #9, !dbg !737
  %11 = bitcast i8* %call10 to double*, !dbg !738
  store double* %11, double** %B, align 8, !dbg !732
  %12 = load i32, i32* %n, align 4, !dbg !739
  %13 = load double*, double** %A, align 8, !dbg !740
  %14 = load double*, double** %B, align 8, !dbg !741
  call void @_ZL10init_arrayiPdS_(i32 %12, double* %13, double* %14), !dbg !742
  call void @llvm.dbg.declare(metadata double** %dev_A, metadata !743, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.declare(metadata double** %dev_B, metadata !745, metadata !DIExpression()), !dbg !746
  %15 = load i32, i32* %n, align 4, !dbg !747
  %16 = load i32, i32* %n, align 4, !dbg !748
  %mul11 = mul nsw i32 %15, %16, !dbg !749
  %conv12 = sext i32 %mul11 to i64, !dbg !747
  %mul13 = mul i64 %conv12, 8, !dbg !750
  %call14 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_A, i64 %mul13), !dbg !751
  %17 = load i32, i32* %n, align 4, !dbg !752
  %18 = load i32, i32* %n, align 4, !dbg !753
  %mul15 = mul nsw i32 %17, %18, !dbg !754
  %conv16 = sext i32 %mul15 to i64, !dbg !752
  %mul17 = mul i64 %conv16, 8, !dbg !755
  %call18 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_B, i64 %mul17), !dbg !756
  %19 = load double*, double** %dev_A, align 8, !dbg !757
  %20 = bitcast double* %19 to i8*, !dbg !757
  %21 = load double*, double** %A, align 8, !dbg !758
  %22 = bitcast double* %21 to i8*, !dbg !758
  %23 = load i32, i32* %n, align 4, !dbg !759
  %24 = load i32, i32* %n, align 4, !dbg !760
  %mul19 = mul nsw i32 %23, %24, !dbg !761
  %conv20 = sext i32 %mul19 to i64, !dbg !759
  %mul21 = mul i64 %conv20, 8, !dbg !762
  %call22 = call i32 @cudaMemcpy(i8* %20, i8* %22, i64 %mul21, i32 1), !dbg !763
  %25 = load double*, double** %dev_B, align 8, !dbg !764
  %26 = bitcast double* %25 to i8*, !dbg !764
  %27 = load double*, double** %B, align 8, !dbg !765
  %28 = bitcast double* %27 to i8*, !dbg !765
  %29 = load i32, i32* %n, align 4, !dbg !766
  %30 = load i32, i32* %n, align 4, !dbg !767
  %mul23 = mul nsw i32 %29, %30, !dbg !768
  %conv24 = sext i32 %mul23 to i64, !dbg !766
  %mul25 = mul i64 %conv24, 8, !dbg !769
  %call26 = call i32 @cudaMemcpy(i8* %26, i8* %28, i64 %mul25, i32 1), !dbg !770
  %31 = load i32, i32* %tsteps, align 4, !dbg !771
  %32 = load i32, i32* %n, align 4, !dbg !772
  %33 = load double*, double** %dev_A, align 8, !dbg !773
  %34 = load double*, double** %dev_B, align 8, !dbg !774
  call void @_ZL6kerneliiPdS_(i32 %31, i32 %32, double* %33, double* %34), !dbg !775
  %35 = load double*, double** %A, align 8, !dbg !776
  %36 = bitcast double* %35 to i8*, !dbg !776
  %37 = load double*, double** %dev_A, align 8, !dbg !777
  %38 = bitcast double* %37 to i8*, !dbg !777
  %39 = load i32, i32* %n, align 4, !dbg !778
  %40 = load i32, i32* %n, align 4, !dbg !779
  %mul27 = mul nsw i32 %39, %40, !dbg !780
  %conv28 = sext i32 %mul27 to i64, !dbg !778
  %mul29 = mul i64 %conv28, 8, !dbg !781
  %call30 = call i32 @cudaMemcpy(i8* %36, i8* %38, i64 %mul29, i32 2), !dbg !782
  %41 = load i32, i32* %dump_code, align 4, !dbg !783
  %cmp = icmp eq i32 %41, 1, !dbg !785
  br i1 %cmp, label %if.then, label %if.end, !dbg !786

if.then:                                          ; preds = %entry
  %42 = load i32, i32* %n, align 4, !dbg !787
  %43 = load double*, double** %A, align 8, !dbg !788
  call void @_ZL11print_arrayiPd(i32 %42, double* %43), !dbg !789
  br label %if.end, !dbg !789

if.end:                                           ; preds = %if.then, %entry
  %44 = load double*, double** %A, align 8, !dbg !790
  %45 = bitcast double* %44 to i8*, !dbg !790
  call void @free(i8* %45) #9, !dbg !791
  %46 = load double*, double** %B, align 8, !dbg !792
  %47 = bitcast double* %46 to i8*, !dbg !792
  call void @free(i8* %47) #9, !dbg !793
  %48 = load double*, double** %dev_A, align 8, !dbg !794
  %49 = bitcast double* %48 to i8*, !dbg !794
  %call31 = call i32 @cudaFree(i8* %49), !dbg !795
  %50 = load double*, double** %dev_B, align 8, !dbg !796
  %51 = bitcast double* %50 to i8*, !dbg !796
  %call32 = call i32 @cudaFree(i8* %51), !dbg !797
  ret i32 0, !dbg !798
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: noinline nounwind uwtable
define internal void @_ZL10init_arrayiPdS_(i32 %n, double* %A, double* %B) #5 !dbg !799 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !800, metadata !DIExpression()), !dbg !801
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !802, metadata !DIExpression()), !dbg !803
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !804, metadata !DIExpression()), !dbg !805
  call void @llvm.dbg.declare(metadata i32* %i, metadata !806, metadata !DIExpression()), !dbg !807
  call void @llvm.dbg.declare(metadata i32* %j, metadata !808, metadata !DIExpression()), !dbg !809
  store i32 0, i32* %i, align 4, !dbg !810
  br label %for.cond, !dbg !812

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i32, i32* %i, align 4, !dbg !813
  %1 = load i32, i32* %n.addr, align 4, !dbg !815
  %cmp = icmp slt i32 %0, %1, !dbg !816
  br i1 %cmp, label %for.body, label %for.end22, !dbg !817

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !818
  br label %for.cond1, !dbg !820

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !821
  %3 = load i32, i32* %n.addr, align 4, !dbg !823
  %cmp2 = icmp slt i32 %2, %3, !dbg !824
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !825

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %i, align 4, !dbg !826
  %conv = sitofp i32 %4 to double, !dbg !826
  %5 = load i32, i32* %j, align 4, !dbg !828
  %add = add nsw i32 %5, 2, !dbg !829
  %conv4 = sitofp i32 %add to double, !dbg !830
  %mul = fmul contract double %conv, %conv4, !dbg !831
  %add5 = fadd contract double %mul, 2.000000e+00, !dbg !832
  %6 = load i32, i32* %n.addr, align 4, !dbg !833
  %conv6 = sitofp i32 %6 to double, !dbg !833
  %div = fdiv double %add5, %conv6, !dbg !834
  %7 = load double*, double** %A.addr, align 8, !dbg !835
  %8 = load i32, i32* %i, align 4, !dbg !836
  %9 = load i32, i32* %n.addr, align 4, !dbg !837
  %mul7 = mul nsw i32 %8, %9, !dbg !838
  %10 = load i32, i32* %j, align 4, !dbg !839
  %add8 = add nsw i32 %mul7, %10, !dbg !840
  %idxprom = sext i32 %add8 to i64, !dbg !835
  %arrayidx = getelementptr inbounds double, double* %7, i64 %idxprom, !dbg !835
  store double %div, double* %arrayidx, align 8, !dbg !841
  %11 = load i32, i32* %i, align 4, !dbg !842
  %conv9 = sitofp i32 %11 to double, !dbg !842
  %12 = load i32, i32* %j, align 4, !dbg !843
  %add10 = add nsw i32 %12, 3, !dbg !844
  %conv11 = sitofp i32 %add10 to double, !dbg !845
  %mul12 = fmul contract double %conv9, %conv11, !dbg !846
  %add13 = fadd contract double %mul12, 3.000000e+00, !dbg !847
  %13 = load i32, i32* %n.addr, align 4, !dbg !848
  %conv14 = sitofp i32 %13 to double, !dbg !848
  %div15 = fdiv double %add13, %conv14, !dbg !849
  %14 = load double*, double** %B.addr, align 8, !dbg !850
  %15 = load i32, i32* %i, align 4, !dbg !851
  %16 = load i32, i32* %n.addr, align 4, !dbg !852
  %mul16 = mul nsw i32 %15, %16, !dbg !853
  %17 = load i32, i32* %j, align 4, !dbg !854
  %add17 = add nsw i32 %mul16, %17, !dbg !855
  %idxprom18 = sext i32 %add17 to i64, !dbg !850
  %arrayidx19 = getelementptr inbounds double, double* %14, i64 %idxprom18, !dbg !850
  store double %div15, double* %arrayidx19, align 8, !dbg !856
  br label %for.inc, !dbg !857

for.inc:                                          ; preds = %for.body3
  %18 = load i32, i32* %j, align 4, !dbg !858
  %inc = add nsw i32 %18, 1, !dbg !858
  store i32 %inc, i32* %j, align 4, !dbg !858
  br label %for.cond1, !dbg !859, !llvm.loop !860

for.end:                                          ; preds = %for.cond1
  br label %for.inc20, !dbg !861

for.inc20:                                        ; preds = %for.end
  %19 = load i32, i32* %i, align 4, !dbg !862
  %inc21 = add nsw i32 %19, 1, !dbg !862
  store i32 %inc21, i32* %i, align 4, !dbg !862
  br label %for.cond, !dbg !863, !llvm.loop !864

for.end22:                                        ; preds = %for.cond
  ret void, !dbg !866
}

; Function Attrs: noinline uwtable
define internal i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %devPtr, i64 %size) #0 !dbg !867 {
entry:
  %devPtr.addr = alloca double**, align 8
  %size.addr = alloca i64, align 8
  store double** %devPtr, double*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %devPtr.addr, metadata !875, metadata !DIExpression()), !dbg !876
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !877, metadata !DIExpression()), !dbg !878
  %0 = load double**, double*** %devPtr.addr, align 8, !dbg !879
  %1 = bitcast double** %0 to i8*, !dbg !879
  %2 = bitcast i8* %1 to i8**, !dbg !880
  %3 = load i64, i64* %size.addr, align 8, !dbg !881
  %call = call i32 @cudaMalloc(i8** %2, i64 %3), !dbg !882
  ret i32 %call, !dbg !883
}

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #6

; Function Attrs: noinline uwtable
define internal void @_ZL6kerneliiPdS_(i32 %tsteps, i32 %n, double* %A, double* %B) #0 !dbg !884 {
entry:
  %tsteps.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %threadsPerBlock = alloca i32, align 4
  %t = alloca i32, align 4
  %block = alloca %struct.dim3, align 4
  %grid = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp3 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp3.coerce = alloca { i64, i32 }, align 4
  %agg.tmp5 = alloca %struct.dim3, align 4
  %agg.tmp6 = alloca %struct.dim3, align 4
  %agg.tmp5.coerce = alloca { i64, i32 }, align 4
  %agg.tmp6.coerce = alloca { i64, i32 }, align 4
  store i32 %tsteps, i32* %tsteps.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tsteps.addr, metadata !887, metadata !DIExpression()), !dbg !888
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !889, metadata !DIExpression()), !dbg !890
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !891, metadata !DIExpression()), !dbg !892
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !893, metadata !DIExpression()), !dbg !894
  call void @llvm.dbg.declare(metadata i32* %threadsPerBlock, metadata !895, metadata !DIExpression()), !dbg !897
  store i32 256, i32* %threadsPerBlock, align 4, !dbg !897
  call void @llvm.dbg.declare(metadata i32* %t, metadata !898, metadata !DIExpression()), !dbg !900
  store i32 1, i32* %t, align 4, !dbg !900
  br label %for.cond, !dbg !901

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %t, align 4, !dbg !902
  %1 = load i32, i32* %tsteps.addr, align 4, !dbg !904
  %cmp = icmp sle i32 %0, %1, !dbg !905
  br i1 %cmp, label %for.body, label %for.end, !dbg !906

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.dim3* %block, metadata !907, metadata !DIExpression()), !dbg !932
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %block, i32 8, i32 32, i32 1), !dbg !932
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid, metadata !933, metadata !DIExpression()), !dbg !934
  %2 = load i32, i32* %n.addr, align 4, !dbg !935
  %sub = sub nsw i32 %2, 2, !dbg !936
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 0, !dbg !937
  %3 = load i32, i32* %x, align 4, !dbg !937
  %call = call i32 @_ZL10num_blocksii(i32 %sub, i32 %3), !dbg !938
  %4 = load i32, i32* %n.addr, align 4, !dbg !939
  %sub1 = sub nsw i32 %4, 2, !dbg !940
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 1, !dbg !941
  %5 = load i32, i32* %y, align 4, !dbg !941
  %call2 = call i32 @_ZL10num_blocksii(i32 %sub1, i32 %5), !dbg !942
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid, i32 %call, i32 %call2, i32 1), !dbg !934
  %6 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !943
  %7 = bitcast %struct.dim3* %grid to i8*, !dbg !943
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 4 %7, i64 12, i1 false), !dbg !943
  %8 = bitcast %struct.dim3* %agg.tmp3 to i8*, !dbg !944
  %9 = bitcast %struct.dim3* %block to i8*, !dbg !944
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 4 %9, i64 12, i1 false), !dbg !944
  %10 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !945
  %11 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !945
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 4 %11, i64 12, i1 false), !dbg !945
  %12 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !945
  %13 = load i64, i64* %12, align 4, !dbg !945
  %14 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !945
  %15 = load i32, i32* %14, align 4, !dbg !945
  %16 = bitcast { i64, i32 }* %agg.tmp3.coerce to i8*, !dbg !945
  %17 = bitcast %struct.dim3* %agg.tmp3 to i8*, !dbg !945
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %16, i8* align 4 %17, i64 12, i1 false), !dbg !945
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp3.coerce, i32 0, i32 0, !dbg !945
  %19 = load i64, i64* %18, align 4, !dbg !945
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp3.coerce, i32 0, i32 1, !dbg !945
  %21 = load i32, i32* %20, align 4, !dbg !945
  %call4 = call i32 @cudaConfigureCall(i64 %13, i32 %15, i64 %19, i32 %21, i64 0, %struct.CUstream_st* null), !dbg !945
  %tobool = icmp ne i32 %call4, 0, !dbg !945
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !946

kcall.configok:                                   ; preds = %for.body
  %22 = load i32, i32* %n.addr, align 4, !dbg !947
  %23 = load double*, double** %A.addr, align 8, !dbg !948
  %24 = load double*, double** %B.addr, align 8, !dbg !949
  call void @_Z14kernel_stenciliPdS_(i32 %22, double* %23, double* %24), !dbg !946
  br label %kcall.end, !dbg !946

kcall.end:                                        ; preds = %kcall.configok, %for.body
  %25 = bitcast %struct.dim3* %agg.tmp5 to i8*, !dbg !950
  %26 = bitcast %struct.dim3* %grid to i8*, !dbg !950
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %25, i8* align 4 %26, i64 12, i1 false), !dbg !950
  %27 = bitcast %struct.dim3* %agg.tmp6 to i8*, !dbg !951
  %28 = bitcast %struct.dim3* %block to i8*, !dbg !951
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %27, i8* align 4 %28, i64 12, i1 false), !dbg !951
  %29 = bitcast { i64, i32 }* %agg.tmp5.coerce to i8*, !dbg !952
  %30 = bitcast %struct.dim3* %agg.tmp5 to i8*, !dbg !952
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %29, i8* align 4 %30, i64 12, i1 false), !dbg !952
  %31 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 0, !dbg !952
  %32 = load i64, i64* %31, align 4, !dbg !952
  %33 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 1, !dbg !952
  %34 = load i32, i32* %33, align 4, !dbg !952
  %35 = bitcast { i64, i32 }* %agg.tmp6.coerce to i8*, !dbg !952
  %36 = bitcast %struct.dim3* %agg.tmp6 to i8*, !dbg !952
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %35, i8* align 4 %36, i64 12, i1 false), !dbg !952
  %37 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp6.coerce, i32 0, i32 0, !dbg !952
  %38 = load i64, i64* %37, align 4, !dbg !952
  %39 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp6.coerce, i32 0, i32 1, !dbg !952
  %40 = load i32, i32* %39, align 4, !dbg !952
  %call7 = call i32 @cudaConfigureCall(i64 %32, i32 %34, i64 %38, i32 %40, i64 0, %struct.CUstream_st* null), !dbg !952
  %tobool8 = icmp ne i32 %call7, 0, !dbg !952
  br i1 %tobool8, label %kcall.end10, label %kcall.configok9, !dbg !953

kcall.configok9:                                  ; preds = %kcall.end
  %41 = load i32, i32* %n.addr, align 4, !dbg !954
  %42 = load double*, double** %B.addr, align 8, !dbg !955
  %43 = load double*, double** %A.addr, align 8, !dbg !956
  call void @_Z14kernel_stenciliPdS_(i32 %41, double* %42, double* %43), !dbg !953
  br label %kcall.end10, !dbg !953

kcall.end10:                                      ; preds = %kcall.configok9, %kcall.end
  br label %for.inc, !dbg !957

for.inc:                                          ; preds = %kcall.end10
  %44 = load i32, i32* %t, align 4, !dbg !958
  %inc = add nsw i32 %44, 1, !dbg !958
  store i32 %inc, i32* %t, align 4, !dbg !958
  br label %for.cond, !dbg !959, !llvm.loop !960

for.end:                                          ; preds = %for.cond
  ret void, !dbg !962
}

; Function Attrs: noinline uwtable
define internal void @_ZL11print_arrayiPd(i32 %n, double* %A) #0 !dbg !963 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !966, metadata !DIExpression()), !dbg !967
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !968, metadata !DIExpression()), !dbg !969
  call void @llvm.dbg.declare(metadata i32* %i, metadata !970, metadata !DIExpression()), !dbg !971
  call void @llvm.dbg.declare(metadata i32* %j, metadata !972, metadata !DIExpression()), !dbg !973
  store i32 0, i32* %i, align 4, !dbg !974
  br label %for.cond, !dbg !976

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %i, align 4, !dbg !977
  %1 = load i32, i32* %n.addr, align 4, !dbg !979
  %cmp = icmp slt i32 %0, %1, !dbg !980
  br i1 %cmp, label %for.body, label %for.end10, !dbg !981

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !982
  br label %for.cond1, !dbg !984

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !985
  %3 = load i32, i32* %n.addr, align 4, !dbg !987
  %cmp2 = icmp slt i32 %2, %3, !dbg !988
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !989

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !990
  %5 = load double*, double** %A.addr, align 8, !dbg !992
  %6 = load i32, i32* %i, align 4, !dbg !993
  %7 = load i32, i32* %n.addr, align 4, !dbg !994
  %mul = mul nsw i32 %6, %7, !dbg !995
  %8 = load i32, i32* %j, align 4, !dbg !996
  %add = add nsw i32 %mul, %8, !dbg !997
  %idxprom = sext i32 %add to i64, !dbg !992
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom, !dbg !992
  %9 = load double, double* %arrayidx, align 8, !dbg !992
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %9), !dbg !998
  %10 = load i32, i32* %i, align 4, !dbg !999
  %11 = load i32, i32* %n.addr, align 4, !dbg !1001
  %mul4 = mul nsw i32 %10, %11, !dbg !1002
  %12 = load i32, i32* %j, align 4, !dbg !1003
  %add5 = add nsw i32 %mul4, %12, !dbg !1004
  %rem = srem i32 %add5, 20, !dbg !1005
  %cmp6 = icmp eq i32 %rem, 0, !dbg !1006
  br i1 %cmp6, label %if.then, label %if.end, !dbg !1007

if.then:                                          ; preds = %for.body3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1008
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1009
  br label %if.end, !dbg !1009

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !1010

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %j, align 4, !dbg !1011
  %inc = add nsw i32 %14, 1, !dbg !1011
  store i32 %inc, i32* %j, align 4, !dbg !1011
  br label %for.cond1, !dbg !1012, !llvm.loop !1013

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !1014

for.inc8:                                         ; preds = %for.end
  %15 = load i32, i32* %i, align 4, !dbg !1015
  %inc9 = add nsw i32 %15, 1, !dbg !1015
  store i32 %inc9, i32* %i, align 4, !dbg !1015
  br label %for.cond, !dbg !1016, !llvm.loop !1017

for.end10:                                        ; preds = %for.cond
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1019
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1020
  ret void, !dbg !1021
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

declare dso_local i32 @cudaFree(i8*) #6

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #5 comdat align 2 !dbg !1022 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1023, metadata !DIExpression()), !dbg !1025
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1026, metadata !DIExpression()), !dbg !1027
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1028, metadata !DIExpression()), !dbg !1029
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1030, metadata !DIExpression()), !dbg !1031
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1032
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1033
  store i32 %0, i32* %x, align 4, !dbg !1032
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1034
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1035
  store i32 %1, i32* %y, align 4, !dbg !1034
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1036
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1037
  store i32 %2, i32* %z, align 4, !dbg !1036
  ret void, !dbg !1038
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_ZL10num_blocksii(i32 %num, i32 %factor) #5 !dbg !1039 {
entry:
  %num.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1042, metadata !DIExpression()), !dbg !1043
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1044, metadata !DIExpression()), !dbg !1045
  %0 = load i32, i32* %num.addr, align 4, !dbg !1046
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1047
  %add = add nsw i32 %0, %1, !dbg !1048
  %sub = sub nsw i32 %add, 1, !dbg !1049
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1050
  %div = sdiv i32 %sub, %2, !dbg !1051
  ret i32 %div, !dbg !1052
}

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #7

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #6

declare dso_local i32 @cudaMalloc(i8**, i64) #6

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
!5 = !DIFile(filename: "jacobi-2d-imper.cu", directory: "/u/NAS_SCRATCH/yc0769/xstack-benchmark/polybench-cuda/jacobi-2d-imper")
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
!692 = distinct !DISubprogram(name: "kernel_stencil", linkageName: "_Z14kernel_stenciliPdS_", scope: !5, file: !5, line: 20, type: !693, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !110, !99, !99}
!695 = !{}
!696 = !DILocalVariable(name: "n", arg: 1, scope: !692, file: !5, line: 20, type: !110)
!697 = !DILocation(line: 20, column: 36, scope: !692)
!698 = !DILocalVariable(name: "A", arg: 2, scope: !692, file: !5, line: 20, type: !99)
!699 = !DILocation(line: 20, column: 47, scope: !692)
!700 = !DILocalVariable(name: "B", arg: 3, scope: !692, file: !5, line: 20, type: !99)
!701 = !DILocation(line: 20, column: 58, scope: !692)
!702 = !DILocation(line: 20, column: 61, scope: !692)
!703 = !DILocation(line: 28, column: 1, scope: !692)
!704 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 81, type: !705, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!705 = !DISubroutineType(types: !706)
!706 = !{!110, !110, !466}
!707 = !DILocalVariable(name: "argc", arg: 1, scope: !704, file: !5, line: 81, type: !110)
!708 = !DILocation(line: 81, column: 14, scope: !704)
!709 = !DILocalVariable(name: "argv", arg: 2, scope: !704, file: !5, line: 81, type: !466)
!710 = !DILocation(line: 81, column: 27, scope: !704)
!711 = !DILocalVariable(name: "dump_code", scope: !704, file: !5, line: 84, type: !110)
!712 = !DILocation(line: 84, column: 7, scope: !704)
!713 = !DILocation(line: 84, column: 24, scope: !704)
!714 = !DILocation(line: 84, column: 19, scope: !704)
!715 = !DILocalVariable(name: "n", scope: !704, file: !5, line: 85, type: !110)
!716 = !DILocation(line: 85, column: 7, scope: !704)
!717 = !DILocation(line: 85, column: 16, scope: !704)
!718 = !DILocation(line: 85, column: 11, scope: !704)
!719 = !DILocalVariable(name: "tsteps", scope: !704, file: !5, line: 86, type: !110)
!720 = !DILocation(line: 86, column: 7, scope: !704)
!721 = !DILocation(line: 86, column: 21, scope: !704)
!722 = !DILocation(line: 86, column: 16, scope: !704)
!723 = !DILocalVariable(name: "A", scope: !704, file: !5, line: 89, type: !99)
!724 = !DILocation(line: 89, column: 11, scope: !704)
!725 = !DILocation(line: 89, column: 31, scope: !704)
!726 = !DILocation(line: 89, column: 33, scope: !704)
!727 = !DILocation(line: 89, column: 32, scope: !704)
!728 = !DILocation(line: 89, column: 34, scope: !704)
!729 = !DILocation(line: 89, column: 24, scope: !704)
!730 = !DILocation(line: 89, column: 15, scope: !704)
!731 = !DILocalVariable(name: "B", scope: !704, file: !5, line: 90, type: !99)
!732 = !DILocation(line: 90, column: 11, scope: !704)
!733 = !DILocation(line: 90, column: 31, scope: !704)
!734 = !DILocation(line: 90, column: 33, scope: !704)
!735 = !DILocation(line: 90, column: 32, scope: !704)
!736 = !DILocation(line: 90, column: 34, scope: !704)
!737 = !DILocation(line: 90, column: 24, scope: !704)
!738 = !DILocation(line: 90, column: 15, scope: !704)
!739 = !DILocation(line: 96, column: 15, scope: !704)
!740 = !DILocation(line: 96, column: 18, scope: !704)
!741 = !DILocation(line: 96, column: 21, scope: !704)
!742 = !DILocation(line: 96, column: 3, scope: !704)
!743 = !DILocalVariable(name: "dev_A", scope: !704, file: !5, line: 99, type: !99)
!744 = !DILocation(line: 99, column: 11, scope: !704)
!745 = !DILocalVariable(name: "dev_B", scope: !704, file: !5, line: 100, type: !99)
!746 = !DILocation(line: 100, column: 11, scope: !704)
!747 = !DILocation(line: 101, column: 22, scope: !704)
!748 = !DILocation(line: 101, column: 24, scope: !704)
!749 = !DILocation(line: 101, column: 23, scope: !704)
!750 = !DILocation(line: 101, column: 25, scope: !704)
!751 = !DILocation(line: 101, column: 3, scope: !704)
!752 = !DILocation(line: 102, column: 22, scope: !704)
!753 = !DILocation(line: 102, column: 24, scope: !704)
!754 = !DILocation(line: 102, column: 23, scope: !704)
!755 = !DILocation(line: 102, column: 25, scope: !704)
!756 = !DILocation(line: 102, column: 3, scope: !704)
!757 = !DILocation(line: 103, column: 14, scope: !704)
!758 = !DILocation(line: 103, column: 21, scope: !704)
!759 = !DILocation(line: 103, column: 24, scope: !704)
!760 = !DILocation(line: 103, column: 26, scope: !704)
!761 = !DILocation(line: 103, column: 25, scope: !704)
!762 = !DILocation(line: 103, column: 27, scope: !704)
!763 = !DILocation(line: 103, column: 3, scope: !704)
!764 = !DILocation(line: 104, column: 14, scope: !704)
!765 = !DILocation(line: 104, column: 21, scope: !704)
!766 = !DILocation(line: 104, column: 24, scope: !704)
!767 = !DILocation(line: 104, column: 26, scope: !704)
!768 = !DILocation(line: 104, column: 25, scope: !704)
!769 = !DILocation(line: 104, column: 27, scope: !704)
!770 = !DILocation(line: 104, column: 3, scope: !704)
!771 = !DILocation(line: 107, column: 10, scope: !704)
!772 = !DILocation(line: 107, column: 18, scope: !704)
!773 = !DILocation(line: 107, column: 21, scope: !704)
!774 = !DILocation(line: 107, column: 28, scope: !704)
!775 = !DILocation(line: 107, column: 3, scope: !704)
!776 = !DILocation(line: 108, column: 14, scope: !704)
!777 = !DILocation(line: 108, column: 17, scope: !704)
!778 = !DILocation(line: 108, column: 24, scope: !704)
!779 = !DILocation(line: 108, column: 26, scope: !704)
!780 = !DILocation(line: 108, column: 25, scope: !704)
!781 = !DILocation(line: 108, column: 27, scope: !704)
!782 = !DILocation(line: 108, column: 3, scope: !704)
!783 = !DILocation(line: 112, column: 7, scope: !784)
!784 = distinct !DILexicalBlock(scope: !704, file: !5, line: 112, column: 7)
!785 = !DILocation(line: 112, column: 17, scope: !784)
!786 = !DILocation(line: 112, column: 7, scope: !704)
!787 = !DILocation(line: 112, column: 35, scope: !784)
!788 = !DILocation(line: 112, column: 38, scope: !784)
!789 = !DILocation(line: 112, column: 23, scope: !784)
!790 = !DILocation(line: 115, column: 15, scope: !704)
!791 = !DILocation(line: 115, column: 3, scope: !704)
!792 = !DILocation(line: 116, column: 15, scope: !704)
!793 = !DILocation(line: 116, column: 3, scope: !704)
!794 = !DILocation(line: 117, column: 19, scope: !704)
!795 = !DILocation(line: 117, column: 3, scope: !704)
!796 = !DILocation(line: 118, column: 19, scope: !704)
!797 = !DILocation(line: 118, column: 3, scope: !704)
!798 = !DILocation(line: 120, column: 3, scope: !704)
!799 = distinct !DISubprogram(name: "init_array", linkageName: "_ZL10init_arrayiPdS_", scope: !5, file: !5, line: 45, type: !693, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!800 = !DILocalVariable(name: "n", arg: 1, scope: !799, file: !5, line: 45, type: !110)
!801 = !DILocation(line: 45, column: 22, scope: !799)
!802 = !DILocalVariable(name: "A", arg: 2, scope: !799, file: !5, line: 46, type: !99)
!803 = !DILocation(line: 46, column: 13, scope: !799)
!804 = !DILocalVariable(name: "B", arg: 3, scope: !799, file: !5, line: 47, type: !99)
!805 = !DILocation(line: 47, column: 13, scope: !799)
!806 = !DILocalVariable(name: "i", scope: !799, file: !5, line: 49, type: !110)
!807 = !DILocation(line: 49, column: 7, scope: !799)
!808 = !DILocalVariable(name: "j", scope: !799, file: !5, line: 49, type: !110)
!809 = !DILocation(line: 49, column: 10, scope: !799)
!810 = !DILocation(line: 51, column: 10, scope: !811)
!811 = distinct !DILexicalBlock(scope: !799, file: !5, line: 51, column: 3)
!812 = !DILocation(line: 51, column: 8, scope: !811)
!813 = !DILocation(line: 51, column: 15, scope: !814)
!814 = distinct !DILexicalBlock(scope: !811, file: !5, line: 51, column: 3)
!815 = !DILocation(line: 51, column: 19, scope: !814)
!816 = !DILocation(line: 51, column: 17, scope: !814)
!817 = !DILocation(line: 51, column: 3, scope: !811)
!818 = !DILocation(line: 52, column: 12, scope: !819)
!819 = distinct !DILexicalBlock(scope: !814, file: !5, line: 52, column: 5)
!820 = !DILocation(line: 52, column: 10, scope: !819)
!821 = !DILocation(line: 52, column: 17, scope: !822)
!822 = distinct !DILexicalBlock(scope: !819, file: !5, line: 52, column: 5)
!823 = !DILocation(line: 52, column: 21, scope: !822)
!824 = !DILocation(line: 52, column: 19, scope: !822)
!825 = !DILocation(line: 52, column: 5, scope: !819)
!826 = !DILocation(line: 54, column: 28, scope: !827)
!827 = distinct !DILexicalBlock(scope: !822, file: !5, line: 53, column: 5)
!828 = !DILocation(line: 54, column: 31, scope: !827)
!829 = !DILocation(line: 54, column: 32, scope: !827)
!830 = !DILocation(line: 54, column: 30, scope: !827)
!831 = !DILocation(line: 54, column: 29, scope: !827)
!832 = !DILocation(line: 54, column: 36, scope: !827)
!833 = !DILocation(line: 54, column: 43, scope: !827)
!834 = !DILocation(line: 54, column: 41, scope: !827)
!835 = !DILocation(line: 54, column: 7, scope: !827)
!836 = !DILocation(line: 54, column: 9, scope: !827)
!837 = !DILocation(line: 54, column: 11, scope: !827)
!838 = !DILocation(line: 54, column: 10, scope: !827)
!839 = !DILocation(line: 54, column: 13, scope: !827)
!840 = !DILocation(line: 54, column: 12, scope: !827)
!841 = !DILocation(line: 54, column: 16, scope: !827)
!842 = !DILocation(line: 55, column: 28, scope: !827)
!843 = !DILocation(line: 55, column: 31, scope: !827)
!844 = !DILocation(line: 55, column: 32, scope: !827)
!845 = !DILocation(line: 55, column: 30, scope: !827)
!846 = !DILocation(line: 55, column: 29, scope: !827)
!847 = !DILocation(line: 55, column: 36, scope: !827)
!848 = !DILocation(line: 55, column: 43, scope: !827)
!849 = !DILocation(line: 55, column: 41, scope: !827)
!850 = !DILocation(line: 55, column: 7, scope: !827)
!851 = !DILocation(line: 55, column: 9, scope: !827)
!852 = !DILocation(line: 55, column: 11, scope: !827)
!853 = !DILocation(line: 55, column: 10, scope: !827)
!854 = !DILocation(line: 55, column: 13, scope: !827)
!855 = !DILocation(line: 55, column: 12, scope: !827)
!856 = !DILocation(line: 55, column: 16, scope: !827)
!857 = !DILocation(line: 56, column: 5, scope: !827)
!858 = !DILocation(line: 52, column: 25, scope: !822)
!859 = !DILocation(line: 52, column: 5, scope: !822)
!860 = distinct !{!860, !825, !861}
!861 = !DILocation(line: 56, column: 5, scope: !819)
!862 = !DILocation(line: 51, column: 23, scope: !814)
!863 = !DILocation(line: 51, column: 3, scope: !814)
!864 = distinct !{!864, !817, !865}
!865 = !DILocation(line: 56, column: 5, scope: !811)
!866 = !DILocation(line: 57, column: 1, scope: !799)
!867 = distinct !DISubprogram(name: "cudaMalloc<double>", linkageName: "_ZL10cudaMallocIdE9cudaErrorPPT_m", scope: !868, file: !868, line: 490, type: !869, scopeLine: 494, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, templateParams: !873, retainedNodes: !695)
!868 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "")
!869 = !DISubroutineType(types: !870)
!870 = !{!871, !872, !391}
!871 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !8, line: 1419, baseType: !16)
!872 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!873 = !{!874}
!874 = !DITemplateTypeParameter(name: "T", type: !100)
!875 = !DILocalVariable(name: "devPtr", arg: 1, scope: !867, file: !868, line: 491, type: !872)
!876 = !DILocation(line: 491, column: 12, scope: !867)
!877 = !DILocalVariable(name: "size", arg: 2, scope: !867, file: !868, line: 492, type: !391)
!878 = !DILocation(line: 492, column: 12, scope: !867)
!879 = !DILocation(line: 495, column: 38, scope: !867)
!880 = !DILocation(line: 495, column: 23, scope: !867)
!881 = !DILocation(line: 495, column: 46, scope: !867)
!882 = !DILocation(line: 495, column: 10, scope: !867)
!883 = !DILocation(line: 495, column: 3, scope: !867)
!884 = distinct !DISubprogram(name: "kernel", linkageName: "_ZL6kerneliiPdS_", scope: !5, file: !5, line: 32, type: !885, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!885 = !DISubroutineType(types: !886)
!886 = !{null, !110, !110, !99, !99}
!887 = !DILocalVariable(name: "tsteps", arg: 1, scope: !884, file: !5, line: 32, type: !110)
!888 = !DILocation(line: 32, column: 24, scope: !884)
!889 = !DILocalVariable(name: "n", arg: 2, scope: !884, file: !5, line: 32, type: !110)
!890 = !DILocation(line: 32, column: 36, scope: !884)
!891 = !DILocalVariable(name: "A", arg: 3, scope: !884, file: !5, line: 33, type: !99)
!892 = !DILocation(line: 33, column: 28, scope: !884)
!893 = !DILocalVariable(name: "B", arg: 4, scope: !884, file: !5, line: 33, type: !99)
!894 = !DILocation(line: 33, column: 39, scope: !884)
!895 = !DILocalVariable(name: "threadsPerBlock", scope: !884, file: !5, line: 34, type: !896)
!896 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!897 = !DILocation(line: 34, column: 22, scope: !884)
!898 = !DILocalVariable(name: "t", scope: !899, file: !5, line: 36, type: !110)
!899 = distinct !DILexicalBlock(scope: !884, file: !5, line: 36, column: 3)
!900 = !DILocation(line: 36, column: 12, scope: !899)
!901 = !DILocation(line: 36, column: 8, scope: !899)
!902 = !DILocation(line: 36, column: 19, scope: !903)
!903 = distinct !DILexicalBlock(scope: !899, file: !5, line: 36, column: 3)
!904 = !DILocation(line: 36, column: 24, scope: !903)
!905 = !DILocation(line: 36, column: 21, scope: !903)
!906 = !DILocation(line: 36, column: 3, scope: !899)
!907 = !DILocalVariable(name: "block", scope: !908, file: !5, line: 37, type: !909)
!908 = distinct !DILexicalBlock(scope: !903, file: !5, line: 36, column: 37)
!909 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !910, line: 427, baseType: !911)
!910 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!911 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !910, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !912, identifier: "_ZTS4dim3")
!912 = !{!913, !914, !915, !916, !920, !929}
!913 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !911, file: !910, line: 419, baseType: !9, size: 32)
!914 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !911, file: !910, line: 419, baseType: !9, size: 32, offset: 32)
!915 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !911, file: !910, line: 419, baseType: !9, size: 32, offset: 64)
!916 = !DISubprogram(name: "dim3", scope: !911, file: !910, line: 421, type: !917, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!917 = !DISubroutineType(types: !918)
!918 = !{null, !919, !9, !9, !9}
!919 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !911, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!920 = !DISubprogram(name: "dim3", scope: !911, file: !910, line: 422, type: !921, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!921 = !DISubroutineType(types: !922)
!922 = !{null, !919, !923}
!923 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !910, line: 383, baseType: !924)
!924 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !910, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !925, identifier: "_ZTS5uint3")
!925 = !{!926, !927, !928}
!926 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !924, file: !910, line: 192, baseType: !9, size: 32)
!927 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !924, file: !910, line: 192, baseType: !9, size: 32, offset: 32)
!928 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !924, file: !910, line: 192, baseType: !9, size: 32, offset: 64)
!929 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !911, file: !910, line: 423, type: !930, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!930 = !DISubroutineType(types: !931)
!931 = !{!923, !919}
!932 = !DILocation(line: 37, column: 10, scope: !908)
!933 = !DILocalVariable(name: "grid", scope: !908, file: !5, line: 38, type: !909)
!934 = !DILocation(line: 38, column: 10, scope: !908)
!935 = !DILocation(line: 38, column: 26, scope: !908)
!936 = !DILocation(line: 38, column: 28, scope: !908)
!937 = !DILocation(line: 38, column: 39, scope: !908)
!938 = !DILocation(line: 38, column: 15, scope: !908)
!939 = !DILocation(line: 38, column: 54, scope: !908)
!940 = !DILocation(line: 38, column: 56, scope: !908)
!941 = !DILocation(line: 38, column: 67, scope: !908)
!942 = !DILocation(line: 38, column: 43, scope: !908)
!943 = !DILocation(line: 39, column: 22, scope: !908)
!944 = !DILocation(line: 39, column: 28, scope: !908)
!945 = !DILocation(line: 39, column: 19, scope: !908)
!946 = !DILocation(line: 39, column: 5, scope: !908)
!947 = !DILocation(line: 39, column: 37, scope: !908)
!948 = !DILocation(line: 39, column: 40, scope: !908)
!949 = !DILocation(line: 39, column: 43, scope: !908)
!950 = !DILocation(line: 40, column: 22, scope: !908)
!951 = !DILocation(line: 40, column: 28, scope: !908)
!952 = !DILocation(line: 40, column: 19, scope: !908)
!953 = !DILocation(line: 40, column: 5, scope: !908)
!954 = !DILocation(line: 40, column: 37, scope: !908)
!955 = !DILocation(line: 40, column: 40, scope: !908)
!956 = !DILocation(line: 40, column: 43, scope: !908)
!957 = !DILocation(line: 41, column: 3, scope: !908)
!958 = !DILocation(line: 36, column: 33, scope: !903)
!959 = !DILocation(line: 36, column: 3, scope: !903)
!960 = distinct !{!960, !906, !961}
!961 = !DILocation(line: 41, column: 3, scope: !899)
!962 = !DILocation(line: 42, column: 1, scope: !884)
!963 = distinct !DISubprogram(name: "print_array", linkageName: "_ZL11print_arrayiPd", scope: !5, file: !5, line: 63, type: !964, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!964 = !DISubroutineType(types: !965)
!965 = !{null, !110, !99}
!966 = !DILocalVariable(name: "n", arg: 1, scope: !963, file: !5, line: 63, type: !110)
!967 = !DILocation(line: 63, column: 22, scope: !963)
!968 = !DILocalVariable(name: "A", arg: 2, scope: !963, file: !5, line: 64, type: !99)
!969 = !DILocation(line: 64, column: 13, scope: !963)
!970 = !DILocalVariable(name: "i", scope: !963, file: !5, line: 67, type: !110)
!971 = !DILocation(line: 67, column: 7, scope: !963)
!972 = !DILocalVariable(name: "j", scope: !963, file: !5, line: 67, type: !110)
!973 = !DILocation(line: 67, column: 10, scope: !963)
!974 = !DILocation(line: 69, column: 10, scope: !975)
!975 = distinct !DILexicalBlock(scope: !963, file: !5, line: 69, column: 3)
!976 = !DILocation(line: 69, column: 8, scope: !975)
!977 = !DILocation(line: 69, column: 15, scope: !978)
!978 = distinct !DILexicalBlock(scope: !975, file: !5, line: 69, column: 3)
!979 = !DILocation(line: 69, column: 19, scope: !978)
!980 = !DILocation(line: 69, column: 17, scope: !978)
!981 = !DILocation(line: 69, column: 3, scope: !975)
!982 = !DILocation(line: 70, column: 12, scope: !983)
!983 = distinct !DILexicalBlock(scope: !978, file: !5, line: 70, column: 5)
!984 = !DILocation(line: 70, column: 10, scope: !983)
!985 = !DILocation(line: 70, column: 17, scope: !986)
!986 = distinct !DILexicalBlock(scope: !983, file: !5, line: 70, column: 5)
!987 = !DILocation(line: 70, column: 21, scope: !986)
!988 = !DILocation(line: 70, column: 19, scope: !986)
!989 = !DILocation(line: 70, column: 5, scope: !983)
!990 = !DILocation(line: 71, column: 15, scope: !991)
!991 = distinct !DILexicalBlock(scope: !986, file: !5, line: 70, column: 29)
!992 = !DILocation(line: 71, column: 34, scope: !991)
!993 = !DILocation(line: 71, column: 36, scope: !991)
!994 = !DILocation(line: 71, column: 38, scope: !991)
!995 = !DILocation(line: 71, column: 37, scope: !991)
!996 = !DILocation(line: 71, column: 40, scope: !991)
!997 = !DILocation(line: 71, column: 39, scope: !991)
!998 = !DILocation(line: 71, column: 7, scope: !991)
!999 = !DILocation(line: 72, column: 12, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !991, file: !5, line: 72, column: 11)
!1001 = !DILocation(line: 72, column: 16, scope: !1000)
!1002 = !DILocation(line: 72, column: 14, scope: !1000)
!1003 = !DILocation(line: 72, column: 20, scope: !1000)
!1004 = !DILocation(line: 72, column: 18, scope: !1000)
!1005 = !DILocation(line: 72, column: 23, scope: !1000)
!1006 = !DILocation(line: 72, column: 28, scope: !1000)
!1007 = !DILocation(line: 72, column: 11, scope: !991)
!1008 = !DILocation(line: 72, column: 42, scope: !1000)
!1009 = !DILocation(line: 72, column: 34, scope: !1000)
!1010 = !DILocation(line: 73, column: 5, scope: !991)
!1011 = !DILocation(line: 70, column: 25, scope: !986)
!1012 = !DILocation(line: 70, column: 5, scope: !986)
!1013 = distinct !{!1013, !989, !1014}
!1014 = !DILocation(line: 73, column: 5, scope: !983)
!1015 = !DILocation(line: 69, column: 23, scope: !978)
!1016 = !DILocation(line: 69, column: 3, scope: !978)
!1017 = distinct !{!1017, !981, !1018}
!1018 = !DILocation(line: 73, column: 5, scope: !975)
!1019 = !DILocation(line: 74, column: 11, scope: !963)
!1020 = !DILocation(line: 74, column: 3, scope: !963)
!1021 = !DILocation(line: 75, column: 1, scope: !963)
!1022 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !911, file: !910, line: 421, type: !917, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, declaration: !916, retainedNodes: !695)
!1023 = !DILocalVariable(name: "this", arg: 1, scope: !1022, type: !1024, flags: DIFlagArtificial | DIFlagObjectPointer)
!1024 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !911, size: 64)
!1025 = !DILocation(line: 0, scope: !1022)
!1026 = !DILocalVariable(name: "vx", arg: 2, scope: !1022, file: !910, line: 421, type: !9)
!1027 = !DILocation(line: 421, column: 43, scope: !1022)
!1028 = !DILocalVariable(name: "vy", arg: 3, scope: !1022, file: !910, line: 421, type: !9)
!1029 = !DILocation(line: 421, column: 64, scope: !1022)
!1030 = !DILocalVariable(name: "vz", arg: 4, scope: !1022, file: !910, line: 421, type: !9)
!1031 = !DILocation(line: 421, column: 85, scope: !1022)
!1032 = !DILocation(line: 421, column: 95, scope: !1022)
!1033 = !DILocation(line: 421, column: 97, scope: !1022)
!1034 = !DILocation(line: 421, column: 102, scope: !1022)
!1035 = !DILocation(line: 421, column: 104, scope: !1022)
!1036 = !DILocation(line: 421, column: 109, scope: !1022)
!1037 = !DILocation(line: 421, column: 111, scope: !1022)
!1038 = !DILocation(line: 421, column: 116, scope: !1022)
!1039 = distinct !DISubprogram(name: "num_blocks", linkageName: "_ZL10num_blocksii", scope: !5, file: !5, line: 14, type: !1040, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!9, !110, !110}
!1042 = !DILocalVariable(name: "num", arg: 1, scope: !1039, file: !5, line: 14, type: !110)
!1043 = !DILocation(line: 14, column: 32, scope: !1039)
!1044 = !DILocalVariable(name: "factor", arg: 2, scope: !1039, file: !5, line: 14, type: !110)
!1045 = !DILocation(line: 14, column: 41, scope: !1039)
!1046 = !DILocation(line: 15, column: 11, scope: !1039)
!1047 = !DILocation(line: 15, column: 17, scope: !1039)
!1048 = !DILocation(line: 15, column: 15, scope: !1039)
!1049 = !DILocation(line: 15, column: 24, scope: !1039)
!1050 = !DILocation(line: 15, column: 31, scope: !1039)
!1051 = !DILocation(line: 15, column: 29, scope: !1039)
!1052 = !DILocation(line: 15, column: 3, scope: !1039)
