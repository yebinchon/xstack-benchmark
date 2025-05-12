import json
import argparse
import math
import os
import sys
import subprocess
from threading import Timer
from termcolor import colored
from joblib import Parallel, delayed, parallel

def clean_all_bmarks(root_path, bmark_list):
  for bmark in bmark_list:
    os.chdir(os.path.join(root_path, bmark))
    make_process = subprocess.Popen(["make", "clean"],
                    stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)

    if make_process.wait() != 0:
      print(colored("Clean failed for %s" % bmark, 'red'))

  print("Finish cleaning")
  return 0

def run_one(path, bmark, be):
  os.chdir(os.path.join(path, bmark))

  print("Generating cpu target on %s " % (bmark))
  with open("cbe.log", "w") as fd:
    make_process = subprocess.Popen(["make", bmark+"_"+be+".c"], stdout=fd, stderr=fd)
    timer = Timer(600, make_process.kill)
    try:
      timer.start()
      stdout, stderr = make_process.communicate()
    finally:
      timer.cancel()
  
    if make_process.wait() != 0:
      print(colored("Translation failed for %s " % (bmark), 'red'))
      return False
    else:
      print(colored("Translation succeeded for %s " % (bmark), 'green'))
      return True

def run_correctness(path, bmark):
  os.chdir(os.path.join(path, bmark))
  print("Generating correctness on %s" % (bmark))
  with open("correctness.log", "w") as fd:
    make_process = subprocess.Popen(["make", "run_correctness"], stdout=fd, stderr=fd)
    timer = Timer(600, make_process.kill)
    try:
      timer.start()
      stdout, stderr = make_process.communicate()
    finally:
      timer.cancel()
  
    if make_process.wait() != 0:
      print(colored("Run failed for %s " % (bmark), 'red'))
      return False
    else:
      print(colored("Run succeeded for %s " % (bmark), 'green'))
      
      seq_file = open("seq.txt", 'r')
      omp_file = open("omp.txt", 'r')
      tulip_file = open('tulip.txt', 'r')
      seq_res = seq_file.read()
      tulip_res = tulip_file.read()
      omp_res = omp_file.read()
      if not seq_res or not tulip_res:
        print(colored("Correctness not generated for %s " % (bmark), 'red'))
        return False
      if seq_res != omp_res:
        print(colored("Correctness check failed for %s " % (bmark), 'red'))
        return False
      else:
        print(colored("Correctness check succeeded for %s " % (bmark), 'green'))
        return True
        


def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=16,
                      help="Number of cores")
  parser.add_argument("-b", "--backend", type=str, default="all")
  parser.add_argument("-c", "--correctness", type=bool, default=False)

  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), "../../polybench-lilac")

  bmark_list = ['syrk', 'syr2k', 'gemm', '2mm', '3mm', 'doitgen', 'adi', 'fdtd-2d', 'gemver', 'jacobi-1d-imper', 'jacobi-2d-imper', 'mvt', 'atax', 'bicg', 'gesummv', 'lu', 'symm', 'covariance', 'correlation', 'trmm', 'cholesky', 'nussinov', 'seidel-2d', 'heat-3d']
  #bmark_list = ['syrk', '2mm']

  config['correctness_test'] = args.correctness
  config['core_num'] = args.core_num
  config['bmark_list'] = bmark_list
  if args.backend == "all":
    config['tests'] = ['cpu', 'cpu_noelle']
    #config['tests'] = ['cpu', 'cpu_noelle', 'gpu', 'gpu_noelle']
  else:
    config['tests'] = [args.backend]

  return config

if __name__ == "__main__":
  
  config = set_config()
  if not config:
    print("Bad configuration, please start over.")
    sys.exit(1)

  print("\n\n### Experiment Start ####")

  clean_all_bmarks(config['root_path'], config['bmark_list'])

  for be in config['tests']:
    Parallel(n_jobs = config['core_num'])(delayed(run_one)(config['root_path'], bmark, be) for bmark in config['bmark_list'])

  if config['correctness_test']:
    for bmark in config['bmark_list']:
      run_correctness(config['root_path'], bmark)
