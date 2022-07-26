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
    unsigned char *call15;
    unsigned long val16;
    unsigned long phi17;
    unsigned long phi18;
    struct struct__IO_FILE *val19;
    double val20;
    unsigned int call21;
    struct struct__IO_FILE *val22;
    unsigned int call23;
    unsigned long val24;
    unsigned long val25;
    struct struct__IO_FILE *val26;
    unsigned int call27;
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
    call15 = malloc(call11 * val13 & 34359738360UL);
    val16 = call8 & 4294967295UL;
    var4 = val9;
    if ((unsigned int)call6 == 1U) {
        phi17 = 0UL;
        do {
            phi18 = 0UL;
            do {
                val19 = stderr;
                val20 = (&((double *)call14)[phi17 * val16])[phi18];
                call21 = fprintf(val19, "%0.2lf ", val20);
                if ((int)((unsigned int)phi17 * val9 + (unsigned int)phi18) % 20 == 0U) {
                    val22 = stderr;
                    call23 = fputc(10U, val22);
                }
                val24 = phi18 + 1UL;
                phi18 = val24;
            } while (val24 != val16);
            val25 = phi17 + 1UL;
            phi17 = val25;
        } while (val25 != val16);
        if (val24 == val16) {
            val26 = stderr;
            call27 = fputc(10U, val26);
        }
    }
    if ((unsigned int)call6 != 1U || !(val25 != val16 || (unsigned int)call6 != 1U || val24 != val16)) {
        free(call14);
        free(call15);
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
    val5 = *(double **)(&arg5[16UL]);
    val6 = *(unsigned char **)(&arg5[24UL]);
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
                        *(double *)(&(&val6[phi12 * (val4 << 3UL & 34359738360UL)])[phi13 << 3UL]) = (double)(unsigned int)phi12 * (double)(unsigned int)phi13 / val14;
                        val15 = phi13 + 1UL;
                        phi13 = val15;
                    } while (val15 != val4);
                }
                if (!((long)val9 > (long)val11 || (long)val4 > 0L) || !(val15 != val4 || (long)val9 > (long)val11 || (long)val4 <= 0L)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (long)val4 > 0L) || !(val15 != val4 || (long)val4 <= 0L || (long)val9 > (long)val11)) && phi12 == val11) {
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
                    if ((!((long)val8 > (long)val10 || (long)val4 > 0L) || !(val15 != val4 || (long)val8 > (long)val10 || (long)val4 <= 0L)) && phi11 == val10) {
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
    unsigned int val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long phi14;
    unsigned long val15;
    unsigned long phi16;
    double phi17;
    unsigned long phi18;
    unsigned long val19;
    double val20;
    double val21;
    double call22;
    unsigned long val23;
    double *val24;
    double val25;
    val4 = *(unsigned long *)arg5;
    val5 = *(unsigned long *)(&arg5[8UL]);
    val6 = *(double **)(&arg5[16UL]);
    val7 = *(unsigned char **)(&arg5[24UL]);
    val8 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val9 = arg3 + 18446744073709551615UL;
    var1 = val9;
    __kmpc_for_static_init_8(&_loc_dummy_9, val8, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val10 = var0;
    val11 = var1;
    val12 = ((long)val11 > (long)val9 ? val9 : val11);
    var1 = val12;
    if ((long)val10 <= (long)val12) {
        val13 = val4 << 3UL & 34359738360UL;
        phi14 = val10;
        while (1U)
            {
                if ((long)val5 > 0L) {
                    phi16 = 0UL;
                    while (1U)
                        {
                            if ((long)val4 > 0L) {
                                val24 = &val6[phi16 + phi14 * (val5 & 4294967295UL)];
                                val25 = *val24;
                                phi18 = 0UL;
                                phi17 = val25;
                                do {
                                    val19 = phi18 << 3UL;
                                    val20 = *(double *)(&(&val7[phi14 * val13])[val19]);
                                    val21 = *(double *)(&(&val7[phi16 * val13])[val19]);
                                    call22 = llvm_fmuladd_f64(val20 * 32412., val21, phi17);
                                    val23 = phi18 + 1UL;
                                    phi18 = val23;
                                    phi17 = call22;
                                } while (val23 != val4);
                                *val24 = call22;
                            }
                            if (!((long)val10 > (long)val12 || (long)val4 > 0L) || !(val23 != val4 || (long)val4 <= 0L || (long)val10 > (long)val12)) {
                                val15 = phi16 + 1UL;
                                phi16 = val15;
                                if ((!((long)val10 > (long)val12 || (long)val4 > 0L) || !((long)val4 <= 0L || val23 != val4 || (long)val10 > (long)val12)) && val15 == val5) {
                                    break;
                                }
                            }
                        }
                }
                if (!((long)val10 > (long)val12 || (long)val5 > 0L) || !(val15 != val5 || !(!((long)val4 > 0L || (long)val10 > (long)val12 || (long)val5 <= 0L) || !(val23 != val4 || (long)val4 <= 0L || (long)val10 > (long)val12 || (long)val5 <= 0L)))) {
                    phi14 = phi14 + 1UL;
                    if ((!((long)val10 > (long)val12 || (long)val5 > 0L) || !(val15 != val5 || !(!((long)val5 <= 0L || (long)val10 > (long)val12 || (long)val4 > 0L) || !((long)val4 <= 0L || val23 != val4 || (long)val5 <= 0L || (long)val10 > (long)val12)))) && phi14 == val12) {
                        break;
                    }
                }
            }
    }
    if ((long)val10 > (long)val12 || !(phi14 != val12 || !(!((long)val10 > (long)val12 || (long)val5 > 0L) || !(val15 != val5 || !(!((long)val4 > 0L || (long)val10 > (long)val12 || (long)val5 <= 0L) || !(val23 != val4 || (long)val4 <= 0L || (long)val10 > (long)val12 || (long)val5 <= 0L)))))) {
        __kmpc_for_static_fini(&_loc_dummy_9, val8);
        return;
    }
}
