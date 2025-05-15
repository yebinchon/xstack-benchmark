import re
import numpy as np
import utils
import csv
import math
from fractions import Fraction
import pickle

import argparse
import sys
import os
import subprocess
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

def one_mode(path, mode, bmark_name):
  if mode == 'compiler':
    dirname = 'polybench-parallel'
  else:
    dirname = 'polybench-manual'

  dir_path = os.path.join(path, dirname, bmark_name)
  os.chdir(dir_path)
  pragmas = 0

  print("Running %s on %s" % (bmark_name, mode))
  with open("result.log", "w") as fd:
    if mode == 'compiler':
     subprocess.run(['make', 'benchmark.cbe.c'],
       env=dict(os.environ, CC='clang'), stdout=fd, stderr=fd)
     with open("benchmark.cbe.c", 'r') as fp:
       for line in fp:
         if "pragma omp for" in line or "pragma omp parallel for" in line:
           pragmas += 1
    else:
      with open(bmark_name+".c", 'r') as fp:
        for line in fp:
         if "pragma omp for" in line or "pragma omp parallel for" in line:
           pragmas += 1


  print(colored("Succeeded for %s " % (bmark_name), 'green'))
  return pragmas
  
def one_bmark(path, modes, bmark_name):
  # Run sequential version separately

  perf_one_bmark = { bmark_name : {} }
  for mode in modes:
    perf_one_bmark[bmark_name][mode] = one_mode(path, mode, bmark_name)

  if len(perf_one_bmark[bmark_name].keys()) == 0:
    perf_one_bmark = {}

  return perf_one_bmark

def Postprocess(perf_dic, bmark_list):
  for bmark in bmark_list:
    total = 0
    for key in perf_dic[bmark].keys():
      total += perf_dic[bmark][key]
    perf_dic[bmark]['total'] = total

  mean = { 'mean': {}}
  for key in perf_dic['atax'].keys():
    avg = 0
    for bmark in bmark_list:
      avg = avg+perf_dic[bmark][key]
    avg = avg/len(bmark_list)
    mean['mean'][key] = avg

  perf_dic.update(mean)
  bmark_list.append('mean')

  return perf_dic, bmark_list

def Write(perf_dic, bmark_list):
  columns = ['Benchmark', 'manual', 'compiler', 'total']
  bmarks = [bmark for bmark in perf_dic.keys()]
  #with open('lines.csv', 'w') as outfile:
  print(perf_dic)





  return True

def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=12,
                      help="Number of cores")

  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), '../') 

  #bmark_list = ['adi', 'fdtd-2d', 'floyd-warshall', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gesummv', 'atax', 'bicg', 'mvt', 'gemver', 'doitgen', 'syrk', '2mm', '3mm', 'gemm','syr2k']
  #bmark_list = ['fdtd-2d', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gesummv', 'atax', 'bicg', 'gemver']
  bmark_list = ['atax']
  config['modes'] = ['compiler', 'manual']
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
    

  clean_all_bmarks(os.path.join(config['root_path'], 'polybench-parallel'))
  clean_all_bmarks(os.path.join(config['root_path'], 'polybench-manual'))
  
  lines_list = []
  lines_dic = {}
  for bmark in config['bmark_list']:
      lines_list.append(one_bmark(config['root_path'], config['modes'], bmark))
  for i in range(len(config['bmark_list'])):
    lines_dic.update(lines_list[i])


  lines_dic, config['bmark_list']  = Postprocess(lines_dic, config['bmark_list'])


  os.chdir(config['result_path'])
  Write(lines_dic, config['bmark_list'])
