
void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     long *param_6)

{
  long lVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  double dVar5;
  double dVar6;
  double dVar7;
  double dVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  long lVar12;
  double dVar13;
  long local_58;
  undefined4 local_50;
  undefined4 local_4c;
  long local_48;
  long local_40;
  long local_38;
  
  lVar1 = *param_6;
  lVar2 = param_6[1];
  lVar3 = param_6[2];
  lVar4 = param_6[3];
  local_40 = param_6[4];
  local_50 = *param_1;
  local_4c = 0;
  local_58 = param_4;
  local_48 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402028,local_50,0x22,&local_4c,&local_48,&local_58,&local_38,1,1);
  dVar8 = DAT_00402020;
  dVar7 = DAT_00402018;
  dVar6 = DAT_00402010;
  dVar5 = DAT_00402008;
  lVar11 = param_4 + -1;
  if (local_58 <= param_4 + -1) {
    lVar11 = local_58;
  }
  if (local_48 <= lVar11) {
    lVar10 = local_48 * 32000 + local_40 + 8;
    lVar9 = local_48;
    do {
      dVar13 = (double)(int)lVar9;
      *(double *)(lVar1 + lVar9 * 8) = dVar13 / dVar5;
      *(double *)(lVar2 + lVar9 * 8) = (dVar13 + dVar6) / dVar5;
      *(double *)(lVar3 + lVar9 * 8) = (dVar13 + dVar7) / dVar5;
      *(double *)(lVar4 + lVar9 * 8) = (dVar13 + dVar8) / dVar5;
      lVar12 = 0;
      do {
        *(double *)(lVar10 + -8 + lVar12 * 8) = ((double)(int)lVar12 * dVar13) / dVar5;
        *(double *)(lVar10 + lVar12 * 8) = ((double)((int)lVar12 + 1) * dVar13) / dVar5;
        lVar12 = lVar12 + 2;
      } while (lVar12 != 4000);
      lVar9 = lVar9 + param_5;
      lVar10 = lVar10 + param_5 * 32000;
    } while (lVar9 <= lVar11);
  }
  local_58 = lVar11;
  __kmpc_for_static_fini(&DAT_00402028,local_50);
  return;
}



void main_polly_subfn_4(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long *param_6)

{
  undefined4 uVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  double dVar8;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  lVar2 = *param_6;
  lVar6 = param_6[1];
  lVar3 = param_6[2];
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402040,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  lVar7 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar7 = local_50;
  }
  if (local_40 <= lVar7) {
    lVar6 = lVar6 + local_40 * 32000;
    lVar4 = local_40;
    do {
      dVar8 = *(double *)(lVar2 + lVar4 * 8);
      lVar5 = 3;
      do {
        dVar8 = *(double *)(lVar6 + lVar5 * 8) * *(double *)(lVar3 + lVar5 * 8) +
                *(double *)(lVar6 + -8 + lVar5 * 8) * *(double *)(lVar3 + -8 + lVar5 * 8) +
                *(double *)(lVar6 + -0x10 + lVar5 * 8) * *(double *)(lVar3 + -0x10 + lVar5 * 8) +
                *(double *)(lVar6 + -0x18 + lVar5 * 8) * *(double *)(lVar3 + -0x18 + lVar5 * 8) +
                dVar8;
        lVar5 = lVar5 + 4;
      } while (lVar5 != 0xfa3);
      *(double *)(lVar2 + lVar4 * 8) = dVar8;
      lVar4 = lVar4 + param_5;
      lVar6 = lVar6 + param_5 * 32000;
    } while (lVar4 <= lVar7);
  }
  local_50 = lVar7;
  __kmpc_for_static_fini(&DAT_00402040,uVar1);
  return;
}



void main_polly_subfn_7(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long *param_6)

{
  undefined4 uVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  double *pdVar5;
  long lVar6;
  double *pdVar7;
  long lVar8;
  double dVar9;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  lVar2 = *param_6;
  lVar4 = param_6[1];
  lVar3 = param_6[2];
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402058,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  lVar8 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar8 = local_50;
  }
  if (local_40 <= lVar8) {
    pdVar5 = (double *)(local_40 * 8 + lVar4);
    lVar4 = local_40;
    do {
      dVar9 = *(double *)(lVar2 + lVar4 * 8);
      lVar6 = 1;
      pdVar7 = pdVar5;
      do {
        dVar9 = pdVar7[4000] * *(double *)(lVar3 + lVar6 * 8) +
                *pdVar7 * *(double *)(lVar3 + -8 + lVar6 * 8) + dVar9;
        pdVar7 = pdVar7 + 8000;
        lVar6 = lVar6 + 2;
      } while (lVar6 != 0xfa1);
      *(double *)(lVar2 + lVar4 * 8) = dVar9;
      lVar4 = lVar4 + param_5;
      pdVar5 = pdVar5 + param_5;
    } while (lVar4 <= lVar8);
  }
  local_50 = lVar8;
  __kmpc_for_static_fini(&DAT_00402058,uVar1);
  return;
}


