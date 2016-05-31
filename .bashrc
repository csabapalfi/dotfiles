# prompt
function git_clean () { return $(git status --porcelain 2>/dev/null | wc -l); }
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

# general options
shopt -s checkwinsize

# history
shopt -s histappend
shopt -s cmdhist
PROMPT_COMMAND='history -a; history -c; history -r'
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
export NVM_DIR=$HOME/.nvm

# aliases
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
