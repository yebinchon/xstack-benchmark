#include<stdio.h>
#include<stdlib.h>
#include<string.h>

char *split(char *str);

int main(void) {
  char input[14] = "gHHH5YY++///\\";
  printf("%s\n", split(input));

  return 0;
}

char *split(char *str) {
  char last = *str;
  char *result = malloc(3*strlen(str));
  char *counter = result;

  printf("%zu\n", strlen(str));
  for(char *c = str; *c; c++) {
    if(*c != last) {
      strcpy(counter, ", ");
      counter += 2;
      last = *c;
    }
    *counter = *c;
    counter++;
  }
  *(counter--) = '\0';

  return realloc(result, strlen(result));
}
