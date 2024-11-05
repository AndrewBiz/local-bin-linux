#!/bin/bash
# script for mass run the given comands one after another

for cmd in "$@"
do
  echo
  echo !!! RUNNING "./$cmd" ...
  echo
  "./$cmd"
  echo !!! Done "./$cmd", renaming to "./done_$cmd" ...
  mv "./$cmd" "./done_$cmd"
done
