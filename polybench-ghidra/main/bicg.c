
int main(int argc,char **argv)

{
  double dVar1;
  double dVar2;
  double dVar3;
  double dVar4;
  double dVar5;
  uint uVar6;
  long lVar7;
  void *__ptr;
  void *__s;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  void *pvVar8;
  long lVar9;
  short sVar10;
  int iVar11;
  long lVar12;
  double dVar13;
  int local_48;
  void *local_38;
  
  lVar12 = 0;
  lVar7 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc(12800000000);
  __s = malloc(320000);
  __ptr_00 = malloc(320000);
  __ptr_01 = malloc(320000);
  __ptr_02 = malloc(320000);
  dVar1 = DAT_00402008;
  do {
    iVar11 = (int)lVar12;
    *(double *)((long)__ptr_01 + lVar12 * 8) = (double)iVar11 * dVar1;
    *(double *)((long)__ptr_01 + lVar12 * 8 + 8) = (double)(iVar11 + 1) * dVar1;
    *(double *)((long)__ptr_01 + lVar12 * 8 + 0x10) = (double)(iVar11 + 2) * dVar1;
    *(double *)((long)__ptr_01 + lVar12 * 8 + 0x18) = (double)(iVar11 + 3) * dVar1;
    *(double *)((long)__ptr_01 + lVar12 * 8 + 0x20) = (double)(iVar11 + 4) * dVar1;
    lVar12 = lVar12 + 5;
  } while (lVar12 != 40000);
  lVar12 = 0;
  local_38 = __ptr_02;
  memset(__s,0,320000);
  pvVar8 = __ptr;
  do {
    *(undefined8 *)((long)__ptr_00 + lVar12 * 8) = 0;
    dVar1 = *(double *)((long)__ptr_02 + lVar12 * 8);
    dVar13 = 0.0;
    lVar9 = 1;
    do {
      dVar2 = *(double *)((long)pvVar8 + lVar9 * 8 + -8);
      dVar3 = *(double *)((long)__ptr_01 + lVar9 * 8 + -8);
      *(double *)((long)__s + lVar9 * 8 + -8) =
           dVar1 * dVar2 + *(double *)((long)__s + lVar9 * 8 + -8);
      dVar4 = *(double *)((long)pvVar8 + lVar9 * 8);
      dVar5 = *(double *)((long)__ptr_01 + lVar9 * 8);
      *(double *)((long)__s + lVar9 * 8) = dVar1 * dVar4 + *(double *)((long)__s + lVar9 * 8);
      dVar13 = dVar4 * dVar5 + dVar2 * dVar3 + dVar13;
      lVar9 = lVar9 + 2;
    } while (lVar9 != 0x9c41);
    *(double *)((long)__ptr_00 + lVar12 * 8) = dVar13;
    lVar12 = lVar12 + 1;
    pvVar8 = (void *)((long)pvVar8 + 320000);
  } while (lVar12 != 40000);
  local_48 = (int)lVar7;
  if (local_48 == 1) {
    lVar7 = -320000;
    uVar6 = 0;
    sVar10 = 0;
    do {
      fprintf(*(FILE **)((long)__s + lVar7 + 320000),(char *)stderr,"%0.2lf ");
      if ((ushort)(((ushort)((uVar6 & 0xffff) / 5) & 0xfffc) * 5 + sVar10) == 0) {
        fputc(10,stderr);
      }
      sVar10 = sVar10 + -1;
      uVar6 = uVar6 + 1;
      lVar7 = lVar7 + 8;
    } while (lVar7 != 0);
    lVar7 = -320000;
    uVar6 = 0;
    sVar10 = 0;
    do {
      fprintf(*(FILE **)((long)__ptr_00 + lVar7 + 320000),(char *)stderr,"%0.2lf ");
      if ((ushort)(((ushort)((uVar6 & 0xffff) / 5) & 0xfffc) * 5 + sVar10) == 0) {
        fputc(10,stderr);
      }
      sVar10 = sVar10 + -1;
      uVar6 = uVar6 + 1;
      lVar7 = lVar7 + 8;
    } while (lVar7 != 0);
    fputc(10,stderr);
  }
  free(__ptr);
  free(__s);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  return 0;
}


