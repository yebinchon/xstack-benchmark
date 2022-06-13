#!/bin/bash


for dir in */ ; do cd $dir ; make clean ; make check_correctness ; cd ../ ; done
