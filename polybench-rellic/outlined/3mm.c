void main_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned long val4;
    double *val5;
    unsigned char *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    unsigned long phi13;
    double val14;
    unsigned long val15;
    val4 = *(unsigned long *)arg5;
    val5 = *(double **)(&arg5[40UL]);
    val6 = *(unsigned char **)(&arg5[48UL]);
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
                if ((long)val4 > 0L) {
                    phi13 = 0UL;
                    do {
                        val14 = *val5;
                        *(double *)(&(&val6[phi12 * (val4 << 3UL & 34359738360UL)])[phi13 << 3UL]) = (double)(unsigned int)phi12 * (double)((unsigned int)phi13 + 2U) / val14;
                        val15 = phi13 + 1UL;
                        phi13 = val15;
                    } while (val15 != val4);
                }
                if (!((long)val9 > (long)val11 || (long)val4 > 0L) || !(val15 != val4 || (long)val9 > (long)val11 || (long)val4 <= 0L)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (long)val4 > 0L) || !((long)val9 > (long)val11 || (long)val4 <= 0L || val15 != val4)) && phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (long)val4 > 0L) || !(val15 != val4 || (long)val9 > (long)val11 || (long)val4 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy, val7);
        return;
    }
}
void main_polly_subfn_4(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned long val4;
    unsigned long val5;
    double *val6;
    unsigned char *val7;
    unsigned char *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long val14;
    unsigned long phi15;
    unsigned long val16;
    unsigned long phi17;
    double *val18;
    double phi19;
    unsigned long phi20;
    double val21;
    double val22;
    double call23;
    unsigned long val24;
    val4 = *(unsigned long *)(&arg5[24UL]);
    val5 = *(unsigned long *)(&arg5[32UL]);
    val6 = *(double **)(&arg5[40UL]);
    val7 = *(unsigned char **)(&arg5[48UL]);
    val8 = *(unsigned char **)(&arg5[56UL]);
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
        val14 = val4 & 4294967295UL;
        phi15 = val11;
        while (1U)
            {
                if ((long)val4 > 0L) {
                    phi17 = 0UL;
                    while (1U)
                        {
                            val18 = &val6[phi17 + phi15 * val14];
                            *val18 = 0.;
                            if ((long)val5 > 0L) {
                                phi20 = 0UL;
                                phi19 = 0.;
                                do {
                                    val21 = *(double *)(&(&val7[phi15 * (val5 << 3UL & 34359738360UL)])[phi20 << 3UL]);
                                    val22 = *(double *)(&(&val8[phi17 << 3UL])[(val14 << 3UL) * phi20]);
                                    call23 = llvm_fmuladd_f64(val21, val22, phi19);
                                    val24 = phi20 + 1UL;
                                    phi20 = val24;
                                    phi19 = call23;
                                } while (val24 != val5);
                                *val18 = call23;
                            }
                            if (!((long)val5 > 0L || (long)val11 > (long)val13) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13)) {
                                val16 = phi17 + 1UL;
                                phi17 = val16;
                                if ((!((long)val5 > 0L || (long)val11 > (long)val13) || !((long)val5 <= 0L || val24 != val5 || (long)val11 > (long)val13)) && val16 == val4) {
                                    break;
                                }
                            }
                        }
                }
                if (!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val5 > 0L || (long)val11 > (long)val13 || (long)val4 <= 0L) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13 || (long)val4 <= 0L)))) {
                    phi15 = phi15 + 1UL;
                    if ((!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val4 <= 0L || (long)val5 > 0L || (long)val11 > (long)val13) || !((long)val4 <= 0L || (long)val5 <= 0L || val24 != val5 || (long)val11 > (long)val13)))) && phi15 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi15 != val13 || !(!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val5 > 0L || (long)val11 > (long)val13 || (long)val4 <= 0L) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13 || (long)val4 <= 0L)))))) {
        __kmpc_for_static_fini(&_loc_dummy_3, val9);
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
    double *val6;
    unsigned char *val7;
    unsigned char *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long val14;
    unsigned long phi15;
    unsigned long val16;
    unsigned long phi17;
    double *val18;
    double phi19;
    unsigned long phi20;
    double val21;
    double val22;
    double call23;
    unsigned long val24;
    val4 = *(unsigned long *)arg5;
    val5 = *(unsigned long *)(&arg5[8UL]);
    val6 = *(double **)(&arg5[40UL]);
    val7 = *(unsigned char **)(&arg5[48UL]);
    val8 = *(unsigned char **)(&arg5[56UL]);
    val9 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val10 = arg3 + 18446744073709551615UL;
    var1 = val10;
    __kmpc_for_static_init_8(&_loc_dummy_6, val9, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val11 = var0;
    val12 = var1;
    val13 = ((long)val12 > (long)val10 ? val10 : val12);
    var1 = val13;
    if ((long)val11 <= (long)val13) {
        val14 = val4 & 4294967295UL;
        phi15 = val11;
        while (1U)
            {
                if ((long)val4 > 0L) {
                    phi17 = 0UL;
                    while (1U)
                        {
                            val18 = &val6[phi17 + phi15 * val14];
                            *val18 = 0.;
                            if ((long)val5 > 0L) {
                                phi20 = 0UL;
                                phi19 = 0.;
                                do {
                                    val21 = *(double *)(&(&val7[phi15 * (val5 << 3UL & 34359738360UL)])[phi20 << 3UL]);
                                    val22 = *(double *)(&(&val8[phi17 << 3UL])[(val14 << 3UL) * phi20]);
                                    call23 = llvm_fmuladd_f64(val21, val22, phi19);
                                    val24 = phi20 + 1UL;
                                    phi20 = val24;
                                    phi19 = call23;
                                } while (val24 != val5);
                                *val18 = call23;
                            }
                            if (!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13)) {
                                val16 = phi17 + 1UL;
                                phi17 = val16;
                                if ((!((long)val11 > (long)val13 || (long)val5 > 0L) || !((long)val11 > (long)val13 || val24 != val5 || (long)val5 <= 0L)) && val16 == val4) {
                                    break;
                                }
                            }
                        }
                }
                if (!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val5 > 0L || (long)val11 > (long)val13 || (long)val4 <= 0L) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13 || (long)val4 <= 0L)))) {
                    phi15 = phi15 + 1UL;
                    if ((!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val4 <= 0L || (long)val11 > (long)val13 || (long)val5 > 0L) || !((long)val4 <= 0L || (long)val11 > (long)val13 || val24 != val5 || (long)val5 <= 0L)))) && phi15 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi15 != val13 || !(!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val5 > 0L || (long)val11 > (long)val13 || (long)val4 <= 0L) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13 || (long)val4 <= 0L)))))) {
        __kmpc_for_static_fini(&_loc_dummy_6, val9);
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
    unsigned char *val7;
    unsigned char *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long val14;
    unsigned long val15;
    double *val16;
    unsigned long phi17;
    unsigned long phi18;
    unsigned long val19;
    unsigned long val20;
    unsigned long val21;
    double phi22;
    unsigned long phi23;
    double val24;
    double val25;
    double call26;
    unsigned long val27;
    double *val28;
    double val29;
    val4 = *(unsigned long *)arg5;
    val5 = *(unsigned long *)(&arg5[8UL]);
    val6 = *(unsigned char **)(&arg5[40UL]);
    val7 = *(unsigned char **)(&arg5[48UL]);
    val8 = *(unsigned char **)(&arg5[56UL]);
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
        val14 = val5 & 4294967295UL;
        val15 = val14 << 3UL;
        val16 = (double *)val6;
        phi17 = val11;
        while (1U)
            {
                if ((long)val5 > 0L) {
                    val21 = phi17 * val14;
                    phi18 = 0UL;
                    while (1U)
                        {
                            val19 = phi18 << 3UL;
                            *(double *)(&(&val6[phi17 * val15])[val19]) = 0.;
                            if ((long)val4 > 0L) {
                                val16[phi18 + val21] = 0.;
                                val28 = &val16[phi18 + val21];
                                val29 = *val28;
                                phi23 = 0UL;
                                phi22 = val29;
                                do {
                                    val24 = *(double *)(&(&val7[phi17 * (val4 << 3UL & 34359738360UL)])[phi23 << 3UL]);
                                    val25 = *(double *)(&(&val8[val19])[phi23 * val15]);
                                    call26 = llvm_fmuladd_f64(val24, val25, phi22);
                                    val27 = phi23 + 1UL;
                                    phi23 = val27;
                                    phi22 = call26;
                                } while (val27 != val4);
                                *val28 = call26;
                            }
                            if (!((long)val4 > 0L || (long)val11 > (long)val13) || !(val27 != val4 || (long)val11 > (long)val13 || (long)val4 <= 0L)) {
                                val20 = phi18 + 1UL;
                                phi18 = val20;
                                if ((!((long)val4 > 0L || (long)val11 > (long)val13) || !((long)val11 > (long)val13 || val27 != val4 || (long)val4 <= 0L)) && val20 == val5) {
                                    break;
                                }
                            }
                        }
                }
                if (!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val20 != val5 || !(!((long)val4 > 0L || (long)val11 > (long)val13 || (long)val5 <= 0L) || !(val27 != val4 || (long)val4 <= 0L || (long)val11 > (long)val13 || (long)val5 <= 0L)))) {
                    phi17 = phi17 + 1UL;
                    if ((!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val20 != val5 || !(!((long)val4 > 0L || (long)val11 > (long)val13 || (long)val5 <= 0L) || !((long)val11 > (long)val13 || (long)val5 <= 0L || val27 != val4 || (long)val4 <= 0L)))) && phi17 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi17 != val13 || !(!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val20 != val5 || !(!((long)val4 > 0L || (long)val11 > (long)val13 || (long)val5 <= 0L) || !(val27 != val4 || (long)val4 <= 0L || (long)val11 > (long)val13 || (long)val5 <= 0L)))))) {
        __kmpc_for_static_fini(&_loc_dummy_9, val9);
        return;
    }
}
