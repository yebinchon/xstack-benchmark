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
    double call14;
    unsigned long val15;
    double call16;
    double call17;
    unsigned long val18;
    unsigned long phi19;
    unsigned long val20;
    double val21;
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
        phi19 = val9;
        do {
            val20 = phi19 << 14UL;
            val21 = (unsigned int)phi19;
            phi12 = 0UL;
            do {
                val13 = phi12;
                call14 = llvm_fmuladd_f64(val21, (double)(val13 + 1U), 1.);
                val15 = phi12 << 3UL;
                *(double *)(&(&val6[val20])[val15]) = call14 * 4.8828125E-4;
                call16 = llvm_fmuladd_f64(val21, (double)(val13 + 2U), 2.);
                *(double *)(&(&val5[val20])[val15]) = call16 * 4.8828125E-4;
                call17 = llvm_fmuladd_f64(val21, (double)(val13 + 3U), 3.);
                *(double *)(&(&val4[val20])[val15]) = call17 * 4.8828125E-4;
                val18 = phi12 + 1UL;
                phi12 = val18;
            } while (val18 != 2048UL);
            phi19 = phi19 + 1UL;
        } while (phi19 != val11);
    }
    if ((long)val9 > (long)val11 || !(phi19 != val11 || (long)val9 > (long)val11 || val18 != 2048UL)) {
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
    unsigned char *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    unsigned long val13;
    double *val14;
    double val15;
    double val16;
    double val17;
    double call18;
    double val19;
    unsigned long val20;
    unsigned long phi21;
    unsigned long val22;
    val4 = *(unsigned char **)(&arg5[8UL]);
    val5 = *(unsigned char **)(&arg5[16UL]);
    val6 = *(unsigned char **)(&arg5[24UL]);
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
        phi21 = val9;
        do {
            val22 = phi21 << 14UL;
            phi12 = 0UL;
            do {
                val13 = phi12 * 18446744073709551608UL;
                val14 = (double *)(&(&(&val4[16368UL])[val22])[val13]);
                val15 = *val14;
                val16 = *(double *)(&(&(&val4[16360UL])[val22])[val13]);
                val17 = *(double *)(&(&(&val5[16360UL])[val22])[val13]);
                call18 = llvm_fmuladd_f64(-val16, val17, val15);
                val19 = *(double *)(&(&(&val6[16360UL])[val22])[val13]);
                *val14 = call18 / val19;
                val20 = phi12 + 1UL;
                phi12 = val20;
            } while (val20 != 2046UL);
            phi21 = phi21 + 1UL;
        } while (phi21 != val11);
    }
    if ((long)val9 > (long)val11 || !(phi21 != val11 || (long)val9 > (long)val11 || val20 != 2046UL)) {
        __kmpc_for_static_fini(&_loc_dummy_3, val7);
        return;
    }
}
