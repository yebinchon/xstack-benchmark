
int main(int argc,char **argv)

{
  int iVar1;
  long lVar2;
  ulong uVar3;
  ulong uVar4;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  ulong uVar5;
  void *pvVar6;
  ulong uVar7;
  int local_108;
  double local_e0;
  ulong local_d0;
  long local_c8;
  double *local_c0;
  void *local_b8;
  ulong local_a8;
  long local_a0;
  double *local_98;
  void *local_90;
  ulong local_80;
  long local_78;
  double *local_70;
  void *local_68;
  ulong local_58;
  long local_50;
  void *local_48;
  void *local_40;
  void *local_38;
  
  lVar2 = strtol(argv[1],(char **)0x0,10);
  uVar3 = strtol(argv[2],(char **)0x0,10);
  uVar4 = strtol(argv[3],(char **)0x0,10);
  local_50 = strtol(argv[4],(char **)0x0,10);
  __ptr = malloc(uVar4 * uVar3 * 8 & 0x7fffffff8);
  __ptr_00 = malloc(uVar3 * 8 * local_50 & 0x7fffffff8);
  __ptr_01 = malloc((ulong)(uint)((int)local_50 * (int)uVar4) << 3);
  local_e0 = (double)(int)uVar3;
  local_70 = &local_e0;
  local_d0 = uVar3;
  local_c8 = local_50;
  local_c0 = local_70;
  local_b8 = __ptr;
  local_a8 = uVar3;
  local_a0 = local_50;
  local_98 = local_70;
  local_90 = __ptr_00;
  local_80 = uVar3;
  local_78 = local_50;
  local_68 = __ptr_01;
  local_58 = uVar3;
  local_48 = __ptr;
  local_40 = __ptr_00;
  local_38 = __ptr_01;
  local_108 = (int)lVar2;
  if (local_108 == 1) {
    lVar2 = 0;
    uVar7 = 0;
    pvVar6 = __ptr;
    do {
      uVar5 = 0;
      do {
        fprintf(*(FILE **)((long)pvVar6 + uVar5 * 8),(char *)stderr,"%0.2lf ");
        iVar1 = (int)uVar5 + (int)lVar2;
        if ((iVar1 * -0x33333333 + 0x19999998U >> 2 | iVar1 * 0x40000000) < 0xccccccd) {
          fputc(10,stderr);
        }
        uVar5 = uVar5 + 1;
      } while ((uVar4 & 0xffffffff) != uVar5);
      uVar7 = uVar7 + 1;
      lVar2 = lVar2 + uVar3;
      pvVar6 = (void *)((long)pvVar6 + (uVar4 & 0xffffffff) * 8);
    } while (uVar7 != (uVar3 & 0xffffffff));
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  return 0;
}


