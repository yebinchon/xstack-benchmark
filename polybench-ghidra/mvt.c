
int main(int argc,char **argv)

{
  uint uVar1;
  long lVar2;
  double *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  void *__ptr_03;
  double *pdVar3;
  short sVar4;
  long lVar5;
  long lVar6;
  double *pdVar7;
  double dVar8;
  int dump_code;
  int local_48;
  
  lVar6 = 0;
  lVar2 = strtol(argv[1],(char **)0x0,10);
  __ptr = (double *)malloc(128000000);
  __ptr_00 = malloc(32000);
  __ptr_01 = malloc(32000);
  __ptr_02 = malloc(32000);
  __ptr_03 = malloc(32000);
  pdVar3 = __ptr + 1;
  do {
    dVar8 = (double)(int)lVar6;
    *(double *)((long)__ptr_00 + lVar6 * 8) = dVar8 / 4000.0;
    *(double *)((long)__ptr_01 + lVar6 * 8) = (dVar8 + 1.0) / 4000.0;
    *(double *)((long)__ptr_02 + lVar6 * 8) = (dVar8 + 3.0) / 4000.0;
    *(double *)((long)__ptr_03 + lVar6 * 8) = (dVar8 + 4.0) / 4000.0;
    lVar5 = 0;
    do {
      pdVar3[lVar5 + -1] = ((double)(int)lVar5 * dVar8) / 4000.0;
      pdVar3[lVar5] = ((double)((int)lVar5 + 1) * dVar8) / 4000.0;
      lVar5 = lVar5 + 2;
    } while (lVar5 != 4000);
    lVar6 = lVar6 + 1;
    pdVar3 = pdVar3 + 4000;
  } while (lVar6 != 4000);
  lVar6 = 0;
  pdVar3 = __ptr;
  do {
    dVar8 = *(double *)((long)__ptr_00 + lVar6 * 8);
    lVar5 = 4;
    do {
      dVar8 = pdVar3[lVar5] * *(double *)((long)__ptr_02 + lVar5 * 8) +
              pdVar3[lVar5 + -1] * *(double *)((long)__ptr_02 + lVar5 * 8 + -8) +
              pdVar3[lVar5 + -2] * *(double *)((long)__ptr_02 + lVar5 * 8 + -0x10) +
              pdVar3[lVar5 + -3] * *(double *)((long)__ptr_02 + lVar5 * 8 + -0x18) +
              pdVar3[lVar5 + -4] * *(double *)((long)__ptr_02 + lVar5 * 8 + -0x20) + dVar8;
      lVar5 = lVar5 + 5;
    } while (lVar5 != 0xfa4);
    *(double *)((long)__ptr_00 + lVar6 * 8) = dVar8;
    lVar6 = lVar6 + 1;
    pdVar3 = pdVar3 + 4000;
  } while (lVar6 != 4000);
  lVar6 = 0;
  pdVar3 = __ptr;
  do {
    dVar8 = *(double *)((long)__ptr_01 + lVar6 * 8);
    lVar5 = 3;
    pdVar7 = pdVar3;
    do {
      dVar8 = pdVar7[12000] * *(double *)((long)__ptr_03 + lVar5 * 8) +
              pdVar7[8000] * *(double *)((long)__ptr_03 + lVar5 * 8 + -8) +
              pdVar7[4000] * *(double *)((long)__ptr_03 + lVar5 * 8 + -0x10) +
              *pdVar7 * *(double *)((long)__ptr_03 + lVar5 * 8 + -0x18) + dVar8;
      pdVar7 = pdVar7 + 16000;
      lVar5 = lVar5 + 4;
    } while (lVar5 != 0xfa3);
    *(double *)((long)__ptr_01 + lVar6 * 8) = dVar8;
    lVar6 = lVar6 + 1;
    pdVar3 = pdVar3 + 1;
  } while (lVar6 != 4000);
  local_48 = (int)lVar2;
  if (local_48 == 1) {
    uVar1 = 0;
    sVar4 = 0;
    lVar2 = 0;
    do {
      fprintf(*(FILE **)((long)__ptr_00 + lVar2),(char *)stderr,"%0.2lf");
      fprintf(*(FILE **)((long)__ptr_01 + lVar2),(char *)stderr,"%0.2lf");
      if ((ushort)(((ushort)((uVar1 & 0xffff) / 5) & 0xfffc) * 5 + sVar4) == 0) {
        fputc(10,stderr);
      }
      lVar2 = lVar2 + 8;
      sVar4 = sVar4 + -1;
      uVar1 = uVar1 + 1;
    } while (lVar2 != 32000);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  free(__ptr_03);
  return 0;
}

