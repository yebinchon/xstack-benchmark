
int main(int argc,char **argv)

{
  long lVar1;
  ulong uVar2;
  ulong uVar3;
  ulong uVar4;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  uint uVar5;
  ulong uVar6;
  size_t __size;
  ulong uVar7;
  void *pvVar8;
  long lVar9;
  void *pvVar10;
  long lVar11;
  long lVar12;
  ulong uVar13;
  int iVar14;
  double dVar15;
  double dVar16;
  double_0__0__0_ *A;
  int dump_code;
  double_0__0_ *C4;
  double_0__0__0_ *sum;
  int local_98;
  int local_80;
  int local_54;
  uint local_50;
  void *local_48;
  void *local_40;
  void *local_38;
  
  lVar1 = strtol(argv[1],(char **)0x0,10);
  uVar2 = strtol(argv[2],(char **)0x0,10);
  uVar3 = strtol(argv[3],(char **)0x0,10);
  uVar4 = strtol(argv[4],(char **)0x0,10);
  __size = (long)(uVar3 * uVar4 * (uVar2 << 0x20)) >> 0x1d;
  __ptr = malloc(__size);
  __ptr_00 = malloc(__size);
  uVar5 = (uint)uVar4;
  __ptr_01 = malloc((ulong)(uVar5 * uVar5) << 3);
  uVar13 = uVar3 & 0xffffffff;
  uVar4 = uVar4 & 0xffffffff;
  dVar15 = (double)uVar5;
  iVar14 = (int)uVar2;
  local_98 = (int)uVar3;
  if ((0 < iVar14) && (0 < local_98)) {
    lVar11 = (long)__ptr + 8;
    uVar3 = 0;
    do {
      if (0 < (int)uVar5) {
        uVar7 = 0;
        lVar9 = lVar11;
        do {
          dVar16 = (double)(int)uVar7 * (double)(int)uVar3;
          lVar12 = 0;
          if (uVar4 != 1) {
            do {
              *(double *)(lVar9 + -8 + lVar12 * 8) = ((double)(int)lVar12 + dVar16) / dVar15;
              *(double *)(lVar9 + lVar12 * 8) = ((double)((int)lVar12 + 1) + dVar16) / dVar15;
              lVar12 = lVar12 + 2;
            } while (uVar4 - (uVar5 & 1) != lVar12);
          }
          if ((ulong)(uVar5 & 1) != 0) {
            *(double *)((long)__ptr + lVar12 * 8 + uVar7 * uVar4 * 8 + uVar4 * uVar13 * uVar3 * 8) =
                 (dVar16 + (double)(int)lVar12) / dVar15;
          }
          uVar7 = uVar7 + 1;
          lVar9 = lVar9 + uVar4 * 8;
        } while (uVar7 != uVar13);
      }
      uVar3 = uVar3 + 1;
      lVar11 = lVar11 + uVar4 * uVar13 * 8;
    } while (uVar3 != (uVar2 & 0xffffffff));
  }
  if (0 < (int)uVar5) {
    lVar11 = (long)__ptr_01 + 8;
    uVar3 = 0;
    do {
      dVar16 = (double)(int)uVar3;
      lVar9 = 0;
      if (uVar4 != 1) {
        do {
          *(double *)(lVar11 + -8 + lVar9 * 8) = ((double)(int)lVar9 * dVar16) / dVar15;
          *(double *)(lVar11 + lVar9 * 8) = ((double)((int)lVar9 + 1) * dVar16) / dVar15;
          lVar9 = lVar9 + 2;
        } while (uVar4 - (uVar5 & 1) != lVar9);
      }
      if ((ulong)(uVar5 & 1) != 0) {
        *(double *)((long)__ptr_01 + lVar9 * 8 + uVar3 * uVar4 * 8) =
             (dVar16 * (double)(int)lVar9) / dVar15;
      }
      uVar3 = uVar3 + 1;
      lVar11 = lVar11 + uVar4 * 8;
    } while (uVar3 != uVar4);
  }
  local_54 = local_98;
  local_50 = uVar5;
  local_48 = __ptr_00;
  local_40 = __ptr;
  local_38 = __ptr_01;
  local_80 = (int)lVar1;
  if (local_80 == 1) {
    if (0 < iVar14) {
      uVar3 = 0;
      pvVar10 = __ptr;
      do {
        if ((0 < local_98) && (0 < (int)uVar5)) {
          uVar7 = 0;
          pvVar8 = pvVar10;
          do {
            if ((int)uVar3 + (int)((uVar3 & 0xffffffff) / 0x14) * -0x14 == 0) {
              uVar6 = 0;
              do {
                fprintf(*(FILE **)((long)pvVar8 + uVar6 * 8),(char *)stderr,"%0.2lf ");
                fputc(10,stderr);
                uVar6 = uVar6 + 1;
              } while (uVar4 != uVar6);
            }
            else {
              uVar6 = 0;
              do {
                fprintf(*(FILE **)((long)pvVar8 + uVar6 * 8),(char *)stderr,"%0.2lf ");
                uVar6 = uVar6 + 1;
              } while (uVar4 != uVar6);
            }
            uVar7 = uVar7 + 1;
            pvVar8 = (void *)((long)pvVar8 + uVar4 * 8);
          } while (uVar7 != uVar13);
        }
        uVar3 = uVar3 + 1;
        pvVar10 = (void *)((long)pvVar10 + uVar4 * uVar13 * 8);
      } while (uVar3 != (uVar2 & 0xffffffff));
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  return 0;
}


