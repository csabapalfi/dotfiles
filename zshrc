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
export DOCKER_HOST=tcp://192.168.59.103:2375
export TSL_AZ=docker


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
alias nit=tsl-module-install
alias s='"/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"'
alias sed=gsed
alias serve="python -m SimpleHTTPServer"


function tsl-module-install {
    ni "module-tsl-$1"
}
