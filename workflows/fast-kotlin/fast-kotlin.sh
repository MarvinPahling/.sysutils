#!/usr/bin/env bash

function fast-kotlin-project() {
  project_name=""
  if ! [ $# = 1 ]
  then
    echo "arguments passed: $#"
    project_name=$(date '+%Y-%m-%d-%H-%M-%S')
  else 
    project_name=$1
  fi

  mkdir -p $project_name
  cd $project_name

  gradle init \
    --type kotlin-application \
    --dsl kotlin \
    --project-name $project_name \
    --package de.fastKotlin \
    --java-version 23 \
    --test-framework junit-jupiter \
    --use-defaults
  

  clear
  tmux kill-session -t "$project_name" 2>/dev/null || true
  sleep 1
  main_path="$PWD/app/src/main/kotlin/de/fastKotlin/App.kt"
  tmux new-session -d -s "$project_name" "nvim $main_path"
  tmux split-window -h -t "$project_name" -h
  tmux send-keys -t "$project_name" \
    "find $main_path -name 'App.kt' | entr -r sh -c 'clear && ./gradlew run --quiet'" C-m

  sleep 2
  tmux select-pane -t "$project_name":0.0
  tmux attach-session -t "$project_name"

  
}

fast-kotlin-project

