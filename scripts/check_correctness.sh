#!/bin/bash

cd $PWD
rm correctness.txt
for dir in */ ; do cd $dir ; make clean ; timeout 180 make check_correctness 
  if [ $? -eq 0 ]; then
    echo $dir is correct >> ../correctness.txt
  else
    echo $dir has failed >> ../correctness.txt
  fi; cd ../ ; done
