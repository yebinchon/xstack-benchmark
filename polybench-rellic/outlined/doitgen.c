void kernel_doitgen_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    unsigned int val5;
    unsigned char *val6;
    unsigned char *val7;
    double *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long phi14;
    unsigned long val15;
    unsigned long val16;
    unsigned long phi17;
    unsigned long val18;
    unsigned long phi19;
    unsigned long val20;
    unsigned long val21;
    unsigned char *val22;
    unsigned char *val23;
    double phi24;
    unsigned long phi25;
    double val26;
    double val27;
    double call28;
    unsigned long val29;
    unsigned long phi30;
    unsigned long val31;
    double val32;
    unsigned long val33;
    val4 = *(unsigned int *)(&arg5[4UL]);
    val5 = *(unsigned int *)(&arg5[8UL]);
    val6 = *(unsigned char **)(&arg5[16UL]);
    val7 = *(unsigned char **)(&arg5[24UL]);
    val8 = *(double **)(&arg5[32UL]);
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
        val15 = val5;
        val16 = (long)val5;
        phi14 = val11;
        while (1U)
            {
                if ((int)val4 > 0) {
                    phi17 = 0UL;
                    while (1U)
                        {
                            if ((int)val5 > 0) {
                                val21 = (phi17 + phi14 * (unsigned long)val4) * (val15 << 3UL);
                                val22 = &val6[val21];
                                val23 = &val7[val21];
                                phi19 = 0UL;
                                do {
                                    phi25 = 0UL;
                                    phi24 = 0.;
                                    do {
                                        val26 = *(double *)(&val23[phi25 << 3UL]);
                                        val27 = (&val8[phi19])[phi25 * val15];
                                        call28 = llvm_fmuladd_f64(val26, val27, phi24);
                                        val29 = phi25 + 1UL;
                                        phi25 = val29;
                                        phi24 = call28;
                                    } while (val29 != val16);
                                    *(double *)(&val22[phi19 << 3UL]) = call28;
                                    val20 = phi19 + 1UL;
                                    phi19 = val20;
                                } while (val20 != val16);
                                if (val29 == val16) {
                                    phi30 = 0UL;
                                    do {
                                        val31 = phi30 << 3UL;
                                        val32 = *(double *)(&val22[val31]);
                                        *(double *)(&val23[val31]) = val32;
                                        val33 = phi30 + 1UL;
                                        phi30 = val33;
                                    } while (val33 != val16);
                                }
                            }
                            if (!((int)val5 > 0 || (long)val11 > (long)val13) || !(val33 != val16 || val20 != val16 || val29 != val16 || (int)val5 <= 0 || (long)val11 > (long)val13)) {
                                val18 = phi17 + 1UL;
                                phi17 = val18;
                                if ((!((long)val11 > (long)val13 || (int)val5 > 0) || !((long)val11 > (long)val13 || val33 != val16 || val20 != val16 || (int)val5 <= 0 || val29 != val16)) && val18 == (long)val4) {
                                    break;
                                }
                            }
                        }
                }
                if (!((long)val11 > (long)val13 || (int)val4 > 0) || !(val18 != (long)val4 || !(!((int)val5 > 0 || (long)val11 > (long)val13 || (int)val4 <= 0) || !(val29 != val16 || val20 != val16 || val33 != val16 || (int)val5 <= 0 || (long)val11 > (long)val13 || (int)val4 <= 0)))) {
                    phi14 = phi14 + 1UL;
                    if ((!((long)val11 > (long)val13 || (int)val4 > 0) || !(val18 != (long)val4 || !(!((long)val11 > (long)val13 || (int)val5 > 0 || (int)val4 <= 0) || !((long)val11 > (long)val13 || val33 != val16 || val20 != val16 || (int)val5 <= 0 || val29 != val16 || (int)val4 <= 0)))) && phi14 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi14 != val13 || !(!((long)val11 > (long)val13 || (int)val4 > 0) || !(val18 != (long)val4 || !(!((int)val5 > 0 || (long)val11 > (long)val13 || (int)val4 <= 0) || !(val29 != val16 || val20 != val16 || val33 != val16 || (int)val5 <= 0 || (long)val11 > (long)val13 || (int)val4 <= 0)))))) {
        __kmpc_for_static_fini(&_loc_dummy, val9);
        return;
    }
}
