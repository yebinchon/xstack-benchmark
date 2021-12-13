import argparse
import json
import sys
import os, signal
import glob
import subprocess
import shutil
from joblib import Parallel, delayed
from threading import Timer
from termcolor import colored
from collections import ChainMap

from ReportVisualizer import ReportVisualizer

def clean_all_bmarks(root_path, bmark_list, result_path):
  os.chdir(result_path)
  os.system("rm -rf *")
  for bmark in bmark_list:
    os.chdir(os.path.join(root_path, bmark))
    make_process = subprocess.Popen(["make", "clean"],
                    stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)

    if make_process.wait() != 0:
      print(colored("Clean failed for %s" % bmark, 'red'))

  print(colored("Finish cleaning", 'green'))
  return 

def get_one_prof(root_path, bmark, test_type):
  sanity_check=True
  print("Generating %s on %s " % (test_type, bmark))

  path = os.path.join(root_path, bmark)
  os.chdir(os.path.join(root_path, bmark))

  bmarks = glob.glob("Makefile.*")

  with open(test_type+".log", "w") as fd:
    for i in range(len(bmarks)):
      bmark_name = bmarks[i][9:]
      if(test_type == ".cbe.exe"):
        test_type = bmark_name+test_type
      make_process = subprocess.Popen(["make", "-f", "Makefile."+bmark_name, test_type], stdout=fd, stderr=fd)
      timer = Timer(60, make_process.kill)
      try:
        timer.start()
        stdout, stderr = make_process.communicate()
      finally:
        timer.cancel()

  bmark_name = glob.glob("*.cbe.exe")

  if make_process.wait() != 0:
    print(colored("%s failed for %s " % (test_type, bmark), 'red'))
    for name in bmark_name:
      for line in os.popen("ps ax | grep " + name + " | grep -v grep"):
        fields = line.split()
        pid = fields[0]
        os.kill(int(pid), signal.SIGKILL)
    return False
  else:
    print(colored("%s succeeded for %s " % (test_type, bmark), 'green'))
    return True

def get_all_passes(root_path, bmark, tests, result_path):
  status = {}
  if "Compile" in tests:
    status["Compile"] = get_one_prof(root_path, bmark, ".cbe.exe")
  if "Correct" in tests:
    status["Correct"] = get_one_prof(root_path, bmark, "check_correctness")

  os.chdir(result_path)
#  with open("status_" + bmark + ".json", "w") as fd:
#    json.dump(status, fd)

  return {bmark: status}

def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=5,
                      help="Number of cores")
  parser.add_argument("-c", "--clean", action='store_true')

  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), "../rosetta")

  bmark_list = []
  bmark_num = 0
  for x in os.scandir(config['root_path']):
#    if x.name == 'Josephus-problem' or x.name == 'primes':
    if x.is_dir() and x.name != 'results' and x.name != '__pycache__':
      bmark_list.append(x.name)
      bmark_num += 1

  config['core_num'] = args.core_num
  config['bmark_list'] = bmark_list
  config['bmark_num'] = bmark_num

  config['result_path'] = os.path.join(config['root_path'], "results")

  return config, args

if __name__ == "__main__":
  tests = ["Compile", "Correct"]
  #tests = ["Correct"]
  
  config, args = set_config()
  if not config:
    print("Bad configuration, please start over.")
    sys.exit(1)

  print("\n\n### Experiment Start ####")

  if not os.path.exists(config['result_path']):
    os.makedirs(config['result_path'])

  os.chdir(config['result_path'])
  log_path = os.path.join(config['result_path'], "results.log")

  clean_all_bmarks(config['root_path'], config['bmark_list'], config['result_path'])

  if(args.clean):
    sys.exit()

  status_list = Parallel(n_jobs=config['core_num'])(delayed(get_all_passes)(config['root_path'],
                bmark, tests, config['result_path']) for bmark in config['bmark_list'])
  status = dict(ChainMap(*status_list))
  
  os.chdir(config['result_path'])
  with open("status.json", "w") as fd:
    json.dump(status, fd)

  reVis = ReportVisualizer(bmarks=config['bmark_list'], passes=tests, status=status, path=config['result_path'])
  reVis.dumpCSV()

  bmark_true = [0]*len(tests);
  for t in range(len(tests)):
    for i in range(config['bmark_num']):
      if status[config['bmark_list'][i]][tests[t]] == True:
        bmark_true[t] += 1

  print("\nOut of %d benchmarks, %d compile" % (config['bmark_num'], bmark_true[0]))
  print("\nOut of %d benchmarks, %d are correct" % (config['bmark_num'], bmark_true[1]))
