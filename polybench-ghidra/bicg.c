
int main(int argc,char **argv)

{
  long lVar1;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  void *__ptr_03;
  void *pvVar2;
  long lVar3;
  int iVar4;
  long lVar5;
  ushort uVar6;
  short sVar7;
  double dVar8;
  int dump_code;
  int local_88;
  undefined4 local_80;
  undefined4 local_7c;
  void *local_78;
  void *local_70;
  void *local_68;
  void *local_60;
  void *local_58;
  void *local_50;
  undefined4 local_48;
  undefined4 uStack68;
  undefined4 uStack64;
  undefined4 uStack60;
  char *local_38;
  
  lVar5 = 0;
  lVar1 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc(128000000);
  __ptr_00 = malloc(32000);
  __ptr_01 = malloc(32000);
  __ptr_02 = malloc(32000);
  __ptr_03 = malloc(32000);
  do {
    iVar4 = (int)lVar5;
    *(double *)((long)__ptr_02 + lVar5 * 8) = (double)iVar4 * 3.141592653589793;
    *(double *)((long)__ptr_02 + lVar5 * 8 + 8) = (double)(iVar4 + 1) * 3.141592653589793;
    *(double *)((long)__ptr_02 + lVar5 * 8 + 0x10) = (double)(iVar4 + 2) * 3.141592653589793;
    *(double *)((long)__ptr_02 + lVar5 * 8 + 0x18) = (double)(iVar4 + 3) * 3.141592653589793;
    *(double *)((long)__ptr_02 + lVar5 * 8 + 0x20) = (double)(iVar4 + 4) * 3.141592653589793;
    lVar5 = lVar5 + 5;
  } while (lVar5 != 4000);
  lVar5 = 0;
  pvVar2 = __ptr;
  do {
    dVar8 = (double)(int)lVar5;
    *(double *)((long)__ptr_03 + lVar5 * 8) = dVar8 * 3.141592653589793;
    lVar3 = 1;
    iVar4 = 2;
    do {
      *(double *)((long)pvVar2 + lVar3 * 8 + -8) = ((double)(int)lVar3 * dVar8) / 4000.0;
      *(double *)((long)pvVar2 + lVar3 * 8) = ((double)iVar4 * dVar8) / 4000.0;
      lVar3 = lVar3 + 2;
      iVar4 = iVar4 + 2;
    } while (lVar3 != 0xfa1);
    lVar5 = lVar5 + 1;
    pvVar2 = (void *)((long)pvVar2 + 32000);
  } while (lVar5 != 4000);
  local_48 = 0;
  uStack68 = 2;
  uStack64 = 0;
  uStack60 = 0;
  local_7c = 4000;
  local_80 = 4000;
  local_38 = ";bicg.c;kernel_bicg;73;1;;";
  local_70 = __ptr_03;
  local_68 = __ptr_02;
  local_60 = __ptr_01;
  local_58 = __ptr_00;
  local_50 = __ptr;
  __kmpc_fork_call(&local_48,0xd,_omp_outlined_,&local_80,4000,&local_58,&local_7c,4000,&local_60,
                   4000,&local_70,4000,4000,&local_50,4000,&local_68);
  local_88 = (int)lVar1;
  if (local_88 == 1) {
    lVar1 = -32000;
    uVar6 = 0;
    sVar7 = 0;
    local_78 = __ptr;
    do {
      fprintf((int)*(undefined8 *)((long)__ptr_00 + lVar1 + 32000),(char *)stderr,"%0.2lf ");
      if ((ushort)((uVar6 / 5 & 0xfffc) * 5 + sVar7) == 0) {
        fputc(10,stderr);
      }
      sVar7 = sVar7 + -1;
      uVar6 = uVar6 + 1;
      lVar1 = lVar1 + 8;
    } while (lVar1 != 0);
    lVar1 = -32000;
    uVar6 = 0;
    sVar7 = 0;
    do {
      fprintf((int)*(undefined8 *)((long)__ptr_01 + lVar1 + 32000),(char *)stderr,"%0.2lf ");
      if ((ushort)((uVar6 / 5 & 0xfffc) * 5 + sVar7) == 0) {
        fputc(10,stderr);
      }
      sVar7 = sVar7 + -1;
      uVar6 = uVar6 + 1;
      lVar1 = lVar1 + 8;
    } while (lVar1 != 0);
    fputc(10,stderr);
    __ptr = local_78;
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  free(__ptr_03);
  return 0;
}

