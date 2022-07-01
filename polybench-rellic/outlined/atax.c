void main_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned long val4;
    unsigned long val5;
    unsigned char *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    unsigned long phi13;
    unsigned long val14;
    val4 = *(unsigned long *)arg5;
    val5 = *(unsigned long *)(&arg5[8UL]);
    val6 = *(unsigned char **)(&arg5[16UL]);
    val7 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val8 = arg3 + 18446744073709551615UL;
    var1 = val8;
    __kmpc_for_static_init_8(&_loc_dummy, val7, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val9 = var0;
    val10 = var1;
    val11 = ((long)val10 > (long)val8 ? val8 : val10);
    var1 = val11;
    if ((long)val9 <= (long)val11) {
        phi12 = val9;
        while (1U)
            {
                if ((long)val5 > 0L) {
                    phi13 = 0UL;
                    do {
                        *(double *)(&(&val6[phi12 * (val5 << 3UL & 34359738360UL)])[phi13 << 3UL]) = (double)(unsigned int)phi12 * (double)((unsigned int)phi13 + 1U) / (double)(unsigned int)val4;
                        val14 = phi13 + 1UL;
                        phi13 = val14;
                    } while (val14 != val5);
                }
                if (!((long)val9 > (long)val11 || (long)val5 > 0L) || !(val14 != val5 || (long)val9 > (long)val11 || (long)val5 <= 0L)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (long)val5 > 0L) || !((long)val5 <= 0L || (long)val9 > (long)val11 || val14 != val5)) && phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (long)val5 > 0L) || !(val14 != val5 || (long)val9 > (long)val11 || (long)val5 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy, val7);
        return;
    }
}
