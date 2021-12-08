#!/bin/bash

for dir in *; do
  if [ $dir != make.sh ]
  then
    cd $dir ;
    make ;
    cd ../ ;
  fi
done
