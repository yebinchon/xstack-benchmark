unsigned int main(unsigned int arg0, unsigned char **arg1) {
    struct literal_struct_0 var0;
    struct literal_struct_0 var1;
    unsigned char *val2;
    unsigned long call3;
    unsigned char *val4;
    unsigned long call5;
    unsigned int val6;
    unsigned char *val7;
    unsigned long call8;
    unsigned int val9;
    unsigned long val10;
    unsigned char *call11;
    double *val12;
    unsigned char *call13;
    unsigned long val14;
    unsigned char val15;
    double val16;
    unsigned long phi17;
    double val18;
    unsigned long val19;
    unsigned long phi20;
    unsigned int val21;
    double call22;
    double call23;
    unsigned long val24;
    unsigned long val25;
    unsigned char *val26;
    unsigned char *val27;
    unsigned long phi29;
    unsigned long val30;
    unsigned long phi31;
    unsigned long phi32;
    struct struct__IO_FILE *val33;
    double val34;
    unsigned int call35;
    struct struct__IO_FILE *val36;
    unsigned int call37;
    unsigned long val38;
    unsigned long val39;
    struct struct__IO_FILE *val40;
    unsigned int call41;
    val2 = arg1[1UL];
    call3 = strtol(val2, (void *)0U, 10U);
    val4 = arg1[2UL];
    call5 = strtol(val4, (void *)0U, 10U);
    val6 = call5;
    val7 = arg1[3UL];
    call8 = strtol(val7, (void *)0U, 10U);
    val9 = call8;
    val10 = (call5 << 3UL) * call5 & 34359738360UL;
    call11 = malloc(val10);
    val12 = (double *)call11;
    call13 = malloc(val10);
    val14 = call5 & 4294967295UL;
    val15 = (int)val6 > 0;
    if (val15) {
        val16 = val6;
        phi17 = 0UL;
        do {
            val18 = (unsigned int)phi17;
            val19 = phi17 * val14;
            phi20 = 0UL;
            do {
                val21 = phi20;
                call22 = llvm_fmuladd_f64(val18, (double)(val21 + 2U), 2.);
                (&val12[val19])[phi20] = call22 / val16;
                call23 = llvm_fmuladd_f64(val18, (double)(val21 + 3U), 3.);
                (&((double *)call13)[val19])[phi20] = call23 / val16;
                val24 = phi20 + 1UL;
                phi20 = val24;
            } while (val24 != val14);
            val25 = phi17 + 1UL;
            phi17 = val25;
        } while (val25 != val14);
    }
    if (!val15 || !(val25 != val14 || !val15 || val24 != val14)) {
        val26 = (unsigned char *)(&var0);
        val27 = (unsigned char *)(&var1);
        if ((int)val6 > -1) {
            if ((int)val9 > 0) {
                phi29 = 0UL;
                do {
                    var1.field0 = val9;
                    var1.field1 = val6;
                    var1.field2 = phi29;
                    *(unsigned char **)(&var1.field3) = call11;
                    *(unsigned char **)(&var1.field4) = call13;
                    var0.field0 = val9;
                    var0.field1 = val6;
                    var0.field2 = phi29;
                    *(unsigned char **)(&var0.field3) = call13;
                    *(unsigned char **)(&var0.field4) = call11;
                    val30 = phi29 + 1UL;
                    phi29 = val30;
                } while (!((!val15 || !(val24 != val14 || val25 != val14 || !val15)) && val30 == (long)(call8 << 32UL) >> 32UL));
            }
        }
        if (!((int)val9 > 0 || (int)val6 <= -1) || (int)val6 <= -1 || !(val30 != (long)(call8 << 32UL) >> 32UL || (int)val9 <= 0 || (int)val6 <= -1)) {
            if ((!((int)val9 > 0 || (int)val6 <= -1) || !(val30 != (long)(call8 << 32UL) >> 32UL || (int)val9 <= 0 || (int)val6 <= -1) || (int)val6 <= -1) && (unsigned int)call3 == 1U) {
                if ((!((int)val6 <= -1 || (int)val9 > 0) || (int)val6 <= -1 || !(val30 != (long)(call8 << 32UL) >> 32UL || (int)val6 <= -1 || (int)val9 <= 0)) && (unsigned int)call3 == 1U && val15) {
                    phi31 = 0UL;
                    if ((!((int)val6 <= -1 || val30 != (long)(call8 << 32UL) >> 32UL || (int)val9 <= 0) || !((int)val9 > 0 || (int)val6 <= -1) || (int)val6 <= -1) && (unsigned int)call3 == 1U && val15) {
                        while (1U)
                            {
                                phi32 = 0UL;
                                if ((!((int)val9 <= 0 || (int)val6 <= -1 || val30 != (long)(call8 << 32UL) >> 32UL) || !((int)val9 > 0 || (int)val6 <= -1) || (int)val6 <= -1) && (unsigned int)call3 == 1U && val15) {
                                    while (1U)
                                        {
                                            val33 = stderr;
                                            val34 = (&val12[phi31 * val14])[phi32];
                                            call35 = fprintf(val33, "%0.2lf ", val34);
                                            if ((int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 == 0U) {
                                                val36 = stderr;
                                                call37 = fputc(10U, val36);
                                            }
                                            if (!((unsigned int)call3 != 1U || !val15 || (int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 != 0U || !(!((int)val9 <= 0 || (int)val6 <= -1 || val30 != (long)(call8 << 32UL) >> 32UL) || !((int)val9 > 0 || (int)val6 <= -1) || (int)val6 <= -1)) || !(!(!((int)val6 <= -1 || (int)val9 > 0) || (int)val6 <= -1 || !((int)val9 <= 0 || (int)val6 <= -1 || val30 != (long)(call8 << 32UL) >> 32UL)) || (int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 == 0U || (unsigned int)call3 != 1U || !val15)) {
                                                val38 = phi32 + 1UL;
                                                phi32 = val38;
                                                if ((!((int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 != 0U || !val15 || (unsigned int)call3 != 1U || !(!(val30 != (long)(call8 << 32UL) >> 32UL || (int)val9 <= 0 || (int)val6 <= -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15))) || !((int)val9 > 0 || (int)val6 <= -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15))) || !((int)val6 > -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15))))) || !(!val15 || (int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 == 0U || (unsigned int)call3 != 1U || !(!(val30 != (long)(call8 << 32UL) >> 32UL || (int)val9 <= 0 || (int)val6 <= -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15))) || !((int)val9 > 0 || (int)val6 <= -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15))) || !((int)val6 > -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15)))))) && val38 == val14) {
                                                    break;
                                                }
                                            }
                                        }
                                    if ((!((unsigned int)call3 != 1U || !(!((int)val9 <= 0 || (int)val6 <= -1 || val30 != (long)(call8 << 32UL) >> 32UL) || !((int)val9 > 0 || (int)val6 <= -1) || (int)val6 <= -1) || !val15 || (int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 == 0U) || !(!(!((int)val6 <= -1 || (int)val9 > 0) || (int)val6 <= -1 || !((int)val9 <= 0 || (int)val6 <= -1 || val30 != (long)(call8 << 32UL) >> 32UL)) || (unsigned int)call3 != 1U || !val15 || (int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 != 0U)) && val38 == val14) {
                                        val39 = phi31 + 1UL;
                                        phi31 = val39;
                                        if ((!(!val15 || (int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 == 0U || (unsigned int)call3 != 1U || !(!(val30 != (long)(call8 << 32UL) >> 32UL || (int)val9 <= 0 || (int)val6 <= -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15))) || !((int)val9 > 0 || (int)val6 <= -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15))) || !((int)val6 > -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15))))) || !((int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 != 0U || !val15 || (unsigned int)call3 != 1U || !(!(val30 != (long)(call8 << 32UL) >> 32UL || (int)val9 <= 0 || (int)val6 <= -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15))) || !((int)val9 > 0 || (int)val6 <= -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15))) || !((int)val6 > -1 || !(!val15 || !(val24 != val14 || val25 != val14 || !val15)))))) && val38 == val14 && val39 == val14) {
                                            break;
                                        }
                                    }
                                }
                            }
                    }
                }
                if (!(val15 || (unsigned int)call3 != 1U || !(!((int)val9 > 0 || (int)val6 <= -1) || !((int)val6 <= -1 || val30 != (long)(call8 << 32UL) >> 32UL || (int)val9 <= 0) || (int)val6 <= -1)) || !(!(!(!((int)val6 <= -1 || !((int)val6 <= -1 || val30 != (long)(call8 << 32UL) >> 32UL || (int)val9 <= 0) || !((int)val9 > 0 || (int)val6 <= -1)) || (int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 == 0U || (unsigned int)call3 != 1U || !val15) || !(!((int)val6 <= -1 || !((int)val6 <= -1 || val30 != (long)(call8 << 32UL) >> 32UL || (int)val9 <= 0) || !((int)val9 > 0 || (int)val6 <= -1)) || (int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 != 0U || (unsigned int)call3 != 1U || !val15)) || val38 != val14 || val39 != val14)) {
                    val40 = stderr;
                    call41 = fputc(10U, val40);
                }
            }
            if (!((unsigned int)call3 == 1U || !(!(val30 != (long)(call8 << 32UL) >> 32UL || (int)val6 <= -1 || (int)val9 <= 0) || (int)val6 <= -1 || !((int)val6 <= -1 || (int)val9 > 0))) || !(!(!(!(!(val30 != (long)(call8 << 32UL) >> 32UL || (int)val6 <= -1 || (int)val9 <= 0) || (int)val6 <= -1 || !((int)val6 <= -1 || (int)val9 > 0)) || (unsigned int)call3 != 1U || !val15 || (int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 == 0U) || !(!(!(val30 != (long)(call8 << 32UL) >> 32UL || (int)val6 <= -1 || (int)val9 <= 0) || (int)val6 <= -1 || !((int)val6 <= -1 || (int)val9 > 0)) || (unsigned int)call3 != 1U || !val15 || (int)((unsigned int)phi31 * val6 + (unsigned int)phi32) % 20 != 0U)) || val39 != val14 || val38 != val14) || !(!(!(val30 != (long)(call8 << 32UL) >> 32UL || (int)val6 <= -1 || (int)val9 <= 0) || (int)val6 <= -1 || !((int)val6 <= -1 || (int)val9 > 0)) || val15 || (unsigned int)call3 != 1U)) {
                free(call11);
                free(call13);
                return 0U;
            }
        }
    }
}
void kernel_jacobi_2d_imper_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    double *val5;
    double *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    double *val13;
    unsigned char *val14;
    unsigned long val15;
    unsigned long phi16;
    unsigned long val17;
    double val18;
    double val19;
    double val20;
    double val21;
    double val22;
    unsigned long val23;
    unsigned long val24;
    unsigned long val25;
    val4 = *(unsigned int *)(&arg5[4UL]);
    val5 = *(double **)(&arg5[16UL]);
    val6 = *(double **)(&arg5[24UL]);
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
        val13 = &val5[1UL];
        val14 = (unsigned char *)val13;
        val15 = val4;
        phi12 = val9;
        while (1U)
            {
                if ((int)val4 > 2) {
                    val24 = phi12 << 3UL;
                    val25 = (val24 + 8UL) * val15;
                    phi16 = 0UL;
                    do {
                        val17 = phi16 << 3UL;
                        val18 = *(double *)(&(&val14[val25])[val17]);
                        val19 = *(double *)(&(&((unsigned char *)val5)[val25])[val17]);
                        val20 = *(double *)(&(&((unsigned char *)(&val5[2UL]))[val25])[val17]);
                        val21 = *(double *)(&(&val14[(val24 + 16UL) * val15])[val17]);
                        val22 = (&val13[phi12 * val15])[phi16];
                        *(double *)(&(&((unsigned char *)(&val6[1UL]))[val25])[val17]) = (val18 + val19 + val20 + val21 + val22) * 0.20000000000000001;
                        val23 = phi16 + 1UL;
                        phi16 = val23;
                    } while (val23 != (long)val4 + 18446744073709551614UL);
                }
                if (!(val23 != (long)val4 + 18446744073709551614UL || (int)val4 <= 2 || (long)val9 > (long)val11) || !((long)val9 > (long)val11 || (int)val4 > 2)) {
                    phi12 = phi12 + 1UL;
                    if (phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || val23 != (long)val4 + 18446744073709551614UL || (int)val4 <= 2) || !((int)val4 > 2 || (long)val9 > (long)val11)))) {
        __kmpc_for_static_fini(&_loc_dummy, val7);
        return;
    }
}
void kernel_jacobi_2d_imper_polly_subfn_4(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    double *val5;
    double *val6;
    unsigned int val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long phi12;
    unsigned long phi13;
    unsigned long val14;
    double val15;
    unsigned long val16;
    unsigned long val17;
    val4 = *(unsigned int *)(&arg5[4UL]);
    val5 = *(double **)(&arg5[16UL]);
    val6 = *(double **)(&arg5[24UL]);
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
                if ((int)val4 > 2) {
                    val17 = ((phi12 << 3UL) + 8UL) * (unsigned long)val4;
                    phi13 = 0UL;
                    do {
                        val14 = phi13 << 3UL;
                        val15 = *(double *)(&(&((unsigned char *)(&val5[1UL]))[val17])[val14]);
                        *(double *)(&(&((unsigned char *)(&val6[1UL]))[val17])[val14]) = val15;
                        val16 = phi13 + 1UL;
                        phi13 = val16;
                    } while (val16 != (long)val4 + 18446744073709551614UL);
                }
                if (!((long)val9 > (long)val11 || (int)val4 > 2) || !(val16 != (long)val4 + 18446744073709551614UL || (long)val9 > (long)val11 || (int)val4 <= 2)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (int)val4 > 2) || !((long)val9 > (long)val11 || val16 != (long)val4 + 18446744073709551614UL || (int)val4 <= 2)) && phi12 == val11) {
                        break;
                    }
                }
            }
    }
    if ((long)val9 > (long)val11 || !(phi12 != val11 || !(!((long)val9 > (long)val11 || (int)val4 > 2) || !(val16 != (long)val4 + 18446744073709551614UL || (long)val9 > (long)val11 || (int)val4 <= 2)))) {
        __kmpc_for_static_fini(&_loc_dummy_3, val7);
        return;
    }
}
