#include <stdio.h>

int globalint = 10;

int main(void) {
  int globalint;

  globalint = 1;

  printf("%d\n", globalint);
  return 0;
}

