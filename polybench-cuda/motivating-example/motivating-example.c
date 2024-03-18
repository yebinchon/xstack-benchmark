

//////////////////////ORIGINAL CUDA Code////////////////////
__global__ void kernel_x1(int n,
                          double *A,
                          double *B,
                          double *C) {
  int j = threadIdx.x;
  if (j < n) {
      A[j] = B[j] * C[j];
  }
}


cudaMalloc(&dev_A, n*sizeof(double));
for(int i=0; i<n; ++i){
  cuda_parallel<<<1, blockDim>>>(n, A, B, C);
  cudaMemcpy(A, dev_A, n*sizeof(double), cudaMemcpyDeviceToHost);
  live_out += A[i];
}




/////////////////TULIP Execution Model Change///////////////

for(int i=0; i<n; ++i){
  //PS-PDG: DOALL
  for(int j=0; j<blockDim; ++j){
    if(j<n){
      A[j] = B[i] * C[i];
    }
  }
  live_out += A[i];
}

//////////////TULIP + NOELLE Optimization/////////
//PS-PDG: REDUCTION at live_out
for(int i=0; i<n; ++i){
  //PS-PDG: DOALL
  for(int j=0; j<blockDim; ++j){
    if(j<n){
      A[j] = B[j] * C[j];
    }
  }
  live_out += A[i]
}

///////////////TULIP CodeGen////////////////////
#pragma omp target teams distribute reduction (+:live_out)
for(int i=0; i<n; ++i){
  #pragma parallel for
  for(int j=0; j<blockDim; ++j){
    if(j<n){
      A[j] += B[j] * C[j];
    }
  }
  live_out += A[j];
}

///////////////Programmer: Loop Interchange/////////////////////////

#pragma omp metadirective ...(req_mem <= avail_gep_mem: omp target teams distribute collapse(2) reduction(+:val)) default(omp parallel reduction(+:val))
for(int i=0; i<n; ++i){
  #pragma omp metadirective ...(req_mem > avail_gep_mem: omp target teams distribute)
  for(int j=0; j<n; ++j){
    x1[i] += A[i * n + j] * y[j];
  }
}
