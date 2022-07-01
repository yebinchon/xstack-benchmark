void main_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned char *val4;
    unsigned char *val5;
    unsigned char *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    unsigned int val13;
    unsigned long val14;
    unsigned long val15;
    unsigned long phi16;
    unsigned long val17;
    double val18;
    val4 = *(unsigned char **)arg5;
    val5 = *(unsigned char **)(&arg5[8UL]);
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
        phi16 = val9;
        do {
            val17 = phi16 * 32000UL;
            val18 = (unsigned int)phi16;
            phi12 = 0UL;
            do {
                val13 = phi12;
                val14 = phi12 << 3UL;
                *(double *)(&(&val6[val17])[val14]) = val18 * (double)(val13 + 1U) / 4000.;
                *(double *)(&(&val4[val17])[val14]) = val18 * (double)(val13 + 2U) / 4000.;
                *(double *)(&(&val5[val17])[val14]) = val18 * (double)(val13 + 3U) / 4000.;
                val15 = phi12 + 1UL;
                phi12 = val15;
            } while (val15 != 4000UL);
            phi16 = phi16 + 1UL;
        } while (phi16 != val11);
    }
    if ((long)val9 > (long)val11 || !(phi16 != val11 || (long)val9 > (long)val11 || val15 != 4000UL)) {
        __kmpc_for_static_fini(&_loc_dummy, val7);
        return;
    }
}
void main_polly_subfn_4(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned char *val4;
    unsigned char *val5;
    unsigned int val6;
    unsigned long val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long phi11;
    unsigned long val12;
    double *val13;
    double val14;
    double val15;
    double val16;
    double call17;
    unsigned long val18;
    unsigned long phi19;
    unsigned long val20;
    val4 = *(unsigned char **)(&arg5[8UL]);
    val5 = *(unsigned char **)(&arg5[16UL]);
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
        phi19 = val8;
        do {
            val20 = phi19 * 32000UL;
            phi11 = 0UL;
            do {
                val12 = phi11 << 3UL;
                val13 = (double *)(&(&(&val4[32000UL])[val20])[val12]);
                val14 = *val13;
                val15 = *(double *)(&(&(&val5[32000UL])[val20])[val12]);
                val16 = *(double *)(&(&val5[val20])[val12]);
                call17 = llvm_fmuladd_f64(val15 - val16, -0.5, val14);
                *val13 = call17;
                val18 = phi11 + 1UL;
                phi11 = val18;
            } while (val18 != 4000UL);
            phi19 = phi19 + 1UL;
        } while (phi19 != val10);
    }
    if ((long)val8 > (long)val10 || !(phi19 != val10 || (long)val8 > (long)val10 || val18 != 4000UL)) {
        __kmpc_for_static_fini(&_loc_dummy_3, val6);
        return;
    }
}
