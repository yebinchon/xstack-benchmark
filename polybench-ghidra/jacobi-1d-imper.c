void kernel_jacobi_1d_imper(int tsteps,int n,double *A,double *B)

{
  ulong uVar1;
  undefined4 *puVar2;
  double *pdVar3;
  double *pdVar4;
  undefined4 *puVar5;
  double dVar6;
  double dVar7;
  double dVar8;
  double dVar9;
  double dVar10;
  double dVar11;
  double dVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  double dVar20;
  double dVar21;
  double dVar22;
  ulong uVar23;
  uint uVar24;
  ulong uVar25;
  ulong uVar26;
  ulong uVar27;
  long lVar28;
  uint uVar29;
  int iVar31;
  ulong uVar32;
  ulong uVar33;
  ulong uVar30;
  
  dVar22 = DAT_00402070;
  dVar21 = _UNK_00402018;
  dVar20 = _DAT_00402010;
  if (0 < tsteps) {
    if (n < 3) {
      uVar29 = tsteps & 7;
      if (6 < tsteps - 1U) {
        iVar31 = uVar29 - tsteps;
        do {
          iVar31 = iVar31 + 8;
        } while (iVar31 != 0);
      }
      for (; uVar29 != 0; uVar29 = uVar29 - 1) {
      }
    }
    else {
      uVar29 = n - 1;
      uVar30 = (ulong)uVar29;
      uVar1 = uVar30 - 1;
      uVar25 = (uVar30 - 5 >> 2) + 1;
      uVar33 = uVar1 & 0xfffffffffffffffc;
      uVar23 = (ulong)((uint)uVar25 & 3);
      iVar31 = 0;
      do {
        uVar27 = 1;
        if (uVar1 < 4 || A < B + uVar30 && B + 1 < A + uVar30 + 1) {
LAB_004012a2:
          uVar26 = ~uVar27;
          if ((uVar29 & 1) == 0) {
            B[uVar27] = (A[uVar27 - 1] + A[uVar27] + A[uVar27 + 1]) * dVar22;
            uVar27 = uVar27 + 1;
          }
          if (uVar26 != -uVar30) {
            do {
              B[uVar27] = (A[uVar27 - 1] + A[uVar27] + A[uVar27 + 1]) * dVar22;
              B[uVar27 + 1] = (A[uVar27] + A[uVar27 + 1] + A[uVar27 + 2]) * dVar22;
              uVar27 = uVar27 + 2;
            } while (uVar30 != uVar27);
          }
        }
        else {
          uVar27 = 0;
          do {
            dVar7 = A[uVar27 + 2];
            dVar8 = (A + uVar27 + 2)[1];
            dVar9 = A[uVar27 + 3];
            dVar10 = (A + uVar27 + 3)[1];
            dVar11 = A[uVar27 + 4];
            dVar12 = (A + uVar27 + 4)[1];
            dVar6 = ((A + uVar27 + 1)[1] + (A + uVar27)[1] + dVar8) * dVar21;
            *(undefined (*) [16])(B + uVar27 + 1) =
                 CONCAT412((int)((ulong)dVar6 >> 0x20),
                           CONCAT48(SUB84(dVar6,0),(A[uVar27 + 1] + A[uVar27] + dVar7) * dVar20));
            *(undefined (*) [16])(B + uVar27 + 3) =
                 CONCAT88((dVar12 + dVar10 + dVar8) * dVar21,(dVar11 + dVar9 + dVar7) * dVar20);
            uVar27 = uVar27 + 4;
          } while (uVar33 != uVar27);
          uVar27 = uVar33 + 1;
          if (uVar1 != uVar33) goto LAB_004012a2;
        }
        uVar27 = 1;
        if (uVar1 < 4 || B + 1 < A + uVar30 && A + 1 < B + uVar30) {
LAB_004013f8:
          uVar24 = uVar29 - (int)uVar27;
          uVar32 = ~uVar27;
          uVar26 = (ulong)uVar24 & 7;
          if ((uVar24 & 7) != 0) {
            do {
              A[uVar27] = B[uVar27];
              uVar27 = uVar27 + 1;
              uVar26 = uVar26 - 1;
            } while (uVar26 != 0);
          }
          if (6 < uVar32 + uVar30) {
            do {
              A[uVar27] = B[uVar27];
              A[uVar27 + 1] = B[uVar27 + 1];
              A[uVar27 + 2] = B[uVar27 + 2];
              A[uVar27 + 3] = B[uVar27 + 3];
              A[uVar27 + 4] = B[uVar27 + 4];
              A[uVar27 + 5] = B[uVar27 + 5];
              A[uVar27 + 6] = B[uVar27 + 6];
              A[uVar27 + 7] = B[uVar27 + 7];
              uVar27 = uVar27 + 8;
            } while (uVar30 != uVar27);
          }
        }
        else {
          uVar27 = uVar23;
          if (uVar30 - 5 < 0xc) {
            lVar28 = 0;
          }
          else {
            lVar28 = 0;
            uVar26 = uVar25 & 0xfffffffffffffffc;
            do {
              pdVar3 = B + lVar28 + 1;
              uVar13 = *(undefined4 *)((long)pdVar3 + 4);
              uVar14 = *(undefined4 *)(pdVar3 + 1);
              uVar15 = *(undefined4 *)((long)pdVar3 + 0xc);
              pdVar4 = B + lVar28 + 3;
              uVar16 = *(undefined4 *)pdVar4;
              uVar17 = *(undefined4 *)((long)pdVar4 + 4);
              uVar18 = *(undefined4 *)(pdVar4 + 1);
              uVar19 = *(undefined4 *)((long)pdVar4 + 0xc);
              pdVar4 = A + lVar28 + 1;
              *(undefined4 *)pdVar4 = *(undefined4 *)pdVar3;
              *(undefined4 *)((long)pdVar4 + 4) = uVar13;
              *(undefined4 *)(pdVar4 + 1) = uVar14;
              *(undefined4 *)((long)pdVar4 + 0xc) = uVar15;
              pdVar3 = A + lVar28 + 3;
              *(undefined4 *)pdVar3 = uVar16;
              *(undefined4 *)((long)pdVar3 + 4) = uVar17;
              *(undefined4 *)(pdVar3 + 1) = uVar18;
              *(undefined4 *)((long)pdVar3 + 0xc) = uVar19;
              pdVar3 = B + lVar28 + 5;
              uVar13 = *(undefined4 *)((long)pdVar3 + 4);
              uVar14 = *(undefined4 *)(pdVar3 + 1);
              uVar15 = *(undefined4 *)((long)pdVar3 + 0xc);
              pdVar4 = B + lVar28 + 7;
              uVar16 = *(undefined4 *)pdVar4;
              uVar17 = *(undefined4 *)((long)pdVar4 + 4);
              uVar18 = *(undefined4 *)(pdVar4 + 1);
              uVar19 = *(undefined4 *)((long)pdVar4 + 0xc);
              pdVar4 = A + lVar28 + 5;
              *(undefined4 *)pdVar4 = *(undefined4 *)pdVar3;
              *(undefined4 *)((long)pdVar4 + 4) = uVar13;
              *(undefined4 *)(pdVar4 + 1) = uVar14;
              *(undefined4 *)((long)pdVar4 + 0xc) = uVar15;
              pdVar3 = A + lVar28 + 7;
              *(undefined4 *)pdVar3 = uVar16;
              *(undefined4 *)((long)pdVar3 + 4) = uVar17;
              *(undefined4 *)(pdVar3 + 1) = uVar18;
              *(undefined4 *)((long)pdVar3 + 0xc) = uVar19;
              pdVar3 = B + lVar28 + 9;
              uVar13 = *(undefined4 *)((long)pdVar3 + 4);
              uVar14 = *(undefined4 *)(pdVar3 + 1);
              uVar15 = *(undefined4 *)((long)pdVar3 + 0xc);
              pdVar4 = B + lVar28 + 0xb;
              uVar16 = *(undefined4 *)pdVar4;
              uVar17 = *(undefined4 *)((long)pdVar4 + 4);
              uVar18 = *(undefined4 *)(pdVar4 + 1);
              uVar19 = *(undefined4 *)((long)pdVar4 + 0xc);
              pdVar4 = A + lVar28 + 9;
              *(undefined4 *)pdVar4 = *(undefined4 *)pdVar3;
              *(undefined4 *)((long)pdVar4 + 4) = uVar13;
              *(undefined4 *)(pdVar4 + 1) = uVar14;
              *(undefined4 *)((long)pdVar4 + 0xc) = uVar15;
              pdVar3 = A + lVar28 + 0xb;
              *(undefined4 *)pdVar3 = uVar16;
              *(undefined4 *)((long)pdVar3 + 4) = uVar17;
              *(undefined4 *)(pdVar3 + 1) = uVar18;
              *(undefined4 *)((long)pdVar3 + 0xc) = uVar19;
              pdVar3 = B + lVar28 + 0xd;
              uVar13 = *(undefined4 *)((long)pdVar3 + 4);
              uVar14 = *(undefined4 *)(pdVar3 + 1);
              uVar15 = *(undefined4 *)((long)pdVar3 + 0xc);
              pdVar4 = B + lVar28 + 0xf;
              uVar16 = *(undefined4 *)pdVar4;
              uVar17 = *(undefined4 *)((long)pdVar4 + 4);
              uVar18 = *(undefined4 *)(pdVar4 + 1);
              uVar19 = *(undefined4 *)((long)pdVar4 + 0xc);
              pdVar4 = A + lVar28 + 0xd;
              *(undefined4 *)pdVar4 = *(undefined4 *)pdVar3;
              *(undefined4 *)((long)pdVar4 + 4) = uVar13;
              *(undefined4 *)(pdVar4 + 1) = uVar14;
              *(undefined4 *)((long)pdVar4 + 0xc) = uVar15;
              pdVar3 = A + lVar28 + 0xf;
              *(undefined4 *)pdVar3 = uVar16;
              *(undefined4 *)((long)pdVar3 + 4) = uVar17;
              *(undefined4 *)(pdVar3 + 1) = uVar18;
              *(undefined4 *)((long)pdVar3 + 0xc) = uVar19;
              lVar28 = lVar28 + 0x10;
              uVar26 = uVar26 - 4;
            } while (uVar26 != 0);
          }
          for (; uVar27 != 0; uVar27 = uVar27 - 1) {
            uVar26 = lVar28 * 8 | 8;
            puVar2 = (undefined4 *)((long)B + uVar26);
            uVar13 = puVar2[1];
            uVar14 = puVar2[2];
            uVar15 = puVar2[3];
            puVar5 = (undefined4 *)((long)B + uVar26 + 0x10);
            uVar16 = *puVar5;
            uVar17 = puVar5[1];
            uVar18 = puVar5[2];
            uVar19 = puVar5[3];
            puVar5 = (undefined4 *)((long)A + uVar26);
            *puVar5 = *puVar2;
            puVar5[1] = uVar13;
            puVar5[2] = uVar14;
            puVar5[3] = uVar15;
            puVar2 = (undefined4 *)((long)A + uVar26 + 0x10);
            *puVar2 = uVar16;
            puVar2[1] = uVar17;
            puVar2[2] = uVar18;
            puVar2[3] = uVar19;
            lVar28 = lVar28 + 4;
          }
          uVar27 = uVar33 + 1;
          if (uVar1 != uVar33) goto LAB_004013f8;
        }
        iVar31 = iVar31 + 1;
      } while (iVar31 != tsteps);
    }
  }
  return;
}



/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int main(int argc,char **argv)

{
  double dVar1;
  undefined auVar2 [16];
  double dVar3;
  int iVar4;
  long lVar5;
  double *__ptr;
  void *__ptr_00;
  int iVar6;
  long lVar7;
  ulong uVar8;
  int iVar9;
  int iVar10;
  double dVar11;
  double dVar13;
  undefined auVar14 [16];
  double dVar12;
  
  lVar7 = 0;
  lVar5 = strtol(argv[1],(char **)0x0,10);
  __ptr = (double *)malloc(800000000);
  __ptr_00 = malloc(800000000);
  iVar4 = _UNK_00402064;
  iVar6 = _DAT_00402060;
  dVar3 = _UNK_00402058;
  dVar12 = _DAT_00402050;
  auVar2 = _DAT_00402040;
  dVar13 = _UNK_00402038;
  dVar1 = _DAT_00402030;
  iVar9 = _DAT_00402020;
  iVar10 = _UNK_00402024;
  do {
    auVar14 = divpd(CONCAT88((double)iVar10 + dVar13,(double)iVar9 + dVar1),auVar2);
    *(undefined (*) [16])(__ptr + lVar7) = auVar14;
    auVar14 = divpd(CONCAT88((double)iVar10 + dVar3,(double)iVar9 + dVar12),auVar2);
    *(undefined (*) [16])((long)__ptr_00 + lVar7 * 8) = auVar14;
    lVar7 = lVar7 + 2;
    iVar9 = iVar9 + iVar6;
    iVar10 = iVar10 + iVar4;
  } while (lVar7 != 100000000);
  dVar1 = *__ptr;
  iVar6 = 0;
  do {
    dVar3 = DAT_00402070;
    dVar13 = __ptr[1];
    lVar7 = 3;
    dVar12 = dVar1;
    do {
      dVar11 = dVar12 + dVar13;
      dVar12 = __ptr[lVar7 + -1];
      *(double *)((long)__ptr_00 + lVar7 * 8 + -0x10) = (dVar11 + dVar12) * dVar3;
      dVar11 = dVar13 + dVar12;
      dVar13 = __ptr[lVar7];
      *(double *)((long)__ptr_00 + lVar7 * 8 + -8) = (dVar11 + dVar13) * dVar3;
      lVar7 = lVar7 + 2;
    } while (lVar7 != 0x5f5e101);
    memcpy(__ptr + 1,(void *)((long)__ptr_00 + 8),0x2faf07f0);
    iVar6 = iVar6 + 1;
  } while (iVar6 != 100);
  if ((int)lVar5 == 1) {
    lVar5 = 8;
    uVar8 = 0;
    iVar6 = 0;
    while( true ) {
      fprintf(stderr,"%0.2lf ");
      if ((int)(uVar8 / 0x14) * 0x14 + iVar6 == 0) {
        fputc(10,stderr);
      }
      if (lVar5 == 800000000) break;
      lVar5 = lVar5 + 8;
      iVar6 = iVar6 + -1;
      uVar8 = (ulong)((int)uVar8 + 1);
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  return 0;
}
