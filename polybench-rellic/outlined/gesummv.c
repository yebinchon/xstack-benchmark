void main_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned long val4;
    double *val5;
    unsigned char *val6;
    unsigned char *val7;
    unsigned char *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long phi14;
    double val15;
    double val16;
    unsigned long phi17;
    double val18;
    double val19;
    unsigned long val20;
    unsigned long val21;
    unsigned long val22;
    val4 = *(unsigned long *)arg5;
    val5 = *(double **)(&arg5[8UL]);
    val6 = *(unsigned char **)(&arg5[16UL]);
    val7 = *(unsigned char **)(&arg5[24UL]);
    val8 = *(unsigned char **)(&arg5[32UL]);
    val9 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val10 = arg3 + 18446744073709551615UL;
    var1 = val10;
    __kmpc_for_static_init_8(&_loc_dummy, val9, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val11 = var0;
    val12 = var1;
    val13 = ((long)val12 > (long)val10 ? val10 : val12);
    var1 = val13;
    if ((long)val11 <= (long)val13) {
        phi14 = val11;
        while (1U)
            {
                val15 = *val5;
                val16 = (unsigned int)phi14;
                *(double *)(&val8[phi14 << 3UL]) = val16 / val15;
                if ((long)val4 > 0L) {
                    val22 = phi14 * (val4 << 3UL & 34359738360UL);
                    phi17 = 0UL;
                    do {
                        val18 = *val5;
                        val19 = val16 * (double)(unsigned int)phi17 / val18;
                        val20 = phi17 << 3UL;
                        *(double *)(&(&val6[val22])[val20]) = val19;
                        *(double *)(&(&val7[val22])[val20]) = val19;
                        val21 = phi17 + 1UL;
                        phi17 = val21;
                    } while (val21 != val4);
                }
                if (!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val21 != val4 || (long)val11 > (long)val13 || (long)val4 <= 0L)) {
                    phi14 = phi14 + 1UL;
                    if ((!((long)val11 > (long)val13 || (long)val4 > 0L) || !((long)val11 > (long)val13 || val21 != val4 || (long)val4 <= 0L)) && phi14 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi14 != val13 || !(!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val21 != val4 || (long)val11 > (long)val13 || (long)val4 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy, val9);
        return;
    }
}
