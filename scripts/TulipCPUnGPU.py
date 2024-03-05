from matplotlib.ticker import (MultipleLocator, FormatStrFormatter,
                                       AutoMinorLocator)
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rcParams
from matplotlib import rc

import json
import argparse
import math
import os
import sys
import subprocess
from threading import Timer
from termcolor import colored
from collections import ChainMap

def clean_all_bmarks(root_path, bmark_list, result_path):
  os.chdir(result_path)
  os.system("rm -rf *")
  for bmark in bmark_list:
    os.chdir(os.path.join(root_path, bmark))
    make_process = subprocess.Popen(["make", "clean"],
                    stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)

    if make_process.wait() != 0:
      print(colored("Clean failed for %s" % bmark, 'red'))

  print("Finish cleaning")
  return 0

def get_time(paths, bmark, test_types):
  result = { bmark: {}}
  for test_type in test_types:
    os.chdir(os.path.join(paths[test_type], bmark))
    f = open(test_type+".time", 'r')
    result[bmark][test_type] = float(f.readline())
    f.close()
  return result

def run_one(path, bmark, test_type):
  os.chdir(path)

  print("Generating %s on %s " % (test_type, bmark))
  with open(test_type+".log", "w") as fd:
    make_process = subprocess.Popen(["make", "run_"+test_type], stdout=fd, stderr=fd)
    timer = Timer(600, make_process.kill)
    try:
      timer.start()
      stdout, stderr = make_process.communicate()
    finally:
      timer.cancel()
  
    if make_process.wait() != 0:
      print(colored("%s failed for %s " % (test_type, bmark), 'red'))
      return False
    else:
      print(colored("%s succeeded for %s " % (test_type, bmark), 'green'))
      return True

def run_all(root_path, bmark, tests):
  bmark_path = os.path.join(root_path, bmark)
  status = {}
  for test in tests:
    status[bmark+":"+test] = run_one(bmark_path, bmark, test)
  return status

def Postprocess(perf_dic_acc, perf_dic, bmark_list, run_num):
  key_list = ['nvidia', 'amd', 'seq']
  for bmark in bmark_list:
    for key in key_list:
      perf_dic[bmark][key] = 0
      for i in range(run_num):
        perf_dic[bmark][key] = perf_dic[bmark][key]+perf_dic_acc[i][bmark][key]/run_num

  for bmark in bmark_list:
    for key in perf_dic[bmark].keys():
      if key == 'seq':
        continue
      else:
        perf_dic[bmark][key] = perf_dic[bmark]['seq']/perf_dic[bmark][key]
    del perf_dic[bmark]['seq']

  key_list = ['nvidia', 'amd']
  for key in key_list:
    geo = 1
    for bmark in bmark_list:
      geo = geo*pow(perf_dic[bmark][key], 1/len(bmark_list))
    perf_dic['geomean'][key] = geo

  bmark_list.append('geomean')

  return perf_dic, bmark_list

def Plot(perf_dic, bmark_list):
  barWidth = 0.25
  fig, ax = plt.subplots()
  plt.figure(figsize=(16,4))
  plt.rc('axes', axisbelow=True)

  geist_list = []
  tulip_clang_list = []
  tulip_gcc_list = []
  nvidia_list = []
  amd_list = []
  for bmark in bmark_list:
    geist_list.append(np.log(perf_dic[bmark]['polygeist']))
    tulip_clang_list.append(np.log(perf_dic[bmark]['tulip.clang']))
    tulip_gcc_list.append(np.log(perf_dic[bmark]['tulip.gcc']))
    nvidia_list.append(np.log(perf_dic[bmark]['nvidia']))
    amd_list.append(np.log(perf_dic[bmark]['amd']))

  geist_pos = np.arange(len(bmark_list))
  clang_pos = [x + 1*barWidth for x in geist_pos]
  gcc_pos = [x + 1*barWidth for x in clang_pos]
  nvidia_pos = [x + 1*barWidth for x in gcc_pos]
  amd_pos = [x + 1*barWidth for x in nvidia_pos]

  plt.bar(geist_pos, geist_list, width=barWidth, label='Polygeist-Clang')
  plt.bar(clang_pos, tulip_clang_list, width=barWidth, label='Tulip-Clang')
  plt.bar(gcc_pos, tulip_gcc_list, width=barWidth, label='Tulip-GCC')
  plt.bar(nvidia_pos, nvidia_list, width=barWidth, label='Nvidia-Clang')
  plt.bar(amd_pos, amd_list, width=barWidth, label='AMD-Clang')

  #plt.yscale('log')
  #plt.ylim(0.5,40)
  plt.grid(axis='y', linestyle='-', linewidth=1)
  #yticks = np.linspace(0, 32, 33, dtype=int)
  yticks_label = [0.5, 1, 2, 4, 8, 16, 32]
  yticks_log = [np.log(x) for x in yticks_label]
  plt.yticks(yticks_log, yticks_label, fontsize=14)
  plt.axhline(0, color='black')
  plt.xlim(min(geist_pos)-1.5*barWidth, max(geist_pos)+barWidth*6.5)
  #plt.tick_params(axis='y', directions='out', left=True, length=5, width=2)
  plt.tick_params(axis='y', which='minor', left=False)
  #plt.tick_params(axis='x', direction='out', right=True, length=5, width=2)
  plt.ylabel('Speedup (x)', fontsize = 18)
  plt.xticks([r + barWidth*3/2 for r in range(len(bmark_list))], bmark_list, rotation='-30', fontsize=16, ha="left")
  for pos in ['right', 'top', 'bottom', 'left']: 
        plt.gca().spines[pos].set_visible(False) 
  plt.legend(loc='lower left', bbox_to_anchor= (0.17, 1.01), ncol=4, 
                      borderaxespad=0, frameon=False, fontsize=18)

  plt.tight_layout()
  plt.savefig('perf_tulip_all.pdf')

  return True
  

def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=10,
                      help="Number of cores")

  args = parser.parse_args()
  
  config = {}
  config['nvidia_path'] = os.path.join(os.getcwd(), "../polybench-cuda")
  config['amd_path'] = os.path.join(os.getcwd(), "../../amd-benchmark/polybench-cuda")

  bmark_list = ['syrk', 'syr2k', 'gemm', '2mm', '3mm', 'doitgen', 'adi', 'fdtd-2d', 'gemver', 'jacobi-1d-imper', 'jacobi-2d-imper', 'mvt', 'atax', 'bicg', 'gesummv']
  #bmark_list = ['syrk', '2mm']

  config['core_num'] = args.core_num
  config['bmark_list'] = bmark_list
  config['run_num'] = 1

  config['result_path'] = os.path.join(config['nvidia_path'], "../", "tulip-results")

  return config

if __name__ == "__main__":
  tests = ["tulip", "polygeist", "seq"]
  #results = ['tulip.clang', 'tulip.gcc', 'polygeist', 'seq', 'nvidia', 'amd']
  results = ['seq', 'nvidia', 'amd']
  #tests = ['seq']
  
  config = set_config()
  if not config:
    print("Bad configuration, please start over.")
    sys.exit(1)

  paths = {'nvidia': config['nvidia_path'], 'amd': config['amd_path'], 'seq': config['nvidia_path']}

  print("\n\n### Experiment Start ####")

  if not os.path.exists(config['result_path']):
    os.makedirs(config['result_path'])

  os.chdir(config['result_path'])
  log_path = os.path.join(config['result_path'], "results.log")

  #clean_all_bmarks(config['root_path'], config['bmark_list'], config['result_path'])
  
  perf_list = []
  perf_dic_acc = {} 

  for j in range(config['run_num']):
    perf_dic = {}
    for bmark in config['bmark_list']:
      #run_all(config['root_path'], bmark, tests)
      perf_list.append(get_time(paths, bmark, results))
    for i, bmark in enumerate(config['bmark_list']):
      perf_dic.update(perf_list[i])
    perf_dic_acc[j] = perf_dic

  perf_dic = {'syrk': {'polygeist': 37.84385855385607, 'tulip.clang': 35.276621790861824, 'tulip.gcc': 37.83608662837262}, 'syr2k': {'polygeist': 37.26562850624855, 'tulip.clang': 36.78670426509259, 'tulip.gcc': 36.78485513733232}, 'gemm': {'polygeist': 20.020136443848653, 'tulip.clang': 17.960558076486574, 'tulip.gcc': 22.463481302711582}, '2mm': {'polygeist': 19.722244900222293, 'tulip.clang': 18.904315308596416, 'tulip.gcc': 19.217548017595302}, '3mm': {'polygeist': 19.196927540858535, 'tulip.clang': 20.824847724121753, 'tulip.gcc': 21.423542762134772}, 'doitgen': {'polygeist': 17.50627381580169, 'tulip.clang': 17.494177105342583, 'tulip.gcc': 17.58421200599132}, 'adi': {'polygeist': 6.766700091313313, 'tulip.clang': 4.462247687491627, 'tulip.gcc': 4.56052776409236}, 'fdtd-2d': {'polygeist': 2.2581482263810315, 'tulip.clang': 2.200812657065103, 'tulip.gcc': 2.2675531951821113}, 'gemver': {'polygeist': 2.681781018181293, 'tulip.clang': 2.2096945077645382, 'tulip.gcc': 2.267994036012618}, 'jacobi-1d-imper': {'polygeist': 6.070298931871572, 'tulip.clang': 5.740259637593046, 'tulip.gcc': 6.336592657151509}, 'jacobi-2d-imper': {'polygeist': 8.370159268820016, 'tulip.clang': 6.817627897602421, 'tulip.gcc': 7.514541876731434}, 'mvt': {'polygeist': 2.64660778433405, 'tulip.clang': 2.134424548795312, 'tulip.gcc': 2.240711440286401}, 'atax': {'polygeist': 0.7620986882921367, 'tulip.clang': 0.6218493356647895, 'tulip.gcc': 0.6418972108047382}, 'bicg': {'polygeist': 0.7659529000306102, 'tulip.clang': 0.6221526051091392, 'tulip.gcc': 0.6240837858467722}, 'gesummv': {'polygeist': 0.6739593169768455, 'tulip.clang': 0.5667761786392227, 'tulip.gcc': 0.5841516916741284}, 'geomean': {'polygeist': 5.941266696656526, 'tulip.clang': 5.251977064029069, 'tulip.gcc': 5.51430119117206}}
  for bmark in config['bmark_list']:
    perf_dic[bmark]['amd'] = 0
    perf_dic[bmark]['nvidia'] = 0
    perf_dic[bmark]['seq'] = 0
  temp_bmark_list = config['bmark_list']
  perf_dic, config['bmark_list'] = Postprocess(perf_dic_acc, perf_dic, config['bmark_list'], config['run_num'])

  print(perf_dic)

  os.chdir(config['result_path'])
  Plot(perf_dic, config['bmark_list'])
    #for i, bmark in enumerate(config['bmark_list']):
      #perf_list_polygeist[i][bmark].update


