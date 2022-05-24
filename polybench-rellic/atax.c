unsigned int main(unsigned int argc, unsigned char **argv) {
    unsigned char *val0;
    unsigned long call1;
    unsigned char *call2;
    unsigned char *call3;
    double *val4;
    unsigned char *call5;
    unsigned long phi6;
    unsigned long val7;
    double *val8;
    unsigned long phi9;
    unsigned long phi10;
    unsigned long val11;
    unsigned long val12;
    double *val13;
    unsigned long phi14;
    unsigned long val15;
    double phi16;
    unsigned long phi17;
    double val18;
    double val19;
    double val20;
    unsigned long val21;
    unsigned long phi22;
    double *val23;
    double val24;
    double val25;
    unsigned long val26;
    unsigned long val27;
    unsigned long phi28;
    unsigned int phi29;
    struct struct__IO_FILE *val30;
    double val31;
    unsigned int call32;
    struct struct__IO_FILE *val33;
    unsigned int call34;
    unsigned long val35;
    struct struct__IO_FILE *val36;
    unsigned int call37;
    val0 = argv[1UL];
    call1 = strtol(val0, (void *)0U, 10U);
    call2 = malloc(128000000UL);
    call3 = malloc(32000UL);
    val4 = (double *)call3;
    call5 = malloc(32000UL);
    phi6 = 0UL;
    do {
        val4[phi6] = (double)(unsigned int)phi6 * 3.1415926535897931;
        val7 = phi6 + 1UL;
        phi6 = val7;
    } while (val7 != 4000UL);
    if (val7 == 4000UL) {
        val8 = (double *)call2;
        phi9 = 0UL;
        do {
            if (val7 == 4000UL) {
                phi10 = 0UL;
                do {
                    if (val7 == 4000UL) {
                        val11 = phi10 + 1UL;
                        val8[phi10 + phi9 * 4000UL] = (double)(unsigned int)phi9 * (double)(unsigned int)val11 / 4000.;
                        phi10 = val11;
                    }
                } while (!(val7 == 4000UL && val11 == 4000UL));
            }
            if (val7 == 4000UL && val11 == 4000UL) {
                val12 = phi9 + 1UL;
                phi9 = val12;
            }
        } while (!(val7 == 4000UL && val11 == 4000UL && val12 == 4000UL));
    }
    if (val7 == 4000UL && val11 == 4000UL && val12 == 4000UL) {
        val13 = (double *)call5;
        llvm_memset_p0i8_i64(call5, (unsigned char)0U, 32000UL, 0U);
        phi14 = 0UL;
        do {
            if (val7 == 4000UL && val11 == 4000UL && val12 == 4000UL) {
                val15 = phi14 * 4000UL;
                phi17 = 0UL;
                phi16 = 0.;
                do {
                    if (val7 == 4000UL && val11 == 4000UL && val12 == 4000UL) {
                        val18 = val8[phi17 + val15];
                        val19 = val4[phi17];
                        val20 = phi16 + val18 * val19;
                        val21 = phi17 + 1UL;
                        phi17 = val21;
                        phi16 = val20;
                    }
                } while (!(val7 == 4000UL && val11 == 4000UL && val12 == 4000UL && val21 == 4000UL));
            }
            if (val7 == 4000UL && val11 == 4000UL && val12 == 4000UL && val21 == 4000UL) {
                phi22 = 0UL;
                do {
                    if (val7 == 4000UL && val11 == 4000UL && val12 == 4000UL && val21 == 4000UL) {
                        val23 = &val13[phi22];
                        val24 = *val23;
                        val25 = val8[phi22 + val15];
                        *val23 = val24 + val20 * val25;
                        val26 = phi22 + 1UL;
                        phi22 = val26;
                    }
                } while (!(val7 == 4000UL && val11 == 4000UL && val12 == 4000UL && val21 == 4000UL && val26 == 4000UL));
            }
            if (val7 == 4000UL && val11 == 4000UL && val12 == 4000UL && val21 == 4000UL && val26 == 4000UL) {
                val27 = phi14 + 1UL;
                phi14 = val27;
            }
        } while (!(val7 == 4000UL && val11 == 4000UL && val12 == 4000UL && val21 == 4000UL && val26 == 4000UL && val27 == 4000UL));
    }
    if (val7 == 4000UL && val11 == 4000UL && val12 == 4000UL && val21 == 4000UL && val26 == 4000UL && val27 == 4000UL) {
        if ((unsigned int)call1 == 1U) {
            phi29 = 0U;
            phi28 = 0UL;
            do {
                if (val7 == 4000UL && val11 == 4000UL && val12 == 4000UL && val21 == 4000UL && val26 == 4000UL && val27 == 4000UL && (unsigned int)call1 == 1U) {
                    val30 = stderr;
                    val31 = val13[phi28];
                    call32 = fprintf(val30, _str, val31);
                    if ((unsigned short)(unsigned short)phi29 % (unsigned short)20U == (unsigned short)0U) {
                        val33 = stderr;
                        call34 = fputc(10U, val33);
                    }
                    if ((unsigned int)call1 == 1U && val27 == 4000UL && val26 == 4000UL && val21 == 4000UL && val12 == 4000UL && val7 == 4000UL && val11 == 4000UL) {
                        val35 = phi28 + 1UL;
                        phi29 = phi29 + 1U;
                        phi28 = val35;
                    }
                }
            } while (!((unsigned int)call1 == 1U && val27 == 4000UL && val26 == 4000UL && val21 == 4000UL && val12 == 4000UL && val7 == 4000UL && val11 == 4000UL && val35 == 4000UL));
        }
        if ((unsigned int)call1 == 1U && val27 == 4000UL && val26 == 4000UL && val21 == 4000UL && val12 == 4000UL && val7 == 4000UL && val11 == 4000UL && val35 == 4000UL) {
            val36 = stderr;
            call37 = fputc(10U, val36);
        }
    }
    if (!(val11 != 4000UL || val7 != 4000UL || val12 != 4000UL || val21 != 4000UL || val26 != 4000UL || (unsigned int)call1 == 1U || val27 != 4000UL) || !(val11 != 4000UL || val35 != 4000UL || val7 != 4000UL || val12 != 4000UL || val21 != 4000UL || val26 != 4000UL || (unsigned int)call1 != 1U || val27 != 4000UL)) {
        free(call2);
        free(call3);
        free(call5);
        return 0U;
    }
}
