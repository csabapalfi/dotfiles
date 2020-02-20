#!/usr/bin/env bash

##########
# aliases
alias ..='cd ..'
alias e=code
alias ga='git add'
alias gc='git checkout'
alias gm='git commit -m'
alias gp='git push'
alias gpr='git pull --rebase'
alias gs='git status'
alias ls='ls -GH1'
alias ll='ls -GHal'

##########
# prompt
red=$(tput setaf 1)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)

function previous_command_status () {
  return "$last_status"
}

function grab_status () {
  last_status=$?
}

PROMPT_COMMAND="grab_status; history -a; history -c; history -r;"

function git_clean () {
  return "$(git status --porcelain 2>/dev/null | wc -l)";
}

function git_branch () {
  git symbolic-ref HEAD 2>/dev/null | sed -e 's|refs/heads/| |'
}

export PS1="\n \
\[$red\]\$(previous_command_status || echo '✗')\[$reset\]\
\$(previous_command_status && echo '✓') \
\[$cyan$bold\]\W\[$reset\]\
\[$red$bold\]\$(git_branch)\[$reset\]\
\[$yellow\]\$(git_clean || echo ' ✗')\[$reset\] "

##########
# bash options
shopt -s checkwinsize
set -o pipefail

##########
# history
shopt -s histappend
shopt -s cmdhist
HISTSIZE=500000
HISTFILESIZE=100000
HISTCONTROL="erasedups:ignoreboth"
HISTTIMEFORMAT='%F %T '
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

##########
# env
export CLICOLOR=1
export EDITOR=vim
export GIT_EDITOR=vim
export LSCOLORS=GxFxCxDxBxegedabagaced
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH=\
/usr/local/opt/python/libexec/bin:\
/usr/local/opt/node@12/bin:\
~/go/bin:\
./node_modules/.bin:\
$NPM_PACKAGES/bin:\
/usr/local/bin:\
/usr/local/sbin:\
/usr/bin:\
/usr/sbin:\
/bin:\
/sbin:\
$PATH

# ##########
# # completions
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    # shellcheck disable=SC1090
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    __git_complete gc _git_checkout
  fi
fi
