
int main(int argc,char **argv)

{
  long lVar1;
  int iVar2;
  long lVar3;
  ulong uVar4;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  void *__ptr_03;
  ulong uVar5;
  long lVar6;
  long lVar7;
  void *pvVar8;
  ulong uVar9;
  long lVar10;
  uint uVar11;
  ulong uVar12;
  ulong uVar13;
  ulong uVar14;
  double dVar15;
  double dVar16;
  double_0__0_ *B;
  double_0__0_ *C;
  double_0__0_ *tmp;
  int dump_code;
  uint local_d8;
  int local_a8;
  ulong local_98;
  ulong local_90;
  ulong local_88;
  void *local_80;
  void *local_78;
  void *local_70;
  ulong local_68;
  ulong local_60;
  ulong local_58;
  ulong local_50;
  void *local_48;
  void *local_40;
  void *local_38;
  
  uVar12 = 0;
  lVar3 = strtol(argv[1],(char **)0x0,10);
  uVar4 = strtol(argv[2],(char **)0x0,10);
  local_60 = strtol(argv[3],(char **)0x0,10);
  local_68 = strtol(argv[4],(char **)0x0,10);
  local_50 = strtol(argv[5],(char **)0x0,10);
  lVar7 = uVar4 << 0x20;
  __ptr = malloc((long)(local_60 * lVar7) >> 0x1d);
  __ptr_00 = malloc((long)(local_68 * lVar7) >> 0x1d);
  __ptr_01 = malloc((long)(local_68 * (local_60 << 0x20)) >> 0x1d);
  __ptr_02 = malloc((long)((local_60 << 0x20) * local_50) >> 0x1d);
  __ptr_03 = malloc((long)(lVar7 * local_50) >> 0x1d);
  uVar14 = local_50 & 0xffffffff;
  dVar15 = (double)(int)uVar4;
  uVar13 = uVar4 & 0xffffffff;
  uVar5 = local_68 & 0xffffffff;
  uVar9 = (ulong)((uint)local_68 & 1);
  lVar7 = (long)__ptr_00 + 8;
  lVar1 = uVar14 * 8;
  do {
    dVar16 = (double)(int)uVar12;
    lVar10 = 0;
    if ((int)uVar5 != 1) {
      do {
        *(double *)(lVar7 + -8 + lVar10 * 8) = ((double)(int)lVar10 * dVar16) / dVar15;
        *(double *)(lVar7 + lVar10 * 8) = ((double)((int)lVar10 + 1) * dVar16) / dVar15;
        lVar10 = lVar10 + 2;
      } while (uVar5 - uVar9 != lVar10);
    }
    if (uVar9 != 0) {
      *(double *)((long)__ptr_00 + lVar10 * 8 + uVar12 * uVar14 * 8) =
           (dVar16 * (double)(int)lVar10) / dVar15;
    }
    uVar12 = uVar12 + 1;
    lVar7 = lVar7 + lVar1;
  } while (uVar12 != uVar13);
  uVar11 = (uint)local_60;
  uVar9 = local_60 & 0xffffffff;
  dVar15 = (double)uVar11;
  lVar7 = (long)__ptr_01 + 8;
  uVar12 = 0;
  do {
    dVar16 = (double)(int)uVar12;
    if (uVar9 == 1) {
      lVar6 = 0;
    }
    else {
      lVar10 = 0;
      do {
        *(double *)(lVar7 + -8 + lVar10 * 8) = ((double)((int)lVar10 + 1) * dVar16) / dVar15;
        lVar6 = lVar10 + 2;
        *(double *)(lVar7 + lVar10 * 8) = ((double)(int)lVar6 * dVar16) / dVar15;
        lVar10 = lVar6;
      } while (uVar9 - (uVar11 & 1) != lVar6);
    }
    if ((ulong)(uVar11 & 1) != 0) {
      *(double *)((long)__ptr_01 + lVar6 * 8 + uVar12 * uVar9 * 8) =
           (dVar16 * (double)((int)lVar6 + 1)) / dVar15;
    }
    uVar12 = uVar12 + 1;
    lVar7 = lVar7 + uVar9 * 8;
  } while (uVar12 != uVar5);
  local_d8 = (uint)local_50;
  dVar15 = (double)local_d8;
  lVar7 = (long)__ptr_02 + 8;
  uVar5 = 0;
  do {
    dVar16 = (double)(int)uVar5;
    lVar10 = 0;
    if (uVar9 != 1) {
      do {
        *(double *)(lVar7 + -8 + lVar10 * 8) = ((double)((int)lVar10 + 3) * dVar16) / dVar15;
        *(double *)(lVar7 + lVar10 * 8) = ((double)((int)lVar10 + 4) * dVar16) / dVar15;
        lVar10 = lVar10 + 2;
      } while (uVar9 - (uVar11 & 1) != lVar10);
    }
    if ((ulong)(uVar11 & 1) != 0) {
      *(double *)((long)__ptr_02 + lVar10 * 8 + uVar5 * uVar9 * 8) =
           (dVar16 * (double)((int)lVar10 + 3)) / dVar15;
    }
    uVar5 = uVar5 + 1;
    lVar7 = lVar7 + uVar9 * 8;
  } while (uVar5 != uVar14);
  dVar15 = (double)(uint)local_68;
  lVar7 = (long)__ptr_03 + 8;
  uVar9 = 0;
  do {
    dVar16 = (double)(int)uVar9;
    if (uVar14 == 1) {
      lVar6 = 0;
    }
    else {
      lVar10 = 0;
      do {
        lVar6 = lVar10 + 2;
        *(double *)(lVar7 + -8 + lVar10 * 8) = ((double)(int)lVar6 * dVar16) / dVar15;
        *(double *)(lVar7 + lVar10 * 8) = ((double)((int)lVar10 + 3) * dVar16) / dVar15;
        lVar10 = lVar6;
      } while (uVar14 - (local_d8 & 1) != lVar6);
    }
    if ((ulong)(local_d8 & 1) != 0) {
      *(double *)((long)__ptr_03 + lVar6 * 8 + uVar9 * uVar14 * 8) =
           (dVar16 * (double)((int)lVar6 + 2)) / dVar15;
    }
    uVar9 = uVar9 + 1;
    lVar7 = lVar7 + lVar1;
  } while (uVar9 != uVar13);
  local_98 = local_60;
  local_90 = uVar4;
  local_88 = local_50;
  local_80 = __ptr;
  local_78 = __ptr_00;
  local_70 = __ptr_01;
  local_58 = uVar4;
  local_48 = __ptr_03;
  local_40 = __ptr;
  local_38 = __ptr_02;
  local_a8 = (int)lVar3;
  if (local_a8 == 1) {
    lVar7 = 0;
    uVar9 = 0;
    pvVar8 = __ptr_03;
    do {
      uVar5 = 0;
      do {
        fprintf(*(FILE **)((long)pvVar8 + uVar5 * 8),(char *)stderr,"%0.2lf ");
        iVar2 = (int)lVar7 + (int)uVar5;
        if ((iVar2 * -0x33333333 + 0x19999998U >> 2 | iVar2 * 0x40000000) < 0xccccccd) {
          fputc(10,stderr);
        }
        uVar5 = uVar5 + 1;
      } while (uVar14 != uVar5);
      uVar9 = uVar9 + 1;
      lVar7 = lVar7 + uVar4;
      pvVar8 = (void *)((long)pvVar8 + lVar1);
    } while (uVar9 != uVar13);
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  free(__ptr_03);
  return 0;
}


