from matplotlib.ticker import (MultipleLocator, FormatStrFormatter,
                                       AutoMinorLocator)
import numpy as np
import matplotlib
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
import matplotlib.font_manager as fm

NaN = math.nan
nan = math.nan


def eval_geomean(val_list, p_index, only_geo_p):
  geomean_p = 1
  for i in range(0, p_index):
    if (not np.isnan(val_list[i])):
      geomean_p = geomean_p*pow(val_list[i], 1/p_index)

  geomean = 1
  if not only_geo_p:
    for i in range(len(val_list)-1):
      if (not np.isnan(val_list[i]) and i != p_index):
        geomean = geomean*pow(val_list[i], 1/(len(val_list)-2))
  return geomean_p, geomean

def PostProcess(perf_dic, processor):
  key_list_cpu = ['tulip.icx', 'tulip.icx.noelle', 'tulip.clang', 'tulip.gcc', 'tulip.clang.noelle', 'tulip.gcc.noelle', 'polygeist', 'openmp.clang', 'openmp.gcc']
  key_list_nvidia = ['clang_nvidia', 'clang_nvidia.noelle', 'nvhpc.gpu', 'nvhpc.gpu.noelle', 'cuda', 'polygeist_nvidia']
  key_list_amd = ['clang_amd', 'clang_amd.noelle', 'aomp_amd', 'aomp_amd.noelle', 'polygeist_amd', 'hip', 'clang_hip']

  cpu_bmark_list = ['gesummv','fdtd-2d', 'heat-3d', 'atax', 'bicg', 'nussinov', 'lu', 'syrk', 'syr2k', 'seidel-2d', 'gemm', '2mm', '3mm', 'doitgen', 'mvt', 'trmm', 'symm', 'adi', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gemver', 'covariance', 'correlation']
  nvidia_bmark_list = ['covariance', 'correlation', 'trmm', 'heat-3d', 'doitgen', 'nussinov', 'mvt', '3mm', '2mm', 'lu', 'syr2k', 'gemm', 'jacobi-2d-imper', 'symm', 'syrk', 'seidel-2d', 'fdtd-2d', 'jacobi-1d-imper', 'adi', 'gesummv', 'atax', 'bicg', 'gemver']
  amd_bmark_list = ['nussinov', 'doitgen', 'heat-3d', 'trmm', 'covariance', 'syrk', 'jacobi-1d-imper', 'seidel-2d', 'gemver', 'correlation', '3mm', '2mm', 'gemm', 'symm', 'lu', 'mvt',  'syr2k', 'jacobi-2d-imper', 'bicg',  'gesummv', 'atax', 'adi', 'fdtd-2d']

  #which one are we processing right now?
  key_list = []
  limit = 0
  b_list = []
  end = 1
  fail_list = []
  if (processor == "cpu"):
    key_list = key_list_cpu
    b_list = cpu_bmark_list
    limit = 6
    fail_list = ['nussinov', 'covariance', 'correlation']
    end = len(cpu_bmark_list)
  elif (processor == "nvidia"):
    key_list = key_list_nvidia
    b_list = nvidia_bmark_list
    limit = 5
    end = len(nvidia_bmark_list)
  elif (processor == "amd"):
    key_list = key_list_amd
    b_list = amd_bmark_list
    limit = 4
    fail_list = ['nussinov']
    end = len(amd_bmark_list)

  #calculate the speedups
  for bmark in bmark_list:
    for key in key_list:
      if (processor == 'cpu'):
        perf_dic[bmark][key] = perf_dic[bmark]['openmp.clang']/perf_dic[bmark][key]
      elif (processor == 'nvidia'):
        if (key != 'cuda'):
          perf_dic[bmark][key] = perf_dic[bmark]['cuda']/perf_dic[bmark][key]
      elif (processor == 'amd'):
        if (key != 'hip'):
          perf_dic[bmark][key] = perf_dic[bmark]['hip']/perf_dic[bmark][key]

  perf_dic['geomean'] = {}
  perf_dic['geomean_p'] = {}

  for key in key_list:
    geo = 1
    for i in range(0, limit):
      if (not np.isnan(perf_dic[b_list[i]][key]) and not (b_list[i] in fail_list)):
        geo = geo*pow(perf_dic[b_list[i]][key], 1/limit)
      perf_dic['geomean_p'][key] = geo
    print("SUSAN:")
    print(key)
    print(perf_dic['geomean_p'][key])


  for key in key_list:
    geo = 1
    for i in range(0, len(b_list)):
      if (not np.isnan(perf_dic[b_list[i]][key]) and not (b_list[i] in fail_list)):
        geo = geo*pow(perf_dic[b_list[i]][key], 1/len(b_list))
      perf_dic['geomean'][key] = geo

def Plot(perf_dic, bmark_list, cpu_manual_data, nvidia_manual_data, amd_manual_data):
  barWidthCPU=0.3
  barWidthNV = 0.3 #include nvcc
  barWidthAMD = 0.3

  tulip_clang_list = []
  tulip_gcc_list = []
  tulip_icx_list =[]
  cpu_max_list = []
  cpu_manual = []
  cpu_loc_data = {'gesummv': 20, 'fdtd-2d': 21, 'heat-3d': 22, 'atax': 15, 'bicg': 18, 'nussinov': 4}
  cpu_loc = []

  amd_list = []
  amd_aomp_list = []
  amd_aomp_noelle_list = []
  amd_noelle_list = []
  clang_hip_list = []
  aomp_hip_list = []
  amd_max_list = []
  amd_manual = []
  amd_loc_data = {'nussinov': 6, 'correlation': 41, 'covariance': 7 , 'trmm': 19, 'doitgen': 3, 'heat-3d': 3}
  amd_loc = []

  nvidia_list = []
  nvidia_noelle_list = []
  nvhpc_list = []
  nvhpc_noelle_list = []
  nvidia_max_list = []
  nvidia_nvcc_list = []
  nvidia_manual = []
  nvidia_loc_data = {'nussinov': 5, 'correlation': 41, 'covariance': 7, 'trmm': 19, 'doitgen': 3, 'heat-3d': 3}
  nvidia_loc = []

  polygeist_list = []
  polygeist_nvidia_list = []
  polygeist_amd_list = []

  counter = 0
  #cpu_bmark_list = ['2mm', '3mm', 'adi', 'atax', 'bicg', 'covariance', 'correlation', 'doitgen', 'fdtd-2d', 'gemm', 'gemver', 'gesummv','heat-3d', 'jacobi-1d-imper', 'jacobi-2d-imper',  'lu', 'mvt', 'nussinov', 'trmm', 'syrk', 'syr2k', 'seidel-2d', 'symm', 'geomean']
  cpu_bmark_list = ['gesummv','lu', 'mvt', 'gemver', 'atax', 'bicg', 'seidel-2d', 'heat-3d', 'fdtd-2d',  'syrk', 'syr2k', 'adi', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gemm', '2mm', '3mm', 'doitgen', 'trmm', 'symm', 'covariance', 'correlation', 'nussinov','geomean']
  nvidia_bmark_list = ['gesummv','lu', 'mvt', 'gemver', 'atax', 'bicg', 'seidel-2d', 'heat-3d', 'fdtd-2d',  'syrk', 'syr2k', 'adi', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gemm', '2mm', '3mm', 'doitgen', 'trmm', 'symm', 'covariance', 'correlation', 'nussinov','geomean']
  amd_bmark_list = ['gesummv','lu', 'mvt', 'gemver', 'atax', 'bicg', 'seidel-2d', 'heat-3d', 'fdtd-2d',  'syrk', 'syr2k', 'adi', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gemm', '2mm', '3mm', 'doitgen', 'trmm', 'symm', 'covariance', 'correlation', 'nussinov','geomean']
  #nvidia_bmark_list = ['covariance', 'correlation', 'trmm', 'heat-3d', 'doitgen', 'nussinov', 'mvt', '3mm', '2mm', 'lu', 'syr2k', 'gemm', 'jacobi-2d-imper', 'symm', 'syrk', 'seidel-2d', 'fdtd-2d', 'jacobi-1d-imper', 'adi', 'gesummv', 'atax', 'bicg', 'gemver', 'geomean']
  #amd_bmark_list = ['doitgen', 'heat-3d', 'trmm', 'covariance', 'nussinov', 'syrk', 'jacobi-1d-imper', 'seidel-2d', 'gemver', 'correlation', '3mm', '2mm', 'gemm', 'symm', 'lu', 'mvt',  'syr2k', 'jacobi-2d-imper', 'bicg',  'gesummv', 'atax', 'adi', 'fdtd-2d', 'geomean']

  for bmark in cpu_bmark_list:
    #CPU generate lists
    tulip_clang_list.append(max([perf_dic[bmark]['tulip.clang'], perf_dic[bmark]['tulip.clang.noelle']]))
    tulip_gcc_list.append(max([perf_dic[bmark]['tulip.gcc'], perf_dic[bmark]['tulip.gcc.noelle']]))
    tulip_icx_list.append(max([perf_dic[bmark]['tulip.icx'], perf_dic[bmark]['tulip.icx.noelle']]))
    polygeist_list.append(perf_dic[bmark]['polygeist'])
    cpu_max_list.append(max([tulip_clang_list[counter], tulip_gcc_list[counter],
                             tulip_icx_list[counter]]))
    counter += 1
  geomean_p, geomean = eval_geomean(cpu_max_list, 6, 0)
  open_mp_geomean_p = 0
  #cpu_max_list[6] = geomean_p
  cpu_max_list[-1] = geomean

  counter = 0
  for bmark in nvidia_bmark_list:
    #GPU generate lists
    nvidia_list.append(max([perf_dic[bmark]['clang_nvidia'], perf_dic[bmark]['clang_nvidia.noelle']]))
    nvhpc_list.append(max([perf_dic[bmark]['nvhpc.gpu'], perf_dic[bmark]['nvhpc.gpu.noelle']]))
    polygeist_nvidia_list.append(perf_dic[bmark]['polygeist_nvidia'])
    nvidia_nvcc_list.append(perf_dic[bmark]['cuda'])
    #if bmark in nvidia_manual_data:
    #  nvidia_manual.append(nvidia_manual_data[bmark])
    #  nvidia_max_list.append(max([nvidia_list[counter], nvhpc_list[counter], nvidia_manual[counter]]))
    #  if (bmark != 'geomean_p'):
    #    nvidia_loc.append(nvidia_loc_data[bmark])
    #else:
    nvidia_max_list.append(max([nvidia_list[counter], nvhpc_list[counter]]))
    counter += 1
  geomean_p, geomean = eval_geomean(nvidia_max_list, 6, 0)
  #nvidia_max_list[6] = geomean_p

  nvidia_max_list[-1] = geomean

  #clang_hip and hip
  counter = 0
  for bmark in amd_bmark_list:
    amd_list.append(max(perf_dic[bmark]['clang_amd'], perf_dic[bmark]['clang_amd.noelle']))
    amd_aomp_list.append(max(perf_dic[bmark]['aomp_amd'], perf_dic[bmark]['aomp_amd.noelle']))
    polygeist_amd_list.append(perf_dic[bmark]['polygeist_amd'])
    amd_max_list.append(max([amd_list[counter], amd_aomp_list[counter]]))
    aomp_hip_list.append(perf_dic[bmark]['hip'])
    clang_hip_list.append(perf_dic[bmark]['clang_hip'])
    counter += 1

  cpu_bmark_list[cpu_bmark_list.index("geomean")] = "geomean"
  nvidia_bmark_list[nvidia_bmark_list.index("geomean")] = "geomean"
  amd_bmark_list[amd_bmark_list.index("geomean")] = "geomean"

  #cpu_bmark_list[cpu_bmark_list.index("geomean_p")] = "geomean\n(manual)"
  #nvidia_bmark_list[nvidia_bmark_list.index("geomean_p")] = "geomean\n(manual)"
  #amd_bmark_list[amd_bmark_list.index("geomean_p")] = "geomean\n(manual)"

  #CPU
  clang_pos = [2 * i for i in range(len(cpu_bmark_list))]
  gcc_pos = [x + barWidthCPU for x in clang_pos]
  icx_pos = [x + barWidthCPU for x in gcc_pos]
  #tulip_programmer_pos = [icx_pos[i] + barWidthCPU for i in range(len(cpu_manual))]
  cpu_max_pos = [icx_pos[i] + barWidthCPU if i < 0 else icx_pos[i] + barWidthCPU for i in range(len(icx_pos))]
  polygeist_cpu_pos = [x + barWidthCPU for x in cpu_max_pos]

  #NVIDIA GPUs
  nvidia_pos = [2 * i for i in range(len(nvidia_bmark_list))]
  nvhpc_pos = [x + barWidthNV for x in nvidia_pos]
  #nvidia_programmer_pos = [nvhpc_pos[i] + barWidthCPU for i in range(len(nvidia_manual))]
  nvidia_max_pos = [nvhpc_pos[i] + barWidthNV if i < 0 else nvhpc_pos[i] + barWidthNV for i in range(len(nvhpc_pos))]
  polygeist_nvidia_pos =  [x + barWidthNV for x in nvidia_max_pos]
  nvidia_nvcc_pos = [x + barWidthNV for x in polygeist_nvidia_pos]

  #AMD GPUs
  amd_pos = [2 * i for i in range(len(amd_bmark_list))]
  amd_aomp_pos = [x + barWidthAMD for x in amd_pos]
  #amd_programmer_pos = [amd_aomp_pos[i] + barWidthAMD for i in range(len(amd_manual))]
  amd_max_pos = [amd_aomp_pos[i] + barWidthAMD if i < 0 else amd_aomp_pos[i] + barWidthAMD for i in range(len(amd_aomp_pos))]
  polygeist_amd_pos = [x + barWidthAMD for x in amd_max_pos]
  clang_hip_pos = [x + barWidthAMD for x in polygeist_amd_pos]
  hip_pos = [x + barWidthAMD for x in clang_hip_pos]
  color_scheme = ['#F94144', '#F8961E', '#F9C74F', '#90BE6D', '#43AA8B', '#277DA1']
  color_dic = { 'clang' : color_scheme[0], 'gcc' : color_scheme[1], 'icx': color_scheme[2], 'cpu_programmer' : color_scheme[5],
                'nvidia' : color_scheme[0] , 'nvhpc': color_scheme[1], 'nvidia_programmer' : color_scheme[4], 'nvcc': color_scheme[5],
                'amd': color_scheme[0], 'amd.aomp': color_scheme[1], 'amd_programmer' : color_scheme[2],  'aomp_hip' : color_scheme[4], 'clang_hip' : color_scheme[5],
                'polygeist' : color_scheme[3]}
  style_dic = { 'noelle' : '//', 'van' : '' , 'programmer': '.'}

  better = 0
  for i in range(len(amd_max_list)):
    if (amd_max_list[i] > 1) and amd_bmark_list[i] != 'geomean\n(manual)' and amd_bmark_list[i] != 'geomean':
      better += 1

  #FIGURE 3 BEGIN
  fig, (ax1, ax2, ax3, ax4) = plt.subplots(4, figsize=(15, 20), sharex=False, sharey=False, gridspec_kw={'height_ratios': [1, 1, 1, 0]})
  #FONTS here
  plt.rc('axes', axisbelow=True)
  ax1.tick_params(axis='both', which='major', width=3, length=10)

  ax1.bar(clang_pos, tulip_clang_list, color=color_scheme[0], width=barWidthCPU,zorder=2000)
  ax1.bar(gcc_pos, tulip_gcc_list, color=color_scheme[1], width=barWidthCPU, zorder=2000)
  ax1.bar(icx_pos, tulip_icx_list, color=color_scheme[2], width=barWidthCPU, zorder=2000)
  ax1.bar(polygeist_cpu_pos, polygeist_list, color=color_scheme[3], width=barWidthCPU, zorder=2000)
  #ax1.bar(tulip_programmer_pos, cpu_manual, color=color_scheme[4], width=barWidthCPU, zorder=3000)
  ax1.bar(cpu_max_pos, cpu_max_list, color=color_scheme[5], width=barWidthCPU, zorder=3000)

  average_loc = 0
  #plot loc changes for cpu
  #plt.text(i, values[i], str(values[i]), ha='center', va='bottom')
  #for i in range(len(cpu_loc)):
  #  average_loc += cpu_loc[i]
    #ax1.text(tulip_programmer_pos[i], cpu_manual[i] + 0.1, str(cpu_loc[i]), color='black', ha='center', va='bottom', fontsize=20, weight='bold')
  #average_loc = average_loc / len(cpu_loc)
  #ax1.text(tulip_programmer_pos[i+1], cpu_manual[i+1] + 0.1, str(round(average_loc)), color='black', ha='center', va='bottom', fontsize=20, weight='bold')

  #add polygeist number callouts
  #for i in range(len(polygeist_list)):
  #  if (polygeist_list[i] < 0.1):
  #    ax1.text(polygeist_cpu_pos[i] + 0.1, polygeist_list[i]+0.1, str(round(polygeist_list[i], 2)), color='black', ha='center', va='bottom', fontsize=15, rotation=90)
  #dummy data
  ax1.bar([0], [0], color=color_scheme[0],  label='CUDA → Tulip → OpenMP → Clang → CPU')
  ax1.bar([0], [0], color=color_scheme[5],  label=('Tulip Best'))
  ax1.bar([0], [0], color=color_scheme[1],  label='CUDA → Tulip → OpenMP → GCC → CPU')
  ax1.bar([0], [0], color=color_scheme[3],  label='CUDA → Polygeist → CPU')
  ax1.bar([0], [0], color=color_scheme[2],  label='CUDA → Tulip → OpenMP → ICX → CPU')

  ax1.grid(True, axis='y', which='major', linestyle='--', linewidth=1, color='gray', zorder=0)
  yticks_label = [1, 2, 4, 8, 16, 32, 64, 128, 256]
  yticks_log = [x for x in yticks_label]
  ax1.axhline(y=0, zorder=100)
  ax1.tick_params(axis='both', which='major', width=3, length=10)

  ax2.tick_params(axis='both', which='major', width=3, length=10)
  ax2.tick_params(axis='both', which='major', width=3, length=10)
  ax2.bar(nvidia_pos, nvidia_list, color=color_scheme[0],  width=barWidthNV, zorder=3)
  ax2.bar(nvhpc_pos, nvhpc_list, color=color_scheme[1],   width=barWidthNV, zorder=3)
  #ax2.bar(nvidia_programmer_pos, nvidia_manual, color=color_scheme[2], width=barWidthNV, zorder=3)
  ax2.bar(nvidia_max_pos, nvidia_max_list, color=color_scheme[5], width=barWidthNV, zorder=3)
  ax2.bar(polygeist_nvidia_pos, polygeist_nvidia_list, color=color_scheme[3], width=barWidthNV, zorder=3)

  #figure 4 legend
  ax2.bar([0], [0], color=color_scheme[0], label=' CUDA → Tulip → OpenMP → Clang → A100')
  ax2.bar([0], [0], color=color_scheme[5], label='Tulip Best')
  ax2.bar([0], [0], color=color_scheme[1],  label=' CUDA → Tulip → OpenMP → NVHPC → A100')
  ax2.bar([0], [0], color=color_scheme[3], label=' CUDA → Polygeist → A100')

  average_loc = 0
  #plot loc for nvidia
  #for i in range(len(nvidia_loc)):
  #  average_loc += nvidia_loc[i]
  #  ax2.text(nvidia_programmer_pos[i], nvidia_manual[i], str(nvidia_loc[i]), ha='center', va='bottom', color='black', fontsize=20, weight='bold')
  #average_loc = average_loc / len(nvidia_loc)
  #ax2.text(nvidia_programmer_pos[i+1], nvidia_manual[i+1], str(round(average_loc)), ha='center', va='bottom', color='black', fontsize=20, weight='bold')

  #figure 4
  #style the second figure
  ax2.grid(True, axis='y', which='major', linestyle='--', linewidth=1, color='gray', zorder=0)
  ax2.patch.set_visible(False)
  ax2.axhline(0,  zorder=100)
  ax2.plot(1, 0)

  #FIGURE 4 END
  ax3.tick_params(axis='both', which='major', width=3, length=10)

  ax3.bar(amd_pos, amd_list, color=color_scheme[0], width=barWidthAMD, zorder=10)
  ax3.bar(amd_aomp_pos, amd_aomp_list, color=color_scheme[1], width=barWidthAMD, zorder=10)
  #ax3.bar(amd_programmer_pos, amd_manual, color=color_scheme[2], width=barWidthAMD, zorder=10)
  ax3.bar(amd_max_pos, amd_max_list, color=color_scheme[5], width=barWidthAMD, zorder=10)
  ax3.bar(polygeist_amd_pos, polygeist_amd_list, color=color_scheme[3], width=barWidthAMD, zorder=10)
  ax3.bar(clang_hip_pos, clang_hip_list, color=color_scheme[4], width=barWidthAMD, zorder=10)

  #callouts for amd
  for i in range(len(amd_list)):
    if (amd_list[i] < 0.1):
      ax3.text(amd_pos[i] + barWidthAMD/2, amd_list[i]+0.1, str(round(amd_list[i], 2)), color='black', ha='center', va='bottom', fontsize=15, rotation=90)
  #plot loc of amd
  average_loc = 0
  #for i in range(len(amd_loc)):
  #  average_loc += amd_loc[i]
  #  ax3.text(amd_programmer_pos[i], amd_manual[i]+0.1, str(amd_loc[i]), ha='center', va='bottom', color='black', fontsize=20, weight='bold')
  #average_loc = average_loc / len(amd_loc)
  #ax3.text(amd_programmer_pos[i+1], amd_manual[i+1]+0.1, str(round(average_loc)), color='black', ha='center', va='bottom', fontsize=20, weight='bold')

  #(CUDA→Tulip→NVIDIA) Max → Programmer
  ax3.bar([0], [0], color=color_scheme[0], label='CUDA → Tulip → OpenMP → Clang → MI210')
  ax3.bar([0], [0], color=color_scheme[5], label='Tulip Best')
  ax3.bar([0], [0], color=color_scheme[1], label='CUDA → Tulip → OpenMP → AOMP → MI210')
  ax3.bar([0], [0], color=color_scheme[3], label='CUDA → Polygeist → MI210')
  ax3.bar([0], [0], color=color_scheme[4], label='CUDA → HIPIFY → HIP → Clang → MI210')
  ax3.plot(np.NaN, np.NaN, '-', color='none', label='')

  ax3.set_zorder(-1)
  ax3.grid(True, axis='y', which='major', linestyle='--', linewidth=1, color='gray', zorder=0)
  ax3.tick_params(axis='y', which='minor', left=False)
  ax1.axhline(y = 1, color='black', linewidth=2, zorder=0, label=("OpenMP → Clang → CPU"))
  #ax1.axvline(x = 13.5, color='black', linestyle='--', zorder=5)
  #ax2.axvline(x = 13.75, color='black', linestyle='--', zorder=5)
  ax2.axhline(y = 1, color='black', linewidth=2, zorder=0, label="CUDA → NVCC → A100")
  #ax3.axvline(x = 11.7, color='black', linestyle='--', zorder=5)
  ax3.axhline(y = 1, color='black', linewidth=2, zorder=0, label="HIP → HIPCC → MI210")
  ax1.set_ylabel("CPU\nSpeedup (x)", fontsize=25, rotation=90)
  ax3.set_ylabel("MI210\nSpeedup (x)", fontsize=25, rotation=90)
  ax2.set_ylabel("A100\nSpeedup (x)", fontsize=25, rotation=90)

  for i in range(len(polygeist_list)):
    if (np.isnan(polygeist_list[i])):
      ax1.text(polygeist_cpu_pos[i], 0.2, 'X', color='red', fontsize=30, ha='center', va='center', zorder=1000000000)

  for i in range(len(polygeist_nvidia_list)):
    if (np.isnan(polygeist_nvidia_list[i])):
      ax2.text(polygeist_nvidia_pos[i], 0.25, 'X', color='red', fontsize=30, ha='center', va='center', zorder=1000000)
    if (np.isnan(polygeist_amd_list[i])):
      ax3.text(polygeist_amd_pos[i], 0.1, 'X', color='red', fontsize=30, ha='center', va='center', zorder=1000000)

  ax1.set_xticks([2 * r + barWidthCPU*1.5 for r in range(len(cpu_bmark_list))], cpu_bmark_list, rotation=-45, fontsize=22, ha="left")
  ax2.set_xticks([2 * r + barWidthNV*1.5 for r in range(len(nvidia_bmark_list))], nvidia_bmark_list, rotation=-45, fontsize=22, ha="left")
  ax3.set_xticks([2 * r + barWidthAMD*1.5 for r in range(len(amd_bmark_list))], amd_bmark_list, rotation=-45, fontsize=22, ha="left")

  yticks_label = [0, 1, 2, 3, 4, 5]
  yticks_log = [x for x in yticks_label]
  ax1.set_yticks(yticks_log, yticks_label, fontsize=22)

  yticks_label = [0, 0.5,  1, 1.5, 2]
  yticks_log = [x for x in yticks_label]
  ax2.set_yticks(yticks_log, yticks_label, fontsize=22)


  yticks_label = [0, 1,  2, 3]
  yticks_log = [x for x in yticks_label]
  ax3.set_yticks(yticks_log, yticks_label, fontsize=22)


  ax1.set_xlim(min(clang_pos) - 1.5 * barWidthCPU, max(polygeist_cpu_pos) + 1.5 * barWidthCPU)
  ax1.set_ylim(0, 5)
  ax1.text((min(clang_pos) - 1.5 * barWidthCPU + max(polygeist_cpu_pos) + 1.5 * barWidthCPU)/2, -2, "(a)", fontsize=30, ha='center', va='center_baseline', position=(24, -2.1))

  ax2.set_xlim(min(nvidia_pos) - 1.5 * barWidthNV, max(nvidia_nvcc_pos) + 1.5 * barWidthNV)
  ax2.text((min(nvidia_pos) - 1.5 * barWidthNV + max(nvidia_nvcc_pos) + 1.5 * barWidthNV)/2, -0.75, "(b)", fontsize=30, ha='center', va='center_baseline', position=(24, -1))
  ax2.set_ylim(0, 2)

  ax3.set_xlim(min(amd_pos) - 1.5 * barWidthAMD, max(hip_pos) + 1.5 * barWidthAMD)
  ax3.text((min(amd_pos) - 1.5 * barWidthAMD +  max(hip_pos) + 1.5 * barWidthAMD)/2, -1, "(c)", fontsize=30, ha='center', va='center_baseline', position=(24, -1.5))
  ax3.set_ylim(0, 3)

  plot_width = plt.gca().get_position().width

  #change the order of the labels
  handles, labels = ax1.get_legend_handles_labels()
  handles = [handles[1], handles[2], handles[3], handles[4], handles[5], handles[0]]  # Reorder handles
  labels =  [labels[1], labels[2], labels[3], labels[4], labels[5], labels[0]]    # Reorder labels
  ax1.legend(handles, labels, loc='upper center', bbox_to_anchor= (0.5, 1.6, 0, 0), ncol=2, shadow=True,
                      borderaxespad=0, fontsize=19, frameon=True, columnspacing=1)

  handles, labels = ax2.get_legend_handles_labels()
  handles = [handles[1], handles[2], handles[3], handles[4], handles[0]]  # Reorder handles
  labels =  [labels[1], labels[2], labels[3], labels[4], labels[0]]    # Reorder labels
  ax2.legend(handles, labels, loc='upper center', bbox_to_anchor= (0.5, 1.6, 0, 0), shadow=True, ncol=2,
                      borderaxespad=0, fontsize=20, frameon=True, columnspacing=1)
  handles, labels = ax3.get_legend_handles_labels()
  handles = [handles[1], handles[2], handles[3], handles[4], handles[5], handles[0]]  # Reorder handles
  labels =  [labels[1], labels[2], labels[3], labels[4], labels[5], labels[0]]    # Reorder labels
  ax3.legend(handles, labels, loc='upper center', bbox_to_anchor= (0.5, 1.6, 0, 0), shadow=True, ncol=2,
                      borderaxespad=0, frameon=True, fontsize = 19)

  ax3.plot(1, -1)
  ax4.plot(1, -2)
  ax4.axis('off')
  plt.autoscale()
  plt.tight_layout()
  plt.subplots_adjust(hspace=2)
  plt.savefig('tulip_tooling.pdf')

  #anything print
  #print(cpu_manual[-1] / tulip_gcc_list[6])
  #print(nvidia_manual[-1] / nvhpc_list[6])
  #print(amd_manual[-1] / amd_aomp_list[5])
  #print(cpu_manual[-1] / polygeist_list[6])
  #print(nvidia_manual[-1] / polygeist_nvidia_list[6])
  #print(amd_manual[-1] / polygeist_amd_list[5])
  print(amd_max_list[-1] / clang_hip_list[-1])
  return True

  #script start

bmark_list = ['syrk', 'syr2k', 'gemm', '2mm', '3mm', 'doitgen', 'adi', 'mvt', 'lu', 'symm', 'covariance', 'correlation',
              'trmm', 'cholesky', 'nussinov', 'seidel-2d', 'heat-3d', 'fdtd-2d', 'jacobi-1d-imper', 'jacobi-2d-imper',
              'gesummv', 'atax',  'bicg', 'gemver']

#CPU raw data
open_mp_data = {'syrk': {'openmp.clang': 3.151005213, 'openmp.gcc': 2.962418888}, 'syr2k': {'openmp.clang': 5.702513541, 'openmp.gcc': 5.325096491}, 'gemm': {'openmp.clang': 2.765965144, 'openmp.gcc': 2.7138719349999993}, '2mm': {'openmp.clang': 5.465365332000001, 'openmp.gcc': 5.32109589}, '3mm': {'openmp.clang': 8.067675371, 'openmp.gcc': 7.972494205}, 'doitgen': {'openmp.clang': 7.089374428, 'openmp.gcc': 6.858784693}, 'adi': {'openmp.clang': 17.769581958, 'openmp.gcc': 14.33875102}, 'fdtd-2d': {'openmp.clang': 33.702085144, 'openmp.gcc': 22.921810519}, 'gemver': {'openmp.clang': 2.119190516, 'openmp.gcc': 1.620315148}, 'jacobi-1d-imper': {'openmp.clang': 9.512151277, 'openmp.gcc': 8.304966811}, 'jacobi-2d-imper': {'openmp.clang': 50.95649528, 'openmp.gcc': 26.777532903}, 'mvt': {'openmp.clang': 2.081878086, 'openmp.gcc': 1.5297980459999998}, 'atax': {'openmp.clang': 2.036154218, 'openmp.gcc': 1.5358685539999999}, 'bicg': {'openmp.clang': 2.007967939, 'openmp.gcc': 1.518123998}, 'gesummv': {'openmp.clang': 2.738267521, 'openmp.gcc': 2.223889989}, 'symm': {'openmp.clang': 4.768355411, 'openmp.gcc': 4.436218545}, 'lu': {'openmp.clang': 40.531044956, 'openmp.gcc': 34.875182864}, 'covariance': {'openmp.clang': 37.520758885, 'openmp.gcc': 35.897269294}, 'correlation': {'openmp.clang': 34.018642882, 'openmp.gcc': 36.272509025}, 'trmm': {'openmp.clang': 16.434680129, 'openmp.gcc': 16.054902584}, 'cholesky': {'openmp.clang': 191.501171247, 'openmp.gcc': 175.615461472}, 'nussinov': {'openmp.clang': 12.314390724000003, 'openmp.gcc': 12.913475634000001}, 'seidel-2d': {'openmp.clang': 3.908942618, 'openmp.gcc': 2.9980231150000005}, 'heat-3d': {'openmp.clang': 113.817222004, 'openmp.gcc': 50.635959782}, 'geomean': {'openmp.clang': 9.977552465703043, 'openmp.gcc': 8.345581682005689}}
cpu_raw_data = {'syrk': {'seq': 73.338241415, 'tulip.clang': 1.8280801169999998, 'tulip.gcc': 1.750772412, 'tulip.clang.noelle': 1.655752899, 'tulip.gcc.noelle': 1.701079875}, 'syr2k': {'seq': 137.036565477, 'tulip.clang': 3.839399857, 'tulip.gcc': 3.2529428110000005, 'tulip.clang.noelle': 3.46933337, 'tulip.gcc.noelle': 2.870104961}, 'gemm': {'seq': 63.121180737, 'tulip.clang': 2.795003285, 'tulip.gcc': 2.778589224, 'tulip.clang.noelle': 2.761135583, 'tulip.gcc.noelle': 2.784395836}, '2mm': {'seq': 126.059552606, 'tulip.clang': 5.510902588, 'tulip.gcc': 5.479939078, 'tulip.clang.noelle': 5.415460974, 'tulip.gcc.noelle': 5.499143966}, '3mm': {'seq': 189.363266873, 'tulip.clang': 8.250468217, 'tulip.gcc': 8.13614789, 'tulip.clang.noelle': 8.072402523, 'tulip.gcc.noelle': 8.187888522}, 'doitgen': {'seq': 144.331023711, 'tulip.clang': 7.089256624, 'tulip.gcc': 6.806267156, 'tulip.clang.noelle': 6.518470348000001, 'tulip.gcc.noelle': 6.280963154}, 'adi': {'seq': 170.47087058300002, 'tulip.clang': 14.167350001, 'tulip.gcc': 15.692616621000003, 'tulip.clang.noelle': 12.218786398, 'tulip.gcc.noelle': 15.331356468}, 'fdtd-2d': {'seq': 132.766485507, 'tulip.clang': 27.535118953, 'tulip.gcc': 24.910092271000003, 'tulip.clang.noelle': 22.528452647, 'tulip.gcc.noelle': 22.2628806}, 'gemver': {'seq': 7.169985635, 'tulip.clang': 2.098655557, 'tulip.gcc': 2.083024989, 'tulip.clang.noelle': 0.586763794, 'tulip.gcc.noelle': 0.544894892}, 'jacobi-1d-imper': {'seq': 85.418097921, 'tulip.clang': 9.867681424, 'tulip.gcc': 8.642141653, 'tulip.clang.noelle': 5.198069236, 'tulip.gcc.noelle': 5.608256373}, 'jacobi-2d-imper': {'seq': 411.527598952, 'tulip.clang': 56.087156272, 'tulip.gcc': 37.01487089, 'tulip.clang.noelle': 51.731023322, 'tulip.gcc.noelle': 34.796308889}, 'mvt': {'seq': 6.8356153840000005, 'tulip.clang': 2.008388977, 'tulip.gcc': 1.969050121, 'tulip.clang.noelle': 0.539865251, 'tulip.gcc.noelle': 0.490412596}, 'atax': {'seq': 6.851473644999999, 'tulip.clang': 2.013279298, 'tulip.gcc': 1.9624310999999999, 'tulip.clang.noelle': 0.566373867, 'tulip.gcc.noelle': 0.493993645}, 'bicg': {'seq': 1.996477994, 'tulip.clang': 2.019423762, 'tulip.gcc': 1.988285447, 'tulip.clang.noelle': 0.540253339, 'tulip.gcc.noelle': 0.498727339}, 'gesummv': {'seq': 2.866024716, 'tulip.clang': 2.774752129, 'tulip.gcc': 2.6553239159999995, 'tulip.clang.noelle': 0.648304947, 'tulip.gcc.noelle': 0.557149098}, 'symm': {'seq': 70.013963794, 'tulip.clang': 5.656768408, 'tulip.gcc': 5.629368401, 'tulip.clang.noelle': 5.577442193, 'tulip.gcc.noelle': 5.256328697}, 'lu': {'seq': 457.76658535, 'tulip.clang': 10.146009453, 'tulip.gcc': 9.823369014, 'tulip.clang.noelle': 9.646662658, 'tulip.gcc.noelle': 8.783055622}, 'covariance': {'seq': 636.928358837, 'tulip.clang': 34.22797498, 'tulip.gcc': 35.048900632, 'tulip.clang.noelle': 34.290979651, 'tulip.gcc.noelle': 34.090552605}, 'correlation': {'seq': 655.0841152780001, 'tulip.clang': 34.067715379, 'tulip.gcc': 32.680009388, 'tulip.clang.noelle': 33.7956517, 'tulip.gcc.noelle': 34.719186368}, 'trmm': {'seq': 330.571691073, 'tulip.clang': 15.133161455, 'tulip.gcc': 14.175562479, 'tulip.clang.noelle': 14.507071592, 'tulip.gcc.noelle': 14.214987052999998}, 'cholesky': {'seq': 2750.350662262, 'tulip.clang': 174.84262648499998, 'tulip.gcc': 182.265274826, 'tulip.clang.noelle': 175.185278988, 'tulip.gcc.noelle': 181.902005285}, 'nussinov': {'seq': 229.008228564, 'tulip.clang': 34.792506768, 'tulip.gcc': 29.041187156, 'tulip.clang.noelle': 33.640792616, 'tulip.gcc.noelle': 30.412565415000003}, 'seidel-2d': {'seq': 69.589604241, 'tulip.clang': 3.0091793119999997, 'tulip.gcc': 3.040799826, 'tulip.clang.noelle': 1.88762588, 'tulip.gcc.noelle': 1.856379924}, 'heat-3d': {'seq': 247.664770277, 'tulip.clang': 87.48821414, 'tulip.gcc': 65.727447923, 'tulip.clang.noelle': 81.49014925, 'tulip.gcc.noelle': 60.348613998}, 'geomean': {'seq': 92.65644269659636, 'tulip.clang': 9.104712713654388, 'tulip.gcc': 8.564225422893875, 'tulip.clang.noelle': 6.33171462345791, 'tulip.gcc.noelle': 5.988310188396874}}
cpu_icx_data = {'syrk': {'tulip.icx': 1.764989109, 'tulip.icx.noelle': 1.676645884}, 'syr2k': {'tulip.icx': 3.276763763, 'tulip.icx.noelle': 3.433969704}, 'gemm': {'tulip.icx': 2.8407353550000005, 'tulip.icx.noelle': 2.779620003}, '2mm': {'tulip.icx': 5.660693773, 'tulip.icx.noelle': 5.541129404}, '3mm': {'tulip.icx': 8.319417815, 'tulip.icx.noelle': 8.241261298}, 'doitgen': {'tulip.icx': 6.79766768, 'tulip.icx.noelle': 6.368705467}, 'adi': {'tulip.icx': 16.350907018, 'tulip.icx.noelle': 13.902966052}, 'fdtd-2d': {'tulip.icx': 26.025580708999996, 'tulip.icx.noelle': 22.302123086}, 'gemver': {'tulip.icx': 1.46795079, 'tulip.icx.noelle': 0.600129276}, 'jacobi-1d-imper': {'tulip.icx': 9.45104494, 'tulip.icx.noelle': 5.143236103}, 'jacobi-2d-imper': {'tulip.icx': 48.416892745, 'tulip.icx.noelle': 45.339579172}, 'mvt': {'tulip.icx': 1.359217701, 'tulip.icx.noelle': 0.565823867}, 'atax': {'tulip.icx': 1.366795876, 'tulip.icx.noelle': 0.589999711}, 'bicg': {'tulip.icx': 1.368715507, 'tulip.icx.noelle': 0.562753273}, 'gesummv': {'tulip.icx': 2.062042081, 'tulip.icx.noelle': 0.6638599489999999}, 'symm': {'tulip.icx': 5.889418587, 'tulip.icx.noelle': 5.853099488}, 'lu': {'tulip.icx': 10.394518868, 'tulip.icx.noelle': 8.837720913}, 'covariance': {'tulip.icx': 35.57367195, 'tulip.icx.noelle': 33.418205574}, 'correlation': {'tulip.icx': 34.969175064, 'tulip.icx.noelle': 33.61540037}, 'trmm': {'tulip.icx': 15.167690986, 'tulip.icx.noelle': 15.256947947}, 'cholesky': {'tulip.icx': 164.951390694, 'tulip.icx.noelle': 166.451417981}, 'nussinov': {'tulip.icx': 32.09193305, 'tulip.icx.noelle': 31.280828269}, 'seidel-2d': {'tulip.icx': 3.067365153, 'tulip.icx.noelle': 1.7958573}, 'heat-3d': {'tulip.icx': 83.483494456, 'tulip.icx.noelle': 82.12628604900002}, 'geomean': {'tulip.icx': 8.326742079500674, 'tulip.icx.noelle': 6.3303354510859835}}

cpu_manual_data = {'heat-3d': 47.818263705, 'gesummv': 0.581131046, 'fdtd-2d' : 19.800433907, 'atax': 0.467021787, 'bicg': 0.464219169, 'nussinov': 11.959059109}

#nvidia raw data
nvidia_raw_data = {"syrk": {"cuda": 0.792044022, "clang_cuda": 0.7731823985999999, "nvhpc.gpu": 1.5392546532, "nvhpc.gpu.noelle": 1.4384594218000002, "polygeist_nvidia": 0.7511668955999999, "clang_nvidia": 0.9673696422, "clang_nvidia.noelle": 0.7283646374}, "syr2k": {"cuda": 0.9626293366, "clang_cuda": 0.9800537756000001, "nvhpc.gpu": 2.1801837456, "nvhpc.gpu.noelle": 2.0736395264, "polygeist_nvidia": 0.9896213806, "clang_nvidia": 1.3119608856, "clang_nvidia.noelle": 1.0532365782}, "gemm": {"cuda": 0.399151167, "clang_cuda": 0.4334634086, "nvhpc.gpu": 0.5133166022, "nvhpc.gpu.noelle": 0.46848961479999995, "polygeist_nvidia": 0.4850657584, "clang_nvidia": 0.5509588058, "clang_nvidia.noelle": 0.4716565616}, "2mm": {"cuda": 0.538707302, "clang_cuda": 0.48188383839999993, "nvhpc.gpu": 0.6138646714, "nvhpc.gpu.noelle": 0.48734664639999997, "polygeist_nvidia": 0.5352877902, "clang_nvidia": 0.6074403629999999, "clang_nvidia.noelle": 0.5269647232}, "3mm": {"cuda": 0.6456276022, "clang_cuda": 0.540740318, "nvhpc.gpu": 0.6584809318, "nvhpc.gpu.noelle": 0.5795703437999999, "polygeist_nvidia": 0.5942314066000001, "clang_nvidia": 0.6368171774000001, "clang_nvidia.noelle": 0.5207901668}, "doitgen": {"cuda": 2.1565272202, "clang_cuda": 2.1433020512, "nvhpc.gpu": 4.4344135562, "nvhpc.gpu.noelle": 4.1354730706, "polygeist_nvidia": 2.2660003304000003, "clang_nvidia": 4.9790953666, "clang_nvidia.noelle": 4.589397473}, "adi": {"cuda": 4.2756494794, "clang_cuda": 4.2266762526, "nvhpc.gpu": 4.8349417748, "nvhpc.gpu.noelle": 4.7059995824000005, "polygeist_nvidia": 7.3483525962, "clang_nvidia": 4.5602157256, "clang_nvidia.noelle": 4.2830440664000005}, "fdtd-2d": {"cuda": 3.247305021, "clang_cuda": 3.2426698946, "nvhpc.gpu": 10.5006423124, "nvhpc.gpu.noelle": 10.2580004584, "polygeist_nvidia": 3.6259318194, "clang_nvidia": 3.5873038122, "clang_nvidia.noelle": 3.077058906}, "gemver": {"cuda": 1.2156273653999998, "clang_cuda": 1.2569166086, "nvhpc.gpu": 1.3068634328000002, "nvhpc.gpu.noelle": 0.8333845676000001, "polygeist_nvidia": 1.218894979, "clang_nvidia": 1.3445473238, "clang_nvidia.noelle": 0.8263696526}, "jacobi-1d-imper": {"cuda": 1.5221600346, "clang_cuda": 1.529420633, "nvhpc.gpu": 4.1043874872, "nvhpc.gpu.noelle": 3.8008284668000005, "polygeist_nvidia": 1.6594054628000001, "clang_nvidia": 1.846254578, "clang_nvidia.noelle": 1.3241909447999998}, "jacobi-2d-imper": {"cuda": 3.6236606813999996, "clang_cuda": 3.6076872548, "nvhpc.gpu": 13.2231826726, "nvhpc.gpu.noelle": 12.931009620400001, "polygeist_nvidia": 4.5530631614, "clang_nvidia": 3.7481339858, "clang_nvidia.noelle": 3.2220015661999994}, "mvt": {"cuda": 1.2117032377999999, "clang_cuda": 1.2858083992, "nvhpc.gpu": 1.2909272883999998, "nvhpc.gpu.noelle": 0.8353141878000001, "polygeist_nvidia": 1.2187457233999999, "clang_nvidia": 1.365264078, "clang_nvidia.noelle": 0.8178240835999999}, "atax": {"cuda": 1.1876027120000001, "clang_cuda": 1.2417156474000002, "nvhpc.gpu": 1.2453909754, "nvhpc.gpu.noelle": 0.8109150618000001, "polygeist_nvidia": 1.2735602050000001, "clang_nvidia": 1.3411955596, "clang_nvidia.noelle": 0.8225166456}, "bicg": {"cuda": 1.1879339562, "clang_cuda": 1.2581324129999998, "nvhpc.gpu": 1.2627684237999999, "nvhpc.gpu.noelle": 0.8594846443999999, "polygeist_nvidia": 1.2446627318, "clang_nvidia": 1.3530497432, "clang_nvidia.noelle": 0.8234056264}, "gesummv": {"cuda": 2.0574499192, "clang_cuda": 2.04694036, "nvhpc.gpu": 2.0486567289999997, "nvhpc.gpu.noelle": 1.2538992664, "polygeist_nvidia": 2.0509154312, "clang_nvidia": 2.151112416, "clang_nvidia.noelle": 1.2687008864}, "lu": {"cuda": 1.2221093338, "clang_cuda": 1.252378954, "nvhpc.gpu": 6.0060158462, "nvhpc.gpu.noelle": 5.953439768999999, "polygeist_nvidia": 1.4353048560000001, "clang_nvidia": 1.4530584286, "clang_nvidia.noelle": 1.2726546252}, "symm": {"cuda": 0.443580056, "clang_cuda": 0.5539648398, "nvhpc.gpu": 0.7074794686, "nvhpc.gpu.noelle": 0.5706654181999999, "polygeist_nvidia": 0.4745138416, "clang_nvidia": 0.6211140507999999, "clang_nvidia.noelle": 0.5324005455999999}, "covariance": {"cuda": 0.5763004634000001, "clang_cuda": 0.5760088082, "nvhpc.gpu": 1.383770792, "nvhpc.gpu.noelle": 1.2604640790000001, "polygeist_nvidia": 0.5323991364, "clang_nvidia": 1.6951307675999998, "clang_nvidia.noelle": 1.5148739834000002}, "correlation": {"cuda": 0.49745475219999996, "clang_cuda": 0.5494212546, "nvhpc.gpu": 1.7108042412, "nvhpc.gpu.noelle": 1.5593591719999997, "polygeist_nvidia": 0.5290970441999999, "clang_nvidia": 1.6977791884, "clang_nvidia.noelle": 1.5195883446}, "trmm": {"cuda": 2.6446806636, "clang_cuda": 2.7619966338, "nvhpc.gpu": 2.8740905617999997, "nvhpc.gpu.noelle": 2.8360162716000006, "polygeist_nvidia": 6.4079475606, "clang_nvidia": 3.9905752932, "clang_nvidia.noelle": 3.8498629986}, "cholesky": {"cuda": 0.9333117928, "clang_cuda": 0.9558796524, "nvhpc.gpu": 15.8363114216, "nvhpc.gpu.noelle": 15.740615656, "polygeist_nvidia": 1.0089239676, "clang_nvidia": 27.9167490342, "clang_nvidia.noelle": 27.696635374400003}, "nussinov": {"cuda": 3.7055985506000004, "clang_cuda": 3.6704631452, "nvhpc.gpu": 9.1791031496, "nvhpc.gpu.noelle": 9.08671724, "polygeist_nvidia": 16.2648551084, "clang_nvidia": 8.5482884678, "clang_nvidia.noelle": 8.3159069574}, "seidel-2d": {"cuda": 0.9171820766, "clang_cuda": 0.923837528, "nvhpc.gpu": 1.435132185, "nvhpc.gpu.noelle": 1.2722058876, "polygeist_nvidia": 0.9434946152, "clang_nvidia": 0.9923577590000001, "clang_nvidia.noelle": 0.7279164246000001}, "heat-3d": {"cuda": 4.783536431, "clang_cuda": 4.7990280722000005, "nvhpc.gpu": 35.0687981016, "nvhpc.gpu.noelle": 34.9610792318, "polygeist_nvidia": 6.631462578000001, "clang_nvidia": 40.729746707800004, "clang_nvidia.noelle": 40.100687350399994}, "geomean": {"cuda": 1.2917775828428055, "clang_cuda": 1.3119659373677317, "nvhpc.gpu": 2.60775310456155, "nvhpc.gpu.noelle": 2.2501559325832026, "polygeist_nvidia": 1.5404755172531233, "clang_nvidia": 2.162370304591516, "clang_nvidia.noelle": 1.7409187648444684}}
nvidia_manual_data = {'trmm' : 2.6199752148, 'covariance' : 0.6863395482, 'correlation' : 0.7302273482, "heat-3d" : 4.5381987302, 'doitgen' : 1.1307392055999999, 'nussinov' : 2.5346390029999997}

#amd_raw_data
amd_raw_data = {"syrk": {"clang_hip": 0.8933748642, "polygeist_amd": 0.8926514982, "clang_amd": 0.7649082316, "clang_amd.noelle": 0.712280483}, "syr2k": {"clang_hip": 1.3089681474000001, "polygeist_amd": 1.2955021312000001, "clang_amd": 1.7278984456000002, "clang_amd.noelle": 1.6566670291999999}, "gemm": {"clang_hip": 0.40069023820000005, "polygeist_amd": 0.39893698479999995, "clang_amd": 0.15441916500000002, "clang_amd.noelle": 0.1390185594}, "2mm": {"clang_hip": 0.4867108114, "polygeist_amd": 0.48968312580000006, "clang_amd": 0.21372130820000002, "clang_amd.noelle": 0.2004133676}, "3mm": {"clang_hip": 0.5771075432, "polygeist_amd": 0.5761575822, "clang_amd": 0.270519455, "clang_amd.noelle": 0.2414062884}, "doitgen": {"clang_hip": 1.7632869532, "polygeist_amd": 1.7665994399999998, "clang_amd": 33.82727994, "clang_amd.noelle": 33.6141104704}, "adi": {"clang_hip": 10.4468442292, "polygeist_amd": 9.1582521122, "clang_amd": 8.0250718112, "clang_amd.noelle": 7.9276518262}, "fdtd-2d": {"clang_hip": 4.347278863400001, "polygeist_amd": 4.3274500558, "clang_amd": 3.5448467586000003, "clang_amd.noelle": 3.4026046175999998}, "gemver": {"clang_hip": 1.0408808112, "polygeist_amd": 1.0430867826, "clang_amd": 0.8576152552, "clang_amd.noelle": 0.4762973548}, "jacobi-1d-imper": {"clang_hip": 1.307601933, "polygeist_amd": 1.3036093104, "clang_amd": 1.2162682082, "clang_amd.noelle": 0.8817334525999999}, "jacobi-2d-imper": {"clang_hip": 5.1448805174, "polygeist_amd": 5.1477752422, "clang_amd": 4.110505315399999, "clang_amd.noelle": 3.8343646916000003}, "mvt": {"clang_hip": 1.025821973, "polygeist_amd": 1.0251611882, "clang_amd": 0.840054546, "clang_amd.noelle": 0.46191736099999997}, "atax": {"clang_hip": 1.0252619474, "polygeist_amd": 1.0244893378, "clang_amd": 0.8568940646000001, "clang_amd.noelle": 0.4855739186}, "bicg": {"clang_hip": 1.0279463378, "polygeist_amd": 1.0276061034000001, "clang_amd": 0.8564697628, "clang_amd.noelle": 0.4811469618}, "gesummv": {"clang_hip": 1.7459633073999998, "polygeist_amd": 1.7435351726000001, "clang_amd": 1.5546036094, "clang_amd.noelle": 0.8240695914}, "lu": {"clang_hip": 1.4449824892, "polygeist_amd": 1.441626229, "clang_amd": 1.5012198079999999, "clang_amd.noelle": 1.4656528056}, "symm": {"clang_hip": 0.4896145056, "polygeist_amd": 0.4864254318, "clang_amd": 0.2089418872, "clang_amd.noelle": 0.19376974340000003}, "covariance": {"clang_hip": 0.40317336039999996, "polygeist_amd": 0.4108594496, "clang_amd": 0.657208856, "clang_amd.noelle": 0.6439022386}, "correlation": {"clang_hip": 0.4060036332, "polygeist_amd": 0.4125829644, "clang_amd": 0.6608464152, "clang_amd.noelle": 0.6442423615999999}, "trmm": {"clang_hip": 2.6888608205999995, "polygeist_amd": 2.4402333758, "clang_amd": 2.2580557222, "clang_amd.noelle": 2.2608902096}, "cholesky": {"clang_hip": NaN, "polygeist_amd": 2.841736367, "clang_amd": 35.225622943999994, "clang_amd.noelle": 35.1101834716}, "nussinov": {"clang_hip": 5.9551814302, "polygeist_amd": NaN, "clang_amd": 6.756283916599999, "clang_amd.noelle": 6.7027467404}, "seidel-2d": {"clang_hip": 0.8742259616, "polygeist_amd": 0.8723113838, "clang_amd": 0.6094866904, "clang_amd.noelle": 0.5048539522}, "heat-3d": {"clang_hip": 7.4051655071999996, "polygeist_amd": 7.4759690052, "clang_amd": 237.09405569480003, "clang_amd.noelle": 236.763363738}, "geomean": {"clang_hip": NaN, "polygeist_amd": 1.2986253035685267, "clang_amd": 1.726737517675047, "clang_amd.noelle": 1.4520717878061695}}
amd_aomp_raw_data ={"syrk": {"hip": 0.8963935279999999, "aomp_amd": 0.7130871007999999, "aomp_amd.noelle": 0.6638590929999999}, "syr2k": {"hip": 1.3082533671999999, "aomp_amd": 1.6045452467999999, "aomp_amd.noelle": 1.5336491584000003}, "gemm": {"hip": 0.3984420718, "aomp_amd": 0.1534138274, "aomp_amd.noelle": 0.1460321094}, "2mm": {"hip": 0.489623578, "aomp_amd": 0.21154196079999998, "aomp_amd.noelle": 0.1934039386}, "3mm": {"hip": 0.5787509120000001, "aomp_amd": 0.26392898, "aomp_amd.noelle": 0.2394999336}, "doitgen": {"hip": 1.7651350360000002, "aomp_amd": 23.566656130800002, "aomp_amd.noelle": 23.400005484400005}, "adi": {"hip": 10.5078968362, "aomp_amd": 8.0311697534, "aomp_amd.noelle": 7.9297241868}, "fdtd-2d": {"hip": 4.351591138400001, "aomp_amd": 3.7324756184000005, "aomp_amd.noelle": 3.5654365832}, "gemver": {"hip": 1.0399119004000001, "aomp_amd": 0.8787033093999999, "aomp_amd.noelle": 0.4746136502}, "jacobi-1d-imper": {"hip": 1.305517186, "aomp_amd": 1.2241279134, "aomp_amd.noelle": 0.8835674466}, "jacobi-2d-imper": {"hip": 5.1492546346, "aomp_amd": 4.847135493400001, "aomp_amd.noelle": 4.6287980242}, "mvt": {"hip": 1.0267312098, "aomp_amd": 0.8658503522000001, "aomp_amd.noelle": 0.46343192399999994}, "atax": {"hip": 1.0248603476, "aomp_amd": 0.8435749404000001, "aomp_amd.noelle": 0.4876239804}, "bicg": {"hip": 1.0305194008, "aomp_amd": 0.8458074716000001, "aomp_amd.noelle": 0.4971473921999999}, "gesummv": {"hip": 1.7424548002, "aomp_amd": 1.5529271216, "aomp_amd.noelle": 0.8240583006}, "lu": {"hip": 1.4621442876000001, "aomp_amd": 1.4640275086, "aomp_amd.noelle": 1.4271139722}, "symm": {"hip": 0.487047088, "aomp_amd": 0.20108594600000002, "aomp_amd.noelle": 0.1873572214}, "covariance": {"hip": 0.40567542599999995, "aomp_amd": 0.6622469075999999, "aomp_amd.noelle": 0.6519919182}, "correlation": {"hip": 0.405555669, "aomp_amd": 0.6642992893999999, "aomp_amd.noelle": 0.6596741598}, "trmm": {"hip": 2.5511003718, "aomp_amd": 2.2895151084, "aomp_amd.noelle": 2.2913307416}, "cholesky": {"hip": 0.7911966872, "aomp_amd": 36.0040118002, "aomp_amd.noelle": 35.9127494536}, "nussinov": {"hip": 6.0568220654, "aomp_amd": 6.7619702144, "aomp_amd.noelle": 6.7311825088}, "seidel-2d": {"hip": 0.8735478286, "aomp_amd": 0.6137512740000001, "aomp_amd.noelle": 0.511698678}, "heat-3d": {"hip": 7.4178582866000005, "aomp_amd": 181.8588646914, "aomp_amd.noelle": 181.886177243}, "geomean": {"hip": 1.3486169401047432, "aomp_amd": 1.686175882600514, "aomp_amd.noelle": 1.4242558926501079}}
amd_manual_data = {'heat-3d': 8.6458278614, 'doitgen':  1.0462857706, 'nussinov' : 6.337541912000001, 'trmm' : 2.4326888108, 'covariance' : 0.4156432400000001}

#polygeist raw data
polygeist_cpu_data = {'syrk': {'polygeist': 2.05356323},
                      'syr2k': {'polygeist': 4.60582448},
                      'gemm': {'polygeist': 3.388899315},
                      '2mm': {'polygeist': 6.790630567},
                      '3mm': {'polygeist': 10.480085056},
                      'doitgen': {'polygeist': 9.558917881},
                      'adi': {'polygeist': 15.726883379},
                      'fdtd-2d': {'polygeist': 31.925331837},
                      'gemver': {'polygeist': 134.17008122},
                      'jacobi-1d-imper': {'polygeist': 12.922072526},
                      'jacobi-2d-imper': {'polygeist': 40.814691241},
                      'mvt': {'polygeist': 50.25323367600001},
                      'atax': {'polygeist': 26.471268324},
                      'bicg': {'polygeist': 2.615618109},
                      'gesummv': {'polygeist': 13.814447843},
                      'symm': {'polygeist': 5.900515904},
                      'lu': {'polygeist': 12.389062449},
                      'covariance': {'polygeist': float('nan')},
                      'correlation': {'polygeist': float('nan')},
                      'nussinov': {'polygeist': float('nan')},
                      'cholesky': {'polygeist': float('nan')},
                      'trmm': {'polygeist': 14.754890896},
                      'seidel-2d': {'polygeist': 3.484062702},
                      'heat-3d': {'polygeist': 91.834117297}}
#put together all cpu raw dadta
for bench in bmark_list:
  cpu_raw_data[bench].update(open_mp_data[bench])
  cpu_raw_data[bench].update(cpu_icx_data[bench])
  cpu_raw_data[bench].update(polygeist_cpu_data[bench])

#put together all amd raw data
for bench in bmark_list:
  amd_raw_data[bench].update(amd_aomp_raw_data[bench])

PostProcess(cpu_raw_data,"cpu")
PostProcess(nvidia_raw_data, "nvidia")
PostProcess(amd_raw_data, "amd")

cpu_bmark_list = ['geomean', 'lu', 'syrk', 'syr2k', 'seidel-2d', 'gemm', '2mm', '3mm', 'doitgen', 'mvt', 'covariance', 'correlation', 'trmm', 'adi', 'nussinov', 'fdtd-2d','gesummv', 'symm', 'jacobi-1d-imper', 'jacobi-2d-imper', 'gemver','atax', 'heat-3d', 'bicg']

for key in cpu_manual_data:
    cpu_manual_data[key] = open_mp_data[key]['openmp.clang'] / cpu_manual_data[key]

geo = 1
b_list = []
for bmark in cpu_manual_data:
  b_list.append(cpu_manual_data[bmark])
cpu_manual_data['geomean_p'] = eval_geomean(b_list, len(b_list), 1)[0]

#Nvidia manual data
for key in nvidia_manual_data:
  nvidia_manual_data[key] = nvidia_raw_data[key]['cuda'] / nvidia_manual_data[key]

geo = 1
b_list = []
for bmark in nvidia_manual_data:
  b_list.append(nvidia_manual_data[bmark])
nvidia_manual_data['geomean_p'] = eval_geomean(b_list, len(b_list), 1)[0]
print("SUSAN: nvidia manual geomean: ")
print(nvidia_manual_data['geomean_p'])

for key in amd_manual_data:
    amd_manual_data[key] = amd_raw_data[key]['hip'] / amd_manual_data[key]

geo = 1
b_list = []
for bmark in amd_manual_data:
  b_list.append(amd_manual_data[bmark])
amd_manual_data['geomean_p'] = eval_geomean(b_list, len(b_list), 1)[0]
print("SUSAN: nvidia manual geomean: ")
print(amd_manual_data['geomean_p'])

for bench in cpu_bmark_list:
  cpu_raw_data[bench].update(nvidia_raw_data[bench])
  cpu_raw_data[bench].update(amd_raw_data[bench])

Plot(cpu_raw_data, bmark_list, cpu_manual_data, nvidia_manual_data, amd_manual_data)