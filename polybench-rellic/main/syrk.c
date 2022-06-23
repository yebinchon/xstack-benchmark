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
    unsigned char *call15;
    unsigned long val16;
    unsigned long phi17;
    unsigned long phi18;
    struct struct__IO_FILE *val19;
    double val20;
    unsigned int call21;
    struct struct__IO_FILE *val22;
    unsigned int call23;
    unsigned long val24;
    unsigned long val25;
    struct struct__IO_FILE *val26;
    unsigned int call27;
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
    call15 = malloc(call11 * val13 & 34359738360UL);
    val16 = call8 & 4294967295UL;
    var4 = val9;
    if ((unsigned int)call6 == 1U) {
        phi17 = 0UL;
        do {
            phi18 = 0UL;
            do {
                val19 = stderr;
                val20 = (&((double *)call14)[phi17 * val16])[phi18];
                call21 = fprintf(val19, "%0.2lf ", val20);
                if ((int)((unsigned int)phi17 * val9 + (unsigned int)phi18) % 20 == 0U) {
                    val22 = stderr;
                    call23 = fputc(10U, val22);
                }
                val24 = phi18 + 1UL;
                phi18 = val24;
            } while (val24 != val16);
            val25 = phi17 + 1UL;
            phi17 = val25;
        } while (val25 != val16);
        if (val24 == val16) {
            val26 = stderr;
            call27 = fputc(10U, val26);
        }
    }
    if ((unsigned int)call6 != 1U || !(val25 != val16 || (unsigned int)call6 != 1U || val24 != val16)) {
        free(call14);
        free(call15);
        return 0U;
    }
}
