/* Test case: Functions in poor order */
#include <stdio.h>
#include <stdlib.h>

//FUNCTION ORDER ID 0 START
// Function print_results performs core computation logic.
void print_results(int* data, int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", data[i]);
    }
    printf("\n");
}
// FUNCTION ORDER ID 0 END

//FUNCTION ORDER ID 1 START  
// Function helper_function performs core computation logic.
int helper_function(int x) {
    return x * 2 + 1;
}
// FUNCTION ORDER ID 1 END

//FUNCTION ORDER ID 2 START
// Function main performs core computation logic.
int main() {
    int size = 10;
    int* data = init_array(size);
    
    compute_values(data, size);
    print_results(data, size);
    
    free(data);
    return 0;
}
// FUNCTION ORDER ID 2 END

//FUNCTION ORDER ID 3 START
// Function compute_values performs core computation logic.
void compute_values(int* data, int size) {
    for (int i = 0; i < size; i++) {
        data[i] = helper_function(i);
    }
}
// FUNCTION ORDER ID 3 END

//FUNCTION ORDER ID 4 START
// Function init_array performs core computation logic.
int* init_array(int size) {
    int* data = malloc(size * sizeof(int));
    for (int i = 0; i < size; i++) {
        data[i] = 0;
    }
    return data;
}
// FUNCTION ORDER ID 4 END


