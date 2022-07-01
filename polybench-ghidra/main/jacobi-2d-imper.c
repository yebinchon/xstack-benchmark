
int main(int argc,char **argv)

{
  double dVar1;
  double dVar2;
  int iVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  void *__ptr;
  void *__ptr_00;
  ulong uVar7;
  void *pvVar8;
  size_t __size;
  void *pvVar9;
  ulong uVar10;
  ulong uVar11;
  int tsteps;
  int dump_code;
  int local_a0;
  int local_80;
  int local_6c;
  long local_68;
  void *local_60;
  void *local_58;
  int local_4c;
  long local_48;
  void *local_40;
  void *local_38;
  
  lVar4 = strtol(argv[1],(char **)0x0,10);
  uVar5 = strtol(argv[2],(char **)0x0,10);
  lVar6 = strtol(argv[3],(char **)0x0,10);
  iVar3 = (int)uVar5;
  __size = (ulong)(uint)(iVar3 * iVar3) << 3;
  __ptr = malloc(__size);
  __ptr_00 = malloc(__size);
  dVar2 = DAT_00402010;
  dVar1 = DAT_00402008;
  uVar11 = uVar5 & 0xffffffff;
  if (0 < iVar3) {
    uVar7 = 0;
    pvVar8 = __ptr;
    pvVar9 = __ptr_00;
    do {
      uVar10 = 0;
      do {
        *(double *)((long)pvVar8 + uVar10 * 8) =
             ((double)((int)uVar10 + 2) * (double)(int)uVar7 + dVar1) / (double)iVar3;
        *(double *)((long)pvVar9 + uVar10 * 8) =
             ((double)((int)uVar10 + 3) * (double)(int)uVar7 + dVar2) / (double)iVar3;
        uVar10 = uVar10 + 1;
      } while (uVar11 != uVar10);
      uVar7 = uVar7 + 1;
      pvVar9 = (void *)((long)pvVar9 + uVar11 * 8);
      pvVar8 = (void *)((long)pvVar8 + uVar11 * 8);
    } while (uVar7 != uVar11);
  }
  if ((-1 < iVar3) && (local_a0 = (int)lVar6, 0 < local_a0)) {
    lVar6 = 0;
    do {
      local_6c = iVar3;
      local_68 = lVar6;
      local_60 = __ptr;
      local_58 = __ptr_00;
      local_4c = iVar3;
      local_48 = lVar6;
      local_40 = __ptr_00;
      local_38 = __ptr;
                      );
      lVar6 = lVar6 + 1;
    } while (local_a0 != lVar6);
  }
  local_80 = (int)lVar4;
  if (local_80 == 1) {
    if (0 < iVar3) {
      lVar4 = 0;
      uVar7 = 0;
      pvVar8 = __ptr;
      do {
        uVar10 = 0;
        do {
          fprintf(*(FILE **)((long)pvVar8 + uVar10 * 8),(char *)stderr,"%0.2lf ");
          iVar3 = (int)lVar4 + (int)uVar10;
          if ((iVar3 * -0x33333333 + 0x19999998U >> 2 | iVar3 * 0x40000000) < 0xccccccd) {
            fputc(10,stderr);
          }
          uVar10 = uVar10 + 1;
        } while (uVar11 != uVar10);
        uVar7 = uVar7 + 1;
        lVar4 = lVar4 + uVar5;
        pvVar8 = (void *)((long)pvVar8 + uVar11 * 8);
      } while (uVar7 != uVar11);
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  return 0;
}


