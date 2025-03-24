#!/usr/bin/env bash

backup_repo() {
  local repo_path=$1
  echo "backing up: $repo_path"
  cd "$repo_path" || exit 1
  git add .
  git commit -m "automated backup: $(date -I)"
  git push origin main
}

repos=("$HOME/dotfiles" "$HOME/dotfiles/neovim/nvim" "$HOME/dotfiles/sysutils")

for repo in $repos
do
  backup_repo $repo
done
