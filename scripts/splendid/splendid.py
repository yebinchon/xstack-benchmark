from matplotlib.ticker import (MultipleLocator, FormatStrFormatter, AutoMinorLocator)
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
  if mode == 'polly':
    outs = ['clang-seq.time', 'clang-dec.time']
  else:
    outs = ['clang-seq.time']
  for out in outs:
    f = open(out, 'r')
    results[mode+'-'+out] = float(f.readline())
    f.close()

  return results


def one_mode(path, mode, bmark_name):
  if mode == 'polly':
    dirname = 'polybench-parallel'
  elif mode == 'manual':
    dirname = 'polybench-manual'
  else:
    dirname = 'polybench-splendid-manual'

  dir_path = os.path.join(path, dirname, bmark_name)
  os.chdir(dir_path)

#  print("Running %s on %s" % (bmark_name, mode))
#  with open("result.log", "w") as fd:
#    if mode == 'polly':
#     make_process = subprocess.Popen(['make', 'check_performance'],
#       env=dict(os.environ, CC='clang'), stdout=fd, stderr=fd)
#    else:
#     make_process = subprocess.Popen(['make', 'check_seq'],
#       env=dict(os.environ, CC='clang'), stdout=fd, stderr=fd)
#
#    if make_process.wait() != 0:
#      print(colored("Failed for %s " % (bmark_name), 'red'))
#      move_process = subprocess.run(['cp', path+'polybench-parallel/'+bmark_name+'/clang'+'-seq.time', dir_path+'/clang'+'-seq.time'])
#      return Parse(dir_path, mode)
#    else:
#      print(colored("Succeeded for %s " % (bmark_name), 'green'))
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
      if key == 'polly-clang-seq.time':
        continue
      elif key == 'manual-clang-seq.time' and bmark in ['atax', 'bicg']:
        perf_dic[bmark][key] = 1
      else:
        perf_dic[bmark][key] = perf_dic[bmark]['polly-clang-seq.time']/perf_dic[bmark][key]
    del perf_dic[bmark]['polly-clang-seq.time']

  mean = { 'mean': {}}
  #geomean = { 'geomean': {}}
  for key in perf_dic['atax'].keys():
    avg = 0
    for bmark in bmark_list:
      avg = avg+perf_dic[bmark][key]
    avg = avg/len(bmark_list)
    mean['mean'][key] = avg

  #perf_dic.update(geomean)
  #bmark_list.append('geomean')
  perf_dic.update(mean)
  bmark_list.append('mean')

  return perf_dic, bmark_list

def Plot(perf_dic, bmark_list):
  barWidth = 0.25
  fig, ax = plt.subplots()
  plt.figure(figsize=(16,8))
  plt.rc('axes', axisbelow=True)

  manual_list_clang = []
  dec_list_clang = []
  decman_list_clang = []
  for bmark in bmark_list:
    manual_list_clang.append(perf_dic[bmark]['manual-clang-seq.time'])
    dec_list_clang.append(perf_dic[bmark]['polly-clang-dec.time'])
    decman_list_clang.append(perf_dic[bmark]['sp-clang-seq.time'])

  print(manual_list_clang)
  print(dec_list_clang)
  print(decman_list_clang)

  changed_lines_list = [4, 1, 1, 1, 6, 6, 1, 3]

  #set position of bars on x
  manual_pos = np.arange(len(bmark_list))
  dec_pos = [x + 1*barWidth for x in manual_pos]  
  decman_pos = [x + 1*barWidth for x in dec_pos]  

  #Manual
  #plt.bar(manual_pos, manual_list_clang, color='#8c000f', width=barWidth, edgecolor='black', label='Parallelization by Cavazos Lab')
  ##Polly > SPLENDID > CLang
  #plt.bar(dec_pos, dec_list_clang, color='#90ee90', width=barWidth, edgecolor='black', label='Polly -> SPLENDID')

  #plt.bar(decman_pos, decman_list_clang, color='#1a9641', width=barWidth, edgecolor='black', label='Polly -> SPLENDID -> Manual Parallelization')

  #Manual
  plt.bar(manual_pos, manual_list_clang, color='#f0601f', width=barWidth, label='Manual Only')
  #Polly > SPLENDID > CLang
  plt.bar(dec_pos, dec_list_clang, color='#f7e600', width=barWidth, label='Compiler Only')

  plt.bar(decman_pos, decman_list_clang, color='#4daf4a',  width=barWidth, label='Compiler-Manual')

  for i, v in enumerate(changed_lines_list):
    if i == 6:
      plt.text(decman_pos[i]-0.05, decman_list_clang[i]+0.22, str(v), fontsize=32)
    else:
      plt.text(decman_pos[i]-0.05, decman_list_clang[i]+0.2, str(v), fontsize=32)

  plt.yscale('log')
  plt.ylim(0,10)
  plt.grid(axis='y', linestyle='--', linewidth=1.5)
  plt.yticks([1, 2, 3, 5, 10, 15], [1, 2, 3, 5, 10, 15], fontsize=28)
  plt.xlim(min(manual_pos)-2*barWidth, max(manual_pos)+barWidth*4)
  plt.tick_params(axis='y', direction='out', left=True, length=5, width=2)
  plt.tick_params(axis='y', which='minor', left=False)
  plt.tick_params(axis='x', direction='out', right=True, length=5, width=2)
  plt.ylabel('Speedup (x)', fontsize = 36)
  plt.xticks([r + barWidth for r in range(len(bmark_list))], bmark_list, rotation='-30', fontsize=34, ha='left', rotation_mode='anchor')
  plt.legend(loc='lower left', bbox_to_anchor= (-0.04, 1.01), ncol=3, 
                      borderaxespad=0, frameon=False, fontsize=32, handletextpad=0.4,
                      columnspacing=1.0)

  plt.tight_layout()
  plt.savefig('perf_splendid.pdf')

  return True

def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=12,
                      help="Number of cores")

  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), '../') 

  #bmark_list = ['adi', 'fdtd-2d', 'floyd-warshall', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gesummv', 'atax', 'bicg', 'mvt', 'gemver', 'doitgen', 'syrk', '2mm', '3mm', 'gemm','syr2k']
  bmark_list = ['fdtd-2d', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gesummv', 'atax', 'bicg', 'gemver']
  config['modes'] = ['polly', 'manual', 'sp']
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

  #for bmark in config['bmark_list']:
  #  os.chdir(os.path.join(config['root_path'], 'polybench-parallel', bmark))
  #  subprocess.run(['make', 'benchmark.cbe.c'])
  #  subprocess.run(['cp', config['root_path']+'/polybench-parallel/'+bmark+'/benchmark.cbe.c', config['root_path']+'/polybench-splendid-manual/'+bmark])
    

#  clean_all_bmarks(os.path.join(config['root_path'], 'polybench-parallel'))
#  clean_all_bmarks(os.path.join(config['root_path'], 'polybench-manual'))
#  clean_all_bmarks(os.path.join(config['root_path'], 'polybench-splendid-manual'))
  
  perf_list_clang = []
  perf_dic = {}
  for bmark in config['bmark_list']:
      perf_list_clang.append(one_bmark(config['root_path'], config['modes'], bmark))
  for i in range(len(config['bmark_list'])):
    perf_dic.update(perf_list_clang[i])


  perf_dic, config['bmark_list']  = Postprocess(perf_dic, config['bmark_list'])


  os.chdir(config['result_path'])
  Plot(perf_dic, config['bmark_list'])
