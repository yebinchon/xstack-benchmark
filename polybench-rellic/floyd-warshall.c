unsigned int main(unsigned int argc, unsigned char **argv);
struct struct__IO_marker {
};
struct struct__IO_codecvt {
};
struct struct__IO_wide_data {
};
struct struct__IO_FILE {
    unsigned int field0;
    unsigned char *field1;
    unsigned char *field2;
    unsigned char *field3;
    unsigned char *field4;
    unsigned char *field5;
    unsigned char *field6;
    unsigned char *field7;
    unsigned char *field8;
    unsigned char *field9;
    unsigned char *field10;
    unsigned char *field11;
    struct struct__IO_marker *field12;
    struct struct__IO_FILE *field13;
    unsigned int field14;
    unsigned int field15;
    unsigned long field16;
    unsigned short field17;
    unsigned char field18;
    unsigned char field19[1];
    unsigned char *field20;
    unsigned long field21;
    struct struct__IO_codecvt *field22;
    struct struct__IO_wide_data *field23;
    struct struct__IO_FILE *field24;
    unsigned char *field25;
    unsigned long field26;
    unsigned int field27;
    unsigned char field28[20];
};
unsigned long strtol(unsigned char *arg0, unsigned char **arg1, unsigned int arg2);
unsigned char *malloc(unsigned long arg0);
unsigned int fprintf(struct struct__IO_FILE *arg0, unsigned char *arg1, ...);
unsigned int fputc(unsigned int arg0, struct struct__IO_FILE *arg1);
void free(unsigned char *arg0);
struct struct__IO_FILE *stderr;
unsigned char _str[8] = "%0.2lf \000";
unsigned int main(unsigned int argc, unsigned char **argv) {
    unsigned char *val0;
    unsigned long call1;
    unsigned char *call2;
    double *val3;
    unsigned long phi4;
    unsigned long val5;
    unsigned long phi6;
    unsigned long val7;
    unsigned long phi8;
    unsigned long phi9;
    double *val10;
    unsigned long phi11;
    double *val12;
    double val13;
    double val14;
    double val15;
    double val16;
    unsigned long val17;
    unsigned long val18;
    unsigned long val19;
    unsigned long phi20;
    unsigned long phi21;
    struct struct__IO_FILE *val22;
    unsigned long val23;
    double val24;
    unsigned int call25;
    struct struct__IO_FILE *val26;
    unsigned int call27;
    unsigned long val28;
    unsigned long val29;
    struct struct__IO_FILE *val30;
    unsigned int call31;
    val0 = argv[1UL];
    call1 = strtol(val0, (void *)0U, 10U);
    call2 = malloc(8388608UL);
    val3 = (double *)call2;
    phi4 = 0UL;
    do {
        val5 = phi4 + 1UL;
        phi6 = 0UL;
        do {
            val7 = phi6 + 1UL;
            val3[phi6 + (phi4 << 10UL)] = (double)(unsigned int)val5 * (double)(unsigned int)val7 * 9.765625E-4;
            phi6 = val7;
        } while (val7 != 1024UL);
        if (val7 == 1024UL) {
            phi4 = val5;
        }
    } while (!(val7 == 1024UL && val5 == 1024UL));
    if (val7 == 1024UL && val5 == 1024UL) {
        phi8 = 0UL;
        do {
            if (val7 == 1024UL && val5 == 1024UL) {
                phi9 = 0UL;
                do {
                    if (val7 == 1024UL && val5 == 1024UL) {
                        val10 = &val3[phi9 << 10UL];
                        phi11 = 0UL;
                        do {
                            if (val7 == 1024UL && val5 == 1024UL) {
                                val12 = &val10[phi11];
                                val13 = *val12;
                                val14 = val10[phi8];
                                val15 = val3[phi11 + (phi8 << 10UL)];
                                val16 = val14 + val15;
                                *val12 = (val13 < val16 ? val13 : val16);
                                val17 = phi11 + 1UL;
                                phi11 = val17;
                            }
                        } while (!(val7 == 1024UL && val5 == 1024UL && val17 == 1024UL));
                    }
                    if (val7 == 1024UL && val5 == 1024UL && val17 == 1024UL) {
                        val18 = phi9 + 1UL;
                        phi9 = val18;
                    }
                } while (!(val7 == 1024UL && val5 == 1024UL && val17 == 1024UL && val18 == 1024UL));
            }
            if (val7 == 1024UL && val5 == 1024UL && val17 == 1024UL && val18 == 1024UL) {
                val19 = phi8 + 1UL;
                phi8 = val19;
            }
        } while (!(val7 == 1024UL && val5 == 1024UL && val17 == 1024UL && val18 == 1024UL && val19 == 1024UL));
    }
    if (val7 == 1024UL && val5 == 1024UL && val17 == 1024UL && val18 == 1024UL && val19 == 1024UL) {
        if ((unsigned int)call1 == 1U) {
            phi20 = 0UL;
            do {
                if (val7 == 1024UL && val5 == 1024UL && val17 == 1024UL && val18 == 1024UL && val19 == 1024UL && (unsigned int)call1 == 1U) {
                    phi21 = 0UL;
                    do {
                        if (val7 == 1024UL && val5 == 1024UL && val17 == 1024UL && val18 == 1024UL && val19 == 1024UL && (unsigned int)call1 == 1U) {
                            val22 = stderr;
                            val23 = phi21 + (phi20 << 10UL);
                            val24 = val3[val23];
                            call25 = fprintf(val22, _str, val24);
                            if ((unsigned int)(unsigned int)val23 % 20U == 0U) {
                                val26 = stderr;
                                call27 = fputc(10U, val26);
                            }
                            if ((unsigned int)call1 == 1U && val19 == 1024UL && val18 == 1024UL && val17 == 1024UL && val7 == 1024UL && val5 == 1024UL) {
                                val28 = phi21 + 1UL;
                                phi21 = val28;
                            }
                        }
                    } while (!((unsigned int)call1 == 1U && val19 == 1024UL && val18 == 1024UL && val17 == 1024UL && val7 == 1024UL && val5 == 1024UL && val28 == 1024UL));
                }
                if ((unsigned int)call1 == 1U && val19 == 1024UL && val18 == 1024UL && val17 == 1024UL && val7 == 1024UL && val5 == 1024UL && val28 == 1024UL) {
                    val29 = phi20 + 1UL;
                    phi20 = val29;
                }
            } while (!((unsigned int)call1 == 1U && val19 == 1024UL && val18 == 1024UL && val17 == 1024UL && val7 == 1024UL && val5 == 1024UL && val28 == 1024UL && val29 == 1024UL));
        }
        if ((unsigned int)call1 == 1U && val19 == 1024UL && val18 == 1024UL && val17 == 1024UL && val7 == 1024UL && val5 == 1024UL && val28 == 1024UL && val29 == 1024UL) {
            val30 = stderr;
            call31 = fputc(10U, val30);
        }
    }
    if (!((unsigned int)call1 == 1U || val19 != 1024UL || val18 != 1024UL || val17 != 1024UL || val7 != 1024UL || val5 != 1024UL) || !(val29 != 1024UL || val28 != 1024UL || (unsigned int)call1 != 1U || val19 != 1024UL || val18 != 1024UL || val17 != 1024UL || val7 != 1024UL || val5 != 1024UL)) {
        free(call2);
        return 0U;
    }
}
