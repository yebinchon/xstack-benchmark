import os
import sys
import fileinput
import re

root_dir = os.path.join(os.getcwd(), "../polybench-cuda")

#bmark_list = ['syrk', 'syr2k', 'gemm', '2mm', '3mm', 'doitgen', 'adi', 'fdtd-2d', 'gemver', 'jacobi-1d-imper', 'jacobi-2d-imper', 'mvt', 'atax', 'bicg', 'gesummv', 'symm', 'lu', 'covariance', 'correlation', 'trmm', 'cholesky', 'nussinov', 'seidel-2d', 'heat-3d']
bmark_list = ['cholesky']
tests = ['gpu', 'gpu_noelle']
varlist = ['i', 'j', 'k', 'l']

for bmark in bmark_list:
    for test in tests:
        os.chdir(os.path.join(root_dir, bmark))
        with open(bmark+'_'+test+'.c', 'r') as source:
            filedata = source.read()
        newdata = re.sub('(.) = . \+ .\)', '++\\1)', filedata)
        print(newdata)
        with open(bmark+'_'+test+'.nvc.c', 'w') as source:
            source.write(newdata)
