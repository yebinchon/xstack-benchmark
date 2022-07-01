
void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     long *param_6)

{
  undefined4 uVar1;
  long lVar2;
  double dVar3;
  double dVar4;
  long lVar5;
  int iVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  double dVar10;
  long local_48;
  undefined4 local_3c;
  long local_38;
  long local_30;
  
  lVar8 = *param_6;
  lVar2 = param_6[1];
  uVar1 = *param_1;
  local_3c = 0;
  local_48 = param_4;
  local_38 = param_3;
  local_30 = param_5;
  __kmpc_for_static_init_8(&DAT_00402020,uVar1,0x22,&local_3c,&local_38,&local_48,&local_30,1,1);
  dVar4 = DAT_00402010;
  dVar3 = DAT_00402008;
  lVar7 = param_4 + -1;
  if (local_48 <= param_4 + -1) {
    lVar7 = local_48;
  }
  if (local_38 <= lVar7) {
    lVar8 = lVar8 + local_38 * 320000;
    lVar5 = local_38;
    do {
      dVar10 = (double)(int)lVar5;
      *(double *)(lVar2 + lVar5 * 8) = dVar10 * dVar3;
      iVar6 = 2;
      lVar9 = 1;
      do {
        *(double *)(lVar8 + -8 + lVar9 * 8) = ((double)(int)lVar9 * dVar10) / dVar4;
        *(double *)(lVar8 + lVar9 * 8) = ((double)iVar6 * dVar10) / dVar4;
        iVar6 = iVar6 + 2;
        lVar9 = lVar9 + 2;
      } while (lVar9 != 0x9c41);
      lVar5 = lVar5 + param_5;
      lVar8 = lVar8 + param_5 * 320000;
    } while (lVar5 <= lVar7);
  }
  local_48 = lVar7;
  __kmpc_for_static_fini(&DAT_00402020,uVar1);
  return;
}


