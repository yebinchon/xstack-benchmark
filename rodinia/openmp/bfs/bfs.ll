; ModuleID = 'bfs.ll'
source_filename = "bfs.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.Node = type { i32, i32 }

@fp = dso_local global %struct._IO_FILE* null, align 8, !dbg !0
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [38 x i8] c"Usage: %s <num_threads> <input_file>\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"Reading File\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [26 x i8] c"Error Reading graph file\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.6 = private unnamed_addr constant [27 x i8] c"Start traversing the tree\0A\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"Compute time: %lf\0A\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"result.txt\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"%d) cost:%d\0A\00", align 1
@.str.11 = private unnamed_addr constant [29 x i8] c"Result stored in result.txt\0A\00", align 1

; Function Attrs: noinline uwtable
define dso_local void @_Z5UsageiPPc(i32 %argc, i8** %argv) #0 !dbg !605 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !608, metadata !DIExpression()), !dbg !609
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !610, metadata !DIExpression()), !dbg !611
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !612
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !613
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !613
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !613
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i8* %2), !dbg !614
  ret void, !dbg !615
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #3 !dbg !616 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !619, metadata !DIExpression()), !dbg !620
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !621, metadata !DIExpression()), !dbg !622
  %0 = load i32, i32* %argc.addr, align 4, !dbg !623
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !624
  call void @_Z8BFSGraphiPPc(i32 %0, i8** %1), !dbg !625
  ret i32 0, !dbg !626
}

; Function Attrs: noinline uwtable
define dso_local void @_Z8BFSGraphiPPc(i32 %argc, i8** %argv) #0 !dbg !627 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %no_of_nodes = alloca i32, align 4
  %edge_list_size = alloca i32, align 4
  %input_f = alloca i8*, align 8
  %num_omp_threads = alloca i32, align 4
  %source = alloca i32, align 4
  %h_graph_nodes = alloca %struct.Node*, align 8
  %h_graph_mask = alloca i8*, align 8
  %h_updating_graph_mask = alloca i8*, align 8
  %h_graph_visited = alloca i8*, align 8
  %start = alloca i32, align 4
  %edgeno = alloca i32, align 4
  %i = alloca i32, align 4
  %id = alloca i32, align 4
  %cost = alloca i32, align 4
  %h_graph_edges = alloca i32*, align 8
  %i38 = alloca i32, align 4
  %h_cost = alloca i32*, align 8
  %i56 = alloca i32, align 4
  %k = alloca i32, align 4
  %start_time = alloca double, align 8
  %stop = alloca i8, align 1
  %tid = alloca i32, align 4
  %i80 = alloca i32, align 4
  %id93 = alloca i32, align 4
  %tid115 = alloca i32, align 4
  %end_time = alloca double, align 8
  %fpo = alloca %struct._IO_FILE*, align 8
  %i140 = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !628, metadata !DIExpression()), !dbg !629
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !630, metadata !DIExpression()), !dbg !631
  call void @llvm.dbg.declare(metadata i32* %no_of_nodes, metadata !632, metadata !DIExpression()), !dbg !633
  store i32 0, i32* %no_of_nodes, align 4, !dbg !633
  call void @llvm.dbg.declare(metadata i32* %edge_list_size, metadata !634, metadata !DIExpression()), !dbg !635
  store i32 0, i32* %edge_list_size, align 4, !dbg !635
  call void @llvm.dbg.declare(metadata i8** %input_f, metadata !636, metadata !DIExpression()), !dbg !637
  call void @llvm.dbg.declare(metadata i32* %num_omp_threads, metadata !638, metadata !DIExpression()), !dbg !639
  %0 = load i32, i32* %argc.addr, align 4, !dbg !640
  %cmp = icmp ne i32 %0, 3, !dbg !642
  br i1 %cmp, label %if.then, label %if.end, !dbg !643

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %argc.addr, align 4, !dbg !644
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !646
  call void @_Z5UsageiPPc(i32 %1, i8** %2), !dbg !647
  call void @exit(i32 0) #7, !dbg !648
  unreachable, !dbg !648

if.end:                                           ; preds = %entry
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !649
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !649
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !649
  %call = call i32 @atoi(i8* %4) #8, !dbg !650
  store i32 %call, i32* %num_omp_threads, align 4, !dbg !651
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !652
  %arrayidx1 = getelementptr inbounds i8*, i8** %5, i64 2, !dbg !652
  %6 = load i8*, i8** %arrayidx1, align 8, !dbg !652
  store i8* %6, i8** %input_f, align 8, !dbg !653
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0)), !dbg !654
  %7 = load i8*, i8** %input_f, align 8, !dbg !655
  %call3 = call %struct._IO_FILE* @fopen(i8* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !656
  store %struct._IO_FILE* %call3, %struct._IO_FILE** @fp, align 8, !dbg !657
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !658
  %tobool = icmp ne %struct._IO_FILE* %8, null, !dbg !658
  br i1 %tobool, label %if.end6, label %if.then4, !dbg !660

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3, i64 0, i64 0)), !dbg !661
  br label %return, !dbg !663

if.end6:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %source, metadata !664, metadata !DIExpression()), !dbg !665
  store i32 0, i32* %source, align 4, !dbg !665
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !666
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* %no_of_nodes), !dbg !667
  call void @llvm.dbg.declare(metadata %struct.Node** %h_graph_nodes, metadata !668, metadata !DIExpression()), !dbg !669
  %10 = load i32, i32* %no_of_nodes, align 4, !dbg !670
  %conv = sext i32 %10 to i64, !dbg !670
  %mul = mul i64 8, %conv, !dbg !671
  %call8 = call noalias i8* @malloc(i64 %mul) #9, !dbg !672
  %11 = bitcast i8* %call8 to %struct.Node*, !dbg !673
  store %struct.Node* %11, %struct.Node** %h_graph_nodes, align 8, !dbg !669
  call void @llvm.dbg.declare(metadata i8** %h_graph_mask, metadata !674, metadata !DIExpression()), !dbg !675
  %12 = load i32, i32* %no_of_nodes, align 4, !dbg !676
  %conv9 = sext i32 %12 to i64, !dbg !676
  %mul10 = mul i64 1, %conv9, !dbg !677
  %call11 = call noalias i8* @malloc(i64 %mul10) #9, !dbg !678
  store i8* %call11, i8** %h_graph_mask, align 8, !dbg !675
  call void @llvm.dbg.declare(metadata i8** %h_updating_graph_mask, metadata !679, metadata !DIExpression()), !dbg !680
  %13 = load i32, i32* %no_of_nodes, align 4, !dbg !681
  %conv12 = sext i32 %13 to i64, !dbg !681
  %mul13 = mul i64 1, %conv12, !dbg !682
  %call14 = call noalias i8* @malloc(i64 %mul13) #9, !dbg !683
  store i8* %call14, i8** %h_updating_graph_mask, align 8, !dbg !680
  call void @llvm.dbg.declare(metadata i8** %h_graph_visited, metadata !684, metadata !DIExpression()), !dbg !685
  %14 = load i32, i32* %no_of_nodes, align 4, !dbg !686
  %conv15 = sext i32 %14 to i64, !dbg !686
  %mul16 = mul i64 1, %conv15, !dbg !687
  %call17 = call noalias i8* @malloc(i64 %mul16) #9, !dbg !688
  store i8* %call17, i8** %h_graph_visited, align 8, !dbg !685
  call void @llvm.dbg.declare(metadata i32* %start, metadata !689, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.declare(metadata i32* %edgeno, metadata !691, metadata !DIExpression()), !dbg !692
  call void @llvm.dbg.declare(metadata i32* %i, metadata !693, metadata !DIExpression()), !dbg !695
  store i32 0, i32* %i, align 4, !dbg !695
  br label %for.cond, !dbg !696

for.cond:                                         ; preds = %for.inc, %if.end6
  %15 = load i32, i32* %i, align 4, !dbg !697
  %16 = load i32, i32* %no_of_nodes, align 4, !dbg !699
  %cmp18 = icmp ult i32 %15, %16, !dbg !700
  br i1 %cmp18, label %for.body, label %for.end, !dbg !701

for.body:                                         ; preds = %for.cond
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !702
  %call19 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i32* %start, i32* %edgeno), !dbg !704
  %18 = load i32, i32* %start, align 4, !dbg !705
  %19 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !706
  %20 = load i32, i32* %i, align 4, !dbg !707
  %idxprom = zext i32 %20 to i64, !dbg !706
  %arrayidx20 = getelementptr inbounds %struct.Node, %struct.Node* %19, i64 %idxprom, !dbg !706
  %starting = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx20, i32 0, i32 0, !dbg !708
  store i32 %18, i32* %starting, align 4, !dbg !709
  %21 = load i32, i32* %edgeno, align 4, !dbg !710
  %22 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !711
  %23 = load i32, i32* %i, align 4, !dbg !712
  %idxprom21 = zext i32 %23 to i64, !dbg !711
  %arrayidx22 = getelementptr inbounds %struct.Node, %struct.Node* %22, i64 %idxprom21, !dbg !711
  %no_of_edges = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx22, i32 0, i32 1, !dbg !713
  store i32 %21, i32* %no_of_edges, align 4, !dbg !714
  %24 = load i8*, i8** %h_graph_mask, align 8, !dbg !715
  %25 = load i32, i32* %i, align 4, !dbg !716
  %idxprom23 = zext i32 %25 to i64, !dbg !715
  %arrayidx24 = getelementptr inbounds i8, i8* %24, i64 %idxprom23, !dbg !715
  store i8 0, i8* %arrayidx24, align 1, !dbg !717
  %26 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !718
  %27 = load i32, i32* %i, align 4, !dbg !719
  %idxprom25 = zext i32 %27 to i64, !dbg !718
  %arrayidx26 = getelementptr inbounds i8, i8* %26, i64 %idxprom25, !dbg !718
  store i8 0, i8* %arrayidx26, align 1, !dbg !720
  %28 = load i8*, i8** %h_graph_visited, align 8, !dbg !721
  %29 = load i32, i32* %i, align 4, !dbg !722
  %idxprom27 = zext i32 %29 to i64, !dbg !721
  %arrayidx28 = getelementptr inbounds i8, i8* %28, i64 %idxprom27, !dbg !721
  store i8 0, i8* %arrayidx28, align 1, !dbg !723
  br label %for.inc, !dbg !724

for.inc:                                          ; preds = %for.body
  %30 = load i32, i32* %i, align 4, !dbg !725
  %inc = add i32 %30, 1, !dbg !725
  store i32 %inc, i32* %i, align 4, !dbg !725
  br label %for.cond, !dbg !726, !llvm.loop !727

for.end:                                          ; preds = %for.cond
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !729
  %call29 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* %source), !dbg !730
  %32 = load i8*, i8** %h_graph_mask, align 8, !dbg !731
  %33 = load i32, i32* %source, align 4, !dbg !732
  %idxprom30 = sext i32 %33 to i64, !dbg !731
  %arrayidx31 = getelementptr inbounds i8, i8* %32, i64 %idxprom30, !dbg !731
  store i8 1, i8* %arrayidx31, align 1, !dbg !733
  %34 = load i8*, i8** %h_graph_visited, align 8, !dbg !734
  %35 = load i32, i32* %source, align 4, !dbg !735
  %idxprom32 = sext i32 %35 to i64, !dbg !734
  %arrayidx33 = getelementptr inbounds i8, i8* %34, i64 %idxprom32, !dbg !734
  store i8 1, i8* %arrayidx33, align 1, !dbg !736
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !737
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* %edge_list_size), !dbg !738
  call void @llvm.dbg.declare(metadata i32* %id, metadata !739, metadata !DIExpression()), !dbg !740
  call void @llvm.dbg.declare(metadata i32* %cost, metadata !741, metadata !DIExpression()), !dbg !742
  call void @llvm.dbg.declare(metadata i32** %h_graph_edges, metadata !743, metadata !DIExpression()), !dbg !744
  %37 = load i32, i32* %edge_list_size, align 4, !dbg !745
  %conv35 = sext i32 %37 to i64, !dbg !745
  %mul36 = mul i64 4, %conv35, !dbg !746
  %call37 = call noalias i8* @malloc(i64 %mul36) #9, !dbg !747
  %38 = bitcast i8* %call37 to i32*, !dbg !748
  store i32* %38, i32** %h_graph_edges, align 8, !dbg !744
  call void @llvm.dbg.declare(metadata i32* %i38, metadata !749, metadata !DIExpression()), !dbg !751
  store i32 0, i32* %i38, align 4, !dbg !751
  br label %for.cond39, !dbg !752

for.cond39:                                       ; preds = %for.inc46, %for.end
  %39 = load i32, i32* %i38, align 4, !dbg !753
  %40 = load i32, i32* %edge_list_size, align 4, !dbg !755
  %cmp40 = icmp slt i32 %39, %40, !dbg !756
  br i1 %cmp40, label %for.body41, label %for.end48, !dbg !757

for.body41:                                       ; preds = %for.cond39
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !758
  %call42 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* %id), !dbg !760
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !761
  %call43 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* %cost), !dbg !762
  %43 = load i32, i32* %id, align 4, !dbg !763
  %44 = load i32*, i32** %h_graph_edges, align 8, !dbg !764
  %45 = load i32, i32* %i38, align 4, !dbg !765
  %idxprom44 = sext i32 %45 to i64, !dbg !764
  %arrayidx45 = getelementptr inbounds i32, i32* %44, i64 %idxprom44, !dbg !764
  store i32 %43, i32* %arrayidx45, align 4, !dbg !766
  br label %for.inc46, !dbg !767

for.inc46:                                        ; preds = %for.body41
  %46 = load i32, i32* %i38, align 4, !dbg !768
  %inc47 = add nsw i32 %46, 1, !dbg !768
  store i32 %inc47, i32* %i38, align 4, !dbg !768
  br label %for.cond39, !dbg !769, !llvm.loop !770

for.end48:                                        ; preds = %for.cond39
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !772
  %tobool49 = icmp ne %struct._IO_FILE* %47, null, !dbg !772
  br i1 %tobool49, label %if.then50, label %if.end52, !dbg !774

if.then50:                                        ; preds = %for.end48
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !775
  %call51 = call i32 @fclose(%struct._IO_FILE* %48), !dbg !776
  br label %if.end52, !dbg !776

if.end52:                                         ; preds = %if.then50, %for.end48
  call void @llvm.dbg.declare(metadata i32** %h_cost, metadata !777, metadata !DIExpression()), !dbg !778
  %49 = load i32, i32* %no_of_nodes, align 4, !dbg !779
  %conv53 = sext i32 %49 to i64, !dbg !779
  %mul54 = mul i64 4, %conv53, !dbg !780
  %call55 = call noalias i8* @malloc(i64 %mul54) #9, !dbg !781
  %50 = bitcast i8* %call55 to i32*, !dbg !782
  store i32* %50, i32** %h_cost, align 8, !dbg !778
  call void @llvm.dbg.declare(metadata i32* %i56, metadata !783, metadata !DIExpression()), !dbg !785
  store i32 0, i32* %i56, align 4, !dbg !785
  br label %for.cond57, !dbg !786

for.cond57:                                       ; preds = %for.inc62, %if.end52
  %51 = load i32, i32* %i56, align 4, !dbg !787
  %52 = load i32, i32* %no_of_nodes, align 4, !dbg !789
  %cmp58 = icmp slt i32 %51, %52, !dbg !790
  br i1 %cmp58, label %for.body59, label %for.end64, !dbg !791

for.body59:                                       ; preds = %for.cond57
  %53 = load i32*, i32** %h_cost, align 8, !dbg !792
  %54 = load i32, i32* %i56, align 4, !dbg !793
  %idxprom60 = sext i32 %54 to i64, !dbg !792
  %arrayidx61 = getelementptr inbounds i32, i32* %53, i64 %idxprom60, !dbg !792
  store i32 -1, i32* %arrayidx61, align 4, !dbg !794
  br label %for.inc62, !dbg !792

for.inc62:                                        ; preds = %for.body59
  %55 = load i32, i32* %i56, align 4, !dbg !795
  %inc63 = add nsw i32 %55, 1, !dbg !795
  store i32 %inc63, i32* %i56, align 4, !dbg !795
  br label %for.cond57, !dbg !796, !llvm.loop !797

for.end64:                                        ; preds = %for.cond57
  %56 = load i32*, i32** %h_cost, align 8, !dbg !799
  %57 = load i32, i32* %source, align 4, !dbg !800
  %idxprom65 = sext i32 %57 to i64, !dbg !799
  %arrayidx66 = getelementptr inbounds i32, i32* %56, i64 %idxprom65, !dbg !799
  store i32 0, i32* %arrayidx66, align 4, !dbg !801
  %call67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.6, i64 0, i64 0)), !dbg !802
  call void @llvm.dbg.declare(metadata i32* %k, metadata !803, metadata !DIExpression()), !dbg !804
  store i32 0, i32* %k, align 4, !dbg !804
  call void @llvm.dbg.declare(metadata double* %start_time, metadata !805, metadata !DIExpression()), !dbg !806
  %call68 = call double @omp_get_wtime(), !dbg !807
  store double %call68, double* %start_time, align 8, !dbg !806
  call void @llvm.dbg.declare(metadata i8* %stop, metadata !808, metadata !DIExpression()), !dbg !809
  br label %do.body, !dbg !810

do.body:                                          ; preds = %do.cond, %for.end64
  store i8 0, i8* %stop, align 1, !dbg !811
  call void @llvm.dbg.declare(metadata i32* %tid, metadata !813, metadata !DIExpression()), !dbg !815
  store i32 0, i32* %tid, align 4, !dbg !815
  br label %for.cond69, !dbg !816

for.cond69:                                       ; preds = %for.inc112, %do.body
  %58 = load i32, i32* %tid, align 4, !dbg !817
  %59 = load i32, i32* %no_of_nodes, align 4, !dbg !819
  %cmp70 = icmp slt i32 %58, %59, !dbg !820
  br i1 %cmp70, label %for.body71, label %for.end114, !dbg !821

for.body71:                                       ; preds = %for.cond69
  %60 = load i8*, i8** %h_graph_mask, align 8, !dbg !822
  %61 = load i32, i32* %tid, align 4, !dbg !825
  %idxprom72 = sext i32 %61 to i64, !dbg !822
  %arrayidx73 = getelementptr inbounds i8, i8* %60, i64 %idxprom72, !dbg !822
  %62 = load i8, i8* %arrayidx73, align 1, !dbg !822
  %tobool74 = trunc i8 %62 to i1, !dbg !822
  %conv75 = zext i1 %tobool74 to i32, !dbg !822
  %cmp76 = icmp eq i32 %conv75, 1, !dbg !826
  br i1 %cmp76, label %if.then77, label %if.end111, !dbg !827

if.then77:                                        ; preds = %for.body71
  %63 = load i8*, i8** %h_graph_mask, align 8, !dbg !828
  %64 = load i32, i32* %tid, align 4, !dbg !830
  %idxprom78 = sext i32 %64 to i64, !dbg !828
  %arrayidx79 = getelementptr inbounds i8, i8* %63, i64 %idxprom78, !dbg !828
  store i8 0, i8* %arrayidx79, align 1, !dbg !831
  call void @llvm.dbg.declare(metadata i32* %i80, metadata !832, metadata !DIExpression()), !dbg !834
  %65 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !835
  %66 = load i32, i32* %tid, align 4, !dbg !836
  %idxprom81 = sext i32 %66 to i64, !dbg !835
  %arrayidx82 = getelementptr inbounds %struct.Node, %struct.Node* %65, i64 %idxprom81, !dbg !835
  %starting83 = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx82, i32 0, i32 0, !dbg !837
  %67 = load i32, i32* %starting83, align 4, !dbg !837
  store i32 %67, i32* %i80, align 4, !dbg !834
  br label %for.cond84, !dbg !838

for.cond84:                                       ; preds = %for.inc108, %if.then77
  %68 = load i32, i32* %i80, align 4, !dbg !839
  %69 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !841
  %70 = load i32, i32* %tid, align 4, !dbg !842
  %idxprom85 = sext i32 %70 to i64, !dbg !841
  %arrayidx86 = getelementptr inbounds %struct.Node, %struct.Node* %69, i64 %idxprom85, !dbg !841
  %no_of_edges87 = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx86, i32 0, i32 1, !dbg !843
  %71 = load i32, i32* %no_of_edges87, align 4, !dbg !843
  %72 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !844
  %73 = load i32, i32* %tid, align 4, !dbg !845
  %idxprom88 = sext i32 %73 to i64, !dbg !844
  %arrayidx89 = getelementptr inbounds %struct.Node, %struct.Node* %72, i64 %idxprom88, !dbg !844
  %starting90 = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx89, i32 0, i32 0, !dbg !846
  %74 = load i32, i32* %starting90, align 4, !dbg !846
  %add = add nsw i32 %71, %74, !dbg !847
  %cmp91 = icmp slt i32 %68, %add, !dbg !848
  br i1 %cmp91, label %for.body92, label %for.end110, !dbg !849

for.body92:                                       ; preds = %for.cond84
  call void @llvm.dbg.declare(metadata i32* %id93, metadata !850, metadata !DIExpression()), !dbg !852
  %75 = load i32*, i32** %h_graph_edges, align 8, !dbg !853
  %76 = load i32, i32* %i80, align 4, !dbg !854
  %idxprom94 = sext i32 %76 to i64, !dbg !853
  %arrayidx95 = getelementptr inbounds i32, i32* %75, i64 %idxprom94, !dbg !853
  %77 = load i32, i32* %arrayidx95, align 4, !dbg !853
  store i32 %77, i32* %id93, align 4, !dbg !852
  %78 = load i8*, i8** %h_graph_visited, align 8, !dbg !855
  %79 = load i32, i32* %id93, align 4, !dbg !857
  %idxprom96 = sext i32 %79 to i64, !dbg !855
  %arrayidx97 = getelementptr inbounds i8, i8* %78, i64 %idxprom96, !dbg !855
  %80 = load i8, i8* %arrayidx97, align 1, !dbg !855
  %tobool98 = trunc i8 %80 to i1, !dbg !855
  br i1 %tobool98, label %if.end107, label %if.then99, !dbg !858

if.then99:                                        ; preds = %for.body92
  %81 = load i32*, i32** %h_cost, align 8, !dbg !859
  %82 = load i32, i32* %tid, align 4, !dbg !861
  %idxprom100 = sext i32 %82 to i64, !dbg !859
  %arrayidx101 = getelementptr inbounds i32, i32* %81, i64 %idxprom100, !dbg !859
  %83 = load i32, i32* %arrayidx101, align 4, !dbg !859
  %add102 = add nsw i32 %83, 1, !dbg !862
  %84 = load i32*, i32** %h_cost, align 8, !dbg !863
  %85 = load i32, i32* %id93, align 4, !dbg !864
  %idxprom103 = sext i32 %85 to i64, !dbg !863
  %arrayidx104 = getelementptr inbounds i32, i32* %84, i64 %idxprom103, !dbg !863
  store i32 %add102, i32* %arrayidx104, align 4, !dbg !865
  %86 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !866
  %87 = load i32, i32* %id93, align 4, !dbg !867
  %idxprom105 = sext i32 %87 to i64, !dbg !866
  %arrayidx106 = getelementptr inbounds i8, i8* %86, i64 %idxprom105, !dbg !866
  store i8 1, i8* %arrayidx106, align 1, !dbg !868
  br label %if.end107, !dbg !869

if.end107:                                        ; preds = %if.then99, %for.body92
  br label %for.inc108, !dbg !870

for.inc108:                                       ; preds = %if.end107
  %88 = load i32, i32* %i80, align 4, !dbg !871
  %inc109 = add nsw i32 %88, 1, !dbg !871
  store i32 %inc109, i32* %i80, align 4, !dbg !871
  br label %for.cond84, !dbg !872, !llvm.loop !873

for.end110:                                       ; preds = %for.cond84
  br label %if.end111, !dbg !875

if.end111:                                        ; preds = %for.end110, %for.body71
  br label %for.inc112, !dbg !876

for.inc112:                                       ; preds = %if.end111
  %89 = load i32, i32* %tid, align 4, !dbg !877
  %inc113 = add nsw i32 %89, 1, !dbg !877
  store i32 %inc113, i32* %tid, align 4, !dbg !877
  br label %for.cond69, !dbg !878, !llvm.loop !879

for.end114:                                       ; preds = %for.cond69
  call void @llvm.dbg.declare(metadata i32* %tid115, metadata !881, metadata !DIExpression()), !dbg !883
  store i32 0, i32* %tid115, align 4, !dbg !883
  br label %for.cond116, !dbg !884

for.cond116:                                      ; preds = %for.inc132, %for.end114
  %90 = load i32, i32* %tid115, align 4, !dbg !885
  %91 = load i32, i32* %no_of_nodes, align 4, !dbg !887
  %cmp117 = icmp slt i32 %90, %91, !dbg !888
  br i1 %cmp117, label %for.body118, label %for.end134, !dbg !889

for.body118:                                      ; preds = %for.cond116
  %92 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !890
  %93 = load i32, i32* %tid115, align 4, !dbg !893
  %idxprom119 = sext i32 %93 to i64, !dbg !890
  %arrayidx120 = getelementptr inbounds i8, i8* %92, i64 %idxprom119, !dbg !890
  %94 = load i8, i8* %arrayidx120, align 1, !dbg !890
  %tobool121 = trunc i8 %94 to i1, !dbg !890
  %conv122 = zext i1 %tobool121 to i32, !dbg !890
  %cmp123 = icmp eq i32 %conv122, 1, !dbg !894
  br i1 %cmp123, label %if.then124, label %if.end131, !dbg !895

if.then124:                                       ; preds = %for.body118
  %95 = load i8*, i8** %h_graph_mask, align 8, !dbg !896
  %96 = load i32, i32* %tid115, align 4, !dbg !898
  %idxprom125 = sext i32 %96 to i64, !dbg !896
  %arrayidx126 = getelementptr inbounds i8, i8* %95, i64 %idxprom125, !dbg !896
  store i8 1, i8* %arrayidx126, align 1, !dbg !899
  %97 = load i8*, i8** %h_graph_visited, align 8, !dbg !900
  %98 = load i32, i32* %tid115, align 4, !dbg !901
  %idxprom127 = sext i32 %98 to i64, !dbg !900
  %arrayidx128 = getelementptr inbounds i8, i8* %97, i64 %idxprom127, !dbg !900
  store i8 1, i8* %arrayidx128, align 1, !dbg !902
  store i8 1, i8* %stop, align 1, !dbg !903
  %99 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !904
  %100 = load i32, i32* %tid115, align 4, !dbg !905
  %idxprom129 = sext i32 %100 to i64, !dbg !904
  %arrayidx130 = getelementptr inbounds i8, i8* %99, i64 %idxprom129, !dbg !904
  store i8 0, i8* %arrayidx130, align 1, !dbg !906
  br label %if.end131, !dbg !907

if.end131:                                        ; preds = %if.then124, %for.body118
  br label %for.inc132, !dbg !908

for.inc132:                                       ; preds = %if.end131
  %101 = load i32, i32* %tid115, align 4, !dbg !909
  %inc133 = add nsw i32 %101, 1, !dbg !909
  store i32 %inc133, i32* %tid115, align 4, !dbg !909
  br label %for.cond116, !dbg !910, !llvm.loop !911

for.end134:                                       ; preds = %for.cond116
  %102 = load i32, i32* %k, align 4, !dbg !913
  %inc135 = add nsw i32 %102, 1, !dbg !913
  store i32 %inc135, i32* %k, align 4, !dbg !913
  br label %do.cond, !dbg !914

do.cond:                                          ; preds = %for.end134
  %103 = load i8, i8* %stop, align 1, !dbg !915
  %tobool136 = trunc i8 %103 to i1, !dbg !915
  br i1 %tobool136, label %do.body, label %do.end, !dbg !914, !llvm.loop !916

do.end:                                           ; preds = %do.cond
  call void @llvm.dbg.declare(metadata double* %end_time, metadata !918, metadata !DIExpression()), !dbg !919
  %call137 = call double @omp_get_wtime(), !dbg !920
  store double %call137, double* %end_time, align 8, !dbg !919
  %104 = load double, double* %end_time, align 8, !dbg !921
  %105 = load double, double* %start_time, align 8, !dbg !922
  %sub = fsub double %104, %105, !dbg !923
  %call138 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i64 0, i64 0), double %sub), !dbg !924
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fpo, metadata !925, metadata !DIExpression()), !dbg !926
  %call139 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0)), !dbg !927
  store %struct._IO_FILE* %call139, %struct._IO_FILE** %fpo, align 8, !dbg !926
  call void @llvm.dbg.declare(metadata i32* %i140, metadata !928, metadata !DIExpression()), !dbg !930
  store i32 0, i32* %i140, align 4, !dbg !930
  br label %for.cond141, !dbg !931

for.cond141:                                      ; preds = %for.inc147, %do.end
  %106 = load i32, i32* %i140, align 4, !dbg !932
  %107 = load i32, i32* %no_of_nodes, align 4, !dbg !934
  %cmp142 = icmp slt i32 %106, %107, !dbg !935
  br i1 %cmp142, label %for.body143, label %for.end149, !dbg !936

for.body143:                                      ; preds = %for.cond141
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** %fpo, align 8, !dbg !937
  %109 = load i32, i32* %i140, align 4, !dbg !938
  %110 = load i32*, i32** %h_cost, align 8, !dbg !939
  %111 = load i32, i32* %i140, align 4, !dbg !940
  %idxprom144 = sext i32 %111 to i64, !dbg !939
  %arrayidx145 = getelementptr inbounds i32, i32* %110, i64 %idxprom144, !dbg !939
  %112 = load i32, i32* %arrayidx145, align 4, !dbg !939
  %call146 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %108, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 %109, i32 %112), !dbg !941
  br label %for.inc147, !dbg !941

for.inc147:                                       ; preds = %for.body143
  %113 = load i32, i32* %i140, align 4, !dbg !942
  %inc148 = add nsw i32 %113, 1, !dbg !942
  store i32 %inc148, i32* %i140, align 4, !dbg !942
  br label %for.cond141, !dbg !943, !llvm.loop !944

for.end149:                                       ; preds = %for.cond141
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** %fpo, align 8, !dbg !946
  %call150 = call i32 @fclose(%struct._IO_FILE* %114), !dbg !947
  %call151 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.11, i64 0, i64 0)), !dbg !948
  %115 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !949
  %116 = bitcast %struct.Node* %115 to i8*, !dbg !949
  call void @free(i8* %116) #9, !dbg !950
  %117 = load i32*, i32** %h_graph_edges, align 8, !dbg !951
  %118 = bitcast i32* %117 to i8*, !dbg !951
  call void @free(i8* %118) #9, !dbg !952
  %119 = load i8*, i8** %h_graph_mask, align 8, !dbg !953
  call void @free(i8* %119) #9, !dbg !954
  %120 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !955
  call void @free(i8* %120) #9, !dbg !956
  %121 = load i8*, i8** %h_graph_visited, align 8, !dbg !957
  call void @free(i8* %121) #9, !dbg !958
  %122 = load i32*, i32** %h_cost, align 8, !dbg !959
  %123 = bitcast i32* %122 to i8*, !dbg !959
  call void @free(i8* %123) #9, !dbg !960
  br label %return, !dbg !961

return:                                           ; preds = %for.end149, %if.then4
  ret void, !dbg !961
}

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #6

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

declare dso_local double @omp_get_wtime() #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!601, !602, !603}
!llvm.ident = !{!604}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "fp", scope: !2, file: !3, line: 10, type: !596, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, imports: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "bfs.cpp", directory: "/scratch/ishitac/xstack-benchmark/rodinia/openmp/bfs")
!4 = !{}
!5 = !{!6, !12, !14}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Node", file: !3, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !8, identifier: "_ZTS4Node")
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "starting", scope: !7, file: !3, line: 15, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "no_of_edges", scope: !7, file: !3, line: 16, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!15 = !{!0}
!16 = !{!17, !24, !31, !33, !35, !39, !41, !43, !45, !47, !49, !51, !53, !57, !61, !63, !65, !70, !72, !74, !76, !78, !80, !82, !85, !88, !90, !94, !99, !101, !103, !105, !107, !109, !111, !113, !115, !117, !119, !123, !127, !129, !131, !133, !135, !137, !139, !141, !143, !145, !147, !149, !151, !153, !155, !157, !161, !165, !169, !171, !173, !175, !177, !179, !181, !183, !185, !187, !191, !195, !199, !201, !203, !205, !210, !214, !218, !220, !222, !224, !226, !228, !230, !232, !234, !236, !238, !240, !242, !247, !251, !255, !257, !259, !261, !268, !272, !276, !278, !280, !282, !284, !286, !288, !292, !296, !298, !300, !302, !304, !308, !312, !316, !318, !320, !322, !324, !326, !328, !332, !336, !340, !342, !346, !350, !352, !354, !356, !358, !360, !362, !368, !373, !377, !383, !387, !392, !394, !396, !400, !404, !418, !422, !426, !430, !434, !439, !443, !447, !451, !455, !463, !467, !471, !473, !477, !481, !486, !492, !496, !500, !502, !510, !514, !521, !523, !527, !531, !535, !539, !544, !548, !552, !553, !554, !555, !557, !558, !559, !560, !561, !562, !563, !565, !566, !567, !568, !569, !570, !571, !572, !573, !574, !575, !576, !577, !578, !579, !580, !581, !582, !583, !584, !585, !586, !587, !588, !589, !590, !591, !592, !593, !594, !595}
!17 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !19, file: !23, line: 52)
!18 = !DINamespace(name: "std", scope: null)
!19 = !DISubprogram(name: "abs", scope: !20, file: !20, line: 840, type: !21, flags: DIFlagPrototyped, spFlags: 0)
!20 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!21 = !DISubroutineType(types: !22)
!22 = !{!10, !10}
!23 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/std_abs.h", directory: "")
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !25, file: !30, line: 83)
!25 = !DISubprogram(name: "acos", scope: !26, file: !26, line: 53, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!27 = !DISubroutineType(types: !28)
!28 = !{!29, !29}
!29 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!30 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cmath", directory: "")
!31 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !32, file: !30, line: 102)
!32 = !DISubprogram(name: "asin", scope: !26, file: !26, line: 55, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!33 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !34, file: !30, line: 121)
!34 = !DISubprogram(name: "atan", scope: !26, file: !26, line: 57, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !36, file: !30, line: 140)
!36 = !DISubprogram(name: "atan2", scope: !26, file: !26, line: 59, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!37 = !DISubroutineType(types: !38)
!38 = !{!29, !29, !29}
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !40, file: !30, line: 161)
!40 = !DISubprogram(name: "ceil", scope: !26, file: !26, line: 159, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !42, file: !30, line: 180)
!42 = !DISubprogram(name: "cos", scope: !26, file: !26, line: 62, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !44, file: !30, line: 199)
!44 = !DISubprogram(name: "cosh", scope: !26, file: !26, line: 71, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !46, file: !30, line: 218)
!46 = !DISubprogram(name: "exp", scope: !26, file: !26, line: 95, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !48, file: !30, line: 237)
!48 = !DISubprogram(name: "fabs", scope: !26, file: !26, line: 162, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !50, file: !30, line: 256)
!50 = !DISubprogram(name: "floor", scope: !26, file: !26, line: 165, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !52, file: !30, line: 275)
!52 = !DISubprogram(name: "fmod", scope: !26, file: !26, line: 168, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !54, file: !30, line: 296)
!54 = !DISubprogram(name: "frexp", scope: !26, file: !26, line: 98, type: !55, flags: DIFlagPrototyped, spFlags: 0)
!55 = !DISubroutineType(types: !56)
!56 = !{!29, !29, !14}
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !58, file: !30, line: 315)
!58 = !DISubprogram(name: "ldexp", scope: !26, file: !26, line: 101, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!59 = !DISubroutineType(types: !60)
!60 = !{!29, !29, !10}
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !62, file: !30, line: 334)
!62 = !DISubprogram(name: "log", scope: !26, file: !26, line: 104, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !64, file: !30, line: 353)
!64 = !DISubprogram(name: "log10", scope: !26, file: !26, line: 107, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !66, file: !30, line: 372)
!66 = !DISubprogram(name: "modf", scope: !26, file: !26, line: 110, type: !67, flags: DIFlagPrototyped, spFlags: 0)
!67 = !DISubroutineType(types: !68)
!68 = !{!29, !29, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !71, file: !30, line: 384)
!71 = !DISubprogram(name: "pow", scope: !26, file: !26, line: 140, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !73, file: !30, line: 421)
!73 = !DISubprogram(name: "sin", scope: !26, file: !26, line: 64, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !75, file: !30, line: 440)
!75 = !DISubprogram(name: "sinh", scope: !26, file: !26, line: 73, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !77, file: !30, line: 459)
!77 = !DISubprogram(name: "sqrt", scope: !26, file: !26, line: 143, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !79, file: !30, line: 478)
!79 = !DISubprogram(name: "tan", scope: !26, file: !26, line: 66, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !81, file: !30, line: 497)
!81 = !DISubprogram(name: "tanh", scope: !26, file: !26, line: 75, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !83, file: !30, line: 1065)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !84, line: 150, baseType: !29)
!84 = !DIFile(filename: "/usr/include/math.h", directory: "")
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !86, file: !30, line: 1066)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !84, line: 149, baseType: !87)
!87 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !89, file: !30, line: 1069)
!89 = !DISubprogram(name: "acosh", scope: !26, file: !26, line: 85, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !91, file: !30, line: 1070)
!91 = !DISubprogram(name: "acoshf", scope: !26, file: !26, line: 85, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!92 = !DISubroutineType(types: !93)
!93 = !{!87, !87}
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !95, file: !30, line: 1071)
!95 = !DISubprogram(name: "acoshl", scope: !26, file: !26, line: 85, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!96 = !DISubroutineType(types: !97)
!97 = !{!98, !98}
!98 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !100, file: !30, line: 1073)
!100 = !DISubprogram(name: "asinh", scope: !26, file: !26, line: 87, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !102, file: !30, line: 1074)
!102 = !DISubprogram(name: "asinhf", scope: !26, file: !26, line: 87, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !104, file: !30, line: 1075)
!104 = !DISubprogram(name: "asinhl", scope: !26, file: !26, line: 87, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !106, file: !30, line: 1077)
!106 = !DISubprogram(name: "atanh", scope: !26, file: !26, line: 89, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !108, file: !30, line: 1078)
!108 = !DISubprogram(name: "atanhf", scope: !26, file: !26, line: 89, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !110, file: !30, line: 1079)
!110 = !DISubprogram(name: "atanhl", scope: !26, file: !26, line: 89, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !112, file: !30, line: 1081)
!112 = !DISubprogram(name: "cbrt", scope: !26, file: !26, line: 152, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !114, file: !30, line: 1082)
!114 = !DISubprogram(name: "cbrtf", scope: !26, file: !26, line: 152, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !116, file: !30, line: 1083)
!116 = !DISubprogram(name: "cbrtl", scope: !26, file: !26, line: 152, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !118, file: !30, line: 1085)
!118 = !DISubprogram(name: "copysign", scope: !26, file: !26, line: 196, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !120, file: !30, line: 1086)
!120 = !DISubprogram(name: "copysignf", scope: !26, file: !26, line: 196, type: !121, flags: DIFlagPrototyped, spFlags: 0)
!121 = !DISubroutineType(types: !122)
!122 = !{!87, !87, !87}
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !124, file: !30, line: 1087)
!124 = !DISubprogram(name: "copysignl", scope: !26, file: !26, line: 196, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!125 = !DISubroutineType(types: !126)
!126 = !{!98, !98, !98}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !128, file: !30, line: 1089)
!128 = !DISubprogram(name: "erf", scope: !26, file: !26, line: 228, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !130, file: !30, line: 1090)
!130 = !DISubprogram(name: "erff", scope: !26, file: !26, line: 228, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !132, file: !30, line: 1091)
!132 = !DISubprogram(name: "erfl", scope: !26, file: !26, line: 228, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !134, file: !30, line: 1093)
!134 = !DISubprogram(name: "erfc", scope: !26, file: !26, line: 229, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !136, file: !30, line: 1094)
!136 = !DISubprogram(name: "erfcf", scope: !26, file: !26, line: 229, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !138, file: !30, line: 1095)
!138 = !DISubprogram(name: "erfcl", scope: !26, file: !26, line: 229, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !140, file: !30, line: 1097)
!140 = !DISubprogram(name: "exp2", scope: !26, file: !26, line: 130, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !142, file: !30, line: 1098)
!142 = !DISubprogram(name: "exp2f", scope: !26, file: !26, line: 130, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !144, file: !30, line: 1099)
!144 = !DISubprogram(name: "exp2l", scope: !26, file: !26, line: 130, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !146, file: !30, line: 1101)
!146 = !DISubprogram(name: "expm1", scope: !26, file: !26, line: 119, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !148, file: !30, line: 1102)
!148 = !DISubprogram(name: "expm1f", scope: !26, file: !26, line: 119, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !150, file: !30, line: 1103)
!150 = !DISubprogram(name: "expm1l", scope: !26, file: !26, line: 119, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !152, file: !30, line: 1105)
!152 = !DISubprogram(name: "fdim", scope: !26, file: !26, line: 326, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !154, file: !30, line: 1106)
!154 = !DISubprogram(name: "fdimf", scope: !26, file: !26, line: 326, type: !121, flags: DIFlagPrototyped, spFlags: 0)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !156, file: !30, line: 1107)
!156 = !DISubprogram(name: "fdiml", scope: !26, file: !26, line: 326, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !158, file: !30, line: 1109)
!158 = !DISubprogram(name: "fma", scope: !26, file: !26, line: 335, type: !159, flags: DIFlagPrototyped, spFlags: 0)
!159 = !DISubroutineType(types: !160)
!160 = !{!29, !29, !29, !29}
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !162, file: !30, line: 1110)
!162 = !DISubprogram(name: "fmaf", scope: !26, file: !26, line: 335, type: !163, flags: DIFlagPrototyped, spFlags: 0)
!163 = !DISubroutineType(types: !164)
!164 = !{!87, !87, !87, !87}
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !166, file: !30, line: 1111)
!166 = !DISubprogram(name: "fmal", scope: !26, file: !26, line: 335, type: !167, flags: DIFlagPrototyped, spFlags: 0)
!167 = !DISubroutineType(types: !168)
!168 = !{!98, !98, !98, !98}
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !170, file: !30, line: 1113)
!170 = !DISubprogram(name: "fmax", scope: !26, file: !26, line: 329, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !172, file: !30, line: 1114)
!172 = !DISubprogram(name: "fmaxf", scope: !26, file: !26, line: 329, type: !121, flags: DIFlagPrototyped, spFlags: 0)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !174, file: !30, line: 1115)
!174 = !DISubprogram(name: "fmaxl", scope: !26, file: !26, line: 329, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !176, file: !30, line: 1117)
!176 = !DISubprogram(name: "fmin", scope: !26, file: !26, line: 332, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !178, file: !30, line: 1118)
!178 = !DISubprogram(name: "fminf", scope: !26, file: !26, line: 332, type: !121, flags: DIFlagPrototyped, spFlags: 0)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !180, file: !30, line: 1119)
!180 = !DISubprogram(name: "fminl", scope: !26, file: !26, line: 332, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !182, file: !30, line: 1121)
!182 = !DISubprogram(name: "hypot", scope: !26, file: !26, line: 147, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !184, file: !30, line: 1122)
!184 = !DISubprogram(name: "hypotf", scope: !26, file: !26, line: 147, type: !121, flags: DIFlagPrototyped, spFlags: 0)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !186, file: !30, line: 1123)
!186 = !DISubprogram(name: "hypotl", scope: !26, file: !26, line: 147, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !188, file: !30, line: 1125)
!188 = !DISubprogram(name: "ilogb", scope: !26, file: !26, line: 280, type: !189, flags: DIFlagPrototyped, spFlags: 0)
!189 = !DISubroutineType(types: !190)
!190 = !{!10, !29}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !192, file: !30, line: 1126)
!192 = !DISubprogram(name: "ilogbf", scope: !26, file: !26, line: 280, type: !193, flags: DIFlagPrototyped, spFlags: 0)
!193 = !DISubroutineType(types: !194)
!194 = !{!10, !87}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !196, file: !30, line: 1127)
!196 = !DISubprogram(name: "ilogbl", scope: !26, file: !26, line: 280, type: !197, flags: DIFlagPrototyped, spFlags: 0)
!197 = !DISubroutineType(types: !198)
!198 = !{!10, !98}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !200, file: !30, line: 1129)
!200 = !DISubprogram(name: "lgamma", scope: !26, file: !26, line: 230, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !202, file: !30, line: 1130)
!202 = !DISubprogram(name: "lgammaf", scope: !26, file: !26, line: 230, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !204, file: !30, line: 1131)
!204 = !DISubprogram(name: "lgammal", scope: !26, file: !26, line: 230, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !206, file: !30, line: 1134)
!206 = !DISubprogram(name: "llrint", scope: !26, file: !26, line: 316, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!207 = !DISubroutineType(types: !208)
!208 = !{!209, !29}
!209 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !211, file: !30, line: 1135)
!211 = !DISubprogram(name: "llrintf", scope: !26, file: !26, line: 316, type: !212, flags: DIFlagPrototyped, spFlags: 0)
!212 = !DISubroutineType(types: !213)
!213 = !{!209, !87}
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !215, file: !30, line: 1136)
!215 = !DISubprogram(name: "llrintl", scope: !26, file: !26, line: 316, type: !216, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DISubroutineType(types: !217)
!217 = !{!209, !98}
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !219, file: !30, line: 1138)
!219 = !DISubprogram(name: "llround", scope: !26, file: !26, line: 322, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !221, file: !30, line: 1139)
!221 = !DISubprogram(name: "llroundf", scope: !26, file: !26, line: 322, type: !212, flags: DIFlagPrototyped, spFlags: 0)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !223, file: !30, line: 1140)
!223 = !DISubprogram(name: "llroundl", scope: !26, file: !26, line: 322, type: !216, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !225, file: !30, line: 1143)
!225 = !DISubprogram(name: "log1p", scope: !26, file: !26, line: 122, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !227, file: !30, line: 1144)
!227 = !DISubprogram(name: "log1pf", scope: !26, file: !26, line: 122, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !229, file: !30, line: 1145)
!229 = !DISubprogram(name: "log1pl", scope: !26, file: !26, line: 122, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !231, file: !30, line: 1147)
!231 = !DISubprogram(name: "log2", scope: !26, file: !26, line: 133, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !233, file: !30, line: 1148)
!233 = !DISubprogram(name: "log2f", scope: !26, file: !26, line: 133, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !235, file: !30, line: 1149)
!235 = !DISubprogram(name: "log2l", scope: !26, file: !26, line: 133, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !237, file: !30, line: 1151)
!237 = !DISubprogram(name: "logb", scope: !26, file: !26, line: 125, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !239, file: !30, line: 1152)
!239 = !DISubprogram(name: "logbf", scope: !26, file: !26, line: 125, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !241, file: !30, line: 1153)
!241 = !DISubprogram(name: "logbl", scope: !26, file: !26, line: 125, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !243, file: !30, line: 1155)
!243 = !DISubprogram(name: "lrint", scope: !26, file: !26, line: 314, type: !244, flags: DIFlagPrototyped, spFlags: 0)
!244 = !DISubroutineType(types: !245)
!245 = !{!246, !29}
!246 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !248, file: !30, line: 1156)
!248 = !DISubprogram(name: "lrintf", scope: !26, file: !26, line: 314, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!249 = !DISubroutineType(types: !250)
!250 = !{!246, !87}
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !252, file: !30, line: 1157)
!252 = !DISubprogram(name: "lrintl", scope: !26, file: !26, line: 314, type: !253, flags: DIFlagPrototyped, spFlags: 0)
!253 = !DISubroutineType(types: !254)
!254 = !{!246, !98}
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !256, file: !30, line: 1159)
!256 = !DISubprogram(name: "lround", scope: !26, file: !26, line: 320, type: !244, flags: DIFlagPrototyped, spFlags: 0)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !258, file: !30, line: 1160)
!258 = !DISubprogram(name: "lroundf", scope: !26, file: !26, line: 320, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !260, file: !30, line: 1161)
!260 = !DISubprogram(name: "lroundl", scope: !26, file: !26, line: 320, type: !253, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !262, file: !30, line: 1163)
!262 = !DISubprogram(name: "nan", scope: !26, file: !26, line: 201, type: !263, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DISubroutineType(types: !264)
!264 = !{!29, !265}
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !266, size: 64)
!266 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !267)
!267 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !269, file: !30, line: 1164)
!269 = !DISubprogram(name: "nanf", scope: !26, file: !26, line: 201, type: !270, flags: DIFlagPrototyped, spFlags: 0)
!270 = !DISubroutineType(types: !271)
!271 = !{!87, !265}
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !273, file: !30, line: 1165)
!273 = !DISubprogram(name: "nanl", scope: !26, file: !26, line: 201, type: !274, flags: DIFlagPrototyped, spFlags: 0)
!274 = !DISubroutineType(types: !275)
!275 = !{!98, !265}
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !277, file: !30, line: 1167)
!277 = !DISubprogram(name: "nearbyint", scope: !26, file: !26, line: 294, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !279, file: !30, line: 1168)
!279 = !DISubprogram(name: "nearbyintf", scope: !26, file: !26, line: 294, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !281, file: !30, line: 1169)
!281 = !DISubprogram(name: "nearbyintl", scope: !26, file: !26, line: 294, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !283, file: !30, line: 1171)
!283 = !DISubprogram(name: "nextafter", scope: !26, file: !26, line: 259, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !285, file: !30, line: 1172)
!285 = !DISubprogram(name: "nextafterf", scope: !26, file: !26, line: 259, type: !121, flags: DIFlagPrototyped, spFlags: 0)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !287, file: !30, line: 1173)
!287 = !DISubprogram(name: "nextafterl", scope: !26, file: !26, line: 259, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !289, file: !30, line: 1175)
!289 = !DISubprogram(name: "nexttoward", scope: !26, file: !26, line: 261, type: !290, flags: DIFlagPrototyped, spFlags: 0)
!290 = !DISubroutineType(types: !291)
!291 = !{!29, !29, !98}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !293, file: !30, line: 1176)
!293 = !DISubprogram(name: "nexttowardf", scope: !26, file: !26, line: 261, type: !294, flags: DIFlagPrototyped, spFlags: 0)
!294 = !DISubroutineType(types: !295)
!295 = !{!87, !87, !98}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !297, file: !30, line: 1177)
!297 = !DISubprogram(name: "nexttowardl", scope: !26, file: !26, line: 261, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !299, file: !30, line: 1179)
!299 = !DISubprogram(name: "remainder", scope: !26, file: !26, line: 272, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !301, file: !30, line: 1180)
!301 = !DISubprogram(name: "remainderf", scope: !26, file: !26, line: 272, type: !121, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !303, file: !30, line: 1181)
!303 = !DISubprogram(name: "remainderl", scope: !26, file: !26, line: 272, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !305, file: !30, line: 1183)
!305 = !DISubprogram(name: "remquo", scope: !26, file: !26, line: 307, type: !306, flags: DIFlagPrototyped, spFlags: 0)
!306 = !DISubroutineType(types: !307)
!307 = !{!29, !29, !29, !14}
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !309, file: !30, line: 1184)
!309 = !DISubprogram(name: "remquof", scope: !26, file: !26, line: 307, type: !310, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DISubroutineType(types: !311)
!311 = !{!87, !87, !87, !14}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !313, file: !30, line: 1185)
!313 = !DISubprogram(name: "remquol", scope: !26, file: !26, line: 307, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!314 = !DISubroutineType(types: !315)
!315 = !{!98, !98, !98, !14}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !317, file: !30, line: 1187)
!317 = !DISubprogram(name: "rint", scope: !26, file: !26, line: 256, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !319, file: !30, line: 1188)
!319 = !DISubprogram(name: "rintf", scope: !26, file: !26, line: 256, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !321, file: !30, line: 1189)
!321 = !DISubprogram(name: "rintl", scope: !26, file: !26, line: 256, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !323, file: !30, line: 1191)
!323 = !DISubprogram(name: "round", scope: !26, file: !26, line: 298, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !325, file: !30, line: 1192)
!325 = !DISubprogram(name: "roundf", scope: !26, file: !26, line: 298, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !327, file: !30, line: 1193)
!327 = !DISubprogram(name: "roundl", scope: !26, file: !26, line: 298, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !329, file: !30, line: 1195)
!329 = !DISubprogram(name: "scalbln", scope: !26, file: !26, line: 290, type: !330, flags: DIFlagPrototyped, spFlags: 0)
!330 = !DISubroutineType(types: !331)
!331 = !{!29, !29, !246}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !333, file: !30, line: 1196)
!333 = !DISubprogram(name: "scalblnf", scope: !26, file: !26, line: 290, type: !334, flags: DIFlagPrototyped, spFlags: 0)
!334 = !DISubroutineType(types: !335)
!335 = !{!87, !87, !246}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !337, file: !30, line: 1197)
!337 = !DISubprogram(name: "scalblnl", scope: !26, file: !26, line: 290, type: !338, flags: DIFlagPrototyped, spFlags: 0)
!338 = !DISubroutineType(types: !339)
!339 = !{!98, !98, !246}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !341, file: !30, line: 1199)
!341 = !DISubprogram(name: "scalbn", scope: !26, file: !26, line: 276, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !343, file: !30, line: 1200)
!343 = !DISubprogram(name: "scalbnf", scope: !26, file: !26, line: 276, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!344 = !DISubroutineType(types: !345)
!345 = !{!87, !87, !10}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !347, file: !30, line: 1201)
!347 = !DISubprogram(name: "scalbnl", scope: !26, file: !26, line: 276, type: !348, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DISubroutineType(types: !349)
!349 = !{!98, !98, !10}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !351, file: !30, line: 1203)
!351 = !DISubprogram(name: "tgamma", scope: !26, file: !26, line: 235, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !353, file: !30, line: 1204)
!353 = !DISubprogram(name: "tgammaf", scope: !26, file: !26, line: 235, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !355, file: !30, line: 1205)
!355 = !DISubprogram(name: "tgammal", scope: !26, file: !26, line: 235, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !357, file: !30, line: 1207)
!357 = !DISubprogram(name: "trunc", scope: !26, file: !26, line: 302, type: !27, flags: DIFlagPrototyped, spFlags: 0)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !359, file: !30, line: 1208)
!359 = !DISubprogram(name: "truncf", scope: !26, file: !26, line: 302, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !361, file: !30, line: 1209)
!361 = !DISubprogram(name: "truncl", scope: !26, file: !26, line: 302, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !363, file: !367, line: 38)
!363 = !DISubprogram(name: "abs", linkageName: "_ZSt3absg", scope: !18, file: !23, line: 103, type: !364, flags: DIFlagPrototyped, spFlags: 0)
!364 = !DISubroutineType(types: !365)
!365 = !{!366, !366}
!366 = !DIBasicType(name: "__float128", size: 128, encoding: DW_ATE_float)
!367 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/math.h", directory: "")
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !369, file: !367, line: 54)
!369 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !18, file: !30, line: 380, type: !370, flags: DIFlagPrototyped, spFlags: 0)
!370 = !DISubroutineType(types: !371)
!371 = !{!98, !98, !372}
!372 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !374, file: !376, line: 127)
!374 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !20, line: 62, baseType: !375)
!375 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !20, line: 58, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!376 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdlib", directory: "")
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !378, file: !376, line: 128)
!378 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !20, line: 70, baseType: !379)
!379 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !20, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !380, identifier: "_ZTS6ldiv_t")
!380 = !{!381, !382}
!381 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !379, file: !20, line: 68, baseType: !246, size: 64)
!382 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !379, file: !20, line: 69, baseType: !246, size: 64, offset: 64)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !384, file: !376, line: 130)
!384 = !DISubprogram(name: "abort", scope: !20, file: !20, line: 591, type: !385, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!385 = !DISubroutineType(types: !386)
!386 = !{null}
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !388, file: !376, line: 134)
!388 = !DISubprogram(name: "atexit", scope: !20, file: !20, line: 595, type: !389, flags: DIFlagPrototyped, spFlags: 0)
!389 = !DISubroutineType(types: !390)
!390 = !{!10, !391}
!391 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !393, file: !376, line: 137)
!393 = !DISubprogram(name: "at_quick_exit", scope: !20, file: !20, line: 600, type: !389, flags: DIFlagPrototyped, spFlags: 0)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !395, file: !376, line: 140)
!395 = !DISubprogram(name: "atof", scope: !20, file: !20, line: 101, type: !263, flags: DIFlagPrototyped, spFlags: 0)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !397, file: !376, line: 141)
!397 = !DISubprogram(name: "atoi", scope: !20, file: !20, line: 104, type: !398, flags: DIFlagPrototyped, spFlags: 0)
!398 = !DISubroutineType(types: !399)
!399 = !{!10, !265}
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !401, file: !376, line: 142)
!401 = !DISubprogram(name: "atol", scope: !20, file: !20, line: 107, type: !402, flags: DIFlagPrototyped, spFlags: 0)
!402 = !DISubroutineType(types: !403)
!403 = !{!246, !265}
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !405, file: !376, line: 143)
!405 = !DISubprogram(name: "bsearch", scope: !20, file: !20, line: 820, type: !406, flags: DIFlagPrototyped, spFlags: 0)
!406 = !DISubroutineType(types: !407)
!407 = !{!408, !409, !409, !411, !411, !414}
!408 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !410, size: 64)
!410 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!411 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !412, line: 46, baseType: !413)
!412 = !DIFile(filename: "/u/ishitac/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!413 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !20, line: 808, baseType: !415)
!415 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !416, size: 64)
!416 = !DISubroutineType(types: !417)
!417 = !{!10, !409, !409}
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !419, file: !376, line: 144)
!419 = !DISubprogram(name: "calloc", scope: !20, file: !20, line: 542, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!420 = !DISubroutineType(types: !421)
!421 = !{!408, !411, !411}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !423, file: !376, line: 145)
!423 = !DISubprogram(name: "div", scope: !20, file: !20, line: 852, type: !424, flags: DIFlagPrototyped, spFlags: 0)
!424 = !DISubroutineType(types: !425)
!425 = !{!374, !10, !10}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !427, file: !376, line: 146)
!427 = !DISubprogram(name: "exit", scope: !20, file: !20, line: 617, type: !428, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!428 = !DISubroutineType(types: !429)
!429 = !{null, !10}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !431, file: !376, line: 147)
!431 = !DISubprogram(name: "free", scope: !20, file: !20, line: 565, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!432 = !DISubroutineType(types: !433)
!433 = !{null, !408}
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !435, file: !376, line: 148)
!435 = !DISubprogram(name: "getenv", scope: !20, file: !20, line: 634, type: !436, flags: DIFlagPrototyped, spFlags: 0)
!436 = !DISubroutineType(types: !437)
!437 = !{!438, !265}
!438 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !267, size: 64)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !440, file: !376, line: 149)
!440 = !DISubprogram(name: "labs", scope: !20, file: !20, line: 841, type: !441, flags: DIFlagPrototyped, spFlags: 0)
!441 = !DISubroutineType(types: !442)
!442 = !{!246, !246}
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !444, file: !376, line: 150)
!444 = !DISubprogram(name: "ldiv", scope: !20, file: !20, line: 854, type: !445, flags: DIFlagPrototyped, spFlags: 0)
!445 = !DISubroutineType(types: !446)
!446 = !{!378, !246, !246}
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !448, file: !376, line: 151)
!448 = !DISubprogram(name: "malloc", scope: !20, file: !20, line: 539, type: !449, flags: DIFlagPrototyped, spFlags: 0)
!449 = !DISubroutineType(types: !450)
!450 = !{!408, !411}
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !452, file: !376, line: 153)
!452 = !DISubprogram(name: "mblen", scope: !20, file: !20, line: 922, type: !453, flags: DIFlagPrototyped, spFlags: 0)
!453 = !DISubroutineType(types: !454)
!454 = !{!10, !265, !411}
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !456, file: !376, line: 154)
!456 = !DISubprogram(name: "mbstowcs", scope: !20, file: !20, line: 933, type: !457, flags: DIFlagPrototyped, spFlags: 0)
!457 = !DISubroutineType(types: !458)
!458 = !{!411, !459, !462, !411}
!459 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !460)
!460 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !461, size: 64)
!461 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!462 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !265)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !464, file: !376, line: 155)
!464 = !DISubprogram(name: "mbtowc", scope: !20, file: !20, line: 925, type: !465, flags: DIFlagPrototyped, spFlags: 0)
!465 = !DISubroutineType(types: !466)
!466 = !{!10, !459, !462, !411}
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !468, file: !376, line: 157)
!468 = !DISubprogram(name: "qsort", scope: !20, file: !20, line: 830, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!469 = !DISubroutineType(types: !470)
!470 = !{null, !408, !411, !411, !414}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !472, file: !376, line: 160)
!472 = !DISubprogram(name: "quick_exit", scope: !20, file: !20, line: 623, type: !428, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !474, file: !376, line: 163)
!474 = !DISubprogram(name: "rand", scope: !20, file: !20, line: 453, type: !475, flags: DIFlagPrototyped, spFlags: 0)
!475 = !DISubroutineType(types: !476)
!476 = !{!10}
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !478, file: !376, line: 164)
!478 = !DISubprogram(name: "realloc", scope: !20, file: !20, line: 550, type: !479, flags: DIFlagPrototyped, spFlags: 0)
!479 = !DISubroutineType(types: !480)
!480 = !{!408, !408, !411}
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !482, file: !376, line: 165)
!482 = !DISubprogram(name: "srand", scope: !20, file: !20, line: 455, type: !483, flags: DIFlagPrototyped, spFlags: 0)
!483 = !DISubroutineType(types: !484)
!484 = !{null, !485}
!485 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !487, file: !376, line: 166)
!487 = !DISubprogram(name: "strtod", scope: !20, file: !20, line: 117, type: !488, flags: DIFlagPrototyped, spFlags: 0)
!488 = !DISubroutineType(types: !489)
!489 = !{!29, !462, !490}
!490 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !491)
!491 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !438, size: 64)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !493, file: !376, line: 167)
!493 = !DISubprogram(name: "strtol", scope: !20, file: !20, line: 176, type: !494, flags: DIFlagPrototyped, spFlags: 0)
!494 = !DISubroutineType(types: !495)
!495 = !{!246, !462, !490, !10}
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !497, file: !376, line: 168)
!497 = !DISubprogram(name: "strtoul", scope: !20, file: !20, line: 180, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!498 = !DISubroutineType(types: !499)
!499 = !{!413, !462, !490, !10}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !501, file: !376, line: 169)
!501 = !DISubprogram(name: "system", scope: !20, file: !20, line: 784, type: !398, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !503, file: !376, line: 171)
!503 = !DISubprogram(name: "wcstombs", scope: !20, file: !20, line: 936, type: !504, flags: DIFlagPrototyped, spFlags: 0)
!504 = !DISubroutineType(types: !505)
!505 = !{!411, !506, !507, !411}
!506 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !438)
!507 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !508)
!508 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !509, size: 64)
!509 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !461)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !511, file: !376, line: 172)
!511 = !DISubprogram(name: "wctomb", scope: !20, file: !20, line: 929, type: !512, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DISubroutineType(types: !513)
!513 = !{!10, !438, !461}
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !516, file: !376, line: 200)
!515 = !DINamespace(name: "__gnu_cxx", scope: null)
!516 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !20, line: 80, baseType: !517)
!517 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !20, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !518, identifier: "_ZTS7lldiv_t")
!518 = !{!519, !520}
!519 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !517, file: !20, line: 78, baseType: !209, size: 64)
!520 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !517, file: !20, line: 79, baseType: !209, size: 64, offset: 64)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !522, file: !376, line: 206)
!522 = !DISubprogram(name: "_Exit", scope: !20, file: !20, line: 629, type: !428, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !524, file: !376, line: 210)
!524 = !DISubprogram(name: "llabs", scope: !20, file: !20, line: 844, type: !525, flags: DIFlagPrototyped, spFlags: 0)
!525 = !DISubroutineType(types: !526)
!526 = !{!209, !209}
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !528, file: !376, line: 216)
!528 = !DISubprogram(name: "lldiv", scope: !20, file: !20, line: 858, type: !529, flags: DIFlagPrototyped, spFlags: 0)
!529 = !DISubroutineType(types: !530)
!530 = !{!516, !209, !209}
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !532, file: !376, line: 227)
!532 = !DISubprogram(name: "atoll", scope: !20, file: !20, line: 112, type: !533, flags: DIFlagPrototyped, spFlags: 0)
!533 = !DISubroutineType(types: !534)
!534 = !{!209, !265}
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !536, file: !376, line: 228)
!536 = !DISubprogram(name: "strtoll", scope: !20, file: !20, line: 200, type: !537, flags: DIFlagPrototyped, spFlags: 0)
!537 = !DISubroutineType(types: !538)
!538 = !{!209, !462, !490, !10}
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !540, file: !376, line: 229)
!540 = !DISubprogram(name: "strtoull", scope: !20, file: !20, line: 205, type: !541, flags: DIFlagPrototyped, spFlags: 0)
!541 = !DISubroutineType(types: !542)
!542 = !{!543, !462, !490, !10}
!543 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !545, file: !376, line: 231)
!545 = !DISubprogram(name: "strtof", scope: !20, file: !20, line: 123, type: !546, flags: DIFlagPrototyped, spFlags: 0)
!546 = !DISubroutineType(types: !547)
!547 = !{!87, !462, !490}
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !549, file: !376, line: 232)
!549 = !DISubprogram(name: "strtold", scope: !20, file: !20, line: 126, type: !550, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DISubroutineType(types: !551)
!551 = !{!98, !462, !490}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !516, file: !376, line: 240)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !522, file: !376, line: 242)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !524, file: !376, line: 244)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !556, file: !376, line: 245)
!556 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !515, file: !376, line: 213, type: !529, flags: DIFlagPrototyped, spFlags: 0)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !528, file: !376, line: 246)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !532, file: !376, line: 248)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !545, file: !376, line: 249)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !536, file: !376, line: 250)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !540, file: !376, line: 251)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !549, file: !376, line: 252)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !384, file: !564, line: 38)
!564 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/stdlib.h", directory: "")
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !388, file: !564, line: 39)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !427, file: !564, line: 40)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !393, file: !564, line: 43)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !472, file: !564, line: 46)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !374, file: !564, line: 51)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !378, file: !564, line: 52)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !363, file: !564, line: 54)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !395, file: !564, line: 55)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !397, file: !564, line: 56)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !401, file: !564, line: 57)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !405, file: !564, line: 58)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !419, file: !564, line: 59)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !556, file: !564, line: 60)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !431, file: !564, line: 61)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !435, file: !564, line: 62)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !440, file: !564, line: 63)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !444, file: !564, line: 64)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !448, file: !564, line: 65)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !452, file: !564, line: 67)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !456, file: !564, line: 68)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !464, file: !564, line: 69)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !468, file: !564, line: 71)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !474, file: !564, line: 72)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !564, line: 73)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !482, file: !564, line: 74)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !487, file: !564, line: 75)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !493, file: !564, line: 76)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !497, file: !564, line: 77)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !501, file: !564, line: 78)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !503, file: !564, line: 80)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !511, file: !564, line: 81)
!596 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !597, size: 64)
!597 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !598, line: 7, baseType: !599)
!598 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!599 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !600, line: 49, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!600 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!601 = !{i32 7, !"Dwarf Version", i32 4}
!602 = !{i32 2, !"Debug Info Version", i32 3}
!603 = !{i32 1, !"wchar_size", i32 4}
!604 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!605 = distinct !DISubprogram(name: "Usage", linkageName: "_Z5UsageiPPc", scope: !3, file: !3, line: 21, type: !606, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!606 = !DISubroutineType(types: !607)
!607 = !{null, !10, !491}
!608 = !DILocalVariable(name: "argc", arg: 1, scope: !605, file: !3, line: 21, type: !10)
!609 = !DILocation(line: 21, column: 16, scope: !605)
!610 = !DILocalVariable(name: "argv", arg: 2, scope: !605, file: !3, line: 21, type: !491)
!611 = !DILocation(line: 21, column: 28, scope: !605)
!612 = !DILocation(line: 23, column: 9, scope: !605)
!613 = !DILocation(line: 23, column: 58, scope: !605)
!614 = !DILocation(line: 23, column: 1, scope: !605)
!615 = !DILocation(line: 25, column: 1, scope: !605)
!616 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 29, type: !617, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!617 = !DISubroutineType(types: !618)
!618 = !{!10, !10, !491}
!619 = !DILocalVariable(name: "argc", arg: 1, scope: !616, file: !3, line: 29, type: !10)
!620 = !DILocation(line: 29, column: 15, scope: !616)
!621 = !DILocalVariable(name: "argv", arg: 2, scope: !616, file: !3, line: 29, type: !491)
!622 = !DILocation(line: 29, column: 28, scope: !616)
!623 = !DILocation(line: 31, column: 12, scope: !616)
!624 = !DILocation(line: 31, column: 18, scope: !616)
!625 = !DILocation(line: 31, column: 2, scope: !616)
!626 = !DILocation(line: 32, column: 1, scope: !616)
!627 = distinct !DISubprogram(name: "BFSGraph", linkageName: "_Z8BFSGraphiPPc", scope: !3, file: !3, line: 39, type: !606, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!628 = !DILocalVariable(name: "argc", arg: 1, scope: !627, file: !3, line: 39, type: !10)
!629 = !DILocation(line: 39, column: 20, scope: !627)
!630 = !DILocalVariable(name: "argv", arg: 2, scope: !627, file: !3, line: 39, type: !491)
!631 = !DILocation(line: 39, column: 33, scope: !627)
!632 = !DILocalVariable(name: "no_of_nodes", scope: !627, file: !3, line: 41, type: !10)
!633 = !DILocation(line: 41, column: 13, scope: !627)
!634 = !DILocalVariable(name: "edge_list_size", scope: !627, file: !3, line: 42, type: !10)
!635 = !DILocation(line: 42, column: 13, scope: !627)
!636 = !DILocalVariable(name: "input_f", scope: !627, file: !3, line: 43, type: !438)
!637 = !DILocation(line: 43, column: 15, scope: !627)
!638 = !DILocalVariable(name: "num_omp_threads", scope: !627, file: !3, line: 44, type: !10)
!639 = !DILocation(line: 44, column: 7, scope: !627)
!640 = !DILocation(line: 46, column: 5, scope: !641)
!641 = distinct !DILexicalBlock(scope: !627, file: !3, line: 46, column: 5)
!642 = !DILocation(line: 46, column: 9, scope: !641)
!643 = !DILocation(line: 46, column: 5, scope: !627)
!644 = !DILocation(line: 47, column: 8, scope: !645)
!645 = distinct !DILexicalBlock(scope: !641, file: !3, line: 46, column: 13)
!646 = !DILocation(line: 47, column: 14, scope: !645)
!647 = !DILocation(line: 47, column: 2, scope: !645)
!648 = !DILocation(line: 48, column: 2, scope: !645)
!649 = !DILocation(line: 51, column: 25, scope: !627)
!650 = !DILocation(line: 51, column: 20, scope: !627)
!651 = !DILocation(line: 51, column: 18, scope: !627)
!652 = !DILocation(line: 52, column: 12, scope: !627)
!653 = !DILocation(line: 52, column: 10, scope: !627)
!654 = !DILocation(line: 54, column: 2, scope: !627)
!655 = !DILocation(line: 56, column: 13, scope: !627)
!656 = !DILocation(line: 56, column: 7, scope: !627)
!657 = !DILocation(line: 56, column: 5, scope: !627)
!658 = !DILocation(line: 57, column: 6, scope: !659)
!659 = distinct !DILexicalBlock(scope: !627, file: !3, line: 57, column: 5)
!660 = !DILocation(line: 57, column: 5, scope: !627)
!661 = !DILocation(line: 59, column: 3, scope: !662)
!662 = distinct !DILexicalBlock(scope: !659, file: !3, line: 58, column: 2)
!663 = !DILocation(line: 60, column: 3, scope: !662)
!664 = !DILocalVariable(name: "source", scope: !627, file: !3, line: 63, type: !10)
!665 = !DILocation(line: 63, column: 6, scope: !627)
!666 = !DILocation(line: 65, column: 9, scope: !627)
!667 = !DILocation(line: 65, column: 2, scope: !627)
!668 = !DILocalVariable(name: "h_graph_nodes", scope: !627, file: !3, line: 68, type: !6)
!669 = !DILocation(line: 68, column: 8, scope: !627)
!670 = !DILocation(line: 68, column: 52, scope: !627)
!671 = !DILocation(line: 68, column: 51, scope: !627)
!672 = !DILocation(line: 68, column: 32, scope: !627)
!673 = !DILocation(line: 68, column: 24, scope: !627)
!674 = !DILocalVariable(name: "h_graph_mask", scope: !627, file: !3, line: 69, type: !12)
!675 = !DILocation(line: 69, column: 8, scope: !627)
!676 = !DILocation(line: 69, column: 51, scope: !627)
!677 = !DILocation(line: 69, column: 50, scope: !627)
!678 = !DILocation(line: 69, column: 31, scope: !627)
!679 = !DILocalVariable(name: "h_updating_graph_mask", scope: !627, file: !3, line: 70, type: !12)
!680 = !DILocation(line: 70, column: 8, scope: !627)
!681 = !DILocation(line: 70, column: 60, scope: !627)
!682 = !DILocation(line: 70, column: 59, scope: !627)
!683 = !DILocation(line: 70, column: 40, scope: !627)
!684 = !DILocalVariable(name: "h_graph_visited", scope: !627, file: !3, line: 71, type: !12)
!685 = !DILocation(line: 71, column: 8, scope: !627)
!686 = !DILocation(line: 71, column: 54, scope: !627)
!687 = !DILocation(line: 71, column: 53, scope: !627)
!688 = !DILocation(line: 71, column: 34, scope: !627)
!689 = !DILocalVariable(name: "start", scope: !627, file: !3, line: 73, type: !10)
!690 = !DILocation(line: 73, column: 6, scope: !627)
!691 = !DILocalVariable(name: "edgeno", scope: !627, file: !3, line: 73, type: !10)
!692 = !DILocation(line: 73, column: 13, scope: !627)
!693 = !DILocalVariable(name: "i", scope: !694, file: !3, line: 75, type: !485)
!694 = distinct !DILexicalBlock(scope: !627, file: !3, line: 75, column: 2)
!695 = !DILocation(line: 75, column: 20, scope: !694)
!696 = !DILocation(line: 75, column: 7, scope: !694)
!697 = !DILocation(line: 75, column: 27, scope: !698)
!698 = distinct !DILexicalBlock(scope: !694, file: !3, line: 75, column: 2)
!699 = !DILocation(line: 75, column: 31, scope: !698)
!700 = !DILocation(line: 75, column: 29, scope: !698)
!701 = !DILocation(line: 75, column: 2, scope: !694)
!702 = !DILocation(line: 77, column: 10, scope: !703)
!703 = distinct !DILexicalBlock(scope: !698, file: !3, line: 76, column: 2)
!704 = !DILocation(line: 77, column: 3, scope: !703)
!705 = !DILocation(line: 78, column: 31, scope: !703)
!706 = !DILocation(line: 78, column: 3, scope: !703)
!707 = !DILocation(line: 78, column: 17, scope: !703)
!708 = !DILocation(line: 78, column: 20, scope: !703)
!709 = !DILocation(line: 78, column: 29, scope: !703)
!710 = !DILocation(line: 79, column: 34, scope: !703)
!711 = !DILocation(line: 79, column: 3, scope: !703)
!712 = !DILocation(line: 79, column: 17, scope: !703)
!713 = !DILocation(line: 79, column: 20, scope: !703)
!714 = !DILocation(line: 79, column: 32, scope: !703)
!715 = !DILocation(line: 80, column: 3, scope: !703)
!716 = !DILocation(line: 80, column: 16, scope: !703)
!717 = !DILocation(line: 80, column: 18, scope: !703)
!718 = !DILocation(line: 81, column: 3, scope: !703)
!719 = !DILocation(line: 81, column: 25, scope: !703)
!720 = !DILocation(line: 81, column: 27, scope: !703)
!721 = !DILocation(line: 82, column: 3, scope: !703)
!722 = !DILocation(line: 82, column: 19, scope: !703)
!723 = !DILocation(line: 82, column: 21, scope: !703)
!724 = !DILocation(line: 83, column: 2, scope: !703)
!725 = !DILocation(line: 75, column: 45, scope: !698)
!726 = !DILocation(line: 75, column: 2, scope: !698)
!727 = distinct !{!727, !701, !728}
!728 = !DILocation(line: 83, column: 2, scope: !694)
!729 = !DILocation(line: 86, column: 9, scope: !627)
!730 = !DILocation(line: 86, column: 2, scope: !627)
!731 = !DILocation(line: 90, column: 2, scope: !627)
!732 = !DILocation(line: 90, column: 15, scope: !627)
!733 = !DILocation(line: 90, column: 22, scope: !627)
!734 = !DILocation(line: 91, column: 2, scope: !627)
!735 = !DILocation(line: 91, column: 18, scope: !627)
!736 = !DILocation(line: 91, column: 25, scope: !627)
!737 = !DILocation(line: 93, column: 9, scope: !627)
!738 = !DILocation(line: 93, column: 2, scope: !627)
!739 = !DILocalVariable(name: "id", scope: !627, file: !3, line: 95, type: !10)
!740 = !DILocation(line: 95, column: 6, scope: !627)
!741 = !DILocalVariable(name: "cost", scope: !627, file: !3, line: 95, type: !10)
!742 = !DILocation(line: 95, column: 9, scope: !627)
!743 = !DILocalVariable(name: "h_graph_edges", scope: !627, file: !3, line: 96, type: !14)
!744 = !DILocation(line: 96, column: 7, scope: !627)
!745 = !DILocation(line: 96, column: 49, scope: !627)
!746 = !DILocation(line: 96, column: 48, scope: !627)
!747 = !DILocation(line: 96, column: 30, scope: !627)
!748 = !DILocation(line: 96, column: 23, scope: !627)
!749 = !DILocalVariable(name: "i", scope: !750, file: !3, line: 97, type: !10)
!750 = distinct !DILexicalBlock(scope: !627, file: !3, line: 97, column: 2)
!751 = !DILocation(line: 97, column: 10, scope: !750)
!752 = !DILocation(line: 97, column: 6, scope: !750)
!753 = !DILocation(line: 97, column: 15, scope: !754)
!754 = distinct !DILexicalBlock(scope: !750, file: !3, line: 97, column: 2)
!755 = !DILocation(line: 97, column: 19, scope: !754)
!756 = !DILocation(line: 97, column: 17, scope: !754)
!757 = !DILocation(line: 97, column: 2, scope: !750)
!758 = !DILocation(line: 99, column: 10, scope: !759)
!759 = distinct !DILexicalBlock(scope: !754, file: !3, line: 98, column: 2)
!760 = !DILocation(line: 99, column: 3, scope: !759)
!761 = !DILocation(line: 100, column: 10, scope: !759)
!762 = !DILocation(line: 100, column: 3, scope: !759)
!763 = !DILocation(line: 101, column: 22, scope: !759)
!764 = !DILocation(line: 101, column: 3, scope: !759)
!765 = !DILocation(line: 101, column: 17, scope: !759)
!766 = !DILocation(line: 101, column: 20, scope: !759)
!767 = !DILocation(line: 102, column: 2, scope: !759)
!768 = !DILocation(line: 97, column: 37, scope: !754)
!769 = !DILocation(line: 97, column: 2, scope: !754)
!770 = distinct !{!770, !757, !771}
!771 = !DILocation(line: 102, column: 2, scope: !750)
!772 = !DILocation(line: 104, column: 5, scope: !773)
!773 = distinct !DILexicalBlock(scope: !627, file: !3, line: 104, column: 5)
!774 = !DILocation(line: 104, column: 5, scope: !627)
!775 = !DILocation(line: 105, column: 10, scope: !773)
!776 = !DILocation(line: 105, column: 3, scope: !773)
!777 = !DILocalVariable(name: "h_cost", scope: !627, file: !3, line: 109, type: !14)
!778 = !DILocation(line: 109, column: 7, scope: !627)
!779 = !DILocation(line: 109, column: 43, scope: !627)
!780 = !DILocation(line: 109, column: 42, scope: !627)
!781 = !DILocation(line: 109, column: 23, scope: !627)
!782 = !DILocation(line: 109, column: 16, scope: !627)
!783 = !DILocalVariable(name: "i", scope: !784, file: !3, line: 110, type: !10)
!784 = distinct !DILexicalBlock(scope: !627, file: !3, line: 110, column: 2)
!785 = !DILocation(line: 110, column: 10, scope: !784)
!786 = !DILocation(line: 110, column: 6, scope: !784)
!787 = !DILocation(line: 110, column: 14, scope: !788)
!788 = distinct !DILexicalBlock(scope: !784, file: !3, line: 110, column: 2)
!789 = !DILocation(line: 110, column: 16, scope: !788)
!790 = !DILocation(line: 110, column: 15, scope: !788)
!791 = !DILocation(line: 110, column: 2, scope: !784)
!792 = !DILocation(line: 111, column: 3, scope: !788)
!793 = !DILocation(line: 111, column: 10, scope: !788)
!794 = !DILocation(line: 111, column: 12, scope: !788)
!795 = !DILocation(line: 110, column: 29, scope: !788)
!796 = !DILocation(line: 110, column: 2, scope: !788)
!797 = distinct !{!797, !791, !798}
!798 = !DILocation(line: 111, column: 14, scope: !784)
!799 = !DILocation(line: 112, column: 2, scope: !627)
!800 = !DILocation(line: 112, column: 9, scope: !627)
!801 = !DILocation(line: 112, column: 16, scope: !627)
!802 = !DILocation(line: 114, column: 2, scope: !627)
!803 = !DILocalVariable(name: "k", scope: !627, file: !3, line: 116, type: !10)
!804 = !DILocation(line: 116, column: 6, scope: !627)
!805 = !DILocalVariable(name: "start_time", scope: !627, file: !3, line: 118, type: !29)
!806 = !DILocation(line: 118, column: 16, scope: !627)
!807 = !DILocation(line: 118, column: 29, scope: !627)
!808 = !DILocalVariable(name: "stop", scope: !627, file: !3, line: 124, type: !13)
!809 = !DILocation(line: 124, column: 7, scope: !627)
!810 = !DILocation(line: 125, column: 2, scope: !627)
!811 = !DILocation(line: 128, column: 17, scope: !812)
!812 = distinct !DILexicalBlock(scope: !627, file: !3, line: 126, column: 9)
!813 = !DILocalVariable(name: "tid", scope: !814, file: !3, line: 137, type: !10)
!814 = distinct !DILexicalBlock(scope: !812, file: !3, line: 137, column: 13)
!815 = !DILocation(line: 137, column: 21, scope: !814)
!816 = !DILocation(line: 137, column: 17, scope: !814)
!817 = !DILocation(line: 137, column: 30, scope: !818)
!818 = distinct !DILexicalBlock(scope: !814, file: !3, line: 137, column: 13)
!819 = !DILocation(line: 137, column: 36, scope: !818)
!820 = !DILocation(line: 137, column: 34, scope: !818)
!821 = !DILocation(line: 137, column: 13, scope: !814)
!822 = !DILocation(line: 139, column: 21, scope: !823)
!823 = distinct !DILexicalBlock(scope: !824, file: !3, line: 139, column: 21)
!824 = distinct !DILexicalBlock(scope: !818, file: !3, line: 138, column: 13)
!825 = !DILocation(line: 139, column: 34, scope: !823)
!826 = !DILocation(line: 139, column: 39, scope: !823)
!827 = !DILocation(line: 139, column: 21, scope: !824)
!828 = !DILocation(line: 140, column: 21, scope: !829)
!829 = distinct !DILexicalBlock(scope: !823, file: !3, line: 139, column: 47)
!830 = !DILocation(line: 140, column: 34, scope: !829)
!831 = !DILocation(line: 140, column: 38, scope: !829)
!832 = !DILocalVariable(name: "i", scope: !833, file: !3, line: 141, type: !10)
!833 = distinct !DILexicalBlock(scope: !829, file: !3, line: 141, column: 21)
!834 = !DILocation(line: 141, column: 29, scope: !833)
!835 = !DILocation(line: 141, column: 31, scope: !833)
!836 = !DILocation(line: 141, column: 45, scope: !833)
!837 = !DILocation(line: 141, column: 50, scope: !833)
!838 = !DILocation(line: 141, column: 25, scope: !833)
!839 = !DILocation(line: 141, column: 60, scope: !840)
!840 = distinct !DILexicalBlock(scope: !833, file: !3, line: 141, column: 21)
!841 = !DILocation(line: 141, column: 63, scope: !840)
!842 = !DILocation(line: 141, column: 77, scope: !840)
!843 = !DILocation(line: 141, column: 82, scope: !840)
!844 = !DILocation(line: 141, column: 96, scope: !840)
!845 = !DILocation(line: 141, column: 110, scope: !840)
!846 = !DILocation(line: 141, column: 115, scope: !840)
!847 = !DILocation(line: 141, column: 94, scope: !840)
!848 = !DILocation(line: 141, column: 61, scope: !840)
!849 = !DILocation(line: 141, column: 21, scope: !833)
!850 = !DILocalVariable(name: "id", scope: !851, file: !3, line: 143, type: !10)
!851 = distinct !DILexicalBlock(scope: !840, file: !3, line: 142, column: 21)
!852 = !DILocation(line: 143, column: 29, scope: !851)
!853 = !DILocation(line: 143, column: 34, scope: !851)
!854 = !DILocation(line: 143, column: 48, scope: !851)
!855 = !DILocation(line: 144, column: 29, scope: !856)
!856 = distinct !DILexicalBlock(scope: !851, file: !3, line: 144, column: 28)
!857 = !DILocation(line: 144, column: 45, scope: !856)
!858 = !DILocation(line: 144, column: 28, scope: !851)
!859 = !DILocation(line: 146, column: 40, scope: !860)
!860 = distinct !DILexicalBlock(scope: !856, file: !3, line: 145, column: 25)
!861 = !DILocation(line: 146, column: 47, scope: !860)
!862 = !DILocation(line: 146, column: 51, scope: !860)
!863 = !DILocation(line: 146, column: 29, scope: !860)
!864 = !DILocation(line: 146, column: 36, scope: !860)
!865 = !DILocation(line: 146, column: 39, scope: !860)
!866 = !DILocation(line: 147, column: 29, scope: !860)
!867 = !DILocation(line: 147, column: 51, scope: !860)
!868 = !DILocation(line: 147, column: 54, scope: !860)
!869 = !DILocation(line: 148, column: 25, scope: !860)
!870 = !DILocation(line: 149, column: 21, scope: !851)
!871 = !DILocation(line: 141, column: 127, scope: !840)
!872 = !DILocation(line: 141, column: 21, scope: !840)
!873 = distinct !{!873, !849, !874}
!874 = !DILocation(line: 149, column: 21, scope: !833)
!875 = !DILocation(line: 150, column: 17, scope: !829)
!876 = !DILocation(line: 151, column: 13, scope: !824)
!877 = !DILocation(line: 137, column: 52, scope: !818)
!878 = !DILocation(line: 137, column: 13, scope: !818)
!879 = distinct !{!879, !821, !880}
!880 = !DILocation(line: 151, column: 13, scope: !814)
!881 = !DILocalVariable(name: "tid", scope: !882, file: !3, line: 159, type: !10)
!882 = distinct !DILexicalBlock(scope: !812, file: !3, line: 159, column: 13)
!883 = !DILocation(line: 159, column: 21, scope: !882)
!884 = !DILocation(line: 159, column: 17, scope: !882)
!885 = !DILocation(line: 159, column: 28, scope: !886)
!886 = distinct !DILexicalBlock(scope: !882, file: !3, line: 159, column: 13)
!887 = !DILocation(line: 159, column: 33, scope: !886)
!888 = !DILocation(line: 159, column: 31, scope: !886)
!889 = !DILocation(line: 159, column: 13, scope: !882)
!890 = !DILocation(line: 161, column: 21, scope: !891)
!891 = distinct !DILexicalBlock(scope: !892, file: !3, line: 161, column: 21)
!892 = distinct !DILexicalBlock(scope: !886, file: !3, line: 160, column: 13)
!893 = !DILocation(line: 161, column: 43, scope: !891)
!894 = !DILocation(line: 161, column: 48, scope: !891)
!895 = !DILocation(line: 161, column: 21, scope: !892)
!896 = !DILocation(line: 162, column: 21, scope: !897)
!897 = distinct !DILexicalBlock(scope: !891, file: !3, line: 161, column: 56)
!898 = !DILocation(line: 162, column: 34, scope: !897)
!899 = !DILocation(line: 162, column: 38, scope: !897)
!900 = !DILocation(line: 163, column: 21, scope: !897)
!901 = !DILocation(line: 163, column: 37, scope: !897)
!902 = !DILocation(line: 163, column: 41, scope: !897)
!903 = !DILocation(line: 164, column: 25, scope: !897)
!904 = !DILocation(line: 165, column: 21, scope: !897)
!905 = !DILocation(line: 165, column: 43, scope: !897)
!906 = !DILocation(line: 165, column: 47, scope: !897)
!907 = !DILocation(line: 166, column: 17, scope: !897)
!908 = !DILocation(line: 167, column: 13, scope: !892)
!909 = !DILocation(line: 159, column: 50, scope: !886)
!910 = !DILocation(line: 159, column: 13, scope: !886)
!911 = distinct !{!911, !889, !912}
!912 = !DILocation(line: 167, column: 13, scope: !882)
!913 = !DILocation(line: 168, column: 14, scope: !812)
!914 = !DILocation(line: 169, column: 9, scope: !812)
!915 = !DILocation(line: 170, column: 8, scope: !627)
!916 = distinct !{!916, !810, !917}
!917 = !DILocation(line: 170, column: 12, scope: !627)
!918 = !DILocalVariable(name: "end_time", scope: !627, file: !3, line: 172, type: !29)
!919 = !DILocation(line: 172, column: 16, scope: !627)
!920 = !DILocation(line: 172, column: 27, scope: !627)
!921 = !DILocation(line: 173, column: 40, scope: !627)
!922 = !DILocation(line: 173, column: 51, scope: !627)
!923 = !DILocation(line: 173, column: 49, scope: !627)
!924 = !DILocation(line: 173, column: 9, scope: !627)
!925 = !DILocalVariable(name: "fpo", scope: !627, file: !3, line: 179, type: !596)
!926 = !DILocation(line: 179, column: 8, scope: !627)
!927 = !DILocation(line: 179, column: 14, scope: !627)
!928 = !DILocalVariable(name: "i", scope: !929, file: !3, line: 180, type: !10)
!929 = distinct !DILexicalBlock(scope: !627, file: !3, line: 180, column: 2)
!930 = !DILocation(line: 180, column: 10, scope: !929)
!931 = !DILocation(line: 180, column: 6, scope: !929)
!932 = !DILocation(line: 180, column: 14, scope: !933)
!933 = distinct !DILexicalBlock(scope: !929, file: !3, line: 180, column: 2)
!934 = !DILocation(line: 180, column: 16, scope: !933)
!935 = !DILocation(line: 180, column: 15, scope: !933)
!936 = !DILocation(line: 180, column: 2, scope: !929)
!937 = !DILocation(line: 181, column: 11, scope: !933)
!938 = !DILocation(line: 181, column: 31, scope: !933)
!939 = !DILocation(line: 181, column: 33, scope: !933)
!940 = !DILocation(line: 181, column: 40, scope: !933)
!941 = !DILocation(line: 181, column: 3, scope: !933)
!942 = !DILocation(line: 180, column: 29, scope: !933)
!943 = !DILocation(line: 180, column: 2, scope: !933)
!944 = distinct !{!944, !936, !945}
!945 = !DILocation(line: 181, column: 42, scope: !929)
!946 = !DILocation(line: 182, column: 9, scope: !627)
!947 = !DILocation(line: 182, column: 2, scope: !627)
!948 = !DILocation(line: 183, column: 2, scope: !627)
!949 = !DILocation(line: 187, column: 8, scope: !627)
!950 = !DILocation(line: 187, column: 2, scope: !627)
!951 = !DILocation(line: 188, column: 8, scope: !627)
!952 = !DILocation(line: 188, column: 2, scope: !627)
!953 = !DILocation(line: 189, column: 8, scope: !627)
!954 = !DILocation(line: 189, column: 2, scope: !627)
!955 = !DILocation(line: 190, column: 8, scope: !627)
!956 = !DILocation(line: 190, column: 2, scope: !627)
!957 = !DILocation(line: 191, column: 8, scope: !627)
!958 = !DILocation(line: 191, column: 2, scope: !627)
!959 = !DILocation(line: 192, column: 8, scope: !627)
!960 = !DILocation(line: 192, column: 2, scope: !627)
!961 = !DILocation(line: 194, column: 1, scope: !627)
