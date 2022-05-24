unsigned int main(unsigned int argc, unsigned char **argv) {
    unsigned char *val0;
    unsigned long call1;
    unsigned char *call2;
    unsigned char *call3;
    unsigned char *call4;
    unsigned char *call5;
    double *val6;
    unsigned char *call7;
    unsigned long phi8;
    unsigned long val9;
    double *val10;
    double *val11;
    double *val12;
    unsigned long phi13;
    double val14;
    unsigned long phi15;
    unsigned long val16;
    unsigned long val17;
    double *val18;
    unsigned long phi19;
    double val20;
    double phi21;
    unsigned long phi22;
    double *val23;
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
    unsigned long phi38;
    unsigned int phi39;
    struct struct__IO_FILE *val40;
    double val41;
    unsigned int call42;
    struct struct__IO_FILE *val43;
    unsigned int call44;
    unsigned long val45;
    struct struct__IO_FILE *val46;
    unsigned int call47;
    val0 = argv[1UL];
    call1 = strtol(val0, (void *)0U, 10U);
    call2 = malloc(128000000UL);
    call3 = malloc(32000UL);
    call4 = malloc(32000UL);
    call5 = malloc(32000UL);
    val6 = (double *)call5;
    call7 = malloc(32000UL);
    phi8 = 0UL;
    do {
        val6[phi8] = (double)(unsigned int)phi8 * 3.1415926535897931;
        val9 = phi8 + 1UL;
        phi8 = val9;
    } while (val9 != 4000UL);
    if (val9 == 4000UL) {
        val10 = (double *)call2;
        val11 = (double *)call3;
        val12 = (double *)call7;
        phi13 = 0UL;
        do {
            if (val9 == 4000UL) {
                val14 = (unsigned int)phi13;
                val12[phi13] = val14 * 3.1415926535897931;
                phi15 = 0UL;
                do {
                    if (val9 == 4000UL) {
                        val16 = phi15 + 1UL;
                        val10[phi15 + phi13 * 4000UL] = val14 * (double)(unsigned int)val16 / 4000.;
                        phi15 = val16;
                    }
                } while (!(val9 == 4000UL && val16 == 4000UL));
            }
            if (val9 == 4000UL && val16 == 4000UL) {
                val17 = phi13 + 1UL;
                phi13 = val17;
            }
        } while (!(val9 == 4000UL && val16 == 4000UL && val17 == 4000UL));
    }
    if (val9 == 4000UL && val16 == 4000UL && val17 == 4000UL) {
        val18 = (double *)call4;
        llvm_memset_p0i8_i64(call3, (unsigned char)0U, 32000UL, 0U);
        phi19 = 0UL;
        do {
            if (val9 == 4000UL && val16 == 4000UL && val17 == 4000UL) {
                val20 = val12[phi19];
                phi22 = 0UL;
                phi21 = 0.;
                do {
                    if (val9 == 4000UL && val16 == 4000UL && val17 == 4000UL) {
                        val23 = &val11[phi22];
                        val24 = *val23;
                        val25 = val10[phi22 + phi19 * 4000UL];
                        *val23 = val24 + val20 * val25;
                        val26 = val6[phi22];
                        val27 = phi21 + val25 * val26;
                        val28 = phi22 + 1UL;
                        phi22 = val28;
                        phi21 = val27;
                    }
                } while (!(val9 == 4000UL && val16 == 4000UL && val17 == 4000UL && val28 == 4000UL));
            }
            if (val9 == 4000UL && val16 == 4000UL && val17 == 4000UL && val28 == 4000UL) {
                val18[phi19] = val27;
                val29 = phi19 + 1UL;
                phi19 = val29;
            }
        } while (!(val9 == 4000UL && val16 == 4000UL && val17 == 4000UL && val28 == 4000UL && val29 == 4000UL));
    }
    if (val9 == 4000UL && val16 == 4000UL && val17 == 4000UL && val28 == 4000UL && val29 == 4000UL) {
        if ((unsigned int)call1 == 1U) {
            phi31 = 0U;
            phi30 = 0UL;
            do {
                if (val9 == 4000UL && val16 == 4000UL && val17 == 4000UL && val28 == 4000UL && val29 == 4000UL && (unsigned int)call1 == 1U) {
                    val32 = stderr;
                    val33 = val11[phi30];
                    call34 = fprintf(val32, _str, val33);
                    if ((unsigned short)(unsigned short)phi31 % (unsigned short)20U == (unsigned short)0U) {
                        val35 = stderr;
                        call36 = fputc(10U, val35);
                    }
                    if ((unsigned int)call1 == 1U && val29 == 4000UL && val28 == 4000UL && val17 == 4000UL && val9 == 4000UL && val16 == 4000UL) {
                        val37 = phi30 + 1UL;
                        phi31 = phi31 + 1U;
                        phi30 = val37;
                    }
                }
            } while (!((unsigned int)call1 == 1U && val29 == 4000UL && val28 == 4000UL && val17 == 4000UL && val9 == 4000UL && val16 == 4000UL && val37 == 4000UL));
        }
        if ((unsigned int)call1 == 1U && val29 == 4000UL && val28 == 4000UL && val17 == 4000UL && val9 == 4000UL && val16 == 4000UL && val37 == 4000UL) {
            phi39 = 0U;
            phi38 = 0UL;
            do {
                if ((unsigned int)call1 == 1U && val29 == 4000UL && val28 == 4000UL && val17 == 4000UL && val9 == 4000UL && val16 == 4000UL && val37 == 4000UL) {
                    val40 = stderr;
                    val41 = val18[phi38];
                    call42 = fprintf(val40, _str, val41);
                    if ((unsigned short)(unsigned short)phi39 % (unsigned short)20U == (unsigned short)0U) {
                        val43 = stderr;
                        call44 = fputc(10U, val43);
                    }
                    if (val37 == 4000UL && val16 == 4000UL && val9 == 4000UL && val17 == 4000UL && val28 == 4000UL && (unsigned int)call1 == 1U && val29 == 4000UL) {
                        val45 = phi38 + 1UL;
                        phi39 = phi39 + 1U;
                        phi38 = val45;
                    }
                }
            } while (!(val37 == 4000UL && val16 == 4000UL && val9 == 4000UL && val17 == 4000UL && val28 == 4000UL && (unsigned int)call1 == 1U && val29 == 4000UL && val45 == 4000UL));
        }
        if (val37 == 4000UL && val16 == 4000UL && val9 == 4000UL && val17 == 4000UL && val28 == 4000UL && (unsigned int)call1 == 1U && val29 == 4000UL && val45 == 4000UL) {
            val46 = stderr;
            call47 = fputc(10U, val46);
        }
    }
    if (!(val29 != 4000UL || (unsigned int)call1 == 1U || val28 != 4000UL || val17 != 4000UL || val9 != 4000UL || val16 != 4000UL) || !(val45 != 4000UL || val37 != 4000UL || (unsigned int)call1 != 1U || val29 != 4000UL || val28 != 4000UL || val17 != 4000UL || val9 != 4000UL || val16 != 4000UL)) {
        free(call2);
        free(call3);
        free(call4);
        free(call5);
        free(call7);
        return 0U;
    }
}
