#include<math.h>
#include<stdio.h>

int main (void) {
  double /*inputs[11],*/ check = 400, result;
  int i;

//  for (i = 0; i < 11; i++) {
//    scanf ("%lf", &inputs[i]);
//  }
  double inputs[11] = {4, 5, 10, 9, 6, 11, 39, 2, 12, 98, 14};


  printf ("\n\n\nEvaluating f(x) = |x|^0.5 + 5x^3 for the given inputs :");

  for (i = 10; i >= 0; i--) {
    result = sqrt (fabs (inputs[i])) + 5 * pow (inputs[i], 3);

    printf ("\nf(%lf) = ");

    if (result > check) {
      printf ("Overflow!");
    }

    else {
      printf ("%lf", result);
    }
  }

  return 0;
}
