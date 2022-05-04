void kernel_jacobi_1d_imper(unsigned int tsteps, unsigned int n, double *A, double *B) {
    unsigned char val0;
    unsigned int val1;
    unsigned int phi2;
    unsigned long phi3;
    double val4;
    double val5;
    unsigned long val6;
    double val7;
    unsigned long phi8;
    double val9;
    unsigned long val10;
    unsigned int val11;
    val0 = (int)n > 2;
    if ((int)tsteps > 0) {
        val1 = n + 4294967295U;
        phi2 = 0U;
        do {
            if ((int)tsteps > 0) {
                if (val0) {
                    phi3 = 1UL;
                    do {
                        if ((int)tsteps > 0 && val0) {
                            val4 = A[phi3 + 18446744073709551615UL];
                            val5 = A[phi3];
                            val6 = phi3 + 1UL;
                            val7 = A[val6];
                            B[phi3] = (val4 + val5 + val7) * 0.33333000000000002;
                            phi3 = val6;
                        }
                    } while (!((int)tsteps > 0 && val0 && val6 == (unsigned long)val1));
                }
                if (val0 && val6 == (unsigned long)val1) {
                    if ((int)tsteps > 0 && val0 && val6 == (unsigned long)val1 && val0) {
                        phi8 = 1UL;
                        do {
                            if ((int)tsteps > 0 && val0 && val6 == (unsigned long)val1 && val0) {
                                val9 = B[phi8];
                                A[phi8] = val9;
                                val10 = phi8 + 1UL;
                                phi8 = val10;
                            }
                        } while (!((int)tsteps > 0 && val0 && val6 == (unsigned long)val1 && val0 && val10 == (unsigned long)val1));
                    }
                }
            }
            if (!((int)tsteps <= 0 || val0) || !(val6 != (unsigned long)val1 || (int)tsteps <= 0 || !val0 || val10 != (unsigned long)val1 || !val0)) {
                val11 = phi2 + 1U;
                phi2 = val11;
            }
        } while (!((!((int)tsteps <= 0 || val6 != (unsigned long)val1 || !val0 || val10 != (unsigned long)val1 || !val0) || !((int)tsteps <= 0 || val0)) && val11 == tsteps));
    }
    if ((int)tsteps <= 0 || !(val11 != tsteps || !(!(val10 != (unsigned long)val1 || !val0 || val6 != (unsigned long)val1 || (int)tsteps <= 0 || !val0) || !((int)tsteps <= 0 || val0)))) {
        return;
    }
}
unsigned int main(unsigned int argc, unsigned char **argv) {
    unsigned char *val0;
    unsigned long call1;
    unsigned char *call2;
    double *val3;
    unsigned char *call4;
    double *val5;
    unsigned long phi6;
    double val7;
    unsigned long val8;
    double val9;
    unsigned int phi10;
    double val11;
    double phi12;
    double phi13;
    unsigned long phi14;
    unsigned long val15;
    double val16;
    unsigned int val17;
    double phi18;
    unsigned long phi19;
    unsigned int phi20;
    struct struct__IO_FILE *val21;
    unsigned int call22;
    struct struct__IO_FILE *val23;
    unsigned int call24;
    unsigned long val25;
    double val26;
    struct struct__IO_FILE *val27;
    unsigned int call28;
    val0 = argv[1UL];
    call1 = strtol(val0, (void *)0U, 10U);
    call2 = malloc(80000UL);
    val3 = (double *)call2;
    call4 = malloc(80000UL);
    val5 = (double *)call4;
    phi6 = 0UL;
    do {
        val7 = (unsigned int)phi6;
        val3[phi6] = (val7 + 2.) / 1.0E+4;
        val5[phi6] = (val7 + 3.) / 1.0E+4;
        val8 = phi6 + 1UL;
        phi6 = val8;
    } while (val8 != 10000UL);
    if (val8 == 10000UL) {
        val9 = *val3;
        phi10 = 0U;
        do {
            if (val8 == 10000UL) {
                val11 = val3[1UL];
                phi14 = 1UL;
                phi13 = val9;
                phi12 = val11;
                do {
                    if (val8 == 10000UL) {
                        val15 = phi14 + 1UL;
                        val16 = val3[val15];
                        val5[phi14] = (phi13 + phi12 + val16) * 0.33333000000000002;
                        phi14 = val15;
                        phi13 = phi12;
                        phi12 = val16;
                    }
                } while (!(val8 == 10000UL && val15 == 9999UL));
            }
            if (val8 == 10000UL && val15 == 9999UL) {
                __builtin_memcpy(&call2[8UL], &call4[8UL], 79984UL);
                val17 = phi10 + 1U;
                phi10 = val17;
            }
        } while (!(val8 == 10000UL && val15 == 9999UL && val17 == 100U));
    }
    if (val8 == 10000UL && val15 == 9999UL && val17 == 100U) {
        if ((unsigned int)call1 == 1U) {
            phi20 = 0U;
            phi19 = 0UL;
            phi18 = val9;
            while (1U)
                {
                    if (val8 == 10000UL && val15 == 9999UL && val17 == 100U && (unsigned int)call1 == 1U) {
                        val21 = stderr;
                        call22 = fprintf(val21, _str, phi18);
                        if ((unsigned short)(unsigned short)phi20 % (unsigned short)20U == (unsigned short)0U) {
                            val23 = stderr;
                            call24 = fputc(10U, val23);
                        }
                        if ((unsigned int)call1 == 1U && val17 == 100U && val8 == 10000UL && val15 == 9999UL) {
                            val25 = phi19 + 1UL;
                        }
                    }
                    if ((unsigned int)call1 == 1U && val17 == 100U && val8 == 10000UL && val15 == 9999UL && val25 == 10000UL) {
                        break;
                    }
                    if ((unsigned int)call1 == 1U && val17 == 100U && val8 == 10000UL && val15 == 9999UL && val25 != 10000UL) {
                        val26 = val3[val25];
                        phi20 = phi20 + 1U;
                        phi19 = val25;
                        phi18 = val26;
                    }
                }
        }
        if ((unsigned int)call1 == 1U && val17 == 100U && val8 == 10000UL && val15 == 9999UL && val25 == 10000UL) {
            val27 = stderr;
            call28 = fputc(10U, val27);
        }
    }
    if (!(val8 != 10000UL || (unsigned int)call1 != 1U || val17 != 100U || val15 != 9999UL || val25 != 10000UL) || !(val15 != 9999UL || val8 != 10000UL || (unsigned int)call1 == 1U || val17 != 100U)) {
        free(call2);
        free(call4);
        return 0U;
    }
}
