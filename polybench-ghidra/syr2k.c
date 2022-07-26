
int main(int argc,char **argv)

{
  int iVar1;
  long lVar2;
  ulong uVar3;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  ulong uVar4;
  ulong uVar5;
  size_t __size;
  void *pvVar6;
  ulong uVar7;
  int local_e0;
  long local_d8;
  double local_c0;
  ulong local_b0;
  void *local_a8;
  ulong local_98;
  double *local_90;
  void *local_88;
  ulong local_78;
  double *local_70;
  void *local_68;
  void *local_60;
  long local_58;
  ulong local_50;
  void *local_48;
  void *local_40;
  void *local_38;
  
  lVar2 = strtol(argv[1],(char **)0x0,10);
  uVar3 = strtol(argv[2],(char **)0x0,10);
  local_58 = strtol(argv[3],(char **)0x0,10);
  iVar1 = (int)uVar3;
  __ptr = malloc((ulong)(uint)(iVar1 * iVar1) << 3);
  __size = (long)((int)local_58 * iVar1) << 3;
  __ptr_00 = malloc(__size);
  __ptr_01 = malloc(__size);
  local_c0 = (double)iVar1;
  local_90 = &local_c0;
  local_78 = uVar3;
  local_70 = local_90;
  local_68 = __ptr_00;
  local_60 = __ptr_01;
  local_98 = uVar3;
  local_88 = __ptr;
  local_b0 = uVar3;
  local_a8 = __ptr;
  local_50 = uVar3;
  local_48 = __ptr;
  local_40 = __ptr_00;
  local_38 = __ptr_01;
  local_e0 = (int)lVar2;
  if (local_e0 == 1) {
    uVar4 = uVar3 & 0xffffffff;
    local_d8 = 0;
    uVar5 = 0;
    pvVar6 = __ptr;
    do {
      uVar7 = 0;
      do {
        fprintf(*(FILE **)((long)pvVar6 + uVar7 * 8),(char *)stderr,"%0.2lf ");
        iVar1 = (int)local_d8 + (int)uVar7;
        if ((iVar1 * -0x33333333 + 0x19999998U >> 2 | iVar1 * 0x40000000) < 0xccccccd) {
          fputc(10,stderr);
        }
        uVar7 = uVar7 + 1;
      } while (uVar4 != uVar7);
      uVar5 = uVar5 + 1;
      local_d8 = local_d8 + uVar3;
      pvVar6 = (void *)((long)pvVar6 + uVar4 * 8);
    } while (uVar5 != uVar4);
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  return 0;
}



void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     ulong *param_6)

{
  ulong uVar1;
  double *pdVar2;
  long lVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  double dVar10;
  double dVar11;
  long local_60;
  undefined4 local_58;
  undefined4 local_54;
  ulong local_50;
  ulong local_48;
  long local_40;
  long local_38;
  
  uVar1 = *param_6;
  pdVar2 = (double *)param_6[2];
  local_48 = param_6[3];
  local_50 = param_6[4];
  local_58 = *param_1;
  local_54 = 0;
  local_60 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402030,local_58,0x22,&local_54,&local_40,&local_60,&local_38,1,1);
  lVar9 = param_4 + -1;
  if (local_60 <= param_4 + -1) {
    lVar9 = local_60;
  }
  if (local_40 <= lVar9) {
    lVar6 = local_40;
    if ((long)uVar1 < 1) {
      do {
        lVar6 = lVar6 + param_5;
      } while (lVar6 <= lVar9);
    }
    else {
      lVar6 = local_40 * (uVar1 & 0xffffffff);
      lVar3 = local_50 + lVar6 * 8 + 8;
      lVar8 = (uVar1 & 0xffffffff) * param_5 * 8;
      lVar7 = local_48 + lVar6 * 8 + 8;
      lVar6 = local_40;
      do {
        dVar10 = (double)(int)lVar6;
        uVar5 = 0;
        if (uVar1 != 1) {
          do {
            dVar11 = ((double)(int)uVar5 * dVar10) / *pdVar2;
            *(double *)(lVar7 + -8 + uVar5 * 8) = dVar11;
            *(double *)(lVar3 + -8 + uVar5 * 8) = dVar11;
            dVar11 = ((double)((int)uVar5 + 1) * dVar10) / *pdVar2;
            *(double *)(lVar7 + uVar5 * 8) = dVar11;
            *(double *)(lVar3 + uVar5 * 8) = dVar11;
            uVar5 = uVar5 + 2;
          } while ((uVar1 & 0xfffffffffffffffe) != uVar5);
        }
        if ((uVar1 & 1) != 0) {
          lVar4 = lVar6 * (uVar1 & 0xffffffff) * 8;
          dVar10 = (dVar10 * (double)(int)uVar5) / *pdVar2;
          *(double *)(local_48 + lVar4 + uVar5 * 8) = dVar10;
          *(double *)(lVar4 + local_50 + uVar5 * 8) = dVar10;
        }
        lVar6 = lVar6 + param_5;
        lVar3 = lVar3 + lVar8;
        lVar7 = lVar7 + lVar8;
      } while (lVar6 <= lVar9);
    }
  }
  local_60 = lVar9;
  __kmpc_for_static_fini(&DAT_00402030,local_58);
  return;
}



void main_polly_subfn_4(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long param_6)

{
  undefined4 uVar1;
  ulong uVar2;
  double *pdVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  double dVar9;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  uVar2 = *(ulong *)(param_6 + 8);
  pdVar3 = *(double **)(param_6 + 0x10);
  lVar4 = *(long *)(param_6 + 0x18);
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402048,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  lVar7 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar7 = local_50;
  }
  if (local_40 <= lVar7) {
    lVar5 = local_40;
    if ((long)uVar2 < 1) {
      do {
        lVar5 = lVar5 + param_5;
      } while (lVar5 <= lVar7);
    }
    else {
      lVar6 = local_40 * (uVar2 & 0xffffffff) * 8 + 8 + lVar4;
      do {
        dVar9 = (double)(int)lVar5;
        uVar8 = 0;
        if (uVar2 != 1) {
          do {
            *(double *)(lVar6 + -8 + uVar8 * 8) = ((double)(int)uVar8 * dVar9) / *pdVar3;
            *(double *)(lVar6 + uVar8 * 8) = ((double)((int)uVar8 + 1) * dVar9) / *pdVar3;
            uVar8 = uVar8 + 2;
          } while ((uVar2 & 0xfffffffffffffffe) != uVar8);
        }
        if ((uVar2 & 1) != 0) {
          *(double *)(lVar5 * (uVar2 & 0xffffffff) * 8 + lVar4 + uVar8 * 8) =
               (dVar9 * (double)(int)uVar8) / *pdVar3;
        }
        lVar5 = lVar5 + param_5;
        lVar6 = lVar6 + (uVar2 & 0xffffffff) * param_5 * 8;
      } while (lVar5 <= lVar7);
    }
  }
  local_50 = lVar7;
  __kmpc_for_static_fini(&DAT_00402048,uVar1);
  return;
}


void main_polly_subfn_7(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long param_6)

{
  ulong uVar1;
  double *pdVar2;
  double *pdVar3;
  double *pdVar4;
  double *pdVar5;
  ulong uVar6;
  double dVar7;
  double dVar8;
  double dVar9;
  ulong uVar10;
  double dVar11;
  double dVar12;
  double dVar13;
  long lVar14;
  long lVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  ulong uVar19;
  ulong uVar20;
  ulong uVar21;
  long lVar22;
  long local_58;
  undefined4 local_50;
  undefined4 local_4c;
  long local_48;
  long local_40;
  long local_38;
  
  uVar6 = *(ulong *)(param_6 + 8);
  local_48 = *(long *)(param_6 + 0x10);
  local_50 = *param_1;
  local_4c = 0;
  local_58 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402060,local_50,0x22,&local_4c,&local_40,&local_58,&local_38,1,1);
  dVar13 = DAT_00402020;
  dVar12 = _UNK_00402018;
  dVar11 = _DAT_00402010;
  lVar22 = param_4 + -1;
  if (local_58 <= param_4 + -1) {
    lVar22 = local_58;
  }
  if (local_40 <= lVar22) {
    lVar18 = local_40;
    if ((long)uVar6 < 1) {
      do {
        lVar18 = lVar18 + param_5;
      } while (lVar18 <= lVar22);
    }
    else {
      uVar21 = uVar6 - 4 >> 2;
      uVar1 = uVar21 + 1;
      lVar18 = local_40 * (uVar6 & 0xffffffff);
      lVar16 = local_48 + lVar18 * 8 + 0x30;
      lVar15 = (uVar6 & 0xffffffff) * param_5 * 8;
      lVar18 = local_48 + lVar18 * 8;
      lVar14 = local_40;
      do {
        uVar19 = 0;
        uVar20 = uVar1 & 0xfffffffffffffffe;
        uVar10 = uVar21;
        if (uVar6 < 4) goto LAB_00401930;
        while (uVar10 != 0) {
          pdVar3 = (double *)(lVar16 + -0x30 + uVar19 * 8);
          pdVar4 = (double *)(lVar16 + -0x20 + uVar19 * 8);
          dVar7 = pdVar4[1];
          pdVar5 = (double *)(lVar16 + -0x10 + uVar19 * 8);
          dVar8 = pdVar5[1];
          pdVar2 = (double *)(lVar16 + uVar19 * 8);
          dVar9 = pdVar2[1];
          *(undefined (*) [16])(lVar16 + -0x30 + uVar19 * 8) =
               CONCAT88(pdVar3[1] * dVar12,*pdVar3 * dVar11);
          *(undefined (*) [16])(lVar16 + -0x20 + uVar19 * 8) =
               CONCAT88(dVar7 * dVar12,*pdVar4 * dVar11);
          *(undefined (*) [16])(lVar16 + -0x10 + uVar19 * 8) =
               CONCAT88(dVar8 * dVar12,*pdVar5 * dVar11);
          *(undefined (*) [16])(lVar16 + uVar19 * 8) = CONCAT88(dVar9 * dVar12,*pdVar2 * dVar11);
          uVar19 = uVar19 + 8;
          uVar20 = uVar20 - 2;
          uVar10 = uVar20;
        }
        uVar20 = uVar6 & 0xfffffffffffffffc;
        if ((uVar1 & 1) != 0) {
          lVar17 = lVar14 * (uVar6 & 0xffffffff) * 8 + local_48;
          pdVar2 = (double *)(lVar17 + uVar19 * 8);
          pdVar3 = (double *)(lVar17 + 0x10 + uVar19 * 8);
          dVar7 = pdVar3[1];
          *(undefined (*) [16])(lVar17 + uVar19 * 8) = CONCAT88(pdVar2[1] * dVar12,*pdVar2 * dVar11)
          ;
          *(undefined (*) [16])(lVar17 + 0x10 + uVar19 * 8) =
               CONCAT88(dVar7 * dVar12,*pdVar3 * dVar11);
        }
        while (uVar19 = uVar20, uVar6 != uVar19) {
LAB_00401930:
          *(double *)(lVar18 + uVar19 * 8) = *(double *)(lVar18 + uVar19 * 8) * dVar13;
          uVar20 = uVar19 + 1;
        }
        lVar14 = lVar14 + param_5;
        lVar16 = lVar16 + lVar15;
        lVar18 = lVar18 + lVar15;
      } while (lVar14 <= lVar22);
    }
  }
  local_58 = lVar22;
  __kmpc_for_static_fini(&DAT_00402060,local_50);
  return;
}



void main_polly_subfn_10(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                        long param_5,ulong *param_6)

{
  long lVar1;
  ulong uVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  ulong uVar6;
  double dVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  ulong uVar11;
  long lVar12;
  ulong uVar13;
  long lVar14;
  long lVar15;
  double dVar16;
  long local_a0;
  undefined4 local_98;
  undefined4 local_94;
  long local_90;
  long local_88;
  long local_80;
  long local_78;
  ulong local_70;
  long local_68;
  long local_60;
  long local_58;
  long local_50;
  long local_48;
  ulong local_40;
  long local_38;
  
  uVar2 = *param_6;
  uVar3 = param_6[1];
  uVar4 = param_6[2];
  uVar5 = param_6[3];
  uVar6 = param_6[4];
  local_98 = *param_1;
  local_94 = 0;
  local_a0 = param_4;
  local_88 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402078,local_98,0x22,&local_94,&local_88,&local_a0,&local_38,1,1);
  dVar7 = DAT_00402028;
  lVar14 = param_4 + -1;
  if (local_a0 <= param_4 + -1) {
    lVar14 = local_a0;
  }
  if (local_88 <= lVar14) {
    lVar8 = local_88;
    if ((long)uVar3 < 1) {
      do {
        lVar8 = lVar8 + param_5;
      } while (lVar8 <= lVar14);
    }
    else {
      local_70 = uVar3 & 0xffffffff;
      lVar10 = (uVar2 & 0xffffffff) * 8;
      local_40 = (ulong)((uint)uVar2 & 1);
      lVar8 = local_88 * (uVar2 & 0xffffffff);
      lVar9 = uVar5 + lVar8 * 8 + 8;
      local_68 = (uVar2 & 0xffffffff) * param_5 * 8;
      local_78 = uVar6 + 8;
      lVar8 = uVar6 + 8 + lVar8 * 8;
      local_80 = uVar5 + 8;
      lVar12 = local_88;
      do {
        local_90 = lVar12;
        if (0 < (long)uVar2) {
          local_50 = uVar5 + local_90 * lVar10;
          local_48 = local_90 * lVar10 + uVar6;
          uVar13 = 0;
          lVar12 = local_80;
          lVar15 = local_78;
          do {
            lVar1 = local_90 * local_70 + uVar13;
            dVar16 = *(double *)(uVar4 + lVar1 * 8);
            if (uVar2 == 1) {
              uVar11 = 0;
            }
            else {
              uVar11 = 0;
              do {
                dVar16 = *(double *)(lVar8 + uVar11 * 8) * dVar7 * *(double *)(lVar12 + uVar11 * 8)
                         + *(double *)(lVar9 + uVar11 * 8) * dVar7 *
                           *(double *)(lVar15 + uVar11 * 8) +
                           *(double *)(lVar8 + -8 + uVar11 * 8) * dVar7 *
                           *(double *)(lVar12 + -8 + uVar11 * 8) +
                           *(double *)(lVar9 + -8 + uVar11 * 8) * dVar7 *
                           *(double *)(lVar15 + -8 + uVar11 * 8) + dVar16;
                uVar11 = uVar11 + 2;
              } while ((uVar2 & 0xfffffffffffffffe) != uVar11);
            }
            if (local_40 != 0) {
              dVar16 = dVar16 + *(double *)(local_50 + uVar11 * 8) * dVar7 *
                                *(double *)(uVar6 + uVar13 * lVar10 + uVar11 * 8) +
                       *(double *)(local_48 + uVar11 * 8) * dVar7 *
                       *(double *)(uVar13 * lVar10 + uVar5 + uVar11 * 8);
            }
            *(double *)(uVar4 + lVar1 * 8) = dVar16;
            uVar13 = uVar13 + 1;
            lVar15 = lVar15 + lVar10;
            lVar12 = lVar12 + lVar10;
          } while (uVar13 != uVar3);
        }
        lVar9 = lVar9 + local_68;
        lVar8 = lVar8 + local_68;
        lVar12 = local_90 + param_5;
        local_60 = lVar14;
        local_58 = param_5;
      } while (local_90 + param_5 <= lVar14);
    }
  }
  local_a0 = lVar14;
  __kmpc_for_static_fini(&DAT_00402078,local_98);
  return;
}


