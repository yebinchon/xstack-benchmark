
int main(int argc,char **argv)

{
  double *pdVar1;
  double *pdVar2;
  double *pdVar3;
  double *pdVar4;
  double *pdVar5;
  double dVar6;
  double dVar7;
  double dVar8;
  double dVar9;
  double dVar10;
  long lVar11;
  void *__ptr;
  void *__ptr_00;
  void *__s;
  void *pvVar12;
  long lVar13;
  short sVar14;
  int iVar15;
  ushort uVar16;
  long lVar17;
  double dVar18;
  
  lVar17 = 0;
  lVar11 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc(128000000);
  __ptr_00 = malloc(32000);
  __s = malloc(32000);
  do {
    iVar15 = (int)lVar17;
    *(double *)((long)__ptr_00 + lVar17 * 8) = (double)iVar15 * 3.141592653589793;
    *(double *)((long)__ptr_00 + lVar17 * 8 + 8) = (double)(iVar15 + 1) * 3.141592653589793;
    *(double *)((long)__ptr_00 + lVar17 * 8 + 0x10) = (double)(iVar15 + 2) * 3.141592653589793;
    *(double *)((long)__ptr_00 + lVar17 * 8 + 0x18) = (double)(iVar15 + 3) * 3.141592653589793;
    *(double *)((long)__ptr_00 + lVar17 * 8 + 0x20) = (double)(iVar15 + 4) * 3.141592653589793;
    lVar17 = lVar17 + 5;
  } while (lVar17 != 4000);
  lVar17 = 0;
  pvVar12 = __ptr;
  do {
    lVar13 = 1;
    iVar15 = 2;
    do {
      *(double *)((long)pvVar12 + lVar13 * 8 + -8) =
           ((double)(int)lVar13 * (double)(int)lVar17) / 4000.0;
      *(double *)((long)pvVar12 + lVar13 * 8) = ((double)iVar15 * (double)(int)lVar17) / 4000.0;
      lVar13 = lVar13 + 2;
      iVar15 = iVar15 + 2;
    } while (lVar13 != 0xfa1);
    lVar17 = lVar17 + 1;
    pvVar12 = (void *)((long)pvVar12 + 32000);
  } while (lVar17 != 4000);
  lVar17 = 0;
  memset(__s,0,32000);
  pvVar12 = __ptr;
  do {
    dVar18 = 0.0;
    lVar13 = 4;
    do {
      dVar18 = *(double *)((long)pvVar12 + lVar13 * 8) * *(double *)((long)__ptr_00 + lVar13 * 8) +
               *(double *)((long)pvVar12 + lVar13 * 8 + -8) *
               *(double *)((long)__ptr_00 + lVar13 * 8 + -8) +
               *(double *)((long)pvVar12 + lVar13 * 8 + -0x10) *
               *(double *)((long)__ptr_00 + lVar13 * 8 + -0x10) +
               *(double *)((long)pvVar12 + lVar13 * 8 + -0x18) *
               *(double *)((long)__ptr_00 + lVar13 * 8 + -0x18) +
               *(double *)((long)pvVar12 + lVar13 * 8 + -0x20) *
               *(double *)((long)__ptr_00 + lVar13 * 8 + -0x20) + dVar18;
      lVar13 = lVar13 + 5;
    } while (lVar13 != 0xfa4);
    lVar13 = 6;
    do {
      pdVar1 = (double *)((long)pvVar12 + lVar13 * 8 + -0x30);
      pdVar2 = (double *)((long)pvVar12 + lVar13 * 8 + -0x20);
      dVar8 = *pdVar2;
      pdVar3 = (double *)((long)__s + lVar13 * 8 + -0x30);
      pdVar4 = (double *)((long)__s + lVar13 * 8 + -0x20);
      dVar6 = pdVar4[1] + pdVar2[1] * dVar18;
      pdVar5 = (double *)((long)__s + lVar13 * 8 + -0x10);
      dVar7 = pdVar5[1];
      pdVar2 = (double *)((long)__s + lVar13 * 8);
      dVar9 = *pdVar2;
      dVar10 = pdVar2[1];
      *(undefined (*) [16])((long)__s + lVar13 * 8 + -0x30) =
           CONCAT88(pdVar3[1] + pdVar1[1] * dVar18,*pdVar3 + *pdVar1 * dVar18);
      *(undefined (*) [16])((long)__s + lVar13 * 8 + -0x20) =
           CONCAT412((int)((ulong)dVar6 >> 0x20),CONCAT48(SUB84(dVar6,0),*pdVar4 + dVar8 * dVar18));
      pdVar1 = (double *)((long)pvVar12 + lVar13 * 8 + -0x10);
      pdVar2 = (double *)((long)pvVar12 + lVar13 * 8);
      dVar6 = *pdVar2;
      dVar8 = pdVar2[1];
      dVar7 = pdVar1[1] * dVar18 + dVar7;
      *(undefined (*) [16])((long)__s + lVar13 * 8 + -0x10) =
           CONCAT412((int)((ulong)dVar7 >> 0x20),CONCAT48(SUB84(dVar7,0),*pdVar1 * dVar18 + *pdVar5)
                    );
      *(undefined (*) [16])((long)__s + lVar13 * 8) =
           CONCAT88(dVar8 * dVar18 + dVar10,dVar6 * dVar18 + dVar9);
      lVar13 = lVar13 + 8;
    } while (lVar13 != 0xfa6);
    lVar17 = lVar17 + 1;
    pvVar12 = (void *)((long)pvVar12 + 32000);
  } while (lVar17 != 4000);
  if ((int)lVar11 == 1) {
    lVar11 = -32000;
    uVar16 = 0;
    sVar14 = 0;
    do {
      fprintf(*(FILE **)((long)__s + lVar11 + 32000),(char *)stderr,"%0.2lf ");
      if ((ushort)((uVar16 / 5 & 0xfffc) * 5 + sVar14) == 0) {
        fputc(10,stderr);
      }
      sVar14 = sVar14 + -1;
      uVar16 = uVar16 + 1;
      lVar11 = lVar11 + 8;
    } while (lVar11 != 0);
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__s);
  return 0;
}

