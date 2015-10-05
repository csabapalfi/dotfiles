ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git brew python npm node)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all


export PATH=\
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


alias a=atom
alias d=docker
alias dc=docker-compose
alias dm=docker-machine
alias e=a
alias ga='git add'
alias gs='git status'
alias gm='git commit -s -m'
alias gc='git checkout'
alias gp='git push'
alias gpr='git pull --rebase'
alias l='ls -GH1'
alias ll='ls -GHal'
alias ls=l
alias sed=gsed
alias serve="python -m SimpleHTTPServer"

source $NVM_DIR/nvm.sh
nvm use v4
eval $(dm env default)
