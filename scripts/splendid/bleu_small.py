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
bmarks = ['jacobi-1d-imper']
weight_list = [(1,0,0,0), (0.5,0.5,0,0), (0.33,0.33,0.33,0), (0.25,0.25,0.25,0.25)]
#weight_list = [(0.25, 0.25, 0.25, 0.25)]
delims = ['+', '-', '/', '*', '#', '(', ')', '{', '}', '[', ']', '=']
#bmarks = ['mvt']

#def parse_data(data, delims):
#  for delim in delims:

      

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

  results = {}
  results['splendid'] = {}
  results['loop'] = {}
  results['kmpc'] = {}

  splendid_data = []
  rellic_data = []
  ref_data = []
  #rellic = BMARK_DIR + "splendid_examples/jacobi-1d-imper.c";
  ref = BMARK_DIR + "splendid_examples/reference.c";
  splendid = BMARK_DIR + "splendid_examples/for.c";
  loop = BMARK_DIR + "splendid_examples/while.c";
  kmpc = BMARK_DIR + "splendid_examples/kmpc.c";

  #rellic_file = open(rellic, "r")
  ref_file = open(ref, "r")
  splendid_file = open(splendid, "r")
  loop_file = open(loop, "r")
  kmpc_file = open(kmpc, "r")
  
  #rellic_data.append(rellic_file.read().split())
#  ref_data.append([ref_file.read().split()])
#  splendid_data.append(splendid_file.read().split())
  ref_data_old = re.split(r'(;| |\n|\+|-|/|\*|#|\(|\)|{|}|\[|\]|=)', ref_file.read())
  splendid_data_old = re.split(r'(;| |\n|\+|-|/|\*|#|\(|\)|{|}|\[|\]|=)', splendid_file.read())
  loop_data_old = re.split(r'(;| |\n|\+|-|/|\*|#|\(|\)|{|}|\[|\]|=)', loop_file.read())
  kmpc_data_old = re.split(r'(;| |\n|\+|-|/|\*|#|\(|\)|{|}|\[|\]|=)', kmpc_file.read())
  ref_data_base = []
  splendid_data_base = []
  loop_data_base = []
  kmpc_data_base = []
  for string in ref_data_old:
    if string == "" or string == "\t" or string.isspace() or string == "\n":
      continue
    else:
      ref_data_base.append(string)
  for string in splendid_data_old:
    if string == "" or string == " " or string == "\n":
      continue
    else:
      splendid_data_base.append(string)
  for string in loop_data_old:
    if string == "" or string == " " or string == "\n":
      continue
    else:
      loop_data_base.append(string)
  for string in kmpc_data_old:
    if string == "" or string == " " or string == "\n":
      continue
    else:
      kmpc_data_base.append(string)
  ref_data = [[ref_data_base]]
  splendid_data = [splendid_data_base]
  loop_data = [loop_data_base]
  kmpc_data = [kmpc_data_base]


#  parse_data(ref_data[0], delims)
#  parse_data(splendid_data, delims)
  print(ref_data)
  print(splendid_data)
  print(kmpc_data)


  for i, w in enumerate(weight_list):
   # results['rellic'][str(i)] = nltk.translate.bleu_score.corpus_bleu(ref_data, rellic_data, weights=w, smoothing_function=smoothing_method)
    #rellic_bleu = nltk.translate.bleu_score.corpus_bleu(ref_data, rellic_data, weights=w, smoothing_function=smoothing_method)
    results['splendid'][str(i)] = nltk.translate.bleu_score.corpus_bleu(ref_data, splendid_data, weights=w, smoothing_function=smoothing_method)
    results['loop'][str(i)] = nltk.translate.bleu_score.corpus_bleu(ref_data, loop_data, weights=w, smoothing_function=smoothing_method)
    results['kmpc'][str(i)] = nltk.translate.bleu_score.corpus_bleu(ref_data, kmpc_data, weights=w, smoothing_function=smoothing_method)

   # print ("RELLIC BLEU SCORE: {}".format(rellic_bleu))
    print ("THIS WORK BLEU {} SCORE: {}".format(i+1, results['splendid'][str(i)]))
    print ("WHILE LOOP BLEU {} SCORE: {}".format(i+1, results['loop'][str(i)]))
    print ("KMPC BLEU {} SCORE: {}".format(i+1, results['kmpc'][str(i)]))
    print()
