#!/bin/bash


#for dir in */ ; do cd $dir ; echo $dir ; diff benchmark.out benchmark.cbe.out ; cd ../ ; done
for dir in */ ; do cd $dir ; sed -i '/POLLY=/d' Makefile ; cd ../ ; done
