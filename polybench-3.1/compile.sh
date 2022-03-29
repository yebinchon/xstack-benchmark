#!/bin/bash


for dir in */ ; do cd $dir ; make benchmark.ll ; cd ../ ; done
