
int main(int argc,char **argv)

{
  size_t sVar1;
  double dVar2;
  double dVar3;
  double dVar4;
  double dVar5;
  double dVar6;
  ulong uVar7;
  long lVar8;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  void *__ptr_03;
  void *__s;
  void *__s_00;
  void *__ptr_04;
  void *__ptr_05;
  long lVar9;
  ulong uVar10;
  ulong uVar11;
  long lVar12;
  uint uVar13;
  double dVar14;
  double dVar15;
  double dVar16;
  double_0_ *x;
  double_0_ *y;
  double_0_ *v2;
  int dump_code;
  int local_e0;
  undefined8 local_d8;
  undefined8 local_d0;
  void *local_c0;
  void *local_b8;
  void *local_a8;
  void *local_a0;
  undefined8 *local_98;
  void *local_90;
  void *local_80;
  void *local_78;
  undefined8 *local_70;
  void *local_68;
  void *local_58;
  void *local_50;
  void *local_48;
  void *local_40;
  void *local_38;
  
  uVar7 = strtol(argv[2],(char **)0x0,10);
  lVar8 = strtol(argv[1],(char **)0x0,10);
  uVar13 = (uint)uVar7;
  __ptr = malloc((ulong)(uVar13 * uVar13) << 3);
  sVar1 = (long)(int)uVar13 * 8;
  __ptr_00 = malloc(sVar1);
  __ptr_01 = malloc(sVar1);
  __ptr_02 = malloc(sVar1);
  __ptr_03 = malloc(sVar1);
  __s = malloc(sVar1);
  __s_00 = malloc(sVar1);
  __ptr_04 = malloc(sVar1);
  __ptr_05 = malloc(sVar1);
  uVar7 = uVar7 & 0xffffffff;
  if (0 < (int)uVar13) {
    dVar14 = (double)uVar13;
    sVar1 = uVar7 * 8;
    memset(__s_00,0,sVar1);
    memset(__s,0,sVar1);
    dVar6 = DAT_00402028;
    dVar5 = DAT_00402020;
    dVar4 = DAT_00402018;
    dVar3 = DAT_00402010;
    dVar2 = DAT_00402008;
    lVar12 = (long)__ptr + 8;
    uVar10 = 0;
    do {
      uVar11 = uVar10 + 1;
      dVar15 = (double)(int)uVar10;
      dVar16 = (double)((int)uVar11 / (int)uVar13);
      *(double *)((long)__ptr_00 + uVar10 * 8) = dVar15;
      *(double *)((long)__ptr_02 + uVar10 * 8) = dVar16 * dVar2;
      *(double *)((long)__ptr_01 + uVar10 * 8) = dVar16 * dVar3;
      *(double *)((long)__ptr_03 + uVar10 * 8) = dVar16 / dVar4;
      *(double *)((long)__ptr_04 + uVar10 * 8) = dVar16 * dVar5;
      *(double *)((long)__ptr_05 + uVar10 * 8) = dVar16 / dVar6;
      lVar9 = 0;
      if (uVar7 != 1) {
        do {
          *(double *)(lVar12 + -8 + lVar9 * 8) = ((double)(int)lVar9 * dVar15) / dVar14;
          *(double *)(lVar12 + lVar9 * 8) = ((double)((int)lVar9 + 1) * dVar15) / dVar14;
          lVar9 = lVar9 + 2;
        } while (uVar7 - (uVar13 & 1) != lVar9);
      }
      if ((ulong)(uVar13 & 1) != 0) {
        *(double *)((long)__ptr + lVar9 * 8 + uVar10 * uVar7 * 8) =
             (dVar15 * (double)(int)lVar9) / dVar14;
      }
      lVar12 = lVar12 + sVar1;
      uVar10 = uVar11;
    } while (uVar11 != uVar7);
  }
  local_d8 = 0x40c80c8000000000;
  local_d0 = 0x40e5418000000000;
  local_58 = __ptr;
  local_50 = __ptr_00;
  local_48 = __ptr_01;
  local_40 = __ptr_02;
  local_38 = __ptr_03;
  local_98 = &local_d8;
  local_a8 = __s_00;
  local_a0 = __ptr;
  local_90 = __ptr_04;
  local_c0 = __s_00;
  local_b8 = __ptr_05;
  local_70 = &local_d0;
  local_80 = __s;
  local_78 = __ptr;
  local_68 = __s_00;
  local_e0 = (int)lVar8;
  if ((local_e0 == 1) && (0 < (int)uVar13)) {
    uVar10 = 0;
    do {
      while (fprintf(*(FILE **)((long)__s + uVar10 * 8),(char *)stderr,"%0.2lf "),
            (int)uVar10 == (int)((uVar10 & 0xffffffff) / 0x14) * 0x14) {
        fputc(10,stderr);
        uVar10 = uVar10 + 1;
        if (uVar7 == uVar10) goto LAB_0040158c;
      }
      uVar10 = uVar10 + 1;
    } while (uVar7 != uVar10);
  }
LAB_0040158c:
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  free(__ptr_03);
  free(__s);
  free(__s_00);
  free(__ptr_04);
  free(__ptr_05);
  return 0;
}


