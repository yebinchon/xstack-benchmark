
int main(int argc,char **argv)

{
  int iVar1;
  long lVar2;
  ulong uVar3;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  ulong uVar4;
  ulong uVar5;
  size_t __size;
  void *pvVar6;
  ulong uVar7;
  int local_e0;
  long local_d8;
  double local_c0;
  ulong local_b0;
  void *local_a8;
  ulong local_98;
  double *local_90;
  void *local_88;
  ulong local_78;
  double *local_70;
  void *local_68;
  void *local_60;
  long local_58;
  ulong local_50;
  void *local_48;
  void *local_40;
  void *local_38;
  
  lVar2 = strtol(argv[1],(char **)0x0,10);
  uVar3 = strtol(argv[2],(char **)0x0,10);
  local_58 = strtol(argv[3],(char **)0x0,10);
  iVar1 = (int)uVar3;
  __ptr = malloc((ulong)(uint)(iVar1 * iVar1) << 3);
  __size = (long)((int)local_58 * iVar1) << 3;
  __ptr_00 = malloc(__size);
  __ptr_01 = malloc(__size);
  local_c0 = (double)iVar1;
  local_90 = &local_c0;
  local_78 = uVar3;
  local_70 = local_90;
  local_68 = __ptr_00;
  local_60 = __ptr_01;
  local_98 = uVar3;
  local_88 = __ptr;
  local_b0 = uVar3;
  local_a8 = __ptr;
  local_50 = uVar3;
  local_48 = __ptr;
  local_40 = __ptr_00;
  local_38 = __ptr_01;
  local_e0 = (int)lVar2;
  if (local_e0 == 1) {
    uVar4 = uVar3 & 0xffffffff;
    local_d8 = 0;
    uVar5 = 0;
    pvVar6 = __ptr;
    do {
      uVar7 = 0;
      do {
        fprintf(*(FILE **)((long)pvVar6 + uVar7 * 8),(char *)stderr,"%0.2lf ");
        iVar1 = (int)local_d8 + (int)uVar7;
        if ((iVar1 * -0x33333333 + 0x19999998U >> 2 | iVar1 * 0x40000000) < 0xccccccd) {
          fputc(10,stderr);
        }
        uVar7 = uVar7 + 1;
      } while (uVar4 != uVar7);
      uVar5 = uVar5 + 1;
      local_d8 = local_d8 + uVar3;
      pvVar6 = (void *)((long)pvVar6 + uVar4 * 8);
    } while (uVar5 != uVar4);
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  return 0;
}


