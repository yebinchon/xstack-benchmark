; ModuleID = 'fdtd-2d.cu'
source_filename = "fdtd-2d.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z12kernel_splatiiiPdS_S_S_i(i32 %tmax, i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz, double* %fict, i32 %t) #0 !dbg !611 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %fict.addr = alloca double*, align 8
  %t.addr = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !614, metadata !DIExpression()), !dbg !615
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !616, metadata !DIExpression()), !dbg !617
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !618, metadata !DIExpression()), !dbg !619
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !620, metadata !DIExpression()), !dbg !621
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !622, metadata !DIExpression()), !dbg !623
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !624, metadata !DIExpression()), !dbg !625
  store double* %fict, double** %fict.addr, align 8
  call void @llvm.dbg.declare(metadata double** %fict.addr, metadata !626, metadata !DIExpression()), !dbg !627
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !628, metadata !DIExpression()), !dbg !629
  call void @llvm.dbg.declare(metadata i32* %j, metadata !630, metadata !DIExpression()), !dbg !631
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3, !dbg !632, !range !685
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !686, !range !714
  %mul = mul i32 %0, %1, !dbg !715
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !716, !range !744
  %add = add i32 %mul, %2, !dbg !745
  store i32 %add, i32* %j, align 4, !dbg !631
  %3 = load i32, i32* %j, align 4, !dbg !746
  %4 = load i32, i32* %ny.addr, align 4, !dbg !748
  %cmp = icmp slt i32 %3, %4, !dbg !749
  br i1 %cmp, label %if.then, label %if.end, !dbg !750

if.then:                                          ; preds = %entry
  %5 = load double*, double** %fict.addr, align 8, !dbg !751
  %6 = load i32, i32* %t.addr, align 4, !dbg !752
  %idxprom = sext i32 %6 to i64, !dbg !751
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom, !dbg !751
  %7 = load double, double* %arrayidx, align 8, !dbg !751
  %8 = load double*, double** %ey.addr, align 8, !dbg !753
  %9 = load i32, i32* %ny.addr, align 4, !dbg !754
  %mul3 = mul nsw i32 0, %9, !dbg !755
  %10 = load i32, i32* %j, align 4, !dbg !756
  %add4 = add nsw i32 %mul3, %10, !dbg !757
  %idxprom5 = sext i32 %add4 to i64, !dbg !753
  %arrayidx6 = getelementptr inbounds double, double* %8, i64 %idxprom5, !dbg !753
  store double %7, double* %arrayidx6, align 8, !dbg !758
  br label %if.end, !dbg !753

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !759
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z9kernel_eyiiiPdS_S_S_i(i32 %tmax, i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz, double* %fict, i32 %t) #0 !dbg !760 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %fict.addr = alloca double*, align 8
  %t.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !761, metadata !DIExpression()), !dbg !762
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !763, metadata !DIExpression()), !dbg !764
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !765, metadata !DIExpression()), !dbg !766
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !767, metadata !DIExpression()), !dbg !768
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !769, metadata !DIExpression()), !dbg !770
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !771, metadata !DIExpression()), !dbg !772
  store double* %fict, double** %fict.addr, align 8
  call void @llvm.dbg.declare(metadata double** %fict.addr, metadata !773, metadata !DIExpression()), !dbg !774
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !775, metadata !DIExpression()), !dbg !776
  call void @llvm.dbg.declare(metadata i32* %i, metadata !777, metadata !DIExpression()), !dbg !778
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3, !dbg !779, !range !685
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !781, !range !714
  %mul = mul i32 %0, %1, !dbg !783
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !784, !range !744
  %add = add i32 %mul, %2, !dbg !786
  %add3 = add i32 %add, 1, !dbg !787
  store i32 %add3, i32* %i, align 4, !dbg !778
  call void @llvm.dbg.declare(metadata i32* %j, metadata !788, metadata !DIExpression()), !dbg !789
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #3, !dbg !790, !range !685
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !793, !range !714
  %mul6 = mul i32 %3, %4, !dbg !796
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !797, !range !744
  %add8 = add i32 %mul6, %5, !dbg !800
  store i32 %add8, i32* %j, align 4, !dbg !789
  %6 = load i32, i32* %i, align 4, !dbg !801
  %7 = load i32, i32* %nx.addr, align 4, !dbg !803
  %cmp = icmp slt i32 %6, %7, !dbg !804
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !805

land.lhs.true:                                    ; preds = %entry
  %8 = load i32, i32* %j, align 4, !dbg !806
  %9 = load i32, i32* %ny.addr, align 4, !dbg !807
  %cmp9 = icmp slt i32 %8, %9, !dbg !808
  br i1 %cmp9, label %if.then, label %if.end, !dbg !809

if.then:                                          ; preds = %land.lhs.true
  %10 = load double*, double** %hz.addr, align 8, !dbg !810
  %11 = load i32, i32* %i, align 4, !dbg !811
  %12 = load i32, i32* %ny.addr, align 4, !dbg !812
  %mul10 = mul nsw i32 %11, %12, !dbg !813
  %13 = load i32, i32* %j, align 4, !dbg !814
  %add11 = add nsw i32 %mul10, %13, !dbg !815
  %idxprom = sext i32 %add11 to i64, !dbg !810
  %arrayidx = getelementptr inbounds double, double* %10, i64 %idxprom, !dbg !810
  %14 = load double, double* %arrayidx, align 8, !dbg !810
  %15 = load double*, double** %hz.addr, align 8, !dbg !816
  %16 = load i32, i32* %i, align 4, !dbg !817
  %sub = sub nsw i32 %16, 1, !dbg !818
  %17 = load i32, i32* %ny.addr, align 4, !dbg !819
  %mul12 = mul nsw i32 %sub, %17, !dbg !820
  %18 = load i32, i32* %j, align 4, !dbg !821
  %add13 = add nsw i32 %mul12, %18, !dbg !822
  %idxprom14 = sext i32 %add13 to i64, !dbg !816
  %arrayidx15 = getelementptr inbounds double, double* %15, i64 %idxprom14, !dbg !816
  %19 = load double, double* %arrayidx15, align 8, !dbg !816
  %sub16 = fsub contract double %14, %19, !dbg !823
  %mul17 = fmul contract double 5.000000e-01, %sub16, !dbg !824
  %20 = load double*, double** %ey.addr, align 8, !dbg !825
  %21 = load i32, i32* %i, align 4, !dbg !826
  %22 = load i32, i32* %ny.addr, align 4, !dbg !827
  %mul18 = mul nsw i32 %21, %22, !dbg !828
  %23 = load i32, i32* %j, align 4, !dbg !829
  %add19 = add nsw i32 %mul18, %23, !dbg !830
  %idxprom20 = sext i32 %add19 to i64, !dbg !825
  %arrayidx21 = getelementptr inbounds double, double* %20, i64 %idxprom20, !dbg !825
  %24 = load double, double* %arrayidx21, align 8, !dbg !831
  %sub22 = fsub contract double %24, %mul17, !dbg !831
  store double %sub22, double* %arrayidx21, align 8, !dbg !831
  br label %if.end, !dbg !825

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void, !dbg !832
}

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z9kernel_exiiiPdS_S_S_i(i32 %tmax, i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz, double* %fict, i32 %t) #0 !dbg !833 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %fict.addr = alloca double*, align 8
  %t.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !834, metadata !DIExpression()), !dbg !835
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !836, metadata !DIExpression()), !dbg !837
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !838, metadata !DIExpression()), !dbg !839
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !840, metadata !DIExpression()), !dbg !841
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !842, metadata !DIExpression()), !dbg !843
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !844, metadata !DIExpression()), !dbg !845
  store double* %fict, double** %fict.addr, align 8
  call void @llvm.dbg.declare(metadata double** %fict.addr, metadata !846, metadata !DIExpression()), !dbg !847
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !848, metadata !DIExpression()), !dbg !849
  call void @llvm.dbg.declare(metadata i32* %i, metadata !850, metadata !DIExpression()), !dbg !851
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3, !dbg !852, !range !685
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !854, !range !714
  %mul = mul i32 %0, %1, !dbg !856
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !857, !range !744
  %add = add i32 %mul, %2, !dbg !859
  store i32 %add, i32* %i, align 4, !dbg !851
  call void @llvm.dbg.declare(metadata i32* %j, metadata !860, metadata !DIExpression()), !dbg !861
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #3, !dbg !862, !range !685
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !864, !range !714
  %mul5 = mul i32 %3, %4, !dbg !866
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !867, !range !744
  %add7 = add i32 %mul5, %5, !dbg !869
  %add8 = add i32 %add7, 1, !dbg !870
  store i32 %add8, i32* %j, align 4, !dbg !861
  %6 = load i32, i32* %i, align 4, !dbg !871
  %7 = load i32, i32* %nx.addr, align 4, !dbg !873
  %cmp = icmp slt i32 %6, %7, !dbg !874
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !875

land.lhs.true:                                    ; preds = %entry
  %8 = load i32, i32* %j, align 4, !dbg !876
  %9 = load i32, i32* %ny.addr, align 4, !dbg !877
  %cmp9 = icmp slt i32 %8, %9, !dbg !878
  br i1 %cmp9, label %if.then, label %if.end, !dbg !879

if.then:                                          ; preds = %land.lhs.true
  %10 = load double*, double** %hz.addr, align 8, !dbg !880
  %11 = load i32, i32* %i, align 4, !dbg !881
  %12 = load i32, i32* %ny.addr, align 4, !dbg !882
  %mul10 = mul nsw i32 %11, %12, !dbg !883
  %13 = load i32, i32* %j, align 4, !dbg !884
  %add11 = add nsw i32 %mul10, %13, !dbg !885
  %idxprom = sext i32 %add11 to i64, !dbg !880
  %arrayidx = getelementptr inbounds double, double* %10, i64 %idxprom, !dbg !880
  %14 = load double, double* %arrayidx, align 8, !dbg !880
  %15 = load double*, double** %hz.addr, align 8, !dbg !886
  %16 = load i32, i32* %i, align 4, !dbg !887
  %17 = load i32, i32* %ny.addr, align 4, !dbg !888
  %mul12 = mul nsw i32 %16, %17, !dbg !889
  %18 = load i32, i32* %j, align 4, !dbg !890
  %add13 = add nsw i32 %mul12, %18, !dbg !891
  %sub = sub nsw i32 %add13, 1, !dbg !892
  %idxprom14 = sext i32 %sub to i64, !dbg !886
  %arrayidx15 = getelementptr inbounds double, double* %15, i64 %idxprom14, !dbg !886
  %19 = load double, double* %arrayidx15, align 8, !dbg !886
  %sub16 = fsub contract double %14, %19, !dbg !893
  %mul17 = fmul contract double 5.000000e-01, %sub16, !dbg !894
  %20 = load double*, double** %ex.addr, align 8, !dbg !895
  %21 = load i32, i32* %i, align 4, !dbg !896
  %22 = load i32, i32* %ny.addr, align 4, !dbg !897
  %mul18 = mul nsw i32 %21, %22, !dbg !898
  %23 = load i32, i32* %j, align 4, !dbg !899
  %add19 = add nsw i32 %mul18, %23, !dbg !900
  %idxprom20 = sext i32 %add19 to i64, !dbg !895
  %arrayidx21 = getelementptr inbounds double, double* %20, i64 %idxprom20, !dbg !895
  %24 = load double, double* %arrayidx21, align 8, !dbg !901
  %sub22 = fsub contract double %24, %mul17, !dbg !901
  store double %sub22, double* %arrayidx21, align 8, !dbg !901
  br label %if.end, !dbg !895

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void, !dbg !902
}

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z9kernel_hziiiPdS_S_S_i(i32 %tmax, i32 %nx, i32 %ny, double* %ex, double* %ey, double* %hz, double* %fict, i32 %t) #0 !dbg !903 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca double*, align 8
  %ey.addr = alloca double*, align 8
  %hz.addr = alloca double*, align 8
  %fict.addr = alloca double*, align 8
  %t.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !904, metadata !DIExpression()), !dbg !905
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !906, metadata !DIExpression()), !dbg !907
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !908, metadata !DIExpression()), !dbg !909
  store double* %ex, double** %ex.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ex.addr, metadata !910, metadata !DIExpression()), !dbg !911
  store double* %ey, double** %ey.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ey.addr, metadata !912, metadata !DIExpression()), !dbg !913
  store double* %hz, double** %hz.addr, align 8
  call void @llvm.dbg.declare(metadata double** %hz.addr, metadata !914, metadata !DIExpression()), !dbg !915
  store double* %fict, double** %fict.addr, align 8
  call void @llvm.dbg.declare(metadata double** %fict.addr, metadata !916, metadata !DIExpression()), !dbg !917
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !918, metadata !DIExpression()), !dbg !919
  call void @llvm.dbg.declare(metadata i32* %i, metadata !920, metadata !DIExpression()), !dbg !921
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3, !dbg !922, !range !685
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !924, !range !714
  %mul = mul i32 %0, %1, !dbg !926
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !927, !range !744
  %add = add i32 %mul, %2, !dbg !929
  store i32 %add, i32* %i, align 4, !dbg !921
  call void @llvm.dbg.declare(metadata i32* %j, metadata !930, metadata !DIExpression()), !dbg !931
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #3, !dbg !932, !range !685
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !934, !range !714
  %mul5 = mul i32 %3, %4, !dbg !936
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !937, !range !744
  %add7 = add i32 %mul5, %5, !dbg !939
  store i32 %add7, i32* %j, align 4, !dbg !931
  %6 = load i32, i32* %i, align 4, !dbg !940
  %7 = load i32, i32* %nx.addr, align 4, !dbg !942
  %sub = sub nsw i32 %7, 1, !dbg !943
  %cmp = icmp slt i32 %6, %sub, !dbg !944
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !945

land.lhs.true:                                    ; preds = %entry
  %8 = load i32, i32* %j, align 4, !dbg !946
  %9 = load i32, i32* %ny.addr, align 4, !dbg !947
  %sub8 = sub nsw i32 %9, 1, !dbg !948
  %cmp9 = icmp slt i32 %8, %sub8, !dbg !949
  br i1 %cmp9, label %if.then, label %if.end, !dbg !950

if.then:                                          ; preds = %land.lhs.true
  %10 = load double*, double** %ex.addr, align 8, !dbg !951
  %11 = load i32, i32* %i, align 4, !dbg !952
  %12 = load i32, i32* %ny.addr, align 4, !dbg !953
  %mul10 = mul nsw i32 %11, %12, !dbg !954
  %13 = load i32, i32* %j, align 4, !dbg !955
  %add11 = add nsw i32 %mul10, %13, !dbg !956
  %add12 = add nsw i32 %add11, 1, !dbg !957
  %idxprom = sext i32 %add12 to i64, !dbg !951
  %arrayidx = getelementptr inbounds double, double* %10, i64 %idxprom, !dbg !951
  %14 = load double, double* %arrayidx, align 8, !dbg !951
  %15 = load double*, double** %ex.addr, align 8, !dbg !958
  %16 = load i32, i32* %i, align 4, !dbg !959
  %17 = load i32, i32* %ny.addr, align 4, !dbg !960
  %mul13 = mul nsw i32 %16, %17, !dbg !961
  %18 = load i32, i32* %j, align 4, !dbg !962
  %add14 = add nsw i32 %mul13, %18, !dbg !963
  %idxprom15 = sext i32 %add14 to i64, !dbg !958
  %arrayidx16 = getelementptr inbounds double, double* %15, i64 %idxprom15, !dbg !958
  %19 = load double, double* %arrayidx16, align 8, !dbg !958
  %sub17 = fsub contract double %14, %19, !dbg !964
  %20 = load double*, double** %ey.addr, align 8, !dbg !965
  %21 = load i32, i32* %i, align 4, !dbg !966
  %add18 = add nsw i32 %21, 1, !dbg !967
  %22 = load i32, i32* %ny.addr, align 4, !dbg !968
  %mul19 = mul nsw i32 %add18, %22, !dbg !969
  %23 = load i32, i32* %j, align 4, !dbg !970
  %add20 = add nsw i32 %mul19, %23, !dbg !971
  %idxprom21 = sext i32 %add20 to i64, !dbg !965
  %arrayidx22 = getelementptr inbounds double, double* %20, i64 %idxprom21, !dbg !965
  %24 = load double, double* %arrayidx22, align 8, !dbg !965
  %add23 = fadd contract double %sub17, %24, !dbg !972
  %25 = load double*, double** %ey.addr, align 8, !dbg !973
  %26 = load i32, i32* %i, align 4, !dbg !974
  %27 = load i32, i32* %ny.addr, align 4, !dbg !975
  %mul24 = mul nsw i32 %26, %27, !dbg !976
  %28 = load i32, i32* %j, align 4, !dbg !977
  %add25 = add nsw i32 %mul24, %28, !dbg !978
  %idxprom26 = sext i32 %add25 to i64, !dbg !973
  %arrayidx27 = getelementptr inbounds double, double* %25, i64 %idxprom26, !dbg !973
  %29 = load double, double* %arrayidx27, align 8, !dbg !973
  %sub28 = fsub contract double %add23, %29, !dbg !979
  %mul29 = fmul contract double 0x3FE6666666666666, %sub28, !dbg !980
  %30 = load double*, double** %hz.addr, align 8, !dbg !981
  %31 = load i32, i32* %i, align 4, !dbg !982
  %32 = load i32, i32* %ny.addr, align 4, !dbg !983
  %mul30 = mul nsw i32 %31, %32, !dbg !984
  %33 = load i32, i32* %j, align 4, !dbg !985
  %add31 = add nsw i32 %mul30, %33, !dbg !986
  %idxprom32 = sext i32 %add31 to i64, !dbg !981
  %arrayidx33 = getelementptr inbounds double, double* %30, i64 %idxprom32, !dbg !981
  %34 = load double, double* %arrayidx33, align 8, !dbg !987
  %sub34 = fsub contract double %34, %mul29, !dbg !987
  store double %sub34, double* %arrayidx33, align 8, !dbg !987
  br label %if.end, !dbg !981

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void, !dbg !988
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

attributes #0 = { convergent noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42,+sm_20" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.dbg.cu = !{!5}
!nvvm.annotations = !{!601, !602, !603, !604, !605, !606, !605, !607, !607, !607, !607, !608, !608, !607}
!llvm.ident = !{!609}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!610}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 7, i32 0]}
!1 = !{i32 2, !"Dwarf Version", i32 2}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !6, producer: "clang version 9.0.0 (git@github.com:SusanTan/llvm-project.git a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !7, retainedTypes: !8, imports: !10, nameTableKind: None)
!6 = !DIFile(filename: "fdtd-2d.cu", directory: "/u/NAS_SCRATCH/yc0769/xstack-benchmark/polybench-cuda/fdtd-2d")
!7 = !{}
!8 = !{!9}
!9 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!10 = !{!11, !18, !23, !25, !27, !29, !31, !35, !37, !39, !41, !43, !45, !47, !49, !51, !53, !55, !57, !59, !61, !63, !67, !69, !71, !73, !77, !82, !84, !86, !91, !95, !97, !99, !101, !103, !105, !107, !109, !111, !116, !120, !122, !127, !131, !133, !135, !137, !139, !141, !145, !147, !149, !154, !161, !165, !167, !169, !171, !173, !177, !179, !181, !185, !187, !189, !191, !193, !195, !197, !199, !201, !203, !207, !213, !215, !217, !221, !223, !225, !227, !229, !231, !233, !235, !239, !243, !245, !247, !252, !254, !256, !258, !260, !262, !264, !268, !274, !278, !283, !285, !289, !293, !307, !311, !315, !319, !323, !328, !330, !334, !338, !342, !350, !354, !358, !362, !366, !371, !377, !381, !385, !387, !395, !399, !406, !408, !410, !414, !418, !422, !427, !431, !436, !437, !438, !439, !441, !442, !443, !444, !445, !446, !447, !449, !450, !451, !452, !453, !457, !458, !459, !460, !461, !462, !463, !464, !465, !466, !467, !468, !469, !470, !471, !472, !473, !474, !475, !476, !477, !478, !479, !480, !481, !485, !487, !489, !491, !493, !495, !497, !499, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !546, !548, !550, !552, !554, !556, !558, !560, !562, !564, !566, !568, !570, !572, !574, !576, !578, !580, !582, !584, !586, !588, !590, !592, !594, !596}
!11 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !13, file: !14, line: 223)
!12 = !DINamespace(name: "std", scope: null)
!13 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !14, file: !14, line: 53, type: !15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!14 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/u/NAS_SCRATCH/yc0769")
!15 = !DISubroutineType(types: !16)
!16 = !{!17, !17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !19, file: !14, line: 224)
!19 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !14, file: !14, line: 55, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!20 = !DISubroutineType(types: !21)
!21 = !{!22, !22}
!22 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!23 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !24, file: !14, line: 225)
!24 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !14, file: !14, line: 57, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!25 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !26, file: !14, line: 226)
!26 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !14, file: !14, line: 59, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!27 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !28, file: !14, line: 227)
!28 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !14, file: !14, line: 61, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !30, file: !14, line: 228)
!30 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !14, file: !14, line: 65, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!31 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !32, file: !14, line: 229)
!32 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !14, file: !14, line: 63, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!33 = !DISubroutineType(types: !34)
!34 = !{!22, !22, !22}
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !36, file: !14, line: 230)
!36 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !14, file: !14, line: 67, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !38, file: !14, line: 231)
!38 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !14, file: !14, line: 69, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !40, file: !14, line: 232)
!40 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !14, file: !14, line: 71, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !42, file: !14, line: 233)
!42 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !14, file: !14, line: 73, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !44, file: !14, line: 234)
!44 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !14, file: !14, line: 75, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !46, file: !14, line: 235)
!46 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !14, file: !14, line: 77, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !48, file: !14, line: 236)
!48 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !14, file: !14, line: 81, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !50, file: !14, line: 237)
!50 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !14, file: !14, line: 79, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !52, file: !14, line: 238)
!52 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !14, file: !14, line: 85, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !54, file: !14, line: 239)
!54 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !14, file: !14, line: 83, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !56, file: !14, line: 240)
!56 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !14, file: !14, line: 87, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !58, file: !14, line: 241)
!58 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !14, file: !14, line: 89, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !60, file: !14, line: 242)
!60 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !14, file: !14, line: 91, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !62, file: !14, line: 243)
!62 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !14, file: !14, line: 93, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !64, file: !14, line: 244)
!64 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !14, file: !14, line: 95, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!65 = !DISubroutineType(types: !66)
!66 = !{!22, !22, !22, !22}
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !68, file: !14, line: 245)
!68 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !14, file: !14, line: 97, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !70, file: !14, line: 246)
!70 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !14, file: !14, line: 99, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !72, file: !14, line: 247)
!72 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !14, file: !14, line: 101, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !74, file: !14, line: 248)
!74 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !14, file: !14, line: 103, type: !75, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!75 = !DISubroutineType(types: !76)
!76 = !{!17, !22}
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !78, file: !14, line: 249)
!78 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !14, file: !14, line: 105, type: !79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!79 = !DISubroutineType(types: !80)
!80 = !{!22, !22, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !83, file: !14, line: 250)
!83 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !14, file: !14, line: 107, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !85, file: !14, line: 251)
!85 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !14, file: !14, line: 109, type: !75, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !87, file: !14, line: 252)
!87 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !14, file: !14, line: 114, type: !88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !22}
!90 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !92, file: !14, line: 253)
!92 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !14, file: !14, line: 118, type: !93, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!93 = !DISubroutineType(types: !94)
!94 = !{!90, !22, !22}
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !96, file: !14, line: 254)
!96 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !14, file: !14, line: 117, type: !93, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !98, file: !14, line: 255)
!98 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !14, file: !14, line: 123, type: !88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !100, file: !14, line: 256)
!100 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !14, file: !14, line: 127, type: !93, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !102, file: !14, line: 257)
!102 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !14, file: !14, line: 126, type: !93, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !104, file: !14, line: 258)
!104 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !14, file: !14, line: 129, type: !93, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !106, file: !14, line: 259)
!106 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !14, file: !14, line: 134, type: !88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !108, file: !14, line: 260)
!108 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !14, file: !14, line: 136, type: !88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !110, file: !14, line: 261)
!110 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !14, file: !14, line: 138, type: !93, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !112, file: !14, line: 262)
!112 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !14, file: !14, line: 139, type: !113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!113 = !DISubroutineType(types: !114)
!114 = !{!115, !115}
!115 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !117, file: !14, line: 263)
!117 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !14, file: !14, line: 141, type: !118, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!118 = !DISubroutineType(types: !119)
!119 = !{!22, !22, !17}
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !121, file: !14, line: 264)
!121 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !14, file: !14, line: 143, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !123, file: !14, line: 265)
!123 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !14, file: !14, line: 144, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!124 = !DISubroutineType(types: !125)
!125 = !{!126, !126}
!126 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !128, file: !14, line: 266)
!128 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !14, file: !14, line: 146, type: !129, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!129 = !DISubroutineType(types: !130)
!130 = !{!126, !22}
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !132, file: !14, line: 267)
!132 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !14, file: !14, line: 159, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !134, file: !14, line: 268)
!134 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !14, file: !14, line: 148, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !136, file: !14, line: 269)
!136 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !14, file: !14, line: 150, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !138, file: !14, line: 270)
!138 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !14, file: !14, line: 152, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !140, file: !14, line: 271)
!140 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !14, file: !14, line: 154, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !142, file: !14, line: 272)
!142 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !14, file: !14, line: 161, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!143 = !DISubroutineType(types: !144)
!144 = !{!115, !22}
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !146, file: !14, line: 273)
!146 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !14, file: !14, line: 163, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !148, file: !14, line: 274)
!148 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !14, file: !14, line: 164, type: !129, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !150, file: !14, line: 275)
!150 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !14, file: !14, line: 166, type: !151, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!151 = !DISubroutineType(types: !152)
!152 = !{!22, !22, !153}
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !155, file: !14, line: 276)
!155 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !14, file: !14, line: 167, type: !156, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!156 = !DISubroutineType(types: !157)
!157 = !{!9, !158}
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !160)
!160 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !162, file: !14, line: 277)
!162 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !14, file: !14, line: 168, type: !163, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!163 = !DISubroutineType(types: !164)
!164 = !{!22, !158}
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !166, file: !14, line: 278)
!166 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !14, file: !14, line: 170, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !168, file: !14, line: 279)
!168 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !14, file: !14, line: 172, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !170, file: !14, line: 280)
!170 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !14, file: !14, line: 176, type: !118, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !172, file: !14, line: 281)
!172 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !14, file: !14, line: 178, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !174, file: !14, line: 282)
!174 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !14, file: !14, line: 180, type: !175, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!175 = !DISubroutineType(types: !176)
!176 = !{!22, !22, !22, !81}
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !178, file: !14, line: 283)
!178 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !14, file: !14, line: 182, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !180, file: !14, line: 284)
!180 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !14, file: !14, line: 184, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !182, file: !14, line: 285)
!182 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !14, file: !14, line: 186, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!183 = !DISubroutineType(types: !184)
!184 = !{!22, !22, !115}
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !186, file: !14, line: 286)
!186 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !14, file: !14, line: 188, type: !118, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !188, file: !14, line: 287)
!188 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !14, file: !14, line: 190, type: !88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !190, file: !14, line: 288)
!190 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !14, file: !14, line: 192, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !192, file: !14, line: 289)
!192 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !14, file: !14, line: 194, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !194, file: !14, line: 290)
!194 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !14, file: !14, line: 196, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !196, file: !14, line: 291)
!196 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !14, file: !14, line: 198, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !198, file: !14, line: 292)
!198 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !14, file: !14, line: 200, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !200, file: !14, line: 293)
!200 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !14, file: !14, line: 202, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !202, file: !14, line: 294)
!202 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !14, file: !14, line: 204, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !204, file: !206, line: 52)
!204 = !DISubprogram(name: "abs", scope: !205, file: !205, line: 840, type: !15, flags: DIFlagPrototyped, spFlags: 0)
!205 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!206 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/std_abs.h", directory: "")
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !208, file: !212, line: 83)
!208 = !DISubprogram(name: "acos", scope: !209, file: !209, line: 53, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!209 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!210 = !DISubroutineType(types: !211)
!211 = !{!9, !9}
!212 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cmath", directory: "")
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !214, file: !212, line: 102)
!214 = !DISubprogram(name: "asin", scope: !209, file: !209, line: 55, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !216, file: !212, line: 121)
!216 = !DISubprogram(name: "atan", scope: !209, file: !209, line: 57, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !218, file: !212, line: 140)
!218 = !DISubprogram(name: "atan2", scope: !209, file: !209, line: 59, type: !219, flags: DIFlagPrototyped, spFlags: 0)
!219 = !DISubroutineType(types: !220)
!220 = !{!9, !9, !9}
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !222, file: !212, line: 161)
!222 = !DISubprogram(name: "ceil", scope: !209, file: !209, line: 159, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !224, file: !212, line: 180)
!224 = !DISubprogram(name: "cos", scope: !209, file: !209, line: 62, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !226, file: !212, line: 199)
!226 = !DISubprogram(name: "cosh", scope: !209, file: !209, line: 71, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !228, file: !212, line: 218)
!228 = !DISubprogram(name: "exp", scope: !209, file: !209, line: 95, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !230, file: !212, line: 237)
!230 = !DISubprogram(name: "fabs", scope: !209, file: !209, line: 162, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !232, file: !212, line: 256)
!232 = !DISubprogram(name: "floor", scope: !209, file: !209, line: 165, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !234, file: !212, line: 275)
!234 = !DISubprogram(name: "fmod", scope: !209, file: !209, line: 168, type: !219, flags: DIFlagPrototyped, spFlags: 0)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !236, file: !212, line: 296)
!236 = !DISubprogram(name: "frexp", scope: !209, file: !209, line: 98, type: !237, flags: DIFlagPrototyped, spFlags: 0)
!237 = !DISubroutineType(types: !238)
!238 = !{!9, !9, !81}
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !240, file: !212, line: 315)
!240 = !DISubprogram(name: "ldexp", scope: !209, file: !209, line: 101, type: !241, flags: DIFlagPrototyped, spFlags: 0)
!241 = !DISubroutineType(types: !242)
!242 = !{!9, !9, !17}
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !244, file: !212, line: 334)
!244 = !DISubprogram(name: "log", scope: !209, file: !209, line: 104, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !246, file: !212, line: 353)
!246 = !DISubprogram(name: "log10", scope: !209, file: !209, line: 107, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !248, file: !212, line: 372)
!248 = !DISubprogram(name: "modf", scope: !209, file: !209, line: 110, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!249 = !DISubroutineType(types: !250)
!250 = !{!9, !9, !251}
!251 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !253, file: !212, line: 384)
!253 = !DISubprogram(name: "pow", scope: !209, file: !209, line: 140, type: !219, flags: DIFlagPrototyped, spFlags: 0)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !255, file: !212, line: 421)
!255 = !DISubprogram(name: "sin", scope: !209, file: !209, line: 64, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !257, file: !212, line: 440)
!257 = !DISubprogram(name: "sinh", scope: !209, file: !209, line: 73, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !259, file: !212, line: 459)
!259 = !DISubprogram(name: "sqrt", scope: !209, file: !209, line: 143, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !261, file: !212, line: 478)
!261 = !DISubprogram(name: "tan", scope: !209, file: !209, line: 66, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !263, file: !212, line: 497)
!263 = !DISubprogram(name: "tanh", scope: !209, file: !209, line: 75, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !265, file: !267, line: 127)
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !205, line: 62, baseType: !266)
!266 = !DICompositeType(tag: DW_TAG_structure_type, file: !205, line: 58, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!267 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdlib", directory: "")
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !269, file: !267, line: 128)
!269 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !205, line: 70, baseType: !270)
!270 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !205, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !271, identifier: "_ZTS6ldiv_t")
!271 = !{!272, !273}
!272 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !270, file: !205, line: 68, baseType: !115, size: 64)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !270, file: !205, line: 69, baseType: !115, size: 64, offset: 64)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !275, file: !267, line: 130)
!275 = !DISubprogram(name: "abort", scope: !205, file: !205, line: 591, type: !276, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!276 = !DISubroutineType(types: !277)
!277 = !{null}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !279, file: !267, line: 134)
!279 = !DISubprogram(name: "atexit", scope: !205, file: !205, line: 595, type: !280, flags: DIFlagPrototyped, spFlags: 0)
!280 = !DISubroutineType(types: !281)
!281 = !{!17, !282}
!282 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !284, file: !267, line: 140)
!284 = !DISubprogram(name: "atof", scope: !205, file: !205, line: 101, type: !156, flags: DIFlagPrototyped, spFlags: 0)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !286, file: !267, line: 141)
!286 = !DISubprogram(name: "atoi", scope: !205, file: !205, line: 104, type: !287, flags: DIFlagPrototyped, spFlags: 0)
!287 = !DISubroutineType(types: !288)
!288 = !{!17, !158}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !290, file: !267, line: 142)
!290 = !DISubprogram(name: "atol", scope: !205, file: !205, line: 107, type: !291, flags: DIFlagPrototyped, spFlags: 0)
!291 = !DISubroutineType(types: !292)
!292 = !{!115, !158}
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !294, file: !267, line: 143)
!294 = !DISubprogram(name: "bsearch", scope: !205, file: !205, line: 820, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!295 = !DISubroutineType(types: !296)
!296 = !{!297, !298, !298, !300, !300, !303}
!297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !299, size: 64)
!299 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!300 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !301, line: 46, baseType: !302)
!301 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/stddef.h", directory: "/u/NAS_SCRATCH/yc0769")
!302 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!303 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !205, line: 808, baseType: !304)
!304 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !305, size: 64)
!305 = !DISubroutineType(types: !306)
!306 = !{!17, !298, !298}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !308, file: !267, line: 144)
!308 = !DISubprogram(name: "calloc", scope: !205, file: !205, line: 542, type: !309, flags: DIFlagPrototyped, spFlags: 0)
!309 = !DISubroutineType(types: !310)
!310 = !{!297, !300, !300}
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !312, file: !267, line: 145)
!312 = !DISubprogram(name: "div", scope: !205, file: !205, line: 852, type: !313, flags: DIFlagPrototyped, spFlags: 0)
!313 = !DISubroutineType(types: !314)
!314 = !{!265, !17, !17}
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !316, file: !267, line: 146)
!316 = !DISubprogram(name: "exit", scope: !205, file: !205, line: 617, type: !317, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!317 = !DISubroutineType(types: !318)
!318 = !{null, !17}
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !320, file: !267, line: 147)
!320 = !DISubprogram(name: "free", scope: !205, file: !205, line: 565, type: !321, flags: DIFlagPrototyped, spFlags: 0)
!321 = !DISubroutineType(types: !322)
!322 = !{null, !297}
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !324, file: !267, line: 148)
!324 = !DISubprogram(name: "getenv", scope: !205, file: !205, line: 634, type: !325, flags: DIFlagPrototyped, spFlags: 0)
!325 = !DISubroutineType(types: !326)
!326 = !{!327, !158}
!327 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !329, file: !267, line: 149)
!329 = !DISubprogram(name: "labs", scope: !205, file: !205, line: 841, type: !113, flags: DIFlagPrototyped, spFlags: 0)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !331, file: !267, line: 150)
!331 = !DISubprogram(name: "ldiv", scope: !205, file: !205, line: 854, type: !332, flags: DIFlagPrototyped, spFlags: 0)
!332 = !DISubroutineType(types: !333)
!333 = !{!269, !115, !115}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !335, file: !267, line: 151)
!335 = !DISubprogram(name: "malloc", scope: !205, file: !205, line: 539, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!336 = !DISubroutineType(types: !337)
!337 = !{!297, !300}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !339, file: !267, line: 153)
!339 = !DISubprogram(name: "mblen", scope: !205, file: !205, line: 922, type: !340, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DISubroutineType(types: !341)
!341 = !{!17, !158, !300}
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !343, file: !267, line: 154)
!343 = !DISubprogram(name: "mbstowcs", scope: !205, file: !205, line: 933, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!344 = !DISubroutineType(types: !345)
!345 = !{!300, !346, !349, !300}
!346 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !347)
!347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !348, size: 64)
!348 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!349 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !158)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !351, file: !267, line: 155)
!351 = !DISubprogram(name: "mbtowc", scope: !205, file: !205, line: 925, type: !352, flags: DIFlagPrototyped, spFlags: 0)
!352 = !DISubroutineType(types: !353)
!353 = !{!17, !346, !349, !300}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !355, file: !267, line: 157)
!355 = !DISubprogram(name: "qsort", scope: !205, file: !205, line: 830, type: !356, flags: DIFlagPrototyped, spFlags: 0)
!356 = !DISubroutineType(types: !357)
!357 = !{null, !297, !300, !300, !303}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !359, file: !267, line: 163)
!359 = !DISubprogram(name: "rand", scope: !205, file: !205, line: 453, type: !360, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DISubroutineType(types: !361)
!361 = !{!17}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !363, file: !267, line: 164)
!363 = !DISubprogram(name: "realloc", scope: !205, file: !205, line: 550, type: !364, flags: DIFlagPrototyped, spFlags: 0)
!364 = !DISubroutineType(types: !365)
!365 = !{!297, !297, !300}
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !367, file: !267, line: 165)
!367 = !DISubprogram(name: "srand", scope: !205, file: !205, line: 455, type: !368, flags: DIFlagPrototyped, spFlags: 0)
!368 = !DISubroutineType(types: !369)
!369 = !{null, !370}
!370 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !372, file: !267, line: 166)
!372 = !DISubprogram(name: "strtod", scope: !205, file: !205, line: 117, type: !373, flags: DIFlagPrototyped, spFlags: 0)
!373 = !DISubroutineType(types: !374)
!374 = !{!9, !349, !375}
!375 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !376)
!376 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !327, size: 64)
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !378, file: !267, line: 167)
!378 = !DISubprogram(name: "strtol", scope: !205, file: !205, line: 176, type: !379, flags: DIFlagPrototyped, spFlags: 0)
!379 = !DISubroutineType(types: !380)
!380 = !{!115, !349, !375, !17}
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !382, file: !267, line: 168)
!382 = !DISubprogram(name: "strtoul", scope: !205, file: !205, line: 180, type: !383, flags: DIFlagPrototyped, spFlags: 0)
!383 = !DISubroutineType(types: !384)
!384 = !{!302, !349, !375, !17}
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !386, file: !267, line: 169)
!386 = !DISubprogram(name: "system", scope: !205, file: !205, line: 784, type: !287, flags: DIFlagPrototyped, spFlags: 0)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !388, file: !267, line: 171)
!388 = !DISubprogram(name: "wcstombs", scope: !205, file: !205, line: 936, type: !389, flags: DIFlagPrototyped, spFlags: 0)
!389 = !DISubroutineType(types: !390)
!390 = !{!300, !391, !392, !300}
!391 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !327)
!392 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !393)
!393 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !394, size: 64)
!394 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !348)
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !396, file: !267, line: 172)
!396 = !DISubprogram(name: "wctomb", scope: !205, file: !205, line: 929, type: !397, flags: DIFlagPrototyped, spFlags: 0)
!397 = !DISubroutineType(types: !398)
!398 = !{!17, !327, !348}
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !400, entity: !401, file: !267, line: 200)
!400 = !DINamespace(name: "__gnu_cxx", scope: null)
!401 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !205, line: 80, baseType: !402)
!402 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !205, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !403, identifier: "_ZTS7lldiv_t")
!403 = !{!404, !405}
!404 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !402, file: !205, line: 78, baseType: !126, size: 64)
!405 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !402, file: !205, line: 79, baseType: !126, size: 64, offset: 64)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !400, entity: !407, file: !267, line: 206)
!407 = !DISubprogram(name: "_Exit", scope: !205, file: !205, line: 629, type: !317, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !400, entity: !409, file: !267, line: 210)
!409 = !DISubprogram(name: "llabs", scope: !205, file: !205, line: 844, type: !124, flags: DIFlagPrototyped, spFlags: 0)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !400, entity: !411, file: !267, line: 216)
!411 = !DISubprogram(name: "lldiv", scope: !205, file: !205, line: 858, type: !412, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DISubroutineType(types: !413)
!413 = !{!401, !126, !126}
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !400, entity: !415, file: !267, line: 227)
!415 = !DISubprogram(name: "atoll", scope: !205, file: !205, line: 112, type: !416, flags: DIFlagPrototyped, spFlags: 0)
!416 = !DISubroutineType(types: !417)
!417 = !{!126, !158}
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !400, entity: !419, file: !267, line: 228)
!419 = !DISubprogram(name: "strtoll", scope: !205, file: !205, line: 200, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!420 = !DISubroutineType(types: !421)
!421 = !{!126, !349, !375, !17}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !400, entity: !423, file: !267, line: 229)
!423 = !DISubprogram(name: "strtoull", scope: !205, file: !205, line: 205, type: !424, flags: DIFlagPrototyped, spFlags: 0)
!424 = !DISubroutineType(types: !425)
!425 = !{!426, !349, !375, !17}
!426 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !400, entity: !428, file: !267, line: 231)
!428 = !DISubprogram(name: "strtof", scope: !205, file: !205, line: 123, type: !429, flags: DIFlagPrototyped, spFlags: 0)
!429 = !DISubroutineType(types: !430)
!430 = !{!22, !349, !375}
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !400, entity: !432, file: !267, line: 232)
!432 = !DISubprogram(name: "strtold", scope: !205, file: !205, line: 126, type: !433, flags: DIFlagPrototyped, spFlags: 0)
!433 = !DISubroutineType(types: !434)
!434 = !{!435, !349, !375}
!435 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !401, file: !267, line: 240)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !407, file: !267, line: 242)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !409, file: !267, line: 244)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !440, file: !267, line: 245)
!440 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !400, file: !267, line: 213, type: !412, flags: DIFlagPrototyped, spFlags: 0)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !411, file: !267, line: 246)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !415, file: !267, line: 248)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !428, file: !267, line: 249)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !419, file: !267, line: 250)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !423, file: !267, line: 251)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !432, file: !267, line: 252)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !275, file: !448, line: 38)
!448 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/stdlib.h", directory: "")
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !279, file: !448, line: 39)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !316, file: !448, line: 40)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !265, file: !448, line: 51)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !269, file: !448, line: 52)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !454, file: !448, line: 54)
!454 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !12, file: !206, line: 79, type: !455, flags: DIFlagPrototyped, spFlags: 0)
!455 = !DISubroutineType(types: !456)
!456 = !{!435, !435}
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !284, file: !448, line: 55)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !286, file: !448, line: 56)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !290, file: !448, line: 57)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !294, file: !448, line: 58)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !308, file: !448, line: 59)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !440, file: !448, line: 60)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !320, file: !448, line: 61)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !324, file: !448, line: 62)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !329, file: !448, line: 63)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !331, file: !448, line: 64)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !335, file: !448, line: 65)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !339, file: !448, line: 67)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !343, file: !448, line: 68)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !351, file: !448, line: 69)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !355, file: !448, line: 71)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !359, file: !448, line: 72)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !363, file: !448, line: 73)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !367, file: !448, line: 74)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !372, file: !448, line: 75)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !378, file: !448, line: 76)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !382, file: !448, line: 77)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !386, file: !448, line: 78)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !388, file: !448, line: 80)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !396, file: !448, line: 81)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !482, file: !484, line: 414)
!482 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !483, file: !483, line: 1126, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!483 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "")
!484 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/__clang_cuda_cmath.h", directory: "/u/NAS_SCRATCH/yc0769")
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !486, file: !484, line: 415)
!486 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !483, file: !483, line: 1154, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !488, file: !484, line: 416)
!488 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !483, file: !483, line: 1121, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !490, file: !484, line: 417)
!490 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !483, file: !483, line: 1159, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !492, file: !484, line: 418)
!492 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !483, file: !483, line: 1111, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !494, file: !484, line: 419)
!494 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !483, file: !483, line: 1116, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !496, file: !484, line: 420)
!496 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !483, file: !483, line: 1164, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !498, file: !484, line: 421)
!498 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !483, file: !483, line: 1199, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !500, file: !484, line: 422)
!500 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !501, file: !501, line: 647, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!501 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "")
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !503, file: !484, line: 423)
!503 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !483, file: !483, line: 973, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !505, file: !484, line: 424)
!505 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !483, file: !483, line: 1027, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !507, file: !484, line: 425)
!507 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !483, file: !483, line: 1096, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !509, file: !484, line: 426)
!509 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !483, file: !483, line: 1259, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !511, file: !484, line: 427)
!511 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !483, file: !483, line: 1249, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !513, file: !484, line: 428)
!513 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !501, file: !501, line: 637, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !515, file: !484, line: 429)
!515 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !483, file: !483, line: 1078, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !517, file: !484, line: 430)
!517 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !483, file: !483, line: 1169, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !519, file: !484, line: 431)
!519 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !501, file: !501, line: 582, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !521, file: !484, line: 432)
!521 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !483, file: !483, line: 1385, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !523, file: !484, line: 433)
!523 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !501, file: !501, line: 572, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !525, file: !484, line: 434)
!525 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !483, file: !483, line: 1337, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !527, file: !484, line: 435)
!527 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !501, file: !501, line: 602, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !529, file: !484, line: 436)
!529 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !501, file: !501, line: 597, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !531, file: !484, line: 437)
!531 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !483, file: !483, line: 1322, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !533, file: !484, line: 438)
!533 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !483, file: !483, line: 1312, type: !79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !535, file: !484, line: 439)
!535 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !483, file: !483, line: 1174, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !537, file: !484, line: 440)
!537 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !483, file: !483, line: 1390, type: !75, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !539, file: !484, line: 441)
!539 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !483, file: !483, line: 1289, type: !118, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !541, file: !484, line: 442)
!541 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !483, file: !483, line: 1284, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !543, file: !484, line: 443)
!543 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !483, file: !483, line: 933, type: !129, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !545, file: !484, line: 444)
!545 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !483, file: !483, line: 1371, type: !129, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !547, file: !484, line: 445)
!547 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !483, file: !483, line: 1140, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !549, file: !484, line: 446)
!549 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !483, file: !483, line: 1149, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !551, file: !484, line: 447)
!551 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !483, file: !483, line: 1069, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !553, file: !484, line: 448)
!553 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !483, file: !483, line: 1395, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !555, file: !484, line: 449)
!555 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !483, file: !483, line: 1131, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !557, file: !484, line: 450)
!557 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !483, file: !483, line: 924, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !559, file: !484, line: 451)
!559 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !483, file: !483, line: 1376, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !561, file: !484, line: 452)
!561 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !483, file: !483, line: 1317, type: !151, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !563, file: !484, line: 453)
!563 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !483, file: !483, line: 938, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !565, file: !484, line: 454)
!565 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !483, file: !483, line: 1002, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !567, file: !484, line: 455)
!567 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !483, file: !483, line: 1352, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !569, file: !484, line: 456)
!569 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !483, file: !483, line: 1327, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !571, file: !484, line: 457)
!571 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !483, file: !483, line: 1332, type: !175, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !573, file: !484, line: 458)
!573 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !483, file: !483, line: 919, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !575, file: !484, line: 459)
!575 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !483, file: !483, line: 1366, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !577, file: !484, line: 462)
!577 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !483, file: !483, line: 1299, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !579, file: !484, line: 464)
!579 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !483, file: !483, line: 1294, type: !118, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !581, file: !484, line: 465)
!581 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !483, file: !483, line: 1018, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !583, file: !484, line: 466)
!583 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !483, file: !483, line: 1101, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !585, file: !484, line: 467)
!585 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !501, file: !501, line: 887, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !587, file: !484, line: 468)
!587 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !483, file: !483, line: 1060, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !589, file: !484, line: 469)
!589 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !483, file: !483, line: 1106, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !591, file: !484, line: 470)
!591 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !483, file: !483, line: 1361, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !593, file: !484, line: 471)
!593 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !501, file: !501, line: 642, type: !20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !454, file: !595, line: 38)
!595 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/math.h", directory: "")
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !597, file: !595, line: 54)
!597 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !12, file: !212, line: 380, type: !598, flags: DIFlagPrototyped, spFlags: 0)
!598 = !DISubroutineType(types: !599)
!599 = !{!435, !435, !600}
!600 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !435, size: 64)
!601 = !{void (i32, i32, i32, double*, double*, double*, double*, i32)* @_Z12kernel_splatiiiPdS_S_S_i, !"kernel", i32 1}
!602 = !{void (i32, i32, i32, double*, double*, double*, double*, i32)* @_Z9kernel_eyiiiPdS_S_S_i, !"kernel", i32 1}
!603 = !{void (i32, i32, i32, double*, double*, double*, double*, i32)* @_Z9kernel_exiiiPdS_S_S_i, !"kernel", i32 1}
!604 = !{void (i32, i32, i32, double*, double*, double*, double*, i32)* @_Z9kernel_hziiiPdS_S_S_i, !"kernel", i32 1}
!605 = !{null, !"align", i32 8}
!606 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!607 = !{null, !"align", i32 16}
!608 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!609 = !{!"clang version 9.0.0 (git@github.com:SusanTan/llvm-project.git a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)"}
!610 = !{i32 1, i32 2}
!611 = distinct !DISubprogram(name: "kernel_splat", linkageName: "_Z12kernel_splatiiiPdS_S_S_i", scope: !6, file: !6, line: 23, type: !612, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!612 = !DISubroutineType(types: !613)
!613 = !{null, !17, !17, !17, !251, !251, !251, !251, !17}
!614 = !DILocalVariable(name: "tmax", arg: 1, scope: !611, file: !6, line: 23, type: !17)
!615 = !DILocation(line: 23, column: 34, scope: !611)
!616 = !DILocalVariable(name: "nx", arg: 2, scope: !611, file: !6, line: 24, type: !17)
!617 = !DILocation(line: 24, column: 34, scope: !611)
!618 = !DILocalVariable(name: "ny", arg: 3, scope: !611, file: !6, line: 25, type: !17)
!619 = !DILocation(line: 25, column: 34, scope: !611)
!620 = !DILocalVariable(name: "ex", arg: 4, scope: !611, file: !6, line: 26, type: !251)
!621 = !DILocation(line: 26, column: 38, scope: !611)
!622 = !DILocalVariable(name: "ey", arg: 5, scope: !611, file: !6, line: 26, type: !251)
!623 = !DILocation(line: 26, column: 50, scope: !611)
!624 = !DILocalVariable(name: "hz", arg: 6, scope: !611, file: !6, line: 26, type: !251)
!625 = !DILocation(line: 26, column: 62, scope: !611)
!626 = !DILocalVariable(name: "fict", arg: 7, scope: !611, file: !6, line: 26, type: !251)
!627 = !DILocation(line: 26, column: 73, scope: !611)
!628 = !DILocalVariable(name: "t", arg: 8, scope: !611, file: !6, line: 26, type: !17)
!629 = !DILocation(line: 26, column: 85, scope: !611)
!630 = !DILocalVariable(name: "j", scope: !611, file: !6, line: 27, type: !17)
!631 = !DILocation(line: 27, column: 7, scope: !611)
!632 = !DILocation(line: 75, column: 3, scope: !633, inlinedAt: !684)
!633 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !635, file: !634, line: 75, type: !638, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !637, retainedNodes: !7)
!634 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/__clang_cuda_builtin_vars.h", directory: "/u/NAS_SCRATCH/yc0769")
!635 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockDim_t", file: !634, line: 74, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !636, identifier: "_ZTS25__cuda_builtin_blockDim_t")
!636 = !{!637, !640, !641, !642, !669, !673, !677, !680}
!637 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !635, file: !634, line: 75, type: !638, scopeLine: 75, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!638 = !DISubroutineType(types: !639)
!639 = !{!370}
!640 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !635, file: !634, line: 76, type: !638, scopeLine: 76, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!641 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_zEv", scope: !635, file: !634, line: 77, type: !638, scopeLine: 77, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!642 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__cuda_builtin_blockDim_tcv4dim3Ev", scope: !635, file: !634, line: 80, type: !643, scopeLine: 80, flags: DIFlagPrototyped, spFlags: 0)
!643 = !DISubroutineType(types: !644)
!644 = !{!645, !667}
!645 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !646, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !647, identifier: "_ZTS4dim3")
!646 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!647 = !{!648, !649, !650, !651, !655, !664}
!648 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !645, file: !646, line: 419, baseType: !370, size: 32)
!649 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !645, file: !646, line: 419, baseType: !370, size: 32, offset: 32)
!650 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !645, file: !646, line: 419, baseType: !370, size: 32, offset: 64)
!651 = !DISubprogram(name: "dim3", scope: !645, file: !646, line: 421, type: !652, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!652 = !DISubroutineType(types: !653)
!653 = !{null, !654, !370, !370, !370}
!654 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !645, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!655 = !DISubprogram(name: "dim3", scope: !645, file: !646, line: 422, type: !656, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!656 = !DISubroutineType(types: !657)
!657 = !{null, !654, !658}
!658 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !646, line: 383, baseType: !659)
!659 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !646, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !660, identifier: "_ZTS5uint3")
!660 = !{!661, !662, !663}
!661 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !659, file: !646, line: 192, baseType: !370, size: 32)
!662 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !659, file: !646, line: 192, baseType: !370, size: 32, offset: 32)
!663 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !659, file: !646, line: 192, baseType: !370, size: 32, offset: 64)
!664 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !645, file: !646, line: 423, type: !665, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!665 = !DISubroutineType(types: !666)
!666 = !{!658, !654}
!667 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !668, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!668 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !635)
!669 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !635, file: !634, line: 82, type: !670, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!670 = !DISubroutineType(types: !671)
!671 = !{null, !672}
!672 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !635, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!673 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !635, file: !634, line: 82, type: !674, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!674 = !DISubroutineType(types: !675)
!675 = !{null, !672, !676}
!676 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !668, size: 64)
!677 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockDim_taSERKS_", scope: !635, file: !634, line: 82, type: !678, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!678 = !DISubroutineType(types: !679)
!679 = !{null, !667, !676}
!680 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockDim_tadEv", scope: !635, file: !634, line: 82, type: !681, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!681 = !DISubroutineType(types: !682)
!682 = !{!683, !667}
!683 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !635, size: 64)
!684 = distinct !DILocation(line: 27, column: 11, scope: !611)
!685 = !{i32 1, i32 1025}
!686 = !DILocation(line: 64, column: 3, scope: !687, inlinedAt: !713)
!687 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !688, file: !634, line: 64, type: !638, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !690, retainedNodes: !7)
!688 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !634, line: 63, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !689, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!689 = !{!690, !691, !692, !693, !698, !702, !706, !709}
!690 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !688, file: !634, line: 64, type: !638, scopeLine: 64, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!691 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !688, file: !634, line: 65, type: !638, scopeLine: 65, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!692 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !688, file: !634, line: 66, type: !638, scopeLine: 66, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!693 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !688, file: !634, line: 69, type: !694, scopeLine: 69, flags: DIFlagPrototyped, spFlags: 0)
!694 = !DISubroutineType(types: !695)
!695 = !{!659, !696}
!696 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !697, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!697 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !688)
!698 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !688, file: !634, line: 71, type: !699, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!699 = !DISubroutineType(types: !700)
!700 = !{null, !701}
!701 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !688, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!702 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !688, file: !634, line: 71, type: !703, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!703 = !DISubroutineType(types: !704)
!704 = !{null, !701, !705}
!705 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !697, size: 64)
!706 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !688, file: !634, line: 71, type: !707, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!707 = !DISubroutineType(types: !708)
!708 = !{null, !696, !705}
!709 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !688, file: !634, line: 71, type: !710, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!710 = !DISubroutineType(types: !711)
!711 = !{!712, !696}
!712 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !688, size: 64)
!713 = distinct !DILocation(line: 27, column: 24, scope: !611)
!714 = !{i32 0, i32 65535}
!715 = !DILocation(line: 27, column: 22, scope: !611)
!716 = !DILocation(line: 53, column: 3, scope: !717, inlinedAt: !743)
!717 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !718, file: !634, line: 53, type: !638, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !720, retainedNodes: !7)
!718 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !634, line: 52, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !719, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!719 = !{!720, !721, !722, !723, !728, !732, !736, !739}
!720 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !718, file: !634, line: 53, type: !638, scopeLine: 53, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!721 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !718, file: !634, line: 54, type: !638, scopeLine: 54, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!722 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !718, file: !634, line: 55, type: !638, scopeLine: 55, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!723 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !718, file: !634, line: 58, type: !724, scopeLine: 58, flags: DIFlagPrototyped, spFlags: 0)
!724 = !DISubroutineType(types: !725)
!725 = !{!659, !726}
!726 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !727, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!727 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !718)
!728 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !718, file: !634, line: 60, type: !729, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!729 = !DISubroutineType(types: !730)
!730 = !{null, !731}
!731 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !718, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!732 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !718, file: !634, line: 60, type: !733, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!733 = !DISubroutineType(types: !734)
!734 = !{null, !731, !735}
!735 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !727, size: 64)
!736 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !718, file: !634, line: 60, type: !737, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!737 = !DISubroutineType(types: !738)
!738 = !{null, !726, !735}
!739 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !718, file: !634, line: 60, type: !740, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!740 = !DISubroutineType(types: !741)
!741 = !{!742, !726}
!742 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !718, size: 64)
!743 = distinct !DILocation(line: 27, column: 37, scope: !611)
!744 = !{i32 0, i32 1024}
!745 = !DILocation(line: 27, column: 35, scope: !611)
!746 = !DILocation(line: 29, column: 7, scope: !747)
!747 = distinct !DILexicalBlock(scope: !611, file: !6, line: 29, column: 7)
!748 = !DILocation(line: 29, column: 11, scope: !747)
!749 = !DILocation(line: 29, column: 9, scope: !747)
!750 = !DILocation(line: 29, column: 7, scope: !611)
!751 = !DILocation(line: 30, column: 22, scope: !747)
!752 = !DILocation(line: 30, column: 27, scope: !747)
!753 = !DILocation(line: 30, column: 5, scope: !747)
!754 = !DILocation(line: 30, column: 12, scope: !747)
!755 = !DILocation(line: 30, column: 10, scope: !747)
!756 = !DILocation(line: 30, column: 17, scope: !747)
!757 = !DILocation(line: 30, column: 15, scope: !747)
!758 = !DILocation(line: 30, column: 20, scope: !747)
!759 = !DILocation(line: 31, column: 1, scope: !611)
!760 = distinct !DISubprogram(name: "kernel_ey", linkageName: "_Z9kernel_eyiiiPdS_S_S_i", scope: !6, file: !6, line: 34, type: !612, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!761 = !DILocalVariable(name: "tmax", arg: 1, scope: !760, file: !6, line: 34, type: !17)
!762 = !DILocation(line: 34, column: 31, scope: !760)
!763 = !DILocalVariable(name: "nx", arg: 2, scope: !760, file: !6, line: 35, type: !17)
!764 = !DILocation(line: 35, column: 31, scope: !760)
!765 = !DILocalVariable(name: "ny", arg: 3, scope: !760, file: !6, line: 36, type: !17)
!766 = !DILocation(line: 36, column: 31, scope: !760)
!767 = !DILocalVariable(name: "ex", arg: 4, scope: !760, file: !6, line: 37, type: !251)
!768 = !DILocation(line: 37, column: 35, scope: !760)
!769 = !DILocalVariable(name: "ey", arg: 5, scope: !760, file: !6, line: 37, type: !251)
!770 = !DILocation(line: 37, column: 47, scope: !760)
!771 = !DILocalVariable(name: "hz", arg: 6, scope: !760, file: !6, line: 37, type: !251)
!772 = !DILocation(line: 37, column: 59, scope: !760)
!773 = !DILocalVariable(name: "fict", arg: 7, scope: !760, file: !6, line: 37, type: !251)
!774 = !DILocation(line: 37, column: 70, scope: !760)
!775 = !DILocalVariable(name: "t", arg: 8, scope: !760, file: !6, line: 37, type: !17)
!776 = !DILocation(line: 37, column: 82, scope: !760)
!777 = !DILocalVariable(name: "i", scope: !760, file: !6, line: 38, type: !17)
!778 = !DILocation(line: 38, column: 7, scope: !760)
!779 = !DILocation(line: 75, column: 3, scope: !633, inlinedAt: !780)
!780 = distinct !DILocation(line: 38, column: 11, scope: !760)
!781 = !DILocation(line: 64, column: 3, scope: !687, inlinedAt: !782)
!782 = distinct !DILocation(line: 38, column: 24, scope: !760)
!783 = !DILocation(line: 38, column: 22, scope: !760)
!784 = !DILocation(line: 53, column: 3, scope: !717, inlinedAt: !785)
!785 = distinct !DILocation(line: 38, column: 37, scope: !760)
!786 = !DILocation(line: 38, column: 35, scope: !760)
!787 = !DILocation(line: 38, column: 49, scope: !760)
!788 = !DILocalVariable(name: "j", scope: !760, file: !6, line: 39, type: !17)
!789 = !DILocation(line: 39, column: 7, scope: !760)
!790 = !DILocation(line: 76, column: 3, scope: !791, inlinedAt: !792)
!791 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !635, file: !634, line: 76, type: !638, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !640, retainedNodes: !7)
!792 = distinct !DILocation(line: 39, column: 11, scope: !760)
!793 = !DILocation(line: 65, column: 3, scope: !794, inlinedAt: !795)
!794 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !688, file: !634, line: 65, type: !638, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !691, retainedNodes: !7)
!795 = distinct !DILocation(line: 39, column: 24, scope: !760)
!796 = !DILocation(line: 39, column: 22, scope: !760)
!797 = !DILocation(line: 54, column: 3, scope: !798, inlinedAt: !799)
!798 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !718, file: !634, line: 54, type: !638, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !721, retainedNodes: !7)
!799 = distinct !DILocation(line: 39, column: 37, scope: !760)
!800 = !DILocation(line: 39, column: 35, scope: !760)
!801 = !DILocation(line: 41, column: 7, scope: !802)
!802 = distinct !DILexicalBlock(scope: !760, file: !6, line: 41, column: 7)
!803 = !DILocation(line: 41, column: 11, scope: !802)
!804 = !DILocation(line: 41, column: 9, scope: !802)
!805 = !DILocation(line: 41, column: 14, scope: !802)
!806 = !DILocation(line: 41, column: 17, scope: !802)
!807 = !DILocation(line: 41, column: 21, scope: !802)
!808 = !DILocation(line: 41, column: 19, scope: !802)
!809 = !DILocation(line: 41, column: 7, scope: !760)
!810 = !DILocation(line: 42, column: 40, scope: !802)
!811 = !DILocation(line: 42, column: 43, scope: !802)
!812 = !DILocation(line: 42, column: 47, scope: !802)
!813 = !DILocation(line: 42, column: 45, scope: !802)
!814 = !DILocation(line: 42, column: 52, scope: !802)
!815 = !DILocation(line: 42, column: 50, scope: !802)
!816 = !DILocation(line: 42, column: 57, scope: !802)
!817 = !DILocation(line: 42, column: 61, scope: !802)
!818 = !DILocation(line: 42, column: 63, scope: !802)
!819 = !DILocation(line: 42, column: 70, scope: !802)
!820 = !DILocation(line: 42, column: 68, scope: !802)
!821 = !DILocation(line: 42, column: 75, scope: !802)
!822 = !DILocation(line: 42, column: 73, scope: !802)
!823 = !DILocation(line: 42, column: 55, scope: !802)
!824 = !DILocation(line: 42, column: 37, scope: !802)
!825 = !DILocation(line: 42, column: 5, scope: !802)
!826 = !DILocation(line: 42, column: 8, scope: !802)
!827 = !DILocation(line: 42, column: 12, scope: !802)
!828 = !DILocation(line: 42, column: 10, scope: !802)
!829 = !DILocation(line: 42, column: 17, scope: !802)
!830 = !DILocation(line: 42, column: 15, scope: !802)
!831 = !DILocation(line: 42, column: 20, scope: !802)
!832 = !DILocation(line: 43, column: 1, scope: !760)
!833 = distinct !DISubprogram(name: "kernel_ex", linkageName: "_Z9kernel_exiiiPdS_S_S_i", scope: !6, file: !6, line: 47, type: !612, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!834 = !DILocalVariable(name: "tmax", arg: 1, scope: !833, file: !6, line: 47, type: !17)
!835 = !DILocation(line: 47, column: 31, scope: !833)
!836 = !DILocalVariable(name: "nx", arg: 2, scope: !833, file: !6, line: 48, type: !17)
!837 = !DILocation(line: 48, column: 31, scope: !833)
!838 = !DILocalVariable(name: "ny", arg: 3, scope: !833, file: !6, line: 49, type: !17)
!839 = !DILocation(line: 49, column: 31, scope: !833)
!840 = !DILocalVariable(name: "ex", arg: 4, scope: !833, file: !6, line: 50, type: !251)
!841 = !DILocation(line: 50, column: 35, scope: !833)
!842 = !DILocalVariable(name: "ey", arg: 5, scope: !833, file: !6, line: 50, type: !251)
!843 = !DILocation(line: 50, column: 47, scope: !833)
!844 = !DILocalVariable(name: "hz", arg: 6, scope: !833, file: !6, line: 50, type: !251)
!845 = !DILocation(line: 50, column: 59, scope: !833)
!846 = !DILocalVariable(name: "fict", arg: 7, scope: !833, file: !6, line: 50, type: !251)
!847 = !DILocation(line: 50, column: 70, scope: !833)
!848 = !DILocalVariable(name: "t", arg: 8, scope: !833, file: !6, line: 50, type: !17)
!849 = !DILocation(line: 50, column: 82, scope: !833)
!850 = !DILocalVariable(name: "i", scope: !833, file: !6, line: 51, type: !17)
!851 = !DILocation(line: 51, column: 7, scope: !833)
!852 = !DILocation(line: 75, column: 3, scope: !633, inlinedAt: !853)
!853 = distinct !DILocation(line: 51, column: 11, scope: !833)
!854 = !DILocation(line: 64, column: 3, scope: !687, inlinedAt: !855)
!855 = distinct !DILocation(line: 51, column: 24, scope: !833)
!856 = !DILocation(line: 51, column: 22, scope: !833)
!857 = !DILocation(line: 53, column: 3, scope: !717, inlinedAt: !858)
!858 = distinct !DILocation(line: 51, column: 37, scope: !833)
!859 = !DILocation(line: 51, column: 35, scope: !833)
!860 = !DILocalVariable(name: "j", scope: !833, file: !6, line: 52, type: !17)
!861 = !DILocation(line: 52, column: 7, scope: !833)
!862 = !DILocation(line: 76, column: 3, scope: !791, inlinedAt: !863)
!863 = distinct !DILocation(line: 52, column: 11, scope: !833)
!864 = !DILocation(line: 65, column: 3, scope: !794, inlinedAt: !865)
!865 = distinct !DILocation(line: 52, column: 24, scope: !833)
!866 = !DILocation(line: 52, column: 22, scope: !833)
!867 = !DILocation(line: 54, column: 3, scope: !798, inlinedAt: !868)
!868 = distinct !DILocation(line: 52, column: 37, scope: !833)
!869 = !DILocation(line: 52, column: 35, scope: !833)
!870 = !DILocation(line: 52, column: 49, scope: !833)
!871 = !DILocation(line: 54, column: 7, scope: !872)
!872 = distinct !DILexicalBlock(scope: !833, file: !6, line: 54, column: 7)
!873 = !DILocation(line: 54, column: 11, scope: !872)
!874 = !DILocation(line: 54, column: 9, scope: !872)
!875 = !DILocation(line: 54, column: 14, scope: !872)
!876 = !DILocation(line: 54, column: 17, scope: !872)
!877 = !DILocation(line: 54, column: 21, scope: !872)
!878 = !DILocation(line: 54, column: 19, scope: !872)
!879 = !DILocation(line: 54, column: 7, scope: !833)
!880 = !DILocation(line: 55, column: 40, scope: !872)
!881 = !DILocation(line: 55, column: 43, scope: !872)
!882 = !DILocation(line: 55, column: 47, scope: !872)
!883 = !DILocation(line: 55, column: 45, scope: !872)
!884 = !DILocation(line: 55, column: 52, scope: !872)
!885 = !DILocation(line: 55, column: 50, scope: !872)
!886 = !DILocation(line: 55, column: 57, scope: !872)
!887 = !DILocation(line: 55, column: 60, scope: !872)
!888 = !DILocation(line: 55, column: 64, scope: !872)
!889 = !DILocation(line: 55, column: 62, scope: !872)
!890 = !DILocation(line: 55, column: 69, scope: !872)
!891 = !DILocation(line: 55, column: 67, scope: !872)
!892 = !DILocation(line: 55, column: 71, scope: !872)
!893 = !DILocation(line: 55, column: 55, scope: !872)
!894 = !DILocation(line: 55, column: 37, scope: !872)
!895 = !DILocation(line: 55, column: 5, scope: !872)
!896 = !DILocation(line: 55, column: 8, scope: !872)
!897 = !DILocation(line: 55, column: 12, scope: !872)
!898 = !DILocation(line: 55, column: 10, scope: !872)
!899 = !DILocation(line: 55, column: 17, scope: !872)
!900 = !DILocation(line: 55, column: 15, scope: !872)
!901 = !DILocation(line: 55, column: 20, scope: !872)
!902 = !DILocation(line: 56, column: 1, scope: !833)
!903 = distinct !DISubprogram(name: "kernel_hz", linkageName: "_Z9kernel_hziiiPdS_S_S_i", scope: !6, file: !6, line: 60, type: !612, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!904 = !DILocalVariable(name: "tmax", arg: 1, scope: !903, file: !6, line: 60, type: !17)
!905 = !DILocation(line: 60, column: 31, scope: !903)
!906 = !DILocalVariable(name: "nx", arg: 2, scope: !903, file: !6, line: 61, type: !17)
!907 = !DILocation(line: 61, column: 31, scope: !903)
!908 = !DILocalVariable(name: "ny", arg: 3, scope: !903, file: !6, line: 62, type: !17)
!909 = !DILocation(line: 62, column: 31, scope: !903)
!910 = !DILocalVariable(name: "ex", arg: 4, scope: !903, file: !6, line: 63, type: !251)
!911 = !DILocation(line: 63, column: 35, scope: !903)
!912 = !DILocalVariable(name: "ey", arg: 5, scope: !903, file: !6, line: 63, type: !251)
!913 = !DILocation(line: 63, column: 47, scope: !903)
!914 = !DILocalVariable(name: "hz", arg: 6, scope: !903, file: !6, line: 63, type: !251)
!915 = !DILocation(line: 63, column: 59, scope: !903)
!916 = !DILocalVariable(name: "fict", arg: 7, scope: !903, file: !6, line: 63, type: !251)
!917 = !DILocation(line: 63, column: 70, scope: !903)
!918 = !DILocalVariable(name: "t", arg: 8, scope: !903, file: !6, line: 63, type: !17)
!919 = !DILocation(line: 63, column: 82, scope: !903)
!920 = !DILocalVariable(name: "i", scope: !903, file: !6, line: 64, type: !17)
!921 = !DILocation(line: 64, column: 7, scope: !903)
!922 = !DILocation(line: 75, column: 3, scope: !633, inlinedAt: !923)
!923 = distinct !DILocation(line: 64, column: 11, scope: !903)
!924 = !DILocation(line: 64, column: 3, scope: !687, inlinedAt: !925)
!925 = distinct !DILocation(line: 64, column: 24, scope: !903)
!926 = !DILocation(line: 64, column: 22, scope: !903)
!927 = !DILocation(line: 53, column: 3, scope: !717, inlinedAt: !928)
!928 = distinct !DILocation(line: 64, column: 37, scope: !903)
!929 = !DILocation(line: 64, column: 35, scope: !903)
!930 = !DILocalVariable(name: "j", scope: !903, file: !6, line: 65, type: !17)
!931 = !DILocation(line: 65, column: 7, scope: !903)
!932 = !DILocation(line: 76, column: 3, scope: !791, inlinedAt: !933)
!933 = distinct !DILocation(line: 65, column: 11, scope: !903)
!934 = !DILocation(line: 65, column: 3, scope: !794, inlinedAt: !935)
!935 = distinct !DILocation(line: 65, column: 24, scope: !903)
!936 = !DILocation(line: 65, column: 22, scope: !903)
!937 = !DILocation(line: 54, column: 3, scope: !798, inlinedAt: !938)
!938 = distinct !DILocation(line: 65, column: 37, scope: !903)
!939 = !DILocation(line: 65, column: 35, scope: !903)
!940 = !DILocation(line: 67, column: 7, scope: !941)
!941 = distinct !DILexicalBlock(scope: !903, file: !6, line: 67, column: 7)
!942 = !DILocation(line: 67, column: 11, scope: !941)
!943 = !DILocation(line: 67, column: 14, scope: !941)
!944 = !DILocation(line: 67, column: 9, scope: !941)
!945 = !DILocation(line: 67, column: 18, scope: !941)
!946 = !DILocation(line: 67, column: 21, scope: !941)
!947 = !DILocation(line: 67, column: 25, scope: !941)
!948 = !DILocation(line: 67, column: 28, scope: !941)
!949 = !DILocation(line: 67, column: 23, scope: !941)
!950 = !DILocation(line: 67, column: 7, scope: !903)
!951 = !DILocation(line: 68, column: 40, scope: !941)
!952 = !DILocation(line: 68, column: 43, scope: !941)
!953 = !DILocation(line: 68, column: 47, scope: !941)
!954 = !DILocation(line: 68, column: 45, scope: !941)
!955 = !DILocation(line: 68, column: 52, scope: !941)
!956 = !DILocation(line: 68, column: 50, scope: !941)
!957 = !DILocation(line: 68, column: 54, scope: !941)
!958 = !DILocation(line: 68, column: 61, scope: !941)
!959 = !DILocation(line: 68, column: 64, scope: !941)
!960 = !DILocation(line: 68, column: 68, scope: !941)
!961 = !DILocation(line: 68, column: 66, scope: !941)
!962 = !DILocation(line: 68, column: 73, scope: !941)
!963 = !DILocation(line: 68, column: 71, scope: !941)
!964 = !DILocation(line: 68, column: 59, scope: !941)
!965 = !DILocation(line: 68, column: 78, scope: !941)
!966 = !DILocation(line: 68, column: 82, scope: !941)
!967 = !DILocation(line: 68, column: 84, scope: !941)
!968 = !DILocation(line: 68, column: 91, scope: !941)
!969 = !DILocation(line: 68, column: 89, scope: !941)
!970 = !DILocation(line: 68, column: 96, scope: !941)
!971 = !DILocation(line: 68, column: 94, scope: !941)
!972 = !DILocation(line: 68, column: 76, scope: !941)
!973 = !DILocation(line: 68, column: 101, scope: !941)
!974 = !DILocation(line: 68, column: 104, scope: !941)
!975 = !DILocation(line: 68, column: 108, scope: !941)
!976 = !DILocation(line: 68, column: 106, scope: !941)
!977 = !DILocation(line: 68, column: 113, scope: !941)
!978 = !DILocation(line: 68, column: 111, scope: !941)
!979 = !DILocation(line: 68, column: 99, scope: !941)
!980 = !DILocation(line: 68, column: 37, scope: !941)
!981 = !DILocation(line: 68, column: 5, scope: !941)
!982 = !DILocation(line: 68, column: 8, scope: !941)
!983 = !DILocation(line: 68, column: 12, scope: !941)
!984 = !DILocation(line: 68, column: 10, scope: !941)
!985 = !DILocation(line: 68, column: 17, scope: !941)
!986 = !DILocation(line: 68, column: 15, scope: !941)
!987 = !DILocation(line: 68, column: 20, scope: !941)
!988 = !DILocation(line: 69, column: 1, scope: !903)
