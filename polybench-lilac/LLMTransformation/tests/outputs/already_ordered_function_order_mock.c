/* Test case: Functions already in optimal order */
#include <stdio.h>
#include <stdlib.h>

//FUNCTION ORDER ID 0 START
//INSERT COMMENT FUNCTION: main
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
//INSERT COMMENT FUNCTION: init_data
int* init_data(int size) {
    int* data = malloc(size * sizeof(int));
    for (int i = 0; i < size; i++) {
        data[i] = i + 1;
    }
    return data;
}
// FUNCTION ORDER ID 1 END

//FUNCTION ORDER ID 3 START
//INSERT COMMENT FUNCTION: print_data
void print_data(int* data, int size) {
    printf("Data: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", data[i]);
    }
    printf("\n");
}
// FUNCTION ORDER ID 3 END

//FUNCTION ORDER ID 2 START
//INSERT COMMENT FUNCTION: process_data
void process_data(int* data, int size) {
    for (int i = 0; i < size; i++) {
        data[i] = square(data[i]);
    }
}
// FUNCTION ORDER ID 2 END

//FUNCTION ORDER ID 4 START
//INSERT COMMENT FUNCTION: square
int square(int x) {
    return x * x;
}
// FUNCTION ORDER ID 4 END

//FUNCTION ORDER ID 5 START
//INSERT COMMENT FUNCTION: cleanup_data
void cleanup_data(int* data) {
    free(data);
}
// FUNCTION ORDER ID 5 END


