
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int main(int argc,char **argv)

{
  double *pdVar1;
  long lVar2;
  long lVar3;
  double *pdVar4;
  double *pdVar5;
  double *pdVar6;
  double dVar7;
  undefined auVar8 [16];
  double dVar9;
  double dVar10;
  double dVar11;
  double dVar12;
  double dVar13;
  double dVar14;
  int iVar15;
  long lVar16;
  ulong uVar17;
  long lVar18;
  void *__ptr;
  void *__ptr_00;
  int iVar19;
  ulong uVar20;
  long lVar21;
  uint uVar22;
  void *pvVar23;
  long lVar24;
  long lVar25;
  ulong uVar26;
  size_t sVar27;
  long lVar28;
  void *pvVar29;
  ulong uVar30;
  ulong uVar31;
  ulong uVar32;
  void *pvVar33;
  ulong uVar34;
  ulong uVar35;
  long lVar36;
  long lVar37;
  long lVar38;
  undefined auVar39 [16];
  undefined auVar40 [16];
  double dVar41;
  double dVar42;
  undefined auVar43 [16];
  double_0__0_ *A;
  int tsteps;
  int dump_code;
  int local_d8;
  int local_88;
  ulong local_50;
  long local_48;
  void *local_40;
  void *local_38;
  
  lVar16 = strtol(argv[1],(char **)0x0,10);
  uVar17 = strtol(argv[2],(char **)0x0,10);
  lVar18 = strtol(argv[3],(char **)0x0,10);
  iVar15 = (int)uVar17;
  sVar27 = (ulong)(uint)(iVar15 * iVar15) << 3;
  __ptr = malloc(sVar27);
  __ptr_00 = malloc(sVar27);
  dVar13 = DAT_00402010;
  dVar12 = DAT_00402008;
  uVar35 = uVar17 & 0xffffffff;
  if (0 < iVar15) {
    uVar20 = 0;
    pvVar23 = __ptr;
    pvVar29 = __ptr_00;
    do {
      uVar31 = 0;
      do {
        *(double *)((long)pvVar23 + uVar31 * 8) =
             ((double)((int)uVar31 + 2) * (double)(int)uVar20 + dVar12) / (double)iVar15;
        *(double *)((long)pvVar29 + uVar31 * 8) =
             ((double)((int)uVar31 + 3) * (double)(int)uVar20 + dVar13) / (double)iVar15;
        uVar31 = uVar31 + 1;
      } while (uVar35 != uVar31);
      uVar20 = uVar20 + 1;
      pvVar29 = (void *)((long)pvVar29 + uVar35 * 8);
      pvVar23 = (void *)((long)pvVar23 + uVar35 * 8);
    } while (uVar20 != uVar35);
  }
  local_d8 = (int)lVar18;
  if ((0 < local_d8) && (2 < iVar15)) {
    uVar22 = iVar15 - 1;
    uVar31 = (ulong)uVar22;
    lVar3 = uVar35 * 8;
    lVar18 = uVar35 * 8 + 8;
    sVar27 = uVar31 * 8 - 8;
    uVar20 = uVar31 - 1;
    if (uVar17 < 0x80000000) {
      uVar20 = (ulong)((uint)uVar20 & 1);
      lVar37 = uVar35 * 0x10;
      lVar24 = 0;
      do {
        local_50 = uVar17;
        local_48 = lVar24;
        local_40 = __ptr;
        local_38 = __ptr_00;
        __kmpc_fork_call(&DAT_00402030,4,main_polly_subfn,0,uVar17 - 2,1,&local_50);
        lVar36 = 0;
        if (uVar22 != 2) {
          lVar28 = 8;
          lVar36 = 0;
          do {
            memcpy((void *)((long)__ptr + lVar28 + lVar3),(void *)((long)__ptr_00 + lVar28 + lVar3),
                   sVar27);
            memcpy((void *)((long)__ptr + lVar28 + lVar37),
                   (void *)((long)__ptr_00 + lVar28 + lVar37),sVar27);
            lVar36 = lVar36 + 2;
            lVar28 = lVar28 + lVar37;
          } while (~uVar20 + uVar31 != lVar36);
        }
        if (uVar20 != 0) {
          lVar36 = lVar36 * lVar3 + lVar18;
          memcpy((void *)((long)__ptr + lVar36),(void *)(lVar36 + (long)__ptr_00),sVar27);
        }
        lVar24 = lVar24 + 1;
      } while ((int)lVar24 != local_d8);
    }
    else {
      uVar34 = uVar20 & 0xfffffffffffffffc;
      uVar30 = (ulong)((uint)uVar20 & 1);
      lVar24 = uVar35 * 0x10;
      iVar19 = 0;
      do {
        dVar14 = _UNK_00402028;
        dVar13 = _DAT_00402020;
        dVar12 = DAT_00402018;
        uVar32 = 1;
        lVar28 = (long)__ptr + lVar24 + 0x18;
        lVar21 = (long)__ptr + lVar3 + 0x20;
        pvVar23 = __ptr;
        pvVar29 = (void *)((long)__ptr + lVar24);
        pvVar33 = (void *)((long)__ptr_00 + lVar3);
        lVar37 = (long)__ptr + -8;
        lVar36 = (long)__ptr_00 + 0x18;
        do {
          lVar36 = lVar36 + lVar3;
          lVar37 = lVar37 + lVar3;
          lVar25 = uVar32 * uVar35;
          uVar32 = uVar32 + 1;
          uVar26 = *(ulong *)((long)__ptr + lVar25 * 8 + 8);
          auVar39 = ZEXT816(uVar26);
          if (uVar20 < 4) {
            lVar25 = 1;
LAB_004016cb:
            lVar2 = lVar37 + lVar25 * 8;
            lVar38 = 0;
            do {
              dVar7 = *(double *)(lVar2 + 0x10 + lVar38 * 8);
              *(double *)((long)pvVar33 + lVar38 * 8 + lVar25 * 8) =
                   (SUB168(auVar39,0) + *(double *)(lVar2 + lVar38 * 8) + dVar7 +
                    *(double *)((long)pvVar29 + lVar38 * 8 + lVar25 * 8) +
                   *(double *)((long)pvVar23 + lVar38 * 8 + lVar25 * 8)) * dVar12;
              lVar38 = lVar38 + 1;
              auVar39 = ZEXT816((ulong)dVar7);
            } while (uVar31 - lVar25 != lVar38);
          }
          else {
            auVar39 = CONCAT88(uVar26,uVar26);
            uVar26 = 0;
            do {
              pdVar4 = (double *)(lVar21 + -0x20 + uVar26 * 8);
              auVar8 = *(undefined (*) [16])(lVar21 + -0x10 + uVar26 * 8);
              dVar42 = SUB168(auVar8 >> 0x40,0);
              auVar40 = shufpd(auVar39,auVar8,1);
              pdVar5 = (double *)(lVar28 + -0x10 + uVar26 * 8);
              auVar39 = *(undefined (*) [16])(lVar21 + uVar26 * 8);
              dVar41 = SUB168(auVar39 >> 0x40,0);
              auVar43 = shufpd(auVar8,auVar39,1);
              pdVar1 = (double *)(lVar28 + uVar26 * 8);
              dVar7 = *pdVar1;
              dVar9 = pdVar1[1];
              pdVar1 = (double *)((long)pvVar23 + uVar26 * 8 + 8);
              pdVar6 = (double *)((long)pvVar23 + uVar26 * 8 + 0x18);
              dVar10 = *pdVar6;
              dVar11 = pdVar6[1];
              *(undefined (*) [16])(lVar36 + -0x10 + uVar26 * 8) =
                   CONCAT88((pdVar1[1] + pdVar5[1] + SUB168(auVar40 >> 0x40,0) + pdVar4[1] + dVar42)
                            * dVar14,(*pdVar1 +
                                     *pdVar5 + SUB168(auVar40,0) + *pdVar4 + SUB168(auVar8,0)) *
                                     dVar13);
              *(undefined (*) [16])(lVar36 + uVar26 * 8) =
                   CONCAT88((dVar11 + dVar9 + SUB168(auVar43 >> 0x40,0) + dVar42 + dVar41) * dVar14,
                            (dVar10 + dVar7 + SUB168(auVar43,0) + SUB168(auVar8,0) +
                                              SUB168(auVar39,0)) * dVar13);
              uVar26 = uVar26 + 4;
            } while (uVar34 != uVar26);
            if (uVar20 != uVar34) {
              auVar39 = CONCAT88(dVar41,dVar41);
              lVar25 = uVar34 + 1;
              goto LAB_004016cb;
            }
          }
          lVar21 = lVar21 + lVar3;
          lVar28 = lVar28 + lVar3;
          pvVar23 = (void *)((long)pvVar23 + lVar3);
          pvVar33 = (void *)((long)pvVar33 + lVar3);
          pvVar29 = (void *)((long)pvVar29 + lVar3);
        } while (uVar32 != uVar31);
        if (uVar22 == 2) {
          lVar37 = 0;
        }
        else {
          lVar36 = 8;
          lVar37 = 0;
          do {
            memcpy((void *)((long)__ptr + lVar36 + lVar3),
                   (void *)((long)(void *)((long)__ptr_00 + lVar3) + lVar36),sVar27);
            memcpy((void *)((long)(void *)((long)__ptr + lVar24) + lVar36),
                   (void *)((long)__ptr_00 + lVar36 + lVar24),sVar27);
            lVar37 = lVar37 + 2;
            lVar36 = lVar36 + lVar24;
          } while (~uVar30 + uVar31 != lVar37);
        }
        if (uVar30 != 0) {
          lVar37 = lVar37 * lVar3 + lVar18;
          memcpy((void *)((long)__ptr + lVar37),(void *)(lVar37 + (long)__ptr_00),sVar27);
        }
        iVar19 = iVar19 + 1;
      } while (iVar19 != local_d8);
    }
  }
  local_88 = (int)lVar16;
  if (local_88 == 1) {
    if (0 < iVar15) {
      lVar16 = 0;
      uVar20 = 0;
      do {
        uVar31 = 0;
        do {
          fprintf(stderr,"%0.2lf ");
          iVar15 = (int)lVar16 + (int)uVar31;
          if ((iVar15 * -0x33333333 + 0x19999998U >> 2 | iVar15 * 0x40000000) < 0xccccccd) {
            fputc(10,stderr);
          }
          uVar31 = uVar31 + 1;
        } while (uVar35 != uVar31);
        uVar20 = uVar20 + 1;
        lVar16 = lVar16 + uVar17;
      } while (uVar20 != uVar35);
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  return 0;
}


