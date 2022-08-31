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

def Parse(path):
  os.chdir(path)
  results = { }
  outs = ['clang.time', 'clang-splendid.time']
  for out in outs:
    f = open(out, 'r')
    results[out] = float(f.readline())
    f.close()

  return results

def one_mode(path, bmark_name):
  dirname = 'polybench-sequential'

  dir_path = os.path.join(path, dirname, bmark_name)
  os.chdir(dir_path)

  print("Running %s" % (bmark_name))
  with open("result.log", "w") as fd:
    make_process = subprocess.Popen(['make', 'check_seq'],
       env=dict(os.environ, CC='clang'), stdout=fd, stderr=fd)

    if make_process.wait() != 0:
      print(colored("Failed for %s " % (bmark_name), 'red'))
    else:
      print(colored("Succeeded for %s " % (bmark_name), 'green'))
  
  return #Parse(dir_path)


def Postprocess(perf_dic, bmark_list):
  for bmark in bmark_list:
    for key in perf_dic[bmark].keys():
      if key == 'clang.time':
        continue
      else:
        perf_dic[bmark][key] = perf_dic[bmark]['clang.time']/perf_dic[bmark][key]
    del perf_dic[bmark]['clang.time']

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

  clang_list = []
  for bmark in bmark_list:
    clang_list.append(perf_dic[bmark]['clang-splendid.time'])

  #set position of bars on x
  clang_pos = np.arange(len(bmark_list))


  plt.bar(clang_pos, clang_list, color='#90ee90', width=barWidth, edgecolor='black', label='Clang->SPLENDID')


  plt.yscale('log')
  plt.ylim(0,28)
  plt.grid(axis='y', linestyle='--', linewidth=1.5)
  #plt.yticks([1, 2, 3, 5, 10, 15, 20, 25], [1, 2, 3, 5, 10, 15, 20, 25], fontsize=13)
  plt.xlim(min(clang_pos)-0.5*barWidth, max(clang_pos)+barWidth)
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

  clean_all_bmarks(os.path.join(config['root_path'], 'polybench-sequential'))
  
  for bmark in config['bmark_list']:
      one_mode(config['root_path'], bmark)


  #perf_dic, config['bmark_list']  = Postprocess(perf_dic, config['bmark_list'])

  os.chdir(config['result_path'])
  #Plot(perf_dic, config['bmark_list'])
