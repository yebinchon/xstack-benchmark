
int main(int argc,char **argv)

{
  double *pdVar1;
  double *pdVar2;
  double *pdVar3;
  double *pdVar4;
  double dVar5;
  long lVar6;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *pvVar7;
  long lVar8;
  ulong uVar9;
  void *pvVar10;
  void *pvVar11;
  void *pvVar12;
  void *pvVar13;
  long lVar14;
  ulong uVar15;
  int iVar16;
  long lVar17;
  long lVar18;
  int iVar19;
  long lVar20;
  double dVar21;
  undefined auVar22 [16];
  undefined auVar23 [16];
  double dVar24;
  int dump_code;
  int local_38;
  
  lVar20 = 0;
  lVar6 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc(0x20000000);
  __ptr_00 = malloc(0x20000000);
  __ptr_01 = malloc(0x20000000);
  pvVar7 = __ptr;
  pvVar10 = __ptr_00;
  pvVar12 = __ptr_01;
  do {
    dVar24 = (double)(int)lVar20;
    lVar14 = 0;
    do {
      lVar18 = lVar14 + 1;
      *(double *)((long)pvVar7 + lVar14 * 8) =
           ((double)(int)lVar18 * dVar24 + 1.0) * 0.0001220703125;
      *(double *)((long)pvVar10 + lVar14 * 8) =
           ((double)((int)lVar14 + 2) * dVar24 + 2.0) * 0.0001220703125;
      *(double *)((long)pvVar12 + lVar14 * 8) =
           ((double)((int)lVar14 + 3) * dVar24 + 3.0) * 0.0001220703125;
      lVar14 = lVar18;
    } while (lVar18 != 0x2000);
    lVar20 = lVar20 + 1;
    pvVar12 = (void *)((long)pvVar12 + 0x10000);
    pvVar10 = (void *)((long)pvVar10 + 0x10000);
    pvVar7 = (void *)((long)pvVar7 + 0x10000);
  } while (lVar20 != 0x2000);
  iVar16 = 0;
  do {
    lVar17 = 0;
    lVar20 = (long)__ptr_01 + 8;
    lVar14 = (long)__ptr + 8;
    lVar18 = (long)__ptr_00 + 8;
    do {
      dVar24 = *(double *)((long)__ptr + lVar17 * 0x10000);
      dVar21 = *(double *)((long)__ptr_01 + lVar17 * 0x10000);
      lVar8 = 0;
      do {
        dVar5 = *(double *)(lVar18 + lVar8);
        auVar22 = divpd(CONCAT88(dVar5 * dVar5,dVar5 * dVar24),CONCAT88(dVar21,dVar21));
        dVar24 = *(double *)(lVar14 + lVar8) - SUB168(auVar22,0);
        dVar21 = *(double *)(lVar20 + lVar8) - SUB168(auVar22 >> 0x40,0);
        *(double *)(lVar14 + lVar8) = dVar24;
        *(double *)(lVar20 + lVar8) = dVar21;
        lVar8 = lVar8 + 8;
      } while (lVar8 != 0xfff8);
      lVar17 = lVar17 + 1;
      lVar20 = lVar20 + 0x10000;
      lVar18 = lVar18 + 0x10000;
      lVar14 = lVar14 + 0x10000;
    } while (lVar17 != 0x2000);
    lVar20 = 0x1fff8;
    do {
      *(double *)((long)__ptr + lVar20 + -0x10000) =
           *(double *)((long)__ptr + lVar20 + -0x10000) /
           *(double *)((long)__ptr_01 + lVar20 + -0x10000);
      *(double *)((long)__ptr + lVar20) =
           *(double *)((long)__ptr + lVar20) / *(double *)((long)__ptr_01 + lVar20);
      lVar20 = lVar20 + 0x20000;
    } while (lVar20 != 0x2001fff8);
    lVar20 = 0;
    pvVar7 = __ptr;
    pvVar10 = __ptr_00;
    pvVar12 = __ptr_01;
    do {
      lVar14 = 0x1ffe;
      do {
        *(double *)((long)pvVar7 + lVar14 * 8) =
             (*(double *)((long)pvVar7 + lVar14 * 8) -
             *(double *)((long)pvVar7 + lVar14 * 8 + -8) *
             *(double *)((long)pvVar10 + lVar14 * 8 + -8)) /
             *(double *)((long)pvVar12 + lVar14 * 8 + -8);
        lVar14 = lVar14 + -1;
      } while (lVar14 != 0);
      lVar20 = lVar20 + 1;
      pvVar12 = (void *)((long)pvVar12 + 0x10000);
      pvVar10 = (void *)((long)pvVar10 + 0x10000);
      pvVar7 = (void *)((long)pvVar7 + 0x10000);
    } while (lVar20 != 0x2000);
    lVar20 = 1;
    pvVar7 = __ptr_01;
    pvVar10 = __ptr_00;
    pvVar12 = __ptr;
    do {
      pvVar13 = (void *)((long)pvVar12 + 0x10000);
      pvVar10 = (void *)((long)pvVar10 + 0x10000);
      pvVar11 = (void *)((long)pvVar7 + 0x10000);
      lVar14 = 0;
      do {
        dVar24 = ((double *)((long)pvVar13 + lVar14))[1];
        dVar21 = *(double *)((long)pvVar10 + lVar14);
        dVar5 = ((double *)((long)pvVar10 + lVar14))[1];
        auVar22 = *(undefined (*) [16])((long)pvVar7 + lVar14);
        auVar23 = divpd(CONCAT88(((double *)((long)pvVar12 + lVar14))[1] * dVar5,
                                 *(double *)((long)pvVar12 + lVar14) * dVar21),auVar22);
        *(double *)((long)pvVar13 + lVar14) =
             *(double *)((long)pvVar13 + lVar14) - SUB168(auVar23,0);
        ((double *)((long)pvVar13 + lVar14))[1] = dVar24 - SUB168(auVar23 >> 0x40,0);
        dVar24 = ((double *)((long)pvVar11 + lVar14))[1];
        auVar22 = divpd(CONCAT88(dVar5 * dVar5,dVar21 * dVar21),auVar22);
        *(double *)((long)pvVar11 + lVar14) =
             *(double *)((long)pvVar11 + lVar14) - SUB168(auVar22,0);
        ((double *)((long)pvVar11 + lVar14))[1] = dVar24 - SUB168(auVar22 >> 0x40,0);
        lVar14 = lVar14 + 0x10;
      } while (lVar14 != 0x10000);
      lVar20 = lVar20 + 1;
      pvVar7 = pvVar11;
      pvVar12 = pvVar13;
    } while (lVar20 != 0x2000);
    lVar20 = 0x3ffe002;
    do {
      auVar23 = divpd(*(undefined (*) [16])((long)__ptr + lVar20 * 8 + -0x10),
                      *(undefined (*) [16])((long)__ptr_01 + lVar20 * 8 + -0x10));
      auVar22 = *(undefined (*) [16])((long)__ptr + lVar20 * 8);
      *(undefined (*) [16])((long)__ptr + lVar20 * 8 + -0x10) = auVar23;
      auVar22 = divpd(auVar22,*(undefined (*) [16])((long)__ptr_01 + lVar20 * 8));
      *(undefined (*) [16])((long)__ptr + lVar20 * 8) = auVar22;
      lVar20 = lVar20 + 4;
    } while (lVar20 != 0x4000002);
    lVar17 = 0;
    lVar20 = (long)__ptr_00 + 0x1ffd0010;
    lVar14 = (long)__ptr_01 + 0x1ffe0010;
    lVar18 = (long)__ptr + 0x1ffe0010;
    do {
      lVar8 = 0;
      do {
        pdVar1 = (double *)(lVar18 + -0x10 + lVar8);
        pdVar2 = (double *)(lVar20 + -0x10 + lVar8);
        pdVar3 = (double *)(lVar18 + -0x10010 + lVar8);
        pdVar4 = (double *)(lVar18 + -0x10000 + lVar8);
        dVar24 = pdVar4[1];
        auVar22 = divpd(CONCAT88(pdVar1[1] - pdVar3[1] * pdVar2[1],*pdVar1 - *pdVar3 * *pdVar2),
                        *(undefined (*) [16])(lVar14 + -0x10 + lVar8));
        *(undefined (*) [16])(lVar18 + -0x10 + lVar8) = auVar22;
        auVar22 = divpd(CONCAT88(((double *)(lVar18 + lVar8))[1] -
                                 ((double *)(lVar20 + lVar8))[1] * dVar24,
                                 *(double *)(lVar18 + lVar8) - *(double *)(lVar20 + lVar8) * *pdVar4
                                ),*(undefined (*) [16])(lVar14 + lVar8));
        *(undefined (*) [16])(lVar18 + lVar8) = auVar22;
        lVar8 = lVar8 + 0x20;
      } while (lVar8 != 0x10000);
      lVar17 = lVar17 + 1;
      lVar18 = lVar18 + -0x10000;
      lVar20 = lVar20 + -0x10000;
      lVar14 = lVar14 + -0x10000;
    } while (lVar17 != 0x1ffe);
    iVar16 = iVar16 + 1;
  } while (iVar16 != 0x32);
  local_38 = (int)lVar6;
  if (local_38 == 1) {
    uVar9 = 0;
    iVar16 = 0;
    lVar6 = 0;
    do {
      lVar20 = 0;
      uVar15 = uVar9;
      iVar19 = iVar16;
      do {
        fprintf(stderr,"%0.2lf ");
        if ((int)(uVar15 / 0x14) * 0x14 + iVar19 == 0) {
          fputc(10,stderr);
        }
        lVar20 = lVar20 + 1;
        iVar19 = iVar19 + -1;
        uVar15 = (ulong)((int)uVar15 + 1);
      } while (lVar20 != 0x2000);
      lVar6 = lVar6 + 1;
      iVar16 = iVar16 + -0x2000;
      uVar9 = (ulong)((int)uVar9 + 0x2000);
    } while (lVar6 != 0x2000);
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  return 0;
}

