#!/bin/bash

set -e

reapplyScript="$(dirname $0)/reapplyTemplate.sh"

declare -a arr=(
  "$reapplyScript shapelessx"
  "$reapplyScript monoclex"
  "$reapplyScript effx"
)

for i in "${arr[@]}"
do
   echo "$i"
   eval $i
done



