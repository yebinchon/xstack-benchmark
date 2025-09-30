/* Test case: Functions in poor order */
#include <stdio.h>
#include <stdlib.h>

//FUNCTION ORDER ID 0 START
// Print the integer array to stdout with spaces between elements and end with a newline
void print_results(int* data, int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", data[i]);
    }
    printf("\n");
}
// FUNCTION ORDER ID 0 END

//FUNCTION ORDER ID 1 START  
// Return the value for x using the formula 2*x + 1; a small utility used to generate sequence values
int helper_function(int x) {
    return x * 2 + 1;
}
// FUNCTION ORDER ID 1 END

//FUNCTION ORDER ID 2 START
// Program entry point: set up array size, allocate and initialize the array, then compute values into it (later code likely prints and frees it)
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
// Populate each element of the provided array by applying helper_function to the element index
void compute_values(int* data, int size) {
    for (int i = 0; i < size; i++) {
        data[i] = helper_function(i);
    }
}
// FUNCTION ORDER ID 3 END

//FUNCTION ORDER ID 4 START
// Allocate an int array of the given size, initialize all elements to zero, and return the pointer (caller is responsible for freeing)
int* init_array(int size) {
    int* data = malloc(size * sizeof(int));
    for (int i = 0; i < size; i++) {
        data[i] = 0;
    }
    return data;
}
// FUNCTION ORDER ID 4 END


