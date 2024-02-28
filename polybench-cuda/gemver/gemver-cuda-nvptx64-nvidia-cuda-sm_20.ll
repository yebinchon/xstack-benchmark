; ModuleID = 'gemver.cu'
source_filename = "gemver.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z8kernel_AiddPdS_S_S_S_S_S_S_S_(i32 %n, double %alpha, double %beta, double* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 !dbg !610 {
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !613, metadata !DIExpression()), !dbg !614
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !615, metadata !DIExpression()), !dbg !616
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !617, metadata !DIExpression()), !dbg !618
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !619, metadata !DIExpression()), !dbg !620
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !621, metadata !DIExpression()), !dbg !622
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !623, metadata !DIExpression()), !dbg !624
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !625, metadata !DIExpression()), !dbg !626
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !627, metadata !DIExpression()), !dbg !628
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !629, metadata !DIExpression()), !dbg !630
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !631, metadata !DIExpression()), !dbg !632
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !633, metadata !DIExpression()), !dbg !634
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !635, metadata !DIExpression()), !dbg !636
  call void @llvm.dbg.declare(metadata i32* %i, metadata !637, metadata !DIExpression()), !dbg !638
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3, !dbg !639, !range !692
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !693, !range !721
  %mul = mul i32 %0, %1, !dbg !722
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !723, !range !751
  %add = add i32 %mul, %2, !dbg !752
  store i32 %add, i32* %i, align 4, !dbg !638
  call void @llvm.dbg.declare(metadata i32* %j, metadata !753, metadata !DIExpression()), !dbg !754
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #3, !dbg !755, !range !692
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !758, !range !721
  %mul5 = mul i32 %3, %4, !dbg !761
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !762, !range !751
  %add7 = add i32 %mul5, %5, !dbg !765
  store i32 %add7, i32* %j, align 4, !dbg !754
  %6 = load i32, i32* %i, align 4, !dbg !766
  %7 = load i32, i32* %n.addr, align 4, !dbg !768
  %cmp = icmp slt i32 %6, %7, !dbg !769
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !770

land.lhs.true:                                    ; preds = %entry
  %8 = load i32, i32* %j, align 4, !dbg !771
  %9 = load i32, i32* %n.addr, align 4, !dbg !772
  %cmp8 = icmp slt i32 %8, %9, !dbg !773
  br i1 %cmp8, label %if.then, label %if.end, !dbg !774

if.then:                                          ; preds = %land.lhs.true
  %10 = load double*, double** %u1.addr, align 8, !dbg !775
  %11 = load i32, i32* %i, align 4, !dbg !776
  %idxprom = sext i32 %11 to i64, !dbg !775
  %arrayidx = getelementptr inbounds double, double* %10, i64 %idxprom, !dbg !775
  %12 = load double, double* %arrayidx, align 8, !dbg !775
  %13 = load double*, double** %v1.addr, align 8, !dbg !777
  %14 = load i32, i32* %j, align 4, !dbg !778
  %idxprom9 = sext i32 %14 to i64, !dbg !777
  %arrayidx10 = getelementptr inbounds double, double* %13, i64 %idxprom9, !dbg !777
  %15 = load double, double* %arrayidx10, align 8, !dbg !777
  %mul11 = fmul contract double %12, %15, !dbg !779
  %16 = load double*, double** %u2.addr, align 8, !dbg !780
  %17 = load i32, i32* %i, align 4, !dbg !781
  %idxprom12 = sext i32 %17 to i64, !dbg !780
  %arrayidx13 = getelementptr inbounds double, double* %16, i64 %idxprom12, !dbg !780
  %18 = load double, double* %arrayidx13, align 8, !dbg !780
  %19 = load double*, double** %v2.addr, align 8, !dbg !782
  %20 = load i32, i32* %j, align 4, !dbg !783
  %idxprom14 = sext i32 %20 to i64, !dbg !782
  %arrayidx15 = getelementptr inbounds double, double* %19, i64 %idxprom14, !dbg !782
  %21 = load double, double* %arrayidx15, align 8, !dbg !782
  %mul16 = fmul contract double %18, %21, !dbg !784
  %add17 = fadd contract double %mul11, %mul16, !dbg !785
  %22 = load double*, double** %A.addr, align 8, !dbg !786
  %23 = load i32, i32* %i, align 4, !dbg !787
  %24 = load i32, i32* %n.addr, align 4, !dbg !788
  %mul18 = mul nsw i32 %23, %24, !dbg !789
  %25 = load i32, i32* %j, align 4, !dbg !790
  %add19 = add nsw i32 %mul18, %25, !dbg !791
  %idxprom20 = sext i32 %add19 to i64, !dbg !786
  %arrayidx21 = getelementptr inbounds double, double* %22, i64 %idxprom20, !dbg !786
  %26 = load double, double* %arrayidx21, align 8, !dbg !792
  %add22 = fadd contract double %26, %add17, !dbg !792
  store double %add22, double* %arrayidx21, align 8, !dbg !792
  br label %if.end, !dbg !786

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void, !dbg !793
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z8kernel_xiddPdS_S_S_S_S_S_S_S_(i32 %n, double %alpha, double %beta, double* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 !dbg !794 {
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !795, metadata !DIExpression()), !dbg !796
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !797, metadata !DIExpression()), !dbg !798
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !799, metadata !DIExpression()), !dbg !800
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !801, metadata !DIExpression()), !dbg !802
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !803, metadata !DIExpression()), !dbg !804
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !805, metadata !DIExpression()), !dbg !806
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !807, metadata !DIExpression()), !dbg !808
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !809, metadata !DIExpression()), !dbg !810
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !811, metadata !DIExpression()), !dbg !812
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !813, metadata !DIExpression()), !dbg !814
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !815, metadata !DIExpression()), !dbg !816
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !817, metadata !DIExpression()), !dbg !818
  call void @llvm.dbg.declare(metadata i32* %i, metadata !819, metadata !DIExpression()), !dbg !820
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3, !dbg !821, !range !692
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !823, !range !721
  %mul = mul i32 %0, %1, !dbg !825
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !826, !range !751
  %add = add i32 %mul, %2, !dbg !828
  store i32 %add, i32* %i, align 4, !dbg !820
  %3 = load i32, i32* %i, align 4, !dbg !829
  %4 = load i32, i32* %n.addr, align 4, !dbg !831
  %cmp = icmp slt i32 %3, %4, !dbg !832
  br i1 %cmp, label %if.then, label %if.end, !dbg !833

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %j, metadata !834, metadata !DIExpression()), !dbg !837
  store i32 0, i32* %j, align 4, !dbg !837
  br label %for.cond, !dbg !838

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %j, align 4, !dbg !839
  %6 = load i32, i32* %n.addr, align 4, !dbg !841
  %cmp3 = icmp slt i32 %5, %6, !dbg !842
  br i1 %cmp3, label %for.body, label %for.end, !dbg !843

for.body:                                         ; preds = %for.cond
  %7 = load double, double* %beta.addr, align 8, !dbg !844
  %8 = load double*, double** %A.addr, align 8, !dbg !845
  %9 = load i32, i32* %j, align 4, !dbg !846
  %10 = load i32, i32* %n.addr, align 4, !dbg !847
  %mul4 = mul nsw i32 %9, %10, !dbg !848
  %11 = load i32, i32* %i, align 4, !dbg !849
  %add5 = add nsw i32 %mul4, %11, !dbg !850
  %idxprom = sext i32 %add5 to i64, !dbg !845
  %arrayidx = getelementptr inbounds double, double* %8, i64 %idxprom, !dbg !845
  %12 = load double, double* %arrayidx, align 8, !dbg !845
  %mul6 = fmul contract double %7, %12, !dbg !851
  %13 = load double*, double** %y.addr, align 8, !dbg !852
  %14 = load i32, i32* %j, align 4, !dbg !853
  %idxprom7 = sext i32 %14 to i64, !dbg !852
  %arrayidx8 = getelementptr inbounds double, double* %13, i64 %idxprom7, !dbg !852
  %15 = load double, double* %arrayidx8, align 8, !dbg !852
  %mul9 = fmul contract double %mul6, %15, !dbg !854
  %16 = load double*, double** %x.addr, align 8, !dbg !855
  %17 = load i32, i32* %i, align 4, !dbg !856
  %idxprom10 = sext i32 %17 to i64, !dbg !855
  %arrayidx11 = getelementptr inbounds double, double* %16, i64 %idxprom10, !dbg !855
  %18 = load double, double* %arrayidx11, align 8, !dbg !857
  %add12 = fadd contract double %18, %mul9, !dbg !857
  store double %add12, double* %arrayidx11, align 8, !dbg !857
  br label %for.inc, !dbg !855

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %j, align 4, !dbg !858
  %inc = add nsw i32 %19, 1, !dbg !858
  store i32 %inc, i32* %j, align 4, !dbg !858
  br label %for.cond, !dbg !859, !llvm.loop !860

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !862

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !863
}

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z8kernel_yiddPdS_S_S_S_S_S_S_S_(i32 %n, double %alpha, double %beta, double* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 !dbg !864 {
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
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !865, metadata !DIExpression()), !dbg !866
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !867, metadata !DIExpression()), !dbg !868
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !869, metadata !DIExpression()), !dbg !870
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !871, metadata !DIExpression()), !dbg !872
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !873, metadata !DIExpression()), !dbg !874
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !875, metadata !DIExpression()), !dbg !876
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !877, metadata !DIExpression()), !dbg !878
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !879, metadata !DIExpression()), !dbg !880
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !881, metadata !DIExpression()), !dbg !882
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !883, metadata !DIExpression()), !dbg !884
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !885, metadata !DIExpression()), !dbg !886
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !887, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.declare(metadata i32* %i, metadata !889, metadata !DIExpression()), !dbg !890
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3, !dbg !891, !range !692
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !893, !range !721
  %mul = mul i32 %0, %1, !dbg !895
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !896, !range !751
  %add = add i32 %mul, %2, !dbg !898
  store i32 %add, i32* %i, align 4, !dbg !890
  %3 = load i32, i32* %i, align 4, !dbg !899
  %4 = load i32, i32* %n.addr, align 4, !dbg !901
  %cmp = icmp slt i32 %3, %4, !dbg !902
  br i1 %cmp, label %if.then, label %if.end, !dbg !903

if.then:                                          ; preds = %entry
  %5 = load double*, double** %z.addr, align 8, !dbg !904
  %6 = load i32, i32* %i, align 4, !dbg !905
  %idxprom = sext i32 %6 to i64, !dbg !904
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom, !dbg !904
  %7 = load double, double* %arrayidx, align 8, !dbg !904
  %8 = load double*, double** %x.addr, align 8, !dbg !906
  %9 = load i32, i32* %i, align 4, !dbg !907
  %idxprom3 = sext i32 %9 to i64, !dbg !906
  %arrayidx4 = getelementptr inbounds double, double* %8, i64 %idxprom3, !dbg !906
  %10 = load double, double* %arrayidx4, align 8, !dbg !908
  %add5 = fadd contract double %10, %7, !dbg !908
  store double %add5, double* %arrayidx4, align 8, !dbg !908
  br label %if.end, !dbg !906

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !909
}

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z8kernel_widdPdS_S_S_S_S_S_S_S_(i32 %n, double %alpha, double %beta, double* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 !dbg !910 {
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !911, metadata !DIExpression()), !dbg !912
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !913, metadata !DIExpression()), !dbg !914
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !915, metadata !DIExpression()), !dbg !916
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !917, metadata !DIExpression()), !dbg !918
  store double* %u1, double** %u1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u1.addr, metadata !919, metadata !DIExpression()), !dbg !920
  store double* %v1, double** %v1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v1.addr, metadata !921, metadata !DIExpression()), !dbg !922
  store double* %u2, double** %u2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %u2.addr, metadata !923, metadata !DIExpression()), !dbg !924
  store double* %v2, double** %v2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v2.addr, metadata !925, metadata !DIExpression()), !dbg !926
  store double* %w, double** %w.addr, align 8
  call void @llvm.dbg.declare(metadata double** %w.addr, metadata !927, metadata !DIExpression()), !dbg !928
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !929, metadata !DIExpression()), !dbg !930
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !931, metadata !DIExpression()), !dbg !932
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !933, metadata !DIExpression()), !dbg !934
  call void @llvm.dbg.declare(metadata i32* %i, metadata !935, metadata !DIExpression()), !dbg !936
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3, !dbg !937, !range !692
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !939, !range !721
  %mul = mul i32 %0, %1, !dbg !941
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !942, !range !751
  %add = add i32 %mul, %2, !dbg !944
  store i32 %add, i32* %i, align 4, !dbg !936
  %3 = load i32, i32* %i, align 4, !dbg !945
  %4 = load i32, i32* %n.addr, align 4, !dbg !947
  %cmp = icmp slt i32 %3, %4, !dbg !948
  br i1 %cmp, label %if.then, label %if.end, !dbg !949

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %j, metadata !950, metadata !DIExpression()), !dbg !953
  store i32 0, i32* %j, align 4, !dbg !953
  br label %for.cond, !dbg !954

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %j, align 4, !dbg !955
  %6 = load i32, i32* %n.addr, align 4, !dbg !957
  %cmp3 = icmp slt i32 %5, %6, !dbg !958
  br i1 %cmp3, label %for.body, label %for.end, !dbg !959

for.body:                                         ; preds = %for.cond
  %7 = load double, double* %alpha.addr, align 8, !dbg !960
  %8 = load double*, double** %A.addr, align 8, !dbg !961
  %9 = load i32, i32* %i, align 4, !dbg !962
  %10 = load i32, i32* %n.addr, align 4, !dbg !963
  %mul4 = mul nsw i32 %9, %10, !dbg !964
  %11 = load i32, i32* %j, align 4, !dbg !965
  %add5 = add nsw i32 %mul4, %11, !dbg !966
  %idxprom = sext i32 %add5 to i64, !dbg !961
  %arrayidx = getelementptr inbounds double, double* %8, i64 %idxprom, !dbg !961
  %12 = load double, double* %arrayidx, align 8, !dbg !961
  %mul6 = fmul contract double %7, %12, !dbg !967
  %13 = load double*, double** %x.addr, align 8, !dbg !968
  %14 = load i32, i32* %j, align 4, !dbg !969
  %idxprom7 = sext i32 %14 to i64, !dbg !968
  %arrayidx8 = getelementptr inbounds double, double* %13, i64 %idxprom7, !dbg !968
  %15 = load double, double* %arrayidx8, align 8, !dbg !968
  %mul9 = fmul contract double %mul6, %15, !dbg !970
  %16 = load double*, double** %w.addr, align 8, !dbg !971
  %17 = load i32, i32* %i, align 4, !dbg !972
  %idxprom10 = sext i32 %17 to i64, !dbg !971
  %arrayidx11 = getelementptr inbounds double, double* %16, i64 %idxprom10, !dbg !971
  %18 = load double, double* %arrayidx11, align 8, !dbg !973
  %add12 = fadd contract double %18, %mul9, !dbg !973
  store double %add12, double* %arrayidx11, align 8, !dbg !973
  br label %for.inc, !dbg !971

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %j, align 4, !dbg !974
  %inc = add nsw i32 %19, 1, !dbg !974
  store i32 %inc, i32* %j, align 4, !dbg !974
  br label %for.cond, !dbg !975, !llvm.loop !976

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !978

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !979
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
!nvvm.annotations = !{!600, !601, !602, !603, !604, !605, !604, !606, !606, !606, !606, !607, !607, !606}
!llvm.ident = !{!608}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!609}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 7, i32 0]}
!1 = !{i32 2, !"Dwarf Version", i32 2}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !6, producer: "clang version 9.0.0 (git@github.com:SusanTan/llvm-project.git a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !7, imports: !8, nameTableKind: None)
!6 = !DIFile(filename: "gemver.cu", directory: "/u/NAS_SCRATCH/yc0769/xstack-benchmark/polybench-cuda/gemver")
!7 = !{}
!8 = !{!9, !16, !21, !23, !25, !27, !29, !33, !35, !37, !39, !41, !43, !45, !47, !49, !51, !53, !55, !57, !59, !61, !65, !67, !69, !71, !75, !80, !82, !84, !89, !93, !95, !97, !99, !101, !103, !105, !107, !109, !114, !118, !120, !125, !129, !131, !133, !135, !137, !139, !143, !145, !147, !152, !160, !164, !166, !168, !170, !172, !176, !178, !180, !184, !186, !188, !190, !192, !194, !196, !198, !200, !202, !206, !212, !214, !216, !220, !222, !224, !226, !228, !230, !232, !234, !238, !242, !244, !246, !251, !253, !255, !257, !259, !261, !263, !267, !273, !277, !282, !284, !288, !292, !306, !310, !314, !318, !322, !327, !329, !333, !337, !341, !349, !353, !357, !361, !365, !370, !376, !380, !384, !386, !394, !398, !405, !407, !409, !413, !417, !421, !426, !430, !435, !436, !437, !438, !440, !441, !442, !443, !444, !445, !446, !448, !449, !450, !451, !452, !456, !457, !458, !459, !460, !461, !462, !463, !464, !465, !466, !467, !468, !469, !470, !471, !472, !473, !474, !475, !476, !477, !478, !479, !480, !484, !486, !488, !490, !492, !494, !496, !498, !501, !503, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !543, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !579, !581, !583, !585, !587, !589, !591, !593, !595}
!9 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !11, file: !12, line: 223)
!10 = !DINamespace(name: "std", scope: null)
!11 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !12, file: !12, line: 53, type: !13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!12 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/u/NAS_SCRATCH/yc0769")
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !17, file: !12, line: 224)
!17 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !12, file: !12, line: 55, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !20}
!20 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!21 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !22, file: !12, line: 225)
!22 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !12, file: !12, line: 57, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!23 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !24, file: !12, line: 226)
!24 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !12, file: !12, line: 59, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!25 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !26, file: !12, line: 227)
!26 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !12, file: !12, line: 61, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!27 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !28, file: !12, line: 228)
!28 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !12, file: !12, line: 65, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !30, file: !12, line: 229)
!30 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !12, file: !12, line: 63, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!31 = !DISubroutineType(types: !32)
!32 = !{!20, !20, !20}
!33 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !34, file: !12, line: 230)
!34 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !12, file: !12, line: 67, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !36, file: !12, line: 231)
!36 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !12, file: !12, line: 69, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !38, file: !12, line: 232)
!38 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !12, file: !12, line: 71, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !40, file: !12, line: 233)
!40 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !12, file: !12, line: 73, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !42, file: !12, line: 234)
!42 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !12, file: !12, line: 75, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !44, file: !12, line: 235)
!44 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !12, file: !12, line: 77, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !46, file: !12, line: 236)
!46 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !12, file: !12, line: 81, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !48, file: !12, line: 237)
!48 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !12, file: !12, line: 79, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !50, file: !12, line: 238)
!50 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !12, file: !12, line: 85, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !52, file: !12, line: 239)
!52 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !12, file: !12, line: 83, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !54, file: !12, line: 240)
!54 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !12, file: !12, line: 87, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !56, file: !12, line: 241)
!56 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !12, file: !12, line: 89, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !58, file: !12, line: 242)
!58 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !12, file: !12, line: 91, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !60, file: !12, line: 243)
!60 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !12, file: !12, line: 93, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !62, file: !12, line: 244)
!62 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !12, file: !12, line: 95, type: !63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!63 = !DISubroutineType(types: !64)
!64 = !{!20, !20, !20, !20}
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !66, file: !12, line: 245)
!66 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !12, file: !12, line: 97, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !68, file: !12, line: 246)
!68 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !12, file: !12, line: 99, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !70, file: !12, line: 247)
!70 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !12, file: !12, line: 101, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !72, file: !12, line: 248)
!72 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !12, file: !12, line: 103, type: !73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!73 = !DISubroutineType(types: !74)
!74 = !{!15, !20}
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !76, file: !12, line: 249)
!76 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !12, file: !12, line: 105, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!77 = !DISubroutineType(types: !78)
!78 = !{!20, !20, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !81, file: !12, line: 250)
!81 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !12, file: !12, line: 107, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !83, file: !12, line: 251)
!83 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !12, file: !12, line: 109, type: !73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !85, file: !12, line: 252)
!85 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !12, file: !12, line: 114, type: !86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !20}
!88 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !90, file: !12, line: 253)
!90 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !12, file: !12, line: 118, type: !91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!91 = !DISubroutineType(types: !92)
!92 = !{!88, !20, !20}
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !94, file: !12, line: 254)
!94 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !12, file: !12, line: 117, type: !91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !96, file: !12, line: 255)
!96 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !12, file: !12, line: 123, type: !86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !98, file: !12, line: 256)
!98 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !12, file: !12, line: 127, type: !91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !100, file: !12, line: 257)
!100 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !12, file: !12, line: 126, type: !91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !102, file: !12, line: 258)
!102 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !12, file: !12, line: 129, type: !91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !104, file: !12, line: 259)
!104 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !12, file: !12, line: 134, type: !86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !106, file: !12, line: 260)
!106 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !12, file: !12, line: 136, type: !86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !108, file: !12, line: 261)
!108 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !12, file: !12, line: 138, type: !91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !110, file: !12, line: 262)
!110 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !12, file: !12, line: 139, type: !111, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!111 = !DISubroutineType(types: !112)
!112 = !{!113, !113}
!113 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !115, file: !12, line: 263)
!115 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !12, file: !12, line: 141, type: !116, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!116 = !DISubroutineType(types: !117)
!117 = !{!20, !20, !15}
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !119, file: !12, line: 264)
!119 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !12, file: !12, line: 143, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !121, file: !12, line: 265)
!121 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !12, file: !12, line: 144, type: !122, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!122 = !DISubroutineType(types: !123)
!123 = !{!124, !124}
!124 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !126, file: !12, line: 266)
!126 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !12, file: !12, line: 146, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!127 = !DISubroutineType(types: !128)
!128 = !{!124, !20}
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !130, file: !12, line: 267)
!130 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !12, file: !12, line: 159, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !132, file: !12, line: 268)
!132 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !12, file: !12, line: 148, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !134, file: !12, line: 269)
!134 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !12, file: !12, line: 150, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !136, file: !12, line: 270)
!136 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !12, file: !12, line: 152, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !138, file: !12, line: 271)
!138 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !12, file: !12, line: 154, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !140, file: !12, line: 272)
!140 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !12, file: !12, line: 161, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!141 = !DISubroutineType(types: !142)
!142 = !{!113, !20}
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !144, file: !12, line: 273)
!144 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !12, file: !12, line: 163, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !146, file: !12, line: 274)
!146 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !12, file: !12, line: 164, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !148, file: !12, line: 275)
!148 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !12, file: !12, line: 166, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!149 = !DISubroutineType(types: !150)
!150 = !{!20, !20, !151}
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !153, file: !12, line: 276)
!153 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !12, file: !12, line: 167, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!154 = !DISubroutineType(types: !155)
!155 = !{!156, !157}
!156 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !159)
!159 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !161, file: !12, line: 277)
!161 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !12, file: !12, line: 168, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!162 = !DISubroutineType(types: !163)
!163 = !{!20, !157}
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !165, file: !12, line: 278)
!165 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !12, file: !12, line: 170, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !167, file: !12, line: 279)
!167 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !12, file: !12, line: 172, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !169, file: !12, line: 280)
!169 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !12, file: !12, line: 176, type: !116, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !171, file: !12, line: 281)
!171 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !12, file: !12, line: 178, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !173, file: !12, line: 282)
!173 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !12, file: !12, line: 180, type: !174, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!174 = !DISubroutineType(types: !175)
!175 = !{!20, !20, !20, !79}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !177, file: !12, line: 283)
!177 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !12, file: !12, line: 182, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !179, file: !12, line: 284)
!179 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !12, file: !12, line: 184, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !181, file: !12, line: 285)
!181 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !12, file: !12, line: 186, type: !182, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!182 = !DISubroutineType(types: !183)
!183 = !{!20, !20, !113}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !185, file: !12, line: 286)
!185 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !12, file: !12, line: 188, type: !116, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !187, file: !12, line: 287)
!187 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !12, file: !12, line: 190, type: !86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !189, file: !12, line: 288)
!189 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !12, file: !12, line: 192, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !191, file: !12, line: 289)
!191 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !12, file: !12, line: 194, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !193, file: !12, line: 290)
!193 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !12, file: !12, line: 196, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !195, file: !12, line: 291)
!195 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !12, file: !12, line: 198, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !197, file: !12, line: 292)
!197 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !12, file: !12, line: 200, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !199, file: !12, line: 293)
!199 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !12, file: !12, line: 202, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !201, file: !12, line: 294)
!201 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !12, file: !12, line: 204, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !203, file: !205, line: 52)
!203 = !DISubprogram(name: "abs", scope: !204, file: !204, line: 840, type: !13, flags: DIFlagPrototyped, spFlags: 0)
!204 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!205 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/std_abs.h", directory: "")
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !207, file: !211, line: 83)
!207 = !DISubprogram(name: "acos", scope: !208, file: !208, line: 53, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!208 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!209 = !DISubroutineType(types: !210)
!210 = !{!156, !156}
!211 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cmath", directory: "")
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !213, file: !211, line: 102)
!213 = !DISubprogram(name: "asin", scope: !208, file: !208, line: 55, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !215, file: !211, line: 121)
!215 = !DISubprogram(name: "atan", scope: !208, file: !208, line: 57, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !217, file: !211, line: 140)
!217 = !DISubprogram(name: "atan2", scope: !208, file: !208, line: 59, type: !218, flags: DIFlagPrototyped, spFlags: 0)
!218 = !DISubroutineType(types: !219)
!219 = !{!156, !156, !156}
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !221, file: !211, line: 161)
!221 = !DISubprogram(name: "ceil", scope: !208, file: !208, line: 159, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !223, file: !211, line: 180)
!223 = !DISubprogram(name: "cos", scope: !208, file: !208, line: 62, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !225, file: !211, line: 199)
!225 = !DISubprogram(name: "cosh", scope: !208, file: !208, line: 71, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !227, file: !211, line: 218)
!227 = !DISubprogram(name: "exp", scope: !208, file: !208, line: 95, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !229, file: !211, line: 237)
!229 = !DISubprogram(name: "fabs", scope: !208, file: !208, line: 162, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !231, file: !211, line: 256)
!231 = !DISubprogram(name: "floor", scope: !208, file: !208, line: 165, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !233, file: !211, line: 275)
!233 = !DISubprogram(name: "fmod", scope: !208, file: !208, line: 168, type: !218, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !235, file: !211, line: 296)
!235 = !DISubprogram(name: "frexp", scope: !208, file: !208, line: 98, type: !236, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DISubroutineType(types: !237)
!237 = !{!156, !156, !79}
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !239, file: !211, line: 315)
!239 = !DISubprogram(name: "ldexp", scope: !208, file: !208, line: 101, type: !240, flags: DIFlagPrototyped, spFlags: 0)
!240 = !DISubroutineType(types: !241)
!241 = !{!156, !156, !15}
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !243, file: !211, line: 334)
!243 = !DISubprogram(name: "log", scope: !208, file: !208, line: 104, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !245, file: !211, line: 353)
!245 = !DISubprogram(name: "log10", scope: !208, file: !208, line: 107, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !247, file: !211, line: 372)
!247 = !DISubprogram(name: "modf", scope: !208, file: !208, line: 110, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!248 = !DISubroutineType(types: !249)
!249 = !{!156, !156, !250}
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !156, size: 64)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !252, file: !211, line: 384)
!252 = !DISubprogram(name: "pow", scope: !208, file: !208, line: 140, type: !218, flags: DIFlagPrototyped, spFlags: 0)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !254, file: !211, line: 421)
!254 = !DISubprogram(name: "sin", scope: !208, file: !208, line: 64, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !256, file: !211, line: 440)
!256 = !DISubprogram(name: "sinh", scope: !208, file: !208, line: 73, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !258, file: !211, line: 459)
!258 = !DISubprogram(name: "sqrt", scope: !208, file: !208, line: 143, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !260, file: !211, line: 478)
!260 = !DISubprogram(name: "tan", scope: !208, file: !208, line: 66, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !262, file: !211, line: 497)
!262 = !DISubprogram(name: "tanh", scope: !208, file: !208, line: 75, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !264, file: !266, line: 127)
!264 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !204, line: 62, baseType: !265)
!265 = !DICompositeType(tag: DW_TAG_structure_type, file: !204, line: 58, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!266 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdlib", directory: "")
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !268, file: !266, line: 128)
!268 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !204, line: 70, baseType: !269)
!269 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !204, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !270, identifier: "_ZTS6ldiv_t")
!270 = !{!271, !272}
!271 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !269, file: !204, line: 68, baseType: !113, size: 64)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !269, file: !204, line: 69, baseType: !113, size: 64, offset: 64)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !274, file: !266, line: 130)
!274 = !DISubprogram(name: "abort", scope: !204, file: !204, line: 591, type: !275, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!275 = !DISubroutineType(types: !276)
!276 = !{null}
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !278, file: !266, line: 134)
!278 = !DISubprogram(name: "atexit", scope: !204, file: !204, line: 595, type: !279, flags: DIFlagPrototyped, spFlags: 0)
!279 = !DISubroutineType(types: !280)
!280 = !{!15, !281}
!281 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !275, size: 64)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !283, file: !266, line: 140)
!283 = !DISubprogram(name: "atof", scope: !204, file: !204, line: 101, type: !154, flags: DIFlagPrototyped, spFlags: 0)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !285, file: !266, line: 141)
!285 = !DISubprogram(name: "atoi", scope: !204, file: !204, line: 104, type: !286, flags: DIFlagPrototyped, spFlags: 0)
!286 = !DISubroutineType(types: !287)
!287 = !{!15, !157}
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !289, file: !266, line: 142)
!289 = !DISubprogram(name: "atol", scope: !204, file: !204, line: 107, type: !290, flags: DIFlagPrototyped, spFlags: 0)
!290 = !DISubroutineType(types: !291)
!291 = !{!113, !157}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !293, file: !266, line: 143)
!293 = !DISubprogram(name: "bsearch", scope: !204, file: !204, line: 820, type: !294, flags: DIFlagPrototyped, spFlags: 0)
!294 = !DISubroutineType(types: !295)
!295 = !{!296, !297, !297, !299, !299, !302}
!296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !298, size: 64)
!298 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!299 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !300, line: 46, baseType: !301)
!300 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/stddef.h", directory: "/u/NAS_SCRATCH/yc0769")
!301 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!302 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !204, line: 808, baseType: !303)
!303 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !304, size: 64)
!304 = !DISubroutineType(types: !305)
!305 = !{!15, !297, !297}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !307, file: !266, line: 144)
!307 = !DISubprogram(name: "calloc", scope: !204, file: !204, line: 542, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DISubroutineType(types: !309)
!309 = !{!296, !299, !299}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !311, file: !266, line: 145)
!311 = !DISubprogram(name: "div", scope: !204, file: !204, line: 852, type: !312, flags: DIFlagPrototyped, spFlags: 0)
!312 = !DISubroutineType(types: !313)
!313 = !{!264, !15, !15}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !315, file: !266, line: 146)
!315 = !DISubprogram(name: "exit", scope: !204, file: !204, line: 617, type: !316, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!316 = !DISubroutineType(types: !317)
!317 = !{null, !15}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !319, file: !266, line: 147)
!319 = !DISubprogram(name: "free", scope: !204, file: !204, line: 565, type: !320, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DISubroutineType(types: !321)
!321 = !{null, !296}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !323, file: !266, line: 148)
!323 = !DISubprogram(name: "getenv", scope: !204, file: !204, line: 634, type: !324, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DISubroutineType(types: !325)
!325 = !{!326, !157}
!326 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !328, file: !266, line: 149)
!328 = !DISubprogram(name: "labs", scope: !204, file: !204, line: 841, type: !111, flags: DIFlagPrototyped, spFlags: 0)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !330, file: !266, line: 150)
!330 = !DISubprogram(name: "ldiv", scope: !204, file: !204, line: 854, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!331 = !DISubroutineType(types: !332)
!332 = !{!268, !113, !113}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !334, file: !266, line: 151)
!334 = !DISubprogram(name: "malloc", scope: !204, file: !204, line: 539, type: !335, flags: DIFlagPrototyped, spFlags: 0)
!335 = !DISubroutineType(types: !336)
!336 = !{!296, !299}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !338, file: !266, line: 153)
!338 = !DISubprogram(name: "mblen", scope: !204, file: !204, line: 922, type: !339, flags: DIFlagPrototyped, spFlags: 0)
!339 = !DISubroutineType(types: !340)
!340 = !{!15, !157, !299}
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !342, file: !266, line: 154)
!342 = !DISubprogram(name: "mbstowcs", scope: !204, file: !204, line: 933, type: !343, flags: DIFlagPrototyped, spFlags: 0)
!343 = !DISubroutineType(types: !344)
!344 = !{!299, !345, !348, !299}
!345 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !346)
!346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !347, size: 64)
!347 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!348 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !157)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !350, file: !266, line: 155)
!350 = !DISubprogram(name: "mbtowc", scope: !204, file: !204, line: 925, type: !351, flags: DIFlagPrototyped, spFlags: 0)
!351 = !DISubroutineType(types: !352)
!352 = !{!15, !345, !348, !299}
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !354, file: !266, line: 157)
!354 = !DISubprogram(name: "qsort", scope: !204, file: !204, line: 830, type: !355, flags: DIFlagPrototyped, spFlags: 0)
!355 = !DISubroutineType(types: !356)
!356 = !{null, !296, !299, !299, !302}
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !358, file: !266, line: 163)
!358 = !DISubprogram(name: "rand", scope: !204, file: !204, line: 453, type: !359, flags: DIFlagPrototyped, spFlags: 0)
!359 = !DISubroutineType(types: !360)
!360 = !{!15}
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !362, file: !266, line: 164)
!362 = !DISubprogram(name: "realloc", scope: !204, file: !204, line: 550, type: !363, flags: DIFlagPrototyped, spFlags: 0)
!363 = !DISubroutineType(types: !364)
!364 = !{!296, !296, !299}
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !366, file: !266, line: 165)
!366 = !DISubprogram(name: "srand", scope: !204, file: !204, line: 455, type: !367, flags: DIFlagPrototyped, spFlags: 0)
!367 = !DISubroutineType(types: !368)
!368 = !{null, !369}
!369 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !371, file: !266, line: 166)
!371 = !DISubprogram(name: "strtod", scope: !204, file: !204, line: 117, type: !372, flags: DIFlagPrototyped, spFlags: 0)
!372 = !DISubroutineType(types: !373)
!373 = !{!156, !348, !374}
!374 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !375)
!375 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !326, size: 64)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !377, file: !266, line: 167)
!377 = !DISubprogram(name: "strtol", scope: !204, file: !204, line: 176, type: !378, flags: DIFlagPrototyped, spFlags: 0)
!378 = !DISubroutineType(types: !379)
!379 = !{!113, !348, !374, !15}
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !381, file: !266, line: 168)
!381 = !DISubprogram(name: "strtoul", scope: !204, file: !204, line: 180, type: !382, flags: DIFlagPrototyped, spFlags: 0)
!382 = !DISubroutineType(types: !383)
!383 = !{!301, !348, !374, !15}
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !385, file: !266, line: 169)
!385 = !DISubprogram(name: "system", scope: !204, file: !204, line: 784, type: !286, flags: DIFlagPrototyped, spFlags: 0)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !387, file: !266, line: 171)
!387 = !DISubprogram(name: "wcstombs", scope: !204, file: !204, line: 936, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!388 = !DISubroutineType(types: !389)
!389 = !{!299, !390, !391, !299}
!390 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !326)
!391 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !392)
!392 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !393, size: 64)
!393 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !347)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !395, file: !266, line: 172)
!395 = !DISubprogram(name: "wctomb", scope: !204, file: !204, line: 929, type: !396, flags: DIFlagPrototyped, spFlags: 0)
!396 = !DISubroutineType(types: !397)
!397 = !{!15, !326, !347}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !399, entity: !400, file: !266, line: 200)
!399 = !DINamespace(name: "__gnu_cxx", scope: null)
!400 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !204, line: 80, baseType: !401)
!401 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !204, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !402, identifier: "_ZTS7lldiv_t")
!402 = !{!403, !404}
!403 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !401, file: !204, line: 78, baseType: !124, size: 64)
!404 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !401, file: !204, line: 79, baseType: !124, size: 64, offset: 64)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !399, entity: !406, file: !266, line: 206)
!406 = !DISubprogram(name: "_Exit", scope: !204, file: !204, line: 629, type: !316, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !399, entity: !408, file: !266, line: 210)
!408 = !DISubprogram(name: "llabs", scope: !204, file: !204, line: 844, type: !122, flags: DIFlagPrototyped, spFlags: 0)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !399, entity: !410, file: !266, line: 216)
!410 = !DISubprogram(name: "lldiv", scope: !204, file: !204, line: 858, type: !411, flags: DIFlagPrototyped, spFlags: 0)
!411 = !DISubroutineType(types: !412)
!412 = !{!400, !124, !124}
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !399, entity: !414, file: !266, line: 227)
!414 = !DISubprogram(name: "atoll", scope: !204, file: !204, line: 112, type: !415, flags: DIFlagPrototyped, spFlags: 0)
!415 = !DISubroutineType(types: !416)
!416 = !{!124, !157}
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !399, entity: !418, file: !266, line: 228)
!418 = !DISubprogram(name: "strtoll", scope: !204, file: !204, line: 200, type: !419, flags: DIFlagPrototyped, spFlags: 0)
!419 = !DISubroutineType(types: !420)
!420 = !{!124, !348, !374, !15}
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !399, entity: !422, file: !266, line: 229)
!422 = !DISubprogram(name: "strtoull", scope: !204, file: !204, line: 205, type: !423, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DISubroutineType(types: !424)
!424 = !{!425, !348, !374, !15}
!425 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !399, entity: !427, file: !266, line: 231)
!427 = !DISubprogram(name: "strtof", scope: !204, file: !204, line: 123, type: !428, flags: DIFlagPrototyped, spFlags: 0)
!428 = !DISubroutineType(types: !429)
!429 = !{!20, !348, !374}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !399, entity: !431, file: !266, line: 232)
!431 = !DISubprogram(name: "strtold", scope: !204, file: !204, line: 126, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!432 = !DISubroutineType(types: !433)
!433 = !{!434, !348, !374}
!434 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !400, file: !266, line: 240)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !406, file: !266, line: 242)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !408, file: !266, line: 244)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !439, file: !266, line: 245)
!439 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !399, file: !266, line: 213, type: !411, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !410, file: !266, line: 246)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !414, file: !266, line: 248)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !427, file: !266, line: 249)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !418, file: !266, line: 250)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !422, file: !266, line: 251)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !431, file: !266, line: 252)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !274, file: !447, line: 38)
!447 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/stdlib.h", directory: "")
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !278, file: !447, line: 39)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !315, file: !447, line: 40)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !264, file: !447, line: 51)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !268, file: !447, line: 52)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !453, file: !447, line: 54)
!453 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !10, file: !205, line: 79, type: !454, flags: DIFlagPrototyped, spFlags: 0)
!454 = !DISubroutineType(types: !455)
!455 = !{!434, !434}
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !283, file: !447, line: 55)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !285, file: !447, line: 56)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !289, file: !447, line: 57)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !293, file: !447, line: 58)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !307, file: !447, line: 59)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !439, file: !447, line: 60)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !319, file: !447, line: 61)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !323, file: !447, line: 62)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !328, file: !447, line: 63)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !330, file: !447, line: 64)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !334, file: !447, line: 65)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !338, file: !447, line: 67)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !342, file: !447, line: 68)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !350, file: !447, line: 69)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !354, file: !447, line: 71)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !358, file: !447, line: 72)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !362, file: !447, line: 73)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !366, file: !447, line: 74)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !371, file: !447, line: 75)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !377, file: !447, line: 76)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !381, file: !447, line: 77)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !385, file: !447, line: 78)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !387, file: !447, line: 80)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !395, file: !447, line: 81)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !481, file: !483, line: 414)
!481 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !482, file: !482, line: 1126, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!482 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "")
!483 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/__clang_cuda_cmath.h", directory: "/u/NAS_SCRATCH/yc0769")
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !485, file: !483, line: 415)
!485 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !482, file: !482, line: 1154, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !487, file: !483, line: 416)
!487 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !482, file: !482, line: 1121, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !489, file: !483, line: 417)
!489 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !482, file: !482, line: 1159, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !491, file: !483, line: 418)
!491 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !482, file: !482, line: 1111, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !493, file: !483, line: 419)
!493 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !482, file: !482, line: 1116, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !495, file: !483, line: 420)
!495 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !482, file: !482, line: 1164, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !497, file: !483, line: 421)
!497 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !482, file: !482, line: 1199, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !499, file: !483, line: 422)
!499 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !500, file: !500, line: 647, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!500 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "")
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !502, file: !483, line: 423)
!502 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !482, file: !482, line: 973, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !504, file: !483, line: 424)
!504 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !482, file: !482, line: 1027, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !506, file: !483, line: 425)
!506 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !482, file: !482, line: 1096, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !508, file: !483, line: 426)
!508 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !482, file: !482, line: 1259, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !510, file: !483, line: 427)
!510 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !482, file: !482, line: 1249, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !512, file: !483, line: 428)
!512 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !500, file: !500, line: 637, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !514, file: !483, line: 429)
!514 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !482, file: !482, line: 1078, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !516, file: !483, line: 430)
!516 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !482, file: !482, line: 1169, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !518, file: !483, line: 431)
!518 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !500, file: !500, line: 582, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !520, file: !483, line: 432)
!520 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !482, file: !482, line: 1385, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !522, file: !483, line: 433)
!522 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !500, file: !500, line: 572, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !524, file: !483, line: 434)
!524 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !482, file: !482, line: 1337, type: !63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !526, file: !483, line: 435)
!526 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !500, file: !500, line: 602, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !528, file: !483, line: 436)
!528 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !500, file: !500, line: 597, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !530, file: !483, line: 437)
!530 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !482, file: !482, line: 1322, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !532, file: !483, line: 438)
!532 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !482, file: !482, line: 1312, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !534, file: !483, line: 439)
!534 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !482, file: !482, line: 1174, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !536, file: !483, line: 440)
!536 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !482, file: !482, line: 1390, type: !73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !538, file: !483, line: 441)
!538 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !482, file: !482, line: 1289, type: !116, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !540, file: !483, line: 442)
!540 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !482, file: !482, line: 1284, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !542, file: !483, line: 443)
!542 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !482, file: !482, line: 933, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !544, file: !483, line: 444)
!544 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !482, file: !482, line: 1371, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !546, file: !483, line: 445)
!546 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !482, file: !482, line: 1140, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !548, file: !483, line: 446)
!548 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !482, file: !482, line: 1149, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !550, file: !483, line: 447)
!550 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !482, file: !482, line: 1069, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !552, file: !483, line: 448)
!552 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !482, file: !482, line: 1395, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !554, file: !483, line: 449)
!554 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !482, file: !482, line: 1131, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !556, file: !483, line: 450)
!556 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !482, file: !482, line: 924, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !558, file: !483, line: 451)
!558 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !482, file: !482, line: 1376, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !560, file: !483, line: 452)
!560 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !482, file: !482, line: 1317, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !562, file: !483, line: 453)
!562 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !482, file: !482, line: 938, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !564, file: !483, line: 454)
!564 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !482, file: !482, line: 1002, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !566, file: !483, line: 455)
!566 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !482, file: !482, line: 1352, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !568, file: !483, line: 456)
!568 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !482, file: !482, line: 1327, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !570, file: !483, line: 457)
!570 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !482, file: !482, line: 1332, type: !174, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !572, file: !483, line: 458)
!572 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !482, file: !482, line: 919, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !574, file: !483, line: 459)
!574 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !482, file: !482, line: 1366, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !576, file: !483, line: 462)
!576 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !482, file: !482, line: 1299, type: !182, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !578, file: !483, line: 464)
!578 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !482, file: !482, line: 1294, type: !116, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !580, file: !483, line: 465)
!580 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !482, file: !482, line: 1018, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !582, file: !483, line: 466)
!582 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !482, file: !482, line: 1101, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !584, file: !483, line: 467)
!584 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !500, file: !500, line: 887, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !586, file: !483, line: 468)
!586 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !482, file: !482, line: 1060, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !588, file: !483, line: 469)
!588 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !482, file: !482, line: 1106, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !590, file: !483, line: 470)
!590 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !482, file: !482, line: 1361, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !592, file: !483, line: 471)
!592 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !500, file: !500, line: 642, type: !18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !453, file: !594, line: 38)
!594 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/math.h", directory: "")
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !596, file: !594, line: 54)
!596 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !10, file: !211, line: 380, type: !597, flags: DIFlagPrototyped, spFlags: 0)
!597 = !DISubroutineType(types: !598)
!598 = !{!434, !434, !599}
!599 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !434, size: 64)
!600 = !{void (i32, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*)* @_Z8kernel_AiddPdS_S_S_S_S_S_S_S_, !"kernel", i32 1}
!601 = !{void (i32, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*)* @_Z8kernel_xiddPdS_S_S_S_S_S_S_S_, !"kernel", i32 1}
!602 = !{void (i32, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*)* @_Z8kernel_yiddPdS_S_S_S_S_S_S_S_, !"kernel", i32 1}
!603 = !{void (i32, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*)* @_Z8kernel_widdPdS_S_S_S_S_S_S_S_, !"kernel", i32 1}
!604 = !{null, !"align", i32 8}
!605 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!606 = !{null, !"align", i32 16}
!607 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!608 = !{!"clang version 9.0.0 (git@github.com:SusanTan/llvm-project.git a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)"}
!609 = !{i32 1, i32 2}
!610 = distinct !DISubprogram(name: "kernel_A", linkageName: "_Z8kernel_AiddPdS_S_S_S_S_S_S_S_", scope: !6, file: !6, line: 21, type: !611, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!611 = !DISubroutineType(types: !612)
!612 = !{null, !15, !156, !156, !250, !250, !250, !250, !250, !250, !250, !250, !250}
!613 = !DILocalVariable(name: "n", arg: 1, scope: !610, file: !6, line: 21, type: !15)
!614 = !DILocation(line: 21, column: 30, scope: !610)
!615 = !DILocalVariable(name: "alpha", arg: 2, scope: !610, file: !6, line: 21, type: !156)
!616 = !DILocation(line: 21, column: 40, scope: !610)
!617 = !DILocalVariable(name: "beta", arg: 3, scope: !610, file: !6, line: 21, type: !156)
!618 = !DILocation(line: 21, column: 54, scope: !610)
!619 = !DILocalVariable(name: "A", arg: 4, scope: !610, file: !6, line: 22, type: !250)
!620 = !DILocation(line: 22, column: 34, scope: !610)
!621 = !DILocalVariable(name: "u1", arg: 5, scope: !610, file: !6, line: 22, type: !250)
!622 = !DILocation(line: 22, column: 45, scope: !610)
!623 = !DILocalVariable(name: "v1", arg: 6, scope: !610, file: !6, line: 22, type: !250)
!624 = !DILocation(line: 22, column: 57, scope: !610)
!625 = !DILocalVariable(name: "u2", arg: 7, scope: !610, file: !6, line: 22, type: !250)
!626 = !DILocation(line: 22, column: 69, scope: !610)
!627 = !DILocalVariable(name: "v2", arg: 8, scope: !610, file: !6, line: 22, type: !250)
!628 = !DILocation(line: 22, column: 81, scope: !610)
!629 = !DILocalVariable(name: "w", arg: 9, scope: !610, file: !6, line: 22, type: !250)
!630 = !DILocation(line: 22, column: 93, scope: !610)
!631 = !DILocalVariable(name: "x", arg: 10, scope: !610, file: !6, line: 22, type: !250)
!632 = !DILocation(line: 22, column: 104, scope: !610)
!633 = !DILocalVariable(name: "y", arg: 11, scope: !610, file: !6, line: 22, type: !250)
!634 = !DILocation(line: 22, column: 115, scope: !610)
!635 = !DILocalVariable(name: "z", arg: 12, scope: !610, file: !6, line: 22, type: !250)
!636 = !DILocation(line: 22, column: 126, scope: !610)
!637 = !DILocalVariable(name: "i", scope: !610, file: !6, line: 23, type: !15)
!638 = !DILocation(line: 23, column: 7, scope: !610)
!639 = !DILocation(line: 75, column: 3, scope: !640, inlinedAt: !691)
!640 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !642, file: !641, line: 75, type: !645, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !644, retainedNodes: !7)
!641 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/__clang_cuda_builtin_vars.h", directory: "/u/NAS_SCRATCH/yc0769")
!642 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockDim_t", file: !641, line: 74, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !643, identifier: "_ZTS25__cuda_builtin_blockDim_t")
!643 = !{!644, !647, !648, !649, !676, !680, !684, !687}
!644 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !642, file: !641, line: 75, type: !645, scopeLine: 75, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!645 = !DISubroutineType(types: !646)
!646 = !{!369}
!647 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !642, file: !641, line: 76, type: !645, scopeLine: 76, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!648 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_zEv", scope: !642, file: !641, line: 77, type: !645, scopeLine: 77, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!649 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__cuda_builtin_blockDim_tcv4dim3Ev", scope: !642, file: !641, line: 80, type: !650, scopeLine: 80, flags: DIFlagPrototyped, spFlags: 0)
!650 = !DISubroutineType(types: !651)
!651 = !{!652, !674}
!652 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !653, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !654, identifier: "_ZTS4dim3")
!653 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!654 = !{!655, !656, !657, !658, !662, !671}
!655 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !652, file: !653, line: 419, baseType: !369, size: 32)
!656 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !652, file: !653, line: 419, baseType: !369, size: 32, offset: 32)
!657 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !652, file: !653, line: 419, baseType: !369, size: 32, offset: 64)
!658 = !DISubprogram(name: "dim3", scope: !652, file: !653, line: 421, type: !659, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!659 = !DISubroutineType(types: !660)
!660 = !{null, !661, !369, !369, !369}
!661 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !652, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!662 = !DISubprogram(name: "dim3", scope: !652, file: !653, line: 422, type: !663, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!663 = !DISubroutineType(types: !664)
!664 = !{null, !661, !665}
!665 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !653, line: 383, baseType: !666)
!666 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !653, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !667, identifier: "_ZTS5uint3")
!667 = !{!668, !669, !670}
!668 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !666, file: !653, line: 192, baseType: !369, size: 32)
!669 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !666, file: !653, line: 192, baseType: !369, size: 32, offset: 32)
!670 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !666, file: !653, line: 192, baseType: !369, size: 32, offset: 64)
!671 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !652, file: !653, line: 423, type: !672, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!672 = !DISubroutineType(types: !673)
!673 = !{!665, !661}
!674 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !675, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!675 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !642)
!676 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !642, file: !641, line: 82, type: !677, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!677 = !DISubroutineType(types: !678)
!678 = !{null, !679}
!679 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !642, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!680 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !642, file: !641, line: 82, type: !681, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!681 = !DISubroutineType(types: !682)
!682 = !{null, !679, !683}
!683 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !675, size: 64)
!684 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockDim_taSERKS_", scope: !642, file: !641, line: 82, type: !685, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!685 = !DISubroutineType(types: !686)
!686 = !{null, !674, !683}
!687 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockDim_tadEv", scope: !642, file: !641, line: 82, type: !688, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!688 = !DISubroutineType(types: !689)
!689 = !{!690, !674}
!690 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !642, size: 64)
!691 = distinct !DILocation(line: 23, column: 11, scope: !610)
!692 = !{i32 1, i32 1025}
!693 = !DILocation(line: 64, column: 3, scope: !694, inlinedAt: !720)
!694 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !695, file: !641, line: 64, type: !645, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !697, retainedNodes: !7)
!695 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !641, line: 63, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !696, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!696 = !{!697, !698, !699, !700, !705, !709, !713, !716}
!697 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !695, file: !641, line: 64, type: !645, scopeLine: 64, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!698 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !695, file: !641, line: 65, type: !645, scopeLine: 65, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!699 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !695, file: !641, line: 66, type: !645, scopeLine: 66, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!700 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !695, file: !641, line: 69, type: !701, scopeLine: 69, flags: DIFlagPrototyped, spFlags: 0)
!701 = !DISubroutineType(types: !702)
!702 = !{!666, !703}
!703 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !704, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!704 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !695)
!705 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !695, file: !641, line: 71, type: !706, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!706 = !DISubroutineType(types: !707)
!707 = !{null, !708}
!708 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !695, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!709 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !695, file: !641, line: 71, type: !710, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!710 = !DISubroutineType(types: !711)
!711 = !{null, !708, !712}
!712 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !704, size: 64)
!713 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !695, file: !641, line: 71, type: !714, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!714 = !DISubroutineType(types: !715)
!715 = !{null, !703, !712}
!716 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !695, file: !641, line: 71, type: !717, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!717 = !DISubroutineType(types: !718)
!718 = !{!719, !703}
!719 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !695, size: 64)
!720 = distinct !DILocation(line: 23, column: 24, scope: !610)
!721 = !{i32 0, i32 65535}
!722 = !DILocation(line: 23, column: 22, scope: !610)
!723 = !DILocation(line: 53, column: 3, scope: !724, inlinedAt: !750)
!724 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !725, file: !641, line: 53, type: !645, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !727, retainedNodes: !7)
!725 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !641, line: 52, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !726, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!726 = !{!727, !728, !729, !730, !735, !739, !743, !746}
!727 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !725, file: !641, line: 53, type: !645, scopeLine: 53, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!728 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !725, file: !641, line: 54, type: !645, scopeLine: 54, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!729 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !725, file: !641, line: 55, type: !645, scopeLine: 55, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!730 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !725, file: !641, line: 58, type: !731, scopeLine: 58, flags: DIFlagPrototyped, spFlags: 0)
!731 = !DISubroutineType(types: !732)
!732 = !{!666, !733}
!733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !734, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!734 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !725)
!735 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !725, file: !641, line: 60, type: !736, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!736 = !DISubroutineType(types: !737)
!737 = !{null, !738}
!738 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !725, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!739 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !725, file: !641, line: 60, type: !740, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!740 = !DISubroutineType(types: !741)
!741 = !{null, !738, !742}
!742 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !734, size: 64)
!743 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !725, file: !641, line: 60, type: !744, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!744 = !DISubroutineType(types: !745)
!745 = !{null, !733, !742}
!746 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !725, file: !641, line: 60, type: !747, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!747 = !DISubroutineType(types: !748)
!748 = !{!749, !733}
!749 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !725, size: 64)
!750 = distinct !DILocation(line: 23, column: 37, scope: !610)
!751 = !{i32 0, i32 1024}
!752 = !DILocation(line: 23, column: 35, scope: !610)
!753 = !DILocalVariable(name: "j", scope: !610, file: !6, line: 24, type: !15)
!754 = !DILocation(line: 24, column: 7, scope: !610)
!755 = !DILocation(line: 76, column: 3, scope: !756, inlinedAt: !757)
!756 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !642, file: !641, line: 76, type: !645, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !647, retainedNodes: !7)
!757 = distinct !DILocation(line: 24, column: 11, scope: !610)
!758 = !DILocation(line: 65, column: 3, scope: !759, inlinedAt: !760)
!759 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !695, file: !641, line: 65, type: !645, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !698, retainedNodes: !7)
!760 = distinct !DILocation(line: 24, column: 24, scope: !610)
!761 = !DILocation(line: 24, column: 22, scope: !610)
!762 = !DILocation(line: 54, column: 3, scope: !763, inlinedAt: !764)
!763 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !725, file: !641, line: 54, type: !645, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !728, retainedNodes: !7)
!764 = distinct !DILocation(line: 24, column: 37, scope: !610)
!765 = !DILocation(line: 24, column: 35, scope: !610)
!766 = !DILocation(line: 26, column: 7, scope: !767)
!767 = distinct !DILexicalBlock(scope: !610, file: !6, line: 26, column: 7)
!768 = !DILocation(line: 26, column: 11, scope: !767)
!769 = !DILocation(line: 26, column: 9, scope: !767)
!770 = !DILocation(line: 26, column: 13, scope: !767)
!771 = !DILocation(line: 26, column: 16, scope: !767)
!772 = !DILocation(line: 26, column: 20, scope: !767)
!773 = !DILocation(line: 26, column: 18, scope: !767)
!774 = !DILocation(line: 26, column: 7, scope: !610)
!775 = !DILocation(line: 27, column: 21, scope: !767)
!776 = !DILocation(line: 27, column: 24, scope: !767)
!777 = !DILocation(line: 27, column: 29, scope: !767)
!778 = !DILocation(line: 27, column: 32, scope: !767)
!779 = !DILocation(line: 27, column: 27, scope: !767)
!780 = !DILocation(line: 27, column: 37, scope: !767)
!781 = !DILocation(line: 27, column: 40, scope: !767)
!782 = !DILocation(line: 27, column: 45, scope: !767)
!783 = !DILocation(line: 27, column: 48, scope: !767)
!784 = !DILocation(line: 27, column: 43, scope: !767)
!785 = !DILocation(line: 27, column: 35, scope: !767)
!786 = !DILocation(line: 27, column: 5, scope: !767)
!787 = !DILocation(line: 27, column: 7, scope: !767)
!788 = !DILocation(line: 27, column: 11, scope: !767)
!789 = !DILocation(line: 27, column: 9, scope: !767)
!790 = !DILocation(line: 27, column: 15, scope: !767)
!791 = !DILocation(line: 27, column: 13, scope: !767)
!792 = !DILocation(line: 27, column: 18, scope: !767)
!793 = !DILocation(line: 28, column: 1, scope: !610)
!794 = distinct !DISubprogram(name: "kernel_x", linkageName: "_Z8kernel_xiddPdS_S_S_S_S_S_S_S_", scope: !6, file: !6, line: 31, type: !611, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!795 = !DILocalVariable(name: "n", arg: 1, scope: !794, file: !6, line: 31, type: !15)
!796 = !DILocation(line: 31, column: 30, scope: !794)
!797 = !DILocalVariable(name: "alpha", arg: 2, scope: !794, file: !6, line: 31, type: !156)
!798 = !DILocation(line: 31, column: 40, scope: !794)
!799 = !DILocalVariable(name: "beta", arg: 3, scope: !794, file: !6, line: 31, type: !156)
!800 = !DILocation(line: 31, column: 54, scope: !794)
!801 = !DILocalVariable(name: "A", arg: 4, scope: !794, file: !6, line: 32, type: !250)
!802 = !DILocation(line: 32, column: 34, scope: !794)
!803 = !DILocalVariable(name: "u1", arg: 5, scope: !794, file: !6, line: 32, type: !250)
!804 = !DILocation(line: 32, column: 45, scope: !794)
!805 = !DILocalVariable(name: "v1", arg: 6, scope: !794, file: !6, line: 32, type: !250)
!806 = !DILocation(line: 32, column: 57, scope: !794)
!807 = !DILocalVariable(name: "u2", arg: 7, scope: !794, file: !6, line: 32, type: !250)
!808 = !DILocation(line: 32, column: 69, scope: !794)
!809 = !DILocalVariable(name: "v2", arg: 8, scope: !794, file: !6, line: 32, type: !250)
!810 = !DILocation(line: 32, column: 81, scope: !794)
!811 = !DILocalVariable(name: "w", arg: 9, scope: !794, file: !6, line: 32, type: !250)
!812 = !DILocation(line: 32, column: 93, scope: !794)
!813 = !DILocalVariable(name: "x", arg: 10, scope: !794, file: !6, line: 32, type: !250)
!814 = !DILocation(line: 32, column: 104, scope: !794)
!815 = !DILocalVariable(name: "y", arg: 11, scope: !794, file: !6, line: 32, type: !250)
!816 = !DILocation(line: 32, column: 115, scope: !794)
!817 = !DILocalVariable(name: "z", arg: 12, scope: !794, file: !6, line: 32, type: !250)
!818 = !DILocation(line: 32, column: 126, scope: !794)
!819 = !DILocalVariable(name: "i", scope: !794, file: !6, line: 33, type: !15)
!820 = !DILocation(line: 33, column: 7, scope: !794)
!821 = !DILocation(line: 75, column: 3, scope: !640, inlinedAt: !822)
!822 = distinct !DILocation(line: 33, column: 11, scope: !794)
!823 = !DILocation(line: 64, column: 3, scope: !694, inlinedAt: !824)
!824 = distinct !DILocation(line: 33, column: 24, scope: !794)
!825 = !DILocation(line: 33, column: 22, scope: !794)
!826 = !DILocation(line: 53, column: 3, scope: !724, inlinedAt: !827)
!827 = distinct !DILocation(line: 33, column: 37, scope: !794)
!828 = !DILocation(line: 33, column: 35, scope: !794)
!829 = !DILocation(line: 36, column: 7, scope: !830)
!830 = distinct !DILexicalBlock(scope: !794, file: !6, line: 36, column: 7)
!831 = !DILocation(line: 36, column: 11, scope: !830)
!832 = !DILocation(line: 36, column: 9, scope: !830)
!833 = !DILocation(line: 36, column: 7, scope: !794)
!834 = !DILocalVariable(name: "j", scope: !835, file: !6, line: 37, type: !15)
!835 = distinct !DILexicalBlock(scope: !836, file: !6, line: 37, column: 5)
!836 = distinct !DILexicalBlock(scope: !830, file: !6, line: 36, column: 14)
!837 = !DILocation(line: 37, column: 14, scope: !835)
!838 = !DILocation(line: 37, column: 10, scope: !835)
!839 = !DILocation(line: 37, column: 21, scope: !840)
!840 = distinct !DILexicalBlock(scope: !835, file: !6, line: 37, column: 5)
!841 = !DILocation(line: 37, column: 25, scope: !840)
!842 = !DILocation(line: 37, column: 23, scope: !840)
!843 = !DILocation(line: 37, column: 5, scope: !835)
!844 = !DILocation(line: 38, column: 15, scope: !840)
!845 = !DILocation(line: 38, column: 22, scope: !840)
!846 = !DILocation(line: 38, column: 24, scope: !840)
!847 = !DILocation(line: 38, column: 28, scope: !840)
!848 = !DILocation(line: 38, column: 26, scope: !840)
!849 = !DILocation(line: 38, column: 32, scope: !840)
!850 = !DILocation(line: 38, column: 30, scope: !840)
!851 = !DILocation(line: 38, column: 20, scope: !840)
!852 = !DILocation(line: 38, column: 37, scope: !840)
!853 = !DILocation(line: 38, column: 39, scope: !840)
!854 = !DILocation(line: 38, column: 35, scope: !840)
!855 = !DILocation(line: 38, column: 7, scope: !840)
!856 = !DILocation(line: 38, column: 9, scope: !840)
!857 = !DILocation(line: 38, column: 12, scope: !840)
!858 = !DILocation(line: 37, column: 29, scope: !840)
!859 = !DILocation(line: 37, column: 5, scope: !840)
!860 = distinct !{!860, !843, !861}
!861 = !DILocation(line: 38, column: 40, scope: !835)
!862 = !DILocation(line: 39, column: 3, scope: !836)
!863 = !DILocation(line: 40, column: 1, scope: !794)
!864 = distinct !DISubprogram(name: "kernel_y", linkageName: "_Z8kernel_yiddPdS_S_S_S_S_S_S_S_", scope: !6, file: !6, line: 43, type: !611, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!865 = !DILocalVariable(name: "n", arg: 1, scope: !864, file: !6, line: 43, type: !15)
!866 = !DILocation(line: 43, column: 30, scope: !864)
!867 = !DILocalVariable(name: "alpha", arg: 2, scope: !864, file: !6, line: 43, type: !156)
!868 = !DILocation(line: 43, column: 40, scope: !864)
!869 = !DILocalVariable(name: "beta", arg: 3, scope: !864, file: !6, line: 43, type: !156)
!870 = !DILocation(line: 43, column: 54, scope: !864)
!871 = !DILocalVariable(name: "A", arg: 4, scope: !864, file: !6, line: 44, type: !250)
!872 = !DILocation(line: 44, column: 34, scope: !864)
!873 = !DILocalVariable(name: "u1", arg: 5, scope: !864, file: !6, line: 44, type: !250)
!874 = !DILocation(line: 44, column: 45, scope: !864)
!875 = !DILocalVariable(name: "v1", arg: 6, scope: !864, file: !6, line: 44, type: !250)
!876 = !DILocation(line: 44, column: 57, scope: !864)
!877 = !DILocalVariable(name: "u2", arg: 7, scope: !864, file: !6, line: 44, type: !250)
!878 = !DILocation(line: 44, column: 69, scope: !864)
!879 = !DILocalVariable(name: "v2", arg: 8, scope: !864, file: !6, line: 44, type: !250)
!880 = !DILocation(line: 44, column: 81, scope: !864)
!881 = !DILocalVariable(name: "w", arg: 9, scope: !864, file: !6, line: 44, type: !250)
!882 = !DILocation(line: 44, column: 93, scope: !864)
!883 = !DILocalVariable(name: "x", arg: 10, scope: !864, file: !6, line: 44, type: !250)
!884 = !DILocation(line: 44, column: 104, scope: !864)
!885 = !DILocalVariable(name: "y", arg: 11, scope: !864, file: !6, line: 44, type: !250)
!886 = !DILocation(line: 44, column: 115, scope: !864)
!887 = !DILocalVariable(name: "z", arg: 12, scope: !864, file: !6, line: 44, type: !250)
!888 = !DILocation(line: 44, column: 126, scope: !864)
!889 = !DILocalVariable(name: "i", scope: !864, file: !6, line: 45, type: !15)
!890 = !DILocation(line: 45, column: 7, scope: !864)
!891 = !DILocation(line: 75, column: 3, scope: !640, inlinedAt: !892)
!892 = distinct !DILocation(line: 45, column: 11, scope: !864)
!893 = !DILocation(line: 64, column: 3, scope: !694, inlinedAt: !894)
!894 = distinct !DILocation(line: 45, column: 24, scope: !864)
!895 = !DILocation(line: 45, column: 22, scope: !864)
!896 = !DILocation(line: 53, column: 3, scope: !724, inlinedAt: !897)
!897 = distinct !DILocation(line: 45, column: 37, scope: !864)
!898 = !DILocation(line: 45, column: 35, scope: !864)
!899 = !DILocation(line: 48, column: 7, scope: !900)
!900 = distinct !DILexicalBlock(scope: !864, file: !6, line: 48, column: 7)
!901 = !DILocation(line: 48, column: 11, scope: !900)
!902 = !DILocation(line: 48, column: 9, scope: !900)
!903 = !DILocation(line: 48, column: 7, scope: !864)
!904 = !DILocation(line: 49, column: 13, scope: !900)
!905 = !DILocation(line: 49, column: 15, scope: !900)
!906 = !DILocation(line: 49, column: 5, scope: !900)
!907 = !DILocation(line: 49, column: 7, scope: !900)
!908 = !DILocation(line: 49, column: 10, scope: !900)
!909 = !DILocation(line: 50, column: 1, scope: !864)
!910 = distinct !DISubprogram(name: "kernel_w", linkageName: "_Z8kernel_widdPdS_S_S_S_S_S_S_S_", scope: !6, file: !6, line: 52, type: !611, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!911 = !DILocalVariable(name: "n", arg: 1, scope: !910, file: !6, line: 52, type: !15)
!912 = !DILocation(line: 52, column: 30, scope: !910)
!913 = !DILocalVariable(name: "alpha", arg: 2, scope: !910, file: !6, line: 52, type: !156)
!914 = !DILocation(line: 52, column: 40, scope: !910)
!915 = !DILocalVariable(name: "beta", arg: 3, scope: !910, file: !6, line: 52, type: !156)
!916 = !DILocation(line: 52, column: 54, scope: !910)
!917 = !DILocalVariable(name: "A", arg: 4, scope: !910, file: !6, line: 53, type: !250)
!918 = !DILocation(line: 53, column: 34, scope: !910)
!919 = !DILocalVariable(name: "u1", arg: 5, scope: !910, file: !6, line: 53, type: !250)
!920 = !DILocation(line: 53, column: 45, scope: !910)
!921 = !DILocalVariable(name: "v1", arg: 6, scope: !910, file: !6, line: 53, type: !250)
!922 = !DILocation(line: 53, column: 57, scope: !910)
!923 = !DILocalVariable(name: "u2", arg: 7, scope: !910, file: !6, line: 53, type: !250)
!924 = !DILocation(line: 53, column: 69, scope: !910)
!925 = !DILocalVariable(name: "v2", arg: 8, scope: !910, file: !6, line: 53, type: !250)
!926 = !DILocation(line: 53, column: 81, scope: !910)
!927 = !DILocalVariable(name: "w", arg: 9, scope: !910, file: !6, line: 53, type: !250)
!928 = !DILocation(line: 53, column: 93, scope: !910)
!929 = !DILocalVariable(name: "x", arg: 10, scope: !910, file: !6, line: 53, type: !250)
!930 = !DILocation(line: 53, column: 104, scope: !910)
!931 = !DILocalVariable(name: "y", arg: 11, scope: !910, file: !6, line: 53, type: !250)
!932 = !DILocation(line: 53, column: 115, scope: !910)
!933 = !DILocalVariable(name: "z", arg: 12, scope: !910, file: !6, line: 53, type: !250)
!934 = !DILocation(line: 53, column: 126, scope: !910)
!935 = !DILocalVariable(name: "i", scope: !910, file: !6, line: 54, type: !15)
!936 = !DILocation(line: 54, column: 7, scope: !910)
!937 = !DILocation(line: 75, column: 3, scope: !640, inlinedAt: !938)
!938 = distinct !DILocation(line: 54, column: 11, scope: !910)
!939 = !DILocation(line: 64, column: 3, scope: !694, inlinedAt: !940)
!940 = distinct !DILocation(line: 54, column: 24, scope: !910)
!941 = !DILocation(line: 54, column: 22, scope: !910)
!942 = !DILocation(line: 53, column: 3, scope: !724, inlinedAt: !943)
!943 = distinct !DILocation(line: 54, column: 37, scope: !910)
!944 = !DILocation(line: 54, column: 35, scope: !910)
!945 = !DILocation(line: 57, column: 7, scope: !946)
!946 = distinct !DILexicalBlock(scope: !910, file: !6, line: 57, column: 7)
!947 = !DILocation(line: 57, column: 11, scope: !946)
!948 = !DILocation(line: 57, column: 9, scope: !946)
!949 = !DILocation(line: 57, column: 7, scope: !910)
!950 = !DILocalVariable(name: "j", scope: !951, file: !6, line: 58, type: !15)
!951 = distinct !DILexicalBlock(scope: !952, file: !6, line: 58, column: 5)
!952 = distinct !DILexicalBlock(scope: !946, file: !6, line: 57, column: 14)
!953 = !DILocation(line: 58, column: 14, scope: !951)
!954 = !DILocation(line: 58, column: 10, scope: !951)
!955 = !DILocation(line: 58, column: 21, scope: !956)
!956 = distinct !DILexicalBlock(scope: !951, file: !6, line: 58, column: 5)
!957 = !DILocation(line: 58, column: 25, scope: !956)
!958 = !DILocation(line: 58, column: 23, scope: !956)
!959 = !DILocation(line: 58, column: 5, scope: !951)
!960 = !DILocation(line: 59, column: 15, scope: !956)
!961 = !DILocation(line: 59, column: 23, scope: !956)
!962 = !DILocation(line: 59, column: 25, scope: !956)
!963 = !DILocation(line: 59, column: 29, scope: !956)
!964 = !DILocation(line: 59, column: 27, scope: !956)
!965 = !DILocation(line: 59, column: 33, scope: !956)
!966 = !DILocation(line: 59, column: 31, scope: !956)
!967 = !DILocation(line: 59, column: 21, scope: !956)
!968 = !DILocation(line: 59, column: 38, scope: !956)
!969 = !DILocation(line: 59, column: 40, scope: !956)
!970 = !DILocation(line: 59, column: 36, scope: !956)
!971 = !DILocation(line: 59, column: 7, scope: !956)
!972 = !DILocation(line: 59, column: 9, scope: !956)
!973 = !DILocation(line: 59, column: 12, scope: !956)
!974 = !DILocation(line: 58, column: 29, scope: !956)
!975 = !DILocation(line: 58, column: 5, scope: !956)
!976 = distinct !{!976, !959, !977}
!977 = !DILocation(line: 59, column: 41, scope: !951)
!978 = !DILocation(line: 60, column: 3, scope: !952)
!979 = !DILocation(line: 61, column: 1, scope: !910)
