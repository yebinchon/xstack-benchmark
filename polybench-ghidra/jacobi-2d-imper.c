
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



/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void kernel_jacobi_2d_imper_polly_subfn
               (undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
               long param_6)

{
  double *pdVar1;
  double *pdVar2;
  double *pdVar3;
  double *pdVar4;
  double *pdVar5;
  uint uVar6;
  double dVar7;
  double dVar8;
  double dVar9;
  double dVar10;
  double dVar11;
  double dVar12;
  double dVar13;
  double dVar14;
  double dVar15;
  double dVar16;
  double dVar17;
  double dVar18;
  double dVar19;
  long lVar20;
  long lVar21;
  long lVar22;
  long lVar23;
  long lVar24;
  long lVar25;
  long lVar26;
  ulong uVar27;
  long lVar28;
  long lVar29;
  ulong uVar30;
  long lVar31;
  long lVar32;
  long lVar33;
  long local_60;
  undefined4 local_58;
  undefined4 local_54;
  ulong local_50;
  long local_48;
  long local_40;
  long local_38;
  
  uVar6 = *(uint *)(param_6 + 4);
  uVar27 = (ulong)uVar6;
  lVar29 = *(long *)(param_6 + 0x10);
  lVar32 = *(long *)(param_6 + 0x18);
  local_58 = *param_1;
  local_54 = 0;
  local_60 = param_4;
  local_48 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402030,local_58,0x22,&local_54,&local_48,&local_60,&local_38,1,1);
  dVar19 = _UNK_00402028;
  dVar18 = _DAT_00402020;
  dVar17 = DAT_00402018;
  lVar31 = param_4 + -1;
  if (local_60 <= param_4 + -1) {
    lVar31 = local_60;
  }
  if (local_48 <= lVar31) {
    lVar20 = local_48;
    if ((int)uVar6 < 3) {
      do {
        lVar20 = lVar20 + param_5;
      } while (lVar20 <= lVar31);
    }
    else {
      local_50 = (long)(int)uVar6 - 2;
      uVar30 = local_50 & 0xfffffffffffffffc;
      lVar26 = (local_48 * 8 + 8) * uVar27;
      lVar22 = lVar32 + lVar26 + 0x18;
      lVar28 = param_5 * uVar27 * 8;
      lVar23 = (local_48 * 8 + 0x10) * uVar27;
      lVar20 = lVar23 + lVar29 + 0x18;
      lVar25 = lVar26 + lVar29 + 0x20;
      lVar21 = uVar27 * local_48 * 8 + 0x18 + lVar29;
      lVar33 = uVar27 * local_48 * 8 + lVar29;
      lVar32 = lVar32 + lVar26;
      lVar23 = lVar23 + lVar29;
      lVar26 = lVar26 + lVar29;
      lVar29 = local_48;
      do {
        if (local_50 < 4) {
          uVar27 = 0;
LAB_004016a0:
          lVar24 = uVar27 + 2;
          do {
            *(double *)(lVar32 + -8 + lVar24 * 8) =
                 (*(double *)(lVar26 + -8 + lVar24 * 8) + *(double *)(lVar26 + -0x10 + lVar24 * 8) +
                  *(double *)(lVar26 + lVar24 * 8) + *(double *)(lVar23 + -8 + lVar24 * 8) +
                 *(double *)(lVar33 + -8 + lVar24 * 8)) * dVar17;
            lVar24 = lVar24 + 1;
          } while ((int)uVar6 != lVar24);
        }
        else {
          uVar27 = 0;
          do {
            pdVar1 = (double *)(lVar25 + -0x20 + uVar27 * 8);
            pdVar2 = (double *)(lVar25 + -0x18 + uVar27 * 8);
            pdVar3 = (double *)(lVar25 + -0x10 + uVar27 * 8);
            dVar7 = *pdVar3;
            dVar8 = pdVar3[1];
            pdVar3 = (double *)(lVar25 + -8 + uVar27 * 8);
            dVar9 = *pdVar3;
            dVar10 = pdVar3[1];
            pdVar3 = (double *)(lVar25 + uVar27 * 8);
            dVar11 = *pdVar3;
            dVar12 = pdVar3[1];
            pdVar4 = (double *)(lVar20 + -0x10 + uVar27 * 8);
            pdVar3 = (double *)(lVar20 + uVar27 * 8);
            dVar13 = *pdVar3;
            dVar14 = pdVar3[1];
            pdVar5 = (double *)(lVar21 + -0x10 + uVar27 * 8);
            pdVar3 = (double *)(lVar21 + uVar27 * 8);
            dVar15 = *pdVar3;
            dVar16 = pdVar3[1];
            *(undefined (*) [16])(lVar22 + -0x10 + uVar27 * 8) =
                 CONCAT88((pdVar5[1] + pdVar4[1] + pdVar2[1] + pdVar1[1] + dVar8) * dVar19,
                          (*pdVar5 + *pdVar4 + *pdVar2 + *pdVar1 + dVar7) * dVar18);
            *(undefined (*) [16])(lVar22 + uVar27 * 8) =
                 CONCAT88((dVar16 + dVar14 + dVar12 + dVar10 + dVar8) * dVar19,
                          (dVar15 + dVar13 + dVar11 + dVar9 + dVar7) * dVar18);
            uVar27 = uVar27 + 4;
          } while (uVar30 != uVar27);
          uVar27 = uVar30;
          if (local_50 != uVar30) goto LAB_004016a0;
        }
        lVar29 = lVar29 + param_5;
        lVar22 = lVar22 + lVar28;
        lVar20 = lVar20 + lVar28;
        lVar25 = lVar25 + lVar28;
        lVar21 = lVar21 + lVar28;
        lVar33 = lVar33 + lVar28;
        lVar32 = lVar32 + lVar28;
        lVar23 = lVar23 + lVar28;
        lVar26 = lVar26 + lVar28;
        local_40 = lVar31;
      } while (lVar29 <= lVar31);
    }
  }
  local_60 = lVar31;
  __kmpc_for_static_fini(&DAT_00402030,local_58);
  return;
}



void kernel_jacobi_2d_imper_polly_subfn_4
               (undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
               long param_6)

{
  ulong uVar1;
  long lVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  uint uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  long lVar13;
  long lVar14;
  long lVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  ulong uVar19;
  long lVar20;
  long lVar21;
  long lVar22;
  long lVar23;
  long lVar24;
  long local_80;
  undefined4 local_78;
  undefined4 local_74;
  long local_70;
  ulong local_68;
  ulong local_60;
  ulong local_58;
  ulong local_50;
  long local_48;
  long local_40;
  long local_38;
  
  uVar5 = *(uint *)(param_6 + 4);
  lVar22 = *(long *)(param_6 + 0x10);
  lVar17 = *(long *)(param_6 + 0x18);
  local_78 = *param_1;
  local_74 = 0;
  local_80 = param_4;
  local_70 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402048,local_78,0x22,&local_74,&local_70,&local_80,&local_38,1,1);
  lVar16 = param_4 + -1;
  if (local_80 <= param_4 + -1) {
    lVar16 = local_80;
  }
  if (local_70 <= lVar16) {
    lVar21 = local_70;
    if ((int)uVar5 < 3) {
      do {
        lVar21 = lVar21 + param_5;
      } while (lVar21 <= lVar16);
    }
    else {
      uVar1 = (long)(int)uVar5 - 2;
      local_50 = (long)(int)uVar5 - 6;
      local_68 = (local_50 >> 2) + 1;
      local_58 = uVar1 & 0xfffffffffffffffc;
      local_60 = (ulong)((uint)local_68 & 3);
      local_68 = local_68 & 0xfffffffffffffffc;
      lVar13 = (local_70 * 8 + 8) * (ulong)uVar5;
      lVar15 = lVar22 + lVar13 + 0x78;
      lVar23 = (ulong)uVar5 * param_5 * 8;
      lVar18 = lVar17 + lVar13 + 0x78;
      lVar21 = lVar17 + 0x18 + lVar13;
      lVar24 = lVar22 + 0x18 + lVar13;
      lVar17 = lVar17 + lVar13 + 8;
      lVar13 = lVar22 + lVar13 + 8;
      lVar22 = local_70;
      do {
        if (3 < uVar1) {
          if (local_50 < 0xc) {
            lVar20 = 0;
          }
          else {
            lVar20 = 0;
            uVar19 = local_68;
            do {
              puVar3 = (undefined4 *)(lVar15 + -0x70 + lVar20 * 8);
              uVar6 = puVar3[1];
              uVar7 = puVar3[2];
              uVar8 = puVar3[3];
              puVar4 = (undefined4 *)(lVar15 + -0x60 + lVar20 * 8);
              uVar9 = *puVar4;
              uVar10 = puVar4[1];
              uVar11 = puVar4[2];
              uVar12 = puVar4[3];
              puVar4 = (undefined4 *)(lVar18 + -0x70 + lVar20 * 8);
              *puVar4 = *puVar3;
              puVar4[1] = uVar6;
              puVar4[2] = uVar7;
              puVar4[3] = uVar8;
              puVar3 = (undefined4 *)(lVar18 + -0x60 + lVar20 * 8);
              *puVar3 = uVar9;
              puVar3[1] = uVar10;
              puVar3[2] = uVar11;
              puVar3[3] = uVar12;
              puVar3 = (undefined4 *)(lVar15 + -0x50 + lVar20 * 8);
              uVar6 = puVar3[1];
              uVar7 = puVar3[2];
              uVar8 = puVar3[3];
              puVar4 = (undefined4 *)(lVar15 + -0x40 + lVar20 * 8);
              uVar9 = *puVar4;
              uVar10 = puVar4[1];
              uVar11 = puVar4[2];
              uVar12 = puVar4[3];
              puVar4 = (undefined4 *)(lVar18 + -0x50 + lVar20 * 8);
              *puVar4 = *puVar3;
              puVar4[1] = uVar6;
              puVar4[2] = uVar7;
              puVar4[3] = uVar8;
              puVar3 = (undefined4 *)(lVar18 + -0x40 + lVar20 * 8);
              *puVar3 = uVar9;
              puVar3[1] = uVar10;
              puVar3[2] = uVar11;
              puVar3[3] = uVar12;
              puVar3 = (undefined4 *)(lVar15 + -0x30 + lVar20 * 8);
              uVar6 = puVar3[1];
              uVar7 = puVar3[2];
              uVar8 = puVar3[3];
              puVar4 = (undefined4 *)(lVar15 + -0x20 + lVar20 * 8);
              uVar9 = *puVar4;
              uVar10 = puVar4[1];
              uVar11 = puVar4[2];
              uVar12 = puVar4[3];
              puVar4 = (undefined4 *)(lVar18 + -0x30 + lVar20 * 8);
              *puVar4 = *puVar3;
              puVar4[1] = uVar6;
              puVar4[2] = uVar7;
              puVar4[3] = uVar8;
              puVar3 = (undefined4 *)(lVar18 + -0x20 + lVar20 * 8);
              *puVar3 = uVar9;
              puVar3[1] = uVar10;
              puVar3[2] = uVar11;
              puVar3[3] = uVar12;
              puVar4 = (undefined4 *)(lVar15 + -0x10 + lVar20 * 8);
              uVar6 = puVar4[1];
              uVar7 = puVar4[2];
              uVar8 = puVar4[3];
              puVar3 = (undefined4 *)(lVar15 + lVar20 * 8);
              uVar9 = *puVar3;
              uVar10 = puVar3[1];
              uVar11 = puVar3[2];
              uVar12 = puVar3[3];
              puVar3 = (undefined4 *)(lVar18 + -0x10 + lVar20 * 8);
              *puVar3 = *puVar4;
              puVar3[1] = uVar6;
              puVar3[2] = uVar7;
              puVar3[3] = uVar8;
              puVar3 = (undefined4 *)(lVar18 + lVar20 * 8);
              *puVar3 = uVar9;
              puVar3[1] = uVar10;
              puVar3[2] = uVar11;
              puVar3[3] = uVar12;
              lVar20 = lVar20 + 0x10;
              uVar19 = uVar19 - 4;
            } while (uVar19 != 0);
          }
          uVar19 = local_58;
          if (local_60 == 0) goto joined_r0x00401950;
          lVar2 = lVar21 + lVar20 * 8;
          lVar20 = lVar24 + lVar20 * 8;
          lVar14 = 0;
          do {
            puVar4 = (undefined4 *)(lVar20 + -0x10 + lVar14);
            uVar6 = puVar4[1];
            uVar7 = puVar4[2];
            uVar8 = puVar4[3];
            puVar3 = (undefined4 *)(lVar20 + lVar14);
            uVar9 = *puVar3;
            uVar10 = puVar3[1];
            uVar11 = puVar3[2];
            uVar12 = puVar3[3];
            puVar3 = (undefined4 *)(lVar2 + -0x10 + lVar14);
            *puVar3 = *puVar4;
            puVar3[1] = uVar6;
            puVar3[2] = uVar7;
            puVar3[3] = uVar8;
            puVar3 = (undefined4 *)(lVar2 + lVar14);
            *puVar3 = uVar9;
            puVar3[1] = uVar10;
            puVar3[2] = uVar11;
            puVar3[3] = uVar12;
            lVar14 = lVar14 + 0x20;
            if (local_60 << 5 == lVar14) goto joined_r0x00401950;
          } while( true );
        }
        uVar19 = 0;
        do {
          *(undefined8 *)(lVar17 + uVar19 * 8) = *(undefined8 *)(lVar13 + uVar19 * 8);
          uVar19 = uVar19 + 1;
joined_r0x00401950:
        } while (uVar1 != uVar19);
        lVar22 = lVar22 + param_5;
        lVar15 = lVar15 + lVar23;
        lVar18 = lVar18 + lVar23;
        lVar21 = lVar21 + lVar23;
        lVar24 = lVar24 + lVar23;
        lVar17 = lVar17 + lVar23;
        lVar13 = lVar13 + lVar23;
        local_48 = lVar16;
        local_40 = param_5;
      } while (lVar22 <= lVar16);
    }
  }
  local_80 = lVar16;
  __kmpc_for_static_fini(&DAT_00402048,local_78);
  return;
}


