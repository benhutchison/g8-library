#!/bin/bash

set -e

# This script is for reapplying this g8 template to a module to pickup template changes, without losing code and doc work
# in the module. It assumes that all content is in the .git, README, libraryDependencies.txt and shared/src directory tree. These
# are copied from the original. It leaves a previous directory with Old suffix to be manually cleaned up once happy.

name=$1
libraryDependencies=`cat ${name}/libraryDependencies.txt`
nameOld=${name}Old$(date +%Y%m%d%H%M%S)

echo "Backing up existing dir to $nameOld"
mv $name $nameOld
{
  g8 git@bitbucket.org:bhutchison/g8-library.g8.git --name=$name --libraryDependencies="$libraryDependencies" &&
  cp $nameOld/README.md $name/ &&
  cp $nameOld/libraryDependencies.txt $name/ &&
  cp $nameOld/version.sbt  ${name}/version.sbt
  cp -r $nameOld/.git $name/ &&
  cp -r $nameOld/shared/src/  ${name}/shared/src/
} || {
  nameFail="${name}Fail"
  echo "Reapply Failed, moving to $nameFail , restoring $nameOld"
  rm -fr $nameFail
  mv $name $nameFail
  mv $nameOld $name
}


