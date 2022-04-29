
int main(int argc,char **argv)

{
  double dVar1;
  long lVar2;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  long lVar3;
  long lVar4;
  long lVar5;
  ushort uVar6;
  long lVar7;
  short sVar8;
  double dVar9;
  double dVar10;
  
  lVar7 = 0;
  lVar2 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc(128000000);
  __ptr_00 = malloc(128000000);
  __ptr_01 = malloc(32000);
  __ptr_02 = malloc(32000);
  lVar3 = (long)__ptr + 8;
  lVar4 = (long)__ptr_00 + 8;
  do {
    dVar9 = (double)(int)lVar7;
    *(double *)((long)__ptr_01 + lVar7 * 8) = dVar9 / 4000.0;
    lVar5 = 0;
    do {
      dVar10 = ((double)(int)lVar5 * dVar9) / 4000.0;
      *(double *)(lVar3 + -8 + lVar5 * 8) = dVar10;
      *(double *)(lVar4 + -8 + lVar5 * 8) = dVar10;
      dVar10 = ((double)((int)lVar5 + 1) * dVar9) / 4000.0;
      *(double *)(lVar3 + lVar5 * 8) = dVar10;
      *(double *)(lVar4 + lVar5 * 8) = dVar10;
      lVar5 = lVar5 + 2;
    } while (lVar5 != 4000);
    lVar7 = lVar7 + 1;
    lVar3 = lVar3 + 32000;
    lVar4 = lVar4 + 32000;
  } while (lVar7 != 4000);
  lVar3 = (long)__ptr + 8;
  lVar4 = (long)__ptr_00 + 8;
  lVar7 = 0;
  do {
    *(undefined8 *)((long)__ptr_02 + lVar7 * 8) = 0;
    dVar9 = 0.0;
    dVar10 = 0.0;
    lVar5 = 0;
    do {
      dVar1 = *(double *)((long)__ptr_01 + lVar5 + 8);
      dVar9 = dVar1 * *(double *)(lVar4 + lVar5) +
              *(double *)(lVar4 + -8 + lVar5) * *(double *)((long)__ptr_01 + lVar5) + dVar9;
      dVar10 = *(double *)(lVar3 + lVar5) * dVar1 +
               *(double *)((long)__ptr_01 + lVar5) * *(double *)(lVar3 + -8 + lVar5) + dVar10;
      lVar5 = lVar5 + 0x10;
    } while (lVar5 != 32000);
    *(double *)((long)__ptr_02 + lVar7 * 8) = dVar9 * 12313.0 + dVar10 * 43532.0;
    lVar7 = lVar7 + 1;
    lVar3 = lVar3 + 32000;
    lVar4 = lVar4 + 32000;
  } while (lVar7 != 4000);
  if ((int)lVar2 == 1) {
    lVar3 = -32000;
    uVar6 = 0;
    sVar8 = 0;
    do {
      fprintf(*(FILE **)((long)__ptr_02 + lVar3 + 32000),(char *)stderr,"%0.2lf ");
      if ((ushort)((uVar6 / 5 & 0xfffc) * 5 + sVar8) == 0) {
        fputc(10,stderr);
      }
      sVar8 = sVar8 + -1;
      uVar6 = uVar6 + 1;
      lVar3 = lVar3 + 8;
    } while (lVar3 != 0);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  return 0;
}

