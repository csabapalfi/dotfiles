function git_clean () { return $(git status --porcelain | wc -l); }

function git_branch () {
  echo $(git symbolic-ref HEAD 2>/dev/null | sed 's|refs/heads/||')
}

red=$(tput setaf 1)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)
export PS1="➜  \
\[$cyan$bold\]\W\[$reset\] \
\[$red$bold\]\$(git_branch)\[$reset\] \
\[$yellow$bold\]\$(git_clean || echo '✗ ')\[$reset\]"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

shopt -s checkwinsize

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=\
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
export NVM_DIR=$HOME/.nvm

alias ..='cd ..'
alias e=atom
alias ga='git add'
alias gs='git status'
alias gm='git commit -m'
alias gmn='git commit -n -m'
alias gc='git checkout'
alias gp='git push'
alias gpr='git pull --rebase'
alias l='ls -GH1'
alias ll='ls -GHal'
alias ls=l
alias sed=gsed
alias serve="python -m SimpleHTTPServer"
