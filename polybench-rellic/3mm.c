unsigned int main(unsigned int arg0, unsigned char **arg1) {
    double var4;
    unsigned char *val5;
    unsigned long call6;
    unsigned int val7;
    unsigned char *val8;
    unsigned long call9;
    unsigned int val10;
    unsigned char *val11;
    unsigned long call12;
    unsigned int val13;
    unsigned char *val14;
    unsigned long call15;
    unsigned int val16;
    unsigned char *val17;
    unsigned long call18;
    unsigned int val19;
    unsigned char *val20;
    unsigned long call21;
    unsigned int val22;
    unsigned long val23;
    unsigned char *call24;
    unsigned char *call25;
    unsigned long val26;
    unsigned char *call27;
    unsigned char *call28;
    unsigned char *call29;
    unsigned char *call30;
    unsigned char *call31;
    unsigned long val32;
    unsigned long val33;
    unsigned long val34;
    unsigned long val35;
    unsigned char val36;
    unsigned long phi37;
    unsigned long phi38;
    unsigned long val39;
    unsigned long val40;
    unsigned long phi41;
    unsigned long phi42;
    unsigned long val43;
    unsigned long val44;
    unsigned long phi45;
    unsigned long val46;
    unsigned long phi47;
    unsigned long phi48;
    unsigned long val49;
    unsigned long val50;
    unsigned long phi51;
    unsigned long phi52;
    struct struct__IO_FILE *val53;
    double val54;
    unsigned int call55;
    struct struct__IO_FILE *val56;
    unsigned int call57;
    unsigned long val58;
    unsigned long val59;
    struct struct__IO_FILE *val60;
    unsigned int call61;
    val5 = arg1[1UL];
    call6 = strtol(val5, (void *)0U, 10U);
    val7 = call6;
    val8 = arg1[2UL];
    call9 = strtol(val8, (void *)0U, 10U);
    val10 = call9;
    val11 = arg1[3UL];
    call12 = strtol(val11, (void *)0U, 10U);
    val13 = call12;
    val14 = arg1[4UL];
    call15 = strtol(val14, (void *)0U, 10U);
    val16 = call15;
    val17 = arg1[5UL];
    call18 = strtol(val17, (void *)0U, 10U);
    val19 = call18;
    val20 = arg1[6UL];
    call21 = strtol(val20, (void *)0U, 10U);
    val22 = call21;
    val23 = call9 << 3UL;
    call24 = malloc(call12 * val23 & 34359738360UL);
    call25 = malloc(call15 * val23 & 34359738360UL);
    val26 = call12 << 3UL;
    call27 = malloc(call15 * val26 & 34359738360UL);
    call28 = malloc(call18 * val26 & 34359738360UL);
    call29 = malloc(call21 * val26 & 34359738360UL);
    call30 = malloc((call18 << 3UL) * call21 & 34359738360UL);
    call31 = malloc(call18 * val23 & 34359738360UL);
    val32 = call15 & 4294967295UL;
    val33 = call12 & 4294967295UL;
    val34 = call21 & 4294967295UL;
    val35 = call18 & 4294967295UL;
    val36 = val10 == 0U;
    if (!val36) {
        phi37 = 0UL;
        do {
            phi38 = 0UL;
            do {
                (&((double *)call25)[phi37 * val32])[phi38] = (double)(unsigned int)phi37 * (double)(unsigned int)phi38 / (double)val10;
                val39 = phi38 + 1UL;
                phi38 = val39;
            } while (val39 != val32);
            val40 = phi37 + 1UL;
            phi37 = val40;
        } while (val40 != (call9 & 4294967295UL));
    }
    if (val36 || !(val40 != (call9 & 4294967295UL) || val36 || val39 != val32)) {
        phi41 = 0UL;
        if (val36 || !(val39 != val32 || val36 || val40 != (call9 & 4294967295UL))) {
            while (1U)
                {
                    if ((int)val13 <= 0) {
                        val46 = phi41 + 1UL;
                        phi45 = val46;
                    } else {
                        phi42 = 0UL;
                        do {
                            val43 = phi42 + 1UL;
                            (&((double *)call27)[phi41 * val33])[phi42] = (double)(unsigned int)phi41 * (double)(unsigned int)val43 / (double)val13;
                            phi42 = val43;
                        } while (!((val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32)) && val43 == val33));
                        if (val43 == val33) {
                            val44 = phi41 + 1UL;
                            phi45 = val44;
                            if (val44 == val32) {
                                phi47 = 0UL;
                            }
                        }
                    }
                    if (!(val44 == val32 || (int)val13 <= 0 || val43 != val33) || !((int)val13 > 0 || val46 == val32)) {
                        phi41 = phi45;
                    }
                }
            if ((int)val13 > 0 && val43 == val33 && val44 == val32) {
                while (1U)
                    {
                        phi48 = 0UL;
                        do {
                            (&((double *)call29)[phi47 * val34])[phi48] = (double)(unsigned int)phi47 * (double)((unsigned int)phi48 + 3U) / (double)val19;
                            val49 = phi48 + 1UL;
                            phi48 = val49;
                        } while (!((val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32)) && (int)val13 > 0 && val43 == val33 && val44 == val32 && val49 == val34));
                        if (val49 == val34) {
                            val50 = phi47 + 1UL;
                            phi47 = val50;
                            if ((val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32)) && (int)val13 > 0 && val43 == val33 && val44 == val32 && val50 == val33) {
                                break;
                            }
                        }
                    }
            }
            if (!(val50 != val33 || val49 != val34 || val44 != val32 || (int)val13 <= 0 || val43 != val33) || !((int)val13 > 0 || val46 != val32)) {
                var4 = val16;
                if ((!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) && !val36) {
                    if (val7 == 1U) {
                        phi51 = 0UL;
                        while (1U)
                            {
                                phi52 = 0UL;
                                while (1U)
                                    {
                                        val53 = stderr;
                                        val54 = (&((double *)call31)[phi51 * val35])[phi52];
                                        call55 = fprintf(val53, "%0.2lf ", val54);
                                        if ((int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 == 0U) {
                                            val56 = stderr;
                                            call57 = fputc(10U, val56);
                                        }
                                        if (!(val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 != 0U || !(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33))) || !(!(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 == 0U || val36)) {
                                            val58 = phi52 + 1UL;
                                            phi52 = val58;
                                            if ((!(val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 != 0U || !(!((int)val13 > 0 || val46 != val32 || !(val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32))) || !(val43 != val33 || (int)val13 <= 0 || val44 != val32 || val50 != val33 || val49 != val34 || !(val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32))))) || !(val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 == 0U || !(!((int)val13 > 0 || val46 != val32 || !(val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32))) || !(val43 != val33 || (int)val13 <= 0 || val44 != val32 || val50 != val33 || val49 != val34 || !(val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32)))))) && val58 == val35) {
                                                break;
                                            }
                                        }
                                    }
                                if ((!(!(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) || val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 == 0U) || !(!(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) || val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 != 0U)) && val58 == val35) {
                                    val59 = phi51 + 1UL;
                                    phi51 = val59;
                                    if ((!(val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 == 0U || !(!((int)val13 > 0 || val46 != val32 || !(val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32))) || !(val43 != val33 || (int)val13 <= 0 || val44 != val32 || val50 != val33 || val49 != val34 || !(val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32))))) || !(val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 != 0U || !(!((int)val13 > 0 || val46 != val32 || !(val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32))) || !(val43 != val33 || (int)val13 <= 0 || val44 != val32 || val50 != val33 || val49 != val34 || !(val36 || !(val36 || val40 != (call9 & 4294967295UL) || val39 != val32)))))) && val58 == val35 && val59 == (call9 & 4294967295UL)) {
                                        break;
                                    }
                                }
                            }
                    }
                }
                if (!(!(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) || !val36 || val7 != 1U) || !(val58 != val35 || val59 != (call9 & 4294967295UL) || !(!(val7 != 1U || !(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) || val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 == 0U) || !(!(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) || val7 != 1U || val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 != 0U)))) {
                    val60 = stderr;
                    call61 = fputc(10U, val60);
                }
                if (!(!(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) || !val36 || val7 != 1U) || !(!(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) || !val36 || val7 == 1U) || !(!(!(!(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) || val7 != 1U || val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 == 0U) || !(!(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)) || val7 != 1U || val36 || (int)((unsigned int)phi51 * val10 + (unsigned int)phi52) % 20 != 0U)) || val58 != val35 || val59 != (call9 & 4294967295UL)) || !(val36 || val7 == 1U || !(!((int)val13 > 0 || val46 != val32) || !(val49 != val34 || val50 != val33 || val44 != val32 || (int)val13 <= 0 || val43 != val33)))) {
                    free(call24);
                    free(call25);
                    free(call27);
                    free(call28);
                    free(call29);
                    free(call30);
                    free(call31);
                    return 0U;
                }
            }
        }
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
    val5 = *(double **)(&arg5[40UL]);
    val6 = *(unsigned char **)(&arg5[48UL]);
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
                        *(double *)(&(&val6[phi12 * (val4 << 3UL & 34359738360UL)])[phi13 << 3UL]) = (double)(unsigned int)phi12 * (double)((unsigned int)phi13 + 2U) / val14;
                        val15 = phi13 + 1UL;
                        phi13 = val15;
                    } while (val15 != val4);
                }
                if (!((long)val9 > (long)val11 || (long)val4 > 0L) || !(val15 != val4 || (long)val9 > (long)val11 || (long)val4 <= 0L)) {
                    phi12 = phi12 + 1UL;
                    if ((!((long)val9 > (long)val11 || (long)val4 > 0L) || !((long)val9 > (long)val11 || (long)val4 <= 0L || val15 != val4)) && phi12 == val11) {
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
    unsigned long val5;
    double *val6;
    unsigned char *val7;
    unsigned char *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long val14;
    unsigned long phi15;
    unsigned long val16;
    unsigned long phi17;
    double *val18;
    double phi19;
    unsigned long phi20;
    double val21;
    double val22;
    double call23;
    unsigned long val24;
    val4 = *(unsigned long *)(&arg5[24UL]);
    val5 = *(unsigned long *)(&arg5[32UL]);
    val6 = *(double **)(&arg5[40UL]);
    val7 = *(unsigned char **)(&arg5[48UL]);
    val8 = *(unsigned char **)(&arg5[56UL]);
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
        val14 = val4 & 4294967295UL;
        phi15 = val11;
        while (1U)
            {
                if ((long)val4 > 0L) {
                    phi17 = 0UL;
                    while (1U)
                        {
                            val18 = &val6[phi17 + phi15 * val14];
                            *val18 = 0.;
                            if ((long)val5 > 0L) {
                                phi20 = 0UL;
                                phi19 = 0.;
                                do {
                                    val21 = *(double *)(&(&val7[phi15 * (val5 << 3UL & 34359738360UL)])[phi20 << 3UL]);
                                    val22 = *(double *)(&(&val8[phi17 << 3UL])[(val14 << 3UL) * phi20]);
                                    call23 = llvm_fmuladd_f64(val21, val22, phi19);
                                    val24 = phi20 + 1UL;
                                    phi20 = val24;
                                    phi19 = call23;
                                } while (val24 != val5);
                                *val18 = call23;
                            }
                            if (!((long)val5 > 0L || (long)val11 > (long)val13) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13)) {
                                val16 = phi17 + 1UL;
                                phi17 = val16;
                                if ((!((long)val5 > 0L || (long)val11 > (long)val13) || !((long)val5 <= 0L || val24 != val5 || (long)val11 > (long)val13)) && val16 == val4) {
                                    break;
                                }
                            }
                        }
                }
                if (!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val5 > 0L || (long)val11 > (long)val13 || (long)val4 <= 0L) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13 || (long)val4 <= 0L)))) {
                    phi15 = phi15 + 1UL;
                    if ((!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val4 <= 0L || (long)val5 > 0L || (long)val11 > (long)val13) || !((long)val4 <= 0L || (long)val5 <= 0L || val24 != val5 || (long)val11 > (long)val13)))) && phi15 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi15 != val13 || !(!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val5 > 0L || (long)val11 > (long)val13 || (long)val4 <= 0L) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13 || (long)val4 <= 0L)))))) {
        __kmpc_for_static_fini(&_loc_dummy_3, val9);
        return;
    }
}
void main_polly_subfn_7(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned long val4;
    unsigned long val5;
    double *val6;
    unsigned char *val7;
    unsigned char *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long val14;
    unsigned long phi15;
    unsigned long val16;
    unsigned long phi17;
    double *val18;
    double phi19;
    unsigned long phi20;
    double val21;
    double val22;
    double call23;
    unsigned long val24;
    val4 = *(unsigned long *)arg5;
    val5 = *(unsigned long *)(&arg5[8UL]);
    val6 = *(double **)(&arg5[40UL]);
    val7 = *(unsigned char **)(&arg5[48UL]);
    val8 = *(unsigned char **)(&arg5[56UL]);
    val9 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val10 = arg3 + 18446744073709551615UL;
    var1 = val10;
    __kmpc_for_static_init_8(&_loc_dummy_6, val9, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val11 = var0;
    val12 = var1;
    val13 = ((long)val12 > (long)val10 ? val10 : val12);
    var1 = val13;
    if ((long)val11 <= (long)val13) {
        val14 = val4 & 4294967295UL;
        phi15 = val11;
        while (1U)
            {
                if ((long)val4 > 0L) {
                    phi17 = 0UL;
                    while (1U)
                        {
                            val18 = &val6[phi17 + phi15 * val14];
                            *val18 = 0.;
                            if ((long)val5 > 0L) {
                                phi20 = 0UL;
                                phi19 = 0.;
                                do {
                                    val21 = *(double *)(&(&val7[phi15 * (val5 << 3UL & 34359738360UL)])[phi20 << 3UL]);
                                    val22 = *(double *)(&(&val8[phi17 << 3UL])[(val14 << 3UL) * phi20]);
                                    call23 = llvm_fmuladd_f64(val21, val22, phi19);
                                    val24 = phi20 + 1UL;
                                    phi20 = val24;
                                    phi19 = call23;
                                } while (val24 != val5);
                                *val18 = call23;
                            }
                            if (!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13)) {
                                val16 = phi17 + 1UL;
                                phi17 = val16;
                                if ((!((long)val11 > (long)val13 || (long)val5 > 0L) || !((long)val11 > (long)val13 || val24 != val5 || (long)val5 <= 0L)) && val16 == val4) {
                                    break;
                                }
                            }
                        }
                }
                if (!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val5 > 0L || (long)val11 > (long)val13 || (long)val4 <= 0L) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13 || (long)val4 <= 0L)))) {
                    phi15 = phi15 + 1UL;
                    if ((!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val4 <= 0L || (long)val11 > (long)val13 || (long)val5 > 0L) || !((long)val4 <= 0L || (long)val11 > (long)val13 || val24 != val5 || (long)val5 <= 0L)))) && phi15 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi15 != val13 || !(!((long)val11 > (long)val13 || (long)val4 > 0L) || !(val16 != val4 || !(!((long)val5 > 0L || (long)val11 > (long)val13 || (long)val4 <= 0L) || !(val24 != val5 || (long)val5 <= 0L || (long)val11 > (long)val13 || (long)val4 <= 0L)))))) {
        __kmpc_for_static_fini(&_loc_dummy_6, val9);
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
    unsigned char *val6;
    unsigned char *val7;
    unsigned char *val8;
    unsigned int val9;
    unsigned long val10;
    unsigned long val11;
    unsigned long val12;
    unsigned long val13;
    unsigned long val14;
    unsigned long val15;
    double *val16;
    unsigned long phi17;
    unsigned long phi18;
    unsigned long val19;
    unsigned long val20;
    unsigned long val21;
    double phi22;
    unsigned long phi23;
    double val24;
    double val25;
    double call26;
    unsigned long val27;
    double *val28;
    double val29;
    val4 = *(unsigned long *)arg5;
    val5 = *(unsigned long *)(&arg5[8UL]);
    val6 = *(unsigned char **)(&arg5[40UL]);
    val7 = *(unsigned char **)(&arg5[48UL]);
    val8 = *(unsigned char **)(&arg5[56UL]);
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
        val14 = val5 & 4294967295UL;
        val15 = val14 << 3UL;
        val16 = (double *)val6;
        phi17 = val11;
        while (1U)
            {
                if ((long)val5 > 0L) {
                    val21 = phi17 * val14;
                    phi18 = 0UL;
                    while (1U)
                        {
                            val19 = phi18 << 3UL;
                            *(double *)(&(&val6[phi17 * val15])[val19]) = 0.;
                            if ((long)val4 > 0L) {
                                val16[phi18 + val21] = 0.;
                                val28 = &val16[phi18 + val21];
                                val29 = *val28;
                                phi23 = 0UL;
                                phi22 = val29;
                                do {
                                    val24 = *(double *)(&(&val7[phi17 * (val4 << 3UL & 34359738360UL)])[phi23 << 3UL]);
                                    val25 = *(double *)(&(&val8[val19])[phi23 * val15]);
                                    call26 = llvm_fmuladd_f64(val24, val25, phi22);
                                    val27 = phi23 + 1UL;
                                    phi23 = val27;
                                    phi22 = call26;
                                } while (val27 != val4);
                                *val28 = call26;
                            }
                            if (!((long)val4 > 0L || (long)val11 > (long)val13) || !(val27 != val4 || (long)val11 > (long)val13 || (long)val4 <= 0L)) {
                                val20 = phi18 + 1UL;
                                phi18 = val20;
                                if ((!((long)val4 > 0L || (long)val11 > (long)val13) || !((long)val11 > (long)val13 || val27 != val4 || (long)val4 <= 0L)) && val20 == val5) {
                                    break;
                                }
                            }
                        }
                }
                if (!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val20 != val5 || !(!((long)val4 > 0L || (long)val11 > (long)val13 || (long)val5 <= 0L) || !(val27 != val4 || (long)val4 <= 0L || (long)val11 > (long)val13 || (long)val5 <= 0L)))) {
                    phi17 = phi17 + 1UL;
                    if ((!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val20 != val5 || !(!((long)val4 > 0L || (long)val11 > (long)val13 || (long)val5 <= 0L) || !((long)val11 > (long)val13 || (long)val5 <= 0L || val27 != val4 || (long)val4 <= 0L)))) && phi17 == val13) {
                        break;
                    }
                }
            }
    }
    if ((long)val11 > (long)val13 || !(phi17 != val13 || !(!((long)val11 > (long)val13 || (long)val5 > 0L) || !(val20 != val5 || !(!((long)val4 > 0L || (long)val11 > (long)val13 || (long)val5 <= 0L) || !(val27 != val4 || (long)val4 <= 0L || (long)val11 > (long)val13 || (long)val5 <= 0L)))))) {
        __kmpc_for_static_fini(&_loc_dummy_9, val9);
        return;
    }
}
