
void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     long *param_6)

{
  undefined4 uVar1;
  int iVar2;
  double dVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  double dVar11;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  lVar10 = *param_6;
  lVar7 = param_6[1];
  lVar8 = param_6[2];
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402050,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  dVar3 = DAT_00402040;
  lVar9 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar9 = local_50;
  }
  if (local_40 <= lVar9) {
    lVar5 = local_40 * 32000;
    lVar10 = lVar10 + lVar5;
    lVar4 = param_5 * 32000;
    lVar8 = lVar8 + lVar5;
    lVar7 = lVar7 + lVar5;
    lVar5 = local_40;
    do {
      dVar11 = (double)(int)lVar5;
      lVar6 = -4000;
      do {
        iVar2 = (int)lVar6;
        *(double *)(lVar7 + 32000 + lVar6 * 8) = ((double)(iVar2 + 0xfa1) * dVar11) / dVar3;
        *(double *)(lVar8 + 32000 + lVar6 * 8) = ((double)(iVar2 + 0xfa2) * dVar11) / dVar3;
        *(double *)(lVar10 + 32000 + lVar6 * 8) = ((double)(iVar2 + 0xfa3) * dVar11) / dVar3;
        lVar6 = lVar6 + 1;
      } while (lVar6 != 0);
      lVar5 = lVar5 + param_5;
      lVar10 = lVar10 + lVar4;
      lVar8 = lVar8 + lVar4;
      lVar7 = lVar7 + lVar4;
    } while (lVar5 <= lVar9);
  }
  local_50 = lVar9;
  __kmpc_for_static_fini(&DAT_00402050,uVar1);
  return;
}



/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void main_polly_subfn_4(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long param_6)

{
  double *pdVar1;
  double *pdVar2;
  double *pdVar3;
  double *pdVar4;
  double *pdVar5;
  undefined4 uVar6;
  double dVar7;
  double dVar8;
  double dVar9;
  double dVar10;
  double dVar11;
  double dVar12;
  double dVar13;
  long lVar14;
  long lVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  long local_48;
  undefined4 local_3c;
  long local_38;
  long local_30;
  
  lVar14 = *(long *)(param_6 + 8);
  lVar15 = *(long *)(param_6 + 0x10);
  uVar6 = *param_1;
  local_3c = 0;
  local_48 = param_4;
  local_38 = param_3;
  local_30 = param_5;
  __kmpc_for_static_init_8(&DAT_00402068,uVar6,0x22,&local_3c,&local_38,&local_48,&local_30,1,1);
  dVar13 = _UNK_00402018;
  dVar12 = _DAT_00402010;
  lVar16 = param_4 + -1;
  if (local_48 <= param_4 + -1) {
    lVar16 = local_48;
  }
  if (local_38 <= lVar16) {
    lVar15 = lVar15 + local_38 * 32000 + 0x7d10;
    lVar17 = local_38 * 32000 + lVar14 + 0x7d10;
    lVar14 = local_38;
    do {
      lVar18 = 0;
      do {
        pdVar3 = (double *)(lVar17 + -0x10 + lVar18 * 8);
        pdVar1 = (double *)(lVar17 + lVar18 * 8);
        dVar7 = pdVar1[1];
        pdVar4 = (double *)(lVar15 + -0x10 + lVar18 * 8);
        pdVar2 = (double *)(lVar15 + lVar18 * 8);
        dVar8 = *pdVar2;
        dVar9 = pdVar2[1];
        pdVar2 = (double *)(lVar15 + -0x7d10 + lVar18 * 8);
        pdVar5 = (double *)(lVar15 + -32000 + lVar18 * 8);
        dVar10 = *pdVar5;
        dVar11 = pdVar5[1];
        *(undefined (*) [16])(lVar17 + -0x10 + lVar18 * 8) =
             CONCAT88(pdVar3[1] - (pdVar4[1] - pdVar2[1]) * dVar13,
                      *pdVar3 - (*pdVar4 - *pdVar2) * dVar12);
        *(undefined (*) [16])(lVar17 + lVar18 * 8) =
             CONCAT88(dVar7 - (dVar9 - dVar11) * dVar13,*pdVar1 - (dVar8 - dVar10) * dVar12);
        lVar18 = lVar18 + 4;
      } while (lVar18 != 4000);
      lVar14 = lVar14 + param_5;
      lVar15 = lVar15 + param_5 * 32000;
      lVar17 = lVar17 + param_5 * 32000;
    } while (lVar14 <= lVar16);
  }
  local_48 = lVar16;
  __kmpc_for_static_fini(&DAT_00402068,uVar6);
  return;
}


