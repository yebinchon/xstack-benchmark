void kernel_gemver_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    double *val5;
    double *val6;
    double *val7;
    double *val8;
    double *val9;
    unsigned int val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long val14;
    unsigned long phi15;
    unsigned long phi16;
    double *val17;
    double val18;
    double val19;
    double call20;
    double val21;
    double call22;
    unsigned long val23;
    double val24;
    double val25;
    val4 = *(unsigned int *)arg5;
    val5 = *(double **)(&arg5[8UL]);
    val6 = *(double **)(&arg5[16UL]);
    val7 = *(double **)(&arg5[24UL]);
    val8 = *(double **)(&arg5[32UL]);
    val9 = *(double **)(&arg5[40UL]);
    val10 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val11 = arg3 + 18446744073709551615UL;
    var1 = val11;
    __kmpc_for_static_init_8(&_loc_dummy, val10, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val12 = var0;
    val13 = var1;
    val14 = ((long)val13 > (long)val11 ? val11 : val13);
    var1 = val14;
    if ((long)val12 <= (long)val14) {
        phi15 = val12;
        while (1U)
            {
                if ((int)val4 > 0) {
                    val24 = val6[phi15];
                    val25 = val8[phi15];
                    phi16 = 0UL;
                    do {
                        val17 = &(&val5[phi15 * (unsigned long)val4])[phi16];
                        val18 = *val17;
                        val19 = val7[phi16];
                        call20 = llvm_fmuladd_f64(val24, val19, val18);
                        val21 = val9[phi16];
                        call22 = llvm_fmuladd_f64(val25, val21, call20);
                        *val17 = call22;
                        val23 = phi16 + 1UL;
                        phi16 = val23;
                    } while (val23 != (long)val4);
                }
                if (!((long)val12 > (long)val14 || (int)val4 > 0) || !(val23 != (long)val4 || (long)val12 > (long)val14 || (int)val4 <= 0)) {
                    phi15 = phi15 + 1UL;
                    if ((!((long)val12 > (long)val14 || (int)val4 > 0) || !((long)val12 > (long)val14 || (int)val4 <= 0 || val23 != (long)val4)) && phi15 == val14) {
                        break;
                    }
                }
            }
    }
    if ((long)val12 > (long)val14 || !(phi15 != val14 || !(!((long)val12 > (long)val14 || (int)val4 > 0) || !(val23 != (long)val4 || (long)val12 > (long)val14 || (int)val4 <= 0)))) {
        __kmpc_for_static_fini(&_loc_dummy, val10);
        return;
    }
}
void kernel_gemver_polly_subfn_4(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    double *val5;
    double *val6;
    double *val7;
    double *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long phi14;
    double phi15;
    unsigned long phi16;
    double val17;
    double val18;
    double val19;
    double call20;
    unsigned long val21;
    double *val22;
    double val23;
    val4 = *(unsigned int *)arg5;
    val5 = *(double **)(&arg5[8UL]);
    val6 = *(double **)(&arg5[16UL]);
    val7 = *(double **)(&arg5[24UL]);
    val8 = *(double **)(&arg5[32UL]);
    val9 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val10 = arg3 + 18446744073709551615UL;
    var1 = val10;
    __kmpc_for_static_init_8(&_loc_dummy_3, val9, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val11 = var0;
    val12 = var1;
    val13 = ((long)val12 > (long)val10 ? val10 : val12);
    var1 = val13;
    if ((long)val11 <= (long)val13) {
        phi14 = val11;
        while (1U)
            {
                if ((int)val4 > 0) {
                    val22 = &val5[phi14];
                    val23 = *val22;
                    phi16 = 0UL;
                    phi15 = val23;
                    do {
                        val17 = *val7;
                        val18 = (&val6[phi14])[phi16 * (unsigned long)val4];
                        val19 = val8[phi16];
                        call20 = llvm_fmuladd_f64(val17 * val18, val19, phi15);
                        *val22 = call20;
                        val21 = phi16 + 1UL;
                        phi16 = val21;
                        phi15 = call20;
                    } while (val21 != (long)val4);
                }
                if (!((long)val11 > (long)val13 || (int)val4 > 0) || !(val21 != (long)val4 || (long)val11 > (long)val13 || (int)val4 <= 0)) {
                    phi14 = phi14 + 1UL;
                    if ((!((long)val11 > (long)val13 || (int)val4 > 0) || !((long)val11 > (long)val13 || val21 != (long)val4 || (int)val4 <= 0)) && phi14 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi14 != val13 || !(!((long)val11 > (long)val13 || (int)val4 > 0) || !(val21 != (long)val4 || (long)val11 > (long)val13 || (int)val4 <= 0)))) {
        __kmpc_for_static_fini(&_loc_dummy_3, val9);
        return;
    }
}
void kernel_gemver_polly_subfn_7(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    double *val4;
    double *val5;
    unsigned int val6;
    unsigned long val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long phi11;
    double *val12;
    double val13;
    double val14;
    val4 = *(double **)(&arg5[8UL]);
    val5 = *(double **)(&arg5[16UL]);
    val6 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val7 = arg3 + 18446744073709551615UL;
    var1 = val7;
    __kmpc_for_static_init_8(&_loc_dummy_6, val6, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val8 = var0;
    val9 = var1;
    val10 = ((long)val9 > (long)val7 ? val7 : val9);
    var1 = val10;
    if ((long)val8 <= (long)val10) {
        phi11 = val8;
        do {
            val12 = &val4[phi11];
            val13 = *val12;
            val14 = val5[phi11];
            *val12 = val13 + val14;
            phi11 = phi11 + 1UL;
        } while (phi11 != val10);
    }
    if ((long)val8 > (long)val10 || phi11 == val10) {
        __kmpc_for_static_fini(&_loc_dummy_6, val6);
        return;
    }
}
void kernel_gemver_polly_subfn_10(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    double *val5;
    double *val6;
    double *val7;
    double *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long phi14;
    double phi15;
    unsigned long phi16;
    double val17;
    double val18;
    double val19;
    double call20;
    unsigned long val21;
    double *val22;
    double val23;
    val4 = *(unsigned int *)arg5;
    val5 = *(double **)(&arg5[8UL]);
    val6 = *(double **)(&arg5[16UL]);
    val7 = *(double **)(&arg5[24UL]);
    val8 = *(double **)(&arg5[32UL]);
    val9 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val10 = arg3 + 18446744073709551615UL;
    var1 = val10;
    __kmpc_for_static_init_8(&_loc_dummy_9, val9, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val11 = var0;
    val12 = var1;
    val13 = ((long)val12 > (long)val10 ? val10 : val12);
    var1 = val13;
    if ((long)val11 <= (long)val13) {
        phi14 = val11;
        while (1U)
            {
                if ((int)val4 > 0) {
                    val22 = &val5[phi14];
                    val23 = *val22;
                    phi16 = 0UL;
                    phi15 = val23;
                    do {
                        val17 = *val7;
                        val18 = (&val6[phi14 * (unsigned long)val4])[phi16];
                        val19 = val8[phi16];
                        call20 = llvm_fmuladd_f64(val17 * val18, val19, phi15);
                        *val22 = call20;
                        val21 = phi16 + 1UL;
                        phi16 = val21;
                        phi15 = call20;
                    } while (val21 != (long)val4);
                }
                if (!((long)val11 > (long)val13 || (int)val4 > 0) || !(val21 != (long)val4 || (int)val4 <= 0 || (long)val11 > (long)val13)) {
                    phi14 = phi14 + 1UL;
                    if (phi14 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi14 != val13 || !(!((long)val11 > (long)val13 || (int)val4 > 0) || !(val21 != (long)val4 || (long)val11 > (long)val13 || (int)val4 <= 0)))) {
        __kmpc_for_static_fini(&_loc_dummy_9, val9);
        return;
    }
}
