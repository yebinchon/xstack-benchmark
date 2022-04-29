
int main(int argc,char **argv)

{
  bool bVar1;
  uint uVar2;
  int iVar3;
  long lVar4;
  ulong uVar5;
  ulong uVar6;
  ulong uVar7;
  void *__ptr;
  void *__ptr_00;
  double *__ptr_01;
  double *pdVar8;
  long lVar9;
  double *pdVar10;
  uint uVar11;
  ulong uVar12;
  ulong uVar13;
  long lVar14;
  ulong uVar15;
  void *pvVar16;
  long lVar17;
  long lVar18;
  double dVar19;
  double dVar20;
  double_0__0_ *C;
  double_0__0_ *B;
  uint local_a0;
  int local_90;
  int local_60;
  
  lVar4 = strtol(argv[1],(char **)0x0,10);
  uVar5 = strtol(argv[2],(char **)0x0,10);
  uVar6 = strtol(argv[3],(char **)0x0,10);
  uVar7 = strtol(argv[4],(char **)0x0,10);
  __ptr = malloc((long)(uVar6 * (uVar5 << 0x20)) >> 0x1d);
  __ptr_00 = malloc((long)((uVar5 << 0x20) * uVar7) >> 0x1d);
  uVar2 = (uint)uVar6;
  uVar11 = (uint)uVar7;
  __ptr_01 = (double *)malloc((long)(int)(uVar2 * uVar11) << 3);
  uVar6 = uVar6 & 0xffffffff;
  uVar7 = uVar7 & 0xffffffff;
  iVar3 = (int)uVar5;
  dVar19 = (double)iVar3;
  if (0 < iVar3) {
    if (0 < (int)uVar2) {
      lVar9 = (long)__ptr + 8;
      uVar12 = 0;
      do {
        dVar20 = (double)(int)uVar12;
        if (uVar6 == 1) {
          lVar18 = 0;
        }
        else {
          lVar18 = 0;
          do {
            *(double *)(lVar9 + -8 + lVar18 * 8) = ((double)(int)lVar18 * dVar20) / dVar19;
            *(double *)(lVar9 + lVar18 * 8) = ((double)((int)lVar18 + 1) * dVar20) / dVar19;
            lVar18 = lVar18 + 2;
          } while (uVar6 - (uVar2 & 1) != lVar18);
        }
        if ((ulong)(uVar2 & 1) != 0) {
          *(double *)((long)__ptr + lVar18 * 8 + uVar12 * uVar6 * 8) =
               (dVar20 * (double)(int)lVar18) / dVar19;
        }
        uVar12 = uVar12 + 1;
        lVar9 = lVar9 + uVar6 * 8;
      } while (uVar12 != (uVar5 & 0xffffffff));
    }
    if ((int)uVar11 < 1) {
      bVar1 = false;
      goto joined_r0x004014f0;
    }
    lVar9 = (long)__ptr_00 + 8;
    uVar12 = 0;
    do {
      dVar20 = (double)(int)uVar12;
      if (uVar7 == 1) {
        lVar18 = 0;
      }
      else {
        lVar18 = 0;
        do {
          *(double *)(lVar9 + -8 + lVar18 * 8) = ((double)(int)lVar18 * dVar20) / dVar19;
          *(double *)(lVar9 + lVar18 * 8) = ((double)((int)lVar18 + 1) * dVar20) / dVar19;
          lVar18 = lVar18 + 2;
        } while (uVar7 - (uVar11 & 1) != lVar18);
      }
      if ((ulong)(uVar11 & 1) != 0) {
        *(double *)((long)__ptr_00 + lVar18 * 8 + uVar12 * uVar7 * 8) =
             (dVar20 * (double)(int)lVar18) / dVar19;
      }
      uVar12 = uVar12 + 1;
      lVar9 = lVar9 + uVar7 * 8;
    } while (uVar12 != (uVar5 & 0xffffffff));
  }
  bVar1 = 0 < (int)uVar11;
  if ((int)uVar11 < 1) {
    bVar1 = false;
  }
  else if ((int)uVar2 < 1) {
    bVar1 = true;
  }
  else {
    pdVar8 = __ptr_01 + 1;
    uVar12 = 0;
    do {
      dVar20 = (double)(int)uVar12;
      if (uVar6 == 1) {
        lVar9 = 0;
      }
      else {
        lVar9 = 0;
        do {
          pdVar8[lVar9 + -1] = ((double)(int)lVar9 * dVar20) / dVar19;
          pdVar8[lVar9] = ((double)((int)lVar9 + 1) * dVar20) / dVar19;
          lVar9 = lVar9 + 2;
        } while (uVar6 - (uVar2 & 1) != lVar9);
      }
      if ((ulong)(uVar2 & 1) != 0) {
        __ptr_01[uVar12 * uVar6 + lVar9] = (dVar20 * (double)(int)lVar9) / dVar19;
      }
      uVar12 = uVar12 + 1;
      pdVar8 = pdVar8 + uVar6;
    } while (uVar12 != uVar7);
  }
joined_r0x004014f0:
  if ((0 < iVar3) && (0 < (int)uVar2)) {
    uVar12 = uVar6 - (uVar2 & 3);
    lVar18 = (long)__ptr + 0x10;
    lVar9 = (long)__ptr_00 + 8;
    uVar13 = 0;
    pvVar16 = __ptr;
    do {
      if (bVar1) {
        lVar14 = uVar13 * uVar6;
        uVar15 = 0;
        pdVar8 = __ptr_01;
        do {
          dVar19 = *(double *)((long)__ptr + uVar15 * 8 + lVar14 * 8) * 2123.0;
          *(double *)((long)__ptr + uVar15 * 8 + lVar14 * 8) = dVar19;
          local_90 = (int)uVar7;
          if (local_90 == 1) {
            lVar17 = 0;
          }
          else {
            lVar17 = 0;
            pdVar10 = pdVar8;
            do {
              dVar19 = *(double *)(lVar9 + lVar17 * 8) * 32412.0 * pdVar10[uVar6] +
                       *(double *)(lVar9 + -8 + lVar17 * 8) * 32412.0 * *pdVar10 + dVar19;
              lVar17 = lVar17 + 2;
              pdVar10 = pdVar10 + uVar6 * 2;
            } while (uVar7 - (uVar11 & 1) != lVar17);
          }
          if ((ulong)(uVar11 & 1) != 0) {
            dVar19 = dVar19 + *(double *)((long)__ptr_00 + lVar17 * 8 + uVar13 * uVar7 * 8) *
                              32412.0 * __ptr_01[uVar15 + lVar17 * uVar6];
          }
          *(double *)((long)__ptr + uVar15 * 8 + lVar14 * 8) = dVar19;
          uVar15 = uVar15 + 1;
          pdVar8 = pdVar8 + 1;
        } while (uVar15 != uVar6);
      }
      else {
        local_a0 = (uint)uVar6;
        if (local_a0 < 4) {
          uVar15 = 0;
        }
        else {
          uVar15 = 0;
          do {
            pdVar10 = (double *)(lVar18 + -0x10 + uVar15 * 8);
            pdVar8 = (double *)(lVar18 + uVar15 * 8);
            dVar19 = pdVar8[1];
            *(undefined (*) [16])(lVar18 + -0x10 + uVar15 * 8) =
                 CONCAT88(pdVar10[1] * 2123.0,*pdVar10 * 2123.0);
            *(undefined (*) [16])(lVar18 + uVar15 * 8) = CONCAT88(dVar19 * 2123.0,*pdVar8 * 2123.0);
            uVar15 = uVar15 + 4;
          } while (uVar12 != uVar15);
          uVar15 = uVar12;
          if ((ulong)(uVar2 & 3) == 0) goto LAB_004015a0;
        }
        do {
          *(double *)((long)pvVar16 + uVar15 * 8) = *(double *)((long)pvVar16 + uVar15 * 8) * 2123.0
          ;
          uVar15 = uVar15 + 1;
        } while (uVar6 != uVar15);
      }
LAB_004015a0:
      uVar13 = uVar13 + 1;
      lVar18 = lVar18 + uVar6 * 8;
      pvVar16 = (void *)((long)pvVar16 + uVar6 * 8);
      lVar9 = lVar9 + uVar7 * 8;
    } while (uVar13 != (uVar5 & 0xffffffff));
  }
  local_60 = (int)lVar4;
  if (local_60 == 1) {
    if ((0 < iVar3) && (0 < (int)uVar2)) {
      lVar4 = 0;
      uVar7 = 0;
      pvVar16 = __ptr;
      do {
        uVar12 = 0;
        do {
          fprintf(*(FILE **)((long)pvVar16 + uVar12 * 8),(char *)stderr,"%0.2lf ");
          iVar3 = (int)lVar4 + (int)uVar12;
          if ((iVar3 * -0x33333333 + 0x19999998U >> 2 | iVar3 * 0x40000000) < 0xccccccd) {
            fputc(10,stderr);
          }
          uVar12 = uVar12 + 1;
        } while (uVar6 != uVar12);
        uVar7 = uVar7 + 1;
        lVar4 = lVar4 + uVar5;
        pvVar16 = (void *)((long)pvVar16 + uVar6 * 8);
      } while (uVar7 != (uVar5 & 0xffffffff));
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  return 0;
}

