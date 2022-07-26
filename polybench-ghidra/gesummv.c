
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



void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     ulong *param_6)

{
  ulong uVar1;
  double *pdVar2;
  ulong uVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  double dVar10;
  double dVar11;
  long local_68;
  undefined4 local_60;
  undefined4 local_5c;
  ulong local_58;
  ulong local_50;
  long local_48;
  long local_40;
  long local_38;
  
  uVar1 = *param_6;
  pdVar2 = (double *)param_6[1];
  uVar3 = param_6[2];
  local_50 = param_6[3];
  local_58 = param_6[4];
  local_60 = *param_1;
  local_5c = 0;
  local_68 = param_4;
  local_48 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402020,local_60,0x22,&local_5c,&local_48,&local_68,&local_38,1,1);
  lVar9 = param_4 + -1;
  if (local_68 <= param_4 + -1) {
    lVar9 = local_68;
  }
  if (local_48 <= lVar9) {
    lVar6 = local_48;
    if ((long)uVar1 < 1) {
      do {
        *(double *)(uVar3 + lVar6 * 8) = (double)(int)lVar6 / *pdVar2;
        lVar6 = lVar6 + param_5;
      } while (lVar6 <= lVar9);
    }
    else {
      local_40 = (uVar1 & 0xffffffff) * 8;
      lVar6 = local_48 * (uVar1 & 0xffffffff);
      lVar4 = local_58 + lVar6 * 8 + 8;
      lVar8 = (uVar1 & 0xffffffff) * param_5 * 8;
      lVar7 = local_50 + lVar6 * 8 + 8;
      lVar6 = local_48;
      do {
        dVar10 = (double)(int)lVar6;
        *(double *)(uVar3 + lVar6 * 8) = dVar10 / *pdVar2;
        uVar5 = 0;
        if (uVar1 != 1) {
          do {
            dVar11 = ((double)(int)uVar5 * dVar10) / *pdVar2;
            *(double *)(lVar7 + -8 + uVar5 * 8) = dVar11;
            *(double *)(lVar4 + -8 + uVar5 * 8) = dVar11;
            dVar11 = ((double)((int)uVar5 + 1) * dVar10) / *pdVar2;
            *(double *)(lVar7 + uVar5 * 8) = dVar11;
            *(double *)(lVar4 + uVar5 * 8) = dVar11;
            uVar5 = uVar5 + 2;
          } while ((uVar1 & 0xfffffffffffffffe) != uVar5);
        }
        if ((uVar1 & 1) != 0) {
          dVar10 = (dVar10 * (double)(int)uVar5) / *pdVar2;
          *(double *)(local_50 + lVar6 * local_40 + uVar5 * 8) = dVar10;
          *(double *)(lVar6 * local_40 + local_58 + uVar5 * 8) = dVar10;
        }
        lVar6 = lVar6 + param_5;
        lVar4 = lVar4 + lVar8;
        lVar7 = lVar7 + lVar8;
      } while (lVar6 <= lVar9);
    }
  }
  local_68 = lVar9;
  __kmpc_for_static_fini(&DAT_00402020,local_60);
  return;
}


