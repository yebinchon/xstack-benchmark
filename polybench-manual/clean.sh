#!/bin/bash


for dir in */ ; do cd $dir ; rm *.time *.txt *.log ; cd ../ ; done
