/* Test case: Complex function dependencies */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

//FUNCTION ORDER ID 0 START
// Return the larger of two integers a and b using a ternary operator
int utility_max(int a, int b) {
    return (a > b) ? a : b;
}
// FUNCTION ORDER ID 0 END

//FUNCTION ORDER ID 1 START
// Compute the product of two n x n matrices A and B into C using three nested loops (row-major indexing): initialize each C[i*n+j] to 0 then accumulate the dot product over k
void kernel_multiply(double* A, double* B, double* C, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            C[i * n + j] = 0.0;
            for (int k = 0; k < n; k++) {
                C[i * n + j] += A[i * n + k] * B[k * n + j];
            }
        }
    }
}
// FUNCTION ORDER ID 1 END

//FUNCTION ORDER ID 2 START
// Print the n x n matrix in row-major order, formatting each element with two decimal places and separating entries by a space
void print_matrix(double* matrix, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%.2f ", matrix[i * n + j]);
        }
        printf("\n");
    }
}
// FUNCTION ORDER ID 2 END

//FUNCTION ORDER ID 3 START
// Example driver: set matrix size, create and initialize matrices A and B, allocate result matrix C, perform multiplication, print results and free resources
int main() {
    int n = 3;
    double* A = init_matrix(n);
    double* B = init_matrix(n);
    double* C = allocate_matrix(n);
    
    kernel_multiply(A, B, C, n);
    print_matrix(C, n);
    
    free(A);
    free(B);
    free(C);
    return 0;
}
// FUNCTION ORDER ID 3 END

//FUNCTION ORDER ID 4 START
// Allocate and return a contiguous block of memory for an n x n matrix of doubles (uninitialized)
double* allocate_matrix(int n) {
    return malloc(n * n * sizeof(double));
}
// FUNCTION ORDER ID 4 END

//FUNCTION ORDER ID 5 START
// Allocate an n x n matrix and initialize element (i,j) to the double value (i + j + 1), returning the pointer
double* init_matrix(int n) {
    double* matrix = allocate_matrix(n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            matrix[i * n + j] = (double)(i + j + 1);
        }
    }
    return matrix;
}
// FUNCTION ORDER ID 5 END


