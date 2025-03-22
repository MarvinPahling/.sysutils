#!/usr/bin/env bash

start_tmux_session() {
  local local_project_name=$1
  local local_project_path=$PWD/$local_project_name
  mkdir -p $local_project_path 
  cd $local_project_path || return 1
  bun init -y
  bun add eslint @eslint/js typescript-eslint jiti
  cp ~/.sysutils/scripts/files/eslint.config.mts .

  tmux kill-session -t "$local_project_name" 2>/dev/null || true
  tmux new-session -d -s "$local_project_name" 'nvim index.ts'
  tmux split-window -h -t "$local_project_name" -h
  tmux send-keys -t "$local_project_name" "bun run --watch index.ts" C-m
  sleep 2
  tmux select-pane -t "$local_project_name":0.0
  tmux attach-session -t "$local_project_name"
}

project_name=""
if ! [ $# -le 1 ]
then
  echo "arguments passed: $#"
  project_name=$(date '+%Y-%m-%d-%H-%M-%S')
else 
  project_name=$1
fi

if [ -d $PWD/$project_name ] 
then
  echo "project already exists"
  return 1
fi

start_tmux_session $project_name
