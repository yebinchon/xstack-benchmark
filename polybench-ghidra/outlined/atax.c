
void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     undefined8 *param_6)

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
  
  uVar2 = *param_6;
  uVar3 = param_6[1];
  lVar4 = param_6[2];
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402018,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
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
            *(double *)(lVar6 + -8 + uVar8 * 8) = ((double)((int)uVar8 + 1) * dVar11) / dVar10;
            uVar9 = uVar8 + 2;
            *(double *)(lVar6 + uVar8 * 8) = ((double)(int)uVar9 * dVar11) / dVar10;
            uVar8 = uVar9;
          } while ((uVar3 & 0xfffffffffffffffe) != uVar9);
        }
        if ((uVar3 & 1) != 0) {
          *(double *)(lVar5 * (uVar3 & 0xffffffff) * 8 + lVar4 + uVar9 * 8) =
               (dVar11 * (double)((int)uVar9 + 1)) / dVar10;
        }
        lVar5 = lVar5 + param_5;
        lVar6 = lVar6 + (uVar3 & 0xffffffff) * param_5 * 8;
      } while (lVar5 <= lVar7);
    }
  }
  local_50 = lVar7;
  __kmpc_for_static_fini(&DAT_00402018,uVar1);
  return;
}


