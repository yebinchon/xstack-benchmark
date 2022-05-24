
int main(int argc,char **argv)

{
  double *pdVar1;
  long lVar2;
  void *__ptr;
  long lVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  void *pvVar8;
  long lVar9;
  int iVar10;
  int iVar11;
  long lVar12;
  double *pdVar13;
  long lVar14;
  ulong uVar15;
  double dVar16;
  double dVar17;
  undefined auVar18 [16];
  undefined auVar19 [16];
  int dump_code;
  int local_38;
  
  lVar14 = 0;
  lVar2 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc(0x800000);
  lVar3 = (long)__ptr + 0x18;
  do {
    lVar14 = lVar14 + 1;
    dVar17 = (double)(int)lVar14;
    lVar12 = 0;
    do {
      iVar11 = (int)lVar12;
      *(double *)(lVar3 + -0x18 + lVar12 * 8) = (double)(iVar11 + 1) * dVar17 * 0.0009765625;
      *(double *)(lVar3 + -0x10 + lVar12 * 8) = (double)(iVar11 + 2) * dVar17 * 0.0009765625;
      *(double *)(lVar3 + -8 + lVar12 * 8) = (double)(iVar11 + 3) * dVar17 * 0.0009765625;
      lVar4 = lVar12 + 4;
      *(double *)(lVar3 + lVar12 * 8) = (double)(int)lVar4 * dVar17 * 0.0009765625;
      lVar12 = lVar4;
    } while (lVar4 != 0x400);
    lVar3 = lVar3 + 0x2000;
  } while (lVar14 != 0x400);
  lVar12 = 0;
  lVar3 = (long)__ptr + 8;
  lVar14 = (long)__ptr + 0x10;
  do {
    lVar9 = 0;
    lVar4 = (long)__ptr + 0x10;
    lVar6 = (long)__ptr + 8;
    do {
      lVar7 = lVar9 * 0x2000;
      pvVar8 = (void *)((long)__ptr + lVar7);
      pdVar13 = (double *)((long)__ptr + lVar7 + 0x2000);
      pdVar1 = (double *)((long)pvVar8 + lVar12 * 8);
      if ((pvVar8 < (void *)(lVar7 + lVar12 * 8 + 1 + (long)__ptr) && pdVar1 < pdVar13) ||
         (pvVar8 < (void *)((long)__ptr + lVar12 * 0x2000 + 0x2000) &&
          (double *)((long)__ptr + lVar12 * 0x2000) < pdVar13)) {
        lVar7 = 0;
        do {
          dVar16 = *pdVar1 + *(double *)(lVar3 + -8 + lVar7 * 8);
          dVar17 = *(double *)(lVar6 + -8 + lVar7 * 8);
          if (dVar16 <= dVar17) {
            dVar17 = dVar16;
          }
          dVar16 = *(double *)(lVar6 + lVar7 * 8);
          *(double *)(lVar6 + -8 + lVar7 * 8) = dVar17;
          dVar17 = *pdVar1 + *(double *)(lVar3 + lVar7 * 8);
          if (dVar17 <= dVar16) {
            dVar16 = dVar17;
          }
          *(double *)(lVar6 + lVar7 * 8) = dVar16;
          lVar7 = lVar7 + 2;
        } while (lVar7 != 0x400);
      }
      else {
        dVar17 = *pdVar1;
        lVar7 = 0;
        do {
          pdVar13 = (double *)(lVar14 + -0x10 + lVar7 * 8);
          pdVar1 = (double *)(lVar14 + lVar7 * 8);
          auVar18 = minpd(*(undefined (*) [16])(lVar4 + -0x10 + lVar7 * 8),
                          CONCAT88(pdVar13[1] + dVar17,*pdVar13 + dVar17));
          auVar19 = minpd(*(undefined (*) [16])(lVar4 + lVar7 * 8),
                          CONCAT88(pdVar1[1] + dVar17,*pdVar1 + dVar17));
          *(undefined (*) [16])(lVar4 + -0x10 + lVar7 * 8) = auVar18;
          *(undefined (*) [16])(lVar4 + lVar7 * 8) = auVar19;
          lVar7 = lVar7 + 4;
        } while (lVar7 != 0x400);
      }
      lVar9 = lVar9 + 1;
      lVar4 = lVar4 + 0x2000;
      lVar6 = lVar6 + 0x2000;
    } while (lVar9 != 0x400);
    lVar12 = lVar12 + 1;
    lVar14 = lVar14 + 0x2000;
    lVar3 = lVar3 + 0x2000;
  } while (lVar12 != 0x400);
  local_38 = (int)lVar2;
  if (local_38 == 1) {
    uVar5 = 0;
    iVar11 = 0;
    lVar2 = 0;
    pvVar8 = __ptr;
    do {
      lVar3 = 0;
      uVar15 = uVar5;
      iVar10 = iVar11;
      do {
        fprintf(*(FILE **)((long)pvVar8 + lVar3 * 8),(char *)stderr,"%0.2lf ");
        if ((int)(uVar15 / 0x14) * 0x14 + iVar10 == 0) {
          fputc(10,stderr);
        }
        lVar3 = lVar3 + 1;
        iVar10 = iVar10 + -1;
        uVar15 = (ulong)((int)uVar15 + 1);
      } while (lVar3 != 0x400);
      lVar2 = lVar2 + 1;
      iVar11 = iVar11 + -0x400;
      uVar5 = (ulong)((int)uVar5 + 0x400);
      pvVar8 = (void *)((long)pvVar8 + 0x2000);
    } while (lVar2 != 0x400);
    fputc(10,stderr);
  }
  free(__ptr);
  return 0;
}

