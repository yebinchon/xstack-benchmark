
int main(int argc,char **argv)

{
  double *pdVar1;
  double *pdVar2;
  int iVar3;
  long lVar4;
  ulong uVar5;
  ulong uVar6;
  void *__ptr;
  void *__ptr_00;
  long lVar7;
  long lVar8;
  void *pvVar9;
  ulong uVar10;
  long lVar11;
  uint uVar12;
  uint uVar13;
  ulong uVar14;
  ulong uVar15;
  void *pvVar16;
  ulong uVar17;
  ulong uVar18;
  long lVar19;
  double dVar20;
  double dVar21;
  double_0__0_ *A;
  int dump_code;
  int local_48;
  
  lVar4 = strtol(argv[1],(char **)0x0,10);
  uVar5 = strtol(argv[2],(char **)0x0,10);
  uVar6 = strtol(argv[3],(char **)0x0,10);
  uVar13 = (uint)uVar5;
  __ptr = malloc((ulong)(uVar13 * uVar13) << 3);
  uVar12 = (uint)uVar6;
  __ptr_00 = malloc((long)(int)(uVar13 * uVar12) << 3);
  uVar18 = uVar5 & 0xffffffff;
  if (0 < (int)uVar13) {
    uVar6 = uVar6 & 0xffffffff;
    dVar20 = (double)uVar13;
    if (0 < (int)uVar12) {
      lVar11 = (long)__ptr_00 + 8;
      uVar14 = 0;
      do {
        dVar21 = (double)(int)uVar14;
        lVar7 = 0;
        if (uVar6 != 1) {
          do {
            *(double *)(lVar11 + -8 + lVar7 * 8) = ((double)(int)lVar7 * dVar21) / dVar20;
            *(double *)(lVar11 + lVar7 * 8) = ((double)((int)lVar7 + 1) * dVar21) / dVar20;
            lVar7 = lVar7 + 2;
          } while (uVar6 - (uVar12 & 1) != lVar7);
        }
        if ((ulong)(uVar12 & 1) != 0) {
          *(double *)((long)__ptr_00 + lVar7 * 8 + uVar14 * uVar6 * 8) =
               (dVar21 * (double)(int)lVar7) / dVar20;
        }
        uVar14 = uVar14 + 1;
        lVar11 = lVar11 + uVar6 * 8;
      } while (uVar14 != uVar18);
    }
    lVar11 = (long)__ptr + 8;
    lVar7 = uVar18 * 8;
    uVar14 = 0;
    do {
      dVar21 = (double)(int)uVar14;
      lVar8 = 0;
      if (uVar18 != 1) {
        do {
          *(double *)(lVar11 + -8 + lVar8 * 8) = ((double)(int)lVar8 * dVar21) / dVar20;
          *(double *)(lVar11 + lVar8 * 8) = ((double)((int)lVar8 + 1) * dVar21) / dVar20;
          lVar8 = lVar8 + 2;
        } while (uVar18 - (uVar13 & 1) != lVar8);
      }
      if ((ulong)(uVar13 & 1) != 0) {
        *(double *)((long)__ptr + lVar8 * 8 + uVar14 * uVar18 * 8) =
             (dVar21 * (double)(int)lVar8) / dVar20;
      }
      uVar14 = uVar14 + 1;
      lVar11 = lVar11 + lVar7;
    } while (uVar14 != uVar18);
    uVar14 = uVar18 - (uVar13 & 3);
    lVar11 = (long)__ptr + 0x10;
    uVar15 = 0;
    pvVar9 = __ptr;
    do {
      uVar17 = 0;
      if ((uint)uVar18 < 4) {
LAB_004013d0:
        do {
          *(double *)((long)pvVar9 + uVar17 * 8) = *(double *)((long)pvVar9 + uVar17 * 8) * 2123.0;
          uVar17 = uVar17 + 1;
        } while (uVar18 != uVar17);
      }
      else {
        do {
          pdVar2 = (double *)(lVar11 + -0x10 + uVar17 * 8);
          pdVar1 = (double *)(lVar11 + uVar17 * 8);
          dVar21 = pdVar1[1];
          dVar20 = pdVar2[1] * 2123.0;
          *(undefined (*) [16])(lVar11 + -0x10 + uVar17 * 8) =
               CONCAT412((int)((ulong)dVar20 >> 0x20),CONCAT48(SUB84(dVar20,0),*pdVar2 * 2123.0));
          *(undefined (*) [16])(lVar11 + uVar17 * 8) = CONCAT88(dVar21 * 2123.0,*pdVar1 * 2123.0);
          uVar17 = uVar17 + 4;
        } while (uVar14 != uVar17);
        uVar17 = uVar14;
        if ((ulong)(uVar13 & 3) != 0) goto LAB_004013d0;
      }
      uVar15 = uVar15 + 1;
      lVar11 = lVar11 + lVar7;
      pvVar9 = (void *)((long)pvVar9 + lVar7);
    } while (uVar15 != uVar18);
    if (0 < (int)uVar12) {
      uVar15 = (ulong)(uVar12 & 3);
      lVar11 = uVar6 * 8;
      uVar14 = 0;
      lVar7 = (long)__ptr_00 + 0x18;
      pvVar9 = __ptr_00;
      do {
        uVar17 = 0;
        pvVar16 = __ptr_00;
        lVar8 = (long)__ptr_00 + 0x18;
        do {
          dVar20 = *(double *)((long)__ptr + uVar17 * 8 + uVar14 * uVar18 * 8);
          lVar19 = 0;
          if (2 < uVar6 - 1) {
            do {
              dVar20 = *(double *)(lVar7 + lVar19 * 8) * 32412.0 * *(double *)(lVar8 + lVar19 * 8) +
                       *(double *)(lVar7 + -8 + lVar19 * 8) * 32412.0 *
                       *(double *)(lVar8 + -8 + lVar19 * 8) +
                       *(double *)(lVar7 + -0x10 + lVar19 * 8) * 32412.0 *
                       *(double *)(lVar8 + -0x10 + lVar19 * 8) +
                       *(double *)(lVar7 + -0x18 + lVar19 * 8) * 32412.0 *
                       *(double *)(lVar8 + -0x18 + lVar19 * 8) + dVar20;
              lVar19 = lVar19 + 4;
            } while (uVar6 - uVar15 != lVar19);
          }
          if (uVar15 != 0) {
            uVar10 = 0;
            do {
              dVar20 = dVar20 + *(double *)((long)pvVar9 + uVar10 * 8 + lVar19 * 8) * 32412.0 *
                                *(double *)((long)pvVar16 + uVar10 * 8 + lVar19 * 8);
              uVar10 = uVar10 + 1;
            } while (uVar15 != uVar10);
          }
          *(double *)((long)__ptr + uVar17 * 8 + uVar14 * uVar18 * 8) = dVar20;
          uVar17 = uVar17 + 1;
          lVar8 = lVar8 + lVar11;
          pvVar16 = (void *)((long)pvVar16 + lVar11);
        } while (uVar17 != uVar18);
        uVar14 = uVar14 + 1;
        lVar7 = lVar7 + lVar11;
        pvVar9 = (void *)((long)pvVar9 + lVar11);
      } while (uVar14 != uVar18);
    }
  }
  local_48 = (int)lVar4;
  if (local_48 == 1) {
    if (0 < (int)uVar13) {
      lVar4 = 0;
      uVar6 = 0;
      pvVar9 = __ptr;
      do {
        uVar14 = 0;
        do {
          fprintf(*(FILE **)((long)pvVar9 + uVar14 * 8),(char *)stderr,"%0.2lf ");
          iVar3 = (int)lVar4 + (int)uVar14;
          if ((iVar3 * -0x33333333 + 0x19999998U >> 2 | iVar3 * 0x40000000) < 0xccccccd) {
            fputc(10,stderr);
          }
          uVar14 = uVar14 + 1;
        } while (uVar18 != uVar14);
        uVar6 = uVar6 + 1;
        lVar4 = lVar4 + uVar5;
        pvVar9 = (void *)((long)pvVar9 + uVar18 * 8);
      } while (uVar6 != uVar18);
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  return 0;
}

