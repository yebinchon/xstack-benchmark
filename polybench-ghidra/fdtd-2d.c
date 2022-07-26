
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int main(int argc,char **argv)

{
  undefined4 *puVar1;
  double *pdVar2;
  double *pdVar3;
  double *pdVar4;
  double *pdVar5;
  double dVar6;
  double dVar7;
  double dVar8;
  double dVar9;
  undefined auVar10 [16];
  double dVar11;
  double dVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  long lVar15;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  long lVar16;
  void *pvVar17;
  ulong uVar18;
  ulong uVar19;
  int iVar20;
  int iVar21;
  void *pvVar22;
  long lVar23;
  long lVar24;
  long lVar25;
  long lVar26;
  long lVar27;
  long lVar28;
  double dVar29;
  double dVar30;
  undefined extraout_XMM0 [16];
  undefined auVar31 [16];
  double dVar33;
  double dVar34;
  undefined auVar35 [16];
  int local_90;
  int local_88;
  void *local_58;
  void *local_50;
  void *local_40;
  void *local_38;
  undefined auVar32 [16];
  
  lVar23 = 0;
  lVar15 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc(128000000);
  __ptr_00 = malloc(128000000);
  __ptr_01 = malloc(128000000);
  __ptr_02 = malloc(32000);
  do {
    iVar21 = (int)lVar23;
    *(double *)((long)__ptr_02 + lVar23 * 8) = (double)iVar21;
    *(double *)((long)__ptr_02 + lVar23 * 8 + 8) = (double)(iVar21 + 1);
    *(double *)((long)__ptr_02 + lVar23 * 8 + 0x10) = (double)(iVar21 + 2);
    *(double *)((long)__ptr_02 + lVar23 * 8 + 0x18) = (double)(iVar21 + 3);
    *(double *)((long)__ptr_02 + lVar23 * 8 + 0x20) = (double)(iVar21 + 4);
    lVar23 = lVar23 + 5;
  } while (lVar23 != 4000);
  local_58 = __ptr;
  local_50 = __ptr_00;
  lVar23 = 0;
  do {
    puVar1 = (undefined4 *)((long)__ptr_02 + lVar23 * 8);
    uVar13 = *puVar1;
    uVar14 = puVar1[1];
    lVar16 = 0x12;
    do {
      puVar1 = (undefined4 *)((long)__ptr_00 + lVar16 * 8 + -0x90);
      *puVar1 = uVar13;
      puVar1[1] = uVar14;
      puVar1[2] = uVar13;
      puVar1[3] = uVar14;
      puVar1 = (undefined4 *)((long)__ptr_00 + lVar16 * 8 + -0x80);
      *puVar1 = uVar13;
      puVar1[1] = uVar14;
      puVar1[2] = uVar13;
      puVar1[3] = uVar14;
      puVar1 = (undefined4 *)((long)__ptr_00 + lVar16 * 8 + -0x70);
      *puVar1 = uVar13;
      puVar1[1] = uVar14;
      puVar1[2] = uVar13;
      puVar1[3] = uVar14;
      puVar1 = (undefined4 *)((long)__ptr_00 + lVar16 * 8 + -0x60);
      *puVar1 = uVar13;
      puVar1[1] = uVar14;
      puVar1[2] = uVar13;
      puVar1[3] = uVar14;
      puVar1 = (undefined4 *)((long)__ptr_00 + lVar16 * 8 + -0x50);
      *puVar1 = uVar13;
      puVar1[1] = uVar14;
      puVar1[2] = uVar13;
      puVar1[3] = uVar14;
      puVar1 = (undefined4 *)((long)__ptr_00 + lVar16 * 8 + -0x40);
      *puVar1 = uVar13;
      puVar1[1] = uVar14;
      puVar1[2] = uVar13;
      puVar1[3] = uVar14;
      puVar1 = (undefined4 *)((long)__ptr_00 + lVar16 * 8 + -0x30);
      *puVar1 = uVar13;
      puVar1[1] = uVar14;
      puVar1[2] = uVar13;
      puVar1[3] = uVar14;
      puVar1 = (undefined4 *)((long)__ptr_00 + lVar16 * 8 + -0x20);
      *puVar1 = uVar13;
      puVar1[1] = uVar14;
      puVar1[2] = uVar13;
      puVar1[3] = uVar14;
      puVar1 = (undefined4 *)((long)__ptr_00 + lVar16 * 8 + -0x10);
      *puVar1 = uVar13;
      puVar1[1] = uVar14;
      puVar1[2] = uVar13;
      puVar1[3] = uVar14;
      puVar1 = (undefined4 *)((long)__ptr_00 + lVar16 * 8);
      *puVar1 = uVar13;
      puVar1[1] = uVar14;
      puVar1[2] = uVar13;
      puVar1[3] = uVar14;
      lVar16 = lVar16 + 0x14;
    } while (lVar16 != 0xfb2);
    local_40 = __ptr_00;
    local_38 = __ptr_01;
    dVar9 = DAT_00402030;
    dVar8 = _UNK_00402018;
    dVar30 = _DAT_00402010;
    lVar16 = 0;
    pvVar17 = __ptr;
    pvVar22 = __ptr_01;
    auVar32 = extraout_XMM0;
    do {
      lVar25 = lVar16 * 32000;
      auVar32 = CONCAT88(*(undefined8 *)((long)__ptr_01 + lVar25),SUB168(auVar32,0));
      lVar27 = 3;
      do {
        pdVar3 = (double *)((long)pvVar17 + lVar27 * 8 + -0x10);
        pdVar2 = (double *)((long)pvVar17 + lVar27 * 8);
        dVar6 = *pdVar2;
        dVar7 = pdVar2[1];
        auVar10 = *(undefined (*) [16])((long)pvVar22 + lVar27 * 8 + -0x10);
        auVar31 = shufpd(auVar32,auVar10,1);
        auVar32 = *(undefined (*) [16])((long)pvVar22 + lVar27 * 8);
        dVar33 = SUB168(auVar32 >> 0x40,0);
        auVar35 = shufpd(auVar10,auVar32,1);
        dVar29 = pdVar3[1] - (SUB168(auVar10 >> 0x40,0) - SUB168(auVar31 >> 0x40,0)) * dVar8;
        *(undefined (*) [16])((long)pvVar17 + lVar27 * 8 + -0x10) =
             CONCAT412((int)((ulong)dVar29 >> 0x20),
                       CONCAT48(SUB84(dVar29,0),
                                *pdVar3 - (SUB168(auVar10,0) - SUB168(auVar31,0)) * dVar30));
        *(undefined (*) [16])((long)pvVar17 + lVar27 * 8) =
             CONCAT88(dVar7 - (dVar33 - SUB168(auVar35 >> 0x40,0)) * dVar8,
                      dVar6 - (SUB168(auVar32,0) - SUB168(auVar35,0)) * dVar30);
        lVar27 = lVar27 + 4;
      } while (lVar27 != 3999);
      dVar29 = *(double *)((long)__ptr_01 + lVar25 + 0x7ce8);
      dVar6 = *(double *)((long)__ptr_01 + lVar25 + 0x7cf0);
      dVar7 = *(double *)((long)__ptr_01 + lVar25 + 0x7cf8);
      *(double *)((long)__ptr + lVar25 + 0x7ce8) =
           *(double *)((long)__ptr + lVar25 + 0x7ce8) - (dVar29 - dVar33) * dVar9;
      *(double *)((long)__ptr + lVar25 + 0x7cf0) =
           *(double *)((long)__ptr + lVar25 + 0x7cf0) - (dVar6 - dVar29) * dVar9;
      dVar29 = *(double *)((long)__ptr + lVar25 + 0x7cf8) - (dVar7 - dVar6) * dVar9;
      auVar32 = ZEXT816((ulong)dVar29);
      *(double *)((long)__ptr + lVar25 + 0x7cf8) = dVar29;
      dVar7 = DAT_00402038;
      dVar6 = _UNK_00402028;
      dVar29 = _DAT_00402020;
      lVar16 = lVar16 + 1;
      pvVar22 = (void *)((long)pvVar22 + 32000);
      pvVar17 = (void *)((long)pvVar17 + 32000);
    } while (lVar16 != 4000);
    lVar26 = 0;
    lVar16 = (long)__ptr_01 + 0x10;
    lVar25 = (long)__ptr + 0x18;
    lVar27 = (long)__ptr_00 + 0x7d10;
    do {
      lVar28 = lVar26 * 32000;
      auVar32 = CONCAT88(*(undefined8 *)((long)__ptr + lVar28),SUB168(auVar32,0));
      lVar24 = 0;
      do {
        pdVar2 = (double *)(lVar16 + -0x10 + lVar24);
        dVar8 = ((double *)(lVar16 + lVar24))[1];
        auVar10 = *(undefined (*) [16])(lVar25 + -0x10 + lVar24);
        auVar31 = shufpd(auVar32,auVar10,1);
        auVar32 = *(undefined (*) [16])(lVar25 + lVar24);
        dVar34 = SUB168(auVar32 >> 0x40,0);
        auVar35 = shufpd(auVar10,auVar32,1);
        pdVar3 = (double *)(lVar27 + -0x10 + lVar24);
        dVar9 = *(double *)(lVar27 + lVar24);
        dVar33 = ((double *)(lVar27 + lVar24))[1];
        pdVar4 = (double *)(lVar27 + -0x7d10 + lVar24);
        pdVar5 = (double *)(lVar27 + -32000 + lVar24);
        dVar11 = *pdVar5;
        dVar12 = pdVar5[1];
        dVar30 = pdVar2[1] -
                 ((pdVar3[1] + (SUB168(auVar10 >> 0x40,0) - SUB168(auVar31 >> 0x40,0))) - pdVar4[1])
                 * dVar6;
        *(undefined (*) [16])(lVar16 + -0x10 + lVar24) =
             CONCAT412((int)((ulong)dVar30 >> 0x20),
                       CONCAT48(SUB84(dVar30,0),
                                *pdVar2 - ((*pdVar3 + (SUB168(auVar10,0) - SUB168(auVar31,0))) -
                                          *pdVar4) * dVar29));
        *(undefined (*) [16])(lVar16 + lVar24) =
             CONCAT88(dVar8 - ((dVar33 + (dVar34 - SUB168(auVar35 >> 0x40,0))) - dVar12) * dVar6,
                      *(double *)(lVar16 + lVar24) -
                      ((dVar9 + (SUB168(auVar32,0) - SUB168(auVar35,0))) - dVar11) * dVar29);
        lVar24 = lVar24 + 0x20;
      } while (lVar24 != 0x7ce0);
      dVar30 = *(double *)((long)__ptr + lVar28 + 0x7ce8);
      dVar8 = *(double *)((long)__ptr + lVar28 + 0x7cf0);
      dVar9 = *(double *)((long)__ptr + lVar28 + 0x7cf8);
      *(double *)((long)__ptr_01 + lVar28 + 0x7ce0) =
           *(double *)((long)__ptr_01 + lVar28 + 0x7ce0) -
           (((dVar30 - dVar34) + *(double *)((long)__ptr_00 + lVar28 + 0xf9e0)) -
           *(double *)((long)__ptr_00 + lVar28 + 0x7ce0)) * dVar7;
      *(double *)((long)__ptr_01 + lVar28 + 0x7ce8) =
           *(double *)((long)__ptr_01 + lVar28 + 0x7ce8) -
           (((dVar8 - dVar30) + *(double *)((long)__ptr_00 + lVar28 + 0xf9e8)) -
           *(double *)((long)__ptr_00 + lVar28 + 0x7ce8)) * dVar7;
      dVar30 = (((dVar9 - dVar8) + *(double *)((long)__ptr_00 + lVar28 + 0xf9f0)) -
               *(double *)((long)__ptr_00 + lVar28 + 0x7cf0)) * dVar7;
      auVar32 = ZEXT816((ulong)dVar30);
      *(double *)((long)__ptr_01 + lVar28 + 0x7cf0) =
           *(double *)((long)__ptr_01 + lVar28 + 0x7cf0) - dVar30;
      lVar26 = lVar26 + 1;
      lVar27 = lVar27 + 32000;
      lVar25 = lVar25 + 32000;
      lVar16 = lVar16 + 32000;
    } while (lVar26 != 3999);
    lVar23 = lVar23 + 1;
  } while (lVar23 != 100);
  local_90 = (int)lVar15;
  if (local_90 == 1) {
    uVar18 = 0;
    iVar21 = 0;
    lVar15 = 0;
    do {
      lVar23 = 0;
      uVar19 = uVar18;
      iVar20 = iVar21;
      do {
        fprintf(stderr,"%0.2lf ");
        fprintf(stderr,"%0.2lf ");
        fprintf(stderr,"%0.2lf ");
        if ((int)(uVar19 / 0x14) * 0x14 + iVar20 == 0) {
          fputc(10,stderr);
        }
        lVar23 = lVar23 + 1;
        iVar20 = iVar20 + -1;
        local_88 = (int)uVar19;
        uVar19 = (ulong)(local_88 + 1);
      } while (lVar23 != 4000);
      lVar15 = lVar15 + 1;
      iVar21 = iVar21 + -4000;
      uVar18 = (ulong)((int)uVar18 + 4000);
    } while (lVar15 != 4000);
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  return 0;
}



void main_polly_subfn(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,long param_5,
                     long *param_6)

{
  undefined4 uVar1;
  int iVar2;
  double dVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  double dVar11;
  long local_50;
  undefined4 local_44;
  long local_40;
  long local_38;
  
  lVar10 = *param_6;
  lVar7 = param_6[1];
  lVar8 = param_6[2];
  uVar1 = *param_1;
  local_44 = 0;
  local_50 = param_4;
  local_40 = param_3;
  local_38 = param_5;
  __kmpc_for_static_init_8(&DAT_00402050,uVar1,0x22,&local_44,&local_40,&local_50,&local_38,1,1);
  dVar3 = DAT_00402040;
  lVar9 = param_4 + -1;
  if (local_50 <= param_4 + -1) {
    lVar9 = local_50;
  }
  if (local_40 <= lVar9) {
    lVar5 = local_40 * 32000;
    lVar10 = lVar10 + lVar5;
    lVar4 = param_5 * 32000;
    lVar8 = lVar8 + lVar5;
    lVar7 = lVar7 + lVar5;
    lVar5 = local_40;
    do {
      dVar11 = (double)(int)lVar5;
      lVar6 = -4000;
      do {
        iVar2 = (int)lVar6;
        *(double *)(lVar7 + 32000 + lVar6 * 8) = ((double)(iVar2 + 0xfa1) * dVar11) / dVar3;
        *(double *)(lVar8 + 32000 + lVar6 * 8) = ((double)(iVar2 + 0xfa2) * dVar11) / dVar3;
        *(double *)(lVar10 + 32000 + lVar6 * 8) = ((double)(iVar2 + 0xfa3) * dVar11) / dVar3;
        lVar6 = lVar6 + 1;
      } while (lVar6 != 0);
      lVar5 = lVar5 + param_5;
      lVar10 = lVar10 + lVar4;
      lVar8 = lVar8 + lVar4;
      lVar7 = lVar7 + lVar4;
    } while (lVar5 <= lVar9);
  }
  local_50 = lVar9;
  __kmpc_for_static_fini(&DAT_00402050,uVar1);
  return;
}



/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void main_polly_subfn_4(undefined4 *param_1,undefined8 param_2,long param_3,long param_4,
                       long param_5,long param_6)

{
  double *pdVar1;
  double *pdVar2;
  double *pdVar3;
  double *pdVar4;
  double *pdVar5;
  undefined4 uVar6;
  double dVar7;
  double dVar8;
  double dVar9;
  double dVar10;
  double dVar11;
  double dVar12;
  double dVar13;
  long lVar14;
  long lVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  long local_48;
  undefined4 local_3c;
  long local_38;
  long local_30;
  
  lVar14 = *(long *)(param_6 + 8);
  lVar15 = *(long *)(param_6 + 0x10);
  uVar6 = *param_1;
  local_3c = 0;
  local_48 = param_4;
  local_38 = param_3;
  local_30 = param_5;
  __kmpc_for_static_init_8(&DAT_00402068,uVar6,0x22,&local_3c,&local_38,&local_48,&local_30,1,1);
  dVar13 = _UNK_00402018;
  dVar12 = _DAT_00402010;
  lVar16 = param_4 + -1;
  if (local_48 <= param_4 + -1) {
    lVar16 = local_48;
  }
  if (local_38 <= lVar16) {
    lVar15 = lVar15 + local_38 * 32000 + 0x7d10;
    lVar17 = local_38 * 32000 + lVar14 + 0x7d10;
    lVar14 = local_38;
    do {
      lVar18 = 0;
      do {
        pdVar3 = (double *)(lVar17 + -0x10 + lVar18 * 8);
        pdVar1 = (double *)(lVar17 + lVar18 * 8);
        dVar7 = pdVar1[1];
        pdVar4 = (double *)(lVar15 + -0x10 + lVar18 * 8);
        pdVar2 = (double *)(lVar15 + lVar18 * 8);
        dVar8 = *pdVar2;
        dVar9 = pdVar2[1];
        pdVar2 = (double *)(lVar15 + -0x7d10 + lVar18 * 8);
        pdVar5 = (double *)(lVar15 + -32000 + lVar18 * 8);
        dVar10 = *pdVar5;
        dVar11 = pdVar5[1];
        *(undefined (*) [16])(lVar17 + -0x10 + lVar18 * 8) =
             CONCAT88(pdVar3[1] - (pdVar4[1] - pdVar2[1]) * dVar13,
                      *pdVar3 - (*pdVar4 - *pdVar2) * dVar12);
        *(undefined (*) [16])(lVar17 + lVar18 * 8) =
             CONCAT88(dVar7 - (dVar9 - dVar11) * dVar13,*pdVar1 - (dVar8 - dVar10) * dVar12);
        lVar18 = lVar18 + 4;
      } while (lVar18 != 4000);
      lVar14 = lVar14 + param_5;
      lVar15 = lVar15 + param_5 * 32000;
      lVar17 = lVar17 + param_5 * 32000;
    } while (lVar14 <= lVar16);
  }
  local_48 = lVar16;
  __kmpc_for_static_fini(&DAT_00402068,uVar6);
  return;
}


