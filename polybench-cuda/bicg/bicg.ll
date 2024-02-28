; ModuleID = 'bicg.cu'
source_filename = "bicg.cu"
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
define dso_local void @_Z8kernel_qiiPdS_S_S_S_(i32 %m, i32 %n, double* %A, double* %s, double* %q, double* %p, double* %r) #0 !dbg !692 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %s.addr = alloca double*, align 8
  %q.addr = alloca double*, align 8
  %p.addr = alloca double*, align 8
  %r.addr = alloca double*, align 8
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !696, metadata !DIExpression()), !dbg !697
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !698, metadata !DIExpression()), !dbg !699
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !700, metadata !DIExpression()), !dbg !701
  store double* %s, double** %s.addr, align 8
  call void @llvm.dbg.declare(metadata double** %s.addr, metadata !702, metadata !DIExpression()), !dbg !703
  store double* %q, double** %q.addr, align 8
  call void @llvm.dbg.declare(metadata double** %q.addr, metadata !704, metadata !DIExpression()), !dbg !705
  store double* %p, double** %p.addr, align 8
  call void @llvm.dbg.declare(metadata double** %p.addr, metadata !706, metadata !DIExpression()), !dbg !707
  store double* %r, double** %r.addr, align 8
  call void @llvm.dbg.declare(metadata double** %r.addr, metadata !708, metadata !DIExpression()), !dbg !709
  %0 = bitcast i32* %m.addr to i8*, !dbg !710
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !710
  %2 = icmp eq i32 %1, 0, !dbg !710
  br i1 %2, label %setup.next, label %setup.end, !dbg !710

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %n.addr to i8*, !dbg !710
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !710
  %5 = icmp eq i32 %4, 0, !dbg !710
  br i1 %5, label %setup.next1, label %setup.end, !dbg !710

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast double** %A.addr to i8*, !dbg !710
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 8), !dbg !710
  %8 = icmp eq i32 %7, 0, !dbg !710
  br i1 %8, label %setup.next2, label %setup.end, !dbg !710

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %s.addr to i8*, !dbg !710
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 16), !dbg !710
  %11 = icmp eq i32 %10, 0, !dbg !710
  br i1 %11, label %setup.next3, label %setup.end, !dbg !710

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %q.addr to i8*, !dbg !710
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 24), !dbg !710
  %14 = icmp eq i32 %13, 0, !dbg !710
  br i1 %14, label %setup.next4, label %setup.end, !dbg !710

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %p.addr to i8*, !dbg !710
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 32), !dbg !710
  %17 = icmp eq i32 %16, 0, !dbg !710
  br i1 %17, label %setup.next5, label %setup.end, !dbg !710

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %r.addr to i8*, !dbg !710
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 40), !dbg !710
  %20 = icmp eq i32 %19, 0, !dbg !710
  br i1 %20, label %setup.next6, label %setup.end, !dbg !710

setup.next6:                                      ; preds = %setup.next5
  %21 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, double*, double*, double*, double*, double*)* @_Z8kernel_qiiPdS_S_S_S_ to i8*)), !dbg !710
  br label %setup.end, !dbg !710

setup.end:                                        ; preds = %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !711
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline uwtable
define dso_local void @_Z8kernel_siiPdS_S_S_S_(i32 %m, i32 %n, double* %A, double* %s, double* %q, double* %p, double* %r) #0 !dbg !712 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %s.addr = alloca double*, align 8
  %q.addr = alloca double*, align 8
  %p.addr = alloca double*, align 8
  %r.addr = alloca double*, align 8
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !713, metadata !DIExpression()), !dbg !714
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !715, metadata !DIExpression()), !dbg !716
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !717, metadata !DIExpression()), !dbg !718
  store double* %s, double** %s.addr, align 8
  call void @llvm.dbg.declare(metadata double** %s.addr, metadata !719, metadata !DIExpression()), !dbg !720
  store double* %q, double** %q.addr, align 8
  call void @llvm.dbg.declare(metadata double** %q.addr, metadata !721, metadata !DIExpression()), !dbg !722
  store double* %p, double** %p.addr, align 8
  call void @llvm.dbg.declare(metadata double** %p.addr, metadata !723, metadata !DIExpression()), !dbg !724
  store double* %r, double** %r.addr, align 8
  call void @llvm.dbg.declare(metadata double** %r.addr, metadata !725, metadata !DIExpression()), !dbg !726
  %0 = bitcast i32* %m.addr to i8*, !dbg !727
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !727
  %2 = icmp eq i32 %1, 0, !dbg !727
  br i1 %2, label %setup.next, label %setup.end, !dbg !727

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %n.addr to i8*, !dbg !727
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !727
  %5 = icmp eq i32 %4, 0, !dbg !727
  br i1 %5, label %setup.next1, label %setup.end, !dbg !727

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast double** %A.addr to i8*, !dbg !727
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 8), !dbg !727
  %8 = icmp eq i32 %7, 0, !dbg !727
  br i1 %8, label %setup.next2, label %setup.end, !dbg !727

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast double** %s.addr to i8*, !dbg !727
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 16), !dbg !727
  %11 = icmp eq i32 %10, 0, !dbg !727
  br i1 %11, label %setup.next3, label %setup.end, !dbg !727

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %q.addr to i8*, !dbg !727
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 24), !dbg !727
  %14 = icmp eq i32 %13, 0, !dbg !727
  br i1 %14, label %setup.next4, label %setup.end, !dbg !727

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast double** %p.addr to i8*, !dbg !727
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 32), !dbg !727
  %17 = icmp eq i32 %16, 0, !dbg !727
  br i1 %17, label %setup.next5, label %setup.end, !dbg !727

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast double** %r.addr to i8*, !dbg !727
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 40), !dbg !727
  %20 = icmp eq i32 %19, 0, !dbg !727
  br i1 %20, label %setup.next6, label %setup.end, !dbg !727

setup.next6:                                      ; preds = %setup.next5
  %21 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, double*, double*, double*, double*, double*)* @_Z8kernel_siiPdS_S_S_S_ to i8*)), !dbg !727
  br label %setup.end, !dbg !727

setup.end:                                        ; preds = %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !728
}

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #2 !dbg !729 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %nx = alloca i32, align 4
  %ny = alloca i32, align 4
  %dump_code = alloca i32, align 4
  %A = alloca double*, align 8
  %s = alloca double*, align 8
  %q = alloca double*, align 8
  %p = alloca double*, align 8
  %r = alloca double*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !732, metadata !DIExpression()), !dbg !733
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !734, metadata !DIExpression()), !dbg !735
  call void @llvm.dbg.declare(metadata i32* %nx, metadata !736, metadata !DIExpression()), !dbg !737
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !738
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !738
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !738
  %call = call i32 @atoi(i8* %1) #8, !dbg !739
  store i32 %call, i32* %nx, align 4, !dbg !737
  call void @llvm.dbg.declare(metadata i32* %ny, metadata !740, metadata !DIExpression()), !dbg !741
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !742
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 3, !dbg !742
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !742
  %call2 = call i32 @atoi(i8* %3) #8, !dbg !743
  store i32 %call2, i32* %ny, align 4, !dbg !741
  call void @llvm.dbg.declare(metadata i32* %dump_code, metadata !744, metadata !DIExpression()), !dbg !745
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !746
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i64 1, !dbg !746
  %5 = load i8*, i8** %arrayidx3, align 8, !dbg !746
  %call4 = call i32 @atoi(i8* %5) #8, !dbg !747
  store i32 %call4, i32* %dump_code, align 4, !dbg !745
  call void @llvm.dbg.declare(metadata double** %A, metadata !748, metadata !DIExpression()), !dbg !749
  %6 = load i32, i32* %nx, align 4, !dbg !750
  %7 = load i32, i32* %ny, align 4, !dbg !751
  %mul = mul nsw i32 %6, %7, !dbg !752
  %conv = sext i32 %mul to i64, !dbg !750
  %mul5 = mul i64 %conv, 8, !dbg !753
  %call6 = call noalias i8* @malloc(i64 %mul5) #9, !dbg !754
  %8 = bitcast i8* %call6 to double*, !dbg !755
  store double* %8, double** %A, align 8, !dbg !749
  call void @llvm.dbg.declare(metadata double** %s, metadata !756, metadata !DIExpression()), !dbg !757
  %9 = load i32, i32* %ny, align 4, !dbg !758
  %conv7 = sext i32 %9 to i64, !dbg !758
  %mul8 = mul i64 %conv7, 8, !dbg !759
  %call9 = call noalias i8* @malloc(i64 %mul8) #9, !dbg !760
  %10 = bitcast i8* %call9 to double*, !dbg !761
  store double* %10, double** %s, align 8, !dbg !757
  call void @llvm.dbg.declare(metadata double** %q, metadata !762, metadata !DIExpression()), !dbg !763
  %11 = load i32, i32* %nx, align 4, !dbg !764
  %conv10 = sext i32 %11 to i64, !dbg !764
  %mul11 = mul i64 %conv10, 8, !dbg !765
  %call12 = call noalias i8* @malloc(i64 %mul11) #9, !dbg !766
  %12 = bitcast i8* %call12 to double*, !dbg !767
  store double* %12, double** %q, align 8, !dbg !763
  call void @llvm.dbg.declare(metadata double** %p, metadata !768, metadata !DIExpression()), !dbg !769
  %13 = load i32, i32* %ny, align 4, !dbg !770
  %conv13 = sext i32 %13 to i64, !dbg !770
  %mul14 = mul i64 %conv13, 8, !dbg !771
  %call15 = call noalias i8* @malloc(i64 %mul14) #9, !dbg !772
  %14 = bitcast i8* %call15 to double*, !dbg !773
  store double* %14, double** %p, align 8, !dbg !769
  call void @llvm.dbg.declare(metadata double** %r, metadata !774, metadata !DIExpression()), !dbg !775
  %15 = load i32, i32* %nx, align 4, !dbg !776
  %conv16 = sext i32 %15 to i64, !dbg !776
  %mul17 = mul i64 %conv16, 8, !dbg !777
  %call18 = call noalias i8* @malloc(i64 %mul17) #9, !dbg !778
  %16 = bitcast i8* %call18 to double*, !dbg !779
  store double* %16, double** %r, align 8, !dbg !775
  %17 = load i32, i32* %nx, align 4, !dbg !780
  %18 = load i32, i32* %ny, align 4, !dbg !781
  %19 = load double*, double** %A, align 8, !dbg !782
  %20 = load double*, double** %r, align 8, !dbg !783
  %21 = load double*, double** %p, align 8, !dbg !784
  call void @_ZL10init_arrayiiPdS_S_(i32 %17, i32 %18, double* %19, double* %20, double* %21), !dbg !785
  %22 = load i32, i32* %nx, align 4, !dbg !786
  %23 = load i32, i32* %ny, align 4, !dbg !787
  %24 = load double*, double** %A, align 8, !dbg !788
  %25 = load double*, double** %s, align 8, !dbg !789
  %26 = load double*, double** %q, align 8, !dbg !790
  %27 = load double*, double** %p, align 8, !dbg !791
  %28 = load double*, double** %r, align 8, !dbg !792
  call void @_ZL6kerneliiPdS_S_S_S_(i32 %22, i32 %23, double* %24, double* %25, double* %26, double* %27, double* %28), !dbg !793
  %29 = load i32, i32* %dump_code, align 4, !dbg !794
  %cmp = icmp eq i32 %29, 1, !dbg !796
  br i1 %cmp, label %if.then, label %if.end, !dbg !797

if.then:                                          ; preds = %entry
  %30 = load i32, i32* %nx, align 4, !dbg !798
  %31 = load i32, i32* %ny, align 4, !dbg !799
  %32 = load double*, double** %s, align 8, !dbg !800
  %33 = load double*, double** %q, align 8, !dbg !801
  call void @_ZL11print_arrayiiPdS_(i32 %30, i32 %31, double* %32, double* %33), !dbg !802
  br label %if.end, !dbg !802

if.end:                                           ; preds = %if.then, %entry
  %34 = load double*, double** %A, align 8, !dbg !803
  %35 = bitcast double* %34 to i8*, !dbg !803
  call void @free(i8* %35) #9, !dbg !804
  %36 = load double*, double** %s, align 8, !dbg !805
  %37 = bitcast double* %36 to i8*, !dbg !805
  call void @free(i8* %37) #9, !dbg !806
  %38 = load double*, double** %q, align 8, !dbg !807
  %39 = bitcast double* %38 to i8*, !dbg !807
  call void @free(i8* %39) #9, !dbg !808
  %40 = load double*, double** %p, align 8, !dbg !809
  %41 = bitcast double* %40 to i8*, !dbg !809
  call void @free(i8* %41) #9, !dbg !810
  %42 = load double*, double** %r, align 8, !dbg !811
  %43 = bitcast double* %42 to i8*, !dbg !811
  call void @free(i8* %43) #9, !dbg !812
  ret i32 0, !dbg !813
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: noinline nounwind uwtable
define internal void @_ZL10init_arrayiiPdS_S_(i32 %nx, i32 %ny, double* %A, double* %r, double* %p) #5 !dbg !814 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %r.addr = alloca double*, align 8
  %p.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !817, metadata !DIExpression()), !dbg !818
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !819, metadata !DIExpression()), !dbg !820
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !821, metadata !DIExpression()), !dbg !822
  store double* %r, double** %r.addr, align 8
  call void @llvm.dbg.declare(metadata double** %r.addr, metadata !823, metadata !DIExpression()), !dbg !824
  store double* %p, double** %p.addr, align 8
  call void @llvm.dbg.declare(metadata double** %p.addr, metadata !825, metadata !DIExpression()), !dbg !826
  call void @llvm.dbg.declare(metadata i32* %i, metadata !827, metadata !DIExpression()), !dbg !828
  call void @llvm.dbg.declare(metadata i32* %j, metadata !829, metadata !DIExpression()), !dbg !830
  store i32 0, i32* %i, align 4, !dbg !831
  br label %for.cond, !dbg !833

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !834
  %1 = load i32, i32* %ny.addr, align 4, !dbg !836
  %cmp = icmp slt i32 %0, %1, !dbg !837
  br i1 %cmp, label %for.body, label %for.end, !dbg !838

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !839
  %conv = sitofp i32 %2 to double, !dbg !839
  %mul = fmul contract double %conv, 0x400921FB54442D18, !dbg !840
  %3 = load double*, double** %p.addr, align 8, !dbg !841
  %4 = load i32, i32* %i, align 4, !dbg !842
  %idxprom = sext i32 %4 to i64, !dbg !841
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom, !dbg !841
  store double %mul, double* %arrayidx, align 8, !dbg !843
  br label %for.inc, !dbg !841

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !844
  %inc = add nsw i32 %5, 1, !dbg !844
  store i32 %inc, i32* %i, align 4, !dbg !844
  br label %for.cond, !dbg !845, !llvm.loop !846

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !848
  br label %for.cond1, !dbg !850

for.cond1:                                        ; preds = %for.inc22, %for.end
  %6 = load i32, i32* %i, align 4, !dbg !851
  %7 = load i32, i32* %nx.addr, align 4, !dbg !853
  %cmp2 = icmp slt i32 %6, %7, !dbg !854
  br i1 %cmp2, label %for.body3, label %for.end24, !dbg !855

for.body3:                                        ; preds = %for.cond1
  %8 = load i32, i32* %i, align 4, !dbg !856
  %conv4 = sitofp i32 %8 to double, !dbg !856
  %mul5 = fmul contract double %conv4, 0x400921FB54442D18, !dbg !858
  %9 = load double*, double** %r.addr, align 8, !dbg !859
  %10 = load i32, i32* %i, align 4, !dbg !860
  %idxprom6 = sext i32 %10 to i64, !dbg !859
  %arrayidx7 = getelementptr inbounds double, double* %9, i64 %idxprom6, !dbg !859
  store double %mul5, double* %arrayidx7, align 8, !dbg !861
  store i32 0, i32* %j, align 4, !dbg !862
  br label %for.cond8, !dbg !864

for.cond8:                                        ; preds = %for.inc19, %for.body3
  %11 = load i32, i32* %j, align 4, !dbg !865
  %12 = load i32, i32* %ny.addr, align 4, !dbg !867
  %cmp9 = icmp slt i32 %11, %12, !dbg !868
  br i1 %cmp9, label %for.body10, label %for.end21, !dbg !869

for.body10:                                       ; preds = %for.cond8
  %13 = load i32, i32* %i, align 4, !dbg !870
  %conv11 = sitofp i32 %13 to double, !dbg !870
  %14 = load i32, i32* %j, align 4, !dbg !871
  %add = add nsw i32 %14, 1, !dbg !872
  %conv12 = sitofp i32 %add to double, !dbg !873
  %mul13 = fmul contract double %conv11, %conv12, !dbg !874
  %15 = load i32, i32* %nx.addr, align 4, !dbg !875
  %conv14 = sitofp i32 %15 to double, !dbg !875
  %div = fdiv double %mul13, %conv14, !dbg !876
  %16 = load double*, double** %A.addr, align 8, !dbg !877
  %17 = load i32, i32* %i, align 4, !dbg !878
  %18 = load i32, i32* %ny.addr, align 4, !dbg !879
  %mul15 = mul nsw i32 %17, %18, !dbg !880
  %19 = load i32, i32* %j, align 4, !dbg !881
  %add16 = add nsw i32 %mul15, %19, !dbg !882
  %idxprom17 = sext i32 %add16 to i64, !dbg !877
  %arrayidx18 = getelementptr inbounds double, double* %16, i64 %idxprom17, !dbg !877
  store double %div, double* %arrayidx18, align 8, !dbg !883
  br label %for.inc19, !dbg !877

for.inc19:                                        ; preds = %for.body10
  %20 = load i32, i32* %j, align 4, !dbg !884
  %inc20 = add nsw i32 %20, 1, !dbg !884
  store i32 %inc20, i32* %j, align 4, !dbg !884
  br label %for.cond8, !dbg !885, !llvm.loop !886

for.end21:                                        ; preds = %for.cond8
  br label %for.inc22, !dbg !888

for.inc22:                                        ; preds = %for.end21
  %21 = load i32, i32* %i, align 4, !dbg !889
  %inc23 = add nsw i32 %21, 1, !dbg !889
  store i32 %inc23, i32* %i, align 4, !dbg !889
  br label %for.cond1, !dbg !890, !llvm.loop !891

for.end24:                                        ; preds = %for.cond1
  ret void, !dbg !893
}

; Function Attrs: noinline uwtable
define internal void @_ZL6kerneliiPdS_S_S_S_(i32 %m, i32 %n, double* %A, double* %s, double* %q, double* %p, double* %r) #0 !dbg !894 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %s.addr = alloca double*, align 8
  %q.addr = alloca double*, align 8
  %p.addr = alloca double*, align 8
  %r.addr = alloca double*, align 8
  %dev_A = alloca double*, align 8
  %dev_s = alloca double*, align 8
  %dev_q = alloca double*, align 8
  %dev_p = alloca double*, align 8
  %dev_r = alloca double*, align 8
  %threadsPerBlock = alloca i32, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp31 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp31.coerce = alloca { i64, i32 }, align 4
  %agg.tmp33 = alloca %struct.dim3, align 4
  %agg.tmp35 = alloca %struct.dim3, align 4
  %agg.tmp33.coerce = alloca { i64, i32 }, align 4
  %agg.tmp35.coerce = alloca { i64, i32 }, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !895, metadata !DIExpression()), !dbg !896
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !897, metadata !DIExpression()), !dbg !898
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !899, metadata !DIExpression()), !dbg !900
  store double* %s, double** %s.addr, align 8
  call void @llvm.dbg.declare(metadata double** %s.addr, metadata !901, metadata !DIExpression()), !dbg !902
  store double* %q, double** %q.addr, align 8
  call void @llvm.dbg.declare(metadata double** %q.addr, metadata !903, metadata !DIExpression()), !dbg !904
  store double* %p, double** %p.addr, align 8
  call void @llvm.dbg.declare(metadata double** %p.addr, metadata !905, metadata !DIExpression()), !dbg !906
  store double* %r, double** %r.addr, align 8
  call void @llvm.dbg.declare(metadata double** %r.addr, metadata !907, metadata !DIExpression()), !dbg !908
  call void @llvm.dbg.declare(metadata double** %dev_A, metadata !909, metadata !DIExpression()), !dbg !910
  call void @llvm.dbg.declare(metadata double** %dev_s, metadata !911, metadata !DIExpression()), !dbg !912
  call void @llvm.dbg.declare(metadata double** %dev_q, metadata !913, metadata !DIExpression()), !dbg !914
  call void @llvm.dbg.declare(metadata double** %dev_p, metadata !915, metadata !DIExpression()), !dbg !916
  call void @llvm.dbg.declare(metadata double** %dev_r, metadata !917, metadata !DIExpression()), !dbg !918
  %0 = load i32, i32* %m.addr, align 4, !dbg !919
  %1 = load i32, i32* %n.addr, align 4, !dbg !920
  %mul = mul nsw i32 %0, %1, !dbg !921
  %conv = sext i32 %mul to i64, !dbg !919
  %mul1 = mul i64 %conv, 8, !dbg !922
  %call = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_A, i64 %mul1), !dbg !923
  %2 = load i32, i32* %n.addr, align 4, !dbg !924
  %conv2 = sext i32 %2 to i64, !dbg !924
  %mul3 = mul i64 %conv2, 8, !dbg !925
  %call4 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_s, i64 %mul3), !dbg !926
  %3 = load i32, i32* %m.addr, align 4, !dbg !927
  %conv5 = sext i32 %3 to i64, !dbg !927
  %mul6 = mul i64 %conv5, 8, !dbg !928
  %call7 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_q, i64 %mul6), !dbg !929
  %4 = load i32, i32* %n.addr, align 4, !dbg !930
  %conv8 = sext i32 %4 to i64, !dbg !930
  %mul9 = mul i64 %conv8, 8, !dbg !931
  %call10 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_p, i64 %mul9), !dbg !932
  %5 = load i32, i32* %m.addr, align 4, !dbg !933
  %conv11 = sext i32 %5 to i64, !dbg !933
  %mul12 = mul i64 %conv11, 8, !dbg !934
  %call13 = call i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %dev_r, i64 %mul12), !dbg !935
  %6 = load double*, double** %dev_A, align 8, !dbg !936
  %7 = bitcast double* %6 to i8*, !dbg !936
  %8 = load double*, double** %A.addr, align 8, !dbg !937
  %9 = bitcast double* %8 to i8*, !dbg !937
  %10 = load i32, i32* %m.addr, align 4, !dbg !938
  %11 = load i32, i32* %n.addr, align 4, !dbg !939
  %mul14 = mul nsw i32 %10, %11, !dbg !940
  %conv15 = sext i32 %mul14 to i64, !dbg !938
  %mul16 = mul i64 %conv15, 8, !dbg !941
  %call17 = call i32 @cudaMemcpy(i8* %7, i8* %9, i64 %mul16, i32 1), !dbg !942
  %12 = load double*, double** %dev_s, align 8, !dbg !943
  %13 = bitcast double* %12 to i8*, !dbg !943
  %14 = load double*, double** %s.addr, align 8, !dbg !944
  %15 = bitcast double* %14 to i8*, !dbg !944
  %16 = load i32, i32* %n.addr, align 4, !dbg !945
  %conv18 = sext i32 %16 to i64, !dbg !945
  %mul19 = mul i64 %conv18, 8, !dbg !946
  %call20 = call i32 @cudaMemcpy(i8* %13, i8* %15, i64 %mul19, i32 1), !dbg !947
  %17 = load double*, double** %dev_q, align 8, !dbg !948
  %18 = bitcast double* %17 to i8*, !dbg !948
  %19 = load double*, double** %q.addr, align 8, !dbg !949
  %20 = bitcast double* %19 to i8*, !dbg !949
  %21 = load i32, i32* %m.addr, align 4, !dbg !950
  %conv21 = sext i32 %21 to i64, !dbg !950
  %mul22 = mul i64 %conv21, 8, !dbg !951
  %call23 = call i32 @cudaMemcpy(i8* %18, i8* %20, i64 %mul22, i32 1), !dbg !952
  %22 = load double*, double** %dev_p, align 8, !dbg !953
  %23 = bitcast double* %22 to i8*, !dbg !953
  %24 = load double*, double** %p.addr, align 8, !dbg !954
  %25 = bitcast double* %24 to i8*, !dbg !954
  %26 = load i32, i32* %n.addr, align 4, !dbg !955
  %conv24 = sext i32 %26 to i64, !dbg !955
  %mul25 = mul i64 %conv24, 8, !dbg !956
  %call26 = call i32 @cudaMemcpy(i8* %23, i8* %25, i64 %mul25, i32 1), !dbg !957
  %27 = load double*, double** %dev_r, align 8, !dbg !958
  %28 = bitcast double* %27 to i8*, !dbg !958
  %29 = load double*, double** %r.addr, align 8, !dbg !959
  %30 = bitcast double* %29 to i8*, !dbg !959
  %31 = load i32, i32* %m.addr, align 4, !dbg !960
  %conv27 = sext i32 %31 to i64, !dbg !960
  %mul28 = mul i64 %conv27, 8, !dbg !961
  %call29 = call i32 @cudaMemcpy(i8* %28, i8* %30, i64 %mul28, i32 1), !dbg !962
  call void @llvm.dbg.declare(metadata i32* %threadsPerBlock, metadata !963, metadata !DIExpression()), !dbg !965
  store i32 256, i32* %threadsPerBlock, align 4, !dbg !965
  %32 = load i32, i32* %n.addr, align 4, !dbg !966
  %call30 = call i32 @_ZL10num_blocksii(i32 %32, i32 256), !dbg !967
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 %call30, i32 1, i32 1), !dbg !967
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp31, i32 256, i32 1, i32 1), !dbg !968
  %33 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !969
  %34 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !969
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %33, i8* align 4 %34, i64 12, i1 false), !dbg !969
  %35 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !969
  %36 = load i64, i64* %35, align 4, !dbg !969
  %37 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !969
  %38 = load i32, i32* %37, align 4, !dbg !969
  %39 = bitcast { i64, i32 }* %agg.tmp31.coerce to i8*, !dbg !969
  %40 = bitcast %struct.dim3* %agg.tmp31 to i8*, !dbg !969
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %39, i8* align 4 %40, i64 12, i1 false), !dbg !969
  %41 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp31.coerce, i32 0, i32 0, !dbg !969
  %42 = load i64, i64* %41, align 4, !dbg !969
  %43 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp31.coerce, i32 0, i32 1, !dbg !969
  %44 = load i32, i32* %43, align 4, !dbg !969
  %call32 = call i32 @cudaConfigureCall(i64 %36, i32 %38, i64 %42, i32 %44, i64 0, %struct.CUstream_st* null), !dbg !969
  %tobool = icmp ne i32 %call32, 0, !dbg !969
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !970

kcall.configok:                                   ; preds = %entry
  %45 = load i32, i32* %m.addr, align 4, !dbg !971
  %46 = load i32, i32* %n.addr, align 4, !dbg !972
  %47 = load double*, double** %dev_A, align 8, !dbg !973
  %48 = load double*, double** %dev_s, align 8, !dbg !974
  %49 = load double*, double** %dev_q, align 8, !dbg !975
  %50 = load double*, double** %dev_p, align 8, !dbg !976
  %51 = load double*, double** %dev_r, align 8, !dbg !977
  call void @_Z8kernel_qiiPdS_S_S_S_(i32 %45, i32 %46, double* %47, double* %48, double* %49, double* %50, double* %51), !dbg !970
  br label %kcall.end, !dbg !970

kcall.end:                                        ; preds = %kcall.configok, %entry
  %52 = load i32, i32* %m.addr, align 4, !dbg !978
  %call34 = call i32 @_ZL10num_blocksii(i32 %52, i32 256), !dbg !979
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp33, i32 %call34, i32 1, i32 1), !dbg !979
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp35, i32 256, i32 1, i32 1), !dbg !980
  %53 = bitcast { i64, i32 }* %agg.tmp33.coerce to i8*, !dbg !981
  %54 = bitcast %struct.dim3* %agg.tmp33 to i8*, !dbg !981
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %53, i8* align 4 %54, i64 12, i1 false), !dbg !981
  %55 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp33.coerce, i32 0, i32 0, !dbg !981
  %56 = load i64, i64* %55, align 4, !dbg !981
  %57 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp33.coerce, i32 0, i32 1, !dbg !981
  %58 = load i32, i32* %57, align 4, !dbg !981
  %59 = bitcast { i64, i32 }* %agg.tmp35.coerce to i8*, !dbg !981
  %60 = bitcast %struct.dim3* %agg.tmp35 to i8*, !dbg !981
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %59, i8* align 4 %60, i64 12, i1 false), !dbg !981
  %61 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp35.coerce, i32 0, i32 0, !dbg !981
  %62 = load i64, i64* %61, align 4, !dbg !981
  %63 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp35.coerce, i32 0, i32 1, !dbg !981
  %64 = load i32, i32* %63, align 4, !dbg !981
  %call36 = call i32 @cudaConfigureCall(i64 %56, i32 %58, i64 %62, i32 %64, i64 0, %struct.CUstream_st* null), !dbg !981
  %tobool37 = icmp ne i32 %call36, 0, !dbg !981
  br i1 %tobool37, label %kcall.end39, label %kcall.configok38, !dbg !982

kcall.configok38:                                 ; preds = %kcall.end
  %65 = load i32, i32* %m.addr, align 4, !dbg !983
  %66 = load i32, i32* %n.addr, align 4, !dbg !984
  %67 = load double*, double** %dev_A, align 8, !dbg !985
  %68 = load double*, double** %dev_s, align 8, !dbg !986
  %69 = load double*, double** %dev_q, align 8, !dbg !987
  %70 = load double*, double** %dev_p, align 8, !dbg !988
  %71 = load double*, double** %dev_r, align 8, !dbg !989
  call void @_Z8kernel_siiPdS_S_S_S_(i32 %65, i32 %66, double* %67, double* %68, double* %69, double* %70, double* %71), !dbg !982
  br label %kcall.end39, !dbg !982

kcall.end39:                                      ; preds = %kcall.configok38, %kcall.end
  %72 = load double*, double** %s.addr, align 8, !dbg !990
  %73 = bitcast double* %72 to i8*, !dbg !990
  %74 = load double*, double** %dev_s, align 8, !dbg !991
  %75 = bitcast double* %74 to i8*, !dbg !991
  %76 = load i32, i32* %n.addr, align 4, !dbg !992
  %conv40 = sext i32 %76 to i64, !dbg !992
  %mul41 = mul i64 %conv40, 8, !dbg !993
  %call42 = call i32 @cudaMemcpy(i8* %73, i8* %75, i64 %mul41, i32 2), !dbg !994
  %77 = load double*, double** %q.addr, align 8, !dbg !995
  %78 = bitcast double* %77 to i8*, !dbg !995
  %79 = load double*, double** %dev_q, align 8, !dbg !996
  %80 = bitcast double* %79 to i8*, !dbg !996
  %81 = load i32, i32* %m.addr, align 4, !dbg !997
  %conv43 = sext i32 %81 to i64, !dbg !997
  %mul44 = mul i64 %conv43, 8, !dbg !998
  %call45 = call i32 @cudaMemcpy(i8* %78, i8* %80, i64 %mul44, i32 2), !dbg !999
  %82 = load double*, double** %dev_A, align 8, !dbg !1000
  %83 = bitcast double* %82 to i8*, !dbg !1000
  %call46 = call i32 @cudaFree(i8* %83), !dbg !1001
  %84 = load double*, double** %dev_s, align 8, !dbg !1002
  %85 = bitcast double* %84 to i8*, !dbg !1002
  %call47 = call i32 @cudaFree(i8* %85), !dbg !1003
  %86 = load double*, double** %dev_q, align 8, !dbg !1004
  %87 = bitcast double* %86 to i8*, !dbg !1004
  %call48 = call i32 @cudaFree(i8* %87), !dbg !1005
  %88 = load double*, double** %dev_p, align 8, !dbg !1006
  %89 = bitcast double* %88 to i8*, !dbg !1006
  %call49 = call i32 @cudaFree(i8* %89), !dbg !1007
  %90 = load double*, double** %dev_r, align 8, !dbg !1008
  %91 = bitcast double* %90 to i8*, !dbg !1008
  %call50 = call i32 @cudaFree(i8* %91), !dbg !1009
  ret void, !dbg !1010
}

; Function Attrs: noinline uwtable
define internal void @_ZL11print_arrayiiPdS_(i32 %nx, i32 %ny, double* %s, double* %q) #0 !dbg !1011 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %s.addr = alloca double*, align 8
  %q.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !1014, metadata !DIExpression()), !dbg !1015
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !1016, metadata !DIExpression()), !dbg !1017
  store double* %s, double** %s.addr, align 8
  call void @llvm.dbg.declare(metadata double** %s.addr, metadata !1018, metadata !DIExpression()), !dbg !1019
  store double* %q, double** %q.addr, align 8
  call void @llvm.dbg.declare(metadata double** %q.addr, metadata !1020, metadata !DIExpression()), !dbg !1021
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1022, metadata !DIExpression()), !dbg !1023
  store i32 0, i32* %i, align 4, !dbg !1024
  br label %for.cond, !dbg !1026

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1027
  %1 = load i32, i32* %ny.addr, align 4, !dbg !1029
  %cmp = icmp slt i32 %0, %1, !dbg !1030
  br i1 %cmp, label %for.body, label %for.end, !dbg !1031

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1032
  %3 = load double*, double** %s.addr, align 8, !dbg !1034
  %4 = load i32, i32* %i, align 4, !dbg !1035
  %idxprom = sext i32 %4 to i64, !dbg !1034
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom, !dbg !1034
  %5 = load double, double* %arrayidx, align 8, !dbg !1034
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %5), !dbg !1036
  %6 = load i32, i32* %i, align 4, !dbg !1037
  %rem = srem i32 %6, 20, !dbg !1039
  %cmp1 = icmp eq i32 %rem, 0, !dbg !1040
  br i1 %cmp1, label %if.then, label %if.end, !dbg !1041

if.then:                                          ; preds = %for.body
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1042
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1043
  br label %if.end, !dbg !1043

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !1044

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %i, align 4, !dbg !1045
  %inc = add nsw i32 %8, 1, !dbg !1045
  store i32 %inc, i32* %i, align 4, !dbg !1045
  br label %for.cond, !dbg !1046, !llvm.loop !1047

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !1049
  br label %for.cond3, !dbg !1051

for.cond3:                                        ; preds = %for.inc14, %for.end
  %9 = load i32, i32* %i, align 4, !dbg !1052
  %10 = load i32, i32* %nx.addr, align 4, !dbg !1054
  %cmp4 = icmp slt i32 %9, %10, !dbg !1055
  br i1 %cmp4, label %for.body5, label %for.end16, !dbg !1056

for.body5:                                        ; preds = %for.cond3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1057
  %12 = load double*, double** %q.addr, align 8, !dbg !1059
  %13 = load i32, i32* %i, align 4, !dbg !1060
  %idxprom6 = sext i32 %13 to i64, !dbg !1059
  %arrayidx7 = getelementptr inbounds double, double* %12, i64 %idxprom6, !dbg !1059
  %14 = load double, double* %arrayidx7, align 8, !dbg !1059
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %14), !dbg !1061
  %15 = load i32, i32* %i, align 4, !dbg !1062
  %rem9 = srem i32 %15, 20, !dbg !1064
  %cmp10 = icmp eq i32 %rem9, 0, !dbg !1065
  br i1 %cmp10, label %if.then11, label %if.end13, !dbg !1066

if.then11:                                        ; preds = %for.body5
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1067
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1068
  br label %if.end13, !dbg !1068

if.end13:                                         ; preds = %if.then11, %for.body5
  br label %for.inc14, !dbg !1069

for.inc14:                                        ; preds = %if.end13
  %17 = load i32, i32* %i, align 4, !dbg !1070
  %inc15 = add nsw i32 %17, 1, !dbg !1070
  store i32 %inc15, i32* %i, align 4, !dbg !1070
  br label %for.cond3, !dbg !1071, !llvm.loop !1072

for.end16:                                        ; preds = %for.cond3
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1074
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !1075
  ret void, !dbg !1076
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline uwtable
define internal i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(double** %devPtr, i64 %size) #0 !dbg !1077 {
entry:
  %devPtr.addr = alloca double**, align 8
  %size.addr = alloca i64, align 8
  store double** %devPtr, double*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %devPtr.addr, metadata !1085, metadata !DIExpression()), !dbg !1086
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !1087, metadata !DIExpression()), !dbg !1088
  %0 = load double**, double*** %devPtr.addr, align 8, !dbg !1089
  %1 = bitcast double** %0 to i8*, !dbg !1089
  %2 = bitcast i8* %1 to i8**, !dbg !1090
  %3 = load i64, i64* %size.addr, align 8, !dbg !1091
  %call = call i32 @cudaMalloc(i8** %2, i64 %3), !dbg !1092
  ret i32 %call, !dbg !1093
}

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #6

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @_ZL10num_blocksii(i32 %num, i32 %factor) #5 !dbg !1094 {
entry:
  %num.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1097, metadata !DIExpression()), !dbg !1098
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1099, metadata !DIExpression()), !dbg !1100
  %0 = load i32, i32* %num.addr, align 4, !dbg !1101
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1102
  %add = add nsw i32 %0, %1, !dbg !1103
  %sub = sub nsw i32 %add, 1, !dbg !1104
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1105
  %div = sdiv i32 %sub, %2, !dbg !1106
  ret i32 %div, !dbg !1107
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #5 comdat align 2 !dbg !1108 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1131, metadata !DIExpression()), !dbg !1133
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1134, metadata !DIExpression()), !dbg !1135
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1136, metadata !DIExpression()), !dbg !1137
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1138, metadata !DIExpression()), !dbg !1139
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1140
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1141
  store i32 %0, i32* %x, align 4, !dbg !1140
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1142
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1143
  store i32 %1, i32* %y, align 4, !dbg !1142
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1144
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1145
  store i32 %2, i32* %z, align 4, !dbg !1144
  ret void, !dbg !1146
}

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
!5 = !DIFile(filename: "bicg.cu", directory: "/u/NAS_SCRATCH/yc0769/xstack-benchmark/polybench-cuda/bicg")
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
!692 = distinct !DISubprogram(name: "kernel_q", linkageName: "_Z8kernel_qiiPdS_S_S_S_", scope: !5, file: !5, line: 23, type: !693, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !110, !110, !99, !99, !99, !99, !99}
!695 = !{}
!696 = !DILocalVariable(name: "m", arg: 1, scope: !692, file: !5, line: 23, type: !110)
!697 = !DILocation(line: 23, column: 30, scope: !692)
!698 = !DILocalVariable(name: "n", arg: 2, scope: !692, file: !5, line: 23, type: !110)
!699 = !DILocation(line: 23, column: 37, scope: !692)
!700 = !DILocalVariable(name: "A", arg: 3, scope: !692, file: !5, line: 23, type: !99)
!701 = !DILocation(line: 23, column: 48, scope: !692)
!702 = !DILocalVariable(name: "s", arg: 4, scope: !692, file: !5, line: 23, type: !99)
!703 = !DILocation(line: 23, column: 58, scope: !692)
!704 = !DILocalVariable(name: "q", arg: 5, scope: !692, file: !5, line: 23, type: !99)
!705 = !DILocation(line: 23, column: 70, scope: !692)
!706 = !DILocalVariable(name: "p", arg: 6, scope: !692, file: !5, line: 23, type: !99)
!707 = !DILocation(line: 23, column: 82, scope: !692)
!708 = !DILocalVariable(name: "r", arg: 7, scope: !692, file: !5, line: 23, type: !99)
!709 = !DILocation(line: 23, column: 94, scope: !692)
!710 = !DILocation(line: 23, column: 99, scope: !692)
!711 = !DILocation(line: 31, column: 1, scope: !692)
!712 = distinct !DISubprogram(name: "kernel_s", linkageName: "_Z8kernel_siiPdS_S_S_S_", scope: !5, file: !5, line: 34, type: !693, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!713 = !DILocalVariable(name: "m", arg: 1, scope: !712, file: !5, line: 34, type: !110)
!714 = !DILocation(line: 34, column: 30, scope: !712)
!715 = !DILocalVariable(name: "n", arg: 2, scope: !712, file: !5, line: 34, type: !110)
!716 = !DILocation(line: 34, column: 37, scope: !712)
!717 = !DILocalVariable(name: "A", arg: 3, scope: !712, file: !5, line: 34, type: !99)
!718 = !DILocation(line: 34, column: 48, scope: !712)
!719 = !DILocalVariable(name: "s", arg: 4, scope: !712, file: !5, line: 34, type: !99)
!720 = !DILocation(line: 34, column: 58, scope: !712)
!721 = !DILocalVariable(name: "q", arg: 5, scope: !712, file: !5, line: 34, type: !99)
!722 = !DILocation(line: 34, column: 70, scope: !712)
!723 = !DILocalVariable(name: "p", arg: 6, scope: !712, file: !5, line: 34, type: !99)
!724 = !DILocation(line: 34, column: 82, scope: !712)
!725 = !DILocalVariable(name: "r", arg: 7, scope: !712, file: !5, line: 34, type: !99)
!726 = !DILocation(line: 34, column: 94, scope: !712)
!727 = !DILocation(line: 34, column: 99, scope: !712)
!728 = !DILocation(line: 42, column: 1, scope: !712)
!729 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 114, type: !730, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, retainedNodes: !695)
!730 = !DISubroutineType(types: !731)
!731 = !{!110, !110, !466}
!732 = !DILocalVariable(name: "argc", arg: 1, scope: !729, file: !5, line: 114, type: !110)
!733 = !DILocation(line: 114, column: 14, scope: !729)
!734 = !DILocalVariable(name: "argv", arg: 2, scope: !729, file: !5, line: 114, type: !466)
!735 = !DILocation(line: 114, column: 27, scope: !729)
!736 = !DILocalVariable(name: "nx", scope: !729, file: !5, line: 117, type: !110)
!737 = !DILocation(line: 117, column: 7, scope: !729)
!738 = !DILocation(line: 117, column: 16, scope: !729)
!739 = !DILocation(line: 117, column: 11, scope: !729)
!740 = !DILocalVariable(name: "ny", scope: !729, file: !5, line: 118, type: !110)
!741 = !DILocation(line: 118, column: 7, scope: !729)
!742 = !DILocation(line: 118, column: 17, scope: !729)
!743 = !DILocation(line: 118, column: 12, scope: !729)
!744 = !DILocalVariable(name: "dump_code", scope: !729, file: !5, line: 119, type: !110)
!745 = !DILocation(line: 119, column: 7, scope: !729)
!746 = !DILocation(line: 119, column: 24, scope: !729)
!747 = !DILocation(line: 119, column: 19, scope: !729)
!748 = !DILocalVariable(name: "A", scope: !729, file: !5, line: 122, type: !99)
!749 = !DILocation(line: 122, column: 11, scope: !729)
!750 = !DILocation(line: 122, column: 31, scope: !729)
!751 = !DILocation(line: 122, column: 34, scope: !729)
!752 = !DILocation(line: 122, column: 33, scope: !729)
!753 = !DILocation(line: 122, column: 36, scope: !729)
!754 = !DILocation(line: 122, column: 24, scope: !729)
!755 = !DILocation(line: 122, column: 15, scope: !729)
!756 = !DILocalVariable(name: "s", scope: !729, file: !5, line: 123, type: !99)
!757 = !DILocation(line: 123, column: 11, scope: !729)
!758 = !DILocation(line: 123, column: 31, scope: !729)
!759 = !DILocation(line: 123, column: 33, scope: !729)
!760 = !DILocation(line: 123, column: 24, scope: !729)
!761 = !DILocation(line: 123, column: 15, scope: !729)
!762 = !DILocalVariable(name: "q", scope: !729, file: !5, line: 124, type: !99)
!763 = !DILocation(line: 124, column: 11, scope: !729)
!764 = !DILocation(line: 124, column: 31, scope: !729)
!765 = !DILocation(line: 124, column: 33, scope: !729)
!766 = !DILocation(line: 124, column: 24, scope: !729)
!767 = !DILocation(line: 124, column: 15, scope: !729)
!768 = !DILocalVariable(name: "p", scope: !729, file: !5, line: 125, type: !99)
!769 = !DILocation(line: 125, column: 11, scope: !729)
!770 = !DILocation(line: 125, column: 31, scope: !729)
!771 = !DILocation(line: 125, column: 33, scope: !729)
!772 = !DILocation(line: 125, column: 24, scope: !729)
!773 = !DILocation(line: 125, column: 15, scope: !729)
!774 = !DILocalVariable(name: "r", scope: !729, file: !5, line: 126, type: !99)
!775 = !DILocation(line: 126, column: 11, scope: !729)
!776 = !DILocation(line: 126, column: 31, scope: !729)
!777 = !DILocation(line: 126, column: 33, scope: !729)
!778 = !DILocation(line: 126, column: 24, scope: !729)
!779 = !DILocation(line: 126, column: 15, scope: !729)
!780 = !DILocation(line: 128, column: 15, scope: !729)
!781 = !DILocation(line: 128, column: 19, scope: !729)
!782 = !DILocation(line: 128, column: 23, scope: !729)
!783 = !DILocation(line: 128, column: 26, scope: !729)
!784 = !DILocation(line: 128, column: 29, scope: !729)
!785 = !DILocation(line: 128, column: 3, scope: !729)
!786 = !DILocation(line: 131, column: 10, scope: !729)
!787 = !DILocation(line: 131, column: 14, scope: !729)
!788 = !DILocation(line: 131, column: 18, scope: !729)
!789 = !DILocation(line: 131, column: 21, scope: !729)
!790 = !DILocation(line: 131, column: 24, scope: !729)
!791 = !DILocation(line: 131, column: 27, scope: !729)
!792 = !DILocation(line: 131, column: 30, scope: !729)
!793 = !DILocation(line: 131, column: 3, scope: !729)
!794 = !DILocation(line: 135, column: 6, scope: !795)
!795 = distinct !DILexicalBlock(scope: !729, file: !5, line: 135, column: 6)
!796 = !DILocation(line: 135, column: 16, scope: !795)
!797 = !DILocation(line: 135, column: 6, scope: !729)
!798 = !DILocation(line: 135, column: 34, scope: !795)
!799 = !DILocation(line: 135, column: 38, scope: !795)
!800 = !DILocation(line: 135, column: 42, scope: !795)
!801 = !DILocation(line: 135, column: 45, scope: !795)
!802 = !DILocation(line: 135, column: 22, scope: !795)
!803 = !DILocation(line: 138, column: 15, scope: !729)
!804 = !DILocation(line: 138, column: 3, scope: !729)
!805 = !DILocation(line: 139, column: 15, scope: !729)
!806 = !DILocation(line: 139, column: 3, scope: !729)
!807 = !DILocation(line: 140, column: 15, scope: !729)
!808 = !DILocation(line: 140, column: 3, scope: !729)
!809 = !DILocation(line: 141, column: 15, scope: !729)
!810 = !DILocation(line: 141, column: 3, scope: !729)
!811 = !DILocation(line: 142, column: 15, scope: !729)
!812 = !DILocation(line: 142, column: 3, scope: !729)
!813 = !DILocation(line: 145, column: 3, scope: !729)
!814 = distinct !DISubprogram(name: "init_array", linkageName: "_ZL10init_arrayiiPdS_S_", scope: !5, file: !5, line: 47, type: !815, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!815 = !DISubroutineType(types: !816)
!816 = !{null, !110, !110, !99, !99, !99}
!817 = !DILocalVariable(name: "nx", arg: 1, scope: !814, file: !5, line: 47, type: !110)
!818 = !DILocation(line: 47, column: 22, scope: !814)
!819 = !DILocalVariable(name: "ny", arg: 2, scope: !814, file: !5, line: 47, type: !110)
!820 = !DILocation(line: 47, column: 30, scope: !814)
!821 = !DILocalVariable(name: "A", arg: 3, scope: !814, file: !5, line: 48, type: !99)
!822 = !DILocation(line: 48, column: 12, scope: !814)
!823 = !DILocalVariable(name: "r", arg: 4, scope: !814, file: !5, line: 49, type: !99)
!824 = !DILocation(line: 49, column: 12, scope: !814)
!825 = !DILocalVariable(name: "p", arg: 5, scope: !814, file: !5, line: 50, type: !99)
!826 = !DILocation(line: 50, column: 12, scope: !814)
!827 = !DILocalVariable(name: "i", scope: !814, file: !5, line: 52, type: !110)
!828 = !DILocation(line: 52, column: 7, scope: !814)
!829 = !DILocalVariable(name: "j", scope: !814, file: !5, line: 52, type: !110)
!830 = !DILocation(line: 52, column: 10, scope: !814)
!831 = !DILocation(line: 54, column: 10, scope: !832)
!832 = distinct !DILexicalBlock(scope: !814, file: !5, line: 54, column: 3)
!833 = !DILocation(line: 54, column: 8, scope: !832)
!834 = !DILocation(line: 54, column: 15, scope: !835)
!835 = distinct !DILexicalBlock(scope: !832, file: !5, line: 54, column: 3)
!836 = !DILocation(line: 54, column: 19, scope: !835)
!837 = !DILocation(line: 54, column: 17, scope: !835)
!838 = !DILocation(line: 54, column: 3, scope: !832)
!839 = !DILocation(line: 55, column: 12, scope: !835)
!840 = !DILocation(line: 55, column: 14, scope: !835)
!841 = !DILocation(line: 55, column: 5, scope: !835)
!842 = !DILocation(line: 55, column: 7, scope: !835)
!843 = !DILocation(line: 55, column: 10, scope: !835)
!844 = !DILocation(line: 54, column: 24, scope: !835)
!845 = !DILocation(line: 54, column: 3, scope: !835)
!846 = distinct !{!846, !838, !847}
!847 = !DILocation(line: 55, column: 16, scope: !832)
!848 = !DILocation(line: 56, column: 10, scope: !849)
!849 = distinct !DILexicalBlock(scope: !814, file: !5, line: 56, column: 3)
!850 = !DILocation(line: 56, column: 8, scope: !849)
!851 = !DILocation(line: 56, column: 15, scope: !852)
!852 = distinct !DILexicalBlock(scope: !849, file: !5, line: 56, column: 3)
!853 = !DILocation(line: 56, column: 19, scope: !852)
!854 = !DILocation(line: 56, column: 17, scope: !852)
!855 = !DILocation(line: 56, column: 3, scope: !849)
!856 = !DILocation(line: 57, column: 12, scope: !857)
!857 = distinct !DILexicalBlock(scope: !852, file: !5, line: 56, column: 28)
!858 = !DILocation(line: 57, column: 14, scope: !857)
!859 = !DILocation(line: 57, column: 5, scope: !857)
!860 = !DILocation(line: 57, column: 7, scope: !857)
!861 = !DILocation(line: 57, column: 10, scope: !857)
!862 = !DILocation(line: 58, column: 12, scope: !863)
!863 = distinct !DILexicalBlock(scope: !857, file: !5, line: 58, column: 5)
!864 = !DILocation(line: 58, column: 10, scope: !863)
!865 = !DILocation(line: 58, column: 17, scope: !866)
!866 = distinct !DILexicalBlock(scope: !863, file: !5, line: 58, column: 5)
!867 = !DILocation(line: 58, column: 21, scope: !866)
!868 = !DILocation(line: 58, column: 19, scope: !866)
!869 = !DILocation(line: 58, column: 5, scope: !863)
!870 = !DILocation(line: 59, column: 29, scope: !866)
!871 = !DILocation(line: 59, column: 32, scope: !866)
!872 = !DILocation(line: 59, column: 33, scope: !866)
!873 = !DILocation(line: 59, column: 31, scope: !866)
!874 = !DILocation(line: 59, column: 30, scope: !866)
!875 = !DILocation(line: 59, column: 38, scope: !866)
!876 = !DILocation(line: 59, column: 37, scope: !866)
!877 = !DILocation(line: 59, column: 7, scope: !866)
!878 = !DILocation(line: 59, column: 9, scope: !866)
!879 = !DILocation(line: 59, column: 11, scope: !866)
!880 = !DILocation(line: 59, column: 10, scope: !866)
!881 = !DILocation(line: 59, column: 14, scope: !866)
!882 = !DILocation(line: 59, column: 13, scope: !866)
!883 = !DILocation(line: 59, column: 17, scope: !866)
!884 = !DILocation(line: 58, column: 26, scope: !866)
!885 = !DILocation(line: 58, column: 5, scope: !866)
!886 = distinct !{!886, !869, !887}
!887 = !DILocation(line: 59, column: 38, scope: !863)
!888 = !DILocation(line: 60, column: 3, scope: !857)
!889 = !DILocation(line: 56, column: 24, scope: !852)
!890 = !DILocation(line: 56, column: 3, scope: !852)
!891 = distinct !{!891, !855, !892}
!892 = !DILocation(line: 60, column: 3, scope: !849)
!893 = !DILocation(line: 61, column: 1, scope: !814)
!894 = distinct !DISubprogram(name: "kernel", linkageName: "_ZL6kerneliiPdS_S_S_S_", scope: !5, file: !5, line: 86, type: !693, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!895 = !DILocalVariable(name: "m", arg: 1, scope: !894, file: !5, line: 86, type: !110)
!896 = !DILocation(line: 86, column: 24, scope: !894)
!897 = !DILocalVariable(name: "n", arg: 2, scope: !894, file: !5, line: 86, type: !110)
!898 = !DILocation(line: 86, column: 31, scope: !894)
!899 = !DILocalVariable(name: "A", arg: 3, scope: !894, file: !5, line: 86, type: !99)
!900 = !DILocation(line: 86, column: 42, scope: !894)
!901 = !DILocalVariable(name: "s", arg: 4, scope: !894, file: !5, line: 86, type: !99)
!902 = !DILocation(line: 86, column: 52, scope: !894)
!903 = !DILocalVariable(name: "q", arg: 5, scope: !894, file: !5, line: 86, type: !99)
!904 = !DILocation(line: 86, column: 64, scope: !894)
!905 = !DILocalVariable(name: "p", arg: 6, scope: !894, file: !5, line: 86, type: !99)
!906 = !DILocation(line: 86, column: 76, scope: !894)
!907 = !DILocalVariable(name: "r", arg: 7, scope: !894, file: !5, line: 86, type: !99)
!908 = !DILocation(line: 86, column: 88, scope: !894)
!909 = !DILocalVariable(name: "dev_A", scope: !894, file: !5, line: 87, type: !99)
!910 = !DILocation(line: 87, column: 11, scope: !894)
!911 = !DILocalVariable(name: "dev_s", scope: !894, file: !5, line: 88, type: !99)
!912 = !DILocation(line: 88, column: 11, scope: !894)
!913 = !DILocalVariable(name: "dev_q", scope: !894, file: !5, line: 89, type: !99)
!914 = !DILocation(line: 89, column: 11, scope: !894)
!915 = !DILocalVariable(name: "dev_p", scope: !894, file: !5, line: 90, type: !99)
!916 = !DILocation(line: 90, column: 11, scope: !894)
!917 = !DILocalVariable(name: "dev_r", scope: !894, file: !5, line: 91, type: !99)
!918 = !DILocation(line: 91, column: 11, scope: !894)
!919 = !DILocation(line: 92, column: 22, scope: !894)
!920 = !DILocation(line: 92, column: 24, scope: !894)
!921 = !DILocation(line: 92, column: 23, scope: !894)
!922 = !DILocation(line: 92, column: 25, scope: !894)
!923 = !DILocation(line: 92, column: 3, scope: !894)
!924 = !DILocation(line: 93, column: 22, scope: !894)
!925 = !DILocation(line: 93, column: 23, scope: !894)
!926 = !DILocation(line: 93, column: 3, scope: !894)
!927 = !DILocation(line: 94, column: 22, scope: !894)
!928 = !DILocation(line: 94, column: 23, scope: !894)
!929 = !DILocation(line: 94, column: 3, scope: !894)
!930 = !DILocation(line: 95, column: 22, scope: !894)
!931 = !DILocation(line: 95, column: 23, scope: !894)
!932 = !DILocation(line: 95, column: 3, scope: !894)
!933 = !DILocation(line: 96, column: 22, scope: !894)
!934 = !DILocation(line: 96, column: 23, scope: !894)
!935 = !DILocation(line: 96, column: 3, scope: !894)
!936 = !DILocation(line: 97, column: 14, scope: !894)
!937 = !DILocation(line: 97, column: 21, scope: !894)
!938 = !DILocation(line: 97, column: 24, scope: !894)
!939 = !DILocation(line: 97, column: 26, scope: !894)
!940 = !DILocation(line: 97, column: 25, scope: !894)
!941 = !DILocation(line: 97, column: 27, scope: !894)
!942 = !DILocation(line: 97, column: 3, scope: !894)
!943 = !DILocation(line: 98, column: 14, scope: !894)
!944 = !DILocation(line: 98, column: 21, scope: !894)
!945 = !DILocation(line: 98, column: 24, scope: !894)
!946 = !DILocation(line: 98, column: 25, scope: !894)
!947 = !DILocation(line: 98, column: 3, scope: !894)
!948 = !DILocation(line: 99, column: 14, scope: !894)
!949 = !DILocation(line: 99, column: 21, scope: !894)
!950 = !DILocation(line: 99, column: 24, scope: !894)
!951 = !DILocation(line: 99, column: 25, scope: !894)
!952 = !DILocation(line: 99, column: 3, scope: !894)
!953 = !DILocation(line: 100, column: 14, scope: !894)
!954 = !DILocation(line: 100, column: 21, scope: !894)
!955 = !DILocation(line: 100, column: 24, scope: !894)
!956 = !DILocation(line: 100, column: 25, scope: !894)
!957 = !DILocation(line: 100, column: 3, scope: !894)
!958 = !DILocation(line: 101, column: 14, scope: !894)
!959 = !DILocation(line: 101, column: 21, scope: !894)
!960 = !DILocation(line: 101, column: 24, scope: !894)
!961 = !DILocation(line: 101, column: 25, scope: !894)
!962 = !DILocation(line: 101, column: 3, scope: !894)
!963 = !DILocalVariable(name: "threadsPerBlock", scope: !894, file: !5, line: 102, type: !964)
!964 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!965 = !DILocation(line: 102, column: 18, scope: !894)
!966 = !DILocation(line: 103, column: 25, scope: !894)
!967 = !DILocation(line: 103, column: 14, scope: !894)
!968 = !DILocation(line: 103, column: 46, scope: !894)
!969 = !DILocation(line: 103, column: 11, scope: !894)
!970 = !DILocation(line: 103, column: 3, scope: !894)
!971 = !DILocation(line: 103, column: 65, scope: !894)
!972 = !DILocation(line: 103, column: 68, scope: !894)
!973 = !DILocation(line: 103, column: 71, scope: !894)
!974 = !DILocation(line: 103, column: 78, scope: !894)
!975 = !DILocation(line: 103, column: 85, scope: !894)
!976 = !DILocation(line: 103, column: 92, scope: !894)
!977 = !DILocation(line: 103, column: 99, scope: !894)
!978 = !DILocation(line: 104, column: 25, scope: !894)
!979 = !DILocation(line: 104, column: 14, scope: !894)
!980 = !DILocation(line: 104, column: 46, scope: !894)
!981 = !DILocation(line: 104, column: 11, scope: !894)
!982 = !DILocation(line: 104, column: 3, scope: !894)
!983 = !DILocation(line: 104, column: 65, scope: !894)
!984 = !DILocation(line: 104, column: 68, scope: !894)
!985 = !DILocation(line: 104, column: 71, scope: !894)
!986 = !DILocation(line: 104, column: 78, scope: !894)
!987 = !DILocation(line: 104, column: 85, scope: !894)
!988 = !DILocation(line: 104, column: 92, scope: !894)
!989 = !DILocation(line: 104, column: 99, scope: !894)
!990 = !DILocation(line: 105, column: 14, scope: !894)
!991 = !DILocation(line: 105, column: 17, scope: !894)
!992 = !DILocation(line: 105, column: 24, scope: !894)
!993 = !DILocation(line: 105, column: 25, scope: !894)
!994 = !DILocation(line: 105, column: 3, scope: !894)
!995 = !DILocation(line: 106, column: 14, scope: !894)
!996 = !DILocation(line: 106, column: 17, scope: !894)
!997 = !DILocation(line: 106, column: 24, scope: !894)
!998 = !DILocation(line: 106, column: 25, scope: !894)
!999 = !DILocation(line: 106, column: 3, scope: !894)
!1000 = !DILocation(line: 107, column: 19, scope: !894)
!1001 = !DILocation(line: 107, column: 3, scope: !894)
!1002 = !DILocation(line: 108, column: 19, scope: !894)
!1003 = !DILocation(line: 108, column: 3, scope: !894)
!1004 = !DILocation(line: 109, column: 19, scope: !894)
!1005 = !DILocation(line: 109, column: 3, scope: !894)
!1006 = !DILocation(line: 110, column: 19, scope: !894)
!1007 = !DILocation(line: 110, column: 3, scope: !894)
!1008 = !DILocation(line: 111, column: 19, scope: !894)
!1009 = !DILocation(line: 111, column: 3, scope: !894)
!1010 = !DILocation(line: 112, column: 1, scope: !894)
!1011 = distinct !DISubprogram(name: "print_array", linkageName: "_ZL11print_arrayiiPdS_", scope: !5, file: !5, line: 67, type: !1012, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{null, !110, !110, !99, !99}
!1014 = !DILocalVariable(name: "nx", arg: 1, scope: !1011, file: !5, line: 67, type: !110)
!1015 = !DILocation(line: 67, column: 22, scope: !1011)
!1016 = !DILocalVariable(name: "ny", arg: 2, scope: !1011, file: !5, line: 67, type: !110)
!1017 = !DILocation(line: 67, column: 30, scope: !1011)
!1018 = !DILocalVariable(name: "s", arg: 3, scope: !1011, file: !5, line: 68, type: !99)
!1019 = !DILocation(line: 68, column: 12, scope: !1011)
!1020 = !DILocalVariable(name: "q", arg: 4, scope: !1011, file: !5, line: 69, type: !99)
!1021 = !DILocation(line: 69, column: 12, scope: !1011)
!1022 = !DILocalVariable(name: "i", scope: !1011, file: !5, line: 72, type: !110)
!1023 = !DILocation(line: 72, column: 7, scope: !1011)
!1024 = !DILocation(line: 74, column: 10, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !1011, file: !5, line: 74, column: 3)
!1026 = !DILocation(line: 74, column: 8, scope: !1025)
!1027 = !DILocation(line: 74, column: 15, scope: !1028)
!1028 = distinct !DILexicalBlock(scope: !1025, file: !5, line: 74, column: 3)
!1029 = !DILocation(line: 74, column: 19, scope: !1028)
!1030 = !DILocation(line: 74, column: 17, scope: !1028)
!1031 = !DILocation(line: 74, column: 3, scope: !1025)
!1032 = !DILocation(line: 75, column: 14, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1028, file: !5, line: 74, column: 28)
!1034 = !DILocation(line: 75, column: 33, scope: !1033)
!1035 = !DILocation(line: 75, column: 35, scope: !1033)
!1036 = !DILocation(line: 75, column: 5, scope: !1033)
!1037 = !DILocation(line: 76, column: 9, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1033, file: !5, line: 76, column: 9)
!1039 = !DILocation(line: 76, column: 11, scope: !1038)
!1040 = !DILocation(line: 76, column: 16, scope: !1038)
!1041 = !DILocation(line: 76, column: 9, scope: !1033)
!1042 = !DILocation(line: 76, column: 31, scope: !1038)
!1043 = !DILocation(line: 76, column: 22, scope: !1038)
!1044 = !DILocation(line: 77, column: 3, scope: !1033)
!1045 = !DILocation(line: 74, column: 24, scope: !1028)
!1046 = !DILocation(line: 74, column: 3, scope: !1028)
!1047 = distinct !{!1047, !1031, !1048}
!1048 = !DILocation(line: 77, column: 3, scope: !1025)
!1049 = !DILocation(line: 78, column: 10, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !1011, file: !5, line: 78, column: 3)
!1051 = !DILocation(line: 78, column: 8, scope: !1050)
!1052 = !DILocation(line: 78, column: 15, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1050, file: !5, line: 78, column: 3)
!1054 = !DILocation(line: 78, column: 19, scope: !1053)
!1055 = !DILocation(line: 78, column: 17, scope: !1053)
!1056 = !DILocation(line: 78, column: 3, scope: !1050)
!1057 = !DILocation(line: 79, column: 14, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1053, file: !5, line: 78, column: 28)
!1059 = !DILocation(line: 79, column: 33, scope: !1058)
!1060 = !DILocation(line: 79, column: 35, scope: !1058)
!1061 = !DILocation(line: 79, column: 5, scope: !1058)
!1062 = !DILocation(line: 80, column: 9, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1058, file: !5, line: 80, column: 9)
!1064 = !DILocation(line: 80, column: 11, scope: !1063)
!1065 = !DILocation(line: 80, column: 16, scope: !1063)
!1066 = !DILocation(line: 80, column: 9, scope: !1058)
!1067 = !DILocation(line: 80, column: 31, scope: !1063)
!1068 = !DILocation(line: 80, column: 22, scope: !1063)
!1069 = !DILocation(line: 81, column: 3, scope: !1058)
!1070 = !DILocation(line: 78, column: 24, scope: !1053)
!1071 = !DILocation(line: 78, column: 3, scope: !1053)
!1072 = distinct !{!1072, !1056, !1073}
!1073 = !DILocation(line: 81, column: 3, scope: !1050)
!1074 = !DILocation(line: 82, column: 12, scope: !1011)
!1075 = !DILocation(line: 82, column: 3, scope: !1011)
!1076 = !DILocation(line: 83, column: 1, scope: !1011)
!1077 = distinct !DISubprogram(name: "cudaMalloc<double>", linkageName: "_ZL10cudaMallocIdE9cudaErrorPPT_m", scope: !1078, file: !1078, line: 490, type: !1079, scopeLine: 494, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, templateParams: !1083, retainedNodes: !695)
!1078 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "")
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!1081, !1082, !391}
!1081 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !8, line: 1419, baseType: !16)
!1082 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!1083 = !{!1084}
!1084 = !DITemplateTypeParameter(name: "T", type: !100)
!1085 = !DILocalVariable(name: "devPtr", arg: 1, scope: !1077, file: !1078, line: 491, type: !1082)
!1086 = !DILocation(line: 491, column: 12, scope: !1077)
!1087 = !DILocalVariable(name: "size", arg: 2, scope: !1077, file: !1078, line: 492, type: !391)
!1088 = !DILocation(line: 492, column: 12, scope: !1077)
!1089 = !DILocation(line: 495, column: 38, scope: !1077)
!1090 = !DILocation(line: 495, column: 23, scope: !1077)
!1091 = !DILocation(line: 495, column: 46, scope: !1077)
!1092 = !DILocation(line: 495, column: 10, scope: !1077)
!1093 = !DILocation(line: 495, column: 3, scope: !1077)
!1094 = distinct !DISubprogram(name: "num_blocks", linkageName: "_ZL10num_blocksii", scope: !5, file: !5, line: 17, type: !1095, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !4, retainedNodes: !695)
!1095 = !DISubroutineType(types: !1096)
!1096 = !{!9, !110, !110}
!1097 = !DILocalVariable(name: "num", arg: 1, scope: !1094, file: !5, line: 17, type: !110)
!1098 = !DILocation(line: 17, column: 32, scope: !1094)
!1099 = !DILocalVariable(name: "factor", arg: 2, scope: !1094, file: !5, line: 17, type: !110)
!1100 = !DILocation(line: 17, column: 41, scope: !1094)
!1101 = !DILocation(line: 18, column: 11, scope: !1094)
!1102 = !DILocation(line: 18, column: 17, scope: !1094)
!1103 = !DILocation(line: 18, column: 15, scope: !1094)
!1104 = !DILocation(line: 18, column: 24, scope: !1094)
!1105 = !DILocation(line: 18, column: 31, scope: !1094)
!1106 = !DILocation(line: 18, column: 29, scope: !1094)
!1107 = !DILocation(line: 18, column: 3, scope: !1094)
!1108 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1110, file: !1109, line: 421, type: !1116, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !4, declaration: !1115, retainedNodes: !695)
!1109 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!1110 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1109, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !1111, identifier: "_ZTS4dim3")
!1111 = !{!1112, !1113, !1114, !1115, !1119, !1128}
!1112 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1110, file: !1109, line: 419, baseType: !9, size: 32)
!1113 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1110, file: !1109, line: 419, baseType: !9, size: 32, offset: 32)
!1114 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1110, file: !1109, line: 419, baseType: !9, size: 32, offset: 64)
!1115 = !DISubprogram(name: "dim3", scope: !1110, file: !1109, line: 421, type: !1116, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!1116 = !DISubroutineType(types: !1117)
!1117 = !{null, !1118, !9, !9, !9}
!1118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1110, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1119 = !DISubprogram(name: "dim3", scope: !1110, file: !1109, line: 422, type: !1120, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!1120 = !DISubroutineType(types: !1121)
!1121 = !{null, !1118, !1122}
!1122 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1109, line: 383, baseType: !1123)
!1123 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1109, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !1124, identifier: "_ZTS5uint3")
!1124 = !{!1125, !1126, !1127}
!1125 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1123, file: !1109, line: 192, baseType: !9, size: 32)
!1126 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1123, file: !1109, line: 192, baseType: !9, size: 32, offset: 32)
!1127 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1123, file: !1109, line: 192, baseType: !9, size: 32, offset: 64)
!1128 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1110, file: !1109, line: 423, type: !1129, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!1122, !1118}
!1131 = !DILocalVariable(name: "this", arg: 1, scope: !1108, type: !1132, flags: DIFlagArtificial | DIFlagObjectPointer)
!1132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1110, size: 64)
!1133 = !DILocation(line: 0, scope: !1108)
!1134 = !DILocalVariable(name: "vx", arg: 2, scope: !1108, file: !1109, line: 421, type: !9)
!1135 = !DILocation(line: 421, column: 43, scope: !1108)
!1136 = !DILocalVariable(name: "vy", arg: 3, scope: !1108, file: !1109, line: 421, type: !9)
!1137 = !DILocation(line: 421, column: 64, scope: !1108)
!1138 = !DILocalVariable(name: "vz", arg: 4, scope: !1108, file: !1109, line: 421, type: !9)
!1139 = !DILocation(line: 421, column: 85, scope: !1108)
!1140 = !DILocation(line: 421, column: 95, scope: !1108)
!1141 = !DILocation(line: 421, column: 97, scope: !1108)
!1142 = !DILocation(line: 421, column: 102, scope: !1108)
!1143 = !DILocation(line: 421, column: 104, scope: !1108)
!1144 = !DILocation(line: 421, column: 109, scope: !1108)
!1145 = !DILocation(line: 421, column: 111, scope: !1108)
!1146 = !DILocation(line: 421, column: 116, scope: !1108)
