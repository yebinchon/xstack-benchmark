
int main(int argc,char **argv)

{
  double dVar1;
  double dVar2;
  double dVar3;
  double dVar4;
  double dVar5;
  uint uVar6;
  long lVar7;
  void *__ptr;
  void *__s;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  void *pvVar8;
  long lVar9;
  short sVar10;
  int iVar11;
  long lVar12;
  double dVar13;
  int local_48;
  void *local_38;
  
  lVar12 = 0;
  lVar7 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc(12800000000);
  __s = malloc(320000);
  __ptr_00 = malloc(320000);
  __ptr_01 = malloc(320000);
  __ptr_02 = malloc(320000);
  dVar1 = DAT_00402008;
  do {
    iVar11 = (int)lVar12;
    *(double *)((long)__ptr_01 + lVar12 * 8) = (double)iVar11 * dVar1;
    *(double *)((long)__ptr_01 + lVar12 * 8 + 8) = (double)(iVar11 + 1) * dVar1;
    *(double *)((long)__ptr_01 + lVar12 * 8 + 0x10) = (double)(iVar11 + 2) * dVar1;
    *(double *)((long)__ptr_01 + lVar12 * 8 + 0x18) = (double)(iVar11 + 3) * dVar1;
    *(double *)((long)__ptr_01 + lVar12 * 8 + 0x20) = (double)(iVar11 + 4) * dVar1;
    lVar12 = lVar12 + 5;
  } while (lVar12 != 40000);
  lVar12 = 0;
  local_38 = __ptr_02;
  memset(__s,0,320000);
  pvVar8 = __ptr;
  do {
    *(undefined8 *)((long)__ptr_00 + lVar12 * 8) = 0;
    dVar1 = *(double *)((long)__ptr_02 + lVar12 * 8);
    dVar13 = 0.0;
    lVar9 = 1;
    do {
      dVar2 = *(double *)((long)pvVar8 + lVar9 * 8 + -8);
      dVar3 = *(double *)((long)__ptr_01 + lVar9 * 8 + -8);
      *(double *)((long)__s + lVar9 * 8 + -8) =
           dVar1 * dVar2 + *(double *)((long)__s + lVar9 * 8 + -8);
      dVar4 = *(double *)((long)pvVar8 + lVar9 * 8);
      dVar5 = *(double *)((long)__ptr_01 + lVar9 * 8);
      *(double *)((long)__s + lVar9 * 8) = dVar1 * dVar4 + *(double *)((long)__s + lVar9 * 8);
      dVar13 = dVar4 * dVar5 + dVar2 * dVar3 + dVar13;
      lVar9 = lVar9 + 2;
    } while (lVar9 != 0x9c41);
    *(double *)((long)__ptr_00 + lVar12 * 8) = dVar13;
    lVar12 = lVar12 + 1;
    pvVar8 = (void *)((long)pvVar8 + 320000);
  } while (lVar12 != 40000);
  local_48 = (int)lVar7;
  if (local_48 == 1) {
    lVar7 = -320000;
    uVar6 = 0;
    sVar10 = 0;
    do {
      fprintf(*(FILE **)((long)__s + lVar7 + 320000),(char *)stderr,"%0.2lf ");
      if ((ushort)(((ushort)((uVar6 & 0xffff) / 5) & 0xfffc) * 5 + sVar10) == 0) {
        fputc(10,stderr);
      }
      sVar10 = sVar10 + -1;
      uVar6 = uVar6 + 1;
      lVar7 = lVar7 + 8;
    } while (lVar7 != 0);
    lVar7 = -320000;
    uVar6 = 0;
    sVar10 = 0;
    do {
      fprintf(*(FILE **)((long)__ptr_00 + lVar7 + 320000),(char *)stderr,"%0.2lf ");
      if ((ushort)(((ushort)((uVar6 & 0xffff) / 5) & 0xfffc) * 5 + sVar10) == 0) {
        fputc(10,stderr);
      }
      sVar10 = sVar10 + -1;
      uVar6 = uVar6 + 1;
      lVar7 = lVar7 + 8;
    } while (lVar7 != 0);
    fputc(10,stderr);
  }
  free(__ptr);
  free(__s);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  return 0;
}



void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     long *param_6)

{
  undefined4 uVar1;
  long lVar2;
  double dVar3;
  double dVar4;
  long lVar5;
  int iVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  double dVar10;
  long local_48;
  undefined4 local_3c;
  long local_38;
  long local_30;
  
  lVar8 = *param_6;
  lVar2 = param_6[1];
  uVar1 = *param_1;
  local_3c = 0;
  local_48 = param_4;
  local_38 = param_3;
  local_30 = param_5;
  __kmpc_for_static_init_8(&DAT_00402020,uVar1,0x22,&local_3c,&local_38,&local_48,&local_30,1,1);
  dVar4 = DAT_00402010;
  dVar3 = DAT_00402008;
  lVar7 = param_4 + -1;
  if (local_48 <= param_4 + -1) {
    lVar7 = local_48;
  }
  if (local_38 <= lVar7) {
    lVar8 = lVar8 + local_38 * 320000;
    lVar5 = local_38;
    do {
      dVar10 = (double)(int)lVar5;
      *(double *)(lVar2 + lVar5 * 8) = dVar10 * dVar3;
      iVar6 = 2;
      lVar9 = 1;
      do {
        *(double *)(lVar8 + -8 + lVar9 * 8) = ((double)(int)lVar9 * dVar10) / dVar4;
        *(double *)(lVar8 + lVar9 * 8) = ((double)iVar6 * dVar10) / dVar4;
        iVar6 = iVar6 + 2;
        lVar9 = lVar9 + 2;
      } while (lVar9 != 0x9c41);
      lVar5 = lVar5 + param_5;
      lVar8 = lVar8 + param_5 * 320000;
    } while (lVar5 <= lVar7);
  }
  local_48 = lVar7;
  __kmpc_for_static_fini(&DAT_00402020,uVar1);
  return;
}


