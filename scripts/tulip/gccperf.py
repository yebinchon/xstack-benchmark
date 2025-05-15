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

def Parse(path, mode):
  os.chdir(path)
  results = { }
  if mode == 'seq':
    outs = ['gcc-seq.time', 'gcc-polly.time']
  else:
    outs = ['gcc-dec.time', 'clang-seq.time']
  for out in outs:
    f = open(out, 'r')
    results[mode+'-'+out] = float(f.readline())
    f.close()

  return results

def one_mode(path, mode, bmark_name):
  if mode == 'seq':
    dirname = 'polybench-gcc'
  else:
    dirname = 'polybench-parallel'

  dir_path = os.path.join(path, dirname, bmark_name)
  os.chdir(dir_path)

  print("Running %s on %s" % (bmark_name, mode))
  #with open("result.log", "w") as fd:
  #  if mode == 'seq':
  #   make_process = subprocess.Popen(['make', 'check_seq'],
  #     env=dict(os.environ, CC='gcc'), stdout=fd, stderr=fd)
  #  else:
  #   make_process = subprocess.Popen(['make', 'check_dec'],
  #     env=dict(os.environ, CC='gcc'), stdout=fd, stderr=fd)

  #  if make_process.wait() != 0:
  #    print(colored("Failed for %s " % (bmark_name), 'red'))
  #    return Parse(dir_path, mode)
  #  else:
  #    print(colored("Succeeded for %s " % (bmark_name), 'green'))
  #    if mode == 'seq':
  #      make_move = subprocess.run(['cp', 'gcc-seq.time', 'gcc-polly.time'],
  #          env=dict(os.environ, CC='gcc'), stdout=fd, stderr=fd)
  #      return Parse(dir_path, mode)
  
  return Parse(dir_path, mode)

def one_bmark(path, modes, bmark_name):
  # Run sequential version separately

  perf_one_bmark = { bmark_name : {} }
  for mode in modes:
    perf_one_bmark[bmark_name].update(one_mode(path, mode, bmark_name))

  if len(perf_one_bmark[bmark_name].keys()) == 0:
    perf_one_bmark = {}

  return perf_one_bmark

def Postprocess(perf_dic, bmark_list):
  for bmark in bmark_list:
    for key in perf_dic[bmark].keys():
      if key == 'sp-clang-seq.time':
        continue
      else:
        perf_dic[bmark][key] = perf_dic[bmark]['sp-clang-seq.time']/perf_dic[bmark][key]
    del perf_dic[bmark]['sp-clang-seq.time']

  average = { 'average': {}}
  for key in perf_dic['2mm'].keys():
    mean = 1
    avg = 0
    for bmark in bmark_list:
      mean = mean*perf_dic[bmark][key]
      avg = avg+perf_dic[bmark][key]
    mean = mean**(1/len(bmark_list))
    avg = avg/len(bmark_list)
    average['average'][key] = avg

  perf_dic.update(average)
  bmark_list.append('average')

  return perf_dic, bmark_list

def Plot(perf_dic, bmark_list):
  barWidth = 0.4
  fig, ax = plt.subplots()
  plt.figure(figsize=(14,4))
  plt.rc('axes', axisbelow=True)

  polly_list_gcc = []
  dec_list_gcc = []
  for bmark in bmark_list:
    #polly_list_gcc.append(perf_dic[bmark]['seq-gcc-polly.time'])
    polly_list_gcc.append(0)
    dec_list_gcc.append(perf_dic[bmark]['sp-gcc-dec.time'])

  #set position of bars on x
  polly_pos = np.arange(len(bmark_list))
  dec_pos = [x + 1*barWidth for x in polly_pos]  


  pollygcc = 'Polly -> GCC'
  strike = ''
  for c in pollygcc:
    strike = strike+c+'\u0336'
  plt.bar(polly_pos, polly_list_gcc, color='#ff7f50', width=barWidth, edgecolor='black', label=strike)
  #Polly > SPLENDID > gcc
  plt.bar(dec_pos, dec_list_gcc, color='#90ee90', width=barWidth, edgecolor='black', label='Polly -> SPLENDID -> GCC')


  plt.yscale('log')
  plt.ylim(0,28)
  plt.grid(axis='y', linestyle='--', linewidth=1.5)
  plt.yticks([1, 2, 3, 5, 10, 15, 20, 25], [1, 2, 3, 5, 10, 15, 20, 25], fontsize=13)
  plt.xlim(min(polly_pos)-2*barWidth, max(polly_pos)+barWidth*3)
  plt.tick_params(axis='y', direction='out', left=True, length=5, width=2)
  plt.tick_params(axis='y', which='minor', left=False)
  plt.tick_params(axis='x', direction='out', right=True, length=5, width=2)
  plt.ylabel('Speedup', fontsize = 14)
  plt.xticks([r + barWidth*1/2 for r in range(len(bmark_list))], bmark_list, rotation='-30', fontsize=15, ha="left")
  plt.legend(loc='lower left', bbox_to_anchor= (0.065, 1.01), ncol=2, 
                      borderaxespad=0, frameon=False, fontsize=17)

  plt.tight_layout()
  plt.savefig('perf_gcc.pdf')

  return True

def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=12,
                      help="Number of cores")

  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), '../') 

  bmark_list = ['adi', 'fdtd-2d', 'floyd-warshall', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gesummv', 'atax', 'bicg', 'mvt', 'gemver', 'doitgen', 'syrk', '2mm', '3mm', 'gemm','syr2k']
  config['modes'] = ['sp']
  config['core_num'] = args.core_num
  config['bmark_list'] = bmark_list
  config['result_path'] = '/u/yc0769'#os.path.join(config['root_path'])

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
  log_path = os.path.join(config['result_path'], "results.log")

  clean_all_bmarks(os.path.join(config['root_path'], 'polybench-parallel'))
  clean_all_bmarks(os.path.join(config['root_path'], 'polybench-gcc'))
  
  perf_list_gcc = []
  perf_dic = {}
  for bmark in config['bmark_list']:
      perf_list_gcc.append(one_bmark(config['root_path'], config['modes'], bmark))
  for i in range(len(config['bmark_list'])):
    perf_dic.update(perf_list_gcc[i])


  perf_dic, config['bmark_list']  = Postprocess(perf_dic, config['bmark_list'])

  os.chdir(config['result_path'])
  Plot(perf_dic, config['bmark_list'])
