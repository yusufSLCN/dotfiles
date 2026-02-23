#!/usr/bin/env zsh

# note: requires to source the 00-colors.sh script first

# ---------- add git branch and virtualenv -----------
function parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function get_git_branch() {
  echo "$(parse_git_branch)"
}

function get_virtualenv() {
  if [[ -z "$VIRTUAL_ENV" ]]; then
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
      echo " <${CONDA_DEFAULT_ENV}>"
    fi
  else
    local python_virtualenv
    python_virtualenv="$(basename "$VIRTUAL_ENV")"
    echo " [${python_virtualenv}]"
  fi
}

# ---------- zsh prompt ----------
setopt PROMPT_SUBST

function precmd() {
  local retcode="$?"
  print -Pn "\e]0;%m:%~ - Terminal\a"
  RPROMPT="[%?] %F{blue}%D{%y-%m-%d %H:%M:%S}%f"
}

PROMPT='%F{red}%n@%m%F{white}: %F{green}%~%F{magenta}$(get_git_branch)%F{yellow}$(get_virtualenv)
%F{white}λ %f'

# # dead backup code
# PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD/#$HOME/~}\007"'
# export PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n"$
# c_yellow="\[\e[33m\]"
# c_blue="\[\e[96m\]"
# user_host="\[\e[32m\]\u@\h"
# wd="$c_green\w"
# colon="\[\e[31m\]:"
# # last="λ "
# exit_code="\[\e[97m\]\$? "
# export PS1="$title$exit_code$user_host$colon$wd $last"
# export PS1="$wd\n$last$c_default"
# export PS2='> '
# export PS1="$ "
