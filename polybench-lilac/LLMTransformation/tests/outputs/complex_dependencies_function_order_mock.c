/* Test case: Complex function dependencies */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

//FUNCTION ORDER ID 3 START
//INSERT COMMENT FUNCTION: main
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

//FUNCTION ORDER ID 5 START
//INSERT COMMENT FUNCTION: init_matrix
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

//FUNCTION ORDER ID 1 START
//INSERT COMMENT FUNCTION: kernel_multiply
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
//INSERT COMMENT FUNCTION: print_matrix
void print_matrix(double* matrix, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%.2f ", matrix[i * n + j]);
        }
        printf("\n");
    }
}
// FUNCTION ORDER ID 2 END

//FUNCTION ORDER ID 0 START
//INSERT COMMENT FUNCTION: utility_max
int utility_max(int a, int b) {
    return (a > b) ? a : b;
}
// FUNCTION ORDER ID 0 END

//FUNCTION ORDER ID 4 START
//INSERT COMMENT FUNCTION: allocate_matrix
double* allocate_matrix(int n) {
    return malloc(n * n * sizeof(double));
}
// FUNCTION ORDER ID 4 END


