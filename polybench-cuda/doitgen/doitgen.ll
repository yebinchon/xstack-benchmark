; ModuleID = 'doitgen.cu'
source_filename = "doitgen.cu"
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
define dso_local void @_Z10kernel_sumiiiPdS_S_(i32 %nr, i32 %nq, i32 %np, double* %A, double* %C4, double* %sum) #0 !dbg !692 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %C4.addr = alloca double*, align 8
  %sum.addr = alloca double*, align 8
  store i32 %nr, i32* %nr.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nr.addr, metadata !696, metadata !DIExpression()), !dbg !697
  store i32 %nq, i32* %nq.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nq.addr, metadata !698, metadata !DIExpression()), !dbg !699
  store i32 %np, i32* %np.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %np.addr, metadata !700, metadata !DIExpression()), !dbg !701
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !702, metadata !DIExpression()), !dbg !703
  store double* %C4, double** %C4.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C4.addr, metadata !704, metadata !DIExpression()), !dbg !705
  store double* %sum, double** %sum.addr, align 8
  call void @llvm.dbg.declare(metadata double** %sum.addr, metadata !706, metadata !DIExpression()), !dbg !707
  %0 = bitcast i32* %nr.addr to i8*, !dbg !708
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !708
  %2 = icmp eq i32 %1, 0, !dbg !708
  br i1 %2, label %setup.next, label %setup.end, !dbg !708

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %nq.addr to i8*, !dbg !708
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !708
  %5 = icmp eq i32 %4, 0, !dbg !708
  br i1 %5, label %setup.next1, label %setup.end, !dbg !708

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %np.addr to i8*, !dbg !708
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 8), !dbg !708
  %8 = icmp eq i32 %7, 0, !dbg !708
  br i1 %8, label %setup.next2, label %setup.end, !dbg !708

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %A.addr to i8*, !dbg !708
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 16), !dbg !708
  %11 = icmp eq i32 %10, 0, !dbg !708
  br i1 %11, label %setup.next3, label %setup.end, !dbg !708

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %C4.addr to i8*, !dbg !708
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 24), !dbg !708
  %14 = icmp eq i32 %13, 0, !dbg !708
  br i1 %14, label %setup.next4, label %setup.end, !dbg !708

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %sum.addr to i8*, !dbg !708
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 32), !dbg !708
  %17 = icmp eq i32 %16, 0, !dbg !708
  br i1 %17, label %setup.next5, label %setup.end, !dbg !708

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i32, double*, double*, double*)* @_Z10kernel_sumiiiPdS_S_ to i8*)), !dbg !708
  br label %setup.end, !dbg !708

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !709
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !710 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %dump_code = alloca i32, align 4
  %nr = alloca i32, align 4
  %nq = alloca i32, align 4
  %np = alloca i32, align 4
  %A = alloca double*, align 8
  %sum = alloca double*, align 8
  %C4 = alloca double*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !713, metadata !DIExpression()), !dbg !714
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !715, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.declare(metadata i32* %dump_code, metadata !717, metadata !DIExpression()), !dbg !718
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !719
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !719
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !719
  %call = call i32 @atoi(i8* %1) #8, !dbg !720
  store i32 %call, i32* %dump_code, align 4, !dbg !718
  call void @llvm.dbg.declare(metadata i32* %nr, metadata !721, metadata !DIExpression()), !dbg !722
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !723
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !723
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !723
  %call2 = call i32 @atoi(i8* %3) #8, !dbg !724
  store i32 %call2, i32* %nr, align 4, !dbg !722
  call void @llvm.dbg.declare(metadata i32* %nq, metadata !725, metadata !DIExpression()), !dbg !726
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !727
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i64 3, !dbg !727
  %5 = load i8*, i8** %arrayidx3, align 8, !dbg !727
  %call4 = call i32 @atoi(i8* %5) #8, !dbg !728
  store i32 %call4, i32* %nq, align 4, !dbg !726
  call void @llvm.dbg.declare(metadata i32* %np, metadata !729, metadata !DIExpression()), !dbg !730
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !731
  %arrayidx5 = getelementptr inbounds i8*, i8** %6, i64 4, !dbg !731
  %7 = load i8*, i8** %arrayidx5, align 8, !dbg !731
  %call6 = call i32 @atoi(i8* %7) #8, !dbg !732
  store i32 %call6, i32* %np, align 4, !dbg !730
  call void @llvm.dbg.declare(metadata double** %A, metadata !733, metadata !DIExpression()), !dbg !734
  %8 = load i32, i32* %nr, align 4, !dbg !735
  %9 = load i32, i32* %nq, align 4, !dbg !736
  %mul = mul nsw i32 %8, %9, !dbg !737
  %10 = load i32, i32* %np, align 4, !dbg !738
  %mul7 = mul nsw i32 %mul, %10, !dbg !739
  %conv = sext i32 %mul7 to i64, !dbg !735
  %mul8 = mul i64 %conv, 8, !dbg !740
  %call9 = call noalias i8* @malloc(i64 %mul8) #9, !dbg !741
  %11 = bitcast i8* %call9 to double*, !dbg !742
  store double* %11, double** %A, align 8, !dbg !734
  call void @llvm.dbg.declare(metadata double** %sum, metadata !743, metadata !DIExpression()), !dbg !744
  %12 = load i32, i32* %nr, align 4, !dbg !745
  %13 = load i32, i32* %nq, align 4, !dbg !746
  %mul10 = mul nsw i32 %12, %13, !dbg !747
  %14 = load i32, i32* %np, align 4, !dbg !748
  %mul11 = mul nsw i32 %mul10, %14, !dbg !749
  %conv12 = sext i32 %mul11 to i64, !dbg !745
  %mul13 = mul i64 %conv12, 8, !dbg !750
  %call14 = call noalias i8* @malloc(i64 %mul13) #9, !dbg !751
  %15 = bitcast i8* %call14 to double*, !dbg !752
  store double* %15, double** %sum, align 8, !dbg !744
  call void @llvm.dbg.declare(metadata double** %C4, metadata !753, metadata !DIExpression()), !dbg !754
  %16 = load i32, i32* %np, align 4, !dbg !755
  %17 = load i32, i32* %np, align 4, !dbg !756
  %mul15 = mul nsw i32 %16, %17, !dbg !757
  %conv16 = sext i32 %mul15 to i64, !dbg !755
  %mul17 = mul i64 %conv16, 8, !dbg !758
  %call18 = call noalias i8* @malloc(i64 %mul17) #9, !dbg !759
  %18 = bitcast i8* %call18 to double*, !dbg !760
  store double* %18, double** %C4, align 8, !dbg !754
  %19 = load i32, i32* %nr, align 4, !dbg !761
  %20 = load i32, i32* %nq, align 4, !dbg !762
  %21 = load i32, i32* %np, align 4, !dbg !763
  %22 = load double*, double** %A, align 8, !dbg !764
  %23 = load double*, double** %C4, align 8, !dbg !765
  call void @_ZL10init_arrayiiiPdS_(i32 %19, i32 %20, i32 %21, double* %22, double* %23), !dbg !766
  %24 = load i32, i32* %nr, align 4, !dbg !767
  %25 = load i32, i32* %nq, align 4, !dbg !768
  %26 = load i32, i32* %np, align 4, !dbg !769
  %27 = load double*, double** %A, align 8, !dbg !770
  %28 = load double*, double** %C4, align 8, !dbg !771
  %29 = load double*, double** %sum, align 8, !dbg !772
  call void @_ZL6kerneliiiPdS_S_(i32 %24, i32 %25, i32 %26, double* %27, double* %28, double* %29), !dbg !773
  %30 = load i32, i32* %dump_code, align 4, !dbg !774
  %cmp = icmp eq i32 %30, 1, !dbg !776
  br i1 %cmp, label %if.then, label %if.end, !dbg !777

if.then:                                          ; preds = %entry
  %31 = load i32, i32* %nr, align 4, !dbg !778
  %32 = load i32, i32* %nq, align 4, !dbg !779
  %33 = load i32, i32* %np, align 4, !dbg !780
  %34 = load double*, double** %A, align 8, !dbg !781
  call void @_ZL11print_arrayiiiPd(i32 %31, i32 %32, i32 %33, double* %34), !dbg !782
  br label %if.end, !dbg !782

if.end:                                           ; preds = %if.then, %entry
  %35 = load double*, double** %A, align 8, !dbg !783
  %36 = bitcast double* %35 to i8*, !dbg !783
  call void @free(i8* %36) #9, !dbg !784
  %37 = load double*, double** %sum, align 8, !dbg !785
  %38 = bitcast double* %37 to i8*, !dbg !785
  call void @free(i8* %38) #9, !dbg !786
  %39 = load double*, double** %C4, align 8, !dbg !787
  %40 = bitcast double* %39 to i8*, !dbg !787
  call void @free(i8* %40) #9, !dbg !788
  ret i32 0, !dbg !789
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: noinline nounwind uwtable
define internal void @_ZL10init_arrayiiiPdS_(i32 %nr, i32 %nq, i32 %np, double* %A, double* %C4) #5 !dbg !790 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %C4.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nr.addr, metadata !793, metadata !DIExpression()), !dbg !794
  store i32 %nq, i32* %nq.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nq.addr, metadata !795, metadata !DIExpression()), !dbg !796
  store i32 %np, i32* %np.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %np.addr, metadata !797, metadata !DIExpression()), !dbg !798
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !799, metadata !DIExpression()), !dbg !800
  store double* %C4, double** %C4.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C4.addr, metadata !801, metadata !DIExpression()), !dbg !802
  call void @llvm.dbg.declare(metadata i32* %i, metadata !803, metadata !DIExpression()), !dbg !804
  call void @llvm.dbg.declare(metadata i32* %j, metadata !805, metadata !DIExpression()), !dbg !806
  call void @llvm.dbg.declare(metadata i32* %k, metadata !807, metadata !DIExpression()), !dbg !808
  store i32 0, i32* %i, align 4, !dbg !809
  br label %for.cond, !dbg !811

for.cond:                                         ; preds = %for.inc18, %entry
  %0 = load i32, i32* %i, align 4, !dbg !812
  %1 = load i32, i32* %nr.addr, align 4, !dbg !814
  %cmp = icmp slt i32 %0, %1, !dbg !815
  br i1 %cmp, label %for.body, label %for.end20, !dbg !816

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !817
  br label %for.cond1, !dbg !819

for.cond1:                                        ; preds = %for.inc15, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !820
  %3 = load i32, i32* %nq.addr, align 4, !dbg !822
  %cmp2 = icmp slt i32 %2, %3, !dbg !823
  br i1 %cmp2, label %for.body3, label %for.end17, !dbg !824

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4, !dbg !825
  br label %for.cond4, !dbg !827

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32, i32* %k, align 4, !dbg !828
  %5 = load i32, i32* %np.addr, align 4, !dbg !830
  %cmp5 = icmp slt i32 %4, %5, !dbg !831
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !832

for.body6:                                        ; preds = %for.cond4
  %6 = load i32, i32* %i, align 4, !dbg !833
  %conv = sitofp i32 %6 to double, !dbg !833
  %7 = load i32, i32* %j, align 4, !dbg !834
  %conv7 = sitofp i32 %7 to double, !dbg !834
  %mul = fmul contract double %conv, %conv7, !dbg !835
  %8 = load i32, i32* %k, align 4, !dbg !836
  %conv8 = sitofp i32 %8 to double, !dbg !836
  %add = fadd contract double %mul, %conv8, !dbg !837
  %9 = load i32, i32* %np.addr, align 4, !dbg !838
  %conv9 = sitofp i32 %9 to double, !dbg !838
  %div = fdiv double %add, %conv9, !dbg !839
  %10 = load double*, double** %A.addr, align 8, !dbg !840
  %11 = load i32, i32* %i, align 4, !dbg !841
  %12 = load i32, i32* %np.addr, align 4, !dbg !842
  %mul10 = mul nsw i32 %11, %12, !dbg !843
  %13 = load i32, i32* %nq.addr, align 4, !dbg !844
  %mul11 = mul nsw i32 %mul10, %13, !dbg !845
  %14 = load i32, i32* %j, align 4, !dbg !846
  %15 = load i32, i32* %nq.addr, align 4, !dbg !847
  %mul12 = mul nsw i32 %14, %15, !dbg !848
  %add13 = add nsw i32 %mul11, %mul12, !dbg !849
  %16 = load i32, i32* %k, align 4, !dbg !850
  %add14 = add nsw i32 %add13, %16, !dbg !851
  %idxprom = sext i32 %add14 to i64, !dbg !840
  %arrayidx = getelementptr inbounds double, double* %10, i64 %idxprom, !dbg !840
  store double %div, double* %arrayidx, align 8, !dbg !852
  br label %for.inc, !dbg !840

for.inc:                                          ; preds = %for.body6
  %17 = load i32, i32* %k, align 4, !dbg !853
  %inc = add nsw i32 %17, 1, !dbg !853
  store i32 %inc, i32* %k, align 4, !dbg !853
  br label %for.cond4, !dbg !854, !llvm.loop !855

for.end:                                          ; preds = %for.cond4
  br label %for.inc15, !dbg !856

for.inc15:                                        ; preds = %for.end
  %18 = load i32, i32* %j, align 4, !dbg !857
  %inc16 = add nsw i32 %18, 1, !dbg !857
  store i32 %inc16, i32* %j, align 4, !dbg !857
  br label %for.cond1, !dbg !858, !llvm.loop !859

for.end17:                                        ; preds = %for.cond1
  br label %for.inc18, !dbg !860

for.inc18:                                        ; preds = %for.end17
  %19 = load i32, i32* %i, align 4, !dbg !861
  %inc19 = add nsw i32 %19, 1, !dbg !861
  store i32 %inc19, i32* %i, align 4, !dbg !861
  br label %for.cond, !dbg !862, !llvm.loop !863

for.end20:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !865
  br label %for.cond21, !dbg !867

for.cond21:                                       ; preds = %for.inc39, %for.end20
  %20 = load i32, i32* %i, align 4, !dbg !868
  %21 = load i32, i32* %np.addr, align 4, !dbg !870
  %cmp22 = icmp slt i32 %20, %21, !dbg !871
  br i1 %cmp22, label %for.body23, label %for.end41, !dbg !872

for.body23:                                       ; preds = %for.cond21
  store i32 0, i32* %j, align 4, !dbg !873
  br label %for.cond24, !dbg !875

for.cond24:                                       ; preds = %for.inc36, %for.body23
  %22 = load i32, i32* %j, align 4, !dbg !876
  %23 = load i32, i32* %np.addr, align 4, !dbg !878
  %cmp25 = icmp slt i32 %22, %23, !dbg !879
  br i1 %cmp25, label %for.body26, label %for.end38, !dbg !880

for.body26:                                       ; preds = %for.cond24
  %24 = load i32, i32* %i, align 4, !dbg !881
  %conv27 = sitofp i32 %24 to double, !dbg !881
  %25 = load i32, i32* %j, align 4, !dbg !882
  %conv28 = sitofp i32 %25 to double, !dbg !882
  %mul29 = fmul contract double %conv27, %conv28, !dbg !883
  %26 = load i32, i32* %np.addr, align 4, !dbg !884
  %conv30 = sitofp i32 %26 to double, !dbg !884
  %div31 = fdiv double %mul29, %conv30, !dbg !885
  %27 = load double*, double** %C4.addr, align 8, !dbg !886
  %28 = load i32, i32* %i, align 4, !dbg !887
  %29 = load i32, i32* %np.addr, align 4, !dbg !888
  %mul32 = mul nsw i32 %28, %29, !dbg !889
  %30 = load i32, i32* %j, align 4, !dbg !890
  %add33 = add nsw i32 %mul32, %30, !dbg !891
  %idxprom34 = sext i32 %add33 to i64, !dbg !886
  %arrayidx35 = getelementptr inbounds double, double* %27, i64 %idxprom34, !dbg !886
  store double %div31, double* %arrayidx35, align 8, !dbg !892
  br label %for.inc36, !dbg !886

for.inc36:                                        ; preds = %for.body26
  %31 = load i32, i32* %j, align 4, !dbg !893
  %inc37 = add nsw i32 %31, 1, !dbg !893
  store i32 %inc37, i32* %j, align 4, !dbg !893
  br label %for.cond24, !dbg !894, !llvm.loop !895

for.end38:                                        ; preds = %for.cond24
  br label %for.inc39, !dbg !896

for.inc39:                                        ; preds = %for.end38
  %32 = load i32, i32* %i, align 4, !dbg !897
  %inc40 = add nsw i32 %32, 1, !dbg !897
  store i32 %inc40, i32* %i, align 4, !dbg !897
  br label %for.cond21, !dbg !898, !llvm.loop !899

for.end41:                                        ; preds = %for.cond21
  ret void, !dbg !901
}

; Function Attrs: noinline uwtable
define internal void @_ZL6kerneliiiPdS_S_(i32 %nr, i32 %nq, i32 %np, double* %A, double* %C4, double* %sum) #0 !dbg !902 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %C4.addr = alloca double*, align 8
  %sum.addr = alloca double*, align 8
  %dev_A = alloca double*, align 8
  %dev_sum = alloca double*, align 8
  %dev_C4 = alloca double*, align 8
  %threadsPerBlock = alloca i32, align 4
  %block = alloca %struct.dim3, align 4
  %grid = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp24 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp24.coerce = alloca { i64, i32 }, align 4
  store i32 %nr, i32* %nr.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nr.addr, metadata !903, metadata !DIExpression()), !dbg !904
  store i32 %nq, i32* %nq.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nq.addr, metadata !905, metadata !DIExpression()), !dbg !906
  store i32 %np, i32* %np.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %np.addr, metadata !907, metadata !DIExpression()), !dbg !908
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !909, metadata !DIExpression()), !dbg !910
  store double* %C4, double** %C4.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C4.addr, metadata !911, metadata !DIExpression()), !dbg !912
  store double* %sum, double** %sum.addr, align 8
  call void @llvm.dbg.declare(metadata double** %sum.addr, metadata !913, metadata !DIExpression()), !dbg !914
  call void @llvm.dbg.declare(metadata double** %dev_A, metadata !915, metadata !DIExpression()), !dbg !916
  call void @llvm.dbg.declare(metadata double** %dev_sum, metadata !917, metadata !DIExpression()), !dbg !918
  call void @llvm.dbg.declare(metadata double** %dev_C4, metadata !919, metadata !DIExpression()), !dbg !920
  %0 = load i32, i32* %nr.addr, align 4, !dbg !921
  %1 = load i32, i32* %nq.addr, align 4, !dbg !922
  %mul = mul nsw i32 %0, %1, !dbg !923
  %2 = load i32, i32* %np.addr, align 4, !dbg !924
  %mul1 = mul nsw i32 %mul, %2, !dbg !925
  %conv = sext i32 %mul1 to i64, !dbg !921
  %mul2 = mul i64 %conv, 8, !dbg !926
  %call = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_A, i64 %mul2), !dbg !927
  %3 = load i32, i32* %nr.addr, align 4, !dbg !928
  %4 = load i32, i32* %nq.addr, align 4, !dbg !929
  %mul3 = mul nsw i32 %3, %4, !dbg !930
  %5 = load i32, i32* %np.addr, align 4, !dbg !931
  %mul4 = mul nsw i32 %mul3, %5, !dbg !932
  %conv5 = sext i32 %mul4 to i64, !dbg !928
  %mul6 = mul i64 %conv5, 8, !dbg !933
  %call7 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_sum, i64 %mul6), !dbg !934
  %6 = load i32, i32* %np.addr, align 4, !dbg !935
  %7 = load i32, i32* %np.addr, align 4, !dbg !936
  %mul8 = mul nsw i32 %6, %7, !dbg !937
  %conv9 = sext i32 %mul8 to i64, !dbg !935
  %mul10 = mul i64 %conv9, 8, !dbg !938
  %call11 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_C4, i64 %mul10), !dbg !939
  %8 = load double*, double** %dev_A, align 8, !dbg !940
  %9 = bitcast double* %8 to i8*, !dbg !940
  %10 = load double*, double** %A.addr, align 8, !dbg !941
  %11 = bitcast double* %10 to i8*, !dbg !941
  %12 = load i32, i32* %nr.addr, align 4, !dbg !942
  %13 = load i32, i32* %nq.addr, align 4, !dbg !943
  %mul12 = mul nsw i32 %12, %13, !dbg !944
  %14 = load i32, i32* %np.addr, align 4, !dbg !945
  %mul13 = mul nsw i32 %mul12, %14, !dbg !946
  %conv14 = sext i32 %mul13 to i64, !dbg !942
  %mul15 = mul i64 %conv14, 8, !dbg !947
  %call16 = call i32 @cudaMemcpy(i8* %9, i8* %11, i64 %mul15, i32 1), !dbg !948
  %15 = load double*, double** %dev_C4, align 8, !dbg !949
  %16 = bitcast double* %15 to i8*, !dbg !949
  %17 = load double*, double** %C4.addr, align 8, !dbg !950
  %18 = bitcast double* %17 to i8*, !dbg !950
  %19 = load i32, i32* %np.addr, align 4, !dbg !951
  %20 = load i32, i32* %np.addr, align 4, !dbg !952
  %mul17 = mul nsw i32 %19, %20, !dbg !953
  %conv18 = sext i32 %mul17 to i64, !dbg !951
  %mul19 = mul i64 %conv18, 8, !dbg !954
  %call20 = call i32 @cudaMemcpy(i8* %16, i8* %18, i64 %mul19, i32 1), !dbg !955
  call void @llvm.dbg.declare(metadata i32* %threadsPerBlock, metadata !956, metadata !DIExpression()), !dbg !958
  store i32 256, i32* %threadsPerBlock, align 4, !dbg !958
  call void @llvm.dbg.declare(metadata %struct.dim3* %block, metadata !959, metadata !DIExpression()), !dbg !983
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %block, i32 1, i32 8, i32 32), !dbg !983
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid, metadata !984, metadata !DIExpression()), !dbg !985
  %21 = load i32, i32* %nr.addr, align 4, !dbg !986
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 0, !dbg !987
  %22 = load i32, i32* %x, align 4, !dbg !987
  %call21 = call i32 @_ZL10num_blocksii(i32 %21, i32 %22), !dbg !988
  %23 = load i32, i32* %nq.addr, align 4, !dbg !989
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 1, !dbg !990
  %24 = load i32, i32* %y, align 4, !dbg !990
  %call22 = call i32 @_ZL10num_blocksii(i32 %23, i32 %24), !dbg !991
  %25 = load i32, i32* %np.addr, align 4, !dbg !992
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 2, !dbg !993
  %26 = load i32, i32* %z, align 4, !dbg !993
  %call23 = call i32 @_ZL10num_blocksii(i32 %25, i32 %26), !dbg !994
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid, i32 %call21, i32 %call22, i32 %call23), !dbg !985
  %27 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !995
  %28 = bitcast %struct.dim3* %grid to i8*, !dbg !995
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %27, i8* align 4 %28, i64 12, i1 false), !dbg !995
  %29 = bitcast %struct.dim3* %agg.tmp24 to i8*, !dbg !996
  %30 = bitcast %struct.dim3* %block to i8*, !dbg !996
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %29, i8* align 4 %30, i64 12, i1 false), !dbg !996
  %31 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !997
  %32 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !997
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %31, i8* align 4 %32, i64 12, i1 false), !dbg !997
  %33 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !997
  %34 = load i64, i64* %33, align 4, !dbg !997
  %35 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !997
  %36 = load i32, i32* %35, align 4, !dbg !997
  %37 = bitcast { i64, i32 }* %agg.tmp24.coerce to i8*, !dbg !997
  %38 = bitcast %struct.dim3* %agg.tmp24 to i8*, !dbg !997
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %37, i8* align 4 %38, i64 12, i1 false), !dbg !997
  %39 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp24.coerce, i32 0, i32 0, !dbg !997
  %40 = load i64, i64* %39, align 4, !dbg !997
  %41 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp24.coerce, i32 0, i32 1, !dbg !997
  %42 = load i32, i32* %41, align 4, !dbg !997
  %call25 = call i32 @cudaConfigureCall(i64 %34, i32 %36, i64 %40, i32 %42, i64 0, %struct.CUstream_st* null), !dbg !997
  %tobool = icmp ne i32 %call25, 0, !dbg !997
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !998

kcall.configok:                                   ; preds = %entry
  %43 = load i32, i32* %nr.addr, align 4, !dbg !999
  %44 = load i32, i32* %nq.addr, align 4, !dbg !1000
  %45 = load i32, i32* %np.addr, align 4, !dbg !1001
  %46 = load double*, double** %dev_A, align 8, !dbg !1002
  %47 = load double*, double** %dev_C4, align 8, !dbg !1003
  %48 = load double*, double** %dev_sum, align 8, !dbg !1004
  call void @_Z10kernel_sumiiiPdS_S_(i32 %43, i32 %44, i32 %45, double* %46, double* %47, double* %48), !dbg !998
  br label %kcall.end, !dbg !998

kcall.end:                                        ; preds = %kcall.configok, %entry
  %49 = load double*, double** %A.addr, align 8, !dbg !1005
  %50 = bitcast double* %49 to i8*, !dbg !1005
  %51 = load double*, double** %dev_sum, align 8, !dbg !1006
  %52 = bitcast double* %51 to i8*, !dbg !1006
  %53 = load i32, i32* %nr.addr, align 4, !dbg !1007
  %54 = load i32, i32* %nq.addr, align 4, !dbg !1008
  %mul26 = mul nsw i32 %53, %54, !dbg !1009
  %55 = load i32, i32* %np.addr, align 4, !dbg !1010
  %mul27 = mul nsw i32 %mul26, %55, !dbg !1011
  %conv28 = sext i32 %mul27 to i64, !dbg !1007
  %mul29 = mul i64 %conv28, 8, !dbg !1012
  %call30 = call i32 @cudaMemcpy(i8* %50, i8* %52, i64 %mul29, i32 2), !dbg !1013
  %56 = load double*, double** %dev_A, align 8, !dbg !1014
  %57 = bitcast double* %56 to i8*, !dbg !1014
  %call31 = call i32 @cudaFree(i8* %57), !dbg !1015
  %58 = load double*, double** %dev_sum, align 8, !dbg !1016
  %59 = bitcast double* %58 to i8*, !dbg !1016
  %call32 = call i32 @cudaFree(i8* %59), !dbg !1017
  %60 = load double*, double** %dev_C4, align 8, !dbg !1018
  %61 = bitcast double* %60 to i8*, !dbg !1018
  %call33 = call i32 @cudaFree(i8* %61), !dbg !1019
  ret void, !dbg !1020
}

; Function Attrs: noinline uwtable
define internal void @_ZL11print_arrayiiiPd(i32 %nr, i32 %nq, i32 %np, double* %A) #0 !dbg !1021 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nr.addr, metadata !1024, metadata !DIExpression()), !dbg !1025
  store i32 %nq, i32* %nq.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nq.addr, metadata !1026, metadata !DIExpression()), !dbg !1027
  store i32 %np, i32* %np.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %np.addr, metadata !1028, metadata !DIExpression()), !dbg !1029
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !1030, metadata !DIExpression()), !dbg !1031
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1032, metadata !DIExpression()), !dbg !1033
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1034, metadata !DIExpression()), !dbg !1035
  call void @llvm.dbg.declare(metadata i32* %k, metadata !1036, metadata !DIExpression()), !dbg !1037
  store i32 0, i32* %i, align 4, !dbg !1038
  br label %for.cond, !dbg !1040

for.cond:                                         ; preds = %for.inc15, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1041
  %1 = load i32, i32* %nr.addr, align 4, !dbg !1043
  %cmp = icmp slt i32 %0, %1, !dbg !1044
  br i1 %cmp, label %for.body, label %for.end17, !dbg !1045

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !1046
  br label %for.cond1, !dbg !1048

for.cond1:                                        ; preds = %for.inc12, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !1049
  %3 = load i32, i32* %nq.addr, align 4, !dbg !1051
  %cmp2 = icmp slt i32 %2, %3, !dbg !1052
  br i1 %cmp2, label %for.body3, label %for.end14, !dbg !1053

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4, !dbg !1054
  br label %for.cond4, !dbg !1056

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32, i32* %k, align 4, !dbg !1057
  %5 = load i32, i32* %np.addr, align 4, !dbg !1059
  %cmp5 = icmp slt i32 %4, %5, !dbg !1060
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1061

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1062
  %7 = load double*, double** %A.addr, align 8, !dbg !1064
  %8 = load i32, i32* %i, align 4, !dbg !1065
  %9 = load i32, i32* %nq.addr, align 4, !dbg !1066
  %mul = mul nsw i32 %8, %9, !dbg !1067
  %10 = load i32, i32* %np.addr, align 4, !dbg !1068
  %mul7 = mul nsw i32 %mul, %10, !dbg !1069
  %11 = load i32, i32* %j, align 4, !dbg !1070
  %12 = load i32, i32* %nq.addr, align 4, !dbg !1071
  %mul8 = mul nsw i32 %11, %12, !dbg !1072
  %add = add nsw i32 %mul7, %mul8, !dbg !1073
  %13 = load i32, i32* %k, align 4, !dbg !1074
  %add9 = add nsw i32 %add, %13, !dbg !1075
  %idxprom = sext i32 %add9 to i64, !dbg !1064
  %arrayidx = getelementptr inbounds double, double* %7, i64 %idxprom, !dbg !1064
  %14 = load double, double* %arrayidx, align 8, !dbg !1064
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %14), !dbg !1076
  %15 = load i32, i32* %i, align 4, !dbg !1077
  %rem = srem i32 %15, 20, !dbg !1079
  %cmp10 = icmp eq i32 %rem, 0, !dbg !1080
  br i1 %cmp10, label %if.then, label %if.end, !dbg !1081

if.then:                                          ; preds = %for.body6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1082
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1083
  br label %if.end, !dbg !1083

if.end:                                           ; preds = %if.then, %for.body6
  br label %for.inc, !dbg !1084

for.inc:                                          ; preds = %if.end
  %17 = load i32, i32* %k, align 4, !dbg !1085
  %inc = add nsw i32 %17, 1, !dbg !1085
  store i32 %inc, i32* %k, align 4, !dbg !1085
  br label %for.cond4, !dbg !1086, !llvm.loop !1087

for.end:                                          ; preds = %for.cond4
  br label %for.inc12, !dbg !1088

for.inc12:                                        ; preds = %for.end
  %18 = load i32, i32* %j, align 4, !dbg !1089
  %inc13 = add nsw i32 %18, 1, !dbg !1089
  store i32 %inc13, i32* %j, align 4, !dbg !1089
  br label %for.cond1, !dbg !1090, !llvm.loop !1091

for.end14:                                        ; preds = %for.cond1
  br label %for.inc15, !dbg !1092

for.inc15:                                        ; preds = %for.end14
  %19 = load i32, i32* %i, align 4, !dbg !1093
  %inc16 = add nsw i32 %19, 1, !dbg !1093
  store i32 %inc16, i32* %i, align 4, !dbg !1093
  br label %for.cond, !dbg !1094, !llvm.loop !1095

for.end17:                                        ; preds = %for.cond
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1097
  %call18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1098
  ret void, !dbg !1099
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline uwtable
define internal i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %devPtr, i64 %size) #0 !dbg !1100 {
entry:
  %devPtr.addr = alloca double**, align 8
  %size.addr = alloca i64, align 8
  store double** %devPtr, double*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %devPtr.addr, metadata !1108, metadata !DIExpression()), !dbg !1109
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !1110, metadata !DIExpression()), !dbg !1111
  %0 = load double**, double*** %devPtr.addr, align 8, !dbg !1112
  %1 = bitcast double** %0 to i8*, !dbg !1112
  %2 = bitcast i8* %1 to i8**, !dbg !1113
  %3 = load i64, i64* %size.addr, align 8, !dbg !1114
  %call = call i32 @cudaMalloc(i8** %2, i64 %3), !dbg !1115
  ret i32 %call, !dbg !1116
}

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #6

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #5 comdat align 2 !dbg !1117 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1118, metadata !DIExpression()), !dbg !1120
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1121, metadata !DIExpression()), !dbg !1122
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1123, metadata !DIExpression()), !dbg !1124
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1125, metadata !DIExpression()), !dbg !1126
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1127
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1128
  store i32 %0, i32* %x, align 4, !dbg !1127
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1129
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1130
  store i32 %1, i32* %y, align 4, !dbg !1129
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1131
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1132
  store i32 %2, i32* %z, align 4, !dbg !1131
  ret void, !dbg !1133
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_ZL10num_blocksii(i32 %num, i32 %factor) #5 !dbg !1134 {
entry:
  %num.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1137, metadata !DIExpression()), !dbg !1138
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1139, metadata !DIExpression()), !dbg !1140
  %0 = load i32, i32* %num.addr, align 4, !dbg !1141
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1142
  %add = add nsw i32 %0, %1, !dbg !1143
  %sub = sub nsw i32 %add, 1, !dbg !1144
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1145
  %div = sdiv i32 %sub, %2, !dbg !1146
  ret i32 %div, !dbg !1147
}

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #7

declare dso_local i32 @cudaFree(i8*) #6

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
!5 = !DIFile(filename: "doitgen.cu", directory: "/u/NAS_SCRATCH/yc0769/xstack-benchmark/polybench-cuda/doitgen")
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
!692 = distinct !DISubprogram(name: "kernel_sum", linkageName: "_Z10kernel_sumiiiPdS_S_", scope: !5, file: !5, line: 19, type: !693, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !110, !110, !110, !99, !99, !99}
!695 = !{}
!696 = !DILocalVariable(name: "nr", arg: 1, scope: !692, file: !5, line: 19, type: !110)
!697 = !DILocation(line: 19, column: 32, scope: !692)
!698 = !DILocalVariable(name: "nq", arg: 2, scope: !692, file: !5, line: 19, type: !110)
!699 = !DILocation(line: 19, column: 40, scope: !692)
!700 = !DILocalVariable(name: "np", arg: 3, scope: !692, file: !5, line: 19, type: !110)
!701 = !DILocation(line: 19, column: 48, scope: !692)
!702 = !DILocalVariable(name: "A", arg: 4, scope: !692, file: !5, line: 20, type: !99)
!703 = !DILocation(line: 20, column: 36, scope: !692)
!704 = !DILocalVariable(name: "C4", arg: 5, scope: !692, file: !5, line: 21, type: !99)
!705 = !DILocation(line: 21, column: 36, scope: !692)
!706 = !DILocalVariable(name: "sum", arg: 6, scope: !692, file: !5, line: 21, type: !99)
!707 = !DILocation(line: 21, column: 48, scope: !692)
!708 = !DILocation(line: 21, column: 53, scope: !692)
!709 = !DILocation(line: 32, column: 1, scope: !692)
!710 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 98, type: !711, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!711 = !DISubroutineType(types: !712)
!712 = !{!110, !110, !466}
!713 = !DILocalVariable(name: "argc", arg: 1, scope: !710, file: !5, line: 98, type: !110)
!714 = !DILocation(line: 98, column: 14, scope: !710)
!715 = !DILocalVariable(name: "argv", arg: 2, scope: !710, file: !5, line: 98, type: !466)
!716 = !DILocation(line: 98, column: 27, scope: !710)
!717 = !DILocalVariable(name: "dump_code", scope: !710, file: !5, line: 101, type: !110)
!718 = !DILocation(line: 101, column: 7, scope: !710)
!719 = !DILocation(line: 101, column: 24, scope: !710)
!720 = !DILocation(line: 101, column: 19, scope: !710)
!721 = !DILocalVariable(name: "nr", scope: !710, file: !5, line: 102, type: !110)
!722 = !DILocation(line: 102, column: 7, scope: !710)
!723 = !DILocation(line: 102, column: 17, scope: !710)
!724 = !DILocation(line: 102, column: 12, scope: !710)
!725 = !DILocalVariable(name: "nq", scope: !710, file: !5, line: 103, type: !110)
!726 = !DILocation(line: 103, column: 7, scope: !710)
!727 = !DILocation(line: 103, column: 17, scope: !710)
!728 = !DILocation(line: 103, column: 12, scope: !710)
!729 = !DILocalVariable(name: "np", scope: !710, file: !5, line: 104, type: !110)
!730 = !DILocation(line: 104, column: 7, scope: !710)
!731 = !DILocation(line: 104, column: 17, scope: !710)
!732 = !DILocation(line: 104, column: 12, scope: !710)
!733 = !DILocalVariable(name: "A", scope: !710, file: !5, line: 106, type: !99)
!734 = !DILocation(line: 106, column: 11, scope: !710)
!735 = !DILocation(line: 106, column: 31, scope: !710)
!736 = !DILocation(line: 106, column: 34, scope: !710)
!737 = !DILocation(line: 106, column: 33, scope: !710)
!738 = !DILocation(line: 106, column: 37, scope: !710)
!739 = !DILocation(line: 106, column: 36, scope: !710)
!740 = !DILocation(line: 106, column: 39, scope: !710)
!741 = !DILocation(line: 106, column: 24, scope: !710)
!742 = !DILocation(line: 106, column: 15, scope: !710)
!743 = !DILocalVariable(name: "sum", scope: !710, file: !5, line: 107, type: !99)
!744 = !DILocation(line: 107, column: 11, scope: !710)
!745 = !DILocation(line: 107, column: 33, scope: !710)
!746 = !DILocation(line: 107, column: 36, scope: !710)
!747 = !DILocation(line: 107, column: 35, scope: !710)
!748 = !DILocation(line: 107, column: 39, scope: !710)
!749 = !DILocation(line: 107, column: 38, scope: !710)
!750 = !DILocation(line: 107, column: 41, scope: !710)
!751 = !DILocation(line: 107, column: 26, scope: !710)
!752 = !DILocation(line: 107, column: 17, scope: !710)
!753 = !DILocalVariable(name: "C4", scope: !710, file: !5, line: 108, type: !99)
!754 = !DILocation(line: 108, column: 11, scope: !710)
!755 = !DILocation(line: 108, column: 32, scope: !710)
!756 = !DILocation(line: 108, column: 35, scope: !710)
!757 = !DILocation(line: 108, column: 34, scope: !710)
!758 = !DILocation(line: 108, column: 37, scope: !710)
!759 = !DILocation(line: 108, column: 25, scope: !710)
!760 = !DILocation(line: 108, column: 16, scope: !710)
!761 = !DILocation(line: 115, column: 15, scope: !710)
!762 = !DILocation(line: 115, column: 19, scope: !710)
!763 = !DILocation(line: 115, column: 23, scope: !710)
!764 = !DILocation(line: 116, column: 7, scope: !710)
!765 = !DILocation(line: 117, column: 7, scope: !710)
!766 = !DILocation(line: 115, column: 3, scope: !710)
!767 = !DILocation(line: 121, column: 11, scope: !710)
!768 = !DILocation(line: 121, column: 15, scope: !710)
!769 = !DILocation(line: 121, column: 19, scope: !710)
!770 = !DILocation(line: 122, column: 7, scope: !710)
!771 = !DILocation(line: 123, column: 7, scope: !710)
!772 = !DILocation(line: 124, column: 7, scope: !710)
!773 = !DILocation(line: 121, column: 3, scope: !710)
!774 = !DILocation(line: 130, column: 7, scope: !775)
!775 = distinct !DILexicalBlock(scope: !710, file: !5, line: 130, column: 7)
!776 = !DILocation(line: 130, column: 17, scope: !775)
!777 = !DILocation(line: 130, column: 7, scope: !710)
!778 = !DILocation(line: 130, column: 35, scope: !775)
!779 = !DILocation(line: 130, column: 39, scope: !775)
!780 = !DILocation(line: 130, column: 43, scope: !775)
!781 = !DILocation(line: 130, column: 47, scope: !775)
!782 = !DILocation(line: 130, column: 23, scope: !775)
!783 = !DILocation(line: 133, column: 15, scope: !710)
!784 = !DILocation(line: 133, column: 3, scope: !710)
!785 = !DILocation(line: 134, column: 15, scope: !710)
!786 = !DILocation(line: 134, column: 3, scope: !710)
!787 = !DILocation(line: 135, column: 15, scope: !710)
!788 = !DILocation(line: 135, column: 3, scope: !710)
!789 = !DILocation(line: 138, column: 3, scope: !710)
!790 = distinct !DISubprogram(name: "init_array", linkageName: "_ZL10init_arrayiiiPdS_", scope: !5, file: !5, line: 61, type: !791, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!791 = !DISubroutineType(types: !792)
!792 = !{null, !110, !110, !110, !99, !99}
!793 = !DILocalVariable(name: "nr", arg: 1, scope: !790, file: !5, line: 61, type: !110)
!794 = !DILocation(line: 61, column: 21, scope: !790)
!795 = !DILocalVariable(name: "nq", arg: 2, scope: !790, file: !5, line: 61, type: !110)
!796 = !DILocation(line: 61, column: 29, scope: !790)
!797 = !DILocalVariable(name: "np", arg: 3, scope: !790, file: !5, line: 61, type: !110)
!798 = !DILocation(line: 61, column: 37, scope: !790)
!799 = !DILocalVariable(name: "A", arg: 4, scope: !790, file: !5, line: 62, type: !99)
!800 = !DILocation(line: 62, column: 13, scope: !790)
!801 = !DILocalVariable(name: "C4", arg: 5, scope: !790, file: !5, line: 63, type: !99)
!802 = !DILocation(line: 63, column: 13, scope: !790)
!803 = !DILocalVariable(name: "i", scope: !790, file: !5, line: 65, type: !110)
!804 = !DILocation(line: 65, column: 7, scope: !790)
!805 = !DILocalVariable(name: "j", scope: !790, file: !5, line: 65, type: !110)
!806 = !DILocation(line: 65, column: 10, scope: !790)
!807 = !DILocalVariable(name: "k", scope: !790, file: !5, line: 65, type: !110)
!808 = !DILocation(line: 65, column: 13, scope: !790)
!809 = !DILocation(line: 67, column: 10, scope: !810)
!810 = distinct !DILexicalBlock(scope: !790, file: !5, line: 67, column: 3)
!811 = !DILocation(line: 67, column: 8, scope: !810)
!812 = !DILocation(line: 67, column: 15, scope: !813)
!813 = distinct !DILexicalBlock(scope: !810, file: !5, line: 67, column: 3)
!814 = !DILocation(line: 67, column: 19, scope: !813)
!815 = !DILocation(line: 67, column: 17, scope: !813)
!816 = !DILocation(line: 67, column: 3, scope: !810)
!817 = !DILocation(line: 68, column: 12, scope: !818)
!818 = distinct !DILexicalBlock(scope: !813, file: !5, line: 68, column: 5)
!819 = !DILocation(line: 68, column: 10, scope: !818)
!820 = !DILocation(line: 68, column: 17, scope: !821)
!821 = distinct !DILexicalBlock(scope: !818, file: !5, line: 68, column: 5)
!822 = !DILocation(line: 68, column: 21, scope: !821)
!823 = !DILocation(line: 68, column: 19, scope: !821)
!824 = !DILocation(line: 68, column: 5, scope: !818)
!825 = !DILocation(line: 69, column: 14, scope: !826)
!826 = distinct !DILexicalBlock(scope: !821, file: !5, line: 69, column: 7)
!827 = !DILocation(line: 69, column: 12, scope: !826)
!828 = !DILocation(line: 69, column: 19, scope: !829)
!829 = distinct !DILexicalBlock(scope: !826, file: !5, line: 69, column: 7)
!830 = !DILocation(line: 69, column: 23, scope: !829)
!831 = !DILocation(line: 69, column: 21, scope: !829)
!832 = !DILocation(line: 69, column: 7, scope: !826)
!833 = !DILocation(line: 70, column: 39, scope: !829)
!834 = !DILocation(line: 70, column: 41, scope: !829)
!835 = !DILocation(line: 70, column: 40, scope: !829)
!836 = !DILocation(line: 70, column: 45, scope: !829)
!837 = !DILocation(line: 70, column: 43, scope: !829)
!838 = !DILocation(line: 70, column: 50, scope: !829)
!839 = !DILocation(line: 70, column: 48, scope: !829)
!840 = !DILocation(line: 70, column: 9, scope: !829)
!841 = !DILocation(line: 70, column: 11, scope: !829)
!842 = !DILocation(line: 70, column: 13, scope: !829)
!843 = !DILocation(line: 70, column: 12, scope: !829)
!844 = !DILocation(line: 70, column: 16, scope: !829)
!845 = !DILocation(line: 70, column: 15, scope: !829)
!846 = !DILocation(line: 70, column: 19, scope: !829)
!847 = !DILocation(line: 70, column: 21, scope: !829)
!848 = !DILocation(line: 70, column: 20, scope: !829)
!849 = !DILocation(line: 70, column: 18, scope: !829)
!850 = !DILocation(line: 70, column: 24, scope: !829)
!851 = !DILocation(line: 70, column: 23, scope: !829)
!852 = !DILocation(line: 70, column: 27, scope: !829)
!853 = !DILocation(line: 69, column: 28, scope: !829)
!854 = !DILocation(line: 69, column: 7, scope: !829)
!855 = distinct !{!855, !832, !856}
!856 = !DILocation(line: 70, column: 50, scope: !826)
!857 = !DILocation(line: 68, column: 26, scope: !821)
!858 = !DILocation(line: 68, column: 5, scope: !821)
!859 = distinct !{!859, !824, !860}
!860 = !DILocation(line: 70, column: 50, scope: !818)
!861 = !DILocation(line: 67, column: 24, scope: !813)
!862 = !DILocation(line: 67, column: 3, scope: !813)
!863 = distinct !{!863, !816, !864}
!864 = !DILocation(line: 70, column: 50, scope: !810)
!865 = !DILocation(line: 71, column: 10, scope: !866)
!866 = distinct !DILexicalBlock(scope: !790, file: !5, line: 71, column: 3)
!867 = !DILocation(line: 71, column: 8, scope: !866)
!868 = !DILocation(line: 71, column: 15, scope: !869)
!869 = distinct !DILexicalBlock(scope: !866, file: !5, line: 71, column: 3)
!870 = !DILocation(line: 71, column: 19, scope: !869)
!871 = !DILocation(line: 71, column: 17, scope: !869)
!872 = !DILocation(line: 71, column: 3, scope: !866)
!873 = !DILocation(line: 72, column: 12, scope: !874)
!874 = distinct !DILexicalBlock(scope: !869, file: !5, line: 72, column: 5)
!875 = !DILocation(line: 72, column: 10, scope: !874)
!876 = !DILocation(line: 72, column: 17, scope: !877)
!877 = distinct !DILexicalBlock(scope: !874, file: !5, line: 72, column: 5)
!878 = !DILocation(line: 72, column: 21, scope: !877)
!879 = !DILocation(line: 72, column: 19, scope: !877)
!880 = !DILocation(line: 72, column: 5, scope: !874)
!881 = !DILocation(line: 73, column: 30, scope: !877)
!882 = !DILocation(line: 73, column: 32, scope: !877)
!883 = !DILocation(line: 73, column: 31, scope: !877)
!884 = !DILocation(line: 73, column: 37, scope: !877)
!885 = !DILocation(line: 73, column: 35, scope: !877)
!886 = !DILocation(line: 73, column: 7, scope: !877)
!887 = !DILocation(line: 73, column: 10, scope: !877)
!888 = !DILocation(line: 73, column: 12, scope: !877)
!889 = !DILocation(line: 73, column: 11, scope: !877)
!890 = !DILocation(line: 73, column: 15, scope: !877)
!891 = !DILocation(line: 73, column: 14, scope: !877)
!892 = !DILocation(line: 73, column: 18, scope: !877)
!893 = !DILocation(line: 72, column: 26, scope: !877)
!894 = !DILocation(line: 72, column: 5, scope: !877)
!895 = distinct !{!895, !880, !896}
!896 = !DILocation(line: 73, column: 37, scope: !874)
!897 = !DILocation(line: 71, column: 24, scope: !869)
!898 = !DILocation(line: 71, column: 3, scope: !869)
!899 = distinct !{!899, !872, !900}
!900 = !DILocation(line: 73, column: 37, scope: !866)
!901 = !DILocation(line: 74, column: 1, scope: !790)
!902 = distinct !DISubprogram(name: "kernel", linkageName: "_ZL6kerneliiiPdS_S_", scope: !5, file: !5, line: 36, type: !693, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!903 = !DILocalVariable(name: "nr", arg: 1, scope: !902, file: !5, line: 36, type: !110)
!904 = !DILocation(line: 36, column: 24, scope: !902)
!905 = !DILocalVariable(name: "nq", arg: 2, scope: !902, file: !5, line: 36, type: !110)
!906 = !DILocation(line: 36, column: 32, scope: !902)
!907 = !DILocalVariable(name: "np", arg: 3, scope: !902, file: !5, line: 36, type: !110)
!908 = !DILocation(line: 36, column: 40, scope: !902)
!909 = !DILocalVariable(name: "A", arg: 4, scope: !902, file: !5, line: 37, type: !99)
!910 = !DILocation(line: 37, column: 28, scope: !902)
!911 = !DILocalVariable(name: "C4", arg: 5, scope: !902, file: !5, line: 38, type: !99)
!912 = !DILocation(line: 38, column: 28, scope: !902)
!913 = !DILocalVariable(name: "sum", arg: 6, scope: !902, file: !5, line: 38, type: !99)
!914 = !DILocation(line: 38, column: 40, scope: !902)
!915 = !DILocalVariable(name: "dev_A", scope: !902, file: !5, line: 39, type: !99)
!916 = !DILocation(line: 39, column: 11, scope: !902)
!917 = !DILocalVariable(name: "dev_sum", scope: !902, file: !5, line: 40, type: !99)
!918 = !DILocation(line: 40, column: 11, scope: !902)
!919 = !DILocalVariable(name: "dev_C4", scope: !902, file: !5, line: 41, type: !99)
!920 = !DILocation(line: 41, column: 11, scope: !902)
!921 = !DILocation(line: 42, column: 22, scope: !902)
!922 = !DILocation(line: 42, column: 25, scope: !902)
!923 = !DILocation(line: 42, column: 24, scope: !902)
!924 = !DILocation(line: 42, column: 28, scope: !902)
!925 = !DILocation(line: 42, column: 27, scope: !902)
!926 = !DILocation(line: 42, column: 30, scope: !902)
!927 = !DILocation(line: 42, column: 3, scope: !902)
!928 = !DILocation(line: 43, column: 24, scope: !902)
!929 = !DILocation(line: 43, column: 27, scope: !902)
!930 = !DILocation(line: 43, column: 26, scope: !902)
!931 = !DILocation(line: 43, column: 30, scope: !902)
!932 = !DILocation(line: 43, column: 29, scope: !902)
!933 = !DILocation(line: 43, column: 32, scope: !902)
!934 = !DILocation(line: 43, column: 3, scope: !902)
!935 = !DILocation(line: 44, column: 23, scope: !902)
!936 = !DILocation(line: 44, column: 26, scope: !902)
!937 = !DILocation(line: 44, column: 25, scope: !902)
!938 = !DILocation(line: 44, column: 28, scope: !902)
!939 = !DILocation(line: 44, column: 3, scope: !902)
!940 = !DILocation(line: 45, column: 14, scope: !902)
!941 = !DILocation(line: 45, column: 21, scope: !902)
!942 = !DILocation(line: 45, column: 24, scope: !902)
!943 = !DILocation(line: 45, column: 27, scope: !902)
!944 = !DILocation(line: 45, column: 26, scope: !902)
!945 = !DILocation(line: 45, column: 30, scope: !902)
!946 = !DILocation(line: 45, column: 29, scope: !902)
!947 = !DILocation(line: 45, column: 32, scope: !902)
!948 = !DILocation(line: 45, column: 3, scope: !902)
!949 = !DILocation(line: 46, column: 14, scope: !902)
!950 = !DILocation(line: 46, column: 22, scope: !902)
!951 = !DILocation(line: 46, column: 26, scope: !902)
!952 = !DILocation(line: 46, column: 29, scope: !902)
!953 = !DILocation(line: 46, column: 28, scope: !902)
!954 = !DILocation(line: 46, column: 31, scope: !902)
!955 = !DILocation(line: 46, column: 3, scope: !902)
!956 = !DILocalVariable(name: "threadsPerBlock", scope: !902, file: !5, line: 49, type: !957)
!957 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!958 = !DILocation(line: 49, column: 18, scope: !902)
!959 = !DILocalVariable(name: "block", scope: !902, file: !5, line: 51, type: !960)
!960 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !961, line: 427, baseType: !962)
!961 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!962 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !961, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !963, identifier: "_ZTS4dim3")
!963 = !{!964, !965, !966, !967, !971, !980}
!964 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !962, file: !961, line: 419, baseType: !9, size: 32)
!965 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !962, file: !961, line: 419, baseType: !9, size: 32, offset: 32)
!966 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !962, file: !961, line: 419, baseType: !9, size: 32, offset: 64)
!967 = !DISubprogram(name: "dim3", scope: !962, file: !961, line: 421, type: !968, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!968 = !DISubroutineType(types: !969)
!969 = !{null, !970, !9, !9, !9}
!970 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !962, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!971 = !DISubprogram(name: "dim3", scope: !962, file: !961, line: 422, type: !972, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!972 = !DISubroutineType(types: !973)
!973 = !{null, !970, !974}
!974 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !961, line: 383, baseType: !975)
!975 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !961, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !976, identifier: "_ZTS5uint3")
!976 = !{!977, !978, !979}
!977 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !975, file: !961, line: 192, baseType: !9, size: 32)
!978 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !975, file: !961, line: 192, baseType: !9, size: 32, offset: 32)
!979 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !975, file: !961, line: 192, baseType: !9, size: 32, offset: 64)
!980 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !962, file: !961, line: 423, type: !981, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DISubroutineType(types: !982)
!982 = !{!974, !970}
!983 = !DILocation(line: 51, column: 8, scope: !902)
!984 = !DILocalVariable(name: "grid", scope: !902, file: !5, line: 52, type: !960)
!985 = !DILocation(line: 52, column: 8, scope: !902)
!986 = !DILocation(line: 52, column: 24, scope: !902)
!987 = !DILocation(line: 52, column: 34, scope: !902)
!988 = !DILocation(line: 52, column: 13, scope: !902)
!989 = !DILocation(line: 52, column: 49, scope: !902)
!990 = !DILocation(line: 52, column: 59, scope: !902)
!991 = !DILocation(line: 52, column: 38, scope: !902)
!992 = !DILocation(line: 52, column: 74, scope: !902)
!993 = !DILocation(line: 52, column: 84, scope: !902)
!994 = !DILocation(line: 52, column: 63, scope: !902)
!995 = !DILocation(line: 53, column: 16, scope: !902)
!996 = !DILocation(line: 53, column: 22, scope: !902)
!997 = !DILocation(line: 53, column: 13, scope: !902)
!998 = !DILocation(line: 53, column: 3, scope: !902)
!999 = !DILocation(line: 53, column: 31, scope: !902)
!1000 = !DILocation(line: 53, column: 35, scope: !902)
!1001 = !DILocation(line: 53, column: 39, scope: !902)
!1002 = !DILocation(line: 53, column: 43, scope: !902)
!1003 = !DILocation(line: 53, column: 50, scope: !902)
!1004 = !DILocation(line: 53, column: 58, scope: !902)
!1005 = !DILocation(line: 54, column: 14, scope: !902)
!1006 = !DILocation(line: 54, column: 17, scope: !902)
!1007 = !DILocation(line: 54, column: 26, scope: !902)
!1008 = !DILocation(line: 54, column: 29, scope: !902)
!1009 = !DILocation(line: 54, column: 28, scope: !902)
!1010 = !DILocation(line: 54, column: 32, scope: !902)
!1011 = !DILocation(line: 54, column: 31, scope: !902)
!1012 = !DILocation(line: 54, column: 34, scope: !902)
!1013 = !DILocation(line: 54, column: 3, scope: !902)
!1014 = !DILocation(line: 55, column: 19, scope: !902)
!1015 = !DILocation(line: 55, column: 3, scope: !902)
!1016 = !DILocation(line: 56, column: 19, scope: !902)
!1017 = !DILocation(line: 56, column: 3, scope: !902)
!1018 = !DILocation(line: 57, column: 19, scope: !902)
!1019 = !DILocation(line: 57, column: 3, scope: !902)
!1020 = !DILocation(line: 58, column: 1, scope: !902)
!1021 = distinct !DISubprogram(name: "print_array", linkageName: "_ZL11print_arrayiiiPd", scope: !5, file: !5, line: 80, type: !1022, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{null, !110, !110, !110, !99}
!1024 = !DILocalVariable(name: "nr", arg: 1, scope: !1021, file: !5, line: 80, type: !110)
!1025 = !DILocation(line: 80, column: 22, scope: !1021)
!1026 = !DILocalVariable(name: "nq", arg: 2, scope: !1021, file: !5, line: 80, type: !110)
!1027 = !DILocation(line: 80, column: 30, scope: !1021)
!1028 = !DILocalVariable(name: "np", arg: 3, scope: !1021, file: !5, line: 80, type: !110)
!1029 = !DILocation(line: 80, column: 38, scope: !1021)
!1030 = !DILocalVariable(name: "A", arg: 4, scope: !1021, file: !5, line: 81, type: !99)
!1031 = !DILocation(line: 81, column: 13, scope: !1021)
!1032 = !DILocalVariable(name: "i", scope: !1021, file: !5, line: 83, type: !110)
!1033 = !DILocation(line: 83, column: 7, scope: !1021)
!1034 = !DILocalVariable(name: "j", scope: !1021, file: !5, line: 83, type: !110)
!1035 = !DILocation(line: 83, column: 10, scope: !1021)
!1036 = !DILocalVariable(name: "k", scope: !1021, file: !5, line: 83, type: !110)
!1037 = !DILocation(line: 83, column: 13, scope: !1021)
!1038 = !DILocation(line: 85, column: 10, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1021, file: !5, line: 85, column: 3)
!1040 = !DILocation(line: 85, column: 8, scope: !1039)
!1041 = !DILocation(line: 85, column: 15, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1039, file: !5, line: 85, column: 3)
!1043 = !DILocation(line: 85, column: 19, scope: !1042)
!1044 = !DILocation(line: 85, column: 17, scope: !1042)
!1045 = !DILocation(line: 85, column: 3, scope: !1039)
!1046 = !DILocation(line: 86, column: 12, scope: !1047)
!1047 = distinct !DILexicalBlock(scope: !1042, file: !5, line: 86, column: 5)
!1048 = !DILocation(line: 86, column: 10, scope: !1047)
!1049 = !DILocation(line: 86, column: 17, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !1047, file: !5, line: 86, column: 5)
!1051 = !DILocation(line: 86, column: 21, scope: !1050)
!1052 = !DILocation(line: 86, column: 19, scope: !1050)
!1053 = !DILocation(line: 86, column: 5, scope: !1047)
!1054 = !DILocation(line: 87, column: 14, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1050, file: !5, line: 87, column: 7)
!1056 = !DILocation(line: 87, column: 12, scope: !1055)
!1057 = !DILocation(line: 87, column: 19, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1055, file: !5, line: 87, column: 7)
!1059 = !DILocation(line: 87, column: 23, scope: !1058)
!1060 = !DILocation(line: 87, column: 21, scope: !1058)
!1061 = !DILocation(line: 87, column: 7, scope: !1055)
!1062 = !DILocation(line: 88, column: 18, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1058, file: !5, line: 87, column: 32)
!1064 = !DILocation(line: 88, column: 37, scope: !1063)
!1065 = !DILocation(line: 88, column: 39, scope: !1063)
!1066 = !DILocation(line: 88, column: 41, scope: !1063)
!1067 = !DILocation(line: 88, column: 40, scope: !1063)
!1068 = !DILocation(line: 88, column: 44, scope: !1063)
!1069 = !DILocation(line: 88, column: 43, scope: !1063)
!1070 = !DILocation(line: 88, column: 47, scope: !1063)
!1071 = !DILocation(line: 88, column: 49, scope: !1063)
!1072 = !DILocation(line: 88, column: 48, scope: !1063)
!1073 = !DILocation(line: 88, column: 46, scope: !1063)
!1074 = !DILocation(line: 88, column: 52, scope: !1063)
!1075 = !DILocation(line: 88, column: 51, scope: !1063)
!1076 = !DILocation(line: 88, column: 9, scope: !1063)
!1077 = !DILocation(line: 89, column: 13, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1063, file: !5, line: 89, column: 13)
!1079 = !DILocation(line: 89, column: 15, scope: !1078)
!1080 = !DILocation(line: 89, column: 20, scope: !1078)
!1081 = !DILocation(line: 89, column: 13, scope: !1063)
!1082 = !DILocation(line: 89, column: 35, scope: !1078)
!1083 = !DILocation(line: 89, column: 26, scope: !1078)
!1084 = !DILocation(line: 90, column: 7, scope: !1063)
!1085 = !DILocation(line: 87, column: 28, scope: !1058)
!1086 = !DILocation(line: 87, column: 7, scope: !1058)
!1087 = distinct !{!1087, !1061, !1088}
!1088 = !DILocation(line: 90, column: 7, scope: !1055)
!1089 = !DILocation(line: 86, column: 26, scope: !1050)
!1090 = !DILocation(line: 86, column: 5, scope: !1050)
!1091 = distinct !{!1091, !1053, !1092}
!1092 = !DILocation(line: 90, column: 7, scope: !1047)
!1093 = !DILocation(line: 85, column: 24, scope: !1042)
!1094 = !DILocation(line: 85, column: 3, scope: !1042)
!1095 = distinct !{!1095, !1045, !1096}
!1096 = !DILocation(line: 90, column: 7, scope: !1039)
!1097 = !DILocation(line: 91, column: 12, scope: !1021)
!1098 = !DILocation(line: 91, column: 3, scope: !1021)
!1099 = !DILocation(line: 92, column: 1, scope: !1021)
!1100 = distinct !DISubprogram(name: "cudaMalloc<double>", linkageName: "_ZL10cudaMallocIdE9cudaErrorPPT_m", scope: !1101, file: !1101, line: 490, type: !1102, scopeLine: 494, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, templateParams: !1106, retainedNodes: !695)
!1101 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "")
!1102 = !DISubroutineType(types: !1103)
!1103 = !{!1104, !1105, !391}
!1104 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !8, line: 1419, baseType: !16)
!1105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!1106 = !{!1107}
!1107 = !DITemplateTypeParameter(name: "T", type: !100)
!1108 = !DILocalVariable(name: "devPtr", arg: 1, scope: !1100, file: !1101, line: 491, type: !1105)
!1109 = !DILocation(line: 491, column: 12, scope: !1100)
!1110 = !DILocalVariable(name: "size", arg: 2, scope: !1100, file: !1101, line: 492, type: !391)
!1111 = !DILocation(line: 492, column: 12, scope: !1100)
!1112 = !DILocation(line: 495, column: 38, scope: !1100)
!1113 = !DILocation(line: 495, column: 23, scope: !1100)
!1114 = !DILocation(line: 495, column: 46, scope: !1100)
!1115 = !DILocation(line: 495, column: 10, scope: !1100)
!1116 = !DILocation(line: 495, column: 3, scope: !1100)
!1117 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !962, file: !961, line: 421, type: !968, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, declaration: !967, retainedNodes: !695)
!1118 = !DILocalVariable(name: "this", arg: 1, scope: !1117, type: !1119, flags: DIFlagArtificial | DIFlagObjectPointer)
!1119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !962, size: 64)
!1120 = !DILocation(line: 0, scope: !1117)
!1121 = !DILocalVariable(name: "vx", arg: 2, scope: !1117, file: !961, line: 421, type: !9)
!1122 = !DILocation(line: 421, column: 43, scope: !1117)
!1123 = !DILocalVariable(name: "vy", arg: 3, scope: !1117, file: !961, line: 421, type: !9)
!1124 = !DILocation(line: 421, column: 64, scope: !1117)
!1125 = !DILocalVariable(name: "vz", arg: 4, scope: !1117, file: !961, line: 421, type: !9)
!1126 = !DILocation(line: 421, column: 85, scope: !1117)
!1127 = !DILocation(line: 421, column: 95, scope: !1117)
!1128 = !DILocation(line: 421, column: 97, scope: !1117)
!1129 = !DILocation(line: 421, column: 102, scope: !1117)
!1130 = !DILocation(line: 421, column: 104, scope: !1117)
!1131 = !DILocation(line: 421, column: 109, scope: !1117)
!1132 = !DILocation(line: 421, column: 111, scope: !1117)
!1133 = !DILocation(line: 421, column: 116, scope: !1117)
!1134 = distinct !DISubprogram(name: "num_blocks", linkageName: "_ZL10num_blocksii", scope: !5, file: !5, line: 14, type: !1135, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1135 = !DISubroutineType(types: !1136)
!1136 = !{!9, !110, !110}
!1137 = !DILocalVariable(name: "num", arg: 1, scope: !1134, file: !5, line: 14, type: !110)
!1138 = !DILocation(line: 14, column: 32, scope: !1134)
!1139 = !DILocalVariable(name: "factor", arg: 2, scope: !1134, file: !5, line: 14, type: !110)
!1140 = !DILocation(line: 14, column: 41, scope: !1134)
!1141 = !DILocation(line: 15, column: 11, scope: !1134)
!1142 = !DILocation(line: 15, column: 17, scope: !1134)
!1143 = !DILocation(line: 15, column: 15, scope: !1134)
!1144 = !DILocation(line: 15, column: 24, scope: !1134)
!1145 = !DILocation(line: 15, column: 31, scope: !1134)
!1146 = !DILocation(line: 15, column: 29, scope: !1134)
!1147 = !DILocation(line: 15, column: 3, scope: !1134)