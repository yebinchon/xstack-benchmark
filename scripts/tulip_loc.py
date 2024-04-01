import re
import numpy as np
import utils
import csv
from fractions import Fraction

import argparse
import sys
import os
import subprocess
from joblib import Parallel, delayed, parallel
from threading import Timer
from termcolor import colored
from collections import ChainMap

def clean_all_bmarks(root_path, bmark_list):

  for bmark in bmark_list:
    os.chdir(os.path.join(root_path, bmark))
    make_process = subprocess.Popen(["make", 'clean'],
                  stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)

    if make_process.wait() != 0:
      print(colored("Clean failed for %s"%bmark, 'red'))

  print("Finish cleaning")
  return 0

def tulip(root_path, bmark):
  os.chdir(os.path.join(root_path, bmark))
  make_process = subprocess.Popen(["make", bmark+'_cpu.c'],
                stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)

  if make_process.wait() != 0:
    print(colored("Tulip failed for %s"%bmark, 'red'))
  else:
    print(colored("Tulip success for %s"%bmark, 'green'))
  return

def rellic(root_path, bmark):
  os.chdir(os.path.join(root_path, bmark))
  with open('rellic.log', 'w') as fd:
    make_process = subprocess.Popen(['rellic-decomp', '--input', bmark+'_cpu.bc', '--output', bmark+'_rellic.c'],
                  stdout=fd, stderr=fd)

    if make_process.wait() != 0:
      print(colored("Rellic failed for %s"%bmark, 'red'))
    else:
      print(colored("Rellic success for %s"%bmark, 'green'))
    return

def countlines(root_path, bmark, mode):
  ref = os.path.join(root_path, bmark, bmark+'_'+mode+'.c')
  ref_file = open(ref, "r")
  ref_lines = 0
  for f in ref_file.readlines():
    if not f.strip():
      continue
    else:
      ref_lines = ref_lines+1
  return {bmark: ref_lines }


def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=0,
                      help="Number of cores")
  parser.add_argument("-m", "--mode", type=str, default='splendid', help="Specify mode")

  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), '../polybench-cuda') 

  mode = args.mode
  bmark_list = ['syrk', 'syr2k', 'gemm', '2mm', '3mm', 'doitgen', 'adi', 'fdtd-2d', 'gemver', 'jacobi-1d-imper', 'jacobi-2d-imper', 'mvt', 'atax', 'bicg', 'gesummv', 'lu', 'symm', 'covariance', 'correlation', 'trmm', 'cholesky', 'nussinov', 'seidel-2d', 'heat-3d']
  if args.core_num == 0:
    config['core_num'] = len(bmark_list)
  else:
    config['core_num'] = args.core_num
  config['bmark_list'] = bmark_list
  config['result_path'] = os.path.join(config['root_path'], '../tulip-results')


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

  clean_all_bmarks(config['root_path'], config['bmark_list'])
  
  # Get decompiled files for tulip, rellic
  Parallel(n_jobs = config['core_num'])(delayed(tulip)(config['root_path'], bmark) for bmark in config['bmark_list'])
  Parallel(n_jobs = config['core_num'])(delayed(rellic)(config['root_path'], bmark) for bmark in config['bmark_list'])

  # Count lines of code for each
  tulip_list = Parallel(n_jobs = config['core_num'])(delayed(countlines)(config['root_path'], bmark, 'cpu') for bmark in config['bmark_list'])
  rellic_list = Parallel(n_jobs = config['core_num'])(delayed(countlines)(config['root_path'], bmark, 'rellic') for bmark in config['bmark_list'])

  tulip_dict = dict(ChainMap(*tulip_list))
  rellic_dict = dict(ChainMap(*rellic_list))
  print(tulip_dict)
  print(rellic_dict)