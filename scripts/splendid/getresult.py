import argparse
import json
import sys
import os, signal
import subprocess
import glob
from joblib import Parallel, delayed
from threading import Timer
from termcolor import colored
from collections import ChainMap

from ReportVisualizer import ReportVisualizer

def get_pid(name):
  try:
    pids = map(int, subprocess.check_output(["pidof", name]).split())
  except:
    pids = []
  return pids 

def clean_all_bmarks(root_path, bmark_list, result_path):
  os.chdir(result_path)
  os.system("rm -rf *")
  for bmark in bmark_list:
    bmark_dir = bmark["name"]
    for bmark_name in bmark["set"]:
      break
    os.chdir(os.path.join(root_path, bmark_dir))
    make_process = subprocess.Popen(["make", "-f", "Makefile."+bmark_name[:-2], "clean"],
                    stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)

    if make_process.wait() != 0:
      print(colored("Clean failed for %s" % bmark, 'red'))

  print("Finish cleaning")
  return 0

def get_one_prof(path, bmark_file, test_type):
  os.chdir(path)

  bmark_name = bmark_file[:-2]
  exec_name = [bmark_name+".exe", bmark_name+".cbe.exe", bmark_name+"_mem2reg.cbe.exe"]
  print("Generating %s on %s " % (test_type, bmark_name))
  with open(test_type+".log", "w") as fd:
    if test_type == "compile":
      make_process = subprocess.Popen(["make", "-f", "Makefile."+bmark_name], stdout=fd, stderr=fd)
    else:
      make_process = subprocess.Popen(["make", "-f", "Makefile."+bmark_name, test_type], stdout=fd, stderr=fd)
    timer = Timer(60, make_process.kill)
    try:
      timer.start()
      stdout, stderr = make_process.communicate()
    finally:
      timer.cancel()
  
    if make_process.wait() != 0:
      print(colored("%s failed for %s " % (test_type, bmark_name), 'red'))
      for name in exec_name:
        for pid in get_pid(name):
          if pid:
            os.kill(int(pid), signal.SIGKILL)
      return False
    else:
      print(colored("%s succeeded for %s " % (test_type, bmark_name), 'green'))
      return True

def get_all_passes(root_path, bmark_dic, tests, result_path):
  bmark_path = os.path.join(root_path, bmark_dic["name"])
  bmark_set = bmark_dic["set"]
  bmark_status = {}
  for bmark_file in bmark_set:
    status = {}
    if "compile" in tests:
      status["compile"] = get_one_prof(bmark_path, bmark_file, "compile")
    if "correct" in tests:
      status["correct"] = get_one_prof(bmark_path, bmark_file, "check_correctness")
    bmark_status.update({ bmark_file : status })

#  os.chdir(result_path)
#  with open("status_" + bmark + ".json", "w") as fd:
#    json.dump(status, fd)

  return bmark_status

def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=10,
                      help="Number of cores")

  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), "../rosetta")

  bmark_list = []
  bmark_num = 0
  for x in os.scandir(config['root_path']):
#    if x.name == 'Sierpinski-carpet' or x.name == 'Matrix-arithmetic':
    if x.is_dir() and x.name != 'results' and x.name != '__pycache__' and x.name != 'README':
      os.chdir(os.path.join(config['root_path'], x.name))
      bmark_set = set(glob.glob("*.c")) - set(glob.glob("*.cbe.c"))
      bmark_num += len(bmark_set)
      bmark_list.append({"name" : x.name, "set": bmark_set})

  config['core_num'] = args.core_num
  config['bmark_list'] = bmark_list
  config['bmark_num'] = bmark_num

  config['result_path'] = os.path.join(config['root_path'], "results")

  return config

if __name__ == "__main__":
  tests = ["compile", "correct"]
  #tests = ["correct"]
  #tests = ["compile"]
  
  config = set_config()
  if not config:
    print("Bad configuration, please start over.")
    sys.exit(1)

  print("\n\n### Experiment Start ####")

  if not os.path.exists(config['result_path']):
    os.makedirs(config['result_path'])

  os.chdir(config['result_path'])
  log_path = os.path.join(config['result_path'], "results.log")

  clean_all_bmarks(config['root_path'], config['bmark_list'], config['result_path'])
  
  status_list = Parallel(n_jobs=config['core_num'])(delayed(get_all_passes)(config['root_path'],
                bmark, tests, config['result_path']) for bmark in config['bmark_list'])
  status = dict(ChainMap(*status_list))
  
  os.chdir(config['result_path'])
  with open("status.json", "w") as fd:
    json.dump(status, fd)

  reVis = ReportVisualizer(bmarks=config['bmark_list'], passes=tests, status=status, path=config['result_path'])
  reVis.dumpCSV()

  bmark_true = [0, 0];
  for i in range(len(tests)):
    for bmark_dir in config['bmark_list']:
      for bmark_name in bmark_dir["set"]:
        if status[bmark_name][tests[i]] == True:
          bmark_true[i] += 1

    print("\nOut of %d benchmarks, %d are %s" % (config['bmark_num'], bmark_true[i], tests[i]))
