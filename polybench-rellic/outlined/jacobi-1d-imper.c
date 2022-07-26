void kernel_jacobi_1d_imper_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
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
    double val12;
    double val13;
    double val14;
    val4 = *(double **)(&arg5[16UL]);
    val5 = *(double **)(&arg5[24UL]);
    val6 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val7 = arg3 + 18446744073709551615UL;
    var1 = val7;
    __kmpc_for_static_init_8(&_loc_dummy, val6, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val8 = var0;
    val9 = var1;
    val10 = ((long)val9 > (long)val7 ? val7 : val9);
    var1 = val10;
    if ((long)val8 <= (long)val10) {
        phi11 = val8;
        do {
            val12 = val4[phi11];
            val13 = (&val4[1UL])[phi11];
            val14 = (&val4[2UL])[phi11];
            (&val5[1UL])[phi11] = (val12 + val13 + val14) * 0.33333000000000002;
            phi11 = phi11 + 1UL;
        } while (phi11 != val10);
    }
    if ((long)val8 > (long)val10 || phi11 == val10) {
        __kmpc_for_static_fini(&_loc_dummy, val6);
        return;
    }
}
void kernel_jacobi_1d_imper_polly_subfn_4(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
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
    double val12;
    val4 = *(double **)(&arg5[16UL]);
    val5 = *(double **)(&arg5[24UL]);
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
        do {
            val12 = (&val4[1UL])[phi11];
            (&val5[1UL])[phi11] = val12;
            phi11 = phi11 + 1UL;
        } while (phi11 != val10);
    }
    if ((long)val8 > (long)val10 || phi11 == val10) {
        __kmpc_for_static_fini(&_loc_dummy_3, val6);
        return;
    }
}
