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
    unsigned char *val13;
    unsigned long call14;
    unsigned int val15;
    unsigned char *val16;
    unsigned long call17;
    unsigned int val18;
    unsigned long val19;
    unsigned char *call20;
    double *val21;
    unsigned char *call22;
    double *val23;
    unsigned long val24;
    unsigned char *call25;
    double *val26;
    unsigned char *call27;
    double *val28;
    unsigned char *call29;
    double *val30;
    unsigned long val31;
    double val32;
    unsigned long val33;
    unsigned long val34;
    unsigned long phi35;
    unsigned long val36;
    unsigned long phi37;
    unsigned long val38;
    unsigned long val39;
    unsigned long phi40;
    unsigned long phi41;
    unsigned long val42;
    unsigned long val43;
    unsigned long phi44;
    unsigned long phi45;
    unsigned long val46;
    unsigned long val47;
    unsigned long phi48;
    unsigned long phi49;
    unsigned long val50;
    unsigned long val51;
    unsigned long phi52;
    unsigned long phi53;
    unsigned long phi54;
    double phi55;
    unsigned long phi56;
    double val57;
    double val58;
    double call59;
    unsigned long val60;
    unsigned long val61;
    unsigned long val62;
    unsigned long phi63;
    unsigned long phi64;
    double *val65;
    double val66;
    double phi67;
    unsigned long phi68;
    double val69;
    double val70;
    double call71;
    unsigned long val72;
    unsigned long val73;
    unsigned long val74;
    unsigned long phi75;
    unsigned long phi76;
    struct struct__IO_FILE *val77;
    double val78;
    unsigned int call79;
    struct struct__IO_FILE *val80;
    unsigned int call81;
    unsigned long val82;
    unsigned long val83;
    struct struct__IO_FILE *val84;
    unsigned int call85;
    val5 = arg1[1UL];
    call6 = strtol(val5, (void *)0U, 10U);
    val7 = arg1[2UL];
    call8 = strtol(val7, (void *)0U, 10U);
    val9 = call8;
    val10 = arg1[3UL];
    call11 = strtol(val10, (void *)0U, 10U);
    val12 = call11;
    val13 = arg1[4UL];
    call14 = strtol(val13, (void *)0U, 10U);
    val15 = call14;
    val16 = arg1[5UL];
    call17 = strtol(val16, (void *)0U, 10U);
    val18 = call17;
    val19 = call8 << 32UL;
    call20 = malloc((long)(call11 * val19) >> 29UL);
    val21 = (double *)call20;
    call22 = malloc((long)(call14 * val19) >> 29UL);
    val23 = (double *)call22;
    val24 = call11 << 32UL;
    call25 = malloc((long)(call14 * val24) >> 29UL);
    val26 = (double *)call25;
    call27 = malloc((long)(call17 * val24) >> 29UL);
    val28 = (double *)call27;
    call29 = malloc((call8 << 3UL) * call17 & 34359738360UL);
    val30 = (double *)call29;
    val31 = call17 & 4294967295UL;
    val32 = val9;
    val33 = call8 & 4294967295UL;
    val34 = call14 & 4294967295UL;
    if ((long)call17 >= (long)call14) {
        var4 = val32;
        phi52 = call11 & 4294967295UL;
    } else {
        phi35 = 0UL;
        do {
            phi37 = 0UL;
            do {
                (&val23[phi35 * val31])[phi37] = (double)(unsigned int)phi35 * (double)(unsigned int)phi37 / val32;
                val38 = phi37 + 1UL;
                phi37 = val38;
            } while (val38 != val34);
            val39 = phi35 + 1UL;
            phi35 = val39;
        } while (val39 != val33);
        if (val38 == val34) {
            val36 = call11 & 4294967295UL;
            phi40 = 0UL;
            do {
                phi41 = 0UL;
                do {
                    val42 = phi41 + 1UL;
                    (&val26[phi40 * val36])[phi41] = (double)(unsigned int)phi40 * (double)(unsigned int)val42 / (double)val12;
                    phi41 = val42;
                } while (val42 != val36);
                val43 = phi40 + 1UL;
                phi40 = val43;
            } while (val43 != val34);
            if (val42 == val36) {
                phi44 = 0UL;
                do {
                    phi45 = 0UL;
                    do {
                        (&val28[phi44 * val36])[phi45] = (double)(unsigned int)phi44 * (double)((unsigned int)phi45 + 3U) / (double)val18;
                        val46 = phi45 + 1UL;
                        phi45 = val46;
                    } while (val46 != val36);
                    val47 = phi44 + 1UL;
                    phi44 = val47;
                } while (val47 != val31);
                if (val46 == val36) {
                    phi48 = 0UL;
                    do {
                        phi49 = 0UL;
                        do {
                            (&val30[phi48 * val31])[phi49] = (double)(unsigned int)phi48 * (double)((unsigned int)phi49 + 2U) / (double)val15;
                            val50 = phi49 + 1UL;
                            phi49 = val50;
                        } while (val50 != val31);
                        val51 = phi48 + 1UL;
                        phi48 = val51;
                    } while (val51 != val33);
                    if (val50 == val31) {
                        phi52 = val36;
                    }
                }
            }
        }
    }
    if ((long)call17 >= (long)call14 || !(val51 != val33 || val50 != val31 || val47 != val31 || val46 != val36 || val43 != val34 || val42 != val36 || val39 != val33 || (long)call17 >= (long)call14 || val38 != val34)) {
        phi53 = 0UL;
        if ((long)call17 >= (long)call14 || !(val46 != val36 || val51 != val33 || val50 != val31 || val42 != val36 || val47 != val31 || val43 != val34 || val38 != val34 || (long)call17 >= (long)call14 || val39 != val33)) {
            while (1U)
                {
                    phi54 = 0UL;
                    while (1U)
                        {
                            phi56 = 0UL;
                            phi55 = 0.;
                            do {
                                val57 = (&val23[phi53 * val34])[phi56];
                                val58 = (&val26[phi54])[phi56 * phi52];
                                call59 = llvm_fmuladd_f64(val57 * 32412., val58, phi55);
                                val60 = phi56 + 1UL;
                                phi56 = val60;
                                phi55 = call59;
                            } while (!(((long)call17 >= (long)call14 || !((long)call17 >= (long)call14 || val39 != val33 || val38 != val34 || val43 != val34 || val47 != val31 || val42 != val36 || val50 != val31 || val51 != val33 || val46 != val36)) && val60 == val34));
                            if (val60 == val34) {
                                (&val21[phi53 * phi52])[phi54] = call59;
                                val61 = phi54 + 1UL;
                                phi54 = val61;
                                if (val61 == phi52) {
                                    break;
                                }
                            }
                        }
                    if (val60 == val34 && val61 == phi52) {
                        val62 = phi53 + 1UL;
                        phi53 = val62;
                        if (((long)call17 >= (long)call14 || !((long)call17 >= (long)call14 || val39 != val33 || val38 != val34 || val43 != val34 || val47 != val31 || val42 != val36 || val50 != val31 || val51 != val33 || val46 != val36)) && val60 == val34 && val61 == phi52 && val62 == val33) {
                            break;
                        }
                    }
                }
            if (val60 == val34 && val61 == phi52 && val62 == val33) {
                phi63 = 0UL;
                while (1U)
                    {
                        phi64 = 0UL;
                        while (1U)
                            {
                                val65 = &(&val30[phi63 * val31])[phi64];
                                val66 = *val65;
                                phi68 = 0UL;
                                phi67 = val66 * 2123.;
                                do {
                                    val69 = (&val21[phi63 * phi52])[phi68];
                                    val70 = (&val28[phi64])[phi68 * phi52];
                                    call71 = llvm_fmuladd_f64(val69, val70, phi67);
                                    val72 = phi68 + 1UL;
                                    phi68 = val72;
                                    phi67 = call71;
                                } while (!(((long)call17 >= (long)call14 || !((long)call17 >= (long)call14 || val39 != val33 || val38 != val34 || val43 != val34 || val47 != val31 || val42 != val36 || val50 != val31 || val51 != val33 || val46 != val36)) && val60 == val34 && val61 == phi52 && val62 == val33 && val72 == phi52));
                                if (val72 == phi52) {
                                    *val65 = call71;
                                    val73 = phi64 + 1UL;
                                    phi64 = val73;
                                    if (((long)call17 >= (long)call14 || !((long)call17 >= (long)call14 || val39 != val33 || val38 != val34 || val43 != val34 || val47 != val31 || val42 != val36 || val50 != val31 || val51 != val33 || val46 != val36)) && val60 == val34 && val61 == phi52 && val62 == val33 && val73 == val31) {
                                        break;
                                    }
                                }
                            }
                        if (val72 == phi52 && val73 == val31) {
                            val74 = phi63 + 1UL;
                            phi63 = val74;
                            if (((long)call17 >= (long)call14 || !((long)call17 >= (long)call14 || val39 != val33 || val38 != val34 || val43 != val34 || val47 != val31 || val42 != val36 || val50 != val31 || val51 != val33 || val46 != val36)) && val60 == val34 && val61 == phi52 && val62 == val33 && val72 == phi52 && val73 == val31 && val74 == val33) {
                                break;
                            }
                        }
                    }
                if (val72 == phi52 && val73 == val31 && val74 == val33) {
                    if ((unsigned int)call6 == 1U) {
                        phi75 = 0UL;
                        while (1U)
                            {
                                phi76 = 0UL;
                                while (1U)
                                    {
                                        val77 = stderr;
                                        val78 = (&val30[phi75 * val31])[phi76];
                                        call79 = fprintf(val77, "%0.2lf ", val78);
                                        if ((int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 == 0U) {
                                            val80 = stderr;
                                            call81 = fputc(10U, val80);
                                        }
                                        if (!((int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 == 0U || val74 != val33 || val73 != val31 || val72 != phi52 || val62 != val33 || val60 != val34 || val61 != phi52) || !((int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 != 0U || val74 != val33 || val73 != val31 || val72 != phi52 || val62 != val33 || val60 != val34 || val61 != phi52)) {
                                            val82 = phi76 + 1UL;
                                            phi76 = val82;
                                            if ((!(val73 != val31 || val62 != val33 || val74 != val33 || val61 != phi52 || val60 != val34 || val72 != phi52 || (int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 == 0U || !((long)call17 >= (long)call14 || !((long)call17 >= (long)call14 || val39 != val33 || val38 != val34 || val43 != val34 || val47 != val31 || val42 != val36 || val50 != val31 || val51 != val33 || val46 != val36))) || !(val73 != val31 || (int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 != 0U || val62 != val33 || val74 != val33 || val61 != phi52 || val60 != val34 || val72 != phi52 || !((long)call17 >= (long)call14 || !((long)call17 >= (long)call14 || val39 != val33 || val38 != val34 || val43 != val34 || val47 != val31 || val42 != val36 || val50 != val31 || val51 != val33 || val46 != val36)))) && val82 == val31) {
                                                break;
                                            }
                                        }
                                    }
                                if ((!(val72 != phi52 || val60 != val34 || val61 != phi52 || val74 != val33 || val62 != val33 || val73 != val31 || (int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 != 0U) || !(val72 != phi52 || val60 != val34 || val61 != phi52 || val74 != val33 || val62 != val33 || val73 != val31 || (int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 == 0U)) && val82 == val31) {
                                    val83 = phi75 + 1UL;
                                    phi75 = val83;
                                    if ((!(val73 != val31 || (int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 != 0U || val62 != val33 || val74 != val33 || val61 != phi52 || val60 != val34 || val72 != phi52 || !((long)call17 >= (long)call14 || !((long)call17 >= (long)call14 || val39 != val33 || val38 != val34 || val43 != val34 || val47 != val31 || val42 != val36 || val50 != val31 || val51 != val33 || val46 != val36))) || !(val73 != val31 || val62 != val33 || val74 != val33 || val61 != phi52 || val60 != val34 || val72 != phi52 || (int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 == 0U || !((long)call17 >= (long)call14 || !((long)call17 >= (long)call14 || val39 != val33 || val38 != val34 || val43 != val34 || val47 != val31 || val42 != val36 || val50 != val31 || val51 != val33 || val46 != val36)))) && val82 == val31 && val83 == val33) {
                                        break;
                                    }
                                }
                            }
                        if ((!((int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 == 0U || val72 != phi52 || val60 != val34 || val61 != phi52 || val74 != val33 || val73 != val31 || val62 != val33) || !((int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 != 0U || val72 != phi52 || val60 != val34 || val61 != phi52 || val74 != val33 || val73 != val31 || val62 != val33)) && val82 == val31 && val83 == val33) {
                            val84 = stderr;
                            call85 = fputc(10U, val84);
                        }
                    }
                    if (!(!(!((int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 == 0U || val72 != phi52 || val60 != val34 || val61 != phi52 || val74 != val33 || val73 != val31 || val62 != val33 || (unsigned int)call6 != 1U) || !((unsigned int)call6 != 1U || (int)((unsigned int)phi75 * val9 + (unsigned int)phi76) % 20 != 0U || val72 != phi52 || val60 != val34 || val61 != phi52 || val74 != val33 || val73 != val31 || val62 != val33)) || val82 != val31 || val83 != val33) || !((unsigned int)call6 == 1U || val72 != phi52 || val60 != val34 || val61 != phi52 || val74 != val33 || val73 != val31 || val62 != val33)) {
                        free(call20);
                        free(call22);
                        free(call25);
                        free(call27);
                        free(call29);
                        return 0U;
                    }
                }
            }
        }
    }
}
