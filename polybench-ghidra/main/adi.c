
int main(int argc,char **argv)

{
  double *pdVar1;
  double *pdVar2;
  double *pdVar3;
  double *pdVar4;
  double dVar5;
  void *pvVar6;
  long lVar7;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *pvVar8;
  long lVar9;
  void *pvVar10;
  ulong uVar11;
  void *pvVar12;
  long lVar13;
  void *pvVar14;
  long lVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  ulong uVar19;
  int iVar20;
  int iVar21;
  double dVar22;
  double dVar23;
  undefined auVar24 [16];
  undefined auVar25 [16];
  int local_80;
  void *local_60;
  void *local_58;
  void *local_48;
  void *local_40;
  void *local_38;
  
  lVar7 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc(0x2000000);
  __ptr_00 = malloc(0x2000000);
  __ptr_01 = malloc(0x2000000);
  local_60 = __ptr_01;
  local_58 = __ptr_00;
  lVar16 = 0;
  do {
    lVar17 = 0;
    lVar9 = (long)__ptr + 8;
    lVar13 = (long)__ptr_00 + 8;
    lVar15 = (long)__ptr_01 + 8;
    do {
      dVar22 = *(double *)((long)__ptr_01 + lVar17 * 0x4000);
      dVar23 = *(double *)((long)__ptr + lVar17 * 0x4000);
      lVar18 = 0;
      do {
        dVar5 = *(double *)(lVar13 + lVar18);
        auVar24 = divpd(CONCAT88(dVar5 * dVar23,dVar5 * dVar5),CONCAT88(dVar22,dVar22));
        dVar22 = *(double *)(lVar15 + lVar18) - SUB168(auVar24,0);
        dVar23 = *(double *)(lVar9 + lVar18) - SUB168(auVar24 >> 0x40,0);
        *(double *)(lVar9 + lVar18) = dVar23;
        *(double *)(lVar15 + lVar18) = dVar22;
        lVar18 = lVar18 + 8;
      } while (lVar18 != 0x3ff8);
      lVar17 = lVar17 + 1;
      lVar15 = lVar15 + 0x4000;
      lVar13 = lVar13 + 0x4000;
      lVar9 = lVar9 + 0x4000;
    } while (lVar17 != 0x800);
    lVar9 = 0x7ff8;
    do {
      *(double *)((long)__ptr + lVar9 + -0x4000) =
           *(double *)((long)__ptr + lVar9 + -0x4000) /
           *(double *)((long)__ptr_01 + lVar9 + -0x4000);
      *(double *)((long)__ptr + lVar9) =
           *(double *)((long)__ptr + lVar9) / *(double *)((long)__ptr_01 + lVar9);
      lVar9 = lVar9 + 0x8000;
    } while (lVar9 != 0x2007ff8);
    local_48 = __ptr;
    local_40 = __ptr_00;
    local_38 = __ptr_01;
    lVar9 = 0;
    pvVar6 = __ptr_01;
    pvVar10 = __ptr;
    pvVar12 = __ptr_00;
    do {
      pvVar12 = (void *)((long)pvVar12 + 0x4000);
      pvVar8 = (void *)((long)pvVar10 + 0x4000);
      pvVar14 = (void *)((long)pvVar6 + 0x4000);
      lVar13 = 0;
      do {
        dVar22 = ((double *)((long)pvVar8 + lVar13))[1];
        dVar23 = *(double *)((long)pvVar12 + lVar13);
        dVar5 = ((double *)((long)pvVar12 + lVar13))[1];
        auVar24 = *(undefined (*) [16])((long)pvVar6 + lVar13);
        auVar25 = divpd(CONCAT88(((double *)((long)pvVar10 + lVar13))[1] * dVar5,
                                 *(double *)((long)pvVar10 + lVar13) * dVar23),auVar24);
        *(double *)((long)pvVar8 + lVar13) = *(double *)((long)pvVar8 + lVar13) - SUB168(auVar25,0);
        ((double *)((long)pvVar8 + lVar13))[1] = dVar22 - SUB168(auVar25 >> 0x40,0);
        dVar22 = ((double *)((long)pvVar14 + lVar13))[1];
        auVar24 = divpd(CONCAT88(dVar5 * dVar5,dVar23 * dVar23),auVar24);
        *(double *)((long)pvVar14 + lVar13) =
             *(double *)((long)pvVar14 + lVar13) - SUB168(auVar24,0);
        ((double *)((long)pvVar14 + lVar13))[1] = dVar22 - SUB168(auVar24 >> 0x40,0);
        lVar13 = lVar13 + 0x10;
      } while (lVar13 != 0x4000);
      lVar9 = lVar9 + 1;
      pvVar6 = pvVar14;
      pvVar10 = pvVar8;
    } while (lVar9 != 0x7ff);
    lVar9 = 0x3ff802;
    do {
      auVar25 = divpd(*(undefined (*) [16])((long)__ptr + lVar9 * 8 + -0x10),
                      *(undefined (*) [16])((long)__ptr_01 + lVar9 * 8 + -0x10));
      auVar24 = *(undefined (*) [16])((long)__ptr + lVar9 * 8);
      *(undefined (*) [16])((long)__ptr + lVar9 * 8 + -0x10) = auVar25;
      auVar24 = divpd(auVar24,*(undefined (*) [16])((long)__ptr_01 + lVar9 * 8));
      *(undefined (*) [16])((long)__ptr + lVar9 * 8) = auVar24;
      lVar9 = lVar9 + 4;
    } while (lVar9 != 0x400002);
    lVar17 = 0;
    lVar9 = (long)__ptr_01 + 0x1ff8010;
    lVar13 = (long)__ptr_00 + 0x1ff4010;
    lVar15 = (long)__ptr + 0x1ff8010;
    do {
      lVar18 = 0;
      do {
        pdVar1 = (double *)(lVar15 + -0x10 + lVar18);
        pdVar2 = (double *)(lVar13 + -0x10 + lVar18);
        pdVar3 = (double *)(lVar15 + -0x4010 + lVar18);
        pdVar4 = (double *)(lVar15 + -0x4000 + lVar18);
        dVar22 = pdVar4[1];
        auVar24 = divpd(CONCAT88(pdVar1[1] - pdVar3[1] * pdVar2[1],*pdVar1 - *pdVar3 * *pdVar2),
                        *(undefined (*) [16])(lVar9 + -0x10 + lVar18));
        *(undefined (*) [16])(lVar15 + -0x10 + lVar18) = auVar24;
        auVar24 = divpd(CONCAT88(((double *)(lVar15 + lVar18))[1] -
                                 ((double *)(lVar13 + lVar18))[1] * dVar22,
                                 *(double *)(lVar15 + lVar18) -
                                 *(double *)(lVar13 + lVar18) * *pdVar4),
                        *(undefined (*) [16])(lVar9 + lVar18));
        *(undefined (*) [16])(lVar15 + lVar18) = auVar24;
        lVar18 = lVar18 + 0x20;
      } while (lVar18 != 0x4000);
      lVar17 = lVar17 + 1;
      lVar15 = lVar15 + -0x4000;
      lVar13 = lVar13 + -0x4000;
      lVar9 = lVar9 + -0x4000;
    } while (lVar17 != 0x7fe);
    lVar16 = lVar16 + 1;
  } while (lVar16 != 0x32);
  local_80 = (int)lVar7;
  if (local_80 == 1) {
    uVar11 = 0;
    iVar21 = 0;
    lVar7 = 0;
    do {
      lVar16 = 0;
      uVar19 = uVar11;
      iVar20 = iVar21;
      do {
        fprintf(stderr,"%0.2lf ");
        if ((int)(uVar19 / 0x14) * 0x14 + iVar20 == 0) {
          fputc(10,stderr);
        }
        lVar16 = lVar16 + 1;
        iVar20 = iVar20 + -1;
        uVar19 = (ulong)((int)uVar19 + 1);
      } while (lVar16 != 0x800);
      lVar7 = lVar7 + 1;
      iVar21 = iVar21 + -0x800;
      uVar11 = (ulong)((int)uVar11 + 0x800);
    } while (lVar7 != 0x800);
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  return 0;
}


