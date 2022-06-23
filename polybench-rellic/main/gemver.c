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
