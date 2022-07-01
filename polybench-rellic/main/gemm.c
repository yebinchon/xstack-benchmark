unsigned int main(unsigned int arg0, unsigned char **arg1) {
    unsigned char *val0;
    unsigned long call1;
    unsigned char *val2;
    unsigned long call3;
    unsigned int val4;
    unsigned char *val5;
    unsigned long call6;
    unsigned int val7;
    unsigned char *val8;
    unsigned long call9;
    unsigned int val10;
    unsigned long val11;
    unsigned char *call12;
    double *val13;
    unsigned char *call14;
    unsigned char *call15;
    unsigned long val16;
    double val17;
    unsigned long val18;
    unsigned long phi19;
    unsigned long phi20;
    unsigned long val21;
    unsigned long val22;
    double *val23;
    unsigned long val24;
    unsigned long phi25;
    double *val26;
    unsigned long phi27;
    unsigned long val28;
    unsigned long val29;
    unsigned long phi30;
    unsigned long phi31;
    unsigned long val32;
    unsigned long val33;
    unsigned long phi34;
    unsigned long phi35;
    double *val36;
    double val37;
    double phi38;
    unsigned long phi39;
    double val40;
    double val41;
    double call42;
    unsigned long val43;
    unsigned long val44;
    unsigned long val45;
    unsigned long phi46;
    unsigned long phi47;
    struct struct__IO_FILE *val48;
    double val49;
    unsigned int call50;
    struct struct__IO_FILE *val51;
    unsigned int call52;
    unsigned long val53;
    unsigned long val54;
    struct struct__IO_FILE *val55;
    unsigned int call56;
    val0 = arg1[1UL];
    call1 = strtol(val0, (void *)0U, 10U);
    val2 = arg1[2UL];
    call3 = strtol(val2, (void *)0U, 10U);
    val4 = call3;
    val5 = arg1[3UL];
    call6 = strtol(val5, (void *)0U, 10U);
    val7 = call6;
    val8 = arg1[4UL];
    call9 = strtol(val8, (void *)0U, 10U);
    val10 = call9;
    val11 = call3 << 3UL;
    call12 = malloc(call6 * val11 & 34359738360UL);
    val13 = (double *)call12;
    call14 = malloc(call9 * val11 & 34359738360UL);
    call15 = malloc((call6 << 3UL) * call9 & 34359738360UL);
    val16 = call6 & 4294967295UL;
    val17 = val4;
    val18 = call3 & 4294967295UL;
    phi19 = 0UL;
    do {
        phi20 = 0UL;
        do {
            (&val13[phi19 * val16])[phi20] = (double)(unsigned int)phi19 * (double)(unsigned int)phi20 / val17;
            val21 = phi20 + 1UL;
            phi20 = val21;
        } while (val21 != val16);
        val22 = phi19 + 1UL;
        phi19 = val22;
    } while (val22 != val18);
    if (val21 == val16) {
        val23 = (double *)call14;
        val24 = call9 & 4294967295UL;
        phi25 = 0UL;
        do {
            phi27 = 0UL;
            do {
                (&val23[phi25 * val24])[phi27] = (double)(unsigned int)phi25 * (double)(unsigned int)phi27 / val17;
                val28 = phi27 + 1UL;
                phi27 = val28;
            } while (val28 != val24);
            val29 = phi25 + 1UL;
            phi25 = val29;
        } while (val29 != val18);
        if (val28 == val24) {
            val26 = (double *)call15;
            phi30 = 0UL;
            do {
                phi31 = 0UL;
                do {
                    (&val26[phi30 * val16])[phi31] = (double)(unsigned int)phi30 * (double)(unsigned int)phi31 / val17;
                    val32 = phi31 + 1UL;
                    phi31 = val32;
                } while (val32 != val16);
                val33 = phi30 + 1UL;
                phi30 = val33;
            } while (val33 != val24);
            if (val32 == val16) {
                phi34 = 0UL;
                while (1U)
                    {
                        phi35 = 0UL;
                        do {
                            val36 = &(&val13[phi34 * val16])[phi35];
                            val37 = *val36;
                            phi39 = 0UL;
                            phi38 = val37 * 2123.;
                            do {
                                val40 = (&val23[phi34 * val24])[phi39];
                                val41 = (&val26[phi35])[phi39 * val16];
                                call42 = llvm_fmuladd_f64(val40 * 32412., val41, phi38);
                                val43 = phi39 + 1UL;
                                phi39 = val43;
                                phi38 = call42;
                            } while (val43 != val24);
                            *val36 = call42;
                            val44 = phi35 + 1UL;
                            phi35 = val44;
                        } while (val44 != val16);
                        if (val43 == val24) {
                            val45 = phi34 + 1UL;
                            phi34 = val45;
                            if (val45 == val18) {
                                break;
                            }
                        }
                    }
                if (val43 == val24 && val44 == val16 && val45 == val18) {
                    if ((unsigned int)call1 == 1U) {
                        phi46 = 0UL;
                        while (1U)
                            {
                                phi47 = 0UL;
                                while (1U)
                                    {
                                        val48 = stderr;
                                        val49 = (&val13[phi46 * val16])[phi47];
                                        call50 = fprintf(val48, "%0.2lf ", val49);
                                        if ((int)((unsigned int)phi46 * val4 + (unsigned int)phi47) % 20 == 0U) {
                                            val51 = stderr;
                                            call52 = fputc(10U, val51);
                                        }
                                        if (val45 == val18 && val44 == val16 && val43 == val24) {
                                            val53 = phi47 + 1UL;
                                            phi47 = val53;
                                            if (val53 == val16) {
                                                break;
                                            }
                                        }
                                    }
                                if (val45 == val18 && val44 == val16 && val43 == val24 && val53 == val16) {
                                    val54 = phi46 + 1UL;
                                    phi46 = val54;
                                    if (val54 == val18) {
                                        break;
                                    }
                                }
                            }
                        if (val45 == val18 && val44 == val16 && val43 == val24 && val53 == val16 && val54 == val18) {
                            val55 = stderr;
                            call56 = fputc(10U, val55);
                        }
                    }
                    if (!(val45 != val18 || val44 != val16 || val43 != val24 || (unsigned int)call1 == 1U) || !(val54 != val18 || val53 != val16 || (unsigned int)call1 != 1U || val45 != val18 || val44 != val16 || val43 != val24)) {
                        free(call12);
                        free(call14);
                        free(call15);
                        return 0U;
                    }
                }
            }
        }
    }
}
