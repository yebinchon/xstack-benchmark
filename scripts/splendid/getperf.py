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

def Parse(path, mode, frontend, bmark_name):
  os.chdir(path)
  results = { }
  if frontend == 'clang':
    outs = ['clang-seq.time', 'clang-polly.time', 'clang-dec.time']
  else:
    outs = ['gcc-dec.time'] 
  for out in outs:
    f = open(out, 'r')
    results[mode+'-'+out] = float(f.readline())
    f.close()

  return results


def one_mode(path, mode, bmark_name, frontend):
  dirname = 'polybench-parallel'

  dir_path = os.path.join(path, dirname, bmark_name)
  os.chdir(dir_path)

  #print("Running %s on %s" % (bmark_name, mode))
  #if frontend=='clang':
  #  with open("result.log", "w") as fd:
  #    make_process = subprocess.Popen(['make', 'check_performance'],
  #     env=dict(os.environ, CC='clang'), stdout=fd, stderr=fd)

  #    if make_process.wait() != 0:
  #      print(colored("Failed for %s " % (bmark_name), 'red'))
  #      return Parse(dir_path, mode, frontend, bmark_name)
  #    else:
  #      print(colored("Succeeded for %s " % (bmark_name), 'green'))
  #      return Parse(dir_path, mode, frontend, bmark_name)
  #else:
  #  subprocess.run(['make', 'clean'], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
  #  with open("result.log", "w") as fd:
  #    subprocess.run(['make', 'check_gcc'], env=dict(os.environ, CC='gcc'), stdout=fd, stderr=fd)
  
  return Parse(dir_path, mode, frontend, bmark_name)

def one_bmark(path, modes, bmark_name, frontend='clang'):
  # Run sequential version separately

  perf_one_bmark = { bmark_name : {} }
  for mode in modes:
    perf_one_bmark[bmark_name].update(one_mode(path, mode, bmark_name, frontend))

  if len(perf_one_bmark[bmark_name].keys()) == 0:
    perf_one_bmark = {}

  return perf_one_bmark

def Postprocess(perf_dic_five, perf_dic, bmark_list):
  for bmark in bmark_list:
    for key in perf_dic[bmark].keys():
      perf_dic[bmark][key] = 0
      for i in range(5):
        perf_dic[bmark][key] = perf_dic[bmark][key]+perf_dic_five[i][bmark][key]
      perf_dic[bmark][key] = perf_dic[bmark][key]/5

  for bmark in bmark_list:
    for key in perf_dic[bmark].keys():
      if key == 'polly-clang-seq.time':
        continue
      else:
        perf_dic[bmark][key] = perf_dic[bmark]['polly-clang-seq.time']/perf_dic[bmark][key]
    del perf_dic[bmark]['polly-clang-seq.time']

  mean = { 'mean': {}}
  for key in perf_dic['2mm'].keys():
    avg = 0
    for bmark in bmark_list:
      avg = avg+perf_dic[bmark][key]
    avg = avg/len(bmark_list)
    mean['mean'][key] = avg

  perf_dic.update(mean)
  bmark_list.append('mean')

  return perf_dic, bmark_list

def Plot(perf_dic, bmark_list):
  barWidth = 0.25
  fig, ax = plt.subplots()
  plt.figure(figsize=(16,4))
  plt.rc('axes', axisbelow=True)

  polly_list_clang = []
  dec_list_clang = []
  list_gcc = []
  list_0 = []
  for bmark in bmark_list:
    polly_list_clang.append(perf_dic[bmark]['polly-clang-polly.time'])
    dec_list_clang.append(perf_dic[bmark]['polly-clang-dec.time'])
    list_gcc.append(perf_dic[bmark]['polly-gcc-dec.time'])
    list_0.append(0)

  print(list_gcc)
  print(polly_list_clang)
  #set position of bars on x
  polly_pos = np.arange(len(bmark_list))
  dec_pos = [x + 1*barWidth for x in polly_pos]
  #zero_pos = [x + 1*barWidth for x in dec_pos]
  gcc_pos = [x + 1*barWidth for x in dec_pos]  


  pollygcc = 'Polly -> GCC'
  strike = ''
  for c in pollygcc:
    strike = strike+c+'\u0336'

  #for i in zero_pos:
  #  plt.text(i-0.05, 0.74, "x", color='#fb8072', fontweight='bold')
  #Polly 
  plt.bar(polly_pos, polly_list_clang, color='#ff9300', width=barWidth, label='Polly')
  plt.bar(dec_pos, dec_list_clang, color='#4daf4a', width=barWidth, label='Polly\u2192SPLENDID\u2192Clang')
  plt.bar(gcc_pos, list_gcc, color='#377eb8', width=barWidth, label='Polly\u2192SPLENDID\u2192GCC')
  #Polly > SPLENDID > CLang

  plt.yscale('log')
  plt.ylim(0,28)
  plt.grid(axis='y', linestyle='--', linewidth=1)
  yticks = np.linspace(0, 28, 29, dtype=int)
  yticks_log = [1, 2, 3, 5, 10, 15, 25]
  plt.yticks(yticks_log, yticks_log, fontsize=14)
  plt.xlim(min(polly_pos)-1.5*barWidth, max(polly_pos)+barWidth*4.5)
  plt.tick_params(axis='y', direction='out', left=True, length=5, width=2)
  plt.tick_params(axis='y', which='minor', left=False)
  plt.tick_params(axis='x', direction='out', right=True, length=5, width=2)
  plt.ylabel('Speedup (x)', fontsize = 18)
  plt.xticks([r + barWidth*3/2 for r in range(len(bmark_list))], bmark_list, rotation='-30', fontsize=16, ha="left")
  plt.legend(loc='lower left', bbox_to_anchor= (0.17, 1.01), ncol=4, 
                      borderaxespad=0, frameon=False, fontsize=18)

  plt.tight_layout()
  plt.savefig('perf_clang.pdf')

  return True

def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=12,
                      help="Number of cores")

  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), '../') 

  bmark_list = ['adi', 'fdtd-2d', 'floyd-warshall', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gesummv', 'atax', 'bicg', 'mvt', 'gemver', 'doitgen', 'syrk', '2mm', '3mm', 'gemm','syr2k']
  config['modes'] = ['polly']
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
  
  perf_list_clang = []
  perf_list_gcc = []
  perf_dic_five = {}
  for j in range(5):
    perf_dic = {}
    for bmark in config['bmark_list']:
        perf_list_clang.append(one_bmark(config['root_path'], config['modes'], bmark, 'clang'))
        perf_list_gcc.append(one_bmark(config['root_path'], config['modes'], bmark, 'gcc'))
    for i, bmark in enumerate (config['bmark_list']):
      perf_list_clang[i][bmark].update(perf_list_gcc[i][bmark])
      perf_dic.update(perf_list_clang[i])
      #operf_dic.update(perf_list_gcc[i])
    perf_dic_five[j] = perf_dic

  perf_dic = {}
  for bmark in config['bmark_list']:
    perf_dic[bmark] = {'polly-clang-seq.time': 0, 'polly-clang-dec.time': 0, 'polly-clang-polly.time': 0, 'polly-gcc-dec.time': 0}
  temp_bmark_list = config['bmark_list']
  perf_dic, config['bmark_list']  = Postprocess(perf_dic_five, perf_dic, config['bmark_list'])
  print(perf_dic['mean']['polly-clang-dec.time'])
  print(perf_dic['mean']['polly-gcc-dec.time'])


  os.chdir(config['result_path'])
  Plot(perf_dic, config['bmark_list'])
