import os
import sys
import subprocess
from logging import getLogger
import nltk
from nltk.translate.bleu_score import SmoothingFunction
import re
from collections import defaultdict
from matplotlib.ticker import (AutoLocator, MultipleLocator, FormatStrFormatter,
                                   AutoMinorLocator)

import numpy as np
import matplotlib.pyplot as plt
import matplotlib


logger = getLogger()
bmarks = ['adi', 'fdtd-2d', 'floyd-warshall', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gesummv', 'atax', 'bicg', 'mvt', 'gemver', 'doitgen', 'syrk', '2mm', '3mm', 'gemm','syr2k']
#weight_list = [(1,0,0,0), (0.5,0.5,0,0), (0.33,0.33,0.33,0), (0.25,0.25,0.25,0.25)]
weight_list = [(0.25,0.25,0.25,0.25)]
work_list = ['rellic', 'ghidra', 'splendid', 'v1', 'v2']
#bmarks = ['mvt']
def eval_moses_bleu(ref, hyp):
    """
    Given a file of hypothesis and reference files,
    evaluate the BLEU score using Moses scripts.
    """
    assert os.path.isfile(hyp)
    assert os.path.isfile(ref) or os.path.isfile(ref + '0')
    assert os.path.isfile(BLEU_SCRIPT_PATH)
    command = BLEU_SCRIPT_PATH + ' %s < %s'
    p = subprocess.Popen(command % (ref, hyp),
                         stdout=subprocess.PIPE, shell=True)
    result = p.communicate()[0].decode("utf-8")
    if result.startswith('BLEU'):
        return float(result[7:result.index(',')])
    else:
        logger.warning('Impossible to parse BLEU score! "%s"' % result)
        return -1

def Plot(results, bmark_list=bmarks):
  barwidth = 0.175
  fig = plt.figure(figsize=(16, 4))
  ax = fig.add_subplot()
  ax.set_axisbelow(True)
  
  ghidra_list = defaultdict(list) 
  rellic_list = defaultdict(list)
  splendid_list = defaultdict(list)
  v1_list = defaultdict(list)
  v2_list = defaultdict(list)

  for b, bmark in enumerate(bmark_list):
    for i in range(len(weight_list)):
      rellic_list[i].append(results[bmark]['rellic'][str(i)]*100)
      ghidra_list[i].append(results[bmark]['ghidra'][str(i)]*100)
      splendid_list[i].append(results[bmark]['splendid'][str(i)]*100)
      v1_list[i].append(results[bmark]['v1'][str(i)]*100)
      v2_list[i].append(results[bmark]['v2'][str(i)]*100)
    

  rellic_pos = np.arange(len(bmark_list))
  ghidra_pos = [x+ 1*barwidth for x in rellic_pos]
  v1_pos = [x+ 1*barwidth for x in ghidra_pos]
  v2_pos = [x+ 1*barwidth for x in v1_pos]
  splendid_pos = [x+ 1*barwidth for x in v2_pos]

  for i in reversed(range(len(weight_list))):
  #for i in range(1):
    plt.bar(rellic_pos, rellic_list[i], color='#ff9300', width=barwidth, label='Rellic ')
    plt.bar(ghidra_pos, ghidra_list[i], color='#ffed00', width=barwidth, label='Ghidra ')
    plt.bar(v1_pos, v1_list[i], color='#31a354', width=barwidth, label='SPLENDID v1 (control-flow)')
    plt.bar(v2_pos, v2_list[i], color='#a1dab4', width=barwidth, label='SPLENDID v2 (control-flow+explicit parallelism)')
    plt.bar(splendid_pos, splendid_list[i], color='#377eb8', width=barwidth, label='SPLENDID ')

  plt.ylabel('BLEU score', fontsize=18)

  plt.yscale('log')
  plt.ylim(0,30)
  plt.yticks([0.05, 0.1, 0.25, 0.5, 1, 2, 5, 10, 25], [0.05, 0.1, 0.25, 0.5, 1, 2, 5, 10, 25], fontsize=14)
  plt.tick_params(axis='y', which='minor', left=False)
  #plt.yticks(np.arange(0, 0.25, 0.025))
  #ax.yaxis.set_major_locator(AutoLocator())
  #ax.set_yticks(np.arange(0, 25, 2.5), major=True)
  #ax.set_yticks([0, 5, 10, 15, 20, 22.5], major=True)
  #ax.yaxis.set_minor_locator(AutoMinorLocator(2))
  #plt.yticks(np.arange(0.025, 0.225, 0.025), minor=True)

  plt.xlim(min(rellic_pos)-1.5*barwidth, max(rellic_pos)+barwidth*5.5)
  ax.yaxis.grid(color='gray', linestyle='dashed')
  #ax.yaxis.grid(which='minor', color='gray', linestyle='dashed', linewidth=0.5)
 # plt.grid(axis='y', linestyle='--', linewidth=1.2)
  plt.xticks([r+barwidth*2 for r in range(len(bmark_list))], bmark_list, rotation='-30', fontsize=16, ha='left')
  plt.legend(loc='lower left', bbox_to_anchor=(-0.04, 1.01), ncol=6,
      borderaxespad=0, frameon=False, fontsize=15.5, handletextpad=0.4, columnspacing=1.0)
  plt.tight_layout()
  plt.savefig('bleu.pdf')

if __name__ == "__main__":
  #assuming both files are in the script folder
  #BLEU_SCRIPT_PATH = "/u/zujunt/xstack/xstack-benchmark/scripts/bleu.perl"
  BMARK_DIR=os.path.join(os.getcwd(), "../")
  smoothing_method = SmoothingFunction().method4

  #for bmark in bmarks:
  #  bmark_dir =  BMARK_DIR + "polybench-parallel/" + bmark
  #  print('compiling ' + bmark + '...')
  #  os.system('cd ' + bmark_dir + ' && make clean >/dev/null 2>&1 && make benchmark.cbe.c >/dev/null 2>&1')
  results = {}

  for bmark in bmarks:
    results[bmark] = {}
    for work in work_list:
      results[bmark][work] = {}

    print("Benchmark: " + bmark)

    ref_data = []
    rellic_data = []
    ghidra_data = []
    splendid_data = []
    v1_data = []
    v2_data = []
    for mode in ['main', 'outlined']:
      ref = BMARK_DIR + "polybench-pragma-inlined/" + mode + '/' + bmark + ".c"
      rellic = BMARK_DIR + "polybench-rellic/" + mode + '/' +  bmark + ".c"
      ghidra = BMARK_DIR + "polybench-ghidra/" + mode +  '/' + bmark + ".c"
      splendid = BMARK_DIR + "polybench-splendid/" + mode + '/' + bmark + ".c"
      v1 = BMARK_DIR + "polybench-splendid-v1/" + mode + '/' + bmark + ".c"
      v2 = BMARK_DIR + "polybench-splendid-v2/" + mode + '/' + bmark + ".c"

      ref_file = open(ref, "r")
      rellic_file = open(rellic, "r")
      ghidra_file = open(ghidra, "r")
      splendid_file = open(splendid, "r")
      v1_file = open(v1, "r")
      v2_file = open(v2, "r")
  
      ref_data.append([ref_file.read().split()])
      rellic_data.append(rellic_file.read().split())
      ghidra_data.append(ghidra_file.read().split())
      splendid_data.append(splendid_file.read().split())
      v1_data.append(v1_file.read().split())
      v2_data.append(v2_file.read().split())

    for i, w in enumerate(weight_list):
      results[bmark]['rellic'][str(i)] = nltk.translate.bleu_score.corpus_bleu(ref_data, rellic_data, weights=w, smoothing_function=smoothing_method)
      results[bmark]['ghidra'][str(i)] = nltk.translate.bleu_score.corpus_bleu(ref_data, ghidra_data, weights=w, smoothing_function=smoothing_method)
      results[bmark]['splendid'][str(i)] = nltk.translate.bleu_score.corpus_bleu(ref_data, splendid_data, weights=w, smoothing_function=smoothing_method)
      results[bmark]['v1'][str(i)] = nltk.translate.bleu_score.corpus_bleu(ref_data, v1_data, weights=w, smoothing_function=smoothing_method)
      results[bmark]['v2'][str(i)] = nltk.translate.bleu_score.corpus_bleu(ref_data, v2_data, weights=w, smoothing_function=smoothing_method)

    #print ("RELLIC BLEU SCORE: {}".format(rellic_bleu))
    #print ("GHIDRA BLEU SCORE: {}".format(ghidra_bleu))
    #print ("THIS WORK BLEU SCORE: {}".format(splendid_bleu))

  #results['geomean'] = {}
  results['mean'] = {}
  for work in work_list:
    #results['geomean'][work] = {}
    results['mean'][work] = {}

  for i, work in enumerate(work_list):
    for j, _ in enumerate(weight_list):
      #results['geomean'][work][str(j)] = 1.0
      results['mean'][work][str(j)] = 0.0
  for bmark in bmarks:
    for i, _ in enumerate(weight_list):
      for work in work_list:
        #results['geomean'][work][str(i)] = results['geomean'][work][str(i)]*results[bmark][work][str(i)] 
        results['mean'][work][str(i)] = results['mean'][work][str(i)]+results[bmark][work][str(i)]
  for work in work_list:
    for i, _ in enumerate(weight_list):
      #results['geomean'][work][str(i)] = results['geomean'][work][str(i)]**(1/len(bmarks))
      results['mean'][work][str(i)] = results['mean'][work][str(i)]/len(bmarks)
  
  #bmarks.append('geomean')
  bmarks.append('mean')
  os.chdir("/u/yc0769")
  Plot(results)
  print(results['mean']['ghidra']['0'])
  print(results['mean']['rellic']['0'])
  print(results['mean']['v1']['0'])
  print(results['mean']['v2']['0'])
  print(results['mean']['splendid']['0'])
  #bmarks.remove('geomean')
  bmarks.remove('mean')
