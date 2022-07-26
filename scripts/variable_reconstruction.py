import os
import sys
import subprocess
from logging import getLogger

import numpy as np
import matplotlib.pyplot as plt
import matplotlib

logger = getLogger()
#bmarks = ['adi', 'floyd-warshall', 'jacobi-1d-imper', 'gesummv', 'atax', 'bicg', 'mvt', 'gemver', 'doitgen', 'syrk', '2mm', '3mm', 'gemm','syr2k']
bmarks = ['adi', 'fdtd-2d', 'floyd-warshall', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gesummv', 'atax', 'bicg', 'mvt', 'gemver', 'doitgen', 'syrk', '2mm', '3mm', 'gemm','syr2k']
def reconstruction_score(bmark):
  with open("decompile.log", 'w') as decompile_log:
    subprocess.run(["make", "benchmark.cbe.c"], stdout=subprocess.DEVNULL, stderr=decompile_log)

  total_vars=1
  reconstructed_vars=0
  with open("decompile.log", 'r') as decompile_log:
    lines = decompile_log.readlines()
    for line in lines:
      if "TOTAL VARIABLES" in line:
        total_vars = float(line.split()[2])
      if "RECONSTRUCTED VARIABLES" in line:
        reconstructed_vars = float(line.split()[2])

  reconstruction_score = reconstructed_vars/total_vars*100

  return reconstruction_score

def Plot(results_dic, bmark_list=bmarks):
  barwidth = 0.5
  plt.figure(figsize=(12, 5))
  plt.rc('axes', axisbelow=True)

  results = []
  full = []
  for bmark in bmarks:
    results.append(results_dic[bmark])
    full.append(100)

  pos = np.arange(len(bmark_list))

  plt.bar(pos, full, color='black', width=barwidth, edgecolor='black', label='Variable Names from IR')
  plt.bar(pos, results, color='white', hatch='xx', width=barwidth, edgecolor='black', label='Reconstructed Variable Names')
  print(results)

  plt.ylim(0,100)
  plt.yticks(np.linspace(0, 100, 11), fontsize=20)
  plt.ylabel('Reconstructed \nVariables (%)', fontsize=26)
  plt.grid(axis='y', linestyle='--', linewidth=1.5)
  plt.xticks([r for r in range(len(bmark_list))], bmark_list, rotation='-30', fontsize=22, ha='left')
  plt.legend(loc='lower left', bbox_to_anchor=(-0.04, 1.01), ncol=2,
      borderaxespad=0, frameon=False, fontsize=22, handletextpad=0.4, columnspacing=1.0)
  plt.tight_layout()
  plt.savefig('vars.pdf')

if __name__ == "__main__":
  #assuming both files are in the script folder
  BMARK_DIR=os.path.join(os.getcwd(), "../polybench-parallel")

  #for bmark in bmarks:
  #  bmark_dir =  BMARK_DIR + "polybench-parallel/" + bmark
  #  print('compiling ' + bmark + '...')
  #  os.system('cd ' + bmark_dir + ' && make clean >/dev/null 2>&1 && make benchmark.cbe.c >/dev/null 2>&1')

  os.chdir(BMARK_DIR)
  os.system("./clean.sh")
  results = {}

  for bmark in bmarks:
    results[bmark] = []
    print("Benchmark: " + bmark)
    os.chdir(os.path.join(BMARK_DIR, bmark))


    results[bmark] = reconstruction_score(bmark) 

    #print ("BASELINE AST SCORE: {}".format(baseline_bleu))
    print ("THIS WORK AST SCORE: {}".format(results[bmark]))

  #results['geomean'] = 1 
  results['mean'] = 0 
  for bmark in bmarks:
  #  results['geomean'] = results['geomean']*results[bmark]
    results['mean'] = results['mean']+results[bmark]
  #results['geomean'] = results['geomean']**(1/len(bmarks))
  results['mean'] = results['mean']/len(bmarks)
  #bmarks.append('geomean')
  bmarks.append('mean')
  os.chdir("/u/yc0769")
  Plot(results)
