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
