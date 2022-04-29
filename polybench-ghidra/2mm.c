
int main(int argc,char **argv)

{
  bool bVar1;
  int iVar2;
  long lVar3;
  ulong uVar4;
  ulong uVar5;
  ulong uVar6;
  ulong uVar7;
  void *__ptr;
  void *__ptr_00;
  double *__ptr_01;
  double *__ptr_02;
  void *__ptr_03;
  ulong uVar8;
  long lVar9;
  long lVar10;
  double *pdVar11;
  long lVar12;
  long lVar13;
  ulong uVar14;
  void *pvVar15;
  ulong uVar16;
  double *pdVar17;
  ulong uVar18;
  ulong uVar19;
  uint uVar20;
  uint uVar21;
  long lVar22;
  double dVar23;
  double dVar24;
  undefined4 uVar25;
  undefined4 uVar26;
  double_0__0_ *D;
  double_0__0_ *A;
  double_0__0_ *B;
  double_0__0_ *tmp;
  double_0__0_ *C;
  int dump_code;
  uint local_c0;
  uint local_b8;
  void *local_78;
  void *local_70;
  int local_50;
  
  lVar3 = strtol(argv[1],(char **)0x0,10);
  uVar4 = strtol(argv[2],(char **)0x0,10);
  uVar5 = strtol(argv[3],(char **)0x0,10);
  uVar6 = strtol(argv[4],(char **)0x0,10);
  uVar7 = strtol(argv[5],(char **)0x0,10);
  lVar13 = uVar4 << 0x20;
  __ptr = malloc((long)(uVar5 * lVar13) >> 0x1d);
  __ptr_00 = malloc((long)(uVar6 * lVar13) >> 0x1d);
  __ptr_01 = (double *)malloc((long)(uVar6 * (uVar5 << 0x20)) >> 0x1d);
  __ptr_02 = (double *)malloc((long)((uVar5 << 0x20) * uVar7) >> 0x1d);
  __ptr_03 = malloc((long)(lVar13 * uVar7) >> 0x1d);
  uVar8 = uVar7 & 0xffffffff;
  uVar21 = (uint)uVar5;
  uVar5 = uVar5 & 0xffffffff;
  iVar2 = (int)uVar4;
  uVar20 = (uint)uVar6;
  local_b8 = (uint)uVar7;
  if (0 < iVar2) {
    if ((int)uVar20 < 1) {
      bVar1 = false;
      goto joined_r0x00401451;
    }
    dVar23 = (double)iVar2;
    lVar13 = (long)__ptr_00 + 8;
    uVar7 = 0;
    do {
      dVar24 = (double)(int)uVar7;
      lVar9 = 0;
      if ((int)(uVar6 & 0xffffffff) != 1) {
        do {
          *(double *)(lVar13 + -8 + lVar9 * 8) = ((double)(int)lVar9 * dVar24) / dVar23;
          *(double *)(lVar13 + lVar9 * 8) = ((double)((int)lVar9 + 1) * dVar24) / dVar23;
          lVar9 = lVar9 + 2;
        } while ((uVar6 & 0xffffffff) - (ulong)(uVar20 & 1) != lVar9);
      }
      if ((ulong)(uVar20 & 1) != 0) {
        *(double *)((long)__ptr_00 + lVar9 * 8 + uVar7 * uVar8 * 8) =
             (dVar24 * (double)(int)lVar9) / dVar23;
      }
      uVar7 = uVar7 + 1;
      lVar13 = lVar13 + uVar8 * 8;
    } while (uVar7 != (uVar4 & 0xffffffff));
  }
  bVar1 = 0 < (int)uVar20;
  if ((int)uVar20 < 1) {
    bVar1 = false;
  }
  else if ((int)uVar21 < 1) {
    bVar1 = true;
  }
  else {
    dVar23 = (double)uVar21;
    pdVar11 = __ptr_01 + 1;
    uVar7 = 0;
    do {
      dVar24 = (double)(int)uVar7;
      if (uVar5 == 1) {
        lVar9 = 0;
      }
      else {
        lVar13 = 0;
        do {
          pdVar11[lVar13 + -1] = ((double)((int)lVar13 + 1) * dVar24) / dVar23;
          lVar9 = lVar13 + 2;
          pdVar11[lVar13] = ((double)(int)lVar9 * dVar24) / dVar23;
          lVar13 = lVar9;
        } while (uVar5 - (uVar21 & 1) != lVar9);
      }
      if ((ulong)(uVar21 & 1) != 0) {
        __ptr_01[uVar7 * uVar5 + lVar9] = (dVar24 * (double)((int)lVar9 + 1)) / dVar23;
      }
      uVar7 = uVar7 + 1;
      pdVar11 = pdVar11 + uVar5;
    } while (uVar7 != (uVar6 & 0xffffffff));
  }
joined_r0x00401451:
  if ((0 < (int)local_b8) && (0 < (int)uVar21)) {
    dVar23 = (double)local_b8;
    pdVar11 = __ptr_02 + 1;
    uVar7 = 0;
    do {
      dVar24 = (double)(int)uVar7;
      lVar13 = 0;
      if (uVar5 != 1) {
        do {
          pdVar11[lVar13 + -1] = ((double)((int)lVar13 + 3) * dVar24) / dVar23;
          pdVar11[lVar13] = ((double)((int)lVar13 + 4) * dVar24) / dVar23;
          lVar13 = lVar13 + 2;
        } while (uVar5 - (uVar21 & 1) != lVar13);
      }
      if ((ulong)(uVar21 & 1) != 0) {
        __ptr_02[uVar7 * uVar5 + lVar13] = (dVar24 * (double)((int)lVar13 + 3)) / dVar23;
      }
      uVar7 = uVar7 + 1;
      pdVar11 = pdVar11 + uVar5;
    } while (uVar7 != uVar8);
  }
  if (0 < iVar2) {
    uVar7 = uVar4 & 0xffffffff;
    if (0 < (int)local_b8) {
      dVar23 = (double)uVar20;
      lVar13 = (long)__ptr_03 + 8;
      uVar18 = 0;
      do {
        dVar24 = (double)(int)uVar18;
        if (uVar8 == 1) {
          lVar10 = 0;
        }
        else {
          lVar9 = 0;
          do {
            lVar10 = lVar9 + 2;
            *(double *)(lVar13 + -8 + lVar9 * 8) = ((double)(int)lVar10 * dVar24) / dVar23;
            *(double *)(lVar13 + lVar9 * 8) = ((double)((int)lVar9 + 3) * dVar24) / dVar23;
            lVar9 = lVar10;
          } while (uVar8 - (local_b8 & 1) != lVar10);
        }
        if ((ulong)(local_b8 & 1) != 0) {
          *(double *)((long)__ptr_03 + lVar10 * 8 + uVar18 * uVar8 * 8) =
               (dVar24 * (double)((int)lVar10 + 2)) / dVar23;
        }
        uVar18 = uVar18 + 1;
        lVar13 = lVar13 + uVar8 * 8;
      } while (uVar18 != uVar7);
    }
    if (0 < (int)uVar21) {
      uVar6 = uVar6 & 0xffffffff;
      lVar13 = (long)__ptr_00 + 8;
      uVar18 = 0;
      do {
        if (bVar1) {
          uVar16 = 0;
          pdVar11 = __ptr_01;
          do {
            *(undefined8 *)((long)__ptr + uVar16 * 8 + uVar18 * uVar5 * 8) = 0;
            dVar23 = 0.0;
            if ((int)uVar6 == 1) {
              lVar9 = 0;
            }
            else {
              lVar9 = 0;
              pdVar17 = pdVar11;
              do {
                dVar23 = *(double *)(lVar13 + lVar9 * 8) * 32412.0 * pdVar17[uVar5] +
                         *(double *)(lVar13 + -8 + lVar9 * 8) * 32412.0 * *pdVar17 + dVar23;
                lVar9 = lVar9 + 2;
                pdVar17 = pdVar17 + uVar5 * 2;
              } while (uVar6 - (uVar20 & 1) != lVar9);
            }
            if ((ulong)(uVar20 & 1) != 0) {
              dVar23 = dVar23 + *(double *)((long)__ptr_00 + lVar9 * 8 + uVar18 * uVar6 * 8) *
                                32412.0 * __ptr_01[uVar16 + lVar9 * uVar5];
            }
            *(double *)((long)__ptr + uVar16 * 8 + uVar18 * uVar5 * 8) = dVar23;
            uVar16 = uVar16 + 1;
            pdVar11 = pdVar11 + 1;
          } while (uVar16 != uVar5);
        }
        else {
          memset((void *)(uVar5 * 8 * uVar18 + (long)__ptr),0,uVar5 * 8);
        }
        uVar18 = uVar18 + 1;
        lVar13 = lVar13 + uVar6 * 8;
      } while (uVar18 != uVar7);
    }
    if (0 < (int)local_b8) {
      uVar18 = uVar8 - (local_b8 & 3);
      uVar16 = (ulong)(uVar21 & 3);
      lVar13 = (long)__ptr_03 + 0x10;
      lVar10 = (long)__ptr + 0x18;
      lVar9 = uVar5 * 8;
      uVar6 = 0;
      local_78 = __ptr_03;
      local_70 = __ptr;
      do {
        if ((int)uVar21 < 1) {
          local_c0 = (uint)uVar8;
          if (local_c0 < 4) {
            uVar19 = 0;
          }
          else {
            uVar19 = 0;
            do {
              pdVar17 = (double *)(lVar13 + -0x10 + uVar19 * 8);
              pdVar11 = (double *)(lVar13 + uVar19 * 8);
              dVar24 = pdVar11[1];
              dVar23 = pdVar17[1] * 2123.0;
              *(undefined (*) [16])(lVar13 + -0x10 + uVar19 * 8) =
                   CONCAT412((int)((ulong)dVar23 >> 0x20),
                             CONCAT48(SUB84(dVar23,0),*pdVar17 * 2123.0));
              *(undefined (*) [16])(lVar13 + uVar19 * 8) =
                   CONCAT88(dVar24 * 2123.0,*pdVar11 * 2123.0);
              uVar19 = uVar19 + 4;
            } while (uVar18 != uVar19);
            uVar19 = uVar18;
            if ((ulong)(local_b8 & 3) == 0) goto LAB_00401860;
          }
          do {
            *(double *)((long)local_78 + uVar19 * 8) =
                 *(double *)((long)local_78 + uVar19 * 8) * 2123.0;
            uVar19 = uVar19 + 1;
          } while (uVar8 != uVar19);
        }
        else {
          lVar12 = uVar6 * uVar8;
          uVar19 = 0;
          pdVar11 = __ptr_02;
          do {
            dVar23 = *(double *)((long)__ptr_03 + uVar19 * 8 + lVar12 * 8) * 2123.0;
            uVar25 = SUB84(dVar23,0);
            uVar26 = (undefined4)((ulong)dVar23 >> 0x20);
            *(double *)((long)__ptr_03 + uVar19 * 8 + lVar12 * 8) = dVar23;
            if (uVar5 - 1 < 3) {
              lVar22 = 0;
            }
            else {
              lVar22 = 0;
              pdVar17 = pdVar11;
              do {
                dVar23 = *(double *)(lVar10 + lVar22 * 8) * pdVar17[uVar5 * 3] +
                         *(double *)(lVar10 + -8 + lVar22 * 8) * pdVar17[uVar5 * 2] +
                         *(double *)(lVar10 + -0x10 + lVar22 * 8) * pdVar17[uVar5] +
                         *(double *)(lVar10 + -0x18 + lVar22 * 8) * *pdVar17 +
                         (double)CONCAT44(uVar26,uVar25);
                uVar25 = SUB84(dVar23,0);
                uVar26 = (undefined4)((ulong)dVar23 >> 0x20);
                lVar22 = lVar22 + 4;
                pdVar17 = pdVar17 + uVar5 * 4;
              } while (uVar5 - uVar16 != lVar22);
            }
            if (uVar16 != 0) {
              pdVar17 = (double *)(lVar9 * lVar22 + (long)pdVar11);
              uVar14 = 0;
              do {
                dVar23 = (double)CONCAT44(uVar26,uVar25) +
                         *(double *)((long)local_70 + uVar14 * 8 + lVar22 * 8) * *pdVar17;
                uVar25 = SUB84(dVar23,0);
                uVar26 = (undefined4)((ulong)dVar23 >> 0x20);
                pdVar17 = pdVar17 + uVar5;
                uVar14 = uVar14 + 1;
              } while (uVar16 != uVar14);
            }
            *(ulong *)((long)__ptr_03 + uVar19 * 8 + lVar12 * 8) = CONCAT44(uVar26,uVar25);
            uVar19 = uVar19 + 1;
            pdVar11 = pdVar11 + 1;
          } while (uVar19 != uVar8);
        }
LAB_00401860:
        uVar6 = uVar6 + 1;
        lVar13 = lVar13 + uVar8 * 8;
        local_78 = (void *)((long)local_78 + uVar8 * 8);
        lVar10 = lVar10 + lVar9;
        local_70 = (void *)((long)local_70 + lVar9);
      } while (uVar6 != uVar7);
    }
  }
  local_50 = (int)lVar3;
  if (local_50 == 1) {
    if ((0 < iVar2) && (0 < (int)local_b8)) {
      lVar3 = 0;
      uVar5 = 0;
      pvVar15 = __ptr_03;
      do {
        uVar6 = 0;
        do {
          fprintf(*(FILE **)((long)pvVar15 + uVar6 * 8),(char *)stderr,"%0.2lf ");
          iVar2 = (int)uVar6 + (int)lVar3;
          if ((iVar2 * -0x33333333 + 0x19999998U >> 2 | iVar2 * 0x40000000) < 0xccccccd) {
            fputc(10,stderr);
          }
          uVar6 = uVar6 + 1;
        } while (uVar8 != uVar6);
        uVar5 = uVar5 + 1;
        lVar3 = lVar3 + uVar4;
        pvVar15 = (void *)((long)pvVar15 + uVar8 * 8);
      } while (uVar5 != (uVar4 & 0xffffffff));
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  free(__ptr_03);
  return 0;
}

