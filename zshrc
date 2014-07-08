########################
## oh-my-zsh
########################
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git brew python npm node)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all


########################
## environment variables
########################
export PATH=\
~/bin:\
/usr/local/bin:/usr/local/sbin:\
/usr/bin:/usr/sbin:\
/bin:/sbin:\
$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export DOCKER_HOST=tcp://192.168.59.106:2375
export TSL_AZ=docker


########################
## git aliases
########################
alias ga='git add'
alias gs='git status'
alias gm='git commit -m'
alias gc='git checkout'
alias gb='git branch'
alias gp='git push'
alias gpr='git pull --rebase'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

########################
## aliases: other
########################
alias e='"/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"'
alias ls='ls -1G'
alias wifi='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I'
alias sed=gsed
alias serve="python -m SimpleHTTPServer"
alias gpa=github-public-activity
alias findjs=grep-in-js

########################
## private stuff
########################
[ -e ~/.localrc ] && source ~/.localrc

########################
## functions
########################

function github-public-activity {
    LAST_PUBLIC_COMMIT=$(curl --silent  https://api.github.com/users/csabapalfi/events | grep created_at | sed -e "s/.* \"//" -e "s/T.*//"  | head -1)
    TODAY=$(date +"%Y-%m-%d")

    if [ "$LAST_PUBLIC_COMMIT" != "$TODAY" ]
    then
        echo "Oh no! Your last public commit was at $LAST_PUBLIC_COMMIT."
    else
        echo "Relax. You contributed to open-source today."
    fi
}

function grep-in-js {
    find . -name '*.js' | grep -v node_modules | xargs grep $*
}