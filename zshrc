########################
## oh-my-zsh
########################
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git brew python)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all


########################
## environment variables
########################
export PATH=\
/usr/local/bin:/usr/local/sbin:\
/usr/bin:/usr/sbin:\
/bin:/sbin:\
/usr/local/Cellar/ruby/2.0.0-p247/bin\
$PATH
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:PermSize=256M -XX:MaxPermSize=512M"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export TDSVER=8.0
export LC_ALL="en_US.UTF-8"
export DOCKER_HOST=tcp://localhost:4243


########################
## git aliases
########################
alias ga='git add'
alias gs='git status'
alias gm='git commit -m'
alias gc='git checkout'
alias gb='git branch'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"


########################
## aliases: find by filetype
########################
alias findjsp='find . -name "*.jsp*" | xargs grep '
alias findprops='find . -name "*.properties" | xargs grep '
alias findxml='find . -name "*.xml" | xargs grep '
alias findivy='find . -name "ivy.xml" | xargs grep '
alias findjava='find . -name "*.java" | xargs grep '


########################
## aliases: other
########################
alias e="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias ls='ls -1G'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport'
alias sed=gsed
alias fn='find . -name '
alias serve="python -m SimpleHTTPServer"


########################
## private stuff
########################
[ -e ~/.localrc ] && source ~/.localrc


########################
## boxen
########################
[ -e /opt/boxen/env.sh ] && source /opt/boxen/env.sh
