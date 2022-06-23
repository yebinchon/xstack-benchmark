
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


