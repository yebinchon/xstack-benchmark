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
    unsigned char *call4;
    double *val5;
    unsigned char *call6;
    double *val7;
    unsigned long phi8;
    double val9;
    unsigned long phi10;
    unsigned long val11;
    unsigned long val12;
    unsigned int val13;
    unsigned long val14;
    unsigned int phi15;
    unsigned long phi16;
    unsigned long val17;
    double *val18;
    double *val19;
    double val20;
    double val21;
    double phi22;
    double phi23;
    unsigned long phi24;
    double *val25;
    double val26;
    double val27;
    double val28;
    double *val29;
    double val30;
    double val31;
    unsigned long val32;
    unsigned long val33;
    unsigned long phi34;
    unsigned long val35;
    double *val36;
    double val37;
    double val38;
    unsigned long val39;
    unsigned long phi40;
    unsigned long val41;
    double *val42;
    unsigned long phi43;
    double *val44;
    double val45;
    unsigned long val46;
    double val47;
    unsigned long val48;
    double val49;
    double val50;
    unsigned long val51;
    unsigned long val52;
    unsigned long phi53;
    unsigned long phi54;
    unsigned long val55;
    double *val56;
    double val57;
    unsigned long val58;
    double val59;
    double val60;
    double val61;
    double *val62;
    double val63;
    unsigned long val64;
    unsigned long val65;
    unsigned long phi66;
    unsigned long val67;
    double *val68;
    double val69;
    double val70;
    unsigned long val71;
    unsigned long phi72;
    unsigned long phi73;
    unsigned long val74;
    unsigned long val75;
    double *val76;
    double val77;
    unsigned long val78;
    double val79;
    double val80;
    double val81;
    unsigned long val82;
    unsigned long val83;
    unsigned int val84;
    unsigned long phi85;
    unsigned long phi86;
    struct struct__IO_FILE *val87;
    unsigned long val88;
    double val89;
    unsigned int call90;
    struct struct__IO_FILE *val91;
    unsigned int call92;
    unsigned long val93;
    unsigned long val94;
    struct struct__IO_FILE *val95;
    unsigned int call96;
    val0 = argv[1UL];
    call1 = strtol(val0, (void *)0U, 10U);
    call2 = malloc(536870912UL);
    val3 = (double *)call2;
    call4 = malloc(536870912UL);
    val5 = (double *)call4;
    call6 = malloc(536870912UL);
    val7 = (double *)call6;
    phi8 = 0UL;
    do {
        val9 = (unsigned int)phi8;
        phi10 = 0UL;
        do {
            val11 = phi10 + 1UL;
            val12 = phi10 + (phi8 << 13UL);
            val3[val12] = (val9 * (double)(unsigned int)val11 + 1.) * 1.220703125E-4;
            val13 = phi10;
            val5[val12] = (val9 * (double)(val13 + 2U) + 2.) * 1.220703125E-4;
            val7[val12] = (val9 * (double)(val13 + 3U) + 3.) * 1.220703125E-4;
            phi10 = val11;
        } while (val11 != 8192UL);
        if (val11 == 8192UL) {
            val14 = phi8 + 1UL;
            phi8 = val14;
        }
    } while (!(val11 == 8192UL && val14 == 8192UL));
    if (val11 == 8192UL && val14 == 8192UL) {
        phi15 = 0U;
        do {
            if (val11 == 8192UL && val14 == 8192UL) {
                phi16 = 0UL;
                do {
                    if (val11 == 8192UL && val14 == 8192UL) {
                        val17 = phi16 << 13UL;
                        val18 = &val3[val17];
                        val19 = &val7[val17];
                        val20 = *val19;
                        val21 = *val18;
                        phi24 = 1UL;
                        phi23 = val20;
                        phi22 = val21;
                        do {
                            if (val11 == 8192UL && val14 == 8192UL) {
                                val25 = &val18[phi24];
                                val26 = *val25;
                                val27 = val5[phi24 + val17];
                                val28 = val26 - phi22 * val27 / phi23;
                                *val25 = val28;
                                val29 = &val19[phi24];
                                val30 = *val29;
                                val31 = val30 - val27 * val27 / phi23;
                                *val29 = val31;
                                val32 = phi24 + 1UL;
                                phi24 = val32;
                                phi23 = val31;
                                phi22 = val28;
                            }
                        } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL));
                    }
                    if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL) {
                        val33 = phi16 + 1UL;
                        phi16 = val33;
                    }
                } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL));
            }
            if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL) {
                phi34 = 0UL;
                do {
                    if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL) {
                        val35 = phi34 << 13UL | 8191UL;
                        val36 = &val3[val35];
                        val37 = *val36;
                        val38 = val7[val35];
                        *val36 = val37 / val38;
                        val39 = phi34 + 1UL;
                        phi34 = val39;
                    }
                } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL));
            }
            if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL) {
                phi40 = 0UL;
                do {
                    if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL) {
                        val41 = phi40 << 13UL;
                        val42 = &val3[val41];
                        phi43 = 0UL;
                        do {
                            if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL) {
                                val44 = &val42[8190UL - phi43];
                                val45 = *val44;
                                val46 = 8189UL - phi43;
                                val47 = val42[val46];
                                val48 = val46 + val41;
                                val49 = val5[val48];
                                val50 = val7[val48];
                                *val44 = (val45 - val47 * val49) / val50;
                                val51 = phi43 + 1UL;
                                phi43 = val51;
                            }
                        } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL));
                    }
                    if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL) {
                        val52 = phi40 + 1UL;
                        phi40 = val52;
                    }
                } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL));
            }
            if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL) {
                phi53 = 1UL;
                do {
                    if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL) {
                        phi54 = 0UL;
                        do {
                            if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL) {
                                val55 = phi54 + (phi53 << 13UL);
                                val56 = &val3[val55];
                                val57 = *val56;
                                val58 = val55 + 18446744073709543424UL;
                                val59 = val3[val58];
                                val60 = val5[val55];
                                val61 = val7[val58];
                                *val56 = val57 - val59 * val60 / val61;
                                val62 = &val7[val55];
                                val63 = *val62;
                                *val62 = val63 - val60 * val60 / val61;
                                val64 = phi54 + 1UL;
                                phi54 = val64;
                            }
                        } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL));
                    }
                    if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL) {
                        val65 = phi53 + 1UL;
                        phi53 = val65;
                    }
                } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL));
            }
            if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL) {
                phi66 = 0UL;
                do {
                    if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL) {
                        val67 = phi66 + 67100672UL;
                        val68 = &val3[val67];
                        val69 = *val68;
                        val70 = val7[val67];
                        *val68 = val69 / val70;
                        val71 = phi66 + 1UL;
                        phi66 = val71;
                    }
                } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL));
            }
            if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL) {
                phi72 = 0UL;
                do {
                    if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL) {
                        phi73 = 0UL;
                        do {
                            if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL) {
                                val74 = phi73 + phi72 * 18446744073709543424UL;
                                val75 = val74 + 67092480UL;
                                val76 = &val3[val75];
                                val77 = *val76;
                                val78 = val74 + 67084288UL;
                                val79 = val3[val78];
                                val80 = val5[val78];
                                val81 = val7[val75];
                                *val76 = (val77 - val79 * val80) / val81;
                                val82 = phi73 + 1UL;
                                phi73 = val82;
                            }
                        } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL && val82 == 8192UL));
                    }
                    if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL && val82 == 8192UL) {
                        val83 = phi72 + 1UL;
                        phi72 = val83;
                    }
                } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL && val82 == 8192UL && val83 == 8190UL));
            }
            if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL && val82 == 8192UL && val83 == 8190UL) {
                val84 = phi15 + 1U;
                phi15 = val84;
            }
        } while (!(val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL && val82 == 8192UL && val83 == 8190UL && val84 == 50U));
    }
    if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL && val82 == 8192UL && val83 == 8190UL && val84 == 50U) {
        if ((unsigned int)call1 == 1U) {
            phi85 = 0UL;
            do {
                if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL && val82 == 8192UL && val83 == 8190UL && val84 == 50U && (unsigned int)call1 == 1U) {
                    phi86 = 0UL;
                    do {
                        if (val11 == 8192UL && val14 == 8192UL && val32 == 8192UL && val33 == 8192UL && val39 == 8192UL && val51 == 8190UL && val52 == 8192UL && val64 == 8192UL && val65 == 8192UL && val71 == 8192UL && val82 == 8192UL && val83 == 8190UL && val84 == 50U && (unsigned int)call1 == 1U) {
                            val87 = stderr;
                            val88 = phi86 + (phi85 << 13UL);
                            val89 = val3[val88];
                            call90 = fprintf(val87, _str, val89);
                            if ((unsigned int)(unsigned int)val88 % 20U == 0U) {
                                val91 = stderr;
                                call92 = fputc(10U, val91);
                            }
                            if ((unsigned int)call1 == 1U && val84 == 50U && val83 == 8190UL && val82 == 8192UL && val71 == 8192UL && val65 == 8192UL && val64 == 8192UL && val52 == 8192UL && val51 == 8190UL && val39 == 8192UL && val33 == 8192UL && val32 == 8192UL && val11 == 8192UL && val14 == 8192UL) {
                                val93 = phi86 + 1UL;
                                phi86 = val93;
                            }
                        }
                    } while (!((unsigned int)call1 == 1U && val84 == 50U && val83 == 8190UL && val82 == 8192UL && val71 == 8192UL && val65 == 8192UL && val64 == 8192UL && val52 == 8192UL && val51 == 8190UL && val39 == 8192UL && val33 == 8192UL && val32 == 8192UL && val11 == 8192UL && val14 == 8192UL && val93 == 8192UL));
                }
                if ((unsigned int)call1 == 1U && val84 == 50U && val83 == 8190UL && val82 == 8192UL && val71 == 8192UL && val65 == 8192UL && val64 == 8192UL && val52 == 8192UL && val51 == 8190UL && val39 == 8192UL && val33 == 8192UL && val32 == 8192UL && val11 == 8192UL && val14 == 8192UL && val93 == 8192UL) {
                    val94 = phi85 + 1UL;
                    phi85 = val94;
                }
            } while (!((unsigned int)call1 == 1U && val84 == 50U && val83 == 8190UL && val82 == 8192UL && val71 == 8192UL && val65 == 8192UL && val64 == 8192UL && val52 == 8192UL && val51 == 8190UL && val39 == 8192UL && val33 == 8192UL && val32 == 8192UL && val11 == 8192UL && val14 == 8192UL && val93 == 8192UL && val94 == 8192UL));
        }
        if ((unsigned int)call1 == 1U && val84 == 50U && val83 == 8190UL && val82 == 8192UL && val71 == 8192UL && val65 == 8192UL && val64 == 8192UL && val52 == 8192UL && val51 == 8190UL && val39 == 8192UL && val33 == 8192UL && val32 == 8192UL && val11 == 8192UL && val14 == 8192UL && val93 == 8192UL && val94 == 8192UL) {
            val95 = stderr;
            call96 = fputc(10U, val95);
        }
    }
    if (!(val83 != 8190UL || val82 != 8192UL || val71 != 8192UL || val65 != 8192UL || val64 != 8192UL || val52 != 8192UL || val51 != 8190UL || val39 != 8192UL || val33 != 8192UL || val32 != 8192UL || val11 != 8192UL || val14 != 8192UL || val84 != 50U || (unsigned int)call1 == 1U) || !(val94 != 8192UL || val93 != 8192UL || (unsigned int)call1 != 1U || val84 != 50U || val83 != 8190UL || val82 != 8192UL || val71 != 8192UL || val65 != 8192UL || val64 != 8192UL || val52 != 8192UL || val51 != 8190UL || val39 != 8192UL || val33 != 8192UL || val32 != 8192UL || val11 != 8192UL || val14 != 8192UL)) {
        free(call2);
        free(call4);
        free(call6);
        return 0U;
    }
}
