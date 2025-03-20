#!/usr/bin/env bash

if ! [ $# -le 1 ]
then
  echo "provide at least 1 argument"
else 
  project_path=$PWD/$1

  if [ -d $project_path ] 
  then
    echo "project already exists"
  else 
    mkdir $project_path 
    cd $project_path
    bun init -y
    bun add eslint @eslint/js typescript-eslint jiti
    cp ~/.sysutils/scripts/files/eslint.config.mts $project_path
    nvim $project_path/index.ts
  fi
fi


