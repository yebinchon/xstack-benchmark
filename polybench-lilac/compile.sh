#!/bin/bash


for dir in */ ; do cd $dir ; make $(BMARK)_cpu.c ; cd ../ ; done
