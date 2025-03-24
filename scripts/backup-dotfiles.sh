#!/usr/bin/env bash

repos=("$HOME/.config/nvim" "$HOME/.sysutils" "$HOME/dotfiles")

backup_repo() {
  local repo_path=$1
  echo "backing up: $repo_path"
  cd "$repo_path" || exit 1
  git pull || return
  git add --all
  git status
  git commit -m "automated backup: $(date -I)"
  git push origin main
}


pull_repo() {
  local repo_path=$1
  echo "backing up: $repo_path"
  cd "$repo_path" || exit 1
  git pull || return
}

backup_all_repos() {
  for repo in "${repos[@]}"
  do
    backup_repo $repo
  done
}

update_all_repos() {
  for repo in "${repos[@]}"
  do
    pull_repo $repo
  done
}

