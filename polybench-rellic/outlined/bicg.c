void main_polly_subfn(unsigned int *arg0, unsigned int *arg1, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned char *arg5) {
    unsigned long var0;
    unsigned long var1;
    unsigned int var2;
    unsigned long var3;
    unsigned char *val4;
    unsigned char *val5;
    unsigned int val6;
    unsigned long val7;
    unsigned long val8;
    unsigned long val9;
    unsigned long val10;
    unsigned long phi11;
    unsigned long val12;
    unsigned long phi13;
    double val14;
    val4 = *(unsigned char **)arg5;
    val5 = *(unsigned char **)(&arg5[8UL]);
    val6 = *arg0;
    var0 = arg2;
    var2 = 0U;
    var3 = arg4;
    val7 = arg3 + 18446744073709551615UL;
    var1 = val7;
    __kmpc_for_static_init_8(&_loc_dummy, val6, 34U, &var2, &var0, &var1, &var3, 1UL, 1UL);
    val8 = var0;
    val9 = var1;
    val10 = ((long)val9 > (long)val7 ? val7 : val9);
    var1 = val10;
    if ((long)val8 <= (long)val10) {
        phi13 = val8;
        do {
            val14 = (unsigned int)phi13;
            *(double *)(&val4[phi13 << 3UL]) = val14 * 3.1415926535897931;
            phi11 = 0UL;
            do {
                *(double *)(&(&val5[phi13 * 320000UL])[phi11 << 3UL]) = val14 * (double)((unsigned int)phi11 + 1U) / 4.0E+4;
                val12 = phi11 + 1UL;
                phi11 = val12;
            } while (val12 != 40000UL);
            phi13 = phi13 + 1UL;
        } while (phi13 != val10);
    }
    if ((long)val8 > (long)val10 || !(phi13 != val10 || (long)val8 > (long)val10 || val12 != 40000UL)) {
        __kmpc_for_static_fini(&_loc_dummy, val6);
        return;
    }
}
