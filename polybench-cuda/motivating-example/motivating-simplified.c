//////////////////////ORIGINAL CUDA Code////////////////////
for(int i=0; i<m; ++i){
  kernel<<<1,n>>>(A, B); // parallel compute array A using array B&C on GPU
  cudaMemcpy(A, dev_A, n*sizeof(double), cudaMemcpyDeviceToHost);
  live_out += A[i]*C[i];
}

/////////////////TULIP Execution Model Change///////////////
for(int i=0; i<m; ++i){
  //PS-PDG: DOALL (CUDA)
  for(int j=0; j<n; ++j){
    kernel(A,B);
  }
  live_out += A[i]*C[i];
}

//////////////TULIP + NOELLE Optimization/////////
//PS-PDG: REDUCTION at live_out (NOELLE)
for(int i=0; i<m; ++i){
  //PS-PDG: DOALL (CUDA)
  for(int j=0; j<n; ++j){
    kernel(A,B);
  }
  live_out += A[i]*C[i];
}

///////////////TULIP CodeGen: OpenMP Offloading////////////////////
#pragma omp target teams distribute reduction (+:live_out)
for(int i=0; i<m; ++i){
  #pragma parallel for
  for(int j=0; j<n; ++j){
    kernel(A,B,C);
  }
  live_out += A[i]*C[i];
}

///////////////Programmer/////////////////////////
if(required_memory < THRESHOLD){
  //loop interchange
  #pragma omp target teams distribute collapse(2)
  for(int j=0; j<n; ++j)
    for(int i=0; i<m; ++i){
      kernel(A,B,C);
      live_out += A[i]*C[i];
    }
} else {
  //TULIP CodeGen
}
