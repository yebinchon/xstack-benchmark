
int main(int argc,char **argv)

{
  double *pdVar1;
  double *pdVar2;
  double dVar3;
  int iVar4;
  long lVar5;
  ulong uVar6;
  ulong uVar7;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  long lVar8;
  ulong uVar9;
  size_t __size;
  uint uVar10;
  ulong uVar11;
  long lVar12;
  void *pvVar13;
  long lVar14;
  ulong uVar15;
  long lVar16;
  long lVar17;
  uint uVar18;
  ulong uVar19;
  long lVar20;
  double dVar21;
  double dVar22;
  double_0__0_ *C;
  double_0__0_ *B;
  double_0__0_ *A;
  int dump_code;
  int local_60;
  
  lVar5 = strtol(argv[1],(char **)0x0,10);
  uVar6 = strtol(argv[2],(char **)0x0,10);
  uVar7 = strtol(argv[3],(char **)0x0,10);
  uVar10 = (uint)uVar6;
  __ptr = malloc((ulong)(uVar10 * uVar10) << 3);
  uVar18 = (uint)uVar7;
  __size = (long)(int)(uVar10 * uVar18) << 3;
  __ptr_00 = malloc(__size);
  __ptr_01 = malloc(__size);
  uVar19 = uVar6 & 0xffffffff;
  if (0 < (int)uVar10) {
    uVar7 = uVar7 & 0xffffffff;
    dVar21 = (double)uVar10;
    if (0 < (int)uVar18) {
      lVar8 = (long)__ptr_00 + 8;
      lVar14 = (long)__ptr_01 + 8;
      uVar11 = 0;
      do {
        dVar22 = (double)(int)uVar11;
        if (uVar7 == 1) {
          lVar12 = 0;
        }
        else {
          lVar12 = 0;
          do {
            dVar3 = ((double)(int)lVar12 * dVar22) / dVar21;
            *(double *)(lVar8 + -8 + lVar12 * 8) = dVar3;
            *(double *)(lVar14 + -8 + lVar12 * 8) = dVar3;
            dVar3 = ((double)((int)lVar12 + 1) * dVar22) / dVar21;
            *(double *)(lVar8 + lVar12 * 8) = dVar3;
            *(double *)(lVar14 + lVar12 * 8) = dVar3;
            lVar12 = lVar12 + 2;
          } while (uVar7 - (uVar18 & 1) != lVar12);
        }
        if ((ulong)(uVar18 & 1) != 0) {
          dVar22 = (dVar22 * (double)(int)lVar12) / dVar21;
          *(double *)((long)__ptr_00 + lVar12 * 8 + uVar11 * uVar7 * 8) = dVar22;
          *(double *)((long)__ptr_01 + lVar12 * 8 + uVar11 * uVar7 * 8) = dVar22;
        }
        uVar11 = uVar11 + 1;
        lVar8 = lVar8 + uVar7 * 8;
        lVar14 = lVar14 + uVar7 * 8;
      } while (uVar11 != uVar19);
    }
    lVar8 = (long)__ptr + 8;
    lVar14 = uVar19 * 8;
    uVar11 = 0;
    do {
      dVar22 = (double)(int)uVar11;
      lVar12 = 0;
      if (uVar19 != 1) {
        do {
          *(double *)(lVar8 + -8 + lVar12 * 8) = ((double)(int)lVar12 * dVar22) / dVar21;
          *(double *)(lVar8 + lVar12 * 8) = ((double)((int)lVar12 + 1) * dVar22) / dVar21;
          lVar12 = lVar12 + 2;
        } while (uVar19 - (uVar10 & 1) != lVar12);
      }
      if ((ulong)(uVar10 & 1) != 0) {
        *(double *)((long)__ptr + lVar12 * 8 + uVar11 * uVar19 * 8) =
             (dVar22 * (double)(int)lVar12) / dVar21;
      }
      uVar11 = uVar11 + 1;
      lVar8 = lVar8 + lVar14;
    } while (uVar11 != uVar19);
    uVar11 = uVar19 - (uVar10 & 3);
    lVar8 = (long)__ptr + 0x10;
    uVar15 = 0;
    pvVar13 = __ptr;
    do {
      uVar9 = 0;
      if ((uint)uVar19 < 4) {
LAB_00401440:
        do {
          *(double *)((long)pvVar13 + uVar9 * 8) = *(double *)((long)pvVar13 + uVar9 * 8) * 2123.0;
          uVar9 = uVar9 + 1;
        } while (uVar19 != uVar9);
      }
      else {
        do {
          pdVar2 = (double *)(lVar8 + -0x10 + uVar9 * 8);
          pdVar1 = (double *)(lVar8 + uVar9 * 8);
          dVar22 = pdVar1[1];
          dVar21 = pdVar2[1] * 2123.0;
          *(undefined (*) [16])(lVar8 + -0x10 + uVar9 * 8) =
               CONCAT412((int)((ulong)dVar21 >> 0x20),CONCAT48(SUB84(dVar21,0),*pdVar2 * 2123.0));
          *(undefined (*) [16])(lVar8 + uVar9 * 8) = CONCAT88(dVar22 * 2123.0,*pdVar1 * 2123.0);
          uVar9 = uVar9 + 4;
        } while (uVar11 != uVar9);
        uVar9 = uVar11;
        if ((ulong)(uVar10 & 3) != 0) goto LAB_00401440;
      }
      uVar15 = uVar15 + 1;
      lVar8 = lVar8 + lVar14;
      pvVar13 = (void *)((long)pvVar13 + lVar14);
    } while (uVar15 != uVar19);
    if (0 < (int)uVar18) {
      lVar8 = uVar7 * 8;
      uVar11 = 0;
      lVar14 = (long)__ptr_00 + 8;
      lVar12 = (long)__ptr_01 + 8;
      do {
        uVar15 = 0;
        lVar16 = (long)__ptr_00 + 8;
        lVar17 = (long)__ptr_01 + 8;
        do {
          dVar21 = *(double *)((long)__ptr + uVar15 * 8 + uVar11 * uVar19 * 8);
          if (uVar7 == 1) {
            lVar20 = 0;
          }
          else {
            lVar20 = 0;
            do {
              dVar21 = *(double *)(lVar12 + lVar20 * 8) * 32412.0 * *(double *)(lVar16 + lVar20 * 8)
                       + *(double *)(lVar14 + lVar20 * 8) * 32412.0 *
                         *(double *)(lVar17 + lVar20 * 8) +
                         *(double *)(lVar12 + -8 + lVar20 * 8) * 32412.0 *
                         *(double *)(lVar16 + -8 + lVar20 * 8) +
                         *(double *)(lVar14 + -8 + lVar20 * 8) * 32412.0 *
                         *(double *)(lVar17 + -8 + lVar20 * 8) + dVar21;
              lVar20 = lVar20 + 2;
            } while (uVar7 - (uVar18 & 1) != lVar20);
          }
          if ((ulong)(uVar18 & 1) != 0) {
            dVar21 = dVar21 + *(double *)((long)__ptr_00 + lVar20 * 8 + uVar11 * uVar7 * 8) *
                              32412.0 * *(double *)
                                         ((long)__ptr_01 + lVar20 * 8 + uVar15 * uVar7 * 8) +
                     *(double *)((long)__ptr_01 + lVar20 * 8 + uVar11 * uVar7 * 8) * 32412.0 *
                     *(double *)((long)__ptr_00 + lVar20 * 8 + uVar15 * uVar7 * 8);
          }
          *(double *)((long)__ptr + uVar15 * 8 + uVar11 * uVar19 * 8) = dVar21;
          uVar15 = uVar15 + 1;
          lVar17 = lVar17 + lVar8;
          lVar16 = lVar16 + lVar8;
        } while (uVar15 != uVar19);
        uVar11 = uVar11 + 1;
        lVar14 = lVar14 + lVar8;
        lVar12 = lVar12 + lVar8;
      } while (uVar11 != uVar19);
    }
  }
  local_60 = (int)lVar5;
  if (local_60 == 1) {
    if (0 < (int)uVar10) {
      lVar5 = 0;
      uVar7 = 0;
      pvVar13 = __ptr;
      do {
        uVar11 = 0;
        do {
          fprintf(*(FILE **)((long)pvVar13 + uVar11 * 8),(char *)stderr,"%0.2lf ");
          iVar4 = (int)lVar5 + (int)uVar11;
          if ((iVar4 * -0x33333333 + 0x19999998U >> 2 | iVar4 * 0x40000000) < 0xccccccd) {
            fputc(10,stderr);
          }
          uVar11 = uVar11 + 1;
        } while (uVar19 != uVar11);
        uVar7 = uVar7 + 1;
        lVar5 = lVar5 + uVar6;
        pvVar13 = (void *)((long)pvVar13 + uVar19 * 8);
      } while (uVar7 != uVar19);
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  return 0;
}

