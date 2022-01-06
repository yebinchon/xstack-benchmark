import argparse
import sys
import os, signal
import glob
import subprocess
import shutil
from joblib import Parallel, delayed
from threading import Timer
from collections import ChainMap

def create_makefile(root_path, bmark):
  print("Generating Makefile for %s" %  bmark)

  path = os.path.join(root_path, bmark)
  os.chdir(path)

  bmark_set = set(glob.glob("*.c")) - set(glob.glob("*.cbe.c"))

  for bmark in bmark_set:
    bmark_name = bmark[:-2]
    with open("Makefile."+bmark_name, "w") as makefile:
      makefile.write("BMARK="+bmark_name+"\n")
      makefile.write("CFILE="+bmark_name+".c\n")
      makefile.write("LINK_FLAGS=-pthread -lm -lgmp\n")
      makefile.write("\ninclude ../Makefile.generic")
    
  return

def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=5,
                      help="Number of cores")
  parser.add_argument("-b", "--bmark", type=str)
  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), "../rosetta")

  bmark_list = []
  if not args.bmark:
    for x in os.scandir(config['root_path']):
      if x.is_dir() and x.name != 'results' and x.name != '__pycache__':
        bmark_list.append(x.name)
  else:
    for x in os.scandir(config['root_path']):
      if x.is_dir() and x.name == args.bmark:
        bmark_list.append(x.name)

  config['core_num'] = args.core_num
  config['bmark_list'] = bmark_list

  return config

if __name__ == "__main__":
  config = set_config()
  if not config:
    print("Bad configuration, please start over.")
    sys.exit(1)

  print("\n\n### Creating Makefiles... ####")

  status_list = Parallel(n_jobs=config['core_num'])(delayed(create_makefile)
                (config['root_path'], bmark) for bmark in config['bmark_list'])
