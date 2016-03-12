ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git brew python npm node)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all

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
