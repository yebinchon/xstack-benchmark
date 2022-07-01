#!/bin/bash


#for dir in */ ; do cd $dir ; echo $dir ; diff benchmark.out benchmark.cbe.out ; cd ../ ; done
for dir in */ ; do cd $dir ; sed -i '1 i\POLLY=1' Makefile ; cd ../ ; done
