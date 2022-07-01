unsigned int main(unsigned int arg0, unsigned char **arg1) {
    unsigned char *val3;
    unsigned long call4;
    unsigned char *call5;
    unsigned char *call6;
    unsigned char *call7;
    unsigned char *call8;
    unsigned char *call9;
    unsigned long phi10;
    struct struct__IO_FILE *val11;
    double val12;
    unsigned int call13;
    struct struct__IO_FILE *val14;
    double val15;
    unsigned int call16;
    struct struct__IO_FILE *val17;
    unsigned int call18;
    unsigned long val19;
    val3 = arg1[1UL];
    call4 = strtol(val3, (void *)0U, 10U);
    call5 = malloc(128000000UL);
    call6 = malloc(32000UL);
    call7 = malloc(32000UL);
    call8 = malloc(32000UL);
    call9 = malloc(32000UL);
    if ((unsigned int)call4 == 1U) {
        phi10 = 0UL;
        do {
            val11 = stderr;
            val12 = ((double *)call6)[phi10];
            call13 = fprintf(val11, "%0.2lf", val12);
            val14 = stderr;
            val15 = ((double *)call7)[phi10];
            call16 = fprintf(val14, "%0.2lf", val15);
            if ((unsigned short)phi10 % (unsigned short)20U == (unsigned short)0U) {
                val17 = stderr;
                call18 = fputc(10U, val17);
            }
            val19 = phi10 + 1UL;
            phi10 = val19;
        } while (val19 != 4000UL);
    }
    if (val19 == 4000UL || (unsigned int)call4 != 1U) {
        free(call5);
        free(call6);
        free(call7);
        free(call8);
        free(call9);
        return 0U;
    }
}
