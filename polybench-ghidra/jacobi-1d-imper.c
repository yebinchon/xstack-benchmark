
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int main(int argc,char **argv)

{
  double dVar1;
  undefined auVar2 [16];
  long lVar3;
  double *__ptr;
  void *__ptr_00;
  long lVar4;
  ushort uVar5;
  short sVar6;
  int iVar7;
  int iVar8;
  double dVar9;
  double dVar11;
  undefined auVar12 [16];
  double dVar10;
  
  lVar4 = 0;
  lVar3 = strtol(argv[1],(char **)0x0,10);
  __ptr = (double *)malloc(80000);
  __ptr_00 = malloc(80000);
  auVar2 = _DAT_00402040;
  iVar7 = 0;
  iVar8 = 1;
  do {
    auVar12 = divpd(CONCAT88((double)iVar8 + 2.0,(double)iVar7 + 2.0),auVar2);
    *(undefined (*) [16])(__ptr + lVar4) = auVar12;
    auVar12 = divpd(CONCAT88((double)iVar8 + 3.0,(double)iVar7 + 3.0),auVar2);
    *(undefined (*) [16])((long)__ptr_00 + lVar4 * 8) = auVar12;
    lVar4 = lVar4 + 2;
    iVar7 = iVar7 + 2;
    iVar8 = iVar8 + 2;
  } while (lVar4 != 10000);
  dVar1 = *__ptr;
  iVar7 = 0;
  do {
    dVar11 = __ptr[1];
    lVar4 = 3;
    dVar10 = dVar1;
    do {
      dVar9 = dVar10 + dVar11;
      dVar10 = __ptr[lVar4 + -1];
      *(double *)((long)__ptr_00 + lVar4 * 8 + -0x10) = (dVar9 + dVar10) * 0.33333;
      dVar9 = dVar11 + dVar10;
      dVar11 = __ptr[lVar4];
      *(double *)((long)__ptr_00 + lVar4 * 8 + -8) = (dVar9 + dVar11) * 0.33333;
      lVar4 = lVar4 + 2;
    } while (lVar4 != 0x2711);
    memcpy(__ptr + 1,(void *)((long)__ptr_00 + 8),0x13870);
    iVar7 = iVar7 + 1;
  } while (iVar7 != 100);
  if ((int)lVar3 == 1) {
    lVar3 = 8;
    uVar5 = 0;
    sVar6 = 0;
    while( true ) {
      fprintf(stderr,"%0.2lf ");
      if ((ushort)((uVar5 / 5 & 0xfffc) * 5 + sVar6) == 0) {
        fputc(10,stderr);
      }
      if (lVar3 == 80000) break;
      lVar3 = lVar3 + 8;
      sVar6 = sVar6 + -1;
      uVar5 = uVar5 + 1;
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  return 0;
}

