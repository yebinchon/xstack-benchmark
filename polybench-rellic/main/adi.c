unsigned int main(unsigned int arg0, unsigned char **arg1) {
    unsigned char *val2;
    unsigned long call3;
    unsigned char *call4;
    unsigned char *call5;
    unsigned char *call6;
    unsigned long phi7;
    unsigned long val8;
    unsigned long phi9;
    struct struct__IO_FILE *val10;
    double val11;
    unsigned int call12;
    struct struct__IO_FILE *val13;
    unsigned int call14;
    unsigned long val15;
    unsigned long val16;
    struct struct__IO_FILE *val17;
    unsigned int call18;
    unsigned long val19;
    unsigned long val20;
    unsigned long phi21;
    double phi22;
    double phi23;
    unsigned long phi24;
    unsigned long val25;
    double *val26;
    double val27;
    double val28;
    double val29;
    double *val30;
    double val31;
    double val32;
    unsigned long val33;
    unsigned long phi34;
    unsigned long val35;
    double val36;
    double val37;
    unsigned long phi38;
    unsigned long val39;
    double *val40;
    double val41;
    double val42;
    unsigned long val43;
    unsigned long val44;
    unsigned long phi45;
    unsigned long val46;
    double *val47;
    double val48;
    double val49;
    double val50;
    double val51;
    double *val52;
    double val53;
    unsigned long val54;
    unsigned long phi55;
    unsigned long val56;
    unsigned long phi57;
    unsigned long val58;
    double *val59;
    double val60;
    double val61;
    unsigned long val62;
    unsigned long val63;
    unsigned long phi64;
    unsigned long val65;
    double *val66;
    double val67;
    double val68;
    double val69;
    double call70;
    double val71;
    unsigned long val72;
    unsigned long phi73;
    unsigned long val74;
    val2 = arg1[1UL];
    call3 = strtol(val2, (void *)0U, 10U);
    call4 = malloc(33554432UL);
    call5 = malloc(33554432UL);
    call6 = malloc(33554432UL);
    phi21 = 0UL;
    while (1U)
        {
            phi34 = 0UL;
            do {
                val35 = phi34 << 14UL;
                val36 = *(double *)(&call6[val35]);
                val37 = *(double *)(&call4[val35]);
                phi24 = 0UL;
                phi23 = val36;
                phi22 = val37;
                do {
                    val25 = phi24 << 3UL;
                    val26 = (double *)(&(&(&call4[8UL])[val35])[val25]);
                    val27 = *val26;
                    val28 = *(double *)(&(&(&call5[8UL])[val35])[val25]);
                    val29 = val27 - phi22 * val28 / phi23;
                    *val26 = val29;
                    val30 = (double *)(&(&(&call6[8UL])[val35])[val25]);
                    val31 = *val30;
                    val32 = val31 - val28 * val28 / phi23;
                    *val30 = val32;
                    val33 = phi24 + 1UL;
                    phi24 = val33;
                    phi23 = val32;
                    phi22 = val29;
                } while (val33 != 2047UL);
                val20 = phi34 + 1UL;
                phi34 = val20;
            } while (val20 != 2048UL);
            if (val33 == 2047UL) {
                phi38 = 0UL;
                do {
                    val39 = phi38 << 14UL;
                    val40 = (double *)(&(&call4[16376UL])[val39]);
                    val41 = *val40;
                    val42 = *(double *)(&(&call6[16376UL])[val39]);
                    *val40 = val41 / val42;
                    val43 = phi38 + 1UL;
                    phi38 = val43;
                } while (val43 != 2048UL);
                phi55 = 0UL;
                do {
                    val56 = phi55 << 14UL;
                    phi45 = 0UL;
                    do {
                        val46 = phi45 << 3UL;
                        val47 = (double *)(&(&(&call4[16384UL])[val56])[val46]);
                        val48 = *val47;
                        val49 = *(double *)(&(&call4[val56])[val46]);
                        val50 = *(double *)(&(&(&call5[16384UL])[val56])[val46]);
                        val51 = *(double *)(&(&call6[val56])[val46]);
                        *val47 = val48 - val49 * val50 / val51;
                        val52 = (double *)(&(&(&call6[16384UL])[val56])[val46]);
                        val53 = *val52;
                        *val52 = val53 - val50 * val50 / val51;
                        val54 = phi45 + 1UL;
                        phi45 = val54;
                    } while (val54 != 2048UL);
                    val44 = phi55 + 1UL;
                    phi55 = val44;
                } while (val44 != 2047UL);
                if (val54 == 2048UL) {
                    phi57 = 0UL;
                    do {
                        val58 = phi57 << 3UL;
                        val59 = (double *)(&(&call4[33538048UL])[val58]);
                        val60 = *val59;
                        val61 = *(double *)(&(&call6[33538048UL])[val58]);
                        *val59 = val60 / val61;
                        val62 = phi57 + 1UL;
                        phi57 = val62;
                    } while (val62 != 2048UL);
                    phi73 = 0UL;
                    do {
                        val74 = phi73 * 18446744073709535232UL;
                        phi64 = 0UL;
                        do {
                            val65 = phi64 << 3UL;
                            val66 = (double *)(&(&(&call4[33521664UL])[val74])[val65]);
                            val67 = *val66;
                            val68 = *(double *)(&(&(&call4[33505280UL])[val74])[val65]);
                            val69 = *(double *)(&(&(&call5[33505280UL])[val74])[val65]);
                            call70 = llvm_fmuladd_f64(-val68, val69, val67);
                            val71 = *(double *)(&(&(&call6[33521664UL])[val74])[val65]);
                            *val66 = call70 / val71;
                            val72 = phi64 + 1UL;
                            phi64 = val72;
                        } while (val72 != 2048UL);
                        val63 = phi73 + 1UL;
                        phi73 = val63;
                    } while (val63 != 2046UL);
                    if (val72 == 2048UL) {
                        val19 = phi21 + 1UL;
                        phi21 = val19;
                        if (val19 == 50UL) {
                            break;
                        }
                    }
                }
            }
        }
    if (val33 == 2047UL && val20 == 2048UL && val43 == 2048UL && val54 == 2048UL && val44 == 2047UL && val62 == 2048UL && val72 == 2048UL && val63 == 2046UL && val19 == 50UL) {
        if ((unsigned int)call3 == 1U) {
            phi7 = 0UL;
            while (1U)
                {
                    val8 = phi7 << 11UL;
                    phi9 = 0UL;
                    while (1U)
                        {
                            val10 = stderr;
                            val11 = (&((double *)call4)[val8])[phi9];
                            call12 = fprintf(val10, "%0.2lf ", val11);
                            if ((unsigned int)(phi9 + val8) % 20U == 0U) {
                                val13 = stderr;
                                call14 = fputc(10U, val13);
                            }
                            if (val19 == 50UL && val63 == 2046UL && val72 == 2048UL && val62 == 2048UL && val44 == 2047UL && val54 == 2048UL && val43 == 2048UL && val33 == 2047UL && val20 == 2048UL) {
                                val15 = phi9 + 1UL;
                                phi9 = val15;
                                if (val15 == 2048UL) {
                                    break;
                                }
                            }
                        }
                    if (val19 == 50UL && val63 == 2046UL && val72 == 2048UL && val62 == 2048UL && val44 == 2047UL && val54 == 2048UL && val43 == 2048UL && val33 == 2047UL && val20 == 2048UL && val15 == 2048UL) {
                        val16 = phi7 + 1UL;
                        phi7 = val16;
                        if (val16 == 2048UL) {
                            break;
                        }
                    }
                }
            if (val19 == 50UL && val63 == 2046UL && val72 == 2048UL && val62 == 2048UL && val44 == 2047UL && val54 == 2048UL && val43 == 2048UL && val33 == 2047UL && val20 == 2048UL && val15 == 2048UL && val16 == 2048UL) {
                val17 = stderr;
                call18 = fputc(10U, val17);
            }
        }
        if (!(val20 != 2048UL || val33 != 2047UL || val43 != 2048UL || val54 != 2048UL || val44 != 2047UL || val62 != 2048UL || val72 != 2048UL || val63 != 2046UL || (unsigned int)call3 == 1U || val19 != 50UL) || !(val16 != 2048UL || val15 != 2048UL || val20 != 2048UL || val33 != 2047UL || val43 != 2048UL || val54 != 2048UL || val44 != 2047UL || val62 != 2048UL || val72 != 2048UL || val63 != 2046UL || (unsigned int)call3 != 1U || val19 != 50UL)) {
            free(call4);
            free(call5);
            free(call6);
            return 0U;
        }
    }
}
