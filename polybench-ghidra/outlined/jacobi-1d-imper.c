
void kernel_jacobi_1d_imper_polly_subfn
               (undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
               long param_6)

{
  undefined4 uVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  double dVar5;
  long lVar6;
  long local_48;
  undefined4 local_3c;
  long local_38;
  long local_30;
  
  lVar2 = *(long *)(param_6 + 0x10);
  lVar3 = *(long *)(param_6 + 0x18);
  uVar1 = *param_1;
  local_3c = 0;
  local_48 = param_4;
  local_38 = param_3;
  local_30 = param_5;
  __kmpc_for_static_init_8(&DAT_00402060,uVar1,0x22,&local_3c,&local_38,&local_48,&local_30,1,1);
  dVar5 = DAT_00402008;
  lVar4 = local_38;
  lVar6 = param_4 + -1;
  if (local_48 <= param_4 + -1) {
    lVar6 = local_48;
  }
  for (; local_48 = lVar6, lVar4 <= local_48; lVar4 = lVar4 + param_5) {
    *(double *)(lVar3 + 8 + lVar4 * 8) =
         (*(double *)(lVar2 + lVar4 * 8) + *(double *)(lVar2 + 8 + lVar4 * 8) +
         *(double *)(lVar2 + 0x10 + lVar4 * 8)) * dVar5;
    lVar6 = local_48;
  }
  __kmpc_for_static_fini(&DAT_00402060,uVar1);
  return;
}



void kernel_jacobi_1d_imper_polly_subfn_4
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
  
  lVar2 = *(long *)(param_6 + 0x10);
  lVar3 = *(long *)(param_6 + 0x18);
  uVar1 = *param_1;
  local_3c = 0;
  local_48 = param_4;
  local_38 = param_3;
  local_30 = param_5;
  __kmpc_for_static_init_8(&DAT_00402078,uVar1,0x22,&local_3c,&local_38,&local_48,&local_30,1,1);
  lVar4 = local_38;
  lVar5 = param_4 + -1;
  if (local_48 <= param_4 + -1) {
    lVar5 = local_48;
  }
  for (; local_48 = lVar5, lVar4 <= local_48; lVar4 = lVar4 + param_5) {
    *(undefined8 *)(lVar3 + 8 + lVar4 * 8) = *(undefined8 *)(lVar2 + 8 + lVar4 * 8);
    lVar5 = local_48;
  }
  __kmpc_for_static_fini(&DAT_00402078,uVar1);
  return;
}


