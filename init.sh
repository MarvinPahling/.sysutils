#!/usr/bin/env bash

# scripts - add functions which can be executed in the background
scripts_path="$HOME/.sysutils/scripts"
source "$scripts_path/backup-dotfiles.sh"

# workflows - can be sourced in the current session to automate workflows 
workflow_path="$HOME/.sysutils/workflows"
alias daily="source $workflow_path/daily-code/daily-code.sh"
alias fastbun="source $workflow_path/fast-bun/fast-bun.sh"
alias fast-kotlin="source $workflow_path/fast-kotlin/fast-kotlin.sh"
