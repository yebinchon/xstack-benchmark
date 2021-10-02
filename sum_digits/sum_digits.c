#include <stdio.h>

int SumDigits(unsigned long long n, const int base) {
  int sum = 0;
  for (; n; n /= base)
    sum += n % base;
  return sum;
}

int main(int argc, char**argv) {
  int a, b;
  if(argc < 3) {
    a = 12345;
    b = 10;
  }
  else {
    a = atoi(argv[1]);
    b = atoi(argv[2]);
  }

  printf("SumDigits(%d, %d) = %d\n", a, b, SumDigits(a, b));

  return 0;
}
