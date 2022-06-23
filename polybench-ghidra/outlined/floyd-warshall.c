
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
  pdVar2 = (double *)param_6[1];
  uVar3 = param_6[2];
  local_48 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402008,local_48,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
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
        dVar9 = (double)((int)lVar4 + 1);
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
  __kmpc_for_static_fini(&DAT_00402008,local_48);
  return;
}


