unsigned int main(unsigned int arg0, unsigned char **arg1) {
    double var1;
    unsigned char *val2;
    unsigned long call3;
    unsigned int val4;
    unsigned char *val5;
    unsigned long call6;
    unsigned long val7;
    unsigned char *call8;
    double *val9;
    unsigned char *call10;
    double *val11;
    unsigned long val12;
    unsigned char *call13;
    double *val14;
    unsigned char *call15;
    double *val16;
    unsigned long val17;
    double val18;
    unsigned long phi19;
    double val20;
    unsigned long val21;
    unsigned long phi22;
    double val23;
    unsigned long val24;
    unsigned long val25;
    unsigned long phi26;
    unsigned long val27;
    double phi28;
    double phi29;
    unsigned long phi30;
    double val31;
    double val32;
    double call33;
    double val34;
    double call35;
    unsigned long val36;
    double call37;
    unsigned long val38;
    unsigned long phi39;
    struct struct__IO_FILE *val40;
    double val41;
    unsigned int call42;
    struct struct__IO_FILE *val43;
    unsigned int call44;
    unsigned long val45;
    unsigned long phi46;
    unsigned long val47;
    double call48;
    unsigned long val49;
    double phi50;
    double phi51;
    unsigned long phi52;
    unsigned long val53;
    double val54;
    double val55;
    double call56;
    double val57;
    double call58;
    unsigned long val59;
    val2 = arg1[2UL];
    call3 = strtol(val2, (void *)0U, 10U);
    val4 = call3;
    val5 = arg1[1UL];
    call6 = strtol(val5, (void *)0U, 10U);
    val7 = (call3 << 3UL) * call3 & 34359738360UL;
    call8 = malloc(val7);
    val9 = (double *)call8;
    call10 = malloc(val7);
    val11 = (double *)call10;
    val12 = (long)(call3 << 32UL) >> 29UL;
    call13 = malloc(val12);
    val14 = (double *)call13;
    call15 = malloc(val12);
    val16 = (double *)call15;
    val17 = call3 & 4294967295UL;
    if ((int)val4 > 0) {
        val18 = val4;
        if (call3 >= 2147483648UL) {
            phi19 = 0UL;
            do {
                val20 = (unsigned int)phi19;
                val14[phi19] = val20 / val18;
                val21 = phi19 * val17;
                phi22 = 0UL;
                do {
                    val23 = val20 * (double)(unsigned int)phi22 / val18;
                    (&val9[val21])[phi22] = val23;
                    (&val11[val21])[phi22] = val23;
                    val24 = phi22 + 1UL;
                    phi22 = val24;
                } while (val24 != val17);
                val25 = phi19 + 1UL;
                phi19 = val25;
            } while (val25 != val17);
            if (val24 == val17) {
                phi26 = 0UL;
                do {
                    val27 = phi26 * val17;
                    phi30 = 0UL;
                    phi29 = 0.;
                    phi28 = 0.;
                    do {
                        val31 = (&val9[val27])[phi30];
                        val32 = val14[phi30];
                        call33 = llvm_fmuladd_f64(val31, val32, phi29);
                        val34 = (&val11[val27])[phi30];
                        call35 = llvm_fmuladd_f64(val34, val32, phi28);
                        val36 = phi30 + 1UL;
                        phi30 = val36;
                        phi29 = call33;
                        phi28 = call35;
                    } while (val36 != val17);
                    call37 = llvm_fmuladd_f64(call33, 43532., call35 * 12313.);
                    val16[phi26] = call37;
                    val38 = phi26 + 1UL;
                    phi26 = val38;
                } while (val38 != val17);
            }
        } else {
            var1 = val18;
            phi46 = 0UL;
            do {
                val47 = phi46 * (val17 << 3UL);
                phi52 = 0UL;
                phi51 = 0.;
                phi50 = 0.;
                do {
                    val53 = phi52 << 3UL;
                    val54 = *(double *)(&(&call8[val47])[val53]);
                    val55 = *(double *)(&call13[val53]);
                    call56 = llvm_fmuladd_f64(val54, val55, phi50);
                    val57 = *(double *)(&(&call10[val47])[val53]);
                    call58 = llvm_fmuladd_f64(val57, val55, phi51);
                    val59 = phi52 + 1UL;
                    phi52 = val59;
                    phi51 = call58;
                    phi50 = call56;
                } while (val59 != call3);
                call48 = llvm_fmuladd_f64(call56, 43532., call58 * 12313.);
                *(double *)(&call15[phi46 << 3UL]) = call48;
                val49 = phi46 + 1UL;
                phi46 = val49;
            } while (val49 != call3);
        }
        if (!(val49 != call3 || val59 != call3 || call3 >= 2147483648UL) || !(val38 != val17 || val36 != val17 || val25 != val17 || val24 != val17 || call3 < 2147483648UL)) {
            if ((!(val59 != call3 || call3 >= 2147483648UL || val49 != call3) || !(val25 != val17 || val24 != val17 || val36 != val17 || val38 != val17 || call3 < 2147483648UL)) && (unsigned int)call6 == 1U) {
                phi39 = 0UL;
                while (1U)
                    {
                        val40 = stderr;
                        val41 = val16[phi39];
                        call42 = fprintf(val40, "%0.2lf ", val41);
                        if ((unsigned int)phi39 % 20U == 0U) {
                            val43 = stderr;
                            call44 = fputc(10U, val43);
                        }
                        if (!((unsigned int)call6 != 1U || (unsigned int)phi39 % 20U != 0U || !(!(val59 != call3 || call3 >= 2147483648UL || val49 != call3) || !(val25 != val17 || val24 != val17 || val36 != val17 || val38 != val17 || call3 < 2147483648UL))) || !(!(!(val59 != call3 || call3 >= 2147483648UL || val49 != call3) || !(val25 != val17 || val24 != val17 || val36 != val17 || val38 != val17 || call3 < 2147483648UL)) || (unsigned int)call6 != 1U || (unsigned int)phi39 % 20U == 0U)) {
                            val45 = phi39 + 1UL;
                            phi39 = val45;
                            if ((!((unsigned int)call6 != 1U || (unsigned int)phi39 % 20U == 0U || !(!(call3 >= 2147483648UL || val49 != call3 || val59 != call3) || !(call3 < 2147483648UL || val38 != val17 || val36 != val17 || val24 != val17 || val25 != val17))) || !((unsigned int)call6 != 1U || (unsigned int)phi39 % 20U != 0U || !(!(call3 >= 2147483648UL || val49 != call3 || val59 != call3) || !(call3 < 2147483648UL || val38 != val17 || val36 != val17 || val24 != val17 || val25 != val17)))) && val45 == val17) {
                                break;
                            }
                        }
                    }
            }
        }
    }
    if ((int)val4 <= 0 || !(val45 != val17 || !(!(!(!(val59 != call3 || val49 != call3 || (int)val4 <= 0 || call3 >= 2147483648UL) || !(val25 != val17 || val24 != val17 || val36 != val17 || val38 != val17 || (int)val4 <= 0 || call3 < 2147483648UL)) || (unsigned int)call6 != 1U || (unsigned int)phi39 % 20U == 0U) || !(!(!(val59 != call3 || val49 != call3 || (int)val4 <= 0 || call3 >= 2147483648UL) || !(val25 != val17 || val24 != val17 || val36 != val17 || val38 != val17 || (int)val4 <= 0 || call3 < 2147483648UL)) || (unsigned int)call6 != 1U || (unsigned int)phi39 % 20U != 0U))) || !((unsigned int)call6 == 1U || !(!(val59 != call3 || val49 != call3 || (int)val4 <= 0 || call3 >= 2147483648UL) || !(val25 != val17 || val24 != val17 || val36 != val17 || val38 != val17 || (int)val4 <= 0 || call3 < 2147483648UL)))) {
        free(call8);
        free(call10);
        free(call13);
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
    unsigned char *val7;
    unsigned char *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long phi14;
    double val15;
    double val16;
    unsigned long phi17;
    double val18;
    double val19;
    unsigned long val20;
    unsigned long val21;
    unsigned long val22;
    val4 = *(unsigned long *)arg5;
    val5 = *(double **)(&arg5[8UL]);
    val6 = *(unsigned char **)(&arg5[16UL]);
    val7 = *(unsigned char **)(&arg5[24UL]);
    val8 = *(unsigned char **)(&arg5[32UL]);
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
        phi14 = val11;
        while (1U)
            {
                val15 = *val5;
                val16 = (unsigned int)phi14;
                *(double *)(&val8[phi14 << 3UL]) = val16 / val15;
                if ((long)val4 > 0L) {
                    val22 = phi14 * (val4 << 3UL & 34359738360UL);
                    phi17 = 0UL;
                    do {
                        val18 = *val5;
                        val19 = val16 * (double)(unsigned int)phi17 / val18;
                        val20 = phi17 << 3UL;
                        *(double *)(&(&val6[val22])[val20]) = val19;
                        *(double *)(&(&val7[val22])[val20]) = val19;
                        val21 = phi17 + 1UL;
                        phi17 = val21;
                    } while (val21 != val4);
                }
                if (!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val21 != val4 || (long)val11 > (long)val13 || (long)val4 <= 0L)) {
                    phi14 = phi14 + 1UL;
                    if ((!((long)val11 > (long)val13 || (long)val4 > 0L) || !((long)val11 > (long)val13 || val21 != val4 || (long)val4 <= 0L)) && phi14 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi14 != val13 || !(!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val21 != val4 || (long)val11 > (long)val13 || (long)val4 <= 0L)))) {
        __kmpc_for_static_fini(&_loc_dummy, val9);
        return;
    }
}
