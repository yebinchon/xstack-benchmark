void main_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned long val4;
    unsigned long val5;
    double *val6;
    unsigned char *val7;
    unsigned int val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long phi13;
    unsigned long phi14;
    double val15;
    unsigned long val16;
    val4 = *(unsigned long *)arg5;
    val5 = *(unsigned long *)(&arg5[24UL]);
    val6 = *(double **)(&arg5[32UL]);
    val7 = *(unsigned char **)(&arg5[40UL]);
    val8 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val9 = arg3 + 18446744073709551615UL;
    var1 = val9;
    __kmpc_for_static_init_8(&_loc_dummy, val8, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val10 = var0;
    val11 = var1;
    val12 = ((long)val11 > (long)val9 ? val9 : val11);
    var1 = val12;
    if ((long)val10 <= (long)val12) {
        phi13 = val10;
        while (1U)
            {
                if ((long)val4 > 0L) {
                    phi14 = 0UL;
                    do {
                        val15 = *val6;
                        *(double *)(&(&val7[phi13 * (val5 << 3UL & 34359738360UL)])[phi14 << 3UL]) = (double)(unsigned int)phi13 * (double)(unsigned int)phi14 / val15;
                        val16 = phi14 + 1UL;
                        phi14 = val16;
                    } while (val16 != val4);
                }
                if (!((long)val10 > (long)val12 || (long)val4 > 0L) || !(val16 != val4 || (long)val10 > (long)val12 || (long)val4 <= 0L)) {
                    phi13 = phi13 + 1UL;
                    if ((!((long)val10 > (long)val12 || (long)val4 > 0L) || !((long)val4 <= 0L || val16 != val4 || (long)val10 > (long)val12)) && phi13 == val12) {
                        break;
                    }
                }
            }
    }
    if ((long)val10 > (long)val12 || !(phi13 != val12 || !(!((long)val10 > (long)val12 || (long)val4 > 0L) || !(val16 != val4 || (long)val10 > (long)val12 || (long)val4 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy, val8);
        return;
    }
}
void main_polly_subfn_4(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned long val4;
    unsigned char *val5;
    unsigned int val6;
    unsigned long val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long phi11;
    unsigned long phi12;
    unsigned long val13;
    val4 = *(unsigned long *)(&arg5[16UL]);
    val5 = *(unsigned char **)(&arg5[32UL]);
    val6 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val7 = arg3 + 18446744073709551615UL;
    var1 = val7;
    __kmpc_for_static_init_8(&_loc_dummy_3, val6, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val8 = var0;
    val9 = var1;
    val10 = ((long)val9 > (long)val7 ? val7 : val9);
    var1 = val10;
    if ((long)val8 <= (long)val10) {
        phi11 = val8;
        while (1U)
            {
                if ((long)val4 > 0L) {
                    phi12 = 0UL;
                    do {
                        *(double *)(&(&val5[phi11 * (val4 << 3UL & 34359738360UL)])[phi12 << 3UL]) = (double)(unsigned int)phi11 * (double)((unsigned int)phi12 + 1U) / (double)(unsigned int)val4;
                        val13 = phi12 + 1UL;
                        phi12 = val13;
                    } while (val13 != val4);
                }
                if (!((long)val8 > (long)val10 || (long)val4 > 0L) || !(val13 != val4 || (long)val8 > (long)val10 || (long)val4 <= 0L)) {
                    phi11 = phi11 + 1UL;
                    if ((!((long)val8 > (long)val10 || (long)val4 > 0L) || !(val13 != val4 || (long)val4 <= 0L || (long)val8 > (long)val10)) && phi11 == val10) {
                        break;
                    }
                }
            }
    }
    if ((long)val8 > (long)val10 || !(phi11 != val10 || !(!((long)val8 > (long)val10 || (long)val4 > 0L) || !(val13 != val4 || (long)val8 > (long)val10 || (long)val4 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy_3, val6);
        return;
    }
}
void main_polly_subfn_7(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
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
    val4 = *(unsigned long *)(&arg5[16UL]);
    val5 = *(unsigned long *)(&arg5[24UL]);
    val6 = *(unsigned char **)(&arg5[32UL]);
    val7 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val8 = arg3 + 18446744073709551615UL;
    var1 = val8;
    __kmpc_for_static_init_8(&_loc_dummy_6, val7, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val9 = var0;
    val10 = var1;
    val11 = ((long)val10 > (long)val8 ? val8 : val10);
    var1 = val11;
    if ((long)val9 <= (long)val11) {
        phi12 = val9;
        while (1U)
            {
                if ((long)val4 > 0L) {
                    phi13 = 0UL;
                    do {
                        *(double *)(&(&val6[phi12 * (val4 << 3UL & 34359738360UL)])[phi13 << 3UL]) = (double)(unsigned int)phi12 * (double)((unsigned int)phi13 + 3U) / (double)(unsigned int)val5;
                        val14 = phi13 + 1UL;
                        phi13 = val14;
                    } while (val14 != val4);
                }
                if (!((long)val9 > (long)val11 || (long)val4 > 0L) || !(val14 != val4 || (long)val9 > (long)val11 || (long)val4 <= 0L)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (long)val4 > 0L) || !((long)val9 > (long)val11 || (long)val4 <= 0L || val14 != val4)) && phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (long)val4 > 0L) || !(val14 != val4 || (long)val9 > (long)val11 || (long)val4 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy_6, val7);
        return;
    }
}
void main_polly_subfn_10(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
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
    val5 = *(unsigned long *)(&arg5[24UL]);
    val6 = *(unsigned char **)(&arg5[32UL]);
    val7 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val8 = arg3 + 18446744073709551615UL;
    var1 = val8;
    __kmpc_for_static_init_8(&_loc_dummy_9, val7, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
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
                        *(double *)(&(&val6[phi12 * (val5 << 3UL & 34359738360UL)])[phi13 << 3UL]) = (double)(unsigned int)phi12 * (double)((unsigned int)phi13 + 2U) / (double)(unsigned int)val4;
                        val14 = phi13 + 1UL;
                        phi13 = val14;
                    } while (val14 != val5);
                }
                if (!((long)val9 > (long)val11 || (long)val5 > 0L) || !(val14 != val5 || (long)val9 > (long)val11 || (long)val5 <= 0L)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (long)val5 > 0L) || !(val14 != val5 || (long)val5 <= 0L || (long)val9 > (long)val11)) && phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (long)val5 > 0L) || !(val14 != val5 || (long)val9 > (long)val11 || (long)val5 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy_9, val7);
        return;
    }
}
