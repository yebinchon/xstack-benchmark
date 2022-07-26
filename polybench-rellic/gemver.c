unsigned int main(unsigned int arg0, unsigned char **arg1) {
    struct literal_struct_0 var0;
    double var1;
    struct literal_struct_1 var2;
    struct literal_struct_0 var3;
    double var4;
    struct literal_struct_2 var5;
    unsigned char *val6;
    unsigned long call7;
    unsigned int val8;
    unsigned char *val9;
    unsigned long call10;
    unsigned char *call11;
    unsigned long val12;
    unsigned long val14;
    unsigned char *call15;
    unsigned char *call16;
    unsigned char *call17;
    unsigned char *call18;
    unsigned char *call19;
    unsigned char *call20;
    unsigned char *call21;
    unsigned char *call22;
    unsigned long val23;
    unsigned char val24;
    unsigned long val25;
    unsigned long phi26;
    double val27;
    unsigned long val28;
    double val29;
    unsigned long phi30;
    unsigned long val31;
    unsigned char *val32;
    unsigned char *val33;
    unsigned char *val34;
    unsigned char *val35;
    unsigned char *val36;
    unsigned char *val37;
    unsigned long phi38;
    struct struct__IO_FILE *val39;
    double val40;
    unsigned int call41;
    struct struct__IO_FILE *val42;
    unsigned int call43;
    unsigned long val44;
    val6 = arg1[2UL];
    call7 = strtol(val6, (void *)0U, 10U);
    val8 = call7;
    val9 = arg1[1UL];
    call10 = strtol(val9, (void *)0U, 10U);
    call11 = malloc((call7 << 3UL) * call7 & 34359738360UL);
    val12 = call7 << 32UL;
    val14 = (long)val12 >> 29UL;
    call15 = malloc(val14);
    call16 = malloc(val14);
    call17 = malloc(val14);
    call18 = malloc(val14);
    call19 = malloc(val14);
    call20 = malloc(val14);
    call21 = malloc(val14);
    call22 = malloc(val14);
    val23 = call7 & 4294967295UL;
    val24 = val8 == 0U;
    if (!val24) {
        val25 = val23 << 3UL;
        llvm_memset_p0i8_i64(call20, (unsigned char)0U, val25, 0U);
        llvm_memset_p0i8_i64(call19, (unsigned char)0U, val25, 0U);
        phi26 = 0UL;
        do {
            val27 = (unsigned int)phi26;
            ((double *)call15)[phi26] = val27;
            val28 = phi26 + 1UL;
            val29 = ((int)val28 / (int)val8);
            ((double *)call17)[phi26] = val29 * 0.5;
            ((double *)call16)[phi26] = val29 * 0.25;
            ((double *)call18)[phi26] = val29 / 6.;
            ((double *)call21)[phi26] = val29 * 0.125;
            ((double *)call22)[phi26] = val29 / 9.;
            phi30 = 0UL;
            do {
                (&((double *)call11)[phi26 * val23])[phi30] = val27 * (double)(unsigned int)phi30 / (double)val8;
                val31 = phi30 + 1UL;
                phi30 = val31;
            } while (val31 != val23);
            phi26 = val28;
        } while (val28 != val23);
    }
    if (val24 || !(val28 != val23 || val24 || val31 != val23)) {
        val32 = (unsigned char *)(&var0);
        val33 = (unsigned char *)(&var1);
        val34 = (unsigned char *)(&var2);
        val35 = (unsigned char *)(&var3);
        val36 = (unsigned char *)(&var4);
        val37 = (unsigned char *)(&var5);
        var4 = 12313.;
        var1 = 43532.;
        var5.field0 = val8;
        *(unsigned char **)(&var5.field1) = call11;
        *(unsigned char **)(&var5.field2) = call15;
        *(unsigned char **)(&var5.field3) = call16;
        *(unsigned char **)(&var5.field4) = call17;
        *(unsigned char **)(&var5.field5) = call18;
        var3.field0 = val8;
        *(unsigned char **)(&var3.field1) = call20;
        *(unsigned char **)(&var3.field2) = call11;
        var3.field3 = &var4;
        *(unsigned char **)(&var3.field4) = call21;
        var2.field0 = val8;
        *(unsigned char **)(&var2.field1) = call20;
        *(unsigned char **)(&var2.field2) = call22;
        var0.field0 = val8;
        *(unsigned char **)(&var0.field1) = call19;
        *(unsigned char **)(&var0.field2) = call11;
        var0.field3 = &var1;
        *(unsigned char **)(&var0.field4) = call20;
        if ((val24 || !(val31 != val23 || val24 || val28 != val23)) && !((unsigned int)call10 != 1U ? 1U : val24)) {
            phi38 = 0UL;
            while (1U)
                {
                    val39 = stderr;
                    val40 = ((double *)call19)[phi38];
                    call41 = fprintf(val39, "%0.2lf ", val40);
                    if ((unsigned int)phi38 % 20U == 0U) {
                        val42 = stderr;
                        call43 = fputc(10U, val42);
                    }
                    if (!(!(val24 || !(val31 != val23 || val24 || val28 != val23)) || ((unsigned int)call10 != 1U ? 1U : val24) || (unsigned int)phi38 % 20U == 0U) || !(!(val24 || !(val31 != val23 || val24 || val28 != val23)) || ((unsigned int)call10 != 1U ? 1U : val24) || (unsigned int)phi38 % 20U != 0U)) {
                        val44 = phi38 + 1UL;
                        phi38 = val44;
                        if ((!(((unsigned int)call10 != 1U ? 1U : val24) || (unsigned int)phi38 % 20U == 0U || !(val24 || !(val24 || val28 != val23 || val31 != val23))) || !(((unsigned int)call10 != 1U ? 1U : val24) || (unsigned int)phi38 % 20U != 0U || !(val24 || !(val24 || val28 != val23 || val31 != val23)))) && val44 == val23) {
                            break;
                        }
                    }
                }
        }
        if (!(!((unsigned int)call10 != 1U ? 1U : val24) || !(val24 || !(val31 != val23 || val24 || val28 != val23))) || !(val44 != val23 || !(!(!(val24 || !(val31 != val23 || val24 || val28 != val23)) || ((unsigned int)call10 != 1U ? 1U : val24) || (unsigned int)phi38 % 20U == 0U) || !(!(val24 || !(val31 != val23 || val24 || val28 != val23)) || ((unsigned int)call10 != 1U ? 1U : val24) || (unsigned int)phi38 % 20U != 0U)))) {
            free(call11);
            free(call15);
            free(call16);
            free(call17);
            free(call18);
            free(call19);
            free(call20);
            free(call21);
            free(call22);
            return 0U;
        }
    }
}
void kernel_gemver_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    double *val5;
    double *val6;
    double *val7;
    double *val8;
    double *val9;
    unsigned int val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long val14;
    unsigned long phi15;
    unsigned long phi16;
    double *val17;
    double val18;
    double val19;
    double call20;
    double val21;
    double call22;
    unsigned long val23;
    double val24;
    double val25;
    val4 = *(unsigned int *)arg5;
    val5 = *(double **)(&arg5[8UL]);
    val6 = *(double **)(&arg5[16UL]);
    val7 = *(double **)(&arg5[24UL]);
    val8 = *(double **)(&arg5[32UL]);
    val9 = *(double **)(&arg5[40UL]);
    val10 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val11 = arg3 + 18446744073709551615UL;
    var1 = val11;
    __kmpc_for_static_init_8(&_loc_dummy, val10, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val12 = var0;
    val13 = var1;
    val14 = ((long)val13 > (long)val11 ? val11 : val13);
    var1 = val14;
    if ((long)val12 <= (long)val14) {
        phi15 = val12;
        while (1U)
            {
                if ((int)val4 > 0) {
                    val24 = val6[phi15];
                    val25 = val8[phi15];
                    phi16 = 0UL;
                    do {
                        val17 = &(&val5[phi15 * (unsigned long)val4])[phi16];
                        val18 = *val17;
                        val19 = val7[phi16];
                        call20 = llvm_fmuladd_f64(val24, val19, val18);
                        val21 = val9[phi16];
                        call22 = llvm_fmuladd_f64(val25, val21, call20);
                        *val17 = call22;
                        val23 = phi16 + 1UL;
                        phi16 = val23;
                    } while (val23 != (long)val4);
                }
                if (!((long)val12 > (long)val14 || (int)val4 > 0) || !(val23 != (long)val4 || (long)val12 > (long)val14 || (int)val4 <= 0)) {
                    phi15 = phi15 + 1UL;
                    if ((!((long)val12 > (long)val14 || (int)val4 > 0) || !((long)val12 > (long)val14 || (int)val4 <= 0 || val23 != (long)val4)) && phi15 == val14) {
                        break;
                    }
                }
            }
    }
    if ((long)val12 > (long)val14 || !(phi15 != val14 || !(!((long)val12 > (long)val14 || (int)val4 > 0) || !(val23 != (long)val4 || (long)val12 > (long)val14 || (int)val4 <= 0)))) {
        __kmpc_for_static_fini(&_loc_dummy, val10);
        return;
    }
}
void kernel_gemver_polly_subfn_4(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    double *val5;
    double *val6;
    double *val7;
    double *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long phi14;
    double phi15;
    unsigned long phi16;
    double val17;
    double val18;
    double val19;
    double call20;
    unsigned long val21;
    double *val22;
    double val23;
    val4 = *(unsigned int *)arg5;
    val5 = *(double **)(&arg5[8UL]);
    val6 = *(double **)(&arg5[16UL]);
    val7 = *(double **)(&arg5[24UL]);
    val8 = *(double **)(&arg5[32UL]);
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
        phi14 = val11;
        while (1U)
            {
                if ((int)val4 > 0) {
                    val22 = &val5[phi14];
                    val23 = *val22;
                    phi16 = 0UL;
                    phi15 = val23;
                    do {
                        val17 = *val7;
                        val18 = (&val6[phi14])[phi16 * (unsigned long)val4];
                        val19 = val8[phi16];
                        call20 = llvm_fmuladd_f64(val17 * val18, val19, phi15);
                        *val22 = call20;
                        val21 = phi16 + 1UL;
                        phi16 = val21;
                        phi15 = call20;
                    } while (val21 != (long)val4);
                }
                if (!((long)val11 > (long)val13 || (int)val4 > 0) || !(val21 != (long)val4 || (long)val11 > (long)val13 || (int)val4 <= 0)) {
                    phi14 = phi14 + 1UL;
                    if ((!((long)val11 > (long)val13 || (int)val4 > 0) || !((long)val11 > (long)val13 || val21 != (long)val4 || (int)val4 <= 0)) && phi14 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi14 != val13 || !(!((long)val11 > (long)val13 || (int)val4 > 0) || !(val21 != (long)val4 || (long)val11 > (long)val13 || (int)val4 <= 0)))) {
        __kmpc_for_static_fini(&_loc_dummy_3, val9);
        return;
    }
}
void kernel_gemver_polly_subfn_7(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    double *val4;
    double *val5;
    unsigned int val6;
    unsigned long val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long phi11;
    double *val12;
    double val13;
    double val14;
    val4 = *(double **)(&arg5[8UL]);
    val5 = *(double **)(&arg5[16UL]);
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
        do {
            val12 = &val4[phi11];
            val13 = *val12;
            val14 = val5[phi11];
            *val12 = val13 + val14;
            phi11 = phi11 + 1UL;
        } while (phi11 != val10);
    }
    if ((long)val8 > (long)val10 || phi11 == val10) {
        __kmpc_for_static_fini(&_loc_dummy_6, val6);
        return;
    }
}
void kernel_gemver_polly_subfn_10(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned int val4;
    double *val5;
    double *val6;
    double *val7;
    double *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long phi14;
    double phi15;
    unsigned long phi16;
    double val17;
    double val18;
    double val19;
    double call20;
    unsigned long val21;
    double *val22;
    double val23;
    val4 = *(unsigned int *)arg5;
    val5 = *(double **)(&arg5[8UL]);
    val6 = *(double **)(&arg5[16UL]);
    val7 = *(double **)(&arg5[24UL]);
    val8 = *(double **)(&arg5[32UL]);
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
        phi14 = val11;
        while (1U)
            {
                if ((int)val4 > 0) {
                    val22 = &val5[phi14];
                    val23 = *val22;
                    phi16 = 0UL;
                    phi15 = val23;
                    do {
                        val17 = *val7;
                        val18 = (&val6[phi14 * (unsigned long)val4])[phi16];
                        val19 = val8[phi16];
                        call20 = llvm_fmuladd_f64(val17 * val18, val19, phi15);
                        *val22 = call20;
                        val21 = phi16 + 1UL;
                        phi16 = val21;
                        phi15 = call20;
                    } while (val21 != (long)val4);
                }
                if (!((long)val11 > (long)val13 || (int)val4 > 0) || !(val21 != (long)val4 || (int)val4 <= 0 || (long)val11 > (long)val13)) {
                    phi14 = phi14 + 1UL;
                    if (phi14 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi14 != val13 || !(!((long)val11 > (long)val13 || (int)val4 > 0) || !(val21 != (long)val4 || (long)val11 > (long)val13 || (int)val4 <= 0)))) {
        __kmpc_for_static_fini(&_loc_dummy_9, val9);
        return;
    }
}
