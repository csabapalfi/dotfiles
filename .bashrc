#!/usr/local/bin/bash

# aliases
alias ..='cd ..'
alias e=atom
alias ga='git add'
alias gs='git status'
alias gc='git checkout'
alias gp='git push'
alias gpr='git pull --rebase'
alias l='ls -GH1'
alias ll='ls -GHal'
alias ls=l
alias sed=gsed
alias serve='python -m SimpleHTTPServer'
alias date="gdate"

function cd() {
  debug() {
    if [ "$DOTENVSH_DEBUG" = true ]; then
      echo $1
    fi
  }

  loadenv() {
    debug "Loading $1"
    for i in $(cat $1); do
      # shellcheck disable=SC2163
      export $i
    done
  }

  builtin cd "$@"
  ERR=$?

  if [ $ERR -ne 0 ]; then
     return $ERR;
  fi

  if [ -e .env ]; then
    loadenv .env
  fi
}

function gm {
  git commit -m "$*"
}

function ghp {
  github-markdown-html build
  rm -rf ~/.config/yarn/global/node_modules/gh-pages/.cache
  gh-pages -d . -s index.html
  rm -rf index.html
}

# prompt
# TODO just construct PS1 in PROMPT_COMMAND
red=$(tput setaf 1)
yellow=$(tput setaf 3)
gray=$(tput setaf 7)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)

function previous_command_status () {
  return $last_status
}

function timer_start () {
  if [ -z "$timer_start" ]; then timer_start=$(date +%s%N); fi
}
trap 'timer_start' DEBUG

function grab_status () {
  last_status=$?
}

function timer_stop () {
  timer_sum_millis=$((($(date +%s%N) - $timer_start) / 1000000))
  unset timer_start
}
PROMPT_COMMAND="grab_status; history -a; history -c; history -r; timer_stop;"


function previous_command_time {
  local minutes
  local seconds
  local millis
  minutes=$(( $timer_sum_millis  / 60000 ))
  seconds=$(( $timer_sum_millis % 60000 / 1000 ))
  millis=$(( $timer_sum_millis % 1000 ))

  function format () {
    echo "$(printf "%0$1d" $2)"
  }

  echo -n "$gray$bold"
  echo -n "$(format 2 $minutes):$(format 2 $seconds).$(format 3 $millis)"
  echo -n " (${timer_sum_millis}ms)"
  echo -n "$reset"
}

function git_clean () {
  return "$(git status --porcelain 2>/dev/null | wc -l)";
}

function git_branch () {
  echo "$(git symbolic-ref HEAD 2>/dev/null | sed 's|refs/heads/||')"
}

export PS1="\n\
\[$red$bold\]\$(previous_command_status || echo '✗')\[$reset\]\
\$(previous_command_status && echo '✔') \
\[$gray$bold\]\$(previous_command_time)\[$reset\]\n\
➜ \
\[$cyan$bold\]\W\[$reset\] \
\[$red$bold\]\$(git_branch)\[$reset\] \
\[$yellow$bold\]\$(git_clean || echo '✗ ')\[$reset\]"

# general options
shopt -s checkwinsize

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

# env
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=\
./node_modules/.bin:\
~/.npm-packages/bin:\
~/go/bin:\
/usr/local/bin:\
/usr/local/sbin:\
/usr/bin:\
/usr/sbin:\
/bin:\
/sbin:\
$PATH
export GOPATH=$HOME/go
export EDITOR=vim
export GIT_EDITOR=vim

# completions
_gc() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local branches=$(git for-each-ref --format='%(refname)' | \
    sed -e 's|refs/remotes/origin/||' -e 's|refs/heads/||' | \
    tr '\n' ' ' \
  )
  COMPREPLY=( $(compgen -o default -W "$branches" -- $cur) )
}
complete -F _gc gc
