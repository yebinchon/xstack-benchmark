unsigned int main(unsigned int arg0, unsigned char **arg1) {
    unsigned char *val1;
    unsigned long call2;
    unsigned int val3;
    unsigned char *val4;
    unsigned long call5;
    unsigned char *val6;
    unsigned long call7;
    unsigned long val8;
    unsigned char *call9;
    double *val10;
    unsigned char *call11;
    double *val12;
    unsigned char *call13;
    double *val14;
    unsigned long val15;
    unsigned char val16;
    unsigned char val17;
    unsigned long phi18;
    unsigned long val19;
    unsigned long phi20;
    unsigned long phi21;
    unsigned long val22;
    unsigned long val23;
    unsigned long phi24;
    double *val25;
    double phi26;
    unsigned long phi27;
    double val28;
    double val29;
    double call30;
    unsigned long val31;
    unsigned long phi32;
    double *val33;
    double val34;
    double val35;
    double call36;
    unsigned long val37;
    unsigned long val38;
    unsigned long phi39;
    struct struct__IO_FILE *val40;
    double val41;
    unsigned int call42;
    struct struct__IO_FILE *val43;
    unsigned int call44;
    unsigned long val45;
    struct struct__IO_FILE *val46;
    unsigned int call47;
    unsigned long val48;
    double phi49;
    unsigned long phi50;
    unsigned long val51;
    double val52;
    double val53;
    double call54;
    unsigned long val55;
    unsigned long phi56;
    unsigned char *val57;
    unsigned long phi58;
    unsigned long val59;
    double *val60;
    double val61;
    double val62;
    double call63;
    unsigned long val64;
    val1 = arg1[2UL];
    call2 = strtol(val1, (void *)0U, 10U);
    val3 = call2;
    val4 = arg1[3UL];
    call5 = strtol(val4, (void *)0U, 10U);
    val6 = arg1[1UL];
    call7 = strtol(val6, (void *)0U, 10U);
    val8 = call2 << 32UL;
    call9 = malloc((long)(call5 * val8) >> 29UL);
    val10 = (double *)call9;
    call11 = malloc((long)(call5 << 32UL) >> 29UL);
    val12 = (double *)call11;
    call13 = malloc((long)val8 >> 29UL);
    val14 = (double *)call13;
    val15 = call5 & 4294967295UL;
    val16 = (int)call5 > 0;
    if (val16) {
        phi18 = 0UL;
        do {
            val12[phi18] = (double)(unsigned int)phi18 * 3.1415926535897931;
            val19 = phi18 + 1UL;
            phi18 = val19;
        } while (val19 != val15);
    }
    if (val19 == val15 || !val16) {
        val17 = (int)val3 > 0;
        if (!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL)) {
            if (val17) {
                phi20 = 0UL;
                while (1U)
                    {
                        if (val16) {
                            phi21 = 0UL;
                            do {
                                val22 = phi21 + 1UL;
                                (&val10[phi20 * val15])[phi21] = (double)(unsigned int)phi20 * (double)(unsigned int)val22 / (double)val3;
                                phi21 = val22;
                            } while (val22 != val15);
                        }
                        if (!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)) {
                            val23 = phi20 + 1UL;
                            phi20 = val23;
                            if ((!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val22 != val15 || !val16 || !val17)) && val23 == (call2 & 4294967295UL)) {
                                break;
                            }
                        }
                    }
                if ((!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val17 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL)) && val23 == (call2 & 4294967295UL)) {
                    llvm_memset_p0i8_i64(call13, (unsigned char)0U, call2 << 3UL & 34359738360UL, 0U);
                }
            }
            if (!(val23 != (call2 & 4294967295UL) || !(!(!val17 || val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || !(val22 != val15 || !val17 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL))) || !(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17)) {
                if ((!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) && val16) {
                    phi24 = 0UL;
                    while (1U)
                        {
                            val25 = &val10[phi24 * val15];
                            phi27 = 0UL;
                            phi26 = 0.;
                            do {
                                val28 = val25[phi27];
                                val29 = val12[phi27];
                                call30 = llvm_fmuladd_f64(val28, val29, phi26);
                                val31 = phi27 + 1UL;
                                phi27 = val31;
                                phi26 = call30;
                            } while (!((!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val22 != val15 || !val16 || !val17)))) && val16 && val31 == val15));
                            if (val31 == val15) {
                                phi32 = 0UL;
                                do {
                                    val33 = &val14[phi32];
                                    val34 = *val33;
                                    val35 = val25[phi32];
                                    call36 = llvm_fmuladd_f64(val35, call30, val34);
                                    *val33 = call36;
                                    val37 = phi32 + 1UL;
                                    phi32 = val37;
                                } while (!((!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val22 != val15 || !val16 || !val17)))) && val16 && val37 == val15));
                                if (val37 == val15) {
                                    val38 = phi24 + 1UL;
                                    phi24 = val38;
                                    if ((!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val22 != val15 || !val16 || !val17)))) && val16 && val38 == val15) {
                                        break;
                                    }
                                }
                            }
                        }
                }
            }
        } else {
            if ((long)call2 > 0L) {
                llvm_memset_p0i8_i64(call13, (unsigned char)0U, call2 << 3UL & 34359738360UL, 0U);
            }
            if (call5 != 0UL) {
                phi56 = 0UL;
                while (1U)
                    {
                        val57 = &call9[phi56 * (val15 << 3UL)];
                        phi50 = 0UL;
                        phi49 = 0.;
                        do {
                            val51 = phi50 << 3UL;
                            val52 = *(double *)(&val57[val51]);
                            val53 = *(double *)(&call11[val51]);
                            call54 = llvm_fmuladd_f64(val52, val53, phi49);
                            val55 = phi50 + 1UL;
                            phi50 = val55;
                            phi49 = call54;
                        } while (!(val55 == call5));
                        phi58 = 0UL;
                        do {
                            val59 = phi58 << 3UL;
                            val60 = (double *)(&call13[val59]);
                            val61 = *val60;
                            val62 = *(double *)(&val57[val59]);
                            call63 = llvm_fmuladd_f64(val62, call54, val61);
                            *val60 = call63;
                            val64 = phi58 + 1UL;
                            phi58 = val64;
                        } while (val64 != call5);
                        val48 = phi56 + 1UL;
                        phi56 = val48;
                        if (val48 == call5) {
                            break;
                        }
                    }
            }
        }
        if (!(val38 != val15 || val31 != val15 || !val16 || val37 != val15 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || val64 != call5 || val55 != call5 || call5 == 0UL || val48 != call5)) {
            if ((!(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15) || !(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || val64 != call5 || val55 != call5 || call5 == 0UL || val48 != call5)) && (unsigned int)call7 == 1U) {
                if ((!(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(val38 != val15 || val31 != val15 || !val16 || val37 != val15 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || val64 != call5 || val55 != call5 || call5 == 0UL || val48 != call5)) && (unsigned int)call7 == 1U && val17) {
                    phi39 = 0UL;
                    if ((!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15) || !(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || call5 == 0UL || val64 != call5 || val48 != call5 || val55 != call5)) && (unsigned int)call7 == 1U && val17) {
                        while (1U)
                            {
                                val40 = stderr;
                                val41 = val14[phi39];
                                call42 = fprintf(val40, "%0.2lf ", val41);
                                if ((!(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(val64 != call5 || val55 != call5 || call5 == 0UL || val48 != call5 || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15)) && (unsigned int)call7 == 1U && val17 && (unsigned int)phi39 % 20U == 0U) {
                                    val43 = stderr;
                                    call44 = fputc(10U, val43);
                                }
                                if (!((unsigned int)phi39 % 20U != 0U || !(!(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || call5 == 0UL || val64 != call5 || val48 != call5 || val55 != call5) || !(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))))) || (unsigned int)call7 != 1U || !val17) || !(!(!(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || call5 == 0UL || val64 != call5 || val48 != call5 || val55 != call5)) || (unsigned int)phi39 % 20U == 0U || (unsigned int)call7 != 1U || !val17)) {
                                    val45 = phi39 + 1UL;
                                    phi39 = val45;
                                    if ((!((unsigned int)call7 != 1U || !(!(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val22 != val15 || !val16 || !val17))))) || !(val48 != call5 || val55 != call5 || val64 != call5 || call5 == 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!val16 || val37 != val15 || val31 != val15 || val38 != val15 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val22 != val15 || !val16 || !val17)))))) || (unsigned int)phi39 % 20U != 0U || !val17) || !((unsigned int)phi39 % 20U == 0U || (unsigned int)call7 != 1U || !(!(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val22 != val15 || !val16 || !val17))))) || !(val48 != call5 || val55 != call5 || val64 != call5 || call5 == 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!val16 || val37 != val15 || val31 != val15 || val38 != val15 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val22 != val15 || !val16 || !val17)))))) || !val17)) && val45 == (call2 & 4294967295UL)) {
                                        break;
                                    }
                                }
                            }
                    }
                }
                if (!(val45 != (call2 & 4294967295UL) || !(!(!(!(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || call5 == 0UL || val64 != call5 || val48 != call5 || val55 != call5)) || !val17 || (unsigned int)phi39 % 20U == 0U || (unsigned int)call7 != 1U) || !(!(!(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || call5 == 0UL || val64 != call5 || val48 != call5 || val55 != call5)) || !val17 || (unsigned int)phi39 % 20U != 0U || (unsigned int)call7 != 1U))) || !(!(!(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || call5 == 0UL || val64 != call5 || val48 != call5 || val55 != call5)) || (unsigned int)call7 != 1U || val17)) {
                    val46 = stderr;
                    call47 = fputc(10U, val46);
                }
            }
            if (!(!(!(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || call5 == 0UL || val64 != call5 || val48 != call5 || val55 != call5) || !(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15)) || (unsigned int)call7 != 1U || val17) || !(val45 != (call2 & 4294967295UL) || !(!(!(!(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || call5 == 0UL || val64 != call5 || val48 != call5 || val55 != call5) || !(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15)) || (unsigned int)phi39 % 20U == 0U || (unsigned int)call7 != 1U || !val17) || !(!(!(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || call5 == 0UL || val64 != call5 || val48 != call5 || val55 != call5) || !(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15)) || (unsigned int)phi39 % 20U != 0U || (unsigned int)call7 != 1U || !val17))) || !((unsigned int)call7 == 1U || !(!(call5 != 0UL || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L))) || !(!(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 > 0L) || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL) || (long)call2 <= 0L)) || call5 == 0UL || val64 != call5 || val48 != call5 || val55 != call5) || !(val16 || !(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17))))) || !(!(!(call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || val17) || !(val23 != (call2 & 4294967295UL) || !(!(val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17) || !(val22 != val15 || !val16 || call2 + 2147483648UL < 4294967296UL && call5 < 2147483648UL || !val17)))) || val38 != val15 || val31 != val15 || !val16 || val37 != val15)))) {
                free(call9);
                free(call11);
                free(call13);
                return 0U;
            }
        }
    }
}
void main_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned long val4;
    unsigned long val5;
    unsigned char *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    unsigned long phi13;
    unsigned long val14;
    val4 = *(unsigned long *)arg5;
    val5 = *(unsigned long *)(&arg5[8UL]);
    val6 = *(unsigned char **)(&arg5[16UL]);
    val7 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val8 = arg3 + 18446744073709551615UL;
    var1 = val8;
    __kmpc_for_static_init_8(&_loc_dummy, val7, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val9 = var0;
    val10 = var1;
    val11 = ((long)val10 > (long)val8 ? val8 : val10);
    var1 = val11;
    if ((long)val9 <= (long)val11) {
        phi12 = val9;
        while (1U)
            {
                if ((long)val5 > 0L) {
                    phi13 = 0UL;
                    do {
                        *(double *)(&(&val6[phi12 * (val5 << 3UL & 34359738360UL)])[phi13 << 3UL]) = (double)(unsigned int)phi12 * (double)((unsigned int)phi13 + 1U) / (double)(unsigned int)val4;
                        val14 = phi13 + 1UL;
                        phi13 = val14;
                    } while (val14 != val5);
                }
                if (!((long)val9 > (long)val11 || (long)val5 > 0L) || !(val14 != val5 || (long)val9 > (long)val11 || (long)val5 <= 0L)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (long)val5 > 0L) || !((long)val5 <= 0L || (long)val9 > (long)val11 || val14 != val5)) && phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (long)val5 > 0L) || !(val14 != val5 || (long)val9 > (long)val11 || (long)val5 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy, val7);
        return;
    }
}
