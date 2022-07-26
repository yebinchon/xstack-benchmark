unsigned int main(unsigned int arg0, unsigned char **arg1) {
    struct literal_struct_0 var0;
    unsigned char *val1;
    unsigned long call2;
    unsigned char *val3;
    unsigned long call4;
    unsigned int val5;
    unsigned char *val6;
    unsigned long call7;
    unsigned int val8;
    unsigned char *val9;
    unsigned long call10;
    unsigned int val11;
    unsigned long val12;
    unsigned long val13;
    unsigned char *call14;
    double *val15;
    unsigned char *call16;
    unsigned char *call17;
    unsigned long val18;
    unsigned long val19;
    unsigned char val20;
    unsigned long phi21;
    unsigned char val22;
    unsigned long phi23;
    unsigned long phi24;
    double call25;
    unsigned long val26;
    unsigned long val27;
    unsigned long val28;
    unsigned long phi29;
    unsigned long phi30;
    unsigned long val31;
    unsigned long val32;
    unsigned char *val33;
    unsigned long phi34;
    unsigned long phi35;
    unsigned long phi36;
    struct struct__IO_FILE *val37;
    double val38;
    unsigned int call39;
    struct struct__IO_FILE *val40;
    unsigned int call41;
    unsigned long val42;
    unsigned long val43;
    unsigned long val44;
    struct struct__IO_FILE *val45;
    unsigned int call46;
    val1 = arg1[1UL];
    call2 = strtol(val1, (void *)0U, 10U);
    val3 = arg1[2UL];
    call4 = strtol(val3, (void *)0U, 10U);
    val5 = call4;
    val6 = arg1[3UL];
    call7 = strtol(val6, (void *)0U, 10U);
    val8 = call7;
    val9 = arg1[4UL];
    call10 = strtol(val9, (void *)0U, 10U);
    val11 = call10;
    val12 = call4 << 32UL;
    val13 = (long)(val12 * call7 * call10) >> 29UL;
    call14 = malloc(val13);
    val15 = (double *)call14;
    call16 = malloc(val13);
    call17 = malloc((call10 << 3UL) * call10 & 34359738360UL);
    val18 = call7 & 4294967295UL;
    val19 = call10 & 4294967295UL;
    val20 = (int)val5 > 0;
    if (val20) {
        phi21 = 0UL;
        while (1U)
            {
                if ((int)val8 > 0) {
                    phi23 = 0UL;
                    while (1U)
                        {
                            if ((int)val11 > 0) {
                                phi24 = 0UL;
                                do {
                                    call25 = llvm_fmuladd_f64((double)(unsigned int)phi21, (double)(unsigned int)phi23, (double)(unsigned int)phi24);
                                    (&(&val15[val19 * val18 * phi21])[phi23 * val19])[phi24] = call25 / (double)val11;
                                    val26 = phi24 + 1UL;
                                    phi24 = val26;
                                } while (val26 != val19);
                            }
                            if ((int)val11 <= 0 || !(val26 != val19 || (int)val11 <= 0)) {
                                val27 = phi23 + 1UL;
                                phi23 = val27;
                                if (val27 == val18) {
                                    break;
                                }
                            }
                        }
                }
                if ((int)val8 <= 0 || !(val27 != val18 || !(!((int)val11 > 0 || (int)val8 <= 0) || !(val26 != val19 || (int)val11 <= 0 || (int)val8 <= 0)))) {
                    val28 = phi21 + 1UL;
                    phi21 = val28;
                    if (((int)val8 <= 0 || !(val27 != val18 || !(!((int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || (int)val8 <= 0 || (int)val11 <= 0)))) && val28 == (call4 & 4294967295UL)) {
                        break;
                    }
                }
            }
    }
    if (!val20 || !(val28 != (call4 & 4294967295UL) || !(!(!val20 || (int)val8 > 0) || !(val27 != val18 || !(!((int)val11 > 0 || !val20 || (int)val8 <= 0) || !(val26 != val19 || (int)val11 <= 0 || !val20 || (int)val8 <= 0)))))) {
        val22 = (int)val11 > 0;
        if (val22) {
            phi29 = 0UL;
            while (1U)
                {
                    phi30 = 0UL;
                    do {
                        (&((double *)call17)[phi29 * val19])[phi30] = (double)(unsigned int)phi29 * (double)(unsigned int)phi30 / (double)val11;
                        val31 = phi30 + 1UL;
                        phi30 = val31;
                    } while (!((!val20 || !(val28 != (call4 & 4294967295UL) || !(!((int)val8 > 0 || !val20) || !(val27 != val18 || !(!(!val20 || (int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val8 <= 0 || (int)val11 <= 0)))))) && val31 == val19));
                    if (val31 == val19) {
                        val32 = phi29 + 1UL;
                        phi29 = val32;
                        if ((!val20 || !(val28 != (call4 & 4294967295UL) || !(!((int)val8 > 0 || !val20) || !(val27 != val18 || !(!(!val20 || (int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val8 <= 0 || (int)val11 <= 0)))))) && val32 == val19) {
                            break;
                        }
                    }
                }
        }
        if (!val22 || !(val32 != val19 || !val22 || val31 != val19)) {
            val33 = (unsigned char *)(&var0);
            var0.field0 = val5;
            var0.field1 = val8;
            var0.field2 = val11;
            *(unsigned char **)(&var0.field3) = call16;
            *(unsigned char **)(&var0.field4) = call14;
            *(unsigned char **)(&var0.field5) = call17;
            if ((!val22 || !(val31 != val19 || !val22 || val32 != val19)) && (unsigned int)call2 == 1U) {
                if (val20) {
                    phi34 = 0UL;
                    while (1U)
                        {
                            if ((int)val8 > 0) {
                                phi35 = 0UL;
                                while (1U)
                                    {
                                        if (val22) {
                                            phi36 = 0UL;
                                            while (1U)
                                                {
                                                    val37 = stderr;
                                                    val38 = (&(&val15[val19 * val18 * phi34])[phi35 * val19])[phi36];
                                                    call39 = fprintf(val37, "%0.2lf ", val38);
                                                    if ((unsigned int)phi34 % 20U == 0U) {
                                                        val40 = stderr;
                                                        call41 = fputc(10U, val40);
                                                    }
                                                    if (!(!(!(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)phi34 % 20U == 0U || !val22 || (unsigned int)call2 != 1U || !val20) || !(!(!(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)phi34 % 20U != 0U || !val22 || (unsigned int)call2 != 1U || !val20)) {
                                                        val42 = phi36 + 1UL;
                                                        phi36 = val42;
                                                        if ((!(!val22 || (unsigned int)call2 != 1U || !val20 || (unsigned int)phi34 % 20U == 0U || !(!(val32 != val19 || val31 != val19 || !val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!(val27 != val18 || !(!(!val20 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val11 <= 0))))))))) || !(!val22 || (unsigned int)call2 != 1U || !val20 || (unsigned int)phi34 % 20U != 0U || !(!(val32 != val19 || val31 != val19 || !val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!(val27 != val18 || !(!(!val20 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val11 <= 0)))))))))) && val42 == val19) {
                                                            break;
                                                        }
                                                    }
                                                }
                                        }
                                        if (!(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || !val20 || (unsigned int)call2 != 1U || val22) || !(val42 != val19 || !(!(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)phi34 % 20U == 0U || !val20 || (unsigned int)call2 != 1U || !val22) || !(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)phi34 % 20U != 0U || !val20 || (unsigned int)call2 != 1U || !val22)))) {
                                            val43 = phi35 + 1UL;
                                            phi35 = val43;
                                            if ((!(val22 || (unsigned int)call2 != 1U || !val20 || !(!(val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!(val27 != val18 || !(!(!val20 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val11 <= 0))))))) || !(val32 != val19 || val31 != val19 || !val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!(val27 != val18 || !(!(!val20 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val11 <= 0))))))))) || !(val42 != val19 || !(!(!val22 || (unsigned int)call2 != 1U || !val20 || (unsigned int)phi34 % 20U == 0U || !(!(val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!(val27 != val18 || !(!(!val20 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val11 <= 0))))))) || !(val32 != val19 || val31 != val19 || !val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!(val27 != val18 || !(!(!val20 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val11 <= 0))))))))) || !(!val22 || (unsigned int)call2 != 1U || !val20 || (unsigned int)phi34 % 20U != 0U || !(!(val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!(val27 != val18 || !(!(!val20 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val11 <= 0))))))) || !(val32 != val19 || val31 != val19 || !val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!(val27 != val18 || !(!(!val20 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val11 <= 0)))))))))))) && val43 == val18) {
                                                break;
                                            }
                                        }
                                    }
                            }
                            if (!(val43 != val18 || !(!(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || !val20 || (unsigned int)call2 != 1U || val22 || (int)val8 <= 0) || !(val42 != val19 || !(!(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)phi34 % 20U == 0U || !val20 || (unsigned int)call2 != 1U || !val22 || (int)val8 <= 0) || !(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)phi34 % 20U != 0U || !val20 || (unsigned int)call2 != 1U || !val22 || (int)val8 <= 0))))) || !(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || !val20 || (int)val8 > 0 || (unsigned int)call2 != 1U)) {
                                val44 = phi34 + 1UL;
                                phi34 = val44;
                                if ((!(val43 != val18 || !(!(val22 || (int)val8 <= 0 || (unsigned int)call2 != 1U || !val20 || !(!(val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!((int)val8 > 0 || !val20) || !(val27 != val18 || !(!(!val20 || (int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val8 <= 0 || (int)val11 <= 0))))))) || !(val32 != val19 || val31 != val19 || !val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!((int)val8 > 0 || !val20) || !(val27 != val18 || !(!(!val20 || (int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val8 <= 0 || (int)val11 <= 0))))))))) || !(val42 != val19 || !(!(!val22 || (int)val8 <= 0 || (unsigned int)call2 != 1U || !val20 || (unsigned int)phi34 % 20U == 0U || !(!(val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!((int)val8 > 0 || !val20) || !(val27 != val18 || !(!(!val20 || (int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val8 <= 0 || (int)val11 <= 0))))))) || !(val32 != val19 || val31 != val19 || !val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!((int)val8 > 0 || !val20) || !(val27 != val18 || !(!(!val20 || (int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val8 <= 0 || (int)val11 <= 0))))))))) || !(!val22 || (int)val8 <= 0 || (unsigned int)call2 != 1U || !val20 || (unsigned int)phi34 % 20U != 0U || !(!(val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!((int)val8 > 0 || !val20) || !(val27 != val18 || !(!(!val20 || (int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val8 <= 0 || (int)val11 <= 0))))))) || !(val32 != val19 || val31 != val19 || !val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!((int)val8 > 0 || !val20) || !(val27 != val18 || !(!(!val20 || (int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val8 <= 0 || (int)val11 <= 0))))))))))))) || !((unsigned int)call2 != 1U || !val20 || (int)val8 > 0 || !(!(val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!((int)val8 > 0 || !val20) || !(val27 != val18 || !(!(!val20 || (int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val8 <= 0 || (int)val11 <= 0))))))) || !(val32 != val19 || val31 != val19 || !val22 || !(!val20 || !(val28 != (call4 & 4294967295UL) || !(!((int)val8 > 0 || !val20) || !(val27 != val18 || !(!(!val20 || (int)val8 <= 0 || (int)val11 > 0) || !(val26 != val19 || !val20 || (int)val8 <= 0 || (int)val11 <= 0)))))))))) && val44 == (call4 & 4294967295UL)) {
                                    break;
                                }
                            }
                        }
                }
                if (!(val44 != (call4 & 4294967295UL) || !(!(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (int)val8 > 0 || (unsigned int)call2 != 1U || !val20) || !(val43 != val18 || !(!(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || val22 || (int)val8 <= 0 || (unsigned int)call2 != 1U || !val20) || !(val42 != val19 || !(!(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)phi34 % 20U == 0U || !val22 || (int)val8 <= 0 || (unsigned int)call2 != 1U || !val20) || !(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)phi34 % 20U != 0U || !val22 || (int)val8 <= 0 || (unsigned int)call2 != 1U || !val20))))))) || !(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)call2 != 1U || val20)) {
                    val45 = stderr;
                    call46 = fputc(10U, val45);
                }
            }
            if (!((unsigned int)call2 == 1U || !(!val22 || !(val31 != val19 || !val22 || val32 != val19))) || !(val44 != (call4 & 4294967295UL) || !(!(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (int)val8 > 0 || (unsigned int)call2 != 1U || !val20) || !(val43 != val18 || !(!(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || val22 || (int)val8 <= 0 || (unsigned int)call2 != 1U || !val20) || !(val42 != val19 || !(!(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)phi34 % 20U == 0U || !val22 || (int)val8 <= 0 || (unsigned int)call2 != 1U || !val20) || !(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)phi34 % 20U != 0U || !val22 || (int)val8 <= 0 || (unsigned int)call2 != 1U || !val20))))))) || !(!(!val22 || !(val31 != val19 || !val22 || val32 != val19)) || (unsigned int)call2 != 1U || val20)) {
                free(call14);
                free(call16);
                free(call17);
                return 0U;
            }
        }
    }
}
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
