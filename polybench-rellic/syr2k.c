unsigned int main(unsigned int arg0, unsigned char **arg1) {
    double var4;
    unsigned char *val5;
    unsigned long call6;
    unsigned char *val7;
    unsigned long call8;
    unsigned int val9;
    unsigned char *val10;
    unsigned long call11;
    unsigned int val12;
    unsigned long val13;
    unsigned char *call14;
    unsigned long val15;
    unsigned char *call16;
    unsigned char *call17;
    unsigned long val18;
    unsigned long phi19;
    unsigned long phi20;
    struct struct__IO_FILE *val21;
    double val22;
    unsigned int call23;
    struct struct__IO_FILE *val24;
    unsigned int call25;
    unsigned long val26;
    unsigned long val27;
    struct struct__IO_FILE *val28;
    unsigned int call29;
    val5 = arg1[1UL];
    call6 = strtol(val5, (void *)0U, 10U);
    val7 = arg1[2UL];
    call8 = strtol(val7, (void *)0U, 10U);
    val9 = call8;
    val10 = arg1[3UL];
    call11 = strtol(val10, (void *)0U, 10U);
    val12 = call11;
    val13 = call8 << 3UL;
    call14 = malloc(val13 * call8 & 34359738360UL);
    val15 = call11 * val13 & 34359738360UL;
    call16 = malloc(val15);
    call17 = malloc(val15);
    val18 = call8 & 4294967295UL;
    var4 = val9;
    if ((unsigned int)call6 == 1U) {
        phi19 = 0UL;
        do {
            phi20 = 0UL;
            do {
                val21 = stderr;
                val22 = (&((double *)call14)[phi19 * val18])[phi20];
                call23 = fprintf(val21, "%0.2lf ", val22);
                if ((int)((unsigned int)phi19 * val9 + (unsigned int)phi20) % 20 == 0U) {
                    val24 = stderr;
                    call25 = fputc(10U, val24);
                }
                val26 = phi20 + 1UL;
                phi20 = val26;
            } while (val26 != val18);
            val27 = phi19 + 1UL;
            phi19 = val27;
        } while (val27 != val18);
        if (val26 == val18) {
            val28 = stderr;
            call29 = fputc(10U, val28);
        }
    }
    if ((unsigned int)call6 != 1U || !(val27 != val18 || (unsigned int)call6 != 1U || val26 != val18)) {
        free(call14);
        free(call16);
        free(call17);
        return 0U;
    }
}
void main_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned long val4;
    double *val5;
    unsigned char *val6;
    unsigned char *val7;
    unsigned int val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long phi13;
    unsigned long phi14;
    double val15;
    double val16;
    unsigned long val17;
    unsigned long val18;
    unsigned long val19;
    val4 = *(unsigned long *)arg5;
    val5 = *(double **)(&arg5[16UL]);
    val6 = *(unsigned char **)(&arg5[24UL]);
    val7 = *(unsigned char **)(&arg5[32UL]);
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
                    val19 = phi13 * (val4 << 3UL & 34359738360UL);
                    phi14 = 0UL;
                    do {
                        val15 = *val5;
                        val16 = (double)(unsigned int)phi13 * (double)(unsigned int)phi14 / val15;
                        val17 = phi14 << 3UL;
                        *(double *)(&(&val6[val19])[val17]) = val16;
                        *(double *)(&(&val7[val19])[val17]) = val16;
                        val18 = phi14 + 1UL;
                        phi14 = val18;
                    } while (val18 != val4);
                }
                if (!((long)val10 > (long)val12 || (long)val4 > 0L) || !(val18 != val4 || (long)val10 > (long)val12 || (long)val4 <= 0L)) {
                    phi13 = phi13 + 1UL;
                    if ((!((long)val10 > (long)val12 || (long)val4 > 0L) || !(val18 != val4 || (long)val4 <= 0L || (long)val10 > (long)val12)) && phi13 == val12) {
                        break;
                    }
                }
            }
    }
    if ((long)val10 > (long)val12 || !(phi13 != val12 || !(!((long)val10 > (long)val12 || (long)val4 > 0L) || !(val18 != val4 || (long)val10 > (long)val12 || (long)val4 <= 0L)))) {
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
    val4 = *(unsigned long *)(&arg5[8UL]);
    val5 = *(double **)(&arg5[16UL]);
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
        phi12 = val9;
        while (1U)
            {
                if ((long)val4 > 0L) {
                    phi13 = 0UL;
                    do {
                        val14 = *val5;
                        *(double *)(&(&val6[phi12 * (val4 << 3UL & 34359738360UL)])[phi13 << 3UL]) = (double)(unsigned int)phi12 * (double)(unsigned int)phi13 / val14;
                        val15 = phi13 + 1UL;
                        phi13 = val15;
                    } while (val15 != val4);
                }
                if (!((long)val9 > (long)val11 || (long)val4 > 0L) || !(val15 != val4 || (long)val9 > (long)val11 || (long)val4 <= 0L)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (long)val4 > 0L) || !((long)val4 <= 0L || (long)val9 > (long)val11 || val15 != val4)) && phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (long)val4 > 0L) || !(val15 != val4 || (long)val9 > (long)val11 || (long)val4 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy_3, val7);
        return;
    }
}
void main_polly_subfn_7(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
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
    double *val13;
    double val14;
    unsigned long val15;
    val4 = *(unsigned long *)(&arg5[8UL]);
    val5 = *(unsigned char **)(&arg5[16UL]);
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
        while (1U)
            {
                if ((long)val4 > 0L) {
                    phi12 = 0UL;
                    do {
                        val13 = (double *)(&(&val5[phi11 * (val4 << 3UL & 34359738360UL)])[phi12 << 3UL]);
                        val14 = *val13;
                        *val13 = val14 * 2123.;
                        val15 = phi12 + 1UL;
                        phi12 = val15;
                    } while (val15 != val4);
                }
                if (!((long)val8 > (long)val10 || (long)val4 > 0L) || !(val15 != val4 || (long)val8 > (long)val10 || (long)val4 <= 0L)) {
                    phi11 = phi11 + 1UL;
                    if ((!((long)val8 > (long)val10 || (long)val4 > 0L) || !((long)val4 <= 0L || (long)val8 > (long)val10 || val15 != val4)) && phi11 == val10) {
                        break;
                    }
                }
            }
    }
    if ((long)val8 > (long)val10 || !(phi11 != val10 || !(!((long)val8 > (long)val10 || (long)val4 > 0L) || !(val15 != val4 || (long)val8 > (long)val10 || (long)val4 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy_6, val6);
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
    unsigned long val17;
    unsigned long phi18;
    double phi19;
    unsigned long phi20;
    unsigned long val21;
    double val22;
    double val23;
    double call24;
    double val25;
    double val26;
    double call27;
    unsigned long val28;
    unsigned long val29;
    double *val30;
    double val31;
    val4 = *(unsigned long *)arg5;
    val5 = *(unsigned long *)(&arg5[8UL]);
    val6 = *(double **)(&arg5[16UL]);
    val7 = *(unsigned char **)(&arg5[24UL]);
    val8 = *(unsigned char **)(&arg5[32UL]);
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
        val14 = val4 << 3UL & 34359738360UL;
        phi15 = val11;
        while (1U)
            {
                if ((long)val5 > 0L) {
                    val17 = phi15 * val14;
                    phi18 = 0UL;
                    while (1U)
                        {
                            if ((long)val4 > 0L) {
                                val29 = phi18 * val14;
                                val30 = &val6[phi18 + phi15 * (val5 & 4294967295UL)];
                                val31 = *val30;
                                phi20 = 0UL;
                                phi19 = val31;
                                do {
                                    val21 = phi20 << 3UL;
                                    val22 = *(double *)(&(&val7[val17])[val21]);
                                    val23 = *(double *)(&(&val8[val29])[val21]);
                                    call24 = llvm_fmuladd_f64(val22 * 32412., val23, phi19);
                                    val25 = *(double *)(&(&val8[val17])[val21]);
                                    val26 = *(double *)(&(&val7[val29])[val21]);
                                    call27 = llvm_fmuladd_f64(val25 * 32412., val26, call24);
                                    val28 = phi20 + 1UL;
                                    phi20 = val28;
                                    phi19 = call27;
                                } while (val28 != val4);
                                *val30 = call27;
                            }
                            if (!((long)val4 > 0L || (long)val11 > (long)val13) || !(val28 != val4 || (long)val4 <= 0L || (long)val11 > (long)val13)) {
                                val16 = phi18 + 1UL;
                                phi18 = val16;
                                if ((!((long)val4 > 0L || (long)val11 > (long)val13) || !((long)val11 > (long)val13 || val28 != val4 || (long)val4 <= 0L)) && val16 == val5) {
                                    break;
                                }
                            }
                        }
                }
                if (!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val16 != val5 || !(!((long)val4 > 0L || (long)val11 > (long)val13 || (long)val5 <= 0L) || !(val28 != val4 || (long)val4 <= 0L || (long)val11 > (long)val13 || (long)val5 <= 0L)))) {
                    phi15 = phi15 + 1UL;
                    if ((!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val16 != val5 || !(!((long)val4 > 0L || (long)val5 <= 0L || (long)val11 > (long)val13) || !((long)val5 <= 0L || (long)val11 > (long)val13 || val28 != val4 || (long)val4 <= 0L)))) && phi15 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi15 != val13 || !(!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val16 != val5 || !(!((long)val4 > 0L || (long)val11 > (long)val13 || (long)val5 <= 0L) || !(val28 != val4 || (long)val4 <= 0L || (long)val11 > (long)val13 || (long)val5 <= 0L)))))) {
        __kmpc_for_static_fini(&_loc_dummy_9, val9);
        return;
    }
}
