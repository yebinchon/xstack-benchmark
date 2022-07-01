
void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     ulong *param_6)

{
  undefined4 uVar1;
  ulong uVar2;
  double *pdVar3;
  ulong uVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  double dVar9;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  uVar2 = *param_6;
  pdVar3 = (double *)param_6[3];
  uVar4 = param_6[4];
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402030,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  lVar7 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar7 = local_50;
  }
  if (local_40 <= lVar7) {
    lVar5 = local_40;
    if ((long)uVar2 < 1) {
      do {
        lVar5 = lVar5 + param_5;
      } while (lVar5 <= lVar7);
    }
    else {
      lVar6 = local_40 * (uVar2 & 0xffffffff) * 8 + 8 + uVar4;
      do {
        dVar9 = (double)(int)lVar5;
        uVar8 = 0;
        if (uVar2 != 1) {
          do {
            *(double *)(lVar6 + -8 + uVar8 * 8) = ((double)(int)uVar8 * dVar9) / *pdVar3;
            *(double *)(lVar6 + uVar8 * 8) = ((double)((int)uVar8 + 1) * dVar9) / *pdVar3;
            uVar8 = uVar8 + 2;
          } while ((uVar2 & 0xfffffffffffffffe) != uVar8);
        }
        if ((uVar2 & 1) != 0) {
          *(double *)(lVar5 * (uVar2 & 0xffffffff) * 8 + uVar4 + uVar8 * 8) =
               (dVar9 * (double)(int)uVar8) / *pdVar3;
        }
        lVar5 = lVar5 + param_5;
        lVar6 = lVar6 + (uVar2 & 0xffffffff) * param_5 * 8;
      } while (lVar5 <= lVar7);
    }
  }
  local_50 = lVar7;
  __kmpc_for_static_fini(&DAT_00402030,uVar1);
  return;
}



void main_polly_subfn_4(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long param_6)

{
  undefined4 uVar1;
  ulong uVar2;
  double *pdVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  double dVar9;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  uVar2 = *(ulong *)(param_6 + 0x10);
  pdVar3 = *(double **)(param_6 + 0x18);
  lVar4 = *(long *)(param_6 + 0x20);
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402048,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  lVar7 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar7 = local_50;
  }
  if (local_40 <= lVar7) {
    lVar5 = local_40;
    if ((long)uVar2 < 1) {
      do {
        lVar5 = lVar5 + param_5;
      } while (lVar5 <= lVar7);
    }
    else {
      lVar6 = local_40 * (uVar2 & 0xffffffff) * 8 + 8 + lVar4;
      do {
        dVar9 = (double)(int)lVar5;
        uVar8 = 0;
        if (uVar2 != 1) {
          do {
            *(double *)(lVar6 + -8 + uVar8 * 8) = ((double)(int)uVar8 * dVar9) / *pdVar3;
            *(double *)(lVar6 + uVar8 * 8) = ((double)((int)uVar8 + 1) * dVar9) / *pdVar3;
            uVar8 = uVar8 + 2;
          } while ((uVar2 & 0xfffffffffffffffe) != uVar8);
        }
        if ((uVar2 & 1) != 0) {
          *(double *)(lVar5 * (uVar2 & 0xffffffff) * 8 + lVar4 + uVar8 * 8) =
               (dVar9 * (double)(int)uVar8) / *pdVar3;
        }
        lVar5 = lVar5 + param_5;
        lVar6 = lVar6 + (uVar2 & 0xffffffff) * param_5 * 8;
      } while (lVar5 <= lVar7);
    }
  }
  local_50 = lVar7;
  __kmpc_for_static_fini(&DAT_00402048,uVar1);
  return;
}



void main_polly_subfn_7(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,ulong *param_6)

{
  undefined4 uVar1;
  ulong uVar2;
  double *pdVar3;
  ulong uVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  double dVar9;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  uVar2 = *param_6;
  pdVar3 = (double *)param_6[3];
  uVar4 = param_6[4];
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402060,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  lVar7 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar7 = local_50;
  }
  if (local_40 <= lVar7) {
    lVar5 = local_40;
    if ((long)uVar2 < 1) {
      do {
        lVar5 = lVar5 + param_5;
      } while (lVar5 <= lVar7);
    }
    else {
      lVar6 = local_40 * (uVar2 & 0xffffffff) * 8 + 8 + uVar4;
      do {
        dVar9 = (double)(int)lVar5;
        uVar8 = 0;
        if (uVar2 != 1) {
          do {
            *(double *)(lVar6 + -8 + uVar8 * 8) = ((double)(int)uVar8 * dVar9) / *pdVar3;
            *(double *)(lVar6 + uVar8 * 8) = ((double)((int)uVar8 + 1) * dVar9) / *pdVar3;
            uVar8 = uVar8 + 2;
          } while ((uVar2 & 0xfffffffffffffffe) != uVar8);
        }
        if ((uVar2 & 1) != 0) {
          *(double *)(lVar5 * (uVar2 & 0xffffffff) * 8 + uVar4 + uVar8 * 8) =
               (dVar9 * (double)(int)uVar8) / *pdVar3;
        }
        lVar5 = lVar5 + param_5;
        lVar6 = lVar6 + (uVar2 & 0xffffffff) * param_5 * 8;
      } while (lVar5 <= lVar7);
    }
  }
  local_50 = lVar7;
  __kmpc_for_static_fini(&DAT_00402060,uVar1);
  return;
}



/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void main_polly_subfn_10(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                        long param_5,ulong *param_6)

{
  double *pdVar1;
  double *pdVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  double dVar6;
  double dVar7;
  double dVar8;
  double dVar9;
  double dVar10;
  double dVar11;
  long lVar12;
  double *pdVar13;
  long lVar14;
  long lVar15;
  long lVar16;
  ulong uVar17;
  long lVar18;
  ulong uVar19;
  double *pdVar20;
  double dVar21;
  long local_c8;
  undefined4 local_c0;
  undefined4 local_bc;
  ulong local_b8;
  long local_b0;
  double *local_a8;
  long local_a0;
  ulong local_98;
  ulong local_90;
  ulong local_88;
  ulong local_80;
  long local_78;
  long local_70;
  long local_68;
  ulong local_60;
  long local_58;
  long local_50;
  long local_48;
  ulong local_40;
  long local_38;
  
  uVar3 = *param_6;
  uVar4 = param_6[2];
  uVar5 = param_6[3];
  local_b8 = param_6[4];
  local_a8 = (double *)param_6[5];
  local_c0 = *param_1;
  local_bc = 0;
  local_c8 = param_4;
  local_a0 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402078,local_c0,0x22,&local_bc,&local_a0,&local_c8,&local_38,1,1);
  dVar11 = DAT_00402028;
  dVar10 = DAT_00402020;
  dVar9 = _UNK_00402018;
  dVar8 = _DAT_00402010;
  lVar12 = param_4 + -1;
  if (local_c8 <= param_4 + -1) {
    lVar12 = local_c8;
  }
  if (local_a0 <= lVar12) {
    lVar14 = local_a0;
    if ((long)uVar3 < 1) {
      do {
        lVar14 = lVar14 + param_5;
      } while (lVar14 <= lVar12);
    }
    else {
      local_60 = uVar3 & 0xffffffff;
      local_78 = (uVar4 & 0xffffffff) * 8;
      local_80 = uVar3 - 4 >> 2;
      local_88 = uVar3 & 0xfffffffffffffffc;
      local_90 = (ulong)((uint)(local_80 + 1) & 1);
      local_98 = local_80 + 1 & 0xfffffffffffffffe;
      local_40 = (ulong)((uint)uVar4 & 1);
      lVar16 = uVar5 + local_a0 * local_60 * 8 + 0x30;
      local_70 = param_5 * local_60 * 8;
      local_b0 = uVar5 + local_a0 * local_60 * 8;
      lVar18 = local_b8 + local_a0 * (uVar4 & 0xffffffff) * 8 + 8;
      local_68 = (uVar4 & 0xffffffff) * param_5 * 8;
      do {
        local_48 = lVar14;
        lVar14 = local_48 * local_60 * 8 + uVar5;
        if ((long)uVar4 < 1) {
          if (uVar3 < 4) {
            uVar17 = 0;
          }
          else {
            if (local_80 == 0) {
              lVar15 = 0;
            }
            else {
              lVar15 = 0;
              uVar17 = local_98;
              do {
                pdVar20 = (double *)(lVar16 + -0x30 + lVar15 * 8);
                pdVar1 = (double *)(lVar16 + -0x20 + lVar15 * 8);
                dVar21 = pdVar1[1];
                pdVar2 = (double *)(lVar16 + -0x10 + lVar15 * 8);
                dVar6 = pdVar2[1];
                pdVar13 = (double *)(lVar16 + lVar15 * 8);
                dVar7 = pdVar13[1];
                *(undefined (*) [16])(lVar16 + -0x30 + lVar15 * 8) =
                     CONCAT88(pdVar20[1] * dVar9,*pdVar20 * dVar8);
                *(undefined (*) [16])(lVar16 + -0x20 + lVar15 * 8) =
                     CONCAT88(dVar21 * dVar9,*pdVar1 * dVar8);
                *(undefined (*) [16])(lVar16 + -0x10 + lVar15 * 8) =
                     CONCAT88(dVar6 * dVar9,*pdVar2 * dVar8);
                *(undefined (*) [16])(lVar16 + lVar15 * 8) =
                     CONCAT88(dVar7 * dVar9,*pdVar13 * dVar8);
                lVar15 = lVar15 + 8;
                uVar17 = uVar17 - 2;
              } while (uVar17 != 0);
            }
            if (local_90 != 0) {
              pdVar13 = (double *)(lVar14 + lVar15 * 8);
              pdVar20 = (double *)(lVar14 + 0x10 + lVar15 * 8);
              dVar21 = *pdVar20;
              dVar6 = pdVar20[1];
              lVar15 = local_48 * local_60 + lVar15;
              *(undefined (*) [16])(uVar5 + lVar15 * 8) =
                   CONCAT88(pdVar13[1] * dVar9,*pdVar13 * dVar8);
              *(undefined (*) [16])(uVar5 + 0x10 + lVar15 * 8) =
                   CONCAT88(dVar6 * dVar9,dVar21 * dVar8);
            }
            uVar17 = local_88;
            if (uVar3 == local_88) goto LAB_00401ab0;
          }
          do {
            *(double *)(local_b0 + uVar17 * 8) = *(double *)(local_b0 + uVar17 * 8) * dVar10;
            uVar17 = uVar17 + 1;
          } while (uVar3 != uVar17);
        }
        else {
          uVar17 = 0;
          pdVar13 = local_a8;
          do {
            lVar15 = uVar17 + local_48 * local_60;
            dVar21 = *(double *)(lVar14 + uVar17 * 8) * dVar10;
            *(double *)(uVar5 + lVar15 * 8) = dVar21;
            if (uVar4 == 1) {
              uVar19 = 0;
            }
            else {
              uVar19 = 0;
              pdVar20 = pdVar13;
              do {
                dVar21 = *(double *)(lVar18 + uVar19 * 8) * dVar11 * pdVar20[local_60] +
                         *(double *)(lVar18 + -8 + uVar19 * 8) * dVar11 * *pdVar20 + dVar21;
                uVar19 = uVar19 + 2;
                pdVar20 = pdVar20 + local_60 * 2;
              } while ((uVar4 & 0xfffffffffffffffe) != uVar19);
            }
            if (local_40 != 0) {
              dVar21 = dVar21 + *(double *)(local_48 * local_78 + local_b8 + uVar19 * 8) * dVar11 *
                                *(double *)((long)local_a8 + uVar19 * local_60 * 8 + uVar17 * 8);
            }
            *(double *)(uVar5 + lVar15 * 8) = dVar21;
            uVar17 = uVar17 + 1;
            pdVar13 = pdVar13 + 1;
          } while (uVar17 != uVar3);
        }
LAB_00401ab0:
        lVar16 = lVar16 + local_70;
        local_b0 = local_b0 + local_70;
        lVar18 = lVar18 + local_68;
        lVar14 = local_48 + param_5;
        local_58 = lVar12;
        local_50 = param_5;
      } while (local_48 + param_5 <= lVar12);
    }
  }
  local_c8 = lVar12;
  __kmpc_for_static_fini(&DAT_00402078,local_c0);
  return;
}


