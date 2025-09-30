/* Test case: Functions already in optimal order */
#include <stdio.h>
#include <stdlib.h>

//FUNCTION ORDER ID 0 START
// Program entry point: set array size, allocate and initialize data, process it (square each element), print results, then exit
int main() {
    int size = 5;
    int* data = init_data(size);
    process_data(data, size);
    print_data(data, size);
    cleanup_data(data);
    return 0;
}
// FUNCTION ORDER ID 0 END

//FUNCTION ORDER ID 1 START
// Allocate an int array of the requested size and initialize it with the sequence 1..size, returning the pointer
int* init_data(int size) {
    int* data = malloc(size * sizeof(int));
    for (int i = 0; i < size; i++) {
        data[i] = i + 1;
    }
    return data;
}
// FUNCTION ORDER ID 1 END

//FUNCTION ORDER ID 2 START
// Iterate over each array element and replace it with its square by calling square()
void process_data(int* data, int size) {
    for (int i = 0; i < size; i++) {
        data[i] = square(data[i]);
    }
}
// FUNCTION ORDER ID 2 END

//FUNCTION ORDER ID 3 START
// Output a 'Data: ' prefix and then print each array element separated by spaces
void print_data(int* data, int size) {
    printf("Data: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", data[i]);
    }
    printf("\n");
}
// FUNCTION ORDER ID 3 END

//FUNCTION ORDER ID 4 START
// Compute and return the mathematical square of x (x multiplied by itself)
int square(int x) {
    return x * x;
}
// FUNCTION ORDER ID 4 END

//FUNCTION ORDER ID 5 START
// Release/free the memory previously allocated for the integer array
void cleanup_data(int* data) {
    free(data);
}
// FUNCTION ORDER ID 5 END


