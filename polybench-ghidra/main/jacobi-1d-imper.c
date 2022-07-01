
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int main(int argc,char **argv)

{
  size_t __size;
  double dVar1;
  double dVar2;
  double dVar3;
  double dVar4;
  int iVar5;
  ulong uVar6;
  long lVar7;
  long lVar8;
  void *__ptr;
  void *__ptr_00;
  ulong uVar9;
  ulong uVar10;
  ulong uVar11;
  int iVar12;
  uint uVar13;
  long lVar14;
  double dVar15;
  int iVar16;
  int iVar17;
  undefined auVar18 [16];
  int local_78;
  uint local_6c;
  long local_68;
  void *local_60;
  void *local_58;
  uint local_4c;
  long local_48;
  void *local_40;
  void *local_38;
  
  uVar6 = strtol(argv[3],(char **)0x0,10);
  lVar7 = strtol(argv[2],(char **)0x0,10);
  lVar8 = strtol(argv[1],(char **)0x0,10);
  uVar13 = (uint)uVar6;
  __size = (long)(int)uVar13 * 8;
  __ptr = malloc(__size);
  __ptr_00 = malloc(__size);
  iVar5 = _UNK_00402054;
  iVar12 = _DAT_00402050;
  dVar4 = _UNK_00402048;
  dVar3 = _DAT_00402040;
  dVar2 = _UNK_00402038;
  dVar1 = _DAT_00402030;
  if (0 < (int)uVar13) {
    uVar11 = uVar6 & 0xffffffff;
    dVar15 = (double)uVar13;
    if (uVar11 < 2) {
      uVar9 = 0;
      dVar1 = DAT_00402018;
      dVar2 = DAT_00402010;
    }
    else {
      uVar9 = uVar11 - (uVar13 & 1);
      uVar10 = 0;
      iVar16 = _DAT_00402020;
      iVar17 = _UNK_00402024;
      do {
        auVar18 = divpd(CONCAT88((double)iVar17 + dVar2,(double)iVar16 + dVar1),
                        CONCAT88(dVar15,dVar15));
        *(undefined (*) [16])((long)__ptr + uVar10 * 8) = auVar18;
        auVar18 = divpd(CONCAT88((double)iVar17 + dVar4,(double)iVar16 + dVar3),
                        CONCAT88(dVar15,dVar15));
        *(undefined (*) [16])((long)__ptr_00 + uVar10 * 8) = auVar18;
        uVar10 = uVar10 + 2;
        iVar16 = iVar16 + iVar12;
        iVar17 = iVar17 + iVar5;
      } while (uVar9 != uVar10);
      dVar1 = DAT_00402018;
      dVar2 = DAT_00402010;
      if ((ulong)(uVar13 & 1) == 0) goto LAB_0040155f;
    }
    do {
      *(double *)((long)__ptr + uVar9 * 8) = ((double)(int)uVar9 + dVar2) / dVar15;
      *(double *)((long)__ptr_00 + uVar9 * 8) = ((double)(int)uVar9 + dVar1) / dVar15;
      uVar9 = uVar9 + 1;
    } while (uVar11 != uVar9);
  }
LAB_0040155f:
  iVar12 = (int)lVar7;
  if (0 < iVar12) {
    lVar7 = (long)(int)uVar13 + -2;
    lVar14 = 0;
    do {
      local_6c = uVar13;
      local_68 = lVar14;
      local_60 = __ptr;
      local_58 = __ptr_00;
      local_4c = uVar13;
      local_48 = lVar14;
      local_40 = __ptr_00;
      local_38 = __ptr;
      lVar14 = lVar14 + 1;
    } while (iVar12 != lVar14);
  }
  local_78 = (int)lVar8;
  if (local_78 == 1) {
    if (0 < (int)uVar13) {
      uVar11 = 0;
      iVar12 = 0;
      lVar7 = 0;
      do {
        fprintf(*(FILE **)((long)__ptr + lVar7),(char *)stderr,"%0.2lf ");
        if ((int)(uVar11 / 0x14) * 0x14 + iVar12 == 0) {
          fputc(10,stderr);
        }
        lVar7 = lVar7 + 8;
        iVar12 = iVar12 + -1;
        uVar11 = (ulong)((int)uVar11 + 1);
      } while ((uVar6 & 0xffffffff) << 3 != lVar7);
    }
    fputc(10,stderr);
  }
  free(__ptr);
  free(__ptr_00);
  return 0;
}


