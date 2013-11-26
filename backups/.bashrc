export PS1='\[\033[0;35m\]\h\[\033[0;33m\] \W\[\033[00m\]: '
export LSCOLORS="BaGxcxdxCxegedabagacad"
alias ls='ls --color'

export editor=emacs
alias emacs='emacs -nw'
alias ..='cd ..'
alias ...='cd ...'
alias fgls='jobs'

alias gitlog="log --graph --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gitrma="!sh -c \"git diff -z --name-only --diff-filter=D | xargs -0 git rm\""
alias gitunstage="git reset HEAD"

PATH=$PATH:$HOME/.rvm/bin:$HOME/UserProgs/android-studio/bin:$Home/UserProgs/genymotion
# Add RVM (Ruby Virt Machine) to PATH for scripting
# Add Android-Studio, Genymotion to path


extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
           *.tar.gz)tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
           *.tar.xz)tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
           *.bz2)bunzip2 $1 && cd $(basename "$1" /bz2) ;;
           *.rar)unrar x $1 && cd $(basename "$1" .rar) ;;
           *.gz)gunzip $1 && cd $(basename "$1" .gz) ;;
           *.tar)tar xvf $1 && cd $(basename "$1" .tar) ;;
           *.tbz2)tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
           *.tgz)tar xvzf $1 && cd $(basename "$1" .tgz) ;;
           *.zip)unzip $1 && cd $(basename "$1" .zip) ;;
           *.Z)uncompress $1 && cd $(basename "$1" .Z) ;;
           *.7z)7z x $1 && cd $(basename "$1" .7z) ;;
           *)echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

export -f extract