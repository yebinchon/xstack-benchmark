unsigned int main(unsigned int arg0, unsigned char **arg1) {
    unsigned char *val2;
    unsigned long call3;
    unsigned char *call4;
    unsigned char *call5;
    unsigned char *call6;
    unsigned long phi7;
    unsigned long val8;
    unsigned long phi9;
    struct struct__IO_FILE *val10;
    double val11;
    unsigned int call12;
    struct struct__IO_FILE *val13;
    unsigned int call14;
    unsigned long val15;
    unsigned long val16;
    struct struct__IO_FILE *val17;
    unsigned int call18;
    unsigned long val19;
    unsigned long val20;
    unsigned long phi21;
    double phi22;
    double phi23;
    unsigned long phi24;
    unsigned long val25;
    double *val26;
    double val27;
    double val28;
    double val29;
    double *val30;
    double val31;
    double val32;
    unsigned long val33;
    unsigned long phi34;
    unsigned long val35;
    double val36;
    double val37;
    unsigned long phi38;
    unsigned long val39;
    double *val40;
    double val41;
    double val42;
    unsigned long val43;
    unsigned long val44;
    unsigned long phi45;
    unsigned long val46;
    double *val47;
    double val48;
    double val49;
    double val50;
    double val51;
    double *val52;
    double val53;
    unsigned long val54;
    unsigned long phi55;
    unsigned long val56;
    unsigned long phi57;
    unsigned long val58;
    double *val59;
    double val60;
    double val61;
    unsigned long val62;
    unsigned long val63;
    unsigned long phi64;
    unsigned long val65;
    double *val66;
    double val67;
    double val68;
    double val69;
    double call70;
    double val71;
    unsigned long val72;
    unsigned long phi73;
    unsigned long val74;
    val2 = arg1[1UL];
    call3 = strtol(val2, (void *)0U, 10U);
    call4 = malloc(33554432UL);
    call5 = malloc(33554432UL);
    call6 = malloc(33554432UL);
    phi21 = 0UL;
    while (1U)
        {
            phi34 = 0UL;
            do {
                val35 = phi34 << 14UL;
                val36 = *(double *)(&call6[val35]);
                val37 = *(double *)(&call4[val35]);
                phi24 = 0UL;
                phi23 = val36;
                phi22 = val37;
                do {
                    val25 = phi24 << 3UL;
                    val26 = (double *)(&(&(&call4[8UL])[val35])[val25]);
                    val27 = *val26;
                    val28 = *(double *)(&(&(&call5[8UL])[val35])[val25]);
                    val29 = val27 - phi22 * val28 / phi23;
                    *val26 = val29;
                    val30 = (double *)(&(&(&call6[8UL])[val35])[val25]);
                    val31 = *val30;
                    val32 = val31 - val28 * val28 / phi23;
                    *val30 = val32;
                    val33 = phi24 + 1UL;
                    phi24 = val33;
                    phi23 = val32;
                    phi22 = val29;
                } while (val33 != 2047UL);
                val20 = phi34 + 1UL;
                phi34 = val20;
            } while (val20 != 2048UL);
            if (val33 == 2047UL) {
                phi38 = 0UL;
                do {
                    val39 = phi38 << 14UL;
                    val40 = (double *)(&(&call4[16376UL])[val39]);
                    val41 = *val40;
                    val42 = *(double *)(&(&call6[16376UL])[val39]);
                    *val40 = val41 / val42;
                    val43 = phi38 + 1UL;
                    phi38 = val43;
                } while (val43 != 2048UL);
                phi55 = 0UL;
                do {
                    val56 = phi55 << 14UL;
                    phi45 = 0UL;
                    do {
                        val46 = phi45 << 3UL;
                        val47 = (double *)(&(&(&call4[16384UL])[val56])[val46]);
                        val48 = *val47;
                        val49 = *(double *)(&(&call4[val56])[val46]);
                        val50 = *(double *)(&(&(&call5[16384UL])[val56])[val46]);
                        val51 = *(double *)(&(&call6[val56])[val46]);
                        *val47 = val48 - val49 * val50 / val51;
                        val52 = (double *)(&(&(&call6[16384UL])[val56])[val46]);
                        val53 = *val52;
                        *val52 = val53 - val50 * val50 / val51;
                        val54 = phi45 + 1UL;
                        phi45 = val54;
                    } while (val54 != 2048UL);
                    val44 = phi55 + 1UL;
                    phi55 = val44;
                } while (val44 != 2047UL);
                if (val54 == 2048UL) {
                    phi57 = 0UL;
                    do {
                        val58 = phi57 << 3UL;
                        val59 = (double *)(&(&call4[33538048UL])[val58]);
                        val60 = *val59;
                        val61 = *(double *)(&(&call6[33538048UL])[val58]);
                        *val59 = val60 / val61;
                        val62 = phi57 + 1UL;
                        phi57 = val62;
                    } while (val62 != 2048UL);
                    phi73 = 0UL;
                    do {
                        val74 = phi73 * 18446744073709535232UL;
                        phi64 = 0UL;
                        do {
                            val65 = phi64 << 3UL;
                            val66 = (double *)(&(&(&call4[33521664UL])[val74])[val65]);
                            val67 = *val66;
                            val68 = *(double *)(&(&(&call4[33505280UL])[val74])[val65]);
                            val69 = *(double *)(&(&(&call5[33505280UL])[val74])[val65]);
                            call70 = llvm_fmuladd_f64(-val68, val69, val67);
                            val71 = *(double *)(&(&(&call6[33521664UL])[val74])[val65]);
                            *val66 = call70 / val71;
                            val72 = phi64 + 1UL;
                            phi64 = val72;
                        } while (val72 != 2048UL);
                        val63 = phi73 + 1UL;
                        phi73 = val63;
                    } while (val63 != 2046UL);
                    if (val72 == 2048UL) {
                        val19 = phi21 + 1UL;
                        phi21 = val19;
                        if (val19 == 50UL) {
                            break;
                        }
                    }
                }
            }
        }
    if (val33 == 2047UL && val20 == 2048UL && val43 == 2048UL && val54 == 2048UL && val44 == 2047UL && val62 == 2048UL && val72 == 2048UL && val63 == 2046UL && val19 == 50UL) {
        if ((unsigned int)call3 == 1U) {
            phi7 = 0UL;
            while (1U)
                {
                    val8 = phi7 << 11UL;
                    phi9 = 0UL;
                    while (1U)
                        {
                            val10 = stderr;
                            val11 = (&((double *)call4)[val8])[phi9];
                            call12 = fprintf(val10, "%0.2lf ", val11);
                            if ((unsigned int)(phi9 + val8) % 20U == 0U) {
                                val13 = stderr;
                                call14 = fputc(10U, val13);
                            }
                            if (val19 == 50UL && val63 == 2046UL && val72 == 2048UL && val62 == 2048UL && val44 == 2047UL && val54 == 2048UL && val43 == 2048UL && val33 == 2047UL && val20 == 2048UL) {
                                val15 = phi9 + 1UL;
                                phi9 = val15;
                                if (val15 == 2048UL) {
                                    break;
                                }
                            }
                        }
                    if (val19 == 50UL && val63 == 2046UL && val72 == 2048UL && val62 == 2048UL && val44 == 2047UL && val54 == 2048UL && val43 == 2048UL && val33 == 2047UL && val20 == 2048UL && val15 == 2048UL) {
                        val16 = phi7 + 1UL;
                        phi7 = val16;
                        if (val16 == 2048UL) {
                            break;
                        }
                    }
                }
            if (val19 == 50UL && val63 == 2046UL && val72 == 2048UL && val62 == 2048UL && val44 == 2047UL && val54 == 2048UL && val43 == 2048UL && val33 == 2047UL && val20 == 2048UL && val15 == 2048UL && val16 == 2048UL) {
                val17 = stderr;
                call18 = fputc(10U, val17);
            }
        }
        if (!(val20 != 2048UL || val33 != 2047UL || val43 != 2048UL || val54 != 2048UL || val44 != 2047UL || val62 != 2048UL || val72 != 2048UL || val63 != 2046UL || (unsigned int)call3 == 1U || val19 != 50UL) || !(val16 != 2048UL || val15 != 2048UL || val20 != 2048UL || val33 != 2047UL || val43 != 2048UL || val54 != 2048UL || val44 != 2047UL || val62 != 2048UL || val72 != 2048UL || val63 != 2046UL || (unsigned int)call3 != 1U || val19 != 50UL)) {
            free(call4);
            free(call5);
            free(call6);
            return 0U;
        }
    }
}
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
