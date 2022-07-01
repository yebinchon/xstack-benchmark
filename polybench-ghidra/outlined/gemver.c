
void kernel_gemver_polly_subfn
               (undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
               uint *param_6)

{
  double *pdVar1;
  double *pdVar2;
  double *pdVar3;
  double *pdVar4;
  double *pdVar5;
  double dVar6;
  double dVar7;
  uint uVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  double dVar12;
  double dVar13;
  double dVar14;
  double dVar15;
  double dVar16;
  long lVar17;
  ulong uVar18;
  long lVar19;
  long lVar20;
  ulong uVar21;
  ulong uVar22;
  long lVar23;
  long lVar24;
  long local_60;
  undefined4 local_58;
  undefined4 local_54;
  long local_50;
  long local_48;
  long local_40;
  long local_38;
  
  uVar8 = *param_6;
  local_48 = *(long *)(param_6 + 2);
  local_40 = *(long *)(param_6 + 4);
  lVar9 = *(long *)(param_6 + 6);
  lVar10 = *(long *)(param_6 + 8);
  lVar11 = *(long *)(param_6 + 10);
  local_58 = *param_1;
  local_54 = 0;
  local_60 = param_4;
  local_50 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402030,local_58,0x22,&local_54,&local_50,&local_60,&local_38,1,1);
  lVar24 = param_4 + -1;
  if (local_60 <= param_4 + -1) {
    lVar24 = local_60;
  }
  if (local_50 <= lVar24) {
    lVar20 = local_50;
    if ((int)uVar8 < 1) {
      do {
        lVar20 = lVar20 + param_5;
      } while (lVar20 <= lVar24);
    }
    else {
      uVar18 = (long)(int)uVar8 & 0xfffffffffffffffc;
      lVar20 = local_50 * (ulong)uVar8;
      lVar19 = local_48 + lVar20 * 8 + 0x10;
      lVar23 = (ulong)uVar8 * param_5 * 8;
      lVar20 = local_48 + lVar20 * 8;
      lVar17 = local_50;
      do {
        dVar6 = *(double *)(local_40 + lVar17 * 8);
        dVar7 = *(double *)(lVar10 + lVar17 * 8);
        if (3 < uVar8) {
          uVar22 = 0;
          do {
            pdVar2 = (double *)(lVar19 + -0x10 + uVar22 * 8);
            pdVar1 = (double *)(lVar19 + uVar22 * 8);
            dVar12 = pdVar1[1];
            pdVar5 = (double *)(lVar9 + uVar22 * 8);
            pdVar3 = (double *)(lVar9 + 0x10 + uVar22 * 8);
            dVar13 = *pdVar3;
            dVar14 = pdVar3[1];
            pdVar3 = (double *)(lVar11 + uVar22 * 8);
            pdVar4 = (double *)(lVar11 + 0x10 + uVar22 * 8);
            dVar15 = *pdVar4;
            dVar16 = pdVar4[1];
            *(undefined (*) [16])(lVar19 + -0x10 + uVar22 * 8) =
                 CONCAT88(pdVar3[1] * dVar7 + pdVar5[1] * dVar6 + pdVar2[1],
                          *pdVar3 * dVar7 + *pdVar5 * dVar6 + *pdVar2);
            *(undefined (*) [16])(lVar19 + uVar22 * 8) =
                 CONCAT88(dVar16 * dVar7 + dVar14 * dVar6 + dVar12,
                          dVar15 * dVar7 + dVar13 * dVar6 + *pdVar1);
            uVar22 = uVar22 + 4;
            uVar21 = uVar18;
            if (uVar18 == uVar22) goto joined_r0x004017fe;
          } while( true );
        }
        uVar21 = 0;
        do {
          *(double *)(lVar20 + uVar21 * 8) =
               *(double *)(lVar11 + uVar21 * 8) * dVar7 +
               *(double *)(lVar9 + uVar21 * 8) * dVar6 + *(double *)(lVar20 + uVar21 * 8);
          uVar21 = uVar21 + 1;
joined_r0x004017fe:
        } while (uVar21 != (long)(int)uVar8);
        lVar17 = lVar17 + param_5;
        lVar19 = lVar19 + lVar23;
        lVar20 = lVar20 + lVar23;
      } while (lVar17 <= lVar24);
    }
  }
  local_60 = lVar24;
  __kmpc_for_static_fini(&DAT_00402030,local_58);
  return;
}



void kernel_gemver_polly_subfn_4
               (undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
               uint *param_6)

{
  uint uVar1;
  long lVar2;
  double *pdVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  double *pdVar7;
  double *pdVar8;
  long lVar9;
  ulong uVar10;
  double dVar11;
  long local_58;
  undefined4 local_50;
  undefined4 local_4c;
  long local_48;
  long local_40;
  long local_38;
  
  uVar1 = *param_6;
  uVar10 = (ulong)uVar1;
  lVar2 = *(long *)(param_6 + 2);
  local_48 = *(long *)(param_6 + 4);
  pdVar3 = *(double **)(param_6 + 6);
  lVar4 = *(long *)(param_6 + 8);
  local_50 = *param_1;
  local_4c = 0;
  local_58 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402048,local_50,0x22,&local_4c,&local_40,&local_58,&local_38,1,1);
  lVar9 = param_4 + -1;
  if (local_58 <= param_4 + -1) {
    lVar9 = local_58;
  }
  if (local_40 <= lVar9) {
    lVar5 = local_40;
    if ((int)uVar1 < 1) {
      do {
        lVar5 = lVar5 + param_5;
      } while (lVar5 <= lVar9);
    }
    else {
      pdVar8 = (double *)(local_48 + local_40 * 8);
      do {
        dVar11 = *(double *)(lVar2 + lVar5 * 8);
        if (uVar1 == 1) {
          uVar6 = 0;
        }
        else {
          uVar6 = 0;
          pdVar7 = pdVar8;
          do {
            dVar11 = *pdVar3 * *pdVar7 * *(double *)(lVar4 + uVar6 * 8) + dVar11;
            *(double *)(lVar2 + lVar5 * 8) = dVar11;
            dVar11 = *pdVar3 * pdVar7[uVar10] * *(double *)(lVar4 + 8 + uVar6 * 8) + dVar11;
            *(double *)(lVar2 + lVar5 * 8) = dVar11;
            uVar6 = uVar6 + 2;
            pdVar7 = pdVar7 + uVar10 * 2;
          } while (((long)(int)uVar1 & 0xfffffffffffffffeU) != uVar6);
        }
        if ((uVar1 & 1) != 0) {
          *(double *)(lVar2 + lVar5 * 8) =
               dVar11 + *pdVar3 * *(double *)(local_48 + lVar5 * 8 + uVar6 * uVar10 * 8) *
                        *(double *)(lVar4 + uVar6 * 8);
        }
        lVar5 = lVar5 + param_5;
        pdVar8 = pdVar8 + param_5;
      } while (lVar5 <= lVar9);
    }
  }
  local_58 = lVar9;
  __kmpc_for_static_fini(&DAT_00402048,local_50);
  return;
}



void kernel_gemver_polly_subfn_7
               (undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
               long param_6)

{
  undefined4 uVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long local_48;
  undefined4 local_3c;
  long local_38;
  long local_30;
  
  lVar2 = *(long *)(param_6 + 8);
  lVar3 = *(long *)(param_6 + 0x10);
  uVar1 = *param_1;
  local_3c = 0;
  local_48 = param_4;
  local_38 = param_3;
  local_30 = param_5;
  __kmpc_for_static_init_8(&DAT_00402060,uVar1,0x22,&local_3c,&local_38,&local_48,&local_30,1,1);
  lVar4 = local_38;
  lVar5 = param_4 + -1;
  if (local_48 <= param_4 + -1) {
    lVar5 = local_48;
  }
  for (; local_48 = lVar5, lVar4 <= local_48; lVar4 = lVar4 + param_5) {
    *(double *)(lVar2 + lVar4 * 8) = *(double *)(lVar2 + lVar4 * 8) + *(double *)(lVar3 + lVar4 * 8)
    ;
    lVar5 = local_48;
  }
  __kmpc_for_static_fini(&DAT_00402060,uVar1);
  return;
}



void kernel_gemver_polly_subfn_10
               (undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
               uint *param_6)

{
  uint uVar1;
  long lVar2;
  double *pdVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  ulong uVar9;
  double dVar10;
  long local_58;
  undefined4 local_50;
  undefined4 local_4c;
  long local_48;
  long local_40;
  long local_38;
  
  uVar1 = *param_6;
  uVar9 = (ulong)uVar1;
  lVar2 = *(long *)(param_6 + 2);
  local_40 = *(long *)(param_6 + 4);
  pdVar3 = *(double **)(param_6 + 6);
  lVar4 = *(long *)(param_6 + 8);
  local_50 = *param_1;
  local_4c = 0;
  local_58 = param_4;
  local_48 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402078,local_50,0x22,&local_4c,&local_48,&local_58,&local_38,1,1);
  lVar6 = param_4 + -1;
  if (local_58 <= param_4 + -1) {
    lVar6 = local_58;
  }
  if (local_48 <= lVar6) {
    lVar8 = local_48;
    if ((int)uVar1 < 1) {
      do {
        lVar8 = lVar8 + param_5;
      } while (lVar8 <= lVar6);
    }
    else {
      lVar7 = local_40 + local_48 * uVar9 * 8 + 8;
      do {
        dVar10 = *(double *)(lVar2 + lVar8 * 8);
        uVar5 = 0;
        if (uVar1 != 1) {
          do {
            dVar10 = *pdVar3 * *(double *)(lVar7 + -8 + uVar5 * 8) * *(double *)(lVar4 + uVar5 * 8)
                     + dVar10;
            *(double *)(lVar2 + lVar8 * 8) = dVar10;
            dVar10 = *pdVar3 * *(double *)(lVar7 + uVar5 * 8) * *(double *)(lVar4 + 8 + uVar5 * 8) +
                     dVar10;
            *(double *)(lVar2 + lVar8 * 8) = dVar10;
            uVar5 = uVar5 + 2;
          } while (((long)(int)uVar1 & 0xfffffffffffffffeU) != uVar5);
        }
        if ((uVar1 & 1) != 0) {
          *(double *)(lVar2 + lVar8 * 8) =
               dVar10 + *pdVar3 * *(double *)(local_40 + lVar8 * uVar9 * 8 + uVar5 * 8) *
                        *(double *)(lVar4 + uVar5 * 8);
        }
        lVar8 = lVar8 + param_5;
        lVar7 = lVar7 + param_5 * uVar9 * 8;
      } while (lVar8 <= lVar6);
    }
  }
  local_58 = lVar6;
  __kmpc_for_static_fini(&DAT_00402078,local_50);
  return;
}


