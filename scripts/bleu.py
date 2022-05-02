import os
import sys
import subprocess
from logging import getLogger
import nltk
from nltk.translate.bleu_score import SmoothingFunction

logger = getLogger()
bmarks = ['mvt', 'gemm', '2mm', '3mm', 'gemver', 'gesummv', 'syrk', 'syr2k', 'jacobi-1d-imper']
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

if __name__ == "__main__":
  #assuming both files are in the script folder
  BLEU_SCRIPT_PATH = "/u/zujunt/xstack/xstack-benchmark/scripts/bleu.perl"
  BMARK_DIR="../"
  smoothing_method = SmoothingFunction().method4

  for bmark in bmarks:
    print("Benchmark: " + bmark)
    ref = BMARK_DIR + "polybench-parallel/" + bmark + "/" + bmark + ".c"
    baseline = BMARK_DIR + "polybench-ghidra/"  + "/" + bmark + ".c"
    thiswork = BMARK_DIR + "polybench-parallel/" + bmark + "/benchmark.cbe.c"
  
    ref_file = open(ref, "r")
    baseline_file = open(baseline, "r")
    thiswork_file = open(thiswork, "r")

    ref_data = ref_file.read().split()
    baseline_data = baseline_file.read().split()
    thiswork_data = thiswork_file.read().split()
  
    baseline_bleu = nltk.translate.bleu_score.sentence_bleu([ref_data], baseline_data, weights=(1,0,0,0), smoothing_function=smoothing_method)
    thiswork_bleu = nltk.translate.bleu_score.sentence_bleu([ref_data], thiswork_data, weights=(1,0,0,0), smoothing_function=smoothing_method)
  
    print ("BASELINE BLEU SCORE: {}".format(baseline_bleu))
    print ("THIS WORK BLEU SCORE: {}".format(thiswork_bleu))
