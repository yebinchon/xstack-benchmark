
int main(int argc,char **argv)

{
  long lVar1;
  double dVar2;
  double dVar3;
  ulong uVar4;
  long lVar5;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  long lVar6;
  void *pvVar7;
  size_t __size;
  long lVar8;
  void *pvVar9;
  long lVar10;
  uint uVar11;
  ulong uVar12;
  double dVar13;
  double dVar14;
  double dVar15;
  double dVar16;
  int local_68;
  double local_60;
  double *local_50;
  void *local_48;
  void *local_40;
  void *local_38;
  
  uVar4 = strtol(argv[2],(char **)0x0,10);
  lVar5 = strtol(argv[1],(char **)0x0,10);
  uVar11 = (uint)uVar4;
  __size = (ulong)(uVar11 * uVar11) << 3;
  __ptr = malloc(__size);
  __ptr_00 = malloc(__size);
  __ptr_01 = malloc((long)(int)uVar11 << 3);
  __ptr_02 = malloc((long)(int)uVar11 << 3);
  if (0 < (int)uVar11) {
    uVar12 = uVar4 & 0xffffffff;
    dVar13 = (double)uVar11;
    if ((uVar4 & 0xffffffff80000000) == 0) {
      local_50 = &local_60;
      local_60 = dVar13;
      local_48 = __ptr_01;
      local_40 = __ptr;
      local_38 = __ptr_00;
      dVar14 = DAT_00402010;
      dVar13 = DAT_00402008;
      if (uVar4 != 0) {
        lVar6 = 0;
        pvVar7 = __ptr;
        pvVar9 = __ptr_00;
        do {
          *(undefined8 *)((long)__ptr_02 + lVar6 * 8) = 0;
          dVar15 = 0.0;
          dVar16 = 0.0;
          lVar10 = 0;
          do {
            dVar2 = *(double *)((long)__ptr_01 + lVar10 * 8);
            dVar15 = dVar15 + *(double *)((long)pvVar9 + lVar10 * 8) * dVar2;
            dVar16 = dVar16 + dVar2 * *(double *)((long)pvVar7 + lVar10 * 8);
            lVar10 = lVar10 + 1;
          } while (lVar10 < (long)uVar4);
          *(double *)((long)__ptr_02 + lVar6 * 8) = dVar15 * dVar14 + dVar16 * dVar13;
          lVar6 = lVar6 + 1;
          pvVar9 = (void *)((long)pvVar9 + uVar12 * 8);
          pvVar7 = (void *)((long)pvVar7 + uVar12 * 8);
        } while (lVar6 < (long)uVar4);
      }
    }
    else {
      lVar6 = (long)__ptr + 8;
      lVar1 = uVar12 * 8;
      lVar10 = (long)__ptr_00 + 8;
      uVar4 = 0;
      do {
        dVar14 = (double)(int)uVar4;
        *(double *)((long)__ptr_01 + uVar4 * 8) = dVar14 / dVar13;
        lVar8 = 0;
        if (uVar12 != 1) {
          do {
            dVar15 = ((double)(int)lVar8 * dVar14) / dVar13;
            *(double *)(lVar6 + -8 + lVar8 * 8) = dVar15;
            *(double *)(lVar10 + -8 + lVar8 * 8) = dVar15;
            dVar15 = ((double)((int)lVar8 + 1) * dVar14) / dVar13;
            *(double *)(lVar6 + lVar8 * 8) = dVar15;
            *(double *)(lVar10 + lVar8 * 8) = dVar15;
            lVar8 = lVar8 + 2;
          } while (uVar12 - (uVar11 & 1) != lVar8);
        }
        if ((ulong)(uVar11 & 1) != 0) {
          dVar14 = (dVar14 * (double)(int)lVar8) / dVar13;
          *(double *)((long)__ptr + lVar8 * 8 + uVar4 * uVar12 * 8) = dVar14;
          *(double *)((long)__ptr_00 + lVar8 * 8 + uVar4 * uVar12 * 8) = dVar14;
        }
        dVar15 = DAT_00402010;
        dVar14 = DAT_00402008;
        uVar4 = uVar4 + 1;
        lVar6 = lVar6 + lVar1;
        lVar10 = lVar10 + lVar1;
      } while (uVar4 != uVar12);
      lVar6 = (long)__ptr + 8;
      lVar10 = (long)__ptr_00 + 8;
      uVar4 = 0;
      do {
        *(undefined8 *)((long)__ptr_02 + uVar4 * 8) = 0;
        if (uVar12 == 1) {
          dVar13 = 0.0;
          dVar16 = 0.0;
          lVar8 = 0;
        }
        else {
          dVar13 = 0.0;
          dVar16 = 0.0;
          lVar8 = 0;
          do {
            dVar2 = *(double *)((long)__ptr_01 + lVar8 * 8);
            dVar3 = *(double *)((long)__ptr_01 + lVar8 * 8 + 8);
            dVar13 = dVar3 * *(double *)(lVar10 + lVar8 * 8) +
                     *(double *)(lVar10 + -8 + lVar8 * 8) * dVar2 + dVar13;
            dVar16 = *(double *)(lVar6 + lVar8 * 8) * dVar3 +
                     dVar2 * *(double *)(lVar6 + -8 + lVar8 * 8) + dVar16;
            lVar8 = lVar8 + 2;
          } while (uVar12 - (uVar11 & 1) != lVar8);
        }
        if ((ulong)(uVar11 & 1) != 0) {
          dVar2 = *(double *)((long)__ptr_01 + lVar8 * 8);
          dVar13 = dVar13 + *(double *)((long)__ptr_00 + lVar8 * 8 + uVar4 * uVar12 * 8) * dVar2;
          dVar16 = dVar16 + dVar2 * *(double *)((long)__ptr + lVar8 * 8 + uVar4 * uVar12 * 8);
        }
        *(double *)((long)__ptr_02 + uVar4 * 8) = dVar13 * dVar15 + dVar16 * dVar14;
        uVar4 = uVar4 + 1;
        lVar6 = lVar6 + lVar1;
        lVar10 = lVar10 + lVar1;
      } while (uVar4 != uVar12);
    }
    local_68 = (int)lVar5;
    if (local_68 == 1) {
      uVar4 = 0;
      do {
        while (fprintf(*(FILE **)((long)__ptr_02 + uVar4 * 8),(char *)stderr,"%0.2lf "),
              (int)uVar4 == (int)((uVar4 & 0xffffffff) / 0x14) * 0x14) {
          fputc(10,stderr);
          uVar4 = uVar4 + 1;
          if (uVar12 == uVar4) goto LAB_00401328;
        }
        uVar4 = uVar4 + 1;
      } while (uVar12 != uVar4);
    }
  }
LAB_00401328:
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  return 0;
}


