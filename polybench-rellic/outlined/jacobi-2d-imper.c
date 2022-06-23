void kernel_jacobi_2d_imper_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    double *val5;
    double *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    double *val13;
    unsigned char *val14;
    unsigned long val15;
    unsigned long phi16;
    unsigned long val17;
    double val18;
    double val19;
    double val20;
    double val21;
    double val22;
    unsigned long val23;
    unsigned long val24;
    unsigned long val25;
    val4 = *(unsigned int *)(&arg5[4UL]);
    val5 = *(double **)(&arg5[16UL]);
    val6 = *(double **)(&arg5[24UL]);
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
        val13 = &val5[1UL];
        val14 = (unsigned char *)val13;
        val15 = val4;
        phi12 = val9;
        while (1U)
            {
                if ((int)val4 > 2) {
                    val24 = phi12 << 3UL;
                    val25 = (val24 + 8UL) * val15;
                    phi16 = 0UL;
                    do {
                        val17 = phi16 << 3UL;
                        val18 = *(double *)(&(&val14[val25])[val17]);
                        val19 = *(double *)(&(&((unsigned char *)val5)[val25])[val17]);
                        val20 = *(double *)(&(&((unsigned char *)(&val5[2UL]))[val25])[val17]);
                        val21 = *(double *)(&(&val14[(val24 + 16UL) * val15])[val17]);
                        val22 = (&val13[phi12 * val15])[phi16];
                        *(double *)(&(&((unsigned char *)(&val6[1UL]))[val25])[val17]) = (val18 + val19 + val20 + val21 + val22) * 0.20000000000000001;
                        val23 = phi16 + 1UL;
                        phi16 = val23;
                    } while (val23 != (long)val4 + 18446744073709551614UL);
                }
                if (!(val23 != (long)val4 + 18446744073709551614UL || (int)val4 <= 2 || (long)val9 > (long)val11) || !((long)val9 > (long)val11 || (int)val4 > 2)) {
                    phi12 = phi12 + 1UL;
                    if (phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || val23 != (long)val4 + 18446744073709551614UL || (int)val4 <= 2) || !((int)val4 > 2 || (long)val9 > (long)val11)))) {
        __kmpc_for_static_fini(&_loc_dummy, val7);
        return;
    }
}
void kernel_jacobi_2d_imper_polly_subfn_4(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    double *val5;
    double *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    unsigned long phi13;
    unsigned long val14;
    double val15;
    unsigned long val16;
    unsigned long val17;
    val4 = *(unsigned int *)(&arg5[4UL]);
    val5 = *(double **)(&arg5[16UL]);
    val6 = *(double **)(&arg5[24UL]);
    val7 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val8 = arg3 + 18446744073709551615UL;
    var1 = val8;
    __kmpc_for_static_init_8(&_loc_dummy_3, val7, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val9 = var0;
    val10 = var1;
    val11 = ((long)val10 > (long)val8 ? val8 : val10);
    var1 = val11;
    if ((long)val9 <= (long)val11) {
        phi12 = val9;
        while (1U)
            {
                if ((int)val4 > 2) {
                    val17 = ((phi12 << 3UL) + 8UL) * (unsigned long)val4;
                    phi13 = 0UL;
                    do {
                        val14 = phi13 << 3UL;
                        val15 = *(double *)(&(&((unsigned char *)(&val5[1UL]))[val17])[val14]);
                        *(double *)(&(&((unsigned char *)(&val6[1UL]))[val17])[val14]) = val15;
                        val16 = phi13 + 1UL;
                        phi13 = val16;
                    } while (val16 != (long)val4 + 18446744073709551614UL);
                }
                if (!((long)val9 > (long)val11 || (int)val4 > 2) || !(val16 != (long)val4 + 18446744073709551614UL || (long)val9 > (long)val11 || (int)val4 <= 2)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (int)val4 > 2) || !((long)val9 > (long)val11 || val16 != (long)val4 + 18446744073709551614UL || (int)val4 <= 2)) && phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (int)val4 > 2) || !(val16 != (long)val4 + 18446744073709551614UL || (long)val9 > (long)val11 || (int)val4 <= 2)))) {
        __kmpc_for_static_fini(&_loc_dummy_3, val7);
        return;
    }
}
