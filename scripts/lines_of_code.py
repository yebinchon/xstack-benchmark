import os
import sys
import subprocess
from logging import getLogger
import nltk
from nltk.translate.bleu_score import SmoothingFunction
import re

import numpy as np
import matplotlib.pyplot as plt
import matplotlib

logger = getLogger()
bmarks = ['2mm','3mm','adi','atax', 'bicg','doitgen','fdtd-2d','floyd-warshall','gemm','gemver','gesummv','jacobi-1d-imper','jacobi-2d-imper', 'mvt','syr2k','syrk']
#bmarks = ['mvt']

if __name__ == "__main__":
  #assuming both files are in the script folder
  #BLEU_SCRIPT_PATH = "/u/zujunt/xstack/xstack-benchmark/scripts/bleu.perl"
  BMARK_DIR=os.path.join(os.getcwd(), "../")
  smoothing_method = SmoothingFunction().method4

  #for bmark in bmarks:
  #  bmark_dir =  BMARK_DIR + "polybench-parallel/" + bmark
  #  print('compiling ' + bmark + '...')
  #  os.system('cd ' + bmark_dir + ' && make clean >/dev/null 2>&1 && make benchmark.cbe.c >/dev/null 2>&1')
  results = {}

  for bmark in bmarks:
    ref_data = 0
    rellic_data = 0 
    ghidra_data = 0 
    splendid_data = 0
    for mode in ['main', 'outlined']:
      print("Benchmark: " + bmark)
      ref = BMARK_DIR + "polybench-pragma-inlined/" + mode + '/' + bmark + ".c"
      rellic = BMARK_DIR + "polybench-rellic/" + mode + '/' +  bmark + ".c"
      ghidra = BMARK_DIR + "polybench-ghidra/" + mode +  '/' + bmark + ".c"
      splendid = BMARK_DIR + "polybench-splendid/" + mode + '/' + bmark + ".c"

      ref_file = open(ref, "r")
      rellic_file = open(rellic, "r")
      ghidra_file = open(ghidra, "r")
      splendid_file = open(splendid, "r")

      ref_lines = 0
      for f in ref_file.readlines():
        if not f.strip():
          continue
        else:
          ref_lines = ref_lines+1
      rellic_lines = 0
      for f in rellic_file.readlines():
        if not f.strip():
          continue
        else:
          rellic_lines = rellic_lines+1
      ghidra_lines = 0
      for f in ghidra_file.readlines():
        if not f.strip():
          continue
        else:
          ghidra_lines = ghidra_lines+1
      splendid_lines = 0
      for f in splendid_file.readlines():
        if not f.strip():
          continue
        else:
          splendid_lines = splendid_lines+1
    
      ref_data = ref_data + ref_lines 
      rellic_data = rellic_data + rellic_lines
      ghidra_data = ghidra_data + ghidra_lines
      splendid_data = splendid_data + splendid_lines

    print("Original: "+str(ref_data))
    #print("Rellic: "+str(rellic_data))
    #print("Ghidra: "+str(ghidra_data))
    print("SPLENDID: "+str(splendid_data))

