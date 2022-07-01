unsigned int main(unsigned int arg0, unsigned char **arg1) {
    unsigned char *val2;
    unsigned long call3;
    unsigned char *call4;
    unsigned char *call5;
    unsigned char *call6;
    unsigned char *call7;
    unsigned long phi8;
    unsigned long val9;
    unsigned long phi10;
    struct struct__IO_FILE *val11;
    double val12;
    unsigned int call13;
    struct struct__IO_FILE *val14;
    double val15;
    unsigned int call16;
    struct struct__IO_FILE *val17;
    double val18;
    unsigned int call19;
    struct struct__IO_FILE *val20;
    unsigned int call21;
    unsigned long val22;
    unsigned long val23;
    struct struct__IO_FILE *val24;
    unsigned int call25;
    unsigned long phi26;
    unsigned long val27;
    unsigned long val28;
    unsigned char *val29;
    unsigned long phi30;
    unsigned long val31;
    unsigned long phi32;
    double val33;
    unsigned long val34;
    double phi35;
    unsigned long phi36;
    unsigned long val37;
    double *val38;
    double val39;
    double val40;
    double call41;
    unsigned long val42;
    unsigned long phi43;
    unsigned long val44;
    double val45;
    unsigned long val46;
    double phi47;
    unsigned long phi48;
    unsigned long val49;
    double *val50;
    double val51;
    double val52;
    double val53;
    double val54;
    double call55;
    unsigned long val56;
    unsigned long phi57;
    unsigned long val58;
    double val59;
    val2 = arg1[1UL];
    call3 = strtol(val2, (void *)0U, 10U);
    call4 = malloc(128000000UL);
    call5 = malloc(128000000UL);
    call6 = malloc(128000000UL);
    call7 = malloc(32000UL);
    phi26 = 0UL;
    do {
        *(double *)(&call7[phi26 << 3UL]) = (unsigned int)phi26;
        val27 = phi26 + 1UL;
        phi26 = val27;
    } while (val27 != 4000UL);
    val29 = &call4[8UL];
    phi32 = 0UL;
    while (1U)
        {
            val33 = *(double *)(&call7[phi32 << 3UL]);
            phi30 = 0UL;
            do {
                *(double *)(&call5[phi30 << 3UL]) = val33;
                val31 = phi30 + 1UL;
                phi30 = val31;
            } while (val31 != 4000UL);
            phi43 = 0UL;
            do {
                val44 = phi43 * 32000UL;
                val45 = *(double *)(&call6[val44]);
                phi36 = 0UL;
                phi35 = val45;
                do {
                    val37 = phi36 << 3UL;
                    val38 = (double *)(&(&val29[val44])[val37]);
                    val39 = *val38;
                    val40 = *(double *)(&(&(&call6[8UL])[val44])[val37]);
                    call41 = llvm_fmuladd_f64(val40 - phi35, -0.5, val39);
                    *val38 = call41;
                    val42 = phi36 + 1UL;
                    phi36 = val42;
                    phi35 = val40;
                } while (val42 != 3999UL);
                val34 = phi43 + 1UL;
                phi43 = val34;
            } while (val34 != 4000UL);
            if (val42 == 3999UL) {
                phi57 = 0UL;
                do {
                    val58 = phi57 * 32000UL;
                    val59 = *(double *)(&call4[val58]);
                    phi48 = 0UL;
                    phi47 = val59;
                    do {
                        val49 = phi48 << 3UL;
                        val50 = (double *)(&(&call6[val58])[val49]);
                        val51 = *val50;
                        val52 = *(double *)(&(&val29[val58])[val49]);
                        val53 = *(double *)(&(&(&call5[32000UL])[val58])[val49]);
                        val54 = *(double *)(&(&call5[val58])[val49]);
                        call55 = llvm_fmuladd_f64((val52 - phi47) + val53 - val54, -0.69999999999999996, val51);
                        *val50 = call55;
                        val56 = phi48 + 1UL;
                        phi48 = val56;
                        phi47 = val52;
                    } while (val56 != 3999UL);
                    val46 = phi57 + 1UL;
                    phi57 = val46;
                } while (val46 != 3999UL);
                if (val56 == 3999UL) {
                    val28 = phi32 + 1UL;
                    phi32 = val28;
                    if (val28 == 100UL) {
                        break;
                    }
                }
            }
        }
    if (val31 == 4000UL && val42 == 3999UL && val34 == 4000UL && val56 == 3999UL && val46 == 3999UL && val28 == 100UL) {
        if ((unsigned int)call3 == 1U) {
            phi8 = 0UL;
            while (1U)
                {
                    val9 = phi8 * 4000UL;
                    phi10 = 0UL;
                    while (1U)
                        {
                            val11 = stderr;
                            val12 = (&((double *)call4)[val9])[phi10];
                            call13 = fprintf(val11, "%0.2lf ", val12);
                            val14 = stderr;
                            val15 = (&((double *)call5)[val9])[phi10];
                            call16 = fprintf(val14, "%0.2lf ", val15);
                            val17 = stderr;
                            val18 = (&((double *)call6)[val9])[phi10];
                            call19 = fprintf(val17, "%0.2lf ", val18);
                            if ((unsigned int)(phi10 + val9) % 20U == 0U) {
                                val20 = stderr;
                                call21 = fputc(10U, val20);
                            }
                            if (val28 == 100UL && val46 == 3999UL && val56 == 3999UL && val34 == 4000UL && val42 == 3999UL && val31 == 4000UL) {
                                val22 = phi10 + 1UL;
                                phi10 = val22;
                                if (val22 == 4000UL) {
                                    break;
                                }
                            }
                        }
                    if (val28 == 100UL && val46 == 3999UL && val56 == 3999UL && val34 == 4000UL && val42 == 3999UL && val31 == 4000UL && val22 == 4000UL) {
                        val23 = phi8 + 1UL;
                        phi8 = val23;
                        if (val23 == 4000UL) {
                            break;
                        }
                    }
                }
            if (val28 == 100UL && val46 == 3999UL && val56 == 3999UL && val34 == 4000UL && val42 == 3999UL && val31 == 4000UL && val22 == 4000UL && val23 == 4000UL) {
                val24 = stderr;
                call25 = fputc(10U, val24);
            }
        }
        if (!(val28 != 100UL || (unsigned int)call3 == 1U || val46 != 3999UL || val56 != 3999UL || val34 != 4000UL || val42 != 3999UL || val31 != 4000UL) || !(val23 != 4000UL || val22 != 4000UL || (unsigned int)call3 != 1U || val28 != 100UL || val46 != 3999UL || val56 != 3999UL || val34 != 4000UL || val42 != 3999UL || val31 != 4000UL)) {
            free(call4);
            free(call5);
            free(call6);
            free(call7);
            return 0U;
        }
    }
}
