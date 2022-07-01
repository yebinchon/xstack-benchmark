
void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     ulong *param_6)

{
  ulong uVar1;
  double *pdVar2;
  ulong uVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  double dVar10;
  double dVar11;
  long local_68;
  undefined4 local_60;
  undefined4 local_5c;
  ulong local_58;
  ulong local_50;
  long local_48;
  long local_40;
  long local_38;
  
  uVar1 = *param_6;
  pdVar2 = (double *)param_6[1];
  uVar3 = param_6[2];
  local_50 = param_6[3];
  local_58 = param_6[4];
  local_60 = *param_1;
  local_5c = 0;
  local_68 = param_4;
  local_48 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402020,local_60,0x22,&local_5c,&local_48,&local_68,&local_38,1,1);
  lVar9 = param_4 + -1;
  if (local_68 <= param_4 + -1) {
    lVar9 = local_68;
  }
  if (local_48 <= lVar9) {
    lVar6 = local_48;
    if ((long)uVar1 < 1) {
      do {
        *(double *)(uVar3 + lVar6 * 8) = (double)(int)lVar6 / *pdVar2;
        lVar6 = lVar6 + param_5;
      } while (lVar6 <= lVar9);
    }
    else {
      local_40 = (uVar1 & 0xffffffff) * 8;
      lVar6 = local_48 * (uVar1 & 0xffffffff);
      lVar4 = local_58 + lVar6 * 8 + 8;
      lVar8 = (uVar1 & 0xffffffff) * param_5 * 8;
      lVar7 = local_50 + lVar6 * 8 + 8;
      lVar6 = local_48;
      do {
        dVar10 = (double)(int)lVar6;
        *(double *)(uVar3 + lVar6 * 8) = dVar10 / *pdVar2;
        uVar5 = 0;
        if (uVar1 != 1) {
          do {
            dVar11 = ((double)(int)uVar5 * dVar10) / *pdVar2;
            *(double *)(lVar7 + -8 + uVar5 * 8) = dVar11;
            *(double *)(lVar4 + -8 + uVar5 * 8) = dVar11;
            dVar11 = ((double)((int)uVar5 + 1) * dVar10) / *pdVar2;
            *(double *)(lVar7 + uVar5 * 8) = dVar11;
            *(double *)(lVar4 + uVar5 * 8) = dVar11;
            uVar5 = uVar5 + 2;
          } while ((uVar1 & 0xfffffffffffffffe) != uVar5);
        }
        if ((uVar1 & 1) != 0) {
          dVar10 = (dVar10 * (double)(int)uVar5) / *pdVar2;
          *(double *)(local_50 + lVar6 * local_40 + uVar5 * 8) = dVar10;
          *(double *)(lVar6 * local_40 + local_58 + uVar5 * 8) = dVar10;
        }
        lVar6 = lVar6 + param_5;
        lVar4 = lVar4 + lVar8;
        lVar7 = lVar7 + lVar8;
      } while (lVar6 <= lVar9);
    }
  }
  local_68 = lVar9;
  __kmpc_for_static_fini(&DAT_00402020,local_60);
  return;
}


