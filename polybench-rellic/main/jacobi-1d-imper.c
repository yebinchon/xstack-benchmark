unsigned int main(unsigned int arg0, unsigned char **arg1) {
    struct literal_struct_0 var0;
    struct literal_struct_0 var1;
    unsigned char *val2;
    unsigned long call3;
    unsigned int val4;
    unsigned char *val5;
    unsigned long call6;
    unsigned int val7;
    unsigned char *val8;
    unsigned long call9;
    unsigned long val10;
    unsigned long val11;
    unsigned char *call12;
    double *val13;
    unsigned char *call14;
    unsigned char val15;
    double val16;
    unsigned long phi17;
    double val18;
    unsigned long val19;
    unsigned char *val20;
    unsigned char *val21;
    unsigned long phi23;
    unsigned long val24;
    unsigned long phi25;
    struct struct__IO_FILE *val26;
    double val27;
    unsigned int call28;
    struct struct__IO_FILE *val29;
    unsigned int call30;
    unsigned long val31;
    struct struct__IO_FILE *val32;
    unsigned int call33;
    val2 = arg1[3UL];
    call3 = strtol(val2, (void *)0U, 10U);
    val4 = call3;
    val5 = arg1[2UL];
    call6 = strtol(val5, (void *)0U, 10U);
    val7 = call6;
    val8 = arg1[1UL];
    call9 = strtol(val8, (void *)0U, 10U);
    val10 = call3 << 32UL;
    val11 = (long)val10 >> 29UL;
    call12 = malloc(val11);
    val13 = (double *)call12;
    call14 = malloc(val11);
    val15 = (int)val4 > 0;
    if (val15) {
        val16 = val4;
        phi17 = 0UL;
        do {
            val18 = (unsigned int)phi17;
            val13[phi17] = (val18 + 2.) / val16;
            ((double *)call14)[phi17] = (val18 + 3.) / val16;
            val19 = phi17 + 1UL;
            phi17 = val19;
        } while (val19 != (call3 & 4294967295UL));
    }
    if (val19 == (call3 & 4294967295UL) || !val15) {
        val20 = (unsigned char *)(&var0);
        val21 = (unsigned char *)(&var1);
        if ((int)val7 > 0) {
            phi23 = 0UL;
            do {
                var1.field0 = val7;
                var1.field1 = val4;
                var1.field2 = phi23;
                *(unsigned char **)(&var1.field3) = call12;
                *(unsigned char **)(&var1.field4) = call14;
                var0.field0 = val7;
                var0.field1 = val4;
                var0.field2 = phi23;
                *(unsigned char **)(&var0.field3) = call14;
                *(unsigned char **)(&var0.field4) = call12;
                val24 = phi23 + 1UL;
                phi23 = val24;
            } while (val24 != (long)(call6 << 32UL) >> 32UL);
        }
        if (!(val24 != (long)(call6 << 32UL) >> 32UL || (int)val7 <= 0) || (int)val7 <= 0) {
            if ((unsigned int)call9 == 1U) {
                if (val15) {
                    phi25 = 0UL;
                    do {
                        val26 = stderr;
                        val27 = val13[phi25];
                        call28 = fprintf(val26, "%0.2lf ", val27);
                        if ((unsigned int)phi25 % 20U == 0U) {
                            val29 = stderr;
                            call30 = fputc(10U, val29);
                        }
                        if (!((unsigned int)phi25 % 20U == 0U || !val15) || !((unsigned int)phi25 % 20U != 0U || !val15)) {
                            val31 = phi25 + 1UL;
                            phi25 = val31;
                        }
                    } while (!((!((unsigned int)phi25 % 20U == 0U || !val15) || !(!val15 || (unsigned int)phi25 % 20U != 0U)) && val31 == (call3 & 4294967295UL)));
                }
                if (!(val31 != (call3 & 4294967295UL) || !(!((unsigned int)phi25 % 20U == 0U || !val15) || !((unsigned int)phi25 % 20U != 0U || !val15))) || !(val15)) {
                    val32 = stderr;
                    call33 = fputc(10U, val32);
                }
            }
            if (!((unsigned int)call9 == 1U) || !((unsigned int)call9 != 1U || val15) || !(val31 != (call3 & 4294967295UL) || !(!((unsigned int)phi25 % 20U == 0U || (unsigned int)call9 != 1U || !val15) || !((unsigned int)phi25 % 20U != 0U || (unsigned int)call9 != 1U || !val15)))) {
                free(call12);
                free(call14);
                return 0U;
            }
        }
    }
}
