
int main(int argc,char **argv)

{
  uint uVar1;
  long lVar2;
  void *__ptr;
  void *__ptr_00;
  void *__ptr_01;
  void *__ptr_02;
  void *__ptr_03;
  short sVar3;
  void *local_80;
  void *local_78;
  void *local_68;
  void *local_60;
  void *local_50;
  void *local_48;
  void *local_40;
  void *local_38;
  
  lVar2 = strtol(argv[1],(char **)0x0,10);
  __ptr = malloc(128000000);
  __ptr_00 = malloc(32000);
  __ptr_01 = malloc(32000);
  __ptr_02 = malloc(32000);
  __ptr_03 = malloc(32000);
  local_50 = __ptr_01;
  local_48 = __ptr_02;
  local_40 = __ptr_03;
  local_38 = __ptr;
  local_80 = __ptr;
  local_78 = __ptr_02;
  local_68 = __ptr;
  local_60 = __ptr_03;
  if ((int)lVar2 == 1) {
    uVar1 = 0;
    sVar3 = 0;
    lVar2 = 0;
    do {
      fprintf(*(FILE **)((long)__ptr_00 + lVar2),(char *)stderr,"%0.2lf");
      fprintf(*(FILE **)((long)__ptr_01 + lVar2),(char *)stderr,"%0.2lf");
      if ((ushort)(((ushort)((uVar1 & 0xffff) / 5) & 0xfffc) * 5 + sVar3) == 0) {
        fputc(10,stderr);
      }
      lVar2 = lVar2 + 8;
      sVar3 = sVar3 + -1;
      uVar1 = uVar1 + 1;
    } while (lVar2 != 32000);
  }
  free(__ptr);
  free(__ptr_00);
  free(__ptr_01);
  free(__ptr_02);
  free(__ptr_03);
  return 0;
}


