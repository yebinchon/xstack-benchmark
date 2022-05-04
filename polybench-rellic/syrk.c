unsigned int main(unsigned int argc, unsigned char **argv) {
    unsigned char *val0;
    unsigned long call1;
    unsigned char *val2;
    unsigned long call3;
    unsigned int val4;
    unsigned char *val5;
    unsigned long call6;
    unsigned char *call7;
    double *val8;
    unsigned char *call9;
    double *val10;
    unsigned long val11;
    unsigned long val12;
    unsigned char val13;
    unsigned char val14;
    double val15;
    unsigned long phi16;
    unsigned long phi17;
    unsigned long val18;
    unsigned long val19;
    unsigned long phi20;
    unsigned long phi21;
    unsigned long val22;
    unsigned long val23;
    unsigned long phi24;
    unsigned long phi25;
    double *val26;
    double val27;
    unsigned long val28;
    unsigned long val29;
    unsigned long phi30;
    unsigned long phi31;
    double *val32;
    double val33;
    double phi34;
    unsigned long phi35;
    double val36;
    double val37;
    double val38;
    unsigned long val39;
    unsigned long val40;
    unsigned long val41;
    unsigned long phi42;
    unsigned long phi43;
    struct struct__IO_FILE *val44;
    double val45;
    unsigned int call46;
    struct struct__IO_FILE *val47;
    unsigned int call48;
    unsigned long val49;
    unsigned long val50;
    struct struct__IO_FILE *val51;
    unsigned int call52;
    val0 = argv[1UL];
    call1 = strtol(val0, (void *)0U, 10U);
    val2 = argv[2UL];
    call3 = strtol(val2, (void *)0U, 10U);
    val4 = call3;
    val5 = argv[3UL];
    call6 = strtol(val5, (void *)0U, 10U);
    call7 = malloc((call3 << 3UL) * call3 & 34359738360UL);
    val8 = (double *)call7;
    call9 = malloc((long)((call3 << 32UL) * call6) >> 29UL);
    val10 = (double *)call9;
    val11 = call3 & 4294967295UL;
    val12 = call6 & 4294967295UL;
    val13 = (int)val4 > 0;
    if (val13) {
        val14 = (int)call6 > 0;
        val15 = val4;
        phi16 = 0UL;
        do {
            if (val13) {
                if (val14) {
                    phi17 = 0UL;
                    do {
                        if (val13 && val14) {
                            (&val10[phi16 * val12])[phi17] = (double)(unsigned int)phi16 * (double)(unsigned int)phi17 / val15;
                            val18 = phi17 + 1UL;
                            phi17 = val18;
                        }
                    } while (!(val13 && val14 && val18 == val12));
                }
            }
            if (!(!val13 || !val14 || val18 != val12) || !(!val13 || val14)) {
                val19 = phi16 + 1UL;
                phi16 = val19;
            }
        } while (!((!(val14 || !val13) || !(!val13 || !val14 || val18 != val12)) && val19 == val11));
    }
    if ((!(!val13 || !val14 || val18 != val12) || !(!val13 || val14)) && val19 == val11) {
        phi20 = 0UL;
        do {
            if ((!(!val13 || !val14 || val18 != val12) || !(!val13 || val14)) && val19 == val11) {
                phi21 = 0UL;
                if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11) {
                    do {
                        if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11) {
                            (&val8[phi20 * val11])[phi21] = (double)(unsigned int)phi20 * (double)(unsigned int)phi21 / val15;
                            val22 = phi21 + 1UL;
                            phi21 = val22;
                        }
                    } while (!((!(val14 || !val13) || !(!val13 || !val14 || val18 != val12)) && val19 == val11 && val22 == val11));
                }
            }
            if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11 && val22 == val11) {
                val23 = phi20 + 1UL;
                phi20 = val23;
            }
        } while (!((!(val14 || !val13) || !(!val13 || !val14 || val18 != val12)) && val19 == val11 && val22 == val11 && val23 == val11));
    }
    if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11 && val22 == val11 && val23 == val11) {
        phi24 = 0UL;
        do {
            if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11 && val22 == val11 && val23 == val11) {
                phi25 = 0UL;
                do {
                    if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11 && val22 == val11 && val23 == val11) {
                        val26 = &(&val8[phi24 * val11])[phi25];
                        val27 = *val26;
                        *val26 = val27 * 2123.;
                        val28 = phi25 + 1UL;
                        phi25 = val28;
                    }
                } while (!((!(val14 || !val13) || !(!val13 || !val14 || val18 != val12)) && val19 == val11 && val22 == val11 && val23 == val11 && val28 == val11));
            }
            if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11 && val22 == val11 && val23 == val11 && val28 == val11) {
                val29 = phi24 + 1UL;
                phi24 = val29;
            }
        } while (!((!(val14 || !val13) || !(!val13 || !val14 || val18 != val12)) && val19 == val11 && val22 == val11 && val23 == val11 && val28 == val11 && val29 == val11));
    }
    if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11 && val22 == val11 && val23 == val11 && val28 == val11 && val29 == val11) {
        phi30 = 0UL;
        do {
            if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11 && val22 == val11 && val23 == val11 && val28 == val11 && val29 == val11) {
                phi31 = 0UL;
                do {
                    if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11 && val22 == val11 && val23 == val11 && val28 == val11 && val29 == val11) {
                        if (val14) {
                            val32 = &(&val8[phi30 * val11])[phi31];
                            val33 = *val32;
                            phi35 = 0UL;
                            phi34 = val33;
                            do {
                                if ((!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) && val19 == val11 && val22 == val11 && val23 == val11 && val28 == val11 && val29 == val11 && val14) {
                                    val36 = (&val10[phi30 * val12])[phi35];
                                    val37 = (&val10[phi31 * val12])[phi35];
                                    val38 = phi34 + val36 * 32412. * val37;
                                    val39 = phi35 + 1UL;
                                    phi35 = val39;
                                    phi34 = val38;
                                }
                            } while (!((!(val14 || !val13) || !(!val13 || !val14 || val18 != val12)) && val19 == val11 && val22 == val11 && val23 == val11 && val28 == val11 && val29 == val11 && val14 && val39 == val12));
                        }
                        if (val14 && val39 == val12) {
                            *val32 = val38;
                        }
                    }
                    if (!(val14 || val29 != val11 || val28 != val11 || val23 != val11 || val19 != val11 || val22 != val11 || !(!(val14 || !val13) || !(val18 != val12 || !val14 || !val13))) || !(!(!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) || val39 != val12 || !val14 || val29 != val11 || val28 != val11 || val23 != val11 || val19 != val11 || val22 != val11)) {
                        val40 = phi31 + 1UL;
                        phi31 = val40;
                    }
                } while (!((!(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val14 || val28 != val11 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12))) || !(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val28 != val11 || val39 != val12 || !val14 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12)))) && val40 == val11));
            }
            if ((!(val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11 || val28 != val11 || !(!(val14 || !val13) || !(val18 != val12 || !val14 || !val13))) || !(!(!(val14 || !val13) || !(val18 != val12 || !val14 || !val13)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) && val40 == val11) {
                val41 = phi30 + 1UL;
                phi30 = val41;
            }
        } while (!((!(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val14 || val28 != val11 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12))) || !(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val28 != val11 || val39 != val12 || !val14 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12)))) && val40 == val11 && val41 == val11));
    }
    if (!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)) {
        if ((unsigned int)call1 == 1U) {
            if ((!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)) && val13) {
                phi42 = 0UL;
                if ((!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)) && (unsigned int)call1 == 1U && val13) {
                    do {
                        if ((!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)) && (unsigned int)call1 == 1U && val13) {
                            phi43 = 0UL;
                            do {
                                if ((!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)) && (unsigned int)call1 == 1U && val13) {
                                    val44 = stderr;
                                    val45 = (&val8[phi42 * val11])[phi43];
                                    call46 = fprintf(val44, _str, val45);
                                    if ((int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 == 0U) {
                                        val47 = stderr;
                                        call48 = fputc(10U, val47);
                                    }
                                    if (!((int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 != 0U || (unsigned int)call1 != 1U || !val13 || !(!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11))) || !(!(!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)) || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 == 0U || (unsigned int)call1 != 1U || !val13)) {
                                        val49 = phi43 + 1UL;
                                        phi43 = val49;
                                    }
                                }
                            } while (!((!((unsigned int)call1 != 1U || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 != 0U || !val13 || !(!val13 || !(val40 != val11 || val41 != val11 || !(!(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val14 || val28 != val11 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12))) || !(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val28 != val11 || val39 != val12 || !val14 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12))))))) || !((unsigned int)call1 != 1U || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 == 0U || !val13 || !(!val13 || !(val40 != val11 || val41 != val11 || !(!(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val14 || val28 != val11 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12))) || !(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val28 != val11 || val39 != val12 || !val14 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12)))))))) && val49 == val11));
                        }
                        if ((!(!(!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)) || !val13 || (unsigned int)call1 != 1U || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 != 0U) || !((unsigned int)call1 != 1U || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 == 0U || !val13 || !(!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)))) && val49 == val11) {
                            val50 = phi42 + 1UL;
                            phi42 = val50;
                        }
                    } while (!((!((unsigned int)call1 != 1U || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 == 0U || !val13 || !(!val13 || !(val40 != val11 || val41 != val11 || !(!(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val14 || val28 != val11 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12))) || !(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val28 != val11 || val39 != val12 || !val14 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12))))))) || !((unsigned int)call1 != 1U || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 != 0U || !val13 || !(!val13 || !(val40 != val11 || val41 != val11 || !(!(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val14 || val28 != val11 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12))) || !(val19 != val11 || val29 != val11 || val22 != val11 || val23 != val11 || val28 != val11 || val39 != val12 || !val14 || !(!(val14 || !val13) || !(!val13 || !val14 || val18 != val12)))))))) && val49 == val11 && val50 == val11));
                }
            }
        }
        if (!((unsigned int)call1 != 1U || val13) || !(val50 != val11 || val49 != val11 || !(!(!val13 || (unsigned int)call1 != 1U || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 != 0U) || !((unsigned int)call1 != 1U || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 == 0U || !val13)))) {
            val51 = stderr;
            call52 = fputc(10U, val51);
        }
    }
    if (!((unsigned int)call1 == 1U || !(!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11))) || !(!(!(!(!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)) || !val13 || (unsigned int)call1 != 1U || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 != 0U) || !(!(!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)) || !val13 || (unsigned int)call1 != 1U || (int)((unsigned int)phi42 * val4 + (unsigned int)phi43) % 20 == 0U)) || val50 != val11 || val49 != val11) || !(!(!val13 || !(!(!(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val28 != val11 || val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11) || !(!(!(!val13 || val14) || !(val18 != val12 || !val13 || !val14)) || val39 != val12 || val28 != val11 || !val14 || val23 != val11 || val22 != val11 || val19 != val11 || val29 != val11)) || val40 != val11 || val41 != val11)) || (unsigned int)call1 != 1U || val13)) {
        free(call7);
        free(call9);
        return 0U;
    }
}
