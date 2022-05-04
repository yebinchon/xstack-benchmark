unsigned int main(unsigned int argc, unsigned char **argv) {
    unsigned char *val0;
    unsigned long call1;
    unsigned char *call2;
    double *val3;
    unsigned char *call4;
    double *val5;
    unsigned char *call6;
    double *val7;
    unsigned char *call8;
    double *val9;
    unsigned char *call10;
    double *val11;
    unsigned long phi12;
    double val13;
    unsigned long phi14;
    unsigned long val15;
    unsigned long val16;
    unsigned long phi17;
    double *val18;
    double val19;
    double phi20;
    unsigned long phi21;
    double val22;
    double val23;
    double val24;
    unsigned long val25;
    unsigned long val26;
    unsigned long phi27;
    double *val28;
    double val29;
    double phi30;
    unsigned long phi31;
    double val32;
    double val33;
    double val34;
    unsigned long val35;
    unsigned long val36;
    unsigned long phi37;
    unsigned int phi38;
    struct struct__IO_FILE *val39;
    double val40;
    unsigned int call41;
    struct struct__IO_FILE *val42;
    double val43;
    unsigned int call44;
    struct struct__IO_FILE *val45;
    unsigned int call46;
    unsigned long val47;
    val0 = argv[1UL];
    call1 = strtol(val0, (void *)0U, 10U);
    call2 = malloc(128000000UL);
    val3 = (double *)call2;
    call4 = malloc(32000UL);
    val5 = (double *)call4;
    call6 = malloc(32000UL);
    val7 = (double *)call6;
    call8 = malloc(32000UL);
    val9 = (double *)call8;
    call10 = malloc(32000UL);
    val11 = (double *)call10;
    phi12 = 0UL;
    do {
        val13 = (unsigned int)phi12;
        val5[phi12] = val13 / 4000.;
        val7[phi12] = (val13 + 1.) / 4000.;
        val9[phi12] = (val13 + 3.) / 4000.;
        val11[phi12] = (val13 + 4.) / 4000.;
        phi14 = 0UL;
        do {
            val3[phi14 + phi12 * 4000UL] = val13 * (double)(unsigned int)phi14 / 4000.;
            val15 = phi14 + 1UL;
            phi14 = val15;
        } while (val15 != 4000UL);
        if (val15 == 4000UL) {
            val16 = phi12 + 1UL;
            phi12 = val16;
        }
    } while (!(val15 == 4000UL && val16 == 4000UL));
    if (val15 == 4000UL && val16 == 4000UL) {
        phi17 = 0UL;
        do {
            if (val15 == 4000UL && val16 == 4000UL) {
                val18 = &val5[phi17];
                val19 = *val18;
                phi21 = 0UL;
                phi20 = val19;
                do {
                    if (val15 == 4000UL && val16 == 4000UL) {
                        val22 = val3[phi21 + phi17 * 4000UL];
                        val23 = val9[phi21];
                        val24 = phi20 + val22 * val23;
                        val25 = phi21 + 1UL;
                        phi21 = val25;
                        phi20 = val24;
                    }
                } while (!(val15 == 4000UL && val16 == 4000UL && val25 == 4000UL));
            }
            if (val15 == 4000UL && val16 == 4000UL && val25 == 4000UL) {
                *val18 = val24;
                val26 = phi17 + 1UL;
                phi17 = val26;
            }
        } while (!(val15 == 4000UL && val16 == 4000UL && val25 == 4000UL && val26 == 4000UL));
    }
    if (val15 == 4000UL && val16 == 4000UL && val25 == 4000UL && val26 == 4000UL) {
        phi27 = 0UL;
        do {
            if (val15 == 4000UL && val16 == 4000UL && val25 == 4000UL && val26 == 4000UL) {
                val28 = &val7[phi27];
                val29 = *val28;
                phi31 = 0UL;
                phi30 = val29;
                do {
                    if (val15 == 4000UL && val16 == 4000UL && val25 == 4000UL && val26 == 4000UL) {
                        val32 = val3[phi31 * 4000UL + phi27];
                        val33 = val11[phi31];
                        val34 = phi30 + val32 * val33;
                        val35 = phi31 + 1UL;
                        phi31 = val35;
                        phi30 = val34;
                    }
                } while (!(val15 == 4000UL && val16 == 4000UL && val25 == 4000UL && val26 == 4000UL && val35 == 4000UL));
            }
            if (val15 == 4000UL && val16 == 4000UL && val25 == 4000UL && val26 == 4000UL && val35 == 4000UL) {
                *val28 = val34;
                val36 = phi27 + 1UL;
                phi27 = val36;
            }
        } while (!(val15 == 4000UL && val16 == 4000UL && val25 == 4000UL && val26 == 4000UL && val35 == 4000UL && val36 == 4000UL));
    }
    if (val15 == 4000UL && val16 == 4000UL && val25 == 4000UL && val26 == 4000UL && val35 == 4000UL && val36 == 4000UL) {
        if ((unsigned int)call1 == 1U) {
            phi38 = 0U;
            phi37 = 0UL;
            do {
                if (val15 == 4000UL && val16 == 4000UL && val25 == 4000UL && val26 == 4000UL && val35 == 4000UL && val36 == 4000UL && (unsigned int)call1 == 1U) {
                    val39 = stderr;
                    val40 = val5[phi37];
                    call41 = fprintf(val39, _str, val40);
                    val42 = stderr;
                    val43 = val7[phi37];
                    call44 = fprintf(val42, _str, val43);
                    if ((unsigned short)(unsigned short)phi38 % (unsigned short)20U == (unsigned short)0U) {
                        val45 = stderr;
                        call46 = fputc(10U, val45);
                    }
                    if ((unsigned int)call1 == 1U && val36 == 4000UL && val35 == 4000UL && val26 == 4000UL && val25 == 4000UL && val15 == 4000UL && val16 == 4000UL) {
                        val47 = phi37 + 1UL;
                        phi38 = phi38 + 1U;
                        phi37 = val47;
                    }
                }
            } while (!((unsigned int)call1 == 1U && val36 == 4000UL && val35 == 4000UL && val26 == 4000UL && val25 == 4000UL && val15 == 4000UL && val16 == 4000UL && val47 == 4000UL));
        }
    }
    if (!(val16 != 4000UL || val15 != 4000UL || val25 != 4000UL || val26 != 4000UL || val35 != 4000UL || (unsigned int)call1 != 1U || val36 != 4000UL || val47 != 4000UL) || !(val16 != 4000UL || val15 != 4000UL || val25 != 4000UL || val26 != 4000UL || val35 != 4000UL || (unsigned int)call1 == 1U || val36 != 4000UL)) {
        free(call2);
        free(call4);
        free(call6);
        free(call8);
        free(call10);
        return 0U;
    }
}
