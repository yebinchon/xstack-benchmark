
int main(int argc,char **argv)

{
  int iVar1;
  long lVar2;
  ulong uVar3;
  void *__ptr;
  void *__ptr_00;
  ulong uVar4;
  ulong uVar5;
  void *pvVar6;
  ulong uVar7;
  double local_b0;
  ulong local_a0;
  void *local_98;
  ulong local_88;
  double *local_80;
  void *local_78;
  ulong local_68;
  double *local_60;
  void *local_58;
  long local_50;
  ulong local_48;
  void *local_40;
  void *local_38;
  
  lVar2 = strtol(argv[1],(char **)0x0,10);
  uVar3 = strtol(argv[2],(char **)0x0,10);
  local_50 = strtol(argv[3],(char **)0x0,10);
  __ptr = malloc(uVar3 * 8 * uVar3 & 0x7fffffff8);
  __ptr_00 = malloc(uVar3 * 8 * local_50 & 0x7fffffff8);
  local_b0 = (double)(int)uVar3;
  local_60 = &local_b0;
  local_88 = uVar3;
  local_80 = local_60;
  local_78 = __ptr_00;
  local_68 = uVar3;
  local_58 = __ptr;
  local_a0 = uVar3;
  local_98 = __ptr;
  local_48 = uVar3;
  local_40 = __ptr;
  local_38 = __ptr_00;
  if ((int)lVar2 == 1) {
    uVar4 = uVar3 & 0xffffffff;
    lVar2 = 0;
    uVar5 = 0;
    pvVar6 = __ptr;
    do {
      uVar7 = 0;
      do {
        fprintf(*(FILE **)((long)pvVar6 + uVar7 * 8),(char *)stderr,"%0.2lf ");
        iVar1 = (int)lVar2 + (int)uVar7;
        if ((iVar1 * -0x33333333 + 0x19999998U >> 2 | iVar1 * 0x40000000) < 0xccccccd) {
          fputc(10,stderr);
        }
        uVar7 = uVar7 + 1;
      } while (uVar4 != uVar7);
      uVar5 = uVar5 + 1;
      lVar2 = lVar2 + uVar3;
      pvVar6 = (void *)((long)pvVar6 + uVar4 * 8);
    } while (uVar5 != uVar4);
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  return 0;
}


