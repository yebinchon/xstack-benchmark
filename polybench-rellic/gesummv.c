unsigned int main(unsigned int argc, unsigned char **argv) {
    unsigned char *val0;
    unsigned long call1;
    unsigned char *call2;
    double *val3;
    unsigned char *call4;
    double *val5;
    unsigned char *call6;
    double *val7;
    unsigned char *call8;
    unsigned long phi9;
    double val10;
    unsigned long val11;
    unsigned long phi12;
    double val13;
    unsigned long val14;
    unsigned long val15;
    double *val16;
    unsigned long phi17;
    double *val18;
    unsigned long val19;
    double phi20;
    double phi21;
    unsigned long phi22;
    double val23;
    double val24;
    double val25;
    double val26;
    double val27;
    unsigned long val28;
    unsigned long val29;
    unsigned long phi30;
    unsigned int phi31;
    struct struct__IO_FILE *val32;
    double val33;
    unsigned int call34;
    struct struct__IO_FILE *val35;
    unsigned int call36;
    unsigned long val37;
    val0 = argv[1UL];
    call1 = strtol(val0, (void *)0U, 10U);
    call2 = malloc(128000000UL);
    val3 = (double *)call2;
    call4 = malloc(128000000UL);
    val5 = (double *)call4;
    call6 = malloc(32000UL);
    val7 = (double *)call6;
    call8 = malloc(32000UL);
    phi9 = 0UL;
    do {
        val10 = (unsigned int)phi9;
        val7[phi9] = val10 / 4000.;
        val11 = phi9 * 4000UL;
        phi12 = 0UL;
        do {
            val13 = val10 * (double)(unsigned int)phi12 / 4000.;
            (&val3[val11])[phi12] = val13;
            (&val5[val11])[phi12] = val13;
            val14 = phi12 + 1UL;
            phi12 = val14;
        } while (val14 != 4000UL);
        if (val14 == 4000UL) {
            val15 = phi9 + 1UL;
            phi9 = val15;
        }
    } while (!(val14 == 4000UL && val15 == 4000UL));
    if (val14 == 4000UL && val15 == 4000UL) {
        val16 = (double *)call8;
        phi17 = 0UL;
        do {
            if (val14 == 4000UL && val15 == 4000UL) {
                val18 = &val16[phi17];
                *val18 = 0.;
                val19 = phi17 * 4000UL;
                phi22 = 0UL;
                phi21 = 0.;
                phi20 = 0.;
                do {
                    if (val14 == 4000UL && val15 == 4000UL) {
                        val23 = (&val3[val19])[phi22];
                        val24 = val7[phi22];
                        val25 = val23 * val24 + phi21;
                        val26 = (&val5[val19])[phi22];
                        val27 = val24 * val26 + phi20;
                        val28 = phi22 + 1UL;
                        phi22 = val28;
                        phi21 = val25;
                        phi20 = val27;
                    }
                } while (!(val14 == 4000UL && val15 == 4000UL && val28 == 4000UL));
            }
            if (val14 == 4000UL && val15 == 4000UL && val28 == 4000UL) {
                *val18 = val25 * 43532. + val27 * 12313.;
                val29 = phi17 + 1UL;
                phi17 = val29;
            }
        } while (!(val14 == 4000UL && val15 == 4000UL && val28 == 4000UL && val29 == 4000UL));
    }
    if (val14 == 4000UL && val15 == 4000UL && val28 == 4000UL && val29 == 4000UL) {
        if ((unsigned int)call1 == 1U) {
            phi31 = 0U;
            phi30 = 0UL;
            do {
                if (val14 == 4000UL && val15 == 4000UL && val28 == 4000UL && val29 == 4000UL && (unsigned int)call1 == 1U) {
                    val32 = stderr;
                    val33 = val16[phi30];
                    call34 = fprintf(val32, _str, val33);
                    if ((unsigned short)(unsigned short)phi31 % (unsigned short)20U == (unsigned short)0U) {
                        val35 = stderr;
                        call36 = fputc(10U, val35);
                    }
                    if ((unsigned int)call1 == 1U && val29 == 4000UL && val28 == 4000UL && val14 == 4000UL && val15 == 4000UL) {
                        val37 = phi30 + 1UL;
                        phi31 = phi31 + 1U;
                        phi30 = val37;
                    }
                }
            } while (!((unsigned int)call1 == 1U && val29 == 4000UL && val28 == 4000UL && val14 == 4000UL && val15 == 4000UL && val37 == 4000UL));
        }
    }
    if (!((unsigned int)call1 == 1U || val29 != 4000UL || val28 != 4000UL || val14 != 4000UL || val15 != 4000UL) || !(val37 != 4000UL || (unsigned int)call1 != 1U || val29 != 4000UL || val28 != 4000UL || val14 != 4000UL || val15 != 4000UL)) {
        free(call2);
        free(call4);
        free(call6);
        free(call8);
        return 0U;
    }
}
