unsigned int main(unsigned int arg0, unsigned char **arg1) {
    double var1;
    unsigned char *val2;
    unsigned long call3;
    unsigned int val4;
    unsigned char *val5;
    unsigned long call6;
    unsigned char *call7;
    unsigned long val8;
    unsigned long phi9;
    unsigned long phi10;
    struct struct__IO_FILE *val11;
    double val12;
    unsigned int call13;
    struct struct__IO_FILE *val14;
    unsigned int call15;
    unsigned long val16;
    unsigned long val17;
    struct struct__IO_FILE *val18;
    unsigned int call19;
    unsigned long val20;
    unsigned long val21;
    unsigned long val22;
    unsigned long phi23;
    unsigned long phi24;
    unsigned long val25;
    double *val26;
    double val27;
    double val28;
    double val29;
    double val30;
    unsigned long val31;
    unsigned long phi32;
    unsigned long val33;
    val2 = arg1[2UL];
    call3 = strtol(val2, (void *)0U, 10U);
    val4 = call3;
    val5 = arg1[1UL];
    call6 = strtol(val5, (void *)0U, 10U);
    call7 = malloc((call3 << 3UL) * call3 & 34359738360UL);
    val8 = call3 & 4294967295UL;
    var1 = val4;
    if ((long)call3 > 0L) {
        val21 = val8 << 3UL;
        phi23 = 0UL;
        while (1U)
            {
                phi32 = 0UL;
                do {
                    val33 = phi32 * val21;
                    phi24 = 0UL;
                    do {
                        val25 = phi24 << 3UL;
                        val26 = (double *)(&(&call7[val33])[val25]);
                        val27 = *val26;
                        val28 = *(double *)(&(&call7[phi23 << 3UL])[val33]);
                        val29 = *(double *)(&(&call7[phi23 * val21])[val25]);
                        val30 = val28 + val29;
                        *val26 = (val27 < val30 ? val27 : val30);
                        val31 = phi24 + 1UL;
                        phi24 = val31;
                    } while (val31 != call3);
                    val22 = phi32 + 1UL;
                    phi32 = val22;
                } while (val22 != call3);
                if (val31 == call3) {
                    val20 = phi23 + 1UL;
                    phi23 = val20;
                    if (val20 == call3) {
                        break;
                    }
                }
            }
    }
    if ((long)call3 <= 0L || !(val20 != call3 || val22 != call3 || (long)call3 <= 0L || val31 != call3)) {
        if (((long)call3 <= 0L || !(val31 != call3 || val20 != call3 || (long)call3 <= 0L || val22 != call3)) && (unsigned int)call6 == 1U) {
            phi9 = 0UL;
            while (1U)
                {
                    phi10 = 0UL;
                    while (1U)
                        {
                            val11 = stderr;
                            val12 = (&((double *)call7)[phi9 * val8])[phi10];
                            call13 = fprintf(val11, "%0.2lf ", val12);
                            if ((int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 == 0U) {
                                val14 = stderr;
                                call15 = fputc(10U, val14);
                            }
                            if (!(!((long)call3 <= 0L || !(val31 != call3 || val20 != call3 || (long)call3 <= 0L || val22 != call3)) || (unsigned int)call6 != 1U || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 == 0U) || !((unsigned int)call6 != 1U || !((long)call3 <= 0L || !(val31 != call3 || val20 != call3 || (long)call3 <= 0L || val22 != call3)) || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 != 0U)) {
                                val16 = phi10 + 1UL;
                                phi10 = val16;
                                if ((!((unsigned int)call6 != 1U || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 == 0U || !((long)call3 <= 0L || !(val22 != call3 || val20 != call3 || val31 != call3 || (long)call3 <= 0L))) || !((unsigned int)call6 != 1U || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 != 0U || !((long)call3 <= 0L || !(val22 != call3 || val20 != call3 || val31 != call3 || (long)call3 <= 0L)))) && val16 == val8) {
                                    break;
                                }
                            }
                        }
                    if ((!(!((long)call3 <= 0L || !(val31 != call3 || val20 != call3 || (long)call3 <= 0L || val22 != call3)) || (unsigned int)call6 != 1U || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 != 0U) || !((unsigned int)call6 != 1U || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 == 0U || !((long)call3 <= 0L || !(val31 != call3 || val20 != call3 || (long)call3 <= 0L || val22 != call3)))) && val16 == val8) {
                        val17 = phi9 + 1UL;
                        phi9 = val17;
                        if ((!((unsigned int)call6 != 1U || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 != 0U || !((long)call3 <= 0L || !(val22 != call3 || val20 != call3 || val31 != call3 || (long)call3 <= 0L))) || !((unsigned int)call6 != 1U || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 == 0U || !((long)call3 <= 0L || !(val22 != call3 || val20 != call3 || val31 != call3 || (long)call3 <= 0L)))) && val16 == val8 && val17 == val8) {
                            break;
                        }
                    }
                }
            if ((!(!((long)call3 <= 0L || !(val31 != call3 || val20 != call3 || (long)call3 <= 0L || val22 != call3)) || (unsigned int)call6 != 1U || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 == 0U) || !((unsigned int)call6 != 1U || !((long)call3 <= 0L || !(val31 != call3 || val20 != call3 || (long)call3 <= 0L || val22 != call3)) || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 != 0U)) && val16 == val8 && val17 == val8) {
                val18 = stderr;
                call19 = fputc(10U, val18);
            }
        }
        if (!((unsigned int)call6 == 1U || !((long)call3 <= 0L || !(val31 != call3 || val20 != call3 || (long)call3 <= 0L || val22 != call3))) || !(!(!(!((long)call3 <= 0L || !(val31 != call3 || val20 != call3 || (long)call3 <= 0L || val22 != call3)) || (unsigned int)call6 != 1U || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 != 0U) || !(!((long)call3 <= 0L || !(val31 != call3 || val20 != call3 || (long)call3 <= 0L || val22 != call3)) || (unsigned int)call6 != 1U || (int)((unsigned int)phi9 * val4 + (unsigned int)phi10) % 20 == 0U)) || val16 != val8 || val17 != val8)) {
            free(call7);
            return 0U;
        }
    }
}
