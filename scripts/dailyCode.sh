#!/usr/bin/env bash


date_string=$(date -I)
todays_path=~/dailyCode/days/$date_string/
if [ -d "$todays_path" ] 
then
  echo "path: $todays_path does already exist"
  cd $todays_path 
else
  echo "path: $todays_path does not already exist"
  mkdir $todays_path
  touch $todays_path/task.md
  mkdir $todays_path/projects
  cd $todays_path 
  nvim $todays_path/task.md
fi
