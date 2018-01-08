#!/bin/bash

set -e

declare -a arr=(
  "effx"
  "monoclex"
  "shapelessx"
)

for i in "${arr[@]}"
do
   cleanup="rm -rf ${i}Old*; rm -rf ${i}Fail"
   echo "$cleanup"
   eval $cleanup
done



