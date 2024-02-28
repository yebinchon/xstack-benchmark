; ModuleID = '2mm.cu'
source_filename = "2mm.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z14kernel_A_mul_BiiiiddPdS_S_S_S_(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, double* %tmp, double* %A, double* %B, double* %C, double* %D) #0 !dbg !608 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %tmp.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %C.addr = alloca double*, align 8
  %D.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !611, metadata !DIExpression()), !dbg !612
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !613, metadata !DIExpression()), !dbg !614
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !615, metadata !DIExpression()), !dbg !616
  store i32 %nl, i32* %nl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nl.addr, metadata !617, metadata !DIExpression()), !dbg !618
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !619, metadata !DIExpression()), !dbg !620
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !621, metadata !DIExpression()), !dbg !622
  store double* %tmp, double** %tmp.addr, align 8
  call void @llvm.dbg.declare(metadata double** %tmp.addr, metadata !623, metadata !DIExpression()), !dbg !624
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !625, metadata !DIExpression()), !dbg !626
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !627, metadata !DIExpression()), !dbg !628
  store double* %C, double** %C.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C.addr, metadata !629, metadata !DIExpression()), !dbg !630
  store double* %D, double** %D.addr, align 8
  call void @llvm.dbg.declare(metadata double** %D.addr, metadata !631, metadata !DIExpression()), !dbg !632
  call void @llvm.dbg.declare(metadata i32* %i, metadata !633, metadata !DIExpression()), !dbg !634
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3, !dbg !635, !range !688
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !689, !range !717
  %mul = mul i32 %0, %1, !dbg !718
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !719, !range !747
  %add = add i32 %mul, %2, !dbg !748
  store i32 %add, i32* %i, align 4, !dbg !634
  call void @llvm.dbg.declare(metadata i32* %j, metadata !749, metadata !DIExpression()), !dbg !750
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #3, !dbg !751, !range !688
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !754, !range !717
  %mul5 = mul i32 %3, %4, !dbg !757
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !758, !range !747
  %add7 = add i32 %mul5, %5, !dbg !761
  store i32 %add7, i32* %j, align 4, !dbg !750
  call void @llvm.dbg.declare(metadata i32* %k, metadata !762, metadata !DIExpression()), !dbg !763
  %6 = load i32, i32* %i, align 4, !dbg !764
  %7 = load i32, i32* %ni.addr, align 4, !dbg !766
  %cmp = icmp slt i32 %6, %7, !dbg !767
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !768

land.lhs.true:                                    ; preds = %entry
  %8 = load i32, i32* %j, align 4, !dbg !769
  %9 = load i32, i32* %nj.addr, align 4, !dbg !770
  %cmp8 = icmp slt i32 %8, %9, !dbg !771
  br i1 %cmp8, label %if.then, label %if.end, !dbg !772

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* %k, align 4, !dbg !773
  br label %for.cond, !dbg !776

for.cond:                                         ; preds = %for.inc, %if.then
  %10 = load i32, i32* %k, align 4, !dbg !777
  %11 = load i32, i32* %nk.addr, align 4, !dbg !779
  %cmp9 = icmp slt i32 %10, %11, !dbg !780
  br i1 %cmp9, label %for.body, label %for.end, !dbg !781

for.body:                                         ; preds = %for.cond
  %12 = load double, double* %alpha.addr, align 8, !dbg !782
  %13 = load double*, double** %A.addr, align 8, !dbg !783
  %14 = load i32, i32* %i, align 4, !dbg !784
  %15 = load i32, i32* %nk.addr, align 4, !dbg !785
  %mul10 = mul nsw i32 %14, %15, !dbg !786
  %16 = load i32, i32* %k, align 4, !dbg !787
  %add11 = add nsw i32 %mul10, %16, !dbg !788
  %idxprom = sext i32 %add11 to i64, !dbg !783
  %arrayidx = getelementptr inbounds double, double* %13, i64 %idxprom, !dbg !783
  %17 = load double, double* %arrayidx, align 8, !dbg !783
  %mul12 = fmul contract double %12, %17, !dbg !789
  %18 = load double*, double** %B.addr, align 8, !dbg !790
  %19 = load i32, i32* %k, align 4, !dbg !791
  %20 = load i32, i32* %nj.addr, align 4, !dbg !792
  %mul13 = mul nsw i32 %19, %20, !dbg !793
  %21 = load i32, i32* %j, align 4, !dbg !794
  %add14 = add nsw i32 %mul13, %21, !dbg !795
  %idxprom15 = sext i32 %add14 to i64, !dbg !790
  %arrayidx16 = getelementptr inbounds double, double* %18, i64 %idxprom15, !dbg !790
  %22 = load double, double* %arrayidx16, align 8, !dbg !790
  %mul17 = fmul contract double %mul12, %22, !dbg !796
  %23 = load double*, double** %tmp.addr, align 8, !dbg !797
  %24 = load i32, i32* %i, align 4, !dbg !798
  %25 = load i32, i32* %nj.addr, align 4, !dbg !799
  %mul18 = mul nsw i32 %24, %25, !dbg !800
  %26 = load i32, i32* %j, align 4, !dbg !801
  %add19 = add nsw i32 %mul18, %26, !dbg !802
  %idxprom20 = sext i32 %add19 to i64, !dbg !797
  %arrayidx21 = getelementptr inbounds double, double* %23, i64 %idxprom20, !dbg !797
  %27 = load double, double* %arrayidx21, align 8, !dbg !803
  %add22 = fadd contract double %27, %mul17, !dbg !803
  store double %add22, double* %arrayidx21, align 8, !dbg !803
  br label %for.inc, !dbg !797

for.inc:                                          ; preds = %for.body
  %28 = load i32, i32* %k, align 4, !dbg !804
  %inc = add nsw i32 %28, 1, !dbg !804
  store i32 %inc, i32* %k, align 4, !dbg !804
  br label %for.cond, !dbg !805, !llvm.loop !806

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !808

if.end:                                           ; preds = %for.end, %land.lhs.true, %entry
  ret void, !dbg !809
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent noinline nounwind
define dso_local void @_Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S_(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, double* %tmp, double* %A, double* %B, double* %C, double* %D) #0 !dbg !810 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %tmp.addr = alloca double*, align 8
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %C.addr = alloca double*, align 8
  %D.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ni.addr, metadata !811, metadata !DIExpression()), !dbg !812
  store i32 %nj, i32* %nj.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nj.addr, metadata !813, metadata !DIExpression()), !dbg !814
  store i32 %nk, i32* %nk.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nk.addr, metadata !815, metadata !DIExpression()), !dbg !816
  store i32 %nl, i32* %nl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nl.addr, metadata !817, metadata !DIExpression()), !dbg !818
  store double %alpha, double* %alpha.addr, align 8
  call void @llvm.dbg.declare(metadata double* %alpha.addr, metadata !819, metadata !DIExpression()), !dbg !820
  store double %beta, double* %beta.addr, align 8
  call void @llvm.dbg.declare(metadata double* %beta.addr, metadata !821, metadata !DIExpression()), !dbg !822
  store double* %tmp, double** %tmp.addr, align 8
  call void @llvm.dbg.declare(metadata double** %tmp.addr, metadata !823, metadata !DIExpression()), !dbg !824
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !825, metadata !DIExpression()), !dbg !826
  store double* %B, double** %B.addr, align 8
  call void @llvm.dbg.declare(metadata double** %B.addr, metadata !827, metadata !DIExpression()), !dbg !828
  store double* %C, double** %C.addr, align 8
  call void @llvm.dbg.declare(metadata double** %C.addr, metadata !829, metadata !DIExpression()), !dbg !830
  store double* %D, double** %D.addr, align 8
  call void @llvm.dbg.declare(metadata double** %D.addr, metadata !831, metadata !DIExpression()), !dbg !832
  call void @llvm.dbg.declare(metadata i32* %i, metadata !833, metadata !DIExpression()), !dbg !834
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3, !dbg !835, !range !688
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3, !dbg !837, !range !717
  %mul = mul i32 %0, %1, !dbg !839
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3, !dbg !840, !range !747
  %add = add i32 %mul, %2, !dbg !842
  store i32 %add, i32* %i, align 4, !dbg !834
  call void @llvm.dbg.declare(metadata i32* %l, metadata !843, metadata !DIExpression()), !dbg !844
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #3, !dbg !845, !range !688
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3, !dbg !847, !range !717
  %mul5 = mul i32 %3, %4, !dbg !849
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3, !dbg !850, !range !747
  %add7 = add i32 %mul5, %5, !dbg !852
  store i32 %add7, i32* %l, align 4, !dbg !844
  call void @llvm.dbg.declare(metadata i32* %j, metadata !853, metadata !DIExpression()), !dbg !854
  %6 = load i32, i32* %i, align 4, !dbg !855
  %7 = load i32, i32* %ni.addr, align 4, !dbg !857
  %cmp = icmp slt i32 %6, %7, !dbg !858
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !859

land.lhs.true:                                    ; preds = %entry
  %8 = load i32, i32* %l, align 4, !dbg !860
  %9 = load i32, i32* %nl.addr, align 4, !dbg !861
  %cmp8 = icmp slt i32 %8, %9, !dbg !862
  br i1 %cmp8, label %if.then, label %if.end, !dbg !863

if.then:                                          ; preds = %land.lhs.true
  %10 = load double, double* %beta.addr, align 8, !dbg !864
  %11 = load double*, double** %D.addr, align 8, !dbg !866
  %12 = load i32, i32* %i, align 4, !dbg !867
  %13 = load i32, i32* %nj.addr, align 4, !dbg !868
  %mul9 = mul nsw i32 %12, %13, !dbg !869
  %14 = load i32, i32* %l, align 4, !dbg !870
  %add10 = add nsw i32 %mul9, %14, !dbg !871
  %idxprom = sext i32 %add10 to i64, !dbg !866
  %arrayidx = getelementptr inbounds double, double* %11, i64 %idxprom, !dbg !866
  %15 = load double, double* %arrayidx, align 8, !dbg !872
  %mul11 = fmul contract double %15, %10, !dbg !872
  store double %mul11, double* %arrayidx, align 8, !dbg !872
  store i32 0, i32* %j, align 4, !dbg !873
  br label %for.cond, !dbg !875

for.cond:                                         ; preds = %for.inc, %if.then
  %16 = load i32, i32* %j, align 4, !dbg !876
  %17 = load i32, i32* %nj.addr, align 4, !dbg !878
  %cmp12 = icmp slt i32 %16, %17, !dbg !879
  br i1 %cmp12, label %for.body, label %for.end, !dbg !880

for.body:                                         ; preds = %for.cond
  %18 = load double*, double** %tmp.addr, align 8, !dbg !881
  %19 = load i32, i32* %i, align 4, !dbg !882
  %20 = load i32, i32* %nj.addr, align 4, !dbg !883
  %mul13 = mul nsw i32 %19, %20, !dbg !884
  %21 = load i32, i32* %j, align 4, !dbg !885
  %add14 = add nsw i32 %mul13, %21, !dbg !886
  %idxprom15 = sext i32 %add14 to i64, !dbg !881
  %arrayidx16 = getelementptr inbounds double, double* %18, i64 %idxprom15, !dbg !881
  %22 = load double, double* %arrayidx16, align 8, !dbg !881
  %23 = load double*, double** %C.addr, align 8, !dbg !887
  %24 = load i32, i32* %j, align 4, !dbg !888
  %25 = load i32, i32* %nl.addr, align 4, !dbg !889
  %mul17 = mul nsw i32 %24, %25, !dbg !890
  %26 = load i32, i32* %l, align 4, !dbg !891
  %add18 = add nsw i32 %mul17, %26, !dbg !892
  %idxprom19 = sext i32 %add18 to i64, !dbg !887
  %arrayidx20 = getelementptr inbounds double, double* %23, i64 %idxprom19, !dbg !887
  %27 = load double, double* %arrayidx20, align 8, !dbg !887
  %mul21 = fmul contract double %22, %27, !dbg !893
  %28 = load double*, double** %D.addr, align 8, !dbg !894
  %29 = load i32, i32* %i, align 4, !dbg !895
  %30 = load i32, i32* %nl.addr, align 4, !dbg !896
  %mul22 = mul nsw i32 %29, %30, !dbg !897
  %31 = load i32, i32* %l, align 4, !dbg !898
  %add23 = add nsw i32 %mul22, %31, !dbg !899
  %idxprom24 = sext i32 %add23 to i64, !dbg !894
  %arrayidx25 = getelementptr inbounds double, double* %28, i64 %idxprom24, !dbg !894
  %32 = load double, double* %arrayidx25, align 8, !dbg !900
  %add26 = fadd contract double %32, %mul21, !dbg !900
  store double %add26, double* %arrayidx25, align 8, !dbg !900
  br label %for.inc, !dbg !894

for.inc:                                          ; preds = %for.body
  %33 = load i32, i32* %j, align 4, !dbg !901
  %inc = add nsw i32 %33, 1, !dbg !901
  store i32 %inc, i32* %j, align 4, !dbg !901
  br label %for.cond, !dbg !902, !llvm.loop !903

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !905

if.end:                                           ; preds = %for.end, %land.lhs.true, %entry
  ret void, !dbg !906
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
!nvvm.annotations = !{!600, !601, !602, !603, !602, !604, !604, !604, !604, !605, !605, !604}
!llvm.ident = !{!606}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!607}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 7, i32 0]}
!1 = !{i32 2, !"Dwarf Version", i32 2}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !6, producer: "clang version 9.0.0 (git@github.com:SusanTan/llvm-project.git a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !7, imports: !8, nameTableKind: None)
!6 = !DIFile(filename: "2mm.cu", directory: "/u/NAS_SCRATCH/yc0769/xstack-benchmark/polybench-cuda/2mm")
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
!600 = !{void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @_Z14kernel_A_mul_BiiiiddPdS_S_S_S_, !"kernel", i32 1}
!601 = !{void (i32, i32, i32, i32, double, double, double*, double*, double*, double*, double*)* @_Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S_, !"kernel", i32 1}
!602 = !{null, !"align", i32 8}
!603 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!604 = !{null, !"align", i32 16}
!605 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!606 = !{!"clang version 9.0.0 (git@github.com:SusanTan/llvm-project.git a1efa594106d738d0b74c9e4e2b9b779eb8b7d25)"}
!607 = !{i32 1, i32 2}
!608 = distinct !DISubprogram(name: "kernel_A_mul_B", linkageName: "_Z14kernel_A_mul_BiiiiddPdS_S_S_S_", scope: !6, file: !6, line: 15, type: !609, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!609 = !DISubroutineType(types: !610)
!610 = !{null, !15, !15, !15, !15, !156, !156, !250, !250, !250, !250, !250}
!611 = !DILocalVariable(name: "ni", arg: 1, scope: !608, file: !6, line: 15, type: !15)
!612 = !DILocation(line: 15, column: 36, scope: !608)
!613 = !DILocalVariable(name: "nj", arg: 2, scope: !608, file: !6, line: 15, type: !15)
!614 = !DILocation(line: 15, column: 44, scope: !608)
!615 = !DILocalVariable(name: "nk", arg: 3, scope: !608, file: !6, line: 15, type: !15)
!616 = !DILocation(line: 15, column: 52, scope: !608)
!617 = !DILocalVariable(name: "nl", arg: 4, scope: !608, file: !6, line: 15, type: !15)
!618 = !DILocation(line: 15, column: 60, scope: !608)
!619 = !DILocalVariable(name: "alpha", arg: 5, scope: !608, file: !6, line: 16, type: !156)
!620 = !DILocation(line: 16, column: 39, scope: !608)
!621 = !DILocalVariable(name: "beta", arg: 6, scope: !608, file: !6, line: 16, type: !156)
!622 = !DILocation(line: 16, column: 53, scope: !608)
!623 = !DILocalVariable(name: "tmp", arg: 7, scope: !608, file: !6, line: 17, type: !250)
!624 = !DILocation(line: 17, column: 40, scope: !608)
!625 = !DILocalVariable(name: "A", arg: 8, scope: !608, file: !6, line: 18, type: !250)
!626 = !DILocation(line: 18, column: 40, scope: !608)
!627 = !DILocalVariable(name: "B", arg: 9, scope: !608, file: !6, line: 19, type: !250)
!628 = !DILocation(line: 19, column: 40, scope: !608)
!629 = !DILocalVariable(name: "C", arg: 10, scope: !608, file: !6, line: 19, type: !250)
!630 = !DILocation(line: 19, column: 51, scope: !608)
!631 = !DILocalVariable(name: "D", arg: 11, scope: !608, file: !6, line: 19, type: !250)
!632 = !DILocation(line: 19, column: 62, scope: !608)
!633 = !DILocalVariable(name: "i", scope: !608, file: !6, line: 20, type: !15)
!634 = !DILocation(line: 20, column: 7, scope: !608)
!635 = !DILocation(line: 75, column: 3, scope: !636, inlinedAt: !687)
!636 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !638, file: !637, line: 75, type: !641, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !640, retainedNodes: !7)
!637 = !DIFile(filename: "xstack/llvm-install-debug/lib/clang/9.0.0/include/__clang_cuda_builtin_vars.h", directory: "/u/NAS_SCRATCH/yc0769")
!638 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockDim_t", file: !637, line: 74, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !639, identifier: "_ZTS25__cuda_builtin_blockDim_t")
!639 = !{!640, !643, !644, !645, !672, !676, !680, !683}
!640 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !638, file: !637, line: 75, type: !641, scopeLine: 75, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!641 = !DISubroutineType(types: !642)
!642 = !{!369}
!643 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !638, file: !637, line: 76, type: !641, scopeLine: 76, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!644 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_zEv", scope: !638, file: !637, line: 77, type: !641, scopeLine: 77, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!645 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__cuda_builtin_blockDim_tcv4dim3Ev", scope: !638, file: !637, line: 80, type: !646, scopeLine: 80, flags: DIFlagPrototyped, spFlags: 0)
!646 = !DISubroutineType(types: !647)
!647 = !{!648, !670}
!648 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !649, line: 417, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !650, identifier: "_ZTS4dim3")
!649 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "")
!650 = !{!651, !652, !653, !654, !658, !667}
!651 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !648, file: !649, line: 419, baseType: !369, size: 32)
!652 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !648, file: !649, line: 419, baseType: !369, size: 32, offset: 32)
!653 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !648, file: !649, line: 419, baseType: !369, size: 32, offset: 64)
!654 = !DISubprogram(name: "dim3", scope: !648, file: !649, line: 421, type: !655, scopeLine: 421, flags: DIFlagPrototyped, spFlags: 0)
!655 = !DISubroutineType(types: !656)
!656 = !{null, !657, !369, !369, !369}
!657 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !648, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!658 = !DISubprogram(name: "dim3", scope: !648, file: !649, line: 422, type: !659, scopeLine: 422, flags: DIFlagPrototyped, spFlags: 0)
!659 = !DISubroutineType(types: !660)
!660 = !{null, !657, !661}
!661 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !649, line: 383, baseType: !662)
!662 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !649, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !663, identifier: "_ZTS5uint3")
!663 = !{!664, !665, !666}
!664 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !662, file: !649, line: 192, baseType: !369, size: 32)
!665 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !662, file: !649, line: 192, baseType: !369, size: 32, offset: 32)
!666 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !662, file: !649, line: 192, baseType: !369, size: 32, offset: 64)
!667 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !648, file: !649, line: 423, type: !668, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!668 = !DISubroutineType(types: !669)
!669 = !{!661, !657}
!670 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !671, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!671 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !638)
!672 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !638, file: !637, line: 82, type: !673, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!673 = !DISubroutineType(types: !674)
!674 = !{null, !675}
!675 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !638, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!676 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !638, file: !637, line: 82, type: !677, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!677 = !DISubroutineType(types: !678)
!678 = !{null, !675, !679}
!679 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !671, size: 64)
!680 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockDim_taSERKS_", scope: !638, file: !637, line: 82, type: !681, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!681 = !DISubroutineType(types: !682)
!682 = !{null, !670, !679}
!683 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockDim_tadEv", scope: !638, file: !637, line: 82, type: !684, scopeLine: 82, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!684 = !DISubroutineType(types: !685)
!685 = !{!686, !670}
!686 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !638, size: 64)
!687 = distinct !DILocation(line: 20, column: 11, scope: !608)
!688 = !{i32 1, i32 1025}
!689 = !DILocation(line: 64, column: 3, scope: !690, inlinedAt: !716)
!690 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !691, file: !637, line: 64, type: !641, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !693, retainedNodes: !7)
!691 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !637, line: 63, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !692, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!692 = !{!693, !694, !695, !696, !701, !705, !709, !712}
!693 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !691, file: !637, line: 64, type: !641, scopeLine: 64, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!694 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !691, file: !637, line: 65, type: !641, scopeLine: 65, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!695 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !691, file: !637, line: 66, type: !641, scopeLine: 66, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!696 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !691, file: !637, line: 69, type: !697, scopeLine: 69, flags: DIFlagPrototyped, spFlags: 0)
!697 = !DISubroutineType(types: !698)
!698 = !{!662, !699}
!699 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !700, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!700 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !691)
!701 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !691, file: !637, line: 71, type: !702, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!702 = !DISubroutineType(types: !703)
!703 = !{null, !704}
!704 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !691, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!705 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !691, file: !637, line: 71, type: !706, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!706 = !DISubroutineType(types: !707)
!707 = !{null, !704, !708}
!708 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !700, size: 64)
!709 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !691, file: !637, line: 71, type: !710, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!710 = !DISubroutineType(types: !711)
!711 = !{null, !699, !708}
!712 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !691, file: !637, line: 71, type: !713, scopeLine: 71, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!713 = !DISubroutineType(types: !714)
!714 = !{!715, !699}
!715 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !691, size: 64)
!716 = distinct !DILocation(line: 20, column: 24, scope: !608)
!717 = !{i32 0, i32 65535}
!718 = !DILocation(line: 20, column: 22, scope: !608)
!719 = !DILocation(line: 53, column: 3, scope: !720, inlinedAt: !746)
!720 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !721, file: !637, line: 53, type: !641, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !723, retainedNodes: !7)
!721 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !637, line: 52, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !722, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!722 = !{!723, !724, !725, !726, !731, !735, !739, !742}
!723 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !721, file: !637, line: 53, type: !641, scopeLine: 53, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!724 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !721, file: !637, line: 54, type: !641, scopeLine: 54, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!725 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !721, file: !637, line: 55, type: !641, scopeLine: 55, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!726 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !721, file: !637, line: 58, type: !727, scopeLine: 58, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DISubroutineType(types: !728)
!728 = !{!662, !729}
!729 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !730, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!730 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !721)
!731 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !721, file: !637, line: 60, type: !732, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!732 = !DISubroutineType(types: !733)
!733 = !{null, !734}
!734 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !721, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!735 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !721, file: !637, line: 60, type: !736, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!736 = !DISubroutineType(types: !737)
!737 = !{null, !734, !738}
!738 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !730, size: 64)
!739 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !721, file: !637, line: 60, type: !740, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!740 = !DISubroutineType(types: !741)
!741 = !{null, !729, !738}
!742 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !721, file: !637, line: 60, type: !743, scopeLine: 60, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: 0)
!743 = !DISubroutineType(types: !744)
!744 = !{!745, !729}
!745 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !721, size: 64)
!746 = distinct !DILocation(line: 20, column: 37, scope: !608)
!747 = !{i32 0, i32 1024}
!748 = !DILocation(line: 20, column: 35, scope: !608)
!749 = !DILocalVariable(name: "j", scope: !608, file: !6, line: 21, type: !15)
!750 = !DILocation(line: 21, column: 7, scope: !608)
!751 = !DILocation(line: 76, column: 3, scope: !752, inlinedAt: !753)
!752 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !638, file: !637, line: 76, type: !641, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !643, retainedNodes: !7)
!753 = distinct !DILocation(line: 21, column: 11, scope: !608)
!754 = !DILocation(line: 65, column: 3, scope: !755, inlinedAt: !756)
!755 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !691, file: !637, line: 65, type: !641, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !694, retainedNodes: !7)
!756 = distinct !DILocation(line: 21, column: 24, scope: !608)
!757 = !DILocation(line: 21, column: 22, scope: !608)
!758 = !DILocation(line: 54, column: 3, scope: !759, inlinedAt: !760)
!759 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !721, file: !637, line: 54, type: !641, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, declaration: !724, retainedNodes: !7)
!760 = distinct !DILocation(line: 21, column: 37, scope: !608)
!761 = !DILocation(line: 21, column: 35, scope: !608)
!762 = !DILocalVariable(name: "k", scope: !608, file: !6, line: 22, type: !15)
!763 = !DILocation(line: 22, column: 7, scope: !608)
!764 = !DILocation(line: 25, column: 7, scope: !765)
!765 = distinct !DILexicalBlock(scope: !608, file: !6, line: 25, column: 7)
!766 = !DILocation(line: 25, column: 11, scope: !765)
!767 = !DILocation(line: 25, column: 9, scope: !765)
!768 = !DILocation(line: 25, column: 14, scope: !765)
!769 = !DILocation(line: 25, column: 17, scope: !765)
!770 = !DILocation(line: 25, column: 21, scope: !765)
!771 = !DILocation(line: 25, column: 19, scope: !765)
!772 = !DILocation(line: 25, column: 7, scope: !608)
!773 = !DILocation(line: 26, column: 12, scope: !774)
!774 = distinct !DILexicalBlock(scope: !775, file: !6, line: 26, column: 5)
!775 = distinct !DILexicalBlock(scope: !765, file: !6, line: 25, column: 25)
!776 = !DILocation(line: 26, column: 10, scope: !774)
!777 = !DILocation(line: 26, column: 17, scope: !778)
!778 = distinct !DILexicalBlock(scope: !774, file: !6, line: 26, column: 5)
!779 = !DILocation(line: 26, column: 21, scope: !778)
!780 = !DILocation(line: 26, column: 19, scope: !778)
!781 = !DILocation(line: 26, column: 5, scope: !774)
!782 = !DILocation(line: 27, column: 26, scope: !778)
!783 = !DILocation(line: 27, column: 34, scope: !778)
!784 = !DILocation(line: 27, column: 36, scope: !778)
!785 = !DILocation(line: 27, column: 40, scope: !778)
!786 = !DILocation(line: 27, column: 38, scope: !778)
!787 = !DILocation(line: 27, column: 45, scope: !778)
!788 = !DILocation(line: 27, column: 43, scope: !778)
!789 = !DILocation(line: 27, column: 32, scope: !778)
!790 = !DILocation(line: 27, column: 50, scope: !778)
!791 = !DILocation(line: 27, column: 52, scope: !778)
!792 = !DILocation(line: 27, column: 56, scope: !778)
!793 = !DILocation(line: 27, column: 54, scope: !778)
!794 = !DILocation(line: 27, column: 61, scope: !778)
!795 = !DILocation(line: 27, column: 59, scope: !778)
!796 = !DILocation(line: 27, column: 48, scope: !778)
!797 = !DILocation(line: 27, column: 7, scope: !778)
!798 = !DILocation(line: 27, column: 11, scope: !778)
!799 = !DILocation(line: 27, column: 15, scope: !778)
!800 = !DILocation(line: 27, column: 13, scope: !778)
!801 = !DILocation(line: 27, column: 20, scope: !778)
!802 = !DILocation(line: 27, column: 18, scope: !778)
!803 = !DILocation(line: 27, column: 23, scope: !778)
!804 = !DILocation(line: 26, column: 26, scope: !778)
!805 = !DILocation(line: 26, column: 5, scope: !778)
!806 = distinct !{!806, !781, !807}
!807 = !DILocation(line: 27, column: 62, scope: !774)
!808 = !DILocation(line: 28, column: 3, scope: !775)
!809 = !DILocation(line: 29, column: 1, scope: !608)
!810 = distinct !DISubprogram(name: "kernel_D_plus_tmp_mul_C", linkageName: "_Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S_", scope: !6, file: !6, line: 33, type: !609, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!811 = !DILocalVariable(name: "ni", arg: 1, scope: !810, file: !6, line: 33, type: !15)
!812 = !DILocation(line: 33, column: 45, scope: !810)
!813 = !DILocalVariable(name: "nj", arg: 2, scope: !810, file: !6, line: 33, type: !15)
!814 = !DILocation(line: 33, column: 53, scope: !810)
!815 = !DILocalVariable(name: "nk", arg: 3, scope: !810, file: !6, line: 33, type: !15)
!816 = !DILocation(line: 33, column: 61, scope: !810)
!817 = !DILocalVariable(name: "nl", arg: 4, scope: !810, file: !6, line: 33, type: !15)
!818 = !DILocation(line: 33, column: 69, scope: !810)
!819 = !DILocalVariable(name: "alpha", arg: 5, scope: !810, file: !6, line: 34, type: !156)
!820 = !DILocation(line: 34, column: 48, scope: !810)
!821 = !DILocalVariable(name: "beta", arg: 6, scope: !810, file: !6, line: 34, type: !156)
!822 = !DILocation(line: 34, column: 62, scope: !810)
!823 = !DILocalVariable(name: "tmp", arg: 7, scope: !810, file: !6, line: 35, type: !250)
!824 = !DILocation(line: 35, column: 49, scope: !810)
!825 = !DILocalVariable(name: "A", arg: 8, scope: !810, file: !6, line: 36, type: !250)
!826 = !DILocation(line: 36, column: 49, scope: !810)
!827 = !DILocalVariable(name: "B", arg: 9, scope: !810, file: !6, line: 37, type: !250)
!828 = !DILocation(line: 37, column: 49, scope: !810)
!829 = !DILocalVariable(name: "C", arg: 10, scope: !810, file: !6, line: 37, type: !250)
!830 = !DILocation(line: 37, column: 60, scope: !810)
!831 = !DILocalVariable(name: "D", arg: 11, scope: !810, file: !6, line: 37, type: !250)
!832 = !DILocation(line: 37, column: 71, scope: !810)
!833 = !DILocalVariable(name: "i", scope: !810, file: !6, line: 38, type: !15)
!834 = !DILocation(line: 38, column: 7, scope: !810)
!835 = !DILocation(line: 75, column: 3, scope: !636, inlinedAt: !836)
!836 = distinct !DILocation(line: 38, column: 11, scope: !810)
!837 = !DILocation(line: 64, column: 3, scope: !690, inlinedAt: !838)
!838 = distinct !DILocation(line: 38, column: 24, scope: !810)
!839 = !DILocation(line: 38, column: 22, scope: !810)
!840 = !DILocation(line: 53, column: 3, scope: !720, inlinedAt: !841)
!841 = distinct !DILocation(line: 38, column: 37, scope: !810)
!842 = !DILocation(line: 38, column: 35, scope: !810)
!843 = !DILocalVariable(name: "l", scope: !810, file: !6, line: 39, type: !15)
!844 = !DILocation(line: 39, column: 7, scope: !810)
!845 = !DILocation(line: 76, column: 3, scope: !752, inlinedAt: !846)
!846 = distinct !DILocation(line: 39, column: 11, scope: !810)
!847 = !DILocation(line: 65, column: 3, scope: !755, inlinedAt: !848)
!848 = distinct !DILocation(line: 39, column: 24, scope: !810)
!849 = !DILocation(line: 39, column: 22, scope: !810)
!850 = !DILocation(line: 54, column: 3, scope: !759, inlinedAt: !851)
!851 = distinct !DILocation(line: 39, column: 37, scope: !810)
!852 = !DILocation(line: 39, column: 35, scope: !810)
!853 = !DILocalVariable(name: "j", scope: !810, file: !6, line: 40, type: !15)
!854 = !DILocation(line: 40, column: 7, scope: !810)
!855 = !DILocation(line: 43, column: 7, scope: !856)
!856 = distinct !DILexicalBlock(scope: !810, file: !6, line: 43, column: 7)
!857 = !DILocation(line: 43, column: 11, scope: !856)
!858 = !DILocation(line: 43, column: 9, scope: !856)
!859 = !DILocation(line: 43, column: 14, scope: !856)
!860 = !DILocation(line: 43, column: 17, scope: !856)
!861 = !DILocation(line: 43, column: 21, scope: !856)
!862 = !DILocation(line: 43, column: 19, scope: !856)
!863 = !DILocation(line: 43, column: 7, scope: !810)
!864 = !DILocation(line: 44, column: 22, scope: !865)
!865 = distinct !DILexicalBlock(scope: !856, file: !6, line: 43, column: 25)
!866 = !DILocation(line: 44, column: 5, scope: !865)
!867 = !DILocation(line: 44, column: 7, scope: !865)
!868 = !DILocation(line: 44, column: 11, scope: !865)
!869 = !DILocation(line: 44, column: 9, scope: !865)
!870 = !DILocation(line: 44, column: 16, scope: !865)
!871 = !DILocation(line: 44, column: 14, scope: !865)
!872 = !DILocation(line: 44, column: 19, scope: !865)
!873 = !DILocation(line: 47, column: 12, scope: !874)
!874 = distinct !DILexicalBlock(scope: !865, file: !6, line: 47, column: 5)
!875 = !DILocation(line: 47, column: 10, scope: !874)
!876 = !DILocation(line: 47, column: 17, scope: !877)
!877 = distinct !DILexicalBlock(scope: !874, file: !6, line: 47, column: 5)
!878 = !DILocation(line: 47, column: 21, scope: !877)
!879 = !DILocation(line: 47, column: 19, scope: !877)
!880 = !DILocation(line: 47, column: 5, scope: !874)
!881 = !DILocation(line: 48, column: 24, scope: !877)
!882 = !DILocation(line: 48, column: 28, scope: !877)
!883 = !DILocation(line: 48, column: 32, scope: !877)
!884 = !DILocation(line: 48, column: 30, scope: !877)
!885 = !DILocation(line: 48, column: 37, scope: !877)
!886 = !DILocation(line: 48, column: 35, scope: !877)
!887 = !DILocation(line: 48, column: 42, scope: !877)
!888 = !DILocation(line: 48, column: 44, scope: !877)
!889 = !DILocation(line: 48, column: 48, scope: !877)
!890 = !DILocation(line: 48, column: 46, scope: !877)
!891 = !DILocation(line: 48, column: 53, scope: !877)
!892 = !DILocation(line: 48, column: 51, scope: !877)
!893 = !DILocation(line: 48, column: 40, scope: !877)
!894 = !DILocation(line: 48, column: 7, scope: !877)
!895 = !DILocation(line: 48, column: 9, scope: !877)
!896 = !DILocation(line: 48, column: 13, scope: !877)
!897 = !DILocation(line: 48, column: 11, scope: !877)
!898 = !DILocation(line: 48, column: 18, scope: !877)
!899 = !DILocation(line: 48, column: 16, scope: !877)
!900 = !DILocation(line: 48, column: 21, scope: !877)
!901 = !DILocation(line: 47, column: 26, scope: !877)
!902 = !DILocation(line: 47, column: 5, scope: !877)
!903 = distinct !{!903, !880, !904}
!904 = !DILocation(line: 48, column: 54, scope: !874)
!905 = !DILocation(line: 49, column: 3, scope: !865)
!906 = !DILocation(line: 50, column: 1, scope: !810)
