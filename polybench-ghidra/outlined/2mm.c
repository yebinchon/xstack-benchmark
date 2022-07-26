
void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     ulong *param_6)

{
  ulong uVar1;
  ulong uVar2;
  ulong uVar3;
  double dVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  long lVar10;
  ulong uVar11;
  double *pdVar12;
  double *pdVar13;
  double dVar14;
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
  
  uVar1 = *param_6;
  uVar2 = param_6[1];
  uVar3 = param_6[4];
  local_b8 = param_6[5];
  local_a8 = (double *)param_6[6];
  local_c0 = *param_1;
  local_bc = 0;
  local_c8 = param_4;
  local_a0 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402038,local_c0,0x22,&local_bc,&local_a0,&local_c8,&local_38,1,1);
  dVar4 = DAT_00402008;
  lVar10 = param_4 + -1;
  if (local_c8 <= param_4 + -1) {
    lVar10 = local_c8;
  }
  if (local_a0 <= lVar10) {
    lVar5 = local_a0;
    if ((long)uVar2 < 1) {
      do {
        lVar5 = lVar5 + param_5;
      } while (lVar5 <= lVar10);
    }
    else {
      local_60 = uVar2 & 0xffffffff;
      local_78 = (uVar1 & 0xffffffff) * 8;
      local_80 = uVar2 - 4 >> 2;
      local_88 = uVar2 & 0xfffffffffffffffc;
      local_90 = (ulong)((uint)(local_80 + 1) & 1);
      local_98 = local_80 + 1 & 0xfffffffffffffffe;
      local_40 = (ulong)((uint)uVar1 & 1);
      lVar7 = local_a0 * local_60 * 8 + 0x30 + uVar3;
      local_70 = param_5 * local_60 * 8;
      local_b0 = local_a0 * local_60 * 8 + uVar3;
      lVar9 = local_b8 + local_a0 * (uVar1 & 0xffffffff) * 8 + 8;
      local_68 = (uVar1 & 0xffffffff) * param_5 * 8;
      do {
        local_48 = lVar5;
        lVar5 = local_48 * local_60 * 8 + uVar3;
        if ((long)uVar1 < 1) {
          if (uVar2 < 4) {
            uVar8 = 0;
          }
          else {
            if (local_80 == 0) {
              lVar6 = 0;
            }
            else {
              lVar6 = 0;
              uVar8 = local_98;
              do {
                *(undefined (*) [16])(lVar7 + -0x30 + lVar6 * 8) = ZEXT816(0);
                *(undefined (*) [16])(lVar7 + -0x20 + lVar6 * 8) = ZEXT816(0);
                *(undefined (*) [16])(lVar7 + -0x10 + lVar6 * 8) = ZEXT816(0);
                *(undefined (*) [16])(lVar7 + lVar6 * 8) = ZEXT816(0);
                lVar6 = lVar6 + 8;
                uVar8 = uVar8 - 2;
              } while (uVar8 != 0);
            }
            if (local_90 != 0) {
              *(undefined (*) [16])(lVar5 + lVar6 * 8) = ZEXT816(0);
              *(undefined (*) [16])(lVar5 + 0x10 + lVar6 * 8) = ZEXT816(0);
              lVar6 = local_48 * local_60 + lVar6;
              *(undefined (*) [16])(uVar3 + lVar6 * 8) = ZEXT816(0);
              *(undefined (*) [16])(uVar3 + 0x10 + lVar6 * 8) = ZEXT816(0);
            }
            uVar8 = local_88;
            if (uVar2 == local_88) goto LAB_00401920;
          }
          do {
            *(undefined8 *)(local_b0 + uVar8 * 8) = 0;
            uVar8 = uVar8 + 1;
          } while (uVar2 != uVar8);
        }
        else {
          uVar8 = 0;
          pdVar12 = local_a8;
          do {
            lVar6 = uVar8 + local_48 * local_60;
            *(undefined8 *)(lVar5 + uVar8 * 8) = 0;
            *(undefined8 *)(uVar3 + lVar6 * 8) = 0;
            if (uVar1 == 1) {
              dVar14 = 0.0;
              uVar11 = 0;
            }
            else {
              dVar14 = 0.0;
              uVar11 = 0;
              pdVar13 = pdVar12;
              do {
                dVar14 = *(double *)(lVar9 + uVar11 * 8) * dVar4 * pdVar13[local_60] +
                         *(double *)(lVar9 + -8 + uVar11 * 8) * dVar4 * *pdVar13 + dVar14;
                uVar11 = uVar11 + 2;
                pdVar13 = pdVar13 + local_60 * 2;
              } while ((uVar1 & 0xfffffffffffffffe) != uVar11);
            }
            if (local_40 != 0) {
              dVar14 = dVar14 + *(double *)(local_48 * local_78 + local_b8 + uVar11 * 8) * dVar4 *
                                *(double *)((long)local_a8 + uVar11 * local_60 * 8 + uVar8 * 8);
            }
            *(double *)(uVar3 + lVar6 * 8) = dVar14;
            uVar8 = uVar8 + 1;
            pdVar12 = pdVar12 + 1;
          } while (uVar8 != uVar2);
        }
LAB_00401920:
        lVar7 = lVar7 + local_70;
        local_b0 = local_b0 + local_70;
        lVar9 = lVar9 + local_68;
        lVar5 = local_48 + param_5;
        local_58 = lVar10;
        local_50 = param_5;
      } while (local_48 + param_5 <= lVar10);
    }
  }
  local_c8 = lVar10;
  __kmpc_for_static_fini(&DAT_00402038,local_c0);
  return;
}

void main_polly_subfn_4(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long param_6)

{
  double *pdVar1;
  double *pdVar2;
  ulong uVar3;
  ulong uVar4;
  long lVar5;
  double dVar6;
  double dVar7;
  double dVar8;
  double dVar9;
  double dVar10;
  long lVar11;
  long lVar12;
  long lVar13;
  double *pdVar14;
  long lVar15;
  ulong uVar16;
  long lVar17;
  ulong uVar18;
  long lVar19;
  ulong uVar20;
  double *pdVar21;
  double dVar22;
  long local_e0;
  undefined4 local_d8;
  undefined4 local_d4;
  long local_d0;
  long local_c8;
  ulong local_c0;
  double *local_b8;
  long local_b0;
  ulong local_a8;
  ulong local_a0;
  ulong local_98;
  ulong local_90;
  long local_88;
  long local_80;
  long local_78;
  ulong local_70;
  long local_68;
  long local_60;
  long local_58;
  ulong local_50;
  long local_48;
  ulong local_40;
  long local_38;
  
  uVar3 = *(ulong *)(param_6 + 8);
  uVar4 = *(ulong *)(param_6 + 0x18);
  lVar5 = *(long *)(param_6 + 0x20);
  local_d0 = *(long *)(param_6 + 0x28);
  local_b8 = *(double **)(param_6 + 0x30);
  local_d8 = *param_1;
  local_d4 = 0;
  local_e0 = param_4;
  local_b0 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402050,local_d8,0x22,&local_d4,&local_b0,&local_e0,&local_38,1,1);
  dVar10 = _UNK_00402028;
  dVar9 = _DAT_00402020;
  dVar8 = DAT_00402010;
  lVar13 = param_4 + -1;
  if (local_e0 <= param_4 + -1) {
    lVar13 = local_e0;
  }
  if (local_b0 <= lVar13) {
    lVar12 = local_b0;
    if ((long)uVar4 < 1) {
      do {
        lVar12 = lVar12 + param_5;
      } while (lVar12 <= lVar13);
    }
    else {
      local_70 = uVar4 & 0xffffffff;
      local_78 = local_70 * 8;
      lVar15 = (uVar3 & 0xffffffff) * 8;
      local_90 = uVar4 - 4 >> 2;
      local_98 = uVar4 & 0xfffffffffffffffc;
      local_a0 = (ulong)((uint)(local_90 + 1) & 1);
      local_a8 = local_90 + 1 & 0xfffffffffffffffe;
      uVar16 = uVar3 & 0xffffffff;
      local_50 = (ulong)((uint)uVar3 & 1);
      lVar17 = local_b0 * local_70 * 8 + 0x30 + lVar5;
      local_80 = param_5 * local_70 * 8;
      local_c8 = local_b0 * local_70 * 8 + lVar5;
      lVar19 = local_d0 + local_b0 * uVar16 * 8 + 8;
      local_88 = param_5 * uVar16 * 8;
      do {
        local_58 = lVar12;
        lVar12 = local_78 * local_58 + lVar5;
        if ((long)uVar3 < 1) {
          if (uVar4 < 4) {
            uVar18 = 0;
          }
          else {
            if (local_90 == 0) {
              lVar11 = 0;
            }
            else {
              lVar11 = 0;
              uVar18 = local_a8;
              do {
                pdVar21 = (double *)(lVar17 + -0x30 + lVar11 * 8);
                pdVar1 = (double *)(lVar17 + -0x20 + lVar11 * 8);
                dVar22 = pdVar1[1];
                pdVar2 = (double *)(lVar17 + -0x10 + lVar11 * 8);
                dVar6 = pdVar2[1];
                pdVar14 = (double *)(lVar17 + lVar11 * 8);
                dVar7 = pdVar14[1];
                *(undefined (*) [16])(lVar17 + -0x30 + lVar11 * 8) =
                     CONCAT88(pdVar21[1] * dVar10,*pdVar21 * dVar9);
                *(undefined (*) [16])(lVar17 + -0x20 + lVar11 * 8) =
                     CONCAT88(dVar22 * dVar10,*pdVar1 * dVar9);
                *(undefined (*) [16])(lVar17 + -0x10 + lVar11 * 8) =
                     CONCAT88(dVar6 * dVar10,*pdVar2 * dVar9);
                *(undefined (*) [16])(lVar17 + lVar11 * 8) =
                     CONCAT88(dVar7 * dVar10,*pdVar14 * dVar9);
                lVar11 = lVar11 + 8;
                uVar18 = uVar18 - 2;
              } while (uVar18 != 0);
            }
            if (local_a0 != 0) {
              pdVar14 = (double *)(lVar12 + lVar11 * 8);
              pdVar21 = (double *)(lVar12 + 0x10 + lVar11 * 8);
              dVar22 = *pdVar21;
              dVar6 = pdVar21[1];
              lVar11 = local_58 * local_70 + lVar11;
              *(undefined (*) [16])(lVar5 + lVar11 * 8) =
                   CONCAT88(pdVar14[1] * dVar10,*pdVar14 * dVar9);
              *(undefined (*) [16])(lVar5 + 0x10 + lVar11 * 8) =
                   CONCAT88(dVar6 * dVar10,dVar22 * dVar9);
            }
            uVar18 = local_98;
            if (uVar4 == local_98) goto LAB_00401d00;
          }
          do {
            *(double *)(local_c8 + uVar18 * 8) = *(double *)(local_c8 + uVar18 * 8) * dVar8;
            uVar18 = uVar18 + 1;
          } while (uVar4 != uVar18);
        }
        else {
          uVar18 = 0;
          pdVar14 = local_b8;
          do {
            lVar11 = uVar18 + local_58 * local_70;
            dVar22 = *(double *)(lVar12 + uVar18 * 8) * dVar8;
            *(double *)(lVar5 + lVar11 * 8) = dVar22;
            if (uVar3 == 1) {
              uVar20 = 0;
            }
            else {
              uVar20 = 0;
              pdVar21 = pdVar14;
              do {
                dVar22 = *(double *)(lVar19 + uVar20 * 8) * pdVar21[uVar3 & 0xffffffff] +
                         *(double *)(lVar19 + -8 + uVar20 * 8) * *pdVar21 + dVar22;
                uVar20 = uVar20 + 2;
                pdVar21 = pdVar21 + uVar16 * 2;
              } while ((uVar3 & 0xfffffffffffffffe) != uVar20);
            }
            if (local_50 != 0) {
              dVar22 = dVar22 + *(double *)(local_58 * lVar15 + local_d0 + uVar20 * 8) *
                                *(double *)((long)local_b8 + uVar20 * lVar15 + uVar18 * 8);
            }
            *(double *)(lVar5 + lVar11 * 8) = dVar22;
            uVar18 = uVar18 + 1;
            pdVar14 = pdVar14 + 1;
          } while (uVar18 != uVar4);
        }
LAB_00401d00:
        lVar17 = lVar17 + local_80;
        local_c8 = local_c8 + local_80;
        lVar19 = lVar19 + local_88;
        lVar12 = local_58 + param_5;
        local_c0 = uVar3;
        local_68 = lVar13;
        local_60 = param_5;
        local_48 = lVar5;
        local_40 = uVar4;
      } while (local_58 + param_5 <= lVar13);
    }
  }
  local_e0 = lVar13;
  __kmpc_for_static_fini(&DAT_00402050,local_d8);
  return;
}


