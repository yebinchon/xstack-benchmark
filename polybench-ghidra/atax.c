
int main(int argc,char **argv)

{
  double *pdVar1;
  double *pdVar2;
  double *pdVar3;
  double *pdVar4;
  double dVar5;
  double dVar6;
  double dVar7;
  double dVar8;
  double dVar9;
  ulong uVar10;
  ulong uVar11;
  long lVar12;
  void *__ptr;
  void *__ptr_00;
  void *__s;
  ulong uVar13;
  ulong uVar14;
  void *pvVar15;
  long lVar16;
  ulong uVar17;
  ulong uVar18;
  ulong uVar19;
  long lVar20;
  long lVar21;
  int iVar22;
  ulong uVar23;
  uint uVar24;
  double dVar25;
  double dVar26;
  double dVar27;
  double_0__0_ *A;
  int dump_code;
  int local_58;
  ulong local_40;
  void *local_38;
  
  uVar10 = strtol(argv[2],(char **)0x0,10);
  uVar11 = strtol(argv[3],(char **)0x0,10);
  lVar12 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc((long)(uVar11 * (uVar10 << 0x20)) >> 0x1d);
  uVar24 = (uint)uVar11;
  __ptr_00 = malloc((long)(int)uVar24 * 8);
  __s = malloc((long)(uVar10 << 0x20) >> 0x1d);
  dVar27 = DAT_00402008;
  uVar14 = uVar11 & 0xffffffff;
  dVar25 = DAT_00402008;
  if (0 < (int)uVar24) {
    uVar13 = (ulong)(uVar24 & 3);
    if (uVar14 - 1 < 3) {
      lVar16 = 0;
    }
    else {
      lVar16 = 0;
      do {
        iVar22 = (int)lVar16;
        *(double *)((long)__ptr_00 + lVar16 * 8) = (double)iVar22 * dVar27;
        *(double *)((long)__ptr_00 + lVar16 * 8 + 8) = (double)(iVar22 + 1) * dVar27;
        *(double *)((long)__ptr_00 + lVar16 * 8 + 0x10) = (double)(iVar22 + 2) * dVar27;
        *(double *)((long)__ptr_00 + lVar16 * 8 + 0x18) = (double)(iVar22 + 3) * dVar27;
        lVar16 = lVar16 + 4;
        dVar25 = DAT_00402008;
      } while (uVar14 - uVar13 != lVar16);
    }
    for (; dVar27 = DAT_00402008, uVar13 != 0; uVar13 = uVar13 - 1) {
      dVar26 = (double)(int)lVar16 * DAT_00402008;
      DAT_00402008 = dVar25;
      *(double *)((long)__ptr_00 + lVar16 * 8) = dVar26;
      lVar16 = lVar16 + 1;
      dVar25 = DAT_00402008;
      DAT_00402008 = dVar27;
    }
  }
  DAT_00402008 = dVar25;
  iVar22 = (int)uVar10;
  if (((long)iVar22 == uVar10) && ((uVar11 & 0xffffffff80000000) == 0)) {
    local_40 = uVar11;
    local_38 = __ptr;
    if (0 < (long)uVar10) {
      memset(__s,0,(uVar10 & 0xffffffff) << 3);
    }
    if (0 < (long)uVar11) {
      lVar20 = uVar14 * 8;
      uVar14 = uVar11 - 4 >> 2;
      uVar13 = uVar14 + 1;
      uVar23 = uVar11 & 0xfffffffffffffffc;
      lVar16 = (long)__ptr + 0x18;
      uVar19 = 0;
      pvVar15 = __ptr;
      do {
        dVar25 = 0.0;
        uVar17 = 0;
        if (2 < uVar11 - 1) {
          do {
            dVar25 = *(double *)(lVar16 + uVar17 * 8) *
                     *(double *)((long)__ptr_00 + uVar17 * 8 + 0x18) +
                     *(double *)(lVar16 + -8 + uVar17 * 8) *
                     *(double *)((long)__ptr_00 + uVar17 * 8 + 0x10) +
                     *(double *)(lVar16 + -0x10 + uVar17 * 8) *
                     *(double *)((long)__ptr_00 + uVar17 * 8 + 8) +
                     *(double *)(lVar16 + -0x18 + uVar17 * 8) *
                     *(double *)((long)__ptr_00 + uVar17 * 8) + dVar25;
            uVar17 = uVar17 + 4;
          } while (uVar23 != uVar17);
        }
        if ((ulong)(uVar24 & 3) != 0) {
          uVar18 = 0;
          do {
            dVar25 = dVar25 + *(double *)((long)pvVar15 + uVar18 * 8 + uVar17 * 8) *
                              *(double *)((long)__ptr_00 + uVar18 * 8 + uVar17 * 8);
            uVar18 = uVar18 + 1;
          } while ((uVar24 & 3) != uVar18);
        }
        if (3 < uVar11) {
          if (uVar14 == 0) {
            lVar21 = 0;
          }
          else {
            lVar21 = 0;
            uVar17 = uVar13 & 0xfffffffffffffffe;
            do {
              pdVar1 = (double *)((long)pvVar15 + lVar21 * 8);
              pdVar3 = (double *)((long)pvVar15 + lVar21 * 8 + 0x10);
              dVar5 = *pdVar3;
              pdVar2 = (double *)((long)__s + lVar21 * 8);
              pdVar4 = (double *)((long)__s + lVar21 * 8 + 0x10);
              dVar6 = *pdVar4;
              dVar27 = pdVar4[1] + pdVar3[1] * dVar25;
              pdVar3 = (double *)((long)__s + lVar21 * 8 + 0x20);
              dVar7 = *pdVar3;
              dVar26 = pdVar3[1];
              pdVar3 = (double *)((long)__s + lVar21 * 8 + 0x30);
              dVar8 = *pdVar3;
              dVar9 = pdVar3[1];
              *(undefined (*) [16])((long)__s + lVar21 * 8) =
                   CONCAT88(pdVar2[1] + pdVar1[1] * dVar25,*pdVar2 + *pdVar1 * dVar25);
              *(undefined (*) [16])((long)__s + lVar21 * 8 + 0x10) =
                   CONCAT412((int)((ulong)dVar27 >> 0x20),
                             CONCAT48(SUB84(dVar27,0),dVar6 + dVar5 * dVar25));
              pdVar1 = (double *)((long)pvVar15 + lVar21 * 8 + 0x20);
              pdVar2 = (double *)((long)pvVar15 + lVar21 * 8 + 0x30);
              dVar27 = *pdVar2;
              dVar5 = pdVar2[1];
              dVar26 = pdVar1[1] * dVar25 + dVar26;
              *(undefined (*) [16])((long)__s + lVar21 * 8 + 0x20) =
                   CONCAT412((int)((ulong)dVar26 >> 0x20),
                             CONCAT48(SUB84(dVar26,0),*pdVar1 * dVar25 + dVar7));
              *(undefined (*) [16])((long)__s + lVar21 * 8 + 0x30) =
                   CONCAT88(dVar5 * dVar25 + dVar9,dVar27 * dVar25 + dVar8);
              lVar21 = lVar21 + 8;
              uVar17 = uVar17 - 2;
            } while (uVar17 != 0);
          }
          uVar17 = uVar23;
          if ((uVar13 & 1) == 0) goto joined_r0x0040155c;
          pdVar1 = (double *)((long)__s + lVar21 * 8);
          pdVar2 = (double *)((long)__s + lVar21 * 8 + 0x10);
          dVar27 = *pdVar2;
          dVar26 = pdVar2[1];
          pdVar2 = (double *)((long)__ptr + lVar21 * 8 + lVar20 * uVar19);
          pdVar3 = (double *)((long)__ptr + lVar21 * 8 + lVar20 * uVar19 + 0x10);
          dVar5 = *pdVar3;
          dVar6 = pdVar3[1];
          *(undefined (*) [16])((long)__s + lVar21 * 8) =
               CONCAT88(pdVar2[1] * dVar25 + pdVar1[1],*pdVar2 * dVar25 + *pdVar1);
          *(undefined (*) [16])((long)__s + lVar21 * 8 + 0x10) =
               CONCAT88(dVar6 * dVar25 + dVar26,dVar5 * dVar25 + dVar27);
          goto joined_r0x0040155c;
        }
        uVar17 = 0;
        do {
          *(double *)((long)__s + uVar17 * 8) =
               *(double *)((long)pvVar15 + uVar17 * 8) * dVar25 +
               *(double *)((long)__s + uVar17 * 8);
          uVar17 = uVar17 + 1;
joined_r0x0040155c:
        } while (uVar11 != uVar17);
        uVar19 = uVar19 + 1;
        lVar16 = lVar16 + lVar20;
        pvVar15 = (void *)((long)pvVar15 + lVar20);
      } while (uVar19 != uVar11);
    }
  }
  else {
    if (0 < iVar22) {
      if (0 < (int)uVar24) {
        dVar25 = (double)iVar22;
        lVar16 = (long)__ptr + 8;
        uVar11 = 0;
        do {
          dVar27 = (double)(int)uVar11;
          if (uVar14 == 1) {
            lVar21 = 0;
          }
          else {
            lVar20 = 0;
            do {
              *(double *)(lVar16 + -8 + lVar20 * 8) = ((double)((int)lVar20 + 1) * dVar27) / dVar25;
              lVar21 = lVar20 + 2;
              *(double *)(lVar16 + lVar20 * 8) = ((double)(int)lVar21 * dVar27) / dVar25;
              lVar20 = lVar21;
            } while (uVar14 - (uVar24 & 1) != lVar21);
          }
          if ((ulong)(uVar24 & 1) != 0) {
            *(double *)((long)__ptr + lVar21 * 8 + uVar11 * uVar14 * 8) =
                 (dVar27 * (double)((int)lVar21 + 1)) / dVar25;
          }
          uVar11 = uVar11 + 1;
          lVar16 = lVar16 + uVar14 * 8;
        } while (uVar11 != (uVar10 & 0xffffffff));
      }
      memset(__s,0,(uVar10 & 0xffffffff) << 3);
    }
    if (0 < (int)uVar24) {
      uVar19 = (ulong)(uVar24 & 3);
      uVar11 = uVar14 - uVar19;
      lVar16 = (long)__ptr + 0x18;
      uVar13 = 0;
      pvVar15 = __ptr;
      do {
        dVar25 = 0.0;
        uVar23 = 0;
        if (2 < uVar14 - 1) {
          do {
            dVar25 = *(double *)(lVar16 + uVar23 * 8) *
                     *(double *)((long)__ptr_00 + uVar23 * 8 + 0x18) +
                     *(double *)(lVar16 + -8 + uVar23 * 8) *
                     *(double *)((long)__ptr_00 + uVar23 * 8 + 0x10) +
                     *(double *)(lVar16 + -0x10 + uVar23 * 8) *
                     *(double *)((long)__ptr_00 + uVar23 * 8 + 8) +
                     *(double *)(lVar16 + -0x18 + uVar23 * 8) *
                     *(double *)((long)__ptr_00 + uVar23 * 8) + dVar25;
            uVar23 = uVar23 + 4;
          } while (uVar11 != uVar23);
        }
        if (uVar19 != 0) {
          uVar17 = 0;
          do {
            dVar25 = dVar25 + *(double *)((long)pvVar15 + uVar17 * 8 + uVar23 * 8) *
                              *(double *)((long)__ptr_00 + uVar17 * 8 + uVar23 * 8);
            uVar17 = uVar17 + 1;
          } while (uVar19 != uVar17);
        }
        if ((uint)uVar14 < 4) {
          uVar23 = 0;
LAB_004017e0:
          do {
            *(double *)((long)__s + uVar23 * 8) =
                 *(double *)((long)pvVar15 + uVar23 * 8) * dVar25 +
                 *(double *)((long)__s + uVar23 * 8);
            uVar23 = uVar23 + 1;
          } while (uVar14 != uVar23);
        }
        else {
          uVar23 = 0;
          do {
            pdVar1 = (double *)((long)__s + uVar23 * 8);
            pdVar2 = (double *)((long)__s + uVar23 * 8 + 0x10);
            dVar27 = *pdVar2;
            dVar26 = pdVar2[1];
            pdVar2 = (double *)((long)pvVar15 + uVar23 * 8);
            pdVar3 = (double *)((long)pvVar15 + uVar23 * 8 + 0x10);
            dVar5 = *pdVar3;
            dVar6 = pdVar3[1];
            *(undefined (*) [16])((long)__s + uVar23 * 8) =
                 CONCAT88(pdVar2[1] * dVar25 + pdVar1[1],*pdVar2 * dVar25 + *pdVar1);
            *(undefined (*) [16])((long)__s + uVar23 * 8 + 0x10) =
                 CONCAT88(dVar6 * dVar25 + dVar26,dVar5 * dVar25 + dVar27);
            uVar23 = uVar23 + 4;
          } while (uVar11 != uVar23);
          uVar23 = uVar11;
          if (uVar19 != 0) goto LAB_004017e0;
        }
        uVar13 = uVar13 + 1;
        lVar16 = lVar16 + uVar14 * 8;
        pvVar15 = (void *)((long)pvVar15 + uVar14 * 8);
      } while (uVar13 != uVar14);
    }
  }
  local_58 = (int)lVar12;
  if (local_58 == 1) {
    if (0 < iVar22) {
      uVar11 = 0;
      iVar22 = 0;
      lVar12 = 0;
      do {
        fprintf(*(FILE **)((long)__s + lVar12),(char *)stderr,"%0.2lf ");
        if ((int)(uVar11 / 0x14) * 0x14 + iVar22 == 0) {
          fputc(10,stderr);
        }
        lVar12 = lVar12 + 8;
        iVar22 = iVar22 + -1;
        uVar11 = (ulong)((int)uVar11 + 1);
      } while ((uVar10 & 0xffffffff) << 3 != lVar12);
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__s);
  return 0;
}



void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     undefined8 *param_6)

{
  undefined4 uVar1;
  undefined8 uVar2;
  ulong uVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  double dVar10;
  double dVar11;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  uVar2 = *param_6;
  uVar3 = param_6[1];
  lVar4 = param_6[2];
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402018,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  lVar7 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar7 = local_50;
  }
  if (local_40 <= lVar7) {
    lVar5 = local_40;
    if ((long)uVar3 < 1) {
      do {
        lVar5 = lVar5 + param_5;
      } while (lVar5 <= lVar7);
    }
    else {
      dVar10 = (double)(int)uVar2;
      lVar6 = lVar4 + local_40 * (uVar3 & 0xffffffff) * 8 + 8;
      do {
        dVar11 = (double)(int)lVar5;
        if (uVar3 == 1) {
          uVar9 = 0;
        }
        else {
          uVar8 = 0;
          do {
            *(double *)(lVar6 + -8 + uVar8 * 8) = ((double)((int)uVar8 + 1) * dVar11) / dVar10;
            uVar9 = uVar8 + 2;
            *(double *)(lVar6 + uVar8 * 8) = ((double)(int)uVar9 * dVar11) / dVar10;
            uVar8 = uVar9;
          } while ((uVar3 & 0xfffffffffffffffe) != uVar9);
        }
        if ((uVar3 & 1) != 0) {
          *(double *)(lVar5 * (uVar3 & 0xffffffff) * 8 + lVar4 + uVar9 * 8) =
               (dVar11 * (double)((int)uVar9 + 1)) / dVar10;
        }
        lVar5 = lVar5 + param_5;
        lVar6 = lVar6 + (uVar3 & 0xffffffff) * param_5 * 8;
      } while (lVar5 <= lVar7);
    }
  }
  local_50 = lVar7;
  __kmpc_for_static_fini(&DAT_00402018,uVar1);
  return;
}


