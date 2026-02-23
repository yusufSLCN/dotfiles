#!/usr/bin/env bash

# Get the directory of the current script (Works in both Bash and Zsh)
if [ -n "$ZSH_VERSION" ]; then
    SCRIPT_DIR="${0:a:h}"
else
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

if [ -n "$ZSH_VERSION" ]; then
    SHELL_DIR="zsh"
else
    SHELL_DIR="bash"
fi

source "$SCRIPT_DIR/$SHELL_DIR/00-colors.sh"
source "$SCRIPT_DIR/$SHELL_DIR/bash.sh"
source "$SCRIPT_DIR/$SHELL_DIR/conda.sh"
source "$SCRIPT_DIR/$SHELL_DIR/git.sh"
source "$SCRIPT_DIR/$SHELL_DIR/prompt.sh"
source "$SCRIPT_DIR/$SHELL_DIR/setfacl.sh"
source "$SCRIPT_DIR/$SHELL_DIR/slurm.sh"
source "$SCRIPT_DIR/$SHELL_DIR/tmux.sh"
source "$SCRIPT_DIR/$SHELL_DIR/zstd.sh"
