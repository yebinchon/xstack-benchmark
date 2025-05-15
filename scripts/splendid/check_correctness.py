import os
import sys
import subprocess
from logging import getLogger

import numpy as np
import matplotlib.pyplot as plt
import matplotlib

logger = getLogger()
bmarks = ['adi', 'fdtd-2d', 'floyd-warshall', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gesummv', 'atax', 'bicg', 'mvt', 'gemver', 'doitgen', 'syrk', '2mm', '3mm', 'gemm','syr2k']
def ast_score(ref, work):
  os.system("clang-diff --ast-dump "+ref+" > ast.log")
  with open("ast.log", 'r') as astlog:
    linenum = len(astlog.readlines())

  count = 0
  os.system("clang-diff --dump-matches "+ref+" "+work+" > diff.log")
  with open("diff.log", 'r') as difflog:
    lines = difflog.readlines()
    for line in lines:
      if "Match" in line:
        count = count+1

  ast_score = count/linenum*100

  return ast_score

if __name__ == "__main__":
  #assuming both files are in the script folder
  #BLEU_SCRIPT_PATH = "/u/zujunt/xstack/xstack-benchmark/scripts/bleu.perl"
  BMARK_DIR="/scratch/yc0769/xstack-benchmark/xstack-benchmark/"

  #for bmark in bmarks:
  #  bmark_dir =  BMARK_DIR + "polybench-parallel/" + bmark
  #  print('compiling ' + bmark + '...')
  #  os.system('cd ' + bmark_dir + ' && make clean >/dev/null 2>&1 && make benchmark.cbe.c >/dev/null 2>&1')
  results = {}

  for bmark in bmarks:
    results[bmark] = {}
    print("Benchmark: " + bmark)
    manual = BMARK_DIR + "polybench-manual/" + bmark
    splendid = BMARK_DIR + "polybench-splendid-manual/" + bmark
    ref = BMARK_DIR + "polybench-parallel/" + bmark
    os.chdir(ref)
    os.system("make clean; make benchmark.exe; make check_out")
    os.chdir(manual)
    os.system("make clean; make benchmark.exe; make check_out")
    os.chdir(splendid)
    os.system("make clean; make benchmark.exe; make check_out")
    
    os.system("diff "+ref+"/benchmark.out "+manual+"/benchmark.out")
    os.system("diff "+ref+"/benchmark.out "+splendid+"/benchmark.out")

    #manual_correct = ast_score(ref, ghidra)
    #splendid_correct = ast_score(ref, splendid)

    #results[bmark]['rellic'] = rellic_ast
    #results[bmark]['ghidra'] = ghidra_ast
    #results[bmark]['splendid'] = splendid_ast
