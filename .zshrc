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

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
export GOPATH=$HOME/go
export EDITOR=vim
export GIT_EDITOR=vim
eval "$(docker-machine env default)"


alias a=atom
alias d=docker
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
alias m=make
alias mt='make test'
alias ni='npm install --save'
alias nid='npm install --save-dev'
alias nit=tsl-module-install
alias sed=gsed
alias serve="python -m SimpleHTTPServer"
alias v=vim

alias packer='docker run --rm -t -v $(pwd):/data -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY lalyos/packer'

alias focus="sudo gsed -i '/#blocked/s/^#//' /etc/hosts"
alias unfocus="sudo gsed -i '/#blocked/s/^/#/' /etc/hosts"

export NVM_DIR="/Users/csabapalfi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use v4.0
