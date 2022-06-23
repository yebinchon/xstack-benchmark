unsigned int main(unsigned int arg0, unsigned char **arg1) {
    unsigned char *val1;
    unsigned long call2;
    unsigned char *call3;
    unsigned char *call4;
    unsigned char *call5;
    unsigned char *call6;
    unsigned char *call7;
    unsigned long phi8;
    struct struct__IO_FILE *val9;
    double val10;
    unsigned int call11;
    struct struct__IO_FILE *val12;
    unsigned int call13;
    unsigned long val14;
    unsigned long phi15;
    struct struct__IO_FILE *val16;
    double val17;
    unsigned int call18;
    struct struct__IO_FILE *val19;
    unsigned int call20;
    unsigned long val21;
    struct struct__IO_FILE *val22;
    unsigned int call23;
    unsigned long phi24;
    unsigned long val25;
    unsigned long val26;
    double *val27;
    double phi28;
    unsigned long phi29;
    unsigned long val30;
    double *val31;
    double val32;
    double val33;
    double call34;
    double val35;
    double call36;
    unsigned long val37;
    unsigned long phi38;
    double val39;
    val1 = arg1[1UL];
    call2 = strtol(val1, (void *)0U, 10U);
    call3 = malloc(12800000000UL);
    call4 = malloc(320000UL);
    call5 = malloc(320000UL);
    call6 = malloc(320000UL);
    call7 = malloc(320000UL);
    phi24 = 0UL;
    do {
        *(double *)(&call6[phi24 << 3UL]) = (double)(unsigned int)phi24 * 3.1415926535897931;
        val25 = phi24 + 1UL;
        phi24 = val25;
    } while (val25 != 40000UL);
    val27 = (double *)call5;
    llvm_memset_p0i8_i64(call4, (unsigned char)0U, 320000UL, 0U);
    phi38 = 0UL;
    do {
        val39 = ((double *)call7)[phi38];
        phi29 = 0UL;
        phi28 = 0.;
        do {
            val30 = phi29 << 3UL;
            val31 = (double *)(&call4[val30]);
            val32 = *val31;
            val33 = *(double *)(&(&call3[phi38 * 320000UL])[val30]);
            call34 = llvm_fmuladd_f64(val39, val33, val32);
            *val31 = call34;
            val35 = *(double *)(&call6[val30]);
            call36 = llvm_fmuladd_f64(val33, val35, phi28);
            val37 = phi29 + 1UL;
            phi29 = val37;
            phi28 = call36;
        } while (val37 != 40000UL);
        val27[phi38] = call36;
        val26 = phi38 + 1UL;
        phi38 = val26;
    } while (val26 != 40000UL);
    if (val37 == 40000UL) {
        if ((unsigned int)call2 == 1U) {
            phi8 = 0UL;
            while (1U)
                {
                    val9 = stderr;
                    val10 = ((double *)call4)[phi8];
                    call11 = fprintf(val9, "%0.2lf ", val10);
                    if ((unsigned short)phi8 % (unsigned short)20U == (unsigned short)0U) {
                        val12 = stderr;
                        call13 = fputc(10U, val12);
                    }
                    val14 = phi8 + 1UL;
                    phi8 = val14;
                    if (val14 == 40000UL) {
                        break;
                    }
                }
            if (val14 == 40000UL) {
                phi15 = 0UL;
                while (1U)
                    {
                        val16 = stderr;
                        val17 = val27[phi15];
                        call18 = fprintf(val16, "%0.2lf ", val17);
                        if ((unsigned short)phi15 % (unsigned short)20U == (unsigned short)0U) {
                            val19 = stderr;
                            call20 = fputc(10U, val19);
                        }
                        val21 = phi15 + 1UL;
                        phi15 = val21;
                        if (val21 == 40000UL) {
                            break;
                        }
                    }
                if (val21 == 40000UL) {
                    val22 = stderr;
                    call23 = fputc(10U, val22);
                }
            }
        }
        if ((unsigned int)call2 != 1U || !(val21 != 40000UL || val14 != 40000UL || (unsigned int)call2 != 1U)) {
            free(call3);
            free(call4);
            free(call5);
            free(call6);
            free(call7);
            return 0U;
        }
    }
}
