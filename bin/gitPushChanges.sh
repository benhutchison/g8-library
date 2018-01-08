#!/bin/bash

set -e

msg=${1:-minorchange}

declare -a arr=(
  "effx"
  "monoclex"
  "shapelessx"
)

for i in "${arr[@]}"
do
   cd $i
   git add .
   git commit -m"$msg"
   git push
   cd ..
done



