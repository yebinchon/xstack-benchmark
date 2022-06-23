
void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     ulong *param_6)

{
  ulong uVar1;
  double *pdVar2;
  ulong uVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  ulong uVar7;
  long lVar8;
  double dVar9;
  long local_50;
  undefined4 local_48;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  uVar1 = *param_6;
  pdVar2 = (double *)param_6[5];
  uVar3 = param_6[6];
  local_48 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00403008,local_48,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  lVar8 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar8 = local_50;
  }
  if (local_40 <= lVar8) {
    lVar4 = local_40;
    if ((long)uVar1 < 1) {
      do {
        lVar4 = lVar4 + param_5;
      } while (lVar4 <= lVar8);
    }
    else {
      lVar5 = local_40 * (uVar1 & 0xffffffff) * 8 + 8 + uVar3;
      do {
        dVar9 = (double)(int)lVar4;
        if (uVar1 == 1) {
          uVar6 = 0;
        }
        else {
          uVar7 = 0;
          do {
            *(double *)(lVar5 + -8 + uVar7 * 8) = ((double)((int)uVar7 + 1) * dVar9) / *pdVar2;
            uVar6 = uVar7 + 2;
            *(double *)(lVar5 + uVar7 * 8) = ((double)(int)uVar6 * dVar9) / *pdVar2;
            uVar7 = uVar6;
          } while ((uVar1 & 0xfffffffffffffffe) != uVar6);
        }
        if ((uVar1 & 1) != 0) {
          *(double *)(lVar4 * (uVar1 & 0xffffffff) * 8 + uVar3 + uVar6 * 8) =
               (dVar9 * (double)((int)uVar6 + 1)) / *pdVar2;
        }
        lVar4 = lVar4 + param_5;
        lVar5 = lVar5 + (uVar1 & 0xffffffff) * param_5 * 8;
      } while (lVar4 <= lVar8);
    }
  }
  local_50 = lVar8;
  __kmpc_for_static_fini(&DAT_00403008,local_48);
  return;
}



void main_polly_subfn_4(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long param_6)

{
  ulong uVar1;
  undefined8 uVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  ulong uVar7;
  double dVar8;
  double dVar9;
  long local_50;
  undefined4 local_48;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  uVar1 = *(ulong *)(param_6 + 0x10);
  uVar2 = *(undefined8 *)(param_6 + 0x18);
  lVar3 = *(long *)(param_6 + 0x28);
  local_48 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00403020,local_48,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  lVar6 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar6 = local_50;
  }
  if (local_40 <= lVar6) {
    lVar4 = local_40;
    if ((long)uVar1 < 1) {
      do {
        lVar4 = lVar4 + param_5;
      } while (lVar4 <= lVar6);
    }
    else {
      dVar8 = (double)(int)uVar2;
      lVar5 = lVar3 + local_40 * (uVar1 & 0xffffffff) * 8 + 8;
      do {
        dVar9 = (double)(int)lVar4;
        uVar7 = 0;
        if (uVar1 != 1) {
          do {
            *(double *)(lVar5 + -8 + uVar7 * 8) = ((double)((int)uVar7 + 3) * dVar9) / dVar8;
            *(double *)(lVar5 + uVar7 * 8) = ((double)((int)uVar7 + 4) * dVar9) / dVar8;
            uVar7 = uVar7 + 2;
          } while ((uVar1 & 0xfffffffffffffffe) != uVar7);
        }
        if ((uVar1 & 1) != 0) {
          *(double *)(lVar4 * (uVar1 & 0xffffffff) * 8 + lVar3 + uVar7 * 8) =
               (dVar9 * (double)((int)uVar7 + 3)) / dVar8;
        }
        lVar4 = lVar4 + param_5;
        lVar5 = lVar5 + (uVar1 & 0xffffffff) * param_5 * 8;
      } while (lVar4 <= lVar6);
    }
  }
  local_50 = lVar6;
  __kmpc_for_static_fini(&DAT_00403020,local_48);
  return;
}



void main_polly_subfn_7(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long param_6)

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
  
  uVar2 = *(undefined8 *)(param_6 + 8);
  uVar3 = *(ulong *)(param_6 + 0x18);
  lVar4 = *(long *)(param_6 + 0x28);
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00403038,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
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
            uVar9 = uVar8 + 2;
            *(double *)(lVar6 + -8 + uVar8 * 8) = ((double)(int)uVar9 * dVar11) / dVar10;
            *(double *)(lVar6 + uVar8 * 8) = ((double)((int)uVar8 + 3) * dVar11) / dVar10;
            uVar8 = uVar9;
          } while ((uVar3 & 0xfffffffffffffffe) != uVar9);
        }
        if ((uVar3 & 1) != 0) {
          *(double *)(lVar5 * (uVar3 & 0xffffffff) * 8 + lVar4 + uVar9 * 8) =
               (dVar11 * (double)((int)uVar9 + 2)) / dVar10;
        }
        lVar5 = lVar5 + param_5;
        lVar6 = lVar6 + (uVar3 & 0xffffffff) * param_5 * 8;
      } while (lVar5 <= lVar7);
    }
  }
  local_50 = lVar7;
  __kmpc_for_static_fini(&DAT_00403038,uVar1);
  return;
}



void main_polly_subfn_10(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                        long param_5,ulong *param_6)

{
  ulong uVar1;
  ulong uVar2;
  ulong uVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  ulong uVar7;
  long lVar8;
  long lVar9;
  ulong uVar10;
  double *pdVar11;
  double *pdVar12;
  double dVar13;
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
  uVar3 = param_6[5];
  local_b8 = param_6[6];
  local_a8 = (double *)param_6[7];
  local_c0 = *param_1;
  local_bc = 0;
  local_c8 = param_4;
  local_a0 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00403050,local_c0,0x22,&local_bc,&local_a0,&local_c8,&local_38,1,1);
  lVar9 = param_4 + -1;
  if (local_c8 <= param_4 + -1) {
    lVar9 = local_c8;
  }
  if (local_a0 <= lVar9) {
    lVar4 = local_a0;
    if ((long)uVar1 < 1) {
      do {
        lVar4 = lVar4 + param_5;
      } while (lVar4 <= lVar9);
    }
    else {
      local_60 = uVar1 & 0xffffffff;
      local_78 = (uVar2 & 0xffffffff) * 8;
      local_80 = uVar1 - 4 >> 2;
      local_88 = uVar1 & 0xfffffffffffffffc;
      local_90 = (ulong)((uint)(local_80 + 1) & 1);
      local_98 = local_80 + 1 & 0xfffffffffffffffe;
      local_40 = (ulong)((uint)uVar2 & 1);
      lVar6 = uVar3 + local_a0 * local_60 * 8 + 0x30;
      local_70 = param_5 * local_60 * 8;
      local_b0 = uVar3 + local_a0 * local_60 * 8;
      lVar8 = local_b8 + local_a0 * (uVar2 & 0xffffffff) * 8 + 8;
      local_68 = (uVar2 & 0xffffffff) * param_5 * 8;
      do {
        local_48 = lVar4;
        lVar4 = local_48 * local_60 * 8 + uVar3;
        if ((long)uVar2 < 1) {
          if (uVar1 < 4) {
            uVar7 = 0;
          }
          else {
            if (local_80 == 0) {
              lVar5 = 0;
            }
            else {
              lVar5 = 0;
              uVar7 = local_98;
              do {
                *(undefined (*) [16])(lVar6 + -0x30 + lVar5 * 8) = ZEXT816(0);
                *(undefined (*) [16])(lVar6 + -0x20 + lVar5 * 8) = ZEXT816(0);
                *(undefined (*) [16])(lVar6 + -0x10 + lVar5 * 8) = ZEXT816(0);
                *(undefined (*) [16])(lVar6 + lVar5 * 8) = ZEXT816(0);
                lVar5 = lVar5 + 8;
                uVar7 = uVar7 - 2;
              } while (uVar7 != 0);
            }
            if (local_90 != 0) {
              *(undefined (*) [16])(lVar4 + lVar5 * 8) = ZEXT816(0);
              *(undefined (*) [16])(lVar4 + 0x10 + lVar5 * 8) = ZEXT816(0);
              lVar5 = local_48 * local_60 + lVar5;
              *(undefined (*) [16])(uVar3 + lVar5 * 8) = ZEXT816(0);
              *(undefined (*) [16])(uVar3 + 0x10 + lVar5 * 8) = ZEXT816(0);
            }
            uVar7 = local_88;
            if (uVar1 == local_88) goto LAB_00401e20;
          }
          do {
            *(undefined8 *)(local_b0 + uVar7 * 8) = 0;
            uVar7 = uVar7 + 1;
          } while (uVar1 != uVar7);
        }
        else {
          uVar7 = 0;
          pdVar11 = local_a8;
          do {
            lVar5 = uVar7 + local_48 * local_60;
            *(undefined8 *)(lVar4 + uVar7 * 8) = 0;
            *(undefined8 *)(uVar3 + lVar5 * 8) = 0;
            if (uVar2 == 1) {
              dVar13 = 0.0;
              uVar10 = 0;
            }
            else {
              dVar13 = 0.0;
              uVar10 = 0;
              pdVar12 = pdVar11;
              do {
                dVar13 = *(double *)(lVar8 + uVar10 * 8) * pdVar12[local_60] +
                         *(double *)(lVar8 + -8 + uVar10 * 8) * *pdVar12 + dVar13;
                uVar10 = uVar10 + 2;
                pdVar12 = pdVar12 + local_60 * 2;
              } while ((uVar2 & 0xfffffffffffffffe) != uVar10);
            }
            if (local_40 != 0) {
              dVar13 = dVar13 + *(double *)(local_48 * local_78 + local_b8 + uVar10 * 8) *
                                *(double *)((long)local_a8 + uVar10 * local_60 * 8 + uVar7 * 8);
            }
            *(double *)(uVar3 + lVar5 * 8) = dVar13;
            uVar7 = uVar7 + 1;
            pdVar11 = pdVar11 + 1;
          } while (uVar7 != uVar1);
        }
LAB_00401e20:
        lVar6 = lVar6 + local_70;
        local_b0 = local_b0 + local_70;
        lVar8 = lVar8 + local_68;
        lVar4 = local_48 + param_5;
        local_58 = lVar9;
        local_50 = param_5;
      } while (local_48 + param_5 <= lVar9);
    }
  }
  local_c8 = lVar9;
  __kmpc_for_static_fini(&DAT_00403050,local_c0);
  return;
}



void main_polly_subfn_13(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                        long param_5,long param_6)

{
  ulong uVar1;
  ulong uVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  ulong uVar7;
  long lVar8;
  long lVar9;
  ulong uVar10;
  double *pdVar11;
  double *pdVar12;
  double dVar13;
  long local_c8;
  undefined4 local_c0;
  undefined4 local_bc;
  long local_b8;
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
  
  uVar1 = *(ulong *)(param_6 + 0x10);
  uVar2 = *(ulong *)(param_6 + 0x18);
  lVar3 = *(long *)(param_6 + 0x28);
  local_b8 = *(long *)(param_6 + 0x30);
  local_a8 = *(double **)(param_6 + 0x38);
  local_c0 = *param_1;
  local_bc = 0;
  local_c8 = param_4;
  local_a0 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00403068,local_c0,0x22,&local_bc,&local_a0,&local_c8,&local_38,1,1);
  lVar9 = param_4 + -1;
  if (local_c8 <= param_4 + -1) {
    lVar9 = local_c8;
  }
  if (local_a0 <= lVar9) {
    lVar4 = local_a0;
    if ((long)uVar2 < 1) {
      do {
        lVar4 = lVar4 + param_5;
      } while (lVar4 <= lVar9);
    }
    else {
      local_60 = uVar2 & 0xffffffff;
      local_78 = (uVar1 & 0xffffffff) * 8;
      local_80 = uVar2 - 4 >> 2;
      local_88 = uVar2 & 0xfffffffffffffffc;
      local_90 = (ulong)((uint)(local_80 + 1) & 1);
      local_98 = local_80 + 1 & 0xfffffffffffffffe;
      local_40 = (ulong)((uint)uVar1 & 1);
      lVar6 = local_a0 * local_60 * 8 + 0x30 + lVar3;
      local_70 = param_5 * local_60 * 8;
      local_b0 = local_a0 * local_60 * 8 + lVar3;
      lVar8 = local_b8 + local_a0 * (uVar1 & 0xffffffff) * 8 + 8;
      local_68 = (uVar1 & 0xffffffff) * param_5 * 8;
      do {
        local_48 = lVar4;
        lVar4 = local_48 * local_60 * 8 + lVar3;
        if ((long)uVar1 < 1) {
          if (uVar2 < 4) {
            uVar7 = 0;
          }
          else {
            if (local_80 == 0) {
              lVar5 = 0;
            }
            else {
              lVar5 = 0;
              uVar7 = local_98;
              do {
                *(undefined (*) [16])(lVar6 + -0x30 + lVar5 * 8) = ZEXT816(0);
                *(undefined (*) [16])(lVar6 + -0x20 + lVar5 * 8) = ZEXT816(0);
                *(undefined (*) [16])(lVar6 + -0x10 + lVar5 * 8) = ZEXT816(0);
                *(undefined (*) [16])(lVar6 + lVar5 * 8) = ZEXT816(0);
                lVar5 = lVar5 + 8;
                uVar7 = uVar7 - 2;
              } while (uVar7 != 0);
            }
            if (local_90 != 0) {
              *(undefined (*) [16])(lVar4 + lVar5 * 8) = ZEXT816(0);
              *(undefined (*) [16])(lVar4 + 0x10 + lVar5 * 8) = ZEXT816(0);
              lVar5 = local_48 * local_60 + lVar5;
              *(undefined (*) [16])(lVar3 + lVar5 * 8) = ZEXT816(0);
              *(undefined (*) [16])(lVar3 + 0x10 + lVar5 * 8) = ZEXT816(0);
            }
            uVar7 = local_88;
            if (uVar2 == local_88) goto LAB_004021f0;
          }
          do {
            *(undefined8 *)(local_b0 + uVar7 * 8) = 0;
            uVar7 = uVar7 + 1;
          } while (uVar2 != uVar7);
        }
        else {
          uVar7 = 0;
          pdVar11 = local_a8;
          do {
            lVar5 = uVar7 + local_48 * local_60;
            *(undefined8 *)(lVar4 + uVar7 * 8) = 0;
            *(undefined8 *)(lVar3 + lVar5 * 8) = 0;
            if (uVar1 == 1) {
              dVar13 = 0.0;
              uVar10 = 0;
            }
            else {
              dVar13 = 0.0;
              uVar10 = 0;
              pdVar12 = pdVar11;
              do {
                dVar13 = *(double *)(lVar8 + uVar10 * 8) * pdVar12[local_60] +
                         *(double *)(lVar8 + -8 + uVar10 * 8) * *pdVar12 + dVar13;
                uVar10 = uVar10 + 2;
                pdVar12 = pdVar12 + local_60 * 2;
              } while ((uVar1 & 0xfffffffffffffffe) != uVar10);
            }
            if (local_40 != 0) {
              dVar13 = dVar13 + *(double *)(local_48 * local_78 + local_b8 + uVar10 * 8) *
                                *(double *)((long)local_a8 + uVar10 * local_60 * 8 + uVar7 * 8);
            }
            *(double *)(lVar3 + lVar5 * 8) = dVar13;
            uVar7 = uVar7 + 1;
            pdVar11 = pdVar11 + 1;
          } while (uVar7 != uVar2);
        }
LAB_004021f0:
        lVar6 = lVar6 + local_70;
        local_b0 = local_b0 + local_70;
        lVar8 = lVar8 + local_68;
        lVar4 = local_48 + param_5;
        local_58 = lVar9;
        local_50 = param_5;
      } while (local_48 + param_5 <= lVar9);
    }
  }
  local_c8 = lVar9;
  __kmpc_for_static_fini(&DAT_00403068,local_c0);
  return;
}



void main_polly_subfn_16(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                        long param_5,ulong *param_6)

{
  ulong uVar1;
  ulong uVar2;
  long lVar3;
  double *pdVar4;
  long lVar5;
  long lVar6;
  ulong uVar7;
  double *pdVar8;
  ulong uVar9;
  long lVar10;
  ulong uVar11;
  double dVar12;
  long local_b8;
  undefined4 local_b0;
  undefined4 local_ac;
  ulong local_a8;
  double *local_a0;
  ulong local_98;
  long local_90;
  size_t local_88;
  long local_80;
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
  local_98 = param_6[3];
  uVar2 = param_6[5];
  local_a8 = param_6[6];
  local_a0 = (double *)param_6[7];
  local_b0 = *param_1;
  local_ac = 0;
  local_b8 = param_4;
  local_90 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00403080,local_b0,0x22,&local_ac,&local_90,&local_b8,&local_38,1,1);
  lVar10 = param_4 + -1;
  if (local_b8 <= param_4 + -1) {
    lVar10 = local_b8;
  }
  local_b8 = lVar10;
  if (local_90 <= lVar10) {
    lVar5 = local_90;
    if ((long)local_98 < 1) {
      do {
        lVar5 = lVar5 + param_5;
      } while (lVar5 <= lVar10);
    }
    else {
      uVar11 = local_98 & 0xffffffff;
      local_68 = (uVar1 & 0xffffffff) << 3;
      local_78 = local_90 * uVar11 * 8;
      local_80 = uVar11 * param_5 * 8;
      local_88 = local_98 * 8;
      local_40 = (ulong)((uint)uVar1 & 1);
      lVar6 = local_a8 + local_90 * (uVar1 & 0xffffffff) * 8 + 8;
      local_58 = (uVar1 & 0xffffffff) * param_5 * 8;
      lVar3 = 0;
      local_70 = param_5;
      local_60 = uVar11;
      do {
        local_50 = lVar3;
        local_48 = lVar5;
        if ((long)uVar1 < 1) {
          memset((void *)(local_80 * lVar3 + local_78 + uVar2),0,local_88);
          param_5 = local_70;
        }
        else {
          uVar9 = 0;
          pdVar4 = local_a0;
          do {
            lVar5 = uVar9 + lVar5 * local_60;
            *(undefined8 *)(lVar5 * uVar11 * 8 + uVar2 + uVar9 * 8) = 0;
            *(undefined8 *)(uVar2 + lVar5 * 8) = 0;
            if (uVar1 == 1) {
              dVar12 = 0.0;
              uVar7 = 0;
            }
            else {
              dVar12 = 0.0;
              uVar7 = 0;
              pdVar8 = pdVar4;
              do {
                dVar12 = *(double *)(lVar6 + uVar7 * 8) * pdVar8[uVar11] +
                         *(double *)(lVar6 + -8 + uVar7 * 8) * *pdVar8 + dVar12;
                uVar7 = uVar7 + 2;
                pdVar8 = pdVar8 + uVar11 * 2;
              } while ((uVar1 & 0xfffffffffffffffe) != uVar7);
            }
            if (local_40 != 0) {
              dVar12 = dVar12 + *(double *)(lVar5 * local_68 + local_a8 + uVar7 * 8) *
                                *(double *)((long)local_a0 + uVar7 * uVar11 * 8 + uVar9 * 8);
            }
            *(double *)(uVar2 + lVar5 * 8) = dVar12;
            uVar9 = uVar9 + 1;
            pdVar4 = pdVar4 + 1;
          } while (uVar9 != local_98);
        }
        lVar5 = local_48 + param_5;
        lVar3 = local_50 + 1;
        lVar6 = lVar6 + local_58;
      } while (lVar5 <= lVar10);
    }
  }
  __kmpc_for_static_fini(&DAT_00403080,local_b0);
  return;
}


