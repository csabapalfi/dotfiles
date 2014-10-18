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

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export DOCKER_CERT_PATH=/Users/csabapalfi/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export GOPATH=$HOME/go
export EDITOR=vim
export GIT_EDITOR=vim


alias a=atom
alias e=a
alias ga='git add'
alias gs='git status'
alias gm='git commit -m'
alias gc='git checkout'
alias gp='git push'
alias gpr='git pull --rebase'
alias l='ls -GH1'
alias ll='ls -GHal'
alias ls=l
alias m=make
alias mt='make test'
alias ni='npm install --save'
alias nid='npm install --save-dev'
alias nit=tsl-module-install
alias s='"/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"'
alias sed=gsed
alias serve="python -m SimpleHTTPServer"
alias v=vim

function tsl-module-install {
    ni "module-tsl-$1"
}

export NVM_DIR="/Users/csabapalfi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
