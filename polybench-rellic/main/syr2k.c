unsigned int main(unsigned int arg0, unsigned char **arg1) {
    double var4;
    unsigned char *val5;
    unsigned long call6;
    unsigned char *val7;
    unsigned long call8;
    unsigned int val9;
    unsigned char *val10;
    unsigned long call11;
    unsigned int val12;
    unsigned long val13;
    unsigned char *call14;
    unsigned long val15;
    unsigned char *call16;
    unsigned char *call17;
    unsigned long val18;
    unsigned long phi19;
    unsigned long phi20;
    struct struct__IO_FILE *val21;
    double val22;
    unsigned int call23;
    struct struct__IO_FILE *val24;
    unsigned int call25;
    unsigned long val26;
    unsigned long val27;
    struct struct__IO_FILE *val28;
    unsigned int call29;
    val5 = arg1[1UL];
    call6 = strtol(val5, (void *)0U, 10U);
    val7 = arg1[2UL];
    call8 = strtol(val7, (void *)0U, 10U);
    val9 = call8;
    val10 = arg1[3UL];
    call11 = strtol(val10, (void *)0U, 10U);
    val12 = call11;
    val13 = call8 << 3UL;
    call14 = malloc(val13 * call8 & 34359738360UL);
    val15 = call11 * val13 & 34359738360UL;
    call16 = malloc(val15);
    call17 = malloc(val15);
    val18 = call8 & 4294967295UL;
    var4 = val9;
    if ((unsigned int)call6 == 1U) {
        phi19 = 0UL;
        do {
            phi20 = 0UL;
            do {
                val21 = stderr;
                val22 = (&((double *)call14)[phi19 * val18])[phi20];
                call23 = fprintf(val21, "%0.2lf ", val22);
                if ((int)((unsigned int)phi19 * val9 + (unsigned int)phi20) % 20 == 0U) {
                    val24 = stderr;
                    call25 = fputc(10U, val24);
                }
                val26 = phi20 + 1UL;
                phi20 = val26;
            } while (val26 != val18);
            val27 = phi19 + 1UL;
            phi19 = val27;
        } while (val27 != val18);
        if (val26 == val18) {
            val28 = stderr;
            call29 = fputc(10U, val28);
        }
    }
    if ((unsigned int)call6 != 1U || !(val27 != val18 || (unsigned int)call6 != 1U || val26 != val18)) {
        free(call14);
        free(call16);
        free(call17);
        return 0U;
    }
}
