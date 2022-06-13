#!/bin/bash


for dir in */ ; do cd $dir ; make clean ; cd ../ ; done
