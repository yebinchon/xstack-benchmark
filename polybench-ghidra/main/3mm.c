
int main(int argc,char **argv)

{
  int iVar1;
  long lVar2;
  ulong uVar3;
  ulong uVar4;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  void *__ptr_03;
  void *__ptr_04;
  void *__ptr_05;
  ulong uVar5;
  ulong uVar6;
  long lVar7;
  long lVar8;
  void *pvVar9;
  ulong uVar10;
  double dVar11;
  double dVar12;
  int dump_code;
  double_0__0_ *E;
  double_0__0_ *C;
  double_0__0_ *F;
  double_0__0_ *D;
  double_0__0_ *B;
  int local_1e0;
  double local_198;
  ulong local_188;
  long local_180;
  ulong local_178;
  ulong local_170;
  void *local_168;
  ulong local_158;
  long local_150;
  ulong local_148;
  ulong local_140;
  void *local_138;
  ulong local_128;
  long local_120;
  ulong local_118;
  ulong local_110;
  double *local_108;
  void *local_100;
  ulong local_f0;
  long local_e8;
  ulong local_e0;
  ulong local_d8;
  void *local_d0;
  void *local_c8;
  void *local_c0;
  ulong local_b0;
  long local_a8;
  ulong local_a0;
  ulong local_98;
  void *local_90;
  void *local_88;
  void *local_80;
  long local_78;
  ulong local_70;
  long local_68;
  ulong local_60;
  ulong local_58;
  void *local_50;
  void *local_48;
  void *local_40;
  undefined local_38;
  
  lVar2 = strtol(argv[1],(char **)0x0,10);
  uVar3 = strtol(argv[2],(char **)0x0,10);
  local_78 = strtol(argv[3],(char **)0x0,10);
  local_70 = strtol(argv[4],(char **)0x0,10);
  uVar4 = strtol(argv[5],(char **)0x0,10);
  local_68 = strtol(argv[6],(char **)0x0,10);
  lVar7 = uVar3 * 8;
  __ptr = malloc(local_78 * lVar7 & 0x7fffffff8);
  __ptr_00 = malloc(local_70 * lVar7 & 0x7fffffff8);
  lVar8 = local_78 * 8;
  __ptr_01 = malloc(local_70 * lVar8 & 0x7fffffff8);
  __ptr_02 = malloc(uVar4 * lVar8 & 0x7fffffff8);
  __ptr_03 = malloc(lVar8 * local_68 & 0x7fffffff8);
  __ptr_04 = malloc((ulong)(uint)((int)local_68 * (int)uVar4) << 3);
  __ptr_05 = malloc(lVar7 * uVar4 & 0x7fffffff8);
  iVar1 = (int)uVar3;
  if (0 < iVar1) {
    uVar10 = local_70 & 0xffffffff;
    dVar11 = (double)iVar1;
    uVar5 = (ulong)((uint)local_70 & 1);
    lVar7 = (long)__ptr_00 + 8;
    uVar6 = 0;
    do {
      dVar12 = (double)(int)uVar6;
      lVar8 = 0;
      if (uVar10 != 1) {
        do {
          *(double *)(lVar7 + -8 + lVar8 * 8) = ((double)(int)lVar8 * dVar12) / dVar11;
          *(double *)(lVar7 + lVar8 * 8) = ((double)((int)lVar8 + 1) * dVar12) / dVar11;
          lVar8 = lVar8 + 2;
        } while (uVar10 - uVar5 != lVar8);
      }
      if (uVar5 != 0) {
        *(double *)((long)__ptr_00 + lVar8 * 8 + uVar6 * uVar10 * 8) =
             (dVar12 * (double)(int)lVar8) / dVar11;
      }
      uVar6 = uVar6 + 1;
      lVar7 = lVar7 + uVar10 * 8;
    } while (uVar6 != (uVar3 & 0xffffffff));
  }
  local_198 = (double)(int)local_78;
  local_108 = &local_198;
  local_128 = local_70;
  local_120 = local_68;
  local_118 = uVar4;
  local_110 = uVar3;
  local_100 = __ptr_01;
  local_188 = local_70;
  local_180 = local_68;
  local_178 = uVar4;
  local_170 = uVar3;
  local_168 = __ptr_03;
  local_158 = local_70;
  local_150 = local_68;
  local_148 = uVar4;
  local_140 = uVar3;
  local_138 = __ptr_04;
  local_f0 = local_70;
  local_e8 = local_68;
  local_e0 = uVar4;
  local_d8 = uVar3;
  local_d0 = __ptr;
  local_c8 = __ptr_00;
  local_c0 = __ptr_01;
  local_b0 = local_70;
  local_a8 = local_68;
  local_a0 = uVar4;
  local_98 = uVar3;
  local_90 = __ptr_02;
  local_88 = __ptr_03;
  local_80 = __ptr_04;
  local_38 = 0 < (int)local_78;
  local_60 = uVar4;
  local_58 = uVar3;
  local_50 = __ptr_05;
  local_48 = __ptr;
  local_40 = __ptr_02;
  local_1e0 = (int)lVar2;
  if (local_1e0 == 1) {
    if (0 < iVar1) {
      lVar7 = 0;
      uVar5 = 0;
      pvVar9 = __ptr_05;
      do {
        uVar10 = 0;
        do {
          fprintf(*(FILE **)((long)pvVar9 + uVar10 * 8),(char *)stderr,"%0.2lf ");
          iVar1 = (int)lVar7 + (int)uVar10;
          if ((iVar1 * -0x33333333 + 0x19999998U >> 2 | iVar1 * 0x40000000) < 0xccccccd) {
            fputc(10,stderr);
          }
          uVar10 = uVar10 + 1;
        } while ((uVar4 & 0xffffffff) != uVar10);
        uVar5 = uVar5 + 1;
        lVar7 = lVar7 + uVar3;
        pvVar9 = (void *)((long)pvVar9 + (uVar4 & 0xffffffff) * 8);
      } while (uVar5 != (uVar3 & 0xffffffff));
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  free(__ptr_03);
  free(__ptr_04);
  free(__ptr_05);
  return 0;
}


