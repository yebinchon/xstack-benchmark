
int main(int argc,char **argv)

{
  double dVar1;
  double dVar2;
  double dVar3;
  double dVar4;
  double dVar5;
  double dVar6;
  long lVar7;
  undefined (*__ptr) [16];
  undefined (*__ptr_00) [16];
  undefined (*__ptr_01) [16];
  double dVar8;
  double dVar9;
  
  lVar7 = strtol(argv[1],(char **)0x0,10);
  __ptr = (undefined (*) [16])malloc(0x48);
  __ptr_00 = (undefined (*) [16])malloc(0x18);
  __ptr_01 = (undefined (*) [16])malloc(0x18);
  *__ptr_01 = ZEXT816(0);
  *(undefined8 *)__ptr_01[1] = 0;
  __ptr[1] = ZEXT816(0);
  *__ptr = ZEXT816(0);
  *(undefined4 *)__ptr[2] = 0x55555555;
  *(undefined4 *)(__ptr[2] + 4) = 0x3fd55555;
  *(undefined4 *)(__ptr[2] + 8) = 0x55555555;
  *(undefined4 *)(__ptr[2] + 0xc) = 0x3fed5555;
  __ptr[3] = CONCAT412(0x3fe55555,ZEXT412(0x55555555) << 0x40);
  *(undefined8 *)__ptr[4] = 0x3ffeaaaaaaaaaaaa;
  *(undefined8 *)*__ptr_01 = 0;
  *(undefined (*) [16])(*__ptr_01 + 8) =
       CONCAT88(*(double *)__ptr[4] * 12313.0 * 0.125 +
                *(double *)(__ptr[2] + 8) * 12313.0 * 0.0 +
                *(double *)__ptr[1] * 12313.0 * 0.0 + *(double *)__ptr_01[1],
                *(double *)(__ptr[3] + 8) * 12313.0 * 0.125 +
                *(double *)__ptr[2] * 12313.0 * 0.0 +
                *(double *)(*__ptr + 8) * 12313.0 * 0.0 + *(double *)(*__ptr_01 + 8));
  dVar8 = *(double *)*__ptr_01 + 0.0;
  dVar9 = *(double *)(*__ptr_01 + 8) + 0.0;
  *__ptr_01 = CONCAT88(dVar9,dVar8);
  dVar6 = *(double *)__ptr_01[1] + 0.1111111111111111;
  *__ptr_00 = ZEXT816(0);
  dVar1 = *(double *)*__ptr;
  dVar2 = *(double *)(*__ptr + 8);
  dVar3 = *(double *)(__ptr[1] + 8);
  dVar4 = *(double *)__ptr[3];
  dVar5 = *(double *)__ptr[1];
  *(undefined8 *)__ptr_00[1] = 0;
  *(double *)__ptr_01[1] = dVar6;
  *(double *)*__ptr_00 =
       dVar5 * 43532.0 * dVar6 + dVar2 * 43532.0 * dVar9 + dVar1 * 43532.0 * dVar8 + 0.0;
  *(double *)(*__ptr_00 + 8) =
       *(double *)(__ptr[2] + 8) * 43532.0 * dVar6 +
       *(double *)__ptr[2] * 43532.0 * dVar9 + dVar3 * 43532.0 * dVar8 + *(double *)(*__ptr_00 + 8);
  *(double *)__ptr_00[1] =
       *(double *)__ptr[4] * 43532.0 * dVar6 +
       *(double *)(__ptr[3] + 8) * 43532.0 * dVar9 +
       dVar4 * 43532.0 * dVar8 + *(double *)__ptr_00[1];
  if ((int)lVar7 == 1) {
    fprintf((int)*(undefined8 *)*__ptr_00,(char *)stderr,"%0.2lf ");
    fputc(10,stderr);
    fprintf((int)*(undefined8 *)(*__ptr_00 + 8),(char *)stderr,"%0.2lf ");
    fprintf((int)*(undefined8 *)__ptr_00[1],(char *)stderr,"%0.2lf ");
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  return 0;
}

