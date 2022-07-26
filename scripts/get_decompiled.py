from matplotlib.ticker import (MultipleLocator, FormatStrFormatter,
                                       AutoMinorLocator)
import re
import numpy as np
#from scipy.stats.mstats import gmean
import matplotlib.pyplot as plt
import matplotlib
import utils
import csv
from matplotlib import rcParams
import math
from fractions import Fraction
import pickle
from matplotlib import rc

import argparse
import sys
import os
import subprocess
from joblib import Parallel, delayed, parallel
from threading import Timer
from termcolor import colored
from collections import ChainMap

def clean_all_bmarks(root_path):

  os.chdir(root_path)
  make_process = subprocess.Popen(["./clean.sh"],
                  stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)

  if make_process.wait() != 0:
    print(colored("Clean failed", 'red'))

  print("Finish cleaning")
  return 0

def Parse(path, mode, bmark_name, frontend):
  os.chdir(path)
  results = { }
  if mode == 'polly':
    outs = [frontend+'-seq.time', frontend+'-dec.time', frontend+'-polly.time']
  else:
    outs = [frontend+'-seq.time']
  for out in outs:
    f = open(out, 'r')
    results[mode+'-'+out] = float(f.readline())
    f.close()

  return results


def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=12,
                      help="Number of cores")
  parser.add_argument("-m", "--mode", type=str, default='splendid', help="Specify mode")

  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), '../') 

  mode = args.mode
  #bmark_list = ['adi', 'fdtd-2d', 'floyd-warshall', 'jacobi-2d-imper', 'jacobi-1d-imper', 'gesummv', 'atax', 'bicg', 'mvt', 'gemver', 'doitgen', 'syrk', '2mm', '3mm', 'gemm','syr2k']
  bmark_list = ['jacobi-1d-imper']
  config['core_num'] = args.core_num
  config['bmark_list'] = bmark_list
  config['result_path'] = os.path.join(config['root_path'], 'polybench-'+mode)


  return config

if __name__ == "__main__":
  
  config = set_config()
  if not config:
    print("Bad configuration, please start over.")
    sys.exit(1)

  print("\n\n### Experiment Start ####")

  if not os.path.exists(config['result_path']):
    os.makedirs(config['result_path'])

  os.chdir(config['result_path'])
  #log_path = os.path.join(config['result_path'], "results.log")

  clean_all_bmarks(os.path.join(config['root_path'], 'polybench-parallel'))
  
  for bmark in config['bmark_list']:
    os.chdir(os.path.join(config['root_path'], 'polybench-parallel', bmark))
    subprocess.run(['make', 'benchmark.cbe.c'])
    with open('benchmark.cbe.c', 'r') as fr:
      lines = fr.readlines()
    with open('benchmark_stripped.c', 'w') as fw:
      delete = True
      for line in lines:
        if not delete:
          fw.write(line)
        if '/* Function Bodies */' in line:
          delete = False

    with open('benchmark_stripped.c', 'r') as br:
      lines = br.readlines()

    with open('benchmark_whole.c', 'w') as whole:
      delete  = False
      for line in lines:
        if '/*' in line or '//' in line:
          delete = True
        if not delete:
          whole.write(line)
        delete = False
    with open('benchmark_seq.c', 'w') as seq:
      delete = False
      for line in lines:
        if 'START OUTLINED' in line:
          delete = True
        if not delete:
          seq.write(line)
        if 'END OUTLINED' in line:
          delete = False

    with open('benchmark_par.c', 'w') as par:
      delete = True
      for line in lines:
        if 'END OUTLINED' in line:
          delete = True
        if not delete:
          par.write(line)
        if 'START OUTLINED' in line:
          delete = False

    subprocess.run(['cp', 'benchmark_seq.c', os.path.join(config['result_path'], 'main', bmark+'.c')])
    subprocess.run(['cp', 'benchmark_par.c', os.path.join(config['result_path'], 'outlined', bmark+'.c')])
    subprocess.run(['cp', 'benchmark_whole.c', os.path.join(config['result_path'], bmark+'.c')])

    subprocess.run(['rm', 'benchmark_stripped.c', 'benchmark_par.c', 'benchmark_seq.c', 'benchmark_whole.c'])
