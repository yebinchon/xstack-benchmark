import json
import argparse
#import math
import os
import sys
import re
#import subprocess
#from threading import Timer
#from termcolor import colored
#from joblib import Parallel, delayed, parallel

def set_config():
  parser = argparse.ArgumentParser()

  parser.add_argument("-n", "--core-num", type=int, default=16,
                      help="Number of cores")

  args = parser.parse_args()
  
  config = {}
  config['root_path'] = os.path.join(os.getcwd(), "../../polybench-lilac")

  #bmark_list = ['syrk', 'syr2k', 'gemm', '2mm', '3mm', 'doitgen', 'adi', 'fdtd-2d', 'gemver', 'jacobi-1d-imper', 'jacobi-2d-imper', 'mvt', 'atax', 'bicg', 'gesummv', 'lu', 'symm', 'covariance', 'correlation', 'trmm', 'cholesky', 'nussinov', 'seidel-2d', 'heat-3d']
  bmark_list = ['2mm']

  #config['core_num'] = args.core_num
  config['bmark_list'] = bmark_list

  return config

"""
def isUniqueNameinScope(varname):
    return true

def replaceStructs(struct, names):

def replaceGlobals(names):
    for pair in names:
        if isUniqueNameinScope(pair['after']):

def replaceVars(func, names):
"""
def apply_variable_name_replacements(source_code_str, replacements_data):
    """
    Replaces variable, struct, and field names in a source code string
    based on a JSON definition.

    Args:
        source_code_str (str): The source code as a string.
        replacements_json_str_or_dict (str or dict):
            A JSON string or a pre-parsed Python dictionary containing
            the replacement rules. The structure should match the JSON
            provided by the user in previous interactions.

    Returns:
        str: The source code string with names replaced.
    """
    all_replacements = []

    # 1. Collect all 'before' and 'after' pairs
    # Globals
    if 'globals' in replacements_data:
        for item in replacements_data['globals']:
            if 'before' in item and 'after' in item:
                all_replacements.append((item['before'], item['after']))

    # Struct definitions
    if 'struct_definitions' in replacements_data:
        for struct_item in replacements_data['struct_definitions']:
            if 'struct_name' in struct_item and \
               'before' in struct_item['struct_name'] and \
               'after' in struct_item['struct_name']:
                all_replacements.append((
                    struct_item['struct_name']['before'],
                    struct_item['struct_name']['after']
                ))
            if 'fields' in struct_item:
                for field in struct_item['fields']:
                    if 'before' in field and 'after' in field:
                        all_replacements.append((field['before'], field['after']))

    # Function-specific variables
    if 'functions' in replacements_data:
        for func_name, var_list in replacements_data['functions'].items():
            for var_item in var_list:
                if 'before' in var_item and 'after' in var_item:
                    all_replacements.append((var_item['before'], var_item['after']))

    # 2. Sort replacements by the length of the 'before' string in descending order.
    # This is crucial to avoid issues where a shorter 'before' string is a
    # substring of a longer one (e.g., replacing "var" before "variable").
    all_replacements.sort(key=lambda x: len(x[0]), reverse=True)

    # 3. Perform the replacements
    modified_code = source_code_str
    for old_name, new_name in all_replacements:
        # Use word boundaries (\b) to ensure we only replace whole words.
        # re.escape is used to handle cases where old_name might contain regex special characters.
        pattern = r'\b' + re.escape(old_name) + r'\b'
        modified_code = re.sub(pattern, new_name, modified_code)

    return modified_code


if __name__ == "__main__":
  config = set_config()
  if not config:
    print("Bad configuration, please start over.")
    sys.exit(1)

  bmark_list = config['bmark_list']
  root_path = config['root_path']
  scopes = {'global', 'struct', 'function'}

  for bmark in bmark_list:
    os.chdir(os.path.join(root_path, bmark))
    name_file = open('varname.json', 'r')
    names = json.load(name_file)
    
    source_file = open(bmark+'_cpu.c', 'r')
    source_code = source_file.read()

    mod_code = apply_variable_name_replacements(source_code, names)

    mod_file = open(bmark+'_varname.c', 'w')
    mod_file.write(mod_code)

    #for scope in names:
    #    if 'global' in scope:
    #        replaceGlobals(names[scope])
    #    elif 'struct' in scope:
    #    
    #    elif 'function' in scope:

    #    else:
    #        print("FAULTY JSON FILE: UNKNOWN SCOPE\n")
    #        sys.exit()

    name_file.close()
    source_file.close()
    mod_file.close()

#  print("\n\n### Experiment Start ####")
#
#  clean_all_bmarks(config['root_path'], config['bmark_list'])
#
#  for be in config['tests']:
#    Parallel(n_jobs = config['core_num'])(delayed(run_one)(config['root_path'], bmark, be) for bmark in config['bmark_list'])
#