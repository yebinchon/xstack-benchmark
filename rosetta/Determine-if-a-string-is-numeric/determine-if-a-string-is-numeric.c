#include <ctype.h>
#include <stdlib.h>
int isNumeric (const char * s)
{
    if (s == NULL || *s == '\0' || isspace(*s))
      return 0;
    char * p;
    strtod (s, &p);
    return *p == '\0';
}

int main(void) {

  isNumeric("01983498");
  return 0;
}
