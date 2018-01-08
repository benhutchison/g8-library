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
   sbt publishLocal
   cd ..
done



