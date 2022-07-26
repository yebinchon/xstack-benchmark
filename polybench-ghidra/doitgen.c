
int main(int argc,char **argv)

{
  long lVar1;
  ulong uVar2;
  ulong uVar3;
  ulong uVar4;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  uint uVar5;
  ulong uVar6;
  size_t __size;
  ulong uVar7;
  void *pvVar8;
  long lVar9;
  void *pvVar10;
  long lVar11;
  long lVar12;
  ulong uVar13;
  int iVar14;
  double dVar15;
  double dVar16;
  double_0__0__0_ *A;
  int dump_code;
  double_0__0_ *C4;
  double_0__0__0_ *sum;
  int local_98;
  int local_80;
  int local_54;
  uint local_50;
  void *local_48;
  void *local_40;
  void *local_38;
  
  lVar1 = strtol(argv[1],(char **)0x0,10);
  uVar2 = strtol(argv[2],(char **)0x0,10);
  uVar3 = strtol(argv[3],(char **)0x0,10);
  uVar4 = strtol(argv[4],(char **)0x0,10);
  __size = (long)(uVar3 * uVar4 * (uVar2 << 0x20)) >> 0x1d;
  __ptr = malloc(__size);
  __ptr_00 = malloc(__size);
  uVar5 = (uint)uVar4;
  __ptr_01 = malloc((ulong)(uVar5 * uVar5) << 3);
  uVar13 = uVar3 & 0xffffffff;
  uVar4 = uVar4 & 0xffffffff;
  dVar15 = (double)uVar5;
  iVar14 = (int)uVar2;
  local_98 = (int)uVar3;
  if ((0 < iVar14) && (0 < local_98)) {
    lVar11 = (long)__ptr + 8;
    uVar3 = 0;
    do {
      if (0 < (int)uVar5) {
        uVar7 = 0;
        lVar9 = lVar11;
        do {
          dVar16 = (double)(int)uVar7 * (double)(int)uVar3;
          lVar12 = 0;
          if (uVar4 != 1) {
            do {
              *(double *)(lVar9 + -8 + lVar12 * 8) = ((double)(int)lVar12 + dVar16) / dVar15;
              *(double *)(lVar9 + lVar12 * 8) = ((double)((int)lVar12 + 1) + dVar16) / dVar15;
              lVar12 = lVar12 + 2;
            } while (uVar4 - (uVar5 & 1) != lVar12);
          }
          if ((ulong)(uVar5 & 1) != 0) {
            *(double *)((long)__ptr + lVar12 * 8 + uVar7 * uVar4 * 8 + uVar4 * uVar13 * uVar3 * 8) =
                 (dVar16 + (double)(int)lVar12) / dVar15;
          }
          uVar7 = uVar7 + 1;
          lVar9 = lVar9 + uVar4 * 8;
        } while (uVar7 != uVar13);
      }
      uVar3 = uVar3 + 1;
      lVar11 = lVar11 + uVar4 * uVar13 * 8;
    } while (uVar3 != (uVar2 & 0xffffffff));
  }
  if (0 < (int)uVar5) {
    lVar11 = (long)__ptr_01 + 8;
    uVar3 = 0;
    do {
      dVar16 = (double)(int)uVar3;
      lVar9 = 0;
      if (uVar4 != 1) {
        do {
          *(double *)(lVar11 + -8 + lVar9 * 8) = ((double)(int)lVar9 * dVar16) / dVar15;
          *(double *)(lVar11 + lVar9 * 8) = ((double)((int)lVar9 + 1) * dVar16) / dVar15;
          lVar9 = lVar9 + 2;
        } while (uVar4 - (uVar5 & 1) != lVar9);
      }
      if ((ulong)(uVar5 & 1) != 0) {
        *(double *)((long)__ptr_01 + lVar9 * 8 + uVar3 * uVar4 * 8) =
             (dVar16 * (double)(int)lVar9) / dVar15;
      }
      uVar3 = uVar3 + 1;
      lVar11 = lVar11 + uVar4 * 8;
    } while (uVar3 != uVar4);
  }
  local_54 = local_98;
  local_50 = uVar5;
  local_48 = __ptr_00;
  local_40 = __ptr;
  local_38 = __ptr_01;
  local_80 = (int)lVar1;
  if (local_80 == 1) {
    if (0 < iVar14) {
      uVar3 = 0;
      pvVar10 = __ptr;
      do {
        if ((0 < local_98) && (0 < (int)uVar5)) {
          uVar7 = 0;
          pvVar8 = pvVar10;
          do {
            if ((int)uVar3 + (int)((uVar3 & 0xffffffff) / 0x14) * -0x14 == 0) {
              uVar6 = 0;
              do {
                fprintf(*(FILE **)((long)pvVar8 + uVar6 * 8),(char *)stderr,"%0.2lf ");
                fputc(10,stderr);
                uVar6 = uVar6 + 1;
              } while (uVar4 != uVar6);
            }
            else {
              uVar6 = 0;
              do {
                fprintf(*(FILE **)((long)pvVar8 + uVar6 * 8),(char *)stderr,"%0.2lf ");
                uVar6 = uVar6 + 1;
              } while (uVar4 != uVar6);
            }
            uVar7 = uVar7 + 1;
            pvVar8 = (void *)((long)pvVar8 + uVar4 * 8);
          } while (uVar7 != uVar13);
        }
        uVar3 = uVar3 + 1;
        pvVar10 = (void *)((long)pvVar10 + uVar4 * uVar13 * 8);
      } while (uVar3 != (uVar2 & 0xffffffff));
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  return 0;
}



void kernel_doitgen_polly_subfn
               (undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
               long param_6)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  uint uVar3;
  double dVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  ulong uVar10;
  long lVar11;
  long lVar12;
  ulong uVar13;
  long lVar14;
  long lVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  long lVar19;
  long lVar20;
  double *pdVar21;
  double *pdVar22;
  ulong uVar23;
  ulong uVar24;
  long lVar25;
  undefined4 uVar26;
  undefined4 uVar27;
  long local_100;
  undefined4 local_f8;
  undefined4 local_f4;
  ulong local_f0;
  long local_e8;
  long local_e0;
  long local_d8;
  long local_d0;
  long local_c8;
  long local_c0;
  long local_b8;
  long local_b0;
  long local_a8;
  long local_a0;
  double *local_98;
  long local_90;
  long local_88;
  long local_80;
  long local_78;
  ulong local_70;
  ulong local_68;
  ulong local_60;
  ulong local_58;
  long local_50;
  long local_48;
  ulong local_40;
  long local_38;
  
  local_f0 = (ulong)*(uint *)(param_6 + 4);
  uVar3 = *(uint *)(param_6 + 8);
  uVar10 = (ulong)uVar3;
  local_a8 = *(long *)(param_6 + 0x10);
  local_b0 = *(long *)(param_6 + 0x18);
  local_98 = *(double **)(param_6 + 0x20);
  local_f8 = *param_1;
  local_f4 = 0;
  local_100 = param_4;
  local_90 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402008,local_f8,0x22,&local_f4,&local_90,&local_100,&local_38,1,1)
  ;
  lVar14 = param_4 + -1;
  if (local_100 <= param_4 + -1) {
    lVar14 = local_100;
  }
  if (local_90 <= lVar14) {
    lVar16 = local_90;
    if ((int)local_f0 < 1) {
      do {
        lVar16 = lVar16 + param_5;
      } while (lVar16 <= lVar14);
    }
    else {
      uVar24 = (ulong)(int)uVar3;
      local_58 = uVar24 - 4;
      local_70 = (local_58 >> 2) + 1;
      local_40 = (ulong)(uVar3 & 1);
      local_60 = uVar24 & 0xfffffffffffffffc;
      local_68 = (ulong)((uint)local_70 & 3);
      local_70 = local_70 & 0xfffffffffffffffc;
      lVar16 = local_90 * local_f0 * uVar10;
      local_c8 = local_b0 + lVar16 * 8 + 8;
      local_88 = param_5 * local_f0 * uVar10 * 8;
      local_d0 = local_a8 + lVar16 * 8 + 0x70;
      local_d8 = local_b0 + 0x70 + lVar16 * 8;
      local_b8 = local_68 << 5;
      local_e0 = local_b0 + lVar16 * 8;
      local_e8 = local_a8 + lVar16 * 8;
      local_50 = (long)(int)local_f0;
      lVar16 = uVar10 * 8;
      lVar15 = local_90;
      do {
        local_c0 = lVar15;
        if (0 < (int)uVar3) {
          local_48 = local_c0 * local_f0;
          lVar15 = local_d8;
          lVar17 = local_c8;
          lVar19 = local_e8;
          lVar20 = local_e0;
          lVar12 = 0;
          lVar25 = local_d0;
          do {
            local_a0 = lVar12;
            lVar11 = (local_48 + local_a0) * lVar16;
            lVar12 = local_a8 + lVar11;
            uVar13 = 0;
            pdVar21 = local_98;
            do {
              *(undefined8 *)(lVar12 + uVar13 * 8) = 0;
              if (uVar3 == 1) {
                uVar26 = 0;
                uVar27 = 0;
                uVar23 = 0;
              }
              else {
                uVar26 = 0;
                uVar27 = 0;
                uVar23 = 0;
                pdVar22 = pdVar21;
                do {
                  dVar4 = *(double *)(lVar17 + uVar23 * 8) * pdVar22[uVar10] +
                          *(double *)(lVar17 + -8 + uVar23 * 8) * *pdVar22 +
                          (double)CONCAT44(uVar27,uVar26);
                  uVar26 = SUB84(dVar4,0);
                  uVar27 = (undefined4)((ulong)dVar4 >> 0x20);
                  uVar23 = uVar23 + 2;
                  pdVar22 = pdVar22 + uVar10 * 2;
                } while ((uVar24 & 0xfffffffffffffffe) != uVar23);
              }
              if (local_40 != 0) {
                dVar4 = (double)CONCAT44(uVar27,uVar26) +
                        *(double *)(lVar11 + local_b0 + uVar23 * 8) *
                        local_98[uVar13 + uVar23 * uVar10];
                uVar26 = SUB84(dVar4,0);
                uVar27 = (undefined4)((ulong)dVar4 >> 0x20);
              }
              *(ulong *)(lVar12 + uVar13 * 8) = CONCAT44(uVar27,uVar26);
              uVar13 = uVar13 + 1;
              pdVar21 = pdVar21 + 1;
            } while (uVar13 != uVar24);
            if (3 < uVar3) {
              if (local_58 < 0xc) {
                lVar12 = 0;
              }
              else {
                lVar12 = 0;
                uVar13 = local_70;
                do {
                  puVar1 = (undefined4 *)(lVar25 + -0x70 + lVar12 * 8);
                  uVar26 = puVar1[1];
                  uVar27 = puVar1[2];
                  uVar5 = puVar1[3];
                  puVar2 = (undefined4 *)(lVar25 + -0x60 + lVar12 * 8);
                  uVar6 = *puVar2;
                  uVar7 = puVar2[1];
                  uVar8 = puVar2[2];
                  uVar9 = puVar2[3];
                  puVar2 = (undefined4 *)(lVar15 + -0x70 + lVar12 * 8);
                  *puVar2 = *puVar1;
                  puVar2[1] = uVar26;
                  puVar2[2] = uVar27;
                  puVar2[3] = uVar5;
                  puVar1 = (undefined4 *)(lVar15 + -0x60 + lVar12 * 8);
                  *puVar1 = uVar6;
                  puVar1[1] = uVar7;
                  puVar1[2] = uVar8;
                  puVar1[3] = uVar9;
                  puVar1 = (undefined4 *)(lVar25 + -0x50 + lVar12 * 8);
                  uVar26 = puVar1[1];
                  uVar27 = puVar1[2];
                  uVar5 = puVar1[3];
                  puVar2 = (undefined4 *)(lVar25 + -0x40 + lVar12 * 8);
                  uVar6 = *puVar2;
                  uVar7 = puVar2[1];
                  uVar8 = puVar2[2];
                  uVar9 = puVar2[3];
                  puVar2 = (undefined4 *)(lVar15 + -0x50 + lVar12 * 8);
                  *puVar2 = *puVar1;
                  puVar2[1] = uVar26;
                  puVar2[2] = uVar27;
                  puVar2[3] = uVar5;
                  puVar1 = (undefined4 *)(lVar15 + -0x40 + lVar12 * 8);
                  *puVar1 = uVar6;
                  puVar1[1] = uVar7;
                  puVar1[2] = uVar8;
                  puVar1[3] = uVar9;
                  puVar1 = (undefined4 *)(lVar25 + -0x30 + lVar12 * 8);
                  uVar26 = puVar1[1];
                  uVar27 = puVar1[2];
                  uVar5 = puVar1[3];
                  puVar2 = (undefined4 *)(lVar25 + -0x20 + lVar12 * 8);
                  uVar6 = *puVar2;
                  uVar7 = puVar2[1];
                  uVar8 = puVar2[2];
                  uVar9 = puVar2[3];
                  puVar2 = (undefined4 *)(lVar15 + -0x30 + lVar12 * 8);
                  *puVar2 = *puVar1;
                  puVar2[1] = uVar26;
                  puVar2[2] = uVar27;
                  puVar2[3] = uVar5;
                  puVar1 = (undefined4 *)(lVar15 + -0x20 + lVar12 * 8);
                  *puVar1 = uVar6;
                  puVar1[1] = uVar7;
                  puVar1[2] = uVar8;
                  puVar1[3] = uVar9;
                  puVar2 = (undefined4 *)(lVar25 + -0x10 + lVar12 * 8);
                  uVar26 = puVar2[1];
                  uVar27 = puVar2[2];
                  uVar5 = puVar2[3];
                  puVar1 = (undefined4 *)(lVar25 + lVar12 * 8);
                  uVar6 = *puVar1;
                  uVar7 = puVar1[1];
                  uVar8 = puVar1[2];
                  uVar9 = puVar1[3];
                  puVar1 = (undefined4 *)(lVar15 + -0x10 + lVar12 * 8);
                  *puVar1 = *puVar2;
                  puVar1[1] = uVar26;
                  puVar1[2] = uVar27;
                  puVar1[3] = uVar5;
                  puVar1 = (undefined4 *)(lVar15 + lVar12 * 8);
                  *puVar1 = uVar6;
                  puVar1[1] = uVar7;
                  puVar1[2] = uVar8;
                  puVar1[3] = uVar9;
                  lVar12 = lVar12 + 0x10;
                  uVar13 = uVar13 - 4;
                } while (uVar13 != 0);
              }
              uVar13 = local_60;
              if (local_68 == 0) goto joined_r0x00401a8d;
              lVar11 = lVar20 + lVar12 * 8;
              lVar12 = lVar19 + lVar12 * 8;
              lVar18 = 0;
              do {
                puVar1 = (undefined4 *)(lVar12 + lVar18);
                uVar26 = puVar1[1];
                uVar27 = puVar1[2];
                uVar5 = puVar1[3];
                puVar2 = (undefined4 *)(lVar12 + 0x10 + lVar18);
                uVar6 = *puVar2;
                uVar7 = puVar2[1];
                uVar8 = puVar2[2];
                uVar9 = puVar2[3];
                puVar2 = (undefined4 *)(lVar11 + lVar18);
                *puVar2 = *puVar1;
                puVar2[1] = uVar26;
                puVar2[2] = uVar27;
                puVar2[3] = uVar5;
                puVar1 = (undefined4 *)(lVar11 + 0x10 + lVar18);
                *puVar1 = uVar6;
                puVar1[1] = uVar7;
                puVar1[2] = uVar8;
                puVar1[3] = uVar9;
                lVar18 = lVar18 + 0x20;
                if (local_b8 == lVar18) goto joined_r0x00401a8d;
              } while( true );
            }
            uVar13 = 0;
            do {
              *(undefined8 *)(lVar20 + uVar13 * 8) = *(undefined8 *)(lVar19 + uVar13 * 8);
              uVar13 = uVar13 + 1;
joined_r0x00401a8d:
            } while (uVar13 != uVar24);
            lVar17 = lVar17 + lVar16;
            lVar25 = lVar25 + lVar16;
            lVar15 = lVar15 + lVar16;
            lVar20 = lVar20 + lVar16;
            lVar19 = lVar19 + lVar16;
            lVar12 = local_a0 + 1;
          } while (local_a0 + 1 != local_50);
        }
        local_c8 = local_c8 + local_88;
        local_d0 = local_d0 + local_88;
        local_d8 = local_d8 + local_88;
        local_e0 = local_e0 + local_88;
        local_e8 = local_e8 + local_88;
        lVar15 = local_c0 + param_5;
        local_80 = lVar14;
        local_78 = param_5;
      } while (local_c0 + param_5 <= lVar14);
    }
  }
  local_100 = lVar14;
  __kmpc_for_static_fini(&DAT_00402008,local_f8);
  return;
}


