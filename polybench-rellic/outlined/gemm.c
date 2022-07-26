void init_array_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    unsigned int val5;
    double *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    unsigned long phi13;
    unsigned long val14;
    val4 = *(unsigned int *)arg5;
    val5 = *(unsigned int *)(&arg5[4UL]);
    val6 = *(double **)(&arg5[16UL]);
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
                if ((int)val5 > 0) {
                    phi13 = 0UL;
                    do {
                        (&val6[phi12 * (unsigned long)val5])[phi13] = (double)(unsigned int)phi12 * (double)(unsigned int)phi13 / (double)val4;
                        val14 = phi13 + 1UL;
                        phi13 = val14;
                    } while (val14 != (long)val5);
                }
                if (!((long)val9 > (long)val11 || (int)val5 > 0) || !(val14 != (long)val5 || (long)val9 > (long)val11 || (int)val5 <= 0)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (int)val5 > 0) || !((int)val5 <= 0 || val14 != (long)val5 || (long)val9 > (long)val11)) && phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (int)val5 > 0) || !(val14 != (long)val5 || (long)val9 > (long)val11 || (int)val5 <= 0)))) {
        __kmpc_for_static_fini(&_loc_dummy, val7);
        return;
    }
}
void init_array_polly_subfn_4(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    unsigned int val5;
    double *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    unsigned long phi13;
    unsigned long val14;
    val4 = *(unsigned int *)arg5;
    val5 = *(unsigned int *)(&arg5[8UL]);
    val6 = *(double **)(&arg5[16UL]);
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
                if ((int)val5 > 0) {
                    phi13 = 0UL;
                    do {
                        (&val6[phi12 * (unsigned long)val5])[phi13] = (double)(unsigned int)phi12 * (double)(unsigned int)phi13 / (double)val4;
                        val14 = phi13 + 1UL;
                        phi13 = val14;
                    } while (val14 != (long)val5);
                }
                if (!((long)val9 > (long)val11 || val14 != (long)val5 || (int)val5 <= 0) || !((long)val9 > (long)val11 || (int)val5 > 0)) {
                    phi12 = phi12 + 1UL;
                    if (phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (int)val5 > 0) || !((long)val9 > (long)val11 || val14 != (long)val5)))) {
        __kmpc_for_static_fini(&_loc_dummy_3, val7);
        return;
    }
}
void init_array_polly_subfn_7(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    unsigned int val5;
    double *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    unsigned long phi13;
    unsigned long val14;
    val4 = *(unsigned int *)arg5;
    val5 = *(unsigned int *)(&arg5[4UL]);
    val6 = *(double **)(&arg5[16UL]);
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
                if ((int)val5 > 0) {
                    phi13 = 0UL;
                    do {
                        (&val6[phi12 * (unsigned long)val5])[phi13] = (double)(unsigned int)phi12 * (double)(unsigned int)phi13 / (double)val4;
                        val14 = phi13 + 1UL;
                        phi13 = val14;
                    } while (val14 != (long)val5);
                }
                if (!((long)val9 > (long)val11 || (int)val5 > 0) || !(val14 != (long)val5 || (long)val9 > (long)val11 || (int)val5 <= 0)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (int)val5 > 0) || !(val14 != (long)val5 || (int)val5 <= 0 || (long)val9 > (long)val11)) && phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (int)val5 > 0) || !(val14 != (long)val5 || (long)val9 > (long)val11 || (int)val5 <= 0)))) {
        __kmpc_for_static_fini(&_loc_dummy_6, val7);
        return;
    }
}
void kernel_gemm_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    unsigned int val5;
    double *val6;
    double *val7;
    double *val8;
    double *val9;
    double *val10;
    unsigned int val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long val14;
    unsigned long val15;
    unsigned long phi16;
    unsigned long val17;
    unsigned long phi18;
    double val19;
    double *val20;
    double val21;
    double val22;
    unsigned long val23;
    double phi24;
    unsigned long phi25;
    double val26;
    double val27;
    double val28;
    double call29;
    unsigned long val30;
    val4 = *(unsigned int *)(&arg5[4UL]);
    val5 = *(unsigned int *)(&arg5[8UL]);
    val6 = *(double **)(&arg5[16UL]);
    val7 = *(double **)(&arg5[24UL]);
    val8 = *(double **)(&arg5[32UL]);
    val9 = *(double **)(&arg5[40UL]);
    val10 = *(double **)(&arg5[48UL]);
    val11 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val12 = arg3 + 18446744073709551615UL;
    var1 = val12;
    __kmpc_for_static_init_8(&_loc_dummy_9, val11, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val13 = var0;
    val14 = var1;
    val15 = ((long)val14 > (long)val12 ? val12 : val14);
    var1 = val15;
    if ((long)val13 <= (long)val15) {
        val17 = val4;
        phi16 = val13;
        while (1U)
            {
                if ((int)val4 > 0) {
                    phi18 = 0UL;
                    while (1U)
                        {
                            val19 = *val10;
                            val20 = &(&val9[phi16 * val17])[phi18];
                            val21 = *val20;
                            val22 = val19 * val21;
                            *val20 = val22;
                            if ((int)val5 > 0) {
                                phi25 = 0UL;
                                phi24 = val22;
                                do {
                                    val26 = *val7;
                                    val27 = (&val6[phi16 * (unsigned long)val5])[phi25];
                                    val28 = (&val8[phi18])[phi25 * val17];
                                    call29 = llvm_fmuladd_f64(val26 * val27, val28, phi24);
                                    *val20 = call29;
                                    val30 = phi25 + 1UL;
                                    phi25 = val30;
                                    phi24 = call29;
                                } while (val30 != (long)val5);
                            }
                            if (!((int)val5 > 0 || (long)val13 > (long)val15) || !(val30 != (long)val5 || (int)val5 <= 0 || (long)val13 > (long)val15)) {
                                val23 = phi18 + 1UL;
                                phi18 = val23;
                                if ((!((int)val5 > 0 || (long)val13 > (long)val15) || !(val30 != (long)val5 || (long)val13 > (long)val15 || (int)val5 <= 0)) && val23 == (long)val4) {
                                    break;
                                }
                            }
                        }
                }
                if (!(val23 != (long)val4 || !(!((int)val4 <= 0 || (int)val5 > 0 || (long)val13 > (long)val15) || !(val30 != (long)val5 || (int)val4 <= 0 || (int)val5 <= 0 || (long)val13 > (long)val15))) || !((long)val13 > (long)val15 || (int)val4 > 0)) {
                    phi16 = phi16 + 1UL;
                    if ((!(val23 != (long)val4 || !(!((int)val5 > 0 || (long)val13 > (long)val15 || (int)val4 <= 0) || !(val30 != (long)val5 || (long)val13 > (long)val15 || (int)val5 <= 0 || (int)val4 <= 0))) || !((long)val13 > (long)val15 || (int)val4 > 0)) && phi16 == val15) {
                        break;
                    }
                }
            }
    }
    if ((long)val13 > (long)val15 || !(phi16 != val15 || !(!((long)val13 > (long)val15 || (int)val4 > 0) || !(val23 != (long)val4 || !(!((int)val5 > 0 || (long)val13 > (long)val15 || (int)val4 <= 0) || !(val30 != (long)val5 || (int)val5 <= 0 || (long)val13 > (long)val15 || (int)val4 <= 0)))))) {
        __kmpc_for_static_fini(&_loc_dummy_9, val11);
        return;
    }
}
