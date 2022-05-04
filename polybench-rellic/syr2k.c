unsigned int main(unsigned int argc, unsigned char **argv) {
    unsigned char *val0;
    unsigned long call1;
    unsigned int val2;
    unsigned char *val3;
    unsigned long call4;
    unsigned int val5;
    unsigned char *val6;
    unsigned long call7;
    unsigned char *call8;
    double *val9;
    unsigned long val10;
    unsigned char *call11;
    double *val12;
    unsigned char *call13;
    double *val14;
    unsigned long val15;
    unsigned long val16;
    double val17;
    unsigned char val18;
    unsigned char val19;
    unsigned long phi20;
    unsigned long phi21;
    double val22;
    unsigned long val23;
    unsigned long val24;
    unsigned long val25;
    unsigned long phi26;
    unsigned long phi27;
    unsigned long val28;
    unsigned long val29;
    unsigned long phi30;
    unsigned long phi31;
    double *val32;
    double val33;
    unsigned long val34;
    unsigned long val35;
    unsigned long phi36;
    unsigned long phi37;
    double *val38;
    double val39;
    double phi40;
    unsigned long phi41;
    unsigned long val42;
    double val43;
    unsigned long val44;
    double val45;
    double val46;
    double val47;
    double val48;
    unsigned long val49;
    unsigned long val50;
    unsigned long val51;
    unsigned long phi52;
    unsigned long phi53;
    struct struct__IO_FILE *val54;
    double val55;
    unsigned int call56;
    struct struct__IO_FILE *val57;
    unsigned int call58;
    unsigned long val59;
    unsigned long val60;
    struct struct__IO_FILE *val61;
    unsigned int call62;
    val0 = argv[1UL];
    call1 = strtol(val0, (void *)0U, 10U);
    val2 = call1;
    val3 = argv[2UL];
    call4 = strtol(val3, (void *)0U, 10U);
    val5 = call4;
    val6 = argv[3UL];
    call7 = strtol(val6, (void *)0U, 10U);
    call8 = malloc((call4 << 3UL) * call4 & 34359738360UL);
    val9 = (double *)call8;
    val10 = (long)((call4 << 32UL) * call7) >> 29UL;
    call11 = malloc(val10);
    val12 = (double *)call11;
    call13 = malloc(val10);
    val14 = (double *)call13;
    val15 = call4 & 4294967295UL;
    val16 = call7 & 4294967295UL;
    val17 = val5;
    val18 = (int)call7 > 0;
    val19 = (int)val5 > 0;
    if (val19) {
        phi20 = 0UL;
        do {
            if (val19) {
                if (val18) {
                    phi21 = 0UL;
                    do {
                        if (val19 && val18) {
                            val22 = (double)(unsigned int)phi20 * (double)(unsigned int)phi21 / val17;
                            val23 = phi21 + phi20 * val16;
                            val12[val23] = val22;
                            val14[val23] = val22;
                            val24 = phi21 + 1UL;
                            phi21 = val24;
                        }
                    } while (!(val19 && val18 && val24 == val16));
                }
            }
            if (!(!val19 || val18) || !(!val19 || !val18 || val24 != val16)) {
                val25 = phi20 + 1UL;
                phi20 = val25;
            }
        } while (!((!(!val19 || val18) || !(!val19 || !val18 || val24 != val16)) && val25 == val15));
    }
    if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15) {
        phi26 = 0UL;
        do {
            if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15) {
                phi27 = 0UL;
                do {
                    if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15) {
                        val9[phi27 + phi26 * val15] = (double)(unsigned int)phi26 * (double)(unsigned int)phi27 / val17;
                        val28 = phi27 + 1UL;
                        phi27 = val28;
                    }
                } while (!((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15));
            }
            if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15) {
                val29 = phi26 + 1UL;
                phi26 = val29;
            }
        } while (!((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15));
    }
    if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15) {
        phi30 = 0UL;
        do {
            if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15) {
                phi31 = 0UL;
                do {
                    if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15) {
                        val32 = &val9[phi31 + phi30 * val15];
                        val33 = *val32;
                        *val32 = val33 * 2123.;
                        val34 = phi31 + 1UL;
                        phi31 = val34;
                    }
                } while (!((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15 && val34 == val15));
            }
            if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15 && val34 == val15) {
                val35 = phi30 + 1UL;
                phi30 = val35;
            }
        } while (!((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15 && val34 == val15 && val35 == val15));
    }
    if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15 && val34 == val15 && val35 == val15) {
        phi36 = 0UL;
        do {
            if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15 && val34 == val15 && val35 == val15) {
                phi37 = 0UL;
                do {
                    if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15 && val34 == val15 && val35 == val15) {
                        val38 = &val9[phi37 + phi36 * val15];
                        if (val18) {
                            val39 = *val38;
                            phi41 = 0UL;
                            phi40 = val39;
                            do {
                                if ((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15 && val34 == val15 && val35 == val15 && val18) {
                                    val42 = phi41 + phi36 * val16;
                                    val43 = val12[val42];
                                    val44 = phi41 + phi37 * val16;
                                    val45 = val14[val44];
                                    val46 = val14[val42];
                                    val47 = val12[val44];
                                    val48 = phi40 + val43 * 32412. * val45 + val46 * 32412. * val47;
                                    val49 = phi41 + 1UL;
                                    phi41 = val49;
                                    phi40 = val48;
                                }
                            } while (!((!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) && val25 == val15 && val28 == val15 && val29 == val15 && val34 == val15 && val35 == val15 && val18 && val49 == val16));
                        }
                        if (val18 && val49 == val16) {
                            *val38 = val48;
                        }
                    }
                    if (!(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val18 || val35 != val15 || val34 != val15 || val29 != val15 || val25 != val15 || val28 != val15) || !(!val18 || val35 != val15 || val34 != val15 || val29 != val15 || val25 != val15 || val28 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16)) {
                        val50 = phi37 + 1UL;
                        phi37 = val50;
                    }
                } while (!((!(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || val18 || val35 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || !val18 || val35 != val15 || val49 != val16 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)))) && val50 == val15));
            }
            if ((!(val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) && val50 == val15) {
                val51 = phi36 + 1UL;
                phi36 = val51;
            }
        } while (!((!(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || val18 || val35 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || !val18 || val35 != val15 || val49 != val16 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)))) && val50 == val15 && val51 == val15));
    }
    if ((!(val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) && val50 == val15 && val51 == val15 && val2 == 1U) {
        if (val19) {
            phi52 = 0UL;
            do {
                if ((!(val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) && val50 == val15 && val51 == val15 && val2 == 1U && val19) {
                    phi53 = 0UL;
                    do {
                        if ((!(val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) && val50 == val15 && val51 == val15 && val2 == 1U && val19) {
                            val54 = stderr;
                            val55 = val9[phi53 + phi52 * val15];
                            call56 = fprintf(val54, _str, val55);
                            if ((int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 == 0U) {
                                val57 = stderr;
                                call58 = fputc(10U, val57);
                            }
                            if (!(!(!(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) || (int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 == 0U || !val19 || val2 != 1U || val50 != val15 || val51 != val15) || !((int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 != 0U || !val19 || val2 != 1U || val50 != val15 || val51 != val15 || !(!(val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)))) {
                                val59 = phi53 + 1UL;
                                phi53 = val59;
                            }
                        }
                    } while (!((!(!val19 || val2 != 1U || val51 != val15 || val50 != val15 || (int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 == 0U || !(!(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || val18 || val35 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || !val18 || val35 != val15 || val49 != val16 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))))) || !(!val19 || val2 != 1U || val51 != val15 || val50 != val15 || (int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 != 0U || !(!(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || val18 || val35 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || !val18 || val35 != val15 || val49 != val16 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)))))) && val59 == val15));
                }
                if ((!((int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 == 0U || val50 != val15 || val51 != val15 || !val19 || val2 != 1U || !(!(val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15))) || !(!(!(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) || (int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 != 0U || val50 != val15 || val51 != val15 || !val19 || val2 != 1U)) && val59 == val15) {
                    val60 = phi52 + 1UL;
                    phi52 = val60;
                }
            } while (!((!(!val19 || val2 != 1U || val51 != val15 || val50 != val15 || (int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 == 0U || !(!(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || val18 || val35 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || !val18 || val35 != val15 || val49 != val16 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))))) || !(!val19 || val2 != 1U || val51 != val15 || val50 != val15 || (int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 != 0U || !(!(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || val18 || val35 != val15 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18))) || !(val25 != val15 || val29 != val15 || val34 != val15 || val28 != val15 || !val18 || val35 != val15 || val49 != val16 || !(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)))))) && val59 == val15 && val60 == val15));
        }
    }
    if (!(!(!(!(!(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) || (int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 == 0U || val50 != val15 || !val19 || val2 != 1U || val51 != val15) || !(!(!(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) || (int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 != 0U || val50 != val15 || !val19 || val2 != 1U || val51 != val15)) || val60 != val15 || val59 != val15) || !(val19 || val2 != 1U)) {
        val61 = stderr;
        call62 = fputc(10U, val61);
    }
    if (!val19 || !(!(!(!(!(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) || (int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 == 0U || val50 != val15 || val51 != val15 || !val19 || val2 != 1U) || !(!(!(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) || (int)((unsigned int)phi52 * val5 + (unsigned int)phi53) % 20 != 0U || val50 != val15 || val51 != val15 || !val19 || val2 != 1U)) || val60 != val15 || val59 != val15) || !(!(!(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)) || val50 != val15 || val2 == 1U || val51 != val15) || !(val50 != val15 || val51 != val15 || val19 || val2 != 1U || !(!(val35 != val15 || val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15 || !(!val18 || !(val24 != val16 || !val19 || !val18))) || !(!(!(!val19 || val18) || !(val24 != val16 || !val19 || !val18)) || val49 != val16 || val35 != val15 || !val18 || val28 != val15 || val34 != val15 || val25 != val15 || val29 != val15)))) {
        free(call8);
        free(call11);
        free(call13);
        return 0U;
    }
}
