void main_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned char *val4;
    unsigned char *val5;
    unsigned char *val6;
    unsigned char *val7;
    unsigned char *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long phi14;
    unsigned long val15;
    unsigned long phi16;
    double val17;
    unsigned long val18;
    val4 = *(unsigned char **)arg5;
    val5 = *(unsigned char **)(&arg5[8UL]);
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
        phi16 = val11;
        do {
            val17 = (unsigned int)phi16;
            val18 = phi16 << 3UL;
            *(double *)(&val5[val18]) = val17 / 4000.;
            *(double *)(&val6[val18]) = (val17 + 1.) / 4000.;
            *(double *)(&val7[val18]) = (val17 + 3.) / 4000.;
            *(double *)(&val8[val18]) = (val17 + 4.) / 4000.;
            phi14 = 0UL;
            do {
                *(double *)(&(&val4[phi16 * 32000UL])[phi14 << 3UL]) = val17 * (double)(unsigned int)phi14 / 4000.;
                val15 = phi14 + 1UL;
                phi14 = val15;
            } while (val15 != 4000UL);
            phi16 = phi16 + 1UL;
        } while (phi16 != val13);
    }
    if ((long)val11 > (long)val13 || !(phi16 != val13 || (long)val11 > (long)val13 || val15 != 4000UL)) {
        __kmpc_for_static_fini(&_loc_dummy, val9);
        return;
    }
}
void main_polly_subfn_4(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    double *val4;
    unsigned char *val5;
    unsigned char *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    double phi12;
    unsigned long phi13;
    unsigned long val14;
    double val15;
    double val16;
    double call17;
    unsigned long val18;
    unsigned long phi19;
    double *val20;
    double val21;
    val4 = *(double **)arg5;
    val5 = *(unsigned char **)(&arg5[8UL]);
    val6 = *(unsigned char **)(&arg5[16UL]);
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
        phi19 = val9;
        do {
            val20 = &val4[phi19];
            val21 = *val20;
            phi13 = 0UL;
            phi12 = val21;
            do {
                val14 = phi13 << 3UL;
                val15 = *(double *)(&(&val5[phi19 * 32000UL])[val14]);
                val16 = *(double *)(&val6[val14]);
                call17 = llvm_fmuladd_f64(val15, val16, phi12);
                val18 = phi13 + 1UL;
                phi13 = val18;
                phi12 = call17;
            } while (val18 != 4000UL);
            *val20 = call17;
            phi19 = phi19 + 1UL;
        } while (phi19 != val11);
    }
    if ((long)val9 > (long)val11 || !(phi19 != val11 || (long)val9 > (long)val11 || val18 != 4000UL)) {
        __kmpc_for_static_fini(&_loc_dummy_3, val7);
        return;
    }
}
void main_polly_subfn_7(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    double *val4;
    unsigned char *val5;
    unsigned char *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    double phi12;
    unsigned long phi13;
    double val14;
    double val15;
    double call16;
    unsigned long val17;
    unsigned long phi18;
    double *val19;
    double val20;
    val4 = *(double **)arg5;
    val5 = *(unsigned char **)(&arg5[8UL]);
    val6 = *(unsigned char **)(&arg5[16UL]);
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
        phi18 = val9;
        do {
            val19 = &val4[phi18];
            val20 = *val19;
            phi13 = 0UL;
            phi12 = val20;
            do {
                val14 = *(double *)(&(&val5[phi18 << 3UL])[phi13 * 32000UL]);
                val15 = *(double *)(&val6[phi13 << 3UL]);
                call16 = llvm_fmuladd_f64(val14, val15, phi12);
                val17 = phi13 + 1UL;
                phi13 = val17;
                phi12 = call16;
            } while (val17 != 4000UL);
            *val19 = call16;
            phi18 = phi18 + 1UL;
        } while (phi18 != val11);
    }
    if ((long)val9 > (long)val11 || !(phi18 != val11 || (long)val9 > (long)val11 || val17 != 4000UL)) {
        __kmpc_for_static_fini(&_loc_dummy_6, val7);
        return;
    }
}
