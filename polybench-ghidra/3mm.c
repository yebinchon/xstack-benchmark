
int main(int argc,char **argv)

{
  size_t sVar1;
  bool bVar2;
  bool bVar3;
  bool bVar4;
  int iVar5;
  long lVar6;
  ulong uVar7;
  ulong uVar8;
  ulong uVar9;
  ulong uVar10;
  ulong uVar11;
  void *__ptr;
  void *__ptr_00;
  double *__ptr_01;
  double *__ptr_02;
  void *__ptr_03;
  double *__ptr_04;
  void *__ptr_05;
  ulong uVar12;
  ulong uVar13;
  double *pdVar14;
  ulong uVar15;
  long lVar16;
  long lVar17;
  ulong uVar18;
  void *pvVar19;
  double *pdVar20;
  uint uVar21;
  uint uVar22;
  uint uVar23;
  uint uVar24;
  double dVar25;
  double dVar26;
  double_0__0_ *C;
  double_0__0_ *B;
  double_0__0_ *E;
  double_0__0_ *D;
  double_0__0_ *G;
  double_0__0_ *F;
  int dump_code;
  int local_e0;
  void *local_c8;
  void *local_c0;
  void *local_b8;
  int local_50;
  
  lVar6 = strtol(argv[1],(char **)0x0,10);
  uVar7 = strtol(argv[2],(char **)0x0,10);
  uVar8 = strtol(argv[3],(char **)0x0,10);
  uVar9 = strtol(argv[4],(char **)0x0,10);
  uVar10 = strtol(argv[5],(char **)0x0,10);
  uVar11 = strtol(argv[6],(char **)0x0,10);
  lVar17 = uVar7 << 0x20;
  __ptr = malloc((long)(uVar8 * lVar17) >> 0x1d);
  __ptr_00 = malloc((long)(uVar9 * lVar17) >> 0x1d);
  lVar16 = uVar8 << 0x20;
  __ptr_01 = (double *)malloc((long)(uVar9 * lVar16) >> 0x1d);
  __ptr_02 = (double *)malloc((long)(uVar10 * lVar16) >> 0x1d);
  __ptr_03 = malloc((long)(lVar16 * uVar11) >> 0x1d);
  uVar22 = (uint)uVar10;
  uVar24 = (uint)uVar11;
  __ptr_04 = (double *)malloc((long)(int)(uVar22 * uVar24) << 3);
  __ptr_05 = malloc((long)(lVar17 * uVar10) >> 0x1d);
  uVar23 = (uint)uVar9;
  uVar9 = uVar9 & 0xffffffff;
  uVar21 = (uint)uVar8;
  uVar8 = uVar8 & 0xffffffff;
  uVar11 = uVar11 & 0xffffffff;
  uVar10 = uVar10 & 0xffffffff;
  local_e0 = (int)uVar7;
  if (local_e0 < 1) {
LAB_004013b5:
    bVar2 = 0 < (int)uVar23;
    if ((int)uVar23 < 1) goto LAB_004014ab;
    if (0 < (int)uVar21) {
      dVar25 = (double)uVar21;
      pdVar14 = __ptr_01 + 1;
      uVar18 = 0;
      do {
        dVar26 = (double)(int)uVar18;
        if (uVar8 == 1) {
          lVar17 = 0;
        }
        else {
          lVar16 = 0;
          do {
            pdVar14[lVar16 + -1] = ((double)((int)lVar16 + 1) * dVar26) / dVar25;
            lVar17 = lVar16 + 2;
            pdVar14[lVar16] = ((double)(int)lVar17 * dVar26) / dVar25;
            lVar16 = lVar17;
          } while (uVar8 - (uVar21 & 1) != lVar17);
        }
        if ((ulong)(uVar21 & 1) != 0) {
          __ptr_01[uVar18 * uVar8 + lVar17] = (dVar26 * (double)((int)lVar17 + 1)) / dVar25;
        }
        uVar18 = uVar18 + 1;
        pdVar14 = pdVar14 + uVar8;
      } while (uVar18 != uVar9);
      goto joined_r0x004015aa;
    }
    bVar3 = false;
    bVar2 = true;
joined_r0x00401607:
    bVar4 = 0 < (int)uVar24;
    if (bVar4) {
      if ((int)uVar22 < 1) {
        bVar4 = true;
      }
      else {
        dVar25 = (double)uVar23;
        pdVar14 = __ptr_04 + 1;
        uVar18 = 0;
        do {
          dVar26 = (double)(int)uVar18;
          if (uVar10 == 1) {
            lVar17 = 0;
          }
          else {
            lVar16 = 0;
            do {
              lVar17 = lVar16 + 2;
              pdVar14[lVar16 + -1] = ((double)(int)lVar17 * dVar26) / dVar25;
              pdVar14[lVar16] = ((double)((int)lVar16 + 3) * dVar26) / dVar25;
              lVar16 = lVar17;
            } while (uVar10 - (uVar22 & 1) != lVar17);
          }
          if ((ulong)(uVar22 & 1) != 0) {
            __ptr_04[uVar18 * uVar10 + lVar17] = (dVar26 * (double)((int)lVar17 + 2)) / dVar25;
          }
          uVar18 = uVar18 + 1;
          pdVar14 = pdVar14 + uVar10;
        } while (uVar18 != uVar11);
      }
    }
    else {
      bVar4 = false;
    }
  }
  else {
    if (0 < (int)uVar23) {
      dVar25 = (double)local_e0;
      lVar16 = (long)__ptr_00 + 8;
      uVar18 = 0;
      do {
        dVar26 = (double)(int)uVar18;
        lVar17 = 0;
        if (uVar9 != 1) {
          do {
            *(double *)(lVar16 + -8 + lVar17 * 8) = ((double)(int)lVar17 * dVar26) / dVar25;
            *(double *)(lVar16 + lVar17 * 8) = ((double)((int)lVar17 + 1) * dVar26) / dVar25;
            lVar17 = lVar17 + 2;
          } while (uVar9 - (uVar23 & 1) != lVar17);
        }
        if ((ulong)(uVar23 & 1) != 0) {
          *(double *)((long)__ptr_00 + lVar17 * 8 + uVar18 * uVar9 * 8) =
               (dVar26 * (double)(int)lVar17) / dVar25;
        }
        uVar18 = uVar18 + 1;
        lVar16 = lVar16 + uVar9 * 8;
      } while (uVar18 != (uVar7 & 0xffffffff));
      goto LAB_004013b5;
    }
LAB_004014ab:
    bVar2 = false;
joined_r0x004015aa:
    if ((int)uVar21 < 1) {
      bVar3 = false;
      goto joined_r0x00401607;
    }
    bVar3 = 0 < (int)uVar21;
    if (0 < (int)uVar24) {
      dVar25 = (double)uVar22;
      lVar16 = (long)__ptr_03 + 8;
      uVar18 = 0;
      do {
        dVar26 = (double)(int)uVar18;
        lVar17 = 0;
        if (uVar11 != 1) {
          do {
            *(double *)(lVar16 + -8 + lVar17 * 8) = ((double)((int)lVar17 + 3) * dVar26) / dVar25;
            *(double *)(lVar16 + lVar17 * 8) = ((double)((int)lVar17 + 4) * dVar26) / dVar25;
            lVar17 = lVar17 + 2;
          } while (uVar11 - (uVar24 & 1) != lVar17);
        }
        if ((ulong)(uVar24 & 1) != 0) {
          *(double *)((long)__ptr_03 + lVar17 * 8 + uVar18 * uVar11 * 8) =
               (dVar26 * (double)((int)lVar17 + 3)) / dVar25;
        }
        uVar18 = uVar18 + 1;
        lVar16 = lVar16 + uVar11 * 8;
      } while (uVar18 != uVar8);
      goto joined_r0x00401607;
    }
    bVar4 = false;
    bVar3 = true;
  }
  if (local_e0 < 1) {
LAB_004018fe:
    if (!(bool)(bVar3 ^ 1U | (int)uVar22 < 1)) {
      sVar1 = uVar10 * 8;
      uVar18 = (ulong)(uVar24 & 3);
      lVar16 = (long)__ptr_03 + 0x18;
      uVar9 = 0;
      local_c0 = __ptr_03;
      do {
        if (bVar4) {
          uVar13 = 0;
          pdVar14 = __ptr_04;
          do {
            __ptr_02[uVar9 * uVar10 + uVar13] = 0.0;
            if (uVar11 - 1 < 3) {
              dVar25 = 0.0;
              lVar17 = 0;
            }
            else {
              dVar25 = 0.0;
              lVar17 = 0;
              pdVar20 = pdVar14;
              do {
                dVar25 = *(double *)(lVar16 + lVar17 * 8) * pdVar20[uVar10 * 3] +
                         *(double *)(lVar16 + -8 + lVar17 * 8) * pdVar20[uVar10 * 2] +
                         *(double *)(lVar16 + -0x10 + lVar17 * 8) * pdVar20[uVar10] +
                         *(double *)(lVar16 + -0x18 + lVar17 * 8) * *pdVar20 + dVar25;
                lVar17 = lVar17 + 4;
                pdVar20 = pdVar20 + uVar10 * 4;
              } while (uVar11 - uVar18 != lVar17);
            }
            if (uVar18 != 0) {
              pdVar20 = (double *)(sVar1 * lVar17 + (long)pdVar14);
              uVar15 = 0;
              do {
                dVar25 = dVar25 + *(double *)((long)local_c0 + uVar15 * 8 + lVar17 * 8) * *pdVar20;
                pdVar20 = pdVar20 + uVar10;
                uVar15 = uVar15 + 1;
              } while (uVar18 != uVar15);
            }
            __ptr_02[uVar9 * uVar10 + uVar13] = dVar25;
            uVar13 = uVar13 + 1;
            pdVar14 = pdVar14 + 1;
          } while (uVar13 != uVar10);
        }
        else {
          memset((double *)(sVar1 * uVar9 + (long)__ptr_02),0,sVar1);
        }
        uVar9 = uVar9 + 1;
        lVar16 = lVar16 + uVar11 * 8;
        local_c0 = (void *)((long)local_c0 + uVar11 * 8);
      } while (uVar9 != uVar8);
    }
    if (local_e0 < 1) goto LAB_00401c9e;
  }
  else if (bVar3) {
    sVar1 = uVar8 * 8;
    uVar18 = (ulong)(uVar23 & 3);
    lVar16 = (long)__ptr_00 + 0x18;
    uVar13 = 0;
    local_c8 = __ptr_00;
    do {
      if (bVar2) {
        uVar15 = 0;
        pdVar14 = __ptr_01;
        do {
          *(undefined8 *)((long)__ptr + uVar15 * 8 + uVar13 * uVar8 * 8) = 0;
          if (uVar9 - 1 < 3) {
            dVar25 = 0.0;
            lVar17 = 0;
          }
          else {
            dVar25 = 0.0;
            lVar17 = 0;
            pdVar20 = pdVar14;
            do {
              dVar25 = *(double *)(lVar16 + lVar17 * 8) * pdVar20[uVar8 * 3] +
                       *(double *)(lVar16 + -8 + lVar17 * 8) * pdVar20[uVar8 * 2] +
                       *(double *)(lVar16 + -0x10 + lVar17 * 8) * pdVar20[uVar8] +
                       *(double *)(lVar16 + -0x18 + lVar17 * 8) * *pdVar20 + dVar25;
              lVar17 = lVar17 + 4;
              pdVar20 = pdVar20 + uVar8 * 4;
            } while (uVar9 - uVar18 != lVar17);
          }
          if (uVar18 != 0) {
            pdVar20 = (double *)(sVar1 * lVar17 + (long)pdVar14);
            uVar12 = 0;
            do {
              dVar25 = dVar25 + *(double *)((long)local_c8 + uVar12 * 8 + lVar17 * 8) * *pdVar20;
              pdVar20 = pdVar20 + uVar8;
              uVar12 = uVar12 + 1;
            } while (uVar18 != uVar12);
          }
          *(double *)((long)__ptr + uVar15 * 8 + uVar13 * uVar8 * 8) = dVar25;
          uVar15 = uVar15 + 1;
          pdVar14 = pdVar14 + 1;
        } while (uVar15 != uVar8);
      }
      else {
        memset((void *)(sVar1 * uVar13 + (long)__ptr),0,sVar1);
      }
      uVar13 = uVar13 + 1;
      lVar16 = lVar16 + uVar9 * 8;
      local_c8 = (void *)((long)local_c8 + uVar9 * 8);
    } while (uVar13 != (uVar7 & 0xffffffff));
    goto LAB_004018fe;
  }
  if (0 < (int)uVar22) {
    sVar1 = uVar10 * 8;
    uVar11 = (ulong)(uVar21 & 3);
    lVar16 = (long)__ptr + 0x18;
    uVar9 = 0;
    local_b8 = __ptr;
    do {
      if (bVar3) {
        uVar18 = 0;
        pdVar14 = __ptr_02;
        do {
          *(undefined8 *)((long)__ptr_05 + uVar18 * 8 + uVar9 * uVar10 * 8) = 0;
          if (uVar8 - 1 < 3) {
            dVar25 = 0.0;
            lVar17 = 0;
          }
          else {
            dVar25 = 0.0;
            lVar17 = 0;
            pdVar20 = pdVar14;
            do {
              dVar25 = *(double *)(lVar16 + lVar17 * 8) * pdVar20[uVar10 * 3] +
                       *(double *)(lVar16 + -8 + lVar17 * 8) * pdVar20[uVar10 * 2] +
                       *(double *)(lVar16 + -0x10 + lVar17 * 8) * pdVar20[uVar10] +
                       *(double *)(lVar16 + -0x18 + lVar17 * 8) * *pdVar20 + dVar25;
              lVar17 = lVar17 + 4;
              pdVar20 = pdVar20 + uVar10 * 4;
            } while (uVar8 - uVar11 != lVar17);
          }
          if (uVar11 != 0) {
            pdVar20 = (double *)(sVar1 * lVar17 + (long)pdVar14);
            uVar13 = 0;
            do {
              dVar25 = dVar25 + *(double *)((long)local_b8 + uVar13 * 8 + lVar17 * 8) * *pdVar20;
              pdVar20 = pdVar20 + uVar10;
              uVar13 = uVar13 + 1;
            } while (uVar11 != uVar13);
          }
          *(double *)((long)__ptr_05 + uVar18 * 8 + uVar9 * uVar10 * 8) = dVar25;
          uVar18 = uVar18 + 1;
          pdVar14 = pdVar14 + 1;
        } while (uVar18 != uVar10);
      }
      else {
        memset((void *)(sVar1 * uVar9 + (long)__ptr_05),0,sVar1);
      }
      uVar9 = uVar9 + 1;
      lVar16 = lVar16 + uVar8 * 8;
      local_b8 = (void *)((long)local_b8 + uVar8 * 8);
    } while (uVar9 != (uVar7 & 0xffffffff));
  }
LAB_00401c9e:
  local_50 = (int)lVar6;
  if (local_50 == 1) {
    if ((0 < local_e0) && (0 < (int)uVar22)) {
      lVar6 = 0;
      uVar9 = 0;
      pvVar19 = __ptr_05;
      do {
        uVar11 = 0;
        do {
          fprintf(*(FILE **)((long)pvVar19 + uVar11 * 8),(char *)stderr,"%0.2lf ");
          iVar5 = (int)uVar11 + (int)lVar6;
          if ((iVar5 * -0x33333333 + 0x19999998U >> 2 | iVar5 * 0x40000000) < 0xccccccd) {
            fputc(10,stderr);
          }
          uVar11 = uVar11 + 1;
        } while (uVar10 != uVar11);
        uVar9 = uVar9 + 1;
        lVar6 = lVar6 + uVar7;
        pvVar19 = (void *)((long)pvVar19 + uVar10 * 8);
      } while (uVar9 != (uVar7 & 0xffffffff));
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  free(__ptr_03);
  free(__ptr_04);
  free(__ptr_05);
  return 0;
}

