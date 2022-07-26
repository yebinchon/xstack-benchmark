unsigned int main(unsigned int arg0, unsigned char **arg1) {
    struct literal_struct_0 var0;
    double var1;
    double var2;
    struct literal_struct_1 var3;
    struct literal_struct_1 var4;
    struct literal_struct_1 var5;
    unsigned char *val6;
    unsigned long call7;
    unsigned char *val8;
    unsigned long call9;
    unsigned int val10;
    unsigned char *val11;
    unsigned long call12;
    unsigned int val13;
    unsigned char *val14;
    unsigned long call15;
    unsigned int val16;
    unsigned long val17;
    unsigned char *call18;
    double *val19;
    unsigned char *call20;
    double *val21;
    unsigned char *call22;
    double *val23;
    unsigned char *val24;
    unsigned char *val25;
    unsigned char *val26;
    unsigned long val27;
    unsigned long val28;
    double val29;
    unsigned long phi30;
    unsigned long phi31;
    unsigned long val32;
    unsigned long val33;
    unsigned long val34;
    unsigned long phi35;
    unsigned long phi36;
    unsigned long val37;
    unsigned long val38;
    unsigned long phi39;
    unsigned long phi40;
    unsigned long val41;
    unsigned long val42;
    unsigned long phi43;
    unsigned long phi44;
    double *val45;
    double val46;
    double phi47;
    unsigned long phi48;
    double val49;
    double val50;
    double call51;
    unsigned long val52;
    unsigned long val53;
    unsigned long val54;
    unsigned long val55;
    unsigned long val56;
    unsigned long phi57;
    unsigned long phi58;
    struct struct__IO_FILE *val59;
    double val60;
    unsigned int call61;
    struct struct__IO_FILE *val62;
    unsigned int call63;
    unsigned long val64;
    unsigned long val65;
    struct struct__IO_FILE *val66;
    unsigned int call67;
    val6 = arg1[1UL];
    call7 = strtol(val6, (void *)0U, 10U);
    val8 = arg1[2UL];
    call9 = strtol(val8, (void *)0U, 10U);
    val10 = call9;
    val11 = arg1[3UL];
    call12 = strtol(val11, (void *)0U, 10U);
    val13 = call12;
    val14 = arg1[4UL];
    call15 = strtol(val14, (void *)0U, 10U);
    val16 = call15;
    val17 = call9 << 3UL;
    call18 = malloc(val17 * call12 & 34359738360UL);
    val19 = (double *)call18;
    call20 = malloc(val17 * call15 & 34359738360UL);
    val21 = (double *)call20;
    call22 = malloc((call12 << 3UL) * call15 & 34359738360UL);
    val23 = (double *)call22;
    val24 = (unsigned char *)(&var3);
    val25 = (unsigned char *)(&var4);
    val26 = (unsigned char *)(&var5);
    if (((call15 | call12) & 2147483648UL) != 0UL) {
        val27 = call12 & 4294967295UL;
        val28 = call9 & 4294967295UL;
        val29 = val10;
        phi30 = 0UL;
        do {
            phi31 = 0UL;
            do {
                (&val19[phi30 * val27])[phi31] = (double)(unsigned int)phi30 * (double)(unsigned int)phi31 / val29;
                val32 = phi31 + 1UL;
                phi31 = val32;
            } while (val32 != val27);
            val33 = phi30 + 1UL;
            phi30 = val33;
        } while (val33 != val28);
        if (val32 == val27) {
            val34 = call15 & 4294967295UL;
            phi35 = 0UL;
            do {
                phi36 = 0UL;
                do {
                    (&val21[phi35 * val34])[phi36] = (double)(unsigned int)phi35 * (double)(unsigned int)phi36 / val29;
                    val37 = phi36 + 1UL;
                    phi36 = val37;
                } while (val37 != val34);
                val38 = phi35 + 1UL;
                phi35 = val38;
            } while (val38 != val28);
            if (val37 == val34) {
                phi39 = 0UL;
                do {
                    phi40 = 0UL;
                    do {
                        (&val23[phi39 * val27])[phi40] = (double)(unsigned int)phi39 * (double)(unsigned int)phi40 / val29;
                        val41 = phi40 + 1UL;
                        phi40 = val41;
                    } while (val41 != val27);
                    val42 = phi39 + 1UL;
                    phi39 = val42;
                } while (val42 != val34);
                if (val41 == val27) {
                    phi43 = 0UL;
                    while (1U)
                        {
                            phi44 = 0UL;
                            do {
                                val45 = &(&val19[phi43 * val27])[phi44];
                                val46 = *val45;
                                phi48 = 0UL;
                                phi47 = val46 * 2123.;
                                do {
                                    val49 = (&val21[phi43 * val34])[phi48];
                                    val50 = (&val23[phi44])[phi48 * val27];
                                    call51 = llvm_fmuladd_f64(val49 * 32412., val50, phi47);
                                    val52 = phi48 + 1UL;
                                    phi48 = val52;
                                    phi47 = call51;
                                } while (val52 != val34);
                                *val45 = call51;
                                val53 = phi44 + 1UL;
                                phi44 = val53;
                            } while (val53 != val27);
                            if (val52 == val34) {
                                val54 = phi43 + 1UL;
                                phi43 = val54;
                                if (val54 == val28) {
                                    break;
                                }
                            }
                        }
                }
            }
        }
    } else {
        var5.field0 = val10;
        var5.field1 = val13;
        var5.field2 = val16;
        *(unsigned char **)(&var5.field3) = call18;
        val55 = (call9 + 4294967295UL & 4294967295UL) + 1UL;
        __kmpc_fork_call(&_loc_dummy, 4U, (void (*)(unsigned int *, unsigned int *, ...))(&init_array_polly_subfn), 0UL, val55, 1UL, &var5);
        var4.field0 = val10;
        var4.field1 = val13;
        var4.field2 = val16;
        *(unsigned char **)(&var4.field3) = call20;
        __kmpc_fork_call(&_loc_dummy_3, 4U, (void (*)(unsigned int *, unsigned int *, ...))(&init_array_polly_subfn_4), 0UL, val55, 1UL, &var4);
        var3.field0 = val10;
        var3.field1 = val13;
        var3.field2 = val16;
        *(unsigned char **)(&var3.field3) = call22;
        __kmpc_fork_call(&_loc_dummy_6, 4U, (void (*)(unsigned int *, unsigned int *, ...))(&init_array_polly_subfn_7), 0UL, (call15 + 4294967295UL & 4294967295UL) + 1UL, 1UL, &var3);
        var1 = 2123.;
        var2 = 32412.;
        var0.field0 = val10;
        var0.field1 = val13;
        var0.field2 = val16;
        *(unsigned char **)(&var0.field3) = call20;
        var0.field4 = &var2;
        *(unsigned char **)(&var0.field5) = call22;
        *(unsigned char **)(&var0.field6) = call18;
        var0.field7 = &var1;
        __kmpc_fork_call(&_loc_dummy_9, 4U, (void (*)(unsigned int *, unsigned int *, ...))(&kernel_gemm_polly_subfn), 0UL, val55, 1UL, &var0);
    }
    if (((call15 | call12) & 2147483648UL) == 0UL || !(val54 != val28 || val53 != val27 || val52 != val34 || val42 != val34 || val41 != val27 || val38 != val28 || val37 != val34 || val33 != val28 || ((call15 | call12) & 2147483648UL) == 0UL || val32 != val27)) {
        if ((((call15 | call12) & 2147483648UL) == 0UL || !(val37 != val34 || val38 != val28 || val53 != val27 || val54 != val28 || val41 != val27 || val52 != val34 || val32 != val27 || val42 != val34 || ((call15 | call12) & 2147483648UL) == 0UL || val33 != val28)) && (unsigned int)call7 == 1U) {
            val56 = call12 & 4294967295UL;
            phi57 = 0UL;
            while (1U)
                {
                    phi58 = 0UL;
                    while (1U)
                        {
                            val59 = stderr;
                            val60 = (&val19[phi57 * val56])[phi58];
                            call61 = fprintf(val59, "%0.2lf ", val60);
                            if ((int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 == 0U) {
                                val62 = stderr;
                                call63 = fputc(10U, val62);
                            }
                            if (!(!(((call15 | call12) & 2147483648UL) == 0UL || !(val37 != val34 || val38 != val28 || val53 != val27 || val54 != val28 || val41 != val27 || val52 != val34 || val32 != val27 || val42 != val34 || ((call15 | call12) & 2147483648UL) == 0UL || val33 != val28)) || (int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 != 0U || (unsigned int)call7 != 1U) || !(!(((call15 | call12) & 2147483648UL) == 0UL || !(val37 != val34 || val38 != val28 || val53 != val27 || val54 != val28 || val41 != val27 || val52 != val34 || val32 != val27 || val42 != val34 || ((call15 | call12) & 2147483648UL) == 0UL || val33 != val28)) || (unsigned int)call7 != 1U || (int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 == 0U)) {
                                val64 = phi58 + 1UL;
                                phi58 = val64;
                                if ((!((int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 != 0U || !(((call15 | call12) & 2147483648UL) == 0UL || !(((call15 | call12) & 2147483648UL) == 0UL || val33 != val28 || val42 != val34 || val32 != val27 || val52 != val34 || val41 != val27 || val54 != val28 || val53 != val27 || val38 != val28 || val37 != val34)) || (unsigned int)call7 != 1U) || !((int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 == 0U || !(((call15 | call12) & 2147483648UL) == 0UL || !(((call15 | call12) & 2147483648UL) == 0UL || val33 != val28 || val42 != val34 || val32 != val27 || val52 != val34 || val41 != val27 || val54 != val28 || val53 != val27 || val38 != val28 || val37 != val34)) || (unsigned int)call7 != 1U)) && val64 == val56) {
                                    break;
                                }
                            }
                        }
                    if ((!(!(((call15 | call12) & 2147483648UL) == 0UL || !(val37 != val34 || val38 != val28 || val53 != val27 || val54 != val28 || val41 != val27 || val52 != val34 || val32 != val27 || val42 != val34 || ((call15 | call12) & 2147483648UL) == 0UL || val33 != val28)) || (int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 != 0U || (unsigned int)call7 != 1U) || !(!(((call15 | call12) & 2147483648UL) == 0UL || !(val37 != val34 || val38 != val28 || val53 != val27 || val54 != val28 || val41 != val27 || val52 != val34 || val32 != val27 || val42 != val34 || ((call15 | call12) & 2147483648UL) == 0UL || val33 != val28)) || (int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 == 0U || (unsigned int)call7 != 1U)) && val64 == val56) {
                        val65 = phi57 + 1UL;
                        phi57 = val65;
                        if ((!((int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 != 0U || !(((call15 | call12) & 2147483648UL) == 0UL || !(((call15 | call12) & 2147483648UL) == 0UL || val33 != val28 || val42 != val34 || val32 != val27 || val52 != val34 || val41 != val27 || val54 != val28 || val53 != val27 || val38 != val28 || val37 != val34)) || (unsigned int)call7 != 1U) || !((int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 == 0U || !(((call15 | call12) & 2147483648UL) == 0UL || !(((call15 | call12) & 2147483648UL) == 0UL || val33 != val28 || val42 != val34 || val32 != val27 || val52 != val34 || val41 != val27 || val54 != val28 || val53 != val27 || val38 != val28 || val37 != val34)) || (unsigned int)call7 != 1U)) && val64 == val56 && val65 == (call9 & 4294967295UL)) {
                            break;
                        }
                    }
                }
            if ((!(!(((call15 | call12) & 2147483648UL) == 0UL || !(val37 != val34 || val38 != val28 || val53 != val27 || val54 != val28 || val41 != val27 || val52 != val34 || val32 != val27 || val42 != val34 || ((call15 | call12) & 2147483648UL) == 0UL || val33 != val28)) || (int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 == 0U || (unsigned int)call7 != 1U) || !(!(((call15 | call12) & 2147483648UL) == 0UL || !(val37 != val34 || val38 != val28 || val53 != val27 || val54 != val28 || val41 != val27 || val52 != val34 || val32 != val27 || val42 != val34 || ((call15 | call12) & 2147483648UL) == 0UL || val33 != val28)) || (int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 != 0U || (unsigned int)call7 != 1U)) && val64 == val56 && val65 == (call9 & 4294967295UL)) {
                val66 = stderr;
                call67 = fputc(10U, val66);
            }
        }
        if (!((unsigned int)call7 == 1U || !(((call15 | call12) & 2147483648UL) == 0UL || !(val37 != val34 || val38 != val28 || val53 != val27 || val54 != val28 || val41 != val27 || val52 != val34 || val32 != val27 || val42 != val34 || ((call15 | call12) & 2147483648UL) == 0UL || val33 != val28))) || !(!(!(!(((call15 | call12) & 2147483648UL) == 0UL || !(val37 != val34 || val38 != val28 || val53 != val27 || val54 != val28 || val41 != val27 || val52 != val34 || val32 != val27 || val42 != val34 || ((call15 | call12) & 2147483648UL) == 0UL || val33 != val28)) || (unsigned int)call7 != 1U || (int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 != 0U) || !(!(((call15 | call12) & 2147483648UL) == 0UL || !(val37 != val34 || val38 != val28 || val53 != val27 || val54 != val28 || val41 != val27 || val52 != val34 || val32 != val27 || val42 != val34 || ((call15 | call12) & 2147483648UL) == 0UL || val33 != val28)) || (unsigned int)call7 != 1U || (int)((unsigned int)phi57 * val10 + (unsigned int)phi58) % 20 == 0U)) || val64 != val56 || val65 != (call9 & 4294967295UL))) {
            free(call18);
            free(call20);
            free(call22);
            return 0U;
        }
    }
}
