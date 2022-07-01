
void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     long *param_6)

{
  undefined4 uVar1;
  int iVar2;
  double dVar3;
  double dVar4;
  double dVar5;
  double dVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  long lVar12;
  long lVar13;
  double dVar14;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  lVar13 = *param_6;
  lVar10 = param_6[1];
  lVar11 = param_6[2];
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402028,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  dVar6 = DAT_00402020;
  dVar5 = DAT_00402018;
  dVar4 = DAT_00402010;
  dVar3 = DAT_00402008;
  lVar12 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar12 = local_50;
  }
  if (local_40 <= lVar12) {
    lVar8 = local_40 * 0x4000;
    lVar10 = lVar10 + lVar8;
    lVar7 = param_5 * 0x4000;
    lVar11 = lVar11 + lVar8;
    lVar13 = lVar13 + lVar8;
    lVar8 = local_40;
    do {
      dVar14 = (double)(int)lVar8;
      lVar9 = -0x800;
      do {
        iVar2 = (int)lVar9;
        *(double *)(lVar13 + 0x4000 + lVar9 * 8) =
             ((double)(iVar2 + 0x801) * dVar14 + dVar3) * dVar4;
        *(double *)(lVar11 + 0x4000 + lVar9 * 8) =
             ((double)(iVar2 + 0x802) * dVar14 + dVar5) * dVar4;
        *(double *)(lVar10 + 0x4000 + lVar9 * 8) =
             ((double)(iVar2 + 0x803) * dVar14 + dVar6) * dVar4;
        lVar9 = lVar9 + 1;
      } while (lVar9 != 0);
      lVar8 = lVar8 + param_5;
      lVar10 = lVar10 + lVar7;
      lVar11 = lVar11 + lVar7;
      lVar13 = lVar13 + lVar7;
    } while (lVar8 <= lVar12);
  }
  local_50 = lVar12;
  __kmpc_for_static_fini(&DAT_00402028,uVar1);
  return;
}



void main_polly_subfn_4(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long param_6)

{
  double dVar1;
  undefined4 uVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  lVar7 = *(long *)(param_6 + 8);
  lVar9 = *(long *)(param_6 + 0x10);
  lVar6 = *(long *)(param_6 + 0x18);
  uVar2 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402040,uVar2,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  lVar8 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar8 = local_50;
  }
  if (local_40 <= lVar8) {
    lVar4 = local_40 * 0x4000;
    lVar6 = lVar6 + lVar4;
    lVar3 = param_5 * 0x4000;
    lVar9 = lVar9 + lVar4;
    lVar7 = lVar7 + lVar4;
    lVar5 = 0x7fe;
    lVar4 = local_40;
    while( true ) {
      do {
        dVar1 = *(double *)(lVar7 + -8 + lVar5 * 8);
        *(double *)(lVar7 + lVar5 * 8) =
             (*(double *)(lVar7 + lVar5 * 8) - *(double *)(lVar9 + -8 + lVar5 * 8) * dVar1) /
             *(double *)(lVar6 + -8 + lVar5 * 8);
        *(double *)(lVar7 + -8 + lVar5 * 8) =
             (dVar1 - *(double *)(lVar7 + -0x10 + lVar5 * 8) *
                      *(double *)(lVar9 + -0x10 + lVar5 * 8)) /
             *(double *)(lVar6 + -0x10 + lVar5 * 8);
        lVar5 = lVar5 + -2;
      } while (lVar5 != 0);
      lVar4 = lVar4 + param_5;
      lVar6 = lVar6 + lVar3;
      lVar9 = lVar9 + lVar3;
      lVar7 = lVar7 + lVar3;
      if (lVar8 < lVar4) break;
      lVar5 = 0x7fe;
    }
  }
  local_50 = lVar8;
  __kmpc_for_static_fini(&DAT_00402040,uVar2);
  return;
}


